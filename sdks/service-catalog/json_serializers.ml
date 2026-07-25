open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let tag_option_not_migrated_exception_to_yojson (x : tag_option_not_migrated_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameters_exception_to_yojson (x : invalid_parameters_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_resource_exception_to_yojson (x : duplicate_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let owner_to_yojson = string_to_yojson
let tag_option_id_to_yojson = string_to_yojson
let tag_option_active_to_yojson = bool_to_yojson
let tag_option_value_to_yojson = string_to_yojson
let tag_option_key_to_yojson = string_to_yojson

let tag_option_detail_to_yojson (x : tag_option_detail) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
      ("Id", option_to_yojson tag_option_id_to_yojson x.id);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let update_tag_option_output_to_yojson (x : update_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let update_tag_option_input_to_yojson (x : update_tag_option_input) =
  assoc_to_yojson
    [
      ("Id", Some (tag_option_id_to_yojson x.id));
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
    ]

let service_action_definition_value_to_yojson = string_to_yojson

let service_action_definition_key_to_yojson (x : service_action_definition_key) =
  match x with
  | Name -> `String "Name"
  | Version -> `String "Version"
  | AssumeRole -> `String "AssumeRole"
  | Parameters -> `String "Parameters"

let service_action_definition_map_to_yojson tree =
  map_to_yojson service_action_definition_key_to_yojson service_action_definition_value_to_yojson
    tree

let service_action_definition_type_to_yojson (x : service_action_definition_type) =
  match x with SsmAutomation -> `String "SSM_AUTOMATION"

let service_action_description_to_yojson = string_to_yojson
let service_action_name_to_yojson = string_to_yojson
let id_to_yojson = string_to_yojson

let service_action_summary_to_yojson (x : service_action_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson service_action_name_to_yojson x.name);
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("DefinitionType", option_to_yojson service_action_definition_type_to_yojson x.definition_type);
    ]

let service_action_detail_to_yojson (x : service_action_detail) =
  assoc_to_yojson
    [
      ( "ServiceActionSummary",
        option_to_yojson service_action_summary_to_yojson x.service_action_summary );
      ("Definition", option_to_yojson service_action_definition_map_to_yojson x.definition);
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
      ("Id", Some (id_to_yojson x.id));
      ("Name", option_to_yojson service_action_name_to_yojson x.name);
      ("Definition", option_to_yojson service_action_definition_map_to_yojson x.definition);
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let status_to_yojson (x : status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"
  | FAILED -> `String "FAILED"

let provisioning_artifact_info_value_to_yojson = string_to_yojson
let provisioning_artifact_info_key_to_yojson = string_to_yojson

let provisioning_artifact_info_to_yojson tree =
  map_to_yojson provisioning_artifact_info_key_to_yojson provisioning_artifact_info_value_to_yojson
    tree

let source_revision_to_yojson = string_to_yojson

let provisioning_artifact_guidance_to_yojson (x : provisioning_artifact_guidance) =
  match x with DEFAULT -> `String "DEFAULT" | DEPRECATED -> `String "DEPRECATED"

let provisioning_artifact_active_to_yojson = bool_to_yojson
let creation_time_to_yojson = timestamp_epoch_seconds_to_yojson

let provisioning_artifact_type_to_yojson (x : provisioning_artifact_type) =
  match x with
  | CLOUD_FORMATION_TEMPLATE -> `String "CLOUD_FORMATION_TEMPLATE"
  | MARKETPLACE_AMI -> `String "MARKETPLACE_AMI"
  | MARKETPLACE_CAR -> `String "MARKETPLACE_CAR"
  | TERRAFORM_OPEN_SOURCE -> `String "TERRAFORM_OPEN_SOURCE"
  | TERRAFORM_CLOUD -> `String "TERRAFORM_CLOUD"
  | EXTERNAL -> `String "EXTERNAL"

let provisioning_artifact_name_to_yojson = string_to_yojson

let provisioning_artifact_detail_to_yojson (x : provisioning_artifact_detail) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Description", option_to_yojson provisioning_artifact_name_to_yojson x.description);
      ("Type", option_to_yojson provisioning_artifact_type_to_yojson x.type_);
      ("CreatedTime", option_to_yojson creation_time_to_yojson x.created_time);
      ("Active", option_to_yojson provisioning_artifact_active_to_yojson x.active);
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
      ("SourceRevision", option_to_yojson source_revision_to_yojson x.source_revision);
    ]

let update_provisioning_artifact_output_to_yojson (x : update_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let provisioning_artifact_description_to_yojson = string_to_yojson

let update_provisioning_artifact_input_to_yojson (x : update_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Active", option_to_yojson provisioning_artifact_active_to_yojson x.active);
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
    ]

let invalid_state_exception_to_yojson (x : invalid_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let record_status_to_yojson (x : record_status) =
  match x with
  | CREATED -> `String "CREATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | IN_PROGRESS_IN_ERROR -> `String "IN_PROGRESS_IN_ERROR"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let property_value_to_yojson = string_to_yojson

let property_key_to_yojson (x : property_key) =
  match x with Owner -> `String "OWNER" | LaunchRole -> `String "LAUNCH_ROLE"

let provisioned_product_properties_to_yojson tree =
  map_to_yojson property_key_to_yojson property_value_to_yojson tree

let update_provisioned_product_properties_output_to_yojson
    (x : update_provisioned_product_properties_output) =
  assoc_to_yojson
    [
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ( "ProvisionedProductProperties",
        option_to_yojson provisioned_product_properties_to_yojson x.provisioned_product_properties
      );
      ("RecordId", option_to_yojson id_to_yojson x.record_id);
      ("Status", option_to_yojson record_status_to_yojson x.status);
    ]

let idempotency_token_to_yojson = string_to_yojson

let update_provisioned_product_properties_input_to_yojson
    (x : update_provisioned_product_properties_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ( "ProvisionedProductProperties",
        Some (provisioned_product_properties_to_yojson x.provisioned_product_properties) );
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let role_arn_to_yojson = string_to_yojson
let record_tag_value_to_yojson = string_to_yojson
let record_tag_key_to_yojson = string_to_yojson

let record_tag_to_yojson (x : record_tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson record_tag_key_to_yojson x.key);
      ("Value", option_to_yojson record_tag_value_to_yojson x.value);
    ]

let record_tags_to_yojson tree = list_to_yojson record_tag_to_yojson tree
let error_description_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let record_error_to_yojson (x : record_error) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson error_code_to_yojson x.code);
      ("Description", option_to_yojson error_description_to_yojson x.description);
    ]

let record_errors_to_yojson tree = list_to_yojson record_error_to_yojson tree
let record_type_to_yojson = string_to_yojson
let provisioned_product_type_to_yojson = string_to_yojson
let updated_time_to_yojson = timestamp_epoch_seconds_to_yojson
let created_time_to_yojson = timestamp_epoch_seconds_to_yojson
let provisioned_product_name_to_yojson = string_to_yojson

let record_detail_to_yojson (x : record_detail) =
  assoc_to_yojson
    [
      ("RecordId", option_to_yojson id_to_yojson x.record_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("Status", option_to_yojson record_status_to_yojson x.status);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("UpdatedTime", option_to_yojson updated_time_to_yojson x.updated_time);
      ( "ProvisionedProductType",
        option_to_yojson provisioned_product_type_to_yojson x.provisioned_product_type );
      ("RecordType", option_to_yojson record_type_to_yojson x.record_type);
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("RecordErrors", option_to_yojson record_errors_to_yojson x.record_errors);
      ("RecordTags", option_to_yojson record_tags_to_yojson x.record_tags);
      ("LaunchRoleArn", option_to_yojson role_arn_to_yojson x.launch_role_arn);
    ]

let update_provisioned_product_output_to_yojson (x : update_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let stack_set_operation_type_to_yojson (x : stack_set_operation_type) =
  match x with
  | CREATE -> `String "CREATE"
  | UPDATE -> `String "UPDATE"
  | DELETE -> `String "DELETE"

let stack_set_max_concurrency_percentage_to_yojson = int_to_yojson
let stack_set_max_concurrency_count_to_yojson = int_to_yojson
let stack_set_failure_tolerance_percentage_to_yojson = int_to_yojson
let stack_set_failure_tolerance_count_to_yojson = int_to_yojson
let region_to_yojson = string_to_yojson
let stack_set_regions_to_yojson tree = list_to_yojson region_to_yojson tree
let account_id_to_yojson = string_to_yojson
let stack_set_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree

let update_provisioning_preferences_to_yojson (x : update_provisioning_preferences) =
  assoc_to_yojson
    [
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
      ( "StackSetFailureToleranceCount",
        option_to_yojson stack_set_failure_tolerance_count_to_yojson
          x.stack_set_failure_tolerance_count );
      ( "StackSetFailureTolerancePercentage",
        option_to_yojson stack_set_failure_tolerance_percentage_to_yojson
          x.stack_set_failure_tolerance_percentage );
      ( "StackSetMaxConcurrencyCount",
        option_to_yojson stack_set_max_concurrency_count_to_yojson x.stack_set_max_concurrency_count
      );
      ( "StackSetMaxConcurrencyPercentage",
        option_to_yojson stack_set_max_concurrency_percentage_to_yojson
          x.stack_set_max_concurrency_percentage );
      ( "StackSetOperationType",
        option_to_yojson stack_set_operation_type_to_yojson x.stack_set_operation_type );
    ]

let use_previous_value_to_yojson = bool_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_key_to_yojson = string_to_yojson

let update_provisioning_parameter_to_yojson (x : update_provisioning_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson parameter_key_to_yojson x.key);
      ("Value", option_to_yojson parameter_value_to_yojson x.value);
      ("UsePreviousValue", option_to_yojson use_previous_value_to_yojson x.use_previous_value);
    ]

let update_provisioning_parameters_to_yojson tree =
  list_to_yojson update_provisioning_parameter_to_yojson tree

let portfolio_display_name_to_yojson = string_to_yojson
let product_view_name_to_yojson = string_to_yojson
let provisioned_product_name_or_arn_to_yojson = string_to_yojson

let update_provisioned_product_input_to_yojson (x : update_provisioned_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_or_arn_to_yojson x.provisioned_product_name );
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ( "ProvisioningPreferences",
        option_to_yojson update_provisioning_preferences_to_yojson x.provisioning_preferences );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("UpdateToken", Some (idempotency_token_to_yojson x.update_token));
    ]

let last_successful_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson
let last_sync_status_message_to_yojson = string_to_yojson

let last_sync_status_to_yojson (x : last_sync_status) =
  match x with SUCCEEDED -> `String "SUCCEEDED" | FAILED -> `String "FAILED"

let last_sync_time_to_yojson = timestamp_epoch_seconds_to_yojson

let last_sync_to_yojson (x : last_sync) =
  assoc_to_yojson
    [
      ("LastSyncTime", option_to_yojson last_sync_time_to_yojson x.last_sync_time);
      ("LastSyncStatus", option_to_yojson last_sync_status_to_yojson x.last_sync_status);
      ( "LastSyncStatusMessage",
        option_to_yojson last_sync_status_message_to_yojson x.last_sync_status_message );
      ( "LastSuccessfulSyncTime",
        option_to_yojson last_successful_sync_time_to_yojson x.last_successful_sync_time );
      ( "LastSuccessfulSyncProvisioningArtifactId",
        option_to_yojson id_to_yojson x.last_successful_sync_provisioning_artifact_id );
    ]

let repository_artifact_path_to_yojson = string_to_yojson
let repository_branch_to_yojson = string_to_yojson
let repository_to_yojson = string_to_yojson
let code_star_connection_arn_to_yojson = string_to_yojson

let code_star_parameters_to_yojson (x : code_star_parameters) =
  assoc_to_yojson
    [
      ("ConnectionArn", Some (code_star_connection_arn_to_yojson x.connection_arn));
      ("Repository", Some (repository_to_yojson x.repository));
      ("Branch", Some (repository_branch_to_yojson x.branch));
      ("ArtifactPath", Some (repository_artifact_path_to_yojson x.artifact_path));
    ]

let source_connection_parameters_to_yojson (x : source_connection_parameters) =
  assoc_to_yojson [ ("CodeStar", option_to_yojson code_star_parameters_to_yojson x.code_star) ]

let source_type_to_yojson (x : source_type) = match x with CODESTAR -> `String "CODESTAR"

let source_connection_detail_to_yojson (x : source_connection_detail) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson source_type_to_yojson x.type_);
      ( "ConnectionParameters",
        option_to_yojson source_connection_parameters_to_yojson x.connection_parameters );
      ("LastSync", option_to_yojson last_sync_to_yojson x.last_sync);
    ]

let resource_ar_n_to_yojson = string_to_yojson
let support_url_to_yojson = string_to_yojson
let support_description_to_yojson = string_to_yojson
let support_email_to_yojson = string_to_yojson
let has_default_path_to_yojson = bool_to_yojson
let product_view_distributor_to_yojson = string_to_yojson

let product_type_to_yojson (x : product_type) =
  match x with
  | CLOUD_FORMATION_TEMPLATE -> `String "CLOUD_FORMATION_TEMPLATE"
  | MARKETPLACE -> `String "MARKETPLACE"
  | TERRAFORM_OPEN_SOURCE -> `String "TERRAFORM_OPEN_SOURCE"
  | TERRAFORM_CLOUD -> `String "TERRAFORM_CLOUD"
  | EXTERNAL -> `String "EXTERNAL"

let product_view_short_description_to_yojson = string_to_yojson
let product_view_owner_to_yojson = string_to_yojson

let product_view_summary_to_yojson (x : product_view_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("Owner", option_to_yojson product_view_owner_to_yojson x.owner);
      ( "ShortDescription",
        option_to_yojson product_view_short_description_to_yojson x.short_description );
      ("Type", option_to_yojson product_type_to_yojson x.type_);
      ("Distributor", option_to_yojson product_view_distributor_to_yojson x.distributor);
      ("HasDefaultPath", option_to_yojson has_default_path_to_yojson x.has_default_path);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
    ]

let product_view_detail_to_yojson (x : product_view_detail) =
  assoc_to_yojson
    [
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ProductARN", option_to_yojson resource_ar_n_to_yojson x.product_ar_n);
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("SourceConnection", option_to_yojson source_connection_detail_to_yojson x.source_connection);
    ]

let update_product_output_to_yojson (x : update_product_output) =
  assoc_to_yojson
    [
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let source_connection_to_yojson (x : source_connection) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson source_type_to_yojson x.type_);
      ("ConnectionParameters", Some (source_connection_parameters_to_yojson x.connection_parameters));
    ]

let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let add_tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let update_product_input_to_yojson (x : update_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("Owner", option_to_yojson product_view_owner_to_yojson x.owner);
      ("Description", option_to_yojson product_view_short_description_to_yojson x.description);
      ("Distributor", option_to_yojson product_view_owner_to_yojson x.distributor);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
      ("AddTags", option_to_yojson add_tags_to_yojson x.add_tags);
      ("RemoveTags", option_to_yojson tag_keys_to_yojson x.remove_tags);
      ("SourceConnection", option_to_yojson source_connection_to_yojson x.source_connection);
    ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let share_status_to_yojson (x : share_status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | ERROR -> `String "ERROR"

let update_portfolio_share_output_to_yojson (x : update_portfolio_share_output) =
  assoc_to_yojson
    [
      ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token);
      ("Status", option_to_yojson share_status_to_yojson x.status);
    ]

let nullable_boolean_to_yojson = bool_to_yojson
let organization_node_value_to_yojson = string_to_yojson

let organization_node_type_to_yojson (x : organization_node_type) =
  match x with
  | ORGANIZATION -> `String "ORGANIZATION"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ACCOUNT -> `String "ACCOUNT"

let organization_node_to_yojson (x : organization_node) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson organization_node_type_to_yojson x.type_);
      ("Value", option_to_yojson organization_node_value_to_yojson x.value);
    ]

let update_portfolio_share_input_to_yojson (x : update_portfolio_share_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
      ("ShareTagOptions", option_to_yojson nullable_boolean_to_yojson x.share_tag_options);
      ("SharePrincipals", option_to_yojson nullable_boolean_to_yojson x.share_principals);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let provider_name_to_yojson = string_to_yojson
let portfolio_description_to_yojson = string_to_yojson

let portfolio_detail_to_yojson (x : portfolio_detail) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("ARN", option_to_yojson resource_ar_n_to_yojson x.ar_n);
      ("DisplayName", option_to_yojson portfolio_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("CreatedTime", option_to_yojson creation_time_to_yojson x.created_time);
      ("ProviderName", option_to_yojson provider_name_to_yojson x.provider_name);
    ]

let update_portfolio_output_to_yojson (x : update_portfolio_output) =
  assoc_to_yojson
    [
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let update_portfolio_input_to_yojson (x : update_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
      ("DisplayName", option_to_yojson portfolio_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("ProviderName", option_to_yojson provider_name_to_yojson x.provider_name);
      ("AddTags", option_to_yojson add_tags_to_yojson x.add_tags);
      ("RemoveTags", option_to_yojson tag_keys_to_yojson x.remove_tags);
    ]

let constraint_parameters_to_yojson = string_to_yojson
let constraint_description_to_yojson = string_to_yojson
let constraint_type_to_yojson = string_to_yojson

let constraint_detail_to_yojson (x : constraint_detail) =
  assoc_to_yojson
    [
      ("ConstraintId", option_to_yojson id_to_yojson x.constraint_id);
      ("Type", option_to_yojson constraint_type_to_yojson x.type_);
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Owner", option_to_yojson account_id_to_yojson x.owner);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
    ]

let update_constraint_output_to_yojson (x : update_constraint_output) =
  assoc_to_yojson
    [
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let update_constraint_input_to_yojson (x : update_constraint_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("Parameters", option_to_yojson constraint_parameters_to_yojson x.parameters);
    ]

let terminate_provisioned_product_output_to_yojson (x : terminate_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let retain_physical_resources_to_yojson = bool_to_yojson
let ignore_errors_to_yojson = bool_to_yojson

let terminate_provisioned_product_input_to_yojson (x : terminate_provisioned_product_input) =
  assoc_to_yojson
    [
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_or_arn_to_yojson x.provisioned_product_name );
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ("TerminateToken", Some (idempotency_token_to_yojson x.terminate_token));
      ("IgnoreErrors", option_to_yojson ignore_errors_to_yojson x.ignore_errors);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "RetainPhysicalResources",
        option_to_yojson retain_physical_resources_to_yojson x.retain_physical_resources );
    ]

let page_token_to_yojson = string_to_yojson
let total_results_count_to_yojson = int_to_yojson
let user_arn_session_to_yojson = string_to_yojson
let user_arn_to_yojson = string_to_yojson
let physical_id_to_yojson = string_to_yojson
let provisioned_product_status_message_to_yojson = string_to_yojson

let provisioned_product_status_to_yojson (x : provisioned_product_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | UNDER_CHANGE -> `String "UNDER_CHANGE"
  | TAINTED -> `String "TAINTED"
  | ERROR -> `String "ERROR"
  | PLAN_IN_PROGRESS -> `String "PLAN_IN_PROGRESS"

let provisioned_product_attribute_to_yojson (x : provisioned_product_attribute) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson provisioned_product_name_or_arn_to_yojson x.name);
      ("Arn", option_to_yojson provisioned_product_name_or_arn_to_yojson x.arn);
      ("Type", option_to_yojson provisioned_product_type_to_yojson x.type_);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Status", option_to_yojson provisioned_product_status_to_yojson x.status);
      ( "StatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson x.status_message );
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("LastRecordId", option_to_yojson id_to_yojson x.last_record_id);
      ("LastProvisioningRecordId", option_to_yojson id_to_yojson x.last_provisioning_record_id);
      ( "LastSuccessfulProvisioningRecordId",
        option_to_yojson id_to_yojson x.last_successful_provisioning_record_id );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PhysicalId", option_to_yojson physical_id_to_yojson x.physical_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("UserArn", option_to_yojson user_arn_to_yojson x.user_arn);
      ("UserArnSession", option_to_yojson user_arn_session_to_yojson x.user_arn_session);
    ]

let provisioned_product_attributes_to_yojson tree =
  list_to_yojson provisioned_product_attribute_to_yojson tree

let search_provisioned_products_output_to_yojson (x : search_provisioned_products_output) =
  assoc_to_yojson
    [
      ( "ProvisionedProducts",
        option_to_yojson provisioned_product_attributes_to_yojson x.provisioned_products );
      ("TotalResultsCount", option_to_yojson total_results_count_to_yojson x.total_results_count);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let search_provisioned_products_page_size_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let sort_field_to_yojson = string_to_yojson
let provisioned_product_view_filter_value_to_yojson = string_to_yojson

let provisioned_product_view_filter_values_to_yojson tree =
  list_to_yojson provisioned_product_view_filter_value_to_yojson tree

let provisioned_product_view_filter_by_to_yojson (x : provisioned_product_view_filter_by) =
  match x with SearchQuery -> `String "SearchQuery"

let provisioned_product_filters_to_yojson tree =
  map_to_yojson provisioned_product_view_filter_by_to_yojson
    provisioned_product_view_filter_values_to_yojson tree

let access_level_filter_value_to_yojson = string_to_yojson

let access_level_filter_key_to_yojson (x : access_level_filter_key) =
  match x with ACCOUNT -> `String "Account" | ROLE -> `String "Role" | USER -> `String "User"

let access_level_filter_to_yojson (x : access_level_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson access_level_filter_key_to_yojson x.key);
      ("Value", option_to_yojson access_level_filter_value_to_yojson x.value);
    ]

let search_provisioned_products_input_to_yojson (x : search_provisioned_products_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("Filters", option_to_yojson provisioned_product_filters_to_yojson x.filters);
      ("SortBy", option_to_yojson sort_field_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("PageSize", option_to_yojson search_provisioned_products_page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let product_view_details_to_yojson tree = list_to_yojson product_view_detail_to_yojson tree

let search_products_as_admin_output_to_yojson (x : search_products_as_admin_output) =
  assoc_to_yojson
    [
      ("ProductViewDetails", option_to_yojson product_view_details_to_yojson x.product_view_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let product_source_to_yojson (x : product_source) = match x with ACCOUNT -> `String "ACCOUNT"
let page_size_to_yojson = int_to_yojson

let product_view_sort_by_to_yojson (x : product_view_sort_by) =
  match x with
  | Title -> `String "Title"
  | VersionCount -> `String "VersionCount"
  | CreationDate -> `String "CreationDate"

let product_view_filter_value_to_yojson = string_to_yojson

let product_view_filter_values_to_yojson tree =
  list_to_yojson product_view_filter_value_to_yojson tree

let product_view_filter_by_to_yojson (x : product_view_filter_by) =
  match x with
  | FullTextSearch -> `String "FullTextSearch"
  | Owner -> `String "Owner"
  | ProductType -> `String "ProductType"
  | SourceProductId -> `String "SourceProductId"

let product_view_filters_to_yojson tree =
  map_to_yojson product_view_filter_by_to_yojson product_view_filter_values_to_yojson tree

let search_products_as_admin_input_to_yojson (x : search_products_as_admin_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
      ("Filters", option_to_yojson product_view_filters_to_yojson x.filters);
      ("SortBy", option_to_yojson product_view_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("ProductSource", option_to_yojson product_source_to_yojson x.product_source);
    ]

let approximate_count_to_yojson = int_to_yojson
let attribute_value_to_yojson = string_to_yojson

let product_view_aggregation_value_to_yojson (x : product_view_aggregation_value) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson attribute_value_to_yojson x.value);
      ("ApproximateCount", option_to_yojson approximate_count_to_yojson x.approximate_count);
    ]

let product_view_aggregation_values_to_yojson tree =
  list_to_yojson product_view_aggregation_value_to_yojson tree

let product_view_aggregation_type_to_yojson = string_to_yojson

let product_view_aggregations_to_yojson tree =
  map_to_yojson product_view_aggregation_type_to_yojson product_view_aggregation_values_to_yojson
    tree

let product_view_summaries_to_yojson tree = list_to_yojson product_view_summary_to_yojson tree

let search_products_output_to_yojson (x : search_products_output) =
  assoc_to_yojson
    [
      ( "ProductViewSummaries",
        option_to_yojson product_view_summaries_to_yojson x.product_view_summaries );
      ( "ProductViewAggregations",
        option_to_yojson product_view_aggregations_to_yojson x.product_view_aggregations );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let page_size_max100_to_yojson = int_to_yojson

let search_products_input_to_yojson (x : search_products_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Filters", option_to_yojson product_view_filters_to_yojson x.filters);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("SortBy", option_to_yojson product_view_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let last_request_id_to_yojson = string_to_yojson
let provisioned_product_id_to_yojson = string_to_yojson

let provisioned_product_detail_to_yojson (x : provisioned_product_detail) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson provisioned_product_name_or_arn_to_yojson x.name);
      ("Arn", option_to_yojson provisioned_product_name_or_arn_to_yojson x.arn);
      ("Type", option_to_yojson provisioned_product_type_to_yojson x.type_);
      ("Id", option_to_yojson provisioned_product_id_to_yojson x.id);
      ("Status", option_to_yojson provisioned_product_status_to_yojson x.status);
      ( "StatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson x.status_message );
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("LastRecordId", option_to_yojson last_request_id_to_yojson x.last_record_id);
      ("LastProvisioningRecordId", option_to_yojson id_to_yojson x.last_provisioning_record_id);
      ( "LastSuccessfulProvisioningRecordId",
        option_to_yojson id_to_yojson x.last_successful_provisioning_record_id );
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("LaunchRoleArn", option_to_yojson role_arn_to_yojson x.launch_role_arn);
    ]

let provisioned_product_details_to_yojson tree =
  list_to_yojson provisioned_product_detail_to_yojson tree

let scan_provisioned_products_output_to_yojson (x : scan_provisioned_products_output) =
  assoc_to_yojson
    [
      ( "ProvisionedProducts",
        option_to_yojson provisioned_product_details_to_yojson x.provisioned_products );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let scan_provisioned_products_input_to_yojson (x : scan_provisioned_products_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let reject_portfolio_share_output_to_yojson = unit_to_yojson

let portfolio_share_type_to_yojson (x : portfolio_share_type) =
  match x with
  | IMPORTED -> `String "IMPORTED"
  | AWS_SERVICECATALOG -> `String "AWS_SERVICECATALOG"
  | AWS_ORGANIZATIONS -> `String "AWS_ORGANIZATIONS"

let reject_portfolio_share_input_to_yojson (x : reject_portfolio_share_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
    ]

let provision_product_output_to_yojson (x : provision_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let notification_arn_to_yojson = string_to_yojson
let notification_arns_to_yojson tree = list_to_yojson notification_arn_to_yojson tree

let provisioning_preferences_to_yojson (x : provisioning_preferences) =
  assoc_to_yojson
    [
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
      ( "StackSetFailureToleranceCount",
        option_to_yojson stack_set_failure_tolerance_count_to_yojson
          x.stack_set_failure_tolerance_count );
      ( "StackSetFailureTolerancePercentage",
        option_to_yojson stack_set_failure_tolerance_percentage_to_yojson
          x.stack_set_failure_tolerance_percentage );
      ( "StackSetMaxConcurrencyCount",
        option_to_yojson stack_set_max_concurrency_count_to_yojson x.stack_set_max_concurrency_count
      );
      ( "StackSetMaxConcurrencyPercentage",
        option_to_yojson stack_set_max_concurrency_percentage_to_yojson
          x.stack_set_max_concurrency_percentage );
    ]

let provisioning_parameter_to_yojson (x : provisioning_parameter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson parameter_key_to_yojson x.key);
      ("Value", option_to_yojson parameter_value_to_yojson x.value);
    ]

let provisioning_parameters_to_yojson tree = list_to_yojson provisioning_parameter_to_yojson tree

let provision_product_input_to_yojson (x : provision_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
      ( "ProvisioningPreferences",
        option_to_yojson provisioning_preferences_to_yojson x.provisioning_preferences );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ("ProvisionToken", Some (idempotency_token_to_yojson x.provision_token));
    ]

let notify_update_provisioned_product_engine_workflow_result_output_to_yojson = unit_to_yojson
let description_to_yojson = string_to_yojson
let output_value_to_yojson = string_to_yojson
let output_key_to_yojson = string_to_yojson

let record_output_to_yojson (x : record_output) =
  assoc_to_yojson
    [
      ("OutputKey", option_to_yojson output_key_to_yojson x.output_key);
      ("OutputValue", option_to_yojson output_value_to_yojson x.output_value);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let record_outputs_to_yojson tree = list_to_yojson record_output_to_yojson tree
let engine_workflow_failure_reason_to_yojson = string_to_yojson

let engine_workflow_status_to_yojson (x : engine_workflow_status) =
  match x with SUCCEEDED -> `String "SUCCEEDED" | FAILED -> `String "FAILED"

let engine_workflow_token_to_yojson = string_to_yojson

let notify_update_provisioned_product_engine_workflow_result_input_to_yojson
    (x : notify_update_provisioned_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let notify_terminate_provisioned_product_engine_workflow_result_output_to_yojson = unit_to_yojson

let notify_terminate_provisioned_product_engine_workflow_result_input_to_yojson
    (x : notify_terminate_provisioned_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let notify_provision_product_engine_workflow_result_output_to_yojson = unit_to_yojson
let unique_tag_value_to_yojson = string_to_yojson
let unique_tag_key_to_yojson = string_to_yojson

let unique_tag_resource_identifier_to_yojson (x : unique_tag_resource_identifier) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson unique_tag_key_to_yojson x.key);
      ("Value", option_to_yojson unique_tag_value_to_yojson x.value);
    ]

let engine_workflow_resource_identifier_to_yojson (x : engine_workflow_resource_identifier) =
  assoc_to_yojson
    [ ("UniqueTag", option_to_yojson unique_tag_resource_identifier_to_yojson x.unique_tag) ]

let notify_provision_product_engine_workflow_result_input_to_yojson
    (x : notify_provision_product_engine_workflow_result_input) =
  assoc_to_yojson
    [
      ("WorkflowToken", Some (engine_workflow_token_to_yojson x.workflow_token));
      ("RecordId", Some (id_to_yojson x.record_id));
      ("Status", Some (engine_workflow_status_to_yojson x.status));
      ("FailureReason", option_to_yojson engine_workflow_failure_reason_to_yojson x.failure_reason);
      ( "ResourceIdentifier",
        option_to_yojson engine_workflow_resource_identifier_to_yojson x.resource_identifier );
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let tag_option_details_to_yojson tree = list_to_yojson tag_option_detail_to_yojson tree

let list_tag_options_output_to_yojson (x : list_tag_options_output) =
  assoc_to_yojson
    [
      ("TagOptionDetails", option_to_yojson tag_option_details_to_yojson x.tag_option_details);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let list_tag_options_filters_to_yojson (x : list_tag_options_filters) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
      ("Value", option_to_yojson tag_option_value_to_yojson x.value);
      ("Active", option_to_yojson tag_option_active_to_yojson x.active);
    ]

let list_tag_options_input_to_yojson (x : list_tag_options_input) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson list_tag_options_filters_to_yojson x.filters);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let stack_instance_status_to_yojson (x : stack_instance_status) =
  match x with
  | CURRENT -> `String "CURRENT"
  | OUTDATED -> `String "OUTDATED"
  | INOPERABLE -> `String "INOPERABLE"

let stack_instance_to_yojson (x : stack_instance) =
  assoc_to_yojson
    [
      ("Account", option_to_yojson account_id_to_yojson x.account);
      ("Region", option_to_yojson region_to_yojson x.region);
      ( "StackInstanceStatus",
        option_to_yojson stack_instance_status_to_yojson x.stack_instance_status );
    ]

let stack_instances_to_yojson tree = list_to_yojson stack_instance_to_yojson tree

let list_stack_instances_for_provisioned_product_output_to_yojson
    (x : list_stack_instances_for_provisioned_product_output) =
  assoc_to_yojson
    [
      ("StackInstances", option_to_yojson stack_instances_to_yojson x.stack_instances);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_stack_instances_for_provisioned_product_input_to_yojson
    (x : list_stack_instances_for_provisioned_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let service_action_summaries_to_yojson tree = list_to_yojson service_action_summary_to_yojson tree

let list_service_actions_for_provisioning_artifact_output_to_yojson
    (x : list_service_actions_for_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "ServiceActionSummaries",
        option_to_yojson service_action_summaries_to_yojson x.service_action_summaries );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_service_actions_for_provisioning_artifact_input_to_yojson
    (x : list_service_actions_for_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let list_service_actions_output_to_yojson (x : list_service_actions_output) =
  assoc_to_yojson
    [
      ( "ServiceActionSummaries",
        option_to_yojson service_action_summaries_to_yojson x.service_action_summaries );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_service_actions_input_to_yojson (x : list_service_actions_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let resource_detail_created_time_to_yojson = timestamp_epoch_seconds_to_yojson
let resource_detail_description_to_yojson = string_to_yojson
let resource_detail_name_to_yojson = string_to_yojson
let resource_detail_ar_n_to_yojson = string_to_yojson
let resource_detail_id_to_yojson = string_to_yojson

let resource_detail_to_yojson (x : resource_detail) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_detail_id_to_yojson x.id);
      ("ARN", option_to_yojson resource_detail_ar_n_to_yojson x.ar_n);
      ("Name", option_to_yojson resource_detail_name_to_yojson x.name);
      ("Description", option_to_yojson resource_detail_description_to_yojson x.description);
      ("CreatedTime", option_to_yojson resource_detail_created_time_to_yojson x.created_time);
    ]

let resource_details_to_yojson tree = list_to_yojson resource_detail_to_yojson tree

let list_resources_for_tag_option_output_to_yojson (x : list_resources_for_tag_option_output) =
  assoc_to_yojson
    [
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let resource_type_to_yojson = string_to_yojson

let list_resources_for_tag_option_input_to_yojson (x : list_resources_for_tag_option_input) =
  assoc_to_yojson
    [
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let record_details_to_yojson tree = list_to_yojson record_detail_to_yojson tree

let list_record_history_output_to_yojson (x : list_record_history_output) =
  assoc_to_yojson
    [
      ("RecordDetails", option_to_yojson record_details_to_yojson x.record_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let search_filter_value_to_yojson = string_to_yojson
let search_filter_key_to_yojson = string_to_yojson

let list_record_history_search_filter_to_yojson (x : list_record_history_search_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson search_filter_key_to_yojson x.key);
      ("Value", option_to_yojson search_filter_value_to_yojson x.value);
    ]

let list_record_history_input_to_yojson (x : list_record_history_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
      ("SearchFilter", option_to_yojson list_record_history_search_filter_to_yojson x.search_filter);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let provisioning_artifact_created_time_to_yojson = timestamp_epoch_seconds_to_yojson

let provisioning_artifact_to_yojson (x : provisioning_artifact) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("CreatedTime", option_to_yojson provisioning_artifact_created_time_to_yojson x.created_time);
      ("Guidance", option_to_yojson provisioning_artifact_guidance_to_yojson x.guidance);
    ]

let provisioning_artifact_view_to_yojson (x : provisioning_artifact_view) =
  assoc_to_yojson
    [
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
      ( "ProvisioningArtifact",
        option_to_yojson provisioning_artifact_to_yojson x.provisioning_artifact );
    ]

let provisioning_artifact_views_to_yojson tree =
  list_to_yojson provisioning_artifact_view_to_yojson tree

let list_provisioning_artifacts_for_service_action_output_to_yojson
    (x : list_provisioning_artifacts_for_service_action_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactViews",
        option_to_yojson provisioning_artifact_views_to_yojson x.provisioning_artifact_views );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_provisioning_artifacts_for_service_action_input_to_yojson
    (x : list_provisioning_artifacts_for_service_action_input) =
  assoc_to_yojson
    [
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let provisioning_artifact_details_to_yojson tree =
  list_to_yojson provisioning_artifact_detail_to_yojson tree

let list_provisioning_artifacts_output_to_yojson (x : list_provisioning_artifacts_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactDetails",
        option_to_yojson provisioning_artifact_details_to_yojson x.provisioning_artifact_details );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_provisioning_artifacts_input_to_yojson (x : list_provisioning_artifacts_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
    ]

let provisioned_product_plan_type_to_yojson (x : provisioned_product_plan_type) =
  match x with CLOUDFORMATION -> `String "CLOUDFORMATION"

let provisioned_product_plan_name_to_yojson = string_to_yojson

let provisioned_product_plan_summary_to_yojson (x : provisioned_product_plan_summary) =
  assoc_to_yojson
    [
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ( "ProvisionProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provision_product_name );
      ("PlanType", option_to_yojson provisioned_product_plan_type_to_yojson x.plan_type);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
    ]

let provisioned_product_plans_to_yojson tree =
  list_to_yojson provisioned_product_plan_summary_to_yojson tree

let list_provisioned_product_plans_output_to_yojson (x : list_provisioned_product_plans_output) =
  assoc_to_yojson
    [
      ( "ProvisionedProductPlans",
        option_to_yojson provisioned_product_plans_to_yojson x.provisioned_product_plans );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_provisioned_product_plans_input_to_yojson (x : list_provisioned_product_plans_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("AccessLevelFilter", option_to_yojson access_level_filter_to_yojson x.access_level_filter);
    ]

let principal_type_to_yojson (x : principal_type) =
  match x with IAM -> `String "IAM" | IAM_PATTERN -> `String "IAM_PATTERN"

let principal_ar_n_to_yojson = string_to_yojson

let principal_to_yojson (x : principal) =
  assoc_to_yojson
    [
      ("PrincipalARN", option_to_yojson principal_ar_n_to_yojson x.principal_ar_n);
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
    ]

let principals_to_yojson tree = list_to_yojson principal_to_yojson tree

let list_principals_for_portfolio_output_to_yojson (x : list_principals_for_portfolio_output) =
  assoc_to_yojson
    [
      ("Principals", option_to_yojson principals_to_yojson x.principals);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_principals_for_portfolio_input_to_yojson (x : list_principals_for_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let portfolio_details_to_yojson tree = list_to_yojson portfolio_detail_to_yojson tree

let list_portfolios_for_product_output_to_yojson (x : list_portfolios_for_product_output) =
  assoc_to_yojson
    [
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_portfolios_for_product_input_to_yojson (x : list_portfolios_for_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
    ]

let list_portfolios_output_to_yojson (x : list_portfolios_output) =
  assoc_to_yojson
    [
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_portfolios_input_to_yojson (x : list_portfolios_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
    ]

let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree

let list_portfolio_access_output_to_yojson (x : list_portfolio_access_output) =
  assoc_to_yojson
    [
      ("AccountIds", option_to_yojson account_ids_to_yojson x.account_ids);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_portfolio_access_input_to_yojson (x : list_portfolio_access_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("OrganizationParentId", option_to_yojson id_to_yojson x.organization_parent_id);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
    ]

let organization_nodes_to_yojson tree = list_to_yojson organization_node_to_yojson tree

let list_organization_portfolio_access_output_to_yojson
    (x : list_organization_portfolio_access_output) =
  assoc_to_yojson
    [
      ("OrganizationNodes", option_to_yojson organization_nodes_to_yojson x.organization_nodes);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_organization_portfolio_access_input_to_yojson
    (x : list_organization_portfolio_access_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("OrganizationNodeType", Some (organization_node_type_to_yojson x.organization_node_type));
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let portfolio_name_to_yojson = string_to_yojson

let constraint_summary_to_yojson (x : constraint_summary) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson constraint_type_to_yojson x.type_);
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
    ]

let constraint_summaries_to_yojson tree = list_to_yojson constraint_summary_to_yojson tree

let launch_path_summary_to_yojson (x : launch_path_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("ConstraintSummaries", option_to_yojson constraint_summaries_to_yojson x.constraint_summaries);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Name", option_to_yojson portfolio_name_to_yojson x.name);
    ]

let launch_path_summaries_to_yojson tree = list_to_yojson launch_path_summary_to_yojson tree

let list_launch_paths_output_to_yojson (x : list_launch_paths_output) =
  assoc_to_yojson
    [
      ( "LaunchPathSummaries",
        option_to_yojson launch_path_summaries_to_yojson x.launch_path_summaries );
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_launch_paths_input_to_yojson (x : list_launch_paths_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let constraint_details_to_yojson tree = list_to_yojson constraint_detail_to_yojson tree

let list_constraints_for_portfolio_output_to_yojson (x : list_constraints_for_portfolio_output) =
  assoc_to_yojson
    [
      ("ConstraintDetails", option_to_yojson constraint_details_to_yojson x.constraint_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_constraints_for_portfolio_input_to_yojson (x : list_constraints_for_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let budget_name_to_yojson = string_to_yojson

let budget_detail_to_yojson (x : budget_detail) =
  assoc_to_yojson [ ("BudgetName", option_to_yojson budget_name_to_yojson x.budget_name) ]

let budgets_to_yojson tree = list_to_yojson budget_detail_to_yojson tree

let list_budgets_for_resource_output_to_yojson (x : list_budgets_for_resource_output) =
  assoc_to_yojson
    [
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_budgets_for_resource_input_to_yojson (x : list_budgets_for_resource_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ResourceId", Some (id_to_yojson x.resource_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let list_accepted_portfolio_shares_output_to_yojson (x : list_accepted_portfolio_shares_output) =
  assoc_to_yojson
    [
      ("PortfolioDetails", option_to_yojson portfolio_details_to_yojson x.portfolio_details);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let list_accepted_portfolio_shares_input_to_yojson (x : list_accepted_portfolio_shares_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
    ]

let import_as_provisioned_product_output_to_yojson (x : import_as_provisioned_product_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let import_as_provisioned_product_input_to_yojson (x : import_as_provisioned_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ("PhysicalId", Some (physical_id_to_yojson x.physical_id));
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let get_provisioned_product_outputs_output_to_yojson (x : get_provisioned_product_outputs_output) =
  assoc_to_yojson
    [
      ("Outputs", option_to_yojson record_outputs_to_yojson x.outputs);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let output_keys_to_yojson tree = list_to_yojson output_key_to_yojson tree

let get_provisioned_product_outputs_input_to_yojson (x : get_provisioned_product_outputs_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProvisionedProductId", option_to_yojson id_to_yojson x.provisioned_product_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("OutputKeys", option_to_yojson output_keys_to_yojson x.output_keys);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let access_status_to_yojson (x : access_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | UNDER_CHANGE -> `String "UNDER_CHANGE"
  | DISABLED -> `String "DISABLED"

let get_aws_organizations_access_status_output_to_yojson
    (x : get_aws_organizations_access_status_output) =
  assoc_to_yojson [ ("AccessStatus", option_to_yojson access_status_to_yojson x.access_status) ]

let get_aws_organizations_access_status_input_to_yojson = unit_to_yojson

let execute_provisioned_product_service_action_output_to_yojson
    (x : execute_provisioned_product_service_action_output) =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let execution_parameter_value_to_yojson = string_to_yojson

let execution_parameter_value_list_to_yojson tree =
  list_to_yojson execution_parameter_value_to_yojson tree

let execution_parameter_key_to_yojson = string_to_yojson

let execution_parameter_map_to_yojson tree =
  map_to_yojson execution_parameter_key_to_yojson execution_parameter_value_list_to_yojson tree

let execute_provisioned_product_service_action_input_to_yojson
    (x : execute_provisioned_product_service_action_input) =
  assoc_to_yojson
    [
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ExecuteToken", Some (idempotency_token_to_yojson x.execute_token));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Parameters", option_to_yojson execution_parameter_map_to_yojson x.parameters);
    ]

let execute_provisioned_product_plan_output_to_yojson (x : execute_provisioned_product_plan_output)
    =
  assoc_to_yojson [ ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail) ]

let execute_provisioned_product_plan_input_to_yojson (x : execute_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let enable_aws_organizations_access_output_to_yojson = unit_to_yojson
let enable_aws_organizations_access_input_to_yojson = unit_to_yojson
let disassociate_tag_option_from_resource_output_to_yojson = unit_to_yojson
let resource_id_to_yojson = string_to_yojson

let disassociate_tag_option_from_resource_input_to_yojson
    (x : disassociate_tag_option_from_resource_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
    ]

let disassociate_service_action_from_provisioning_artifact_output_to_yojson = unit_to_yojson

let disassociate_service_action_from_provisioning_artifact_input_to_yojson
    (x : disassociate_service_action_from_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let disassociate_product_from_portfolio_output_to_yojson = unit_to_yojson

let disassociate_product_from_portfolio_input_to_yojson
    (x : disassociate_product_from_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
    ]

let disassociate_principal_from_portfolio_output_to_yojson = unit_to_yojson

let disassociate_principal_from_portfolio_input_to_yojson
    (x : disassociate_principal_from_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("PrincipalARN", Some (principal_ar_n_to_yojson x.principal_ar_n));
      ("PrincipalType", option_to_yojson principal_type_to_yojson x.principal_type);
    ]

let disassociate_budget_from_resource_output_to_yojson = unit_to_yojson

let disassociate_budget_from_resource_input_to_yojson (x : disassociate_budget_from_resource_input)
    =
  assoc_to_yojson
    [
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ResourceId", Some (id_to_yojson x.resource_id));
    ]

let disable_aws_organizations_access_output_to_yojson = unit_to_yojson
let disable_aws_organizations_access_input_to_yojson = unit_to_yojson

let describe_tag_option_output_to_yojson (x : describe_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let describe_tag_option_input_to_yojson (x : describe_tag_option_input) =
  assoc_to_yojson [ ("Id", Some (tag_option_id_to_yojson x.id)) ]

let execution_parameter_type_to_yojson = string_to_yojson

let execution_parameter_to_yojson (x : execution_parameter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson execution_parameter_key_to_yojson x.name);
      ("Type", option_to_yojson execution_parameter_type_to_yojson x.type_);
      ("DefaultValues", option_to_yojson execution_parameter_value_list_to_yojson x.default_values);
    ]

let execution_parameters_to_yojson tree = list_to_yojson execution_parameter_to_yojson tree

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
      ("ProvisionedProductId", Some (id_to_yojson x.provisioned_product_id));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_service_action_output_to_yojson (x : describe_service_action_output) =
  assoc_to_yojson
    [
      ( "ServiceActionDetail",
        option_to_yojson service_action_detail_to_yojson x.service_action_detail );
    ]

let describe_service_action_input_to_yojson (x : describe_service_action_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let describe_record_output_to_yojson (x : describe_record_output) =
  assoc_to_yojson
    [
      ("RecordDetail", option_to_yojson record_detail_to_yojson x.record_detail);
      ("RecordOutputs", option_to_yojson record_outputs_to_yojson x.record_outputs);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let describe_record_input_to_yojson (x : describe_record_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
    ]

let output_description_to_yojson = string_to_yojson
let provisioning_artifact_output_key_to_yojson = string_to_yojson

let provisioning_artifact_output_to_yojson (x : provisioning_artifact_output) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson provisioning_artifact_output_key_to_yojson x.key);
      ("Description", option_to_yojson output_description_to_yojson x.description);
    ]

let provisioning_artifact_outputs_to_yojson tree =
  list_to_yojson provisioning_artifact_output_to_yojson tree

let provisioning_artifact_preferences_to_yojson (x : provisioning_artifact_preferences) =
  assoc_to_yojson
    [
      ("StackSetAccounts", option_to_yojson stack_set_accounts_to_yojson x.stack_set_accounts);
      ("StackSetRegions", option_to_yojson stack_set_regions_to_yojson x.stack_set_regions);
    ]

let tag_option_values_to_yojson tree = list_to_yojson tag_option_value_to_yojson tree

let tag_option_summary_to_yojson (x : tag_option_summary) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_option_key_to_yojson x.key);
      ("Values", option_to_yojson tag_option_values_to_yojson x.values);
    ]

let tag_option_summaries_to_yojson tree = list_to_yojson tag_option_summary_to_yojson tree
let instruction_value_to_yojson = string_to_yojson
let instruction_type_to_yojson = string_to_yojson

let usage_instruction_to_yojson (x : usage_instruction) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson instruction_type_to_yojson x.type_);
      ("Value", option_to_yojson instruction_value_to_yojson x.value);
    ]

let usage_instructions_to_yojson tree = list_to_yojson usage_instruction_to_yojson tree
let string__to_yojson = string_to_yojson
let allowed_values_to_yojson tree = list_to_yojson string__to_yojson tree

let parameter_constraints_to_yojson (x : parameter_constraints) =
  assoc_to_yojson
    [
      ("AllowedValues", option_to_yojson allowed_values_to_yojson x.allowed_values);
      ("AllowedPattern", option_to_yojson string__to_yojson x.allowed_pattern);
      ("ConstraintDescription", option_to_yojson string__to_yojson x.constraint_description);
      ("MaxLength", option_to_yojson string__to_yojson x.max_length);
      ("MinLength", option_to_yojson string__to_yojson x.min_length);
      ("MaxValue", option_to_yojson string__to_yojson x.max_value);
      ("MinValue", option_to_yojson string__to_yojson x.min_value);
    ]

let no_echo_to_yojson = bool_to_yojson
let parameter_type_to_yojson = string_to_yojson
let default_value_to_yojson = string_to_yojson

let provisioning_artifact_parameter_to_yojson (x : provisioning_artifact_parameter) =
  assoc_to_yojson
    [
      ("ParameterKey", option_to_yojson parameter_key_to_yojson x.parameter_key);
      ("DefaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("ParameterType", option_to_yojson parameter_type_to_yojson x.parameter_type);
      ("IsNoEcho", option_to_yojson no_echo_to_yojson x.is_no_echo);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ParameterConstraints",
        option_to_yojson parameter_constraints_to_yojson x.parameter_constraints );
    ]

let provisioning_artifact_parameters_to_yojson tree =
  list_to_yojson provisioning_artifact_parameter_to_yojson tree

let describe_provisioning_parameters_output_to_yojson (x : describe_provisioning_parameters_output)
    =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_parameters_to_yojson
          x.provisioning_artifact_parameters );
      ("ConstraintSummaries", option_to_yojson constraint_summaries_to_yojson x.constraint_summaries);
      ("UsageInstructions", option_to_yojson usage_instructions_to_yojson x.usage_instructions);
      ("TagOptions", option_to_yojson tag_option_summaries_to_yojson x.tag_options);
      ( "ProvisioningArtifactPreferences",
        option_to_yojson provisioning_artifact_preferences_to_yojson
          x.provisioning_artifact_preferences );
      ( "ProvisioningArtifactOutputs",
        option_to_yojson provisioning_artifact_outputs_to_yojson x.provisioning_artifact_outputs );
      ( "ProvisioningArtifactOutputKeys",
        option_to_yojson provisioning_artifact_outputs_to_yojson x.provisioning_artifact_output_keys
      );
    ]

let describe_provisioning_parameters_input_to_yojson (x : describe_provisioning_parameters_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("PathName", option_to_yojson portfolio_display_name_to_yojson x.path_name);
    ]

let describe_provisioning_artifact_output_to_yojson (x : describe_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_parameters_to_yojson
          x.provisioning_artifact_parameters );
    ]

let boolean__to_yojson = bool_to_yojson
let verbose_to_yojson = bool_to_yojson

let describe_provisioning_artifact_input_to_yojson (x : describe_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ( "ProvisioningArtifactName",
        option_to_yojson provisioning_artifact_name_to_yojson x.provisioning_artifact_name );
      ("ProductName", option_to_yojson product_view_name_to_yojson x.product_name);
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
      ( "IncludeProvisioningArtifactParameters",
        option_to_yojson boolean__to_yojson x.include_provisioning_artifact_parameters );
    ]

let causing_entity_to_yojson = string_to_yojson

let evaluation_type_to_yojson (x : evaluation_type) =
  match x with STATIC -> `String "STATIC" | DYNAMIC -> `String "DYNAMIC"

let requires_recreation_to_yojson (x : requires_recreation) =
  match x with
  | NEVER -> `String "NEVER"
  | CONDITIONALLY -> `String "CONDITIONALLY"
  | ALWAYS -> `String "ALWAYS"

let property_name_to_yojson = string_to_yojson

let resource_attribute_to_yojson (x : resource_attribute) =
  match x with
  | PROPERTIES -> `String "PROPERTIES"
  | METADATA -> `String "METADATA"
  | CREATIONPOLICY -> `String "CREATIONPOLICY"
  | UPDATEPOLICY -> `String "UPDATEPOLICY"
  | DELETIONPOLICY -> `String "DELETIONPOLICY"
  | TAGS -> `String "TAGS"

let resource_target_definition_to_yojson (x : resource_target_definition) =
  assoc_to_yojson
    [
      ("Attribute", option_to_yojson resource_attribute_to_yojson x.attribute);
      ("Name", option_to_yojson property_name_to_yojson x.name);
      ("RequiresRecreation", option_to_yojson requires_recreation_to_yojson x.requires_recreation);
    ]

let resource_change_detail_to_yojson (x : resource_change_detail) =
  assoc_to_yojson
    [
      ("Target", option_to_yojson resource_target_definition_to_yojson x.target);
      ("Evaluation", option_to_yojson evaluation_type_to_yojson x.evaluation);
      ("CausingEntity", option_to_yojson causing_entity_to_yojson x.causing_entity);
    ]

let resource_change_details_to_yojson tree = list_to_yojson resource_change_detail_to_yojson tree
let scope_to_yojson tree = list_to_yojson resource_attribute_to_yojson tree

let replacement_to_yojson (x : replacement) =
  match x with
  | TRUE -> `String "TRUE"
  | FALSE -> `String "FALSE"
  | CONDITIONAL -> `String "CONDITIONAL"

let plan_resource_type_to_yojson = string_to_yojson
let physical_resource_id_to_yojson = string_to_yojson
let logical_resource_id_to_yojson = string_to_yojson

let change_action_to_yojson (x : change_action) =
  match x with ADD -> `String "ADD" | MODIFY -> `String "MODIFY" | REMOVE -> `String "REMOVE"

let resource_change_to_yojson (x : resource_change) =
  assoc_to_yojson
    [
      ("Action", option_to_yojson change_action_to_yojson x.action);
      ("LogicalResourceId", option_to_yojson logical_resource_id_to_yojson x.logical_resource_id);
      ("PhysicalResourceId", option_to_yojson physical_resource_id_to_yojson x.physical_resource_id);
      ("ResourceType", option_to_yojson plan_resource_type_to_yojson x.resource_type);
      ("Replacement", option_to_yojson replacement_to_yojson x.replacement);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("Details", option_to_yojson resource_change_details_to_yojson x.details);
    ]

let resource_changes_to_yojson tree = list_to_yojson resource_change_to_yojson tree
let status_message_to_yojson = string_to_yojson

let provisioned_product_plan_status_to_yojson (x : provisioned_product_plan_status) =
  match x with
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_SUCCESS -> `String "CREATE_SUCCESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | EXECUTE_IN_PROGRESS -> `String "EXECUTE_IN_PROGRESS"
  | EXECUTE_SUCCESS -> `String "EXECUTE_SUCCESS"
  | EXECUTE_FAILED -> `String "EXECUTE_FAILED"

let provisioned_product_plan_details_to_yojson (x : provisioned_product_plan_details) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson created_time_to_yojson x.created_time);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ( "ProvisionProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provision_product_name );
      ("PlanType", option_to_yojson provisioned_product_plan_type_to_yojson x.plan_type);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("Status", option_to_yojson provisioned_product_plan_status_to_yojson x.status);
      ("UpdatedTime", option_to_yojson updated_time_to_yojson x.updated_time);
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
    ]

let describe_provisioned_product_plan_output_to_yojson
    (x : describe_provisioned_product_plan_output) =
  assoc_to_yojson
    [
      ( "ProvisionedProductPlanDetails",
        option_to_yojson provisioned_product_plan_details_to_yojson
          x.provisioned_product_plan_details );
      ("ResourceChanges", option_to_yojson resource_changes_to_yojson x.resource_changes);
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
    ]

let describe_provisioned_product_plan_input_to_yojson (x : describe_provisioned_product_plan_input)
    =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("PageSize", option_to_yojson page_size_to_yojson x.page_size);
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
    ]

let cloud_watch_dashboard_name_to_yojson = string_to_yojson

let cloud_watch_dashboard_to_yojson (x : cloud_watch_dashboard) =
  assoc_to_yojson [ ("Name", option_to_yojson cloud_watch_dashboard_name_to_yojson x.name) ]

let cloud_watch_dashboards_to_yojson tree = list_to_yojson cloud_watch_dashboard_to_yojson tree

let describe_provisioned_product_output_to_yojson (x : describe_provisioned_product_output) =
  assoc_to_yojson
    [
      ( "ProvisionedProductDetail",
        option_to_yojson provisioned_product_detail_to_yojson x.provisioned_product_detail );
      ( "CloudWatchDashboards",
        option_to_yojson cloud_watch_dashboards_to_yojson x.cloud_watch_dashboards );
    ]

let describe_provisioned_product_input_to_yojson (x : describe_provisioned_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson provisioned_product_name_to_yojson x.name);
    ]

let provisioning_artifacts_to_yojson tree = list_to_yojson provisioning_artifact_to_yojson tree

let describe_product_view_output_to_yojson (x : describe_product_view_output) =
  assoc_to_yojson
    [
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
      ( "ProvisioningArtifacts",
        option_to_yojson provisioning_artifacts_to_yojson x.provisioning_artifacts );
    ]

let describe_product_view_input_to_yojson (x : describe_product_view_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let provisioning_artifact_summary_to_yojson (x : provisioning_artifact_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("CreatedTime", option_to_yojson provisioning_artifact_created_time_to_yojson x.created_time);
      ( "ProvisioningArtifactMetadata",
        option_to_yojson provisioning_artifact_info_to_yojson x.provisioning_artifact_metadata );
    ]

let provisioning_artifact_summaries_to_yojson tree =
  list_to_yojson provisioning_artifact_summary_to_yojson tree

let describe_product_as_admin_output_to_yojson (x : describe_product_as_admin_output) =
  assoc_to_yojson
    [
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
      ( "ProvisioningArtifactSummaries",
        option_to_yojson provisioning_artifact_summaries_to_yojson x.provisioning_artifact_summaries
      );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("TagOptions", option_to_yojson tag_option_details_to_yojson x.tag_options);
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
    ]

let describe_product_as_admin_input_to_yojson (x : describe_product_as_admin_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
      ("SourcePortfolioId", option_to_yojson id_to_yojson x.source_portfolio_id);
    ]

let launch_path_to_yojson (x : launch_path) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson portfolio_name_to_yojson x.name);
    ]

let launch_paths_to_yojson tree = list_to_yojson launch_path_to_yojson tree

let describe_product_output_to_yojson (x : describe_product_output) =
  assoc_to_yojson
    [
      ("ProductViewSummary", option_to_yojson product_view_summary_to_yojson x.product_view_summary);
      ( "ProvisioningArtifacts",
        option_to_yojson provisioning_artifacts_to_yojson x.provisioning_artifacts );
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
      ("LaunchPaths", option_to_yojson launch_paths_to_yojson x.launch_paths);
    ]

let describe_product_input_to_yojson (x : describe_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", option_to_yojson id_to_yojson x.id);
      ("Name", option_to_yojson product_view_name_to_yojson x.name);
    ]

let error_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson
let namespaces_to_yojson tree = list_to_yojson account_id_to_yojson tree

let share_error_to_yojson (x : share_error) =
  assoc_to_yojson
    [
      ("Accounts", option_to_yojson namespaces_to_yojson x.accounts);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Error", option_to_yojson error_to_yojson x.error);
    ]

let share_errors_to_yojson tree = list_to_yojson share_error_to_yojson tree
let successful_shares_to_yojson tree = list_to_yojson account_id_to_yojson tree

let share_details_to_yojson (x : share_details) =
  assoc_to_yojson
    [
      ("SuccessfulShares", option_to_yojson successful_shares_to_yojson x.successful_shares);
      ("ShareErrors", option_to_yojson share_errors_to_yojson x.share_errors);
    ]

let describe_portfolio_share_status_output_to_yojson (x : describe_portfolio_share_status_output) =
  assoc_to_yojson
    [
      ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token);
      ("PortfolioId", option_to_yojson id_to_yojson x.portfolio_id);
      ( "OrganizationNodeValue",
        option_to_yojson organization_node_value_to_yojson x.organization_node_value );
      ("Status", option_to_yojson share_status_to_yojson x.status);
      ("ShareDetails", option_to_yojson share_details_to_yojson x.share_details);
    ]

let describe_portfolio_share_status_input_to_yojson (x : describe_portfolio_share_status_input) =
  assoc_to_yojson [ ("PortfolioShareToken", Some (id_to_yojson x.portfolio_share_token)) ]

let describe_portfolio_share_type_to_yojson (x : describe_portfolio_share_type) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | ORGANIZATION -> `String "ORGANIZATION"
  | ORGANIZATIONAL_UNIT -> `String "ORGANIZATIONAL_UNIT"
  | ORGANIZATION_MEMBER_ACCOUNT -> `String "ORGANIZATION_MEMBER_ACCOUNT"

let portfolio_share_detail_to_yojson (x : portfolio_share_detail) =
  assoc_to_yojson
    [
      ("PrincipalId", option_to_yojson id_to_yojson x.principal_id);
      ("Type", option_to_yojson describe_portfolio_share_type_to_yojson x.type_);
      ("Accepted", option_to_yojson boolean__to_yojson x.accepted);
      ("ShareTagOptions", option_to_yojson boolean__to_yojson x.share_tag_options);
      ("SharePrincipals", option_to_yojson boolean__to_yojson x.share_principals);
    ]

let portfolio_share_details_to_yojson tree = list_to_yojson portfolio_share_detail_to_yojson tree

let describe_portfolio_shares_output_to_yojson (x : describe_portfolio_shares_output) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson page_token_to_yojson x.next_page_token);
      ( "PortfolioShareDetails",
        option_to_yojson portfolio_share_details_to_yojson x.portfolio_share_details );
    ]

let describe_portfolio_shares_input_to_yojson (x : describe_portfolio_shares_input) =
  assoc_to_yojson
    [
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("Type", Some (describe_portfolio_share_type_to_yojson x.type_));
      ("PageToken", option_to_yojson page_token_to_yojson x.page_token);
      ("PageSize", option_to_yojson page_size_max100_to_yojson x.page_size);
    ]

let describe_portfolio_output_to_yojson (x : describe_portfolio_output) =
  assoc_to_yojson
    [
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("TagOptions", option_to_yojson tag_option_details_to_yojson x.tag_options);
      ("Budgets", option_to_yojson budgets_to_yojson x.budgets);
    ]

let describe_portfolio_input_to_yojson (x : describe_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let status_detail_to_yojson = string_to_yojson

let copy_product_status_to_yojson (x : copy_product_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"

let describe_copy_product_status_output_to_yojson (x : describe_copy_product_status_output) =
  assoc_to_yojson
    [
      ("CopyProductStatus", option_to_yojson copy_product_status_to_yojson x.copy_product_status);
      ("TargetProductId", option_to_yojson id_to_yojson x.target_product_id);
      ("StatusDetail", option_to_yojson status_detail_to_yojson x.status_detail);
    ]

let describe_copy_product_status_input_to_yojson (x : describe_copy_product_status_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("CopyProductToken", Some (id_to_yojson x.copy_product_token));
    ]

let describe_constraint_output_to_yojson (x : describe_constraint_output) =
  assoc_to_yojson
    [
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let describe_constraint_input_to_yojson (x : describe_constraint_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let delete_tag_option_output_to_yojson = unit_to_yojson

let delete_tag_option_input_to_yojson (x : delete_tag_option_input) =
  assoc_to_yojson [ ("Id", Some (tag_option_id_to_yojson x.id)) ]

let delete_service_action_output_to_yojson = unit_to_yojson

let delete_service_action_input_to_yojson (x : delete_service_action_input) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_provisioning_artifact_output_to_yojson = unit_to_yojson

let delete_provisioning_artifact_input_to_yojson (x : delete_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
    ]

let delete_provisioned_product_plan_output_to_yojson = unit_to_yojson

let delete_provisioned_product_plan_input_to_yojson (x : delete_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PlanId", Some (id_to_yojson x.plan_id));
      ("IgnoreErrors", option_to_yojson ignore_errors_to_yojson x.ignore_errors);
    ]

let delete_product_output_to_yojson = unit_to_yojson

let delete_product_input_to_yojson (x : delete_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let delete_portfolio_share_output_to_yojson (x : delete_portfolio_share_output) =
  assoc_to_yojson [ ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token) ]

let delete_portfolio_share_input_to_yojson (x : delete_portfolio_share_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
    ]

let delete_portfolio_output_to_yojson = unit_to_yojson

let delete_portfolio_input_to_yojson (x : delete_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let delete_constraint_output_to_yojson = unit_to_yojson

let delete_constraint_input_to_yojson (x : delete_constraint_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Id", Some (id_to_yojson x.id));
    ]

let create_tag_option_output_to_yojson (x : create_tag_option_output) =
  assoc_to_yojson
    [ ("TagOptionDetail", option_to_yojson tag_option_detail_to_yojson x.tag_option_detail) ]

let create_tag_option_input_to_yojson (x : create_tag_option_input) =
  assoc_to_yojson
    [
      ("Key", Some (tag_option_key_to_yojson x.key));
      ("Value", Some (tag_option_value_to_yojson x.value));
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
      ("Name", Some (service_action_name_to_yojson x.name));
      ("DefinitionType", Some (service_action_definition_type_to_yojson x.definition_type));
      ("Definition", Some (service_action_definition_map_to_yojson x.definition));
      ("Description", option_to_yojson service_action_description_to_yojson x.description);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let create_provisioning_artifact_output_to_yojson (x : create_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let disable_template_validation_to_yojson = bool_to_yojson

let provisioning_artifact_properties_to_yojson (x : provisioning_artifact_properties) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson provisioning_artifact_name_to_yojson x.name);
      ("Description", option_to_yojson provisioning_artifact_description_to_yojson x.description);
      ("Info", option_to_yojson provisioning_artifact_info_to_yojson x.info);
      ("Type", option_to_yojson provisioning_artifact_type_to_yojson x.type_);
      ( "DisableTemplateValidation",
        option_to_yojson disable_template_validation_to_yojson x.disable_template_validation );
    ]

let create_provisioning_artifact_input_to_yojson (x : create_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("Parameters", Some (provisioning_artifact_properties_to_yojson x.parameters));
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let create_provisioned_product_plan_output_to_yojson (x : create_provisioned_product_plan_output) =
  assoc_to_yojson
    [
      ("PlanName", option_to_yojson provisioned_product_plan_name_to_yojson x.plan_name);
      ("PlanId", option_to_yojson id_to_yojson x.plan_id);
      ("ProvisionProductId", option_to_yojson id_to_yojson x.provision_product_id);
      ( "ProvisionedProductName",
        option_to_yojson provisioned_product_name_to_yojson x.provisioned_product_name );
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
    ]

let create_provisioned_product_plan_input_to_yojson (x : create_provisioned_product_plan_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PlanName", Some (provisioned_product_plan_name_to_yojson x.plan_name));
      ("PlanType", Some (provisioned_product_plan_type_to_yojson x.plan_type));
      ("NotificationArns", option_to_yojson notification_arns_to_yojson x.notification_arns);
      ("PathId", option_to_yojson id_to_yojson x.path_id);
      ("ProductId", Some (id_to_yojson x.product_id));
      ( "ProvisionedProductName",
        Some (provisioned_product_name_to_yojson x.provisioned_product_name) );
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ( "ProvisioningParameters",
        option_to_yojson update_provisioning_parameters_to_yojson x.provisioning_parameters );
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_product_output_to_yojson (x : create_product_output) =
  assoc_to_yojson
    [
      ("ProductViewDetail", option_to_yojson product_view_detail_to_yojson x.product_view_detail);
      ( "ProvisioningArtifactDetail",
        option_to_yojson provisioning_artifact_detail_to_yojson x.provisioning_artifact_detail );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_product_input_to_yojson (x : create_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("Name", Some (product_view_name_to_yojson x.name));
      ("Owner", Some (product_view_owner_to_yojson x.owner));
      ("Description", option_to_yojson product_view_short_description_to_yojson x.description);
      ("Distributor", option_to_yojson product_view_owner_to_yojson x.distributor);
      ("SupportDescription", option_to_yojson support_description_to_yojson x.support_description);
      ("SupportEmail", option_to_yojson support_email_to_yojson x.support_email);
      ("SupportUrl", option_to_yojson support_url_to_yojson x.support_url);
      ("ProductType", Some (product_type_to_yojson x.product_type));
      ("Tags", option_to_yojson add_tags_to_yojson x.tags);
      ( "ProvisioningArtifactParameters",
        option_to_yojson provisioning_artifact_properties_to_yojson
          x.provisioning_artifact_parameters );
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
      ("SourceConnection", option_to_yojson source_connection_to_yojson x.source_connection);
    ]

let create_portfolio_share_output_to_yojson (x : create_portfolio_share_output) =
  assoc_to_yojson [ ("PortfolioShareToken", option_to_yojson id_to_yojson x.portfolio_share_token) ]

let create_portfolio_share_input_to_yojson (x : create_portfolio_share_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("OrganizationNode", option_to_yojson organization_node_to_yojson x.organization_node);
      ("ShareTagOptions", option_to_yojson boolean__to_yojson x.share_tag_options);
      ("SharePrincipals", option_to_yojson boolean__to_yojson x.share_principals);
    ]

let create_portfolio_output_to_yojson (x : create_portfolio_output) =
  assoc_to_yojson
    [
      ("PortfolioDetail", option_to_yojson portfolio_detail_to_yojson x.portfolio_detail);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_portfolio_input_to_yojson (x : create_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("DisplayName", Some (portfolio_display_name_to_yojson x.display_name));
      ("Description", option_to_yojson portfolio_description_to_yojson x.description);
      ("ProviderName", Some (provider_name_to_yojson x.provider_name));
      ("Tags", option_to_yojson add_tags_to_yojson x.tags);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let create_constraint_output_to_yojson (x : create_constraint_output) =
  assoc_to_yojson
    [
      ("ConstraintDetail", option_to_yojson constraint_detail_to_yojson x.constraint_detail);
      ( "ConstraintParameters",
        option_to_yojson constraint_parameters_to_yojson x.constraint_parameters );
      ("Status", option_to_yojson status_to_yojson x.status);
    ]

let create_constraint_input_to_yojson (x : create_constraint_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("Parameters", Some (constraint_parameters_to_yojson x.parameters));
      ("Type", Some (constraint_type_to_yojson x.type_));
      ("Description", option_to_yojson constraint_description_to_yojson x.description);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let copy_product_output_to_yojson (x : copy_product_output) =
  assoc_to_yojson [ ("CopyProductToken", option_to_yojson id_to_yojson x.copy_product_token) ]

let copy_option_to_yojson (x : copy_option) = match x with CopyTags -> `String "CopyTags"
let copy_options_to_yojson tree = list_to_yojson copy_option_to_yojson tree
let provisioning_artifact_property_value_to_yojson = string_to_yojson

let provisioning_artifact_property_name_to_yojson (x : provisioning_artifact_property_name) =
  match x with Id -> `String "Id"

let source_provisioning_artifact_properties_map_to_yojson tree =
  map_to_yojson provisioning_artifact_property_name_to_yojson
    provisioning_artifact_property_value_to_yojson tree

let source_provisioning_artifact_properties_to_yojson tree =
  list_to_yojson source_provisioning_artifact_properties_map_to_yojson tree

let product_arn_to_yojson = string_to_yojson

let copy_product_input_to_yojson (x : copy_product_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("SourceProductArn", Some (product_arn_to_yojson x.source_product_arn));
      ("TargetProductId", option_to_yojson id_to_yojson x.target_product_id);
      ("TargetProductName", option_to_yojson product_view_name_to_yojson x.target_product_name);
      ( "SourceProvisioningArtifactIdentifiers",
        option_to_yojson source_provisioning_artifact_properties_to_yojson
          x.source_provisioning_artifact_identifiers );
      ("CopyOptions", option_to_yojson copy_options_to_yojson x.copy_options);
      ("IdempotencyToken", Some (idempotency_token_to_yojson x.idempotency_token));
    ]

let service_action_association_error_message_to_yojson = string_to_yojson

let service_action_association_error_code_to_yojson (x : service_action_association_error_code) =
  match x with
  | DuplicateResourceException -> `String "DUPLICATE_RESOURCE"
  | InternalFailure -> `String "INTERNAL_FAILURE"
  | LimitExceededException -> `String "LIMIT_EXCEEDED"
  | ResourceNotFoundException -> `String "RESOURCE_NOT_FOUND"
  | ThrottlingException -> `String "THROTTLING"
  | InvalidParameterException -> `String "INVALID_PARAMETER"

let failed_service_action_association_to_yojson (x : failed_service_action_association) =
  assoc_to_yojson
    [
      ("ServiceActionId", option_to_yojson id_to_yojson x.service_action_id);
      ("ProductId", option_to_yojson id_to_yojson x.product_id);
      ("ProvisioningArtifactId", option_to_yojson id_to_yojson x.provisioning_artifact_id);
      ("ErrorCode", option_to_yojson service_action_association_error_code_to_yojson x.error_code);
      ( "ErrorMessage",
        option_to_yojson service_action_association_error_message_to_yojson x.error_message );
    ]

let failed_service_action_associations_to_yojson tree =
  list_to_yojson failed_service_action_association_to_yojson tree

let batch_disassociate_service_action_from_provisioning_artifact_output_to_yojson
    (x : batch_disassociate_service_action_from_provisioning_artifact_output) =
  assoc_to_yojson
    [
      ( "FailedServiceActionAssociations",
        option_to_yojson failed_service_action_associations_to_yojson
          x.failed_service_action_associations );
    ]

let service_action_association_to_yojson (x : service_action_association) =
  assoc_to_yojson
    [
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
    ]

let service_action_associations_to_yojson tree =
  list_to_yojson service_action_association_to_yojson tree

let batch_disassociate_service_action_from_provisioning_artifact_input_to_yojson
    (x : batch_disassociate_service_action_from_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ( "ServiceActionAssociations",
        Some (service_action_associations_to_yojson x.service_action_associations) );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
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
      ( "ServiceActionAssociations",
        Some (service_action_associations_to_yojson x.service_action_associations) );
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let associate_tag_option_with_resource_output_to_yojson = unit_to_yojson

let associate_tag_option_with_resource_input_to_yojson
    (x : associate_tag_option_with_resource_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagOptionId", Some (tag_option_id_to_yojson x.tag_option_id));
    ]

let associate_service_action_with_provisioning_artifact_output_to_yojson = unit_to_yojson

let associate_service_action_with_provisioning_artifact_input_to_yojson
    (x : associate_service_action_with_provisioning_artifact_input) =
  assoc_to_yojson
    [
      ("ProductId", Some (id_to_yojson x.product_id));
      ("ProvisioningArtifactId", Some (id_to_yojson x.provisioning_artifact_id));
      ("ServiceActionId", Some (id_to_yojson x.service_action_id));
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let associate_product_with_portfolio_output_to_yojson = unit_to_yojson

let associate_product_with_portfolio_input_to_yojson (x : associate_product_with_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("ProductId", Some (id_to_yojson x.product_id));
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("SourcePortfolioId", option_to_yojson id_to_yojson x.source_portfolio_id);
    ]

let associate_principal_with_portfolio_output_to_yojson = unit_to_yojson

let associate_principal_with_portfolio_input_to_yojson
    (x : associate_principal_with_portfolio_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("PrincipalARN", Some (principal_ar_n_to_yojson x.principal_ar_n));
      ("PrincipalType", Some (principal_type_to_yojson x.principal_type));
    ]

let associate_budget_with_resource_output_to_yojson = unit_to_yojson

let associate_budget_with_resource_input_to_yojson (x : associate_budget_with_resource_input) =
  assoc_to_yojson
    [
      ("BudgetName", Some (budget_name_to_yojson x.budget_name));
      ("ResourceId", Some (id_to_yojson x.resource_id));
    ]

let accept_portfolio_share_output_to_yojson = unit_to_yojson

let accept_portfolio_share_input_to_yojson (x : accept_portfolio_share_input) =
  assoc_to_yojson
    [
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
      ("PortfolioId", Some (id_to_yojson x.portfolio_id));
      ("PortfolioShareType", option_to_yojson portfolio_share_type_to_yojson x.portfolio_share_type);
    ]
