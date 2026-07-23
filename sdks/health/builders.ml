open Types

let make_describe_health_service_status_for_organization_response
    ?health_service_access_status_for_organization:
      (health_service_access_status_for_organization_ :
         health_service_access_status_for_organization option) () =
  ({
     health_service_access_status_for_organization = health_service_access_status_for_organization_;
   }
    : describe_health_service_status_for_organization_response)

let make_event_type ?service:(service_ : service option) ?code:(code_ : event_type_code option)
    ?category:(category_ : event_type_category option)
    ?actionability:(actionability_ : event_type_actionability option)
    ?personas:(personas_ : event_type_persona_list option) () =
  ({
     service = service_;
     code = code_;
     category = category_;
     actionability = actionability_;
     personas = personas_;
   }
    : event_type)

let make_describe_event_types_response ?event_types:(event_types_ : event_type_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ event_types = event_types_; next_token = next_token_ } : describe_event_types_response)

let make_event_type_filter ?event_type_codes:(event_type_codes_ : event_type_code_list option)
    ?services:(services_ : service_list option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list option)
    ?actionabilities:(actionabilities_ : event_type_actionability_list option)
    ?personas:(personas_ : event_type_persona_list option) () =
  ({
     event_type_codes = event_type_codes_;
     services = services_;
     event_type_categories = event_type_categories_;
     actionabilities = actionabilities_;
     personas = personas_;
   }
    : event_type_filter)

let make_describe_event_types_request ?filter:(filter_ : event_type_filter option)
    ?locale:(locale_ : locale option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ filter = filter_; locale = locale_; next_token = next_token_; max_results = max_results_ }
    : describe_event_types_request)

let make_organization_event ?arn:(arn_ : event_arn option) ?service:(service_ : service option)
    ?event_type_code:(event_type_code_ : event_type_code option)
    ?event_type_category:(event_type_category_ : event_type_category option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?region:(region_ : region option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?status_code:(status_code_ : event_status_code option)
    ?actionability:(actionability_ : event_actionability option)
    ?personas:(personas_ : event_persona_list option) () =
  ({
     arn = arn_;
     service = service_;
     event_type_code = event_type_code_;
     event_type_category = event_type_category_;
     event_scope_code = event_scope_code_;
     region = region_;
     start_time = start_time_;
     end_time = end_time_;
     last_updated_time = last_updated_time_;
     status_code = status_code_;
     actionability = actionability_;
     personas = personas_;
   }
    : organization_event)

let make_describe_events_for_organization_response
    ?events:(events_ : organization_event_list option) ?next_token:(next_token_ : next_token option)
    () =
  ({ events = events_; next_token = next_token_ } : describe_events_for_organization_response)

let make_date_time_range ?from_:(from__ : timestamp option) ?to_:(to__ : timestamp option) () =
  ({ from_ = from__; to_ = to__ } : date_time_range)

let make_organization_event_filter
    ?actionabilities:(actionabilities_ : event_actionability_list option)
    ?event_type_codes:(event_type_codes_ : event_type_list2 option)
    ?aws_account_ids:(aws_account_ids_ : aws_account_ids_list option)
    ?services:(services_ : service_list option) ?regions:(regions_ : region_list option)
    ?start_time:(start_time_ : date_time_range option)
    ?end_time:(end_time_ : date_time_range option)
    ?last_updated_time:(last_updated_time_ : date_time_range option)
    ?entity_arns:(entity_arns_ : entity_arn_list option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list2 option)
    ?event_status_codes:(event_status_codes_ : event_status_code_list option)
    ?personas:(personas_ : event_persona_list option) () =
  ({
     actionabilities = actionabilities_;
     event_type_codes = event_type_codes_;
     aws_account_ids = aws_account_ids_;
     services = services_;
     regions = regions_;
     start_time = start_time_;
     end_time = end_time_;
     last_updated_time = last_updated_time_;
     entity_arns = entity_arns_;
     entity_values = entity_values_;
     event_type_categories = event_type_categories_;
     event_status_codes = event_status_codes_;
     personas = personas_;
   }
    : organization_event_filter)

let make_describe_events_for_organization_request
    ?filter:(filter_ : organization_event_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_lower_range option) ?locale:(locale_ : locale option)
    () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_; locale = locale_ }
    : describe_events_for_organization_request)

let make_event ?arn:(arn_ : event_arn option) ?service:(service_ : service option)
    ?event_type_code:(event_type_code_ : event_type_code option)
    ?event_type_category:(event_type_category_ : event_type_category option)
    ?region:(region_ : region option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?status_code:(status_code_ : event_status_code option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?actionability:(actionability_ : event_actionability option)
    ?personas:(personas_ : event_persona_list option) () =
  ({
     arn = arn_;
     service = service_;
     event_type_code = event_type_code_;
     event_type_category = event_type_category_;
     region = region_;
     availability_zone = availability_zone_;
     start_time = start_time_;
     end_time = end_time_;
     last_updated_time = last_updated_time_;
     status_code = status_code_;
     event_scope_code = event_scope_code_;
     actionability = actionability_;
     personas = personas_;
   }
    : event)

let make_describe_events_response ?events:(events_ : event_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ events = events_; next_token = next_token_ } : describe_events_response)

let make_event_filter ?actionabilities:(actionabilities_ : event_actionability_list option)
    ?event_arns:(event_arns_ : event_arn_list option)
    ?event_type_codes:(event_type_codes_ : event_type_list2 option)
    ?services:(services_ : service_list option) ?regions:(regions_ : region_list option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?start_times:(start_times_ : date_time_range_list option)
    ?end_times:(end_times_ : date_time_range_list option)
    ?last_updated_times:(last_updated_times_ : date_time_range_list option)
    ?entity_arns:(entity_arns_ : entity_arn_list option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list2 option)
    ?tags:(tags_ : tag_filter option)
    ?event_status_codes:(event_status_codes_ : event_status_code_list option)
    ?personas:(personas_ : event_persona_list option) () =
  ({
     actionabilities = actionabilities_;
     event_arns = event_arns_;
     event_type_codes = event_type_codes_;
     services = services_;
     regions = regions_;
     availability_zones = availability_zones_;
     start_times = start_times_;
     end_times = end_times_;
     last_updated_times = last_updated_times_;
     entity_arns = entity_arns_;
     entity_values = entity_values_;
     event_type_categories = event_type_categories_;
     tags = tags_;
     event_status_codes = event_status_codes_;
     personas = personas_;
   }
    : event_filter)

let make_describe_events_request ?filter:(filter_ : event_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_lower_range option) ?locale:(locale_ : locale option)
    () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_; locale = locale_ }
    : describe_events_request)

let make_organization_event_details_error_item ?aws_account_id:(aws_account_id_ : account_id option)
    ?event_arn:(event_arn_ : event_arn option) ?error_name:(error_name_ : string_ option)
    ?error_message:(error_message_ : string_ option) () =
  ({
     aws_account_id = aws_account_id_;
     event_arn = event_arn_;
     error_name = error_name_;
     error_message = error_message_;
   }
    : organization_event_details_error_item)

let make_event_description ?latest_description:(latest_description_ : event_description2 option) ()
    =
  ({ latest_description = latest_description_ } : event_description)

let make_organization_event_details ?aws_account_id:(aws_account_id_ : account_id option)
    ?event:(event_ : event option)
    ?event_description:(event_description_ : event_description option)
    ?event_metadata:(event_metadata_ : event_metadata option) () =
  ({
     aws_account_id = aws_account_id_;
     event = event_;
     event_description = event_description_;
     event_metadata = event_metadata_;
   }
    : organization_event_details)

let make_describe_event_details_for_organization_response
    ?successful_set:
      (successful_set_ : describe_event_details_for_organization_successful_set option)
    ?failed_set:(failed_set_ : describe_event_details_for_organization_failed_set option) () =
  ({ successful_set = successful_set_; failed_set = failed_set_ }
    : describe_event_details_for_organization_response)

let make_event_account_filter ?aws_account_id:(aws_account_id_ : account_id option)
    ~event_arn:(event_arn_ : event_arn) () =
  ({ event_arn = event_arn_; aws_account_id = aws_account_id_ } : event_account_filter)

let make_describe_event_details_for_organization_request ?locale:(locale_ : locale option)
    ~organization_event_detail_filters:
      (organization_event_detail_filters_ : organization_event_detail_filters_list) () =
  ({ organization_event_detail_filters = organization_event_detail_filters_; locale = locale_ }
    : describe_event_details_for_organization_request)

let make_event_details_error_item ?event_arn:(event_arn_ : event_arn option)
    ?error_name:(error_name_ : string_ option) ?error_message:(error_message_ : string_ option) () =
  ({ event_arn = event_arn_; error_name = error_name_; error_message = error_message_ }
    : event_details_error_item)

let make_event_details ?event:(event_ : event option)
    ?event_description:(event_description_ : event_description option)
    ?event_metadata:(event_metadata_ : event_metadata option) () =
  ({ event = event_; event_description = event_description_; event_metadata = event_metadata_ }
    : event_details)

let make_describe_event_details_response
    ?successful_set:(successful_set_ : describe_event_details_successful_set option)
    ?failed_set:(failed_set_ : describe_event_details_failed_set option) () =
  ({ successful_set = successful_set_; failed_set = failed_set_ } : describe_event_details_response)

let make_describe_event_details_request ?locale:(locale_ : locale option)
    ~event_arns:(event_arns_ : event_arn_list) () =
  ({ event_arns = event_arns_; locale = locale_ } : describe_event_details_request)

let make_event_aggregate ?aggregate_value:(aggregate_value_ : aggregate_value option)
    ?count:(count_ : count option) () =
  ({ aggregate_value = aggregate_value_; count = count_ } : event_aggregate)

let make_describe_event_aggregates_response
    ?event_aggregates:(event_aggregates_ : event_aggregate_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ event_aggregates = event_aggregates_; next_token = next_token_ }
    : describe_event_aggregates_response)

let make_describe_event_aggregates_request ?filter:(filter_ : event_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~aggregate_field:(aggregate_field_ : event_aggregate_field) () =
  ({
     filter = filter_;
     aggregate_field = aggregate_field_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_event_aggregates_request)

let make_account_entity_aggregate ?account_id:(account_id_ : event_arn option)
    ?count:(count_ : count option) ?statuses:(statuses_ : entity_statuses option) () =
  ({ account_id = account_id_; count = count_; statuses = statuses_ } : account_entity_aggregate)

let make_organization_entity_aggregate ?event_arn:(event_arn_ : event_arn option)
    ?count:(count_ : count option) ?statuses:(statuses_ : entity_statuses option)
    ?accounts:(accounts_ : account_entity_aggregates_list option) () =
  ({ event_arn = event_arn_; count = count_; statuses = statuses_; accounts = accounts_ }
    : organization_entity_aggregate)

let make_describe_entity_aggregates_for_organization_response
    ?organization_entity_aggregates:
      (organization_entity_aggregates_ : organization_entity_aggregates_list option) () =
  ({ organization_entity_aggregates = organization_entity_aggregates_ }
    : describe_entity_aggregates_for_organization_response)

let make_describe_entity_aggregates_for_organization_request
    ?aws_account_ids:(aws_account_ids_ : organization_account_ids_list option)
    ~event_arns:(event_arns_ : organization_event_arns_list) () =
  ({ event_arns = event_arns_; aws_account_ids = aws_account_ids_ }
    : describe_entity_aggregates_for_organization_request)

let make_entity_aggregate ?event_arn:(event_arn_ : event_arn option) ?count:(count_ : count option)
    ?statuses:(statuses_ : entity_statuses option) () =
  ({ event_arn = event_arn_; count = count_; statuses = statuses_ } : entity_aggregate)

let make_describe_entity_aggregates_response
    ?entity_aggregates:(entity_aggregates_ : entity_aggregate_list option) () =
  ({ entity_aggregates = entity_aggregates_ } : describe_entity_aggregates_response)

let make_describe_entity_aggregates_request ?event_arns:(event_arns_ : event_arns_list option) () =
  ({ event_arns = event_arns_ } : describe_entity_aggregates_request)

let make_organization_affected_entities_error_item
    ?aws_account_id:(aws_account_id_ : account_id option) ?event_arn:(event_arn_ : event_arn option)
    ?error_name:(error_name_ : string_ option) ?error_message:(error_message_ : string_ option) () =
  ({
     aws_account_id = aws_account_id_;
     event_arn = event_arn_;
     error_name = error_name_;
     error_message = error_message_;
   }
    : organization_affected_entities_error_item)

let make_affected_entity ?entity_arn:(entity_arn_ : entity_arn option)
    ?event_arn:(event_arn_ : event_arn option) ?entity_value:(entity_value_ : entity_value option)
    ?entity_url:(entity_url_ : entity_url option)
    ?aws_account_id:(aws_account_id_ : account_id option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?status_code:(status_code_ : entity_status_code option) ?tags:(tags_ : tag_set option)
    ?entity_metadata:(entity_metadata_ : entity_metadata option) () =
  ({
     entity_arn = entity_arn_;
     event_arn = event_arn_;
     entity_value = entity_value_;
     entity_url = entity_url_;
     aws_account_id = aws_account_id_;
     last_updated_time = last_updated_time_;
     status_code = status_code_;
     tags = tags_;
     entity_metadata = entity_metadata_;
   }
    : affected_entity)

let make_describe_affected_entities_for_organization_response
    ?entities:(entities_ : entity_list option)
    ?failed_set:(failed_set_ : describe_affected_entities_for_organization_failed_set option)
    ?next_token:(next_token_ : next_token option) () =
  ({ entities = entities_; failed_set = failed_set_; next_token = next_token_ }
    : describe_affected_entities_for_organization_response)

let make_entity_account_filter ?aws_account_id:(aws_account_id_ : account_id option)
    ?status_codes:(status_codes_ : entity_status_code_list option)
    ~event_arn:(event_arn_ : event_arn) () =
  ({ event_arn = event_arn_; aws_account_id = aws_account_id_; status_codes = status_codes_ }
    : entity_account_filter)

let make_describe_affected_entities_for_organization_request
    ?organization_entity_filters:
      (organization_entity_filters_ : organization_entity_filters_list option)
    ?locale:(locale_ : locale option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_lower_range option)
    ?organization_entity_account_filters:
      (organization_entity_account_filters_ : organization_entity_account_filters_list option) () =
  ({
     organization_entity_filters = organization_entity_filters_;
     locale = locale_;
     next_token = next_token_;
     max_results = max_results_;
     organization_entity_account_filters = organization_entity_account_filters_;
   }
    : describe_affected_entities_for_organization_request)

let make_describe_affected_entities_response ?entities:(entities_ : entity_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ entities = entities_; next_token = next_token_ } : describe_affected_entities_response)

let make_entity_filter ?entity_arns:(entity_arns_ : entity_arn_list option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?last_updated_times:(last_updated_times_ : date_time_range_list option)
    ?tags:(tags_ : tag_filter option) ?status_codes:(status_codes_ : entity_status_code_list option)
    ~event_arns:(event_arns_ : event_arn_list) () =
  ({
     event_arns = event_arns_;
     entity_arns = entity_arns_;
     entity_values = entity_values_;
     last_updated_times = last_updated_times_;
     tags = tags_;
     status_codes = status_codes_;
   }
    : entity_filter)

let make_describe_affected_entities_request ?locale:(locale_ : locale option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_lower_range option) ~filter:(filter_ : entity_filter)
    () =
  ({ filter = filter_; locale = locale_; next_token = next_token_; max_results = max_results_ }
    : describe_affected_entities_request)

let make_describe_affected_accounts_for_organization_response
    ?affected_accounts:(affected_accounts_ : affected_accounts_list option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     affected_accounts = affected_accounts_;
     event_scope_code = event_scope_code_;
     next_token = next_token_;
   }
    : describe_affected_accounts_for_organization_response)

let make_describe_affected_accounts_for_organization_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~event_arn:(event_arn_ : event_arn) () =
  ({ event_arn = event_arn_; next_token = next_token_; max_results = max_results_ }
    : describe_affected_accounts_for_organization_request)
