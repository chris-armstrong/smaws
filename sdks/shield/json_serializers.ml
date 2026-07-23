open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("resourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let optimistic_lock_exception_to_yojson (x : optimistic_lock_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let locked_subscription_exception_to_yojson (x : locked_subscription_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [ ("name", Some (string__to_yojson x.name)); ("message", Some (string__to_yojson x.message)) ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | OTHER -> `String "OTHER"

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_subscription_response_to_yojson = unit_to_yojson

let auto_renew_to_yojson (x : auto_renew) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let update_subscription_request_to_yojson (x : update_subscription_request) =
  assoc_to_yojson [ ("AutoRenew", option_to_yojson auto_renew_to_yojson x.auto_renew) ]

let update_protection_group_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let protection_group_members_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let protected_resource_type_to_yojson (x : protected_resource_type) =
  match x with
  | CLOUDFRONT_DISTRIBUTION -> `String "CLOUDFRONT_DISTRIBUTION"
  | ROUTE_53_HOSTED_ZONE -> `String "ROUTE_53_HOSTED_ZONE"
  | ELASTIC_IP_ALLOCATION -> `String "ELASTIC_IP_ALLOCATION"
  | CLASSIC_LOAD_BALANCER -> `String "CLASSIC_LOAD_BALANCER"
  | APPLICATION_LOAD_BALANCER -> `String "APPLICATION_LOAD_BALANCER"
  | GLOBAL_ACCELERATOR -> `String "GLOBAL_ACCELERATOR"

let protection_group_pattern_to_yojson (x : protection_group_pattern) =
  match x with
  | ALL -> `String "ALL"
  | ARBITRARY -> `String "ARBITRARY"
  | BY_RESOURCE_TYPE -> `String "BY_RESOURCE_TYPE"

let protection_group_aggregation_to_yojson (x : protection_group_aggregation) =
  match x with SUM -> `String "SUM" | MEAN -> `String "MEAN" | MAX -> `String "MAX"

let protection_group_id_to_yojson = string_to_yojson

let update_protection_group_request_to_yojson (x : update_protection_group_request) =
  assoc_to_yojson
    [
      ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id));
      ("Aggregation", Some (protection_group_aggregation_to_yojson x.aggregation));
      ("Pattern", Some (protection_group_pattern_to_yojson x.pattern));
      ("ResourceType", option_to_yojson protected_resource_type_to_yojson x.resource_type);
      ("Members", option_to_yojson protection_group_members_to_yojson x.members);
    ]

let update_emergency_contact_settings_response_to_yojson = unit_to_yojson
let contact_notes_to_yojson = string_to_yojson
let phone_number_to_yojson = string_to_yojson
let email_address_to_yojson = string_to_yojson

let emergency_contact_to_yojson (x : emergency_contact) =
  assoc_to_yojson
    [
      ("EmailAddress", Some (email_address_to_yojson x.email_address));
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("ContactNotes", option_to_yojson contact_notes_to_yojson x.contact_notes);
    ]

let emergency_contact_list_to_yojson tree = list_to_yojson emergency_contact_to_yojson tree

let update_emergency_contact_settings_request_to_yojson
    (x : update_emergency_contact_settings_request) =
  assoc_to_yojson
    [
      ( "EmergencyContactList",
        option_to_yojson emergency_contact_list_to_yojson x.emergency_contact_list );
    ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_application_layer_automatic_response_response_to_yojson = unit_to_yojson
let count_action_to_yojson = unit_to_yojson
let block_action_to_yojson = unit_to_yojson

let response_action_to_yojson (x : response_action) =
  assoc_to_yojson
    [
      ("Block", option_to_yojson block_action_to_yojson x.block);
      ("Count", option_to_yojson count_action_to_yojson x.count);
    ]

let update_application_layer_automatic_response_request_to_yojson
    (x : update_application_layer_automatic_response_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Action", Some (response_action_to_yojson x.action));
    ]

let invalid_resource_exception_to_yojson (x : invalid_resource_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n)) ]

let invalid_pagination_token_exception_to_yojson (x : invalid_pagination_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let token_to_yojson = string_to_yojson
let resource_arn_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let list_resources_in_protection_group_response_to_yojson
    (x : list_resources_in_protection_group_response) =
  assoc_to_yojson
    [
      ("ResourceArns", Some (resource_arn_list_to_yojson x.resource_arns));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_resources_in_protection_group_request_to_yojson
    (x : list_resources_in_protection_group_request) =
  assoc_to_yojson
    [
      ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let application_layer_automatic_response_status_to_yojson
    (x : application_layer_automatic_response_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let application_layer_automatic_response_configuration_to_yojson
    (x : application_layer_automatic_response_configuration) =
  assoc_to_yojson
    [
      ("Status", Some (application_layer_automatic_response_status_to_yojson x.status));
      ("Action", Some (response_action_to_yojson x.action));
    ]

let health_check_id_to_yojson = string_to_yojson
let health_check_ids_to_yojson tree = list_to_yojson health_check_id_to_yojson tree
let protection_name_to_yojson = string_to_yojson
let protection_id_to_yojson = string_to_yojson

let protection_to_yojson (x : protection) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson protection_id_to_yojson x.id);
      ("Name", option_to_yojson protection_name_to_yojson x.name);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("HealthCheckIds", option_to_yojson health_check_ids_to_yojson x.health_check_ids);
      ("ProtectionArn", option_to_yojson resource_arn_to_yojson x.protection_arn);
      ( "ApplicationLayerAutomaticResponseConfiguration",
        option_to_yojson application_layer_automatic_response_configuration_to_yojson
          x.application_layer_automatic_response_configuration );
    ]

let protections_to_yojson tree = list_to_yojson protection_to_yojson tree

let list_protections_response_to_yojson (x : list_protections_response) =
  assoc_to_yojson
    [
      ("Protections", option_to_yojson protections_to_yojson x.protections);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let protected_resource_type_filters_to_yojson tree =
  list_to_yojson protected_resource_type_to_yojson tree

let protection_name_filters_to_yojson tree = list_to_yojson protection_name_to_yojson tree
let resource_arn_filters_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let inclusion_protection_filters_to_yojson (x : inclusion_protection_filters) =
  assoc_to_yojson
    [
      ("ResourceArns", option_to_yojson resource_arn_filters_to_yojson x.resource_arns);
      ("ProtectionNames", option_to_yojson protection_name_filters_to_yojson x.protection_names);
      ("ResourceTypes", option_to_yojson protected_resource_type_filters_to_yojson x.resource_types);
    ]

let list_protections_request_to_yojson (x : list_protections_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InclusionFilters",
        option_to_yojson inclusion_protection_filters_to_yojson x.inclusion_filters );
    ]

let protection_group_to_yojson (x : protection_group) =
  assoc_to_yojson
    [
      ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id));
      ("Aggregation", Some (protection_group_aggregation_to_yojson x.aggregation));
      ("Pattern", Some (protection_group_pattern_to_yojson x.pattern));
      ("ResourceType", option_to_yojson protected_resource_type_to_yojson x.resource_type);
      ("Members", Some (protection_group_members_to_yojson x.members));
      ("ProtectionGroupArn", option_to_yojson resource_arn_to_yojson x.protection_group_arn);
    ]

let protection_groups_to_yojson tree = list_to_yojson protection_group_to_yojson tree

let list_protection_groups_response_to_yojson (x : list_protection_groups_response) =
  assoc_to_yojson
    [
      ("ProtectionGroups", Some (protection_groups_to_yojson x.protection_groups));
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let protection_group_aggregation_filters_to_yojson tree =
  list_to_yojson protection_group_aggregation_to_yojson tree

let protection_group_pattern_filters_to_yojson tree =
  list_to_yojson protection_group_pattern_to_yojson tree

let protection_group_id_filters_to_yojson tree = list_to_yojson protection_group_id_to_yojson tree

let inclusion_protection_group_filters_to_yojson (x : inclusion_protection_group_filters) =
  assoc_to_yojson
    [
      ( "ProtectionGroupIds",
        option_to_yojson protection_group_id_filters_to_yojson x.protection_group_ids );
      ("Patterns", option_to_yojson protection_group_pattern_filters_to_yojson x.patterns);
      ("ResourceTypes", option_to_yojson protected_resource_type_filters_to_yojson x.resource_types);
      ( "Aggregations",
        option_to_yojson protection_group_aggregation_filters_to_yojson x.aggregations );
    ]

let list_protection_groups_request_to_yojson (x : list_protection_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InclusionFilters",
        option_to_yojson inclusion_protection_group_filters_to_yojson x.inclusion_filters );
    ]

let attack_vector_description_to_yojson (x : attack_vector_description) =
  assoc_to_yojson [ ("VectorType", Some (string__to_yojson x.vector_type)) ]

let attack_vector_description_list_to_yojson tree =
  list_to_yojson attack_vector_description_to_yojson tree

let attack_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let attack_summary_to_yojson (x : attack_summary) =
  assoc_to_yojson
    [
      ("AttackId", option_to_yojson string__to_yojson x.attack_id);
      ("ResourceArn", option_to_yojson string__to_yojson x.resource_arn);
      ("StartTime", option_to_yojson attack_timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson attack_timestamp_to_yojson x.end_time);
      ("AttackVectors", option_to_yojson attack_vector_description_list_to_yojson x.attack_vectors);
    ]

let attack_summaries_to_yojson tree = list_to_yojson attack_summary_to_yojson tree

let list_attacks_response_to_yojson (x : list_attacks_response) =
  assoc_to_yojson
    [
      ("AttackSummaries", option_to_yojson attack_summaries_to_yojson x.attack_summaries);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("FromInclusive", option_to_yojson timestamp_to_yojson x.from_inclusive);
      ("ToExclusive", option_to_yojson timestamp_to_yojson x.to_exclusive);
    ]

let resource_arn_filter_list_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let list_attacks_request_to_yojson (x : list_attacks_request) =
  assoc_to_yojson
    [
      ("ResourceArns", option_to_yojson resource_arn_filter_list_to_yojson x.resource_arns);
      ("StartTime", option_to_yojson time_range_to_yojson x.start_time);
      ("EndTime", option_to_yojson time_range_to_yojson x.end_time);
      ("NextToken", option_to_yojson token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let subscription_state_to_yojson (x : subscription_state) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let get_subscription_state_response_to_yojson (x : get_subscription_state_response) =
  assoc_to_yojson
    [ ("SubscriptionState", Some (subscription_state_to_yojson x.subscription_state)) ]

let get_subscription_state_request_to_yojson = unit_to_yojson
let enable_proactive_engagement_response_to_yojson = unit_to_yojson
let enable_proactive_engagement_request_to_yojson = unit_to_yojson
let limit_number_to_yojson = long_to_yojson
let limit_type_to_yojson = string_to_yojson

let limits_exceeded_exception_to_yojson (x : limits_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("Type", option_to_yojson limit_type_to_yojson x.type_);
      ("Limit", option_to_yojson limit_number_to_yojson x.limit);
    ]

let enable_application_layer_automatic_response_response_to_yojson = unit_to_yojson

let enable_application_layer_automatic_response_request_to_yojson
    (x : enable_application_layer_automatic_response_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Action", Some (response_action_to_yojson x.action));
    ]

let disassociate_health_check_response_to_yojson = unit_to_yojson
let health_check_arn_to_yojson = string_to_yojson

let disassociate_health_check_request_to_yojson (x : disassociate_health_check_request) =
  assoc_to_yojson
    [
      ("ProtectionId", Some (protection_id_to_yojson x.protection_id));
      ("HealthCheckArn", Some (health_check_arn_to_yojson x.health_check_arn));
    ]

let disassociate_drt_role_response_to_yojson = unit_to_yojson
let disassociate_drt_role_request_to_yojson = unit_to_yojson

let no_associated_role_exception_to_yojson (x : no_associated_role_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_for_dependency_exception_to_yojson (x : access_denied_for_dependency_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let disassociate_drt_log_bucket_response_to_yojson = unit_to_yojson
let log_bucket_to_yojson = string_to_yojson

let disassociate_drt_log_bucket_request_to_yojson (x : disassociate_drt_log_bucket_request) =
  assoc_to_yojson [ ("LogBucket", Some (log_bucket_to_yojson x.log_bucket)) ]

let disable_proactive_engagement_response_to_yojson = unit_to_yojson
let disable_proactive_engagement_request_to_yojson = unit_to_yojson
let disable_application_layer_automatic_response_response_to_yojson = unit_to_yojson

let disable_application_layer_automatic_response_request_to_yojson
    (x : disable_application_layer_automatic_response_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let long_to_yojson = long_to_yojson

let protection_group_arbitrary_pattern_limits_to_yojson
    (x : protection_group_arbitrary_pattern_limits) =
  assoc_to_yojson [ ("MaxMembers", Some (long_to_yojson x.max_members)) ]

let protection_group_pattern_type_limits_to_yojson (x : protection_group_pattern_type_limits) =
  assoc_to_yojson
    [
      ( "ArbitraryPatternLimits",
        Some (protection_group_arbitrary_pattern_limits_to_yojson x.arbitrary_pattern_limits) );
    ]

let protection_group_limits_to_yojson (x : protection_group_limits) =
  assoc_to_yojson
    [
      ("MaxProtectionGroups", Some (long_to_yojson x.max_protection_groups));
      ( "PatternTypeLimits",
        Some (protection_group_pattern_type_limits_to_yojson x.pattern_type_limits) );
    ]

let limit_to_yojson (x : limit) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("Max", option_to_yojson long_to_yojson x.max);
    ]

let limits_to_yojson tree = list_to_yojson limit_to_yojson tree

let protection_limits_to_yojson (x : protection_limits) =
  assoc_to_yojson
    [ ("ProtectedResourceTypeLimits", Some (limits_to_yojson x.protected_resource_type_limits)) ]

let subscription_limits_to_yojson (x : subscription_limits) =
  assoc_to_yojson
    [
      ("ProtectionLimits", Some (protection_limits_to_yojson x.protection_limits));
      ("ProtectionGroupLimits", Some (protection_group_limits_to_yojson x.protection_group_limits));
    ]

let proactive_engagement_status_to_yojson (x : proactive_engagement_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | PENDING -> `String "PENDING"

let duration_in_seconds_to_yojson = long_to_yojson

let subscription_to_yojson (x : subscription) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ( "TimeCommitmentInSeconds",
        option_to_yojson duration_in_seconds_to_yojson x.time_commitment_in_seconds );
      ("AutoRenew", option_to_yojson auto_renew_to_yojson x.auto_renew);
      ("Limits", option_to_yojson limits_to_yojson x.limits);
      ( "ProactiveEngagementStatus",
        option_to_yojson proactive_engagement_status_to_yojson x.proactive_engagement_status );
      ("SubscriptionLimits", Some (subscription_limits_to_yojson x.subscription_limits));
      ("SubscriptionArn", option_to_yojson resource_arn_to_yojson x.subscription_arn);
    ]

let describe_subscription_response_to_yojson (x : describe_subscription_response) =
  assoc_to_yojson [ ("Subscription", option_to_yojson subscription_to_yojson x.subscription) ]

let describe_subscription_request_to_yojson = unit_to_yojson

let describe_protection_group_response_to_yojson (x : describe_protection_group_response) =
  assoc_to_yojson [ ("ProtectionGroup", Some (protection_group_to_yojson x.protection_group)) ]

let describe_protection_group_request_to_yojson (x : describe_protection_group_request) =
  assoc_to_yojson
    [ ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id)) ]

let describe_protection_response_to_yojson (x : describe_protection_response) =
  assoc_to_yojson [ ("Protection", option_to_yojson protection_to_yojson x.protection) ]

let describe_protection_request_to_yojson (x : describe_protection_request) =
  assoc_to_yojson
    [
      ("ProtectionId", option_to_yojson protection_id_to_yojson x.protection_id);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let describe_emergency_contact_settings_response_to_yojson
    (x : describe_emergency_contact_settings_response) =
  assoc_to_yojson
    [
      ( "EmergencyContactList",
        option_to_yojson emergency_contact_list_to_yojson x.emergency_contact_list );
    ]

let describe_emergency_contact_settings_request_to_yojson = unit_to_yojson
let log_bucket_list_to_yojson tree = list_to_yojson log_bucket_to_yojson tree
let role_arn_to_yojson = string_to_yojson

let describe_drt_access_response_to_yojson (x : describe_drt_access_response) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LogBucketList", option_to_yojson log_bucket_list_to_yojson x.log_bucket_list);
    ]

let describe_drt_access_request_to_yojson = unit_to_yojson
let double_to_yojson = double_to_yojson

let attack_volume_statistics_to_yojson (x : attack_volume_statistics) =
  assoc_to_yojson [ ("Max", Some (double_to_yojson x.max)) ]

let attack_volume_to_yojson (x : attack_volume) =
  assoc_to_yojson
    [
      ("BitsPerSecond", option_to_yojson attack_volume_statistics_to_yojson x.bits_per_second);
      ("PacketsPerSecond", option_to_yojson attack_volume_statistics_to_yojson x.packets_per_second);
      ( "RequestsPerSecond",
        option_to_yojson attack_volume_statistics_to_yojson x.requests_per_second );
    ]

let attack_statistics_data_item_to_yojson (x : attack_statistics_data_item) =
  assoc_to_yojson
    [
      ("AttackVolume", option_to_yojson attack_volume_to_yojson x.attack_volume);
      ("AttackCount", Some (long_to_yojson x.attack_count));
    ]

let attack_statistics_data_list_to_yojson tree =
  list_to_yojson attack_statistics_data_item_to_yojson tree

let describe_attack_statistics_response_to_yojson (x : describe_attack_statistics_response) =
  assoc_to_yojson
    [
      ("TimeRange", Some (time_range_to_yojson x.time_range));
      ("DataItems", Some (attack_statistics_data_list_to_yojson x.data_items));
    ]

let describe_attack_statistics_request_to_yojson = unit_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let mitigation_to_yojson (x : mitigation) =
  assoc_to_yojson [ ("MitigationName", option_to_yojson string__to_yojson x.mitigation_name) ]

let mitigation_list_to_yojson tree = list_to_yojson mitigation_to_yojson tree

let unit__to_yojson (x : unit_) =
  match x with
  | BITS -> `String "BITS"
  | BYTES -> `String "BYTES"
  | PACKETS -> `String "PACKETS"
  | REQUESTS -> `String "REQUESTS"

let contributor_to_yojson (x : contributor) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Value", option_to_yojson long_to_yojson x.value);
    ]

let top_contributors_to_yojson tree = list_to_yojson contributor_to_yojson tree

let attack_property_identifier_to_yojson (x : attack_property_identifier) =
  match x with
  | DESTINATION_URL -> `String "DESTINATION_URL"
  | REFERRER -> `String "REFERRER"
  | SOURCE_ASN -> `String "SOURCE_ASN"
  | SOURCE_COUNTRY -> `String "SOURCE_COUNTRY"
  | SOURCE_IP_ADDRESS -> `String "SOURCE_IP_ADDRESS"
  | SOURCE_USER_AGENT -> `String "SOURCE_USER_AGENT"
  | WORDPRESS_PINGBACK_REFLECTOR -> `String "WORDPRESS_PINGBACK_REFLECTOR"
  | WORDPRESS_PINGBACK_SOURCE -> `String "WORDPRESS_PINGBACK_SOURCE"

let attack_layer_to_yojson (x : attack_layer) =
  match x with NETWORK -> `String "NETWORK" | APPLICATION -> `String "APPLICATION"

let attack_property_to_yojson (x : attack_property) =
  assoc_to_yojson
    [
      ("AttackLayer", option_to_yojson attack_layer_to_yojson x.attack_layer);
      ( "AttackPropertyIdentifier",
        option_to_yojson attack_property_identifier_to_yojson x.attack_property_identifier );
      ("TopContributors", option_to_yojson top_contributors_to_yojson x.top_contributors);
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
      ("Total", option_to_yojson long_to_yojson x.total);
    ]

let attack_properties_to_yojson tree = list_to_yojson attack_property_to_yojson tree
let integer_to_yojson = int_to_yojson

let summarized_counter_to_yojson (x : summarized_counter) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Max", option_to_yojson double_to_yojson x.max);
      ("Average", option_to_yojson double_to_yojson x.average);
      ("Sum", option_to_yojson double_to_yojson x.sum);
      ("N", option_to_yojson integer_to_yojson x.n);
      ("Unit", option_to_yojson string__to_yojson x.unit_);
    ]

let summarized_counter_list_to_yojson tree = list_to_yojson summarized_counter_to_yojson tree

let summarized_attack_vector_to_yojson (x : summarized_attack_vector) =
  assoc_to_yojson
    [
      ("VectorType", Some (string__to_yojson x.vector_type));
      ("VectorCounters", option_to_yojson summarized_counter_list_to_yojson x.vector_counters);
    ]

let summarized_attack_vector_list_to_yojson tree =
  list_to_yojson summarized_attack_vector_to_yojson tree

let sub_resource_type_to_yojson (x : sub_resource_type) =
  match x with IP -> `String "IP" | URL -> `String "URL"

let sub_resource_summary_to_yojson (x : sub_resource_summary) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson sub_resource_type_to_yojson x.type_);
      ("Id", option_to_yojson string__to_yojson x.id);
      ("AttackVectors", option_to_yojson summarized_attack_vector_list_to_yojson x.attack_vectors);
      ("Counters", option_to_yojson summarized_counter_list_to_yojson x.counters);
    ]

let sub_resource_summary_list_to_yojson tree = list_to_yojson sub_resource_summary_to_yojson tree
let attack_id_to_yojson = string_to_yojson

let attack_detail_to_yojson (x : attack_detail) =
  assoc_to_yojson
    [
      ("AttackId", option_to_yojson attack_id_to_yojson x.attack_id);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("SubResources", option_to_yojson sub_resource_summary_list_to_yojson x.sub_resources);
      ("StartTime", option_to_yojson attack_timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson attack_timestamp_to_yojson x.end_time);
      ("AttackCounters", option_to_yojson summarized_counter_list_to_yojson x.attack_counters);
      ("AttackProperties", option_to_yojson attack_properties_to_yojson x.attack_properties);
      ("Mitigations", option_to_yojson mitigation_list_to_yojson x.mitigations);
    ]

let describe_attack_response_to_yojson (x : describe_attack_response) =
  assoc_to_yojson [ ("Attack", option_to_yojson attack_detail_to_yojson x.attack) ]

let describe_attack_request_to_yojson (x : describe_attack_request) =
  assoc_to_yojson [ ("AttackId", Some (attack_id_to_yojson x.attack_id)) ]

let delete_subscription_response_to_yojson = unit_to_yojson
let delete_subscription_request_to_yojson = unit_to_yojson
let delete_protection_group_response_to_yojson = unit_to_yojson

let delete_protection_group_request_to_yojson (x : delete_protection_group_request) =
  assoc_to_yojson
    [ ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id)) ]

let delete_protection_response_to_yojson = unit_to_yojson

let delete_protection_request_to_yojson (x : delete_protection_request) =
  assoc_to_yojson [ ("ProtectionId", Some (protection_id_to_yojson x.protection_id)) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("resourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let create_subscription_response_to_yojson = unit_to_yojson
let create_subscription_request_to_yojson = unit_to_yojson
let create_protection_group_response_to_yojson = unit_to_yojson

let create_protection_group_request_to_yojson (x : create_protection_group_request) =
  assoc_to_yojson
    [
      ("ProtectionGroupId", Some (protection_group_id_to_yojson x.protection_group_id));
      ("Aggregation", Some (protection_group_aggregation_to_yojson x.aggregation));
      ("Pattern", Some (protection_group_pattern_to_yojson x.pattern));
      ("ResourceType", option_to_yojson protected_resource_type_to_yojson x.resource_type);
      ("Members", option_to_yojson protection_group_members_to_yojson x.members);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_protection_response_to_yojson (x : create_protection_response) =
  assoc_to_yojson [ ("ProtectionId", option_to_yojson protection_id_to_yojson x.protection_id) ]

let create_protection_request_to_yojson (x : create_protection_request) =
  assoc_to_yojson
    [
      ("Name", Some (protection_name_to_yojson x.name));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let associate_proactive_engagement_details_response_to_yojson = unit_to_yojson

let associate_proactive_engagement_details_request_to_yojson
    (x : associate_proactive_engagement_details_request) =
  assoc_to_yojson
    [ ("EmergencyContactList", Some (emergency_contact_list_to_yojson x.emergency_contact_list)) ]

let associate_health_check_response_to_yojson = unit_to_yojson

let associate_health_check_request_to_yojson (x : associate_health_check_request) =
  assoc_to_yojson
    [
      ("ProtectionId", Some (protection_id_to_yojson x.protection_id));
      ("HealthCheckArn", Some (health_check_arn_to_yojson x.health_check_arn));
    ]

let associate_drt_role_response_to_yojson = unit_to_yojson

let associate_drt_role_request_to_yojson (x : associate_drt_role_request) =
  assoc_to_yojson [ ("RoleArn", Some (role_arn_to_yojson x.role_arn)) ]

let associate_drt_log_bucket_response_to_yojson = unit_to_yojson

let associate_drt_log_bucket_request_to_yojson (x : associate_drt_log_bucket_request) =
  assoc_to_yojson [ ("LogBucket", Some (log_bucket_to_yojson x.log_bucket)) ]
