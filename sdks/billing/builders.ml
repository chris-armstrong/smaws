open Types

let make_validation_exception_field ~message:(message_ : error_message) ~name:(name_ : field_name)
    () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_update_billing_view_response
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ updated_at = updated_at_; arn = arn_ } : update_billing_view_response)

let make_dimension_values ~values:(values_ : values) ~key:(key_ : dimension) () =
  ({ values = values_; key = key_ } : dimension_values)

let make_tag_values ~values:(values_ : values) ~key:(key_ : tag_key) () =
  ({ values = values_; key = key_ } : tag_values)

let make_cost_category_values ~values:(values_ : values) ~key:(key_ : cost_category_name) () =
  ({ values = values_; key = key_ } : cost_category_values)

let make_time_range
    ?end_date_inclusive:(end_date_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?begin_date_inclusive:(begin_date_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ end_date_inclusive = end_date_inclusive_; begin_date_inclusive = begin_date_inclusive_ }
    : time_range)

let make_expression ?time_range:(time_range_ : time_range option)
    ?cost_categories:(cost_categories_ : cost_category_values option)
    ?tags:(tags_ : tag_values option) ?dimensions:(dimensions_ : dimension_values option) () =
  ({
     time_range = time_range_;
     cost_categories = cost_categories_;
     tags = tags_;
     dimensions = dimensions_;
   }
    : expression)

let make_update_billing_view_request
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ?description:(description_ : billing_view_description option)
    ?name:(name_ : billing_view_name option) ~arn:(arn_ : billing_view_arn) () =
  ({
     data_filter_expression = data_filter_expression_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : update_billing_view_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_tag_keys = resource_tag_keys_; resource_arn = resource_arn_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ?value:(value_ : resource_tag_value option) ~key:(key_ : resource_tag_key) ()
    =
  ({ value = value_; key = key_ } : resource_tag)

let make_tag_resource_request ~resource_tags:(resource_tags_ : resource_tag_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_tags = resource_tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_string_search ~search_value:(search_value_ : search_value)
    ~search_option:(search_option_ : search_option) () =
  ({ search_value = search_value_; search_option = search_option_ } : string_search)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_source_views_for_billing_view_response ?next_token:(next_token_ : page_token option)
    ~source_views:(source_views_ : billing_view_source_views_list) () =
  ({ next_token = next_token_; source_views = source_views_ }
    : list_source_views_for_billing_view_response)

let make_list_source_views_for_billing_view_request ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : billing_views_max_results option) ~arn:(arn_ : billing_view_arn) ()
    =
  ({ next_token = next_token_; max_results = max_results_; arn = arn_ }
    : list_source_views_for_billing_view_request)

let make_billing_view_health_status
    ?status_reasons:(status_reasons_ : billing_view_status_reasons option)
    ?status_code:(status_code_ : billing_view_status option) () =
  ({ status_reasons = status_reasons_; status_code = status_code_ } : billing_view_health_status)

let make_billing_view_list_element
    ?health_status:(health_status_ : billing_view_health_status option)
    ?billing_view_type:(billing_view_type_ : billing_view_type option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?description:(description_ : billing_view_description option)
    ?name:(name_ : billing_view_name option) ?arn:(arn_ : billing_view_arn option) () =
  ({
     health_status = health_status_;
     billing_view_type = billing_view_type_;
     source_account_id = source_account_id_;
     owner_account_id = owner_account_id_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : billing_view_list_element)

let make_list_billing_views_response ?next_token:(next_token_ : page_token option)
    ~billing_views:(billing_views_ : billing_view_list) () =
  ({ next_token = next_token_; billing_views = billing_views_ } : list_billing_views_response)

let make_active_time_range
    ~active_before_inclusive:(active_before_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~active_after_inclusive:(active_after_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     active_before_inclusive = active_before_inclusive_;
     active_after_inclusive = active_after_inclusive_;
   }
    : active_time_range)

let make_list_billing_views_request ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : billing_views_max_results option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?names:(names_ : string_searches option)
    ?billing_view_types:(billing_view_types_ : billing_view_type_list option)
    ?arns:(arns_ : billing_view_arn_list option)
    ?active_time_range:(active_time_range_ : active_time_range option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     source_account_id = source_account_id_;
     owner_account_id = owner_account_id_;
     names = names_;
     billing_view_types = billing_view_types_;
     arns = arns_;
     active_time_range = active_time_range_;
   }
    : list_billing_views_request)

let make_get_resource_policy_response ?policy:(policy_ : policy_document option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_billing_view_element ?health_status:(health_status_ : billing_view_health_status option)
    ?view_definition_last_updated_at:
      (view_definition_last_updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?source_view_count:(source_view_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?derived_view_count:(derived_view_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?billing_view_type:(billing_view_type_ : billing_view_type option)
    ?description:(description_ : billing_view_description option)
    ?name:(name_ : billing_view_name option) ?arn:(arn_ : billing_view_arn option) () =
  ({
     health_status = health_status_;
     view_definition_last_updated_at = view_definition_last_updated_at_;
     source_view_count = source_view_count_;
     derived_view_count = derived_view_count_;
     updated_at = updated_at_;
     created_at = created_at_;
     data_filter_expression = data_filter_expression_;
     source_account_id = source_account_id_;
     owner_account_id = owner_account_id_;
     billing_view_type = billing_view_type_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : billing_view_element)

let make_get_billing_view_response ~billing_view:(billing_view_ : billing_view_element) () =
  ({ billing_view = billing_view_ } : get_billing_view_response)

let make_get_billing_view_request ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : get_billing_view_request)

let make_disassociate_source_views_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : disassociate_source_views_response)

let make_disassociate_source_views_request
    ~source_views:(source_views_ : billing_view_source_views_list) ~arn:(arn_ : billing_view_arn) ()
    =
  ({ source_views = source_views_; arn = arn_ } : disassociate_source_views_request)

let make_delete_billing_view_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : delete_billing_view_response)

let make_delete_billing_view_request ?force:(force_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ force = force_; arn = arn_ } : delete_billing_view_request)

let make_create_billing_view_response
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ created_at = created_at_; arn = arn_ } : create_billing_view_response)

let make_create_billing_view_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?client_token:(client_token_ : client_token option)
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ?description:(description_ : billing_view_description option)
    ~source_views:(source_views_ : billing_view_source_views_list) ~name:(name_ : billing_view_name)
    () =
  ({
     resource_tags = resource_tags_;
     client_token = client_token_;
     data_filter_expression = data_filter_expression_;
     source_views = source_views_;
     description = description_;
     name = name_;
   }
    : create_billing_view_request)

let make_associate_source_views_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : associate_source_views_response)

let make_associate_source_views_request
    ~source_views:(source_views_ : billing_view_source_views_list) ~arn:(arn_ : billing_view_arn) ()
    =
  ({ source_views = source_views_; arn = arn_ } : associate_source_views_request)
