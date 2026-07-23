open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "resourceType") _list path;
   }
    : resource_not_found_exception)

let optimistic_lock_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : optimistic_lock_exception)

let locked_subscription_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : locked_subscription_exception)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "name" _list path;
     message = value_for_key string__of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIELD_VALIDATION_FAILED" -> FIELD_VALIDATION_FAILED
    | `String "OTHER" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fields")
         _list path;
   }
    : invalid_parameter_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_error_exception)

let update_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let auto_renew_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoRenew" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoRenew")
     : auto_renew)
    : auto_renew)

let update_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ auto_renew = option_of_yojson (value_for_key auto_renew_of_yojson "AutoRenew") _list path }
    : update_subscription_request)

let update_protection_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let protection_group_members_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let protected_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOUDFRONT_DISTRIBUTION" -> CLOUDFRONT_DISTRIBUTION
    | `String "ROUTE_53_HOSTED_ZONE" -> ROUTE_53_HOSTED_ZONE
    | `String "ELASTIC_IP_ALLOCATION" -> ELASTIC_IP_ALLOCATION
    | `String "CLASSIC_LOAD_BALANCER" -> CLASSIC_LOAD_BALANCER
    | `String "APPLICATION_LOAD_BALANCER" -> APPLICATION_LOAD_BALANCER
    | `String "GLOBAL_ACCELERATOR" -> GLOBAL_ACCELERATOR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProtectedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectedResourceType")
     : protected_resource_type)
    : protected_resource_type)

let protection_group_pattern_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "ARBITRARY" -> ARBITRARY
    | `String "BY_RESOURCE_TYPE" -> BY_RESOURCE_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProtectionGroupPattern" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectionGroupPattern")
     : protection_group_pattern)
    : protection_group_pattern)

let protection_group_aggregation_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUM" -> SUM
    | `String "MEAN" -> MEAN
    | `String "MAX" -> MAX
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProtectionGroupAggregation" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectionGroupAggregation")
     : protection_group_aggregation)
    : protection_group_aggregation)

let protection_group_id_of_yojson = string_of_yojson

let update_protection_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
     aggregation = value_for_key protection_group_aggregation_of_yojson "Aggregation" _list path;
     pattern = value_for_key protection_group_pattern_of_yojson "Pattern" _list path;
     resource_type =
       option_of_yojson (value_for_key protected_resource_type_of_yojson "ResourceType") _list path;
     members =
       option_of_yojson (value_for_key protection_group_members_of_yojson "Members") _list path;
   }
    : update_protection_group_request)

let update_emergency_contact_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let contact_notes_of_yojson = string_of_yojson
let phone_number_of_yojson = string_of_yojson
let email_address_of_yojson = string_of_yojson

let emergency_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email_address = value_for_key email_address_of_yojson "EmailAddress" _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
     contact_notes =
       option_of_yojson (value_for_key contact_notes_of_yojson "ContactNotes") _list path;
   }
    : emergency_contact)

let emergency_contact_list_of_yojson tree path =
  list_of_yojson emergency_contact_of_yojson tree path

let update_emergency_contact_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emergency_contact_list =
       option_of_yojson
         (value_for_key emergency_contact_list_of_yojson "EmergencyContactList")
         _list path;
   }
    : update_emergency_contact_settings_request)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_operation_exception)

let update_application_layer_automatic_response_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let count_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let block_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let response_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block = option_of_yojson (value_for_key block_action_of_yojson "Block") _list path;
     count = option_of_yojson (value_for_key count_action_of_yojson "Count") _list path;
   }
    : response_action)

let update_application_layer_automatic_response_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     action = value_for_key response_action_of_yojson "Action" _list path;
   }
    : update_application_layer_automatic_response_request)

let invalid_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_resource_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let invalid_pagination_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_pagination_token_exception)

let token_of_yojson = string_of_yojson
let resource_arn_list_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let list_resources_in_protection_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns = value_for_key resource_arn_list_of_yojson "ResourceArns" _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_resources_in_protection_group_response)

let max_results_of_yojson = int_of_yojson

let list_resources_in_protection_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_resources_in_protection_group_request)

let application_layer_automatic_response_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ApplicationLayerAutomaticResponseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationLayerAutomaticResponseStatus")
     : application_layer_automatic_response_status)
    : application_layer_automatic_response_status)

let application_layer_automatic_response_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       value_for_key application_layer_automatic_response_status_of_yojson "Status" _list path;
     action = value_for_key response_action_of_yojson "Action" _list path;
   }
    : application_layer_automatic_response_configuration)

let health_check_id_of_yojson = string_of_yojson
let health_check_ids_of_yojson tree path = list_of_yojson health_check_id_of_yojson tree path
let protection_name_of_yojson = string_of_yojson
let protection_id_of_yojson = string_of_yojson

let protection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key protection_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key protection_name_of_yojson "Name") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
     health_check_ids =
       option_of_yojson (value_for_key health_check_ids_of_yojson "HealthCheckIds") _list path;
     protection_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProtectionArn") _list path;
     application_layer_automatic_response_configuration =
       option_of_yojson
         (value_for_key application_layer_automatic_response_configuration_of_yojson
            "ApplicationLayerAutomaticResponseConfiguration")
         _list path;
   }
    : protection)

let protections_of_yojson tree path = list_of_yojson protection_of_yojson tree path

let list_protections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protections = option_of_yojson (value_for_key protections_of_yojson "Protections") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_protections_response)

let protected_resource_type_filters_of_yojson tree path =
  list_of_yojson protected_resource_type_of_yojson tree path

let protection_name_filters_of_yojson tree path = list_of_yojson protection_name_of_yojson tree path
let resource_arn_filters_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let inclusion_protection_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arn_filters_of_yojson "ResourceArns") _list path;
     protection_names =
       option_of_yojson
         (value_for_key protection_name_filters_of_yojson "ProtectionNames")
         _list path;
     resource_types =
       option_of_yojson
         (value_for_key protected_resource_type_filters_of_yojson "ResourceTypes")
         _list path;
   }
    : inclusion_protection_filters)

let list_protections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     inclusion_filters =
       option_of_yojson
         (value_for_key inclusion_protection_filters_of_yojson "InclusionFilters")
         _list path;
   }
    : list_protections_request)

let protection_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
     aggregation = value_for_key protection_group_aggregation_of_yojson "Aggregation" _list path;
     pattern = value_for_key protection_group_pattern_of_yojson "Pattern" _list path;
     resource_type =
       option_of_yojson (value_for_key protected_resource_type_of_yojson "ResourceType") _list path;
     members = value_for_key protection_group_members_of_yojson "Members" _list path;
     protection_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "ProtectionGroupArn") _list path;
   }
    : protection_group)

let protection_groups_of_yojson tree path = list_of_yojson protection_group_of_yojson tree path

let list_protection_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_groups = value_for_key protection_groups_of_yojson "ProtectionGroups" _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_protection_groups_response)

let protection_group_aggregation_filters_of_yojson tree path =
  list_of_yojson protection_group_aggregation_of_yojson tree path

let protection_group_pattern_filters_of_yojson tree path =
  list_of_yojson protection_group_pattern_of_yojson tree path

let protection_group_id_filters_of_yojson tree path =
  list_of_yojson protection_group_id_of_yojson tree path

let inclusion_protection_group_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_ids =
       option_of_yojson
         (value_for_key protection_group_id_filters_of_yojson "ProtectionGroupIds")
         _list path;
     patterns =
       option_of_yojson
         (value_for_key protection_group_pattern_filters_of_yojson "Patterns")
         _list path;
     resource_types =
       option_of_yojson
         (value_for_key protected_resource_type_filters_of_yojson "ResourceTypes")
         _list path;
     aggregations =
       option_of_yojson
         (value_for_key protection_group_aggregation_filters_of_yojson "Aggregations")
         _list path;
   }
    : inclusion_protection_group_filters)

let list_protection_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     inclusion_filters =
       option_of_yojson
         (value_for_key inclusion_protection_group_filters_of_yojson "InclusionFilters")
         _list path;
   }
    : list_protection_groups_request)

let attack_vector_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vector_type = value_for_key string__of_yojson "VectorType" _list path }
    : attack_vector_description)

let attack_vector_description_list_of_yojson tree path =
  list_of_yojson attack_vector_description_of_yojson tree path

let attack_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let attack_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attack_id = option_of_yojson (value_for_key string__of_yojson "AttackId") _list path;
     resource_arn = option_of_yojson (value_for_key string__of_yojson "ResourceArn") _list path;
     start_time = option_of_yojson (value_for_key attack_timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key attack_timestamp_of_yojson "EndTime") _list path;
     attack_vectors =
       option_of_yojson
         (value_for_key attack_vector_description_list_of_yojson "AttackVectors")
         _list path;
   }
    : attack_summary)

let attack_summaries_of_yojson tree path = list_of_yojson attack_summary_of_yojson tree path

let list_attacks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attack_summaries =
       option_of_yojson (value_for_key attack_summaries_of_yojson "AttackSummaries") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_attacks_response)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_inclusive =
       option_of_yojson (value_for_key timestamp_of_yojson "FromInclusive") _list path;
     to_exclusive = option_of_yojson (value_for_key timestamp_of_yojson "ToExclusive") _list path;
   }
    : time_range)

let resource_arn_filter_list_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let list_attacks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arn_filter_list_of_yojson "ResourceArns") _list path;
     start_time = option_of_yojson (value_for_key time_range_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key time_range_of_yojson "EndTime") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_attacks_request)

let subscription_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriptionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriptionState")
     : subscription_state)
    : subscription_state)

let get_subscription_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_state = value_for_key subscription_state_of_yojson "SubscriptionState" _list path;
   }
    : get_subscription_state_response)

let get_subscription_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_proactive_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_proactive_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let limit_number_of_yojson = long_of_yojson
let limit_type_of_yojson = string_of_yojson

let limits_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     type_ = option_of_yojson (value_for_key limit_type_of_yojson "Type") _list path;
     limit = option_of_yojson (value_for_key limit_number_of_yojson "Limit") _list path;
   }
    : limits_exceeded_exception)

let enable_application_layer_automatic_response_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_application_layer_automatic_response_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     action = value_for_key response_action_of_yojson "Action" _list path;
   }
    : enable_application_layer_automatic_response_request)

let disassociate_health_check_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let health_check_arn_of_yojson = string_of_yojson

let disassociate_health_check_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_id = value_for_key protection_id_of_yojson "ProtectionId" _list path;
     health_check_arn = value_for_key health_check_arn_of_yojson "HealthCheckArn" _list path;
   }
    : disassociate_health_check_request)

let disassociate_drt_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_drt_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let no_associated_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : no_associated_role_exception)

let access_denied_for_dependency_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : access_denied_for_dependency_exception)

let disassociate_drt_log_bucket_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let log_bucket_of_yojson = string_of_yojson

let disassociate_drt_log_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_bucket = value_for_key log_bucket_of_yojson "LogBucket" _list path }
    : disassociate_drt_log_bucket_request)

let disable_proactive_engagement_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_proactive_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_application_layer_automatic_response_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_application_layer_automatic_response_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : disable_application_layer_automatic_response_request)

let long_of_yojson = long_of_yojson

let protection_group_arbitrary_pattern_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ max_members = value_for_key long_of_yojson "MaxMembers" _list path }
    : protection_group_arbitrary_pattern_limits)

let protection_group_pattern_type_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arbitrary_pattern_limits =
       value_for_key protection_group_arbitrary_pattern_limits_of_yojson "ArbitraryPatternLimits"
         _list path;
   }
    : protection_group_pattern_type_limits)

let protection_group_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_protection_groups = value_for_key long_of_yojson "MaxProtectionGroups" _list path;
     pattern_type_limits =
       value_for_key protection_group_pattern_type_limits_of_yojson "PatternTypeLimits" _list path;
   }
    : protection_group_limits)

let limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
     max = option_of_yojson (value_for_key long_of_yojson "Max") _list path;
   }
    : limit)

let limits_of_yojson tree path = list_of_yojson limit_of_yojson tree path

let protection_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protected_resource_type_limits =
       value_for_key limits_of_yojson "ProtectedResourceTypeLimits" _list path;
   }
    : protection_limits)

let subscription_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_limits = value_for_key protection_limits_of_yojson "ProtectionLimits" _list path;
     protection_group_limits =
       value_for_key protection_group_limits_of_yojson "ProtectionGroupLimits" _list path;
   }
    : subscription_limits)

let proactive_engagement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProactiveEngagementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProactiveEngagementStatus")
     : proactive_engagement_status)
    : proactive_engagement_status)

let duration_in_seconds_of_yojson = long_of_yojson

let subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     time_commitment_in_seconds =
       option_of_yojson
         (value_for_key duration_in_seconds_of_yojson "TimeCommitmentInSeconds")
         _list path;
     auto_renew = option_of_yojson (value_for_key auto_renew_of_yojson "AutoRenew") _list path;
     limits = option_of_yojson (value_for_key limits_of_yojson "Limits") _list path;
     proactive_engagement_status =
       option_of_yojson
         (value_for_key proactive_engagement_status_of_yojson "ProactiveEngagementStatus")
         _list path;
     subscription_limits =
       value_for_key subscription_limits_of_yojson "SubscriptionLimits" _list path;
     subscription_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SubscriptionArn") _list path;
   }
    : subscription)

let describe_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription =
       option_of_yojson (value_for_key subscription_of_yojson "Subscription") _list path;
   }
    : describe_subscription_response)

let describe_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let describe_protection_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protection_group = value_for_key protection_group_of_yojson "ProtectionGroup" _list path }
    : describe_protection_group_response)

let describe_protection_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
   }
    : describe_protection_group_request)

let describe_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protection = option_of_yojson (value_for_key protection_of_yojson "Protection") _list path }
    : describe_protection_response)

let describe_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_id =
       option_of_yojson (value_for_key protection_id_of_yojson "ProtectionId") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : describe_protection_request)

let describe_emergency_contact_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emergency_contact_list =
       option_of_yojson
         (value_for_key emergency_contact_list_of_yojson "EmergencyContactList")
         _list path;
   }
    : describe_emergency_contact_settings_response)

let describe_emergency_contact_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let log_bucket_list_of_yojson tree path = list_of_yojson log_bucket_of_yojson tree path
let role_arn_of_yojson = string_of_yojson

let describe_drt_access_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list path;
     log_bucket_list =
       option_of_yojson (value_for_key log_bucket_list_of_yojson "LogBucketList") _list path;
   }
    : describe_drt_access_response)

let describe_drt_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let double_of_yojson = double_of_yojson

let attack_volume_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ max = value_for_key double_of_yojson "Max" _list path } : attack_volume_statistics)

let attack_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bits_per_second =
       option_of_yojson
         (value_for_key attack_volume_statistics_of_yojson "BitsPerSecond")
         _list path;
     packets_per_second =
       option_of_yojson
         (value_for_key attack_volume_statistics_of_yojson "PacketsPerSecond")
         _list path;
     requests_per_second =
       option_of_yojson
         (value_for_key attack_volume_statistics_of_yojson "RequestsPerSecond")
         _list path;
   }
    : attack_volume)

let attack_statistics_data_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attack_volume =
       option_of_yojson (value_for_key attack_volume_of_yojson "AttackVolume") _list path;
     attack_count = value_for_key long_of_yojson "AttackCount" _list path;
   }
    : attack_statistics_data_item)

let attack_statistics_data_list_of_yojson tree path =
  list_of_yojson attack_statistics_data_item_of_yojson tree path

let describe_attack_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = value_for_key time_range_of_yojson "TimeRange" _list path;
     data_items = value_for_key attack_statistics_data_list_of_yojson "DataItems" _list path;
   }
    : describe_attack_statistics_response)

let describe_attack_statistics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : access_denied_exception)

let mitigation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mitigation_name =
       option_of_yojson (value_for_key string__of_yojson "MitigationName") _list path;
   }
    : mitigation)

let mitigation_list_of_yojson tree path = list_of_yojson mitigation_of_yojson tree path

let unit__of_yojson (tree : t) path =
  ((match tree with
    | `String "BITS" -> BITS
    | `String "BYTES" -> BYTES
    | `String "PACKETS" -> PACKETS
    | `String "REQUESTS" -> REQUESTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Unit" value)
    | _ -> raise (deserialize_wrong_type_error path "Unit")
     : unit_)
    : unit_)

let contributor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     value = option_of_yojson (value_for_key long_of_yojson "Value") _list path;
   }
    : contributor)

let top_contributors_of_yojson tree path = list_of_yojson contributor_of_yojson tree path

let attack_property_identifier_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESTINATION_URL" -> DESTINATION_URL
    | `String "REFERRER" -> REFERRER
    | `String "SOURCE_ASN" -> SOURCE_ASN
    | `String "SOURCE_COUNTRY" -> SOURCE_COUNTRY
    | `String "SOURCE_IP_ADDRESS" -> SOURCE_IP_ADDRESS
    | `String "SOURCE_USER_AGENT" -> SOURCE_USER_AGENT
    | `String "WORDPRESS_PINGBACK_REFLECTOR" -> WORDPRESS_PINGBACK_REFLECTOR
    | `String "WORDPRESS_PINGBACK_SOURCE" -> WORDPRESS_PINGBACK_SOURCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AttackPropertyIdentifier" value)
    | _ -> raise (deserialize_wrong_type_error path "AttackPropertyIdentifier")
     : attack_property_identifier)
    : attack_property_identifier)

let attack_layer_of_yojson (tree : t) path =
  ((match tree with
    | `String "NETWORK" -> NETWORK
    | `String "APPLICATION" -> APPLICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttackLayer" value)
    | _ -> raise (deserialize_wrong_type_error path "AttackLayer")
     : attack_layer)
    : attack_layer)

let attack_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attack_layer = option_of_yojson (value_for_key attack_layer_of_yojson "AttackLayer") _list path;
     attack_property_identifier =
       option_of_yojson
         (value_for_key attack_property_identifier_of_yojson "AttackPropertyIdentifier")
         _list path;
     top_contributors =
       option_of_yojson (value_for_key top_contributors_of_yojson "TopContributors") _list path;
     unit_ = option_of_yojson (value_for_key unit__of_yojson "Unit") _list path;
     total = option_of_yojson (value_for_key long_of_yojson "Total") _list path;
   }
    : attack_property)

let attack_properties_of_yojson tree path = list_of_yojson attack_property_of_yojson tree path
let integer_of_yojson = int_of_yojson

let summarized_counter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     max = option_of_yojson (value_for_key double_of_yojson "Max") _list path;
     average = option_of_yojson (value_for_key double_of_yojson "Average") _list path;
     sum = option_of_yojson (value_for_key double_of_yojson "Sum") _list path;
     n = option_of_yojson (value_for_key integer_of_yojson "N") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "Unit") _list path;
   }
    : summarized_counter)

let summarized_counter_list_of_yojson tree path =
  list_of_yojson summarized_counter_of_yojson tree path

let summarized_attack_vector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vector_type = value_for_key string__of_yojson "VectorType" _list path;
     vector_counters =
       option_of_yojson
         (value_for_key summarized_counter_list_of_yojson "VectorCounters")
         _list path;
   }
    : summarized_attack_vector)

let summarized_attack_vector_list_of_yojson tree path =
  list_of_yojson summarized_attack_vector_of_yojson tree path

let sub_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IP" -> IP
    | `String "URL" -> URL
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SubResourceType")
     : sub_resource_type)
    : sub_resource_type)

let sub_resource_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key sub_resource_type_of_yojson "Type") _list path;
     id = option_of_yojson (value_for_key string__of_yojson "Id") _list path;
     attack_vectors =
       option_of_yojson
         (value_for_key summarized_attack_vector_list_of_yojson "AttackVectors")
         _list path;
     counters =
       option_of_yojson (value_for_key summarized_counter_list_of_yojson "Counters") _list path;
   }
    : sub_resource_summary)

let sub_resource_summary_list_of_yojson tree path =
  list_of_yojson sub_resource_summary_of_yojson tree path

let attack_id_of_yojson = string_of_yojson

let attack_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attack_id = option_of_yojson (value_for_key attack_id_of_yojson "AttackId") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
     sub_resources =
       option_of_yojson
         (value_for_key sub_resource_summary_list_of_yojson "SubResources")
         _list path;
     start_time = option_of_yojson (value_for_key attack_timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key attack_timestamp_of_yojson "EndTime") _list path;
     attack_counters =
       option_of_yojson
         (value_for_key summarized_counter_list_of_yojson "AttackCounters")
         _list path;
     attack_properties =
       option_of_yojson (value_for_key attack_properties_of_yojson "AttackProperties") _list path;
     mitigations =
       option_of_yojson (value_for_key mitigation_list_of_yojson "Mitigations") _list path;
   }
    : attack_detail)

let describe_attack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attack = option_of_yojson (value_for_key attack_detail_of_yojson "Attack") _list path }
    : describe_attack_response)

let describe_attack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attack_id = value_for_key attack_id_of_yojson "AttackId" _list path }
    : describe_attack_request)

let delete_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_protection_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_protection_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
   }
    : delete_protection_group_request)

let delete_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protection_id = value_for_key protection_id_of_yojson "ProtectionId" _list path }
    : delete_protection_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "resourceType") _list path;
   }
    : resource_already_exists_exception)

let create_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_protection_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_protection_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_group_id =
       value_for_key protection_group_id_of_yojson "ProtectionGroupId" _list path;
     aggregation = value_for_key protection_group_aggregation_of_yojson "Aggregation" _list path;
     pattern = value_for_key protection_group_pattern_of_yojson "Pattern" _list path;
     resource_type =
       option_of_yojson (value_for_key protected_resource_type_of_yojson "ResourceType") _list path;
     members =
       option_of_yojson (value_for_key protection_group_members_of_yojson "Members") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_protection_group_request)

let create_protection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_id =
       option_of_yojson (value_for_key protection_id_of_yojson "ProtectionId") _list path;
   }
    : create_protection_response)

let create_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key protection_name_of_yojson "Name" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_protection_request)

let associate_proactive_engagement_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_proactive_engagement_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emergency_contact_list =
       value_for_key emergency_contact_list_of_yojson "EmergencyContactList" _list path;
   }
    : associate_proactive_engagement_details_request)

let associate_health_check_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_health_check_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protection_id = value_for_key protection_id_of_yojson "ProtectionId" _list path;
     health_check_arn = value_for_key health_check_arn_of_yojson "HealthCheckArn" _list path;
   }
    : associate_health_check_request)

let associate_drt_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_drt_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path }
    : associate_drt_role_request)

let associate_drt_log_bucket_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_drt_log_bucket_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_bucket = value_for_key log_bucket_of_yojson "LogBucket" _list path }
    : associate_drt_log_bucket_request)
