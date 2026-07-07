open Types

let make_usage_instruction ?value:(value_ : instruction_value option)
    ?type_:(type__ : instruction_type option) () =
  ({ value = value_; type_ = type__ } : usage_instruction)

let make_tag_option_detail ?owner:(owner_ : owner option) ?id:(id_ : tag_option_id option)
    ?active:(active_ : tag_option_active option) ?value:(value_ : tag_option_value option)
    ?key:(key_ : tag_option_key option) () =
  ({ owner = owner_; id = id_; active = active_; value = value_; key = key_ } : tag_option_detail)

let make_update_tag_option_output ?tag_option_detail:(tag_option_detail_ : tag_option_detail option)
    () =
  ({ tag_option_detail = tag_option_detail_ } : update_tag_option_output)

let make_update_tag_option_input ?active:(active_ : tag_option_active option)
    ?value:(value_ : tag_option_value option) ~id:(id_ : tag_option_id) () =
  ({ active = active_; value = value_; id = id_ } : update_tag_option_input)

let make_service_action_summary
    ?definition_type:(definition_type_ : service_action_definition_type option)
    ?description:(description_ : service_action_description option)
    ?name:(name_ : service_action_name option) ?id:(id_ : id option) () =
  ({ definition_type = definition_type_; description = description_; name = name_; id = id_ }
    : service_action_summary)

let make_service_action_detail ?definition:(definition_ : service_action_definition_map option)
    ?service_action_summary:(service_action_summary_ : service_action_summary option) () =
  ({ definition = definition_; service_action_summary = service_action_summary_ }
    : service_action_detail)

let make_update_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : update_service_action_output)

let make_update_service_action_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : service_action_description option)
    ?definition:(definition_ : service_action_definition_map option)
    ?name:(name_ : service_action_name option) ~id:(id_ : id) () =
  ({
     accept_language = accept_language_;
     description = description_;
     definition = definition_;
     name = name_;
     id = id_;
   }
    : update_service_action_input)

let make_update_provisioning_preferences
    ?stack_set_operation_type:(stack_set_operation_type_ : stack_set_operation_type option)
    ?stack_set_max_concurrency_percentage:
      (stack_set_max_concurrency_percentage_ : stack_set_max_concurrency_percentage option)
    ?stack_set_max_concurrency_count:
      (stack_set_max_concurrency_count_ : stack_set_max_concurrency_count option)
    ?stack_set_failure_tolerance_percentage:
      (stack_set_failure_tolerance_percentage_ : stack_set_failure_tolerance_percentage option)
    ?stack_set_failure_tolerance_count:
      (stack_set_failure_tolerance_count_ : stack_set_failure_tolerance_count option)
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option)
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option) () =
  ({
     stack_set_operation_type = stack_set_operation_type_;
     stack_set_max_concurrency_percentage = stack_set_max_concurrency_percentage_;
     stack_set_max_concurrency_count = stack_set_max_concurrency_count_;
     stack_set_failure_tolerance_percentage = stack_set_failure_tolerance_percentage_;
     stack_set_failure_tolerance_count = stack_set_failure_tolerance_count_;
     stack_set_regions = stack_set_regions_;
     stack_set_accounts = stack_set_accounts_;
   }
    : update_provisioning_preferences)

let make_update_provisioning_parameter
    ?use_previous_value:(use_previous_value_ : use_previous_value option)
    ?value:(value_ : parameter_value option) ?key:(key_ : parameter_key option) () =
  ({ use_previous_value = use_previous_value_; value = value_; key = key_ }
    : update_provisioning_parameter)

let make_provisioning_artifact_detail ?source_revision:(source_revision_ : source_revision option)
    ?guidance:(guidance_ : provisioning_artifact_guidance option)
    ?active:(active_ : provisioning_artifact_active option)
    ?created_time:(created_time_ : creation_time option)
    ?type_:(type__ : provisioning_artifact_type option)
    ?description:(description_ : provisioning_artifact_name option)
    ?name:(name_ : provisioning_artifact_name option) ?id:(id_ : id option) () =
  ({
     source_revision = source_revision_;
     guidance = guidance_;
     active = active_;
     created_time = created_time_;
     type_ = type__;
     description = description_;
     name = name_;
     id = id_;
   }
    : provisioning_artifact_detail)

let make_update_provisioning_artifact_output ?status:(status_ : status option)
    ?info:(info_ : provisioning_artifact_info option)
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option) () =
  ({ status = status_; info = info_; provisioning_artifact_detail = provisioning_artifact_detail_ }
    : update_provisioning_artifact_output)

let make_update_provisioning_artifact_input
    ?guidance:(guidance_ : provisioning_artifact_guidance option)
    ?active:(active_ : provisioning_artifact_active option)
    ?description:(description_ : provisioning_artifact_description option)
    ?name:(name_ : provisioning_artifact_name option)
    ?accept_language:(accept_language_ : accept_language option)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     guidance = guidance_;
     active = active_;
     description = description_;
     name = name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : update_provisioning_artifact_input)

let make_update_provisioned_product_properties_output ?status:(status_ : record_status option)
    ?record_id:(record_id_ : id option)
    ?provisioned_product_properties:
      (provisioned_product_properties_ : provisioned_product_properties option)
    ?provisioned_product_id:(provisioned_product_id_ : id option) () =
  ({
     status = status_;
     record_id = record_id_;
     provisioned_product_properties = provisioned_product_properties_;
     provisioned_product_id = provisioned_product_id_;
   }
    : update_provisioned_product_properties_output)

let make_update_provisioned_product_properties_input
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~provisioned_product_properties:
      (provisioned_product_properties_ : provisioned_product_properties)
    ~provisioned_product_id:(provisioned_product_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     provisioned_product_properties = provisioned_product_properties_;
     provisioned_product_id = provisioned_product_id_;
     accept_language = accept_language_;
   }
    : update_provisioned_product_properties_input)

let make_record_error ?description:(description_ : error_description option)
    ?code:(code_ : error_code option) () =
  ({ description = description_; code = code_ } : record_error)

let make_record_tag ?value:(value_ : record_tag_value option) ?key:(key_ : record_tag_key option) ()
    =
  ({ value = value_; key = key_ } : record_tag)

let make_record_detail ?launch_role_arn:(launch_role_arn_ : role_arn option)
    ?record_tags:(record_tags_ : record_tags option)
    ?record_errors:(record_errors_ : record_errors option) ?path_id:(path_id_ : id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?record_type:(record_type_ : record_type option)
    ?provisioned_product_type:(provisioned_product_type_ : provisioned_product_type option)
    ?updated_time:(updated_time_ : updated_time option)
    ?created_time:(created_time_ : created_time option) ?status:(status_ : record_status option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?record_id:(record_id_ : id option) () =
  ({
     launch_role_arn = launch_role_arn_;
     record_tags = record_tags_;
     record_errors = record_errors_;
     path_id = path_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     provisioned_product_id = provisioned_product_id_;
     record_type = record_type_;
     provisioned_product_type = provisioned_product_type_;
     updated_time = updated_time_;
     created_time = created_time_;
     status = status_;
     provisioned_product_name = provisioned_product_name_;
     record_id = record_id_;
   }
    : record_detail)

let make_update_provisioned_product_output ?record_detail:(record_detail_ : record_detail option) ()
    =
  ({ record_detail = record_detail_ } : update_provisioned_product_output)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_update_provisioned_product_input ?tags:(tags_ : tags option)
    ?provisioning_preferences:(provisioning_preferences_ : update_provisioning_preferences option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?path_name:(path_name_ : portfolio_display_name option) ?path_id:(path_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_name:(product_name_ : product_view_name option) ?product_id:(product_id_ : id option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name_or_arn option)
    ?accept_language:(accept_language_ : accept_language option)
    ~update_token:(update_token_ : idempotency_token) () =
  ({
     update_token = update_token_;
     tags = tags_;
     provisioning_preferences = provisioning_preferences_;
     provisioning_parameters = provisioning_parameters_;
     path_name = path_name_;
     path_id = path_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_name = product_name_;
     product_id = product_id_;
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_name = provisioned_product_name_;
     accept_language = accept_language_;
   }
    : update_provisioned_product_input)

let make_product_view_summary ?support_url:(support_url_ : support_url option)
    ?support_description:(support_description_ : support_description option)
    ?support_email:(support_email_ : support_email option)
    ?has_default_path:(has_default_path_ : has_default_path option)
    ?distributor:(distributor_ : product_view_distributor option)
    ?type_:(type__ : product_type option)
    ?short_description:(short_description_ : product_view_short_description option)
    ?owner:(owner_ : product_view_owner option) ?name:(name_ : product_view_name option)
    ?product_id:(product_id_ : id option) ?id:(id_ : id option) () =
  ({
     support_url = support_url_;
     support_description = support_description_;
     support_email = support_email_;
     has_default_path = has_default_path_;
     distributor = distributor_;
     type_ = type__;
     short_description = short_description_;
     owner = owner_;
     name = name_;
     product_id = product_id_;
     id = id_;
   }
    : product_view_summary)

let make_code_star_parameters ~artifact_path:(artifact_path_ : repository_artifact_path)
    ~branch:(branch_ : repository_branch) ~repository:(repository_ : repository)
    ~connection_arn:(connection_arn_ : code_star_connection_arn) () =
  ({
     artifact_path = artifact_path_;
     branch = branch_;
     repository = repository_;
     connection_arn = connection_arn_;
   }
    : code_star_parameters)

let make_source_connection_parameters ?code_star:(code_star_ : code_star_parameters option) () =
  ({ code_star = code_star_ } : source_connection_parameters)

let make_last_sync
    ?last_successful_sync_provisioning_artifact_id:
      (last_successful_sync_provisioning_artifact_id_ : id option)
    ?last_successful_sync_time:(last_successful_sync_time_ : last_successful_sync_time option)
    ?last_sync_status_message:(last_sync_status_message_ : last_sync_status_message option)
    ?last_sync_status:(last_sync_status_ : last_sync_status option)
    ?last_sync_time:(last_sync_time_ : last_sync_time option) () =
  ({
     last_successful_sync_provisioning_artifact_id = last_successful_sync_provisioning_artifact_id_;
     last_successful_sync_time = last_successful_sync_time_;
     last_sync_status_message = last_sync_status_message_;
     last_sync_status = last_sync_status_;
     last_sync_time = last_sync_time_;
   }
    : last_sync)

let make_source_connection_detail ?last_sync:(last_sync_ : last_sync option)
    ?connection_parameters:(connection_parameters_ : source_connection_parameters option)
    ?type_:(type__ : source_type option) () =
  ({ last_sync = last_sync_; connection_parameters = connection_parameters_; type_ = type__ }
    : source_connection_detail)

let make_product_view_detail
    ?source_connection:(source_connection_ : source_connection_detail option)
    ?created_time:(created_time_ : created_time option)
    ?product_ar_n:(product_ar_n_ : resource_ar_n option) ?status:(status_ : status option)
    ?product_view_summary:(product_view_summary_ : product_view_summary option) () =
  ({
     source_connection = source_connection_;
     created_time = created_time_;
     product_ar_n = product_ar_n_;
     status = status_;
     product_view_summary = product_view_summary_;
   }
    : product_view_detail)

let make_update_product_output ?tags:(tags_ : tags option)
    ?product_view_detail:(product_view_detail_ : product_view_detail option) () =
  ({ tags = tags_; product_view_detail = product_view_detail_ } : update_product_output)

let make_source_connection ?type_:(type__ : source_type option)
    ~connection_parameters:(connection_parameters_ : source_connection_parameters) () =
  ({ connection_parameters = connection_parameters_; type_ = type__ } : source_connection)

let make_update_product_input ?source_connection:(source_connection_ : source_connection option)
    ?remove_tags:(remove_tags_ : tag_keys option) ?add_tags:(add_tags_ : add_tags option)
    ?support_url:(support_url_ : support_url option)
    ?support_email:(support_email_ : support_email option)
    ?support_description:(support_description_ : support_description option)
    ?distributor:(distributor_ : product_view_owner option)
    ?description:(description_ : product_view_short_description option)
    ?owner:(owner_ : product_view_owner option) ?name:(name_ : product_view_name option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({
     source_connection = source_connection_;
     remove_tags = remove_tags_;
     add_tags = add_tags_;
     support_url = support_url_;
     support_email = support_email_;
     support_description = support_description_;
     distributor = distributor_;
     description = description_;
     owner = owner_;
     name = name_;
     id = id_;
     accept_language = accept_language_;
   }
    : update_product_input)

let make_update_portfolio_share_output ?status:(status_ : share_status option)
    ?portfolio_share_token:(portfolio_share_token_ : id option) () =
  ({ status = status_; portfolio_share_token = portfolio_share_token_ }
    : update_portfolio_share_output)

let make_organization_node ?value:(value_ : organization_node_value option)
    ?type_:(type__ : organization_node_type option) () =
  ({ value = value_; type_ = type__ } : organization_node)

let make_update_portfolio_share_input
    ?share_principals:(share_principals_ : nullable_boolean option)
    ?share_tag_options:(share_tag_options_ : nullable_boolean option)
    ?organization_node:(organization_node_ : organization_node option)
    ?account_id:(account_id_ : account_id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     share_principals = share_principals_;
     share_tag_options = share_tag_options_;
     organization_node = organization_node_;
     account_id = account_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : update_portfolio_share_input)

let make_portfolio_detail ?provider_name:(provider_name_ : provider_name option)
    ?created_time:(created_time_ : creation_time option)
    ?description:(description_ : portfolio_description option)
    ?display_name:(display_name_ : portfolio_display_name option)
    ?ar_n:(ar_n_ : resource_ar_n option) ?id:(id_ : id option) () =
  ({
     provider_name = provider_name_;
     created_time = created_time_;
     description = description_;
     display_name = display_name_;
     ar_n = ar_n_;
     id = id_;
   }
    : portfolio_detail)

let make_update_portfolio_output ?tags:(tags_ : tags option)
    ?portfolio_detail:(portfolio_detail_ : portfolio_detail option) () =
  ({ tags = tags_; portfolio_detail = portfolio_detail_ } : update_portfolio_output)

let make_update_portfolio_input ?remove_tags:(remove_tags_ : tag_keys option)
    ?add_tags:(add_tags_ : add_tags option) ?provider_name:(provider_name_ : provider_name option)
    ?description:(description_ : portfolio_description option)
    ?display_name:(display_name_ : portfolio_display_name option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({
     remove_tags = remove_tags_;
     add_tags = add_tags_;
     provider_name = provider_name_;
     description = description_;
     display_name = display_name_;
     id = id_;
     accept_language = accept_language_;
   }
    : update_portfolio_input)

let make_constraint_detail ?portfolio_id:(portfolio_id_ : id option)
    ?product_id:(product_id_ : id option) ?owner:(owner_ : account_id option)
    ?description:(description_ : constraint_description option)
    ?type_:(type__ : constraint_type option) ?constraint_id:(constraint_id_ : id option) () =
  ({
     portfolio_id = portfolio_id_;
     product_id = product_id_;
     owner = owner_;
     description = description_;
     type_ = type__;
     constraint_id = constraint_id_;
   }
    : constraint_detail)

let make_update_constraint_output ?status:(status_ : status option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?constraint_detail:(constraint_detail_ : constraint_detail option) () =
  ({
     status = status_;
     constraint_parameters = constraint_parameters_;
     constraint_detail = constraint_detail_;
   }
    : update_constraint_output)

let make_update_constraint_input ?parameters:(parameters_ : constraint_parameters option)
    ?description:(description_ : constraint_description option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({
     parameters = parameters_;
     description = description_;
     id = id_;
     accept_language = accept_language_;
   }
    : update_constraint_input)

let make_unique_tag_resource_identifier ?value:(value_ : unique_tag_value option)
    ?key:(key_ : unique_tag_key option) () =
  ({ value = value_; key = key_ } : unique_tag_resource_identifier)

let make_terminate_provisioned_product_output ?record_detail:(record_detail_ : record_detail option)
    () =
  ({ record_detail = record_detail_ } : terminate_provisioned_product_output)

let make_terminate_provisioned_product_input
    ?retain_physical_resources:(retain_physical_resources_ : retain_physical_resources option)
    ?accept_language:(accept_language_ : accept_language option)
    ?ignore_errors:(ignore_errors_ : ignore_errors option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name_or_arn option)
    ~terminate_token:(terminate_token_ : idempotency_token) () =
  ({
     retain_physical_resources = retain_physical_resources_;
     accept_language = accept_language_;
     ignore_errors = ignore_errors_;
     terminate_token = terminate_token_;
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_name = provisioned_product_name_;
   }
    : terminate_provisioned_product_input)

let make_tag_option_summary ?values:(values_ : tag_option_values option)
    ?key:(key_ : tag_option_key option) () =
  ({ values = values_; key = key_ } : tag_option_summary)

let make_stack_instance
    ?stack_instance_status:(stack_instance_status_ : stack_instance_status option)
    ?region:(region_ : region option) ?account:(account_ : account_id option) () =
  ({ stack_instance_status = stack_instance_status_; region = region_; account = account_ }
    : stack_instance)

let make_share_error ?error:(error_ : error option) ?message:(message_ : message option)
    ?accounts:(accounts_ : namespaces option) () =
  ({ error = error_; message = message_; accounts = accounts_ } : share_error)

let make_share_details ?share_errors:(share_errors_ : share_errors option)
    ?successful_shares:(successful_shares_ : successful_shares option) () =
  ({ share_errors = share_errors_; successful_shares = successful_shares_ } : share_details)

let make_service_action_association ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~product_id:(product_id_ : id) ~service_action_id:(service_action_id_ : id) () =
  ({
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     service_action_id = service_action_id_;
   }
    : service_action_association)

let make_provisioned_product_attribute
    ?user_arn_session:(user_arn_session_ : user_arn_session option)
    ?user_arn:(user_arn_ : user_arn option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_name:(product_name_ : product_view_name option) ?product_id:(product_id_ : id option)
    ?physical_id:(physical_id_ : physical_id option) ?tags:(tags_ : tags option)
    ?last_successful_provisioning_record_id:(last_successful_provisioning_record_id_ : id option)
    ?last_provisioning_record_id:(last_provisioning_record_id_ : id option)
    ?last_record_id:(last_record_id_ : id option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?created_time:(created_time_ : created_time option)
    ?status_message:(status_message_ : provisioned_product_status_message option)
    ?status:(status_ : provisioned_product_status option) ?id:(id_ : id option)
    ?type_:(type__ : provisioned_product_type option)
    ?arn:(arn_ : provisioned_product_name_or_arn option)
    ?name:(name_ : provisioned_product_name_or_arn option) () =
  ({
     user_arn_session = user_arn_session_;
     user_arn = user_arn_;
     provisioning_artifact_name = provisioning_artifact_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_name = product_name_;
     product_id = product_id_;
     physical_id = physical_id_;
     tags = tags_;
     last_successful_provisioning_record_id = last_successful_provisioning_record_id_;
     last_provisioning_record_id = last_provisioning_record_id_;
     last_record_id = last_record_id_;
     idempotency_token = idempotency_token_;
     created_time = created_time_;
     status_message = status_message_;
     status = status_;
     id = id_;
     type_ = type__;
     arn = arn_;
     name = name_;
   }
    : provisioned_product_attribute)

let make_search_provisioned_products_output ?next_page_token:(next_page_token_ : page_token option)
    ?total_results_count:(total_results_count_ : total_results_count option)
    ?provisioned_products:(provisioned_products_ : provisioned_product_attributes option) () =
  ({
     next_page_token = next_page_token_;
     total_results_count = total_results_count_;
     provisioned_products = provisioned_products_;
   }
    : search_provisioned_products_output)

let make_access_level_filter ?value:(value_ : access_level_filter_value option)
    ?key:(key_ : access_level_filter_key option) () =
  ({ value = value_; key = key_ } : access_level_filter)

let make_search_provisioned_products_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : search_provisioned_products_page_size option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : sort_field option)
    ?filters:(filters_ : provisioned_product_filters option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     filters = filters_;
     access_level_filter = access_level_filter_;
     accept_language = accept_language_;
   }
    : search_provisioned_products_input)

let make_product_view_aggregation_value
    ?approximate_count:(approximate_count_ : approximate_count option)
    ?value:(value_ : attribute_value option) () =
  ({ approximate_count = approximate_count_; value = value_ } : product_view_aggregation_value)

let make_search_products_output ?next_page_token:(next_page_token_ : page_token option)
    ?product_view_aggregations:(product_view_aggregations_ : product_view_aggregations option)
    ?product_view_summaries:(product_view_summaries_ : product_view_summaries option) () =
  ({
     next_page_token = next_page_token_;
     product_view_aggregations = product_view_aggregations_;
     product_view_summaries = product_view_summaries_;
   }
    : search_products_output)

let make_search_products_input ?page_token:(page_token_ : page_token option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : product_view_sort_by option)
    ?page_size:(page_size_ : page_size_max100 option)
    ?filters:(filters_ : product_view_filters option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     page_token = page_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     page_size = page_size_;
     filters = filters_;
     accept_language = accept_language_;
   }
    : search_products_input)

let make_search_products_as_admin_output ?next_page_token:(next_page_token_ : page_token option)
    ?product_view_details:(product_view_details_ : product_view_details option) () =
  ({ next_page_token = next_page_token_; product_view_details = product_view_details_ }
    : search_products_as_admin_output)

let make_search_products_as_admin_input ?product_source:(product_source_ : product_source option)
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ?sort_order:(sort_order_ : sort_order option) ?sort_by:(sort_by_ : product_view_sort_by option)
    ?filters:(filters_ : product_view_filters option) ?portfolio_id:(portfolio_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     product_source = product_source_;
     page_size = page_size_;
     page_token = page_token_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     filters = filters_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : search_products_as_admin_input)

let make_provisioned_product_detail ?launch_role_arn:(launch_role_arn_ : role_arn option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_id:(product_id_ : id option)
    ?last_successful_provisioning_record_id:(last_successful_provisioning_record_id_ : id option)
    ?last_provisioning_record_id:(last_provisioning_record_id_ : id option)
    ?last_record_id:(last_record_id_ : last_request_id option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?created_time:(created_time_ : created_time option)
    ?status_message:(status_message_ : provisioned_product_status_message option)
    ?status:(status_ : provisioned_product_status option) ?id:(id_ : provisioned_product_id option)
    ?type_:(type__ : provisioned_product_type option)
    ?arn:(arn_ : provisioned_product_name_or_arn option)
    ?name:(name_ : provisioned_product_name_or_arn option) () =
  ({
     launch_role_arn = launch_role_arn_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     last_successful_provisioning_record_id = last_successful_provisioning_record_id_;
     last_provisioning_record_id = last_provisioning_record_id_;
     last_record_id = last_record_id_;
     idempotency_token = idempotency_token_;
     created_time = created_time_;
     status_message = status_message_;
     status = status_;
     id = id_;
     type_ = type__;
     arn = arn_;
     name = name_;
   }
    : provisioned_product_detail)

let make_scan_provisioned_products_output ?next_page_token:(next_page_token_ : page_token option)
    ?provisioned_products:(provisioned_products_ : provisioned_product_details option) () =
  ({ next_page_token = next_page_token_; provisioned_products = provisioned_products_ }
    : scan_provisioned_products_output)

let make_scan_provisioned_products_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     access_level_filter = access_level_filter_;
     accept_language = accept_language_;
   }
    : scan_provisioned_products_input)

let make_resource_target_definition
    ?requires_recreation:(requires_recreation_ : requires_recreation option)
    ?name:(name_ : property_name option) ?attribute:(attribute_ : resource_attribute option) () =
  ({ requires_recreation = requires_recreation_; name = name_; attribute = attribute_ }
    : resource_target_definition)

let make_resource_detail ?created_time:(created_time_ : resource_detail_created_time option)
    ?description:(description_ : resource_detail_description option)
    ?name:(name_ : resource_detail_name option) ?ar_n:(ar_n_ : resource_detail_ar_n option)
    ?id:(id_ : resource_detail_id option) () =
  ({
     created_time = created_time_;
     description = description_;
     name = name_;
     ar_n = ar_n_;
     id = id_;
   }
    : resource_detail)

let make_resource_change_detail ?causing_entity:(causing_entity_ : causing_entity option)
    ?evaluation:(evaluation_ : evaluation_type option)
    ?target:(target_ : resource_target_definition option) () =
  ({ causing_entity = causing_entity_; evaluation = evaluation_; target = target_ }
    : resource_change_detail)

let make_resource_change ?details:(details_ : resource_change_details option)
    ?scope:(scope_ : scope option) ?replacement:(replacement_ : replacement option)
    ?resource_type:(resource_type_ : plan_resource_type option)
    ?physical_resource_id:(physical_resource_id_ : physical_resource_id option)
    ?logical_resource_id:(logical_resource_id_ : logical_resource_id option)
    ?action:(action_ : change_action option) () =
  ({
     details = details_;
     scope = scope_;
     replacement = replacement_;
     resource_type = resource_type_;
     physical_resource_id = physical_resource_id_;
     logical_resource_id = logical_resource_id_;
     action = action_;
   }
    : resource_change)

let make_reject_portfolio_share_output () = (() : unit)

let make_reject_portfolio_share_input
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     portfolio_share_type = portfolio_share_type_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : reject_portfolio_share_input)

let make_record_output ?description:(description_ : description option)
    ?output_value:(output_value_ : output_value option)
    ?output_key:(output_key_ : output_key option) () =
  ({ description = description_; output_value = output_value_; output_key = output_key_ }
    : record_output)

let make_provisioning_preferences
    ?stack_set_max_concurrency_percentage:
      (stack_set_max_concurrency_percentage_ : stack_set_max_concurrency_percentage option)
    ?stack_set_max_concurrency_count:
      (stack_set_max_concurrency_count_ : stack_set_max_concurrency_count option)
    ?stack_set_failure_tolerance_percentage:
      (stack_set_failure_tolerance_percentage_ : stack_set_failure_tolerance_percentage option)
    ?stack_set_failure_tolerance_count:
      (stack_set_failure_tolerance_count_ : stack_set_failure_tolerance_count option)
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option)
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option) () =
  ({
     stack_set_max_concurrency_percentage = stack_set_max_concurrency_percentage_;
     stack_set_max_concurrency_count = stack_set_max_concurrency_count_;
     stack_set_failure_tolerance_percentage = stack_set_failure_tolerance_percentage_;
     stack_set_failure_tolerance_count = stack_set_failure_tolerance_count_;
     stack_set_regions = stack_set_regions_;
     stack_set_accounts = stack_set_accounts_;
   }
    : provisioning_preferences)

let make_provisioning_parameter ?value:(value_ : parameter_value option)
    ?key:(key_ : parameter_key option) () =
  ({ value = value_; key = key_ } : provisioning_parameter)

let make_provisioning_artifact ?guidance:(guidance_ : provisioning_artifact_guidance option)
    ?created_time:(created_time_ : provisioning_artifact_created_time option)
    ?description:(description_ : provisioning_artifact_description option)
    ?name:(name_ : provisioning_artifact_name option) ?id:(id_ : id option) () =
  ({
     guidance = guidance_;
     created_time = created_time_;
     description = description_;
     name = name_;
     id = id_;
   }
    : provisioning_artifact)

let make_provisioning_artifact_view
    ?provisioning_artifact:(provisioning_artifact_ : provisioning_artifact option)
    ?product_view_summary:(product_view_summary_ : product_view_summary option) () =
  ({ provisioning_artifact = provisioning_artifact_; product_view_summary = product_view_summary_ }
    : provisioning_artifact_view)

let make_provisioning_artifact_summary
    ?provisioning_artifact_metadata:
      (provisioning_artifact_metadata_ : provisioning_artifact_info option)
    ?created_time:(created_time_ : provisioning_artifact_created_time option)
    ?description:(description_ : provisioning_artifact_description option)
    ?name:(name_ : provisioning_artifact_name option) ?id:(id_ : id option) () =
  ({
     provisioning_artifact_metadata = provisioning_artifact_metadata_;
     created_time = created_time_;
     description = description_;
     name = name_;
     id = id_;
   }
    : provisioning_artifact_summary)

let make_provisioning_artifact_properties
    ?disable_template_validation:(disable_template_validation_ : disable_template_validation option)
    ?type_:(type__ : provisioning_artifact_type option)
    ?info:(info_ : provisioning_artifact_info option)
    ?description:(description_ : provisioning_artifact_description option)
    ?name:(name_ : provisioning_artifact_name option) () =
  ({
     disable_template_validation = disable_template_validation_;
     type_ = type__;
     info = info_;
     description = description_;
     name = name_;
   }
    : provisioning_artifact_properties)

let make_provisioning_artifact_preferences
    ?stack_set_regions:(stack_set_regions_ : stack_set_regions option)
    ?stack_set_accounts:(stack_set_accounts_ : stack_set_accounts option) () =
  ({ stack_set_regions = stack_set_regions_; stack_set_accounts = stack_set_accounts_ }
    : provisioning_artifact_preferences)

let make_parameter_constraints ?min_value:(min_value_ : string_ option)
    ?max_value:(max_value_ : string_ option) ?min_length:(min_length_ : string_ option)
    ?max_length:(max_length_ : string_ option)
    ?constraint_description:(constraint_description_ : string_ option)
    ?allowed_pattern:(allowed_pattern_ : string_ option)
    ?allowed_values:(allowed_values_ : allowed_values option) () =
  ({
     min_value = min_value_;
     max_value = max_value_;
     min_length = min_length_;
     max_length = max_length_;
     constraint_description = constraint_description_;
     allowed_pattern = allowed_pattern_;
     allowed_values = allowed_values_;
   }
    : parameter_constraints)

let make_provisioning_artifact_parameter
    ?parameter_constraints:(parameter_constraints_ : parameter_constraints option)
    ?description:(description_ : description option) ?is_no_echo:(is_no_echo_ : no_echo option)
    ?parameter_type:(parameter_type_ : parameter_type option)
    ?default_value:(default_value_ : default_value option)
    ?parameter_key:(parameter_key_ : parameter_key option) () =
  ({
     parameter_constraints = parameter_constraints_;
     description = description_;
     is_no_echo = is_no_echo_;
     parameter_type = parameter_type_;
     default_value = default_value_;
     parameter_key = parameter_key_;
   }
    : provisioning_artifact_parameter)

let make_provisioning_artifact_output ?description:(description_ : output_description option)
    ?key:(key_ : provisioning_artifact_output_key option) () =
  ({ description = description_; key = key_ } : provisioning_artifact_output)

let make_provisioned_product_plan_summary
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?plan_type:(plan_type_ : provisioned_product_plan_type option)
    ?provision_product_name:(provision_product_name_ : provisioned_product_name option)
    ?provision_product_id:(provision_product_id_ : id option) ?plan_id:(plan_id_ : id option)
    ?plan_name:(plan_name_ : provisioned_product_plan_name option) () =
  ({
     provisioning_artifact_id = provisioning_artifact_id_;
     plan_type = plan_type_;
     provision_product_name = provision_product_name_;
     provision_product_id = provision_product_id_;
     plan_id = plan_id_;
     plan_name = plan_name_;
   }
    : provisioned_product_plan_summary)

let make_provisioned_product_plan_details ?status_message:(status_message_ : status_message option)
    ?tags:(tags_ : tags option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?notification_arns:(notification_arns_ : notification_arns option)
    ?updated_time:(updated_time_ : updated_time option)
    ?status:(status_ : provisioned_product_plan_status option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?plan_type:(plan_type_ : provisioned_product_plan_type option)
    ?provision_product_name:(provision_product_name_ : provisioned_product_name option)
    ?provision_product_id:(provision_product_id_ : id option) ?plan_id:(plan_id_ : id option)
    ?plan_name:(plan_name_ : provisioned_product_plan_name option)
    ?product_id:(product_id_ : id option) ?path_id:(path_id_ : id option)
    ?created_time:(created_time_ : created_time option) () =
  ({
     status_message = status_message_;
     tags = tags_;
     provisioning_parameters = provisioning_parameters_;
     notification_arns = notification_arns_;
     updated_time = updated_time_;
     status = status_;
     provisioning_artifact_id = provisioning_artifact_id_;
     plan_type = plan_type_;
     provision_product_name = provision_product_name_;
     provision_product_id = provision_product_id_;
     plan_id = plan_id_;
     plan_name = plan_name_;
     product_id = product_id_;
     path_id = path_id_;
     created_time = created_time_;
   }
    : provisioned_product_plan_details)

let make_provision_product_output ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : provision_product_output)

let make_provision_product_input ?notification_arns:(notification_arns_ : notification_arns option)
    ?tags:(tags_ : tags option)
    ?provisioning_preferences:(provisioning_preferences_ : provisioning_preferences option)
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option)
    ?path_name:(path_name_ : portfolio_display_name option) ?path_id:(path_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_name:(product_name_ : product_view_name option) ?product_id:(product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option)
    ~provision_token:(provision_token_ : idempotency_token)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name) () =
  ({
     provision_token = provision_token_;
     notification_arns = notification_arns_;
     tags = tags_;
     provisioning_preferences = provisioning_preferences_;
     provisioning_parameters = provisioning_parameters_;
     provisioned_product_name = provisioned_product_name_;
     path_name = path_name_;
     path_id = path_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_name = product_name_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : provision_product_input)

let make_principal ?principal_type:(principal_type_ : principal_type option)
    ?principal_ar_n:(principal_ar_n_ : principal_ar_n option) () =
  ({ principal_type = principal_type_; principal_ar_n = principal_ar_n_ } : principal)

let make_portfolio_share_detail ?share_principals:(share_principals_ : boolean_ option)
    ?share_tag_options:(share_tag_options_ : boolean_ option)
    ?accepted:(accepted_ : boolean_ option) ?type_:(type__ : describe_portfolio_share_type option)
    ?principal_id:(principal_id_ : id option) () =
  ({
     share_principals = share_principals_;
     share_tag_options = share_tag_options_;
     accepted = accepted_;
     type_ = type__;
     principal_id = principal_id_;
   }
    : portfolio_share_detail)

let make_notify_update_provisioned_product_engine_workflow_result_output () = (() : unit)

let make_notify_update_provisioned_product_engine_workflow_result_input
    ?outputs:(outputs_ : record_outputs option)
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~status:(status_ : engine_workflow_status) ~record_id:(record_id_ : id)
    ~workflow_token:(workflow_token_ : engine_workflow_token) () =
  ({
     idempotency_token = idempotency_token_;
     outputs = outputs_;
     failure_reason = failure_reason_;
     status = status_;
     record_id = record_id_;
     workflow_token = workflow_token_;
   }
    : notify_update_provisioned_product_engine_workflow_result_input)

let make_notify_terminate_provisioned_product_engine_workflow_result_output () = (() : unit)

let make_notify_terminate_provisioned_product_engine_workflow_result_input
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~status:(status_ : engine_workflow_status) ~record_id:(record_id_ : id)
    ~workflow_token:(workflow_token_ : engine_workflow_token) () =
  ({
     idempotency_token = idempotency_token_;
     failure_reason = failure_reason_;
     status = status_;
     record_id = record_id_;
     workflow_token = workflow_token_;
   }
    : notify_terminate_provisioned_product_engine_workflow_result_input)

let make_notify_provision_product_engine_workflow_result_output () = (() : unit)

let make_engine_workflow_resource_identifier
    ?unique_tag:(unique_tag_ : unique_tag_resource_identifier option) () =
  ({ unique_tag = unique_tag_ } : engine_workflow_resource_identifier)

let make_notify_provision_product_engine_workflow_result_input
    ?outputs:(outputs_ : record_outputs option)
    ?resource_identifier:(resource_identifier_ : engine_workflow_resource_identifier option)
    ?failure_reason:(failure_reason_ : engine_workflow_failure_reason option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~status:(status_ : engine_workflow_status) ~record_id:(record_id_ : id)
    ~workflow_token:(workflow_token_ : engine_workflow_token) () =
  ({
     idempotency_token = idempotency_token_;
     outputs = outputs_;
     resource_identifier = resource_identifier_;
     failure_reason = failure_reason_;
     status = status_;
     record_id = record_id_;
     workflow_token = workflow_token_;
   }
    : notify_provision_product_engine_workflow_result_input)

let make_list_tag_options_output ?page_token:(page_token_ : page_token option)
    ?tag_option_details:(tag_option_details_ : tag_option_details option) () =
  ({ page_token = page_token_; tag_option_details = tag_option_details_ } : list_tag_options_output)

let make_list_tag_options_filters ?active:(active_ : tag_option_active option)
    ?value:(value_ : tag_option_value option) ?key:(key_ : tag_option_key option) () =
  ({ active = active_; value = value_; key = key_ } : list_tag_options_filters)

let make_list_tag_options_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option) ?filters:(filters_ : list_tag_options_filters option)
    () =
  ({ page_token = page_token_; page_size = page_size_; filters = filters_ }
    : list_tag_options_input)

let make_list_stack_instances_for_provisioned_product_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?stack_instances:(stack_instances_ : stack_instances option) () =
  ({ next_page_token = next_page_token_; stack_instances = stack_instances_ }
    : list_stack_instances_for_provisioned_product_output)

let make_list_stack_instances_for_provisioned_product_input
    ?page_size:(page_size_ : page_size option) ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option)
    ~provisioned_product_id:(provisioned_product_id_ : id) () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     provisioned_product_id = provisioned_product_id_;
     accept_language = accept_language_;
   }
    : list_stack_instances_for_provisioned_product_input)

let make_list_service_actions_output ?next_page_token:(next_page_token_ : page_token option)
    ?service_action_summaries:(service_action_summaries_ : service_action_summaries option) () =
  ({ next_page_token = next_page_token_; service_action_summaries = service_action_summaries_ }
    : list_service_actions_output)

let make_list_service_actions_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({ page_token = page_token_; page_size = page_size_; accept_language = accept_language_ }
    : list_service_actions_input)

let make_list_service_actions_for_provisioning_artifact_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?service_action_summaries:(service_action_summaries_ : service_action_summaries option) () =
  ({ next_page_token = next_page_token_; service_action_summaries = service_action_summaries_ }
    : list_service_actions_for_provisioning_artifact_output)

let make_list_service_actions_for_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     accept_language = accept_language_;
     page_token = page_token_;
     page_size = page_size_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
   }
    : list_service_actions_for_provisioning_artifact_input)

let make_list_resources_for_tag_option_output ?page_token:(page_token_ : page_token option)
    ?resource_details:(resource_details_ : resource_details option) () =
  ({ page_token = page_token_; resource_details = resource_details_ }
    : list_resources_for_tag_option_output)

let make_list_resources_for_tag_option_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?resource_type:(resource_type_ : resource_type option)
    ~tag_option_id:(tag_option_id_ : tag_option_id) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     resource_type = resource_type_;
     tag_option_id = tag_option_id_;
   }
    : list_resources_for_tag_option_input)

let make_list_record_history_search_filter ?value:(value_ : search_filter_value option)
    ?key:(key_ : search_filter_key option) () =
  ({ value = value_; key = key_ } : list_record_history_search_filter)

let make_list_record_history_output ?next_page_token:(next_page_token_ : page_token option)
    ?record_details:(record_details_ : record_details option) () =
  ({ next_page_token = next_page_token_; record_details = record_details_ }
    : list_record_history_output)

let make_list_record_history_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?search_filter:(search_filter_ : list_record_history_search_filter option)
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     search_filter = search_filter_;
     access_level_filter = access_level_filter_;
     accept_language = accept_language_;
   }
    : list_record_history_input)

let make_list_provisioning_artifacts_output ?next_page_token:(next_page_token_ : page_token option)
    ?provisioning_artifact_details:
      (provisioning_artifact_details_ : provisioning_artifact_details option) () =
  ({
     next_page_token = next_page_token_;
     provisioning_artifact_details = provisioning_artifact_details_;
   }
    : list_provisioning_artifacts_output)

let make_list_provisioning_artifacts_input
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id) () =
  ({ product_id = product_id_; accept_language = accept_language_ }
    : list_provisioning_artifacts_input)

let make_list_provisioning_artifacts_for_service_action_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?provisioning_artifact_views:(provisioning_artifact_views_ : provisioning_artifact_views option)
    () =
  ({
     next_page_token = next_page_token_;
     provisioning_artifact_views = provisioning_artifact_views_;
   }
    : list_provisioning_artifacts_for_service_action_output)

let make_list_provisioning_artifacts_for_service_action_input
    ?accept_language:(accept_language_ : accept_language option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ~service_action_id:(service_action_id_ : id) () =
  ({
     accept_language = accept_language_;
     page_token = page_token_;
     page_size = page_size_;
     service_action_id = service_action_id_;
   }
    : list_provisioning_artifacts_for_service_action_input)

let make_list_provisioned_product_plans_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?provisioned_product_plans:(provisioned_product_plans_ : provisioned_product_plans option) () =
  ({ next_page_token = next_page_token_; provisioned_product_plans = provisioned_product_plans_ }
    : list_provisioned_product_plans_output)

let make_list_provisioned_product_plans_input
    ?access_level_filter:(access_level_filter_ : access_level_filter option)
    ?page_token:(page_token_ : page_token option) ?page_size:(page_size_ : page_size option)
    ?provision_product_id:(provision_product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     access_level_filter = access_level_filter_;
     page_token = page_token_;
     page_size = page_size_;
     provision_product_id = provision_product_id_;
     accept_language = accept_language_;
   }
    : list_provisioned_product_plans_input)

let make_list_principals_for_portfolio_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?principals:(principals_ : principals option) () =
  ({ next_page_token = next_page_token_; principals = principals_ }
    : list_principals_for_portfolio_output)

let make_list_principals_for_portfolio_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : list_principals_for_portfolio_input)

let make_list_portfolios_output ?next_page_token:(next_page_token_ : page_token option)
    ?portfolio_details:(portfolio_details_ : portfolio_details option) () =
  ({ next_page_token = next_page_token_; portfolio_details = portfolio_details_ }
    : list_portfolios_output)

let make_list_portfolios_input ?page_size:(page_size_ : page_size_max100 option)
    ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({ page_size = page_size_; page_token = page_token_; accept_language = accept_language_ }
    : list_portfolios_input)

let make_list_portfolios_for_product_output ?next_page_token:(next_page_token_ : page_token option)
    ?portfolio_details:(portfolio_details_ : portfolio_details option) () =
  ({ next_page_token = next_page_token_; portfolio_details = portfolio_details_ }
    : list_portfolios_for_product_output)

let make_list_portfolios_for_product_input ?page_size:(page_size_ : page_size_max100 option)
    ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id) () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : list_portfolios_for_product_input)

let make_list_portfolio_access_output ?next_page_token:(next_page_token_ : page_token option)
    ?account_ids:(account_ids_ : account_ids option) () =
  ({ next_page_token = next_page_token_; account_ids = account_ids_ }
    : list_portfolio_access_output)

let make_list_portfolio_access_input ?page_size:(page_size_ : page_size_max100 option)
    ?page_token:(page_token_ : page_token option)
    ?organization_parent_id:(organization_parent_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     organization_parent_id = organization_parent_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : list_portfolio_access_input)

let make_list_organization_portfolio_access_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?organization_nodes:(organization_nodes_ : organization_nodes option) () =
  ({ next_page_token = next_page_token_; organization_nodes = organization_nodes_ }
    : list_organization_portfolio_access_output)

let make_list_organization_portfolio_access_input ?page_size:(page_size_ : page_size option)
    ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option)
    ~organization_node_type:(organization_node_type_ : organization_node_type)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     organization_node_type = organization_node_type_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : list_organization_portfolio_access_input)

let make_constraint_summary ?description:(description_ : constraint_description option)
    ?type_:(type__ : constraint_type option) () =
  ({ description = description_; type_ = type__ } : constraint_summary)

let make_launch_path_summary ?name:(name_ : portfolio_name option) ?tags:(tags_ : tags option)
    ?constraint_summaries:(constraint_summaries_ : constraint_summaries option)
    ?id:(id_ : id option) () =
  ({ name = name_; tags = tags_; constraint_summaries = constraint_summaries_; id = id_ }
    : launch_path_summary)

let make_list_launch_paths_output ?next_page_token:(next_page_token_ : page_token option)
    ?launch_path_summaries:(launch_path_summaries_ : launch_path_summaries option) () =
  ({ next_page_token = next_page_token_; launch_path_summaries = launch_path_summaries_ }
    : list_launch_paths_output)

let make_list_launch_paths_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?accept_language:(accept_language_ : accept_language option) ~product_id:(product_id_ : id) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : list_launch_paths_input)

let make_list_constraints_for_portfolio_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?constraint_details:(constraint_details_ : constraint_details option) () =
  ({ next_page_token = next_page_token_; constraint_details = constraint_details_ }
    : list_constraints_for_portfolio_output)

let make_list_constraints_for_portfolio_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option) ?product_id:(product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     product_id = product_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : list_constraints_for_portfolio_input)

let make_budget_detail ?budget_name:(budget_name_ : budget_name option) () =
  ({ budget_name = budget_name_ } : budget_detail)

let make_list_budgets_for_resource_output ?next_page_token:(next_page_token_ : page_token option)
    ?budgets:(budgets_ : budgets option) () =
  ({ next_page_token = next_page_token_; budgets = budgets_ } : list_budgets_for_resource_output)

let make_list_budgets_for_resource_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?accept_language:(accept_language_ : accept_language option) ~resource_id:(resource_id_ : id) ()
    =
  ({
     page_token = page_token_;
     page_size = page_size_;
     resource_id = resource_id_;
     accept_language = accept_language_;
   }
    : list_budgets_for_resource_input)

let make_list_accepted_portfolio_shares_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?portfolio_details:(portfolio_details_ : portfolio_details option) () =
  ({ next_page_token = next_page_token_; portfolio_details = portfolio_details_ }
    : list_accepted_portfolio_shares_output)

let make_list_accepted_portfolio_shares_input
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option)
    ?page_size:(page_size_ : page_size_max100 option) ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     portfolio_share_type = portfolio_share_type_;
     page_size = page_size_;
     page_token = page_token_;
     accept_language = accept_language_;
   }
    : list_accepted_portfolio_shares_input)

let make_launch_path ?name:(name_ : portfolio_name option) ?id:(id_ : id option) () =
  ({ name = name_; id = id_ } : launch_path)

let make_import_as_provisioned_product_output ?record_detail:(record_detail_ : record_detail option)
    () =
  ({ record_detail = record_detail_ } : import_as_provisioned_product_output)

let make_import_as_provisioned_product_input
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~physical_id:(physical_id_ : physical_id)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     physical_id = physical_id_;
     provisioned_product_name = provisioned_product_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : import_as_provisioned_product_input)

let make_get_provisioned_product_outputs_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?outputs:(outputs_ : record_outputs option) () =
  ({ next_page_token = next_page_token_; outputs = outputs_ }
    : get_provisioned_product_outputs_output)

let make_get_provisioned_product_outputs_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option) ?output_keys:(output_keys_ : output_keys option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?provisioned_product_id:(provisioned_product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     output_keys = output_keys_;
     provisioned_product_name = provisioned_product_name_;
     provisioned_product_id = provisioned_product_id_;
     accept_language = accept_language_;
   }
    : get_provisioned_product_outputs_input)

let make_get_aws_organizations_access_status_output
    ?access_status:(access_status_ : access_status option) () =
  ({ access_status = access_status_ } : get_aws_organizations_access_status_output)

let make_get_aws_organizations_access_status_input () = (() : unit)

let make_failed_service_action_association
    ?error_message:(error_message_ : service_action_association_error_message option)
    ?error_code:(error_code_ : service_action_association_error_code option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_id:(product_id_ : id option) ?service_action_id:(service_action_id_ : id option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     service_action_id = service_action_id_;
   }
    : failed_service_action_association)

let make_execution_parameter
    ?default_values:(default_values_ : execution_parameter_value_list option)
    ?type_:(type__ : execution_parameter_type option) ?name:(name_ : execution_parameter_key option)
    () =
  ({ default_values = default_values_; type_ = type__; name = name_ } : execution_parameter)

let make_execute_provisioned_product_service_action_output
    ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : execute_provisioned_product_service_action_output)

let make_execute_provisioned_product_service_action_input
    ?parameters:(parameters_ : execution_parameter_map option)
    ?accept_language:(accept_language_ : accept_language option)
    ~execute_token:(execute_token_ : idempotency_token) ~service_action_id:(service_action_id_ : id)
    ~provisioned_product_id:(provisioned_product_id_ : id) () =
  ({
     parameters = parameters_;
     accept_language = accept_language_;
     execute_token = execute_token_;
     service_action_id = service_action_id_;
     provisioned_product_id = provisioned_product_id_;
   }
    : execute_provisioned_product_service_action_input)

let make_execute_provisioned_product_plan_output
    ?record_detail:(record_detail_ : record_detail option) () =
  ({ record_detail = record_detail_ } : execute_provisioned_product_plan_output)

let make_execute_provisioned_product_plan_input
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~plan_id:(plan_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     plan_id = plan_id_;
     accept_language = accept_language_;
   }
    : execute_provisioned_product_plan_input)

let make_enable_aws_organizations_access_output () = (() : unit)
let make_enable_aws_organizations_access_input () = (() : unit)
let make_disassociate_tag_option_from_resource_output () = (() : unit)

let make_disassociate_tag_option_from_resource_input ~tag_option_id:(tag_option_id_ : tag_option_id)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ tag_option_id = tag_option_id_; resource_id = resource_id_ }
    : disassociate_tag_option_from_resource_input)

let make_disassociate_service_action_from_provisioning_artifact_output () = (() : unit)

let make_disassociate_service_action_from_provisioning_artifact_input
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_id:(service_action_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     accept_language = accept_language_;
     service_action_id = service_action_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
   }
    : disassociate_service_action_from_provisioning_artifact_input)

let make_disassociate_product_from_portfolio_output () = (() : unit)

let make_disassociate_product_from_portfolio_input
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    ~product_id:(product_id_ : id) () =
  ({ portfolio_id = portfolio_id_; product_id = product_id_; accept_language = accept_language_ }
    : disassociate_product_from_portfolio_input)

let make_disassociate_principal_from_portfolio_output () = (() : unit)

let make_disassociate_principal_from_portfolio_input
    ?principal_type:(principal_type_ : principal_type option)
    ?accept_language:(accept_language_ : accept_language option)
    ~principal_ar_n:(principal_ar_n_ : principal_ar_n) ~portfolio_id:(portfolio_id_ : id) () =
  ({
     principal_type = principal_type_;
     principal_ar_n = principal_ar_n_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : disassociate_principal_from_portfolio_input)

let make_disassociate_budget_from_resource_output () = (() : unit)

let make_disassociate_budget_from_resource_input ~resource_id:(resource_id_ : id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({ resource_id = resource_id_; budget_name = budget_name_ }
    : disassociate_budget_from_resource_input)

let make_disable_aws_organizations_access_output () = (() : unit)
let make_disable_aws_organizations_access_input () = (() : unit)

let make_describe_tag_option_output
    ?tag_option_detail:(tag_option_detail_ : tag_option_detail option) () =
  ({ tag_option_detail = tag_option_detail_ } : describe_tag_option_output)

let make_describe_tag_option_input ~id:(id_ : tag_option_id) () =
  ({ id = id_ } : describe_tag_option_input)

let make_describe_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : describe_service_action_output)

let make_describe_service_action_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ accept_language = accept_language_; id = id_ } : describe_service_action_input)

let make_describe_service_action_execution_parameters_output
    ?service_action_parameters:(service_action_parameters_ : execution_parameters option) () =
  ({ service_action_parameters = service_action_parameters_ }
    : describe_service_action_execution_parameters_output)

let make_describe_service_action_execution_parameters_input
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_id:(service_action_id_ : id)
    ~provisioned_product_id:(provisioned_product_id_ : id) () =
  ({
     accept_language = accept_language_;
     service_action_id = service_action_id_;
     provisioned_product_id = provisioned_product_id_;
   }
    : describe_service_action_execution_parameters_input)

let make_describe_record_output ?next_page_token:(next_page_token_ : page_token option)
    ?record_outputs:(record_outputs_ : record_outputs option)
    ?record_detail:(record_detail_ : record_detail option) () =
  ({
     next_page_token = next_page_token_;
     record_outputs = record_outputs_;
     record_detail = record_detail_;
   }
    : describe_record_output)

let make_describe_record_input ?page_size:(page_size_ : page_size option)
    ?page_token:(page_token_ : page_token option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     id = id_;
     accept_language = accept_language_;
   }
    : describe_record_input)

let make_describe_provisioning_parameters_output
    ?provisioning_artifact_output_keys:
      (provisioning_artifact_output_keys_ : provisioning_artifact_outputs option)
    ?provisioning_artifact_outputs:
      (provisioning_artifact_outputs_ : provisioning_artifact_outputs option)
    ?provisioning_artifact_preferences:
      (provisioning_artifact_preferences_ : provisioning_artifact_preferences option)
    ?tag_options:(tag_options_ : tag_option_summaries option)
    ?usage_instructions:(usage_instructions_ : usage_instructions option)
    ?constraint_summaries:(constraint_summaries_ : constraint_summaries option)
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_parameters option) () =
  ({
     provisioning_artifact_output_keys = provisioning_artifact_output_keys_;
     provisioning_artifact_outputs = provisioning_artifact_outputs_;
     provisioning_artifact_preferences = provisioning_artifact_preferences_;
     tag_options = tag_options_;
     usage_instructions = usage_instructions_;
     constraint_summaries = constraint_summaries_;
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
   }
    : describe_provisioning_parameters_output)

let make_describe_provisioning_parameters_input
    ?path_name:(path_name_ : portfolio_display_name option) ?path_id:(path_id_ : id option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?product_name:(product_name_ : product_view_name option) ?product_id:(product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     path_name = path_name_;
     path_id = path_id_;
     provisioning_artifact_name = provisioning_artifact_name_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_name = product_name_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : describe_provisioning_parameters_input)

let make_describe_provisioning_artifact_output
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_parameters option)
    ?status:(status_ : status option) ?info:(info_ : provisioning_artifact_info option)
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option) () =
  ({
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
     status = status_;
     info = info_;
     provisioning_artifact_detail = provisioning_artifact_detail_;
   }
    : describe_provisioning_artifact_output)

let make_describe_provisioning_artifact_input
    ?include_provisioning_artifact_parameters:
      (include_provisioning_artifact_parameters_ : boolean_ option)
    ?verbose:(verbose_ : verbose option) ?product_name:(product_name_ : product_view_name option)
    ?provisioning_artifact_name:(provisioning_artifact_name_ : provisioning_artifact_name option)
    ?product_id:(product_id_ : id option)
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     include_provisioning_artifact_parameters = include_provisioning_artifact_parameters_;
     verbose = verbose_;
     product_name = product_name_;
     provisioning_artifact_name = provisioning_artifact_name_;
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     accept_language = accept_language_;
   }
    : describe_provisioning_artifact_input)

let make_describe_provisioned_product_plan_output
    ?next_page_token:(next_page_token_ : page_token option)
    ?resource_changes:(resource_changes_ : resource_changes option)
    ?provisioned_product_plan_details:
      (provisioned_product_plan_details_ : provisioned_product_plan_details option) () =
  ({
     next_page_token = next_page_token_;
     resource_changes = resource_changes_;
     provisioned_product_plan_details = provisioned_product_plan_details_;
   }
    : describe_provisioned_product_plan_output)

let make_describe_provisioned_product_plan_input ?page_token:(page_token_ : page_token option)
    ?page_size:(page_size_ : page_size option)
    ?accept_language:(accept_language_ : accept_language option) ~plan_id:(plan_id_ : id) () =
  ({
     page_token = page_token_;
     page_size = page_size_;
     plan_id = plan_id_;
     accept_language = accept_language_;
   }
    : describe_provisioned_product_plan_input)

let make_cloud_watch_dashboard ?name:(name_ : cloud_watch_dashboard_name option) () =
  ({ name = name_ } : cloud_watch_dashboard)

let make_describe_provisioned_product_output
    ?cloud_watch_dashboards:(cloud_watch_dashboards_ : cloud_watch_dashboards option)
    ?provisioned_product_detail:(provisioned_product_detail_ : provisioned_product_detail option) ()
    =
  ({
     cloud_watch_dashboards = cloud_watch_dashboards_;
     provisioned_product_detail = provisioned_product_detail_;
   }
    : describe_provisioned_product_output)

let make_describe_provisioned_product_input ?name:(name_ : provisioned_product_name option)
    ?id:(id_ : id option) ?accept_language:(accept_language_ : accept_language option) () =
  ({ name = name_; id = id_; accept_language = accept_language_ }
    : describe_provisioned_product_input)

let make_describe_product_view_output
    ?provisioning_artifacts:(provisioning_artifacts_ : provisioning_artifacts option)
    ?product_view_summary:(product_view_summary_ : product_view_summary option) () =
  ({
     provisioning_artifacts = provisioning_artifacts_;
     product_view_summary = product_view_summary_;
   }
    : describe_product_view_output)

let make_describe_product_view_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : describe_product_view_input)

let make_describe_product_output ?launch_paths:(launch_paths_ : launch_paths option)
    ?budgets:(budgets_ : budgets option)
    ?provisioning_artifacts:(provisioning_artifacts_ : provisioning_artifacts option)
    ?product_view_summary:(product_view_summary_ : product_view_summary option) () =
  ({
     launch_paths = launch_paths_;
     budgets = budgets_;
     provisioning_artifacts = provisioning_artifacts_;
     product_view_summary = product_view_summary_;
   }
    : describe_product_output)

let make_describe_product_input ?name:(name_ : product_view_name option) ?id:(id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({ name = name_; id = id_; accept_language = accept_language_ } : describe_product_input)

let make_describe_product_as_admin_output ?budgets:(budgets_ : budgets option)
    ?tag_options:(tag_options_ : tag_option_details option) ?tags:(tags_ : tags option)
    ?provisioning_artifact_summaries:
      (provisioning_artifact_summaries_ : provisioning_artifact_summaries option)
    ?product_view_detail:(product_view_detail_ : product_view_detail option) () =
  ({
     budgets = budgets_;
     tag_options = tag_options_;
     tags = tags_;
     provisioning_artifact_summaries = provisioning_artifact_summaries_;
     product_view_detail = product_view_detail_;
   }
    : describe_product_as_admin_output)

let make_describe_product_as_admin_input ?source_portfolio_id:(source_portfolio_id_ : id option)
    ?name:(name_ : product_view_name option) ?id:(id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) () =
  ({
     source_portfolio_id = source_portfolio_id_;
     name = name_;
     id = id_;
     accept_language = accept_language_;
   }
    : describe_product_as_admin_input)

let make_describe_portfolio_shares_output
    ?portfolio_share_details:(portfolio_share_details_ : portfolio_share_details option)
    ?next_page_token:(next_page_token_ : page_token option) () =
  ({ portfolio_share_details = portfolio_share_details_; next_page_token = next_page_token_ }
    : describe_portfolio_shares_output)

let make_describe_portfolio_shares_input ?page_size:(page_size_ : page_size_max100 option)
    ?page_token:(page_token_ : page_token option) ~type_:(type__ : describe_portfolio_share_type)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     page_size = page_size_;
     page_token = page_token_;
     type_ = type__;
     portfolio_id = portfolio_id_;
   }
    : describe_portfolio_shares_input)

let make_describe_portfolio_share_status_output
    ?share_details:(share_details_ : share_details option) ?status:(status_ : share_status option)
    ?organization_node_value:(organization_node_value_ : organization_node_value option)
    ?portfolio_id:(portfolio_id_ : id option)
    ?portfolio_share_token:(portfolio_share_token_ : id option) () =
  ({
     share_details = share_details_;
     status = status_;
     organization_node_value = organization_node_value_;
     portfolio_id = portfolio_id_;
     portfolio_share_token = portfolio_share_token_;
   }
    : describe_portfolio_share_status_output)

let make_describe_portfolio_share_status_input ~portfolio_share_token:(portfolio_share_token_ : id)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : describe_portfolio_share_status_input)

let make_describe_portfolio_output ?budgets:(budgets_ : budgets option)
    ?tag_options:(tag_options_ : tag_option_details option) ?tags:(tags_ : tags option)
    ?portfolio_detail:(portfolio_detail_ : portfolio_detail option) () =
  ({
     budgets = budgets_;
     tag_options = tag_options_;
     tags = tags_;
     portfolio_detail = portfolio_detail_;
   }
    : describe_portfolio_output)

let make_describe_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : describe_portfolio_input)

let make_describe_copy_product_status_output ?status_detail:(status_detail_ : status_detail option)
    ?target_product_id:(target_product_id_ : id option)
    ?copy_product_status:(copy_product_status_ : copy_product_status option) () =
  ({
     status_detail = status_detail_;
     target_product_id = target_product_id_;
     copy_product_status = copy_product_status_;
   }
    : describe_copy_product_status_output)

let make_describe_copy_product_status_input
    ?accept_language:(accept_language_ : accept_language option)
    ~copy_product_token:(copy_product_token_ : id) () =
  ({ copy_product_token = copy_product_token_; accept_language = accept_language_ }
    : describe_copy_product_status_input)

let make_describe_constraint_output ?status:(status_ : status option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?constraint_detail:(constraint_detail_ : constraint_detail option) () =
  ({
     status = status_;
     constraint_parameters = constraint_parameters_;
     constraint_detail = constraint_detail_;
   }
    : describe_constraint_output)

let make_describe_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : describe_constraint_input)

let make_delete_tag_option_output () = (() : unit)

let make_delete_tag_option_input ~id:(id_ : tag_option_id) () =
  ({ id = id_ } : delete_tag_option_input)

let make_delete_service_action_output () = (() : unit)

let make_delete_service_action_input
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?accept_language:(accept_language_ : accept_language option) ~id:(id_ : id) () =
  ({ idempotency_token = idempotency_token_; accept_language = accept_language_; id = id_ }
    : delete_service_action_input)

let make_delete_provisioning_artifact_output () = (() : unit)

let make_delete_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : delete_provisioning_artifact_input)

let make_delete_provisioned_product_plan_output () = (() : unit)

let make_delete_provisioned_product_plan_input
    ?ignore_errors:(ignore_errors_ : ignore_errors option)
    ?accept_language:(accept_language_ : accept_language option) ~plan_id:(plan_id_ : id) () =
  ({ ignore_errors = ignore_errors_; plan_id = plan_id_; accept_language = accept_language_ }
    : delete_provisioned_product_plan_input)

let make_delete_product_output () = (() : unit)

let make_delete_product_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : delete_product_input)

let make_delete_portfolio_share_output ?portfolio_share_token:(portfolio_share_token_ : id option)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : delete_portfolio_share_output)

let make_delete_portfolio_share_input
    ?organization_node:(organization_node_ : organization_node option)
    ?account_id:(account_id_ : account_id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     organization_node = organization_node_;
     account_id = account_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : delete_portfolio_share_input)

let make_delete_portfolio_output () = (() : unit)

let make_delete_portfolio_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : delete_portfolio_input)

let make_delete_constraint_output () = (() : unit)

let make_delete_constraint_input ?accept_language:(accept_language_ : accept_language option)
    ~id:(id_ : id) () =
  ({ id = id_; accept_language = accept_language_ } : delete_constraint_input)

let make_create_tag_option_output ?tag_option_detail:(tag_option_detail_ : tag_option_detail option)
    () =
  ({ tag_option_detail = tag_option_detail_ } : create_tag_option_output)

let make_create_tag_option_input ~value:(value_ : tag_option_value) ~key:(key_ : tag_option_key) ()
    =
  ({ value = value_; key = key_ } : create_tag_option_input)

let make_create_service_action_output
    ?service_action_detail:(service_action_detail_ : service_action_detail option) () =
  ({ service_action_detail = service_action_detail_ } : create_service_action_output)

let make_create_service_action_input ?accept_language:(accept_language_ : accept_language option)
    ?description:(description_ : service_action_description option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~definition:(definition_ : service_action_definition_map)
    ~definition_type:(definition_type_ : service_action_definition_type)
    ~name:(name_ : service_action_name) () =
  ({
     idempotency_token = idempotency_token_;
     accept_language = accept_language_;
     description = description_;
     definition = definition_;
     definition_type = definition_type_;
     name = name_;
   }
    : create_service_action_input)

let make_create_provisioning_artifact_output ?status:(status_ : status option)
    ?info:(info_ : provisioning_artifact_info option)
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option) () =
  ({ status = status_; info = info_; provisioning_artifact_detail = provisioning_artifact_detail_ }
    : create_provisioning_artifact_output)

let make_create_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~parameters:(parameters_ : provisioning_artifact_properties) ~product_id:(product_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     parameters = parameters_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : create_provisioning_artifact_input)

let make_create_provisioned_product_plan_output
    ?provisioning_artifact_id:(provisioning_artifact_id_ : id option)
    ?provisioned_product_name:(provisioned_product_name_ : provisioned_product_name option)
    ?provision_product_id:(provision_product_id_ : id option) ?plan_id:(plan_id_ : id option)
    ?plan_name:(plan_name_ : provisioned_product_plan_name option) () =
  ({
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioned_product_name = provisioned_product_name_;
     provision_product_id = provision_product_id_;
     plan_id = plan_id_;
     plan_name = plan_name_;
   }
    : create_provisioned_product_plan_output)

let make_create_provisioned_product_plan_input ?tags:(tags_ : tags option)
    ?provisioning_parameters:(provisioning_parameters_ : update_provisioning_parameters option)
    ?path_id:(path_id_ : id option)
    ?notification_arns:(notification_arns_ : notification_arns option)
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id)
    ~provisioned_product_name:(provisioned_product_name_ : provisioned_product_name)
    ~product_id:(product_id_ : id) ~plan_type:(plan_type_ : provisioned_product_plan_type)
    ~plan_name:(plan_name_ : provisioned_product_plan_name) () =
  ({
     tags = tags_;
     idempotency_token = idempotency_token_;
     provisioning_parameters = provisioning_parameters_;
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioned_product_name = provisioned_product_name_;
     product_id = product_id_;
     path_id = path_id_;
     notification_arns = notification_arns_;
     plan_type = plan_type_;
     plan_name = plan_name_;
     accept_language = accept_language_;
   }
    : create_provisioned_product_plan_input)

let make_create_product_output ?tags:(tags_ : tags option)
    ?provisioning_artifact_detail:
      (provisioning_artifact_detail_ : provisioning_artifact_detail option)
    ?product_view_detail:(product_view_detail_ : product_view_detail option) () =
  ({
     tags = tags_;
     provisioning_artifact_detail = provisioning_artifact_detail_;
     product_view_detail = product_view_detail_;
   }
    : create_product_output)

let make_create_product_input ?source_connection:(source_connection_ : source_connection option)
    ?provisioning_artifact_parameters:
      (provisioning_artifact_parameters_ : provisioning_artifact_properties option)
    ?tags:(tags_ : add_tags option) ?support_url:(support_url_ : support_url option)
    ?support_email:(support_email_ : support_email option)
    ?support_description:(support_description_ : support_description option)
    ?distributor:(distributor_ : product_view_owner option)
    ?description:(description_ : product_view_short_description option)
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~product_type:(product_type_ : product_type) ~owner:(owner_ : product_view_owner)
    ~name:(name_ : product_view_name) () =
  ({
     source_connection = source_connection_;
     idempotency_token = idempotency_token_;
     provisioning_artifact_parameters = provisioning_artifact_parameters_;
     tags = tags_;
     product_type = product_type_;
     support_url = support_url_;
     support_email = support_email_;
     support_description = support_description_;
     distributor = distributor_;
     description = description_;
     owner = owner_;
     name = name_;
     accept_language = accept_language_;
   }
    : create_product_input)

let make_create_portfolio_share_output ?portfolio_share_token:(portfolio_share_token_ : id option)
    () =
  ({ portfolio_share_token = portfolio_share_token_ } : create_portfolio_share_output)

let make_create_portfolio_share_input ?share_principals:(share_principals_ : boolean_ option)
    ?share_tag_options:(share_tag_options_ : boolean_ option)
    ?organization_node:(organization_node_ : organization_node option)
    ?account_id:(account_id_ : account_id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     share_principals = share_principals_;
     share_tag_options = share_tag_options_;
     organization_node = organization_node_;
     account_id = account_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : create_portfolio_share_input)

let make_create_portfolio_output ?tags:(tags_ : tags option)
    ?portfolio_detail:(portfolio_detail_ : portfolio_detail option) () =
  ({ tags = tags_; portfolio_detail = portfolio_detail_ } : create_portfolio_output)

let make_create_portfolio_input ?tags:(tags_ : add_tags option)
    ?description:(description_ : portfolio_description option)
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~provider_name:(provider_name_ : provider_name)
    ~display_name:(display_name_ : portfolio_display_name) () =
  ({
     idempotency_token = idempotency_token_;
     tags = tags_;
     provider_name = provider_name_;
     description = description_;
     display_name = display_name_;
     accept_language = accept_language_;
   }
    : create_portfolio_input)

let make_create_constraint_output ?status:(status_ : status option)
    ?constraint_parameters:(constraint_parameters_ : constraint_parameters option)
    ?constraint_detail:(constraint_detail_ : constraint_detail option) () =
  ({
     status = status_;
     constraint_parameters = constraint_parameters_;
     constraint_detail = constraint_detail_;
   }
    : create_constraint_output)

let make_create_constraint_input ?description:(description_ : constraint_description option)
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token) ~type_:(type__ : constraint_type)
    ~parameters:(parameters_ : constraint_parameters) ~product_id:(product_id_ : id)
    ~portfolio_id:(portfolio_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     description = description_;
     type_ = type__;
     parameters = parameters_;
     product_id = product_id_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : create_constraint_input)

let make_copy_product_output ?copy_product_token:(copy_product_token_ : id option) () =
  ({ copy_product_token = copy_product_token_ } : copy_product_output)

let make_copy_product_input ?copy_options:(copy_options_ : copy_options option)
    ?source_provisioning_artifact_identifiers:
      (source_provisioning_artifact_identifiers_ : source_provisioning_artifact_properties option)
    ?target_product_name:(target_product_name_ : product_view_name option)
    ?target_product_id:(target_product_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option)
    ~idempotency_token:(idempotency_token_ : idempotency_token)
    ~source_product_arn:(source_product_arn_ : product_arn) () =
  ({
     idempotency_token = idempotency_token_;
     copy_options = copy_options_;
     source_provisioning_artifact_identifiers = source_provisioning_artifact_identifiers_;
     target_product_name = target_product_name_;
     target_product_id = target_product_id_;
     source_product_arn = source_product_arn_;
     accept_language = accept_language_;
   }
    : copy_product_input)

let make_batch_disassociate_service_action_from_provisioning_artifact_output
    ?failed_service_action_associations:
      (failed_service_action_associations_ : failed_service_action_associations option) () =
  ({ failed_service_action_associations = failed_service_action_associations_ }
    : batch_disassociate_service_action_from_provisioning_artifact_output)

let make_batch_disassociate_service_action_from_provisioning_artifact_input
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_associations:(service_action_associations_ : service_action_associations) () =
  ({
     accept_language = accept_language_;
     service_action_associations = service_action_associations_;
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
     accept_language = accept_language_;
     service_action_associations = service_action_associations_;
   }
    : batch_associate_service_action_with_provisioning_artifact_input)

let make_associate_tag_option_with_resource_output () = (() : unit)

let make_associate_tag_option_with_resource_input ~tag_option_id:(tag_option_id_ : tag_option_id)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ tag_option_id = tag_option_id_; resource_id = resource_id_ }
    : associate_tag_option_with_resource_input)

let make_associate_service_action_with_provisioning_artifact_output () = (() : unit)

let make_associate_service_action_with_provisioning_artifact_input
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?accept_language:(accept_language_ : accept_language option)
    ~service_action_id:(service_action_id_ : id)
    ~provisioning_artifact_id:(provisioning_artifact_id_ : id) ~product_id:(product_id_ : id) () =
  ({
     idempotency_token = idempotency_token_;
     accept_language = accept_language_;
     service_action_id = service_action_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     product_id = product_id_;
   }
    : associate_service_action_with_provisioning_artifact_input)

let make_associate_product_with_portfolio_output () = (() : unit)

let make_associate_product_with_portfolio_input
    ?source_portfolio_id:(source_portfolio_id_ : id option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    ~product_id:(product_id_ : id) () =
  ({
     source_portfolio_id = source_portfolio_id_;
     portfolio_id = portfolio_id_;
     product_id = product_id_;
     accept_language = accept_language_;
   }
    : associate_product_with_portfolio_input)

let make_associate_principal_with_portfolio_output () = (() : unit)

let make_associate_principal_with_portfolio_input
    ?accept_language:(accept_language_ : accept_language option)
    ~principal_type:(principal_type_ : principal_type)
    ~principal_ar_n:(principal_ar_n_ : principal_ar_n) ~portfolio_id:(portfolio_id_ : id) () =
  ({
     principal_type = principal_type_;
     principal_ar_n = principal_ar_n_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : associate_principal_with_portfolio_input)

let make_associate_budget_with_resource_output () = (() : unit)

let make_associate_budget_with_resource_input ~resource_id:(resource_id_ : id)
    ~budget_name:(budget_name_ : budget_name) () =
  ({ resource_id = resource_id_; budget_name = budget_name_ }
    : associate_budget_with_resource_input)

let make_accept_portfolio_share_output () = (() : unit)

let make_accept_portfolio_share_input
    ?portfolio_share_type:(portfolio_share_type_ : portfolio_share_type option)
    ?accept_language:(accept_language_ : accept_language option) ~portfolio_id:(portfolio_id_ : id)
    () =
  ({
     portfolio_share_type = portfolio_share_type_;
     portfolio_id = portfolio_id_;
     accept_language = accept_language_;
   }
    : accept_portfolio_share_input)
