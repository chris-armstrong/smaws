open Types

val make_date_time_range : ?to_:timestamp -> ?from_:timestamp -> unit -> date_time_range

val make_organization_event :
  ?personas:event_persona_list ->
  ?actionability:event_actionability ->
  ?status_code:event_status_code ->
  ?last_updated_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?region:region ->
  ?event_scope_code:event_scope_code ->
  ?event_type_category:event_type_category ->
  ?event_type_code:event_type_code ->
  ?service:service ->
  ?arn:event_arn ->
  unit ->
  organization_event

val make_organization_event_filter :
  ?personas:event_persona_list ->
  ?event_status_codes:event_status_code_list ->
  ?event_type_categories:event_type_category_list2 ->
  ?entity_values:entity_value_list ->
  ?entity_arns:entity_arn_list ->
  ?last_updated_time:date_time_range ->
  ?end_time:date_time_range ->
  ?start_time:date_time_range ->
  ?regions:region_list ->
  ?services:service_list ->
  ?aws_account_ids:aws_account_ids_list ->
  ?event_type_codes:event_type_list2 ->
  ?actionabilities:event_actionability_list ->
  unit ->
  organization_event_filter

val make_organization_event_details_error_item :
  ?error_message:string_ ->
  ?error_name:string_ ->
  ?event_arn:event_arn ->
  ?aws_account_id:account_id ->
  unit ->
  organization_event_details_error_item

val make_event :
  ?personas:event_persona_list ->
  ?actionability:event_actionability ->
  ?event_scope_code:event_scope_code ->
  ?status_code:event_status_code ->
  ?last_updated_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?availability_zone:availability_zone ->
  ?region:region ->
  ?event_type_category:event_type_category ->
  ?event_type_code:event_type_code ->
  ?service:service ->
  ?arn:event_arn ->
  unit ->
  event

val make_event_description : ?latest_description:event_description2 -> unit -> event_description

val make_organization_event_details :
  ?event_metadata:event_metadata ->
  ?event_description:event_description ->
  ?event:event ->
  ?aws_account_id:account_id ->
  unit ->
  organization_event_details

val make_event_account_filter :
  ?aws_account_id:account_id -> event_arn:event_arn -> unit -> event_account_filter

val make_account_entity_aggregate :
  ?statuses:entity_statuses ->
  ?count:count ->
  ?account_id:event_arn ->
  unit ->
  account_entity_aggregate

val make_organization_entity_aggregate :
  ?accounts:account_entity_aggregates_list ->
  ?statuses:entity_statuses ->
  ?count:count ->
  ?event_arn:event_arn ->
  unit ->
  organization_entity_aggregate

val make_entity_account_filter :
  ?status_codes:entity_status_code_list ->
  ?aws_account_id:account_id ->
  event_arn:event_arn ->
  unit ->
  entity_account_filter

val make_organization_affected_entities_error_item :
  ?error_message:string_ ->
  ?error_name:string_ ->
  ?event_arn:event_arn ->
  ?aws_account_id:account_id ->
  unit ->
  organization_affected_entities_error_item

val make_event_type :
  ?personas:event_type_persona_list ->
  ?actionability:event_type_actionability ->
  ?category:event_type_category ->
  ?code:event_type_code ->
  ?service:service ->
  unit ->
  event_type

val make_event_type_filter :
  ?personas:event_type_persona_list ->
  ?actionabilities:event_type_actionability_list ->
  ?event_type_categories:event_type_category_list ->
  ?services:service_list ->
  ?event_type_codes:event_type_code_list ->
  unit ->
  event_type_filter

val make_event_filter :
  ?personas:event_persona_list ->
  ?event_status_codes:event_status_code_list ->
  ?tags:tag_filter ->
  ?event_type_categories:event_type_category_list2 ->
  ?entity_values:entity_value_list ->
  ?entity_arns:entity_arn_list ->
  ?last_updated_times:date_time_range_list ->
  ?end_times:date_time_range_list ->
  ?start_times:date_time_range_list ->
  ?availability_zones:availability_zones ->
  ?regions:region_list ->
  ?services:service_list ->
  ?event_type_codes:event_type_list2 ->
  ?event_arns:event_arn_list ->
  ?actionabilities:event_actionability_list ->
  unit ->
  event_filter

val make_event_details_error_item :
  ?error_message:string_ ->
  ?error_name:string_ ->
  ?event_arn:event_arn ->
  unit ->
  event_details_error_item

val make_event_details :
  ?event_metadata:event_metadata ->
  ?event_description:event_description ->
  ?event:event ->
  unit ->
  event_details

val make_event_aggregate :
  ?count:count -> ?aggregate_value:aggregate_value -> unit -> event_aggregate

val make_affected_entity :
  ?entity_metadata:entity_metadata ->
  ?tags:tag_set ->
  ?status_code:entity_status_code ->
  ?last_updated_time:timestamp ->
  ?aws_account_id:account_id ->
  ?entity_url:entity_url ->
  ?entity_value:entity_value ->
  ?event_arn:event_arn ->
  ?entity_arn:entity_arn ->
  unit ->
  affected_entity

val make_entity_filter :
  ?status_codes:entity_status_code_list ->
  ?tags:tag_filter ->
  ?last_updated_times:date_time_range_list ->
  ?entity_values:entity_value_list ->
  ?entity_arns:entity_arn_list ->
  event_arns:event_arn_list ->
  unit ->
  entity_filter

val make_entity_aggregate :
  ?statuses:entity_statuses -> ?count:count -> ?event_arn:event_arn -> unit -> entity_aggregate

val make_describe_health_service_status_for_organization_response :
  ?health_service_access_status_for_organization:health_service_access_status_for_organization ->
  unit ->
  describe_health_service_status_for_organization_response

val make_describe_events_response :
  ?next_token:next_token -> ?events:event_list -> unit -> describe_events_response

val make_describe_events_request :
  ?locale:locale ->
  ?max_results:max_results_lower_range ->
  ?next_token:next_token ->
  ?filter:event_filter ->
  unit ->
  describe_events_request

val make_describe_events_for_organization_response :
  ?next_token:next_token ->
  ?events:organization_event_list ->
  unit ->
  describe_events_for_organization_response

val make_describe_events_for_organization_request :
  ?locale:locale ->
  ?max_results:max_results_lower_range ->
  ?next_token:next_token ->
  ?filter:organization_event_filter ->
  unit ->
  describe_events_for_organization_request

val make_describe_event_types_response :
  ?next_token:next_token -> ?event_types:event_type_list -> unit -> describe_event_types_response

val make_describe_event_types_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?locale:locale ->
  ?filter:event_type_filter ->
  unit ->
  describe_event_types_request

val make_describe_event_details_response :
  ?failed_set:describe_event_details_failed_set ->
  ?successful_set:describe_event_details_successful_set ->
  unit ->
  describe_event_details_response

val make_describe_event_details_request :
  ?locale:locale -> event_arns:event_arn_list -> unit -> describe_event_details_request

val make_describe_event_details_for_organization_response :
  ?failed_set:describe_event_details_for_organization_failed_set ->
  ?successful_set:describe_event_details_for_organization_successful_set ->
  unit ->
  describe_event_details_for_organization_response

val make_describe_event_details_for_organization_request :
  ?locale:locale ->
  organization_event_detail_filters:organization_event_detail_filters_list ->
  unit ->
  describe_event_details_for_organization_request

val make_describe_event_aggregates_response :
  ?next_token:next_token ->
  ?event_aggregates:event_aggregate_list ->
  unit ->
  describe_event_aggregates_response

val make_describe_event_aggregates_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:event_filter ->
  aggregate_field:event_aggregate_field ->
  unit ->
  describe_event_aggregates_request

val make_describe_entity_aggregates_response :
  ?entity_aggregates:entity_aggregate_list -> unit -> describe_entity_aggregates_response

val make_describe_entity_aggregates_request :
  ?event_arns:event_arns_list -> unit -> describe_entity_aggregates_request

val make_describe_entity_aggregates_for_organization_response :
  ?organization_entity_aggregates:organization_entity_aggregates_list ->
  unit ->
  describe_entity_aggregates_for_organization_response

val make_describe_entity_aggregates_for_organization_request :
  ?aws_account_ids:organization_account_ids_list ->
  event_arns:organization_event_arns_list ->
  unit ->
  describe_entity_aggregates_for_organization_request

val make_describe_affected_entities_response :
  ?next_token:next_token -> ?entities:entity_list -> unit -> describe_affected_entities_response

val make_describe_affected_entities_request :
  ?max_results:max_results_lower_range ->
  ?next_token:next_token ->
  ?locale:locale ->
  filter:entity_filter ->
  unit ->
  describe_affected_entities_request

val make_describe_affected_entities_for_organization_response :
  ?next_token:next_token ->
  ?failed_set:describe_affected_entities_for_organization_failed_set ->
  ?entities:entity_list ->
  unit ->
  describe_affected_entities_for_organization_response

val make_describe_affected_entities_for_organization_request :
  ?organization_entity_account_filters:organization_entity_account_filters_list ->
  ?max_results:max_results_lower_range ->
  ?next_token:next_token ->
  ?locale:locale ->
  ?organization_entity_filters:organization_entity_filters_list ->
  unit ->
  describe_affected_entities_for_organization_request

val make_describe_affected_accounts_for_organization_response :
  ?next_token:next_token ->
  ?event_scope_code:event_scope_code ->
  ?affected_accounts:affected_accounts_list ->
  unit ->
  describe_affected_accounts_for_organization_response

val make_describe_affected_accounts_for_organization_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  event_arn:event_arn ->
  unit ->
  describe_affected_accounts_for_organization_request
