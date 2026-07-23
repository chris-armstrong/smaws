open Types

let make_tag_option_detail ?key:(key_ : tag_option_key option)
    ?value:(value_ : tag_option_value option) ?active:(active_ : tag_option_active option)
    ?id:(id_ : tag_option_id option) ?owner:(owner_ : owner option) () =
  ({ key = key_; value = value_; active = active_; id = id_; owner = owner_ } : tag_option_detail)

let make_update_tag_option_output ?tag_option_detail:(tag_option_detail_ : tag_option_detail option)
    () =
  ({ tag_option_detail = tag_option_detail_ } : update_tag_option_output)

let make_update_tag_option_input ?value:(value_ : tag_option_value option)
    ?active:(active_ : tag_option_active option) ~id:(id_ : tag_option_id) () =
  ({ id = id_; value = value_; active = active_ } : update_tag_option_input)

let make_service_action_summary ?id:(id_ : id option) ?name:(name_ : service_action_name option)
    ?description:(description_ : service_action_description option)
    ?definition_type:(definition_type_ : service_action_definition_type option) () =
  ({ id = id_; name = name_; description = description_; definition_type = definition_type_ }
    : service_action_summary)

let make_service_action_detail
    ?service_action_summary:(service_action_summary_ : service_action_summary option)
    ?definition:(definition_ : service_action_definition_map option) () =
  ({ service_action_summary = service_action_summary_; definition = definition_ }
    : service_action_detail)

let make_update_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : update_service_action_output)

let make_update_service_action_input ?name:(name_ : service_action_name option)
    ?definition:(definition_ : service_action_definition_map option)
    ?description:(description_ : service_action_description option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({
     id = id_;
     name = name_;
     definition = definition_;
     description = description_;
     accept_language = accept_language_;
   }
    : update_service_action_input)

let make_provisioning_artifact_detail ?id:(id_ : id option)
    ?name:(name_ : provisioning_artifact_name option)
    ?description:(description_ : provisioning_artifact_name option)
    ?type_:(type__ : provisioning_artifact_type option)
    ?created_time:(created_time_ : creation_time option)
    ?active:(active_ : provisioning_artifact_active option)
    ?guidance:(guidance_ : provisioning_artifact_guidance option)
    ?source_revision:(source_revision_ : source_revision option) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     type_ = type__;
     created_time = created_time_;
     active = active_;
     guidance = guidance_;
     source_revision = source_revision_;
   }
    : provisioning_artifact_detail)

let make_update_provisioning_artifact_output
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option)
    ?info:(info_ : provisioning_artifact_info option) ?status:(status_ : status option) () =
  ({ provisioning_artifact_detail = provisioning_artifact_detail_; info = info_; status = status_ }
    : update_provisioning_artifact_output)

let make_update_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ?name:(name_ : provisioning_artifact_name option)
    ?description:(description_ : provisioning_artifact_description option)
    ?active:(active_ : provisioning_artifact_active option)
    ?guidance:(guidance_ : provisioning_artifact_guidance option) ~product_id:(product_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     name = name_;
     description = description_;
     active = active_;
     guidance = guidance_;
   }
    : update_provisioning_artifact_input)

let make_update_provisioned_product_properties_output
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?provisioned_product_properties:
      (provisioned_product_properties_ : provisioned_product_properties option)
    ?record_id:(record_id_ : id option) ?status:(status_ : record_status option) () =
  ({
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_properties = provisioned_product_properties_;
     record_id = record_id_;
     status = status_;
   }
    : update_provisioned_product_properties_output)

let make_update_provisioned_product_properties_input
    ?accept_language:(accept_language_ : accept_language option)
    ~provisioned_product_id:(provisioned_product_id_ : id)
    ~provisioned_product_properties:
      (provisioned_product_properties_ : provisioned_product_properties)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_properties = provisioned_product_properties_;
     idempotency_token = idempotency_token_;
   }
    : update_provisioned_product_properties_input)

let make_record_tag ?key:(key_ : record_tag_key option) ?value:(value_ : record_tag_value option) ()
    =
  ({ key = key_; value = value_ } : record_tag)

let make_record_error ?code:(code_ : error_code option)
    ?description:(description_ : error_description option) () =
  ({ code = code_; description = description_ } : record_error)

let make_record_detail ?record_id:(record_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?status:(status_ : record_status option) ?created_time:(created_time_ : created_time option)
    ?updated_time:(updated_time_ : updated_time option)
    ?provisioned_product_type:(provisioned_product_type_ : provisioned_product_type option)
    ?record_type:(record_type_ : record_type option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?path_id:(path_id_ : id option) ?record_errors:(record_errors_ : record_errors option)
    ?record_tags:(record_tags_ : record_tags option)
    ?launch_role_arn:(launch_role_arn_ : role_arn option) () =
  ({
     record_id = record_id_;
     provisioned_product_name = provisioned_product_name_;
     status = status_;
     created_time = created_time_;
     updated_time = updated_time_;
     provisioned_product_type = provisioned_product_type_;
     record_type = record_type_;
     provisioned_product_id = provisioned_product_id_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     path_id = path_id_;
     record_errors = record_errors_;
     record_tags = record_tags_;
     launch_role_arn = launch_role_arn_;
   }
    : record_detail)

let make_update_provisioned_product_output ?record_detail:(record_detail_ : record_detail option) ()
    =
  ({ record_detail = record_detail_ } : update_provisioned_product_output)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_update_provisioning_preferences
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option)
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option)
    ?stack_set_failure_tolerance_count:
      (stack_set_failure_tolerance_count_ : stack_set_failure_tolerance_count option)
    ?stack_set_failure_tolerance_percentage:
      (stack_set_failure_tolerance_percentage_ : stack_set_failure_tolerance_percentage option)
    ?stack_set_max_concurrency_count:
      (stack_set_max_concurrency_count_ : stack_set_max_concurrency_count option)
    ?stack_set_max_concurrency_percentage:
      (stack_set_max_concurrency_percentage_ : stack_set_max_concurrency_percentage option)
    ?stack_set_operation_type:(stack_set_operation_type_ : stack_set_operation_type option) () =
  ({
     stack_set_accounts = stack_set_accounts_;
     stack_set_regions = stack_set_regions_;
     stack_set_failure_tolerance_count = stack_set_failure_tolerance_count_;
     stack_set_failure_tolerance_percentage = stack_set_failure_tolerance_percentage_;
     stack_set_max_concurrency_count = stack_set_max_concurrency_count_;
     stack_set_max_concurrency_percentage = stack_set_max_concurrency_percentage_;
     stack_set_operation_type = stack_set_operation_type_;
   }
    : update_provisioning_preferences)

let make_update_provisioning_parameter ?key:(key_ : parameter_key option)
    ?value:(value_ : parameter_value option)
    ?use_previous_value:(use_previous_value_ : use_previous_value option) () =
  ({ key = key_; value = value_; use_previous_value = use_previous_value_ }
    : update_provisioning_parameter)

let make_update_provisioned_product_input
    ?accept_language:(accept_language_ : accept_language option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name_or_arn option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?product_id:(product_id_ : id option) ?product_name:(product_name_ : product_view_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?path_id:(path_id_ : id option) ?path_name:(path_name_ : portfolio_display_name option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?provisioning_preferences:(provisioning_preferences_ : update_provisioning_preferences option)
    ?tags:(tags_ : tags option) ~update_token:(update_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     provisioned_product_name = provisioned_product_name_;
     provisioned_product_id = provisioned_product_id_;
     product_id = product_id_;
     product_name = product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     path_id = path_id_;
     path_name = path_name_;
     provisioning_parameters = provisioning_parameters_;
     provisioning_preferences = provisioning_preferences_;
     tags = tags_;
     update_token = update_token_;
   }
    : update_provisioned_product_input)

let make_last_sync ?last_sync_time:(last_sync_time_ : last_sync_time option)
    ?last_sync_status:(last_sync_status_ : last_sync_status option)
    ?last_sync_status_message:(last_sync_status_message_ : last_sync_status_message option)
    ?last_successful_sync_time:(last_successful_sync_time_ : last_successful_sync_time option)
    ?last_successful_sync_provisioning_artifact_id:
      (last_successful_sync_provisioning_artifact_id_ : id option) () =
  ({
     last_sync_time = last_sync_time_;
     last_sync_status = last_sync_status_;
     last_sync_status_message = last_sync_status_message_;
     last_successful_sync_time = last_successful_sync_time_;
     last_successful_sync_provisioning_artifact_id = last_successful_sync_provisioning_artifact_id_;
   }
    : last_sync)

let make_code_star_parameters ~connection_arn:(connection_arn_ : code_star_connection_arn)
    ~repository:(repository_ : repository) ~branch:(branch_ : repository_branch)
    ~artifact_path:(artifact_path_ : repository_artifact_path) () =
  ({
     connection_arn = connection_arn_;
     repository = repository_;
     branch = branch_;
     artifact_path = artifact_path_;
   }
    : code_star_parameters)

let make_source_connection_parameters ?code_star:(code_star_ : code_star_parameters option) () =
  ({ code_star = code_star_ } : source_connection_parameters)

let make_source_connection_detail ?type_:(type__ : source_type option)
    ?connection_parameters:(connection_parameters_ : source_connection_parameters option)
    ?last_sync:(last_sync_ : last_sync option) () =
  ({ type_ = type__; connection_parameters = connection_parameters_; last_sync = last_sync_ }
    : source_connection_detail)

let make_product_view_summary ?id:(id_ : id option) ?product_id:(product_id_ : id option)
    ?name:(name_ : product_view_name option) ?owner:(owner_ : product_view_owner option)
    ?short_description:(short_description_ : product_view_short_description option)
    ?type_:(type__ : product_type option)
    ?distributor:(distributor_ : product_view_distributor option)
    ?has_default_path:(has_default_path_ : has_default_path option)
    ?support_email:(support_email_ : support_email option)
    ?support_description:(support_description_ : support_description option)
    ?support_url:(support_url_ : support_url option) () =
  ({
     id = id_;
     product_id = product_id_;
     name = name_;
     owner = owner_;
     short_description = short_description_;
     type_ = type__;
     distributor = distributor_;
     has_default_path = has_default_path_;
     support_email = support_email_;
     support_description = support_description_;
     support_url = support_url_;
   }
    : product_view_summary)

let make_product_view_detail
    ?product_view_summary:(product_view_summary_ : product_view_summary option)
    ?status:(status_ : status option) ?product_ar_n:(product_ar_n_ : resource_ar_n option)
    ?created_time:(created_time_ : created_time option)
    ?source_connection:(source_connection_ : source_connection_detail option) () =
  ({
     product_view_summary = product_view_summary_;
     status = status_;
     product_ar_n = product_ar_n_;
     created_time = created_time_;
     source_connection = source_connection_;
   }
    : product_view_detail)

let make_update_product_output
    ?product_view_detail:(product_view_detail_ : product_view_detail option)
    ?tags:(tags_ : tags option) () =
  ({ product_view_detail = product_view_detail_; tags = tags_ } : update_product_output)

let make_source_connection ?type_:(type__ : source_type option)
    ~connection_parameters:(connection_parameters_ : source_connection_parameters) () =
  ({ type_ = type__; connection_parameters = connection_parameters_ } : source_connection)

let make_update_product_input ?accept_language:(accept_language_ : accept_language option)
    ?name:(name_ : product_view_name option) ?owner:(owner_ : product_view_owner option)
    ?description:(description_ : product_view_short_description option)
    ?distributor:(distributor_ : product_view_owner option)
    ?support_description:(support_description_ : support_description option)
    ?support_email:(support_email_ : support_email option)
    ?support_url:(support_url_ : support_url option) ?add_tags:(add_tags_ : add_tags option)
    ?remove_tags:(remove_tags_ : tag_keys option)
    ?source_connection:(source_connection_ : source_connection option) ~id:(id_ : id) () =
  ({
     accept_language = accept_language_;
     id = id_;
     name = name_;
     owner = owner_;
     description = description_;
     distributor = distributor_;
     support_description = support_description_;
     support_email = support_email_;
     support_url = support_url_;
     add_tags = add_tags_;
     remove_tags = remove_tags_;
     source_connection = source_connection_;
   }
    : update_product_input)

let make_update_portfolio_share_output ?portfolio_share_token:(portfolio_share_token_ : id option)
    ?status:(status_ : share_status option) () =
  ({ portfolio_share_token = portfolio_share_token_; status = status_ }
    : update_portfolio_share_output)

let make_organization_node ?type_:(type__ : organization_node_type option)
    ?value:(value_ : organization_node_value option) () =
  ({ type_ = type__; value = value_ } : organization_node)

let make_update_portfolio_share_input ?accept_language:(accept_language_ : accept_language option)
    ?account_id:(account_id_ : account_id option)
    ?organization_node:(organization_node_ : organization_node option)
    ?share_tag_options:(share_tag_options_ : nullable_boolean option)
    ?share_principals:(share_principals_ : nullable_boolean option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     account_id = account_id_;
     organization_node = organization_node_;
     share_tag_options = share_tag_options_;
     share_principals = share_principals_;
   }
    : update_portfolio_share_input)

let make_portfolio_detail ?id:(id_ : id option) ?ar_n:(ar_n_ : resource_ar_n option)
    ?display_name:(display_name_ : portfolio_display_name option)
    ?description:(description_ : portfolio_description option)
    ?created_time:(created_time_ : creation_time option)
    ?provider_name:(provider_name_ : provider_name option) () =
  ({
     id = id_;
     ar_n = ar_n_;
     display_name = display_name_;
     description = description_;
     created_time = created_time_;
     provider_name = provider_name_;
   }
    : portfolio_detail)

let make_update_portfolio_output ?portfolio_detail:(portfolio_detail_ : portfolio_detail option)
    ?tags:(tags_ : tags option) () =
  ({ portfolio_detail = portfolio_detail_; tags = tags_ } : update_portfolio_output)

let make_update_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ?display_name:(display_name_ : portfolio_display_name option)
    ?description:(description_ : portfolio_description option)
    ?provider_name:(provider_name_ : provider_name option) ?add_tags:(add_tags_ : add_tags option)
    ?remove_tags:(remove_tags_ : tag_keys option) ~id:(id_ : id) () =
  ({
     accept_language = accept_language_;
     id = id_;
     display_name = display_name_;
     description = description_;
     provider_name = provider_name_;
     add_tags = add_tags_;
     remove_tags = remove_tags_;
   }
    : update_portfolio_input)

let make_constraint_detail ?constraint_id:(constraint_id_ : id option)
    ?type_:(type__ : constraint_type option)
    ?description:(description_ : constraint_description option) ?owner:(owner_ : account_id option)
    ?product_id:(product_id_ : id option) ?portfolio_id:(portfolio_id_ : id option) () =
  ({
     constraint_id = constraint_id_;
     type_ = type__;
     description = description_;
     owner = owner_;
     product_id = product_id_;
     portfolio_id = portfolio_id_;
   }
    : constraint_detail)

let make_update_constraint_output ?constraint_detail:(constraint_detail_ : constraint_detail option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?status:(status_ : status option) () =
  ({
     constraint_detail = constraint_detail_;
     constraint_parameters = constraint_parameters_;
     status = status_;
   }
    : update_constraint_output)

let make_update_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : constraint_description option)
    ?parameters:(parameters_ : constraint_parameters option) ~id:(id_ : id) () =
  ({
     accept_language = accept_language_;
     id = id_;
     description = description_;
     parameters = parameters_;
   }
    : update_constraint_input)

let make_terminate_provisioned_product_output ?record_detail:(record_detail_ : record_detail option)
    () =
  ({ record_detail = record_detail_ } : terminate_provisioned_product_output)

let make_terminate_provisioned_product_input
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name_or_arn option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?ignore_errors:(ignore_errors_ : ignore_errors option)
    ?accept_language:(accept_language_ : accept_language option)
    ?retain_physical_resources:(retain_physical_resources_ : retain_physical_resources option)
    ~terminate_token:(terminate_token_ : idempotency_token) () =
  ({
     provisioned_product_name = provisioned_product_name_;
     provisioned_product_id = provisioned_product_id_;
     terminate_token = terminate_token_;
     ignore_errors = ignore_errors_;
     accept_language = accept_language_;
     retain_physical_resources = retain_physical_resources_;
   }
    : terminate_provisioned_product_input)

let make_provisioned_product_attribute ?name:(name_ : provisioned_product_name_or_arn option)
    ?arn:(arn_ : provisioned_product_name_or_arn option)
    ?type_:(type__ : provisioned_product_type option) ?id:(id_ : id option)
    ?status:(status_ : provisioned_product_status option)
    ?status_message:(status_message_ : provisioned_product_status_message option)
    ?created_time:(created_time_ : created_time option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?last_record_id:(last_record_id_ : id option)
    ?last_provisioning_record_id:(last_provisioning_record_id_ : id option)
    ?last_successful_provisioning_record_id:(last_successful_provisioning_record_id_ : id option)
    ?tags:(tags_ : tags option) ?physical_id:(physical_id_ : physical_id option)
    ?product_id:(product_id_ : id option) ?product_name:(product_name_ : product_view_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?user_arn:(user_arn_ : user_arn option)
    ?user_arn_session:(user_arn_session_ : user_arn_session option) () =
  ({
     name = name_;
     arn = arn_;
     type_ = type__;
     id = id_;
     status = status_;
     status_message = status_message_;
     created_time = created_time_;
     idempotency_token = idempotency_token_;
     last_record_id = last_record_id_;
     last_provisioning_record_id = last_provisioning_record_id_;
     last_successful_provisioning_record_id = last_successful_provisioning_record_id_;
     tags = tags_;
     physical_id = physical_id_;
     product_id = product_id_;
     product_name = product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     user_arn = user_arn_;
     user_arn_session = user_arn_session_;
   }
    : provisioned_product_attribute)

let make_search_provisioned_products_output
    ?provisioned_products:(provisioned_products_ : provisioned_product_attributes option)
    ?total_results_count:(total_results_count_ : total_results_count option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     provisioned_products = provisioned_products_;
     total_results_count = total_results_count_;
     next_page_token = next_page_token_;
   }
    : search_provisioned_products_output)

let make_access_level_filter ?key:(key_ : access_level_filter_key option)
    ?value:(value_ : access_level_filter_value option) () =
  ({ key = key_; value = value_ } : access_level_filter)

let make_search_provisioned_products_input
    ?accept_language:(accept_language_ : accept_language option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?filters:(filters_ : provisioned_product_filters option) ?sort_by:(sort_by_ : sort_field option)
    ?sort_order:(sort_order_ : sort_order option)
    ?page_size:(page_size_ : search_provisioned_products_page_size option)
    ?page_token:(page_token_ : page_token option) () =
  ({
     accept_language = accept_language_;
     access_level_filter = access_level_filter_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : search_provisioned_products_input)

let make_search_products_as_admin_output
    ?product_view_details:(product_view_details_ : product_view_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ product_view_details = product_view_details_; next_page_token = next_page_token_ }
    : search_products_as_admin_output)

let make_search_products_as_admin_input ?accept_language:(accept_language_ : accept_language option)
    ?portfolio_id:(portfolio_id_ : id option) ?filters:(filters_ : product_view_filters option)
    ?sort_by:(sort_by_ : product_view_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ?product_source:(product_source_ : product_source option) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     page_token = page_token_;
     page_size = page_size_;
     product_source = product_source_;
   }
    : search_products_as_admin_input)

let make_product_view_aggregation_value ?value:(value_ : attribute_value option)
    ?approximate_count:(approximate_count_ : approximate_count option) () =
  ({ value = value_; approximate_count = approximate_count_ } : product_view_aggregation_value)

let make_search_products_output
    ?product_view_summaries:(product_view_summaries_ : product_view_summaries option)
    ?product_view_aggregations:(product_view_aggregations_ : product_view_aggregations option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     product_view_summaries = product_view_summaries_;
     product_view_aggregations = product_view_aggregations_;
     next_page_token = next_page_token_;
   }
    : search_products_output)

let make_search_products_input ?accept_language:(accept_language_ : accept_language option)
    ?filters:(filters_ : product_view_filters option)
    ?page_size:(page_size_ : page_size_max100 option)
    ?sort_by:(sort_by_ : product_view_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?page_token:(page_token_ : page_token option) () =
  ({
     accept_language = accept_language_;
     filters = filters_;
     page_size = page_size_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     page_token = page_token_;
   }
    : search_products_input)

let make_provisioned_product_detail ?name:(name_ : provisioned_product_name_or_arn option)
    ?arn:(arn_ : provisioned_product_name_or_arn option)
    ?type_:(type__ : provisioned_product_type option) ?id:(id_ : provisioned_product_id option)
    ?status:(status_ : provisioned_product_status option)
    ?status_message:(status_message_ : provisioned_product_status_message option)
    ?created_time:(created_time_ : created_time option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?last_record_id:(last_record_id_ : last_request_id option)
    ?last_provisioning_record_id:(last_provisioning_record_id_ : id option)
    ?last_successful_provisioning_record_id:(last_successful_provisioning_record_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?launch_role_arn:(launch_role_arn_ : role_arn option) () =
  ({
     name = name_;
     arn = arn_;
     type_ = type__;
     id = id_;
     status = status_;
     status_message = status_message_;
     created_time = created_time_;
     idempotency_token = idempotency_token_;
     last_record_id = last_record_id_;
     last_provisioning_record_id = last_provisioning_record_id_;
     last_successful_provisioning_record_id = last_successful_provisioning_record_id_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     launch_role_arn = launch_role_arn_;
   }
    : provisioned_product_detail)

let make_scan_provisioned_products_output
    ?provisioned_products:(provisioned_products_ : provisioned_product_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ provisioned_products = provisioned_products_; next_page_token = next_page_token_ }
    : scan_provisioned_products_output)

let make_scan_provisioned_products_input
    ?accept_language:(accept_language_ : accept_language option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option) () =
  ({
     accept_language = accept_language_;
     access_level_filter = access_level_filter_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : scan_provisioned_products_input)

let make_reject_portfolio_share_output () = (() : unit)

let make_reject_portfolio_share_input ?accept_language:(accept_language_ : accept_language option)
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     portfolio_share_type = portfolio_share_type_;
   }
    : reject_portfolio_share_input)

let make_provision_product_output ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : provision_product_output)

let make_provisioning_preferences
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option)
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option)
    ?stack_set_failure_tolerance_count:
      (stack_set_failure_tolerance_count_ : stack_set_failure_tolerance_count option)
    ?stack_set_failure_tolerance_percentage:
      (stack_set_failure_tolerance_percentage_ : stack_set_failure_tolerance_percentage option)
    ?stack_set_max_concurrency_count:
      (stack_set_max_concurrency_count_ : stack_set_max_concurrency_count option)
    ?stack_set_max_concurrency_percentage:
      (stack_set_max_concurrency_percentage_ : stack_set_max_concurrency_percentage option) () =
  ({
     stack_set_accounts = stack_set_accounts_;
     stack_set_regions = stack_set_regions_;
     stack_set_failure_tolerance_count = stack_set_failure_tolerance_count_;
     stack_set_failure_tolerance_percentage = stack_set_failure_tolerance_percentage_;
     stack_set_max_concurrency_count = stack_set_max_concurrency_count_;
     stack_set_max_concurrency_percentage = stack_set_max_concurrency_percentage_;
   }
    : provisioning_preferences)

let make_provisioning_parameter ?key:(key_ : parameter_key option)
    ?value:(value_ : parameter_value option) () =
  ({ key = key_; value = value_ } : provisioning_parameter)

let make_provision_product_input ?accept_language:(accept_language_ : accept_language option)
    ?product_id:(product_id_ : id option) ?product_name:(product_name_ : product_view_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?path_id:(path_id_ : id option) ?path_name:(path_name_ : portfolio_display_name option)
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option)
    ?provisioning_preferences:(provisioning_preferences_ : provisioning_preferences option)
    ?tags:(tags_ : tags option) ?notification_arns:(notification_arns_ : notification_arns option)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name)
    ~provision_token:(provision_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     product_name = product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     path_id = path_id_;
     path_name = path_name_;
     provisioned_product_name = provisioned_product_name_;
     provisioning_parameters = provisioning_parameters_;
     provisioning_preferences = provisioning_preferences_;
     tags = tags_;
     notification_arns = notification_arns_;
     provision_token = provision_token_;
   }
    : provision_product_input)

let make_notify_update_provisioned_product_engine_workflow_result_output () = (() : unit)

let make_record_output ?output_key:(output_key_ : output_key option)
    ?output_value:(output_value_ : output_value option)
    ?description:(description_ : description option) () =
  ({ output_key = output_key_; output_value = output_value_; description = description_ }
    : record_output)

let make_notify_update_provisioned_product_engine_workflow_result_input
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ?outputs:(outputs_ : record_outputs option)
    ~workflow_token:(workflow_token_ : engine_workflow_token) ~record_id:(record_id_ : id)
    ~status:(status_ : engine_workflow_status)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     workflow_token = workflow_token_;
     record_id = record_id_;
     status = status_;
     failure_reason = failure_reason_;
     outputs = outputs_;
     idempotency_token = idempotency_token_;
   }
    : notify_update_provisioned_product_engine_workflow_result_input)

let make_notify_terminate_provisioned_product_engine_workflow_result_output () = (() : unit)

let make_notify_terminate_provisioned_product_engine_workflow_result_input
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ~workflow_token:(workflow_token_ : engine_workflow_token) ~record_id:(record_id_ : id)
    ~status:(status_ : engine_workflow_status)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     workflow_token = workflow_token_;
     record_id = record_id_;
     status = status_;
     failure_reason = failure_reason_;
     idempotency_token = idempotency_token_;
   }
    : notify_terminate_provisioned_product_engine_workflow_result_input)

let make_notify_provision_product_engine_workflow_result_output () = (() : unit)

let make_unique_tag_resource_identifier ?key:(key_ : unique_tag_key option)
    ?value:(value_ : unique_tag_value option) () =
  ({ key = key_; value = value_ } : unique_tag_resource_identifier)

let make_engine_workflow_resource_identifier
    ?unique_tag:(unique_tag_ : unique_tag_resource_identifier option) () =
  ({ unique_tag = unique_tag_ } : engine_workflow_resource_identifier)

let make_notify_provision_product_engine_workflow_result_input
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ?resource_identifier:(resource_identifier_ : engine_workflow_resource_identifier option)
    ?outputs:(outputs_ : record_outputs option)
    ~workflow_token:(workflow_token_ : engine_workflow_token) ~record_id:(record_id_ : id)
    ~status:(status_ : engine_workflow_status)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     workflow_token = workflow_token_;
     record_id = record_id_;
     status = status_;
     failure_reason = failure_reason_;
     resource_identifier = resource_identifier_;
     outputs = outputs_;
     idempotency_token = idempotency_token_;
   }
    : notify_provision_product_engine_workflow_result_input)

let make_list_tag_options_output
    ?tag_option_details:(tag_option_details_ : tag_option_details option)
    ?page_token:(page_token_ : page_token option) () =
  ({ tag_option_details = tag_option_details_; page_token = page_token_ } : list_tag_options_output)

let make_list_tag_options_filters ?key:(key_ : tag_option_key option)
    ?value:(value_ : tag_option_value option) ?active:(active_ : tag_option_active option) () =
  ({ key = key_; value = value_; active = active_ } : list_tag_options_filters)

let make_list_tag_options_input ?filters:(filters_ : list_tag_options_filters option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option) () =
  ({ filters = filters_; page_size = page_size_; page_token = page_token_ }
    : list_tag_options_input)

let make_stack_instance ?account:(account_ : account_id option) ?region:(region_ : region option)
    ?stack_instance_status:(stack_instance_status_ : stack_instance_status option) () =
  ({ account = account_; region = region_; stack_instance_status = stack_instance_status_ }
    : stack_instance)

let make_list_stack_instances_for_provisioned_product_output
    ?stack_instances:(stack_instances_ : stack_instances option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ stack_instances = stack_instances_; next_page_token = next_page_token_ }
    : list_stack_instances_for_provisioned_product_output)

let make_list_stack_instances_for_provisioned_product_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ~provisioned_product_id:(provisioned_product_id_ : id) () =
  ({
     accept_language = accept_language_;
     provisioned_product_id = provisioned_product_id_;
     page_token = page_token_;
     page_size = page_size_;
   }
    : list_stack_instances_for_provisioned_product_input)

let make_list_service_actions_for_provisioning_artifact_output
    ?service_action_summaries:(service_action_summaries_ : service_action_summaries option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ service_action_summaries = service_action_summaries_; next_page_token = next_page_token_ }
    : list_service_actions_for_provisioning_artifact_output)

let make_list_service_actions_for_provisioning_artifact_input
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) () =
  ({
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     page_size = page_size_;
     page_token = page_token_;
     accept_language = accept_language_;
   }
    : list_service_actions_for_provisioning_artifact_input)

let make_list_service_actions_output
    ?service_action_summaries:(service_action_summaries_ : service_action_summaries option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ service_action_summaries = service_action_summaries_; next_page_token = next_page_token_ }
    : list_service_actions_output)

let make_list_service_actions_input ?accept_language:(accept_language_ : accept_language option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option) () =
  ({ accept_language = accept_language_; page_size = page_size_; page_token = page_token_ }
    : list_service_actions_input)

let make_resource_detail ?id:(id_ : resource_detail_id option)
    ?ar_n:(ar_n_ : resource_detail_ar_n option) ?name:(name_ : resource_detail_name option)
    ?description:(description_ : resource_detail_description option)
    ?created_time:(created_time_ : resource_detail_created_time option) () =
  ({
     id = id_;
     ar_n = ar_n_;
     name = name_;
     description = description_;
     created_time = created_time_;
   }
    : resource_detail)

let make_list_resources_for_tag_option_output
    ?resource_details:(resource_details_ : resource_details option)
    ?page_token:(page_token_ : page_token option) () =
  ({ resource_details = resource_details_; page_token = page_token_ }
    : list_resources_for_tag_option_output)

let make_list_resources_for_tag_option_input ?resource_type:(resource_type_ : resource_type option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ~tag_option_id:(tag_option_id_ : tag_option_id) () =
  ({
     tag_option_id = tag_option_id_;
     resource_type = resource_type_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_resources_for_tag_option_input)

let make_list_record_history_output ?record_details:(record_details_ : record_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ record_details = record_details_; next_page_token = next_page_token_ }
    : list_record_history_output)

let make_list_record_history_search_filter ?key:(key_ : search_filter_key option)
    ?value:(value_ : search_filter_value option) () =
  ({ key = key_; value = value_ } : list_record_history_search_filter)

let make_list_record_history_input ?accept_language:(accept_language_ : accept_language option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?search_filter:(search_filter_ : list_record_history_search_filter option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option) () =
  ({
     accept_language = accept_language_;
     access_level_filter = access_level_filter_;
     search_filter = search_filter_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_record_history_input)

let make_provisioning_artifact ?id:(id_ : id option)
    ?name:(name_ : provisioning_artifact_name option)
    ?description:(description_ : provisioning_artifact_description option)
    ?created_time:(created_time_ : provisioning_artifact_created_time option)
    ?guidance:(guidance_ : provisioning_artifact_guidance option) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     created_time = created_time_;
     guidance = guidance_;
   }
    : provisioning_artifact)

let make_provisioning_artifact_view
    ?product_view_summary:(product_view_summary_ : product_view_summary option)
    ?provisioning_artifact:(provisioning_artifact_ : provisioning_artifact option) () =
  ({ product_view_summary = product_view_summary_; provisioning_artifact = provisioning_artifact_ }
    : provisioning_artifact_view)

let make_list_provisioning_artifacts_for_service_action_output
    ?provisioning_artifact_views:(provisioning_artifact_views_ : provisioning_artifact_views option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     provisioning_artifact_views = provisioning_artifact_views_;
     next_page_token = next_page_token_;
   }
    : list_provisioning_artifacts_for_service_action_output)

let make_list_provisioning_artifacts_for_service_action_input
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_id:(service_action_id_ : id) () =
  ({
     service_action_id = service_action_id_;
     page_size = page_size_;
     page_token = page_token_;
     accept_language = accept_language_;
   }
    : list_provisioning_artifacts_for_service_action_input)

let make_list_provisioning_artifacts_output
    ?provisioning_artifact_details:
      (provisioning_artifact_details_ : provisioning_artifact_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     provisioning_artifact_details = provisioning_artifact_details_;
     next_page_token = next_page_token_;
   }
    : list_provisioning_artifacts_output)

let make_list_provisioning_artifacts_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id) () =
  ({ accept_language = accept_language_; product_id = product_id_ }
    : list_provisioning_artifacts_input)

let make_provisioned_product_plan_summary
    ?plan_name:(plan_name_ : provisioned_product_plan_name option) ?plan_id:(plan_id_ : id option)
    ?provision_product_id:(provision_product_id_ : id option)
    ?provision_product_name:(provision_product_name_ : provisioned_product_name option)
    ?plan_type:(plan_type_ : provisioned_product_plan_type option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option) () =
  ({
     plan_name = plan_name_;
     plan_id = plan_id_;
     provision_product_id = provision_product_id_;
     provision_product_name = provision_product_name_;
     plan_type = plan_type_;
     provisioning_artifact_id = provisioning_artifact_id_;
   }
    : provisioned_product_plan_summary)

let make_list_provisioned_product_plans_output
    ?provisioned_product_plans:(provisioned_product_plans_ : provisioned_product_plans option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ provisioned_product_plans = provisioned_product_plans_; next_page_token = next_page_token_ }
    : list_provisioned_product_plans_output)

let make_list_provisioned_product_plans_input
    ?accept_language:(accept_language_ : accept_language option)
    ?provision_product_id:(provision_product_id_ : id option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option) () =
  ({
     accept_language = accept_language_;
     provision_product_id = provision_product_id_;
     page_size = page_size_;
     page_token = page_token_;
     access_level_filter = access_level_filter_;
   }
    : list_provisioned_product_plans_input)

let make_principal ?principal_ar_n:(principal_ar_n_ : principal_ar_n option)
    ?principal_type:(principal_type_ : principal_type option) () =
  ({ principal_ar_n = principal_ar_n_; principal_type = principal_type_ } : principal)

let make_list_principals_for_portfolio_output ?principals:(principals_ : principals option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ principals = principals_; next_page_token = next_page_token_ }
    : list_principals_for_portfolio_output)

let make_list_principals_for_portfolio_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_principals_for_portfolio_input)

let make_list_portfolios_for_product_output
    ?portfolio_details:(portfolio_details_ : portfolio_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ portfolio_details = portfolio_details_; next_page_token = next_page_token_ }
    : list_portfolios_for_product_output)

let make_list_portfolios_for_product_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size_max100 option)
    ~product_id:(product_id_ : id) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     page_token = page_token_;
     page_size = page_size_;
   }
    : list_portfolios_for_product_input)

let make_list_portfolios_output ?portfolio_details:(portfolio_details_ : portfolio_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ portfolio_details = portfolio_details_; next_page_token = next_page_token_ }
    : list_portfolios_output)

let make_list_portfolios_input ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size_max100 option)
    () =
  ({ accept_language = accept_language_; page_token = page_token_; page_size = page_size_ }
    : list_portfolios_input)

let make_list_portfolio_access_output ?account_ids:(account_ids_ : account_ids option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ account_ids = account_ids_; next_page_token = next_page_token_ }
    : list_portfolio_access_output)

let make_list_portfolio_access_input ?accept_language:(accept_language_ : accept_language option)
    ?organization_parent_id:(organization_parent_id_ : id option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size_max100 option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     organization_parent_id = organization_parent_id_;
     page_token = page_token_;
     page_size = page_size_;
   }
    : list_portfolio_access_input)

let make_list_organization_portfolio_access_output
    ?organization_nodes:(organization_nodes_ : organization_nodes option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ organization_nodes = organization_nodes_; next_page_token = next_page_token_ }
    : list_organization_portfolio_access_output)

let make_list_organization_portfolio_access_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ~portfolio_id:(portfolio_id_ : id)
    ~organization_node_type:(organization_node_type_ : organization_node_type) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     organization_node_type = organization_node_type_;
     page_token = page_token_;
     page_size = page_size_;
   }
    : list_organization_portfolio_access_input)

let make_constraint_summary ?type_:(type__ : constraint_type option)
    ?description:(description_ : constraint_description option) () =
  ({ type_ = type__; description = description_ } : constraint_summary)

let make_launch_path_summary ?id:(id_ : id option)
    ?constraint_summaries:(constraint_summaries_ : constraint_summaries option)
    ?tags:(tags_ : tags option) ?name:(name_ : portfolio_name option) () =
  ({ id = id_; constraint_summaries = constraint_summaries_; tags = tags_; name = name_ }
    : launch_path_summary)

let make_list_launch_paths_output
    ?launch_path_summaries:(launch_path_summaries_ : launch_path_summaries option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ launch_path_summaries = launch_path_summaries_; next_page_token = next_page_token_ }
    : list_launch_paths_output)

let make_list_launch_paths_input ?accept_language:(accept_language_ : accept_language option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ~product_id:(product_id_ : id) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_launch_paths_input)

let make_list_constraints_for_portfolio_output
    ?constraint_details:(constraint_details_ : constraint_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ constraint_details = constraint_details_; next_page_token = next_page_token_ }
    : list_constraints_for_portfolio_output)

let make_list_constraints_for_portfolio_input
    ?accept_language:(accept_language_ : accept_language option)
    ?product_id:(product_id_ : id option) ?page_size:(page_size_ : page_size option)
    ?page_token:(page_token_ : page_token option) ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     product_id = product_id_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_constraints_for_portfolio_input)

let make_budget_detail ?budget_name:(budget_name_ : budget_name option) () =
  ({ budget_name = budget_name_ } : budget_detail)

let make_list_budgets_for_resource_output ?budgets:(budgets_ : budgets option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ budgets = budgets_; next_page_token = next_page_token_ } : list_budgets_for_resource_output)

let make_list_budgets_for_resource_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ~resource_id:(resource_id_ : id) () =
  ({
     accept_language = accept_language_;
     resource_id = resource_id_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : list_budgets_for_resource_input)

let make_list_accepted_portfolio_shares_output
    ?portfolio_details:(portfolio_details_ : portfolio_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ portfolio_details = portfolio_details_; next_page_token = next_page_token_ }
    : list_accepted_portfolio_shares_output)

let make_list_accepted_portfolio_shares_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size_max100 option)
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option) () =
  ({
     accept_language = accept_language_;
     page_token = page_token_;
     page_size = page_size_;
     portfolio_share_type = portfolio_share_type_;
   }
    : list_accepted_portfolio_shares_input)

let make_import_as_provisioned_product_output ?record_detail:(record_detail_ : record_detail option)
    () =
  ({ record_detail = record_detail_ } : import_as_provisioned_product_output)

let make_import_as_provisioned_product_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name)
    ~physical_id:(physical_id_ : physical_id)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioned_product_name = provisioned_product_name_;
     physical_id = physical_id_;
     idempotency_token = idempotency_token_;
   }
    : import_as_provisioned_product_input)

let make_get_provisioned_product_outputs_output ?outputs:(outputs_ : record_outputs option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ outputs = outputs_; next_page_token = next_page_token_ }
    : get_provisioned_product_outputs_output)

let make_get_provisioned_product_outputs_input
    ?accept_language:(accept_language_ : accept_language option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?output_keys:(output_keys_ : output_keys option) ?page_size:(page_size_ : page_size option)
    ?page_token:(page_token_ : page_token option) () =
  ({
     accept_language = accept_language_;
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_name = provisioned_product_name_;
     output_keys = output_keys_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : get_provisioned_product_outputs_input)

let make_get_aws_organizations_access_status_output
    ?access_status:(access_status_ : access_status option) () =
  ({ access_status = access_status_ } : get_aws_organizations_access_status_output)

let make_get_aws_organizations_access_status_input () = (() : unit)

let make_execute_provisioned_product_service_action_output
    ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : execute_provisioned_product_service_action_output)

let make_execute_provisioned_product_service_action_input
    ?accept_language:(accept_language_ : accept_language option)
    ?parameters:(parameters_ : execution_parameter_map option)
    ~provisioned_product_id:(provisioned_product_id_ : id)
    ~service_action_id:(service_action_id_ : id) ~execute_token:(execute_token_ : idempotency_token)
    () =
  ({
     provisioned_product_id = provisioned_product_id_;
     service_action_id = service_action_id_;
     execute_token = execute_token_;
     accept_language = accept_language_;
     parameters = parameters_;
   }
    : execute_provisioned_product_service_action_input)

let make_execute_provisioned_product_plan_output
    ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : execute_provisioned_product_plan_output)

let make_execute_provisioned_product_plan_input
    ?accept_language:(accept_language_ : accept_language option) ~plan_id:(plan_id_ : id)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     plan_id = plan_id_;
     idempotency_token = idempotency_token_;
   }
    : execute_provisioned_product_plan_input)

let make_enable_aws_organizations_access_output () = (() : unit)
let make_enable_aws_organizations_access_input () = (() : unit)
let make_disassociate_tag_option_from_resource_output () = (() : unit)

let make_disassociate_tag_option_from_resource_input ~resource_id:(resource_id_ : resource_id)
    ~tag_option_id:(tag_option_id_ : tag_option_id) () =
  ({ resource_id = resource_id_; tag_option_id = tag_option_id_ }
    : disassociate_tag_option_from_resource_input)

let make_disassociate_service_action_from_provisioning_artifact_output () = (() : unit)

let make_disassociate_service_action_from_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~product_id:(product_id_ : id) ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~service_action_id:(service_action_id_ : id) () =
  ({
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     service_action_id = service_action_id_;
     accept_language = accept_language_;
     idempotency_token = idempotency_token_;
   }
    : disassociate_service_action_from_provisioning_artifact_input)

let make_disassociate_product_from_portfolio_output () = (() : unit)

let make_disassociate_product_from_portfolio_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({ accept_language = accept_language_; product_id = product_id_; portfolio_id = portfolio_id_ }
    : disassociate_product_from_portfolio_input)

let make_disassociate_principal_from_portfolio_output () = (() : unit)

let make_disassociate_principal_from_portfolio_input
    ?accept_language:(accept_language_ : accept_language option)
    ?principal_type:(principal_type_ : principal_type option) ~portfolio_id:(portfolio_id_ : id)
    ~principal_ar_n:(principal_ar_n_ : principal_ar_n) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     principal_ar_n = principal_ar_n_;
     principal_type = principal_type_;
   }
    : disassociate_principal_from_portfolio_input)

let make_disassociate_budget_from_resource_output () = (() : unit)

let make_disassociate_budget_from_resource_input ~budget_name:(budget_name_ : budget_name)
    ~resource_id:(resource_id_ : id) () =
  ({ budget_name = budget_name_; resource_id = resource_id_ }
    : disassociate_budget_from_resource_input)

let make_disable_aws_organizations_access_output () = (() : unit)
let make_disable_aws_organizations_access_input () = (() : unit)

let make_describe_tag_option_output
    ?tag_option_detail:(tag_option_detail_ : tag_option_detail option) () =
  ({ tag_option_detail = tag_option_detail_ } : describe_tag_option_output)

let make_describe_tag_option_input ~id:(id_ : tag_option_id) () =
  ({ id = id_ } : describe_tag_option_input)

let make_execution_parameter ?name:(name_ : execution_parameter_key option)
    ?type_:(type__ : execution_parameter_type option)
    ?default_values:(default_values_ : execution_parameter_value_list option) () =
  ({ name = name_; type_ = type__; default_values = default_values_ } : execution_parameter)

let make_describe_service_action_execution_parameters_output
    ?service_action_parameters:(service_action_parameters_ : execution_parameters option) () =
  ({ service_action_parameters = service_action_parameters_ }
    : describe_service_action_execution_parameters_output)

let make_describe_service_action_execution_parameters_input
    ?accept_language:(accept_language_ : accept_language option)
    ~provisioned_product_id:(provisioned_product_id_ : id)
    ~service_action_id:(service_action_id_ : id) () =
  ({
     provisioned_product_id = provisioned_product_id_;
     service_action_id = service_action_id_;
     accept_language = accept_language_;
   }
    : describe_service_action_execution_parameters_input)

let make_describe_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : describe_service_action_output)

let make_describe_service_action_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : describe_service_action_input)

let make_describe_record_output ?record_detail:(record_detail_ : record_detail option)
    ?record_outputs:(record_outputs_ : record_outputs option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     record_detail = record_detail_;
     record_outputs = record_outputs_;
     next_page_token = next_page_token_;
   }
    : describe_record_output)

let make_describe_record_input ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ~id:(id_ : id) () =
  ({
     accept_language = accept_language_;
     id = id_;
     page_token = page_token_;
     page_size = page_size_;
   }
    : describe_record_input)

let make_provisioning_artifact_output ?key:(key_ : provisioning_artifact_output_key option)
    ?description:(description_ : output_description option) () =
  ({ key = key_; description = description_ } : provisioning_artifact_output)

let make_provisioning_artifact_preferences
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option)
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option) () =
  ({ stack_set_accounts = stack_set_accounts_; stack_set_regions = stack_set_regions_ }
    : provisioning_artifact_preferences)

let make_tag_option_summary ?key:(key_ : tag_option_key option)
    ?values:(values_ : tag_option_values option) () =
  ({ key = key_; values = values_ } : tag_option_summary)

let make_usage_instruction ?type_:(type__ : instruction_type option)
    ?value:(value_ : instruction_value option) () =
  ({ type_ = type__; value = value_ } : usage_instruction)

let make_parameter_constraints ?allowed_values:(allowed_values_ : allowed_values option)
    ?allowed_pattern:(allowed_pattern_ : string_ option)
    ?constraint_description:(constraint_description_ : string_ option)
    ?max_length:(max_length_ : string_ option) ?min_length:(min_length_ : string_ option)
    ?max_value:(max_value_ : string_ option) ?min_value:(min_value_ : string_ option) () =
  ({
     allowed_values = allowed_values_;
     allowed_pattern = allowed_pattern_;
     constraint_description = constraint_description_;
     max_length = max_length_;
     min_length = min_length_;
     max_value = max_value_;
     min_value = min_value_;
   }
    : parameter_constraints)

let make_provisioning_artifact_parameter ?parameter_key:(parameter_key_ : parameter_key option)
    ?default_value:(default_value_ : default_value option)
    ?parameter_type:(parameter_type_ : parameter_type option)
    ?is_no_echo:(is_no_echo_ : no_echo option) ?description:(description_ : description option)
    ?parameter_constraints:(parameter_constraints_ : parameter_constraints option) () =
  ({
     parameter_key = parameter_key_;
     default_value = default_value_;
     parameter_type = parameter_type_;
     is_no_echo = is_no_echo_;
     description = description_;
     parameter_constraints = parameter_constraints_;
   }
    : provisioning_artifact_parameter)

let make_describe_provisioning_parameters_output
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_parameters option)
    ?constraint_summaries:(constraint_summaries_ : constraint_summaries option)
    ?usage_instructions:(usage_instructions_ : usage_instructions option)
    ?tag_options:(tag_options_ : tag_option_summaries option)
    ?provisioning_artifact_preferences:
      (provisioning_artifact_preferences_ : provisioning_artifact_preferences option)
    ?provisioning_artifact_outputs:
      (provisioning_artifact_outputs_ : provisioning_artifact_outputs option)
    ?provisioning_artifact_output_keys:
      (provisioning_artifact_output_keys_ : provisioning_artifact_outputs option) () =
  ({
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
     constraint_summaries = constraint_summaries_;
     usage_instructions = usage_instructions_;
     tag_options = tag_options_;
     provisioning_artifact_preferences = provisioning_artifact_preferences_;
     provisioning_artifact_outputs = provisioning_artifact_outputs_;
     provisioning_artifact_output_keys = provisioning_artifact_output_keys_;
   }
    : describe_provisioning_parameters_output)

let make_describe_provisioning_parameters_input
    ?accept_language:(accept_language_ : accept_language option)
    ?product_id:(product_id_ : id option) ?product_name:(product_name_ : product_view_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?path_id:(path_id_ : id option) ?path_name:(path_name_ : portfolio_display_name option) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     product_name = product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     path_id = path_id_;
     path_name = path_name_;
   }
    : describe_provisioning_parameters_input)

let make_describe_provisioning_artifact_output
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option)
    ?info:(info_ : provisioning_artifact_info option) ?status:(status_ : status option)
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_parameters option) () =
  ({
     provisioning_artifact_detail = provisioning_artifact_detail_;
     info = info_;
     status = status_;
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
   }
    : describe_provisioning_artifact_output)

let make_describe_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?product_name:(product_name_ : product_view_name option) ?verbose:(verbose_ : verbose option)
    ?include_provisioning_artifact_parameters:
      (include_provisioning_artifact_parameters_ : boolean_ option) () =
  ({
     accept_language = accept_language_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     product_name = product_name_;
     verbose = verbose_;
     include_provisioning_artifact_parameters = include_provisioning_artifact_parameters_;
   }
    : describe_provisioning_artifact_input)

let make_resource_target_definition ?attribute:(attribute_ : resource_attribute option)
    ?name:(name_ : property_name option)
    ?requires_recreation:(requires_recreation_ : requires_recreation option) () =
  ({ attribute = attribute_; name = name_; requires_recreation = requires_recreation_ }
    : resource_target_definition)

let make_resource_change_detail ?target:(target_ : resource_target_definition option)
    ?evaluation:(evaluation_ : evaluation_type option)
    ?causing_entity:(causing_entity_ : causing_entity option) () =
  ({ target = target_; evaluation = evaluation_; causing_entity = causing_entity_ }
    : resource_change_detail)

let make_resource_change ?action:(action_ : change_action option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?resource_type:(resource_type_ : plan_resource_type option)
    ?replacement:(replacement_ : replacement option) ?scope:(scope_ : scope option)
    ?details:(details_ : resource_change_details option) () =
  ({
     action = action_;
     logical_resource_id = logical_resource_id_;
     physical_resource_id = physical_resource_id_;
     resource_type = resource_type_;
     replacement = replacement_;
     scope = scope_;
     details = details_;
   }
    : resource_change)

let make_provisioned_product_plan_details ?created_time:(created_time_ : created_time option)
    ?path_id:(path_id_ : id option) ?product_id:(product_id_ : id option)
    ?plan_name:(plan_name_ : provisioned_product_plan_name option) ?plan_id:(plan_id_ : id option)
    ?provision_product_id:(provision_product_id_ : id option)
    ?provision_product_name:(provision_product_name_ : provisioned_product_name option)
    ?plan_type:(plan_type_ : provisioned_product_plan_type option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?status:(status_ : provisioned_product_plan_status option)
    ?updated_time:(updated_time_ : updated_time option)
    ?notification_arns:(notification_arns_ : notification_arns option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?tags:(tags_ : tags option) ?status_message:(status_message_ : status_message option) () =
  ({
     created_time = created_time_;
     path_id = path_id_;
     product_id = product_id_;
     plan_name = plan_name_;
     plan_id = plan_id_;
     provision_product_id = provision_product_id_;
     provision_product_name = provision_product_name_;
     plan_type = plan_type_;
     provisioning_artifact_id = provisioning_artifact_id_;
     status = status_;
     updated_time = updated_time_;
     notification_arns = notification_arns_;
     provisioning_parameters = provisioning_parameters_;
     tags = tags_;
     status_message = status_message_;
   }
    : provisioned_product_plan_details)

let make_describe_provisioned_product_plan_output
    ?provisioned_product_plan_details:
      (provisioned_product_plan_details_ : provisioned_product_plan_details option)
    ?resource_changes:(resource_changes_ : resource_changes option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({
     provisioned_product_plan_details = provisioned_product_plan_details_;
     resource_changes = resource_changes_;
     next_page_token = next_page_token_;
   }
    : describe_provisioned_product_plan_output)

let make_describe_provisioned_product_plan_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ~plan_id:(plan_id_ : id) () =
  ({
     accept_language = accept_language_;
     plan_id = plan_id_;
     page_size = page_size_;
     page_token = page_token_;
   }
    : describe_provisioned_product_plan_input)

let make_cloud_watch_dashboard ?name:(name_ : cloud_watch_dashboard_name option) () =
  ({ name = name_ } : cloud_watch_dashboard)

let make_describe_provisioned_product_output
    ?provisioned_product_detail:(provisioned_product_detail_ : provisioned_product_detail option)
    ?cloud_watch_dashboards:(cloud_watch_dashboards_ : cloud_watch_dashboards option) () =
  ({
     provisioned_product_detail = provisioned_product_detail_;
     cloud_watch_dashboards = cloud_watch_dashboards_;
   }
    : describe_provisioned_product_output)

let make_describe_provisioned_product_input
    ?accept_language:(accept_language_ : accept_language option) ?id:(id_ : id option)
    ?name:(name_ : provisioned_product_name option) () =
  ({ accept_language = accept_language_; id = id_; name = name_ }
    : describe_provisioned_product_input)

let make_describe_product_view_output
    ?product_view_summary:(product_view_summary_ : product_view_summary option)
    ?provisioning_artifacts:(provisioning_artifacts_ : provisioning_artifacts option) () =
  ({
     product_view_summary = product_view_summary_;
     provisioning_artifacts = provisioning_artifacts_;
   }
    : describe_product_view_output)

let make_describe_product_view_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : describe_product_view_input)

let make_provisioning_artifact_summary ?id:(id_ : id option)
    ?name:(name_ : provisioning_artifact_name option)
    ?description:(description_ : provisioning_artifact_description option)
    ?created_time:(created_time_ : provisioning_artifact_created_time option)
    ?provisioning_artifact_metadata:
      (provisioning_artifact_metadata_ : provisioning_artifact_info option) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     created_time = created_time_;
     provisioning_artifact_metadata = provisioning_artifact_metadata_;
   }
    : provisioning_artifact_summary)

let make_describe_product_as_admin_output
    ?product_view_detail:(product_view_detail_ : product_view_detail option)
    ?provisioning_artifact_summaries:
      (provisioning_artifact_summaries_ : provisioning_artifact_summaries option)
    ?tags:(tags_ : tags option) ?tag_options:(tag_options_ : tag_option_details option)
    ?budgets:(budgets_ : budgets option) () =
  ({
     product_view_detail = product_view_detail_;
     provisioning_artifact_summaries = provisioning_artifact_summaries_;
     tags = tags_;
     tag_options = tag_options_;
     budgets = budgets_;
   }
    : describe_product_as_admin_output)

let make_describe_product_as_admin_input
    ?accept_language:(accept_language_ : accept_language option) ?id:(id_ : id option)
    ?name:(name_ : product_view_name option) ?source_portfolio_id:(source_portfolio_id_ : id option)
    () =
  ({
     accept_language = accept_language_;
     id = id_;
     name = name_;
     source_portfolio_id = source_portfolio_id_;
   }
    : describe_product_as_admin_input)

let make_launch_path ?id:(id_ : id option) ?name:(name_ : portfolio_name option) () =
  ({ id = id_; name = name_ } : launch_path)

let make_describe_product_output
    ?product_view_summary:(product_view_summary_ : product_view_summary option)
    ?provisioning_artifacts:(provisioning_artifacts_ : provisioning_artifacts option)
    ?budgets:(budgets_ : budgets option) ?launch_paths:(launch_paths_ : launch_paths option) () =
  ({
     product_view_summary = product_view_summary_;
     provisioning_artifacts = provisioning_artifacts_;
     budgets = budgets_;
     launch_paths = launch_paths_;
   }
    : describe_product_output)

let make_describe_product_input ?accept_language:(accept_language_ : accept_language option)
    ?id:(id_ : id option) ?name:(name_ : product_view_name option) () =
  ({ accept_language = accept_language_; id = id_; name = name_ } : describe_product_input)

let make_share_error ?accounts:(accounts_ : namespaces option) ?message:(message_ : message option)
    ?error:(error_ : error option) () =
  ({ accounts = accounts_; message = message_; error = error_ } : share_error)

let make_share_details ?successful_shares:(successful_shares_ : successful_shares option)
    ?share_errors:(share_errors_ : share_errors option) () =
  ({ successful_shares = successful_shares_; share_errors = share_errors_ } : share_details)

let make_describe_portfolio_share_status_output
    ?portfolio_share_token:(portfolio_share_token_ : id option)
    ?portfolio_id:(portfolio_id_ : id option)
    ?organization_node_value:(organization_node_value_ : organization_node_value option)
    ?status:(status_ : share_status option) ?share_details:(share_details_ : share_details option)
    () =
  ({
     portfolio_share_token = portfolio_share_token_;
     portfolio_id = portfolio_id_;
     organization_node_value = organization_node_value_;
     status = status_;
     share_details = share_details_;
   }
    : describe_portfolio_share_status_output)

let make_describe_portfolio_share_status_input ~portfolio_share_token:(portfolio_share_token_ : id)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : describe_portfolio_share_status_input)

let make_portfolio_share_detail ?principal_id:(principal_id_ : id option)
    ?type_:(type__ : describe_portfolio_share_type option) ?accepted:(accepted_ : boolean_ option)
    ?share_tag_options:(share_tag_options_ : boolean_ option)
    ?share_principals:(share_principals_ : boolean_ option) () =
  ({
     principal_id = principal_id_;
     type_ = type__;
     accepted = accepted_;
     share_tag_options = share_tag_options_;
     share_principals = share_principals_;
   }
    : portfolio_share_detail)

let make_describe_portfolio_shares_output ?next_page_token:(next_page_token_ : page_token option)
    ?portfolio_share_details:(portfolio_share_details_ : portfolio_share_details option) () =
  ({ next_page_token = next_page_token_; portfolio_share_details = portfolio_share_details_ }
    : describe_portfolio_shares_output)

let make_describe_portfolio_shares_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size_max100 option) ~portfolio_id:(portfolio_id_ : id)
    ~type_:(type__ : describe_portfolio_share_type) () =
  ({
     portfolio_id = portfolio_id_;
     type_ = type__;
     page_token = page_token_;
     page_size = page_size_;
   }
    : describe_portfolio_shares_input)

let make_describe_portfolio_output ?portfolio_detail:(portfolio_detail_ : portfolio_detail option)
    ?tags:(tags_ : tags option) ?tag_options:(tag_options_ : tag_option_details option)
    ?budgets:(budgets_ : budgets option) () =
  ({
     portfolio_detail = portfolio_detail_;
     tags = tags_;
     tag_options = tag_options_;
     budgets = budgets_;
   }
    : describe_portfolio_output)

let make_describe_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : describe_portfolio_input)

let make_describe_copy_product_status_output
    ?copy_product_status:(copy_product_status_ : copy_product_status option)
    ?target_product_id:(target_product_id_ : id option)
    ?status_detail:(status_detail_ : status_detail option) () =
  ({
     copy_product_status = copy_product_status_;
     target_product_id = target_product_id_;
     status_detail = status_detail_;
   }
    : describe_copy_product_status_output)

let make_describe_copy_product_status_input
    ?accept_language:(accept_language_ : accept_language option)
    ~copy_product_token:(copy_product_token_ : id) () =
  ({ accept_language = accept_language_; copy_product_token = copy_product_token_ }
    : describe_copy_product_status_input)

let make_describe_constraint_output
    ?constraint_detail:(constraint_detail_ : constraint_detail option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?status:(status_ : status option) () =
  ({
     constraint_detail = constraint_detail_;
     constraint_parameters = constraint_parameters_;
     status = status_;
   }
    : describe_constraint_output)

let make_describe_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : describe_constraint_input)

let make_delete_tag_option_output () = (() : unit)

let make_delete_tag_option_input ~id:(id_ : tag_option_id) () =
  ({ id = id_ } : delete_tag_option_input)

let make_delete_service_action_output () = (() : unit)

let make_delete_service_action_input ?accept_language:(accept_language_ : accept_language option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option) ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_; idempotency_token = idempotency_token_ }
    : delete_service_action_input)

let make_delete_provisioning_artifact_output () = (() : unit)

let make_delete_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
   }
    : delete_provisioning_artifact_input)

let make_delete_provisioned_product_plan_output () = (() : unit)

let make_delete_provisioned_product_plan_input
    ?accept_language:(accept_language_ : accept_language option)
    ?ignore_errors:(ignore_errors_ : ignore_errors option) ~plan_id:(plan_id_ : id) () =
  ({ accept_language = accept_language_; plan_id = plan_id_; ignore_errors = ignore_errors_ }
    : delete_provisioned_product_plan_input)

let make_delete_product_output () = (() : unit)

let make_delete_product_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : delete_product_input)

let make_delete_portfolio_share_output ?portfolio_share_token:(portfolio_share_token_ : id option)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : delete_portfolio_share_output)

let make_delete_portfolio_share_input ?accept_language:(accept_language_ : accept_language option)
    ?account_id:(account_id_ : account_id option)
    ?organization_node:(organization_node_ : organization_node option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     account_id = account_id_;
     organization_node = organization_node_;
   }
    : delete_portfolio_share_input)

let make_delete_portfolio_output () = (() : unit)

let make_delete_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : delete_portfolio_input)

let make_delete_constraint_output () = (() : unit)

let make_delete_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : delete_constraint_input)

let make_create_tag_option_output ?tag_option_detail:(tag_option_detail_ : tag_option_detail option)
    () =
  ({ tag_option_detail = tag_option_detail_ } : create_tag_option_output)

let make_create_tag_option_input ~key:(key_ : tag_option_key) ~value:(value_ : tag_option_value) ()
    =
  ({ key = key_; value = value_ } : create_tag_option_input)

let make_create_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : create_service_action_output)

let make_create_service_action_input ?description:(description_ : service_action_description option)
    ?accept_language:(accept_language_ : accept_language option) ~name:(name_ : service_action_name)
    ~definition_type:(definition_type_ : service_action_definition_type)
    ~definition:(definition_ : service_action_definition_map)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     name = name_;
     definition_type = definition_type_;
     definition = definition_;
     description = description_;
     accept_language = accept_language_;
     idempotency_token = idempotency_token_;
   }
    : create_service_action_input)

let make_create_provisioning_artifact_output
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option)
    ?info:(info_ : provisioning_artifact_info option) ?status:(status_ : status option) () =
  ({ provisioning_artifact_detail = provisioning_artifact_detail_; info = info_; status = status_ }
    : create_provisioning_artifact_output)

let make_provisioning_artifact_properties ?name:(name_ : provisioning_artifact_name option)
    ?description:(description_ : provisioning_artifact_description option)
    ?info:(info_ : provisioning_artifact_info option)
    ?type_:(type__ : provisioning_artifact_type option)
    ?disable_template_validation:(disable_template_validation_ : disable_template_validation option)
    () =
  ({
     name = name_;
     description = description_;
     info = info_;
     type_ = type__;
     disable_template_validation = disable_template_validation_;
   }
    : provisioning_artifact_properties)

let make_create_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id)
    ~parameters:(parameters_ : provisioning_artifact_properties)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     parameters = parameters_;
     idempotency_token = idempotency_token_;
   }
    : create_provisioning_artifact_input)

let make_create_provisioned_product_plan_output
    ?plan_name:(plan_name_ : provisioned_product_plan_name option) ?plan_id:(plan_id_ : id option)
    ?provision_product_id:(provision_product_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option) () =
  ({
     plan_name = plan_name_;
     plan_id = plan_id_;
     provision_product_id = provision_product_id_;
     provisioned_product_name = provisioned_product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
   }
    : create_provisioned_product_plan_output)

let make_create_provisioned_product_plan_input
    ?accept_language:(accept_language_ : accept_language option)
    ?notification_arns:(notification_arns_ : notification_arns option)
    ?path_id:(path_id_ : id option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?tags:(tags_ : tags option) ~plan_name:(plan_name_ : provisioned_product_plan_name)
    ~plan_type:(plan_type_ : provisioned_product_plan_type) ~product_id:(product_id_ : id)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     plan_name = plan_name_;
     plan_type = plan_type_;
     notification_arns = notification_arns_;
     path_id = path_id_;
     product_id = product_id_;
     provisioned_product_name = provisioned_product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_parameters = provisioning_parameters_;
     idempotency_token = idempotency_token_;
     tags = tags_;
   }
    : create_provisioned_product_plan_input)

let make_create_product_output
    ?product_view_detail:(product_view_detail_ : product_view_detail option)
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option)
    ?tags:(tags_ : tags option) () =
  ({
     product_view_detail = product_view_detail_;
     provisioning_artifact_detail = provisioning_artifact_detail_;
     tags = tags_;
   }
    : create_product_output)

let make_create_product_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : product_view_short_description option)
    ?distributor:(distributor_ : product_view_owner option)
    ?support_description:(support_description_ : support_description option)
    ?support_email:(support_email_ : support_email option)
    ?support_url:(support_url_ : support_url option) ?tags:(tags_ : add_tags option)
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_properties option)
    ?source_connection:(source_connection_ : source_connection option)
    ~name:(name_ : product_view_name) ~owner:(owner_ : product_view_owner)
    ~product_type:(product_type_ : product_type)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     name = name_;
     owner = owner_;
     description = description_;
     distributor = distributor_;
     support_description = support_description_;
     support_email = support_email_;
     support_url = support_url_;
     product_type = product_type_;
     tags = tags_;
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
     idempotency_token = idempotency_token_;
     source_connection = source_connection_;
   }
    : create_product_input)

let make_create_portfolio_share_output ?portfolio_share_token:(portfolio_share_token_ : id option)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : create_portfolio_share_output)

let make_create_portfolio_share_input ?accept_language:(accept_language_ : accept_language option)
    ?account_id:(account_id_ : account_id option)
    ?organization_node:(organization_node_ : organization_node option)
    ?share_tag_options:(share_tag_options_ : boolean_ option)
    ?share_principals:(share_principals_ : boolean_ option) ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     account_id = account_id_;
     organization_node = organization_node_;
     share_tag_options = share_tag_options_;
     share_principals = share_principals_;
   }
    : create_portfolio_share_input)

let make_create_portfolio_output ?portfolio_detail:(portfolio_detail_ : portfolio_detail option)
    ?tags:(tags_ : tags option) () =
  ({ portfolio_detail = portfolio_detail_; tags = tags_ } : create_portfolio_output)

let make_create_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : portfolio_description option) ?tags:(tags_ : add_tags option)
    ~display_name:(display_name_ : portfolio_display_name)
    ~provider_name:(provider_name_ : provider_name)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     display_name = display_name_;
     description = description_;
     provider_name = provider_name_;
     tags = tags_;
     idempotency_token = idempotency_token_;
   }
    : create_portfolio_input)

let make_create_constraint_output ?constraint_detail:(constraint_detail_ : constraint_detail option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?status:(status_ : status option) () =
  ({
     constraint_detail = constraint_detail_;
     constraint_parameters = constraint_parameters_;
     status = status_;
   }
    : create_constraint_output)

let make_create_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : constraint_description option) ~portfolio_id:(portfolio_id_ : id)
    ~product_id:(product_id_ : id) ~parameters:(parameters_ : constraint_parameters)
    ~type_:(type__ : constraint_type) ~idempotency_token:(idempotency_token_ : idempotency_token) ()
    =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     product_id = product_id_;
     parameters = parameters_;
     type_ = type__;
     description = description_;
     idempotency_token = idempotency_token_;
   }
    : create_constraint_input)

let make_copy_product_output ?copy_product_token:(copy_product_token_ : id option) () =
  ({ copy_product_token = copy_product_token_ } : copy_product_output)

let make_copy_product_input ?accept_language:(accept_language_ : accept_language option)
    ?target_product_id:(target_product_id_ : id option)
    ?target_product_name:(target_product_name_ : product_view_name option)
    ?source_provisioning_artifact_identifiers:
      (source_provisioning_artifact_identifiers_ : source_provisioning_artifact_properties option)
    ?copy_options:(copy_options_ : copy_options option)
    ~source_product_arn:(source_product_arn_ : product_arn)
    ~idempotency_token:(idempotency_token_ : idempotency_token) () =
  ({
     accept_language = accept_language_;
     source_product_arn = source_product_arn_;
     target_product_id = target_product_id_;
     target_product_name = target_product_name_;
     source_provisioning_artifact_identifiers = source_provisioning_artifact_identifiers_;
     copy_options = copy_options_;
     idempotency_token = idempotency_token_;
   }
    : copy_product_input)

let make_failed_service_action_association ?service_action_id:(service_action_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?error_code:(error_code_ : service_action_association_error_code option)
    ?error_message:(error_message_ : service_action_association_error_message option) () =
  ({
     service_action_id = service_action_id_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : failed_service_action_association)

let make_batch_disassociate_service_action_from_provisioning_artifact_output
    ?failed_service_action_associations:
      (failed_service_action_associations_ : failed_service_action_associations option) () =
  ({ failed_service_action_associations = failed_service_action_associations_ }
    : batch_disassociate_service_action_from_provisioning_artifact_output)

let make_service_action_association ~service_action_id:(service_action_id_ : id)
    ~product_id:(product_id_ : id) ~provisioning_artifact_id:(provisioning_artifact_id_ : id) () =
  ({
     service_action_id = service_action_id_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
   }
    : service_action_association)

let make_batch_disassociate_service_action_from_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_associations:(service_action_associations_ : service_action_associations) () =
  ({
     service_action_associations = service_action_associations_;
     accept_language = accept_language_;
   }
    : batch_disassociate_service_action_from_provisioning_artifact_input)

let make_batch_associate_service_action_with_provisioning_artifact_output
    ?failed_service_action_associations:
      (failed_service_action_associations_ : failed_service_action_associations option) () =
  ({ failed_service_action_associations = failed_service_action_associations_ }
    : batch_associate_service_action_with_provisioning_artifact_output)

let make_batch_associate_service_action_with_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_associations:(service_action_associations_ : service_action_associations) () =
  ({
     service_action_associations = service_action_associations_;
     accept_language = accept_language_;
   }
    : batch_associate_service_action_with_provisioning_artifact_input)

let make_associate_tag_option_with_resource_output () = (() : unit)

let make_associate_tag_option_with_resource_input ~resource_id:(resource_id_ : resource_id)
    ~tag_option_id:(tag_option_id_ : tag_option_id) () =
  ({ resource_id = resource_id_; tag_option_id = tag_option_id_ }
    : associate_tag_option_with_resource_input)

let make_associate_service_action_with_provisioning_artifact_output () = (() : unit)

let make_associate_service_action_with_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~product_id:(product_id_ : id) ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~service_action_id:(service_action_id_ : id) () =
  ({
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     service_action_id = service_action_id_;
     accept_language = accept_language_;
     idempotency_token = idempotency_token_;
   }
    : associate_service_action_with_provisioning_artifact_input)

let make_associate_product_with_portfolio_output () = (() : unit)

let make_associate_product_with_portfolio_input
    ?accept_language:(accept_language_ : accept_language option)
    ?source_portfolio_id:(source_portfolio_id_ : id option) ~product_id:(product_id_ : id)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     product_id = product_id_;
     portfolio_id = portfolio_id_;
     source_portfolio_id = source_portfolio_id_;
   }
    : associate_product_with_portfolio_input)

let make_associate_principal_with_portfolio_output () = (() : unit)

let make_associate_principal_with_portfolio_input
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    ~principal_ar_n:(principal_ar_n_ : principal_ar_n)
    ~principal_type:(principal_type_ : principal_type) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     principal_ar_n = principal_ar_n_;
     principal_type = principal_type_;
   }
    : associate_principal_with_portfolio_input)

let make_associate_budget_with_resource_output () = (() : unit)

let make_associate_budget_with_resource_input ~budget_name:(budget_name_ : budget_name)
    ~resource_id:(resource_id_ : id) () =
  ({ budget_name = budget_name_; resource_id = resource_id_ }
    : associate_budget_with_resource_input)

let make_accept_portfolio_share_output () = (() : unit)

let make_accept_portfolio_share_input ?accept_language:(accept_language_ : accept_language option)
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     accept_language = accept_language_;
     portfolio_id = portfolio_id_;
     portfolio_share_type = portfolio_share_type_;
   }
    : accept_portfolio_share_input)
