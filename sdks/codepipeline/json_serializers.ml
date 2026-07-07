open Smaws_Lib.Json.SerializeHelpers
open Types

let webhook_url_to_yojson = string_to_yojson
let webhook_not_found_exception_to_yojson = unit_to_yojson
let webhook_name_to_yojson = string_to_yojson
let pipeline_name_to_yojson = string_to_yojson
let action_name_to_yojson = string_to_yojson
let json_path_to_yojson = string_to_yojson
let match_equals_to_yojson = string_to_yojson

let webhook_filter_rule_to_yojson (x : webhook_filter_rule) =
  assoc_to_yojson
    [
      ("matchEquals", option_to_yojson match_equals_to_yojson x.match_equals);
      ("jsonPath", Some (json_path_to_yojson x.json_path));
    ]

let webhook_filters_to_yojson tree = list_to_yojson webhook_filter_rule_to_yojson tree

let webhook_authentication_type_to_yojson (x : webhook_authentication_type) =
  match x with
  | UNAUTHENTICATED -> `String "UNAUTHENTICATED"
  | IP -> `String "IP"
  | GITHUB_HMAC -> `String "GITHUB_HMAC"

let webhook_auth_configuration_allowed_ip_range_to_yojson = string_to_yojson
let webhook_auth_configuration_secret_token_to_yojson = string_to_yojson

let webhook_auth_configuration_to_yojson (x : webhook_auth_configuration) =
  assoc_to_yojson
    [
      ( "SecretToken",
        option_to_yojson webhook_auth_configuration_secret_token_to_yojson x.secret_token );
      ( "AllowedIPRange",
        option_to_yojson webhook_auth_configuration_allowed_ip_range_to_yojson x.allowed_ip_range );
    ]

let webhook_definition_to_yojson (x : webhook_definition) =
  assoc_to_yojson
    [
      ( "authenticationConfiguration",
        Some (webhook_auth_configuration_to_yojson x.authentication_configuration) );
      ("authentication", Some (webhook_authentication_type_to_yojson x.authentication));
      ("filters", Some (webhook_filters_to_yojson x.filters));
      ("targetAction", Some (action_name_to_yojson x.target_action));
      ("targetPipeline", Some (pipeline_name_to_yojson x.target_pipeline));
      ("name", Some (webhook_name_to_yojson x.name));
    ]

let webhook_error_message_to_yojson = string_to_yojson
let webhook_error_code_to_yojson = string_to_yojson
let webhook_last_triggered_to_yojson = timestamp_epoch_seconds_to_yojson
let webhook_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_webhook_item_to_yojson (x : list_webhook_item) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("arn", option_to_yojson webhook_arn_to_yojson x.arn);
      ("lastTriggered", option_to_yojson webhook_last_triggered_to_yojson x.last_triggered);
      ("errorCode", option_to_yojson webhook_error_code_to_yojson x.error_code);
      ("errorMessage", option_to_yojson webhook_error_message_to_yojson x.error_message);
      ("url", Some (webhook_url_to_yojson x.url));
      ("definition", Some (webhook_definition_to_yojson x.definition));
    ]

let webhook_list_to_yojson tree = list_to_yojson list_webhook_item_to_yojson tree
let version_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let url_template_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson
let artifact_store_type_to_yojson (x : artifact_store_type) = match x with S3 -> `String "S3"
let artifact_store_location_to_yojson = string_to_yojson
let encryption_key_id_to_yojson = string_to_yojson
let encryption_key_type_to_yojson (x : encryption_key_type) = match x with KMS -> `String "KMS"

let encryption_key_to_yojson (x : encryption_key) =
  assoc_to_yojson
    [
      ("type", Some (encryption_key_type_to_yojson x.type_));
      ("id", Some (encryption_key_id_to_yojson x.id));
    ]

let artifact_store_to_yojson (x : artifact_store) =
  assoc_to_yojson
    [
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("location", Some (artifact_store_location_to_yojson x.location));
      ("type", Some (artifact_store_type_to_yojson x.type_));
    ]

let aws_region_name_to_yojson = string_to_yojson

let artifact_store_map_to_yojson tree =
  map_to_yojson aws_region_name_to_yojson artifact_store_to_yojson tree

let stage_name_to_yojson = string_to_yojson
let blocker_name_to_yojson = string_to_yojson
let blocker_type_to_yojson (x : blocker_type) = match x with Schedule -> `String "Schedule"

let blocker_declaration_to_yojson (x : blocker_declaration) =
  assoc_to_yojson
    [
      ("type", Some (blocker_type_to_yojson x.type_)); ("name", Some (blocker_name_to_yojson x.name));
    ]

let stage_blocker_declaration_list_to_yojson tree =
  list_to_yojson blocker_declaration_to_yojson tree

let action_category_to_yojson (x : action_category) =
  match x with
  | Compute -> `String "Compute"
  | Approval -> `String "Approval"
  | Invoke -> `String "Invoke"
  | Test -> `String "Test"
  | Deploy -> `String "Deploy"
  | Build -> `String "Build"
  | Source -> `String "Source"

let action_owner_to_yojson (x : action_owner) =
  match x with
  | Custom -> `String "Custom"
  | ThirdParty -> `String "ThirdParty"
  | AWS -> `String "AWS"

let action_provider_to_yojson = string_to_yojson

let action_type_id_to_yojson (x : action_type_id) =
  assoc_to_yojson
    [
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("owner", Some (action_owner_to_yojson x.owner));
      ("category", Some (action_category_to_yojson x.category));
    ]

let action_run_order_to_yojson = int_to_yojson
let action_configuration_value_to_yojson = string_to_yojson
let action_configuration_key_to_yojson = string_to_yojson

let action_configuration_map_to_yojson tree =
  map_to_yojson action_configuration_key_to_yojson action_configuration_value_to_yojson tree

let command_to_yojson = string_to_yojson
let command_list_to_yojson tree = list_to_yojson command_to_yojson tree
let artifact_name_to_yojson = string_to_yojson
let file_path_to_yojson = string_to_yojson
let file_path_list_to_yojson tree = list_to_yojson file_path_to_yojson tree

let output_artifact_to_yojson (x : output_artifact) =
  assoc_to_yojson
    [
      ("files", option_to_yojson file_path_list_to_yojson x.files);
      ("name", Some (artifact_name_to_yojson x.name));
    ]

let output_artifact_list_to_yojson tree = list_to_yojson output_artifact_to_yojson tree

let input_artifact_to_yojson (x : input_artifact) =
  assoc_to_yojson [ ("name", Some (artifact_name_to_yojson x.name)) ]

let input_artifact_list_to_yojson tree = list_to_yojson input_artifact_to_yojson tree
let output_variable_to_yojson = string_to_yojson
let output_variable_list_to_yojson tree = list_to_yojson output_variable_to_yojson tree
let action_namespace_to_yojson = string_to_yojson
let action_timeout_to_yojson = int_to_yojson
let environment_variable_name_to_yojson = string_to_yojson
let environment_variable_value_to_yojson = string_to_yojson

let environment_variable_type_to_yojson (x : environment_variable_type) =
  match x with SECRETS_MANAGER -> `String "SECRETS_MANAGER" | PLAINTEXT -> `String "PLAINTEXT"

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("type", option_to_yojson environment_variable_type_to_yojson x.type_);
      ("value", Some (environment_variable_value_to_yojson x.value));
      ("name", Some (environment_variable_name_to_yojson x.name));
    ]

let environment_variable_list_to_yojson tree = list_to_yojson environment_variable_to_yojson tree

let action_declaration_to_yojson (x : action_declaration) =
  assoc_to_yojson
    [
      ( "environmentVariables",
        option_to_yojson environment_variable_list_to_yojson x.environment_variables );
      ("timeoutInMinutes", option_to_yojson action_timeout_to_yojson x.timeout_in_minutes);
      ("namespace", option_to_yojson action_namespace_to_yojson x.namespace);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("outputVariables", option_to_yojson output_variable_list_to_yojson x.output_variables);
      ("inputArtifacts", option_to_yojson input_artifact_list_to_yojson x.input_artifacts);
      ("outputArtifacts", option_to_yojson output_artifact_list_to_yojson x.output_artifacts);
      ("commands", option_to_yojson command_list_to_yojson x.commands);
      ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration);
      ("runOrder", option_to_yojson action_run_order_to_yojson x.run_order);
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
      ("name", Some (action_name_to_yojson x.name));
    ]

let stage_action_declaration_list_to_yojson tree = list_to_yojson action_declaration_to_yojson tree

let result__to_yojson (x : result_) =
  match x with
  | SKIP -> `String "SKIP"
  | RETRY -> `String "RETRY"
  | FAIL -> `String "FAIL"
  | ROLLBACK -> `String "ROLLBACK"

let stage_retry_mode_to_yojson (x : stage_retry_mode) =
  match x with ALL_ACTIONS -> `String "ALL_ACTIONS" | FAILED_ACTIONS -> `String "FAILED_ACTIONS"

let retry_configuration_to_yojson (x : retry_configuration) =
  assoc_to_yojson [ ("retryMode", option_to_yojson stage_retry_mode_to_yojson x.retry_mode) ]

let rule_name_to_yojson = string_to_yojson
let rule_category_to_yojson (x : rule_category) = match x with Rule -> `String "Rule"
let rule_owner_to_yojson (x : rule_owner) = match x with AWS -> `String "AWS"
let rule_provider_to_yojson = string_to_yojson

let rule_type_id_to_yojson (x : rule_type_id) =
  assoc_to_yojson
    [
      ("version", option_to_yojson version_to_yojson x.version);
      ("provider", Some (rule_provider_to_yojson x.provider));
      ("owner", option_to_yojson rule_owner_to_yojson x.owner);
      ("category", Some (rule_category_to_yojson x.category));
    ]

let rule_configuration_value_to_yojson = string_to_yojson
let rule_configuration_key_to_yojson = string_to_yojson

let rule_configuration_map_to_yojson tree =
  map_to_yojson rule_configuration_key_to_yojson rule_configuration_value_to_yojson tree

let rule_timeout_to_yojson = int_to_yojson

let rule_declaration_to_yojson (x : rule_declaration) =
  assoc_to_yojson
    [
      ("timeoutInMinutes", option_to_yojson rule_timeout_to_yojson x.timeout_in_minutes);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("inputArtifacts", option_to_yojson input_artifact_list_to_yojson x.input_artifacts);
      ("commands", option_to_yojson command_list_to_yojson x.commands);
      ("configuration", option_to_yojson rule_configuration_map_to_yojson x.configuration);
      ("ruleTypeId", Some (rule_type_id_to_yojson x.rule_type_id));
      ("name", Some (rule_name_to_yojson x.name));
    ]

let rule_declaration_list_to_yojson tree = list_to_yojson rule_declaration_to_yojson tree

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("rules", option_to_yojson rule_declaration_list_to_yojson x.rules);
      ("result", option_to_yojson result__to_yojson x.result_);
    ]

let condition_list_to_yojson tree = list_to_yojson condition_to_yojson tree

let failure_conditions_to_yojson (x : failure_conditions) =
  assoc_to_yojson
    [
      ("conditions", option_to_yojson condition_list_to_yojson x.conditions);
      ("retryConfiguration", option_to_yojson retry_configuration_to_yojson x.retry_configuration);
      ("result", option_to_yojson result__to_yojson x.result_);
    ]

let success_conditions_to_yojson (x : success_conditions) =
  assoc_to_yojson [ ("conditions", Some (condition_list_to_yojson x.conditions)) ]

let before_entry_conditions_to_yojson (x : before_entry_conditions) =
  assoc_to_yojson [ ("conditions", Some (condition_list_to_yojson x.conditions)) ]

let stage_declaration_to_yojson (x : stage_declaration) =
  assoc_to_yojson
    [
      ("beforeEntry", option_to_yojson before_entry_conditions_to_yojson x.before_entry);
      ("onSuccess", option_to_yojson success_conditions_to_yojson x.on_success);
      ("onFailure", option_to_yojson failure_conditions_to_yojson x.on_failure);
      ("actions", Some (stage_action_declaration_list_to_yojson x.actions));
      ("blockers", option_to_yojson stage_blocker_declaration_list_to_yojson x.blockers);
      ("name", Some (stage_name_to_yojson x.name));
    ]

let pipeline_stage_declaration_list_to_yojson tree = list_to_yojson stage_declaration_to_yojson tree
let pipeline_version_to_yojson = int_to_yojson

let execution_mode_to_yojson (x : execution_mode) =
  match x with
  | PARALLEL -> `String "PARALLEL"
  | SUPERSEDED -> `String "SUPERSEDED"
  | QUEUED -> `String "QUEUED"

let pipeline_type_to_yojson (x : pipeline_type) =
  match x with V2 -> `String "V2" | V1 -> `String "V1"

let pipeline_variable_name_to_yojson = string_to_yojson
let pipeline_variable_value_to_yojson = string_to_yojson
let pipeline_variable_description_to_yojson = string_to_yojson

let pipeline_variable_declaration_to_yojson (x : pipeline_variable_declaration) =
  assoc_to_yojson
    [
      ("description", option_to_yojson pipeline_variable_description_to_yojson x.description);
      ("defaultValue", option_to_yojson pipeline_variable_value_to_yojson x.default_value);
      ("name", Some (pipeline_variable_name_to_yojson x.name));
    ]

let pipeline_variable_declaration_list_to_yojson tree =
  list_to_yojson pipeline_variable_declaration_to_yojson tree

let pipeline_trigger_provider_type_to_yojson (x : pipeline_trigger_provider_type) =
  match x with CodeStarSourceConnection -> `String "CodeStarSourceConnection"

let git_tag_name_pattern_to_yojson = string_to_yojson
let git_tag_pattern_list_to_yojson tree = list_to_yojson git_tag_name_pattern_to_yojson tree

let git_tag_filter_criteria_to_yojson (x : git_tag_filter_criteria) =
  assoc_to_yojson
    [
      ("excludes", option_to_yojson git_tag_pattern_list_to_yojson x.excludes);
      ("includes", option_to_yojson git_tag_pattern_list_to_yojson x.includes);
    ]

let git_branch_name_pattern_to_yojson = string_to_yojson
let git_branch_pattern_list_to_yojson tree = list_to_yojson git_branch_name_pattern_to_yojson tree

let git_branch_filter_criteria_to_yojson (x : git_branch_filter_criteria) =
  assoc_to_yojson
    [
      ("excludes", option_to_yojson git_branch_pattern_list_to_yojson x.excludes);
      ("includes", option_to_yojson git_branch_pattern_list_to_yojson x.includes);
    ]

let git_file_path_pattern_to_yojson = string_to_yojson
let git_file_path_pattern_list_to_yojson tree = list_to_yojson git_file_path_pattern_to_yojson tree

let git_file_path_filter_criteria_to_yojson (x : git_file_path_filter_criteria) =
  assoc_to_yojson
    [
      ("excludes", option_to_yojson git_file_path_pattern_list_to_yojson x.excludes);
      ("includes", option_to_yojson git_file_path_pattern_list_to_yojson x.includes);
    ]

let git_push_filter_to_yojson (x : git_push_filter) =
  assoc_to_yojson
    [
      ("filePaths", option_to_yojson git_file_path_filter_criteria_to_yojson x.file_paths);
      ("branches", option_to_yojson git_branch_filter_criteria_to_yojson x.branches);
      ("tags", option_to_yojson git_tag_filter_criteria_to_yojson x.tags);
    ]

let git_push_filter_list_to_yojson tree = list_to_yojson git_push_filter_to_yojson tree

let git_pull_request_event_type_to_yojson (x : git_pull_request_event_type) =
  match x with CLOSED -> `String "CLOSED" | UPDATED -> `String "UPDATED" | OPEN -> `String "OPEN"

let git_pull_request_event_type_list_to_yojson tree =
  list_to_yojson git_pull_request_event_type_to_yojson tree

let git_pull_request_filter_to_yojson (x : git_pull_request_filter) =
  assoc_to_yojson
    [
      ("filePaths", option_to_yojson git_file_path_filter_criteria_to_yojson x.file_paths);
      ("branches", option_to_yojson git_branch_filter_criteria_to_yojson x.branches);
      ("events", option_to_yojson git_pull_request_event_type_list_to_yojson x.events);
    ]

let git_pull_request_filter_list_to_yojson tree =
  list_to_yojson git_pull_request_filter_to_yojson tree

let git_configuration_to_yojson (x : git_configuration) =
  assoc_to_yojson
    [
      ("pullRequest", option_to_yojson git_pull_request_filter_list_to_yojson x.pull_request);
      ("push", option_to_yojson git_push_filter_list_to_yojson x.push);
      ("sourceActionName", Some (action_name_to_yojson x.source_action_name));
    ]

let pipeline_trigger_declaration_to_yojson (x : pipeline_trigger_declaration) =
  assoc_to_yojson
    [
      ("gitConfiguration", Some (git_configuration_to_yojson x.git_configuration));
      ("providerType", Some (pipeline_trigger_provider_type_to_yojson x.provider_type));
    ]

let pipeline_trigger_declaration_list_to_yojson tree =
  list_to_yojson pipeline_trigger_declaration_to_yojson tree

let pipeline_declaration_to_yojson (x : pipeline_declaration) =
  assoc_to_yojson
    [
      ("triggers", option_to_yojson pipeline_trigger_declaration_list_to_yojson x.triggers);
      ("variables", option_to_yojson pipeline_variable_declaration_list_to_yojson x.variables);
      ("pipelineType", option_to_yojson pipeline_type_to_yojson x.pipeline_type);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
      ("stages", Some (pipeline_stage_declaration_list_to_yojson x.stages));
      ("artifactStores", option_to_yojson artifact_store_map_to_yojson x.artifact_stores);
      ("artifactStore", option_to_yojson artifact_store_to_yojson x.artifact_store);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("name", Some (pipeline_name_to_yojson x.name));
    ]

let update_pipeline_output_to_yojson (x : update_pipeline_output) =
  assoc_to_yojson [ ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline) ]

let update_pipeline_input_to_yojson (x : update_pipeline_input) =
  assoc_to_yojson [ ("pipeline", Some (pipeline_declaration_to_yojson x.pipeline)) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_structure_exception_to_yojson (x : invalid_structure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_stage_declaration_exception_to_yojson (x : invalid_stage_declaration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_blocker_declaration_exception_to_yojson (x : invalid_blocker_declaration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_action_declaration_exception_to_yojson (x : invalid_action_declaration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let action_type_description_to_yojson = string_to_yojson
let lambda_function_arn_to_yojson = string_to_yojson

let lambda_executor_configuration_to_yojson (x : lambda_executor_configuration) =
  assoc_to_yojson
    [ ("lambdaFunctionArn", Some (lambda_function_arn_to_yojson x.lambda_function_arn)) ]

let account_id_to_yojson = string_to_yojson
let polling_account_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let service_principal_to_yojson = string_to_yojson
let polling_service_principal_list_to_yojson tree = list_to_yojson service_principal_to_yojson tree

let job_worker_executor_configuration_to_yojson (x : job_worker_executor_configuration) =
  assoc_to_yojson
    [
      ( "pollingServicePrincipals",
        option_to_yojson polling_service_principal_list_to_yojson x.polling_service_principals );
      ("pollingAccounts", option_to_yojson polling_account_list_to_yojson x.polling_accounts);
    ]

let executor_configuration_to_yojson (x : executor_configuration) =
  assoc_to_yojson
    [
      ( "jobWorkerExecutorConfiguration",
        option_to_yojson job_worker_executor_configuration_to_yojson
          x.job_worker_executor_configuration );
      ( "lambdaExecutorConfiguration",
        option_to_yojson lambda_executor_configuration_to_yojson x.lambda_executor_configuration );
    ]

let executor_type_to_yojson (x : executor_type) =
  match x with Lambda -> `String "Lambda" | JobWorker -> `String "JobWorker"

let policy_statements_template_to_yojson = string_to_yojson
let job_timeout_to_yojson = int_to_yojson

let action_type_executor_to_yojson (x : action_type_executor) =
  assoc_to_yojson
    [
      ("jobTimeout", option_to_yojson job_timeout_to_yojson x.job_timeout);
      ( "policyStatementsTemplate",
        option_to_yojson policy_statements_template_to_yojson x.policy_statements_template );
      ("type", Some (executor_type_to_yojson x.type_));
      ("configuration", Some (executor_configuration_to_yojson x.configuration));
    ]

let action_type_owner_to_yojson = string_to_yojson

let action_type_identifier_to_yojson (x : action_type_identifier) =
  assoc_to_yojson
    [
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("owner", Some (action_type_owner_to_yojson x.owner));
      ("category", Some (action_category_to_yojson x.category));
    ]

let minimum_action_type_artifact_count_to_yojson = int_to_yojson
let maximum_action_type_artifact_count_to_yojson = int_to_yojson

let action_type_artifact_details_to_yojson (x : action_type_artifact_details) =
  assoc_to_yojson
    [
      ("maximumCount", Some (maximum_action_type_artifact_count_to_yojson x.maximum_count));
      ("minimumCount", Some (minimum_action_type_artifact_count_to_yojson x.minimum_count));
    ]

let allowed_account_to_yojson = string_to_yojson
let allowed_accounts_to_yojson tree = list_to_yojson allowed_account_to_yojson tree

let action_type_permissions_to_yojson (x : action_type_permissions) =
  assoc_to_yojson [ ("allowedAccounts", Some (allowed_accounts_to_yojson x.allowed_accounts)) ]

let boolean__to_yojson = bool_to_yojson
let property_description_to_yojson = string_to_yojson

let action_type_property_to_yojson (x : action_type_property) =
  assoc_to_yojson
    [
      ("description", option_to_yojson property_description_to_yojson x.description);
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("noEcho", Some (boolean__to_yojson x.no_echo));
      ("key", Some (boolean__to_yojson x.key));
      ("optional", Some (boolean__to_yojson x.optional));
      ("name", Some (action_configuration_key_to_yojson x.name));
    ]

let action_type_properties_to_yojson tree = list_to_yojson action_type_property_to_yojson tree

let action_type_urls_to_yojson (x : action_type_urls) =
  assoc_to_yojson
    [
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("configurationUrl", option_to_yojson url_to_yojson x.configuration_url);
    ]

let action_type_declaration_to_yojson (x : action_type_declaration) =
  assoc_to_yojson
    [
      ("urls", option_to_yojson action_type_urls_to_yojson x.urls);
      ("properties", option_to_yojson action_type_properties_to_yojson x.properties);
      ("permissions", option_to_yojson action_type_permissions_to_yojson x.permissions);
      ( "outputArtifactDetails",
        Some (action_type_artifact_details_to_yojson x.output_artifact_details) );
      ( "inputArtifactDetails",
        Some (action_type_artifact_details_to_yojson x.input_artifact_details) );
      ("id", Some (action_type_identifier_to_yojson x.id));
      ("executor", Some (action_type_executor_to_yojson x.executor));
      ("description", option_to_yojson action_type_description_to_yojson x.description);
    ]

let update_action_type_input_to_yojson (x : update_action_type_input) =
  assoc_to_yojson [ ("actionType", Some (action_type_declaration_to_yojson x.action_type)) ]

let request_failed_exception_to_yojson (x : request_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let action_type_not_found_exception_to_yojson (x : action_type_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let untag_resource_output_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tags_exception_to_yojson (x : invalid_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson

let unable_to_rollback_stage_exception_to_yojson (x : unable_to_rollback_stage_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let trigger_type_to_yojson (x : trigger_type) =
  match x with
  | AutomatedRollback -> `String "AutomatedRollback"
  | ManualRollback -> `String "ManualRollback"
  | WebhookV2 -> `String "WebhookV2"
  | PutActionRevision -> `String "PutActionRevision"
  | CloudWatchEvent -> `String "CloudWatchEvent"
  | Webhook -> `String "Webhook"
  | PollForSourceChanges -> `String "PollForSourceChanges"
  | StartPipelineExecution -> `String "StartPipelineExecution"
  | CreatePipeline -> `String "CreatePipeline"

let trigger_detail_to_yojson = string_to_yojson
let enabled_to_yojson = bool_to_yojson
let last_changed_by_to_yojson = string_to_yojson
let last_changed_at_to_yojson = timestamp_epoch_seconds_to_yojson
let disabled_reason_to_yojson = string_to_yojson

let transition_state_to_yojson (x : transition_state) =
  assoc_to_yojson
    [
      ("disabledReason", option_to_yojson disabled_reason_to_yojson x.disabled_reason);
      ("lastChangedAt", option_to_yojson last_changed_at_to_yojson x.last_changed_at);
      ("lastChangedBy", option_to_yojson last_changed_by_to_yojson x.last_changed_by);
      ("enabled", option_to_yojson enabled_to_yojson x.enabled);
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let time_to_yojson = timestamp_epoch_seconds_to_yojson
let client_id_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let third_party_job_to_yojson (x : third_party_job) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
      ("clientId", option_to_yojson client_id_to_yojson x.client_id);
    ]

let third_party_job_list_to_yojson tree = list_to_yojson third_party_job_to_yojson tree
let third_party_job_id_to_yojson = string_to_yojson

let action_configuration_to_yojson (x : action_configuration) =
  assoc_to_yojson
    [ ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration) ]

let stage_context_to_yojson (x : stage_context) =
  assoc_to_yojson [ ("name", option_to_yojson stage_name_to_yojson x.name) ]

let action_execution_id_to_yojson = string_to_yojson

let action_context_to_yojson (x : action_context) =
  assoc_to_yojson
    [
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
      ("name", option_to_yojson action_name_to_yojson x.name);
    ]

let pipeline_arn_to_yojson = string_to_yojson
let pipeline_execution_id_to_yojson = string_to_yojson

let pipeline_context_to_yojson (x : pipeline_context) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("pipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("action", option_to_yojson action_context_to_yojson x.action);
      ("stage", option_to_yojson stage_context_to_yojson x.stage);
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
    ]

let revision_to_yojson = string_to_yojson

let artifact_location_type_to_yojson (x : artifact_location_type) =
  match x with S3 -> `String "S3"

let s3_bucket_name_to_yojson = string_to_yojson
let s3_object_key_to_yojson = string_to_yojson

let s3_artifact_location_to_yojson (x : s3_artifact_location) =
  assoc_to_yojson
    [
      ("objectKey", Some (s3_object_key_to_yojson x.object_key));
      ("bucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
    ]

let artifact_location_to_yojson (x : artifact_location) =
  assoc_to_yojson
    [
      ("s3Location", option_to_yojson s3_artifact_location_to_yojson x.s3_location);
      ("type", option_to_yojson artifact_location_type_to_yojson x.type_);
    ]

let artifact_to_yojson (x : artifact) =
  assoc_to_yojson
    [
      ("location", option_to_yojson artifact_location_to_yojson x.location);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("name", option_to_yojson artifact_name_to_yojson x.name);
    ]

let artifact_list_to_yojson tree = list_to_yojson artifact_to_yojson tree
let access_key_id_to_yojson = string_to_yojson
let secret_access_key_to_yojson = string_to_yojson
let session_token_to_yojson = string_to_yojson

let aws_session_credentials_to_yojson (x : aws_session_credentials) =
  assoc_to_yojson
    [
      ("sessionToken", Some (session_token_to_yojson x.session_token));
      ("secretAccessKey", Some (secret_access_key_to_yojson x.secret_access_key));
      ("accessKeyId", Some (access_key_id_to_yojson x.access_key_id));
    ]

let continuation_token_to_yojson = string_to_yojson

let third_party_job_data_to_yojson (x : third_party_job_data) =
  assoc_to_yojson
    [
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ( "artifactCredentials",
        option_to_yojson aws_session_credentials_to_yojson x.artifact_credentials );
      ("outputArtifacts", option_to_yojson artifact_list_to_yojson x.output_artifacts);
      ("inputArtifacts", option_to_yojson artifact_list_to_yojson x.input_artifacts);
      ("pipelineContext", option_to_yojson pipeline_context_to_yojson x.pipeline_context);
      ("actionConfiguration", option_to_yojson action_configuration_to_yojson x.action_configuration);
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
    ]

let nonce_to_yojson = string_to_yojson

let third_party_job_details_to_yojson (x : third_party_job_details) =
  assoc_to_yojson
    [
      ("nonce", option_to_yojson nonce_to_yojson x.nonce);
      ("data", option_to_yojson third_party_job_data_to_yojson x.data);
      ("id", option_to_yojson third_party_job_id_to_yojson x.id);
    ]

let target_filter_value_to_yojson = string_to_yojson
let target_filter_value_list_to_yojson tree = list_to_yojson target_filter_value_to_yojson tree

let target_filter_name_to_yojson (x : target_filter_name) =
  match x with TARGET_STATUS -> `String "TARGET_STATUS"

let target_filter_to_yojson (x : target_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson target_filter_value_list_to_yojson x.values);
      ("name", option_to_yojson target_filter_name_to_yojson x.name);
    ]

let target_filter_list_to_yojson tree = list_to_yojson target_filter_to_yojson tree
let tag_resource_output_to_yojson = unit_to_yojson

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let succeeded_in_stage_filter_to_yojson (x : succeeded_in_stage_filter) =
  assoc_to_yojson [ ("stageName", option_to_yojson stage_name_to_yojson x.stage_name) ]

let stop_pipeline_execution_reason_to_yojson = string_to_yojson

let stop_pipeline_execution_output_to_yojson (x : stop_pipeline_execution_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let stop_pipeline_execution_input_to_yojson (x : stop_pipeline_execution_input) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson stop_pipeline_execution_reason_to_yojson x.reason);
      ("abandon", option_to_yojson boolean__to_yojson x.abandon);
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let pipeline_not_found_exception_to_yojson (x : pipeline_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_execution_not_stoppable_exception_to_yojson
    (x : pipeline_execution_not_stoppable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let duplicated_stop_request_exception_to_yojson (x : duplicated_stop_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let stop_execution_trigger_to_yojson (x : stop_execution_trigger) =
  assoc_to_yojson [ ("reason", option_to_yojson stop_pipeline_execution_reason_to_yojson x.reason) ]

let start_time_range_to_yojson (x : start_time_range) =
  match x with All -> `String "All" | Latest -> `String "Latest"

let start_pipeline_execution_output_to_yojson (x : start_pipeline_execution_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let pipeline_variable_to_yojson (x : pipeline_variable) =
  assoc_to_yojson
    [
      ("value", Some (pipeline_variable_value_to_yojson x.value));
      ("name", Some (pipeline_variable_name_to_yojson x.name));
    ]

let pipeline_variable_list_to_yojson tree = list_to_yojson pipeline_variable_to_yojson tree
let client_request_token_to_yojson = string_to_yojson

let source_revision_type_to_yojson (x : source_revision_type) =
  match x with
  | S3_OBJECT_KEY -> `String "S3_OBJECT_KEY"
  | S3_OBJECT_VERSION_ID -> `String "S3_OBJECT_VERSION_ID"
  | IMAGE_DIGEST -> `String "IMAGE_DIGEST"
  | COMMIT_ID -> `String "COMMIT_ID"

let source_revision_override_to_yojson (x : source_revision_override) =
  assoc_to_yojson
    [
      ("revisionValue", Some (revision_to_yojson x.revision_value));
      ("revisionType", Some (source_revision_type_to_yojson x.revision_type));
      ("actionName", Some (action_name_to_yojson x.action_name));
    ]

let source_revision_override_list_to_yojson tree =
  list_to_yojson source_revision_override_to_yojson tree

let start_pipeline_execution_input_to_yojson (x : start_pipeline_execution_input) =
  assoc_to_yojson
    [
      ( "sourceRevisions",
        option_to_yojson source_revision_override_list_to_yojson x.source_revisions );
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("variables", option_to_yojson pipeline_variable_list_to_yojson x.variables);
      ("name", Some (pipeline_name_to_yojson x.name));
    ]

let concurrent_pipeline_executions_limit_exceeded_exception_to_yojson
    (x : concurrent_pipeline_executions_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let stage_transition_type_to_yojson (x : stage_transition_type) =
  match x with Outbound -> `String "Outbound" | Inbound -> `String "Inbound"

let stage_execution_status_to_yojson (x : stage_execution_status) =
  match x with
  | Skipped -> `String "Skipped"
  | Succeeded -> `String "Succeeded"
  | Stopping -> `String "Stopping"
  | Stopped -> `String "Stopped"
  | Failed -> `String "Failed"
  | InProgress -> `String "InProgress"
  | Cancelled -> `String "Cancelled"

let execution_type_to_yojson (x : execution_type) =
  match x with ROLLBACK -> `String "ROLLBACK" | STANDARD -> `String "STANDARD"

let stage_execution_to_yojson (x : stage_execution) =
  assoc_to_yojson
    [
      ("type", option_to_yojson execution_type_to_yojson x.type_);
      ("status", Some (stage_execution_status_to_yojson x.status));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
    ]

let stage_execution_list_to_yojson tree = list_to_yojson stage_execution_to_yojson tree
let revision_change_identifier_to_yojson = string_to_yojson

let action_revision_to_yojson (x : action_revision) =
  assoc_to_yojson
    [
      ("created", Some (timestamp_to_yojson x.created));
      ("revisionChangeId", Some (revision_change_identifier_to_yojson x.revision_change_id));
      ("revisionId", Some (revision_to_yojson x.revision_id));
    ]

let action_execution_status_to_yojson (x : action_execution_status) =
  match x with
  | Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"
  | Abandoned -> `String "Abandoned"
  | InProgress -> `String "InProgress"

let execution_summary_to_yojson = string_to_yojson
let action_execution_token_to_yojson = string_to_yojson
let last_updated_by_to_yojson = string_to_yojson
let execution_id_to_yojson = string_to_yojson
let percentage_to_yojson = int_to_yojson
let code_to_yojson = string_to_yojson

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("code", option_to_yojson code_to_yojson x.code);
    ]

let log_stream_ar_n_to_yojson = string_to_yojson

let action_execution_to_yojson (x : action_execution) =
  assoc_to_yojson
    [
      ("logStreamARN", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_ar_n);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("percentComplete", option_to_yojson percentage_to_yojson x.percent_complete);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("lastUpdatedBy", option_to_yojson last_updated_by_to_yojson x.last_updated_by);
      ("token", option_to_yojson action_execution_token_to_yojson x.token);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("status", option_to_yojson action_execution_status_to_yojson x.status);
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
    ]

let action_state_to_yojson (x : action_state) =
  assoc_to_yojson
    [
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
      ("entityUrl", option_to_yojson url_to_yojson x.entity_url);
      ("latestExecution", option_to_yojson action_execution_to_yojson x.latest_execution);
      ("currentRevision", option_to_yojson action_revision_to_yojson x.current_revision);
      ("actionName", option_to_yojson action_name_to_yojson x.action_name);
    ]

let action_state_list_to_yojson tree = list_to_yojson action_state_to_yojson tree

let condition_execution_status_to_yojson (x : condition_execution_status) =
  match x with
  | Overridden -> `String "Overridden"
  | Abandoned -> `String "Abandoned"
  | Cancelled -> `String "Cancelled"
  | Succeeded -> `String "Succeeded"
  | Errored -> `String "Errored"
  | Failed -> `String "Failed"
  | InProgress -> `String "InProgress"

let stage_conditions_execution_to_yojson (x : stage_conditions_execution) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("status", option_to_yojson condition_execution_status_to_yojson x.status);
    ]

let condition_execution_to_yojson (x : condition_execution) =
  assoc_to_yojson
    [
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("status", option_to_yojson condition_execution_status_to_yojson x.status);
    ]

let rule_revision_to_yojson (x : rule_revision) =
  assoc_to_yojson
    [
      ("created", Some (timestamp_to_yojson x.created));
      ("revisionChangeId", Some (revision_change_identifier_to_yojson x.revision_change_id));
      ("revisionId", Some (revision_to_yojson x.revision_id));
    ]

let rule_execution_id_to_yojson = string_to_yojson

let rule_execution_status_to_yojson (x : rule_execution_status) =
  match x with
  | Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"
  | Abandoned -> `String "Abandoned"
  | InProgress -> `String "InProgress"

let rule_execution_token_to_yojson = string_to_yojson

let rule_execution_to_yojson (x : rule_execution) =
  assoc_to_yojson
    [
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("lastUpdatedBy", option_to_yojson last_updated_by_to_yojson x.last_updated_by);
      ("token", option_to_yojson rule_execution_token_to_yojson x.token);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("status", option_to_yojson rule_execution_status_to_yojson x.status);
      ("ruleExecutionId", option_to_yojson rule_execution_id_to_yojson x.rule_execution_id);
    ]

let rule_state_to_yojson (x : rule_state) =
  assoc_to_yojson
    [
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
      ("entityUrl", option_to_yojson url_to_yojson x.entity_url);
      ("latestExecution", option_to_yojson rule_execution_to_yojson x.latest_execution);
      ("currentRevision", option_to_yojson rule_revision_to_yojson x.current_revision);
      ("ruleName", option_to_yojson rule_name_to_yojson x.rule_name);
    ]

let rule_state_list_to_yojson tree = list_to_yojson rule_state_to_yojson tree

let condition_state_to_yojson (x : condition_state) =
  assoc_to_yojson
    [
      ("ruleStates", option_to_yojson rule_state_list_to_yojson x.rule_states);
      ("latestExecution", option_to_yojson condition_execution_to_yojson x.latest_execution);
    ]

let condition_state_list_to_yojson tree = list_to_yojson condition_state_to_yojson tree

let stage_condition_state_to_yojson (x : stage_condition_state) =
  assoc_to_yojson
    [
      ("conditionStates", option_to_yojson condition_state_list_to_yojson x.condition_states);
      ("latestExecution", option_to_yojson stage_conditions_execution_to_yojson x.latest_execution);
    ]

let retry_attempt_to_yojson = int_to_yojson

let retry_trigger_to_yojson (x : retry_trigger) =
  match x with
  | ManualStageRetry -> `String "ManualStageRetry"
  | AutomatedStageRetry -> `String "AutomatedStageRetry"

let retry_stage_metadata_to_yojson (x : retry_stage_metadata) =
  assoc_to_yojson
    [
      ("latestRetryTrigger", option_to_yojson retry_trigger_to_yojson x.latest_retry_trigger);
      ( "manualStageRetryAttempt",
        option_to_yojson retry_attempt_to_yojson x.manual_stage_retry_attempt );
      ("autoStageRetryAttempt", option_to_yojson retry_attempt_to_yojson x.auto_stage_retry_attempt);
    ]

let stage_state_to_yojson (x : stage_state) =
  assoc_to_yojson
    [
      ("retryStageMetadata", option_to_yojson retry_stage_metadata_to_yojson x.retry_stage_metadata);
      ( "onFailureConditionState",
        option_to_yojson stage_condition_state_to_yojson x.on_failure_condition_state );
      ( "onSuccessConditionState",
        option_to_yojson stage_condition_state_to_yojson x.on_success_condition_state );
      ( "beforeEntryConditionState",
        option_to_yojson stage_condition_state_to_yojson x.before_entry_condition_state );
      ("latestExecution", option_to_yojson stage_execution_to_yojson x.latest_execution);
      ("actionStates", option_to_yojson action_state_list_to_yojson x.action_states);
      ( "inboundTransitionState",
        option_to_yojson transition_state_to_yojson x.inbound_transition_state );
      ("inboundExecutions", option_to_yojson stage_execution_list_to_yojson x.inbound_executions);
      ("inboundExecution", option_to_yojson stage_execution_to_yojson x.inbound_execution);
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
    ]

let stage_state_list_to_yojson tree = list_to_yojson stage_state_to_yojson tree

let stage_not_retryable_exception_to_yojson (x : stage_not_retryable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let stage_not_found_exception_to_yojson (x : stage_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let revision_summary_to_yojson = string_to_yojson

let source_revision_to_yojson (x : source_revision) =
  assoc_to_yojson
    [
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
      ("revisionId", option_to_yojson revision_to_yojson x.revision_id);
      ("actionName", Some (action_name_to_yojson x.action_name));
    ]

let source_revision_list_to_yojson tree = list_to_yojson source_revision_to_yojson tree
let s3_bucket_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("key", option_to_yojson s3_key_to_yojson x.key);
      ("bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let rule_type_settings_to_yojson (x : rule_type_settings) =
  assoc_to_yojson
    [
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("thirdPartyConfigurationUrl", option_to_yojson url_to_yojson x.third_party_configuration_url);
    ]

let description_to_yojson = string_to_yojson

let rule_configuration_property_type_to_yojson (x : rule_configuration_property_type) =
  match x with
  | Boolean -> `String "Boolean"
  | Number -> `String "Number"
  | String -> `String "String"

let rule_configuration_property_to_yojson (x : rule_configuration_property) =
  assoc_to_yojson
    [
      ("type", option_to_yojson rule_configuration_property_type_to_yojson x.type_);
      ("description", option_to_yojson description_to_yojson x.description);
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("secret", Some (boolean__to_yojson x.secret));
      ("key", Some (boolean__to_yojson x.key));
      ("required", Some (boolean__to_yojson x.required));
      ("name", Some (rule_configuration_key_to_yojson x.name));
    ]

let rule_configuration_property_list_to_yojson tree =
  list_to_yojson rule_configuration_property_to_yojson tree

let minimum_artifact_count_to_yojson = int_to_yojson
let maximum_artifact_count_to_yojson = int_to_yojson

let artifact_details_to_yojson (x : artifact_details) =
  assoc_to_yojson
    [
      ("maximumCount", Some (maximum_artifact_count_to_yojson x.maximum_count));
      ("minimumCount", Some (minimum_artifact_count_to_yojson x.minimum_count));
    ]

let rule_type_to_yojson (x : rule_type) =
  assoc_to_yojson
    [
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
      ( "ruleConfigurationProperties",
        option_to_yojson rule_configuration_property_list_to_yojson x.rule_configuration_properties
      );
      ("settings", option_to_yojson rule_type_settings_to_yojson x.settings);
      ("id", Some (rule_type_id_to_yojson x.id));
    ]

let rule_type_list_to_yojson tree = list_to_yojson rule_type_to_yojson tree
let external_execution_id_to_yojson = string_to_yojson
let external_execution_summary_to_yojson = string_to_yojson

let rule_execution_result_to_yojson (x : rule_execution_result) =
  assoc_to_yojson
    [
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ( "externalExecutionSummary",
        option_to_yojson external_execution_summary_to_yojson x.external_execution_summary );
      ( "externalExecutionId",
        option_to_yojson external_execution_id_to_yojson x.external_execution_id );
    ]

let rule_execution_output_to_yojson (x : rule_execution_output) =
  assoc_to_yojson
    [ ("executionResult", option_to_yojson rule_execution_result_to_yojson x.execution_result) ]

let resolved_rule_configuration_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let artifact_detail_to_yojson (x : artifact_detail) =
  assoc_to_yojson
    [
      ("s3location", option_to_yojson s3_location_to_yojson x.s3location);
      ("name", option_to_yojson artifact_name_to_yojson x.name);
    ]

let artifact_detail_list_to_yojson tree = list_to_yojson artifact_detail_to_yojson tree

let rule_execution_input_to_yojson (x : rule_execution_input) =
  assoc_to_yojson
    [
      ("inputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.input_artifacts);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "resolvedConfiguration",
        option_to_yojson resolved_rule_configuration_map_to_yojson x.resolved_configuration );
      ("configuration", option_to_yojson rule_configuration_map_to_yojson x.configuration);
      ("ruleTypeId", option_to_yojson rule_type_id_to_yojson x.rule_type_id);
    ]

let latest_in_pipeline_execution_filter_to_yojson (x : latest_in_pipeline_execution_filter) =
  assoc_to_yojson
    [
      ("startTimeRange", Some (start_time_range_to_yojson x.start_time_range));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
    ]

let rule_execution_filter_to_yojson (x : rule_execution_filter) =
  assoc_to_yojson
    [
      ( "latestInPipelineExecution",
        option_to_yojson latest_in_pipeline_execution_filter_to_yojson
          x.latest_in_pipeline_execution );
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let rule_execution_detail_to_yojson (x : rule_execution_detail) =
  assoc_to_yojson
    [
      ("output", option_to_yojson rule_execution_output_to_yojson x.output);
      ("input", option_to_yojson rule_execution_input_to_yojson x.input);
      ("status", option_to_yojson rule_execution_status_to_yojson x.status);
      ("updatedBy", option_to_yojson last_updated_by_to_yojson x.updated_by);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("ruleName", option_to_yojson rule_name_to_yojson x.rule_name);
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("ruleExecutionId", option_to_yojson rule_execution_id_to_yojson x.rule_execution_id);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let rule_execution_detail_list_to_yojson tree = list_to_yojson rule_execution_detail_to_yojson tree

let rollback_stage_output_to_yojson (x : rollback_stage_output) =
  assoc_to_yojson
    [ ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id)) ]

let rollback_stage_input_to_yojson (x : rollback_stage_input) =
  assoc_to_yojson
    [
      ( "targetPipelineExecutionId",
        Some (pipeline_execution_id_to_yojson x.target_pipeline_execution_id) );
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let pipeline_execution_outdated_exception_to_yojson (x : pipeline_execution_outdated_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_execution_not_found_exception_to_yojson (x : pipeline_execution_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let retry_stage_execution_output_to_yojson (x : retry_stage_execution_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let retry_stage_execution_input_to_yojson (x : retry_stage_execution_input) =
  assoc_to_yojson
    [
      ("retryMode", Some (stage_retry_mode_to_yojson x.retry_mode));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let not_latest_pipeline_execution_exception_to_yojson (x : not_latest_pipeline_execution_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resolved_pipeline_variable_to_yojson (x : resolved_pipeline_variable) =
  assoc_to_yojson
    [
      ("resolvedValue", option_to_yojson string__to_yojson x.resolved_value);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let resolved_pipeline_variable_list_to_yojson tree =
  list_to_yojson resolved_pipeline_variable_to_yojson tree

let resolved_action_configuration_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let register_webhook_with_third_party_output_to_yojson = unit_to_yojson

let register_webhook_with_third_party_input_to_yojson (x : register_webhook_with_third_party_input)
    =
  assoc_to_yojson [ ("webhookName", option_to_yojson webhook_name_to_yojson x.webhook_name) ]

let action_configuration_queryable_value_to_yojson = string_to_yojson

let query_param_map_to_yojson tree =
  map_to_yojson action_configuration_key_to_yojson action_configuration_queryable_value_to_yojson
    tree

let put_webhook_output_to_yojson (x : put_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson list_webhook_item_to_yojson x.webhook) ]

let put_webhook_input_to_yojson (x : put_webhook_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("webhook", Some (webhook_definition_to_yojson x.webhook));
    ]

let invalid_webhook_filter_pattern_exception_to_yojson
    (x : invalid_webhook_filter_pattern_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_webhook_authentication_parameters_exception_to_yojson
    (x : invalid_webhook_authentication_parameters_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let client_token_to_yojson = string_to_yojson

let current_revision_to_yojson (x : current_revision) =
  assoc_to_yojson
    [
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
      ("created", option_to_yojson time_to_yojson x.created);
      ("changeIdentifier", Some (revision_change_identifier_to_yojson x.change_identifier));
      ("revision", Some (revision_to_yojson x.revision));
    ]

let execution_details_to_yojson (x : execution_details) =
  assoc_to_yojson
    [
      ("percentComplete", option_to_yojson percentage_to_yojson x.percent_complete);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
    ]

let put_third_party_job_success_result_input_to_yojson
    (x : put_third_party_job_success_result_input) =
  assoc_to_yojson
    [
      ("executionDetails", option_to_yojson execution_details_to_yojson x.execution_details);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("currentRevision", option_to_yojson current_revision_to_yojson x.current_revision);
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
    ]

let job_not_found_exception_to_yojson (x : job_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_job_state_exception_to_yojson (x : invalid_job_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_client_token_exception_to_yojson (x : invalid_client_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let failure_type_to_yojson (x : failure_type) =
  match x with
  | SystemUnavailable -> `String "SystemUnavailable"
  | RevisionUnavailable -> `String "RevisionUnavailable"
  | RevisionOutOfSync -> `String "RevisionOutOfSync"
  | PermissionError -> `String "PermissionError"
  | ConfigurationError -> `String "ConfigurationError"
  | JobFailed -> `String "JobFailed"

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("message", Some (message_to_yojson x.message));
      ("type", Some (failure_type_to_yojson x.type_));
    ]

let put_third_party_job_failure_result_input_to_yojson
    (x : put_third_party_job_failure_result_input) =
  assoc_to_yojson
    [
      ("failureDetails", Some (failure_details_to_yojson x.failure_details));
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
    ]

let output_variables_value_to_yojson = string_to_yojson
let output_variables_key_to_yojson = string_to_yojson

let output_variables_map_to_yojson tree =
  map_to_yojson output_variables_key_to_yojson output_variables_value_to_yojson tree

let put_job_success_result_input_to_yojson (x : put_job_success_result_input) =
  assoc_to_yojson
    [
      ("outputVariables", option_to_yojson output_variables_map_to_yojson x.output_variables);
      ("executionDetails", option_to_yojson execution_details_to_yojson x.execution_details);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("currentRevision", option_to_yojson current_revision_to_yojson x.current_revision);
      ("jobId", Some (job_id_to_yojson x.job_id));
    ]

let output_variables_size_exceeded_exception_to_yojson
    (x : output_variables_size_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_job_failure_result_input_to_yojson (x : put_job_failure_result_input) =
  assoc_to_yojson
    [
      ("failureDetails", Some (failure_details_to_yojson x.failure_details));
      ("jobId", Some (job_id_to_yojson x.job_id));
    ]

let put_approval_result_output_to_yojson (x : put_approval_result_output) =
  assoc_to_yojson [ ("approvedAt", option_to_yojson timestamp_to_yojson x.approved_at) ]

let approval_summary_to_yojson = string_to_yojson

let approval_status_to_yojson (x : approval_status) =
  match x with Rejected -> `String "Rejected" | Approved -> `String "Approved"

let approval_result_to_yojson (x : approval_result) =
  assoc_to_yojson
    [
      ("status", Some (approval_status_to_yojson x.status));
      ("summary", Some (approval_summary_to_yojson x.summary));
    ]

let approval_token_to_yojson = string_to_yojson

let put_approval_result_input_to_yojson (x : put_approval_result_input) =
  assoc_to_yojson
    [
      ("token", Some (approval_token_to_yojson x.token));
      ("result", Some (approval_result_to_yojson x.result_));
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let invalid_approval_token_exception_to_yojson (x : invalid_approval_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_already_completed_exception_to_yojson (x : approval_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let action_not_found_exception_to_yojson (x : action_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_action_revision_output_to_yojson (x : put_action_revision_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("newRevision", option_to_yojson boolean__to_yojson x.new_revision);
    ]

let put_action_revision_input_to_yojson (x : put_action_revision_input) =
  assoc_to_yojson
    [
      ("actionRevision", Some (action_revision_to_yojson x.action_revision));
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let poll_for_third_party_jobs_output_to_yojson (x : poll_for_third_party_jobs_output) =
  assoc_to_yojson [ ("jobs", option_to_yojson third_party_job_list_to_yojson x.jobs) ]

let max_batch_size_to_yojson = int_to_yojson

let poll_for_third_party_jobs_input_to_yojson (x : poll_for_third_party_jobs_input) =
  assoc_to_yojson
    [
      ("maxBatchSize", option_to_yojson max_batch_size_to_yojson x.max_batch_size);
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
    ]

let job_data_to_yojson (x : job_data) =
  assoc_to_yojson
    [
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ( "artifactCredentials",
        option_to_yojson aws_session_credentials_to_yojson x.artifact_credentials );
      ("outputArtifacts", option_to_yojson artifact_list_to_yojson x.output_artifacts);
      ("inputArtifacts", option_to_yojson artifact_list_to_yojson x.input_artifacts);
      ("pipelineContext", option_to_yojson pipeline_context_to_yojson x.pipeline_context);
      ("actionConfiguration", option_to_yojson action_configuration_to_yojson x.action_configuration);
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
    ]

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("nonce", option_to_yojson nonce_to_yojson x.nonce);
      ("data", option_to_yojson job_data_to_yojson x.data);
      ("id", option_to_yojson job_id_to_yojson x.id);
    ]

let job_list_to_yojson tree = list_to_yojson job_to_yojson tree

let poll_for_jobs_output_to_yojson (x : poll_for_jobs_output) =
  assoc_to_yojson [ ("jobs", option_to_yojson job_list_to_yojson x.jobs) ]

let poll_for_jobs_input_to_yojson (x : poll_for_jobs_input) =
  assoc_to_yojson
    [
      ("queryParam", option_to_yojson query_param_map_to_yojson x.query_param);
      ("maxBatchSize", option_to_yojson max_batch_size_to_yojson x.max_batch_size);
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
    ]

let pipeline_version_not_found_exception_to_yojson (x : pipeline_version_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_summary_to_yojson (x : pipeline_summary) =
  assoc_to_yojson
    [
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("pipelineType", option_to_yojson pipeline_type_to_yojson x.pipeline_type);
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
      ("name", option_to_yojson pipeline_name_to_yojson x.name);
    ]

let pipeline_rollback_metadata_to_yojson (x : pipeline_rollback_metadata) =
  assoc_to_yojson
    [
      ( "rollbackTargetPipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.rollback_target_pipeline_execution_id );
    ]

let pipeline_name_in_use_exception_to_yojson (x : pipeline_name_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_metadata_to_yojson (x : pipeline_metadata) =
  assoc_to_yojson
    [
      ("pollingDisabledAt", option_to_yojson timestamp_to_yojson x.polling_disabled_at);
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("pipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_list_to_yojson tree = list_to_yojson pipeline_summary_to_yojson tree

let pipeline_execution_status_to_yojson (x : pipeline_execution_status) =
  match x with
  | Failed -> `String "Failed"
  | Superseded -> `String "Superseded"
  | Succeeded -> `String "Succeeded"
  | Stopping -> `String "Stopping"
  | Stopped -> `String "Stopped"
  | InProgress -> `String "InProgress"
  | Cancelled -> `String "Cancelled"

let pipeline_execution_status_summary_to_yojson = string_to_yojson

let execution_trigger_to_yojson (x : execution_trigger) =
  assoc_to_yojson
    [
      ("triggerDetail", option_to_yojson trigger_detail_to_yojson x.trigger_detail);
      ("triggerType", option_to_yojson trigger_type_to_yojson x.trigger_type);
    ]

let pipeline_execution_summary_to_yojson (x : pipeline_execution_summary) =
  assoc_to_yojson
    [
      ("rollbackMetadata", option_to_yojson pipeline_rollback_metadata_to_yojson x.rollback_metadata);
      ("executionType", option_to_yojson execution_type_to_yojson x.execution_type);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("stopTrigger", option_to_yojson stop_execution_trigger_to_yojson x.stop_trigger);
      ("trigger", option_to_yojson execution_trigger_to_yojson x.trigger);
      ("sourceRevisions", option_to_yojson source_revision_list_to_yojson x.source_revisions);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "statusSummary",
        option_to_yojson pipeline_execution_status_summary_to_yojson x.status_summary );
      ("status", option_to_yojson pipeline_execution_status_to_yojson x.status);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let pipeline_execution_summary_list_to_yojson tree =
  list_to_yojson pipeline_execution_summary_to_yojson tree

let pipeline_execution_filter_to_yojson (x : pipeline_execution_filter) =
  assoc_to_yojson
    [
      ("succeededInStage", option_to_yojson succeeded_in_stage_filter_to_yojson x.succeeded_in_stage);
    ]

let artifact_revision_to_yojson (x : artifact_revision) =
  assoc_to_yojson
    [
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
      ( "revisionChangeIdentifier",
        option_to_yojson revision_change_identifier_to_yojson x.revision_change_identifier );
      ("revisionId", option_to_yojson revision_to_yojson x.revision_id);
      ("name", option_to_yojson artifact_name_to_yojson x.name);
    ]

let artifact_revision_list_to_yojson tree = list_to_yojson artifact_revision_to_yojson tree

let pipeline_execution_to_yojson (x : pipeline_execution) =
  assoc_to_yojson
    [
      ("rollbackMetadata", option_to_yojson pipeline_rollback_metadata_to_yojson x.rollback_metadata);
      ("executionType", option_to_yojson execution_type_to_yojson x.execution_type);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("trigger", option_to_yojson execution_trigger_to_yojson x.trigger);
      ("variables", option_to_yojson resolved_pipeline_variable_list_to_yojson x.variables);
      ("artifactRevisions", option_to_yojson artifact_revision_list_to_yojson x.artifact_revisions);
      ( "statusSummary",
        option_to_yojson pipeline_execution_status_summary_to_yojson x.status_summary );
      ("status", option_to_yojson pipeline_execution_status_to_yojson x.status);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
    ]

let condition_type_to_yojson (x : condition_type) =
  match x with ON_SUCCESS -> `String "ON_SUCCESS" | BEFORE_ENTRY -> `String "BEFORE_ENTRY"

let override_stage_condition_input_to_yojson (x : override_stage_condition_input) =
  assoc_to_yojson
    [
      ("conditionType", Some (condition_type_to_yojson x.condition_type));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let condition_not_overridable_exception_to_yojson (x : condition_not_overridable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson
let max_pipelines_to_yojson = int_to_yojson

let list_webhooks_output_to_yojson (x : list_webhooks_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("webhooks", option_to_yojson webhook_list_to_yojson x.webhooks);
    ]

let list_webhooks_input_to_yojson (x : list_webhooks_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let list_rule_types_output_to_yojson (x : list_rule_types_output) =
  assoc_to_yojson [ ("ruleTypes", Some (rule_type_list_to_yojson x.rule_types)) ]

let list_rule_types_input_to_yojson (x : list_rule_types_input) =
  assoc_to_yojson
    [
      ("regionFilter", option_to_yojson aws_region_name_to_yojson x.region_filter);
      ("ruleOwnerFilter", option_to_yojson rule_owner_to_yojson x.rule_owner_filter);
    ]

let list_rule_executions_output_to_yojson (x : list_rule_executions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ruleExecutionDetails",
        option_to_yojson rule_execution_detail_list_to_yojson x.rule_execution_details );
    ]

let list_rule_executions_input_to_yojson (x : list_rule_executions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson rule_execution_filter_to_yojson x.filter);
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let list_pipelines_output_to_yojson (x : list_pipelines_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("pipelines", option_to_yojson pipeline_list_to_yojson x.pipelines);
    ]

let list_pipelines_input_to_yojson (x : list_pipelines_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_pipelines_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_pipeline_executions_output_to_yojson (x : list_pipeline_executions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "pipelineExecutionSummaries",
        option_to_yojson pipeline_execution_summary_list_to_yojson x.pipeline_execution_summaries );
    ]

let list_pipeline_executions_input_to_yojson (x : list_pipeline_executions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filter", option_to_yojson pipeline_execution_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let deploy_target_event_context_to_yojson (x : deploy_target_event_context) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("ssmCommandId", option_to_yojson string__to_yojson x.ssm_command_id);
    ]

let deploy_target_event_to_yojson (x : deploy_target_event) =
  assoc_to_yojson
    [
      ("context", option_to_yojson deploy_target_event_context_to_yojson x.context);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("status", option_to_yojson string__to_yojson x.status);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let deploy_target_event_list_to_yojson tree = list_to_yojson deploy_target_event_to_yojson tree

let deploy_action_execution_target_to_yojson (x : deploy_action_execution_target) =
  assoc_to_yojson
    [
      ("events", option_to_yojson deploy_target_event_list_to_yojson x.events);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("status", option_to_yojson string__to_yojson x.status);
      ("targetType", option_to_yojson string__to_yojson x.target_type);
      ("targetId", option_to_yojson string__to_yojson x.target_id);
    ]

let deploy_action_execution_target_list_to_yojson tree =
  list_to_yojson deploy_action_execution_target_to_yojson tree

let list_deploy_action_execution_targets_output_to_yojson
    (x : list_deploy_action_execution_targets_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("targets", option_to_yojson deploy_action_execution_target_list_to_yojson x.targets);
    ]

let list_deploy_action_execution_targets_input_to_yojson
    (x : list_deploy_action_execution_targets_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filters", option_to_yojson target_filter_list_to_yojson x.filters);
      ("actionExecutionId", Some (action_execution_id_to_yojson x.action_execution_id));
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
    ]

let action_execution_not_found_exception_to_yojson (x : action_execution_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let action_type_settings_to_yojson (x : action_type_settings) =
  assoc_to_yojson
    [
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("thirdPartyConfigurationUrl", option_to_yojson url_to_yojson x.third_party_configuration_url);
    ]

let action_configuration_property_type_to_yojson (x : action_configuration_property_type) =
  match x with
  | Boolean -> `String "Boolean"
  | Number -> `String "Number"
  | String -> `String "String"

let action_configuration_property_to_yojson (x : action_configuration_property) =
  assoc_to_yojson
    [
      ("type", option_to_yojson action_configuration_property_type_to_yojson x.type_);
      ("description", option_to_yojson description_to_yojson x.description);
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("secret", Some (boolean__to_yojson x.secret));
      ("key", Some (boolean__to_yojson x.key));
      ("required", Some (boolean__to_yojson x.required));
      ("name", Some (action_configuration_key_to_yojson x.name));
    ]

let action_configuration_property_list_to_yojson tree =
  list_to_yojson action_configuration_property_to_yojson tree

let action_type_to_yojson (x : action_type) =
  assoc_to_yojson
    [
      ("outputArtifactDetails", Some (artifact_details_to_yojson x.output_artifact_details));
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
      ( "actionConfigurationProperties",
        option_to_yojson action_configuration_property_list_to_yojson
          x.action_configuration_properties );
      ("settings", option_to_yojson action_type_settings_to_yojson x.settings);
      ("id", Some (action_type_id_to_yojson x.id));
    ]

let action_type_list_to_yojson tree = list_to_yojson action_type_to_yojson tree

let list_action_types_output_to_yojson (x : list_action_types_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("actionTypes", Some (action_type_list_to_yojson x.action_types));
    ]

let list_action_types_input_to_yojson (x : list_action_types_input) =
  assoc_to_yojson
    [
      ("regionFilter", option_to_yojson aws_region_name_to_yojson x.region_filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("actionOwnerFilter", option_to_yojson action_owner_to_yojson x.action_owner_filter);
    ]

let action_execution_input_to_yojson (x : action_execution_input) =
  assoc_to_yojson
    [
      ("namespace", option_to_yojson action_namespace_to_yojson x.namespace);
      ("inputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.input_artifacts);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "resolvedConfiguration",
        option_to_yojson resolved_action_configuration_map_to_yojson x.resolved_configuration );
      ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration);
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
    ]

let action_execution_result_to_yojson (x : action_execution_result) =
  assoc_to_yojson
    [
      ("logStreamARN", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_ar_n);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ( "externalExecutionSummary",
        option_to_yojson external_execution_summary_to_yojson x.external_execution_summary );
      ( "externalExecutionId",
        option_to_yojson external_execution_id_to_yojson x.external_execution_id );
    ]

let action_execution_output_to_yojson (x : action_execution_output) =
  assoc_to_yojson
    [
      ("outputVariables", option_to_yojson output_variables_map_to_yojson x.output_variables);
      ("executionResult", option_to_yojson action_execution_result_to_yojson x.execution_result);
      ("outputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.output_artifacts);
    ]

let action_execution_detail_to_yojson (x : action_execution_detail) =
  assoc_to_yojson
    [
      ("output", option_to_yojson action_execution_output_to_yojson x.output);
      ("input", option_to_yojson action_execution_input_to_yojson x.input);
      ("status", option_to_yojson action_execution_status_to_yojson x.status);
      ("updatedBy", option_to_yojson last_updated_by_to_yojson x.updated_by);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("actionName", option_to_yojson action_name_to_yojson x.action_name);
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let action_execution_detail_list_to_yojson tree =
  list_to_yojson action_execution_detail_to_yojson tree

let list_action_executions_output_to_yojson (x : list_action_executions_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "actionExecutionDetails",
        option_to_yojson action_execution_detail_list_to_yojson x.action_execution_details );
    ]

let action_execution_filter_to_yojson (x : action_execution_filter) =
  assoc_to_yojson
    [
      ( "latestInPipelineExecution",
        option_to_yojson latest_in_pipeline_execution_filter_to_yojson
          x.latest_in_pipeline_execution );
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let list_action_executions_input_to_yojson (x : list_action_executions_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson action_execution_filter_to_yojson x.filter);
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let job_status_to_yojson (x : job_status) =
  match x with
  | Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"
  | TimedOut -> `String "TimedOut"
  | InProgress -> `String "InProgress"
  | Dispatched -> `String "Dispatched"
  | Queued -> `String "Queued"
  | Created -> `String "Created"

let job_details_to_yojson (x : job_details) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("data", option_to_yojson job_data_to_yojson x.data);
      ("id", option_to_yojson job_id_to_yojson x.id);
    ]

let invalid_nonce_exception_to_yojson (x : invalid_nonce_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_job_exception_to_yojson (x : invalid_job_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_third_party_job_details_output_to_yojson (x : get_third_party_job_details_output) =
  assoc_to_yojson
    [ ("jobDetails", option_to_yojson third_party_job_details_to_yojson x.job_details) ]

let get_third_party_job_details_input_to_yojson (x : get_third_party_job_details_input) =
  assoc_to_yojson
    [
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
    ]

let get_pipeline_state_output_to_yojson (x : get_pipeline_state_output) =
  assoc_to_yojson
    [
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("stageStates", option_to_yojson stage_state_list_to_yojson x.stage_states);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
    ]

let get_pipeline_state_input_to_yojson (x : get_pipeline_state_input) =
  assoc_to_yojson [ ("name", Some (pipeline_name_to_yojson x.name)) ]

let get_pipeline_output_to_yojson (x : get_pipeline_output) =
  assoc_to_yojson
    [
      ("metadata", option_to_yojson pipeline_metadata_to_yojson x.metadata);
      ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline);
    ]

let get_pipeline_input_to_yojson (x : get_pipeline_input) =
  assoc_to_yojson
    [
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
      ("name", Some (pipeline_name_to_yojson x.name));
    ]

let get_pipeline_execution_output_to_yojson (x : get_pipeline_execution_output) =
  assoc_to_yojson
    [ ("pipelineExecution", option_to_yojson pipeline_execution_to_yojson x.pipeline_execution) ]

let get_pipeline_execution_input_to_yojson (x : get_pipeline_execution_input) =
  assoc_to_yojson
    [
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let get_job_details_output_to_yojson (x : get_job_details_output) =
  assoc_to_yojson [ ("jobDetails", option_to_yojson job_details_to_yojson x.job_details) ]

let get_job_details_input_to_yojson (x : get_job_details_input) =
  assoc_to_yojson [ ("jobId", Some (job_id_to_yojson x.job_id)) ]

let get_action_type_output_to_yojson (x : get_action_type_output) =
  assoc_to_yojson
    [ ("actionType", option_to_yojson action_type_declaration_to_yojson x.action_type) ]

let get_action_type_input_to_yojson (x : get_action_type_input) =
  assoc_to_yojson
    [
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("owner", Some (action_type_owner_to_yojson x.owner));
      ("category", Some (action_category_to_yojson x.category));
    ]

let enable_stage_transition_input_to_yojson (x : enable_stage_transition_input) =
  assoc_to_yojson
    [
      ("transitionType", Some (stage_transition_type_to_yojson x.transition_type));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let disable_stage_transition_input_to_yojson (x : disable_stage_transition_input) =
  assoc_to_yojson
    [
      ("reason", Some (disabled_reason_to_yojson x.reason));
      ("transitionType", Some (stage_transition_type_to_yojson x.transition_type));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let deregister_webhook_with_third_party_output_to_yojson = unit_to_yojson

let deregister_webhook_with_third_party_input_to_yojson
    (x : deregister_webhook_with_third_party_input) =
  assoc_to_yojson [ ("webhookName", option_to_yojson webhook_name_to_yojson x.webhook_name) ]

let delete_webhook_output_to_yojson = unit_to_yojson

let delete_webhook_input_to_yojson (x : delete_webhook_input) =
  assoc_to_yojson [ ("name", Some (webhook_name_to_yojson x.name)) ]

let delete_pipeline_input_to_yojson (x : delete_pipeline_input) =
  assoc_to_yojson [ ("name", Some (pipeline_name_to_yojson x.name)) ]

let delete_custom_action_type_input_to_yojson (x : delete_custom_action_type_input) =
  assoc_to_yojson
    [
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("category", Some (action_category_to_yojson x.category));
    ]

let create_pipeline_output_to_yojson (x : create_pipeline_output) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline);
    ]

let create_pipeline_input_to_yojson (x : create_pipeline_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("pipeline", Some (pipeline_declaration_to_yojson x.pipeline));
    ]

let create_custom_action_type_output_to_yojson (x : create_custom_action_type_output) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("actionType", Some (action_type_to_yojson x.action_type));
    ]

let create_custom_action_type_input_to_yojson (x : create_custom_action_type_input) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("outputArtifactDetails", Some (artifact_details_to_yojson x.output_artifact_details));
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
      ( "configurationProperties",
        option_to_yojson action_configuration_property_list_to_yojson x.configuration_properties );
      ("settings", option_to_yojson action_type_settings_to_yojson x.settings);
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("category", Some (action_category_to_yojson x.category));
    ]

let acknowledge_third_party_job_output_to_yojson (x : acknowledge_third_party_job_output) =
  assoc_to_yojson [ ("status", option_to_yojson job_status_to_yojson x.status) ]

let acknowledge_third_party_job_input_to_yojson (x : acknowledge_third_party_job_input) =
  assoc_to_yojson
    [
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("nonce", Some (nonce_to_yojson x.nonce));
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
    ]

let acknowledge_job_output_to_yojson (x : acknowledge_job_output) =
  assoc_to_yojson [ ("status", option_to_yojson job_status_to_yojson x.status) ]

let acknowledge_job_input_to_yojson (x : acknowledge_job_input) =
  assoc_to_yojson
    [ ("nonce", Some (nonce_to_yojson x.nonce)); ("jobId", Some (job_id_to_yojson x.job_id)) ]
