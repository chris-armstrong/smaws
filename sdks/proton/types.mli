open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec validation_exception = {
  message: string }[@@ocaml.doc
                     "The input is invalid or an out-of-range value was supplied for the input parameter.\n"]
type nonrec template_type =
  | ENVIRONMENT 
  | SERVICE [@@ocaml.doc ""]
type nonrec repository_provider =
  | GITHUB 
  | GITHUB_ENTERPRISE 
  | BITBUCKET [@@ocaml.doc ""]
type nonrec template_sync_config =
  {
  subdirectory: string option ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  template_type: template_type ;
  template_name: string }[@@ocaml.doc
                           "The detail data for a template sync configuration.\n"]
type nonrec update_template_sync_config_output =
  {
  template_sync_config: template_sync_config option }[@@ocaml.doc ""]
type nonrec update_template_sync_config_input =
  {
  subdirectory: string option ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  template_type: template_type ;
  template_name: string }[@@ocaml.doc ""]
type nonrec throttling_exception = {
  message: string }[@@ocaml.doc
                     "The request was denied due to request throttling.\n"]
type nonrec resource_not_found_exception = {
  message: string }[@@ocaml.doc "The requested resource {i wasn't} found.\n"]
type nonrec internal_server_exception = {
  message: string }[@@ocaml.doc
                     "The request failed to register with the service.\n"]
type nonrec conflict_exception = {
  message: string }[@@ocaml.doc
                     "The request {i couldn't} be made due to a conflicting operation or resource.\n"]
type nonrec access_denied_exception = {
  message: string }[@@ocaml.doc
                     "There {i isn't} sufficient access for performing this action.\n"]
type nonrec template_version_status =
  | REGISTRATION_IN_PROGRESS 
  | REGISTRATION_FAILED 
  | DRAFT 
  | PUBLISHED [@@ocaml.doc ""]
type nonrec compatible_environment_template =
  {
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "Compatible environment template data.\n"]
type nonrec service_template_supported_component_source_type =
  | DIRECTLY_DEFINED [@@ocaml.doc ""]
type nonrec service_template_version =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option ;
  schema: string option ;
  compatible_environment_templates: compatible_environment_template list ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  description: string option ;
  status_message: string option ;
  status: template_version_status ;
  recommended_minor_version: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "Detailed data of an Proton service template version resource.\n"]
type nonrec update_service_template_version_output =
  {
  service_template_version: service_template_version }[@@ocaml.doc ""]
type nonrec compatible_environment_template_input =
  {
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "Compatible environment template data.\n"]
type nonrec update_service_template_version_input =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option ;
  compatible_environment_templates:
    compatible_environment_template_input list option ;
  status: template_version_status option ;
  description: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec provisioning =
  | CUSTOMER_MANAGED [@@ocaml.doc ""]
type nonrec service_template =
  {
  pipeline_provisioning: provisioning option ;
  encryption_key: string option ;
  recommended_version: string option ;
  description: string option ;
  display_name: string option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc
                  "Detailed data of an Proton service template resource.\n"]
type nonrec update_service_template_output =
  {
  service_template: service_template }[@@ocaml.doc ""]
type nonrec update_service_template_input =
  {
  description: string option ;
  display_name: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec service_sync_config =
  {
  file_path: string ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  service_name: string }[@@ocaml.doc
                          "Detailed data of the service sync configuration.\n"]
type nonrec update_service_sync_config_output =
  {
  service_sync_config: service_sync_config option }[@@ocaml.doc ""]
type nonrec update_service_sync_config_input =
  {
  file_path: string ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  service_name: string }[@@ocaml.doc ""]
type nonrec blocker_type =
  | AUTOMATED [@@ocaml.doc ""]
type nonrec blocker_status =
  | ACTIVE 
  | RESOLVED [@@ocaml.doc ""]
type nonrec sync_blocker_context = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Detailed data of the context of the sync blocker.\n"]
type nonrec sync_blocker =
  {
  resolved_at: CoreTypes.Timestamp.t option ;
  resolved_reason: string option ;
  contexts: sync_blocker_context list option ;
  created_at: CoreTypes.Timestamp.t ;
  created_reason: string ;
  status: blocker_status ;
  type_: blocker_type ;
  id: string }[@@ocaml.doc "Detailed data of the sync blocker.\n"]
type nonrec update_service_sync_blocker_output =
  {
  service_sync_blocker: sync_blocker ;
  service_instance_name: string option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec update_service_sync_blocker_input =
  {
  resolved_reason: string ;
  id: string }[@@ocaml.doc ""]
type nonrec deployment_status =
  | IN_PROGRESS 
  | FAILED 
  | SUCCEEDED 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | DELETE_COMPLETE 
  | CANCELLING 
  | CANCELLED [@@ocaml.doc ""]
type nonrec service_pipeline =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  spec: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string }[@@ocaml.doc
                 "Detailed data of an Proton service instance pipeline resource.\n"]
type nonrec update_service_pipeline_output = {
  pipeline: service_pipeline }[@@ocaml.doc ""]
type nonrec deployment_update_type =
  | NONE 
  | CURRENT_VERSION 
  | MINOR_VERSION 
  | MAJOR_VERSION [@@ocaml.doc ""]
type nonrec update_service_pipeline_input =
  {
  template_minor_version: string option ;
  template_major_version: string option ;
  deployment_type: deployment_update_type ;
  spec: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec service_status =
  | CREATE_IN_PROGRESS 
  | CREATE_FAILED_CLEANUP_IN_PROGRESS 
  | CREATE_FAILED_CLEANUP_COMPLETE 
  | CREATE_FAILED_CLEANUP_FAILED 
  | CREATE_FAILED 
  | ACTIVE 
  | DELETE_IN_PROGRESS 
  | DELETE_FAILED 
  | UPDATE_IN_PROGRESS 
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS 
  | UPDATE_FAILED_CLEANUP_COMPLETE 
  | UPDATE_FAILED_CLEANUP_FAILED 
  | UPDATE_FAILED 
  | UPDATE_COMPLETE_CLEANUP_FAILED [@@ocaml.doc ""]
type nonrec service =
  {
  branch_name: string option ;
  repository_id: string option ;
  repository_connection_arn: string option ;
  pipeline: service_pipeline option ;
  spec: string ;
  status_message: string option ;
  status: service_status ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  template_name: string ;
  arn: string ;
  description: string option ;
  name: string }[@@ocaml.doc
                  "Detailed data of an Proton service resource.\n"]
type nonrec update_service_output = {
  service: service }[@@ocaml.doc ""]
type nonrec service_instance =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  last_client_request_token: string option ;
  spec: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  environment_name: string ;
  service_name: string ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc
                  "Detailed data of an Proton service instance resource.\n"]
type nonrec update_service_instance_output =
  {
  service_instance: service_instance }[@@ocaml.doc ""]
type nonrec update_service_instance_input =
  {
  client_token: string option ;
  template_minor_version: string option ;
  template_major_version: string option ;
  spec: string option ;
  deployment_type: deployment_update_type ;
  service_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec update_service_input =
  {
  spec: string option ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception = {
  message: string }[@@ocaml.doc
                     "A quota was exceeded. For more information, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-limits.html}Proton Quotas} in the {i Proton User Guide}.\n"]
type nonrec environment_template_version =
  {
  schema: string option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  description: string option ;
  status_message: string option ;
  status: template_version_status ;
  recommended_minor_version: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "The environment template version data.\n"]
type nonrec update_environment_template_version_output =
  {
  environment_template_version: environment_template_version }[@@ocaml.doc
                                                                ""]
type nonrec update_environment_template_version_input =
  {
  status: template_version_status option ;
  description: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec environment_template =
  {
  provisioning: provisioning option ;
  encryption_key: string option ;
  recommended_version: string option ;
  description: string option ;
  display_name: string option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc "The environment template data.\n"]
type nonrec update_environment_template_output =
  {
  environment_template: environment_template }[@@ocaml.doc ""]
type nonrec update_environment_template_input =
  {
  description: string option ;
  display_name: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec repository_branch =
  {
  branch: string ;
  name: string ;
  provider: repository_provider ;
  arn: string }[@@ocaml.doc "Detail data for a linked repository branch.\n"]
type nonrec environment =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  provisioning_repository: repository_branch option ;
  provisioning: provisioning option ;
  spec: string option ;
  environment_account_id: string option ;
  environment_account_connection_id: string option ;
  proton_service_role_arn: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  arn: string ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  description: string option ;
  name: string }[@@ocaml.doc
                  "Detailed data of an Proton environment resource. An Proton environment is a set of resources shared across Proton services.\n"]
type nonrec update_environment_output = {
  environment: environment }[@@ocaml.doc ""]
type nonrec repository_branch_input =
  {
  branch: string ;
  name: string ;
  provider: repository_provider }[@@ocaml.doc
                                   "Detail input data for a linked repository branch.\n"]
type nonrec update_environment_input =
  {
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  provisioning_repository: repository_branch_input option ;
  environment_account_connection_id: string option ;
  deployment_type: deployment_update_type ;
  proton_service_role_arn: string option ;
  template_minor_version: string option ;
  template_major_version: string option ;
  spec: string option ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec environment_account_connection_status =
  | PENDING 
  | CONNECTED 
  | REJECTED [@@ocaml.doc ""]
type nonrec environment_account_connection =
  {
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  status: environment_account_connection_status ;
  last_modified_at: CoreTypes.Timestamp.t ;
  requested_at: CoreTypes.Timestamp.t ;
  environment_name: string ;
  role_arn: string ;
  environment_account_id: string ;
  management_account_id: string ;
  arn: string ;
  id: string }[@@ocaml.doc
                "Detailed data of an Proton environment account connection resource.\n"]
type nonrec update_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection }[@@ocaml.doc
                                                                    ""]
type nonrec update_environment_account_connection_input =
  {
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  role_arn: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec component =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  last_client_request_token: string option ;
  service_spec: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t option ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string ;
  arn: string ;
  description: string option ;
  name: string }[@@ocaml.doc
                  "Detailed data of an Proton component resource.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "]
type nonrec update_component_output = {
  component: component }[@@ocaml.doc ""]
type nonrec component_deployment_update_type =
  | NONE 
  | CURRENT_VERSION [@@ocaml.doc ""]
type nonrec update_component_input =
  {
  client_token: string option ;
  template_file: string option ;
  service_spec: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  description: string option ;
  deployment_type: component_deployment_update_type ;
  name: string }[@@ocaml.doc ""]
type nonrec account_settings =
  {
  pipeline_codebuild_role_arn: string option ;
  pipeline_provisioning_repository: repository_branch option ;
  pipeline_service_role_arn: string option }[@@ocaml.doc
                                              "Proton settings that are used for multiple services in the Amazon Web Services account.\n"]
type nonrec update_account_settings_output =
  {
  account_settings: account_settings }[@@ocaml.doc ""]
type nonrec update_account_settings_input =
  {
  pipeline_codebuild_role_arn: string option ;
  delete_pipeline_provisioning_repository: bool option ;
  pipeline_provisioning_repository: repository_branch_input option ;
  pipeline_service_role_arn: string option }[@@ocaml.doc ""]
type nonrec untag_resource_output = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec s3_object_source = {
  key: string ;
  bucket: string }[@@ocaml.doc "Template bundle S3 bucket data.\n"]
type nonrec template_version_source_input =
  | S3 of s3_object_source [@@ocaml.doc "Template version source data.\n"]
type nonrec tag_resource_output = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc "A description of a resource tag.\n"]
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec sync_type =
  | TEMPLATE_SYNC 
  | SERVICE_SYNC [@@ocaml.doc ""]
type nonrec sort_order =
  | ASCENDING 
  | DESCENDING [@@ocaml.doc ""]
type nonrec service_template_version_summary =
  {
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  description: string option ;
  status_message: string option ;
  status: template_version_status ;
  recommended_minor_version: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "Summary data of an Proton service template version resource.\n"]
type nonrec service_template_summary =
  {
  pipeline_provisioning: provisioning option ;
  recommended_version: string option ;
  description: string option ;
  display_name: string option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc
                  "Summary data of an Proton service template resource.\n"]
type nonrec service_sync_blocker_summary =
  {
  latest_blockers: sync_blocker list option ;
  service_instance_name: string option ;
  service_name: string }[@@ocaml.doc
                          "If a service instance is manually updated, Proton wants to prevent accidentally overriding a manual change.\n\n A blocker is created because of the manual update or deletion of a service instance. The summary describes the blocker as being active or resolved.\n "]
type nonrec service_summary =
  {
  status_message: string option ;
  status: service_status ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  template_name: string ;
  arn: string ;
  description: string option ;
  name: string }[@@ocaml.doc "Summary data of an Proton service resource.\n"]
type nonrec service_pipeline_state =
  {
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  spec: string option }[@@ocaml.doc
                         "The detailed data about the current state of the service pipeline.\n"]
type nonrec service_instance_summary =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  environment_name: string ;
  service_name: string ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc
                  "Summary data of an Proton service instance resource.\n"]
type nonrec service_instance_state =
  {
  last_successful_service_pipeline_deployment_id: string option ;
  last_successful_environment_deployment_id: string option ;
  last_successful_component_deployment_ids: string list option ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  spec: string }[@@ocaml.doc
                  "The detailed data about the current state of this service instance.\n"]
type nonrec revision =
  {
  branch: string ;
  directory: string ;
  sha: string ;
  repository_provider: repository_provider ;
  repository_name: string }[@@ocaml.doc
                             "Revision detail data for a commit and push that activates a sync attempt\n"]
type nonrec resource_sync_status =
  | INITIATED 
  | IN_PROGRESS 
  | SUCCEEDED 
  | FAILED [@@ocaml.doc ""]
type nonrec resource_sync_event =
  {
  event: string ;
  time: CoreTypes.Timestamp.t ;
  external_id: string option ;
  type_: string }[@@ocaml.doc "Detail data for a resource sync event.\n"]
type nonrec resource_sync_attempt =
  {
  events: resource_sync_event list ;
  status: resource_sync_status ;
  started_at: CoreTypes.Timestamp.t ;
  target: string ;
  target_revision: revision ;
  initial_revision: revision }[@@ocaml.doc
                                "Detail data for a resource sync attempt activated by a push to a repository.\n"]
type nonrec resource_deployment_status =
  | IN_PROGRESS 
  | FAILED 
  | SUCCEEDED [@@ocaml.doc ""]
type nonrec resource_counts_summary =
  {
  behind_minor: int option ;
  behind_major: int option ;
  up_to_date: int option ;
  failed: int option ;
  total: int }[@@ocaml.doc "Summary counts of each Proton resource types.\n"]
type nonrec repository_sync_status =
  | INITIATED 
  | IN_PROGRESS 
  | SUCCEEDED 
  | FAILED 
  | QUEUED [@@ocaml.doc ""]
type nonrec repository_sync_event =
  {
  event: string ;
  time: CoreTypes.Timestamp.t ;
  external_id: string option ;
  type_: string }[@@ocaml.doc
                   "Repository sync event detail data for a sync attempt.\n"]
type nonrec repository_sync_definition =
  {
  directory: string ;
  branch: string ;
  parent: string ;
  target: string }[@@ocaml.doc "A repository sync definition.\n"]
type nonrec repository_sync_attempt =
  {
  events: repository_sync_event list ;
  status: repository_sync_status ;
  started_at: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       "Detail data for a repository sync attempt activated by a push to a repository.\n"]
type nonrec repository_summary =
  {
  connection_arn: string ;
  name: string ;
  provider: repository_provider ;
  arn: string }[@@ocaml.doc
                 "Summary data of a linked repository\226\128\148a repository that has been registered with Proton.\n"]
type nonrec repository =
  {
  encryption_key: string option ;
  connection_arn: string ;
  name: string ;
  provider: repository_provider ;
  arn: string }[@@ocaml.doc
                 "Detailed data of a linked repository\226\128\148a repository that has been registered with Proton.\n"]
type nonrec reject_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection }[@@ocaml.doc
                                                                    ""]
type nonrec reject_environment_account_connection_input = {
  id: string }[@@ocaml.doc ""]
type nonrec provisioned_resource_engine =
  | CLOUDFORMATION 
  | TERRAFORM [@@ocaml.doc ""]
type nonrec provisioned_resource =
  {
  provisioning_engine: provisioned_resource_engine option ;
  identifier: string option ;
  name: string option }[@@ocaml.doc
                         "Detail data for a provisioned resource.\n"]
type nonrec output = {
  value_string: string option ;
  key: string option }[@@ocaml.doc
                        "An infrastructure as code defined resource output.\n"]
type nonrec notify_resource_deployment_status_change_output = unit
type nonrec notify_resource_deployment_status_change_input =
  {
  status_message: string option ;
  deployment_id: string option ;
  outputs: output list option ;
  status: resource_deployment_status option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_output =
  {
  next_token: string option ;
  tags: tag list }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  max_results: int option ;
  next_token: string option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_services_output =
  {
  services: service_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_services_input =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_templates_output =
  {
  templates: service_template_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_templates_input =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_template_versions_output =
  {
  template_versions: service_template_version_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_template_versions_input =
  {
  major_version: string option ;
  template_name: string ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_pipeline_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_pipeline_provisioned_resources_input =
  {
  next_token: string option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec list_service_pipeline_outputs_output =
  {
  outputs: output list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_pipeline_outputs_input =
  {
  deployment_id: string option ;
  next_token: string option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec list_service_instances_sort_by =
  | NAME 
  | DEPLOYMENT_STATUS 
  | TEMPLATE_NAME 
  | SERVICE_NAME 
  | ENVIRONMENT_NAME 
  | LAST_DEPLOYMENT_ATTEMPTED_AT 
  | CREATED_AT [@@ocaml.doc ""]
type nonrec list_service_instances_output =
  {
  service_instances: service_instance_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_instances_filter_by =
  | NAME 
  | DEPLOYMENT_STATUS 
  | TEMPLATE_NAME 
  | SERVICE_NAME 
  | DEPLOYED_TEMPLATE_VERSION_STATUS 
  | ENVIRONMENT_NAME 
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE 
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER 
  | CREATED_AT_BEFORE 
  | CREATED_AT_AFTER [@@ocaml.doc ""]
type nonrec list_service_instances_filter =
  {
  value: string option ;
  key: list_service_instances_filter_by option }[@@ocaml.doc
                                                  "A filtering criterion to scope down the result list of the [ListServiceInstances] action.\n"]
type nonrec list_service_instances_input =
  {
  sort_order: sort_order option ;
  sort_by: list_service_instances_sort_by option ;
  filters: list_service_instances_filter list option ;
  max_results: int option ;
  next_token: string option ;
  service_name: string option }[@@ocaml.doc ""]
type nonrec list_service_instance_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_instance_provisioned_resources_input =
  {
  next_token: string option ;
  service_instance_name: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec list_service_instance_outputs_output =
  {
  outputs: output list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_service_instance_outputs_input =
  {
  deployment_id: string option ;
  next_token: string option ;
  service_name: string ;
  service_instance_name: string }[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_output =
  {
  sync_definitions: repository_sync_definition list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_repository_sync_definitions_input =
  {
  next_token: string option ;
  sync_type: sync_type ;
  repository_provider: repository_provider ;
  repository_name: string }[@@ocaml.doc ""]
type nonrec list_repositories_output =
  {
  repositories: repository_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_repositories_input =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec environment_summary =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  component_role_arn: string option ;
  provisioning: provisioning option ;
  environment_account_id: string option ;
  environment_account_connection_id: string option ;
  proton_service_role_arn: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  arn: string ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  description: string option ;
  name: string }[@@ocaml.doc
                  "Summary data of an Proton environment resource. An Proton environment is a set of resources shared across Proton services.\n"]
type nonrec list_environments_output =
  {
  environments: environment_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec environment_template_filter =
  {
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "A search filter for environment templates.\n"]
type nonrec list_environments_input =
  {
  environment_templates: environment_template_filter list option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec environment_template_summary =
  {
  provisioning: provisioning option ;
  recommended_version: string option ;
  description: string option ;
  display_name: string option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  name: string }[@@ocaml.doc "The environment template data.\n"]
type nonrec list_environment_templates_output =
  {
  templates: environment_template_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_environment_templates_input =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec environment_template_version_summary =
  {
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  arn: string ;
  description: string option ;
  status_message: string option ;
  status: template_version_status ;
  recommended_minor_version: string option ;
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc
                           "A summary of the version of an environment template detail data.\n"]
type nonrec list_environment_template_versions_output =
  {
  template_versions: environment_template_version_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_environment_template_versions_input =
  {
  major_version: string option ;
  template_name: string ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_environment_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_environment_provisioned_resources_input =
  {
  next_token: string option ;
  environment_name: string }[@@ocaml.doc ""]
type nonrec list_environment_outputs_output =
  {
  outputs: output list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_environment_outputs_input =
  {
  deployment_id: string option ;
  next_token: string option ;
  environment_name: string }[@@ocaml.doc ""]
type nonrec environment_account_connection_summary =
  {
  component_role_arn: string option ;
  status: environment_account_connection_status ;
  last_modified_at: CoreTypes.Timestamp.t ;
  requested_at: CoreTypes.Timestamp.t ;
  environment_name: string ;
  role_arn: string ;
  environment_account_id: string ;
  management_account_id: string ;
  arn: string ;
  id: string }[@@ocaml.doc
                "Summary data of an Proton environment account connection resource.\n"]
type nonrec list_environment_account_connections_output =
  {
  next_token: string option ;
  environment_account_connections:
    environment_account_connection_summary list }[@@ocaml.doc ""]
type nonrec environment_account_connection_requester_account_type =
  | MANAGEMENT_ACCOUNT 
  | ENVIRONMENT_ACCOUNT [@@ocaml.doc ""]
type nonrec list_environment_account_connections_input =
  {
  max_results: int option ;
  next_token: string option ;
  statuses: environment_account_connection_status list option ;
  environment_name: string option ;
  requested_by: environment_account_connection_requester_account_type }
[@@ocaml.doc ""]
type nonrec deployment_target_resource_type =
  | ENVIRONMENT 
  | SERVICE_PIPELINE 
  | SERVICE_INSTANCE 
  | COMPONENT [@@ocaml.doc ""]
type nonrec deployment_summary =
  {
  deployment_status: deployment_status ;
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  component_name: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string ;
  completed_at: CoreTypes.Timestamp.t option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  target_resource_type: deployment_target_resource_type ;
  target_resource_created_at: CoreTypes.Timestamp.t ;
  target_arn: string ;
  arn: string ;
  id: string }[@@ocaml.doc "Summary data of the deployment.\n"]
type nonrec list_deployments_output =
  {
  deployments: deployment_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_deployments_input =
  {
  max_results: int option ;
  component_name: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec component_summary =
  {
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  last_deployment_succeeded_at: CoreTypes.Timestamp.t option ;
  last_deployment_attempted_at: CoreTypes.Timestamp.t option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string ;
  arn: string ;
  name: string }[@@ocaml.doc
                  "Summary data of an Proton component resource.\n\n For more information about components, see {{:https://docs.aws.amazon.com/proton/latest/userguide/ag-components.html}Proton components} in the {i Proton User Guide}.\n "]
type nonrec list_components_output =
  {
  components: component_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_components_input =
  {
  max_results: int option ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_component_provisioned_resources_output =
  {
  provisioned_resources: provisioned_resource list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_component_provisioned_resources_input =
  {
  next_token: string option ;
  component_name: string }[@@ocaml.doc ""]
type nonrec list_component_outputs_output =
  {
  outputs: output list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_component_outputs_input =
  {
  deployment_id: string option ;
  next_token: string option ;
  component_name: string }[@@ocaml.doc ""]
type nonrec get_template_sync_status_output =
  {
  desired_state: revision option ;
  latest_successful_sync: resource_sync_attempt option ;
  latest_sync: resource_sync_attempt option }[@@ocaml.doc ""]
type nonrec get_template_sync_status_input =
  {
  template_version: string ;
  template_type: template_type ;
  template_name: string }[@@ocaml.doc ""]
type nonrec get_template_sync_config_output =
  {
  template_sync_config: template_sync_config option }[@@ocaml.doc ""]
type nonrec get_template_sync_config_input =
  {
  template_type: template_type ;
  template_name: string }[@@ocaml.doc ""]
type nonrec get_service_template_version_output =
  {
  service_template_version: service_template_version }[@@ocaml.doc ""]
type nonrec get_service_template_version_input =
  {
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec get_service_template_output =
  {
  service_template: service_template }[@@ocaml.doc ""]
type nonrec get_service_template_input = {
  name: string }[@@ocaml.doc ""]
type nonrec get_service_sync_config_output =
  {
  service_sync_config: service_sync_config option }[@@ocaml.doc ""]
type nonrec get_service_sync_config_input = {
  service_name: string }[@@ocaml.doc ""]
type nonrec get_service_sync_blocker_summary_output =
  {
  service_sync_blocker_summary: service_sync_blocker_summary option }
[@@ocaml.doc ""]
type nonrec get_service_sync_blocker_summary_input =
  {
  service_instance_name: string option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec get_service_output = {
  service: service option }[@@ocaml.doc ""]
type nonrec get_service_instance_sync_status_output =
  {
  desired_state: revision option ;
  latest_successful_sync: resource_sync_attempt option ;
  latest_sync: resource_sync_attempt option }[@@ocaml.doc ""]
type nonrec get_service_instance_sync_status_input =
  {
  service_instance_name: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec get_service_instance_output =
  {
  service_instance: service_instance }[@@ocaml.doc ""]
type nonrec get_service_instance_input =
  {
  service_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec get_service_input = {
  name: string }[@@ocaml.doc ""]
type nonrec counts_summary =
  {
  pipelines: resource_counts_summary option ;
  service_templates: resource_counts_summary option ;
  services: resource_counts_summary option ;
  service_instances: resource_counts_summary option ;
  environment_templates: resource_counts_summary option ;
  environments: resource_counts_summary option ;
  components: resource_counts_summary option }[@@ocaml.doc
                                                "Summary counts of each Proton resource type.\n"]
type nonrec get_resources_summary_output = {
  counts: counts_summary }[@@ocaml.doc ""]
type nonrec get_resources_summary_input = unit
type nonrec get_repository_sync_status_output =
  {
  latest_sync: repository_sync_attempt option }[@@ocaml.doc ""]
type nonrec get_repository_sync_status_input =
  {
  sync_type: sync_type ;
  branch: string ;
  repository_provider: repository_provider ;
  repository_name: string }[@@ocaml.doc ""]
type nonrec get_repository_output = {
  repository: repository }[@@ocaml.doc ""]
type nonrec get_repository_input =
  {
  name: string ;
  provider: repository_provider }[@@ocaml.doc ""]
type nonrec get_environment_template_version_output =
  {
  environment_template_version: environment_template_version }[@@ocaml.doc
                                                                ""]
type nonrec get_environment_template_version_input =
  {
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec get_environment_template_output =
  {
  environment_template: environment_template }[@@ocaml.doc ""]
type nonrec get_environment_template_input = {
  name: string }[@@ocaml.doc ""]
type nonrec get_environment_output = {
  environment: environment }[@@ocaml.doc ""]
type nonrec get_environment_input = {
  name: string }[@@ocaml.doc ""]
type nonrec get_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection }[@@ocaml.doc
                                                                    ""]
type nonrec get_environment_account_connection_input = {
  id: string }[@@ocaml.doc ""]
type nonrec environment_state =
  {
  template_minor_version: string ;
  template_major_version: string ;
  template_name: string ;
  spec: string option }[@@ocaml.doc
                         "The detailed data about the current state of the environment.\n"]
type nonrec component_state =
  {
  template_file: string option ;
  service_spec: string option ;
  service_instance_name: string option ;
  service_name: string option }[@@ocaml.doc
                                 "The detailed data about the current state of the component.\n"]
type nonrec deployment_state =
  | Component of component_state 
  | ServicePipeline of service_pipeline_state 
  | Environment of environment_state 
  | ServiceInstance of service_instance_state [@@ocaml.doc
                                                "The detailed data about the current state of the deployment.\n"]
type nonrec deployment =
  {
  target_state: deployment_state option ;
  initial_state: deployment_state option ;
  last_succeeded_deployment_id: string option ;
  last_attempted_deployment_id: string option ;
  completed_at: CoreTypes.Timestamp.t option ;
  last_modified_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  deployment_status_message: string option ;
  deployment_status: deployment_status ;
  component_name: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string ;
  target_resource_type: deployment_target_resource_type ;
  target_resource_created_at: CoreTypes.Timestamp.t ;
  target_arn: string ;
  arn: string ;
  id: string }[@@ocaml.doc "The detailed information about a deployment.\n"]
type nonrec get_deployment_output = {
  deployment: deployment option }[@@ocaml.doc ""]
type nonrec get_deployment_input =
  {
  component_name: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  environment_name: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec get_component_output = {
  component: component option }[@@ocaml.doc ""]
type nonrec get_component_input = {
  name: string }[@@ocaml.doc ""]
type nonrec get_account_settings_output =
  {
  account_settings: account_settings option }[@@ocaml.doc ""]
type nonrec get_account_settings_input = unit
type nonrec delete_template_sync_config_output =
  {
  template_sync_config: template_sync_config option }[@@ocaml.doc ""]
type nonrec delete_template_sync_config_input =
  {
  template_type: template_type ;
  template_name: string }[@@ocaml.doc ""]
type nonrec delete_service_template_version_output =
  {
  service_template_version: service_template_version option }[@@ocaml.doc ""]
type nonrec delete_service_template_version_input =
  {
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec delete_service_template_output =
  {
  service_template: service_template option }[@@ocaml.doc ""]
type nonrec delete_service_template_input = {
  name: string }[@@ocaml.doc ""]
type nonrec delete_service_sync_config_output =
  {
  service_sync_config: service_sync_config option }[@@ocaml.doc ""]
type nonrec delete_service_sync_config_input = {
  service_name: string }[@@ocaml.doc ""]
type nonrec delete_service_output = {
  service: service option }[@@ocaml.doc ""]
type nonrec delete_service_input = {
  name: string }[@@ocaml.doc ""]
type nonrec delete_repository_output = {
  repository: repository option }[@@ocaml.doc ""]
type nonrec delete_repository_input =
  {
  name: string ;
  provider: repository_provider }[@@ocaml.doc ""]
type nonrec delete_environment_template_version_output =
  {
  environment_template_version: environment_template_version option }
[@@ocaml.doc ""]
type nonrec delete_environment_template_version_input =
  {
  minor_version: string ;
  major_version: string ;
  template_name: string }[@@ocaml.doc ""]
type nonrec delete_environment_template_output =
  {
  environment_template: environment_template option }[@@ocaml.doc ""]
type nonrec delete_environment_template_input = {
  name: string }[@@ocaml.doc ""]
type nonrec delete_environment_output = {
  environment: environment option }[@@ocaml.doc ""]
type nonrec delete_environment_input = {
  name: string }[@@ocaml.doc ""]
type nonrec delete_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection option }
[@@ocaml.doc ""]
type nonrec delete_environment_account_connection_input = {
  id: string }[@@ocaml.doc ""]
type nonrec delete_deployment_output = {
  deployment: deployment option }[@@ocaml.doc ""]
type nonrec delete_deployment_input = {
  id: string }[@@ocaml.doc ""]
type nonrec delete_component_output = {
  component: component option }[@@ocaml.doc ""]
type nonrec delete_component_input = {
  name: string }[@@ocaml.doc ""]
type nonrec create_template_sync_config_output =
  {
  template_sync_config: template_sync_config option }[@@ocaml.doc ""]
type nonrec create_template_sync_config_input =
  {
  subdirectory: string option ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  template_type: template_type ;
  template_name: string }[@@ocaml.doc ""]
type nonrec create_service_template_version_output =
  {
  service_template_version: service_template_version }[@@ocaml.doc ""]
type nonrec create_service_template_version_input =
  {
  supported_component_sources:
    service_template_supported_component_source_type list option ;
  tags: tag list option ;
  compatible_environment_templates:
    compatible_environment_template_input list ;
  source: template_version_source_input ;
  major_version: string option ;
  description: string option ;
  template_name: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec create_service_template_output =
  {
  service_template: service_template }[@@ocaml.doc ""]
type nonrec create_service_template_input =
  {
  tags: tag list option ;
  pipeline_provisioning: provisioning option ;
  encryption_key: string option ;
  description: string option ;
  display_name: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_service_sync_config_output =
  {
  service_sync_config: service_sync_config option }[@@ocaml.doc ""]
type nonrec create_service_sync_config_input =
  {
  file_path: string ;
  branch: string ;
  repository_name: string ;
  repository_provider: repository_provider ;
  service_name: string }[@@ocaml.doc ""]
type nonrec create_service_output = {
  service: service }[@@ocaml.doc ""]
type nonrec create_service_instance_output =
  {
  service_instance: service_instance }[@@ocaml.doc ""]
type nonrec create_service_instance_input =
  {
  client_token: string option ;
  tags: tag list option ;
  template_minor_version: string option ;
  template_major_version: string option ;
  spec: string ;
  service_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_service_input =
  {
  tags: tag list option ;
  branch_name: string option ;
  repository_id: string option ;
  repository_connection_arn: string option ;
  spec: string ;
  template_minor_version: string option ;
  template_major_version: string ;
  template_name: string ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_repository_output = {
  repository: repository }[@@ocaml.doc ""]
type nonrec create_repository_input =
  {
  tags: tag list option ;
  encryption_key: string option ;
  connection_arn: string ;
  name: string ;
  provider: repository_provider }[@@ocaml.doc ""]
type nonrec create_environment_template_version_output =
  {
  environment_template_version: environment_template_version }[@@ocaml.doc
                                                                ""]
type nonrec create_environment_template_version_input =
  {
  tags: tag list option ;
  source: template_version_source_input ;
  major_version: string option ;
  description: string option ;
  template_name: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec create_environment_template_output =
  {
  environment_template: environment_template }[@@ocaml.doc ""]
type nonrec create_environment_template_input =
  {
  tags: tag list option ;
  provisioning: provisioning option ;
  encryption_key: string option ;
  description: string option ;
  display_name: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_environment_output = {
  environment: environment }[@@ocaml.doc ""]
type nonrec create_environment_input =
  {
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  provisioning_repository: repository_branch_input option ;
  tags: tag list option ;
  environment_account_connection_id: string option ;
  proton_service_role_arn: string option ;
  spec: string ;
  description: string option ;
  template_minor_version: string option ;
  template_major_version: string ;
  template_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection }[@@ocaml.doc
                                                                    ""]
type nonrec create_environment_account_connection_input =
  {
  codebuild_role_arn: string option ;
  component_role_arn: string option ;
  tags: tag list option ;
  environment_name: string ;
  role_arn: string option ;
  management_account_id: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec create_component_output = {
  component: component }[@@ocaml.doc ""]
type nonrec create_component_input =
  {
  client_token: string option ;
  tags: tag list option ;
  service_spec: string option ;
  manifest: string ;
  template_file: string ;
  environment_name: string option ;
  service_instance_name: string option ;
  service_name: string option ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec cancel_service_pipeline_deployment_output =
  {
  pipeline: service_pipeline }[@@ocaml.doc ""]
type nonrec cancel_service_pipeline_deployment_input =
  {
  service_name: string }[@@ocaml.doc ""]
type nonrec cancel_service_instance_deployment_output =
  {
  service_instance: service_instance }[@@ocaml.doc ""]
type nonrec cancel_service_instance_deployment_input =
  {
  service_name: string ;
  service_instance_name: string }[@@ocaml.doc ""]
type nonrec cancel_environment_deployment_output =
  {
  environment: environment }[@@ocaml.doc ""]
type nonrec cancel_environment_deployment_input = {
  environment_name: string }[@@ocaml.doc ""]
type nonrec cancel_component_deployment_output = {
  component: component }[@@ocaml.doc ""]
type nonrec cancel_component_deployment_input = {
  component_name: string }[@@ocaml.doc ""]
type nonrec accept_environment_account_connection_output =
  {
  environment_account_connection: environment_account_connection }[@@ocaml.doc
                                                                    ""]
type nonrec accept_environment_account_connection_input = {
  id: string }[@@ocaml.doc ""]