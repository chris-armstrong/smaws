open Types

let make_date_time_range ?to_:(to__ : timestamp option) ?from_:(from__ : timestamp option) () =
  ({ to_ = to__; from_ = from__ } : date_time_range)

let make_organization_event ?personas:(personas_ : event_persona_list option)
    ?actionability:(actionability_ : event_actionability option)
    ?status_code:(status_code_ : event_status_code option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?region:(region_ : region option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?event_type_category:(event_type_category_ : event_type_category option)
    ?event_type_code:(event_type_code_ : event_type_code option)
    ?service:(service_ : service option) ?arn:(arn_ : event_arn option) () =
  ({
     personas = personas_;
     actionability = actionability_;
     status_code = status_code_;
     last_updated_time = last_updated_time_;
     end_time = end_time_;
     start_time = start_time_;
     region = region_;
     event_scope_code = event_scope_code_;
     event_type_category = event_type_category_;
     event_type_code = event_type_code_;
     service = service_;
     arn = arn_;
   }
    : organization_event)

let make_organization_event_filter ?personas:(personas_ : event_persona_list option)
    ?event_status_codes:(event_status_codes_ : event_status_code_list option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list2 option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?entity_arns:(entity_arns_ : entity_arn_list option)
    ?last_updated_time:(last_updated_time_ : date_time_range option)
    ?end_time:(end_time_ : date_time_range option)
    ?start_time:(start_time_ : date_time_range option) ?regions:(regions_ : region_list option)
    ?services:(services_ : service_list option)
    ?aws_account_ids:(aws_account_ids_ : aws_account_ids_list option)
    ?event_type_codes:(event_type_codes_ : event_type_list2 option)
    ?actionabilities:(actionabilities_ : event_actionability_list option) () =
  ({
     personas = personas_;
     event_status_codes = event_status_codes_;
     event_type_categories = event_type_categories_;
     entity_values = entity_values_;
     entity_arns = entity_arns_;
     last_updated_time = last_updated_time_;
     end_time = end_time_;
     start_time = start_time_;
     regions = regions_;
     services = services_;
     aws_account_ids = aws_account_ids_;
     event_type_codes = event_type_codes_;
     actionabilities = actionabilities_;
   }
    : organization_event_filter)

let make_organization_event_details_error_item ?error_message:(error_message_ : string_ option)
    ?error_name:(error_name_ : string_ option) ?event_arn:(event_arn_ : event_arn option)
    ?aws_account_id:(aws_account_id_ : account_id option) () =
  ({
     error_message = error_message_;
     error_name = error_name_;
     event_arn = event_arn_;
     aws_account_id = aws_account_id_;
   }
    : organization_event_details_error_item)

let make_event ?personas:(personas_ : event_persona_list option)
    ?actionability:(actionability_ : event_actionability option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?status_code:(status_code_ : event_status_code option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?region:(region_ : region option)
    ?event_type_category:(event_type_category_ : event_type_category option)
    ?event_type_code:(event_type_code_ : event_type_code option)
    ?service:(service_ : service option) ?arn:(arn_ : event_arn option) () =
  ({
     personas = personas_;
     actionability = actionability_;
     event_scope_code = event_scope_code_;
     status_code = status_code_;
     last_updated_time = last_updated_time_;
     end_time = end_time_;
     start_time = start_time_;
     availability_zone = availability_zone_;
     region = region_;
     event_type_category = event_type_category_;
     event_type_code = event_type_code_;
     service = service_;
     arn = arn_;
   }
    : event)

let make_event_description ?latest_description:(latest_description_ : event_description2 option) ()
    =
  ({ latest_description = latest_description_ } : event_description)

let make_organization_event_details ?event_metadata:(event_metadata_ : event_metadata option)
    ?event_description:(event_description_ : event_description option)
    ?event:(event_ : event option) ?aws_account_id:(aws_account_id_ : account_id option) () =
  ({
     event_metadata = event_metadata_;
     event_description = event_description_;
     event = event_;
     aws_account_id = aws_account_id_;
   }
    : organization_event_details)

let make_event_account_filter ?aws_account_id:(aws_account_id_ : account_id option)
    ~event_arn:(event_arn_ : event_arn) () =
  ({ aws_account_id = aws_account_id_; event_arn = event_arn_ } : event_account_filter)

let make_account_entity_aggregate ?statuses:(statuses_ : entity_statuses option)
    ?count:(count_ : count option) ?account_id:(account_id_ : event_arn option) () =
  ({ statuses = statuses_; count = count_; account_id = account_id_ } : account_entity_aggregate)

let make_organization_entity_aggregate ?accounts:(accounts_ : account_entity_aggregates_list option)
    ?statuses:(statuses_ : entity_statuses option) ?count:(count_ : count option)
    ?event_arn:(event_arn_ : event_arn option) () =
  ({ accounts = accounts_; statuses = statuses_; count = count_; event_arn = event_arn_ }
    : organization_entity_aggregate)

let make_entity_account_filter ?status_codes:(status_codes_ : entity_status_code_list option)
    ?aws_account_id:(aws_account_id_ : account_id option) ~event_arn:(event_arn_ : event_arn) () =
  ({ status_codes = status_codes_; aws_account_id = aws_account_id_; event_arn = event_arn_ }
    : entity_account_filter)

let make_organization_affected_entities_error_item ?error_message:(error_message_ : string_ option)
    ?error_name:(error_name_ : string_ option) ?event_arn:(event_arn_ : event_arn option)
    ?aws_account_id:(aws_account_id_ : account_id option) () =
  ({
     error_message = error_message_;
     error_name = error_name_;
     event_arn = event_arn_;
     aws_account_id = aws_account_id_;
   }
    : organization_affected_entities_error_item)

let make_event_type ?personas:(personas_ : event_type_persona_list option)
    ?actionability:(actionability_ : event_type_actionability option)
    ?category:(category_ : event_type_category option) ?code:(code_ : event_type_code option)
    ?service:(service_ : service option) () =
  ({
     personas = personas_;
     actionability = actionability_;
     category = category_;
     code = code_;
     service = service_;
   }
    : event_type)

let make_event_type_filter ?personas:(personas_ : event_type_persona_list option)
    ?actionabilities:(actionabilities_ : event_type_actionability_list option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list option)
    ?services:(services_ : service_list option)
    ?event_type_codes:(event_type_codes_ : event_type_code_list option) () =
  ({
     personas = personas_;
     actionabilities = actionabilities_;
     event_type_categories = event_type_categories_;
     services = services_;
     event_type_codes = event_type_codes_;
   }
    : event_type_filter)

let make_event_filter ?personas:(personas_ : event_persona_list option)
    ?event_status_codes:(event_status_codes_ : event_status_code_list option)
    ?tags:(tags_ : tag_filter option)
    ?event_type_categories:(event_type_categories_ : event_type_category_list2 option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?entity_arns:(entity_arns_ : entity_arn_list option)
    ?last_updated_times:(last_updated_times_ : date_time_range_list option)
    ?end_times:(end_times_ : date_time_range_list option)
    ?start_times:(start_times_ : date_time_range_list option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?regions:(regions_ : region_list option) ?services:(services_ : service_list option)
    ?event_type_codes:(event_type_codes_ : event_type_list2 option)
    ?event_arns:(event_arns_ : event_arn_list option)
    ?actionabilities:(actionabilities_ : event_actionability_list option) () =
  ({
     personas = personas_;
     event_status_codes = event_status_codes_;
     tags = tags_;
     event_type_categories = event_type_categories_;
     entity_values = entity_values_;
     entity_arns = entity_arns_;
     last_updated_times = last_updated_times_;
     end_times = end_times_;
     start_times = start_times_;
     availability_zones = availability_zones_;
     regions = regions_;
     services = services_;
     event_type_codes = event_type_codes_;
     event_arns = event_arns_;
     actionabilities = actionabilities_;
   }
    : event_filter)

let make_event_details_error_item ?error_message:(error_message_ : string_ option)
    ?error_name:(error_name_ : string_ option) ?event_arn:(event_arn_ : event_arn option) () =
  ({ error_message = error_message_; error_name = error_name_; event_arn = event_arn_ }
    : event_details_error_item)

let make_event_details ?event_metadata:(event_metadata_ : event_metadata option)
    ?event_description:(event_description_ : event_description option)
    ?event:(event_ : event option) () =
  ({ event_metadata = event_metadata_; event_description = event_description_; event = event_ }
    : event_details)

let make_event_aggregate ?count:(count_ : count option)
    ?aggregate_value:(aggregate_value_ : aggregate_value option) () =
  ({ count = count_; aggregate_value = aggregate_value_ } : event_aggregate)

let make_affected_entity ?entity_metadata:(entity_metadata_ : entity_metadata option)
    ?tags:(tags_ : tag_set option) ?status_code:(status_code_ : entity_status_code option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?aws_account_id:(aws_account_id_ : account_id option)
    ?entity_url:(entity_url_ : entity_url option)
    ?entity_value:(entity_value_ : entity_value option) ?event_arn:(event_arn_ : event_arn option)
    ?entity_arn:(entity_arn_ : entity_arn option) () =
  ({
     entity_metadata = entity_metadata_;
     tags = tags_;
     status_code = status_code_;
     last_updated_time = last_updated_time_;
     aws_account_id = aws_account_id_;
     entity_url = entity_url_;
     entity_value = entity_value_;
     event_arn = event_arn_;
     entity_arn = entity_arn_;
   }
    : affected_entity)

let make_entity_filter ?status_codes:(status_codes_ : entity_status_code_list option)
    ?tags:(tags_ : tag_filter option)
    ?last_updated_times:(last_updated_times_ : date_time_range_list option)
    ?entity_values:(entity_values_ : entity_value_list option)
    ?entity_arns:(entity_arns_ : entity_arn_list option) ~event_arns:(event_arns_ : event_arn_list)
    () =
  ({
     status_codes = status_codes_;
     tags = tags_;
     last_updated_times = last_updated_times_;
     entity_values = entity_values_;
     entity_arns = entity_arns_;
     event_arns = event_arns_;
   }
    : entity_filter)

let make_entity_aggregate ?statuses:(statuses_ : entity_statuses option)
    ?count:(count_ : count option) ?event_arn:(event_arn_ : event_arn option) () =
  ({ statuses = statuses_; count = count_; event_arn = event_arn_ } : entity_aggregate)

let make_describe_health_service_status_for_organization_response
    ?health_service_access_status_for_organization:
      (health_service_access_status_for_organization_ :
         health_service_access_status_for_organization option) () =
  ({
     health_service_access_status_for_organization = health_service_access_status_for_organization_;
   }
    : describe_health_service_status_for_organization_response)

let make_describe_events_response ?next_token:(next_token_ : next_token option)
    ?events:(events_ : event_list option) () =
  ({ next_token = next_token_; events = events_ } : describe_events_response)

let make_describe_events_request ?locale:(locale_ : locale option)
    ?max_results:(max_results_ : max_results_lower_range option)
    ?next_token:(next_token_ : next_token option) ?filter:(filter_ : event_filter option) () =
  ({ locale = locale_; max_results = max_results_; next_token = next_token_; filter = filter_ }
    : describe_events_request)

let make_describe_events_for_organization_response ?next_token:(next_token_ : next_token option)
    ?events:(events_ : organization_event_list option) () =
  ({ next_token = next_token_; events = events_ } : describe_events_for_organization_response)

let make_describe_events_for_organization_request ?locale:(locale_ : locale option)
    ?max_results:(max_results_ : max_results_lower_range option)
    ?next_token:(next_token_ : next_token option)
    ?filter:(filter_ : organization_event_filter option) () =
  ({ locale = locale_; max_results = max_results_; next_token = next_token_; filter = filter_ }
    : describe_events_for_organization_request)

let make_describe_event_types_response ?next_token:(next_token_ : next_token option)
    ?event_types:(event_types_ : event_type_list option) () =
  ({ next_token = next_token_; event_types = event_types_ } : describe_event_types_response)

let make_describe_event_types_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?locale:(locale_ : locale option)
    ?filter:(filter_ : event_type_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; locale = locale_; filter = filter_ }
    : describe_event_types_request)

let make_describe_event_details_response
    ?failed_set:(failed_set_ : describe_event_details_failed_set option)
    ?successful_set:(successful_set_ : describe_event_details_successful_set option) () =
  ({ failed_set = failed_set_; successful_set = successful_set_ } : describe_event_details_response)

let make_describe_event_details_request ?locale:(locale_ : locale option)
    ~event_arns:(event_arns_ : event_arn_list) () =
  ({ locale = locale_; event_arns = event_arns_ } : describe_event_details_request)

let make_describe_event_details_for_organization_response
    ?failed_set:(failed_set_ : describe_event_details_for_organization_failed_set option)
    ?successful_set:
      (successful_set_ : describe_event_details_for_organization_successful_set option) () =
  ({ failed_set = failed_set_; successful_set = successful_set_ }
    : describe_event_details_for_organization_response)

let make_describe_event_details_for_organization_request ?locale:(locale_ : locale option)
    ~organization_event_detail_filters:
      (organization_event_detail_filters_ : organization_event_detail_filters_list) () =
  ({ locale = locale_; organization_event_detail_filters = organization_event_detail_filters_ }
    : describe_event_details_for_organization_request)

let make_describe_event_aggregates_response ?next_token:(next_token_ : next_token option)
    ?event_aggregates:(event_aggregates_ : event_aggregate_list option) () =
  ({ next_token = next_token_; event_aggregates = event_aggregates_ }
    : describe_event_aggregates_response)

let make_describe_event_aggregates_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filter:(filter_ : event_filter option)
    ~aggregate_field:(aggregate_field_ : event_aggregate_field) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     aggregate_field = aggregate_field_;
     filter = filter_;
   }
    : describe_event_aggregates_request)

let make_describe_entity_aggregates_response
    ?entity_aggregates:(entity_aggregates_ : entity_aggregate_list option) () =
  ({ entity_aggregates = entity_aggregates_ } : describe_entity_aggregates_response)

let make_describe_entity_aggregates_request ?event_arns:(event_arns_ : event_arns_list option) () =
  ({ event_arns = event_arns_ } : describe_entity_aggregates_request)

let make_describe_entity_aggregates_for_organization_response
    ?organization_entity_aggregates:
      (organization_entity_aggregates_ : organization_entity_aggregates_list option) () =
  ({ organization_entity_aggregates = organization_entity_aggregates_ }
    : describe_entity_aggregates_for_organization_response)

let make_describe_entity_aggregates_for_organization_request
    ?aws_account_ids:(aws_account_ids_ : organization_account_ids_list option)
    ~event_arns:(event_arns_ : organization_event_arns_list) () =
  ({ aws_account_ids = aws_account_ids_; event_arns = event_arns_ }
    : describe_entity_aggregates_for_organization_request)

let make_describe_affected_entities_response ?next_token:(next_token_ : next_token option)
    ?entities:(entities_ : entity_list option) () =
  ({ next_token = next_token_; entities = entities_ } : describe_affected_entities_response)

let make_describe_affected_entities_request
    ?max_results:(max_results_ : max_results_lower_range option)
    ?next_token:(next_token_ : next_token option) ?locale:(locale_ : locale option)
    ~filter:(filter_ : entity_filter) () =
  ({ max_results = max_results_; next_token = next_token_; locale = locale_; filter = filter_ }
    : describe_affected_entities_request)

let make_describe_affected_entities_for_organization_response
    ?next_token:(next_token_ : next_token option)
    ?failed_set:(failed_set_ : describe_affected_entities_for_organization_failed_set option)
    ?entities:(entities_ : entity_list option) () =
  ({ next_token = next_token_; failed_set = failed_set_; entities = entities_ }
    : describe_affected_entities_for_organization_response)

let make_describe_affected_entities_for_organization_request
    ?organization_entity_account_filters:
      (organization_entity_account_filters_ : organization_entity_account_filters_list option)
    ?max_results:(max_results_ : max_results_lower_range option)
    ?next_token:(next_token_ : next_token option) ?locale:(locale_ : locale option)
    ?organization_entity_filters:
      (organization_entity_filters_ : organization_entity_filters_list option) () =
  ({
     organization_entity_account_filters = organization_entity_account_filters_;
     max_results = max_results_;
     next_token = next_token_;
     locale = locale_;
     organization_entity_filters = organization_entity_filters_;
   }
    : describe_affected_entities_for_organization_request)

let make_describe_affected_accounts_for_organization_response
    ?next_token:(next_token_ : next_token option)
    ?event_scope_code:(event_scope_code_ : event_scope_code option)
    ?affected_accounts:(affected_accounts_ : affected_accounts_list option) () =
  ({
     next_token = next_token_;
     event_scope_code = event_scope_code_;
     affected_accounts = affected_accounts_;
   }
    : describe_affected_accounts_for_organization_response)

let make_describe_affected_accounts_for_organization_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~event_arn:(event_arn_ : event_arn) () =
  ({ max_results = max_results_; next_token = next_token_; event_arn = event_arn_ }
    : describe_affected_accounts_for_organization_request)
