open Types

let make_validation_exception_field ~name:(name_ : field_name) ~message:(message_ : error_message)
    () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_update_billing_view_response
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_; updated_at = updated_at_ } : update_billing_view_response)

let make_time_range
    ?begin_date_inclusive:(begin_date_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_date_inclusive:(end_date_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ begin_date_inclusive = begin_date_inclusive_; end_date_inclusive = end_date_inclusive_ }
    : time_range)

let make_cost_category_values ~key:(key_ : cost_category_name) ~values:(values_ : values) () =
  ({ key = key_; values = values_ } : cost_category_values)

let make_tag_values ~key:(key_ : tag_key) ~values:(values_ : values) () =
  ({ key = key_; values = values_ } : tag_values)

let make_dimension_values ~key:(key_ : dimension) ~values:(values_ : values) () =
  ({ key = key_; values = values_ } : dimension_values)

let make_expression ?dimensions:(dimensions_ : dimension_values option)
    ?tags:(tags_ : tag_values option)
    ?cost_categories:(cost_categories_ : cost_category_values option)
    ?time_range:(time_range_ : time_range option) () =
  ({
     dimensions = dimensions_;
     tags = tags_;
     cost_categories = cost_categories_;
     time_range = time_range_;
   }
    : expression)

let make_update_billing_view_request ?name:(name_ : billing_view_name option)
    ?description:(description_ : billing_view_description option)
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ~arn:(arn_ : billing_view_arn) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     data_filter_expression = data_filter_expression_;
   }
    : update_billing_view_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ?value:(value_ : resource_tag_value option) ~key:(key_ : resource_tag_key) ()
    =
  ({ key = key_; value = value_ } : resource_tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_source_views_for_billing_view_response ?next_token:(next_token_ : page_token option)
    ~source_views:(source_views_ : billing_view_source_views_list) () =
  ({ source_views = source_views_; next_token = next_token_ }
    : list_source_views_for_billing_view_response)

let make_list_source_views_for_billing_view_request
    ?max_results:(max_results_ : billing_views_max_results option)
    ?next_token:(next_token_ : page_token option) ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_; max_results = max_results_; next_token = next_token_ }
    : list_source_views_for_billing_view_request)

let make_billing_view_health_status ?status_code:(status_code_ : billing_view_status option)
    ?status_reasons:(status_reasons_ : billing_view_status_reasons option) () =
  ({ status_code = status_code_; status_reasons = status_reasons_ } : billing_view_health_status)

let make_billing_view_list_element ?arn:(arn_ : billing_view_arn option)
    ?name:(name_ : billing_view_name option)
    ?description:(description_ : billing_view_description option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?billing_view_type:(billing_view_type_ : billing_view_type option)
    ?health_status:(health_status_ : billing_view_health_status option) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     owner_account_id = owner_account_id_;
     source_account_id = source_account_id_;
     billing_view_type = billing_view_type_;
     health_status = health_status_;
   }
    : billing_view_list_element)

let make_list_billing_views_response ?next_token:(next_token_ : page_token option)
    ~billing_views:(billing_views_ : billing_view_list) () =
  ({ billing_views = billing_views_; next_token = next_token_ } : list_billing_views_response)

let make_string_search ~search_option:(search_option_ : search_option)
    ~search_value:(search_value_ : search_value) () =
  ({ search_option = search_option_; search_value = search_value_ } : string_search)

let make_active_time_range
    ~active_after_inclusive:(active_after_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~active_before_inclusive:(active_before_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     active_after_inclusive = active_after_inclusive_;
     active_before_inclusive = active_before_inclusive_;
   }
    : active_time_range)

let make_list_billing_views_request
    ?active_time_range:(active_time_range_ : active_time_range option)
    ?arns:(arns_ : billing_view_arn_list option)
    ?billing_view_types:(billing_view_types_ : billing_view_type_list option)
    ?names:(names_ : string_searches option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?max_results:(max_results_ : billing_views_max_results option)
    ?next_token:(next_token_ : page_token option) () =
  ({
     active_time_range = active_time_range_;
     arns = arns_;
     billing_view_types = billing_view_types_;
     names = names_;
     owner_account_id = owner_account_id_;
     source_account_id = source_account_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_billing_views_request)

let make_get_resource_policy_response ?policy:(policy_ : policy_document option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : get_resource_policy_response)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_billing_view_element ?arn:(arn_ : billing_view_arn option)
    ?name:(name_ : billing_view_name option)
    ?description:(description_ : billing_view_description option)
    ?billing_view_type:(billing_view_type_ : billing_view_type option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?source_account_id:(source_account_id_ : account_id option)
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?derived_view_count:(derived_view_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?source_view_count:(source_view_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?view_definition_last_updated_at:
      (view_definition_last_updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?health_status:(health_status_ : billing_view_health_status option) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     billing_view_type = billing_view_type_;
     owner_account_id = owner_account_id_;
     source_account_id = source_account_id_;
     data_filter_expression = data_filter_expression_;
     created_at = created_at_;
     updated_at = updated_at_;
     derived_view_count = derived_view_count_;
     source_view_count = source_view_count_;
     view_definition_last_updated_at = view_definition_last_updated_at_;
     health_status = health_status_;
   }
    : billing_view_element)

let make_get_billing_view_response ~billing_view:(billing_view_ : billing_view_element) () =
  ({ billing_view = billing_view_ } : get_billing_view_response)

let make_get_billing_view_request ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : get_billing_view_request)

let make_disassociate_source_views_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : disassociate_source_views_response)

let make_disassociate_source_views_request ~arn:(arn_ : billing_view_arn)
    ~source_views:(source_views_ : billing_view_source_views_list) () =
  ({ arn = arn_; source_views = source_views_ } : disassociate_source_views_request)

let make_delete_billing_view_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : delete_billing_view_response)

let make_delete_billing_view_request ?force:(force_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_; force = force_ } : delete_billing_view_request)

let make_create_billing_view_response
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_; created_at = created_at_ } : create_billing_view_response)

let make_create_billing_view_request ?description:(description_ : billing_view_description option)
    ?data_filter_expression:(data_filter_expression_ : expression option)
    ?client_token:(client_token_ : client_token option)
    ?resource_tags:(resource_tags_ : resource_tag_list option) ~name:(name_ : billing_view_name)
    ~source_views:(source_views_ : billing_view_source_views_list) () =
  ({
     name = name_;
     description = description_;
     source_views = source_views_;
     data_filter_expression = data_filter_expression_;
     client_token = client_token_;
     resource_tags = resource_tags_;
   }
    : create_billing_view_request)

let make_associate_source_views_response ~arn:(arn_ : billing_view_arn) () =
  ({ arn = arn_ } : associate_source_views_response)

let make_associate_source_views_request ~arn:(arn_ : billing_view_arn)
    ~source_views:(source_views_ : billing_view_source_views_list) () =
  ({ arn = arn_; source_views = source_views_ } : associate_source_views_request)
