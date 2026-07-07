open Smaws_Lib.Json.SerializeHelpers
open Types

let verbose_to_yojson = bool_to_yojson
let user_arn_session_to_yojson = string_to_yojson
let user_arn_to_yojson = string_to_yojson
let use_previous_value_to_yojson = bool_to_yojson
let instruction_type_to_yojson = string_to_yojson
let instruction_value_to_yojson = string_to_yojson

let usage_instruction_to_yojson (x : usage_instruction) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson instruction_value_to_yojson x.value);
      ("Type", option_to_yojson instruction_type_to_yojson x.type_);
    ]

let usage_instructions_to_yojson tree = list_to_yojson usage_instruction_to_yojson tree
let updated_time_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_option_key_to_yojson = string_to_yojson
let tag_option_value_to_yojson = string_to_yojson
let tag_option_active_to_yojson = bool_to_yojson
let tag_option_id_to_yojson = string_to_yojson
let owner_to_yojson = string_to_yojson

let tag_option_detail_to_yojson (x : tag_option_detail) =
  assoc_to_yojson
    [
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("Id", option_to_yojson tag_option_id_to_yojson x.id);
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
    ]

let update_tag_option_output_to_yojson (x : update_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let update_tag_option_input_to_yojson (x : update_tag_option_input) =
  assoc_to_yojson
    [
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Id", Some (tag_option_id_to_yojson x.id));
    ]

let error_message_to_yojson = string_to_yojson

let tag_option_not_migrated_exception_to_yojson (x : tag_option_not_migrated_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameters_exception_to_yojson (x : invalid_parameters_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_resource_exception_to_yojson (x : duplicate_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let id_to_yojson = string_to_yojson
let service_action_name_to_yojson = string_to_yojson
let service_action_description_to_yojson = string_to_yojson

let service_action_definition_type_to_yojson (x : service_action_definition_type) =
  match x with SsmAutomation -> `String "SSM_AUTOMATION"

let service_action_summary_to_yojson (x : service_action_summary) =
  assoc_to_yojson
    [
      ("DefinitionType", option_to_yojson service_action_definition_type_to_yojson x.definition_type);
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("Name", option_to_yojson service_action_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let service_action_definition_value_to_yojson = string_to_yojson

let service_action_definition_key_to_yojson (x : service_action_definition_key) =
  match x with
  | Parameters -> `String "Parameters"
  | AssumeRole -> `String "AssumeRole"
  | Version -> `String "Version"
  | Name -> `String "Name"

let service_action_definition_map_to_yojson tree =
  map_to_yojson service_action_definition_key_to_yojson service_action_definition_value_to_yojson
    tree

let service_action_detail_to_yojson (x : service_action_detail) =
  assoc_to_yojson
    [
      ("Definition", option_to_yojson service_action_definition_map_to_yojson x.definition);
      ( "ServiceActionSummary",
        option_to_yojson service_action_summary_to_yojson x.service_action_summary );
    ]

let update_service_action_output_to_yojson (x : update_service_action_output) =
  assoc_to_yojson
    [
      ( "ServiceActionDetail",
        option_to_yojson service_action_detail_to_yojson x.service_action_detail );
    ]

let accept_language_to_yojson = string_to_yojson

let update_service_action_input_to_yojson (x : update_service_action_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("Definition", option_to_yojson service_action_definition_map_to_yojson x.definition);
      ("Name", option_to_yojson service_action_name_to_yojson x.name);
      ("Id", Some (id_to_yojson x.id));
    ]

let account_id_to_yojson = string_to_yojson
let stack_set_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree
let region_to_yojson = string_to_yojson
let stack_set_regions_to_yojson tree = list_to_yojson region_to_yojson tree
let stack_set_failure_tolerance_count_to_yojson = int_to_yojson
let stack_set_failure_tolerance_percentage_to_yojson = int_to_yojson
let stack_set_max_concurrency_count_to_yojson = int_to_yojson
let stack_set_max_concurrency_percentage_to_yojson = int_to_yojson

let stack_set_operation_type_to_yojson (x : stack_set_operation_type) =
  match x with
  | DELETE -> `String "DELETE"
  | UPDATE -> `String "UPDATE"
  | CREATE -> `String "CREATE"

let update_provisioning_preferences_to_yojson (x : update_provisioning_preferences) =
  assoc_to_yojson
    [
      ( "StackSetOperationType",
        option_to_yojson stack_set_operation_type_to_yojson x.stack_set_operation_type );
      ( "StackSetMaxConcurrencyPercentage",
        option_to_yojson stack_set_max_concurrency_percentage_to_yojson
          x.stack_set_max_concurrency_percentage );
      ( "StackSetMaxConcurrencyCount",
        option_to_yojson stack_set_max_concurrency_count_to_yojson x.stack_set_max_concurrency_count
      );
      ( "StackSetFailureTolerancePercentage",
        option_to_yojson stack_set_failure_tolerance_percentage_to_yojson
          x.stack_set_failure_tolerance_percentage );
      ( "StackSetFailureToleranceCount",
        option_to_yojson stack_set_failure_tolerance_count_to_yojson
          x.stack_set_failure_tolerance_count );
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
    ]

let parameter_key_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson

let update_provisioning_parameter_to_yojson (x : update_provisioning_parameter) =
  assoc_to_yojson
    [
      ("UsePreviousValue", option_to_yojson use_previous_value_to_yojson x.use_previous_value);
      ("Value", option_to_yojson parameter_value_to_yojson x.value);
      ("Key", option_to_yojson parameter_key_to_yojson x.key);
    ]

let update_provisioning_parameters_to_yojson tree =
  list_to_yojson update_provisioning_parameter_to_yojson tree

let provisioning_artifact_name_to_yojson = string_to_yojson

let provisioning_artifact_type_to_yojson (x : provisioning_artifact_type) =
  match x with
  | EXTERNAL -> `String "EXTERNAL"
  | TERRAFORM_CLOUD -> `String "TERRAFORM_CLOUD"
  | TERRAFORM_OPEN_SOURCE -> `String "TERRAFORM_OPEN_SOURCE"
  | MARKETPLACE_CAR -> `String "MARKETPLACE_CAR"
  | MARKETPLACE_AMI -> `String "MARKETPLACE_AMI"
  | CLOUD_FORMATION_TEMPLATE -> `String "CLOUD_FORMATION_TEMPLATE"

let creation_time_to_yojson = timestamp_epoch_seconds_to_yojson
let provisioning_artifact_active_to_yojson = bool_to_yojson

let provisioning_artifact_guidance_to_yojson (x : provisioning_artifact_guidance) =
  match x with DEPRECATED -> `String "DEPRECATED" | DEFAULT -> `String "DEFAULT"

let source_revision_to_yojson = string_to_yojson

let provisioning_artifact_detail_to_yojson (x : provisioning_artifact_detail) =
  assoc_to_yojson
    [
      ("SourceRevision", option_to_yojson source_revision_to_yojson x.source_revision);
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
      ("Active", option_to_yojson provisioning_artifact_active_to_yojson x.active);
      ("CreatedTime", option_to_yojson creation_time_to_yojson x.created_time);
      ("Type", option_to_yojson provisioning_artifact_type_to_yojson x.type_);
      ("Description", option_to_yojson provisioning_artifact_name_to_yojson x.description);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let provisioning_artifact_info_value_to_yojson = string_to_yojson
let provisioning_artifact_info_key_to_yojson = string_to_yojson

let provisioning_artifact_info_to_yojson tree =
  map_to_yojson provisioning_artifact_info_key_to_yojson provisioning_artifact_info_value_to_yojson
    tree

let status_to_yojson (x : status) =
  match x with
  | FAILED -> `String "FAILED"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let update_provisioning_artifact_output_to_yojson (x : update_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
    ]

let provisioning_artifact_description_to_yojson = string_to_yojson

let update_provisioning_artifact_input_to_yojson (x : update_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
      ("Active", option_to_yojson provisioning_artifact_active_to_yojson x.active);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let property_value_to_yojson = string_to_yojson

let property_key_to_yojson (x : property_key) =
  match x with LaunchRole -> `String "LAUNCH_ROLE" | Owner -> `String "OWNER"

let provisioned_product_properties_to_yojson tree =
  map_to_yojson property_key_to_yojson property_value_to_yojson tree

let record_status_to_yojson (x : record_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS_IN_ERROR -> `String "IN_PROGRESS_IN_ERROR"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CREATED -> `String "CREATED"

let update_provisioned_product_properties_output_to_yojson
    (x : update_provisioned_product_properties_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson record_status_to_yojson x.status);
      ("RecordId", option_to_yojson id_to_yojson x.record_id);
      ( "ProvisionedProductProperties",
        option_to_yojson provisioned_product_properties_to_yojson x.provisioned_product_properties
      );
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
    ]

let idempotency_token_to_yojson = string_to_yojson

let update_provisioned_product_properties_input_to_yojson
    (x : update_provisioned_product_properties_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ( "ProvisionedProductProperties",
        Some (provisioned_product_properties_to_yojson x.provisioned_product_properties) );
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let provisioned_product_name_to_yojson = string_to_yojson
let created_time_to_yojson = timestamp_epoch_seconds_to_yojson
let provisioned_product_type_to_yojson = string_to_yojson
let record_type_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson
let error_description_to_yojson = string_to_yojson

let record_error_to_yojson (x : record_error) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson error_description_to_yojson x.description);
      ("Code", option_to_yojson error_code_to_yojson x.code);
    ]

let record_errors_to_yojson tree = list_to_yojson record_error_to_yojson tree
let record_tag_key_to_yojson = string_to_yojson
let record_tag_value_to_yojson = string_to_yojson

let record_tag_to_yojson (x : record_tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson record_tag_value_to_yojson x.value);
      ("Key", option_to_yojson record_tag_key_to_yojson x.key);
    ]

let record_tags_to_yojson tree = list_to_yojson record_tag_to_yojson tree
let role_arn_to_yojson = string_to_yojson

let record_detail_to_yojson (x : record_detail) =
  assoc_to_yojson
    [
      ("LaunchRoleArn", option_to_yojson role_arn_to_yojson x.launch_role_arn);
      ("RecordTags", option_to_yojson record_tags_to_yojson x.record_tags);
      ("RecordErrors", option_to_yojson record_errors_to_yojson x.record_errors);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ("RecordType", option_to_yojson record_type_to_yojson x.record_type);
      ( "ProvisionedProductType",
        option_to_yojson provisioned_product_type_to_yojson x.provisioned_product_type );
      ("UpdatedTime", option_to_yojson updated_time_to_yojson x.updated_time);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("Status", option_to_yojson record_status_to_yojson x.status);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("RecordId", option_to_yojson id_to_yojson x.record_id);
    ]

let update_provisioned_product_output_to_yojson (x : update_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let provisioned_product_name_or_arn_to_yojson = string_to_yojson
let product_view_name_to_yojson = string_to_yojson
let portfolio_display_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let update_provisioned_product_input_to_yojson (x : update_provisioned_product_input) =
  assoc_to_yojson
    [
      ("UpdateToken", Some (idempotency_token_to_yojson x.update_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ProvisioningPreferences",
        option_to_yojson update_provisioning_preferences_to_yojson x.provisioning_preferences );
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_or_arn_to_yojson x.provisioned_product_name );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let product_view_owner_to_yojson = string_to_yojson
let product_view_short_description_to_yojson = string_to_yojson

let product_type_to_yojson (x : product_type) =
  match x with
  | EXTERNAL -> `String "EXTERNAL"
  | TERRAFORM_CLOUD -> `String "TERRAFORM_CLOUD"
  | TERRAFORM_OPEN_SOURCE -> `String "TERRAFORM_OPEN_SOURCE"
  | MARKETPLACE -> `String "MARKETPLACE"
  | CLOUD_FORMATION_TEMPLATE -> `String "CLOUD_FORMATION_TEMPLATE"

let product_view_distributor_to_yojson = string_to_yojson
let has_default_path_to_yojson = bool_to_yojson
let support_email_to_yojson = string_to_yojson
let support_description_to_yojson = string_to_yojson
let support_url_to_yojson = string_to_yojson

let product_view_summary_to_yojson (x : product_view_summary) =
  assoc_to_yojson
    [
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("HasDefaultPath", option_to_yojson has_default_path_to_yojson x.has_default_path);
      ("Distributor", option_to_yojson product_view_distributor_to_yojson x.distributor);
      ("Type", option_to_yojson product_type_to_yojson x.type_);
      ( "ShortDescription",
        option_to_yojson product_view_short_description_to_yojson x.short_description );
      ("Owner", option_to_yojson product_view_owner_to_yojson x.owner);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let resource_ar_n_to_yojson = string_to_yojson
let source_type_to_yojson (x : source_type) = match x with CODESTAR -> `String "CODESTAR"
let code_star_connection_arn_to_yojson = string_to_yojson
let repository_to_yojson = string_to_yojson
let repository_branch_to_yojson = string_to_yojson
let repository_artifact_path_to_yojson = string_to_yojson

let code_star_parameters_to_yojson (x : code_star_parameters) =
  assoc_to_yojson
    [
      ("ArtifactPath", Some (repository_artifact_path_to_yojson x.artifact_path));
      ("Branch", Some (repository_branch_to_yojson x.branch));
      ("Repository", Some (repository_to_yojson x.repository));
      ("ConnectionArn", Some (code_star_connection_arn_to_yojson x.connection_arn));
    ]

let source_connection_parameters_to_yojson (x : source_connection_parameters) =
  assoc_to_yojson [ ("CodeStar", option_to_yojson code_star_parameters_to_yojson x.code_star) ]

let last_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson

let last_sync_status_to_yojson (x : last_sync_status) =
  match x with FAILED -> `String "FAILED" | SUCCEEDED -> `String "SUCCEEDED"

let last_sync_status_message_to_yojson = string_to_yojson
let last_successful_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson

let last_sync_to_yojson (x : last_sync) =
  assoc_to_yojson
    [
      ( "LastSuccessfulSyncProvisioningArtifactId",
        option_to_yojson id_to_yojson x.last_successful_sync_provisioning_artifact_id );
      ( "LastSuccessfulSyncTime",
        option_to_yojson last_successful_sync_time_to_yojson x.last_successful_sync_time );
      ( "LastSyncStatusMessage",
        option_to_yojson last_sync_status_message_to_yojson x.last_sync_status_message );
      ("LastSyncStatus", option_to_yojson last_sync_status_to_yojson x.last_sync_status);
      ("LastSyncTime", option_to_yojson last_sync_time_to_yojson x.last_sync_time);
    ]

let source_connection_detail_to_yojson (x : source_connection_detail) =
  assoc_to_yojson
    [
      ("LastSync", option_to_yojson last_sync_to_yojson x.last_sync);
      ( "ConnectionParameters",
        option_to_yojson source_connection_parameters_to_yojson x.connection_parameters );
      ("Type", option_to_yojson source_type_to_yojson x.type_);
    ]

let product_view_detail_to_yojson (x : product_view_detail) =
  assoc_to_yojson
    [
      ("SourceConnection", option_to_yojson source_connection_detail_to_yojson x.source_connection);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("ProductARN", option_to_yojson resource_ar_n_to_yojson x.product_ar_n);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
    ]

let update_product_output_to_yojson (x : update_product_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
    ]

let add_tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let source_connection_to_yojson (x : source_connection) =
  assoc_to_yojson
    [
      ("ConnectionParameters", Some (source_connection_parameters_to_yojson x.connection_parameters));
      ("Type", option_to_yojson source_type_to_yojson x.type_);
    ]

let update_product_input_to_yojson (x : update_product_input) =
  assoc_to_yojson
    [
      ("SourceConnection", option_to_yojson source_connection_to_yojson x.source_connection);
      ("RemoveTags", option_to_yojson tag_keys_to_yojson x.remove_tags);
      ("AddTags", option_to_yojson add_tags_to_yojson x.add_tags);
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("Distributor", option_to_yojson product_view_owner_to_yojson x.distributor);
      ("Description", option_to_yojson product_view_short_description_to_yojson x.description);
      ("Owner", option_to_yojson product_view_owner_to_yojson x.owner);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let share_status_to_yojson (x : share_status) =
  match x with
  | ERROR -> `String "ERROR"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | NOT_STARTED -> `String "NOT_STARTED"

let update_portfolio_share_output_to_yojson (x : update_portfolio_share_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson share_status_to_yojson x.status);
      ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token);
    ]

let organization_node_type_to_yojson (x : organization_node_type) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ORGANIZATION -> `String "ORGANIZATION"

let organization_node_value_to_yojson = string_to_yojson

let organization_node_to_yojson (x : organization_node) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson organization_node_value_to_yojson x.value);
      ("Type", option_to_yojson organization_node_type_to_yojson x.type_);
    ]

let nullable_boolean_to_yojson = bool_to_yojson

let update_portfolio_share_input_to_yojson (x : update_portfolio_share_input) =
  assoc_to_yojson
    [
      ("SharePrincipals", option_to_yojson nullable_boolean_to_yojson x.share_principals);
      ("ShareTagOptions", option_to_yojson nullable_boolean_to_yojson x.share_tag_options);
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let portfolio_description_to_yojson = string_to_yojson
let provider_name_to_yojson = string_to_yojson

let portfolio_detail_to_yojson (x : portfolio_detail) =
  assoc_to_yojson
    [
      ("ProviderName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("CreatedTime", option_to_yojson creation_time_to_yojson x.created_time);
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("DisplayName", option_to_yojson portfolio_display_name_to_yojson x.display_name);
      ("ARN", option_to_yojson resource_ar_n_to_yojson x.ar_n);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let update_portfolio_output_to_yojson (x : update_portfolio_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
    ]

let update_portfolio_input_to_yojson (x : update_portfolio_input) =
  assoc_to_yojson
    [
      ("RemoveTags", option_to_yojson tag_keys_to_yojson x.remove_tags);
      ("AddTags", option_to_yojson add_tags_to_yojson x.add_tags);
      ("ProviderName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("DisplayName", option_to_yojson portfolio_display_name_to_yojson x.display_name);
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let constraint_type_to_yojson = string_to_yojson
let constraint_description_to_yojson = string_to_yojson

let constraint_detail_to_yojson (x : constraint_detail) =
  assoc_to_yojson
    [
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("Owner", option_to_yojson account_id_to_yojson x.owner);
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Type", option_to_yojson constraint_type_to_yojson x.type_);
      ("ConstraintId", option_to_yojson id_to_yojson x.constraint_id);
    ]

let constraint_parameters_to_yojson = string_to_yojson

let update_constraint_output_to_yojson (x : update_constraint_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
    ]

let update_constraint_input_to_yojson (x : update_constraint_input) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson constraint_parameters_to_yojson x.parameters);
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let unique_tag_value_to_yojson = string_to_yojson
let unique_tag_key_to_yojson = string_to_yojson

let unique_tag_resource_identifier_to_yojson (x : unique_tag_resource_identifier) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson unique_tag_value_to_yojson x.value);
      ("Key", option_to_yojson unique_tag_key_to_yojson x.key);
    ]

let total_results_count_to_yojson = int_to_yojson

let terminate_provisioned_product_output_to_yojson (x : terminate_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let ignore_errors_to_yojson = bool_to_yojson
let retain_physical_resources_to_yojson = bool_to_yojson

let terminate_provisioned_product_input_to_yojson (x : terminate_provisioned_product_input) =
  assoc_to_yojson
    [
      ( "RetainPhysicalResources",
        option_to_yojson retain_physical_resources_to_yojson x.retain_physical_resources );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("IgnoreErrors", option_to_yojson ignore_errors_to_yojson x.ignore_errors);
      ("TerminateToken", Some (idempotency_token_to_yojson x.terminate_token));
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_or_arn_to_yojson x.provisioned_product_name );
    ]

let tag_option_values_to_yojson tree = list_to_yojson tag_option_value_to_yojson tree

let tag_option_summary_to_yojson (x : tag_option_summary) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson tag_option_values_to_yojson x.values);
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
    ]

let tag_option_summaries_to_yojson tree = list_to_yojson tag_option_summary_to_yojson tree
let tag_option_details_to_yojson tree = list_to_yojson tag_option_detail_to_yojson tree
let successful_shares_to_yojson tree = list_to_yojson account_id_to_yojson tree
let string__to_yojson = string_to_yojson
let status_message_to_yojson = string_to_yojson
let status_detail_to_yojson = string_to_yojson

let stack_instance_status_to_yojson (x : stack_instance_status) =
  match x with
  | INOPERABLE -> `String "INOPERABLE"
  | OUTDATED -> `String "OUTDATED"
  | CURRENT -> `String "CURRENT"

let stack_instance_to_yojson (x : stack_instance) =
  assoc_to_yojson
    [
      ( "StackInstanceStatus",
        option_to_yojson stack_instance_status_to_yojson x.stack_instance_status );
      ("Region", option_to_yojson region_to_yojson x.region);
      ("Account", option_to_yojson account_id_to_yojson x.account);
    ]

let stack_instances_to_yojson tree = list_to_yojson stack_instance_to_yojson tree
let provisioning_artifact_property_value_to_yojson = string_to_yojson

let provisioning_artifact_property_name_to_yojson (x : provisioning_artifact_property_name) =
  match x with Id -> `String "Id"

let source_provisioning_artifact_properties_map_to_yojson tree =
  map_to_yojson provisioning_artifact_property_name_to_yojson
    provisioning_artifact_property_value_to_yojson tree

let source_provisioning_artifact_properties_to_yojson tree =
  list_to_yojson source_provisioning_artifact_properties_map_to_yojson tree

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let sort_field_to_yojson = string_to_yojson
let namespaces_to_yojson tree = list_to_yojson account_id_to_yojson tree
let message_to_yojson = string_to_yojson
let error_to_yojson = string_to_yojson

let share_error_to_yojson (x : share_error) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson error_to_yojson x.error);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Accounts", option_to_yojson namespaces_to_yojson x.accounts);
    ]

let share_errors_to_yojson tree = list_to_yojson share_error_to_yojson tree

let share_details_to_yojson (x : share_details) =
  assoc_to_yojson
    [
      ("ShareErrors", option_to_yojson share_errors_to_yojson x.share_errors);
      ("SuccessfulShares", option_to_yojson successful_shares_to_yojson x.successful_shares);
    ]

let service_action_summaries_to_yojson tree = list_to_yojson service_action_summary_to_yojson tree

let service_action_association_to_yojson (x : service_action_association) =
  assoc_to_yojson
    [
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
    ]

let service_action_associations_to_yojson tree =
  list_to_yojson service_action_association_to_yojson tree

let service_action_association_error_message_to_yojson = string_to_yojson

let service_action_association_error_code_to_yojson (x : service_action_association_error_code) =
  match x with
  | InvalidParameterException -> `String "INVALID_PARAMETER"
  | ThrottlingException -> `String "THROTTLING"
  | ResourceNotFoundException -> `String "RESOURCE_NOT_FOUND"
  | LimitExceededException -> `String "LIMIT_EXCEEDED"
  | InternalFailure -> `String "INTERNAL_FAILURE"
  | DuplicateResourceException -> `String "DUPLICATE_RESOURCE"

let search_provisioned_products_page_size_to_yojson = int_to_yojson

let provisioned_product_status_to_yojson (x : provisioned_product_status) =
  match x with
  | PLAN_IN_PROGRESS -> `String "PLAN_IN_PROGRESS"
  | ERROR -> `String "ERROR"
  | TAINTED -> `String "TAINTED"
  | UNDER_CHANGE -> `String "UNDER_CHANGE"
  | AVAILABLE -> `String "AVAILABLE"

let provisioned_product_status_message_to_yojson = string_to_yojson
let physical_id_to_yojson = string_to_yojson

let provisioned_product_attribute_to_yojson (x : provisioned_product_attribute) =
  assoc_to_yojson
    [
      ("UserArnSession", option_to_yojson user_arn_session_to_yojson x.user_arn_session);
      ("UserArn", option_to_yojson user_arn_to_yojson x.user_arn);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PhysicalId", option_to_yojson physical_id_to_yojson x.physical_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "LastSuccessfulProvisioningRecordId",
        option_to_yojson id_to_yojson x.last_successful_provisioning_record_id );
      ("LastProvisioningRecordId", option_to_yojson id_to_yojson x.last_provisioning_record_id);
      ("LastRecordId", option_to_yojson id_to_yojson x.last_record_id);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ( "StatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson x.status_message );
      ("Status", option_to_yojson provisioned_product_status_to_yojson x.status);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Type", option_to_yojson provisioned_product_type_to_yojson x.type_);
      ("Arn", option_to_yojson provisioned_product_name_or_arn_to_yojson x.arn);
      ("Name", option_to_yojson provisioned_product_name_or_arn_to_yojson x.name);
    ]

let provisioned_product_attributes_to_yojson tree =
  list_to_yojson provisioned_product_attribute_to_yojson tree

let page_token_to_yojson = string_to_yojson

let search_provisioned_products_output_to_yojson (x : search_provisioned_products_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("TotalResultsCount", option_to_yojson total_results_count_to_yojson x.total_results_count);
      ( "ProvisionedProducts",
        option_to_yojson provisioned_product_attributes_to_yojson x.provisioned_products );
    ]

let access_level_filter_key_to_yojson (x : access_level_filter_key) =
  match x with USER -> `String "User" | ROLE -> `String "Role" | ACCOUNT -> `String "Account"

let access_level_filter_value_to_yojson = string_to_yojson

let access_level_filter_to_yojson (x : access_level_filter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson access_level_filter_value_to_yojson x.value);
      ("Key", option_to_yojson access_level_filter_key_to_yojson x.key);
    ]

let provisioned_product_view_filter_value_to_yojson = string_to_yojson

let provisioned_product_view_filter_values_to_yojson tree =
  list_to_yojson provisioned_product_view_filter_value_to_yojson tree

let provisioned_product_view_filter_by_to_yojson (x : provisioned_product_view_filter_by) =
  match x with SearchQuery -> `String "SearchQuery"

let provisioned_product_filters_to_yojson tree =
  map_to_yojson provisioned_product_view_filter_by_to_yojson
    provisioned_product_view_filter_values_to_yojson tree

let search_provisioned_products_input_to_yojson (x : search_provisioned_products_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson search_provisioned_products_page_size_to_yojson x.page_size);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_field_to_yojson x.sort_by);
      ("Filters", option_to_yojson provisioned_product_filters_to_yojson x.filters);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let product_view_summaries_to_yojson tree = list_to_yojson product_view_summary_to_yojson tree
let attribute_value_to_yojson = string_to_yojson
let approximate_count_to_yojson = int_to_yojson

let product_view_aggregation_value_to_yojson (x : product_view_aggregation_value) =
  assoc_to_yojson
    [
      ("ApproximateCount", option_to_yojson approximate_count_to_yojson x.approximate_count);
      ("Value", option_to_yojson attribute_value_to_yojson x.value);
    ]

let product_view_aggregation_values_to_yojson tree =
  list_to_yojson product_view_aggregation_value_to_yojson tree

let product_view_aggregation_type_to_yojson = string_to_yojson

let product_view_aggregations_to_yojson tree =
  map_to_yojson product_view_aggregation_type_to_yojson product_view_aggregation_values_to_yojson
    tree

let search_products_output_to_yojson (x : search_products_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ProductViewAggregations",
        option_to_yojson product_view_aggregations_to_yojson x.product_view_aggregations );
      ( "ProductViewSummaries",
        option_to_yojson product_view_summaries_to_yojson x.product_view_summaries );
    ]

let product_view_filter_value_to_yojson = string_to_yojson

let product_view_filter_values_to_yojson tree =
  list_to_yojson product_view_filter_value_to_yojson tree

let product_view_filter_by_to_yojson (x : product_view_filter_by) =
  match x with
  | SourceProductId -> `String "SourceProductId"
  | ProductType -> `String "ProductType"
  | Owner -> `String "Owner"
  | FullTextSearch -> `String "FullTextSearch"

let product_view_filters_to_yojson tree =
  map_to_yojson product_view_filter_by_to_yojson product_view_filter_values_to_yojson tree

let page_size_max100_to_yojson = int_to_yojson

let product_view_sort_by_to_yojson (x : product_view_sort_by) =
  match x with
  | CreationDate -> `String "CreationDate"
  | VersionCount -> `String "VersionCount"
  | Title -> `String "Title"

let search_products_input_to_yojson (x : search_products_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson product_view_sort_by_to_yojson x.sort_by);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("Filters", option_to_yojson product_view_filters_to_yojson x.filters);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let product_view_details_to_yojson tree = list_to_yojson product_view_detail_to_yojson tree

let search_products_as_admin_output_to_yojson (x : search_products_as_admin_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("ProductViewDetails", option_to_yojson product_view_details_to_yojson x.product_view_details);
    ]

let page_size_to_yojson = int_to_yojson
let product_source_to_yojson (x : product_source) = match x with ACCOUNT -> `String "ACCOUNT"

let search_products_as_admin_input_to_yojson (x : search_products_as_admin_input) =
  assoc_to_yojson
    [
      ("ProductSource", option_to_yojson product_source_to_yojson x.product_source);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson product_view_sort_by_to_yojson x.sort_by);
      ("Filters", option_to_yojson product_view_filters_to_yojson x.filters);
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let search_filter_value_to_yojson = string_to_yojson
let search_filter_key_to_yojson = string_to_yojson

let resource_attribute_to_yojson (x : resource_attribute) =
  match x with
  | TAGS -> `String "TAGS"
  | DELETIONPOLICY -> `String "DELETIONPOLICY"
  | UPDATEPOLICY -> `String "UPDATEPOLICY"
  | CREATIONPOLICY -> `String "CREATIONPOLICY"
  | METADATA -> `String "METADATA"
  | PROPERTIES -> `String "PROPERTIES"

let scope_to_yojson tree = list_to_yojson resource_attribute_to_yojson tree
let provisioned_product_id_to_yojson = string_to_yojson
let last_request_id_to_yojson = string_to_yojson

let provisioned_product_detail_to_yojson (x : provisioned_product_detail) =
  assoc_to_yojson
    [
      ("LaunchRoleArn", option_to_yojson role_arn_to_yojson x.launch_role_arn);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ( "LastSuccessfulProvisioningRecordId",
        option_to_yojson id_to_yojson x.last_successful_provisioning_record_id );
      ("LastProvisioningRecordId", option_to_yojson id_to_yojson x.last_provisioning_record_id);
      ("LastRecordId", option_to_yojson last_request_id_to_yojson x.last_record_id);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ( "StatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson x.status_message );
      ("Status", option_to_yojson provisioned_product_status_to_yojson x.status);
      ("Id", option_to_yojson provisioned_product_id_to_yojson x.id);
      ("Type", option_to_yojson provisioned_product_type_to_yojson x.type_);
      ("Arn", option_to_yojson provisioned_product_name_or_arn_to_yojson x.arn);
      ("Name", option_to_yojson provisioned_product_name_or_arn_to_yojson x.name);
    ]

let provisioned_product_details_to_yojson tree =
  list_to_yojson provisioned_product_detail_to_yojson tree

let scan_provisioned_products_output_to_yojson (x : scan_provisioned_products_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ProvisionedProducts",
        option_to_yojson provisioned_product_details_to_yojson x.provisioned_products );
    ]

let scan_provisioned_products_input_to_yojson (x : scan_provisioned_products_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let resource_type_to_yojson = string_to_yojson
let property_name_to_yojson = string_to_yojson

let requires_recreation_to_yojson (x : requires_recreation) =
  match x with
  | ALWAYS -> `String "ALWAYS"
  | CONDITIONALLY -> `String "CONDITIONALLY"
  | NEVER -> `String "NEVER"

let resource_target_definition_to_yojson (x : resource_target_definition) =
  assoc_to_yojson
    [
      ("RequiresRecreation", option_to_yojson requires_recreation_to_yojson x.requires_recreation);
      ("Name", option_to_yojson property_name_to_yojson x.name);
      ("Attribute", option_to_yojson resource_attribute_to_yojson x.attribute);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_id_to_yojson = string_to_yojson
let resource_detail_id_to_yojson = string_to_yojson
let resource_detail_ar_n_to_yojson = string_to_yojson
let resource_detail_name_to_yojson = string_to_yojson
let resource_detail_description_to_yojson = string_to_yojson
let resource_detail_created_time_to_yojson = timestamp_epoch_seconds_to_yojson

let resource_detail_to_yojson (x : resource_detail) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson resource_detail_created_time_to_yojson x.created_time);
      ("Description", option_to_yojson resource_detail_description_to_yojson x.description);
      ("Name", option_to_yojson resource_detail_name_to_yojson x.name);
      ("ARN", option_to_yojson resource_detail_ar_n_to_yojson x.ar_n);
      ("Id", option_to_yojson resource_detail_id_to_yojson x.id);
    ]

let resource_details_to_yojson tree = list_to_yojson resource_detail_to_yojson tree

let change_action_to_yojson (x : change_action) =
  match x with REMOVE -> `String "REMOVE" | MODIFY -> `String "MODIFY" | ADD -> `String "ADD"

let logical_resource_id_to_yojson = string_to_yojson
let physical_resource_id_to_yojson = string_to_yojson
let plan_resource_type_to_yojson = string_to_yojson

let replacement_to_yojson (x : replacement) =
  match x with
  | CONDITIONAL -> `String "CONDITIONAL"
  | FALSE -> `String "FALSE"
  | TRUE -> `String "TRUE"

let evaluation_type_to_yojson (x : evaluation_type) =
  match x with DYNAMIC -> `String "DYNAMIC" | STATIC -> `String "STATIC"

let causing_entity_to_yojson = string_to_yojson

let resource_change_detail_to_yojson (x : resource_change_detail) =
  assoc_to_yojson
    [
      ("CausingEntity", option_to_yojson causing_entity_to_yojson x.causing_entity);
      ("Evaluation", option_to_yojson evaluation_type_to_yojson x.evaluation);
      ("Target", option_to_yojson resource_target_definition_to_yojson x.target);
    ]

let resource_change_details_to_yojson tree = list_to_yojson resource_change_detail_to_yojson tree

let resource_change_to_yojson (x : resource_change) =
  assoc_to_yojson
    [
      ("Details", option_to_yojson resource_change_details_to_yojson x.details);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("Replacement", option_to_yojson replacement_to_yojson x.replacement);
      ("ResourceType", option_to_yojson plan_resource_type_to_yojson x.resource_type);
      ("PhysicalResourceId", option_to_yojson physical_resource_id_to_yojson x.physical_resource_id);
      ("LogicalResourceId", option_to_yojson logical_resource_id_to_yojson x.logical_resource_id);
      ("Action", option_to_yojson change_action_to_yojson x.action);
    ]

let resource_changes_to_yojson tree = list_to_yojson resource_change_to_yojson tree
let reject_portfolio_share_output_to_yojson = unit_to_yojson

let portfolio_share_type_to_yojson (x : portfolio_share_type) =
  match x with
  | AWS_ORGANIZATIONS -> `String "AWS_ORGANIZATIONS"
  | AWS_SERVICECATALOG -> `String "AWS_SERVICECATALOG"
  | IMPORTED -> `String "IMPORTED"

let reject_portfolio_share_input_to_yojson (x : reject_portfolio_share_input) =
  assoc_to_yojson
    [
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let output_key_to_yojson = string_to_yojson
let output_value_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let record_output_to_yojson (x : record_output) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("OutputValue", option_to_yojson output_value_to_yojson x.output_value);
      ("OutputKey", option_to_yojson output_key_to_yojson x.output_key);
    ]

let record_outputs_to_yojson tree = list_to_yojson record_output_to_yojson tree
let record_details_to_yojson tree = list_to_yojson record_detail_to_yojson tree

let provisioning_preferences_to_yojson (x : provisioning_preferences) =
  assoc_to_yojson
    [
      ( "StackSetMaxConcurrencyPercentage",
        option_to_yojson stack_set_max_concurrency_percentage_to_yojson
          x.stack_set_max_concurrency_percentage );
      ( "StackSetMaxConcurrencyCount",
        option_to_yojson stack_set_max_concurrency_count_to_yojson x.stack_set_max_concurrency_count
      );
      ( "StackSetFailureTolerancePercentage",
        option_to_yojson stack_set_failure_tolerance_percentage_to_yojson
          x.stack_set_failure_tolerance_percentage );
      ( "StackSetFailureToleranceCount",
        option_to_yojson stack_set_failure_tolerance_count_to_yojson
          x.stack_set_failure_tolerance_count );
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
    ]

let provisioning_parameter_to_yojson (x : provisioning_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson parameter_value_to_yojson x.value);
      ("Key", option_to_yojson parameter_key_to_yojson x.key);
    ]

let provisioning_parameters_to_yojson tree = list_to_yojson provisioning_parameter_to_yojson tree
let provisioning_artifact_created_time_to_yojson = timestamp_epoch_seconds_to_yojson

let provisioning_artifact_to_yojson (x : provisioning_artifact) =
  assoc_to_yojson
    [
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
      ("CreatedTime", option_to_yojson provisioning_artifact_created_time_to_yojson x.created_time);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let provisioning_artifacts_to_yojson tree = list_to_yojson provisioning_artifact_to_yojson tree

let provisioning_artifact_view_to_yojson (x : provisioning_artifact_view) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifact",
        option_to_yojson provisioning_artifact_to_yojson x.provisioning_artifact );
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
    ]

let provisioning_artifact_views_to_yojson tree =
  list_to_yojson provisioning_artifact_view_to_yojson tree

let provisioning_artifact_summary_to_yojson (x : provisioning_artifact_summary) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactMetadata",
        option_to_yojson provisioning_artifact_info_to_yojson x.provisioning_artifact_metadata );
      ("CreatedTime", option_to_yojson provisioning_artifact_created_time_to_yojson x.created_time);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let provisioning_artifact_summaries_to_yojson tree =
  list_to_yojson provisioning_artifact_summary_to_yojson tree

let disable_template_validation_to_yojson = bool_to_yojson

let provisioning_artifact_properties_to_yojson (x : provisioning_artifact_properties) =
  assoc_to_yojson
    [
      ( "DisableTemplateValidation",
        option_to_yojson disable_template_validation_to_yojson x.disable_template_validation );
      ("Type", option_to_yojson provisioning_artifact_type_to_yojson x.type_);
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
    ]

let provisioning_artifact_preferences_to_yojson (x : provisioning_artifact_preferences) =
  assoc_to_yojson
    [
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
    ]

let default_value_to_yojson = string_to_yojson
let parameter_type_to_yojson = string_to_yojson
let no_echo_to_yojson = bool_to_yojson
let allowed_values_to_yojson tree = list_to_yojson string__to_yojson tree

let parameter_constraints_to_yojson (x : parameter_constraints) =
  assoc_to_yojson
    [
      ("MinValue", option_to_yojson string__to_yojson x.min_value);
      ("MaxValue", option_to_yojson string__to_yojson x.max_value);
      ("MinLength", option_to_yojson string__to_yojson x.min_length);
      ("MaxLength", option_to_yojson string__to_yojson x.max_length);
      ("ConstraintDescription", option_to_yojson string__to_yojson x.constraint_description);
      ("AllowedPattern", option_to_yojson string__to_yojson x.allowed_pattern);
      ("AllowedValues", option_to_yojson allowed_values_to_yojson x.allowed_values);
    ]

let provisioning_artifact_parameter_to_yojson (x : provisioning_artifact_parameter) =
  assoc_to_yojson
    [
      ( "ParameterConstraints",
        option_to_yojson parameter_constraints_to_yojson x.parameter_constraints );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("IsNoEcho", option_to_yojson no_echo_to_yojson x.is_no_echo);
      ("ParameterType", option_to_yojson parameter_type_to_yojson x.parameter_type);
      ("DefaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("ParameterKey", option_to_yojson parameter_key_to_yojson x.parameter_key);
    ]

let provisioning_artifact_parameters_to_yojson tree =
  list_to_yojson provisioning_artifact_parameter_to_yojson tree

let provisioning_artifact_output_key_to_yojson = string_to_yojson
let output_description_to_yojson = string_to_yojson

let provisioning_artifact_output_to_yojson (x : provisioning_artifact_output) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson output_description_to_yojson x.description);
      ("Key", option_to_yojson provisioning_artifact_output_key_to_yojson x.key);
    ]

let provisioning_artifact_outputs_to_yojson tree =
  list_to_yojson provisioning_artifact_output_to_yojson tree

let provisioning_artifact_details_to_yojson tree =
  list_to_yojson provisioning_artifact_detail_to_yojson tree

let provisioned_product_plan_name_to_yojson = string_to_yojson

let provisioned_product_plan_type_to_yojson (x : provisioned_product_plan_type) =
  match x with CLOUDFORMATION -> `String "CLOUDFORMATION"

let provisioned_product_plan_summary_to_yojson (x : provisioned_product_plan_summary) =
  assoc_to_yojson
    [
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("PlanType", option_to_yojson provisioned_product_plan_type_to_yojson x.plan_type);
      ( "ProvisionProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provision_product_name );
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
    ]

let provisioned_product_plans_to_yojson tree =
  list_to_yojson provisioned_product_plan_summary_to_yojson tree

let provisioned_product_plan_status_to_yojson (x : provisioned_product_plan_status) =
  match x with
  | EXECUTE_FAILED -> `String "EXECUTE_FAILED"
  | EXECUTE_SUCCESS -> `String "EXECUTE_SUCCESS"
  | EXECUTE_IN_PROGRESS -> `String "EXECUTE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_SUCCESS -> `String "CREATE_SUCCESS"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"

let notification_arn_to_yojson = string_to_yojson
let notification_arns_to_yojson tree = list_to_yojson notification_arn_to_yojson tree

let provisioned_product_plan_details_to_yojson (x : provisioned_product_plan_details) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ("UpdatedTime", option_to_yojson updated_time_to_yojson x.updated_time);
      ("Status", option_to_yojson provisioned_product_plan_status_to_yojson x.status);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("PlanType", option_to_yojson provisioned_product_plan_type_to_yojson x.plan_type);
      ( "ProvisionProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provision_product_name );
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
    ]

let provision_product_output_to_yojson (x : provision_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let provision_product_input_to_yojson (x : provision_product_input) =
  assoc_to_yojson
    [
      ("ProvisionToken", Some (idempotency_token_to_yojson x.provision_token));
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ProvisioningPreferences",
        option_to_yojson provisioning_preferences_to_yojson x.provisioning_preferences );
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let product_arn_to_yojson = string_to_yojson
let principal_ar_n_to_yojson = string_to_yojson

let principal_type_to_yojson (x : principal_type) =
  match x with IAM_PATTERN -> `String "IAM_PATTERN" | IAM -> `String "IAM"

let principal_to_yojson (x : principal) =
  assoc_to_yojson
    [
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalARN", option_to_yojson principal_ar_n_to_yojson x.principal_ar_n);
    ]

let principals_to_yojson tree = list_to_yojson principal_to_yojson tree

let describe_portfolio_share_type_to_yojson (x : describe_portfolio_share_type) =
  match x with
  | ORGANIZATION_MEMBER_ACCOUNT -> `String "ORGANIZATION_MEMBER_ACCOUNT"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ORGANIZATION -> `String "ORGANIZATION"
  | ACCOUNT -> `String "ACCOUNT"

let boolean__to_yojson = bool_to_yojson

let portfolio_share_detail_to_yojson (x : portfolio_share_detail) =
  assoc_to_yojson
    [
      ("SharePrincipals", option_to_yojson boolean__to_yojson x.share_principals);
      ("ShareTagOptions", option_to_yojson boolean__to_yojson x.share_tag_options);
      ("Accepted", option_to_yojson boolean__to_yojson x.accepted);
      ("Type", option_to_yojson describe_portfolio_share_type_to_yojson x.type_);
      ("PrincipalId", option_to_yojson id_to_yojson x.principal_id);
    ]

let portfolio_share_details_to_yojson tree = list_to_yojson portfolio_share_detail_to_yojson tree
let portfolio_name_to_yojson = string_to_yojson
let portfolio_details_to_yojson tree = list_to_yojson portfolio_detail_to_yojson tree
let output_keys_to_yojson tree = list_to_yojson output_key_to_yojson tree
let organization_nodes_to_yojson tree = list_to_yojson organization_node_to_yojson tree
let notify_update_provisioned_product_engine_workflow_result_output_to_yojson = unit_to_yojson
let engine_workflow_token_to_yojson = string_to_yojson

let engine_workflow_status_to_yojson (x : engine_workflow_status) =
  match x with FAILED -> `String "FAILED" | SUCCEEDED -> `String "SUCCEEDED"

let engine_workflow_failure_reason_to_yojson = string_to_yojson

let notify_update_provisioned_product_engine_workflow_result_input_to_yojson
    (x : notify_update_provisioned_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
    ]

let notify_terminate_provisioned_product_engine_workflow_result_output_to_yojson = unit_to_yojson

let notify_terminate_provisioned_product_engine_workflow_result_input_to_yojson
    (x : notify_terminate_provisioned_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
    ]

let notify_provision_product_engine_workflow_result_output_to_yojson = unit_to_yojson

let engine_workflow_resource_identifier_to_yojson (x : engine_workflow_resource_identifier) =
  assoc_to_yojson
    [ ("UniqueTag", option_to_yojson unique_tag_resource_identifier_to_yojson x.unique_tag) ]

let notify_provision_product_engine_workflow_result_input_to_yojson
    (x : notify_provision_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
      ( "ResourceIdentifier",
        option_to_yojson engine_workflow_resource_identifier_to_yojson x.resource_identifier );
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
    ]

let list_tag_options_output_to_yojson (x : list_tag_options_output) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("TagOptionDetails", option_to_yojson tag_option_details_to_yojson x.tag_option_details);
    ]

let list_tag_options_filters_to_yojson (x : list_tag_options_filters) =
  assoc_to_yojson
    [
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
    ]

let list_tag_options_input_to_yojson (x : list_tag_options_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("Filters", option_to_yojson list_tag_options_filters_to_yojson x.filters);
    ]

let list_stack_instances_for_provisioned_product_output_to_yojson
    (x : list_stack_instances_for_provisioned_product_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("StackInstances", option_to_yojson stack_instances_to_yojson x.stack_instances);
    ]

let list_stack_instances_for_provisioned_product_input_to_yojson
    (x : list_stack_instances_for_provisioned_product_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_service_actions_output_to_yojson (x : list_service_actions_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ServiceActionSummaries",
        option_to_yojson service_action_summaries_to_yojson x.service_action_summaries );
    ]

let list_service_actions_input_to_yojson (x : list_service_actions_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_service_actions_for_provisioning_artifact_output_to_yojson
    (x : list_service_actions_for_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ServiceActionSummaries",
        option_to_yojson service_action_summaries_to_yojson x.service_action_summaries );
    ]

let list_service_actions_for_provisioning_artifact_input_to_yojson
    (x : list_service_actions_for_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
    ]

let list_resources_for_tag_option_output_to_yojson (x : list_resources_for_tag_option_output) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
    ]

let list_resources_for_tag_option_input_to_yojson (x : list_resources_for_tag_option_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
    ]

let list_record_history_search_filter_to_yojson (x : list_record_history_search_filter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson search_filter_value_to_yojson x.value);
      ("Key", option_to_yojson search_filter_key_to_yojson x.key);
    ]

let list_record_history_output_to_yojson (x : list_record_history_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("RecordDetails", option_to_yojson record_details_to_yojson x.record_details);
    ]

let list_record_history_input_to_yojson (x : list_record_history_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("SearchFilter", option_to_yojson list_record_history_search_filter_to_yojson x.search_filter);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_provisioning_artifacts_output_to_yojson (x : list_provisioning_artifacts_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ProvisioningArtifactDetails",
        option_to_yojson provisioning_artifact_details_to_yojson x.provisioning_artifact_details );
    ]

let list_provisioning_artifacts_input_to_yojson (x : list_provisioning_artifacts_input) =
  assoc_to_yojson
    [
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_provisioning_artifacts_for_service_action_output_to_yojson
    (x : list_provisioning_artifacts_for_service_action_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ProvisioningArtifactViews",
        option_to_yojson provisioning_artifact_views_to_yojson x.provisioning_artifact_views );
    ]

let list_provisioning_artifacts_for_service_action_input_to_yojson
    (x : list_provisioning_artifacts_for_service_action_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
    ]

let list_provisioned_product_plans_output_to_yojson (x : list_provisioned_product_plans_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "ProvisionedProductPlans",
        option_to_yojson provisioned_product_plans_to_yojson x.provisioned_product_plans );
    ]

let list_provisioned_product_plans_input_to_yojson (x : list_provisioned_product_plans_input) =
  assoc_to_yojson
    [
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_principals_for_portfolio_output_to_yojson (x : list_principals_for_portfolio_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("Principals", option_to_yojson principals_to_yojson x.principals);
    ]

let list_principals_for_portfolio_input_to_yojson (x : list_principals_for_portfolio_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_portfolios_output_to_yojson (x : list_portfolios_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
    ]

let list_portfolios_input_to_yojson (x : list_portfolios_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_portfolios_for_product_output_to_yojson (x : list_portfolios_for_product_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
    ]

let list_portfolios_for_product_input_to_yojson (x : list_portfolios_for_product_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree

let list_portfolio_access_output_to_yojson (x : list_portfolio_access_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("AccountIds", option_to_yojson account_ids_to_yojson x.account_ids);
    ]

let list_portfolio_access_input_to_yojson (x : list_portfolio_access_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("OrganizationParentId", option_to_yojson id_to_yojson x.organization_parent_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_organization_portfolio_access_output_to_yojson
    (x : list_organization_portfolio_access_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("OrganizationNodes", option_to_yojson organization_nodes_to_yojson x.organization_nodes);
    ]

let list_organization_portfolio_access_input_to_yojson
    (x : list_organization_portfolio_access_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("OrganizationNodeType", Some (organization_node_type_to_yojson x.organization_node_type));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let constraint_summary_to_yojson (x : constraint_summary) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Type", option_to_yojson constraint_type_to_yojson x.type_);
    ]

let constraint_summaries_to_yojson tree = list_to_yojson constraint_summary_to_yojson tree

let launch_path_summary_to_yojson (x : launch_path_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson portfolio_name_to_yojson x.name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ConstraintSummaries", option_to_yojson constraint_summaries_to_yojson x.constraint_summaries);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let launch_path_summaries_to_yojson tree = list_to_yojson launch_path_summary_to_yojson tree

let list_launch_paths_output_to_yojson (x : list_launch_paths_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "LaunchPathSummaries",
        option_to_yojson launch_path_summaries_to_yojson x.launch_path_summaries );
    ]

let list_launch_paths_input_to_yojson (x : list_launch_paths_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let constraint_details_to_yojson tree = list_to_yojson constraint_detail_to_yojson tree

let list_constraints_for_portfolio_output_to_yojson (x : list_constraints_for_portfolio_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("ConstraintDetails", option_to_yojson constraint_details_to_yojson x.constraint_details);
    ]

let list_constraints_for_portfolio_input_to_yojson (x : list_constraints_for_portfolio_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let budget_name_to_yojson = string_to_yojson

let budget_detail_to_yojson (x : budget_detail) =
  assoc_to_yojson [ ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name) ]

let budgets_to_yojson tree = list_to_yojson budget_detail_to_yojson tree

let list_budgets_for_resource_output_to_yojson (x : list_budgets_for_resource_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
    ]

let list_budgets_for_resource_input_to_yojson (x : list_budgets_for_resource_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ResourceId", Some (id_to_yojson x.resource_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_accepted_portfolio_shares_output_to_yojson (x : list_accepted_portfolio_shares_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
    ]

let list_accepted_portfolio_shares_input_to_yojson (x : list_accepted_portfolio_shares_input) =
  assoc_to_yojson
    [
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let launch_path_to_yojson (x : launch_path) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson portfolio_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
    ]

let launch_paths_to_yojson tree = list_to_yojson launch_path_to_yojson tree

let import_as_provisioned_product_output_to_yojson (x : import_as_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let import_as_provisioned_product_input_to_yojson (x : import_as_provisioned_product_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("PhysicalId", Some (physical_id_to_yojson x.physical_id));
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let get_provisioned_product_outputs_output_to_yojson (x : get_provisioned_product_outputs_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
    ]

let get_provisioned_product_outputs_input_to_yojson (x : get_provisioned_product_outputs_input) =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("OutputKeys", option_to_yojson output_keys_to_yojson x.output_keys);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let access_status_to_yojson (x : access_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | UNDER_CHANGE -> `String "UNDER_CHANGE"
  | ENABLED -> `String "ENABLED"

let get_aws_organizations_access_status_output_to_yojson
    (x : get_aws_organizations_access_status_output) =
  assoc_to_yojson [ ("AccessStatus", option_to_yojson access_status_to_yojson x.access_status) ]

let get_aws_organizations_access_status_input_to_yojson = unit_to_yojson

let failed_service_action_association_to_yojson (x : failed_service_action_association) =
  assoc_to_yojson
    [
      ( "ErrorMessage",
        option_to_yojson service_action_association_error_message_to_yojson x.error_message );
      ("ErrorCode", option_to_yojson service_action_association_error_code_to_yojson x.error_code);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ServiceActionId", option_to_yojson id_to_yojson x.service_action_id);
    ]

let failed_service_action_associations_to_yojson tree =
  list_to_yojson failed_service_action_association_to_yojson tree

let execution_parameter_key_to_yojson = string_to_yojson
let execution_parameter_type_to_yojson = string_to_yojson
let execution_parameter_value_to_yojson = string_to_yojson

let execution_parameter_value_list_to_yojson tree =
  list_to_yojson execution_parameter_value_to_yojson tree

let execution_parameter_to_yojson (x : execution_parameter) =
  assoc_to_yojson
    [
      ("DefaultValues", option_to_yojson execution_parameter_value_list_to_yojson x.default_values);
      ("Type", option_to_yojson execution_parameter_type_to_yojson x.type_);
      ("Name", option_to_yojson execution_parameter_key_to_yojson x.name);
    ]

let execution_parameters_to_yojson tree = list_to_yojson execution_parameter_to_yojson tree

let execution_parameter_map_to_yojson tree =
  map_to_yojson execution_parameter_key_to_yojson execution_parameter_value_list_to_yojson tree

let execute_provisioned_product_service_action_output_to_yojson
    (x : execute_provisioned_product_service_action_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let execute_provisioned_product_service_action_input_to_yojson
    (x : execute_provisioned_product_service_action_input) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson execution_parameter_map_to_yojson x.parameters);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ExecuteToken", Some (idempotency_token_to_yojson x.execute_token));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
    ]

let execute_provisioned_product_plan_output_to_yojson (x : execute_provisioned_product_plan_output)
    =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let execute_provisioned_product_plan_input_to_yojson (x : execute_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let enable_aws_organizations_access_output_to_yojson = unit_to_yojson
let enable_aws_organizations_access_input_to_yojson = unit_to_yojson
let disassociate_tag_option_from_resource_output_to_yojson = unit_to_yojson

let disassociate_tag_option_from_resource_input_to_yojson
    (x : disassociate_tag_option_from_resource_input) =
  assoc_to_yojson
    [
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let disassociate_service_action_from_provisioning_artifact_output_to_yojson = unit_to_yojson

let disassociate_service_action_from_provisioning_artifact_input_to_yojson
    (x : disassociate_service_action_from_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
    ]

let disassociate_product_from_portfolio_output_to_yojson = unit_to_yojson

let disassociate_product_from_portfolio_input_to_yojson
    (x : disassociate_product_from_portfolio_input) =
  assoc_to_yojson
    [
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let disassociate_principal_from_portfolio_output_to_yojson = unit_to_yojson

let disassociate_principal_from_portfolio_input_to_yojson
    (x : disassociate_principal_from_portfolio_input) =
  assoc_to_yojson
    [
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
      ("PrincipalARN", Some (principal_ar_n_to_yojson x.principal_ar_n));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let disassociate_budget_from_resource_output_to_yojson = unit_to_yojson

let disassociate_budget_from_resource_input_to_yojson (x : disassociate_budget_from_resource_input)
    =
  assoc_to_yojson
    [
      ("ResourceId", Some (id_to_yojson x.resource_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
    ]

let disable_aws_organizations_access_output_to_yojson = unit_to_yojson
let disable_aws_organizations_access_input_to_yojson = unit_to_yojson

let describe_tag_option_output_to_yojson (x : describe_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let describe_tag_option_input_to_yojson (x : describe_tag_option_input) =
  assoc_to_yojson [ ("Id", Some (tag_option_id_to_yojson x.id)) ]

let describe_service_action_output_to_yojson (x : describe_service_action_output) =
  assoc_to_yojson
    [
      ( "ServiceActionDetail",
        option_to_yojson service_action_detail_to_yojson x.service_action_detail );
    ]

let describe_service_action_input_to_yojson (x : describe_service_action_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let describe_service_action_execution_parameters_output_to_yojson
    (x : describe_service_action_execution_parameters_output) =
  assoc_to_yojson
    [
      ( "ServiceActionParameters",
        option_to_yojson execution_parameters_to_yojson x.service_action_parameters );
    ]

let describe_service_action_execution_parameters_input_to_yojson
    (x : describe_service_action_execution_parameters_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
    ]

let describe_record_output_to_yojson (x : describe_record_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("RecordOutputs", option_to_yojson record_outputs_to_yojson x.record_outputs);
      ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail);
    ]

let describe_record_input_to_yojson (x : describe_record_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_provisioning_parameters_output_to_yojson (x : describe_provisioning_parameters_output)
    =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactOutputKeys",
        option_to_yojson provisioning_artifact_outputs_to_yojson x.provisioning_artifact_output_keys
      );
      ( "ProvisioningArtifactOutputs",
        option_to_yojson provisioning_artifact_outputs_to_yojson x.provisioning_artifact_outputs );
      ( "ProvisioningArtifactPreferences",
        option_to_yojson provisioning_artifact_preferences_to_yojson
          x.provisioning_artifact_preferences );
      ("TagOptions", option_to_yojson tag_option_summaries_to_yojson x.tag_options);
      ("UsageInstructions", option_to_yojson usage_instructions_to_yojson x.usage_instructions);
      ("ConstraintSummaries", option_to_yojson constraint_summaries_to_yojson x.constraint_summaries);
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_parameters_to_yojson
          x.provisioning_artifact_parameters );
    ]

let describe_provisioning_parameters_input_to_yojson (x : describe_provisioning_parameters_input) =
  assoc_to_yojson
    [
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_provisioning_artifact_output_to_yojson (x : describe_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_parameters_to_yojson
          x.provisioning_artifact_parameters );
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
    ]

let describe_provisioning_artifact_input_to_yojson (x : describe_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ( "IncludeProvisioningArtifactParameters",
        option_to_yojson boolean__to_yojson x.include_provisioning_artifact_parameters );
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_provisioned_product_plan_output_to_yojson
    (x : describe_provisioned_product_plan_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ("ResourceChanges", option_to_yojson resource_changes_to_yojson x.resource_changes);
      ( "ProvisionedProductPlanDetails",
        option_to_yojson provisioned_product_plan_details_to_yojson
          x.provisioned_product_plan_details );
    ]

let describe_provisioned_product_plan_input_to_yojson (x : describe_provisioned_product_plan_input)
    =
  assoc_to_yojson
    [
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let cloud_watch_dashboard_name_to_yojson = string_to_yojson

let cloud_watch_dashboard_to_yojson (x : cloud_watch_dashboard) =
  assoc_to_yojson [ ("Name", option_to_yojson cloud_watch_dashboard_name_to_yojson x.name) ]

let cloud_watch_dashboards_to_yojson tree = list_to_yojson cloud_watch_dashboard_to_yojson tree

let describe_provisioned_product_output_to_yojson (x : describe_provisioned_product_output) =
  assoc_to_yojson
    [
      ( "CloudWatchDashboards",
        option_to_yojson cloud_watch_dashboards_to_yojson x.cloud_watch_dashboards );
      ( "ProvisionedProductDetail",
        option_to_yojson provisioned_product_detail_to_yojson x.provisioned_product_detail );
    ]

let describe_provisioned_product_input_to_yojson (x : describe_provisioned_product_input) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson provisioned_product_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_product_view_output_to_yojson (x : describe_product_view_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifacts",
        option_to_yojson provisioning_artifacts_to_yojson x.provisioning_artifacts );
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
    ]

let describe_product_view_input_to_yojson (x : describe_product_view_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_product_output_to_yojson (x : describe_product_output) =
  assoc_to_yojson
    [
      ("LaunchPaths", option_to_yojson launch_paths_to_yojson x.launch_paths);
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ( "ProvisioningArtifacts",
        option_to_yojson provisioning_artifacts_to_yojson x.provisioning_artifacts );
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
    ]

let describe_product_input_to_yojson (x : describe_product_input) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_product_as_admin_output_to_yojson (x : describe_product_as_admin_output) =
  assoc_to_yojson
    [
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ("TagOptions", option_to_yojson tag_option_details_to_yojson x.tag_options);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ProvisioningArtifactSummaries",
        option_to_yojson provisioning_artifact_summaries_to_yojson x.provisioning_artifact_summaries
      );
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
    ]

let describe_product_as_admin_input_to_yojson (x : describe_product_as_admin_input) =
  assoc_to_yojson
    [
      ("SourcePortfolioId", option_to_yojson id_to_yojson x.source_portfolio_id);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_portfolio_shares_output_to_yojson (x : describe_portfolio_shares_output) =
  assoc_to_yojson
    [
      ( "PortfolioShareDetails",
        option_to_yojson portfolio_share_details_to_yojson x.portfolio_share_details );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let describe_portfolio_shares_input_to_yojson (x : describe_portfolio_shares_input) =
  assoc_to_yojson
    [
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("Type", Some (describe_portfolio_share_type_to_yojson x.type_));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
    ]

let describe_portfolio_share_status_output_to_yojson (x : describe_portfolio_share_status_output) =
  assoc_to_yojson
    [
      ("ShareDetails", option_to_yojson share_details_to_yojson x.share_details);
      ("Status", option_to_yojson share_status_to_yojson x.status);
      ( "OrganizationNodeValue",
        option_to_yojson organization_node_value_to_yojson x.organization_node_value );
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
      ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token);
    ]

let describe_portfolio_share_status_input_to_yojson (x : describe_portfolio_share_status_input) =
  assoc_to_yojson [ ("PortfolioShareToken", Some (id_to_yojson x.portfolio_share_token)) ]

let describe_portfolio_output_to_yojson (x : describe_portfolio_output) =
  assoc_to_yojson
    [
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ("TagOptions", option_to_yojson tag_option_details_to_yojson x.tag_options);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
    ]

let describe_portfolio_input_to_yojson (x : describe_portfolio_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let copy_product_status_to_yojson (x : copy_product_status) =
  match x with
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"

let describe_copy_product_status_output_to_yojson (x : describe_copy_product_status_output) =
  assoc_to_yojson
    [
      ("StatusDetail", option_to_yojson status_detail_to_yojson x.status_detail);
      ("TargetProductId", option_to_yojson id_to_yojson x.target_product_id);
      ("CopyProductStatus", option_to_yojson copy_product_status_to_yojson x.copy_product_status);
    ]

let describe_copy_product_status_input_to_yojson (x : describe_copy_product_status_input) =
  assoc_to_yojson
    [
      ("CopyProductToken", Some (id_to_yojson x.copy_product_token));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_constraint_output_to_yojson (x : describe_constraint_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
    ]

let describe_constraint_input_to_yojson (x : describe_constraint_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_tag_option_output_to_yojson = unit_to_yojson

let delete_tag_option_input_to_yojson (x : delete_tag_option_input) =
  assoc_to_yojson [ ("Id", Some (tag_option_id_to_yojson x.id)) ]

let delete_service_action_output_to_yojson = unit_to_yojson

let delete_service_action_input_to_yojson (x : delete_service_action_input) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let delete_provisioning_artifact_output_to_yojson = unit_to_yojson

let delete_provisioning_artifact_input_to_yojson (x : delete_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_provisioned_product_plan_output_to_yojson = unit_to_yojson

let delete_provisioned_product_plan_input_to_yojson (x : delete_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("IgnoreErrors", option_to_yojson ignore_errors_to_yojson x.ignore_errors);
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_product_output_to_yojson = unit_to_yojson

let delete_product_input_to_yojson (x : delete_product_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_portfolio_share_output_to_yojson (x : delete_portfolio_share_output) =
  assoc_to_yojson [ ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token) ]

let delete_portfolio_share_input_to_yojson (x : delete_portfolio_share_input) =
  assoc_to_yojson
    [
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_portfolio_output_to_yojson = unit_to_yojson

let delete_portfolio_input_to_yojson (x : delete_portfolio_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let delete_constraint_output_to_yojson = unit_to_yojson

let delete_constraint_input_to_yojson (x : delete_constraint_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_tag_option_output_to_yojson (x : create_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let create_tag_option_input_to_yojson (x : create_tag_option_input) =
  assoc_to_yojson
    [
      ("Value", Some (tag_option_value_to_yojson x.value));
      ("Key", Some (tag_option_key_to_yojson x.key));
    ]

let create_service_action_output_to_yojson (x : create_service_action_output) =
  assoc_to_yojson
    [
      ( "ServiceActionDetail",
        option_to_yojson service_action_detail_to_yojson x.service_action_detail );
    ]

let create_service_action_input_to_yojson (x : create_service_action_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("Definition", Some (service_action_definition_map_to_yojson x.definition));
      ("DefinitionType", Some (service_action_definition_type_to_yojson x.definition_type));
      ("Name", Some (service_action_name_to_yojson x.name));
    ]

let create_provisioning_artifact_output_to_yojson (x : create_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
    ]

let create_provisioning_artifact_input_to_yojson (x : create_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Parameters", Some (provisioning_artifact_properties_to_yojson x.parameters));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_provisioned_product_plan_output_to_yojson (x : create_provisioned_product_plan_output) =
  assoc_to_yojson
    [
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
    ]

let create_provisioned_product_plan_input_to_yojson (x : create_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ("PlanType", Some (provisioned_product_plan_type_to_yojson x.plan_type));
      ("PlanName", Some (provisioned_product_plan_name_to_yojson x.plan_name));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_product_output_to_yojson (x : create_product_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
    ]

let create_product_input_to_yojson (x : create_product_input) =
  assoc_to_yojson
    [
      ("SourceConnection", option_to_yojson source_connection_to_yojson x.source_connection);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_properties_to_yojson
          x.provisioning_artifact_parameters );
      ("Tags", option_to_yojson add_tags_to_yojson x.tags);
      ("ProductType", Some (product_type_to_yojson x.product_type));
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("Distributor", option_to_yojson product_view_owner_to_yojson x.distributor);
      ("Description", option_to_yojson product_view_short_description_to_yojson x.description);
      ("Owner", Some (product_view_owner_to_yojson x.owner));
      ("Name", Some (product_view_name_to_yojson x.name));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_portfolio_share_output_to_yojson (x : create_portfolio_share_output) =
  assoc_to_yojson [ ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token) ]

let create_portfolio_share_input_to_yojson (x : create_portfolio_share_input) =
  assoc_to_yojson
    [
      ("SharePrincipals", option_to_yojson boolean__to_yojson x.share_principals);
      ("ShareTagOptions", option_to_yojson boolean__to_yojson x.share_tag_options);
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_portfolio_output_to_yojson (x : create_portfolio_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
    ]

let create_portfolio_input_to_yojson (x : create_portfolio_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Tags", option_to_yojson add_tags_to_yojson x.tags);
      ("ProviderName", Some (provider_name_to_yojson x.provider_name));
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("DisplayName", Some (portfolio_display_name_to_yojson x.display_name));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let create_constraint_output_to_yojson (x : create_constraint_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
    ]

let create_constraint_input_to_yojson (x : create_constraint_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Type", Some (constraint_type_to_yojson x.type_));
      ("Parameters", Some (constraint_parameters_to_yojson x.parameters));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let copy_product_output_to_yojson (x : copy_product_output) =
  assoc_to_yojson [ ("CopyProductToken", option_to_yojson id_to_yojson x.copy_product_token) ]

let copy_option_to_yojson (x : copy_option) = match x with CopyTags -> `String "CopyTags"
let copy_options_to_yojson tree = list_to_yojson copy_option_to_yojson tree

let copy_product_input_to_yojson (x : copy_product_input) =
  assoc_to_yojson
    [
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("CopyOptions", option_to_yojson copy_options_to_yojson x.copy_options);
      ( "SourceProvisioningArtifactIdentifiers",
        option_to_yojson source_provisioning_artifact_properties_to_yojson
          x.source_provisioning_artifact_identifiers );
      ("TargetProductName", option_to_yojson product_view_name_to_yojson x.target_product_name);
      ("TargetProductId", option_to_yojson id_to_yojson x.target_product_id);
      ("SourceProductArn", Some (product_arn_to_yojson x.source_product_arn));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let batch_disassociate_service_action_from_provisioning_artifact_output_to_yojson
    (x : batch_disassociate_service_action_from_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "FailedServiceActionAssociations",
        option_to_yojson failed_service_action_associations_to_yojson
          x.failed_service_action_associations );
    ]

let batch_disassociate_service_action_from_provisioning_artifact_input_to_yojson
    (x : batch_disassociate_service_action_from_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "ServiceActionAssociations",
        Some (service_action_associations_to_yojson x.service_action_associations) );
    ]

let batch_associate_service_action_with_provisioning_artifact_output_to_yojson
    (x : batch_associate_service_action_with_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "FailedServiceActionAssociations",
        option_to_yojson failed_service_action_associations_to_yojson
          x.failed_service_action_associations );
    ]

let batch_associate_service_action_with_provisioning_artifact_input_to_yojson
    (x : batch_associate_service_action_with_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "ServiceActionAssociations",
        Some (service_action_associations_to_yojson x.service_action_associations) );
    ]

let associate_tag_option_with_resource_output_to_yojson = unit_to_yojson

let associate_tag_option_with_resource_input_to_yojson
    (x : associate_tag_option_with_resource_input) =
  assoc_to_yojson
    [
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
    ]

let associate_service_action_with_provisioning_artifact_output_to_yojson = unit_to_yojson

let associate_service_action_with_provisioning_artifact_input_to_yojson
    (x : associate_service_action_with_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ProductId", Some (id_to_yojson x.product_id));
    ]

let associate_product_with_portfolio_output_to_yojson = unit_to_yojson

let associate_product_with_portfolio_input_to_yojson (x : associate_product_with_portfolio_input) =
  assoc_to_yojson
    [
      ("SourcePortfolioId", option_to_yojson id_to_yojson x.source_portfolio_id);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let associate_principal_with_portfolio_output_to_yojson = unit_to_yojson

let associate_principal_with_portfolio_input_to_yojson
    (x : associate_principal_with_portfolio_input) =
  assoc_to_yojson
    [
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
      ("PrincipalARN", Some (principal_ar_n_to_yojson x.principal_ar_n));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let associate_budget_with_resource_output_to_yojson = unit_to_yojson

let associate_budget_with_resource_input_to_yojson (x : associate_budget_with_resource_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (id_to_yojson x.resource_id));
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
    ]

let accept_portfolio_share_output_to_yojson = unit_to_yojson

let accept_portfolio_share_input_to_yojson (x : accept_portfolio_share_input) =
  assoc_to_yojson
    [
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]
