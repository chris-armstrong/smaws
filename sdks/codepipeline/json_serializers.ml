open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_region_name_to_yojson = string_to_yojson
let session_token_to_yojson = string_to_yojson
let secret_access_key_to_yojson = string_to_yojson
let access_key_id_to_yojson = string_to_yojson

let aws_session_credentials_to_yojson (x : aws_session_credentials) =
  assoc_to_yojson
    [
      ("accessKeyId", Some (access_key_id_to_yojson x.access_key_id));
      ("secretAccessKey", Some (secret_access_key_to_yojson x.secret_access_key));
      ("sessionToken", Some (session_token_to_yojson x.session_token));
    ]

let account_id_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let job_not_found_exception_to_yojson (x : job_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_nonce_exception_to_yojson (x : invalid_nonce_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let job_status_to_yojson (x : job_status) =
  match x with
  | Created -> `String "Created"
  | Queued -> `String "Queued"
  | Dispatched -> `String "Dispatched"
  | InProgress -> `String "InProgress"
  | TimedOut -> `String "TimedOut"
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"

let acknowledge_job_output_to_yojson (x : acknowledge_job_output) =
  assoc_to_yojson [ ("status", option_to_yojson job_status_to_yojson x.status) ]

let nonce_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let acknowledge_job_input_to_yojson (x : acknowledge_job_input) =
  assoc_to_yojson
    [ ("jobId", Some (job_id_to_yojson x.job_id)); ("nonce", Some (nonce_to_yojson x.nonce)) ]

let invalid_client_token_exception_to_yojson (x : invalid_client_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let acknowledge_third_party_job_output_to_yojson (x : acknowledge_third_party_job_output) =
  assoc_to_yojson [ ("status", option_to_yojson job_status_to_yojson x.status) ]

let client_token_to_yojson = string_to_yojson
let third_party_job_id_to_yojson = string_to_yojson

let acknowledge_third_party_job_input_to_yojson (x : acknowledge_third_party_job_input) =
  assoc_to_yojson
    [
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
      ("nonce", Some (nonce_to_yojson x.nonce));
      ("clientToken", Some (client_token_to_yojson x.client_token));
    ]

let action_category_to_yojson (x : action_category) =
  match x with
  | Source -> `String "Source"
  | Build -> `String "Build"
  | Deploy -> `String "Deploy"
  | Test -> `String "Test"
  | Invoke -> `String "Invoke"
  | Approval -> `String "Approval"
  | Compute -> `String "Compute"

let action_configuration_value_to_yojson = string_to_yojson
let action_configuration_key_to_yojson = string_to_yojson

let action_configuration_map_to_yojson tree =
  map_to_yojson action_configuration_key_to_yojson action_configuration_value_to_yojson tree

let action_configuration_to_yojson (x : action_configuration) =
  assoc_to_yojson
    [ ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration) ]

let action_configuration_property_type_to_yojson (x : action_configuration_property_type) =
  match x with
  | String -> `String "String"
  | Number -> `String "Number"
  | Boolean -> `String "Boolean"

let description_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson

let action_configuration_property_to_yojson (x : action_configuration_property) =
  assoc_to_yojson
    [
      ("name", Some (action_configuration_key_to_yojson x.name));
      ("required", Some (boolean__to_yojson x.required));
      ("key", Some (boolean__to_yojson x.key));
      ("secret", Some (boolean__to_yojson x.secret));
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("description", option_to_yojson description_to_yojson x.description);
      ("type", option_to_yojson action_configuration_property_type_to_yojson x.type_);
    ]

let action_configuration_property_list_to_yojson tree =
  list_to_yojson action_configuration_property_to_yojson tree

let action_configuration_queryable_value_to_yojson = string_to_yojson
let action_execution_id_to_yojson = string_to_yojson
let action_name_to_yojson = string_to_yojson

let action_context_to_yojson (x : action_context) =
  assoc_to_yojson
    [
      ("name", option_to_yojson action_name_to_yojson x.name);
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
    ]

let environment_variable_type_to_yojson (x : environment_variable_type) =
  match x with PLAINTEXT -> `String "PLAINTEXT" | SECRETS_MANAGER -> `String "SECRETS_MANAGER"

let environment_variable_value_to_yojson = string_to_yojson
let environment_variable_name_to_yojson = string_to_yojson

let environment_variable_to_yojson (x : environment_variable) =
  assoc_to_yojson
    [
      ("name", Some (environment_variable_name_to_yojson x.name));
      ("value", Some (environment_variable_value_to_yojson x.value));
      ("type", option_to_yojson environment_variable_type_to_yojson x.type_);
    ]

let environment_variable_list_to_yojson tree = list_to_yojson environment_variable_to_yojson tree
let action_timeout_to_yojson = int_to_yojson
let action_namespace_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson
let output_variable_to_yojson = string_to_yojson
let output_variable_list_to_yojson tree = list_to_yojson output_variable_to_yojson tree
let artifact_name_to_yojson = string_to_yojson

let input_artifact_to_yojson (x : input_artifact) =
  assoc_to_yojson [ ("name", Some (artifact_name_to_yojson x.name)) ]

let input_artifact_list_to_yojson tree = list_to_yojson input_artifact_to_yojson tree
let file_path_to_yojson = string_to_yojson
let file_path_list_to_yojson tree = list_to_yojson file_path_to_yojson tree

let output_artifact_to_yojson (x : output_artifact) =
  assoc_to_yojson
    [
      ("name", Some (artifact_name_to_yojson x.name));
      ("files", option_to_yojson file_path_list_to_yojson x.files);
    ]

let output_artifact_list_to_yojson tree = list_to_yojson output_artifact_to_yojson tree
let command_to_yojson = string_to_yojson
let command_list_to_yojson tree = list_to_yojson command_to_yojson tree
let action_run_order_to_yojson = int_to_yojson
let version_to_yojson = string_to_yojson
let action_provider_to_yojson = string_to_yojson

let action_owner_to_yojson (x : action_owner) =
  match x with
  | AWS -> `String "AWS"
  | ThirdParty -> `String "ThirdParty"
  | Custom -> `String "Custom"

let action_type_id_to_yojson (x : action_type_id) =
  assoc_to_yojson
    [
      ("category", Some (action_category_to_yojson x.category));
      ("owner", Some (action_owner_to_yojson x.owner));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
    ]

let action_declaration_to_yojson (x : action_declaration) =
  assoc_to_yojson
    [
      ("name", Some (action_name_to_yojson x.name));
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
      ("runOrder", option_to_yojson action_run_order_to_yojson x.run_order);
      ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration);
      ("commands", option_to_yojson command_list_to_yojson x.commands);
      ("outputArtifacts", option_to_yojson output_artifact_list_to_yojson x.output_artifacts);
      ("inputArtifacts", option_to_yojson input_artifact_list_to_yojson x.input_artifacts);
      ("outputVariables", option_to_yojson output_variable_list_to_yojson x.output_variables);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("namespace", option_to_yojson action_namespace_to_yojson x.namespace);
      ("timeoutInMinutes", option_to_yojson action_timeout_to_yojson x.timeout_in_minutes);
      ( "environmentVariables",
        option_to_yojson environment_variable_list_to_yojson x.environment_variables );
    ]

let log_stream_ar_n_to_yojson = string_to_yojson
let code_to_yojson = string_to_yojson

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("code", option_to_yojson code_to_yojson x.code);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let percentage_to_yojson = int_to_yojson
let url_to_yojson = string_to_yojson
let execution_id_to_yojson = string_to_yojson
let last_updated_by_to_yojson = string_to_yojson
let action_execution_token_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let execution_summary_to_yojson = string_to_yojson

let action_execution_status_to_yojson (x : action_execution_status) =
  match x with
  | InProgress -> `String "InProgress"
  | Abandoned -> `String "Abandoned"
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"

let action_execution_to_yojson (x : action_execution) =
  assoc_to_yojson
    [
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
      ("status", option_to_yojson action_execution_status_to_yojson x.status);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("token", option_to_yojson action_execution_token_to_yojson x.token);
      ("lastUpdatedBy", option_to_yojson last_updated_by_to_yojson x.last_updated_by);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("percentComplete", option_to_yojson percentage_to_yojson x.percent_complete);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("logStreamARN", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_ar_n);
    ]

let output_variables_value_to_yojson = string_to_yojson
let output_variables_key_to_yojson = string_to_yojson

let output_variables_map_to_yojson tree =
  map_to_yojson output_variables_key_to_yojson output_variables_value_to_yojson tree

let external_execution_summary_to_yojson = string_to_yojson
let external_execution_id_to_yojson = string_to_yojson

let action_execution_result_to_yojson (x : action_execution_result) =
  assoc_to_yojson
    [
      ( "externalExecutionId",
        option_to_yojson external_execution_id_to_yojson x.external_execution_id );
      ( "externalExecutionSummary",
        option_to_yojson external_execution_summary_to_yojson x.external_execution_summary );
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("logStreamARN", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_ar_n);
    ]

let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("key", option_to_yojson s3_key_to_yojson x.key);
    ]

let artifact_detail_to_yojson (x : artifact_detail) =
  assoc_to_yojson
    [
      ("name", option_to_yojson artifact_name_to_yojson x.name);
      ("s3location", option_to_yojson s3_location_to_yojson x.s3location);
    ]

let artifact_detail_list_to_yojson tree = list_to_yojson artifact_detail_to_yojson tree

let action_execution_output_to_yojson (x : action_execution_output) =
  assoc_to_yojson
    [
      ("outputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.output_artifacts);
      ("executionResult", option_to_yojson action_execution_result_to_yojson x.execution_result);
      ("outputVariables", option_to_yojson output_variables_map_to_yojson x.output_variables);
    ]

let string__to_yojson = string_to_yojson

let resolved_action_configuration_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let action_execution_input_to_yojson (x : action_execution_input) =
  assoc_to_yojson
    [
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
      ("configuration", option_to_yojson action_configuration_map_to_yojson x.configuration);
      ( "resolvedConfiguration",
        option_to_yojson resolved_action_configuration_map_to_yojson x.resolved_configuration );
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("inputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.input_artifacts);
      ("namespace", option_to_yojson action_namespace_to_yojson x.namespace);
    ]

let stage_name_to_yojson = string_to_yojson
let pipeline_version_to_yojson = int_to_yojson
let pipeline_execution_id_to_yojson = string_to_yojson

let action_execution_detail_to_yojson (x : action_execution_detail) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("actionExecutionId", option_to_yojson action_execution_id_to_yojson x.action_execution_id);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
      ("actionName", option_to_yojson action_name_to_yojson x.action_name);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("updatedBy", option_to_yojson last_updated_by_to_yojson x.updated_by);
      ("status", option_to_yojson action_execution_status_to_yojson x.status);
      ("input", option_to_yojson action_execution_input_to_yojson x.input);
      ("output", option_to_yojson action_execution_output_to_yojson x.output);
    ]

let action_execution_detail_list_to_yojson tree =
  list_to_yojson action_execution_detail_to_yojson tree

let start_time_range_to_yojson (x : start_time_range) =
  match x with Latest -> `String "Latest" | All -> `String "All"

let latest_in_pipeline_execution_filter_to_yojson (x : latest_in_pipeline_execution_filter) =
  assoc_to_yojson
    [
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("startTimeRange", Some (start_time_range_to_yojson x.start_time_range));
    ]

let action_execution_filter_to_yojson (x : action_execution_filter) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ( "latestInPipelineExecution",
        option_to_yojson latest_in_pipeline_execution_filter_to_yojson
          x.latest_in_pipeline_execution );
    ]

let action_execution_not_found_exception_to_yojson (x : action_execution_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let action_not_found_exception_to_yojson (x : action_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let revision_change_identifier_to_yojson = string_to_yojson
let revision_to_yojson = string_to_yojson

let action_revision_to_yojson (x : action_revision) =
  assoc_to_yojson
    [
      ("revisionId", Some (revision_to_yojson x.revision_id));
      ("revisionChangeId", Some (revision_change_identifier_to_yojson x.revision_change_id));
      ("created", Some (timestamp_to_yojson x.created));
    ]

let action_state_to_yojson (x : action_state) =
  assoc_to_yojson
    [
      ("actionName", option_to_yojson action_name_to_yojson x.action_name);
      ("currentRevision", option_to_yojson action_revision_to_yojson x.current_revision);
      ("latestExecution", option_to_yojson action_execution_to_yojson x.latest_execution);
      ("entityUrl", option_to_yojson url_to_yojson x.entity_url);
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
    ]

let action_state_list_to_yojson tree = list_to_yojson action_state_to_yojson tree
let maximum_artifact_count_to_yojson = int_to_yojson
let minimum_artifact_count_to_yojson = int_to_yojson

let artifact_details_to_yojson (x : artifact_details) =
  assoc_to_yojson
    [
      ("minimumCount", Some (minimum_artifact_count_to_yojson x.minimum_count));
      ("maximumCount", Some (maximum_artifact_count_to_yojson x.maximum_count));
    ]

let url_template_to_yojson = string_to_yojson

let action_type_settings_to_yojson (x : action_type_settings) =
  assoc_to_yojson
    [
      ("thirdPartyConfigurationUrl", option_to_yojson url_to_yojson x.third_party_configuration_url);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
    ]

let action_type_to_yojson (x : action_type) =
  assoc_to_yojson
    [
      ("id", Some (action_type_id_to_yojson x.id));
      ("settings", option_to_yojson action_type_settings_to_yojson x.settings);
      ( "actionConfigurationProperties",
        option_to_yojson action_configuration_property_list_to_yojson
          x.action_configuration_properties );
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
      ("outputArtifactDetails", Some (artifact_details_to_yojson x.output_artifact_details));
    ]

let maximum_action_type_artifact_count_to_yojson = int_to_yojson
let minimum_action_type_artifact_count_to_yojson = int_to_yojson

let action_type_artifact_details_to_yojson (x : action_type_artifact_details) =
  assoc_to_yojson
    [
      ("minimumCount", Some (minimum_action_type_artifact_count_to_yojson x.minimum_count));
      ("maximumCount", Some (maximum_action_type_artifact_count_to_yojson x.maximum_count));
    ]

let action_type_urls_to_yojson (x : action_type_urls) =
  assoc_to_yojson
    [
      ("configurationUrl", option_to_yojson url_to_yojson x.configuration_url);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
    ]

let property_description_to_yojson = string_to_yojson

let action_type_property_to_yojson (x : action_type_property) =
  assoc_to_yojson
    [
      ("name", Some (action_configuration_key_to_yojson x.name));
      ("optional", Some (boolean__to_yojson x.optional));
      ("key", Some (boolean__to_yojson x.key));
      ("noEcho", Some (boolean__to_yojson x.no_echo));
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("description", option_to_yojson property_description_to_yojson x.description);
    ]

let action_type_properties_to_yojson tree = list_to_yojson action_type_property_to_yojson tree
let allowed_account_to_yojson = string_to_yojson
let allowed_accounts_to_yojson tree = list_to_yojson allowed_account_to_yojson tree

let action_type_permissions_to_yojson (x : action_type_permissions) =
  assoc_to_yojson [ ("allowedAccounts", Some (allowed_accounts_to_yojson x.allowed_accounts)) ]

let action_type_owner_to_yojson = string_to_yojson

let action_type_identifier_to_yojson (x : action_type_identifier) =
  assoc_to_yojson
    [
      ("category", Some (action_category_to_yojson x.category));
      ("owner", Some (action_type_owner_to_yojson x.owner));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
    ]

let job_timeout_to_yojson = int_to_yojson
let policy_statements_template_to_yojson = string_to_yojson

let executor_type_to_yojson (x : executor_type) =
  match x with JobWorker -> `String "JobWorker" | Lambda -> `String "Lambda"

let service_principal_to_yojson = string_to_yojson
let polling_service_principal_list_to_yojson tree = list_to_yojson service_principal_to_yojson tree
let polling_account_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let job_worker_executor_configuration_to_yojson (x : job_worker_executor_configuration) =
  assoc_to_yojson
    [
      ("pollingAccounts", option_to_yojson polling_account_list_to_yojson x.polling_accounts);
      ( "pollingServicePrincipals",
        option_to_yojson polling_service_principal_list_to_yojson x.polling_service_principals );
    ]

let lambda_function_arn_to_yojson = string_to_yojson

let lambda_executor_configuration_to_yojson (x : lambda_executor_configuration) =
  assoc_to_yojson
    [ ("lambdaFunctionArn", Some (lambda_function_arn_to_yojson x.lambda_function_arn)) ]

let executor_configuration_to_yojson (x : executor_configuration) =
  assoc_to_yojson
    [
      ( "lambdaExecutorConfiguration",
        option_to_yojson lambda_executor_configuration_to_yojson x.lambda_executor_configuration );
      ( "jobWorkerExecutorConfiguration",
        option_to_yojson job_worker_executor_configuration_to_yojson
          x.job_worker_executor_configuration );
    ]

let action_type_executor_to_yojson (x : action_type_executor) =
  assoc_to_yojson
    [
      ("configuration", Some (executor_configuration_to_yojson x.configuration));
      ("type", Some (executor_type_to_yojson x.type_));
      ( "policyStatementsTemplate",
        option_to_yojson policy_statements_template_to_yojson x.policy_statements_template );
      ("jobTimeout", option_to_yojson job_timeout_to_yojson x.job_timeout);
    ]

let action_type_description_to_yojson = string_to_yojson

let action_type_declaration_to_yojson (x : action_type_declaration) =
  assoc_to_yojson
    [
      ("description", option_to_yojson action_type_description_to_yojson x.description);
      ("executor", Some (action_type_executor_to_yojson x.executor));
      ("id", Some (action_type_identifier_to_yojson x.id));
      ( "inputArtifactDetails",
        Some (action_type_artifact_details_to_yojson x.input_artifact_details) );
      ( "outputArtifactDetails",
        Some (action_type_artifact_details_to_yojson x.output_artifact_details) );
      ("permissions", option_to_yojson action_type_permissions_to_yojson x.permissions);
      ("properties", option_to_yojson action_type_properties_to_yojson x.properties);
      ("urls", option_to_yojson action_type_urls_to_yojson x.urls);
    ]

let action_type_list_to_yojson tree = list_to_yojson action_type_to_yojson tree

let action_type_not_found_exception_to_yojson (x : action_type_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_already_completed_exception_to_yojson (x : approval_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let approval_status_to_yojson (x : approval_status) =
  match x with Approved -> `String "Approved" | Rejected -> `String "Rejected"

let approval_summary_to_yojson = string_to_yojson

let approval_result_to_yojson (x : approval_result) =
  assoc_to_yojson
    [
      ("summary", Some (approval_summary_to_yojson x.summary));
      ("status", Some (approval_status_to_yojson x.status));
    ]

let approval_token_to_yojson = string_to_yojson
let s3_object_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let s3_artifact_location_to_yojson (x : s3_artifact_location) =
  assoc_to_yojson
    [
      ("bucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
      ("objectKey", Some (s3_object_key_to_yojson x.object_key));
    ]

let artifact_location_type_to_yojson (x : artifact_location_type) =
  match x with S3 -> `String "S3"

let artifact_location_to_yojson (x : artifact_location) =
  assoc_to_yojson
    [
      ("type", option_to_yojson artifact_location_type_to_yojson x.type_);
      ("s3Location", option_to_yojson s3_artifact_location_to_yojson x.s3_location);
    ]

let artifact_to_yojson (x : artifact) =
  assoc_to_yojson
    [
      ("name", option_to_yojson artifact_name_to_yojson x.name);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("location", option_to_yojson artifact_location_to_yojson x.location);
    ]

let artifact_list_to_yojson tree = list_to_yojson artifact_to_yojson tree
let revision_summary_to_yojson = string_to_yojson

let artifact_revision_to_yojson (x : artifact_revision) =
  assoc_to_yojson
    [
      ("name", option_to_yojson artifact_name_to_yojson x.name);
      ("revisionId", option_to_yojson revision_to_yojson x.revision_id);
      ( "revisionChangeIdentifier",
        option_to_yojson revision_change_identifier_to_yojson x.revision_change_identifier );
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
    ]

let artifact_revision_list_to_yojson tree = list_to_yojson artifact_revision_to_yojson tree
let encryption_key_type_to_yojson (x : encryption_key_type) = match x with KMS -> `String "KMS"
let encryption_key_id_to_yojson = string_to_yojson

let encryption_key_to_yojson (x : encryption_key) =
  assoc_to_yojson
    [
      ("id", Some (encryption_key_id_to_yojson x.id));
      ("type", Some (encryption_key_type_to_yojson x.type_));
    ]

let artifact_store_location_to_yojson = string_to_yojson
let artifact_store_type_to_yojson (x : artifact_store_type) = match x with S3 -> `String "S3"

let artifact_store_to_yojson (x : artifact_store) =
  assoc_to_yojson
    [
      ("type", Some (artifact_store_type_to_yojson x.type_));
      ("location", Some (artifact_store_location_to_yojson x.location));
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
    ]

let artifact_store_map_to_yojson tree =
  map_to_yojson aws_region_name_to_yojson artifact_store_to_yojson tree

let rule_timeout_to_yojson = int_to_yojson
let rule_configuration_value_to_yojson = string_to_yojson
let rule_configuration_key_to_yojson = string_to_yojson

let rule_configuration_map_to_yojson tree =
  map_to_yojson rule_configuration_key_to_yojson rule_configuration_value_to_yojson tree

let rule_provider_to_yojson = string_to_yojson
let rule_owner_to_yojson (x : rule_owner) = match x with AWS -> `String "AWS"
let rule_category_to_yojson (x : rule_category) = match x with Rule -> `String "Rule"

let rule_type_id_to_yojson (x : rule_type_id) =
  assoc_to_yojson
    [
      ("category", Some (rule_category_to_yojson x.category));
      ("owner", option_to_yojson rule_owner_to_yojson x.owner);
      ("provider", Some (rule_provider_to_yojson x.provider));
      ("version", option_to_yojson version_to_yojson x.version);
    ]

let rule_name_to_yojson = string_to_yojson

let rule_declaration_to_yojson (x : rule_declaration) =
  assoc_to_yojson
    [
      ("name", Some (rule_name_to_yojson x.name));
      ("ruleTypeId", Some (rule_type_id_to_yojson x.rule_type_id));
      ("configuration", option_to_yojson rule_configuration_map_to_yojson x.configuration);
      ("commands", option_to_yojson command_list_to_yojson x.commands);
      ("inputArtifacts", option_to_yojson input_artifact_list_to_yojson x.input_artifacts);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("timeoutInMinutes", option_to_yojson rule_timeout_to_yojson x.timeout_in_minutes);
    ]

let rule_declaration_list_to_yojson tree = list_to_yojson rule_declaration_to_yojson tree

let result__to_yojson (x : result_) =
  match x with
  | ROLLBACK -> `String "ROLLBACK"
  | FAIL -> `String "FAIL"
  | RETRY -> `String "RETRY"
  | SKIP -> `String "SKIP"

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("result", option_to_yojson result__to_yojson x.result_);
      ("rules", option_to_yojson rule_declaration_list_to_yojson x.rules);
    ]

let condition_list_to_yojson tree = list_to_yojson condition_to_yojson tree

let before_entry_conditions_to_yojson (x : before_entry_conditions) =
  assoc_to_yojson [ ("conditions", Some (condition_list_to_yojson x.conditions)) ]

let blocker_type_to_yojson (x : blocker_type) = match x with Schedule -> `String "Schedule"
let blocker_name_to_yojson = string_to_yojson

let blocker_declaration_to_yojson (x : blocker_declaration) =
  assoc_to_yojson
    [
      ("name", Some (blocker_name_to_yojson x.name)); ("type", Some (blocker_type_to_yojson x.type_));
    ]

let client_id_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson

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

let git_file_path_pattern_to_yojson = string_to_yojson
let git_file_path_pattern_list_to_yojson tree = list_to_yojson git_file_path_pattern_to_yojson tree

let git_file_path_filter_criteria_to_yojson (x : git_file_path_filter_criteria) =
  assoc_to_yojson
    [
      ("includes", option_to_yojson git_file_path_pattern_list_to_yojson x.includes);
      ("excludes", option_to_yojson git_file_path_pattern_list_to_yojson x.excludes);
    ]

let git_branch_name_pattern_to_yojson = string_to_yojson
let git_branch_pattern_list_to_yojson tree = list_to_yojson git_branch_name_pattern_to_yojson tree

let git_branch_filter_criteria_to_yojson (x : git_branch_filter_criteria) =
  assoc_to_yojson
    [
      ("includes", option_to_yojson git_branch_pattern_list_to_yojson x.includes);
      ("excludes", option_to_yojson git_branch_pattern_list_to_yojson x.excludes);
    ]

let git_pull_request_event_type_to_yojson (x : git_pull_request_event_type) =
  match x with OPEN -> `String "OPEN" | UPDATED -> `String "UPDATED" | CLOSED -> `String "CLOSED"

let git_pull_request_event_type_list_to_yojson tree =
  list_to_yojson git_pull_request_event_type_to_yojson tree

let git_pull_request_filter_to_yojson (x : git_pull_request_filter) =
  assoc_to_yojson
    [
      ("events", option_to_yojson git_pull_request_event_type_list_to_yojson x.events);
      ("branches", option_to_yojson git_branch_filter_criteria_to_yojson x.branches);
      ("filePaths", option_to_yojson git_file_path_filter_criteria_to_yojson x.file_paths);
    ]

let git_pull_request_filter_list_to_yojson tree =
  list_to_yojson git_pull_request_filter_to_yojson tree

let git_tag_name_pattern_to_yojson = string_to_yojson
let git_tag_pattern_list_to_yojson tree = list_to_yojson git_tag_name_pattern_to_yojson tree

let git_tag_filter_criteria_to_yojson (x : git_tag_filter_criteria) =
  assoc_to_yojson
    [
      ("includes", option_to_yojson git_tag_pattern_list_to_yojson x.includes);
      ("excludes", option_to_yojson git_tag_pattern_list_to_yojson x.excludes);
    ]

let git_push_filter_to_yojson (x : git_push_filter) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson git_tag_filter_criteria_to_yojson x.tags);
      ("branches", option_to_yojson git_branch_filter_criteria_to_yojson x.branches);
      ("filePaths", option_to_yojson git_file_path_filter_criteria_to_yojson x.file_paths);
    ]

let git_push_filter_list_to_yojson tree = list_to_yojson git_push_filter_to_yojson tree

let git_configuration_to_yojson (x : git_configuration) =
  assoc_to_yojson
    [
      ("sourceActionName", Some (action_name_to_yojson x.source_action_name));
      ("push", option_to_yojson git_push_filter_list_to_yojson x.push);
      ("pullRequest", option_to_yojson git_pull_request_filter_list_to_yojson x.pull_request);
    ]

let pipeline_trigger_provider_type_to_yojson (x : pipeline_trigger_provider_type) =
  match x with CodeStarSourceConnection -> `String "CodeStarSourceConnection"

let pipeline_trigger_declaration_to_yojson (x : pipeline_trigger_declaration) =
  assoc_to_yojson
    [
      ("providerType", Some (pipeline_trigger_provider_type_to_yojson x.provider_type));
      ("gitConfiguration", Some (git_configuration_to_yojson x.git_configuration));
    ]

let pipeline_trigger_declaration_list_to_yojson tree =
  list_to_yojson pipeline_trigger_declaration_to_yojson tree

let pipeline_variable_description_to_yojson = string_to_yojson
let pipeline_variable_value_to_yojson = string_to_yojson
let pipeline_variable_name_to_yojson = string_to_yojson

let pipeline_variable_declaration_to_yojson (x : pipeline_variable_declaration) =
  assoc_to_yojson
    [
      ("name", Some (pipeline_variable_name_to_yojson x.name));
      ("defaultValue", option_to_yojson pipeline_variable_value_to_yojson x.default_value);
      ("description", option_to_yojson pipeline_variable_description_to_yojson x.description);
    ]

let pipeline_variable_declaration_list_to_yojson tree =
  list_to_yojson pipeline_variable_declaration_to_yojson tree

let pipeline_type_to_yojson (x : pipeline_type) =
  match x with V1 -> `String "V1" | V2 -> `String "V2"

let execution_mode_to_yojson (x : execution_mode) =
  match x with
  | QUEUED -> `String "QUEUED"
  | SUPERSEDED -> `String "SUPERSEDED"
  | PARALLEL -> `String "PARALLEL"

let success_conditions_to_yojson (x : success_conditions) =
  assoc_to_yojson [ ("conditions", Some (condition_list_to_yojson x.conditions)) ]

let stage_retry_mode_to_yojson (x : stage_retry_mode) =
  match x with FAILED_ACTIONS -> `String "FAILED_ACTIONS" | ALL_ACTIONS -> `String "ALL_ACTIONS"

let retry_configuration_to_yojson (x : retry_configuration) =
  assoc_to_yojson [ ("retryMode", option_to_yojson stage_retry_mode_to_yojson x.retry_mode) ]

let failure_conditions_to_yojson (x : failure_conditions) =
  assoc_to_yojson
    [
      ("result", option_to_yojson result__to_yojson x.result_);
      ("retryConfiguration", option_to_yojson retry_configuration_to_yojson x.retry_configuration);
      ("conditions", option_to_yojson condition_list_to_yojson x.conditions);
    ]

let stage_action_declaration_list_to_yojson tree = list_to_yojson action_declaration_to_yojson tree

let stage_blocker_declaration_list_to_yojson tree =
  list_to_yojson blocker_declaration_to_yojson tree

let stage_declaration_to_yojson (x : stage_declaration) =
  assoc_to_yojson
    [
      ("name", Some (stage_name_to_yojson x.name));
      ("blockers", option_to_yojson stage_blocker_declaration_list_to_yojson x.blockers);
      ("actions", Some (stage_action_declaration_list_to_yojson x.actions));
      ("onFailure", option_to_yojson failure_conditions_to_yojson x.on_failure);
      ("onSuccess", option_to_yojson success_conditions_to_yojson x.on_success);
      ("beforeEntry", option_to_yojson before_entry_conditions_to_yojson x.before_entry);
    ]

let pipeline_stage_declaration_list_to_yojson tree = list_to_yojson stage_declaration_to_yojson tree
let pipeline_name_to_yojson = string_to_yojson

let pipeline_declaration_to_yojson (x : pipeline_declaration) =
  assoc_to_yojson
    [
      ("name", Some (pipeline_name_to_yojson x.name));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("artifactStore", option_to_yojson artifact_store_to_yojson x.artifact_store);
      ("artifactStores", option_to_yojson artifact_store_map_to_yojson x.artifact_stores);
      ("stages", Some (pipeline_stage_declaration_list_to_yojson x.stages));
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("pipelineType", option_to_yojson pipeline_type_to_yojson x.pipeline_type);
      ("variables", option_to_yojson pipeline_variable_declaration_list_to_yojson x.variables);
      ("triggers", option_to_yojson pipeline_trigger_declaration_list_to_yojson x.triggers);
    ]

let update_pipeline_output_to_yojson (x : update_pipeline_output) =
  assoc_to_yojson [ ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline) ]

let update_pipeline_input_to_yojson (x : update_pipeline_input) =
  assoc_to_yojson [ ("pipeline", Some (pipeline_declaration_to_yojson x.pipeline)) ]

let request_failed_exception_to_yojson (x : request_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_action_type_input_to_yojson (x : update_action_type_input) =
  assoc_to_yojson [ ("actionType", Some (action_type_declaration_to_yojson x.action_type)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tags_exception_to_yojson (x : invalid_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
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

let stop_pipeline_execution_output_to_yojson (x : stop_pipeline_execution_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let stop_pipeline_execution_reason_to_yojson = string_to_yojson

let stop_pipeline_execution_input_to_yojson (x : stop_pipeline_execution_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("abandon", option_to_yojson boolean__to_yojson x.abandon);
      ("reason", option_to_yojson stop_pipeline_execution_reason_to_yojson x.reason);
    ]

let concurrent_pipeline_executions_limit_exceeded_exception_to_yojson
    (x : concurrent_pipeline_executions_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let start_pipeline_execution_output_to_yojson (x : start_pipeline_execution_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let source_revision_type_to_yojson (x : source_revision_type) =
  match x with
  | COMMIT_ID -> `String "COMMIT_ID"
  | IMAGE_DIGEST -> `String "IMAGE_DIGEST"
  | S3_OBJECT_VERSION_ID -> `String "S3_OBJECT_VERSION_ID"
  | S3_OBJECT_KEY -> `String "S3_OBJECT_KEY"

let source_revision_override_to_yojson (x : source_revision_override) =
  assoc_to_yojson
    [
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("revisionType", Some (source_revision_type_to_yojson x.revision_type));
      ("revisionValue", Some (revision_to_yojson x.revision_value));
    ]

let source_revision_override_list_to_yojson tree =
  list_to_yojson source_revision_override_to_yojson tree

let pipeline_variable_to_yojson (x : pipeline_variable) =
  assoc_to_yojson
    [
      ("name", Some (pipeline_variable_name_to_yojson x.name));
      ("value", Some (pipeline_variable_value_to_yojson x.value));
    ]

let pipeline_variable_list_to_yojson tree = list_to_yojson pipeline_variable_to_yojson tree

let start_pipeline_execution_input_to_yojson (x : start_pipeline_execution_input) =
  assoc_to_yojson
    [
      ("name", Some (pipeline_name_to_yojson x.name));
      ("variables", option_to_yojson pipeline_variable_list_to_yojson x.variables);
      ( "clientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "sourceRevisions",
        option_to_yojson source_revision_override_list_to_yojson x.source_revisions );
    ]

let unable_to_rollback_stage_exception_to_yojson (x : unable_to_rollback_stage_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let stage_not_found_exception_to_yojson (x : stage_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_execution_outdated_exception_to_yojson (x : pipeline_execution_outdated_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_execution_not_found_exception_to_yojson (x : pipeline_execution_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let rollback_stage_output_to_yojson (x : rollback_stage_output) =
  assoc_to_yojson
    [ ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id)) ]

let rollback_stage_input_to_yojson (x : rollback_stage_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ( "targetPipelineExecutionId",
        Some (pipeline_execution_id_to_yojson x.target_pipeline_execution_id) );
    ]

let stage_not_retryable_exception_to_yojson (x : stage_not_retryable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let not_latest_pipeline_execution_exception_to_yojson (x : not_latest_pipeline_execution_exception)
    =
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
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("retryMode", Some (stage_retry_mode_to_yojson x.retry_mode));
    ]

let webhook_not_found_exception_to_yojson = unit_to_yojson
let register_webhook_with_third_party_output_to_yojson = unit_to_yojson
let webhook_name_to_yojson = string_to_yojson

let register_webhook_with_third_party_input_to_yojson (x : register_webhook_with_third_party_input)
    =
  assoc_to_yojson [ ("webhookName", option_to_yojson webhook_name_to_yojson x.webhook_name) ]

let invalid_webhook_filter_pattern_exception_to_yojson
    (x : invalid_webhook_filter_pattern_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_webhook_authentication_parameters_exception_to_yojson
    (x : invalid_webhook_authentication_parameters_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let webhook_arn_to_yojson = string_to_yojson
let webhook_last_triggered_to_yojson = timestamp_epoch_seconds_to_yojson
let webhook_error_code_to_yojson = string_to_yojson
let webhook_error_message_to_yojson = string_to_yojson
let webhook_url_to_yojson = string_to_yojson
let webhook_auth_configuration_secret_token_to_yojson = string_to_yojson
let webhook_auth_configuration_allowed_ip_range_to_yojson = string_to_yojson

let webhook_auth_configuration_to_yojson (x : webhook_auth_configuration) =
  assoc_to_yojson
    [
      ( "AllowedIPRange",
        option_to_yojson webhook_auth_configuration_allowed_ip_range_to_yojson x.allowed_ip_range );
      ( "SecretToken",
        option_to_yojson webhook_auth_configuration_secret_token_to_yojson x.secret_token );
    ]

let webhook_authentication_type_to_yojson (x : webhook_authentication_type) =
  match x with
  | GITHUB_HMAC -> `String "GITHUB_HMAC"
  | IP -> `String "IP"
  | UNAUTHENTICATED -> `String "UNAUTHENTICATED"

let match_equals_to_yojson = string_to_yojson
let json_path_to_yojson = string_to_yojson

let webhook_filter_rule_to_yojson (x : webhook_filter_rule) =
  assoc_to_yojson
    [
      ("jsonPath", Some (json_path_to_yojson x.json_path));
      ("matchEquals", option_to_yojson match_equals_to_yojson x.match_equals);
    ]

let webhook_filters_to_yojson tree = list_to_yojson webhook_filter_rule_to_yojson tree

let webhook_definition_to_yojson (x : webhook_definition) =
  assoc_to_yojson
    [
      ("name", Some (webhook_name_to_yojson x.name));
      ("targetPipeline", Some (pipeline_name_to_yojson x.target_pipeline));
      ("targetAction", Some (action_name_to_yojson x.target_action));
      ("filters", Some (webhook_filters_to_yojson x.filters));
      ("authentication", Some (webhook_authentication_type_to_yojson x.authentication));
      ( "authenticationConfiguration",
        Some (webhook_auth_configuration_to_yojson x.authentication_configuration) );
    ]

let list_webhook_item_to_yojson (x : list_webhook_item) =
  assoc_to_yojson
    [
      ("definition", Some (webhook_definition_to_yojson x.definition));
      ("url", Some (webhook_url_to_yojson x.url));
      ("errorMessage", option_to_yojson webhook_error_message_to_yojson x.error_message);
      ("errorCode", option_to_yojson webhook_error_code_to_yojson x.error_code);
      ("lastTriggered", option_to_yojson webhook_last_triggered_to_yojson x.last_triggered);
      ("arn", option_to_yojson webhook_arn_to_yojson x.arn);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let put_webhook_output_to_yojson (x : put_webhook_output) =
  assoc_to_yojson [ ("webhook", option_to_yojson list_webhook_item_to_yojson x.webhook) ]

let put_webhook_input_to_yojson (x : put_webhook_input) =
  assoc_to_yojson
    [
      ("webhook", Some (webhook_definition_to_yojson x.webhook));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let invalid_job_state_exception_to_yojson (x : invalid_job_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let execution_details_to_yojson (x : execution_details) =
  assoc_to_yojson
    [
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("percentComplete", option_to_yojson percentage_to_yojson x.percent_complete);
    ]

let continuation_token_to_yojson = string_to_yojson
let time_to_yojson = timestamp_epoch_seconds_to_yojson

let current_revision_to_yojson (x : current_revision) =
  assoc_to_yojson
    [
      ("revision", Some (revision_to_yojson x.revision));
      ("changeIdentifier", Some (revision_change_identifier_to_yojson x.change_identifier));
      ("created", option_to_yojson time_to_yojson x.created);
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
    ]

let put_third_party_job_success_result_input_to_yojson
    (x : put_third_party_job_success_result_input) =
  assoc_to_yojson
    [
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("currentRevision", option_to_yojson current_revision_to_yojson x.current_revision);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("executionDetails", option_to_yojson execution_details_to_yojson x.execution_details);
    ]

let failure_type_to_yojson (x : failure_type) =
  match x with
  | JobFailed -> `String "JobFailed"
  | ConfigurationError -> `String "ConfigurationError"
  | PermissionError -> `String "PermissionError"
  | RevisionOutOfSync -> `String "RevisionOutOfSync"
  | RevisionUnavailable -> `String "RevisionUnavailable"
  | SystemUnavailable -> `String "SystemUnavailable"

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("type", Some (failure_type_to_yojson x.type_));
      ("message", Some (message_to_yojson x.message));
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
    ]

let put_third_party_job_failure_result_input_to_yojson
    (x : put_third_party_job_failure_result_input) =
  assoc_to_yojson
    [
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("failureDetails", Some (failure_details_to_yojson x.failure_details));
    ]

let output_variables_size_exceeded_exception_to_yojson
    (x : output_variables_size_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_job_success_result_input_to_yojson (x : put_job_success_result_input) =
  assoc_to_yojson
    [
      ("jobId", Some (job_id_to_yojson x.job_id));
      ("currentRevision", option_to_yojson current_revision_to_yojson x.current_revision);
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("executionDetails", option_to_yojson execution_details_to_yojson x.execution_details);
      ("outputVariables", option_to_yojson output_variables_map_to_yojson x.output_variables);
    ]

let put_job_failure_result_input_to_yojson (x : put_job_failure_result_input) =
  assoc_to_yojson
    [
      ("jobId", Some (job_id_to_yojson x.job_id));
      ("failureDetails", Some (failure_details_to_yojson x.failure_details));
    ]

let invalid_approval_token_exception_to_yojson (x : invalid_approval_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let put_approval_result_output_to_yojson (x : put_approval_result_output) =
  assoc_to_yojson [ ("approvedAt", option_to_yojson timestamp_to_yojson x.approved_at) ]

let put_approval_result_input_to_yojson (x : put_approval_result_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("result", Some (approval_result_to_yojson x.result_));
      ("token", Some (approval_token_to_yojson x.token));
    ]

let put_action_revision_output_to_yojson (x : put_action_revision_output) =
  assoc_to_yojson
    [
      ("newRevision", option_to_yojson boolean__to_yojson x.new_revision);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let put_action_revision_input_to_yojson (x : put_action_revision_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("actionRevision", Some (action_revision_to_yojson x.action_revision));
    ]

let third_party_job_to_yojson (x : third_party_job) =
  assoc_to_yojson
    [
      ("clientId", option_to_yojson client_id_to_yojson x.client_id);
      ("jobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let third_party_job_list_to_yojson tree = list_to_yojson third_party_job_to_yojson tree

let poll_for_third_party_jobs_output_to_yojson (x : poll_for_third_party_jobs_output) =
  assoc_to_yojson [ ("jobs", option_to_yojson third_party_job_list_to_yojson x.jobs) ]

let max_batch_size_to_yojson = int_to_yojson

let poll_for_third_party_jobs_input_to_yojson (x : poll_for_third_party_jobs_input) =
  assoc_to_yojson
    [
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
      ("maxBatchSize", option_to_yojson max_batch_size_to_yojson x.max_batch_size);
    ]

let pipeline_arn_to_yojson = string_to_yojson

let stage_context_to_yojson (x : stage_context) =
  assoc_to_yojson [ ("name", option_to_yojson stage_name_to_yojson x.name) ]

let pipeline_context_to_yojson (x : pipeline_context) =
  assoc_to_yojson
    [
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("stage", option_to_yojson stage_context_to_yojson x.stage);
      ("action", option_to_yojson action_context_to_yojson x.action);
      ("pipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
    ]

let job_data_to_yojson (x : job_data) =
  assoc_to_yojson
    [
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
      ("actionConfiguration", option_to_yojson action_configuration_to_yojson x.action_configuration);
      ("pipelineContext", option_to_yojson pipeline_context_to_yojson x.pipeline_context);
      ("inputArtifacts", option_to_yojson artifact_list_to_yojson x.input_artifacts);
      ("outputArtifacts", option_to_yojson artifact_list_to_yojson x.output_artifacts);
      ( "artifactCredentials",
        option_to_yojson aws_session_credentials_to_yojson x.artifact_credentials );
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
    ]

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("id", option_to_yojson job_id_to_yojson x.id);
      ("data", option_to_yojson job_data_to_yojson x.data);
      ("nonce", option_to_yojson nonce_to_yojson x.nonce);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let job_list_to_yojson tree = list_to_yojson job_to_yojson tree

let poll_for_jobs_output_to_yojson (x : poll_for_jobs_output) =
  assoc_to_yojson [ ("jobs", option_to_yojson job_list_to_yojson x.jobs) ]

let query_param_map_to_yojson tree =
  map_to_yojson action_configuration_key_to_yojson action_configuration_queryable_value_to_yojson
    tree

let poll_for_jobs_input_to_yojson (x : poll_for_jobs_input) =
  assoc_to_yojson
    [
      ("actionTypeId", Some (action_type_id_to_yojson x.action_type_id));
      ("maxBatchSize", option_to_yojson max_batch_size_to_yojson x.max_batch_size);
      ("queryParam", option_to_yojson query_param_map_to_yojson x.query_param);
    ]

let condition_not_overridable_exception_to_yojson (x : condition_not_overridable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let condition_type_to_yojson (x : condition_type) =
  match x with BEFORE_ENTRY -> `String "BEFORE_ENTRY" | ON_SUCCESS -> `String "ON_SUCCESS"

let override_stage_condition_input_to_yojson (x : override_stage_condition_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("conditionType", Some (condition_type_to_yojson x.condition_type));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let webhook_list_to_yojson tree = list_to_yojson list_webhook_item_to_yojson tree

let list_webhooks_output_to_yojson (x : list_webhooks_output) =
  assoc_to_yojson
    [
      ("webhooks", option_to_yojson webhook_list_to_yojson x.webhooks);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_webhooks_input_to_yojson (x : list_webhooks_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let rule_configuration_property_type_to_yojson (x : rule_configuration_property_type) =
  match x with
  | String -> `String "String"
  | Number -> `String "Number"
  | Boolean -> `String "Boolean"

let rule_configuration_property_to_yojson (x : rule_configuration_property) =
  assoc_to_yojson
    [
      ("name", Some (rule_configuration_key_to_yojson x.name));
      ("required", Some (boolean__to_yojson x.required));
      ("key", Some (boolean__to_yojson x.key));
      ("secret", Some (boolean__to_yojson x.secret));
      ("queryable", option_to_yojson boolean__to_yojson x.queryable);
      ("description", option_to_yojson description_to_yojson x.description);
      ("type", option_to_yojson rule_configuration_property_type_to_yojson x.type_);
    ]

let rule_configuration_property_list_to_yojson tree =
  list_to_yojson rule_configuration_property_to_yojson tree

let rule_type_settings_to_yojson (x : rule_type_settings) =
  assoc_to_yojson
    [
      ("thirdPartyConfigurationUrl", option_to_yojson url_to_yojson x.third_party_configuration_url);
      ("entityUrlTemplate", option_to_yojson url_template_to_yojson x.entity_url_template);
      ("executionUrlTemplate", option_to_yojson url_template_to_yojson x.execution_url_template);
      ("revisionUrlTemplate", option_to_yojson url_template_to_yojson x.revision_url_template);
    ]

let rule_type_to_yojson (x : rule_type) =
  assoc_to_yojson
    [
      ("id", Some (rule_type_id_to_yojson x.id));
      ("settings", option_to_yojson rule_type_settings_to_yojson x.settings);
      ( "ruleConfigurationProperties",
        option_to_yojson rule_configuration_property_list_to_yojson x.rule_configuration_properties
      );
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
    ]

let rule_type_list_to_yojson tree = list_to_yojson rule_type_to_yojson tree

let list_rule_types_output_to_yojson (x : list_rule_types_output) =
  assoc_to_yojson [ ("ruleTypes", Some (rule_type_list_to_yojson x.rule_types)) ]

let list_rule_types_input_to_yojson (x : list_rule_types_input) =
  assoc_to_yojson
    [
      ("ruleOwnerFilter", option_to_yojson rule_owner_to_yojson x.rule_owner_filter);
      ("regionFilter", option_to_yojson aws_region_name_to_yojson x.region_filter);
    ]

let rule_execution_result_to_yojson (x : rule_execution_result) =
  assoc_to_yojson
    [
      ( "externalExecutionId",
        option_to_yojson external_execution_id_to_yojson x.external_execution_id );
      ( "externalExecutionSummary",
        option_to_yojson external_execution_summary_to_yojson x.external_execution_summary );
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
    ]

let rule_execution_output_to_yojson (x : rule_execution_output) =
  assoc_to_yojson
    [ ("executionResult", option_to_yojson rule_execution_result_to_yojson x.execution_result) ]

let resolved_rule_configuration_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let rule_execution_input_to_yojson (x : rule_execution_input) =
  assoc_to_yojson
    [
      ("ruleTypeId", option_to_yojson rule_type_id_to_yojson x.rule_type_id);
      ("configuration", option_to_yojson rule_configuration_map_to_yojson x.configuration);
      ( "resolvedConfiguration",
        option_to_yojson resolved_rule_configuration_map_to_yojson x.resolved_configuration );
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("region", option_to_yojson aws_region_name_to_yojson x.region);
      ("inputArtifacts", option_to_yojson artifact_detail_list_to_yojson x.input_artifacts);
    ]

let rule_execution_status_to_yojson (x : rule_execution_status) =
  match x with
  | InProgress -> `String "InProgress"
  | Abandoned -> `String "Abandoned"
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"

let rule_execution_id_to_yojson = string_to_yojson

let rule_execution_detail_to_yojson (x : rule_execution_detail) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("ruleExecutionId", option_to_yojson rule_execution_id_to_yojson x.rule_execution_id);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
      ("ruleName", option_to_yojson rule_name_to_yojson x.rule_name);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("updatedBy", option_to_yojson last_updated_by_to_yojson x.updated_by);
      ("status", option_to_yojson rule_execution_status_to_yojson x.status);
      ("input", option_to_yojson rule_execution_input_to_yojson x.input);
      ("output", option_to_yojson rule_execution_output_to_yojson x.output);
    ]

let rule_execution_detail_list_to_yojson tree = list_to_yojson rule_execution_detail_to_yojson tree

let list_rule_executions_output_to_yojson (x : list_rule_executions_output) =
  assoc_to_yojson
    [
      ( "ruleExecutionDetails",
        option_to_yojson rule_execution_detail_list_to_yojson x.rule_execution_details );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let rule_execution_filter_to_yojson (x : rule_execution_filter) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ( "latestInPipelineExecution",
        option_to_yojson latest_in_pipeline_execution_filter_to_yojson
          x.latest_in_pipeline_execution );
    ]

let list_rule_executions_input_to_yojson (x : list_rule_executions_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("filter", option_to_yojson rule_execution_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let pipeline_summary_to_yojson (x : pipeline_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson pipeline_name_to_yojson x.name);
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
      ("pipelineType", option_to_yojson pipeline_type_to_yojson x.pipeline_type);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
    ]

let pipeline_list_to_yojson tree = list_to_yojson pipeline_summary_to_yojson tree

let list_pipelines_output_to_yojson (x : list_pipelines_output) =
  assoc_to_yojson
    [
      ("pipelines", option_to_yojson pipeline_list_to_yojson x.pipelines);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_pipelines_to_yojson = int_to_yojson

let list_pipelines_input_to_yojson (x : list_pipelines_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_pipelines_to_yojson x.max_results);
    ]

let pipeline_rollback_metadata_to_yojson (x : pipeline_rollback_metadata) =
  assoc_to_yojson
    [
      ( "rollbackTargetPipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.rollback_target_pipeline_execution_id );
    ]

let execution_type_to_yojson (x : execution_type) =
  match x with STANDARD -> `String "STANDARD" | ROLLBACK -> `String "ROLLBACK"

let stop_execution_trigger_to_yojson (x : stop_execution_trigger) =
  assoc_to_yojson [ ("reason", option_to_yojson stop_pipeline_execution_reason_to_yojson x.reason) ]

let trigger_detail_to_yojson = string_to_yojson

let trigger_type_to_yojson (x : trigger_type) =
  match x with
  | CreatePipeline -> `String "CreatePipeline"
  | StartPipelineExecution -> `String "StartPipelineExecution"
  | PollForSourceChanges -> `String "PollForSourceChanges"
  | Webhook -> `String "Webhook"
  | CloudWatchEvent -> `String "CloudWatchEvent"
  | PutActionRevision -> `String "PutActionRevision"
  | WebhookV2 -> `String "WebhookV2"
  | ManualRollback -> `String "ManualRollback"
  | AutomatedRollback -> `String "AutomatedRollback"

let execution_trigger_to_yojson (x : execution_trigger) =
  assoc_to_yojson
    [
      ("triggerType", option_to_yojson trigger_type_to_yojson x.trigger_type);
      ("triggerDetail", option_to_yojson trigger_detail_to_yojson x.trigger_detail);
    ]

let source_revision_to_yojson (x : source_revision) =
  assoc_to_yojson
    [
      ("actionName", Some (action_name_to_yojson x.action_name));
      ("revisionId", option_to_yojson revision_to_yojson x.revision_id);
      ("revisionSummary", option_to_yojson revision_summary_to_yojson x.revision_summary);
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
    ]

let source_revision_list_to_yojson tree = list_to_yojson source_revision_to_yojson tree
let pipeline_execution_status_summary_to_yojson = string_to_yojson

let pipeline_execution_status_to_yojson (x : pipeline_execution_status) =
  match x with
  | Cancelled -> `String "Cancelled"
  | InProgress -> `String "InProgress"
  | Stopped -> `String "Stopped"
  | Stopping -> `String "Stopping"
  | Succeeded -> `String "Succeeded"
  | Superseded -> `String "Superseded"
  | Failed -> `String "Failed"

let pipeline_execution_summary_to_yojson (x : pipeline_execution_summary) =
  assoc_to_yojson
    [
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("status", option_to_yojson pipeline_execution_status_to_yojson x.status);
      ( "statusSummary",
        option_to_yojson pipeline_execution_status_summary_to_yojson x.status_summary );
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("sourceRevisions", option_to_yojson source_revision_list_to_yojson x.source_revisions);
      ("trigger", option_to_yojson execution_trigger_to_yojson x.trigger);
      ("stopTrigger", option_to_yojson stop_execution_trigger_to_yojson x.stop_trigger);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("executionType", option_to_yojson execution_type_to_yojson x.execution_type);
      ("rollbackMetadata", option_to_yojson pipeline_rollback_metadata_to_yojson x.rollback_metadata);
    ]

let pipeline_execution_summary_list_to_yojson tree =
  list_to_yojson pipeline_execution_summary_to_yojson tree

let list_pipeline_executions_output_to_yojson (x : list_pipeline_executions_output) =
  assoc_to_yojson
    [
      ( "pipelineExecutionSummaries",
        option_to_yojson pipeline_execution_summary_list_to_yojson x.pipeline_execution_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let succeeded_in_stage_filter_to_yojson (x : succeeded_in_stage_filter) =
  assoc_to_yojson [ ("stageName", option_to_yojson stage_name_to_yojson x.stage_name) ]

let pipeline_execution_filter_to_yojson (x : pipeline_execution_filter) =
  assoc_to_yojson
    [
      ("succeededInStage", option_to_yojson succeeded_in_stage_filter_to_yojson x.succeeded_in_stage);
    ]

let list_pipeline_executions_input_to_yojson (x : list_pipeline_executions_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson pipeline_execution_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let deploy_target_event_context_to_yojson (x : deploy_target_event_context) =
  assoc_to_yojson
    [
      ("ssmCommandId", option_to_yojson string__to_yojson x.ssm_command_id);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let deploy_target_event_to_yojson (x : deploy_target_event) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("status", option_to_yojson string__to_yojson x.status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("context", option_to_yojson deploy_target_event_context_to_yojson x.context);
    ]

let deploy_target_event_list_to_yojson tree = list_to_yojson deploy_target_event_to_yojson tree

let deploy_action_execution_target_to_yojson (x : deploy_action_execution_target) =
  assoc_to_yojson
    [
      ("targetId", option_to_yojson string__to_yojson x.target_id);
      ("targetType", option_to_yojson string__to_yojson x.target_type);
      ("status", option_to_yojson string__to_yojson x.status);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("events", option_to_yojson deploy_target_event_list_to_yojson x.events);
    ]

let deploy_action_execution_target_list_to_yojson tree =
  list_to_yojson deploy_action_execution_target_to_yojson tree

let list_deploy_action_execution_targets_output_to_yojson
    (x : list_deploy_action_execution_targets_output) =
  assoc_to_yojson
    [
      ("targets", option_to_yojson deploy_action_execution_target_list_to_yojson x.targets);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let target_filter_value_to_yojson = string_to_yojson
let target_filter_value_list_to_yojson tree = list_to_yojson target_filter_value_to_yojson tree

let target_filter_name_to_yojson (x : target_filter_name) =
  match x with TARGET_STATUS -> `String "TARGET_STATUS"

let target_filter_to_yojson (x : target_filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson target_filter_name_to_yojson x.name);
      ("values", option_to_yojson target_filter_value_list_to_yojson x.values);
    ]

let target_filter_list_to_yojson tree = list_to_yojson target_filter_to_yojson tree

let list_deploy_action_execution_targets_input_to_yojson
    (x : list_deploy_action_execution_targets_input) =
  assoc_to_yojson
    [
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("actionExecutionId", Some (action_execution_id_to_yojson x.action_execution_id));
      ("filters", option_to_yojson target_filter_list_to_yojson x.filters);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_action_types_output_to_yojson (x : list_action_types_output) =
  assoc_to_yojson
    [
      ("actionTypes", Some (action_type_list_to_yojson x.action_types));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_action_types_input_to_yojson (x : list_action_types_input) =
  assoc_to_yojson
    [
      ("actionOwnerFilter", option_to_yojson action_owner_to_yojson x.action_owner_filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("regionFilter", option_to_yojson aws_region_name_to_yojson x.region_filter);
    ]

let list_action_executions_output_to_yojson (x : list_action_executions_output) =
  assoc_to_yojson
    [
      ( "actionExecutionDetails",
        option_to_yojson action_execution_detail_list_to_yojson x.action_execution_details );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_action_executions_input_to_yojson (x : list_action_executions_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("filter", option_to_yojson action_execution_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_job_exception_to_yojson (x : invalid_job_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let third_party_job_data_to_yojson (x : third_party_job_data) =
  assoc_to_yojson
    [
      ("actionTypeId", option_to_yojson action_type_id_to_yojson x.action_type_id);
      ("actionConfiguration", option_to_yojson action_configuration_to_yojson x.action_configuration);
      ("pipelineContext", option_to_yojson pipeline_context_to_yojson x.pipeline_context);
      ("inputArtifacts", option_to_yojson artifact_list_to_yojson x.input_artifacts);
      ("outputArtifacts", option_to_yojson artifact_list_to_yojson x.output_artifacts);
      ( "artifactCredentials",
        option_to_yojson aws_session_credentials_to_yojson x.artifact_credentials );
      ("continuationToken", option_to_yojson continuation_token_to_yojson x.continuation_token);
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
    ]

let third_party_job_details_to_yojson (x : third_party_job_details) =
  assoc_to_yojson
    [
      ("id", option_to_yojson third_party_job_id_to_yojson x.id);
      ("data", option_to_yojson third_party_job_data_to_yojson x.data);
      ("nonce", option_to_yojson nonce_to_yojson x.nonce);
    ]

let get_third_party_job_details_output_to_yojson (x : get_third_party_job_details_output) =
  assoc_to_yojson
    [ ("jobDetails", option_to_yojson third_party_job_details_to_yojson x.job_details) ]

let get_third_party_job_details_input_to_yojson (x : get_third_party_job_details_input) =
  assoc_to_yojson
    [
      ("jobId", Some (third_party_job_id_to_yojson x.job_id));
      ("clientToken", Some (client_token_to_yojson x.client_token));
    ]

let retry_trigger_to_yojson (x : retry_trigger) =
  match x with
  | AutomatedStageRetry -> `String "AutomatedStageRetry"
  | ManualStageRetry -> `String "ManualStageRetry"

let retry_attempt_to_yojson = int_to_yojson

let retry_stage_metadata_to_yojson (x : retry_stage_metadata) =
  assoc_to_yojson
    [
      ("autoStageRetryAttempt", option_to_yojson retry_attempt_to_yojson x.auto_stage_retry_attempt);
      ( "manualStageRetryAttempt",
        option_to_yojson retry_attempt_to_yojson x.manual_stage_retry_attempt );
      ("latestRetryTrigger", option_to_yojson retry_trigger_to_yojson x.latest_retry_trigger);
    ]

let rule_execution_token_to_yojson = string_to_yojson

let rule_execution_to_yojson (x : rule_execution) =
  assoc_to_yojson
    [
      ("ruleExecutionId", option_to_yojson rule_execution_id_to_yojson x.rule_execution_id);
      ("status", option_to_yojson rule_execution_status_to_yojson x.status);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
      ("token", option_to_yojson rule_execution_token_to_yojson x.token);
      ("lastUpdatedBy", option_to_yojson last_updated_by_to_yojson x.last_updated_by);
      ("externalExecutionId", option_to_yojson execution_id_to_yojson x.external_execution_id);
      ("externalExecutionUrl", option_to_yojson url_to_yojson x.external_execution_url);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
    ]

let rule_revision_to_yojson (x : rule_revision) =
  assoc_to_yojson
    [
      ("revisionId", Some (revision_to_yojson x.revision_id));
      ("revisionChangeId", Some (revision_change_identifier_to_yojson x.revision_change_id));
      ("created", Some (timestamp_to_yojson x.created));
    ]

let rule_state_to_yojson (x : rule_state) =
  assoc_to_yojson
    [
      ("ruleName", option_to_yojson rule_name_to_yojson x.rule_name);
      ("currentRevision", option_to_yojson rule_revision_to_yojson x.current_revision);
      ("latestExecution", option_to_yojson rule_execution_to_yojson x.latest_execution);
      ("entityUrl", option_to_yojson url_to_yojson x.entity_url);
      ("revisionUrl", option_to_yojson url_to_yojson x.revision_url);
    ]

let rule_state_list_to_yojson tree = list_to_yojson rule_state_to_yojson tree

let condition_execution_status_to_yojson (x : condition_execution_status) =
  match x with
  | InProgress -> `String "InProgress"
  | Failed -> `String "Failed"
  | Errored -> `String "Errored"
  | Succeeded -> `String "Succeeded"
  | Cancelled -> `String "Cancelled"
  | Abandoned -> `String "Abandoned"
  | Overridden -> `String "Overridden"

let condition_execution_to_yojson (x : condition_execution) =
  assoc_to_yojson
    [
      ("status", option_to_yojson condition_execution_status_to_yojson x.status);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
      ("lastStatusChange", option_to_yojson timestamp_to_yojson x.last_status_change);
    ]

let condition_state_to_yojson (x : condition_state) =
  assoc_to_yojson
    [
      ("latestExecution", option_to_yojson condition_execution_to_yojson x.latest_execution);
      ("ruleStates", option_to_yojson rule_state_list_to_yojson x.rule_states);
    ]

let condition_state_list_to_yojson tree = list_to_yojson condition_state_to_yojson tree

let stage_conditions_execution_to_yojson (x : stage_conditions_execution) =
  assoc_to_yojson
    [
      ("status", option_to_yojson condition_execution_status_to_yojson x.status);
      ("summary", option_to_yojson execution_summary_to_yojson x.summary);
    ]

let stage_condition_state_to_yojson (x : stage_condition_state) =
  assoc_to_yojson
    [
      ("latestExecution", option_to_yojson stage_conditions_execution_to_yojson x.latest_execution);
      ("conditionStates", option_to_yojson condition_state_list_to_yojson x.condition_states);
    ]

let stage_execution_status_to_yojson (x : stage_execution_status) =
  match x with
  | Cancelled -> `String "Cancelled"
  | InProgress -> `String "InProgress"
  | Failed -> `String "Failed"
  | Stopped -> `String "Stopped"
  | Stopping -> `String "Stopping"
  | Succeeded -> `String "Succeeded"
  | Skipped -> `String "Skipped"

let stage_execution_to_yojson (x : stage_execution) =
  assoc_to_yojson
    [
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
      ("status", Some (stage_execution_status_to_yojson x.status));
      ("type", option_to_yojson execution_type_to_yojson x.type_);
    ]

let disabled_reason_to_yojson = string_to_yojson
let last_changed_at_to_yojson = timestamp_epoch_seconds_to_yojson
let last_changed_by_to_yojson = string_to_yojson
let enabled_to_yojson = bool_to_yojson

let transition_state_to_yojson (x : transition_state) =
  assoc_to_yojson
    [
      ("enabled", option_to_yojson enabled_to_yojson x.enabled);
      ("lastChangedBy", option_to_yojson last_changed_by_to_yojson x.last_changed_by);
      ("lastChangedAt", option_to_yojson last_changed_at_to_yojson x.last_changed_at);
      ("disabledReason", option_to_yojson disabled_reason_to_yojson x.disabled_reason);
    ]

let stage_execution_list_to_yojson tree = list_to_yojson stage_execution_to_yojson tree

let stage_state_to_yojson (x : stage_state) =
  assoc_to_yojson
    [
      ("stageName", option_to_yojson stage_name_to_yojson x.stage_name);
      ("inboundExecution", option_to_yojson stage_execution_to_yojson x.inbound_execution);
      ("inboundExecutions", option_to_yojson stage_execution_list_to_yojson x.inbound_executions);
      ( "inboundTransitionState",
        option_to_yojson transition_state_to_yojson x.inbound_transition_state );
      ("actionStates", option_to_yojson action_state_list_to_yojson x.action_states);
      ("latestExecution", option_to_yojson stage_execution_to_yojson x.latest_execution);
      ( "beforeEntryConditionState",
        option_to_yojson stage_condition_state_to_yojson x.before_entry_condition_state );
      ( "onSuccessConditionState",
        option_to_yojson stage_condition_state_to_yojson x.on_success_condition_state );
      ( "onFailureConditionState",
        option_to_yojson stage_condition_state_to_yojson x.on_failure_condition_state );
      ("retryStageMetadata", option_to_yojson retry_stage_metadata_to_yojson x.retry_stage_metadata);
    ]

let stage_state_list_to_yojson tree = list_to_yojson stage_state_to_yojson tree

let get_pipeline_state_output_to_yojson (x : get_pipeline_state_output) =
  assoc_to_yojson
    [
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("stageStates", option_to_yojson stage_state_list_to_yojson x.stage_states);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
    ]

let get_pipeline_state_input_to_yojson (x : get_pipeline_state_input) =
  assoc_to_yojson [ ("name", Some (pipeline_name_to_yojson x.name)) ]

let resolved_pipeline_variable_to_yojson (x : resolved_pipeline_variable) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("resolvedValue", option_to_yojson string__to_yojson x.resolved_value);
    ]

let resolved_pipeline_variable_list_to_yojson tree =
  list_to_yojson resolved_pipeline_variable_to_yojson tree

let pipeline_execution_to_yojson (x : pipeline_execution) =
  assoc_to_yojson
    [
      ("pipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("pipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ( "pipelineExecutionId",
        option_to_yojson pipeline_execution_id_to_yojson x.pipeline_execution_id );
      ("status", option_to_yojson pipeline_execution_status_to_yojson x.status);
      ( "statusSummary",
        option_to_yojson pipeline_execution_status_summary_to_yojson x.status_summary );
      ("artifactRevisions", option_to_yojson artifact_revision_list_to_yojson x.artifact_revisions);
      ("variables", option_to_yojson resolved_pipeline_variable_list_to_yojson x.variables);
      ("trigger", option_to_yojson execution_trigger_to_yojson x.trigger);
      ("executionMode", option_to_yojson execution_mode_to_yojson x.execution_mode);
      ("executionType", option_to_yojson execution_type_to_yojson x.execution_type);
      ("rollbackMetadata", option_to_yojson pipeline_rollback_metadata_to_yojson x.rollback_metadata);
    ]

let get_pipeline_execution_output_to_yojson (x : get_pipeline_execution_output) =
  assoc_to_yojson
    [ ("pipelineExecution", option_to_yojson pipeline_execution_to_yojson x.pipeline_execution) ]

let get_pipeline_execution_input_to_yojson (x : get_pipeline_execution_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("pipelineExecutionId", Some (pipeline_execution_id_to_yojson x.pipeline_execution_id));
    ]

let pipeline_version_not_found_exception_to_yojson (x : pipeline_version_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let pipeline_metadata_to_yojson (x : pipeline_metadata) =
  assoc_to_yojson
    [
      ("pipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
      ("created", option_to_yojson timestamp_to_yojson x.created);
      ("updated", option_to_yojson timestamp_to_yojson x.updated);
      ("pollingDisabledAt", option_to_yojson timestamp_to_yojson x.polling_disabled_at);
    ]

let get_pipeline_output_to_yojson (x : get_pipeline_output) =
  assoc_to_yojson
    [
      ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline);
      ("metadata", option_to_yojson pipeline_metadata_to_yojson x.metadata);
    ]

let get_pipeline_input_to_yojson (x : get_pipeline_input) =
  assoc_to_yojson
    [
      ("name", Some (pipeline_name_to_yojson x.name));
      ("version", option_to_yojson pipeline_version_to_yojson x.version);
    ]

let job_details_to_yojson (x : job_details) =
  assoc_to_yojson
    [
      ("id", option_to_yojson job_id_to_yojson x.id);
      ("data", option_to_yojson job_data_to_yojson x.data);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
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
      ("category", Some (action_category_to_yojson x.category));
      ("owner", Some (action_type_owner_to_yojson x.owner));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
    ]

let stage_transition_type_to_yojson (x : stage_transition_type) =
  match x with Inbound -> `String "Inbound" | Outbound -> `String "Outbound"

let enable_stage_transition_input_to_yojson (x : enable_stage_transition_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("transitionType", Some (stage_transition_type_to_yojson x.transition_type));
    ]

let disable_stage_transition_input_to_yojson (x : disable_stage_transition_input) =
  assoc_to_yojson
    [
      ("pipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
      ("stageName", Some (stage_name_to_yojson x.stage_name));
      ("transitionType", Some (stage_transition_type_to_yojson x.transition_type));
      ("reason", Some (disabled_reason_to_yojson x.reason));
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
      ("category", Some (action_category_to_yojson x.category));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
    ]

let pipeline_name_in_use_exception_to_yojson (x : pipeline_name_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_pipeline_output_to_yojson (x : create_pipeline_output) =
  assoc_to_yojson
    [
      ("pipeline", option_to_yojson pipeline_declaration_to_yojson x.pipeline);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_pipeline_input_to_yojson (x : create_pipeline_input) =
  assoc_to_yojson
    [
      ("pipeline", Some (pipeline_declaration_to_yojson x.pipeline));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_custom_action_type_output_to_yojson (x : create_custom_action_type_output) =
  assoc_to_yojson
    [
      ("actionType", Some (action_type_to_yojson x.action_type));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_custom_action_type_input_to_yojson (x : create_custom_action_type_input) =
  assoc_to_yojson
    [
      ("category", Some (action_category_to_yojson x.category));
      ("provider", Some (action_provider_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
      ("settings", option_to_yojson action_type_settings_to_yojson x.settings);
      ( "configurationProperties",
        option_to_yojson action_configuration_property_list_to_yojson x.configuration_properties );
      ("inputArtifactDetails", Some (artifact_details_to_yojson x.input_artifact_details));
      ("outputArtifactDetails", Some (artifact_details_to_yojson x.output_artifact_details));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
