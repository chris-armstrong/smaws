open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let health_service_access_status_for_organization_to_yojson = string_to_yojson

let describe_health_service_status_for_organization_response_to_yojson
    (x : describe_health_service_status_for_organization_response) =
  assoc_to_yojson
    [
      ( "healthServiceAccessStatusForOrganization",
        option_to_yojson health_service_access_status_for_organization_to_yojson
          x.health_service_access_status_for_organization );
    ]

let unsupported_locale_to_yojson (x : unsupported_locale) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let invalid_pagination_token_to_yojson (x : invalid_pagination_token) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson

let event_type_persona_to_yojson (x : event_type_persona) =
  match x with
  | OPERATIONS -> `String "OPERATIONS"
  | SECURITY -> `String "SECURITY"
  | BILLING -> `String "BILLING"

let event_type_persona_list_to_yojson tree = list_to_yojson event_type_persona_to_yojson tree

let event_type_actionability_to_yojson (x : event_type_actionability) =
  match x with
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | ACTION_MAY_BE_REQUIRED -> `String "ACTION_MAY_BE_REQUIRED"
  | INFORMATIONAL -> `String "INFORMATIONAL"

let event_type_category_to_yojson (x : event_type_category) =
  match x with
  | ISSUE -> `String "issue"
  | ACCOUNT_NOTIFICATION -> `String "accountNotification"
  | SCHEDULED_CHANGE -> `String "scheduledChange"
  | INVESTIGATION -> `String "investigation"

let event_type_code_to_yojson = string_to_yojson
let service_to_yojson = string_to_yojson

let event_type_to_yojson (x : event_type) =
  assoc_to_yojson
    [
      ("service", option_to_yojson service_to_yojson x.service);
      ("code", option_to_yojson event_type_code_to_yojson x.code);
      ("category", option_to_yojson event_type_category_to_yojson x.category);
      ("actionability", option_to_yojson event_type_actionability_to_yojson x.actionability);
      ("personas", option_to_yojson event_type_persona_list_to_yojson x.personas);
    ]

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree

let describe_event_types_response_to_yojson (x : describe_event_types_response) =
  assoc_to_yojson
    [
      ("eventTypes", option_to_yojson event_type_list_to_yojson x.event_types);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let locale_to_yojson = string_to_yojson

let event_type_actionability_list_to_yojson tree =
  list_to_yojson event_type_actionability_to_yojson tree

let event_type_category_list_to_yojson tree = list_to_yojson event_type_category_to_yojson tree
let service_list_to_yojson tree = list_to_yojson service_to_yojson tree
let event_type_code_list_to_yojson tree = list_to_yojson event_type_code_to_yojson tree

let event_type_filter_to_yojson (x : event_type_filter) =
  assoc_to_yojson
    [
      ("eventTypeCodes", option_to_yojson event_type_code_list_to_yojson x.event_type_codes);
      ("services", option_to_yojson service_list_to_yojson x.services);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list_to_yojson x.event_type_categories );
      ("actionabilities", option_to_yojson event_type_actionability_list_to_yojson x.actionabilities);
      ("personas", option_to_yojson event_type_persona_list_to_yojson x.personas);
    ]

let describe_event_types_request_to_yojson (x : describe_event_types_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson event_type_filter_to_yojson x.filter);
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let event_persona_to_yojson (x : event_persona) =
  match x with
  | OPERATIONS -> `String "OPERATIONS"
  | SECURITY -> `String "SECURITY"
  | BILLING -> `String "BILLING"

let event_persona_list_to_yojson tree = list_to_yojson event_persona_to_yojson tree

let event_actionability_to_yojson (x : event_actionability) =
  match x with
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | ACTION_MAY_BE_REQUIRED -> `String "ACTION_MAY_BE_REQUIRED"
  | INFORMATIONAL -> `String "INFORMATIONAL"

let event_status_code_to_yojson (x : event_status_code) =
  match x with
  | OPEN -> `String "open"
  | CLOSED -> `String "closed"
  | UPCOMING -> `String "upcoming"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let region_to_yojson = string_to_yojson

let event_scope_code_to_yojson (x : event_scope_code) =
  match x with
  | PUBLIC -> `String "PUBLIC"
  | ACCOUNT_SPECIFIC -> `String "ACCOUNT_SPECIFIC"
  | NONE -> `String "NONE"

let event_arn_to_yojson = string_to_yojson

let organization_event_to_yojson (x : organization_event) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson event_arn_to_yojson x.arn);
      ("service", option_to_yojson service_to_yojson x.service);
      ("eventTypeCode", option_to_yojson event_type_code_to_yojson x.event_type_code);
      ("eventTypeCategory", option_to_yojson event_type_category_to_yojson x.event_type_category);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("region", option_to_yojson region_to_yojson x.region);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("statusCode", option_to_yojson event_status_code_to_yojson x.status_code);
      ("actionability", option_to_yojson event_actionability_to_yojson x.actionability);
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
    ]

let organization_event_list_to_yojson tree = list_to_yojson organization_event_to_yojson tree

let describe_events_for_organization_response_to_yojson
    (x : describe_events_for_organization_response) =
  assoc_to_yojson
    [
      ("events", option_to_yojson organization_event_list_to_yojson x.events);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_lower_range_to_yojson = int_to_yojson
let event_status_code_list_to_yojson tree = list_to_yojson event_status_code_to_yojson tree
let event_type_category_list2_to_yojson tree = list_to_yojson event_type_category_to_yojson tree
let entity_value_to_yojson = string_to_yojson
let entity_value_list_to_yojson tree = list_to_yojson entity_value_to_yojson tree
let entity_arn_to_yojson = string_to_yojson
let entity_arn_list_to_yojson tree = list_to_yojson entity_arn_to_yojson tree

let date_time_range_to_yojson (x : date_time_range) =
  assoc_to_yojson
    [
      ("from", option_to_yojson timestamp_to_yojson x.from_);
      ("to", option_to_yojson timestamp_to_yojson x.to_);
    ]

let region_list_to_yojson tree = list_to_yojson region_to_yojson tree
let account_id_to_yojson = string_to_yojson
let aws_account_ids_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let event_type2_to_yojson = string_to_yojson
let event_type_list2_to_yojson tree = list_to_yojson event_type2_to_yojson tree
let event_actionability_list_to_yojson tree = list_to_yojson event_actionability_to_yojson tree

let organization_event_filter_to_yojson (x : organization_event_filter) =
  assoc_to_yojson
    [
      ("actionabilities", option_to_yojson event_actionability_list_to_yojson x.actionabilities);
      ("eventTypeCodes", option_to_yojson event_type_list2_to_yojson x.event_type_codes);
      ("awsAccountIds", option_to_yojson aws_account_ids_list_to_yojson x.aws_account_ids);
      ("services", option_to_yojson service_list_to_yojson x.services);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("startTime", option_to_yojson date_time_range_to_yojson x.start_time);
      ("endTime", option_to_yojson date_time_range_to_yojson x.end_time);
      ("lastUpdatedTime", option_to_yojson date_time_range_to_yojson x.last_updated_time);
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list2_to_yojson x.event_type_categories );
      ("eventStatusCodes", option_to_yojson event_status_code_list_to_yojson x.event_status_codes);
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
    ]

let describe_events_for_organization_request_to_yojson
    (x : describe_events_for_organization_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson organization_event_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let availability_zone_to_yojson = string_to_yojson

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson event_arn_to_yojson x.arn);
      ("service", option_to_yojson service_to_yojson x.service);
      ("eventTypeCode", option_to_yojson event_type_code_to_yojson x.event_type_code);
      ("eventTypeCategory", option_to_yojson event_type_category_to_yojson x.event_type_category);
      ("region", option_to_yojson region_to_yojson x.region);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("statusCode", option_to_yojson event_status_code_to_yojson x.status_code);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("actionability", option_to_yojson event_actionability_to_yojson x.actionability);
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
    ]

let event_list_to_yojson tree = list_to_yojson event_to_yojson tree

let describe_events_response_to_yojson (x : describe_events_response) =
  assoc_to_yojson
    [
      ("events", option_to_yojson event_list_to_yojson x.events);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_set_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_filter_to_yojson tree = list_to_yojson tag_set_to_yojson tree
let date_time_range_list_to_yojson tree = list_to_yojson date_time_range_to_yojson tree
let availability_zones_to_yojson tree = list_to_yojson availability_zone_to_yojson tree
let event_arn_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let event_filter_to_yojson (x : event_filter) =
  assoc_to_yojson
    [
      ("actionabilities", option_to_yojson event_actionability_list_to_yojson x.actionabilities);
      ("eventArns", option_to_yojson event_arn_list_to_yojson x.event_arns);
      ("eventTypeCodes", option_to_yojson event_type_list2_to_yojson x.event_type_codes);
      ("services", option_to_yojson service_list_to_yojson x.services);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("availabilityZones", option_to_yojson availability_zones_to_yojson x.availability_zones);
      ("startTimes", option_to_yojson date_time_range_list_to_yojson x.start_times);
      ("endTimes", option_to_yojson date_time_range_list_to_yojson x.end_times);
      ("lastUpdatedTimes", option_to_yojson date_time_range_list_to_yojson x.last_updated_times);
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ( "eventTypeCategories",
        option_to_yojson event_type_category_list2_to_yojson x.event_type_categories );
      ("tags", option_to_yojson tag_filter_to_yojson x.tags);
      ("eventStatusCodes", option_to_yojson event_status_code_list_to_yojson x.event_status_codes);
      ("personas", option_to_yojson event_persona_list_to_yojson x.personas);
    ]

let describe_events_request_to_yojson (x : describe_events_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson event_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let organization_event_details_error_item_to_yojson (x : organization_event_details_error_item) =
  assoc_to_yojson
    [
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let describe_event_details_for_organization_failed_set_to_yojson tree =
  list_to_yojson organization_event_details_error_item_to_yojson tree

let metadata_value_to_yojson = string_to_yojson
let metadata_key_to_yojson = string_to_yojson

let event_metadata_to_yojson tree =
  map_to_yojson metadata_key_to_yojson metadata_value_to_yojson tree

let event_description2_to_yojson = string_to_yojson

let event_description_to_yojson (x : event_description) =
  assoc_to_yojson
    [ ("latestDescription", option_to_yojson event_description2_to_yojson x.latest_description) ]

let organization_event_details_to_yojson (x : organization_event_details) =
  assoc_to_yojson
    [
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("event", option_to_yojson event_to_yojson x.event);
      ("eventDescription", option_to_yojson event_description_to_yojson x.event_description);
      ("eventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata);
    ]

let describe_event_details_for_organization_successful_set_to_yojson tree =
  list_to_yojson organization_event_details_to_yojson tree

let describe_event_details_for_organization_response_to_yojson
    (x : describe_event_details_for_organization_response) =
  assoc_to_yojson
    [
      ( "successfulSet",
        option_to_yojson describe_event_details_for_organization_successful_set_to_yojson
          x.successful_set );
      ( "failedSet",
        option_to_yojson describe_event_details_for_organization_failed_set_to_yojson x.failed_set
      );
    ]

let event_account_filter_to_yojson (x : event_account_filter) =
  assoc_to_yojson
    [
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
    ]

let organization_event_detail_filters_list_to_yojson tree =
  list_to_yojson event_account_filter_to_yojson tree

let describe_event_details_for_organization_request_to_yojson
    (x : describe_event_details_for_organization_request) =
  assoc_to_yojson
    [
      ( "organizationEventDetailFilters",
        Some (organization_event_detail_filters_list_to_yojson x.organization_event_detail_filters)
      );
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let event_details_error_item_to_yojson (x : event_details_error_item) =
  assoc_to_yojson
    [
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let describe_event_details_failed_set_to_yojson tree =
  list_to_yojson event_details_error_item_to_yojson tree

let event_details_to_yojson (x : event_details) =
  assoc_to_yojson
    [
      ("event", option_to_yojson event_to_yojson x.event);
      ("eventDescription", option_to_yojson event_description_to_yojson x.event_description);
      ("eventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata);
    ]

let describe_event_details_successful_set_to_yojson tree =
  list_to_yojson event_details_to_yojson tree

let describe_event_details_response_to_yojson (x : describe_event_details_response) =
  assoc_to_yojson
    [
      ( "successfulSet",
        option_to_yojson describe_event_details_successful_set_to_yojson x.successful_set );
      ("failedSet", option_to_yojson describe_event_details_failed_set_to_yojson x.failed_set);
    ]

let describe_event_details_request_to_yojson (x : describe_event_details_request) =
  assoc_to_yojson
    [
      ("eventArns", Some (event_arn_list_to_yojson x.event_arns));
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let count_to_yojson = int_to_yojson
let aggregate_value_to_yojson = string_to_yojson

let event_aggregate_to_yojson (x : event_aggregate) =
  assoc_to_yojson
    [
      ("aggregateValue", option_to_yojson aggregate_value_to_yojson x.aggregate_value);
      ("count", option_to_yojson count_to_yojson x.count);
    ]

let event_aggregate_list_to_yojson tree = list_to_yojson event_aggregate_to_yojson tree

let describe_event_aggregates_response_to_yojson (x : describe_event_aggregates_response) =
  assoc_to_yojson
    [
      ("eventAggregates", option_to_yojson event_aggregate_list_to_yojson x.event_aggregates);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let event_aggregate_field_to_yojson (x : event_aggregate_field) =
  match x with EventTypeCategory -> `String "eventTypeCategory"

let describe_event_aggregates_request_to_yojson (x : describe_event_aggregates_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson event_filter_to_yojson x.filter);
      ("aggregateField", Some (event_aggregate_field_to_yojson x.aggregate_field));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let entity_status_code_to_yojson (x : entity_status_code) =
  match x with
  | IMPAIRED -> `String "IMPAIRED"
  | UNIMPAIRED -> `String "UNIMPAIRED"
  | UNKNOWN -> `String "UNKNOWN"
  | PENDING -> `String "PENDING"
  | RESOLVED -> `String "RESOLVED"

let entity_statuses_to_yojson tree = map_to_yojson entity_status_code_to_yojson count_to_yojson tree

let account_entity_aggregate_to_yojson (x : account_entity_aggregate) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson event_arn_to_yojson x.account_id);
      ("count", option_to_yojson count_to_yojson x.count);
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
    ]

let account_entity_aggregates_list_to_yojson tree =
  list_to_yojson account_entity_aggregate_to_yojson tree

let organization_entity_aggregate_to_yojson (x : organization_entity_aggregate) =
  assoc_to_yojson
    [
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("count", option_to_yojson count_to_yojson x.count);
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
      ("accounts", option_to_yojson account_entity_aggregates_list_to_yojson x.accounts);
    ]

let organization_entity_aggregates_list_to_yojson tree =
  list_to_yojson organization_entity_aggregate_to_yojson tree

let describe_entity_aggregates_for_organization_response_to_yojson
    (x : describe_entity_aggregates_for_organization_response) =
  assoc_to_yojson
    [
      ( "organizationEntityAggregates",
        option_to_yojson organization_entity_aggregates_list_to_yojson
          x.organization_entity_aggregates );
    ]

let organization_account_ids_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let organization_event_arns_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let describe_entity_aggregates_for_organization_request_to_yojson
    (x : describe_entity_aggregates_for_organization_request) =
  assoc_to_yojson
    [
      ("eventArns", Some (organization_event_arns_list_to_yojson x.event_arns));
      ("awsAccountIds", option_to_yojson organization_account_ids_list_to_yojson x.aws_account_ids);
    ]

let entity_aggregate_to_yojson (x : entity_aggregate) =
  assoc_to_yojson
    [
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("count", option_to_yojson count_to_yojson x.count);
      ("statuses", option_to_yojson entity_statuses_to_yojson x.statuses);
    ]

let entity_aggregate_list_to_yojson tree = list_to_yojson entity_aggregate_to_yojson tree

let describe_entity_aggregates_response_to_yojson (x : describe_entity_aggregates_response) =
  assoc_to_yojson
    [ ("entityAggregates", option_to_yojson entity_aggregate_list_to_yojson x.entity_aggregates) ]

let event_arns_list_to_yojson tree = list_to_yojson event_arn_to_yojson tree

let describe_entity_aggregates_request_to_yojson (x : describe_entity_aggregates_request) =
  assoc_to_yojson [ ("eventArns", option_to_yojson event_arns_list_to_yojson x.event_arns) ]

let organization_affected_entities_error_item_to_yojson
    (x : organization_affected_entities_error_item) =
  assoc_to_yojson
    [
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("errorName", option_to_yojson string__to_yojson x.error_name);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let describe_affected_entities_for_organization_failed_set_to_yojson tree =
  list_to_yojson organization_affected_entities_error_item_to_yojson tree

let entity_metadata_value_to_yojson = string_to_yojson
let entity_metadata_key_to_yojson = string_to_yojson

let entity_metadata_to_yojson tree =
  map_to_yojson entity_metadata_key_to_yojson entity_metadata_value_to_yojson tree

let entity_url_to_yojson = string_to_yojson

let affected_entity_to_yojson (x : affected_entity) =
  assoc_to_yojson
    [
      ("entityArn", option_to_yojson entity_arn_to_yojson x.entity_arn);
      ("eventArn", option_to_yojson event_arn_to_yojson x.event_arn);
      ("entityValue", option_to_yojson entity_value_to_yojson x.entity_value);
      ("entityUrl", option_to_yojson entity_url_to_yojson x.entity_url);
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("statusCode", option_to_yojson entity_status_code_to_yojson x.status_code);
      ("tags", option_to_yojson tag_set_to_yojson x.tags);
      ("entityMetadata", option_to_yojson entity_metadata_to_yojson x.entity_metadata);
    ]

let entity_list_to_yojson tree = list_to_yojson affected_entity_to_yojson tree

let describe_affected_entities_for_organization_response_to_yojson
    (x : describe_affected_entities_for_organization_response) =
  assoc_to_yojson
    [
      ("entities", option_to_yojson entity_list_to_yojson x.entities);
      ( "failedSet",
        option_to_yojson describe_affected_entities_for_organization_failed_set_to_yojson
          x.failed_set );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let entity_status_code_list_to_yojson tree = list_to_yojson entity_status_code_to_yojson tree

let entity_account_filter_to_yojson (x : entity_account_filter) =
  assoc_to_yojson
    [
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
      ("awsAccountId", option_to_yojson account_id_to_yojson x.aws_account_id);
      ("statusCodes", option_to_yojson entity_status_code_list_to_yojson x.status_codes);
    ]

let organization_entity_account_filters_list_to_yojson tree =
  list_to_yojson entity_account_filter_to_yojson tree

let organization_entity_filters_list_to_yojson tree =
  list_to_yojson event_account_filter_to_yojson tree

let describe_affected_entities_for_organization_request_to_yojson
    (x : describe_affected_entities_for_organization_request) =
  assoc_to_yojson
    [
      ( "organizationEntityFilters",
        option_to_yojson organization_entity_filters_list_to_yojson x.organization_entity_filters );
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
      ( "organizationEntityAccountFilters",
        option_to_yojson organization_entity_account_filters_list_to_yojson
          x.organization_entity_account_filters );
    ]

let describe_affected_entities_response_to_yojson (x : describe_affected_entities_response) =
  assoc_to_yojson
    [
      ("entities", option_to_yojson entity_list_to_yojson x.entities);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let entity_filter_to_yojson (x : entity_filter) =
  assoc_to_yojson
    [
      ("eventArns", Some (event_arn_list_to_yojson x.event_arns));
      ("entityArns", option_to_yojson entity_arn_list_to_yojson x.entity_arns);
      ("entityValues", option_to_yojson entity_value_list_to_yojson x.entity_values);
      ("lastUpdatedTimes", option_to_yojson date_time_range_list_to_yojson x.last_updated_times);
      ("tags", option_to_yojson tag_filter_to_yojson x.tags);
      ("statusCodes", option_to_yojson entity_status_code_list_to_yojson x.status_codes);
    ]

let describe_affected_entities_request_to_yojson (x : describe_affected_entities_request) =
  assoc_to_yojson
    [
      ("filter", Some (entity_filter_to_yojson x.filter));
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_lower_range_to_yojson x.max_results);
    ]

let affected_accounts_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let describe_affected_accounts_for_organization_response_to_yojson
    (x : describe_affected_accounts_for_organization_response) =
  assoc_to_yojson
    [
      ("affectedAccounts", option_to_yojson affected_accounts_list_to_yojson x.affected_accounts);
      ("eventScopeCode", option_to_yojson event_scope_code_to_yojson x.event_scope_code);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_affected_accounts_for_organization_request_to_yojson
    (x : describe_affected_accounts_for_organization_request) =
  assoc_to_yojson
    [
      ("eventArn", Some (event_arn_to_yojson x.event_arn));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]
