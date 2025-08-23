open Smaws_Lib
type nonrec validation_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The input is invalid or an out-of-range value was supplied for the input parameter.\n"]
type nonrec template_type =
  | ENVIRONMENT [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec repository_provider =
  | GITHUB [@ocaml.doc ""]
  | GITHUB_ENTERPRISE [@ocaml.doc ""]
  | BITBUCKET [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec template_sync_config =
  {
  subdirectory: string option
    [@ocaml.doc "A subdirectory path to your template bundle version.\n"];
  branch: string [@ocaml.doc "The repository branch.\n"];
  repository_name: string
    [@ocaml.doc "The repository name (for example, [myrepos/myrepo]).\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The repository provider.\n"];
  template_type: template_type [@ocaml.doc "The template type.\n"];
  template_name: string [@ocaml.doc "The template name.\n"]}[@@ocaml.doc
                                                              "The detail data for a template sync configuration.\n"]
type nonrec update_template_sync_config_output =
  {
  template_sync_config: template_sync_config option
    [@ocaml.doc
      "The template sync configuration detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_template_sync_config_input =
  {
  subdirectory: string option
    [@ocaml.doc
      "A subdirectory path to your template bundle version. When included, limits the template bundle search to this repository directory.\n"];
  branch: string [@ocaml.doc "The repository branch for your template.\n"];
  repository_name: string
    [@ocaml.doc "The repository name (for example, [myrepos/myrepo]).\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The repository provider.\n"];
  template_type: template_type [@ocaml.doc "The synced template type.\n"];
  template_name: string [@ocaml.doc "The synced template name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec throttling_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request was denied due to request throttling.\n"]
type nonrec resource_not_found_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The requested resource {i wasn't} found.\n"]
type nonrec internal_server_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request failed to register with the service.\n"]
type nonrec conflict_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "The request {i couldn't} be made due to a conflicting operation or resource.\n"]
type nonrec access_denied_exception = {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "There {i isn't} sufficient access for performing this action.\n"]
type nonrec template_version_status =
  | REGISTRATION_IN_PROGRESS [@ocaml.doc ""]
  | REGISTRATION_FAILED [@ocaml.doc ""]
  | DRAFT [@ocaml.doc ""]
  | PUBLISHED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec compatible_environment_template =
  {
  major_version: string
    [@ocaml.doc
      "The major version of the compatible environment template.\n"];
  template_name: string
    [@ocaml.doc "The compatible environment template name.\n"]}[@@ocaml.doc
                                                                 "Compatible environment template data.\n"]
type nonrec service_template_supported_component_source_type =
  | DIRECTLY_DEFINED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_template_version =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option
    [@ocaml.doc
      "An array of supported component sources. Components with supported sources can be attached to service instances based on this service template version.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "];
  schema: string option
    [@ocaml.doc "The schema of the version of a service template.\n"];
  compatible_environment_templates: compatible_environment_template list
    [@ocaml.doc
      "An array of compatible environment template names for the major version of a service template.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of a service template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of a service template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the version of a service template.\n"];
  description: string option
    [@ocaml.doc "A description of the version of a service template.\n"];
  status_message: string option
    [@ocaml.doc "A service template version status message.\n"];
  status: template_version_status
    [@ocaml.doc "The service template version status.\n"];
  recommended_minor_version: string option
    [@ocaml.doc "The recommended minor version of the service template.\n"];
  minor_version: string
    [@ocaml.doc "The minor version of a service template.\n"];
  major_version: string
    [@ocaml.doc
      "The latest major version that's associated with the version of a service template.\n"];
  template_name: string
    [@ocaml.doc "The name of the version of a service template.\n"]}[@@ocaml.doc
                                                                    "Detailed data of an Proton service template version resource.\n"]
type nonrec update_service_template_version_output =
  {
  service_template_version: service_template_version
    [@ocaml.doc
      "The service template version detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec compatible_environment_template_input =
  {
  major_version: string
    [@ocaml.doc
      "The major version of the compatible environment template.\n"];
  template_name: string
    [@ocaml.doc "The compatible environment template name.\n"]}[@@ocaml.doc
                                                                 "Compatible environment template data.\n"]
type nonrec update_service_template_version_input =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option
    [@ocaml.doc
      "An array of supported component sources. Components with supported sources can be attached to service instances based on this service template version.\n\n  A change to [supportedComponentSources] doesn't impact existing component attachments to instances based on this template version. A change only affects later associations.\n  \n    For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n    "];
  compatible_environment_templates:
    compatible_environment_template_input list option
    [@ocaml.doc
      "An array of environment template objects that are compatible with this service template version. A service instance based on this service template version can run in environments based on compatible templates.\n"];
  status: template_version_status option
    [@ocaml.doc
      "The status of the service template minor version to update.\n"];
  description: string option
    [@ocaml.doc "A description of a service template version to update.\n"];
  minor_version: string
    [@ocaml.doc
      "To update a minor version of a service template, include [minorVersion].\n"];
  major_version: string
    [@ocaml.doc
      "To update a major version of a service template, include [major\n      Version].\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"]}
[@@ocaml.doc ""]
type nonrec provisioning =
  | CUSTOMER_MANAGED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_template =
  {
  pipeline_provisioning: provisioning option
    [@ocaml.doc
      "If [pipelineProvisioning] is [true], a service pipeline is included in the service template. Otherwise, a service pipeline {i isn't} included in the service template.\n"];
  encryption_key: string option
    [@ocaml.doc
      "The customer provided service template encryption key that's used to encrypt data.\n"];
  recommended_version: string option
    [@ocaml.doc "The recommended version of the service template.\n"];
  description: string option
    [@ocaml.doc "A description of the service template.\n"];
  display_name: string option
    [@ocaml.doc
      "The service template name as displayed in the developer interface.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service template was created.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the service template.\n"];
  name: string [@ocaml.doc "The name of the service template.\n"]}[@@ocaml.doc
                                                                    "Detailed data of an Proton service template resource.\n"]
type nonrec update_service_template_output =
  {
  service_template: service_template
    [@ocaml.doc
      "The service template detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_service_template_input =
  {
  description: string option
    [@ocaml.doc "A description of the service template update.\n"];
  display_name: string option
    [@ocaml.doc
      "The name of the service template to update that's displayed in the developer interface.\n"];
  name: string [@ocaml.doc "The name of the service template to update.\n"]}
[@@ocaml.doc ""]
type nonrec service_sync_config =
  {
  file_path: string
    [@ocaml.doc "The file path to the service sync configuration file.\n"];
  branch: string
    [@ocaml.doc
      "The name of the code repository branch that holds the service code Proton will sync with.\n"];
  repository_name: string
    [@ocaml.doc
      "The name of the code repository that holds the service code Proton will sync with.\n"];
  repository_provider: repository_provider
    [@ocaml.doc
      "The name of the repository provider that holds the repository Proton will sync with.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that the service instance is added to.\n"]}
[@@ocaml.doc "Detailed data of the service sync configuration.\n"]
type nonrec update_service_sync_config_output =
  {
  service_sync_config: service_sync_config option
    [@ocaml.doc "The detailed data of the Proton Ops file.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec update_service_sync_config_input =
  {
  file_path: string [@ocaml.doc "The path to the Proton Ops file.\n"];
  branch: string
    [@ocaml.doc
      "The name of the code repository branch where the Proton Ops file is found.\n"];
  repository_name: string
    [@ocaml.doc
      "The name of the repository where the Proton Ops file is found.\n"];
  repository_provider: repository_provider
    [@ocaml.doc
      "The name of the repository provider where the Proton Ops file is found.\n"];
  service_name: string
    [@ocaml.doc "The name of the service the Proton Ops file is for.\n"]}
[@@ocaml.doc ""]
type nonrec blocker_type =
  | AUTOMATED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec blocker_status =
  | ACTIVE [@ocaml.doc ""]
  | RESOLVED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sync_blocker_context =
  {
  value: string [@ocaml.doc "The value of the sync blocker context.\n"];
  key: string [@ocaml.doc "The key for the sync blocker context.\n"]}
[@@ocaml.doc "Detailed data of the context of the sync blocker.\n"]
type nonrec sync_blocker =
  {
  resolved_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the sync blocker was resolved.\n"];
  resolved_reason: string option
    [@ocaml.doc "The reason the sync blocker was resolved.\n"];
  contexts: sync_blocker_context list option
    [@ocaml.doc "The contexts for the sync blocker.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the sync blocker was created.\n"];
  created_reason: string
    [@ocaml.doc "The reason why the sync blocker was created.\n"];
  status: blocker_status [@ocaml.doc "The status of the sync blocker.\n"];
  type_: blocker_type [@ocaml.doc "The type of the sync blocker.\n"];
  id: string [@ocaml.doc "The ID of the sync blocker.\n"]}[@@ocaml.doc
                                                            "Detailed data of the sync blocker.\n"]
type nonrec update_service_sync_blocker_output =
  {
  service_sync_blocker: sync_blocker
    [@ocaml.doc
      "The detailed data on the service sync blocker that was updated.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that you want to update the service sync blocker for.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that you want to update the service sync blocker for.\n"]}
[@@ocaml.doc ""]
type nonrec update_service_sync_blocker_input =
  {
  resolved_reason: string
    [@ocaml.doc "The reason the service sync blocker was resolved.\n"];
  id: string [@ocaml.doc "The ID of the service sync blocker.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec deployment_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETE_COMPLETE [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_pipeline =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this service pipeline.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this service pipeline.\n"];
  spec: string option
    [@ocaml.doc
      "The service spec that was used to create the service pipeline.\n"];
  deployment_status_message: string option
    [@ocaml.doc "A service pipeline deployment status message.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The deployment status of the service pipeline.\n"];
  template_minor_version: string
    [@ocaml.doc
      "The minor version of the service template that was used to create the service pipeline.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the service template that was used to create the service pipeline.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template that was used to create the service pipeline.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the service pipeline was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when a deployment of the service pipeline was last attempted.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service pipeline was created.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the service pipeline.\n"]}
[@@ocaml.doc
  "Detailed data of an Proton service instance pipeline resource.\n"]
type nonrec update_service_pipeline_output =
  {
  pipeline: service_pipeline
    [@ocaml.doc "The pipeline details that are returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec deployment_update_type =
  | NONE [@ocaml.doc ""]
  | CURRENT_VERSION [@ocaml.doc ""]
  | MINOR_VERSION [@ocaml.doc ""]
  | MAJOR_VERSION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_service_pipeline_input =
  {
  template_minor_version: string option
    [@ocaml.doc
      "The minor version of the service template that was used to create the service that the pipeline is associated with.\n"];
  template_major_version: string option
    [@ocaml.doc
      "The major version of the service template that was used to create the service that the pipeline is associated with.\n"];
  deployment_type: deployment_update_type
    [@ocaml.doc
      "The deployment type.\n\n There are four modes for updating a service pipeline. The [deploymentType] field defines the mode.\n \n      [NONE] \n     \n      In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated.\n      \n           [CURRENT_VERSION] \n          \n           In this mode, the service pipeline is deployed and updated with the new spec that you provide. Only requested parameters are updated. {i Don\226\128\153t} include major or minor version parameters when you use this [deployment-type].\n           \n                [MINOR_VERSION] \n               \n                In this mode, the service pipeline is deployed and updated with the published, recommended (latest) minor version of the current major version in use, by default. You can specify a different minor version of the current major version in use.\n                \n                     [MAJOR_VERSION] \n                    \n                     In this mode, the service pipeline is deployed and updated with the published, recommended (latest) major and minor version of the current template, by default. You can specify a different major version that's higher than the major version in use and a minor version.\n                     \n                       "];
  spec: string [@ocaml.doc "The spec for the service pipeline to update.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service to that the pipeline is associated with.\n"]}
[@@ocaml.doc ""]
type nonrec service_status =
  | CREATE_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_IN_PROGRESS [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_COMPLETE [@ocaml.doc ""]
  | CREATE_FAILED_CLEANUP_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETE_IN_PROGRESS [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_FAILED_CLEANUP_COMPLETE [@ocaml.doc ""]
  | UPDATE_FAILED_CLEANUP_FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATE_COMPLETE_CLEANUP_FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service =
  {
  branch_name: string option
    [@ocaml.doc
      "The name of the code repository branch that holds the code that's deployed in Proton.\n"];
  repository_id: string option
    [@ocaml.doc "The ID of the source code repository.\n"];
  repository_connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the repository connection. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol}Setting up an AWS CodeStar connection} in the {i Proton User Guide}.\n"];
  pipeline: service_pipeline option
    [@ocaml.doc "The service pipeline detail data.\n"];
  spec: string
    [@ocaml.doc "The formatted specification that defines the service.\n"];
  status_message: string option [@ocaml.doc "A service status message.\n"];
  status: service_status [@ocaml.doc "The status of the service.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service was created.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"];
  arn: string [@ocaml.doc "The Amazon Resource Name (ARN) of the service.\n"];
  description: string option [@ocaml.doc "A description of the service.\n"];
  name: string [@ocaml.doc "The name of the service.\n"]}[@@ocaml.doc
                                                           "Detailed data of an Proton service resource.\n"]
type nonrec update_service_output =
  {
  service: service
    [@ocaml.doc "The service detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec service_instance =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this service instance.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this service instance.\n"];
  last_client_request_token: string option
    [@ocaml.doc "The last client request token received.\n"];
  spec: string option
    [@ocaml.doc
      "The service spec that was used to create the service instance.\n"];
  deployment_status_message: string option
    [@ocaml.doc
      "The message associated with the service instance deployment status.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The service instance deployment status.\n"];
  template_minor_version: string
    [@ocaml.doc
      "The minor version of the service template that was used to create the service instance.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the service template that was used to create the service instance.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template that was used to create the service instance.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment that the service instance was deployed into.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that the service instance belongs to.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the service instance was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when a deployment of the service instance was last attempted.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service instance was created.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the service instance.\n"];
  name: string [@ocaml.doc "The name of the service instance.\n"]}[@@ocaml.doc
                                                                    "Detailed data of an Proton service instance resource.\n"]
type nonrec update_service_instance_output =
  {
  service_instance: service_instance
    [@ocaml.doc
      "The service instance summary data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_service_instance_input =
  {
  client_token: string option
    [@ocaml.doc "The client token of the service instance to update.\n"];
  template_minor_version: string option
    [@ocaml.doc "The minor version of the service template to update.\n"];
  template_major_version: string option
    [@ocaml.doc "The major version of the service template to update.\n"];
  spec: string option
    [@ocaml.doc
      "The formatted specification that defines the service instance update.\n"];
  deployment_type: deployment_update_type
    [@ocaml.doc
      "The deployment type. It defines the mode for updating a service instance, as follows:\n\n     [NONE] \n    \n     In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated.\n     \n          [CURRENT_VERSION] \n         \n          In this mode, the service instance is deployed and updated with the new spec that you provide. Only requested parameters are updated. {i Don\226\128\153t} include major or minor version parameters when you use this deployment type.\n          \n               [MINOR_VERSION] \n              \n               In this mode, the service instance is deployed and updated with the published, recommended (latest) minor version of the current major version in use, by default. You can also specify a different minor version of the current major version in use.\n               \n                    [MAJOR_VERSION] \n                   \n                    In this mode, the service instance is deployed and updated with the published, recommended (latest) major and minor version of the current template, by default. You can specify a different major version that's higher than the major version in use and a minor version.\n                    \n                      "];
  service_name: string
    [@ocaml.doc
      "The name of the service that the service instance belongs to.\n"];
  name: string [@ocaml.doc "The name of the service instance to update.\n"]}
[@@ocaml.doc ""]
type nonrec update_service_input =
  {
  spec: string option
    [@ocaml.doc
      "Lists the service instances to add and the existing service instances to remain. Omit the existing service instances to delete from the list. {i Don't} include edits to the existing service instances or pipeline. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-svc-update.html}Edit a service} in the {i Proton User Guide}.\n"];
  description: string option [@ocaml.doc "The edited service description.\n"];
  name: string [@ocaml.doc "The name of the service to edit.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec service_quota_exceeded_exception =
  {
  message: string [@ocaml.doc ""]}[@@ocaml.doc
                                    "A quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-limits.html}Proton Quotas} in the {i Proton User Guide}.\n"]
type nonrec environment_template_version =
  {
  schema: string option
    [@ocaml.doc "The schema of the version of an environment template.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of an environment template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of an environment template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the version of an environment template.\n"];
  description: string option
    [@ocaml.doc
      "A description of the minor version of an environment template.\n"];
  status_message: string option
    [@ocaml.doc
      "The status message of the version of an environment template.\n"];
  status: template_version_status
    [@ocaml.doc "The status of the version of an environment template.\n"];
  recommended_minor_version: string option
    [@ocaml.doc
      "The recommended minor version of the environment template.\n"];
  minor_version: string
    [@ocaml.doc "The minor version of an environment template.\n"];
  major_version: string
    [@ocaml.doc
      "The latest major version that's associated with the version of an environment template.\n"];
  template_name: string
    [@ocaml.doc "The name of the version of an environment template.\n"]}
[@@ocaml.doc "The environment template version data.\n"]
type nonrec update_environment_template_version_output =
  {
  environment_template_version: environment_template_version
    [@ocaml.doc
      "The environment template version detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_environment_template_version_input =
  {
  status: template_version_status option
    [@ocaml.doc
      "The status of the environment template minor version to update.\n"];
  description: string option
    [@ocaml.doc "A description of environment template version to update.\n"];
  minor_version: string
    [@ocaml.doc
      "To update a minor version of an environment template, include [minorVersion].\n"];
  major_version: string
    [@ocaml.doc
      "To update a major version of an environment template, include [major Version].\n"];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"]}[@@ocaml.doc ""]
type nonrec environment_template =
  {
  provisioning: provisioning option
    [@ocaml.doc
      "When included, indicates that the environment template is for customer provisioned and managed infrastructure.\n"];
  encryption_key: string option
    [@ocaml.doc
      "The customer provided encryption key for the environment template.\n"];
  recommended_version: string option
    [@ocaml.doc
      "The ID of the recommended version of the environment template.\n"];
  description: string option
    [@ocaml.doc "A description of the environment template.\n"];
  display_name: string option
    [@ocaml.doc
      "The name of the environment template as displayed in the developer interface.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the environment template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the environment template.\n"];
  name: string [@ocaml.doc "The name of the environment template.\n"]}
[@@ocaml.doc "The environment template data.\n"]
type nonrec update_environment_template_output =
  {
  environment_template: environment_template
    [@ocaml.doc
      "The environment template detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_environment_template_input =
  {
  description: string option
    [@ocaml.doc "A description of the environment template update.\n"];
  display_name: string option
    [@ocaml.doc
      "The name of the environment template to update as displayed in the developer interface.\n"];
  name: string
    [@ocaml.doc "The name of the environment template to update.\n"]}
[@@ocaml.doc ""]
type nonrec repository_branch =
  {
  branch: string [@ocaml.doc "The repository branch.\n"];
  name: string [@ocaml.doc "The repository name.\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the linked repository.\n"]}
[@@ocaml.doc "Detail data for a linked repository branch.\n"]
type nonrec environment =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this environment.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this environment.\n"];
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision infrastructure using CodeBuild-based provisioning on your behalf.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in this environment. It determines the scope of infrastructure that a component can provision.\n\n The environment must have a [componentRoleArn] to allow directly defined components to be associated with the environment.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  provisioning_repository: repository_branch option
    [@ocaml.doc
      "The linked repository that you use to host your rendered infrastructure templates for self-managed provisioning. A linked repository is a repository that has been registered with Proton. For more information, see {{:https://docs.aws.amazon.com/proton/latest/APIReference/API_CreateRepository.html}CreateRepository}.\n"];
  provisioning: provisioning option
    [@ocaml.doc
      "When included, indicates that the environment template is for customer provisioned and managed infrastructure.\n"];
  spec: string option [@ocaml.doc "The environment spec.\n"];
  environment_account_id: string option
    [@ocaml.doc
      "The ID of the environment account that the environment infrastructure resources are provisioned in.\n"];
  environment_account_connection_id: string option
    [@ocaml.doc
      "The ID of the environment account connection that's used to provision infrastructure resources in an environment account.\n"];
  proton_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other services on your behalf.\n"];
  deployment_status_message: string option
    [@ocaml.doc "An environment deployment status message.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The environment deployment status.\n"];
  template_minor_version: string
    [@ocaml.doc "The minor version of the environment template.\n"];
  template_major_version: string
    [@ocaml.doc "The major version of the environment template.\n"];
  template_name: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the environment template.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the environment.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when a deployment of the environment was last attempted.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the environment was created.\n"];
  description: string option
    [@ocaml.doc "The description of the environment.\n"];
  name: string [@ocaml.doc "The name of the environment.\n"]}[@@ocaml.doc
                                                               "Detailed data of an Proton environment resource. An Proton environment is a set of resources shared across Proton services.\n"]
type nonrec update_environment_output =
  {
  environment: environment
    [@ocaml.doc "The environment detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec repository_branch_input =
  {
  branch: string [@ocaml.doc "The repository branch.\n"];
  name: string [@ocaml.doc "The repository name.\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"]}
[@@ocaml.doc "Detail input data for a linked repository branch.\n"]
type nonrec update_environment_input =
  {
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision infrastructure using CodeBuild-based provisioning on your behalf.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in this environment. It determines the scope of infrastructure that a component can provision.\n\n The environment must have a [componentRoleArn] to allow directly defined components to be associated with the environment.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  provisioning_repository: repository_branch_input option
    [@ocaml.doc
      "The linked repository that you use to host your rendered infrastructure templates for self-managed provisioning. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].\n"];
  environment_account_connection_id: string option
    [@ocaml.doc
      "The ID of the environment account connection.\n\n You can only update to a new environment account connection if it was created in the same environment account that the current environment account connection was created in and is associated with the current environment.\n "];
  deployment_type: deployment_update_type
    [@ocaml.doc
      "There are four modes for updating an environment. The [deploymentType] field defines the mode.\n\n     [NONE] \n    \n     In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated.\n     \n          [CURRENT_VERSION] \n         \n          In this mode, the environment is deployed and updated with the new spec that you provide. Only requested parameters are updated. {i Don\226\128\153t} include major or minor version parameters when you use this [deployment-type].\n          \n               [MINOR_VERSION] \n              \n               In this mode, the environment is deployed and updated with the published, recommended (latest) minor version of the current major version in use, by default. You can also specify a different minor version of the current major version in use.\n               \n                    [MAJOR_VERSION] \n                   \n                    In this mode, the environment is deployed and updated with the published, recommended (latest) major and minor version of the current template, by default. You can also specify a different major version that is higher than the major version in use and a minor version (optional).\n                    \n                      "];
  proton_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make API calls to other services your behalf.\n"];
  template_minor_version: string option
    [@ocaml.doc "The minor version of the environment to update.\n"];
  template_major_version: string option
    [@ocaml.doc "The major version of the environment to update.\n"];
  spec: string option
    [@ocaml.doc "The formatted specification that defines the update.\n"];
  description: string option
    [@ocaml.doc "A description of the environment update.\n"];
  name: string [@ocaml.doc "The name of the environment to update.\n"]}
[@@ocaml.doc ""]
type nonrec environment_account_connection_status =
  | PENDING [@ocaml.doc ""]
  | CONNECTED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec environment_account_connection =
  {
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this role to provision infrastructure resources using CodeBuild-based provisioning in the associated environment account.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in the associated environment account. It determines the scope of infrastructure that a component can provision in the account.\n\n The environment account connection must have a [componentRoleArn] to allow directly defined components to be associated with any environments running in the account.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  status: environment_account_connection_status
    [@ocaml.doc "The status of the environment account connection.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment account connection was last modified.\n"];
  requested_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment account connection request was made.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment that's associated with the environment account connection.\n"];
  role_arn: string
    [@ocaml.doc
      "The IAM service role that's associated with the environment account connection.\n"];
  environment_account_id: string
    [@ocaml.doc
      "The environment account that's connected to the environment account connection.\n"];
  management_account_id: string
    [@ocaml.doc
      "The ID of the management account that's connected to the environment account connection.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the environment account connection.\n"];
  id: string [@ocaml.doc "The ID of the environment account connection.\n"]}
[@@ocaml.doc
  "Detailed data of an Proton environment account connection resource.\n"]
type nonrec update_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection
    [@ocaml.doc
      "The environment account connection detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec update_environment_account_connection_input =
  {
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this role to provision infrastructure resources using CodeBuild-based provisioning in the associated environment account.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in the associated environment account. It determines the scope of infrastructure that a component can provision in the account.\n\n The environment account connection must have a [componentRoleArn] to allow directly defined components to be associated with any environments running in the account.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that's associated with the environment account connection to update.\n"];
  id: string
    [@ocaml.doc "The ID of the environment account connection to update.\n"]}
[@@ocaml.doc ""]
type nonrec component =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this component.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this component.\n"];
  last_client_request_token: string option
    [@ocaml.doc "The last token the client requested.\n"];
  service_spec: string option
    [@ocaml.doc
      "The service spec that the component uses to access service inputs. Provided when a component is attached to a service instance.\n"];
  deployment_status_message: string option
    [@ocaml.doc
      "The message associated with the component deployment status.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The component deployment status.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the component was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when a deployment of the component was last attempted.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the component was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the component was created.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that this component is attached to. Provided when a component is attached to a service instance.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated with. Provided when a component is attached to a service instance.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the Proton environment that this component is associated with.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the component.\n"];
  description: string option [@ocaml.doc "A description of the component.\n"];
  name: string [@ocaml.doc "The name of the component.\n"]}[@@ocaml.doc
                                                             "Detailed data of an Proton component resource.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "]
type nonrec update_component_output =
  {
  component: component
    [@ocaml.doc "The detailed data of the updated component.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec component_deployment_update_type =
  | NONE [@ocaml.doc ""]
  | CURRENT_VERSION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_component_input =
  {
  client_token: string option
    [@ocaml.doc "The client token for the updated component.\n"];
  template_file: string option
    [@ocaml.doc
      "A path to the Infrastructure as Code (IaC) file describing infrastructure that a custom component provisions.\n\n  Components support a single IaC file, even if you use Terraform as your template language.\n  \n   "];
  service_spec: string option
    [@ocaml.doc
      "The service spec that you want the component to use to access service inputs. Set this only when the component is attached to a service instance.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that you want to attach this component to. Don't specify to keep the component's current service instance attachment. Specify an empty string to detach the component from the service instance it's attached to. Specify non-empty values for both [serviceInstanceName] and [serviceName] or for neither of them.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated with. Don't specify to keep the component's current service instance attachment. Specify an empty string to detach the component from the service instance it's attached to. Specify non-empty values for both [serviceInstanceName] and [serviceName] or for neither of them.\n"];
  description: string option
    [@ocaml.doc
      "An optional customer-provided description of the component.\n"];
  deployment_type: component_deployment_update_type
    [@ocaml.doc
      "The deployment type. It defines the mode for updating a component, as follows:\n\n     [NONE] \n    \n     In this mode, a deployment {i doesn't} occur. Only the requested metadata parameters are updated. You can only specify [description] in this mode.\n     \n          [CURRENT_VERSION] \n         \n          In this mode, the component is deployed and updated with the new [serviceSpec], [templateSource], and/or [type] that you provide. Only requested parameters are updated.\n          \n            "];
  name: string [@ocaml.doc "The name of the component to update.\n"]}
[@@ocaml.doc ""]
type nonrec account_settings =
  {
  pipeline_codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service role that Proton uses for provisioning pipelines. Proton assumes this role for CodeBuild-based provisioning.\n"];
  pipeline_provisioning_repository: repository_branch option
    [@ocaml.doc
      "The linked repository for pipeline provisioning. Required if you have environments configured for self-managed provisioning with services that include pipelines. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].\n"];
  pipeline_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines. Assumed by Proton for Amazon Web Services-managed provisioning, and by customer-owned automation for self-managed provisioning.\n"]}
[@@ocaml.doc
  "Proton settings that are used for multiple services in the Amazon Web Services account.\n"]
type nonrec update_account_settings_output =
  {
  account_settings: account_settings
    [@ocaml.doc
      "The Proton pipeline service role and repository data shared across the Amazon Web Services account.\n"]}
[@@ocaml.doc ""]
type nonrec update_account_settings_input =
  {
  pipeline_codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines. Proton assumes this role for CodeBuild-based provisioning.\n"];
  delete_pipeline_provisioning_repository: bool option
    [@ocaml.doc
      "Set to [true] to remove a configured pipeline repository from the account settings. Don't set this field if you are updating the configured pipeline repository.\n"];
  pipeline_provisioning_repository: repository_branch_input option
    [@ocaml.doc
      "A linked repository for pipeline provisioning. Specify it if you have environments configured for self-managed provisioning with services that include pipelines. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].\n\n To remove a previously configured repository, set [deletePipelineProvisioningRepository] to [true], and don't set [pipelineProvisioningRepository].\n "];
  pipeline_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service role you want to use for provisioning pipelines. Assumed by Proton for Amazon Web Services-managed provisioning, and by customer-owned automation for self-managed provisioning.\n\n To remove a previously configured ARN, specify an empty string.\n "]}
[@@ocaml.doc ""]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc
      "A list of customer tag keys that indicate the customer tags to be removed from the resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to remove customer tags from.\n"]}
[@@ocaml.doc ""]
type nonrec s3_object_source =
  {
  key: string
    [@ocaml.doc
      "The path to the S3 bucket that contains a template bundle.\n"];
  bucket: string
    [@ocaml.doc
      "The name of the S3 bucket that contains a template bundle.\n"]}
[@@ocaml.doc "Template bundle S3 bucket data.\n"]
type nonrec template_version_source_input =
  | S3 of s3_object_source
  [@ocaml.doc
    "An S3 source object that includes the template bundle S3 path and name for a template minor version.\n"]
[@@ocaml.doc "Template version source data.\n"]
type nonrec tag =
  {
  value: string [@ocaml.doc "The value of the resource tag.\n"];
  key: string [@ocaml.doc "The key of the resource tag.\n"]}[@@ocaml.doc
                                                              "A description of a resource tag.\n"]
type nonrec tag_resource_input =
  {
  tags: tag list
    [@ocaml.doc "A list of customer tags to apply to the Proton resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Proton resource to apply customer tags to.\n"]}
[@@ocaml.doc ""]
type nonrec sync_type =
  | TEMPLATE_SYNC [@ocaml.doc ""]
  | SERVICE_SYNC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sort_order =
  | ASCENDING [@ocaml.doc ""]
  | DESCENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_template_version_summary =
  {
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of a service template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of a service template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the version of a service template.\n"];
  description: string option
    [@ocaml.doc "A description of the version of a service template.\n"];
  status_message: string option
    [@ocaml.doc "A service template minor version status message.\n"];
  status: template_version_status
    [@ocaml.doc "The service template minor version status.\n"];
  recommended_minor_version: string option
    [@ocaml.doc "The recommended minor version of the service template.\n"];
  minor_version: string
    [@ocaml.doc "The minor version of a service template.\n"];
  major_version: string
    [@ocaml.doc
      "The latest major version that's associated with the version of a service template.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"]}
[@@ocaml.doc
  "Summary data of an Proton service template version resource.\n"]
type nonrec service_template_summary =
  {
  pipeline_provisioning: provisioning option
    [@ocaml.doc
      "If [pipelineProvisioning] is [true], a service pipeline is included in the service template, otherwise a service pipeline {i isn't} included in the service template.\n"];
  recommended_version: string option
    [@ocaml.doc "The recommended version of the service template.\n"];
  description: string option
    [@ocaml.doc "A description of the service template.\n"];
  display_name: string option
    [@ocaml.doc
      "The service template name as displayed in the developer interface.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service template was created.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the service template.\n"];
  name: string [@ocaml.doc "The name of the service template.\n"]}[@@ocaml.doc
                                                                    "Summary data of an Proton service template resource.\n"]
type nonrec service_sync_blocker_summary =
  {
  latest_blockers: sync_blocker list option
    [@ocaml.doc "The latest active blockers for the synced service.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that you want sync your service configuration with.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that you want to get the sync blocker summary for. If given a service instance name and a service name, it will return the blockers only applying to the instance that is blocked.\n\n If given only a service name, it will return the blockers that apply to all of the instances. In order to get the blockers for a single instance, you will need to make two distinct calls, one to get the sync blocker summary for the service and the other to get the sync blocker for the service instance.\n "]}
[@@ocaml.doc
  "If a service instance is manually updated, Proton wants to prevent accidentally overriding a manual change.\n\n A blocker is created because of the manual update or deletion of a service instance. The summary describes the blocker as being active or resolved.\n "]
type nonrec service_summary =
  {
  status_message: string option [@ocaml.doc "A service status message.\n"];
  status: service_status [@ocaml.doc "The status of the service.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service was created.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"];
  arn: string [@ocaml.doc "The Amazon Resource Name (ARN) of the service.\n"];
  description: string option [@ocaml.doc "A description of the service.\n"];
  name: string [@ocaml.doc "The name of the service.\n"]}[@@ocaml.doc
                                                           "Summary data of an Proton service resource.\n"]
type nonrec service_pipeline_state =
  {
  template_minor_version: string
    [@ocaml.doc
      "The minor version of the service template that was used to create the service pipeline.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the service template that was used to create the service pipeline.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template that was used to create the service pipeline.\n"];
  spec: string option
    [@ocaml.doc
      "The service spec that was used to create the service pipeline.\n"]}
[@@ocaml.doc
  "The detailed data about the current state of the service pipeline.\n"]
type nonrec service_instance_summary =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this service instance.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this service instance.\n"];
  deployment_status_message: string option
    [@ocaml.doc "A service instance deployment status message.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The service instance deployment status.\n"];
  template_minor_version: string
    [@ocaml.doc "The service instance template minor version.\n"];
  template_major_version: string
    [@ocaml.doc "The service instance template major version.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment that the service instance was deployed into.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that the service instance belongs to.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the service was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when a deployment of the service was last attempted.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the service instance was created.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the service instance.\n"];
  name: string [@ocaml.doc "The name of the service instance.\n"]}[@@ocaml.doc
                                                                    "Summary data of an Proton service instance resource.\n"]
type nonrec service_instance_state =
  {
  last_successful_service_pipeline_deployment_id: string option
    [@ocaml.doc
      "The ID for the last successful service pipeline deployed for this service instance.\n"];
  last_successful_environment_deployment_id: string option
    [@ocaml.doc
      "The ID for the last successful environment deployed for this service instance.\n"];
  last_successful_component_deployment_ids: string list option
    [@ocaml.doc
      "The IDs for the last successful components deployed for this service instance.\n"];
  template_minor_version: string
    [@ocaml.doc
      "The minor version of the service template that was used to create the service pipeline.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the service template that was used to create the service pipeline.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template that was used to create the service instance.\n"];
  spec: string
    [@ocaml.doc
      "The service spec that was used to create the service instance.\n"]}
[@@ocaml.doc
  "The detailed data about the current state of this service instance.\n"]
type nonrec revision =
  {
  branch: string [@ocaml.doc "The repository branch.\n"];
  directory: string
    [@ocaml.doc
      "The repository directory changed by a commit and push that activated the sync attempt.\n"];
  sha: string
    [@ocaml.doc "The secure hash algorithm (SHA) hash for the revision.\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The repository provider.\n"];
  repository_name: string [@ocaml.doc "The repository name.\n"]}[@@ocaml.doc
                                                                  "Revision detail data for a commit and push that activates a sync attempt\n"]
type nonrec resource_sync_status =
  | INITIATED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_sync_event =
  {
  event: string [@ocaml.doc "A resource sync event.\n"];
  time: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the event occurred.\n"];
  external_id: string option [@ocaml.doc "The external ID for the event.\n"];
  type_: string [@ocaml.doc "The type of event.\n"]}[@@ocaml.doc
                                                      "Detail data for a resource sync event.\n"]
type nonrec resource_sync_attempt =
  {
  events: resource_sync_event list
    [@ocaml.doc "An array of events with detail data.\n"];
  status: resource_sync_status
    [@ocaml.doc "The status of the sync attempt.\n"];
  started_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the sync attempt started.\n"];
  target: string [@ocaml.doc "The resource that is synced to.\n"];
  target_revision: revision
    [@ocaml.doc "Detail data for the target revision.\n"];
  initial_revision: revision
    [@ocaml.doc
      "Detail data for the initial repository commit, path and push.\n"]}
[@@ocaml.doc
  "Detail data for a resource sync attempt activated by a push to a repository.\n"]
type nonrec resource_deployment_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_counts_summary =
  {
  behind_minor: int option
    [@ocaml.doc
      "The number of resources of this type in the Amazon Web Services account that need a minor template version update.\n"];
  behind_major: int option
    [@ocaml.doc
      "The number of resources of this type in the Amazon Web Services account that need a major template version update.\n"];
  up_to_date: int option
    [@ocaml.doc
      "The number of resources of this type in the Amazon Web Services account that are up-to-date with their template.\n"];
  failed: int option
    [@ocaml.doc
      "The number of resources of this type in the Amazon Web Services account that failed to deploy.\n"];
  total: int
    [@ocaml.doc
      "The total number of resources of this type in the Amazon Web Services account.\n"]}
[@@ocaml.doc "Summary counts of each Proton resource types.\n"]
type nonrec repository_sync_status =
  | INITIATED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec repository_sync_event =
  {
  event: string [@ocaml.doc "Event detail for a repository sync attempt.\n"];
  time: CoreTypes.Timestamp.t
    [@ocaml.doc "The time that the sync event occurred.\n"];
  external_id: string option
    [@ocaml.doc "The external ID of the sync event.\n"];
  type_: string [@ocaml.doc "The type of event.\n"]}[@@ocaml.doc
                                                      "Repository sync event detail data for a sync attempt.\n"]
type nonrec repository_sync_definition =
  {
  directory: string [@ocaml.doc "The directory in the repository.\n"];
  branch: string [@ocaml.doc "The repository branch.\n"];
  parent: string [@ocaml.doc "The resource that is synced from.\n"];
  target: string [@ocaml.doc "The resource that is synced to.\n"]}[@@ocaml.doc
                                                                    "A repository sync definition.\n"]
type nonrec repository_sync_attempt =
  {
  events: repository_sync_event list
    [@ocaml.doc "Detail data for sync attempt events.\n"];
  status: repository_sync_status [@ocaml.doc "The sync attempt status.\n"];
  started_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the sync attempt started.\n"]}[@@ocaml.doc
                                                               "Detail data for a repository sync attempt activated by a push to a repository.\n"]
type nonrec repository_summary =
  {
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the of your connection that connects Proton to your repository.\n"];
  name: string [@ocaml.doc "The repository name.\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the linked repository.\n"]}
[@@ocaml.doc
  "Summary data of a linked repository\226\128\148a repository that has been registered with Proton.\n"]
type nonrec repository =
  {
  encryption_key: string option
    [@ocaml.doc "Your customer Amazon Web Services KMS encryption key.\n"];
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of your AWS CodeStar connection that connects Proton to your repository provider account.\n"];
  name: string [@ocaml.doc "The repository name.\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the linked repository.\n"]}
[@@ocaml.doc
  "Detailed data of a linked repository\226\128\148a repository that has been registered with Proton.\n"]
type nonrec reject_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection
    [@ocaml.doc
      "The environment connection account detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec reject_environment_account_connection_input =
  {
  id: string
    [@ocaml.doc "The ID of the environment account connection to reject.\n"]}
[@@ocaml.doc ""]
type nonrec provisioned_resource_engine =
  | CLOUDFORMATION [@ocaml.doc ""]
  | TERRAFORM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec provisioned_resource =
  {
  provisioning_engine: provisioned_resource_engine option
    [@ocaml.doc
      "The resource provisioning engine. At this time, [CLOUDFORMATION] can be used for Amazon Web Services-managed provisioning, and [TERRAFORM] can be used for self-managed provisioning.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-works-prov-methods.html#ag-works-prov-methods-self}Self-managed provisioning} in the {i Proton User Guide}.\n "];
  identifier: string option
    [@ocaml.doc "The provisioned resource identifier.\n"];
  name: string option [@ocaml.doc "The provisioned resource name.\n"]}
[@@ocaml.doc "Detail data for a provisioned resource.\n"]
type nonrec output =
  {
  value_string: string option [@ocaml.doc "The output value.\n"];
  key: string option [@ocaml.doc "The output key.\n"]}[@@ocaml.doc
                                                        "An infrastructure as code defined resource output.\n"]
type nonrec notify_resource_deployment_status_change_input =
  {
  status_message: string option
    [@ocaml.doc
      "The deployment status message for your provisioned resource.\n"];
  deployment_id: string option
    [@ocaml.doc "The deployment ID for your provisioned resource.\n"];
  outputs: output list option
    [@ocaml.doc
      "The provisioned resource state change detail data that's returned by Proton.\n"];
  status: resource_deployment_status option
    [@ocaml.doc "The status of your provisioned resource.\n"];
  resource_arn: string
    [@ocaml.doc "The provisioned resource Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next resource tag in the array of resource tags, after the current requested list of resource tags.\n"];
  tags: tag list [@ocaml.doc "A list of resource tags with detail data.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of tags to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next resource tag in the array of resource tags, after the list of resource tags that was previously requested.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource for the listed tags.\n"]}
[@@ocaml.doc ""]
type nonrec list_services_output =
  {
  services: service_summary list
    [@ocaml.doc "An array of services with summaries of detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service in the array of services, after the current requested list of services.\n"]}
[@@ocaml.doc ""]
type nonrec list_services_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of services to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service in the array of services, after the list of services that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_templates_output =
  {
  templates: service_template_summary list
    [@ocaml.doc "An array of service templates with detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service template in the array of service templates, after the current requested list of service templates.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_templates_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of service templates to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service template in the array of service templates, after the list of service templates previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_template_versions_output =
  {
  template_versions: service_template_version_summary list
    [@ocaml.doc
      "An array of major or minor versions of a service template with detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next major or minor version in the array of major or minor versions of a service template, after the current requested list of service major or minor versions.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_template_versions_input =
  {
  major_version: string option
    [@ocaml.doc
      "To view a list of minor of versions under a major version of a service template, include [major Version].\n\n To view a list of major versions of a service template, {i exclude} [major Version].\n "];
  template_name: string [@ocaml.doc "The name of the service template.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of major or minor versions of a service template to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next major or minor version in the array of major or minor versions of a service template, after the list of major or minor versions that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_pipeline_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list
    [@ocaml.doc
      "An array of provisioned resources for a service and pipeline.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the current requested list of provisioned resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_pipeline_provisioned_resources_input =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the list of provisioned resources that was previously requested.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service whose pipeline's provisioned resources you want.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_pipeline_outputs_output =
  {
  outputs: output list
    [@ocaml.doc
      "An array of service pipeline Infrastructure as Code (IaC) outputs.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the current requested list of outputs.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_pipeline_outputs_input =
  {
  deployment_id: string option
    [@ocaml.doc "The ID of the deployment you want the outputs for.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the list of outputs that was previously requested.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service whose pipeline's outputs you want.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instances_sort_by =
  | NAME [@ocaml.doc ""]
  | DEPLOYMENT_STATUS [@ocaml.doc ""]
  | TEMPLATE_NAME [@ocaml.doc ""]
  | SERVICE_NAME [@ocaml.doc ""]
  | ENVIRONMENT_NAME [@ocaml.doc ""]
  | LAST_DEPLOYMENT_ATTEMPTED_AT [@ocaml.doc ""]
  | CREATED_AT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_service_instances_output =
  {
  service_instances: service_instance_summary list
    [@ocaml.doc "An array of service instances with summary data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service instance in the array of service instances, after the current requested list of service instances.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instances_filter_by =
  | NAME [@ocaml.doc ""]
  | DEPLOYMENT_STATUS [@ocaml.doc ""]
  | TEMPLATE_NAME [@ocaml.doc ""]
  | SERVICE_NAME [@ocaml.doc ""]
  | DEPLOYED_TEMPLATE_VERSION_STATUS [@ocaml.doc ""]
  | ENVIRONMENT_NAME [@ocaml.doc ""]
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE [@ocaml.doc ""]
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER [@ocaml.doc ""]
  | CREATED_AT_BEFORE [@ocaml.doc ""]
  | CREATED_AT_AFTER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_service_instances_filter =
  {
  value: string option
    [@ocaml.doc
      "A value to filter by.\n\n With the date/time keys ([*At{Before,After}]), the value is a valid {{:https://datatracker.ietf.org/doc/html/rfc3339.html}RFC 3339} string with no UTC offset and with an optional fractional precision (for example, [1985-04-12T23:20:50.52Z]).\n "];
  key: list_service_instances_filter_by option
    [@ocaml.doc "The name of a filtering criterion.\n"]}[@@ocaml.doc
                                                          "A filtering criterion to scope down the result list of the [ListServiceInstances] action.\n"]
type nonrec list_service_instances_input =
  {
  sort_order: sort_order option
    [@ocaml.doc "Result list sort order.\n\n Default: [ASCENDING] \n "];
  sort_by: list_service_instances_sort_by option
    [@ocaml.doc
      "The field that the result list is sorted by.\n\n When you choose to sort by [serviceName], service instances within each service are sorted by service instance name.\n \n  Default: [serviceName] \n  "];
  filters: list_service_instances_filter list option
    [@ocaml.doc
      "An array of filtering criteria that scope down the result list. By default, all service instances in the Amazon Web Services account are returned.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of service instances to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next service in the array of service instances, after the list of service instances that was previously requested.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that the service instance belongs to.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instance_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list
    [@ocaml.doc
      "An array of provisioned resources for a service instance.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the current requested list of provisioned resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instance_provisioned_resources_input =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the list of provisioned resources that was previously requested.\n"];
  service_instance_name: string
    [@ocaml.doc
      "The name of the service instance whose provisioned resources you want.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated to.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instance_outputs_output =
  {
  outputs: output list
    [@ocaml.doc
      "An array of service instance Infrastructure as Code (IaC) outputs.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the current requested list of outputs.\n"]}
[@@ocaml.doc ""]
type nonrec list_service_instance_outputs_input =
  {
  deployment_id: string option
    [@ocaml.doc "The ID of the deployment whose outputs you want.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the list of outputs that was previously requested.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated to.\n"];
  service_instance_name: string
    [@ocaml.doc "The name of the service instance whose outputs you want.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_output =
  {
  sync_definitions: repository_sync_definition list
    [@ocaml.doc "An array of repository sync definitions.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next repository sync definition in the array of repository sync definitions, after the current requested list of repository sync definitions.\n"]}
[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_input =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next repository sync definition in the array of repository sync definitions, after the list of repository sync definitions previously requested.\n"];
  sync_type: sync_type
    [@ocaml.doc
      "The sync type. The only supported value is [TEMPLATE_SYNC].\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The repository provider.\n"];
  repository_name: string [@ocaml.doc "The repository name.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec list_repositories_output =
  {
  repositories: repository_summary list
    [@ocaml.doc "An array of repository links.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next repository in the array of repositories, after the current requested list of repositories. \n"]}
[@@ocaml.doc ""]
type nonrec list_repositories_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of repositories to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next repository in the array of repositories, after the list of repositories previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec environment_summary =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this environment.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this environment.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in this environment. It determines the scope of infrastructure that a component can provision.\n\n The environment must have a [componentRoleArn] to allow directly defined components to be associated with the environment.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  provisioning: provisioning option
    [@ocaml.doc
      "When included, indicates that the environment template is for customer provisioned and managed infrastructure.\n"];
  environment_account_id: string option
    [@ocaml.doc
      "The ID of the environment account that the environment infrastructure resources are provisioned in.\n"];
  environment_account_connection_id: string option
    [@ocaml.doc
      "The ID of the environment account connection that the environment is associated with.\n"];
  proton_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other services on your behalf.\n"];
  deployment_status_message: string option
    [@ocaml.doc "An environment deployment status message.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The environment deployment status.\n"];
  template_minor_version: string
    [@ocaml.doc "The minor version of the environment template.\n"];
  template_major_version: string
    [@ocaml.doc "The major version of the environment template.\n"];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the environment.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when a deployment of the environment was last attempted.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the environment was created.\n"];
  description: string option
    [@ocaml.doc "The description of the environment.\n"];
  name: string [@ocaml.doc "The name of the environment.\n"]}[@@ocaml.doc
                                                               "Summary data of an Proton environment resource. An Proton environment is a set of resources shared across Proton services.\n"]
type nonrec list_environments_output =
  {
  environments: environment_summary list
    [@ocaml.doc "An array of environment detail data summaries.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment in the array of environments, after the current requested list of environments.\n"]}
[@@ocaml.doc ""]
type nonrec environment_template_filter =
  {
  major_version: string
    [@ocaml.doc
      "Include [majorVersion] to filter search for a major version.\n"];
  template_name: string
    [@ocaml.doc
      "Include [templateName] to filter search for a template name.\n"]}
[@@ocaml.doc "A search filter for environment templates.\n"]
type nonrec list_environments_input =
  {
  environment_templates: environment_template_filter list option
    [@ocaml.doc "An array of the versions of the environment template.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of environments to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment in the array of environments, after the list of environments that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec environment_template_summary =
  {
  provisioning: provisioning option
    [@ocaml.doc
      "When included, indicates that the environment template is for customer provisioned and managed infrastructure.\n"];
  recommended_version: string option
    [@ocaml.doc "The recommended version of the environment template.\n"];
  description: string option
    [@ocaml.doc "A description of the environment template.\n"];
  display_name: string option
    [@ocaml.doc
      "The name of the environment template as displayed in the developer interface.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the environment template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the environment template.\n"];
  name: string [@ocaml.doc "The name of the environment template.\n"]}
[@@ocaml.doc "The environment template data.\n"]
type nonrec list_environment_templates_output =
  {
  templates: environment_template_summary list
    [@ocaml.doc "An array of environment templates with detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment template in the array of environment templates, after the current requested list of environment templates.\n"]}
[@@ocaml.doc ""]
type nonrec list_environment_templates_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of environment templates to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment template in the array of environment templates, after the list of environment templates that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec environment_template_version_summary =
  {
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of an environment template was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the version of an environment template was created.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the version of an environment template.\n"];
  description: string option
    [@ocaml.doc "A description of the version of an environment template.\n"];
  status_message: string option
    [@ocaml.doc
      "The status message of the version of an environment template.\n"];
  status: template_version_status
    [@ocaml.doc "The status of the version of an environment template.\n"];
  recommended_minor_version: string option
    [@ocaml.doc
      "The recommended minor version of the environment template.\n"];
  minor_version: string
    [@ocaml.doc "The version of an environment template.\n"];
  major_version: string
    [@ocaml.doc
      "The latest major version that's associated with the version of an environment template.\n"];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"]}[@@ocaml.doc
                                                             "A summary of the version of an environment template detail data.\n"]
type nonrec list_environment_template_versions_output =
  {
  template_versions: environment_template_version_summary list
    [@ocaml.doc
      "An array of major or minor versions of an environment template detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next major or minor version in the array of major or minor versions of an environment template, after the list of major or minor versions that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_environment_template_versions_input =
  {
  major_version: string option
    [@ocaml.doc
      "To view a list of minor of versions under a major version of an environment template, include [major Version].\n\n To view a list of major versions of an environment template, {i exclude} [major Version].\n "];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of major or minor versions of an environment template to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next major or minor version in the array of major or minor versions of an environment template, after the list of major or minor versions that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_environment_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list
    [@ocaml.doc "An array of environment provisioned resources.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment provisioned resource in the array of provisioned resources, after the current requested list of environment provisioned resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_environment_provisioned_resources_input =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment provisioned resource in the array of environment provisioned resources, after the list of environment provisioned resources that was previously requested.\n"];
  environment_name: string [@ocaml.doc "The environment name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_environment_outputs_output =
  {
  outputs: output list
    [@ocaml.doc "An array of environment outputs with detail data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment output in the array of environment outputs, after the current requested list of environment outputs.\n"]}
[@@ocaml.doc ""]
type nonrec list_environment_outputs_input =
  {
  deployment_id: string option
    [@ocaml.doc "The ID of the deployment whose outputs you want.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment output in the array of environment outputs, after the list of environment outputs that was previously requested.\n"];
  environment_name: string [@ocaml.doc "The environment name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec environment_account_connection_summary =
  {
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in the associated environment account. It determines the scope of infrastructure that a component can provision in the account.\n\n The environment account connection must have a [componentRoleArn] to allow directly defined components to be associated with any environments running in the account.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  status: environment_account_connection_status
    [@ocaml.doc "The status of the environment account connection.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment account connection was last modified.\n"];
  requested_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the environment account connection request was made.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment that's associated with the environment account connection.\n"];
  role_arn: string
    [@ocaml.doc
      "The IAM service role that's associated with the environment account connection.\n"];
  environment_account_id: string
    [@ocaml.doc
      "The ID of the environment account that's connected to the environment account connection.\n"];
  management_account_id: string
    [@ocaml.doc
      "The ID of the management account that's connected to the environment account connection.\n"];
  arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the environment account connection.\n"];
  id: string [@ocaml.doc "The ID of the environment account connection.\n"]}
[@@ocaml.doc
  "Summary data of an Proton environment account connection resource.\n"]
type nonrec list_environment_account_connections_output =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment account connection in the array of environment account connections, after the current requested list of environment account connections.\n"];
  environment_account_connections:
    environment_account_connection_summary list
    [@ocaml.doc
      "An array of environment account connections with details that's returned by Proton. \n"]}
[@@ocaml.doc ""]
type nonrec environment_account_connection_requester_account_type =
  | MANAGEMENT_ACCOUNT [@ocaml.doc ""]
  | ENVIRONMENT_ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_environment_account_connections_input =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of environment account connections to list.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next environment account connection in the array of environment account connections, after the list of environment account connections that was previously requested.\n"];
  statuses: environment_account_connection_status list option
    [@ocaml.doc
      "The status details for each listed environment account connection.\n"];
  environment_name: string option
    [@ocaml.doc
      "The environment name that's associated with each listed environment account connection.\n"];
  requested_by: environment_account_connection_requester_account_type
    [@ocaml.doc
      "The type of account making the [ListEnvironmentAccountConnections] request.\n"]}
[@@ocaml.doc ""]
type nonrec deployment_target_resource_type =
  | ENVIRONMENT [@ocaml.doc ""]
  | SERVICE_PIPELINE [@ocaml.doc ""]
  | SERVICE_INSTANCE [@ocaml.doc ""]
  | COMPONENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec deployment_summary =
  {
  deployment_status: deployment_status
    [@ocaml.doc "The current status of the deployment.\n"];
  last_succeeded_deployment_id: string option
    [@ocaml.doc "The ID of the last successful deployment.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc "The ID of the last attempted deployment.\n"];
  component_name: string option
    [@ocaml.doc
      "The name of the component associated with the deployment.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance associated with the deployment.\n"];
  service_name: string option
    [@ocaml.doc "The name of the service associated with the deployment.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment associated with the deployment.\n"];
  completed_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time the deployment was completed.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the deployment was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the deployment was created.\n"];
  target_resource_type: deployment_target_resource_type
    [@ocaml.doc
      "The resource type of the deployment target. It can be an environment, service, service instance, or component.\n"];
  target_resource_created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the target resource was created.\n"];
  target_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the target of the deployment.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the deployment.\n"];
  id: string [@ocaml.doc "The ID of the deployment.\n"]}[@@ocaml.doc
                                                          "Summary data of the deployment.\n"]
type nonrec list_deployments_output =
  {
  deployments: deployment_summary list
    [@ocaml.doc "An array of deployment with summary data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next deployment in the array of deployment, after the current requested list of deployment.\n"]}
[@@ocaml.doc ""]
type nonrec list_deployments_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of deployments to list.\n"];
  component_name: string option
    [@ocaml.doc
      "The name of a component for result list filtering. Proton returns deployments associated with that component.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of a service instance for result list filtering. Proton returns the deployments associated with the service instance.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of a service for result list filtering. Proton returns deployments associated with service instances of the service.\n"];
  environment_name: string option
    [@ocaml.doc
      "The name of an environment for result list filtering. Proton returns deployments associated with the environment.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next deployment in the array of deployment, after the list of deployment that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec component_summary =
  {
  last_succeeded_deployment_id: string option
    [@ocaml.doc
      "The ID of the last successful deployment of this component.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc
      "The ID of the last attempted deployment of this component.\n"];
  deployment_status_message: string option
    [@ocaml.doc
      "The message associated with the component deployment status.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The component deployment status.\n"];
  last_deployment_succeeded_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the component was last deployed successfully.\n"];
  last_deployment_attempted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when a deployment of the component was last attempted.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the component was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The time when the component was created.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that this component is attached to. Provided when a component is attached to a service instance.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated with. Provided when a component is attached to a service instance.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the Proton environment that this component is associated with.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the component.\n"];
  name: string [@ocaml.doc "The name of the component.\n"]}[@@ocaml.doc
                                                             "Summary data of an Proton component resource.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "]
type nonrec list_components_output =
  {
  components: component_summary list
    [@ocaml.doc "An array of components with summary data.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next component in the array of components, after the current requested list of components.\n"]}
[@@ocaml.doc ""]
type nonrec list_components_input =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of components to list.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of a service instance for result list filtering. Proton returns the component attached to the service instance, if any.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of a service for result list filtering. Proton returns components attached to service instances of the service.\n"];
  environment_name: string option
    [@ocaml.doc
      "The name of an environment for result list filtering. Proton returns components associated with the environment or attached to service instances running in it.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next component in the array of components, after the list of components that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_component_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list
    [@ocaml.doc "An array of provisioned resources for a component.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the current requested list of provisioned resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_component_provisioned_resources_input =
  {
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next provisioned resource in the array of provisioned resources, after the list of provisioned resources that was previously requested.\n"];
  component_name: string
    [@ocaml.doc
      "The name of the component whose provisioned resources you want.\n"]}
[@@ocaml.doc ""]
type nonrec list_component_outputs_output =
  {
  outputs: output list
    [@ocaml.doc
      "An array of component Infrastructure as Code (IaC) outputs.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the list of outputs that was previously requested.\n"]}
[@@ocaml.doc ""]
type nonrec list_component_outputs_input =
  {
  deployment_id: string option
    [@ocaml.doc "The ID of the deployment whose outputs you want.\n"];
  next_token: string option
    [@ocaml.doc
      "A token that indicates the location of the next output in the array of outputs, after the list of outputs that was previously requested.\n"];
  component_name: string
    [@ocaml.doc "The name of the component whose outputs you want.\n"]}
[@@ocaml.doc ""]
type nonrec get_template_sync_status_output =
  {
  desired_state: revision option
    [@ocaml.doc
      "The template sync desired state that's returned by Proton.\n"];
  latest_successful_sync: resource_sync_attempt option
    [@ocaml.doc
      "The details of the last successful sync that's returned by Proton.\n"];
  latest_sync: resource_sync_attempt option
    [@ocaml.doc "The details of the last sync that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec get_template_sync_status_input =
  {
  template_version: string [@ocaml.doc "The template major version.\n"];
  template_type: template_type [@ocaml.doc "The template type.\n"];
  template_name: string [@ocaml.doc "The template name.\n"]}[@@ocaml.doc ""]
type nonrec get_template_sync_config_output =
  {
  template_sync_config: template_sync_config option
    [@ocaml.doc
      "The template sync configuration detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec get_template_sync_config_input =
  {
  template_type: template_type [@ocaml.doc "The template type.\n"];
  template_name: string [@ocaml.doc "The template name.\n"]}[@@ocaml.doc ""]
type nonrec get_service_template_version_output =
  {
  service_template_version: service_template_version
    [@ocaml.doc
      "The detailed data of the requested service template version.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_template_version_input =
  {
  minor_version: string
    [@ocaml.doc
      "To get service template minor version detail data, include [minorVersion].\n"];
  major_version: string
    [@ocaml.doc
      "To get service template major version detail data, include [major\n      Version].\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template a version of which you want to get detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_template_output =
  {
  service_template: service_template
    [@ocaml.doc "The detailed data of the requested service template.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_template_input =
  {
  name: string
    [@ocaml.doc
      "The name of the service template that you want to get detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_sync_config_output =
  {
  service_sync_config: service_sync_config option
    [@ocaml.doc
      "The detailed data of the requested service sync configuration.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_sync_config_input =
  {
  service_name: string
    [@ocaml.doc
      "The name of the service that you want to get the service sync configuration for.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_sync_blocker_summary_output =
  {
  service_sync_blocker_summary: service_sync_blocker_summary option
    [@ocaml.doc
      "The detailed data of the requested service sync blocker summary.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_sync_blocker_summary_input =
  {
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that you want to get the service sync blocker summary for. If given bothe the instance name and the service name, only the instance is blocked.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that you want to get the service sync blocker summary for. If given only the service name, all instances are blocked.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_output =
  {
  service: service option
    [@ocaml.doc "The detailed data of the requested service.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec get_service_instance_sync_status_output =
  {
  desired_state: revision option
    [@ocaml.doc
      "The service instance sync desired state that's returned by Proton\n"];
  latest_successful_sync: resource_sync_attempt option
    [@ocaml.doc
      "The detailed data of the latest successful sync with the service instance.\n"];
  latest_sync: resource_sync_attempt option
    [@ocaml.doc
      "The detailed data of the latest sync with the service instance.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_instance_sync_status_input =
  {
  service_instance_name: string
    [@ocaml.doc
      "The name of the service instance that you want the sync status input for.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service that the service instance belongs to.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_instance_output =
  {
  service_instance: service_instance
    [@ocaml.doc "The detailed data of the requested service instance.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_instance_input =
  {
  service_name: string
    [@ocaml.doc
      "The name of the service that you want the service instance input for.\n"];
  name: string
    [@ocaml.doc
      "The name of a service instance that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_service_input =
  {
  name: string
    [@ocaml.doc
      "The name of the service that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec counts_summary =
  {
  pipelines: resource_counts_summary option
    [@ocaml.doc
      "The staleness counts for Proton pipelines in the Amazon Web Services account.\n"];
  service_templates: resource_counts_summary option
    [@ocaml.doc
      "The total number of service templates in the Amazon Web Services account. The [serviceTemplates] object will only contain [total] members.\n"];
  services: resource_counts_summary option
    [@ocaml.doc
      "The staleness counts for Proton services in the Amazon Web Services account.\n"];
  service_instances: resource_counts_summary option
    [@ocaml.doc
      "The staleness counts for Proton service instances in the Amazon Web Services account.\n"];
  environment_templates: resource_counts_summary option
    [@ocaml.doc
      "The total number of environment templates in the Amazon Web Services account. The [environmentTemplates] object will only contain [total] members.\n"];
  environments: resource_counts_summary option
    [@ocaml.doc
      "The staleness counts for Proton environments in the Amazon Web Services account. The [environments] object will only contain [total] members.\n"];
  components: resource_counts_summary option
    [@ocaml.doc
      "The total number of components in the Amazon Web Services account.\n\n The semantics of the [components] field are different from the semantics of results for other infrastructure-provisioning resources. That's because at this time components don't have associated templates, therefore they don't have the concept of staleness. The [components] object will only contain [total] and [failed] members.\n "]}
[@@ocaml.doc "Summary counts of each Proton resource type.\n"]
type nonrec get_resources_summary_output =
  {
  counts: counts_summary
    [@ocaml.doc "Summary counts of each Proton resource type.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_repository_sync_status_output =
  {
  latest_sync: repository_sync_attempt option
    [@ocaml.doc
      "The repository sync status detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_sync_status_input =
  {
  sync_type: sync_type [@ocaml.doc "The repository sync type.\n"];
  branch: string [@ocaml.doc "The repository branch.\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The repository provider.\n"];
  repository_name: string [@ocaml.doc "The repository name.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_repository_output =
  {
  repository: repository
    [@ocaml.doc
      "The repository link's detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec get_repository_input =
  {
  name: string
    [@ocaml.doc "The repository name, for example [myrepos/myrepo].\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_template_version_output =
  {
  environment_template_version: environment_template_version
    [@ocaml.doc
      "The detailed data of the requested environment template version.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_template_version_input =
  {
  minor_version: string
    [@ocaml.doc
      "To get environment template minor version detail data, include [minorVersion].\n"];
  major_version: string
    [@ocaml.doc
      "To get environment template major version detail data, include [major Version].\n"];
  template_name: string
    [@ocaml.doc
      "The name of the environment template a version of which you want to get detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_template_output =
  {
  environment_template: environment_template
    [@ocaml.doc "The detailed data of the requested environment template.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_template_input =
  {
  name: string
    [@ocaml.doc
      "The name of the environment template that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_output =
  {
  environment: environment
    [@ocaml.doc "The detailed data of the requested environment.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_input =
  {
  name: string
    [@ocaml.doc
      "The name of the environment that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection
    [@ocaml.doc
      "The detailed data of the requested environment account connection.\n"]}
[@@ocaml.doc ""]
type nonrec get_environment_account_connection_input =
  {
  id: string
    [@ocaml.doc
      "The ID of the environment account connection that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec environment_state =
  {
  template_minor_version: string
    [@ocaml.doc
      "The minor version of the environment template that was used to create the environment.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the environment template that was used to create the environment.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the environment template that was used to create the environment.\n"];
  spec: string option
    [@ocaml.doc
      "The environment spec that was used to create the environment.\n"]}
[@@ocaml.doc
  "The detailed data about the current state of the environment.\n"]
type nonrec component_state =
  {
  template_file: string option [@ocaml.doc "The template file used.\n"];
  service_spec: string option
    [@ocaml.doc
      "The service spec that the component uses to access service inputs. Provided when a component is attached to a service instance.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that this component is attached to. Provided when a component is attached to a service instance.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated with. Provided when a component is attached to a service instance.\n"]}
[@@ocaml.doc "The detailed data about the current state of the component.\n"]
type nonrec deployment_state =
  | Component of component_state
  [@ocaml.doc "The state of the component associated with the deployment.\n"]
  | ServicePipeline of service_pipeline_state
  [@ocaml.doc
    "The state of the service pipeline associated with the deployment.\n"]
  | Environment of environment_state
  [@ocaml.doc
    "The state of the environment associated with the deployment.\n"]
  | ServiceInstance of service_instance_state
  [@ocaml.doc
    "The state of the service instance associated with the deployment.\n"]
[@@ocaml.doc
  "The detailed data about the current state of the deployment.\n"]
type nonrec deployment =
  {
  target_state: deployment_state option
    [@ocaml.doc
      "The target state of the target resource at the time of the deployment.\n"];
  initial_state: deployment_state option
    [@ocaml.doc
      "The initial state of the target resource at the time of the deployment.\n"];
  last_succeeded_deployment_id: string option
    [@ocaml.doc "The ID of the last successful deployment.\n"];
  last_attempted_deployment_id: string option
    [@ocaml.doc "The ID of the last attempted deployment.\n"];
  completed_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time the deployment was completed.\n"];
  last_modified_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the deployment was last modified.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the deployment was created.\n"];
  deployment_status_message: string option
    [@ocaml.doc "The deployment status message.\n"];
  deployment_status: deployment_status
    [@ocaml.doc "The status of the deployment.\n"];
  component_name: string option
    [@ocaml.doc
      "The name of the component associated with this deployment.\n"];
  service_instance_name: string option
    [@ocaml.doc "The name of the deployment's service instance.\n"];
  service_name: string option
    [@ocaml.doc "The name of the service in this deployment.\n"];
  environment_name: string
    [@ocaml.doc
      "The name of the environment associated with this deployment.\n"];
  target_resource_type: deployment_target_resource_type
    [@ocaml.doc
      "The resource type of the deployment target. It can be an environment, service, service instance, or component.\n"];
  target_resource_created_at: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the depoyment target was created.\n"];
  target_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the target of the deployment.\n"];
  arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the deployment.\n"];
  id: string [@ocaml.doc "The ID of the deployment.\n"]}[@@ocaml.doc
                                                          "The detailed information about a deployment.\n"]
type nonrec get_deployment_output =
  {
  deployment: deployment option
    [@ocaml.doc "The detailed data of the requested deployment.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_deployment_input =
  {
  component_name: string option
    [@ocaml.doc
      "The name of a component that you want to get the detailed data for.\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance associated with the given deployment ID. [serviceName] must be specified to identify the service instance.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service associated with the given deployment ID.\n"];
  environment_name: string option
    [@ocaml.doc
      "The name of a environment that you want to get the detailed data for.\n"];
  id: string
    [@ocaml.doc
      "The ID of the deployment that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_component_output =
  {
  component: component option
    [@ocaml.doc "The detailed data of the requested component.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_component_input =
  {
  name: string
    [@ocaml.doc
      "The name of the component that you want to get the detailed data for.\n"]}
[@@ocaml.doc ""]
type nonrec get_account_settings_output =
  {
  account_settings: account_settings option
    [@ocaml.doc
      "The Proton pipeline service role detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec delete_template_sync_config_output =
  {
  template_sync_config: template_sync_config option
    [@ocaml.doc
      "The template sync configuration detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec delete_template_sync_config_input =
  {
  template_type: template_type [@ocaml.doc "The template type.\n"];
  template_name: string [@ocaml.doc "The template name.\n"]}[@@ocaml.doc ""]
type nonrec delete_service_template_version_output =
  {
  service_template_version: service_template_version option
    [@ocaml.doc
      "The detailed data of the service template version being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_template_version_input =
  {
  minor_version: string
    [@ocaml.doc "The service template minor version to delete.\n"];
  major_version: string
    [@ocaml.doc "The service template major version to delete.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_template_output =
  {
  service_template: service_template option
    [@ocaml.doc "The detailed data of the service template being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_template_input =
  {
  name: string [@ocaml.doc "The name of the service template to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_sync_config_output =
  {
  service_sync_config: service_sync_config option
    [@ocaml.doc "The detailed data for the service sync config.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_service_sync_config_input =
  {
  service_name: string
    [@ocaml.doc
      "The name of the service that you want to delete the service sync configuration for.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_output =
  {
  service: service option
    [@ocaml.doc "The detailed data of the service being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_input =
  {
  name: string [@ocaml.doc "The name of the service to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_repository_output =
  {
  repository: repository option
    [@ocaml.doc
      "The deleted repository link's detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec delete_repository_input =
  {
  name: string [@ocaml.doc "The repository name.\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_template_version_output =
  {
  environment_template_version: environment_template_version option
    [@ocaml.doc
      "The detailed data of the environment template version being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_template_version_input =
  {
  minor_version: string
    [@ocaml.doc "The environment template minor version to delete.\n"];
  major_version: string
    [@ocaml.doc "The environment template major version to delete.\n"];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"]}[@@ocaml.doc ""]
type nonrec delete_environment_template_output =
  {
  environment_template: environment_template option
    [@ocaml.doc
      "The detailed data of the environment template being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_template_input =
  {
  name: string
    [@ocaml.doc "The name of the environment template to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_output =
  {
  environment: environment option
    [@ocaml.doc "The detailed data of the environment being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_input =
  {
  name: string [@ocaml.doc "The name of the environment to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection option
    [@ocaml.doc
      "The detailed data of the environment account connection being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_environment_account_connection_input =
  {
  id: string
    [@ocaml.doc "The ID of the environment account connection to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_deployment_output =
  {
  deployment: deployment option
    [@ocaml.doc "The detailed data of the deployment being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_deployment_input =
  {
  id: string [@ocaml.doc "The ID of the deployment to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_component_output =
  {
  component: component option
    [@ocaml.doc "The detailed data of the component being deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_component_input =
  {
  name: string [@ocaml.doc "The name of the component to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_template_sync_config_output =
  {
  template_sync_config: template_sync_config option
    [@ocaml.doc
      "The template sync configuration detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_template_sync_config_input =
  {
  subdirectory: string option
    [@ocaml.doc
      "A repository subdirectory path to your template bundle directory. When included, Proton limits the template bundle search to this repository directory.\n"];
  branch: string [@ocaml.doc "The repository branch for your template.\n"];
  repository_name: string
    [@ocaml.doc "The repository name (for example, [myrepos/myrepo]).\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The provider type for your repository.\n"];
  template_type: template_type
    [@ocaml.doc "The type of the registered template.\n"];
  template_name: string
    [@ocaml.doc "The name of your registered template.\n"]}[@@ocaml.doc ""]
type nonrec create_service_template_version_output =
  {
  service_template_version: service_template_version
    [@ocaml.doc
      "The service template version summary of detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_template_version_input =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option
    [@ocaml.doc
      "An array of supported component sources. Components with supported sources can be attached to service instances based on this service template version.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton service template version. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  compatible_environment_templates:
    compatible_environment_template_input list
    [@ocaml.doc
      "An array of environment template objects that are compatible with the new service template version. A service instance based on this service template version can run in environments based on compatible templates.\n"];
  source: template_version_source_input
    [@ocaml.doc
      "An object that includes the template bundle S3 bucket path and name for the new version of a service template.\n"];
  major_version: string option
    [@ocaml.doc
      "To create a new minor version of the service template, include a [major\n        Version].\n\n To create a new major and minor version of the service template, {i exclude} [major Version].\n "];
  description: string option
    [@ocaml.doc "A description of the new version of a service template.\n"];
  template_name: string [@ocaml.doc "The name of the service template.\n"];
  client_token: string option
    [@ocaml.doc
      "When included, if two identical requests are made with the same client token, Proton returns the service template version that the first request created.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_template_output =
  {
  service_template: service_template
    [@ocaml.doc
      "The service template detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_template_input =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton service template. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  pipeline_provisioning: provisioning option
    [@ocaml.doc
      "By default, Proton provides a service pipeline for your service. When this parameter is included, it indicates that an Proton service pipeline {i isn't} provided for your service. After it's included, it {i can't} be changed. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-template-authoring.html#ag-template-bundles}Template bundles} in the {i Proton User Guide}.\n"];
  encryption_key: string option
    [@ocaml.doc
      "A customer provided encryption key that's used to encrypt data.\n"];
  description: string option
    [@ocaml.doc "A description of the service template.\n"];
  display_name: string option
    [@ocaml.doc
      "The name of the service template as displayed in the developer interface.\n"];
  name: string [@ocaml.doc "The name of the service template.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_service_sync_config_output =
  {
  service_sync_config: service_sync_config option
    [@ocaml.doc "The detailed data of the Proton Ops file.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec create_service_sync_config_input =
  {
  file_path: string [@ocaml.doc "The path to the Proton Ops file.\n"];
  branch: string
    [@ocaml.doc "The repository branch for your Proton Ops file.\n"];
  repository_name: string [@ocaml.doc "The repository name.\n"];
  repository_provider: repository_provider
    [@ocaml.doc "The provider type for your repository.\n"];
  service_name: string
    [@ocaml.doc "The name of the service the Proton Ops file is for.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_output =
  {
  service: service
    [@ocaml.doc "The service detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_instance_output =
  {
  service_instance: service_instance
    [@ocaml.doc "The detailed data of the service instance being created.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_instance_input =
  {
  client_token: string option
    [@ocaml.doc "The client token of the service instance to create.\n"];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton service instance. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  template_minor_version: string option
    [@ocaml.doc
      "To create a new minor version of the service template, include a [major\n        Version].\n"];
  template_major_version: string option
    [@ocaml.doc
      "To create a new major and minor version of the service template, {i exclude} [major Version].\n"];
  spec: string
    [@ocaml.doc "The spec for the service instance you want to create.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the service the service instance is added to.\n"];
  name: string [@ocaml.doc "The name of the service instance to create.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_input =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton service. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  branch_name: string option
    [@ocaml.doc
      "The name of the code repository branch that holds the code that's deployed in Proton. {i Don't} include this parameter if your service template {i doesn't} include a service pipeline.\n"];
  repository_id: string option
    [@ocaml.doc
      "The ID of the code repository. {i Don't} include this parameter if your service template {i doesn't} include a service pipeline.\n"];
  repository_connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the repository connection. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html#setting-up-vcontrol}Setting up an AWS CodeStar connection} in the {i Proton User Guide}. {i Don't} include this parameter if your service template {i doesn't} include a service pipeline.\n"];
  spec: string
    [@ocaml.doc
      "A link to a spec file that provides inputs as defined in the service template bundle schema file. The spec file is in YAML format. {i Don\226\128\153t} include pipeline inputs in the spec if your service template {i doesn\226\128\153t} include a service pipeline. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-create-svc.html}Create a service} in the {i Proton User Guide}.\n"];
  template_minor_version: string option
    [@ocaml.doc
      "The minor version of the service template that was used to create the service.\n"];
  template_major_version: string
    [@ocaml.doc
      "The major version of the service template that was used to create the service.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the service template that's used to create the service.\n"];
  description: string option
    [@ocaml.doc "A description of the Proton service.\n"];
  name: string [@ocaml.doc "The service name.\n"]}[@@ocaml.doc ""]
type nonrec create_repository_output =
  {
  repository: repository
    [@ocaml.doc
      "The repository link's detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_repository_input =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton repository. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  encryption_key: string option
    [@ocaml.doc
      "The ARN of your customer Amazon Web Services Key Management Service (Amazon Web Services KMS) key.\n"];
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of your AWS CodeStar connection that connects Proton to your repository provider account. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/setting-up-for-service.html}Setting up for Proton} in the {i Proton User Guide}.\n"];
  name: string
    [@ocaml.doc "The repository name (for example, [myrepos/myrepo]).\n"];
  provider: repository_provider [@ocaml.doc "The repository provider.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_template_version_output =
  {
  environment_template_version: environment_template_version
    [@ocaml.doc
      "The environment template detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_template_version_input =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton environment template version. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  source: template_version_source_input
    [@ocaml.doc
      "An object that includes the template bundle S3 bucket path and name for the new version of an template.\n"];
  major_version: string option
    [@ocaml.doc
      "To create a new minor version of the environment template, include [major Version].\n\n To create a new major and minor version of the environment template, exclude [major Version].\n "];
  description: string option
    [@ocaml.doc
      "A description of the new version of an environment template.\n"];
  template_name: string
    [@ocaml.doc "The name of the environment template.\n"];
  client_token: string option
    [@ocaml.doc
      "When included, if two identical requests are made with the same client token, Proton returns the environment template version that the first request created.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_template_output =
  {
  environment_template: environment_template
    [@ocaml.doc
      "The environment template detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_template_input =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton environment template. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  provisioning: provisioning option
    [@ocaml.doc
      "When included, indicates that the environment template is for customer provisioned and managed infrastructure.\n"];
  encryption_key: string option
    [@ocaml.doc
      "A customer provided encryption key that Proton uses to encrypt data.\n"];
  description: string option
    [@ocaml.doc "A description of the environment template.\n"];
  display_name: string option
    [@ocaml.doc
      "The environment template name as displayed in the developer interface.\n"];
  name: string [@ocaml.doc "The name of the environment template.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_output =
  {
  environment: environment
    [@ocaml.doc "The environment detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_input =
  {
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that allows Proton to provision infrastructure using CodeBuild-based provisioning on your behalf.\n\n To use CodeBuild-based provisioning for the environment or for any service instance running in the environment, specify either the [environmentAccountConnectionId] or [codebuildRoleArn] parameter.\n "];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in this environment. It determines the scope of infrastructure that a component can provision.\n\n You must specify [componentRoleArn] to allow directly defined components to be associated with this environment.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  provisioning_repository: repository_branch_input option
    [@ocaml.doc
      "The linked repository that you use to host your rendered infrastructure templates for self-managed provisioning. A linked repository is a repository that has been registered with Proton. For more information, see [CreateRepository].\n\n To use self-managed provisioning for the environment, specify this parameter and omit the [environmentAccountConnectionId] and [protonServiceRoleArn] parameters.\n "];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton environment. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  environment_account_connection_id: string option
    [@ocaml.doc
      "The ID of the environment account connection that you provide if you're provisioning your environment infrastructure resources to an environment account. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-env-account-connections.html}Environment account connections} in the {i Proton User guide}.\n\n To use Amazon Web Services-managed provisioning for the environment, specify either the [environmentAccountConnectionId] or [protonServiceRoleArn] parameter and omit the [provisioningRepository] parameter.\n "];
  proton_service_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Proton service role that allows Proton to make calls to other services on your behalf.\n\n To use Amazon Web Services-managed provisioning for the environment, specify either the [environmentAccountConnectionId] or [protonServiceRoleArn] parameter and omit the [provisioningRepository] parameter.\n "];
  spec: string
    [@ocaml.doc
      "A YAML formatted string that provides inputs as defined in the environment template bundle schema file. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-environments.html}Environments} in the {i Proton User Guide}.\n"];
  description: string option
    [@ocaml.doc
      "A description of the environment that's being created and deployed.\n"];
  template_minor_version: string option
    [@ocaml.doc "The minor version of the environment template.\n"];
  template_major_version: string
    [@ocaml.doc "The major version of the environment template.\n"];
  template_name: string
    [@ocaml.doc
      "The name of the environment template. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-templates.html}Environment Templates} in the {i Proton User Guide}.\n"];
  name: string [@ocaml.doc "The name of the environment.\n"]}[@@ocaml.doc ""]
type nonrec create_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection
    [@ocaml.doc
      "The environment account connection detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec create_environment_account_connection_input =
  {
  codebuild_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM service role in the environment account. Proton uses this role to provision infrastructure resources using CodeBuild-based provisioning in the associated environment account.\n"];
  component_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that Proton uses when provisioning directly defined components in the associated environment account. It determines the scope of infrastructure that a component can provision in the account.\n\n You must specify [componentRoleArn] to allow directly defined components to be associated with any environments running in this account.\n \n  For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n  "];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton environment account connection. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  environment_name: string
    [@ocaml.doc
      "The name of the Proton environment that's created in the associated management account.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role that's created in the environment account. Proton uses this role to provision infrastructure resources in the associated environment account.\n"];
  management_account_id: string
    [@ocaml.doc
      "The ID of the management account that accepts or rejects the environment account connection. You create and manage the Proton environment in this account. If the management account accepts the environment account connection, Proton can use the associated IAM role to provision environment infrastructure resources in the associated environment account.\n"];
  client_token: string option
    [@ocaml.doc
      "When included, if two identical requests are made with the same client token, Proton returns the environment account connection that the first request created.\n"]}
[@@ocaml.doc ""]
type nonrec create_component_output =
  {
  component: component
    [@ocaml.doc "The detailed data of the created component.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec create_component_input =
  {
  client_token: string option
    [@ocaml.doc "The client token for the created component.\n"];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the Proton component. A tag is a key-value pair.\n\n For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/resources.html}Proton resources and tagging} in the {i Proton User Guide}.\n "];
  service_spec: string option
    [@ocaml.doc
      "The service spec that you want the component to use to access service inputs. Set this only when you attach the component to a service instance.\n"];
  manifest: string
    [@ocaml.doc
      "A path to a manifest file that lists the Infrastructure as Code (IaC) file, template language, and rendering engine for infrastructure that a custom component provisions.\n"];
  template_file: string
    [@ocaml.doc
      "A path to the Infrastructure as Code (IaC) file describing infrastructure that a custom component provisions.\n\n  Components support a single IaC file, even if you use Terraform as your template language.\n  \n   "];
  environment_name: string option
    [@ocaml.doc
      "The name of the Proton environment that you want to associate this component with. You must specify this when you don't specify [serviceInstanceName] and [serviceName].\n"];
  service_instance_name: string option
    [@ocaml.doc
      "The name of the service instance that you want to attach this component to. If you don't specify this, the component isn't attached to any service instance. Specify both [serviceInstanceName] and [serviceName] or neither of them.\n"];
  service_name: string option
    [@ocaml.doc
      "The name of the service that [serviceInstanceName] is associated with. If you don't specify this, the component isn't attached to any service instance. Specify both [serviceInstanceName] and [serviceName] or neither of them.\n"];
  description: string option
    [@ocaml.doc
      "An optional customer-provided description of the component.\n"];
  name: string [@ocaml.doc "The customer-provided name of the component.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_service_pipeline_deployment_output =
  {
  pipeline: service_pipeline
    [@ocaml.doc
      "The service pipeline detail data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_service_pipeline_deployment_input =
  {
  service_name: string
    [@ocaml.doc
      "The name of the service with the service pipeline deployment to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_service_instance_deployment_output =
  {
  service_instance: service_instance
    [@ocaml.doc
      "The service instance summary data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_service_instance_deployment_input =
  {
  service_name: string
    [@ocaml.doc
      "The name of the service with the service instance deployment to cancel.\n"];
  service_instance_name: string
    [@ocaml.doc
      "The name of the service instance with the deployment to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_environment_deployment_output =
  {
  environment: environment
    [@ocaml.doc "The environment summary data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_environment_deployment_input =
  {
  environment_name: string
    [@ocaml.doc
      "The name of the environment with the deployment to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_component_deployment_output =
  {
  component: component
    [@ocaml.doc
      "The detailed data of the component with the deployment that is being canceled.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_component_deployment_input =
  {
  component_name: string
    [@ocaml.doc "The name of the component with the deployment to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec accept_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection
    [@ocaml.doc
      "The environment account connection data that's returned by Proton.\n"]}
[@@ocaml.doc ""]
type nonrec accept_environment_account_connection_input =
  {
  id: string [@ocaml.doc "The ID of the environment account connection.\n"]}
[@@ocaml.doc ""]