open Types

val make_describe_health_service_status_for_organization_response :
  ?health_service_access_status_for_organization:health_service_access_status_for_organization ->
  unit ->
  describe_health_service_status_for_organization_response

val make_event_type :
  ?service:service ->
  ?code:event_type_code ->
  ?category:event_type_category ->
  ?actionability:event_type_actionability ->
  ?personas:event_type_persona_list ->
  unit ->
  event_type

val make_describe_event_types_response :
  ?event_types:event_type_list -> ?next_token:next_token -> unit -> describe_event_types_response

val make_event_type_filter :
  ?event_type_codes:event_type_code_list ->
  ?services:service_list ->
  ?event_type_categories:event_type_category_list ->
  ?actionabilities:event_type_actionability_list ->
  ?personas:event_type_persona_list ->
  unit ->
  event_type_filter

val make_describe_event_types_request :
  ?filter:event_type_filter ->
  ?locale:locale ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_event_types_request

val make_organization_event :
  ?arn:event_arn ->
  ?service:service ->
  ?event_type_code:event_type_code ->
  ?event_type_category:event_type_category ->
  ?event_scope_code:event_scope_code ->
  ?region:region ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?last_updated_time:timestamp ->
  ?status_code:event_status_code ->
  ?actionability:event_actionability ->
  ?personas:event_persona_list ->
  unit ->
  organization_event

val make_describe_events_for_organization_response :
  ?events:organization_event_list ->
  ?next_token:next_token ->
  unit ->
  describe_events_for_organization_response

val make_date_time_range : ?from_:timestamp -> ?to_:timestamp -> unit -> date_time_range

val make_organization_event_filter :
  ?actionabilities:event_actionability_list ->
  ?event_type_codes:event_type_list2 ->
  ?aws_account_ids:aws_account_ids_list ->
  ?services:service_list ->
  ?regions:region_list ->
  ?start_time:date_time_range ->
  ?end_time:date_time_range ->
  ?last_updated_time:date_time_range ->
  ?entity_arns:entity_arn_list ->
  ?entity_values:entity_value_list ->
  ?event_type_categories:event_type_category_list2 ->
  ?event_status_codes:event_status_code_list ->
  ?personas:event_persona_list ->
  unit ->
  organization_event_filter

val make_describe_events_for_organization_request :
  ?filter:organization_event_filter ->
  ?next_token:next_token ->
  ?max_results:max_results_lower_range ->
  ?locale:locale ->
  unit ->
  describe_events_for_organization_request

val make_event :
  ?arn:event_arn ->
  ?service:service ->
  ?event_type_code:event_type_code ->
  ?event_type_category:event_type_category ->
  ?region:region ->
  ?availability_zone:availability_zone ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?last_updated_time:timestamp ->
  ?status_code:event_status_code ->
  ?event_scope_code:event_scope_code ->
  ?actionability:event_actionability ->
  ?personas:event_persona_list ->
  unit ->
  event

val make_describe_events_response :
  ?events:event_list -> ?next_token:next_token -> unit -> describe_events_response

val make_event_filter :
  ?actionabilities:event_actionability_list ->
  ?event_arns:event_arn_list ->
  ?event_type_codes:event_type_list2 ->
  ?services:service_list ->
  ?regions:region_list ->
  ?availability_zones:availability_zones ->
  ?start_times:date_time_range_list ->
  ?end_times:date_time_range_list ->
  ?last_updated_times:date_time_range_list ->
  ?entity_arns:entity_arn_list ->
  ?entity_values:entity_value_list ->
  ?event_type_categories:event_type_category_list2 ->
  ?tags:tag_filter ->
  ?event_status_codes:event_status_code_list ->
  ?personas:event_persona_list ->
  unit ->
  event_filter

val make_describe_events_request :
  ?filter:event_filter ->
  ?next_token:next_token ->
  ?max_results:max_results_lower_range ->
  ?locale:locale ->
  unit ->
  describe_events_request

val make_organization_event_details_error_item :
  ?aws_account_id:account_id ->
  ?event_arn:event_arn ->
  ?error_name:string_ ->
  ?error_message:string_ ->
  unit ->
  organization_event_details_error_item

val make_event_description : ?latest_description:event_description2 -> unit -> event_description

val make_organization_event_details :
  ?aws_account_id:account_id ->
  ?event:event ->
  ?event_description:event_description ->
  ?event_metadata:event_metadata ->
  unit ->
  organization_event_details

val make_describe_event_details_for_organization_response :
  ?successful_set:describe_event_details_for_organization_successful_set ->
  ?failed_set:describe_event_details_for_organization_failed_set ->
  unit ->
  describe_event_details_for_organization_response

val make_event_account_filter :
  ?aws_account_id:account_id -> event_arn:event_arn -> unit -> event_account_filter

val make_describe_event_details_for_organization_request :
  ?locale:locale ->
  organization_event_detail_filters:organization_event_detail_filters_list ->
  unit ->
  describe_event_details_for_organization_request

val make_event_details_error_item :
  ?event_arn:event_arn ->
  ?error_name:string_ ->
  ?error_message:string_ ->
  unit ->
  event_details_error_item

val make_event_details :
  ?event:event ->
  ?event_description:event_description ->
  ?event_metadata:event_metadata ->
  unit ->
  event_details

val make_describe_event_details_response :
  ?successful_set:describe_event_details_successful_set ->
  ?failed_set:describe_event_details_failed_set ->
  unit ->
  describe_event_details_response

val make_describe_event_details_request :
  ?locale:locale -> event_arns:event_arn_list -> unit -> describe_event_details_request

val make_event_aggregate :
  ?aggregate_value:aggregate_value -> ?count:count -> unit -> event_aggregate

val make_describe_event_aggregates_response :
  ?event_aggregates:event_aggregate_list ->
  ?next_token:next_token ->
  unit ->
  describe_event_aggregates_response

val make_describe_event_aggregates_request :
  ?filter:event_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  aggregate_field:event_aggregate_field ->
  unit ->
  describe_event_aggregates_request

val make_account_entity_aggregate :
  ?account_id:event_arn ->
  ?count:count ->
  ?statuses:entity_statuses ->
  unit ->
  account_entity_aggregate

val make_organization_entity_aggregate :
  ?event_arn:event_arn ->
  ?count:count ->
  ?statuses:entity_statuses ->
  ?accounts:account_entity_aggregates_list ->
  unit ->
  organization_entity_aggregate

val make_describe_entity_aggregates_for_organization_response :
  ?organization_entity_aggregates:organization_entity_aggregates_list ->
  unit ->
  describe_entity_aggregates_for_organization_response

val make_describe_entity_aggregates_for_organization_request :
  ?aws_account_ids:organization_account_ids_list ->
  event_arns:organization_event_arns_list ->
  unit ->
  describe_entity_aggregates_for_organization_request

val make_entity_aggregate :
  ?event_arn:event_arn -> ?count:count -> ?statuses:entity_statuses -> unit -> entity_aggregate

val make_describe_entity_aggregates_response :
  ?entity_aggregates:entity_aggregate_list -> unit -> describe_entity_aggregates_response

val make_describe_entity_aggregates_request :
  ?event_arns:event_arns_list -> unit -> describe_entity_aggregates_request

val make_organization_affected_entities_error_item :
  ?aws_account_id:account_id ->
  ?event_arn:event_arn ->
  ?error_name:string_ ->
  ?error_message:string_ ->
  unit ->
  organization_affected_entities_error_item

val make_affected_entity :
  ?entity_arn:entity_arn ->
  ?event_arn:event_arn ->
  ?entity_value:entity_value ->
  ?entity_url:entity_url ->
  ?aws_account_id:account_id ->
  ?last_updated_time:timestamp ->
  ?status_code:entity_status_code ->
  ?tags:tag_set ->
  ?entity_metadata:entity_metadata ->
  unit ->
  affected_entity

val make_describe_affected_entities_for_organization_response :
  ?entities:entity_list ->
  ?failed_set:describe_affected_entities_for_organization_failed_set ->
  ?next_token:next_token ->
  unit ->
  describe_affected_entities_for_organization_response

val make_entity_account_filter :
  ?aws_account_id:account_id ->
  ?status_codes:entity_status_code_list ->
  event_arn:event_arn ->
  unit ->
  entity_account_filter

val make_describe_affected_entities_for_organization_request :
  ?organization_entity_filters:organization_entity_filters_list ->
  ?locale:locale ->
  ?next_token:next_token ->
  ?max_results:max_results_lower_range ->
  ?organization_entity_account_filters:organization_entity_account_filters_list ->
  unit ->
  describe_affected_entities_for_organization_request

val make_describe_affected_entities_response :
  ?entities:entity_list -> ?next_token:next_token -> unit -> describe_affected_entities_response

val make_entity_filter :
  ?entity_arns:entity_arn_list ->
  ?entity_values:entity_value_list ->
  ?last_updated_times:date_time_range_list ->
  ?tags:tag_filter ->
  ?status_codes:entity_status_code_list ->
  event_arns:event_arn_list ->
  unit ->
  entity_filter

val make_describe_affected_entities_request :
  ?locale:locale ->
  ?next_token:next_token ->
  ?max_results:max_results_lower_range ->
  filter:entity_filter ->
  unit ->
  describe_affected_entities_request

val make_describe_affected_accounts_for_organization_response :
  ?affected_accounts:affected_accounts_list ->
  ?event_scope_code:event_scope_code ->
  ?next_token:next_token ->
  unit ->
  describe_affected_accounts_for_organization_response

val make_describe_affected_accounts_for_organization_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  event_arn:event_arn ->
  unit ->
  describe_affected_accounts_for_organization_request
