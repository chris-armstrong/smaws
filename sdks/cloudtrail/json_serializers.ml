open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let account_has_ongoing_import_exception_to_yojson (x : account_has_ongoing_import_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let account_id_to_yojson = string_to_yojson

let account_not_found_exception_to_yojson (x : account_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let account_not_registered_exception_to_yojson (x : account_not_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let account_registered_exception_to_yojson (x : account_registered_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tags_limit_exceeded_exception_to_yojson (x : tags_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_type_not_supported_exception_to_yojson (x : resource_type_not_supported_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let operation_not_permitted_exception_to_yojson (x : operation_not_permitted_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let not_organization_master_account_exception_to_yojson
    (x : not_organization_master_account_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let no_management_account_slr_exists_exception_to_yojson
    (x : no_management_account_slr_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_trail_name_exception_to_yojson (x : invalid_trail_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_tag_parameter_exception_to_yojson (x : invalid_tag_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let inactive_event_data_store_exception_to_yojson (x : inactive_event_data_store_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let event_data_store_not_found_exception_to_yojson (x : event_data_store_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let event_data_store_arn_invalid_exception_to_yojson (x : event_data_store_arn_invalid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_trail_arn_invalid_exception_to_yojson (x : cloud_trail_arn_invalid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channel_not_found_exception_to_yojson (x : channel_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channel_arn_invalid_exception_to_yojson (x : channel_arn_invalid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let add_tags_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let string__to_yojson = string_to_yojson

let add_tags_request_to_yojson (x : add_tags_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("TagsList", Some (tags_list_to_yojson x.tags_list));
    ]

let operator_value_to_yojson = string_to_yojson
let operator_to_yojson tree = list_to_yojson operator_value_to_yojson tree
let selector_field_to_yojson = string_to_yojson

let advanced_field_selector_to_yojson (x : advanced_field_selector) =
  assoc_to_yojson
    [
      ("Field", Some (selector_field_to_yojson x.field));
      ("Equals", option_to_yojson operator_to_yojson x.equals);
      ("StartsWith", option_to_yojson operator_to_yojson x.starts_with);
      ("EndsWith", option_to_yojson operator_to_yojson x.ends_with);
      ("NotEquals", option_to_yojson operator_to_yojson x.not_equals);
      ("NotStartsWith", option_to_yojson operator_to_yojson x.not_starts_with);
      ("NotEndsWith", option_to_yojson operator_to_yojson x.not_ends_with);
    ]

let advanced_field_selectors_to_yojson tree = list_to_yojson advanced_field_selector_to_yojson tree
let selector_name_to_yojson = string_to_yojson

let advanced_event_selector_to_yojson (x : advanced_event_selector) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson selector_name_to_yojson x.name);
      ("FieldSelectors", Some (advanced_field_selectors_to_yojson x.field_selectors));
    ]

let advanced_event_selectors_to_yojson tree = list_to_yojson advanced_event_selector_to_yojson tree

let event_category_aggregation_to_yojson (x : event_category_aggregation) =
  match x with Data -> `String "Data"

let template_to_yojson (x : template) =
  match x with
  | API_ACTIVITY -> `String "API_ACTIVITY"
  | RESOURCE_ACCESS -> `String "RESOURCE_ACCESS"
  | USER_ACTIONS -> `String "USER_ACTIONS"

let templates_to_yojson tree = list_to_yojson template_to_yojson tree

let aggregation_configuration_to_yojson (x : aggregation_configuration) =
  assoc_to_yojson
    [
      ("Templates", Some (templates_to_yojson x.templates));
      ("EventCategory", Some (event_category_aggregation_to_yojson x.event_category));
    ]

let aggregation_configurations_to_yojson tree =
  list_to_yojson aggregation_configuration_to_yojson tree

let billing_mode_to_yojson (x : billing_mode) =
  match x with
  | EXTENDABLE_RETENTION_PRICING -> `String "EXTENDABLE_RETENTION_PRICING"
  | FIXED_RETENTION_PRICING -> `String "FIXED_RETENTION_PRICING"

let boolean__to_yojson = bool_to_yojson
let byte_buffer_to_yojson = blob_to_yojson

let query_id_not_found_exception_to_yojson (x : query_id_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let inactive_query_exception_to_yojson (x : inactive_query_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let query_status_to_yojson (x : query_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | FINISHED -> `String "FINISHED"
  | FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | TIMED_OUT -> `String "TIMED_OUT"

let uui_d_to_yojson = string_to_yojson

let cancel_query_response_to_yojson (x : cancel_query_response) =
  assoc_to_yojson
    [
      ("QueryId", Some (uui_d_to_yojson x.query_id));
      ("QueryStatus", Some (query_status_to_yojson x.query_status));
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let event_data_store_arn_to_yojson = string_to_yojson

let cancel_query_request_to_yojson (x : cancel_query_request) =
  assoc_to_yojson
    [
      ("EventDataStore", option_to_yojson event_data_store_arn_to_yojson x.event_data_store);
      ("QueryId", Some (uui_d_to_yojson x.query_id));
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let cannot_delegate_management_account_exception_to_yojson
    (x : cannot_delegate_management_account_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channel_name_to_yojson = string_to_yojson
let channel_arn_to_yojson = string_to_yojson

let channel_to_yojson (x : channel) =
  assoc_to_yojson
    [
      ("ChannelArn", option_to_yojson channel_arn_to_yojson x.channel_arn);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
    ]

let channel_already_exists_exception_to_yojson (x : channel_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channel_exists_for_eds_exception_to_yojson (x : channel_exists_for_eds_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channel_max_limit_exceeded_exception_to_yojson (x : channel_max_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let channels_to_yojson tree = list_to_yojson channel_to_yojson tree

let cloud_trail_access_not_enabled_exception_to_yojson
    (x : cloud_trail_access_not_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_trail_invalid_client_token_id_exception_to_yojson
    (x : cloud_trail_invalid_client_token_id_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let trail_not_provided_exception_to_yojson (x : trail_not_provided_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let trail_not_found_exception_to_yojson (x : trail_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let s3_bucket_does_not_exist_exception_to_yojson (x : s3_bucket_does_not_exist_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let organizations_not_in_use_exception_to_yojson (x : organizations_not_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let organization_not_in_all_features_mode_exception_to_yojson
    (x : organization_not_in_all_features_mode_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let kms_key_not_found_exception_to_yojson (x : kms_key_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let kms_key_disabled_exception_to_yojson (x : kms_key_disabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let kms_exception_to_yojson (x : kms_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_sns_topic_name_exception_to_yojson (x : invalid_sns_topic_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_s3_prefix_exception_to_yojson (x : invalid_s3_prefix_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_s3_bucket_name_exception_to_yojson (x : invalid_s3_bucket_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_kms_key_id_exception_to_yojson (x : invalid_kms_key_id_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_home_region_exception_to_yojson (x : invalid_home_region_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_event_selectors_exception_to_yojson (x : invalid_event_selectors_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_cloud_watch_logs_role_arn_exception_to_yojson
    (x : invalid_cloud_watch_logs_role_arn_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_cloud_watch_logs_log_group_arn_exception_to_yojson
    (x : invalid_cloud_watch_logs_log_group_arn_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_sns_topic_policy_exception_to_yojson (x : insufficient_sns_topic_policy_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_s3_bucket_policy_exception_to_yojson (x : insufficient_s3_bucket_policy_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_encryption_policy_exception_to_yojson
    (x : insufficient_encryption_policy_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_dependency_service_access_permission_exception_to_yojson
    (x : insufficient_dependency_service_access_permission_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cloud_watch_logs_delivery_unavailable_exception_to_yojson
    (x : cloud_watch_logs_delivery_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_trail_response_to_yojson (x : update_trail_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("S3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("SnsTopicName", option_to_yojson string__to_yojson x.sns_topic_name);
      ("SnsTopicARN", option_to_yojson string__to_yojson x.sns_topic_ar_n);
      ( "IncludeGlobalServiceEvents",
        option_to_yojson boolean__to_yojson x.include_global_service_events );
      ("IsMultiRegionTrail", option_to_yojson boolean__to_yojson x.is_multi_region_trail);
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("LogFileValidationEnabled", option_to_yojson boolean__to_yojson x.log_file_validation_enabled);
      ( "CloudWatchLogsLogGroupArn",
        option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn );
      ("CloudWatchLogsRoleArn", option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("IsOrganizationTrail", option_to_yojson boolean__to_yojson x.is_organization_trail);
    ]

let update_trail_request_to_yojson (x : update_trail_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("S3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("SnsTopicName", option_to_yojson string__to_yojson x.sns_topic_name);
      ( "IncludeGlobalServiceEvents",
        option_to_yojson boolean__to_yojson x.include_global_service_events );
      ("IsMultiRegionTrail", option_to_yojson boolean__to_yojson x.is_multi_region_trail);
      ("EnableLogFileValidation", option_to_yojson boolean__to_yojson x.enable_log_file_validation);
      ( "CloudWatchLogsLogGroupArn",
        option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn );
      ("CloudWatchLogsRoleArn", option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("IsOrganizationTrail", option_to_yojson boolean__to_yojson x.is_organization_trail);
    ]

let invalid_insight_selectors_exception_to_yojson (x : invalid_insight_selectors_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let event_data_store_has_ongoing_import_exception_to_yojson
    (x : event_data_store_has_ongoing_import_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let event_data_store_already_exists_exception_to_yojson
    (x : event_data_store_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let federation_role_arn_to_yojson = string_to_yojson

let federation_status_to_yojson (x : federation_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"

let event_data_store_kms_key_id_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson
let termination_protection_enabled_to_yojson = bool_to_yojson
let retention_period_to_yojson = int_to_yojson

let event_data_store_status_to_yojson (x : event_data_store_status) =
  match x with
  | CREATED -> `String "CREATED"
  | ENABLED -> `String "ENABLED"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | STARTING_INGESTION -> `String "STARTING_INGESTION"
  | STOPPING_INGESTION -> `String "STOPPING_INGESTION"
  | STOPPED_INGESTION -> `String "STOPPED_INGESTION"

let event_data_store_name_to_yojson = string_to_yojson

let update_event_data_store_response_to_yojson (x : update_event_data_store_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ("Status", option_to_yojson event_data_store_status_to_yojson x.status);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ("FederationStatus", option_to_yojson federation_status_to_yojson x.federation_status);
      ("FederationRoleArn", option_to_yojson federation_role_arn_to_yojson x.federation_role_arn);
    ]

let update_event_data_store_request_to_yojson (x : update_event_data_store_request) =
  assoc_to_yojson
    [
      ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store));
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_query_statement_exception_to_yojson (x : invalid_query_statement_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let time_of_day_to_yojson = string_to_yojson

let refresh_schedule_status_to_yojson (x : refresh_schedule_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let refresh_schedule_frequency_value_to_yojson = int_to_yojson

let refresh_schedule_frequency_unit_to_yojson (x : refresh_schedule_frequency_unit) =
  match x with HOURS -> `String "HOURS" | DAYS -> `String "DAYS"

let refresh_schedule_frequency_to_yojson (x : refresh_schedule_frequency) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson refresh_schedule_frequency_unit_to_yojson x.unit_);
      ("Value", option_to_yojson refresh_schedule_frequency_value_to_yojson x.value);
    ]

let refresh_schedule_to_yojson (x : refresh_schedule) =
  assoc_to_yojson
    [
      ("Frequency", option_to_yojson refresh_schedule_frequency_to_yojson x.frequency);
      ("Status", option_to_yojson refresh_schedule_status_to_yojson x.status);
      ("TimeOfDay", option_to_yojson time_of_day_to_yojson x.time_of_day);
    ]

let view_properties_value_to_yojson = string_to_yojson
let view_properties_key_to_yojson = string_to_yojson

let view_properties_map_to_yojson tree =
  map_to_yojson view_properties_key_to_yojson view_properties_value_to_yojson tree

let query_parameter_to_yojson = string_to_yojson
let query_parameters_to_yojson tree = list_to_yojson query_parameter_to_yojson tree
let query_statement_to_yojson = string_to_yojson
let query_alias_to_yojson = string_to_yojson

let widget_to_yojson (x : widget) =
  assoc_to_yojson
    [
      ("QueryAlias", option_to_yojson query_alias_to_yojson x.query_alias);
      ("QueryStatement", option_to_yojson query_statement_to_yojson x.query_statement);
      ("QueryParameters", option_to_yojson query_parameters_to_yojson x.query_parameters);
      ("ViewProperties", option_to_yojson view_properties_map_to_yojson x.view_properties);
    ]

let widget_list_to_yojson tree = list_to_yojson widget_to_yojson tree

let dashboard_type_to_yojson (x : dashboard_type) =
  match x with MANAGED -> `String "MANAGED" | CUSTOM -> `String "CUSTOM"

let dashboard_name_to_yojson = string_to_yojson
let dashboard_arn_to_yojson = string_to_yojson

let update_dashboard_response_to_yojson (x : update_dashboard_response) =
  assoc_to_yojson
    [
      ("DashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ("Name", option_to_yojson dashboard_name_to_yojson x.name);
      ("Type", option_to_yojson dashboard_type_to_yojson x.type_);
      ("Widgets", option_to_yojson widget_list_to_yojson x.widgets);
      ("RefreshSchedule", option_to_yojson refresh_schedule_to_yojson x.refresh_schedule);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
    ]

let request_widget_to_yojson (x : request_widget) =
  assoc_to_yojson
    [
      ("QueryStatement", Some (query_statement_to_yojson x.query_statement));
      ("QueryParameters", option_to_yojson query_parameters_to_yojson x.query_parameters);
      ("ViewProperties", Some (view_properties_map_to_yojson x.view_properties));
    ]

let request_widget_list_to_yojson tree = list_to_yojson request_widget_to_yojson tree

let update_dashboard_request_to_yojson (x : update_dashboard_request) =
  assoc_to_yojson
    [
      ("DashboardId", Some (dashboard_arn_to_yojson x.dashboard_id));
      ("Widgets", option_to_yojson request_widget_list_to_yojson x.widgets);
      ("RefreshSchedule", option_to_yojson refresh_schedule_to_yojson x.refresh_schedule);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
    ]

let invalid_event_data_store_category_exception_to_yojson
    (x : invalid_event_data_store_category_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let location_to_yojson = string_to_yojson

let destination_type_to_yojson (x : destination_type) =
  match x with
  | EVENT_DATA_STORE -> `String "EVENT_DATA_STORE"
  | AWS_SERVICE -> `String "AWS_SERVICE"

let destination_to_yojson (x : destination) =
  assoc_to_yojson
    [
      ("Type", Some (destination_type_to_yojson x.type_));
      ("Location", Some (location_to_yojson x.location));
    ]

let destinations_to_yojson tree = list_to_yojson destination_to_yojson tree
let source_to_yojson = string_to_yojson

let update_channel_response_to_yojson (x : update_channel_response) =
  assoc_to_yojson
    [
      ("ChannelArn", option_to_yojson channel_arn_to_yojson x.channel_arn);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
      ("Source", option_to_yojson source_to_yojson x.source);
      ("Destinations", option_to_yojson destinations_to_yojson x.destinations);
    ]

let update_channel_request_to_yojson (x : update_channel_request) =
  assoc_to_yojson
    [
      ("Channel", Some (channel_arn_to_yojson x.channel));
      ("Destinations", option_to_yojson destinations_to_yojson x.destinations);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
    ]

let stop_logging_response_to_yojson = unit_to_yojson

let stop_logging_request_to_yojson (x : stop_logging_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let import_not_found_exception_to_yojson (x : import_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let long_to_yojson = long_to_yojson

let import_statistics_to_yojson (x : import_statistics) =
  assoc_to_yojson
    [
      ("PrefixesFound", option_to_yojson long_to_yojson x.prefixes_found);
      ("PrefixesCompleted", option_to_yojson long_to_yojson x.prefixes_completed);
      ("FilesCompleted", option_to_yojson long_to_yojson x.files_completed);
      ("EventsCompleted", option_to_yojson long_to_yojson x.events_completed);
      ("FailedEntries", option_to_yojson long_to_yojson x.failed_entries);
    ]

let import_status_to_yojson (x : import_status) =
  match x with
  | INITIALIZING -> `String "INITIALIZING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | STOPPED -> `String "STOPPED"
  | COMPLETED -> `String "COMPLETED"

let import_destinations_to_yojson tree = list_to_yojson event_data_store_arn_to_yojson tree

let s3_import_source_to_yojson (x : s3_import_source) =
  assoc_to_yojson
    [
      ("S3LocationUri", Some (string__to_yojson x.s3_location_uri));
      ("S3BucketRegion", Some (string__to_yojson x.s3_bucket_region));
      ("S3BucketAccessRoleArn", Some (string__to_yojson x.s3_bucket_access_role_arn));
    ]

let import_source_to_yojson (x : import_source) =
  assoc_to_yojson [ ("S3", Some (s3_import_source_to_yojson x.s3)) ]

let stop_import_response_to_yojson (x : stop_import_response) =
  assoc_to_yojson
    [
      ("ImportId", option_to_yojson uui_d_to_yojson x.import_id);
      ("ImportSource", option_to_yojson import_source_to_yojson x.import_source);
      ("Destinations", option_to_yojson import_destinations_to_yojson x.destinations);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("StartEventTime", option_to_yojson date_to_yojson x.start_event_time);
      ("EndEventTime", option_to_yojson date_to_yojson x.end_event_time);
      ("ImportStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
    ]

let stop_import_request_to_yojson (x : stop_import_request) =
  assoc_to_yojson [ ("ImportId", Some (uui_d_to_yojson x.import_id)) ]

let invalid_event_data_store_status_exception_to_yojson
    (x : invalid_event_data_store_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let stop_event_data_store_ingestion_response_to_yojson = unit_to_yojson

let stop_event_data_store_ingestion_request_to_yojson (x : stop_event_data_store_ingestion_request)
    =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let max_concurrent_queries_exception_to_yojson (x : max_concurrent_queries_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let start_query_response_to_yojson (x : start_query_response) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson uui_d_to_yojson x.query_id);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let delivery_s3_uri_to_yojson = string_to_yojson

let start_query_request_to_yojson (x : start_query_request) =
  assoc_to_yojson
    [
      ("QueryStatement", option_to_yojson query_statement_to_yojson x.query_statement);
      ("DeliveryS3Uri", option_to_yojson delivery_s3_uri_to_yojson x.delivery_s3_uri);
      ("QueryAlias", option_to_yojson query_alias_to_yojson x.query_alias);
      ("QueryParameters", option_to_yojson query_parameters_to_yojson x.query_parameters);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let start_logging_response_to_yojson = unit_to_yojson

let start_logging_request_to_yojson (x : start_logging_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let invalid_import_source_exception_to_yojson (x : invalid_import_source_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let start_import_response_to_yojson (x : start_import_response) =
  assoc_to_yojson
    [
      ("ImportId", option_to_yojson uui_d_to_yojson x.import_id);
      ("Destinations", option_to_yojson import_destinations_to_yojson x.destinations);
      ("ImportSource", option_to_yojson import_source_to_yojson x.import_source);
      ("StartEventTime", option_to_yojson date_to_yojson x.start_event_time);
      ("EndEventTime", option_to_yojson date_to_yojson x.end_event_time);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
    ]

let start_import_request_to_yojson (x : start_import_request) =
  assoc_to_yojson
    [
      ("Destinations", option_to_yojson import_destinations_to_yojson x.destinations);
      ("ImportSource", option_to_yojson import_source_to_yojson x.import_source);
      ("StartEventTime", option_to_yojson date_to_yojson x.start_event_time);
      ("EndEventTime", option_to_yojson date_to_yojson x.end_event_time);
      ("ImportId", option_to_yojson uui_d_to_yojson x.import_id);
    ]

let start_event_data_store_ingestion_response_to_yojson = unit_to_yojson

let start_event_data_store_ingestion_request_to_yojson
    (x : start_event_data_store_ingestion_request) =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let refresh_id_to_yojson = string_to_yojson

let start_dashboard_refresh_response_to_yojson (x : start_dashboard_refresh_response) =
  assoc_to_yojson [ ("RefreshId", option_to_yojson refresh_id_to_yojson x.refresh_id) ]

let query_parameter_value_to_yojson = string_to_yojson
let query_parameter_key_to_yojson = string_to_yojson

let query_parameter_values_to_yojson tree =
  map_to_yojson query_parameter_key_to_yojson query_parameter_value_to_yojson tree

let start_dashboard_refresh_request_to_yojson (x : start_dashboard_refresh_request) =
  assoc_to_yojson
    [
      ("DashboardId", Some (dashboard_arn_to_yojson x.dashboard_id));
      ( "QueryParameterValues",
        option_to_yojson query_parameter_values_to_yojson x.query_parameter_values );
    ]

let pagination_token_to_yojson = string_to_yojson
let sample_query_relevance_to_yojson = float_to_yojson
let sample_query_sq_l_to_yojson = string_to_yojson
let sample_query_description_to_yojson = string_to_yojson
let sample_query_name_to_yojson = string_to_yojson

let search_sample_queries_search_result_to_yojson (x : search_sample_queries_search_result) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson sample_query_name_to_yojson x.name);
      ("Description", option_to_yojson sample_query_description_to_yojson x.description);
      ("SQL", option_to_yojson sample_query_sq_l_to_yojson x.sq_l);
      ("Relevance", option_to_yojson sample_query_relevance_to_yojson x.relevance);
    ]

let search_sample_queries_search_results_to_yojson tree =
  list_to_yojson search_sample_queries_search_result_to_yojson tree

let search_sample_queries_response_to_yojson (x : search_sample_queries_response) =
  assoc_to_yojson
    [
      ( "SearchResults",
        option_to_yojson search_sample_queries_search_results_to_yojson x.search_results );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let search_sample_queries_max_results_to_yojson = int_to_yojson
let search_sample_queries_search_phrase_to_yojson = string_to_yojson

let search_sample_queries_request_to_yojson (x : search_sample_queries_request) =
  assoc_to_yojson
    [
      ("SearchPhrase", Some (search_sample_queries_search_phrase_to_yojson x.search_phrase));
      ("MaxResults", option_to_yojson search_sample_queries_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let event_data_store_max_limit_exceeded_exception_to_yojson
    (x : event_data_store_max_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let restore_event_data_store_response_to_yojson (x : restore_event_data_store_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ("Status", option_to_yojson event_data_store_status_to_yojson x.status);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let restore_event_data_store_request_to_yojson (x : restore_event_data_store_request) =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let remove_tags_response_to_yojson = unit_to_yojson

let remove_tags_request_to_yojson (x : remove_tags_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("TagsList", Some (tags_list_to_yojson x.tags_list));
    ]

let not_organization_management_account_exception_to_yojson
    (x : not_organization_management_account_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let insufficient_iam_access_permission_exception_to_yojson
    (x : insufficient_iam_access_permission_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delegated_admin_account_limit_exceeded_exception_to_yojson
    (x : delegated_admin_account_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let register_organization_delegated_admin_response_to_yojson = unit_to_yojson

let register_organization_delegated_admin_request_to_yojson
    (x : register_organization_delegated_admin_request) =
  assoc_to_yojson [ ("MemberAccountId", Some (account_id_to_yojson x.member_account_id)) ]

let resource_policy_not_valid_exception_to_yojson (x : resource_policy_not_valid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_arn_not_valid_exception_to_yojson (x : resource_arn_not_valid_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_policy_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy);
      ( "DelegatedAdminResourcePolicy",
        option_to_yojson resource_policy_to_yojson x.delegated_admin_resource_policy );
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("ResourcePolicy", Some (resource_policy_to_yojson x.resource_policy));
    ]

let source_event_category_to_yojson (x : source_event_category) =
  match x with Management -> `String "Management" | Data -> `String "Data"

let source_event_categories_to_yojson tree = list_to_yojson source_event_category_to_yojson tree

let insight_type_to_yojson (x : insight_type) =
  match x with
  | ApiCallRateInsight -> `String "ApiCallRateInsight"
  | ApiErrorRateInsight -> `String "ApiErrorRateInsight"

let insight_selector_to_yojson (x : insight_selector) =
  assoc_to_yojson
    [
      ("InsightType", option_to_yojson insight_type_to_yojson x.insight_type);
      ("EventCategories", option_to_yojson source_event_categories_to_yojson x.event_categories);
    ]

let insight_selectors_to_yojson tree = list_to_yojson insight_selector_to_yojson tree

let put_insight_selectors_response_to_yojson (x : put_insight_selectors_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("InsightSelectors", option_to_yojson insight_selectors_to_yojson x.insight_selectors);
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("InsightsDestination", option_to_yojson event_data_store_arn_to_yojson x.insights_destination);
    ]

let put_insight_selectors_request_to_yojson (x : put_insight_selectors_request) =
  assoc_to_yojson
    [
      ("TrailName", option_to_yojson string__to_yojson x.trail_name);
      ("InsightSelectors", Some (insight_selectors_to_yojson x.insight_selectors));
      ("EventDataStore", option_to_yojson event_data_store_arn_to_yojson x.event_data_store);
      ("InsightsDestination", option_to_yojson event_data_store_arn_to_yojson x.insights_destination);
    ]

let exclude_management_event_sources_to_yojson tree = list_to_yojson string__to_yojson tree
let data_resource_values_to_yojson tree = list_to_yojson string__to_yojson tree

let data_resource_to_yojson (x : data_resource) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Values", option_to_yojson data_resource_values_to_yojson x.values);
    ]

let data_resources_to_yojson tree = list_to_yojson data_resource_to_yojson tree

let read_write_type_to_yojson (x : read_write_type) =
  match x with
  | ReadOnly -> `String "ReadOnly"
  | WriteOnly -> `String "WriteOnly"
  | All -> `String "All"

let event_selector_to_yojson (x : event_selector) =
  assoc_to_yojson
    [
      ("ReadWriteType", option_to_yojson read_write_type_to_yojson x.read_write_type);
      ("IncludeManagementEvents", option_to_yojson boolean__to_yojson x.include_management_events);
      ("DataResources", option_to_yojson data_resources_to_yojson x.data_resources);
      ( "ExcludeManagementEventSources",
        option_to_yojson exclude_management_event_sources_to_yojson
          x.exclude_management_event_sources );
    ]

let event_selectors_to_yojson tree = list_to_yojson event_selector_to_yojson tree

let put_event_selectors_response_to_yojson (x : put_event_selectors_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("EventSelectors", option_to_yojson event_selectors_to_yojson x.event_selectors);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
    ]

let put_event_selectors_request_to_yojson (x : put_event_selectors_request) =
  assoc_to_yojson
    [
      ("TrailName", Some (string__to_yojson x.trail_name));
      ("EventSelectors", option_to_yojson event_selectors_to_yojson x.event_selectors);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
    ]

let operator_target_list_member_to_yojson = string_to_yojson
let operator_target_list_to_yojson tree = list_to_yojson operator_target_list_member_to_yojson tree

let type__to_yojson (x : type_) =
  match x with TagContext -> `String "TagContext" | RequestContext -> `String "RequestContext"

let context_key_selector_to_yojson (x : context_key_selector) =
  assoc_to_yojson
    [
      ("Type", Some (type__to_yojson x.type_));
      ("Equals", Some (operator_target_list_to_yojson x.equals));
    ]

let context_key_selectors_to_yojson tree = list_to_yojson context_key_selector_to_yojson tree

let max_event_size_to_yojson (x : max_event_size) =
  match x with Standard -> `String "Standard" | Large -> `String "Large"

let put_event_configuration_response_to_yojson (x : put_event_configuration_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("MaxEventSize", option_to_yojson max_event_size_to_yojson x.max_event_size);
      ( "ContextKeySelectors",
        option_to_yojson context_key_selectors_to_yojson x.context_key_selectors );
      ( "AggregationConfigurations",
        option_to_yojson aggregation_configurations_to_yojson x.aggregation_configurations );
    ]

let put_event_configuration_request_to_yojson (x : put_event_configuration_request) =
  assoc_to_yojson
    [
      ("TrailName", option_to_yojson string__to_yojson x.trail_name);
      ("EventDataStore", option_to_yojson string__to_yojson x.event_data_store);
      ("MaxEventSize", option_to_yojson max_event_size_to_yojson x.max_event_size);
      ( "ContextKeySelectors",
        option_to_yojson context_key_selectors_to_yojson x.context_key_selectors );
      ( "AggregationConfigurations",
        option_to_yojson aggregation_configurations_to_yojson x.aggregation_configurations );
    ]

let invalid_time_range_exception_to_yojson (x : invalid_time_range_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_max_results_exception_to_yojson (x : invalid_max_results_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_lookup_attributes_exception_to_yojson (x : invalid_lookup_attributes_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_event_category_exception_to_yojson (x : invalid_event_category_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("ResourceName", option_to_yojson string__to_yojson x.resource_name);
    ]

let resource_list_to_yojson tree = list_to_yojson resource_to_yojson tree

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("EventId", option_to_yojson string__to_yojson x.event_id);
      ("EventName", option_to_yojson string__to_yojson x.event_name);
      ("ReadOnly", option_to_yojson string__to_yojson x.read_only);
      ("AccessKeyId", option_to_yojson string__to_yojson x.access_key_id);
      ("EventTime", option_to_yojson date_to_yojson x.event_time);
      ("EventSource", option_to_yojson string__to_yojson x.event_source);
      ("Username", option_to_yojson string__to_yojson x.username);
      ("Resources", option_to_yojson resource_list_to_yojson x.resources);
      ("CloudTrailEvent", option_to_yojson string__to_yojson x.cloud_trail_event);
    ]

let events_list_to_yojson tree = list_to_yojson event_to_yojson tree

let lookup_events_response_to_yojson (x : lookup_events_response) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson events_list_to_yojson x.events);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let event_category_to_yojson (x : event_category) = match x with Insight -> `String "insight"
let lookup_attribute_value_to_yojson = string_to_yojson

let lookup_attribute_key_to_yojson (x : lookup_attribute_key) =
  match x with
  | EVENT_ID -> `String "EventId"
  | EVENT_NAME -> `String "EventName"
  | READ_ONLY -> `String "ReadOnly"
  | USERNAME -> `String "Username"
  | RESOURCE_TYPE -> `String "ResourceType"
  | RESOURCE_NAME -> `String "ResourceName"
  | EVENT_SOURCE -> `String "EventSource"
  | ACCESS_KEY_ID -> `String "AccessKeyId"

let lookup_attribute_to_yojson (x : lookup_attribute) =
  assoc_to_yojson
    [
      ("AttributeKey", Some (lookup_attribute_key_to_yojson x.attribute_key));
      ("AttributeValue", Some (lookup_attribute_value_to_yojson x.attribute_value));
    ]

let lookup_attributes_list_to_yojson tree = list_to_yojson lookup_attribute_to_yojson tree

let lookup_events_request_to_yojson (x : lookup_events_request) =
  assoc_to_yojson
    [
      ("LookupAttributes", option_to_yojson lookup_attributes_list_to_yojson x.lookup_attributes);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("EventCategory", option_to_yojson event_category_to_yojson x.event_category);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let trail_info_to_yojson (x : trail_info) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("Name", option_to_yojson string__to_yojson x.name);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
    ]

let trails_to_yojson tree = list_to_yojson trail_info_to_yojson tree

let list_trails_response_to_yojson (x : list_trails_response) =
  assoc_to_yojson
    [
      ("Trails", option_to_yojson trails_to_yojson x.trails);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_trails_request_to_yojson (x : list_trails_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson string__to_yojson x.next_token) ]

let invalid_token_exception_to_yojson (x : invalid_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let list_tags_response_to_yojson (x : list_tags_response) =
  assoc_to_yojson
    [
      ("ResourceTagList", option_to_yojson resource_tag_list_to_yojson x.resource_tag_list);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let resource_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_tags_request_to_yojson (x : list_tags_request) =
  assoc_to_yojson
    [
      ("ResourceIdList", Some (resource_id_list_to_yojson x.resource_id_list));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let invalid_query_status_exception_to_yojson (x : invalid_query_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_date_range_exception_to_yojson (x : invalid_date_range_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let query_to_yojson (x : query) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson uui_d_to_yojson x.query_id);
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let queries_to_yojson tree = list_to_yojson query_to_yojson tree

let list_queries_response_to_yojson (x : list_queries_response) =
  assoc_to_yojson
    [
      ("Queries", option_to_yojson queries_to_yojson x.queries);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_queries_max_results_count_to_yojson = int_to_yojson

let list_queries_request_to_yojson (x : list_queries_request) =
  assoc_to_yojson
    [
      ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_queries_max_results_count_to_yojson x.max_results);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
    ]

let public_key_to_yojson (x : public_key) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson byte_buffer_to_yojson x.value);
      ("ValidityStartTime", option_to_yojson date_to_yojson x.validity_start_time);
      ("ValidityEndTime", option_to_yojson date_to_yojson x.validity_end_time);
      ("Fingerprint", option_to_yojson string__to_yojson x.fingerprint);
    ]

let public_key_list_to_yojson tree = list_to_yojson public_key_to_yojson tree

let list_public_keys_response_to_yojson (x : list_public_keys_response) =
  assoc_to_yojson
    [
      ("PublicKeyList", option_to_yojson public_key_list_to_yojson x.public_key_list);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_public_keys_request_to_yojson (x : list_public_keys_request) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let insights_metric_next_token_to_yojson = string_to_yojson
let double_to_yojson = double_to_yojson
let insights_metric_values_to_yojson tree = list_to_yojson double_to_yojson tree
let timestamps_to_yojson tree = list_to_yojson date_to_yojson tree
let error_code_to_yojson = string_to_yojson
let event_name_to_yojson = string_to_yojson
let event_source_to_yojson = string_to_yojson

let list_insights_metric_data_response_to_yojson (x : list_insights_metric_data_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("EventSource", option_to_yojson event_source_to_yojson x.event_source);
      ("EventName", option_to_yojson event_name_to_yojson x.event_name);
      ("InsightType", option_to_yojson insight_type_to_yojson x.insight_type);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("Timestamps", option_to_yojson timestamps_to_yojson x.timestamps);
      ("Values", option_to_yojson insights_metric_values_to_yojson x.values);
      ("NextToken", option_to_yojson insights_metric_next_token_to_yojson x.next_token);
    ]

let insights_metric_max_results_to_yojson = int_to_yojson

let insights_metric_data_type_to_yojson (x : insights_metric_data_type) =
  match x with FILL_WITH_ZEROS -> `String "FillWithZeros" | NON_ZERO_DATA -> `String "NonZeroData"

let insights_metric_period_to_yojson = int_to_yojson

let list_insights_metric_data_request_to_yojson (x : list_insights_metric_data_request) =
  assoc_to_yojson
    [
      ("TrailName", option_to_yojson string__to_yojson x.trail_name);
      ("EventSource", Some (event_source_to_yojson x.event_source));
      ("EventName", Some (event_name_to_yojson x.event_name));
      ("InsightType", Some (insight_type_to_yojson x.insight_type));
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("Period", option_to_yojson insights_metric_period_to_yojson x.period);
      ("DataType", option_to_yojson insights_metric_data_type_to_yojson x.data_type);
      ("MaxResults", option_to_yojson insights_metric_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson insights_metric_next_token_to_yojson x.next_token);
    ]

let list_insights_data_response_to_yojson (x : list_insights_data_response) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson events_list_to_yojson x.events);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_insights_data_max_results_count_to_yojson = int_to_yojson
let list_insights_data_dimension_value_to_yojson = string_to_yojson

let list_insights_data_dimension_key_to_yojson (x : list_insights_data_dimension_key) =
  match x with
  | EVENT_ID -> `String "EventId"
  | EVENT_NAME -> `String "EventName"
  | EVENT_SOURCE -> `String "EventSource"

let list_insights_data_dimensions_to_yojson tree =
  map_to_yojson list_insights_data_dimension_key_to_yojson
    list_insights_data_dimension_value_to_yojson tree

let list_insights_data_type_to_yojson (x : list_insights_data_type) =
  match x with INSIGHTS_EVENTS -> `String "InsightsEvents"

let list_insights_data_request_to_yojson (x : list_insights_data_request) =
  assoc_to_yojson
    [
      ("InsightSource", Some (resource_arn_to_yojson x.insight_source));
      ("DataType", Some (list_insights_data_type_to_yojson x.data_type));
      ("Dimensions", option_to_yojson list_insights_data_dimensions_to_yojson x.dimensions);
      ("StartTime", option_to_yojson date_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_to_yojson x.end_time);
      ("MaxResults", option_to_yojson list_insights_data_max_results_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let imports_list_item_to_yojson (x : imports_list_item) =
  assoc_to_yojson
    [
      ("ImportId", option_to_yojson uui_d_to_yojson x.import_id);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("Destinations", option_to_yojson import_destinations_to_yojson x.destinations);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
    ]

let imports_list_to_yojson tree = list_to_yojson imports_list_item_to_yojson tree

let list_imports_response_to_yojson (x : list_imports_response) =
  assoc_to_yojson
    [
      ("Imports", option_to_yojson imports_list_to_yojson x.imports);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_imports_max_results_count_to_yojson = int_to_yojson

let list_imports_request_to_yojson (x : list_imports_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_imports_max_results_count_to_yojson x.max_results);
      ("Destination", option_to_yojson event_data_store_arn_to_yojson x.destination);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let import_failure_status_to_yojson (x : import_failure_status) =
  match x with
  | FAILED -> `String "FAILED"
  | RETRY -> `String "RETRY"
  | SUCCEEDED -> `String "SUCCEEDED"

let import_failure_list_item_to_yojson (x : import_failure_list_item) =
  assoc_to_yojson
    [
      ("Location", option_to_yojson string__to_yojson x.location);
      ("Status", option_to_yojson import_failure_status_to_yojson x.status);
      ("ErrorType", option_to_yojson string__to_yojson x.error_type);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
    ]

let import_failure_list_to_yojson tree = list_to_yojson import_failure_list_item_to_yojson tree

let list_import_failures_response_to_yojson (x : list_import_failures_response) =
  assoc_to_yojson
    [
      ("Failures", option_to_yojson import_failure_list_to_yojson x.failures);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_import_failures_max_results_count_to_yojson = int_to_yojson

let list_import_failures_request_to_yojson (x : list_import_failures_request) =
  assoc_to_yojson
    [
      ("ImportId", Some (uui_d_to_yojson x.import_id));
      ("MaxResults", option_to_yojson list_import_failures_max_results_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let event_data_store_to_yojson (x : event_data_store) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("Status", option_to_yojson event_data_store_status_to_yojson x.status);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
    ]

let event_data_stores_to_yojson tree = list_to_yojson event_data_store_to_yojson tree

let list_event_data_stores_response_to_yojson (x : list_event_data_stores_response) =
  assoc_to_yojson
    [
      ("EventDataStores", option_to_yojson event_data_stores_to_yojson x.event_data_stores);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_event_data_stores_max_results_count_to_yojson = int_to_yojson

let list_event_data_stores_request_to_yojson (x : list_event_data_stores_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "MaxResults",
        option_to_yojson list_event_data_stores_max_results_count_to_yojson x.max_results );
    ]

let dashboard_detail_to_yojson (x : dashboard_detail) =
  assoc_to_yojson
    [
      ("DashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ("Type", option_to_yojson dashboard_type_to_yojson x.type_);
    ]

let dashboards_to_yojson tree = list_to_yojson dashboard_detail_to_yojson tree

let list_dashboards_response_to_yojson (x : list_dashboards_response) =
  assoc_to_yojson
    [
      ("Dashboards", option_to_yojson dashboards_to_yojson x.dashboards);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_dashboards_max_results_count_to_yojson = int_to_yojson

let list_dashboards_request_to_yojson (x : list_dashboards_request) =
  assoc_to_yojson
    [
      ("NamePrefix", option_to_yojson dashboard_name_to_yojson x.name_prefix);
      ("Type", option_to_yojson dashboard_type_to_yojson x.type_);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_dashboards_max_results_count_to_yojson x.max_results);
    ]

let list_channels_response_to_yojson (x : list_channels_response) =
  assoc_to_yojson
    [
      ("Channels", option_to_yojson channels_to_yojson x.channels);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_channels_max_results_count_to_yojson = int_to_yojson

let list_channels_request_to_yojson (x : list_channels_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_channels_max_results_count_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_trail_status_response_to_yojson (x : get_trail_status_response) =
  assoc_to_yojson
    [
      ("IsLogging", option_to_yojson boolean__to_yojson x.is_logging);
      ("LatestDeliveryError", option_to_yojson string__to_yojson x.latest_delivery_error);
      ("LatestNotificationError", option_to_yojson string__to_yojson x.latest_notification_error);
      ("LatestDeliveryTime", option_to_yojson date_to_yojson x.latest_delivery_time);
      ("LatestNotificationTime", option_to_yojson date_to_yojson x.latest_notification_time);
      ("StartLoggingTime", option_to_yojson date_to_yojson x.start_logging_time);
      ("StopLoggingTime", option_to_yojson date_to_yojson x.stop_logging_time);
      ( "LatestCloudWatchLogsDeliveryError",
        option_to_yojson string__to_yojson x.latest_cloud_watch_logs_delivery_error );
      ( "LatestCloudWatchLogsDeliveryTime",
        option_to_yojson date_to_yojson x.latest_cloud_watch_logs_delivery_time );
      ("LatestDigestDeliveryTime", option_to_yojson date_to_yojson x.latest_digest_delivery_time);
      ( "LatestDigestDeliveryError",
        option_to_yojson string__to_yojson x.latest_digest_delivery_error );
      ( "LatestDeliveryAttemptTime",
        option_to_yojson string__to_yojson x.latest_delivery_attempt_time );
      ( "LatestNotificationAttemptTime",
        option_to_yojson string__to_yojson x.latest_notification_attempt_time );
      ( "LatestNotificationAttemptSucceeded",
        option_to_yojson string__to_yojson x.latest_notification_attempt_succeeded );
      ( "LatestDeliveryAttemptSucceeded",
        option_to_yojson string__to_yojson x.latest_delivery_attempt_succeeded );
      ("TimeLoggingStarted", option_to_yojson string__to_yojson x.time_logging_started);
      ("TimeLoggingStopped", option_to_yojson string__to_yojson x.time_logging_stopped);
    ]

let get_trail_status_request_to_yojson (x : get_trail_status_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let trail_to_yojson (x : trail) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("S3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("SnsTopicName", option_to_yojson string__to_yojson x.sns_topic_name);
      ("SnsTopicARN", option_to_yojson string__to_yojson x.sns_topic_ar_n);
      ( "IncludeGlobalServiceEvents",
        option_to_yojson boolean__to_yojson x.include_global_service_events );
      ("IsMultiRegionTrail", option_to_yojson boolean__to_yojson x.is_multi_region_trail);
      ("HomeRegion", option_to_yojson string__to_yojson x.home_region);
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("LogFileValidationEnabled", option_to_yojson boolean__to_yojson x.log_file_validation_enabled);
      ( "CloudWatchLogsLogGroupArn",
        option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn );
      ("CloudWatchLogsRoleArn", option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("HasCustomEventSelectors", option_to_yojson boolean__to_yojson x.has_custom_event_selectors);
      ("HasInsightSelectors", option_to_yojson boolean__to_yojson x.has_insight_selectors);
      ("IsOrganizationTrail", option_to_yojson boolean__to_yojson x.is_organization_trail);
    ]

let get_trail_response_to_yojson (x : get_trail_response) =
  assoc_to_yojson [ ("Trail", option_to_yojson trail_to_yojson x.trail) ]

let get_trail_request_to_yojson (x : get_trail_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let resource_policy_not_found_exception_to_yojson (x : resource_policy_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("ResourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy);
      ( "DelegatedAdminResourcePolicy",
        option_to_yojson resource_policy_to_yojson x.delegated_admin_resource_policy );
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let query_result_value_to_yojson = string_to_yojson
let query_result_key_to_yojson = string_to_yojson

let query_result_column_to_yojson tree =
  map_to_yojson query_result_key_to_yojson query_result_value_to_yojson tree

let query_result_row_to_yojson tree = list_to_yojson query_result_column_to_yojson tree
let query_result_rows_to_yojson tree = list_to_yojson query_result_row_to_yojson tree
let integer_to_yojson = int_to_yojson

let query_statistics_to_yojson (x : query_statistics) =
  assoc_to_yojson
    [
      ("ResultsCount", option_to_yojson integer_to_yojson x.results_count);
      ("TotalResultsCount", option_to_yojson integer_to_yojson x.total_results_count);
      ("BytesScanned", option_to_yojson long_to_yojson x.bytes_scanned);
    ]

let get_query_results_response_to_yojson (x : get_query_results_response) =
  assoc_to_yojson
    [
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
      ("QueryStatistics", option_to_yojson query_statistics_to_yojson x.query_statistics);
      ("QueryResultRows", option_to_yojson query_result_rows_to_yojson x.query_result_rows);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let max_query_results_to_yojson = int_to_yojson

let get_query_results_request_to_yojson (x : get_query_results_request) =
  assoc_to_yojson
    [
      ("EventDataStore", option_to_yojson event_data_store_arn_to_yojson x.event_data_store);
      ("QueryId", Some (uui_d_to_yojson x.query_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxQueryResults", option_to_yojson max_query_results_to_yojson x.max_query_results);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let insight_not_enabled_exception_to_yojson (x : insight_not_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let get_insight_selectors_response_to_yojson (x : get_insight_selectors_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("InsightSelectors", option_to_yojson insight_selectors_to_yojson x.insight_selectors);
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("InsightsDestination", option_to_yojson event_data_store_arn_to_yojson x.insights_destination);
    ]

let get_insight_selectors_request_to_yojson (x : get_insight_selectors_request) =
  assoc_to_yojson
    [
      ("TrailName", option_to_yojson string__to_yojson x.trail_name);
      ("EventDataStore", option_to_yojson event_data_store_arn_to_yojson x.event_data_store);
    ]

let get_import_response_to_yojson (x : get_import_response) =
  assoc_to_yojson
    [
      ("ImportId", option_to_yojson uui_d_to_yojson x.import_id);
      ("Destinations", option_to_yojson import_destinations_to_yojson x.destinations);
      ("ImportSource", option_to_yojson import_source_to_yojson x.import_source);
      ("StartEventTime", option_to_yojson date_to_yojson x.start_event_time);
      ("EndEventTime", option_to_yojson date_to_yojson x.end_event_time);
      ("ImportStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("ImportStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
    ]

let get_import_request_to_yojson (x : get_import_request) =
  assoc_to_yojson [ ("ImportId", Some (uui_d_to_yojson x.import_id)) ]

let get_event_selectors_response_to_yojson (x : get_event_selectors_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("EventSelectors", option_to_yojson event_selectors_to_yojson x.event_selectors);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
    ]

let get_event_selectors_request_to_yojson (x : get_event_selectors_request) =
  assoc_to_yojson [ ("TrailName", Some (string__to_yojson x.trail_name)) ]

let partition_key_type_to_yojson = string_to_yojson
let partition_key_name_to_yojson = string_to_yojson

let partition_key_to_yojson (x : partition_key) =
  assoc_to_yojson
    [
      ("Name", Some (partition_key_name_to_yojson x.name));
      ("Type", Some (partition_key_type_to_yojson x.type_));
    ]

let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree

let get_event_data_store_response_to_yojson (x : get_event_data_store_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ("Status", option_to_yojson event_data_store_status_to_yojson x.status);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ("FederationStatus", option_to_yojson federation_status_to_yojson x.federation_status);
      ("FederationRoleArn", option_to_yojson federation_role_arn_to_yojson x.federation_role_arn);
      ("PartitionKeys", option_to_yojson partition_key_list_to_yojson x.partition_keys);
    ]

let get_event_data_store_request_to_yojson (x : get_event_data_store_request) =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let get_event_configuration_response_to_yojson (x : get_event_configuration_response) =
  assoc_to_yojson
    [
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("MaxEventSize", option_to_yojson max_event_size_to_yojson x.max_event_size);
      ( "ContextKeySelectors",
        option_to_yojson context_key_selectors_to_yojson x.context_key_selectors );
      ( "AggregationConfigurations",
        option_to_yojson aggregation_configurations_to_yojson x.aggregation_configurations );
    ]

let get_event_configuration_request_to_yojson (x : get_event_configuration_request) =
  assoc_to_yojson
    [
      ("TrailName", option_to_yojson string__to_yojson x.trail_name);
      ("EventDataStore", option_to_yojson string__to_yojson x.event_data_store);
    ]

let dashboard_status_to_yojson (x : dashboard_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | UPDATING -> `String "UPDATING"
  | UPDATED -> `String "UPDATED"
  | DELETING -> `String "DELETING"

let get_dashboard_response_to_yojson (x : get_dashboard_response) =
  assoc_to_yojson
    [
      ("DashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ("Type", option_to_yojson dashboard_type_to_yojson x.type_);
      ("Status", option_to_yojson dashboard_status_to_yojson x.status);
      ("Widgets", option_to_yojson widget_list_to_yojson x.widgets);
      ("RefreshSchedule", option_to_yojson refresh_schedule_to_yojson x.refresh_schedule);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("LastRefreshId", option_to_yojson refresh_id_to_yojson x.last_refresh_id);
      ( "LastRefreshFailureReason",
        option_to_yojson error_message_to_yojson x.last_refresh_failure_reason );
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
    ]

let get_dashboard_request_to_yojson (x : get_dashboard_request) =
  assoc_to_yojson [ ("DashboardId", Some (dashboard_arn_to_yojson x.dashboard_id)) ]

let ingestion_status_to_yojson (x : ingestion_status) =
  assoc_to_yojson
    [
      ("LatestIngestionSuccessTime", option_to_yojson date_to_yojson x.latest_ingestion_success_time);
      ( "LatestIngestionSuccessEventID",
        option_to_yojson uui_d_to_yojson x.latest_ingestion_success_event_i_d );
      ( "LatestIngestionErrorCode",
        option_to_yojson error_message_to_yojson x.latest_ingestion_error_code );
      ("LatestIngestionAttemptTime", option_to_yojson date_to_yojson x.latest_ingestion_attempt_time);
      ( "LatestIngestionAttemptEventID",
        option_to_yojson uui_d_to_yojson x.latest_ingestion_attempt_event_i_d );
    ]

let source_config_to_yojson (x : source_config) =
  assoc_to_yojson
    [
      ("ApplyToAllRegions", option_to_yojson boolean__to_yojson x.apply_to_all_regions);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
    ]

let get_channel_response_to_yojson (x : get_channel_response) =
  assoc_to_yojson
    [
      ("ChannelArn", option_to_yojson channel_arn_to_yojson x.channel_arn);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
      ("Source", option_to_yojson source_to_yojson x.source);
      ("SourceConfig", option_to_yojson source_config_to_yojson x.source_config);
      ("Destinations", option_to_yojson destinations_to_yojson x.destinations);
      ("IngestionStatus", option_to_yojson ingestion_status_to_yojson x.ingestion_status);
    ]

let get_channel_request_to_yojson (x : get_channel_request) =
  assoc_to_yojson [ ("Channel", Some (channel_arn_to_yojson x.channel)) ]

let generate_response_exception_to_yojson (x : generate_response_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let generate_query_response_to_yojson (x : generate_query_response) =
  assoc_to_yojson
    [
      ("QueryStatement", option_to_yojson query_statement_to_yojson x.query_statement);
      ("QueryAlias", option_to_yojson query_alias_to_yojson x.query_alias);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let prompt_to_yojson = string_to_yojson
let event_data_store_list_to_yojson tree = list_to_yojson event_data_store_arn_to_yojson tree

let generate_query_request_to_yojson (x : generate_query_request) =
  assoc_to_yojson
    [
      ("EventDataStores", Some (event_data_store_list_to_yojson x.event_data_stores));
      ("Prompt", Some (prompt_to_yojson x.prompt));
    ]

let event_data_store_federation_enabled_exception_to_yojson
    (x : event_data_store_federation_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let enable_federation_response_to_yojson (x : enable_federation_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("FederationStatus", option_to_yojson federation_status_to_yojson x.federation_status);
      ("FederationRoleArn", option_to_yojson federation_role_arn_to_yojson x.federation_role_arn);
    ]

let enable_federation_request_to_yojson (x : enable_federation_request) =
  assoc_to_yojson
    [
      ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store));
      ("FederationRoleArn", Some (federation_role_arn_to_yojson x.federation_role_arn));
    ]

let disable_federation_response_to_yojson (x : disable_federation_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("FederationStatus", option_to_yojson federation_status_to_yojson x.federation_status);
    ]

let disable_federation_request_to_yojson (x : disable_federation_request) =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let trail_list_to_yojson tree = list_to_yojson trail_to_yojson tree

let describe_trails_response_to_yojson (x : describe_trails_response) =
  assoc_to_yojson [ ("trailList", option_to_yojson trail_list_to_yojson x.trail_list) ]

let trail_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let describe_trails_request_to_yojson (x : describe_trails_request) =
  assoc_to_yojson
    [
      ("trailNameList", option_to_yojson trail_name_list_to_yojson x.trail_name_list);
      ("includeShadowTrails", option_to_yojson boolean__to_yojson x.include_shadow_trails);
    ]

let delivery_status_to_yojson (x : delivery_status) =
  match x with
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | FAILED_SIGNING_FILE -> `String "FAILED_SIGNING_FILE"
  | PENDING -> `String "PENDING"
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | ACCESS_DENIED_SIGNING_FILE -> `String "ACCESS_DENIED_SIGNING_FILE"
  | CANCELLED -> `String "CANCELLED"
  | UNKNOWN -> `String "UNKNOWN"

let query_statistics_for_describe_query_to_yojson (x : query_statistics_for_describe_query) =
  assoc_to_yojson
    [
      ("EventsMatched", option_to_yojson long_to_yojson x.events_matched);
      ("EventsScanned", option_to_yojson long_to_yojson x.events_scanned);
      ("BytesScanned", option_to_yojson long_to_yojson x.bytes_scanned);
      ("ExecutionTimeInMillis", option_to_yojson integer_to_yojson x.execution_time_in_millis);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
    ]

let describe_query_response_to_yojson (x : describe_query_response) =
  assoc_to_yojson
    [
      ("QueryId", option_to_yojson uui_d_to_yojson x.query_id);
      ("QueryString", option_to_yojson query_statement_to_yojson x.query_string);
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
      ( "QueryStatistics",
        option_to_yojson query_statistics_for_describe_query_to_yojson x.query_statistics );
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("DeliveryS3Uri", option_to_yojson delivery_s3_uri_to_yojson x.delivery_s3_uri);
      ("DeliveryStatus", option_to_yojson delivery_status_to_yojson x.delivery_status);
      ("Prompt", option_to_yojson prompt_to_yojson x.prompt);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let describe_query_request_to_yojson (x : describe_query_request) =
  assoc_to_yojson
    [
      ("EventDataStore", option_to_yojson event_data_store_arn_to_yojson x.event_data_store);
      ("QueryId", option_to_yojson uui_d_to_yojson x.query_id);
      ("QueryAlias", option_to_yojson query_alias_to_yojson x.query_alias);
      ("RefreshId", option_to_yojson refresh_id_to_yojson x.refresh_id);
      ( "EventDataStoreOwnerAccountId",
        option_to_yojson account_id_to_yojson x.event_data_store_owner_account_id );
    ]

let deregister_organization_delegated_admin_response_to_yojson = unit_to_yojson

let deregister_organization_delegated_admin_request_to_yojson
    (x : deregister_organization_delegated_admin_request) =
  assoc_to_yojson
    [ ("DelegatedAdminAccountId", Some (account_id_to_yojson x.delegated_admin_account_id)) ]

let delete_trail_response_to_yojson = unit_to_yojson

let delete_trail_request_to_yojson (x : delete_trail_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let event_data_store_termination_protected_exception_to_yojson
    (x : event_data_store_termination_protected_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_event_data_store_response_to_yojson = unit_to_yojson

let delete_event_data_store_request_to_yojson (x : delete_event_data_store_request) =
  assoc_to_yojson [ ("EventDataStore", Some (event_data_store_arn_to_yojson x.event_data_store)) ]

let delete_dashboard_response_to_yojson = unit_to_yojson

let delete_dashboard_request_to_yojson (x : delete_dashboard_request) =
  assoc_to_yojson [ ("DashboardId", Some (dashboard_arn_to_yojson x.dashboard_id)) ]

let delete_channel_response_to_yojson = unit_to_yojson

let delete_channel_request_to_yojson (x : delete_channel_request) =
  assoc_to_yojson [ ("Channel", Some (channel_arn_to_yojson x.channel)) ]

let trail_already_exists_exception_to_yojson (x : trail_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let maximum_number_of_trails_exceeded_exception_to_yojson
    (x : maximum_number_of_trails_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_trail_response_to_yojson (x : create_trail_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("S3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("SnsTopicName", option_to_yojson string__to_yojson x.sns_topic_name);
      ("SnsTopicARN", option_to_yojson string__to_yojson x.sns_topic_ar_n);
      ( "IncludeGlobalServiceEvents",
        option_to_yojson boolean__to_yojson x.include_global_service_events );
      ("IsMultiRegionTrail", option_to_yojson boolean__to_yojson x.is_multi_region_trail);
      ("TrailARN", option_to_yojson string__to_yojson x.trail_ar_n);
      ("LogFileValidationEnabled", option_to_yojson boolean__to_yojson x.log_file_validation_enabled);
      ( "CloudWatchLogsLogGroupArn",
        option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn );
      ("CloudWatchLogsRoleArn", option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("IsOrganizationTrail", option_to_yojson boolean__to_yojson x.is_organization_trail);
    ]

let create_trail_request_to_yojson (x : create_trail_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("S3BucketName", Some (string__to_yojson x.s3_bucket_name));
      ("S3KeyPrefix", option_to_yojson string__to_yojson x.s3_key_prefix);
      ("SnsTopicName", option_to_yojson string__to_yojson x.sns_topic_name);
      ( "IncludeGlobalServiceEvents",
        option_to_yojson boolean__to_yojson x.include_global_service_events );
      ("IsMultiRegionTrail", option_to_yojson boolean__to_yojson x.is_multi_region_trail);
      ("EnableLogFileValidation", option_to_yojson boolean__to_yojson x.enable_log_file_validation);
      ( "CloudWatchLogsLogGroupArn",
        option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn );
      ("CloudWatchLogsRoleArn", option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn);
      ("KmsKeyId", option_to_yojson string__to_yojson x.kms_key_id);
      ("IsOrganizationTrail", option_to_yojson boolean__to_yojson x.is_organization_trail);
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
    ]

let create_event_data_store_response_to_yojson (x : create_event_data_store_response) =
  assoc_to_yojson
    [
      ("EventDataStoreArn", option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn);
      ("Name", option_to_yojson event_data_store_name_to_yojson x.name);
      ("Status", option_to_yojson event_data_store_status_to_yojson x.status);
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
      ("CreatedTimestamp", option_to_yojson date_to_yojson x.created_timestamp);
      ("UpdatedTimestamp", option_to_yojson date_to_yojson x.updated_timestamp);
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let create_event_data_store_request_to_yojson (x : create_event_data_store_request) =
  assoc_to_yojson
    [
      ("Name", Some (event_data_store_name_to_yojson x.name));
      ( "AdvancedEventSelectors",
        option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors );
      ("MultiRegionEnabled", option_to_yojson boolean__to_yojson x.multi_region_enabled);
      ("OrganizationEnabled", option_to_yojson boolean__to_yojson x.organization_enabled);
      ("RetentionPeriod", option_to_yojson retention_period_to_yojson x.retention_period);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
      ("KmsKeyId", option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id);
      ("StartIngestion", option_to_yojson boolean__to_yojson x.start_ingestion);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let create_dashboard_response_to_yojson (x : create_dashboard_response) =
  assoc_to_yojson
    [
      ("DashboardArn", option_to_yojson dashboard_arn_to_yojson x.dashboard_arn);
      ("Name", option_to_yojson dashboard_name_to_yojson x.name);
      ("Type", option_to_yojson dashboard_type_to_yojson x.type_);
      ("Widgets", option_to_yojson widget_list_to_yojson x.widgets);
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
      ("RefreshSchedule", option_to_yojson refresh_schedule_to_yojson x.refresh_schedule);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
    ]

let create_dashboard_request_to_yojson (x : create_dashboard_request) =
  assoc_to_yojson
    [
      ("Name", Some (dashboard_name_to_yojson x.name));
      ("RefreshSchedule", option_to_yojson refresh_schedule_to_yojson x.refresh_schedule);
      ("TagsList", option_to_yojson tags_list_to_yojson x.tags_list);
      ( "TerminationProtectionEnabled",
        option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled
      );
      ("Widgets", option_to_yojson request_widget_list_to_yojson x.widgets);
    ]

let invalid_source_exception_to_yojson (x : invalid_source_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_channel_response_to_yojson (x : create_channel_response) =
  assoc_to_yojson
    [
      ("ChannelArn", option_to_yojson channel_arn_to_yojson x.channel_arn);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
      ("Source", option_to_yojson source_to_yojson x.source);
      ("Destinations", option_to_yojson destinations_to_yojson x.destinations);
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]

let create_channel_request_to_yojson (x : create_channel_request) =
  assoc_to_yojson
    [
      ("Name", Some (channel_name_to_yojson x.name));
      ("Source", Some (source_to_yojson x.source));
      ("Destinations", Some (destinations_to_yojson x.destinations));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
    ]
