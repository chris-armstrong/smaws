open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_set_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_filter_to_yojson tree = list_to_yojson tag_set_to_yojson tree
let string__to_yojson = string_to_yojson
let service_to_yojson = string_to_yojson
let service_list_to_yojson tree = list_to_yojson service_to_yojson tree
let region_to_yojson = string_to_yojson
let region_list_to_yojson tree = list_to_yojson region_to_yojson tree
let next_token_to_yojson = string_to_yojson
let metadata_value_to_yojson = string_to_yojson
let metadata_key_to_yojson = string_to_yojson
let max_results_lower_range_to_yojson = int_to_yojson
let max_results_to_yojson = int_to_yojson
let locale_to_yojson = string_to_yojson
let health_service_access_status_for_organization_to_yojson = string_to_yojson
let event_type2_to_yojson = string_to_yojson
let event_type_list2_to_yojson tree = list_to_yojson event_type2_to_yojson tree
let event_type_code_to_yojson = string_to_yojson

let event_type_category_to_yojson (x : event_type_category) =
  match x with
  | INVESTIGATION -> `String "investigation"
  | SCHEDULED_CHANGE -> `String "scheduledChange"
  | ACCOUNT_NOTIFICATION -> `String "accountNotification"
  | ISSUE -> `String "issue"

let event_type_category_list2_to_yojson tree = list_to_yojson event_type_category_to_yojson tree

let event_status_code_to_yojson (x : event_status_code) =
  match x with
  | UPCOMING -> `String "upcoming"
  | CLOSED -> `String "closed"
  | OPEN -> `String "open"

let event_status_code_list_to_yojson tree = list_to_yojson event_status_code_to_yojson tree

let event_scope_code_to_yojson (x : event_scope_code) =
  match x with
  | NONE -> `String "NONE"
  | ACCOUNT_SPECIFIC -> `String "ACCOUNT_SPECIFIC"
  | PUBLIC -> `String "PUBLIC"

let event_metadata_to_yojson tree =
  map_to_yojson metadata_key_to_yojson metadata_value_to_yojson tree

let event_arn_to_yojson = string_to_yojson
let event_arn_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let event_aggregate_field_to_yojson (x : event_aggregate_field) =
  match x with EventTypeCategory -> `String "eventTypeCategory"

let entity_value_to_yojson = string_to_yojson
let entity_value_list_to_yojson tree = list_to_yojson entity_value_to_yojson tree
let entity_url_to_yojson = string_to_yojson
let count_to_yojson = int_to_yojson

let entity_status_code_to_yojson (x : entity_status_code) =
  match x with
  | RESOLVED -> `String "RESOLVED"
  | PENDING -> `String "PENDING"
  | UNKNOWN -> `String "UNKNOWN"
  | UNIMPAIRED -> `String "UNIMPAIRED"
  | IMPAIRED -> `String "IMPAIRED"

let entity_statuses_to_yojson tree = map_to_yojson entity_status_code_to_yojson count_to_yojson tree
let entity_status_code_list_to_yojson tree = list_to_yojson entity_status_code_to_yojson tree
let entity_metadata_value_to_yojson = string_to_yojson
let entity_metadata_key_to_yojson = string_to_yojson

let entity_metadata_to_yojson tree =
  map_to_yojson entity_metadata_key_to_yojson entity_metadata_value_to_yojson tree

let entity_arn_to_yojson = string_to_yojson
let entity_arn_list_to_yojson tree = list_to_yojson entity_arn_to_yojson tree

let date_time_range_to_yojson (x : date_time_range) =
  assoc_to_yojson
    [
      ("to", option_to_yojson timestamp_to_yojson x.to_);
      ("from", option_to_yojson timestamp_to_yojson x.from_);
    ]

let date_time_range_list_to_yojson tree = list_to_yojson date_time_range_to_yojson tree
let account_id_to_yojson = string_to_yojson
let aws_account_ids_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let availability_zone_to_yojson = string_to_yojson
let availability_zones_to_yojson tree = list_to_yojson availability_zone_to_yojson tree
let aggregate_value_to_yojson = string_to_yojson
let affected_accounts_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let unsupported_locale_to_yojson (x : unsupported_locale) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let event_actionability_to_yojson (x : event_actionability) =
  match x with
  | INFORMATIONAL -> `String "INFORMATIONAL"
  | ACTION_MAY_BE_REQUIRED -> `String "ACTION_MAY_BE_REQUIRED"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"

let event_persona_to_yojson (x : event_persona) =
  match x with
  | BILLING -> `String "BILLING"
  | SECURITY -> `String "SECURITY"
  | OPERATIONS -> `String "OPERATIONS"

let event_persona_list_to_yojson tree = list_to_yojson event_persona_to_yojson tree

let organization_event_to_yojson (x : organization_event) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
      ("actionability", option_to_yojson event_actionability_to_yojson x.actionability);
      ("statusCode", option_to_yojson event_status_code_to_yojson x.status_code);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("region", option_to_yojson region_to_yojson x.region);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("eventTypeCategory", option_to_yojson event_type_category_to_yojson x.event_type_category);
      ("eventTypeCode", option_to_yojson event_type_code_to_yojson x.event_type_code);
      ("service", option_to_yojson service_to_yojson x.service);
      ("arn", option_to_yojson event_arn_to_yojson x.arn);
    ]

let organization_event_list_to_yojson tree = list_to_yojson organization_event_to_yojson tree
let event_actionability_list_to_yojson tree = list_to_yojson event_actionability_to_yojson tree

let organization_event_filter_to_yojson (x : organization_event_filter) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
      ("eventStatusCodes", option_to_yojson event_status_code_list_to_yojson x.event_status_codes);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list2_to_yojson x.event_type_categories );
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("lastUpdatedTime", option_to_yojson date_time_range_to_yojson x.last_updated_time);
      ("endTime", option_to_yojson date_time_range_to_yojson x.end_time);
      ("startTime", option_to_yojson date_time_range_to_yojson x.start_time);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("services", option_to_yojson service_list_to_yojson x.services);
      ("awsAccountIds", option_to_yojson aws_account_ids_list_to_yojson x.aws_account_ids);
      ("eventTypeCodes", option_to_yojson event_type_list2_to_yojson x.event_type_codes);
      ("actionabilities", option_to_yojson event_actionability_list_to_yojson x.actionabilities);
    ]

let organization_event_details_error_item_to_yojson (x : organization_event_details_error_item) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
    ]

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
      ("actionability", option_to_yojson event_actionability_to_yojson x.actionability);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("statusCode", option_to_yojson event_status_code_to_yojson x.status_code);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("region", option_to_yojson region_to_yojson x.region);
      ("eventTypeCategory", option_to_yojson event_type_category_to_yojson x.event_type_category);
      ("eventTypeCode", option_to_yojson event_type_code_to_yojson x.event_type_code);
      ("service", option_to_yojson service_to_yojson x.service);
      ("arn", option_to_yojson event_arn_to_yojson x.arn);
    ]

let event_description2_to_yojson = string_to_yojson

let event_description_to_yojson (x : event_description) =
  assoc_to_yojson
    [ ("latestDescription", option_to_yojson event_description2_to_yojson x.latest_description) ]

let organization_event_details_to_yojson (x : organization_event_details) =
  assoc_to_yojson
    [
      ("eventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata);
      ("eventDescription", option_to_yojson event_description_to_yojson x.event_description);
      ("event", option_to_yojson event_to_yojson x.event);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
    ]

let event_account_filter_to_yojson (x : event_account_filter) =
  assoc_to_yojson
    [
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
    ]

let organization_event_detail_filters_list_to_yojson tree =
  list_to_yojson event_account_filter_to_yojson tree

let organization_event_arns_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let organization_entity_filters_list_to_yojson tree =
  list_to_yojson event_account_filter_to_yojson tree

let account_entity_aggregate_to_yojson (x : account_entity_aggregate) =
  assoc_to_yojson
    [
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
      ("count", option_to_yojson count_to_yojson x.count);
      ("accountId", option_to_yojson event_arn_to_yojson x.account_id);
    ]

let account_entity_aggregates_list_to_yojson tree =
  list_to_yojson account_entity_aggregate_to_yojson tree

let organization_entity_aggregate_to_yojson (x : organization_entity_aggregate) =
  assoc_to_yojson
    [
      ("accounts", option_to_yojson account_entity_aggregates_list_to_yojson x.accounts);
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
      ("count", option_to_yojson count_to_yojson x.count);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
    ]

let organization_entity_aggregates_list_to_yojson tree =
  list_to_yojson organization_entity_aggregate_to_yojson tree

let entity_account_filter_to_yojson (x : entity_account_filter) =
  assoc_to_yojson
    [
      ("statusCodes", option_to_yojson entity_status_code_list_to_yojson x.status_codes);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
    ]

let organization_entity_account_filters_list_to_yojson tree =
  list_to_yojson entity_account_filter_to_yojson tree

let organization_affected_entities_error_item_to_yojson
    (x : organization_affected_entities_error_item) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
    ]

let organization_account_ids_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let invalid_pagination_token_to_yojson (x : invalid_pagination_token) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let event_type_persona_to_yojson (x : event_type_persona) =
  match x with
  | BILLING -> `String "BILLING"
  | SECURITY -> `String "SECURITY"
  | OPERATIONS -> `String "OPERATIONS"

let event_type_persona_list_to_yojson tree = list_to_yojson event_type_persona_to_yojson tree

let event_type_actionability_to_yojson (x : event_type_actionability) =
  match x with
  | INFORMATIONAL -> `String "INFORMATIONAL"
  | ACTION_MAY_BE_REQUIRED -> `String "ACTION_MAY_BE_REQUIRED"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"

let event_type_to_yojson (x : event_type) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_type_persona_list_to_yojson x.personas);
      ("actionability", option_to_yojson event_type_actionability_to_yojson x.actionability);
      ("category", option_to_yojson event_type_category_to_yojson x.category);
      ("code", option_to_yojson event_type_code_to_yojson x.code);
      ("service", option_to_yojson service_to_yojson x.service);
    ]

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree
let event_type_code_list_to_yojson tree = list_to_yojson event_type_code_to_yojson tree
let event_type_category_list_to_yojson tree = list_to_yojson event_type_category_to_yojson tree

let event_type_actionability_list_to_yojson tree =
  list_to_yojson event_type_actionability_to_yojson tree

let event_type_filter_to_yojson (x : event_type_filter) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_type_persona_list_to_yojson x.personas);
      ("actionabilities", option_to_yojson event_type_actionability_list_to_yojson x.actionabilities);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list_to_yojson x.event_type_categories );
      ("services", option_to_yojson service_list_to_yojson x.services);
      ("eventTypeCodes", option_to_yojson event_type_code_list_to_yojson x.event_type_codes);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let event_filter_to_yojson (x : event_filter) =
  assoc_to_yojson
    [
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
      ("eventStatusCodes", option_to_yojson event_status_code_list_to_yojson x.event_status_codes);
      ("tags", option_to_yojson tag_filter_to_yojson x.tags);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list2_to_yojson x.event_type_categories );
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("lastUpdatedTimes", option_to_yojson date_time_range_list_to_yojson x.last_updated_times);
      ("endTimes", option_to_yojson date_time_range_list_to_yojson x.end_times);
      ("startTimes", option_to_yojson date_time_range_list_to_yojson x.start_times);
      ("availabilityZones", option_to_yojson availability_zones_to_yojson x.availability_zones);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("services", option_to_yojson service_list_to_yojson x.services);
      ("eventTypeCodes", option_to_yojson event_type_list2_to_yojson x.event_type_codes);
      ("eventArns", option_to_yojson event_arn_list_to_yojson x.event_arns);
      ("actionabilities", option_to_yojson event_actionability_list_to_yojson x.actionabilities);
    ]

let event_details_error_item_to_yojson (x : event_details_error_item) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
    ]

let event_details_to_yojson (x : event_details) =
  assoc_to_yojson
    [
      ("eventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata);
      ("eventDescription", option_to_yojson event_description_to_yojson x.event_description);
      ("event", option_to_yojson event_to_yojson x.event);
    ]

let event_arns_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let event_aggregate_to_yojson (x : event_aggregate) =
  assoc_to_yojson
    [
      ("count", option_to_yojson count_to_yojson x.count);
      ("aggregateValue", option_to_yojson aggregate_value_to_yojson x.aggregate_value);
    ]

let event_aggregate_list_to_yojson tree = list_to_yojson event_aggregate_to_yojson tree

let affected_entity_to_yojson (x : affected_entity) =
  assoc_to_yojson
    [
      ("entityMetadata", option_to_yojson entity_metadata_to_yojson x.entity_metadata);
      ("tags", option_to_yojson tag_set_to_yojson x.tags);
      ("statusCode", option_to_yojson entity_status_code_to_yojson x.status_code);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("entityUrl", option_to_yojson entity_url_to_yojson x.entity_url);
      ("entityValue", option_to_yojson entity_value_to_yojson x.entity_value);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("entityArn", option_to_yojson entity_arn_to_yojson x.entity_arn);
    ]

let entity_list_to_yojson tree = list_to_yojson affected_entity_to_yojson tree

let entity_filter_to_yojson (x : entity_filter) =
  assoc_to_yojson
    [
      ("statusCodes", option_to_yojson entity_status_code_list_to_yojson x.status_codes);
      ("tags", option_to_yojson tag_filter_to_yojson x.tags);
      ("lastUpdatedTimes", option_to_yojson date_time_range_list_to_yojson x.last_updated_times);
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("eventArns", Some (event_arn_list_to_yojson x.event_arns));
    ]

let entity_aggregate_to_yojson (x : entity_aggregate) =
  assoc_to_yojson
    [
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
      ("count", option_to_yojson count_to_yojson x.count);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
    ]

let entity_aggregate_list_to_yojson tree = list_to_yojson entity_aggregate_to_yojson tree

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let describe_health_service_status_for_organization_response_to_yojson
    (x : describe_health_service_status_for_organization_response) =
  assoc_to_yojson
    [
      ( "healthServiceAccessStatusForOrganization",
        option_to_yojson health_service_access_status_for_organization_to_yojson
          x.health_service_access_status_for_organization );
    ]

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("events", option_to_yojson event_list_to_yojson x.events);
    ]

let describe_events_request_to_yojson (x : describe_events_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filter", option_to_yojson event_filter_to_yojson x.filter);
    ]

let describe_events_for_organization_response_to_yojson
    (x : describe_events_for_organization_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("events", option_to_yojson organization_event_list_to_yojson x.events);
    ]

let describe_events_for_organization_request_to_yojson
    (x : describe_events_for_organization_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filter", option_to_yojson organization_event_filter_to_yojson x.filter);
    ]

let describe_event_types_response_to_yojson (x : describe_event_types_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("eventTypes", option_to_yojson event_type_list_to_yojson x.event_types);
    ]

let describe_event_types_request_to_yojson (x : describe_event_types_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("filter", option_to_yojson event_type_filter_to_yojson x.filter);
    ]

let describe_event_details_successful_set_to_yojson tree =
  list_to_yojson event_details_to_yojson tree

let describe_event_details_failed_set_to_yojson tree =
  list_to_yojson event_details_error_item_to_yojson tree

let describe_event_details_response_to_yojson (x : describe_event_details_response) =
  assoc_to_yojson
    [
      ("failedSet", option_to_yojson describe_event_details_failed_set_to_yojson x.failed_set);
      ( "successfulSet",
        option_to_yojson describe_event_details_successful_set_to_yojson x.successful_set );
    ]

let describe_event_details_request_to_yojson (x : describe_event_details_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("eventArns", Some (event_arn_list_to_yojson x.event_arns));
    ]

let describe_event_details_for_organization_successful_set_to_yojson tree =
  list_to_yojson organization_event_details_to_yojson tree

let describe_event_details_for_organization_failed_set_to_yojson tree =
  list_to_yojson organization_event_details_error_item_to_yojson tree

let describe_event_details_for_organization_response_to_yojson
    (x : describe_event_details_for_organization_response) =
  assoc_to_yojson
    [
      ( "failedSet",
        option_to_yojson describe_event_details_for_organization_failed_set_to_yojson x.failed_set
      );
      ( "successfulSet",
        option_to_yojson describe_event_details_for_organization_successful_set_to_yojson
          x.successful_set );
    ]

let describe_event_details_for_organization_request_to_yojson
    (x : describe_event_details_for_organization_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ( "organizationEventDetailFilters",
        Some (organization_event_detail_filters_list_to_yojson x.organization_event_detail_filters)
      );
    ]

let describe_event_aggregates_response_to_yojson (x : describe_event_aggregates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("eventAggregates", option_to_yojson event_aggregate_list_to_yojson x.event_aggregates);
    ]

let describe_event_aggregates_request_to_yojson (x : describe_event_aggregates_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("aggregateField", Some (event_aggregate_field_to_yojson x.aggregate_field));
      ("filter", option_to_yojson event_filter_to_yojson x.filter);
    ]

let describe_entity_aggregates_response_to_yojson (x : describe_entity_aggregates_response) =
  assoc_to_yojson
    [ ("entityAggregates", option_to_yojson entity_aggregate_list_to_yojson x.entity_aggregates) ]

let describe_entity_aggregates_request_to_yojson (x : describe_entity_aggregates_request) =
  assoc_to_yojson [ ("eventArns", option_to_yojson event_arns_list_to_yojson x.event_arns) ]

let describe_entity_aggregates_for_organization_response_to_yojson
    (x : describe_entity_aggregates_for_organization_response) =
  assoc_to_yojson
    [
      ( "organizationEntityAggregates",
        option_to_yojson organization_entity_aggregates_list_to_yojson
          x.organization_entity_aggregates );
    ]

let describe_entity_aggregates_for_organization_request_to_yojson
    (x : describe_entity_aggregates_for_organization_request) =
  assoc_to_yojson
    [
      ("awsAccountIds", option_to_yojson organization_account_ids_list_to_yojson x.aws_account_ids);
      ("eventArns", Some (organization_event_arns_list_to_yojson x.event_arns));
    ]

let describe_affected_entities_response_to_yojson (x : describe_affected_entities_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("entities", option_to_yojson entity_list_to_yojson x.entities);
    ]

let describe_affected_entities_request_to_yojson (x : describe_affected_entities_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("filter", Some (entity_filter_to_yojson x.filter));
    ]

let describe_affected_entities_for_organization_failed_set_to_yojson tree =
  list_to_yojson organization_affected_entities_error_item_to_yojson tree

let describe_affected_entities_for_organization_response_to_yojson
    (x : describe_affected_entities_for_organization_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "failedSet",
        option_to_yojson describe_affected_entities_for_organization_failed_set_to_yojson
          x.failed_set );
      ("entities", option_to_yojson entity_list_to_yojson x.entities);
    ]

let describe_affected_entities_for_organization_request_to_yojson
    (x : describe_affected_entities_for_organization_request) =
  assoc_to_yojson
    [
      ( "organizationEntityAccountFilters",
        option_to_yojson organization_entity_account_filters_list_to_yojson
          x.organization_entity_account_filters );
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ( "organizationEntityFilters",
        option_to_yojson organization_entity_filters_list_to_yojson x.organization_entity_filters );
    ]

let describe_affected_accounts_for_organization_response_to_yojson
    (x : describe_affected_accounts_for_organization_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("affectedAccounts", option_to_yojson affected_accounts_list_to_yojson x.affected_accounts);
    ]

let describe_affected_accounts_for_organization_request_to_yojson
    (x : describe_affected_accounts_for_organization_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
    ]
