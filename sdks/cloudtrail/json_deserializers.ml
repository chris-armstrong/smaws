open Smaws_Lib.Json.DeserializeHelpers
open Types

let query_alias_of_yojson = string_of_yojson
let query_statement_of_yojson = string_of_yojson
let query_parameter_of_yojson = string_of_yojson
let query_parameters_of_yojson tree path = list_of_yojson query_parameter_of_yojson tree path
let view_properties_value_of_yojson = string_of_yojson
let view_properties_key_of_yojson = string_of_yojson

let view_properties_map_of_yojson tree path =
  map_of_yojson view_properties_key_of_yojson view_properties_value_of_yojson tree path

let widget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     view_properties =
       option_of_yojson (value_for_key view_properties_map_of_yojson "ViewProperties") _list path;
     query_parameters =
       option_of_yojson (value_for_key query_parameters_of_yojson "QueryParameters") _list path;
     query_statement =
       option_of_yojson (value_for_key query_statement_of_yojson "QueryStatement") _list path;
     query_alias = option_of_yojson (value_for_key query_alias_of_yojson "QueryAlias") _list path;
   }
    : widget)

let widget_list_of_yojson tree path = list_of_yojson widget_of_yojson tree path
let string__of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let update_trail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_organization_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsOrganizationTrail") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsRoleArn") _list path;
     cloud_watch_logs_log_group_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsLogGroupArn") _list path;
     log_file_validation_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "LogFileValidationEnabled") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
     is_multi_region_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiRegionTrail") _list path;
     include_global_service_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeGlobalServiceEvents") _list path;
     sns_topic_ar_n = option_of_yojson (value_for_key string__of_yojson "SnsTopicARN") _list path;
     sns_topic_name = option_of_yojson (value_for_key string__of_yojson "SnsTopicName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "S3KeyPrefix") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : update_trail_response)

let update_trail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_organization_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsOrganizationTrail") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsRoleArn") _list path;
     cloud_watch_logs_log_group_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsLogGroupArn") _list path;
     enable_log_file_validation =
       option_of_yojson (value_for_key boolean__of_yojson "EnableLogFileValidation") _list path;
     is_multi_region_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiRegionTrail") _list path;
     include_global_service_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeGlobalServiceEvents") _list path;
     sns_topic_name = option_of_yojson (value_for_key string__of_yojson "SnsTopicName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "S3KeyPrefix") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : update_trail_request)

let error_message_of_yojson = string_of_yojson

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_operation_exception)

let trail_not_provided_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : trail_not_provided_exception)

let trail_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : trail_not_found_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let s3_bucket_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : s3_bucket_does_not_exist_exception)

let organizations_not_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : organizations_not_in_use_exception)

let organization_not_in_all_features_mode_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : organization_not_in_all_features_mode_exception)

let operation_not_permitted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : operation_not_permitted_exception)

let not_organization_master_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_organization_master_account_exception)

let no_management_account_slr_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : no_management_account_slr_exists_exception)

let kms_key_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : kms_key_not_found_exception)

let kms_key_disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : kms_key_disabled_exception)

let kms_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : kms_exception)

let invalid_trail_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_trail_name_exception)

let invalid_sns_topic_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_sns_topic_name_exception)

let invalid_s3_prefix_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_s3_prefix_exception)

let invalid_s3_bucket_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_s3_bucket_name_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_exception)

let invalid_parameter_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_combination_exception)

let invalid_kms_key_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_kms_key_id_exception)

let invalid_home_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_home_region_exception)

let invalid_event_selectors_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_event_selectors_exception)

let invalid_cloud_watch_logs_role_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_cloud_watch_logs_role_arn_exception)

let invalid_cloud_watch_logs_log_group_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_cloud_watch_logs_log_group_arn_exception)

let insufficient_sns_topic_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_sns_topic_policy_exception)

let insufficient_s3_bucket_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_s3_bucket_policy_exception)

let insufficient_encryption_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_encryption_policy_exception)

let insufficient_dependency_service_access_permission_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_dependency_service_access_permission_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let cloud_watch_logs_delivery_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_watch_logs_delivery_unavailable_exception)

let cloud_trail_invalid_client_token_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_trail_invalid_client_token_id_exception)

let cloud_trail_arn_invalid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_trail_arn_invalid_exception)

let cloud_trail_access_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cloud_trail_access_not_enabled_exception)

let event_data_store_arn_of_yojson = string_of_yojson
let event_data_store_name_of_yojson = string_of_yojson

let event_data_store_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "STOPPED_INGESTION" -> STOPPED_INGESTION
    | `String "STOPPING_INGESTION" -> STOPPING_INGESTION
    | `String "STARTING_INGESTION" -> STARTING_INGESTION
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "ENABLED" -> ENABLED
    | `String "CREATED" -> CREATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EventDataStoreStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EventDataStoreStatus")
     : event_data_store_status)
    : event_data_store_status)

let selector_name_of_yojson = string_of_yojson
let selector_field_of_yojson = string_of_yojson
let operator_value_of_yojson = string_of_yojson
let operator_of_yojson tree path = list_of_yojson operator_value_of_yojson tree path

let advanced_field_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_ends_with = option_of_yojson (value_for_key operator_of_yojson "NotEndsWith") _list path;
     not_starts_with =
       option_of_yojson (value_for_key operator_of_yojson "NotStartsWith") _list path;
     not_equals = option_of_yojson (value_for_key operator_of_yojson "NotEquals") _list path;
     ends_with = option_of_yojson (value_for_key operator_of_yojson "EndsWith") _list path;
     starts_with = option_of_yojson (value_for_key operator_of_yojson "StartsWith") _list path;
     equals = option_of_yojson (value_for_key operator_of_yojson "Equals") _list path;
     field = value_for_key selector_field_of_yojson "Field" _list path;
   }
    : advanced_field_selector)

let advanced_field_selectors_of_yojson tree path =
  list_of_yojson advanced_field_selector_of_yojson tree path

let advanced_event_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_selectors = value_for_key advanced_field_selectors_of_yojson "FieldSelectors" _list path;
     name = option_of_yojson (value_for_key selector_name_of_yojson "Name") _list path;
   }
    : advanced_event_selector)

let advanced_event_selectors_of_yojson tree path =
  list_of_yojson advanced_event_selector_of_yojson tree path

let retention_period_of_yojson = int_of_yojson
let termination_protection_enabled_of_yojson = bool_of_yojson
let date_of_yojson = timestamp_epoch_seconds_of_yojson
let event_data_store_kms_key_id_of_yojson = string_of_yojson

let billing_mode_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FIXED_RETENTION_PRICING" -> FIXED_RETENTION_PRICING
    | `String "EXTENDABLE_RETENTION_PRICING" -> EXTENDABLE_RETENTION_PRICING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMode")
     : billing_mode)
    : billing_mode)

let federation_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FederationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FederationStatus")
     : federation_status)
    : federation_status)

let federation_role_arn_of_yojson = string_of_yojson

let update_event_data_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federation_role_arn =
       option_of_yojson (value_for_key federation_role_arn_of_yojson "FederationRoleArn") _list path;
     federation_status =
       option_of_yojson (value_for_key federation_status_of_yojson "FederationStatus") _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     status = option_of_yojson (value_for_key event_data_store_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : update_event_data_store_response)

let update_event_data_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path;
   }
    : update_event_data_store_request)

let invalid_insight_selectors_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_insight_selectors_exception)

let inactive_event_data_store_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : inactive_event_data_store_exception)

let event_data_store_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_not_found_exception)

let event_data_store_has_ongoing_import_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_has_ongoing_import_exception)

let event_data_store_arn_invalid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_arn_invalid_exception)

let event_data_store_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_already_exists_exception)

let dashboard_arn_of_yojson = string_of_yojson
let dashboard_name_of_yojson = string_of_yojson

let dashboard_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String "MANAGED" -> MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DashboardType" value)
    | _ -> raise (deserialize_wrong_type_error path "DashboardType")
     : dashboard_type)
    : dashboard_type)

let refresh_schedule_frequency_unit_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DAYS" -> DAYS
    | `String "HOURS" -> HOURS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RefreshScheduleFrequencyUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "RefreshScheduleFrequencyUnit")
     : refresh_schedule_frequency_unit)
    : refresh_schedule_frequency_unit)

let refresh_schedule_frequency_value_of_yojson = int_of_yojson

let refresh_schedule_frequency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key refresh_schedule_frequency_value_of_yojson "Value")
         _list path;
     unit_ =
       option_of_yojson (value_for_key refresh_schedule_frequency_unit_of_yojson "Unit") _list path;
   }
    : refresh_schedule_frequency)

let refresh_schedule_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RefreshScheduleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RefreshScheduleStatus")
     : refresh_schedule_status)
    : refresh_schedule_status)

let time_of_day_of_yojson = string_of_yojson

let refresh_schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_of_day = option_of_yojson (value_for_key time_of_day_of_yojson "TimeOfDay") _list path;
     status = option_of_yojson (value_for_key refresh_schedule_status_of_yojson "Status") _list path;
     frequency =
       option_of_yojson (value_for_key refresh_schedule_frequency_of_yojson "Frequency") _list path;
   }
    : refresh_schedule)

let update_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     refresh_schedule =
       option_of_yojson (value_for_key refresh_schedule_of_yojson "RefreshSchedule") _list path;
     widgets = option_of_yojson (value_for_key widget_list_of_yojson "Widgets") _list path;
     type_ = option_of_yojson (value_for_key dashboard_type_of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key dashboard_name_of_yojson "Name") _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "DashboardArn") _list path;
   }
    : update_dashboard_response)

let request_widget_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     view_properties = value_for_key view_properties_map_of_yojson "ViewProperties" _list path;
     query_parameters =
       option_of_yojson (value_for_key query_parameters_of_yojson "QueryParameters") _list path;
     query_statement = value_for_key query_statement_of_yojson "QueryStatement" _list path;
   }
    : request_widget)

let request_widget_list_of_yojson tree path = list_of_yojson request_widget_of_yojson tree path

let update_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     refresh_schedule =
       option_of_yojson (value_for_key refresh_schedule_of_yojson "RefreshSchedule") _list path;
     widgets = option_of_yojson (value_for_key request_widget_list_of_yojson "Widgets") _list path;
     dashboard_id = value_for_key dashboard_arn_of_yojson "DashboardId" _list path;
   }
    : update_dashboard_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_query_statement_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_query_statement_exception)

let channel_arn_of_yojson = string_of_yojson
let channel_name_of_yojson = string_of_yojson
let source_of_yojson = string_of_yojson

let destination_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AWS_SERVICE" -> AWS_SERVICE
    | `String "EVENT_DATA_STORE" -> EVENT_DATA_STORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationType")
     : destination_type)
    : destination_type)

let location_of_yojson = string_of_yojson

let destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location = value_for_key location_of_yojson "Location" _list path;
     type_ = value_for_key destination_type_of_yojson "Type" _list path;
   }
    : destination)

let destinations_of_yojson tree path = list_of_yojson destination_of_yojson tree path

let update_channel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destinations =
       option_of_yojson (value_for_key destinations_of_yojson "Destinations") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "Source") _list path;
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     channel_arn = option_of_yojson (value_for_key channel_arn_of_yojson "ChannelArn") _list path;
   }
    : update_channel_response)

let update_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     destinations =
       option_of_yojson (value_for_key destinations_of_yojson "Destinations") _list path;
     channel = value_for_key channel_arn_of_yojson "Channel" _list path;
   }
    : update_channel_request)

let invalid_event_data_store_category_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_event_data_store_category_exception)

let channel_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : channel_not_found_exception)

let channel_arn_invalid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : channel_arn_invalid_exception)

let channel_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : channel_already_exists_exception)

let uui_d_of_yojson = string_of_yojson

let type__of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "RequestContext" -> RequestContext
    | `String "TagContext" -> TagContext
    | `String value -> raise (deserialize_unknown_enum_value_error path "Type" value)
    | _ -> raise (deserialize_wrong_type_error path "Type")
     : type_)
    : type_)

let trail_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     home_region = option_of_yojson (value_for_key string__of_yojson "HomeRegion") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
   }
    : trail_info)

let trails_of_yojson tree path = list_of_yojson trail_info_of_yojson tree path
let trail_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let trail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_organization_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsOrganizationTrail") _list path;
     has_insight_selectors =
       option_of_yojson (value_for_key boolean__of_yojson "HasInsightSelectors") _list path;
     has_custom_event_selectors =
       option_of_yojson (value_for_key boolean__of_yojson "HasCustomEventSelectors") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsRoleArn") _list path;
     cloud_watch_logs_log_group_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsLogGroupArn") _list path;
     log_file_validation_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "LogFileValidationEnabled") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
     home_region = option_of_yojson (value_for_key string__of_yojson "HomeRegion") _list path;
     is_multi_region_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiRegionTrail") _list path;
     include_global_service_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeGlobalServiceEvents") _list path;
     sns_topic_ar_n = option_of_yojson (value_for_key string__of_yojson "SnsTopicARN") _list path;
     sns_topic_name = option_of_yojson (value_for_key string__of_yojson "SnsTopicName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "S3KeyPrefix") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : trail)

let trail_list_of_yojson tree path = list_of_yojson trail_of_yojson tree path

let trail_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : trail_already_exists_exception)

let timestamps_of_yojson tree path = list_of_yojson date_of_yojson tree path
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tags_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tags_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : tags_limit_exceeded_exception)

let stop_logging_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_logging_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : stop_logging_request)

let s3_import_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_access_role_arn = value_for_key string__of_yojson "S3BucketAccessRoleArn" _list path;
     s3_bucket_region = value_for_key string__of_yojson "S3BucketRegion" _list path;
     s3_location_uri = value_for_key string__of_yojson "S3LocationUri" _list path;
   }
    : s3_import_source)

let import_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3 = value_for_key s3_import_source_of_yojson "S3" _list path } : import_source)

let import_destinations_of_yojson tree path =
  list_of_yojson event_data_store_arn_of_yojson tree path

let import_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "STOPPED" -> STOPPED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "INITIALIZING" -> INITIALIZING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")
     : import_status)
    : import_status)

let long_of_yojson = long_of_yojson

let import_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_entries = option_of_yojson (value_for_key long_of_yojson "FailedEntries") _list path;
     events_completed = option_of_yojson (value_for_key long_of_yojson "EventsCompleted") _list path;
     files_completed = option_of_yojson (value_for_key long_of_yojson "FilesCompleted") _list path;
     prefixes_completed =
       option_of_yojson (value_for_key long_of_yojson "PrefixesCompleted") _list path;
     prefixes_found = option_of_yojson (value_for_key long_of_yojson "PrefixesFound") _list path;
   }
    : import_statistics)

let stop_import_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_statistics =
       option_of_yojson (value_for_key import_statistics_of_yojson "ImportStatistics") _list path;
     end_event_time = option_of_yojson (value_for_key date_of_yojson "EndEventTime") _list path;
     start_event_time = option_of_yojson (value_for_key date_of_yojson "StartEventTime") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     destinations =
       option_of_yojson (value_for_key import_destinations_of_yojson "Destinations") _list path;
     import_source =
       option_of_yojson (value_for_key import_source_of_yojson "ImportSource") _list path;
     import_id = option_of_yojson (value_for_key uui_d_of_yojson "ImportId") _list path;
   }
    : stop_import_response)

let stop_import_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ import_id = value_for_key uui_d_of_yojson "ImportId" _list path } : stop_import_request)

let import_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : import_not_found_exception)

let stop_event_data_store_ingestion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_event_data_store_ingestion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : stop_event_data_store_ingestion_request)

let invalid_event_data_store_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_event_data_store_status_exception)

let account_id_of_yojson = string_of_yojson

let start_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     query_id = option_of_yojson (value_for_key uui_d_of_yojson "QueryId") _list path;
   }
    : start_query_response)

let delivery_s3_uri_of_yojson = string_of_yojson

let start_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     query_parameters =
       option_of_yojson (value_for_key query_parameters_of_yojson "QueryParameters") _list path;
     query_alias = option_of_yojson (value_for_key query_alias_of_yojson "QueryAlias") _list path;
     delivery_s3_uri =
       option_of_yojson (value_for_key delivery_s3_uri_of_yojson "DeliveryS3Uri") _list path;
     query_statement =
       option_of_yojson (value_for_key query_statement_of_yojson "QueryStatement") _list path;
   }
    : start_query_request)

let max_concurrent_queries_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : max_concurrent_queries_exception)

let start_logging_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_logging_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : start_logging_request)

let start_import_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     end_event_time = option_of_yojson (value_for_key date_of_yojson "EndEventTime") _list path;
     start_event_time = option_of_yojson (value_for_key date_of_yojson "StartEventTime") _list path;
     import_source =
       option_of_yojson (value_for_key import_source_of_yojson "ImportSource") _list path;
     destinations =
       option_of_yojson (value_for_key import_destinations_of_yojson "Destinations") _list path;
     import_id = option_of_yojson (value_for_key uui_d_of_yojson "ImportId") _list path;
   }
    : start_import_response)

let start_import_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_id = option_of_yojson (value_for_key uui_d_of_yojson "ImportId") _list path;
     end_event_time = option_of_yojson (value_for_key date_of_yojson "EndEventTime") _list path;
     start_event_time = option_of_yojson (value_for_key date_of_yojson "StartEventTime") _list path;
     import_source =
       option_of_yojson (value_for_key import_source_of_yojson "ImportSource") _list path;
     destinations =
       option_of_yojson (value_for_key import_destinations_of_yojson "Destinations") _list path;
   }
    : start_import_request)

let invalid_import_source_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_import_source_exception)

let account_has_ongoing_import_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : account_has_ongoing_import_exception)

let start_event_data_store_ingestion_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_event_data_store_ingestion_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : start_event_data_store_ingestion_request)

let refresh_id_of_yojson = string_of_yojson

let start_dashboard_refresh_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ refresh_id = option_of_yojson (value_for_key refresh_id_of_yojson "RefreshId") _list path }
    : start_dashboard_refresh_response)

let query_parameter_value_of_yojson = string_of_yojson
let query_parameter_key_of_yojson = string_of_yojson

let query_parameter_values_of_yojson tree path =
  map_of_yojson query_parameter_key_of_yojson query_parameter_value_of_yojson tree path

let start_dashboard_refresh_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_parameter_values =
       option_of_yojson
         (value_for_key query_parameter_values_of_yojson "QueryParameterValues")
         _list path;
     dashboard_id = value_for_key dashboard_arn_of_yojson "DashboardId" _list path;
   }
    : start_dashboard_refresh_request)

let source_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     apply_to_all_regions =
       option_of_yojson (value_for_key boolean__of_yojson "ApplyToAllRegions") _list path;
   }
    : source_config)

let sample_query_name_of_yojson = string_of_yojson
let sample_query_description_of_yojson = string_of_yojson
let sample_query_sq_l_of_yojson = string_of_yojson
let sample_query_relevance_of_yojson = float_of_yojson

let search_sample_queries_search_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relevance =
       option_of_yojson (value_for_key sample_query_relevance_of_yojson "Relevance") _list path;
     sq_l = option_of_yojson (value_for_key sample_query_sq_l_of_yojson "SQL") _list path;
     description =
       option_of_yojson (value_for_key sample_query_description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key sample_query_name_of_yojson "Name") _list path;
   }
    : search_sample_queries_search_result)

let search_sample_queries_search_results_of_yojson tree path =
  list_of_yojson search_sample_queries_search_result_of_yojson tree path

let search_sample_queries_search_phrase_of_yojson = string_of_yojson
let pagination_token_of_yojson = string_of_yojson

let search_sample_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     search_results =
       option_of_yojson
         (value_for_key search_sample_queries_search_results_of_yojson "SearchResults")
         _list path;
   }
    : search_sample_queries_response)

let search_sample_queries_max_results_of_yojson = int_of_yojson

let search_sample_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key search_sample_queries_max_results_of_yojson "MaxResults")
         _list path;
     search_phrase =
       value_for_key search_sample_queries_search_phrase_of_yojson "SearchPhrase" _list path;
   }
    : search_sample_queries_request)

let restore_event_data_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     status = option_of_yojson (value_for_key event_data_store_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : restore_event_data_store_response)

let restore_event_data_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : restore_event_data_store_request)

let event_data_store_max_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_max_limit_exceeded_exception)

let resource_type_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_type_not_supported_exception)

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     resource_id = option_of_yojson (value_for_key string__of_yojson "ResourceId") _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let resource_policy_not_valid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_policy_not_valid_exception)

let resource_policy_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_policy_not_found_exception)

let resource_policy_of_yojson = string_of_yojson

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name = option_of_yojson (value_for_key string__of_yojson "ResourceName") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
   }
    : resource)

let resource_list_of_yojson tree path = list_of_yojson resource_of_yojson tree path
let resource_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let resource_arn_not_valid_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_arn_not_valid_exception)

let remove_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_list = value_for_key tags_list_of_yojson "TagsList" _list path;
     resource_id = value_for_key string__of_yojson "ResourceId" _list path;
   }
    : remove_tags_request)

let invalid_tag_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_tag_parameter_exception)

let register_organization_delegated_admin_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let register_organization_delegated_admin_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ member_account_id = value_for_key account_id_of_yojson "MemberAccountId" _list path }
    : register_organization_delegated_admin_request)

let not_organization_management_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_organization_management_account_exception)

let insufficient_iam_access_permission_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insufficient_iam_access_permission_exception)

let delegated_admin_account_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : delegated_admin_account_limit_exceeded_exception)

let cannot_delegate_management_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : cannot_delegate_management_account_exception)

let account_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : account_registered_exception)

let account_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : account_not_found_exception)

let read_write_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "All" -> All
    | `String "WriteOnly" -> WriteOnly
    | `String "ReadOnly" -> ReadOnly
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReadWriteType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReadWriteType")
     : read_write_type)
    : read_write_type)

let query_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "FINISHED" -> FINISHED
    | `String "RUNNING" -> RUNNING
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryStatus")
     : query_status)
    : query_status)

let integer_of_yojson = int_of_yojson

let query_statistics_for_describe_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     execution_time_in_millis =
       option_of_yojson (value_for_key integer_of_yojson "ExecutionTimeInMillis") _list path;
     bytes_scanned = option_of_yojson (value_for_key long_of_yojson "BytesScanned") _list path;
     events_scanned = option_of_yojson (value_for_key long_of_yojson "EventsScanned") _list path;
     events_matched = option_of_yojson (value_for_key long_of_yojson "EventsMatched") _list path;
   }
    : query_statistics_for_describe_query)

let query_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes_scanned = option_of_yojson (value_for_key long_of_yojson "BytesScanned") _list path;
     total_results_count =
       option_of_yojson (value_for_key integer_of_yojson "TotalResultsCount") _list path;
     results_count = option_of_yojson (value_for_key integer_of_yojson "ResultsCount") _list path;
   }
    : query_statistics)

let query_result_value_of_yojson = string_of_yojson
let query_result_key_of_yojson = string_of_yojson

let query_result_column_of_yojson tree path =
  map_of_yojson query_result_key_of_yojson query_result_value_of_yojson tree path

let query_result_row_of_yojson tree path = list_of_yojson query_result_column_of_yojson tree path
let query_result_rows_of_yojson tree path = list_of_yojson query_result_row_of_yojson tree path

let query_id_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : query_id_not_found_exception)

let query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     query_status = option_of_yojson (value_for_key query_status_of_yojson "QueryStatus") _list path;
     query_id = option_of_yojson (value_for_key uui_d_of_yojson "QueryId") _list path;
   }
    : query)

let queries_of_yojson tree path = list_of_yojson query_of_yojson tree path

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delegated_admin_resource_policy =
       option_of_yojson
         (value_for_key resource_policy_of_yojson "DelegatedAdminResourcePolicy")
         _list path;
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy = value_for_key resource_policy_of_yojson "ResourcePolicy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_request)

let insight_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ApiErrorRateInsight" -> ApiErrorRateInsight
    | `String "ApiCallRateInsight" -> ApiCallRateInsight
    | `String value -> raise (deserialize_unknown_enum_value_error path "InsightType" value)
    | _ -> raise (deserialize_wrong_type_error path "InsightType")
     : insight_type)
    : insight_type)

let insight_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insight_type = option_of_yojson (value_for_key insight_type_of_yojson "InsightType") _list path;
   }
    : insight_selector)

let insight_selectors_of_yojson tree path = list_of_yojson insight_selector_of_yojson tree path

let put_insight_selectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights_destination =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "InsightsDestination")
         _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
     insight_selectors =
       option_of_yojson (value_for_key insight_selectors_of_yojson "InsightSelectors") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
   }
    : put_insight_selectors_response)

let put_insight_selectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights_destination =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "InsightsDestination")
         _list path;
     event_data_store =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "EventDataStore") _list path;
     insight_selectors = value_for_key insight_selectors_of_yojson "InsightSelectors" _list path;
     trail_name = option_of_yojson (value_for_key string__of_yojson "TrailName") _list path;
   }
    : put_insight_selectors_request)

let data_resource_values_of_yojson tree path = list_of_yojson string__of_yojson tree path

let data_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key data_resource_values_of_yojson "Values") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
   }
    : data_resource)

let data_resources_of_yojson tree path = list_of_yojson data_resource_of_yojson tree path

let exclude_management_event_sources_of_yojson tree path =
  list_of_yojson string__of_yojson tree path

let event_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_management_event_sources =
       option_of_yojson
         (value_for_key exclude_management_event_sources_of_yojson "ExcludeManagementEventSources")
         _list path;
     data_resources =
       option_of_yojson (value_for_key data_resources_of_yojson "DataResources") _list path;
     include_management_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeManagementEvents") _list path;
     read_write_type =
       option_of_yojson (value_for_key read_write_type_of_yojson "ReadWriteType") _list path;
   }
    : event_selector)

let event_selectors_of_yojson tree path = list_of_yojson event_selector_of_yojson tree path

let put_event_selectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     event_selectors =
       option_of_yojson (value_for_key event_selectors_of_yojson "EventSelectors") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
   }
    : put_event_selectors_response)

let put_event_selectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     event_selectors =
       option_of_yojson (value_for_key event_selectors_of_yojson "EventSelectors") _list path;
     trail_name = value_for_key string__of_yojson "TrailName" _list path;
   }
    : put_event_selectors_request)

let max_event_size_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "Large" -> Large
    | `String "Standard" -> Standard
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaxEventSize" value)
    | _ -> raise (deserialize_wrong_type_error path "MaxEventSize")
     : max_event_size)
    : max_event_size)

let operator_target_list_member_of_yojson = string_of_yojson

let operator_target_list_of_yojson tree path =
  list_of_yojson operator_target_list_member_of_yojson tree path

let context_key_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     equals = value_for_key operator_target_list_of_yojson "Equals" _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
   }
    : context_key_selector)

let context_key_selectors_of_yojson tree path =
  list_of_yojson context_key_selector_of_yojson tree path

let put_event_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_key_selectors =
       option_of_yojson
         (value_for_key context_key_selectors_of_yojson "ContextKeySelectors")
         _list path;
     max_event_size =
       option_of_yojson (value_for_key max_event_size_of_yojson "MaxEventSize") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : put_event_configuration_response)

let put_event_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_key_selectors =
       value_for_key context_key_selectors_of_yojson "ContextKeySelectors" _list path;
     max_event_size = value_for_key max_event_size_of_yojson "MaxEventSize" _list path;
     event_data_store =
       option_of_yojson (value_for_key string__of_yojson "EventDataStore") _list path;
   }
    : put_event_configuration_request)

let byte_buffer_of_yojson = blob_of_yojson

let public_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fingerprint = option_of_yojson (value_for_key string__of_yojson "Fingerprint") _list path;
     validity_end_time =
       option_of_yojson (value_for_key date_of_yojson "ValidityEndTime") _list path;
     validity_start_time =
       option_of_yojson (value_for_key date_of_yojson "ValidityStartTime") _list path;
     value = option_of_yojson (value_for_key byte_buffer_of_yojson "Value") _list path;
   }
    : public_key)

let public_key_list_of_yojson tree path = list_of_yojson public_key_of_yojson tree path
let prompt_of_yojson = string_of_yojson
let partition_key_type_of_yojson = string_of_yojson
let partition_key_name_of_yojson = string_of_yojson

let partition_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key partition_key_type_of_yojson "Type" _list path;
     name = value_for_key partition_key_name_of_yojson "Name" _list path;
   }
    : partition_key)

let partition_key_list_of_yojson tree path = list_of_yojson partition_key_of_yojson tree path
let next_token_of_yojson = string_of_yojson

let maximum_number_of_trails_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : maximum_number_of_trails_exceeded_exception)

let max_results_of_yojson = int_of_yojson
let max_query_results_of_yojson = int_of_yojson

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_trail_event =
       option_of_yojson (value_for_key string__of_yojson "CloudTrailEvent") _list path;
     resources = option_of_yojson (value_for_key resource_list_of_yojson "Resources") _list path;
     username = option_of_yojson (value_for_key string__of_yojson "Username") _list path;
     event_source = option_of_yojson (value_for_key string__of_yojson "EventSource") _list path;
     event_time = option_of_yojson (value_for_key date_of_yojson "EventTime") _list path;
     access_key_id = option_of_yojson (value_for_key string__of_yojson "AccessKeyId") _list path;
     read_only = option_of_yojson (value_for_key string__of_yojson "ReadOnly") _list path;
     event_name = option_of_yojson (value_for_key string__of_yojson "EventName") _list path;
     event_id = option_of_yojson (value_for_key string__of_yojson "EventId") _list path;
   }
    : event)

let events_list_of_yojson tree path = list_of_yojson event_of_yojson tree path

let lookup_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     events = option_of_yojson (value_for_key events_list_of_yojson "Events") _list path;
   }
    : lookup_events_response)

let lookup_attribute_key_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AccessKeyId" -> ACCESS_KEY_ID
    | `String "EventSource" -> EVENT_SOURCE
    | `String "ResourceName" -> RESOURCE_NAME
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "Username" -> USERNAME
    | `String "ReadOnly" -> READ_ONLY
    | `String "EventName" -> EVENT_NAME
    | `String "EventId" -> EVENT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "LookupAttributeKey" value)
    | _ -> raise (deserialize_wrong_type_error path "LookupAttributeKey")
     : lookup_attribute_key)
    : lookup_attribute_key)

let lookup_attribute_value_of_yojson = string_of_yojson

let lookup_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_value = value_for_key lookup_attribute_value_of_yojson "AttributeValue" _list path;
     attribute_key = value_for_key lookup_attribute_key_of_yojson "AttributeKey" _list path;
   }
    : lookup_attribute)

let lookup_attributes_list_of_yojson tree path = list_of_yojson lookup_attribute_of_yojson tree path

let event_category_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "insight" -> Insight
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "EventCategory")
     : event_category)
    : event_category)

let lookup_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     event_category =
       option_of_yojson (value_for_key event_category_of_yojson "EventCategory") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     lookup_attributes =
       option_of_yojson
         (value_for_key lookup_attributes_list_of_yojson "LookupAttributes")
         _list path;
   }
    : lookup_events_request)

let invalid_time_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_time_range_exception)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let invalid_max_results_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_max_results_exception)

let invalid_lookup_attributes_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_lookup_attributes_exception)

let invalid_event_category_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_event_category_exception)

let list_trails_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     trails = option_of_yojson (value_for_key trails_of_yojson "Trails") _list path;
   }
    : list_trails_response)

let list_trails_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path }
    : list_trails_request)

let list_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     resource_tag_list =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTagList") _list path;
   }
    : list_tags_response)

let list_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     resource_id_list = value_for_key resource_id_list_of_yojson "ResourceIdList" _list path;
   }
    : list_tags_request)

let invalid_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_token_exception)

let list_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     queries = option_of_yojson (value_for_key queries_of_yojson "Queries") _list path;
   }
    : list_queries_response)

let list_queries_max_results_count_of_yojson = int_of_yojson

let list_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_status = option_of_yojson (value_for_key query_status_of_yojson "QueryStatus") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_queries_max_results_count_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path;
   }
    : list_queries_request)

let invalid_query_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_query_status_exception)

let invalid_date_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_date_range_exception)

let list_public_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     public_key_list =
       option_of_yojson (value_for_key public_key_list_of_yojson "PublicKeyList") _list path;
   }
    : list_public_keys_response)

let list_public_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
   }
    : list_public_keys_request)

let event_source_of_yojson = string_of_yojson
let event_name_of_yojson = string_of_yojson
let error_code_of_yojson = string_of_yojson
let double_of_yojson = double_of_yojson
let insights_metric_values_of_yojson tree path = list_of_yojson double_of_yojson tree path
let insights_metric_next_token_of_yojson = string_of_yojson

let list_insights_metric_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key insights_metric_next_token_of_yojson "NextToken") _list path;
     values = option_of_yojson (value_for_key insights_metric_values_of_yojson "Values") _list path;
     timestamps = option_of_yojson (value_for_key timestamps_of_yojson "Timestamps") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     insight_type = option_of_yojson (value_for_key insight_type_of_yojson "InsightType") _list path;
     event_name = option_of_yojson (value_for_key event_name_of_yojson "EventName") _list path;
     event_source = option_of_yojson (value_for_key event_source_of_yojson "EventSource") _list path;
   }
    : list_insights_metric_data_response)

let insights_metric_period_of_yojson = int_of_yojson

let insights_metric_data_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NonZeroData" -> NON_ZERO_DATA
    | `String "FillWithZeros" -> FILL_WITH_ZEROS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InsightsMetricDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "InsightsMetricDataType")
     : insights_metric_data_type)
    : insights_metric_data_type)

let insights_metric_max_results_of_yojson = int_of_yojson

let list_insights_metric_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key insights_metric_next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key insights_metric_max_results_of_yojson "MaxResults")
         _list path;
     data_type =
       option_of_yojson (value_for_key insights_metric_data_type_of_yojson "DataType") _list path;
     period = option_of_yojson (value_for_key insights_metric_period_of_yojson "Period") _list path;
     end_time = option_of_yojson (value_for_key date_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_of_yojson "StartTime") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     insight_type = value_for_key insight_type_of_yojson "InsightType" _list path;
     event_name = value_for_key event_name_of_yojson "EventName" _list path;
     event_source = value_for_key event_source_of_yojson "EventSource" _list path;
   }
    : list_insights_metric_data_request)

let imports_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     destinations =
       option_of_yojson (value_for_key import_destinations_of_yojson "Destinations") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     import_id = option_of_yojson (value_for_key uui_d_of_yojson "ImportId") _list path;
   }
    : imports_list_item)

let imports_list_of_yojson tree path = list_of_yojson imports_list_item_of_yojson tree path

let list_imports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     imports = option_of_yojson (value_for_key imports_list_of_yojson "Imports") _list path;
   }
    : list_imports_response)

let list_imports_max_results_count_of_yojson = int_of_yojson

let list_imports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     destination =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "Destination") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_imports_max_results_count_of_yojson "MaxResults")
         _list path;
   }
    : list_imports_request)

let import_failure_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RETRY" -> RETRY
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportFailureStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportFailureStatus")
     : import_failure_status)
    : import_failure_status)

let import_failure_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_type = option_of_yojson (value_for_key string__of_yojson "ErrorType") _list path;
     status = option_of_yojson (value_for_key import_failure_status_of_yojson "Status") _list path;
     location = option_of_yojson (value_for_key string__of_yojson "Location") _list path;
   }
    : import_failure_list_item)

let import_failure_list_of_yojson tree path =
  list_of_yojson import_failure_list_item_of_yojson tree path

let list_import_failures_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     failures = option_of_yojson (value_for_key import_failure_list_of_yojson "Failures") _list path;
   }
    : list_import_failures_response)

let list_import_failures_max_results_count_of_yojson = int_of_yojson

let list_import_failures_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_import_failures_max_results_count_of_yojson "MaxResults")
         _list path;
     import_id = value_for_key uui_d_of_yojson "ImportId" _list path;
   }
    : list_import_failures_request)

let event_data_store_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     status = option_of_yojson (value_for_key event_data_store_status_of_yojson "Status") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : event_data_store)

let event_data_stores_of_yojson tree path = list_of_yojson event_data_store_of_yojson tree path

let list_event_data_stores_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     event_data_stores =
       option_of_yojson (value_for_key event_data_stores_of_yojson "EventDataStores") _list path;
   }
    : list_event_data_stores_response)

let list_event_data_stores_max_results_count_of_yojson = int_of_yojson

let list_event_data_stores_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_event_data_stores_max_results_count_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_event_data_stores_request)

let dashboard_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key dashboard_type_of_yojson "Type") _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "DashboardArn") _list path;
   }
    : dashboard_detail)

let dashboards_of_yojson tree path = list_of_yojson dashboard_detail_of_yojson tree path

let list_dashboards_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     dashboards = option_of_yojson (value_for_key dashboards_of_yojson "Dashboards") _list path;
   }
    : list_dashboards_response)

let list_dashboards_max_results_count_of_yojson = int_of_yojson

let list_dashboards_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_dashboards_max_results_count_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     type_ = option_of_yojson (value_for_key dashboard_type_of_yojson "Type") _list path;
     name_prefix = option_of_yojson (value_for_key dashboard_name_of_yojson "NamePrefix") _list path;
   }
    : list_dashboards_request)

let channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     channel_arn = option_of_yojson (value_for_key channel_arn_of_yojson "ChannelArn") _list path;
   }
    : channel)

let channels_of_yojson tree path = list_of_yojson channel_of_yojson tree path

let list_channels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     channels = option_of_yojson (value_for_key channels_of_yojson "Channels") _list path;
   }
    : list_channels_response)

let list_channels_max_results_count_of_yojson = int_of_yojson

let list_channels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_channels_max_results_count_of_yojson "MaxResults")
         _list path;
   }
    : list_channels_request)

let invalid_source_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_source_exception)

let insight_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : insight_not_enabled_exception)

let ingestion_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_ingestion_attempt_event_i_d =
       option_of_yojson (value_for_key uui_d_of_yojson "LatestIngestionAttemptEventID") _list path;
     latest_ingestion_attempt_time =
       option_of_yojson (value_for_key date_of_yojson "LatestIngestionAttemptTime") _list path;
     latest_ingestion_error_code =
       option_of_yojson
         (value_for_key error_message_of_yojson "LatestIngestionErrorCode")
         _list path;
     latest_ingestion_success_event_i_d =
       option_of_yojson (value_for_key uui_d_of_yojson "LatestIngestionSuccessEventID") _list path;
     latest_ingestion_success_time =
       option_of_yojson (value_for_key date_of_yojson "LatestIngestionSuccessTime") _list path;
   }
    : ingestion_status)

let inactive_query_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : inactive_query_exception)

let get_trail_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_logging_stopped =
       option_of_yojson (value_for_key string__of_yojson "TimeLoggingStopped") _list path;
     time_logging_started =
       option_of_yojson (value_for_key string__of_yojson "TimeLoggingStarted") _list path;
     latest_delivery_attempt_succeeded =
       option_of_yojson
         (value_for_key string__of_yojson "LatestDeliveryAttemptSucceeded")
         _list path;
     latest_notification_attempt_succeeded =
       option_of_yojson
         (value_for_key string__of_yojson "LatestNotificationAttemptSucceeded")
         _list path;
     latest_notification_attempt_time =
       option_of_yojson (value_for_key string__of_yojson "LatestNotificationAttemptTime") _list path;
     latest_delivery_attempt_time =
       option_of_yojson (value_for_key string__of_yojson "LatestDeliveryAttemptTime") _list path;
     latest_digest_delivery_error =
       option_of_yojson (value_for_key string__of_yojson "LatestDigestDeliveryError") _list path;
     latest_digest_delivery_time =
       option_of_yojson (value_for_key date_of_yojson "LatestDigestDeliveryTime") _list path;
     latest_cloud_watch_logs_delivery_time =
       option_of_yojson (value_for_key date_of_yojson "LatestCloudWatchLogsDeliveryTime") _list path;
     latest_cloud_watch_logs_delivery_error =
       option_of_yojson
         (value_for_key string__of_yojson "LatestCloudWatchLogsDeliveryError")
         _list path;
     stop_logging_time =
       option_of_yojson (value_for_key date_of_yojson "StopLoggingTime") _list path;
     start_logging_time =
       option_of_yojson (value_for_key date_of_yojson "StartLoggingTime") _list path;
     latest_notification_time =
       option_of_yojson (value_for_key date_of_yojson "LatestNotificationTime") _list path;
     latest_delivery_time =
       option_of_yojson (value_for_key date_of_yojson "LatestDeliveryTime") _list path;
     latest_notification_error =
       option_of_yojson (value_for_key string__of_yojson "LatestNotificationError") _list path;
     latest_delivery_error =
       option_of_yojson (value_for_key string__of_yojson "LatestDeliveryError") _list path;
     is_logging = option_of_yojson (value_for_key boolean__of_yojson "IsLogging") _list path;
   }
    : get_trail_status_response)

let get_trail_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : get_trail_status_request)

let get_trail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trail = option_of_yojson (value_for_key trail_of_yojson "Trail") _list path }
    : get_trail_response)

let get_trail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : get_trail_request)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delegated_admin_resource_policy =
       option_of_yojson
         (value_for_key resource_policy_of_yojson "DelegatedAdminResourcePolicy")
         _list path;
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "ResourcePolicy") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_resource_policy_request)

let get_query_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     query_result_rows =
       option_of_yojson (value_for_key query_result_rows_of_yojson "QueryResultRows") _list path;
     query_statistics =
       option_of_yojson (value_for_key query_statistics_of_yojson "QueryStatistics") _list path;
     query_status = option_of_yojson (value_for_key query_status_of_yojson "QueryStatus") _list path;
   }
    : get_query_results_response)

let get_query_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     max_query_results =
       option_of_yojson (value_for_key max_query_results_of_yojson "MaxQueryResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     query_id = value_for_key uui_d_of_yojson "QueryId" _list path;
     event_data_store =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "EventDataStore") _list path;
   }
    : get_query_results_request)

let get_insight_selectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insights_destination =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "InsightsDestination")
         _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
     insight_selectors =
       option_of_yojson (value_for_key insight_selectors_of_yojson "InsightSelectors") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
   }
    : get_insight_selectors_response)

let get_insight_selectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "EventDataStore") _list path;
     trail_name = option_of_yojson (value_for_key string__of_yojson "TrailName") _list path;
   }
    : get_insight_selectors_request)

let get_import_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_statistics =
       option_of_yojson (value_for_key import_statistics_of_yojson "ImportStatistics") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "ImportStatus") _list path;
     end_event_time = option_of_yojson (value_for_key date_of_yojson "EndEventTime") _list path;
     start_event_time = option_of_yojson (value_for_key date_of_yojson "StartEventTime") _list path;
     import_source =
       option_of_yojson (value_for_key import_source_of_yojson "ImportSource") _list path;
     destinations =
       option_of_yojson (value_for_key import_destinations_of_yojson "Destinations") _list path;
     import_id = option_of_yojson (value_for_key uui_d_of_yojson "ImportId") _list path;
   }
    : get_import_response)

let get_import_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ import_id = value_for_key uui_d_of_yojson "ImportId" _list path } : get_import_request)

let get_event_selectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     event_selectors =
       option_of_yojson (value_for_key event_selectors_of_yojson "EventSelectors") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
   }
    : get_event_selectors_response)

let get_event_selectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trail_name = value_for_key string__of_yojson "TrailName" _list path }
    : get_event_selectors_request)

let get_event_data_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partition_keys =
       option_of_yojson (value_for_key partition_key_list_of_yojson "PartitionKeys") _list path;
     federation_role_arn =
       option_of_yojson (value_for_key federation_role_arn_of_yojson "FederationRoleArn") _list path;
     federation_status =
       option_of_yojson (value_for_key federation_status_of_yojson "FederationStatus") _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     status = option_of_yojson (value_for_key event_data_store_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : get_event_data_store_response)

let get_event_data_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : get_event_data_store_request)

let get_event_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_key_selectors =
       option_of_yojson
         (value_for_key context_key_selectors_of_yojson "ContextKeySelectors")
         _list path;
     max_event_size =
       option_of_yojson (value_for_key max_event_size_of_yojson "MaxEventSize") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : get_event_configuration_response)

let get_event_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store =
       option_of_yojson (value_for_key string__of_yojson "EventDataStore") _list path;
   }
    : get_event_configuration_request)

let dashboard_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETING" -> DELETING
    | `String "UPDATED" -> UPDATED
    | `String "UPDATING" -> UPDATING
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DashboardStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DashboardStatus")
     : dashboard_status)
    : dashboard_status)

let get_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     last_refresh_failure_reason =
       option_of_yojson
         (value_for_key error_message_of_yojson "LastRefreshFailureReason")
         _list path;
     last_refresh_id =
       option_of_yojson (value_for_key refresh_id_of_yojson "LastRefreshId") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     refresh_schedule =
       option_of_yojson (value_for_key refresh_schedule_of_yojson "RefreshSchedule") _list path;
     widgets = option_of_yojson (value_for_key widget_list_of_yojson "Widgets") _list path;
     status = option_of_yojson (value_for_key dashboard_status_of_yojson "Status") _list path;
     type_ = option_of_yojson (value_for_key dashboard_type_of_yojson "Type") _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "DashboardArn") _list path;
   }
    : get_dashboard_response)

let get_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dashboard_id = value_for_key dashboard_arn_of_yojson "DashboardId" _list path }
    : get_dashboard_request)

let get_channel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingestion_status =
       option_of_yojson (value_for_key ingestion_status_of_yojson "IngestionStatus") _list path;
     destinations =
       option_of_yojson (value_for_key destinations_of_yojson "Destinations") _list path;
     source_config =
       option_of_yojson (value_for_key source_config_of_yojson "SourceConfig") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "Source") _list path;
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     channel_arn = option_of_yojson (value_for_key channel_arn_of_yojson "ChannelArn") _list path;
   }
    : get_channel_response)

let get_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ channel = value_for_key channel_arn_of_yojson "Channel" _list path } : get_channel_request)

let generate_response_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : generate_response_exception)

let generate_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     query_alias = option_of_yojson (value_for_key query_alias_of_yojson "QueryAlias") _list path;
     query_statement =
       option_of_yojson (value_for_key query_statement_of_yojson "QueryStatement") _list path;
   }
    : generate_query_response)

let event_data_store_list_of_yojson tree path =
  list_of_yojson event_data_store_arn_of_yojson tree path

let generate_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prompt = value_for_key prompt_of_yojson "Prompt" _list path;
     event_data_stores = value_for_key event_data_store_list_of_yojson "EventDataStores" _list path;
   }
    : generate_query_request)

let event_data_store_termination_protected_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_termination_protected_exception)

let event_data_store_federation_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : event_data_store_federation_enabled_exception)

let enable_federation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federation_role_arn =
       option_of_yojson (value_for_key federation_role_arn_of_yojson "FederationRoleArn") _list path;
     federation_status =
       option_of_yojson (value_for_key federation_status_of_yojson "FederationStatus") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : enable_federation_response)

let enable_federation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federation_role_arn =
       value_for_key federation_role_arn_of_yojson "FederationRoleArn" _list path;
     event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path;
   }
    : enable_federation_request)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let disable_federation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     federation_status =
       option_of_yojson (value_for_key federation_status_of_yojson "FederationStatus") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : disable_federation_response)

let disable_federation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : disable_federation_request)

let describe_trails_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trail_list = option_of_yojson (value_for_key trail_list_of_yojson "trailList") _list path }
    : describe_trails_response)

let describe_trails_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_shadow_trails =
       option_of_yojson (value_for_key boolean__of_yojson "includeShadowTrails") _list path;
     trail_name_list =
       option_of_yojson (value_for_key trail_name_list_of_yojson "trailNameList") _list path;
   }
    : describe_trails_request)

let delivery_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "CANCELLED" -> CANCELLED
    | `String "ACCESS_DENIED_SIGNING_FILE" -> ACCESS_DENIED_SIGNING_FILE
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "RESOURCE_NOT_FOUND" -> RESOURCE_NOT_FOUND
    | `String "PENDING" -> PENDING
    | `String "FAILED_SIGNING_FILE" -> FAILED_SIGNING_FILE
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStatus")
     : delivery_status)
    : delivery_status)

let describe_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     prompt = option_of_yojson (value_for_key prompt_of_yojson "Prompt") _list path;
     delivery_status =
       option_of_yojson (value_for_key delivery_status_of_yojson "DeliveryStatus") _list path;
     delivery_s3_uri =
       option_of_yojson (value_for_key delivery_s3_uri_of_yojson "DeliveryS3Uri") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     query_statistics =
       option_of_yojson
         (value_for_key query_statistics_for_describe_query_of_yojson "QueryStatistics")
         _list path;
     query_status = option_of_yojson (value_for_key query_status_of_yojson "QueryStatus") _list path;
     query_string =
       option_of_yojson (value_for_key query_statement_of_yojson "QueryString") _list path;
     query_id = option_of_yojson (value_for_key uui_d_of_yojson "QueryId") _list path;
   }
    : describe_query_response)

let describe_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     refresh_id = option_of_yojson (value_for_key refresh_id_of_yojson "RefreshId") _list path;
     query_alias = option_of_yojson (value_for_key query_alias_of_yojson "QueryAlias") _list path;
     query_id = option_of_yojson (value_for_key uui_d_of_yojson "QueryId") _list path;
     event_data_store =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "EventDataStore") _list path;
   }
    : describe_query_request)

let deregister_organization_delegated_admin_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_organization_delegated_admin_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delegated_admin_account_id =
       value_for_key account_id_of_yojson "DelegatedAdminAccountId" _list path;
   }
    : deregister_organization_delegated_admin_request)

let account_not_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : account_not_registered_exception)

let delete_trail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_trail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : delete_trail_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_resource_policy_request)

let delete_event_data_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_event_data_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_data_store = value_for_key event_data_store_arn_of_yojson "EventDataStore" _list path }
    : delete_event_data_store_request)

let channel_exists_for_eds_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : channel_exists_for_eds_exception)

let delete_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dashboard_id = value_for_key dashboard_arn_of_yojson "DashboardId" _list path }
    : delete_dashboard_request)

let delete_channel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ channel = value_for_key channel_arn_of_yojson "Channel" _list path } : delete_channel_request)

let create_trail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_organization_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsOrganizationTrail") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsRoleArn") _list path;
     cloud_watch_logs_log_group_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsLogGroupArn") _list path;
     log_file_validation_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "LogFileValidationEnabled") _list path;
     trail_ar_n = option_of_yojson (value_for_key string__of_yojson "TrailARN") _list path;
     is_multi_region_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiRegionTrail") _list path;
     include_global_service_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeGlobalServiceEvents") _list path;
     sns_topic_ar_n = option_of_yojson (value_for_key string__of_yojson "SnsTopicARN") _list path;
     sns_topic_name = option_of_yojson (value_for_key string__of_yojson "SnsTopicName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "S3KeyPrefix") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : create_trail_response)

let create_trail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     is_organization_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsOrganizationTrail") _list path;
     kms_key_id = option_of_yojson (value_for_key string__of_yojson "KmsKeyId") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsRoleArn") _list path;
     cloud_watch_logs_log_group_arn =
       option_of_yojson (value_for_key string__of_yojson "CloudWatchLogsLogGroupArn") _list path;
     enable_log_file_validation =
       option_of_yojson (value_for_key boolean__of_yojson "EnableLogFileValidation") _list path;
     is_multi_region_trail =
       option_of_yojson (value_for_key boolean__of_yojson "IsMultiRegionTrail") _list path;
     include_global_service_events =
       option_of_yojson (value_for_key boolean__of_yojson "IncludeGlobalServiceEvents") _list path;
     sns_topic_name = option_of_yojson (value_for_key string__of_yojson "SnsTopicName") _list path;
     s3_key_prefix = option_of_yojson (value_for_key string__of_yojson "S3KeyPrefix") _list path;
     s3_bucket_name = value_for_key string__of_yojson "S3BucketName" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : create_trail_request)

let create_event_data_store_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     updated_timestamp =
       option_of_yojson (value_for_key date_of_yojson "UpdatedTimestamp") _list path;
     created_timestamp =
       option_of_yojson (value_for_key date_of_yojson "CreatedTimestamp") _list path;
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     status = option_of_yojson (value_for_key event_data_store_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key event_data_store_name_of_yojson "Name") _list path;
     event_data_store_arn =
       option_of_yojson
         (value_for_key event_data_store_arn_of_yojson "EventDataStoreArn")
         _list path;
   }
    : create_event_data_store_response)

let create_event_data_store_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
     start_ingestion =
       option_of_yojson (value_for_key boolean__of_yojson "StartIngestion") _list path;
     kms_key_id =
       option_of_yojson (value_for_key event_data_store_kms_key_id_of_yojson "KmsKeyId") _list path;
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     retention_period =
       option_of_yojson (value_for_key retention_period_of_yojson "RetentionPeriod") _list path;
     organization_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OrganizationEnabled") _list path;
     multi_region_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "MultiRegionEnabled") _list path;
     advanced_event_selectors =
       option_of_yojson
         (value_for_key advanced_event_selectors_of_yojson "AdvancedEventSelectors")
         _list path;
     name = value_for_key event_data_store_name_of_yojson "Name" _list path;
   }
    : create_event_data_store_request)

let create_dashboard_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     refresh_schedule =
       option_of_yojson (value_for_key refresh_schedule_of_yojson "RefreshSchedule") _list path;
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     widgets = option_of_yojson (value_for_key widget_list_of_yojson "Widgets") _list path;
     type_ = option_of_yojson (value_for_key dashboard_type_of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key dashboard_name_of_yojson "Name") _list path;
     dashboard_arn =
       option_of_yojson (value_for_key dashboard_arn_of_yojson "DashboardArn") _list path;
   }
    : create_dashboard_response)

let create_dashboard_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     widgets = option_of_yojson (value_for_key request_widget_list_of_yojson "Widgets") _list path;
     termination_protection_enabled =
       option_of_yojson
         (value_for_key termination_protection_enabled_of_yojson "TerminationProtectionEnabled")
         _list path;
     tags_list = option_of_yojson (value_for_key tags_list_of_yojson "TagsList") _list path;
     refresh_schedule =
       option_of_yojson (value_for_key refresh_schedule_of_yojson "RefreshSchedule") _list path;
     name = value_for_key dashboard_name_of_yojson "Name" _list path;
   }
    : create_dashboard_request)

let create_channel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
     destinations =
       option_of_yojson (value_for_key destinations_of_yojson "Destinations") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "Source") _list path;
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     channel_arn = option_of_yojson (value_for_key channel_arn_of_yojson "ChannelArn") _list path;
   }
    : create_channel_response)

let create_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
     destinations = value_for_key destinations_of_yojson "Destinations" _list path;
     source = value_for_key source_of_yojson "Source" _list path;
     name = value_for_key channel_name_of_yojson "Name" _list path;
   }
    : create_channel_request)

let channel_max_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : channel_max_limit_exceeded_exception)

let cancel_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     query_status = value_for_key query_status_of_yojson "QueryStatus" _list path;
     query_id = value_for_key uui_d_of_yojson "QueryId" _list path;
   }
    : cancel_query_response)

let cancel_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_data_store_owner_account_id =
       option_of_yojson
         (value_for_key account_id_of_yojson "EventDataStoreOwnerAccountId")
         _list path;
     query_id = value_for_key uui_d_of_yojson "QueryId" _list path;
     event_data_store =
       option_of_yojson (value_for_key event_data_store_arn_of_yojson "EventDataStore") _list path;
   }
    : cancel_query_request)

let add_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let add_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags_list = value_for_key tags_list_of_yojson "TagsList" _list path;
     resource_id = value_for_key string__of_yojson "ResourceId" _list path;
   }
    : add_tags_request)
