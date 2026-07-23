open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : concurrent_modification_exception)

let health_service_access_status_for_organization_of_yojson = string_of_yojson

let describe_health_service_status_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_service_access_status_for_organization =
       option_of_yojson
         (value_for_key health_service_access_status_for_organization_of_yojson
            "healthServiceAccessStatusForOrganization")
         _list path;
   }
    : describe_health_service_status_for_organization_response)

let unsupported_locale_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : unsupported_locale)

let invalid_pagination_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : invalid_pagination_token)

let next_token_of_yojson = string_of_yojson

let event_type_persona_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPERATIONS" -> OPERATIONS
    | `String "SECURITY" -> SECURITY
    | `String "BILLING" -> BILLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventTypePersona" value)
    | _ -> raise (deserialize_wrong_type_error path "EventTypePersona")
     : event_type_persona)
    : event_type_persona)

let event_type_persona_list_of_yojson tree path =
  list_of_yojson event_type_persona_of_yojson tree path

let event_type_actionability_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTION_REQUIRED" -> ACTION_REQUIRED
    | `String "ACTION_MAY_BE_REQUIRED" -> ACTION_MAY_BE_REQUIRED
    | `String "INFORMATIONAL" -> INFORMATIONAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EventTypeActionability" value)
    | _ -> raise (deserialize_wrong_type_error path "EventTypeActionability")
     : event_type_actionability)
    : event_type_actionability)

let event_type_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "issue" -> ISSUE
    | `String "accountNotification" -> ACCOUNT_NOTIFICATION
    | `String "scheduledChange" -> SCHEDULED_CHANGE
    | `String "investigation" -> INVESTIGATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "eventTypeCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "eventTypeCategory")
     : event_type_category)
    : event_type_category)

let event_type_code_of_yojson = string_of_yojson
let service_of_yojson = string_of_yojson

let event_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
     code = option_of_yojson (value_for_key event_type_code_of_yojson "code") _list path;
     category = option_of_yojson (value_for_key event_type_category_of_yojson "category") _list path;
     actionability =
       option_of_yojson
         (value_for_key event_type_actionability_of_yojson "actionability")
         _list path;
     personas =
       option_of_yojson (value_for_key event_type_persona_list_of_yojson "personas") _list path;
   }
    : event_type)

let event_type_list_of_yojson tree path = list_of_yojson event_type_of_yojson tree path

let describe_event_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_types =
       option_of_yojson (value_for_key event_type_list_of_yojson "eventTypes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_event_types_response)

let max_results_of_yojson = int_of_yojson
let locale_of_yojson = string_of_yojson

let event_type_actionability_list_of_yojson tree path =
  list_of_yojson event_type_actionability_of_yojson tree path

let event_type_category_list_of_yojson tree path =
  list_of_yojson event_type_category_of_yojson tree path

let service_list_of_yojson tree path = list_of_yojson service_of_yojson tree path
let event_type_code_list_of_yojson tree path = list_of_yojson event_type_code_of_yojson tree path

let event_type_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_type_codes =
       option_of_yojson (value_for_key event_type_code_list_of_yojson "eventTypeCodes") _list path;
     services = option_of_yojson (value_for_key service_list_of_yojson "services") _list path;
     event_type_categories =
       option_of_yojson
         (value_for_key event_type_category_list_of_yojson "eventTypeCategories")
         _list path;
     actionabilities =
       option_of_yojson
         (value_for_key event_type_actionability_list_of_yojson "actionabilities")
         _list path;
     personas =
       option_of_yojson (value_for_key event_type_persona_list_of_yojson "personas") _list path;
   }
    : event_type_filter)

let describe_event_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key event_type_filter_of_yojson "filter") _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_event_types_request)

let event_persona_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPERATIONS" -> OPERATIONS
    | `String "SECURITY" -> SECURITY
    | `String "BILLING" -> BILLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventPersona" value)
    | _ -> raise (deserialize_wrong_type_error path "EventPersona")
     : event_persona)
    : event_persona)

let event_persona_list_of_yojson tree path = list_of_yojson event_persona_of_yojson tree path

let event_actionability_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTION_REQUIRED" -> ACTION_REQUIRED
    | `String "ACTION_MAY_BE_REQUIRED" -> ACTION_MAY_BE_REQUIRED
    | `String "INFORMATIONAL" -> INFORMATIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventActionability" value)
    | _ -> raise (deserialize_wrong_type_error path "EventActionability")
     : event_actionability)
    : event_actionability)

let event_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "open" -> OPEN
    | `String "closed" -> CLOSED
    | `String "upcoming" -> UPCOMING
    | `String value -> raise (deserialize_unknown_enum_value_error path "eventStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "eventStatusCode")
     : event_status_code)
    : event_status_code)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let region_of_yojson = string_of_yojson

let event_scope_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "PUBLIC" -> PUBLIC
    | `String "ACCOUNT_SPECIFIC" -> ACCOUNT_SPECIFIC
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "eventScopeCode" value)
    | _ -> raise (deserialize_wrong_type_error path "eventScopeCode")
     : event_scope_code)
    : event_scope_code)

let event_arn_of_yojson = string_of_yojson

let organization_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key event_arn_of_yojson "arn") _list path;
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
     event_type_code =
       option_of_yojson (value_for_key event_type_code_of_yojson "eventTypeCode") _list path;
     event_type_category =
       option_of_yojson (value_for_key event_type_category_of_yojson "eventTypeCategory") _list path;
     event_scope_code =
       option_of_yojson (value_for_key event_scope_code_of_yojson "eventScopeCode") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     status_code =
       option_of_yojson (value_for_key event_status_code_of_yojson "statusCode") _list path;
     actionability =
       option_of_yojson (value_for_key event_actionability_of_yojson "actionability") _list path;
     personas = option_of_yojson (value_for_key event_persona_list_of_yojson "personas") _list path;
   }
    : organization_event)

let organization_event_list_of_yojson tree path =
  list_of_yojson organization_event_of_yojson tree path

let describe_events_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = option_of_yojson (value_for_key organization_event_list_of_yojson "events") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_events_for_organization_response)

let max_results_lower_range_of_yojson = int_of_yojson

let event_status_code_list_of_yojson tree path =
  list_of_yojson event_status_code_of_yojson tree path

let event_type_category_list2_of_yojson tree path =
  list_of_yojson event_type_category_of_yojson tree path

let entity_value_of_yojson = string_of_yojson
let entity_value_list_of_yojson tree path = list_of_yojson entity_value_of_yojson tree path
let entity_arn_of_yojson = string_of_yojson
let entity_arn_list_of_yojson tree path = list_of_yojson entity_arn_of_yojson tree path

let date_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_ = option_of_yojson (value_for_key timestamp_of_yojson "from") _list path;
     to_ = option_of_yojson (value_for_key timestamp_of_yojson "to") _list path;
   }
    : date_time_range)

let region_list_of_yojson tree path = list_of_yojson region_of_yojson tree path
let account_id_of_yojson = string_of_yojson
let aws_account_ids_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let event_type2_of_yojson = string_of_yojson
let event_type_list2_of_yojson tree path = list_of_yojson event_type2_of_yojson tree path

let event_actionability_list_of_yojson tree path =
  list_of_yojson event_actionability_of_yojson tree path

let organization_event_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actionabilities =
       option_of_yojson
         (value_for_key event_actionability_list_of_yojson "actionabilities")
         _list path;
     event_type_codes =
       option_of_yojson (value_for_key event_type_list2_of_yojson "eventTypeCodes") _list path;
     aws_account_ids =
       option_of_yojson (value_for_key aws_account_ids_list_of_yojson "awsAccountIds") _list path;
     services = option_of_yojson (value_for_key service_list_of_yojson "services") _list path;
     regions = option_of_yojson (value_for_key region_list_of_yojson "regions") _list path;
     start_time = option_of_yojson (value_for_key date_time_range_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_range_of_yojson "endTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_time_range_of_yojson "lastUpdatedTime") _list path;
     entity_arns =
       option_of_yojson (value_for_key entity_arn_list_of_yojson "entityArns") _list path;
     entity_values =
       option_of_yojson (value_for_key entity_value_list_of_yojson "entityValues") _list path;
     event_type_categories =
       option_of_yojson
         (value_for_key event_type_category_list2_of_yojson "eventTypeCategories")
         _list path;
     event_status_codes =
       option_of_yojson
         (value_for_key event_status_code_list_of_yojson "eventStatusCodes")
         _list path;
     personas = option_of_yojson (value_for_key event_persona_list_of_yojson "personas") _list path;
   }
    : organization_event_filter)

let describe_events_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key organization_event_filter_of_yojson "filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_lower_range_of_yojson "maxResults") _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
   }
    : describe_events_for_organization_request)

let availability_zone_of_yojson = string_of_yojson

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key event_arn_of_yojson "arn") _list path;
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
     event_type_code =
       option_of_yojson (value_for_key event_type_code_of_yojson "eventTypeCode") _list path;
     event_type_category =
       option_of_yojson (value_for_key event_type_category_of_yojson "eventTypeCategory") _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     status_code =
       option_of_yojson (value_for_key event_status_code_of_yojson "statusCode") _list path;
     event_scope_code =
       option_of_yojson (value_for_key event_scope_code_of_yojson "eventScopeCode") _list path;
     actionability =
       option_of_yojson (value_for_key event_actionability_of_yojson "actionability") _list path;
     personas = option_of_yojson (value_for_key event_persona_list_of_yojson "personas") _list path;
   }
    : event)

let event_list_of_yojson tree path = list_of_yojson event_of_yojson tree path

let describe_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events = option_of_yojson (value_for_key event_list_of_yojson "events") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_events_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_set_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path
let tag_filter_of_yojson tree path = list_of_yojson tag_set_of_yojson tree path
let date_time_range_list_of_yojson tree path = list_of_yojson date_time_range_of_yojson tree path
let availability_zones_of_yojson tree path = list_of_yojson availability_zone_of_yojson tree path
let event_arn_list_of_yojson tree path = list_of_yojson event_arn_of_yojson tree path

let event_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actionabilities =
       option_of_yojson
         (value_for_key event_actionability_list_of_yojson "actionabilities")
         _list path;
     event_arns = option_of_yojson (value_for_key event_arn_list_of_yojson "eventArns") _list path;
     event_type_codes =
       option_of_yojson (value_for_key event_type_list2_of_yojson "eventTypeCodes") _list path;
     services = option_of_yojson (value_for_key service_list_of_yojson "services") _list path;
     regions = option_of_yojson (value_for_key region_list_of_yojson "regions") _list path;
     availability_zones =
       option_of_yojson (value_for_key availability_zones_of_yojson "availabilityZones") _list path;
     start_times =
       option_of_yojson (value_for_key date_time_range_list_of_yojson "startTimes") _list path;
     end_times =
       option_of_yojson (value_for_key date_time_range_list_of_yojson "endTimes") _list path;
     last_updated_times =
       option_of_yojson (value_for_key date_time_range_list_of_yojson "lastUpdatedTimes") _list path;
     entity_arns =
       option_of_yojson (value_for_key entity_arn_list_of_yojson "entityArns") _list path;
     entity_values =
       option_of_yojson (value_for_key entity_value_list_of_yojson "entityValues") _list path;
     event_type_categories =
       option_of_yojson
         (value_for_key event_type_category_list2_of_yojson "eventTypeCategories")
         _list path;
     tags = option_of_yojson (value_for_key tag_filter_of_yojson "tags") _list path;
     event_status_codes =
       option_of_yojson
         (value_for_key event_status_code_list_of_yojson "eventStatusCodes")
         _list path;
     personas = option_of_yojson (value_for_key event_persona_list_of_yojson "personas") _list path;
   }
    : event_filter)

let describe_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key event_filter_of_yojson "filter") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_lower_range_of_yojson "maxResults") _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
   }
    : describe_events_request)

let organization_event_details_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     error_name = option_of_yojson (value_for_key string__of_yojson "errorName") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
   }
    : organization_event_details_error_item)

let describe_event_details_for_organization_failed_set_of_yojson tree path =
  list_of_yojson organization_event_details_error_item_of_yojson tree path

let metadata_value_of_yojson = string_of_yojson
let metadata_key_of_yojson = string_of_yojson

let event_metadata_of_yojson tree path =
  map_of_yojson metadata_key_of_yojson metadata_value_of_yojson tree path

let event_description2_of_yojson = string_of_yojson

let event_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_description =
       option_of_yojson (value_for_key event_description2_of_yojson "latestDescription") _list path;
   }
    : event_description)

let organization_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
     event = option_of_yojson (value_for_key event_of_yojson "event") _list path;
     event_description =
       option_of_yojson (value_for_key event_description_of_yojson "eventDescription") _list path;
     event_metadata =
       option_of_yojson (value_for_key event_metadata_of_yojson "eventMetadata") _list path;
   }
    : organization_event_details)

let describe_event_details_for_organization_successful_set_of_yojson tree path =
  list_of_yojson organization_event_details_of_yojson tree path

let describe_event_details_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     successful_set =
       option_of_yojson
         (value_for_key describe_event_details_for_organization_successful_set_of_yojson
            "successfulSet")
         _list path;
     failed_set =
       option_of_yojson
         (value_for_key describe_event_details_for_organization_failed_set_of_yojson "failedSet")
         _list path;
   }
    : describe_event_details_for_organization_response)

let event_account_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = value_for_key event_arn_of_yojson "eventArn" _list path;
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
   }
    : event_account_filter)

let organization_event_detail_filters_list_of_yojson tree path =
  list_of_yojson event_account_filter_of_yojson tree path

let describe_event_details_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_event_detail_filters =
       value_for_key organization_event_detail_filters_list_of_yojson
         "organizationEventDetailFilters" _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
   }
    : describe_event_details_for_organization_request)

let event_details_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     error_name = option_of_yojson (value_for_key string__of_yojson "errorName") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
   }
    : event_details_error_item)

let describe_event_details_failed_set_of_yojson tree path =
  list_of_yojson event_details_error_item_of_yojson tree path

let event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event = option_of_yojson (value_for_key event_of_yojson "event") _list path;
     event_description =
       option_of_yojson (value_for_key event_description_of_yojson "eventDescription") _list path;
     event_metadata =
       option_of_yojson (value_for_key event_metadata_of_yojson "eventMetadata") _list path;
   }
    : event_details)

let describe_event_details_successful_set_of_yojson tree path =
  list_of_yojson event_details_of_yojson tree path

let describe_event_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     successful_set =
       option_of_yojson
         (value_for_key describe_event_details_successful_set_of_yojson "successfulSet")
         _list path;
     failed_set =
       option_of_yojson
         (value_for_key describe_event_details_failed_set_of_yojson "failedSet")
         _list path;
   }
    : describe_event_details_response)

let describe_event_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arns = value_for_key event_arn_list_of_yojson "eventArns" _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
   }
    : describe_event_details_request)

let count_of_yojson = int_of_yojson
let aggregate_value_of_yojson = string_of_yojson

let event_aggregate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregate_value =
       option_of_yojson (value_for_key aggregate_value_of_yojson "aggregateValue") _list path;
     count = option_of_yojson (value_for_key count_of_yojson "count") _list path;
   }
    : event_aggregate)

let event_aggregate_list_of_yojson tree path = list_of_yojson event_aggregate_of_yojson tree path

let describe_event_aggregates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_aggregates =
       option_of_yojson (value_for_key event_aggregate_list_of_yojson "eventAggregates") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_event_aggregates_response)

let event_aggregate_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "eventTypeCategory" -> EventTypeCategory
    | `String value -> raise (deserialize_unknown_enum_value_error path "eventAggregateField" value)
    | _ -> raise (deserialize_wrong_type_error path "eventAggregateField")
     : event_aggregate_field)
    : event_aggregate_field)

let describe_event_aggregates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key event_filter_of_yojson "filter") _list path;
     aggregate_field = value_for_key event_aggregate_field_of_yojson "aggregateField" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_event_aggregates_request)

let entity_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPAIRED" -> IMPAIRED
    | `String "UNIMPAIRED" -> UNIMPAIRED
    | `String "UNKNOWN" -> UNKNOWN
    | `String "PENDING" -> PENDING
    | `String "RESOLVED" -> RESOLVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "entityStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "entityStatusCode")
     : entity_status_code)
    : entity_status_code)

let entity_statuses_of_yojson tree path =
  map_of_yojson entity_status_code_of_yojson count_of_yojson tree path

let account_entity_aggregate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key event_arn_of_yojson "accountId") _list path;
     count = option_of_yojson (value_for_key count_of_yojson "count") _list path;
     statuses = option_of_yojson (value_for_key entity_statuses_of_yojson "statuses") _list path;
   }
    : account_entity_aggregate)

let account_entity_aggregates_list_of_yojson tree path =
  list_of_yojson account_entity_aggregate_of_yojson tree path

let organization_entity_aggregate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     count = option_of_yojson (value_for_key count_of_yojson "count") _list path;
     statuses = option_of_yojson (value_for_key entity_statuses_of_yojson "statuses") _list path;
     accounts =
       option_of_yojson
         (value_for_key account_entity_aggregates_list_of_yojson "accounts")
         _list path;
   }
    : organization_entity_aggregate)

let organization_entity_aggregates_list_of_yojson tree path =
  list_of_yojson organization_entity_aggregate_of_yojson tree path

let describe_entity_aggregates_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_entity_aggregates =
       option_of_yojson
         (value_for_key organization_entity_aggregates_list_of_yojson "organizationEntityAggregates")
         _list path;
   }
    : describe_entity_aggregates_for_organization_response)

let organization_account_ids_list_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path

let organization_event_arns_list_of_yojson tree path = list_of_yojson event_arn_of_yojson tree path

let describe_entity_aggregates_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arns = value_for_key organization_event_arns_list_of_yojson "eventArns" _list path;
     aws_account_ids =
       option_of_yojson
         (value_for_key organization_account_ids_list_of_yojson "awsAccountIds")
         _list path;
   }
    : describe_entity_aggregates_for_organization_request)

let entity_aggregate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     count = option_of_yojson (value_for_key count_of_yojson "count") _list path;
     statuses = option_of_yojson (value_for_key entity_statuses_of_yojson "statuses") _list path;
   }
    : entity_aggregate)

let entity_aggregate_list_of_yojson tree path = list_of_yojson entity_aggregate_of_yojson tree path

let describe_entity_aggregates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_aggregates =
       option_of_yojson
         (value_for_key entity_aggregate_list_of_yojson "entityAggregates")
         _list path;
   }
    : describe_entity_aggregates_response)

let event_arns_list_of_yojson tree path = list_of_yojson event_arn_of_yojson tree path

let describe_entity_aggregates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arns = option_of_yojson (value_for_key event_arns_list_of_yojson "eventArns") _list path;
   }
    : describe_entity_aggregates_request)

let organization_affected_entities_error_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     error_name = option_of_yojson (value_for_key string__of_yojson "errorName") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
   }
    : organization_affected_entities_error_item)

let describe_affected_entities_for_organization_failed_set_of_yojson tree path =
  list_of_yojson organization_affected_entities_error_item_of_yojson tree path

let entity_metadata_value_of_yojson = string_of_yojson
let entity_metadata_key_of_yojson = string_of_yojson

let entity_metadata_of_yojson tree path =
  map_of_yojson entity_metadata_key_of_yojson entity_metadata_value_of_yojson tree path

let entity_url_of_yojson = string_of_yojson

let affected_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_arn = option_of_yojson (value_for_key entity_arn_of_yojson "entityArn") _list path;
     event_arn = option_of_yojson (value_for_key event_arn_of_yojson "eventArn") _list path;
     entity_value = option_of_yojson (value_for_key entity_value_of_yojson "entityValue") _list path;
     entity_url = option_of_yojson (value_for_key entity_url_of_yojson "entityUrl") _list path;
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     status_code =
       option_of_yojson (value_for_key entity_status_code_of_yojson "statusCode") _list path;
     tags = option_of_yojson (value_for_key tag_set_of_yojson "tags") _list path;
     entity_metadata =
       option_of_yojson (value_for_key entity_metadata_of_yojson "entityMetadata") _list path;
   }
    : affected_entity)

let entity_list_of_yojson tree path = list_of_yojson affected_entity_of_yojson tree path

let describe_affected_entities_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key entity_list_of_yojson "entities") _list path;
     failed_set =
       option_of_yojson
         (value_for_key describe_affected_entities_for_organization_failed_set_of_yojson "failedSet")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_affected_entities_for_organization_response)

let entity_status_code_list_of_yojson tree path =
  list_of_yojson entity_status_code_of_yojson tree path

let entity_account_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = value_for_key event_arn_of_yojson "eventArn" _list path;
     aws_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "awsAccountId") _list path;
     status_codes =
       option_of_yojson (value_for_key entity_status_code_list_of_yojson "statusCodes") _list path;
   }
    : entity_account_filter)

let organization_entity_account_filters_list_of_yojson tree path =
  list_of_yojson entity_account_filter_of_yojson tree path

let organization_entity_filters_list_of_yojson tree path =
  list_of_yojson event_account_filter_of_yojson tree path

let describe_affected_entities_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_entity_filters =
       option_of_yojson
         (value_for_key organization_entity_filters_list_of_yojson "organizationEntityFilters")
         _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_lower_range_of_yojson "maxResults") _list path;
     organization_entity_account_filters =
       option_of_yojson
         (value_for_key organization_entity_account_filters_list_of_yojson
            "organizationEntityAccountFilters")
         _list path;
   }
    : describe_affected_entities_for_organization_request)

let describe_affected_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key entity_list_of_yojson "entities") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_affected_entities_response)

let entity_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arns = value_for_key event_arn_list_of_yojson "eventArns" _list path;
     entity_arns =
       option_of_yojson (value_for_key entity_arn_list_of_yojson "entityArns") _list path;
     entity_values =
       option_of_yojson (value_for_key entity_value_list_of_yojson "entityValues") _list path;
     last_updated_times =
       option_of_yojson (value_for_key date_time_range_list_of_yojson "lastUpdatedTimes") _list path;
     tags = option_of_yojson (value_for_key tag_filter_of_yojson "tags") _list path;
     status_codes =
       option_of_yojson (value_for_key entity_status_code_list_of_yojson "statusCodes") _list path;
   }
    : entity_filter)

let describe_affected_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = value_for_key entity_filter_of_yojson "filter" _list path;
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_lower_range_of_yojson "maxResults") _list path;
   }
    : describe_affected_entities_request)

let affected_accounts_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let describe_affected_accounts_for_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     affected_accounts =
       option_of_yojson
         (value_for_key affected_accounts_list_of_yojson "affectedAccounts")
         _list path;
     event_scope_code =
       option_of_yojson (value_for_key event_scope_code_of_yojson "eventScopeCode") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_affected_accounts_for_organization_response)

let describe_affected_accounts_for_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_arn = value_for_key event_arn_of_yojson "eventArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : describe_affected_accounts_for_organization_request)
