open Types

let make_account_info ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~account_id:(account_id_ : account_id) ~status:(status_ : enrollment_status)
    ~organization_rule_mode:(organization_rule_mode_ : organization_rule_mode)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     account_id = account_id_;
     status = status_;
     organization_rule_mode = organization_rule_mode_;
     status_reason = status_reason_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : account_info)

let make_associate_accounts_response ?account_ids:(account_ids_ : account_id_list option)
    ?errors:(errors_ : string_list option) () =
  ({ account_ids = account_ids_; errors = errors_ } : associate_accounts_response)

let make_associate_accounts_request ?client_token:(client_token_ : client_token option)
    ~account_ids:(account_ids_ : account_id_list) () =
  ({ account_ids = account_ids_; client_token = client_token_ } : associate_accounts_request)

let make_estimated_monthly_savings ~currency:(currency_ : Smaws_Lib.Smithy_api.Types.string_)
    ~before_discount_savings:(before_discount_savings_ : Smaws_Lib.Smithy_api.Types.double)
    ~after_discount_savings:(after_discount_savings_ : Smaws_Lib.Smithy_api.Types.double)
    ~savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode) () =
  ({
     currency = currency_;
     before_discount_savings = before_discount_savings_;
     after_discount_savings = after_discount_savings_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : estimated_monthly_savings)

let make_automation_event ?event_id:(event_id_ : event_id option)
    ?event_description:(event_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_type:(event_type_ : event_type option)
    ?event_status:(event_status_ : event_status option)
    ?event_status_reason:(event_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_id:(resource_id_ : resource_id option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?account_id:(account_id_ : account_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_id:(rule_id_ : rule_id option) ?resource_type:(resource_type_ : resource_type option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     event_id = event_id_;
     event_description = event_description_;
     event_type = event_type_;
     event_status = event_status_;
     event_status_reason = event_status_reason_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     recommended_action_id = recommended_action_id_;
     account_id = account_id_;
     region = region_;
     rule_id = rule_id_;
     resource_type = resource_type_;
     created_timestamp = created_timestamp_;
     completed_timestamp = completed_timestamp_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : automation_event)

let make_automation_event_filter ~name:(name_ : automation_event_filter_name)
    ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_ } : automation_event_filter)

let make_automation_event_step ?event_id:(event_id_ : event_id option)
    ?step_id:(step_id_ : step_id option) ?step_type:(step_type_ : step_type option)
    ?step_status:(step_status_ : step_status option)
    ?resource_id:(resource_id_ : resource_id option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     event_id = event_id_;
     step_id = step_id_;
     step_type = step_type_;
     step_status = step_status_;
     resource_id = resource_id_;
     start_timestamp = start_timestamp_;
     completed_timestamp = completed_timestamp_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : automation_event_step)

let make_summary_totals
    ?automation_event_count:(automation_event_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     automation_event_count = automation_event_count_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : summary_totals)

let make_time_period
    ?start_time_inclusive:(start_time_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time_exclusive:(end_time_exclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ start_time_inclusive = start_time_inclusive_; end_time_exclusive = end_time_exclusive_ }
    : time_period)

let make_summary_dimension ~key:(key_ : summary_dimension_key)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ key = key_; value = value_ } : summary_dimension)

let make_automation_event_summary ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?dimensions:(dimensions_ : summary_dimensions option)
    ?time_period:(time_period_ : time_period option) ?total:(total_ : summary_totals option) () =
  ({ key = key_; dimensions = dimensions_; time_period = time_period_; total = total_ }
    : automation_event_summary)

let make_schedule
    ?schedule_expression:(schedule_expression_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?schedule_expression_timezone:
      (schedule_expression_timezone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?execution_window_in_minutes:
      (execution_window_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     schedule_expression = schedule_expression_;
     schedule_expression_timezone = schedule_expression_timezone_;
     execution_window_in_minutes = execution_window_in_minutes_;
   }
    : schedule)

let make_organization_configuration ?rule_apply_order:(rule_apply_order_ : rule_apply_order option)
    ?account_ids:(account_ids_ : organization_configuration_account_ids option) () =
  ({ rule_apply_order = rule_apply_order_; account_ids = account_ids_ }
    : organization_configuration)

let make_automation_rule ?rule_arn:(rule_arn_ : rule_arn option)
    ?rule_id:(rule_id_ : rule_id option) ?name:(name_ : rule_name option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_type:(rule_type_ : rule_type option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?account_id:(account_id_ : account_id option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?schedule:(schedule_ : schedule option) ?status:(status_ : rule_status option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    () =
  ({
     rule_arn = rule_arn_;
     rule_id = rule_id_;
     name = name_;
     description = description_;
     rule_type = rule_type_;
     rule_revision = rule_revision_;
     account_id = account_id_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     schedule = schedule_;
     status = status_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : automation_rule)

let make_update_enrollment_configuration_response
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : enrollment_status)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     status = status_;
     status_reason = status_reason_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : update_enrollment_configuration_response)

let make_update_enrollment_configuration_request ?client_token:(client_token_ : client_token option)
    ~status:(status_ : enrollment_status) () =
  ({ status = status_; client_token = client_token_ } : update_enrollment_configuration_request)

let make_string_criteria_condition ?comparison:(comparison_ : comparison_operator option)
    ?values:(values_ : string_criteria_values option) () =
  ({ comparison = comparison_; values = values_ } : string_criteria_condition)

let make_integer_criteria_condition ?comparison:(comparison_ : comparison_operator option)
    ?values:(values_ : integer_list option) () =
  ({ comparison = comparison_; values = values_ } : integer_criteria_condition)

let make_resource_tags_criteria_condition ?comparison:(comparison_ : comparison_operator option)
    ?key:(key_ : string_criteria_value option) ?values:(values_ : string_criteria_values option) ()
    =
  ({ comparison = comparison_; key = key_; values = values_ } : resource_tags_criteria_condition)

let make_double_criteria_condition ?comparison:(comparison_ : comparison_operator option)
    ?values:(values_ : double_list option) () =
  ({ comparison = comparison_; values = values_ } : double_criteria_condition)

let make_criteria ?region:(region_ : string_criteria_condition_list option)
    ?resource_arn:(resource_arn_ : string_criteria_condition_list option)
    ?ebs_volume_type:(ebs_volume_type_ : string_criteria_condition_list option)
    ?ebs_volume_size_in_gib:(ebs_volume_size_in_gib_ : integer_criteria_condition_list option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : double_criteria_condition_list option)
    ?resource_tag:(resource_tag_ : resource_tags_criteria_condition_list option)
    ?look_back_period_in_days:(look_back_period_in_days_ : integer_criteria_condition_list option)
    ?restart_needed:(restart_needed_ : string_criteria_condition_list option) () =
  ({
     region = region_;
     resource_arn = resource_arn_;
     ebs_volume_type = ebs_volume_type_;
     ebs_volume_size_in_gib = ebs_volume_size_in_gib_;
     estimated_monthly_savings = estimated_monthly_savings_;
     resource_tag = resource_tag_;
     look_back_period_in_days = look_back_period_in_days_;
     restart_needed = restart_needed_;
   }
    : criteria)

let make_update_automation_rule_response ?rule_arn:(rule_arn_ : rule_arn option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?name:(name_ : rule_name option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_type:(rule_type_ : rule_type option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?criteria:(criteria_ : criteria option) ?schedule:(schedule_ : schedule option)
    ?status:(status_ : rule_status option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    () =
  ({
     rule_arn = rule_arn_;
     rule_revision = rule_revision_;
     name = name_;
     description = description_;
     rule_type = rule_type_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     schedule = schedule_;
     status = status_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : update_automation_rule_response)

let make_update_automation_rule_request ?name:(name_ : rule_name option)
    ?description:(description_ : rule_description option) ?rule_type:(rule_type_ : rule_type option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?criteria:(criteria_ : criteria option) ?schedule:(schedule_ : schedule option)
    ?status:(status_ : rule_status option) ?client_token:(client_token_ : client_token option)
    ~rule_arn:(rule_arn_ : rule_arn)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({
     rule_arn = rule_arn_;
     rule_revision = rule_revision_;
     name = name_;
     description = description_;
     rule_type = rule_type_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     schedule = schedule_;
     status = status_;
     client_token = client_token_;
   }
    : update_automation_rule_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ?client_token:(client_token_ : client_token option)
    ~resource_arn:(resource_arn_ : rule_arn)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({
     resource_arn = resource_arn_;
     rule_revision = rule_revision_;
     tag_keys = tag_keys_;
     client_token = client_token_;
   }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ?client_token:(client_token_ : client_token option)
    ~resource_arn:(resource_arn_ : rule_arn)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long) ~tags:(tags_ : tag_list) () =
  ({
     resource_arn = resource_arn_;
     rule_revision = rule_revision_;
     tags = tags_;
     client_token = client_token_;
   }
    : tag_resource_request)

let make_start_automation_event_response
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?event_id:(event_id_ : event_id option) ?event_status:(event_status_ : event_status option) () =
  ({
     recommended_action_id = recommended_action_id_;
     event_id = event_id_;
     event_status = event_status_;
   }
    : start_automation_event_response)

let make_start_automation_event_request ?client_token:(client_token_ : client_token option)
    ~recommended_action_id:(recommended_action_id_ : recommended_action_id) () =
  ({ recommended_action_id = recommended_action_id_; client_token = client_token_ }
    : start_automation_event_request)

let make_rollback_automation_event_response ?event_id:(event_id_ : event_id option)
    ?event_status:(event_status_ : event_status option) () =
  ({ event_id = event_id_; event_status = event_status_ } : rollback_automation_event_response)

let make_rollback_automation_event_request ?client_token:(client_token_ : client_token option)
    ~event_id:(event_id_ : event_id) () =
  ({ event_id = event_id_; client_token = client_token_ } : rollback_automation_event_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : rule_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_recommended_action_total
    ~recommended_action_count:(recommended_action_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings) () =
  ({
     recommended_action_count = recommended_action_count_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : recommended_action_total)

let make_recommended_action_summary ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~total:(total_ : recommended_action_total) () =
  ({ key = key_; total = total_ } : recommended_action_summary)

let make_list_recommended_action_summaries_response
    ?recommended_action_summaries:
      (recommended_action_summaries_ : recommended_action_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommended_action_summaries = recommended_action_summaries_; next_token = next_token_ }
    : list_recommended_action_summaries_response)

let make_recommended_action_filter ~name:(name_ : recommended_action_filter_name)
    ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_ } : recommended_action_filter)

let make_list_recommended_action_summaries_request
    ?filters:(filters_ : recommended_action_filter_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_recommended_action_summaries_request)

let make_ebs_volume_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_in_gib:(size_in_gib_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?throughput:(throughput_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ type_ = type__; size_in_gib = size_in_gib_; iops = iops_; throughput = throughput_ }
    : ebs_volume_configuration)

let make_ebs_volume ?configuration:(configuration_ : ebs_volume_configuration option) () =
  ({ configuration = configuration_ } : ebs_volume)

let make_recommended_action
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_id:(resource_id_ : resource_id option) ?account_id:(account_id_ : account_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?look_back_period_in_days:
      (look_back_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?recommended_action_type:(recommended_action_type_ : recommended_action_type option)
    ?current_resource_summary:
      (current_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_resource_details:(current_resource_details_ : resource_details option)
    ?recommended_resource_summary:
      (recommended_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_resource_details:(recommended_resource_details_ : resource_details option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?resource_tags:(resource_tags_ : tag_list option) () =
  ({
     recommended_action_id = recommended_action_id_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     account_id = account_id_;
     region = region_;
     resource_type = resource_type_;
     look_back_period_in_days = look_back_period_in_days_;
     recommended_action_type = recommended_action_type_;
     current_resource_summary = current_resource_summary_;
     current_resource_details = current_resource_details_;
     recommended_resource_summary = recommended_resource_summary_;
     recommended_resource_details = recommended_resource_details_;
     restart_needed = restart_needed_;
     estimated_monthly_savings = estimated_monthly_savings_;
     resource_tags = resource_tags_;
   }
    : recommended_action)

let make_list_recommended_actions_response
    ?recommended_actions:(recommended_actions_ : recommended_actions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ recommended_actions = recommended_actions_; next_token = next_token_ }
    : list_recommended_actions_response)

let make_list_recommended_actions_request
    ?filters:(filters_ : recommended_action_filter_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_recommended_actions_request)

let make_list_automation_rules_response
    ?automation_rules:(automation_rules_ : automation_rules option)
    ?next_token:(next_token_ : next_token option) () =
  ({ automation_rules = automation_rules_; next_token = next_token_ }
    : list_automation_rules_response)

let make_filter ~name:(name_ : automation_rule_filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_ } : filter)

let make_list_automation_rules_request ?filters:(filters_ : filter_list option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_automation_rules_request)

let make_rule_preview_total
    ~recommended_action_count:(recommended_action_count_ : Smaws_Lib.Smithy_api.Types.integer)
    ~estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings) () =
  ({
     recommended_action_count = recommended_action_count_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : rule_preview_total)

let make_preview_result_summary ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~total:(total_ : rule_preview_total) () =
  ({ key = key_; total = total_ } : preview_result_summary)

let make_list_automation_rule_preview_summaries_response
    ?preview_result_summaries:(preview_result_summaries_ : preview_result_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ preview_result_summaries = preview_result_summaries_; next_token = next_token_ }
    : list_automation_rule_preview_summaries_response)

let make_organization_scope
    ?account_ids:(account_ids_ : organization_configuration_account_ids option) () =
  ({ account_ids = account_ids_ } : organization_scope)

let make_list_automation_rule_preview_summaries_request
    ?organization_scope:(organization_scope_ : organization_scope option)
    ?criteria:(criteria_ : criteria option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) ~rule_type:(rule_type_ : rule_type)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list) () =
  ({
     rule_type = rule_type_;
     organization_scope = organization_scope_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_automation_rule_preview_summaries_request)

let make_list_automation_rule_preview_response
    ?preview_results:(preview_results_ : preview_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ preview_results = preview_results_; next_token = next_token_ }
    : list_automation_rule_preview_response)

let make_list_automation_rule_preview_request
    ?organization_scope:(organization_scope_ : organization_scope option)
    ?criteria:(criteria_ : criteria option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) ~rule_type:(rule_type_ : rule_type)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list) () =
  ({
     rule_type = rule_type_;
     organization_scope = organization_scope_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_automation_rule_preview_request)

let make_list_automation_event_summaries_response
    ?automation_event_summaries:(automation_event_summaries_ : automation_event_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ automation_event_summaries = automation_event_summaries_; next_token = next_token_ }
    : list_automation_event_summaries_response)

let make_list_automation_event_summaries_request
    ?filters:(filters_ : automation_event_filter_list option)
    ?start_date_inclusive:(start_date_inclusive_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?end_date_exclusive:(end_date_exclusive_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     filters = filters_;
     start_date_inclusive = start_date_inclusive_;
     end_date_exclusive = end_date_exclusive_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_automation_event_summaries_request)

let make_list_automation_event_steps_response
    ?automation_event_steps:(automation_event_steps_ : automation_event_steps option)
    ?next_token:(next_token_ : next_token option) () =
  ({ automation_event_steps = automation_event_steps_; next_token = next_token_ }
    : list_automation_event_steps_response)

let make_list_automation_event_steps_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) ~event_id:(event_id_ : event_id) () =
  ({ event_id = event_id_; max_results = max_results_; next_token = next_token_ }
    : list_automation_event_steps_request)

let make_list_automation_events_response
    ?automation_events:(automation_events_ : automation_events option)
    ?next_token:(next_token_ : next_token option) () =
  ({ automation_events = automation_events_; next_token = next_token_ }
    : list_automation_events_response)

let make_list_automation_events_request ?filters:(filters_ : automation_event_filter_list option)
    ?start_time_inclusive:(start_time_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time_exclusive:(end_time_exclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     filters = filters_;
     start_time_inclusive = start_time_inclusive_;
     end_time_exclusive = end_time_exclusive_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_automation_events_request)

let make_list_accounts_response ?next_token:(next_token_ : next_token option)
    ~accounts:(accounts_ : account_info_list) () =
  ({ accounts = accounts_; next_token = next_token_ } : list_accounts_response)

let make_list_accounts_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_accounts_request)

let make_get_enrollment_configuration_response
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_rule_mode:(organization_rule_mode_ : organization_rule_mode option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~status:(status_ : enrollment_status) () =
  ({
     status = status_;
     status_reason = status_reason_;
     organization_rule_mode = organization_rule_mode_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : get_enrollment_configuration_response)

let make_get_enrollment_configuration_request () = (() : unit)

let make_get_automation_rule_response ?rule_arn:(rule_arn_ : rule_arn option)
    ?rule_id:(rule_id_ : rule_id option) ?name:(name_ : rule_name option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_type:(rule_type_ : rule_type option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?account_id:(account_id_ : account_id option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?criteria:(criteria_ : criteria option) ?schedule:(schedule_ : schedule option)
    ?status:(status_ : rule_status option) ?tags:(tags_ : tag_list option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    () =
  ({
     rule_arn = rule_arn_;
     rule_id = rule_id_;
     name = name_;
     description = description_;
     rule_type = rule_type_;
     rule_revision = rule_revision_;
     account_id = account_id_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     schedule = schedule_;
     status = status_;
     tags = tags_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : get_automation_rule_response)

let make_get_automation_rule_request ~rule_arn:(rule_arn_ : rule_arn) () =
  ({ rule_arn = rule_arn_ } : get_automation_rule_request)

let make_get_automation_event_response ?event_id:(event_id_ : event_id option)
    ?event_description:(event_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_type:(event_type_ : event_type option)
    ?event_status:(event_status_ : event_status option)
    ?event_status_reason:(event_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?resource_id:(resource_id_ : resource_id option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?account_id:(account_id_ : account_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_id:(rule_id_ : rule_id option) ?resource_type:(resource_type_ : resource_type option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option) () =
  ({
     event_id = event_id_;
     event_description = event_description_;
     event_type = event_type_;
     event_status = event_status_;
     event_status_reason = event_status_reason_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     recommended_action_id = recommended_action_id_;
     account_id = account_id_;
     region = region_;
     rule_id = rule_id_;
     resource_type = resource_type_;
     created_timestamp = created_timestamp_;
     completed_timestamp = completed_timestamp_;
     estimated_monthly_savings = estimated_monthly_savings_;
   }
    : get_automation_event_response)

let make_get_automation_event_request ~event_id:(event_id_ : event_id) () =
  ({ event_id = event_id_ } : get_automation_event_request)

let make_disassociate_accounts_response ?account_ids:(account_ids_ : account_id_list option)
    ?errors:(errors_ : string_list option) () =
  ({ account_ids = account_ids_; errors = errors_ } : disassociate_accounts_response)

let make_disassociate_accounts_request ?client_token:(client_token_ : client_token option)
    ~account_ids:(account_ids_ : account_id_list) () =
  ({ account_ids = account_ids_; client_token = client_token_ } : disassociate_accounts_request)

let make_delete_automation_rule_response () = (() : unit)

let make_delete_automation_rule_request ?client_token:(client_token_ : client_token option)
    ~rule_arn:(rule_arn_ : rule_arn)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({ rule_arn = rule_arn_; rule_revision = rule_revision_; client_token = client_token_ }
    : delete_automation_rule_request)

let make_create_automation_rule_response ?rule_arn:(rule_arn_ : rule_arn option)
    ?rule_id:(rule_id_ : rule_id option) ?name:(name_ : rule_name option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_type:(rule_type_ : rule_type option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?criteria:(criteria_ : criteria option) ?schedule:(schedule_ : schedule option)
    ?status:(status_ : rule_status option) ?tags:(tags_ : tag_list option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     rule_arn = rule_arn_;
     rule_id = rule_id_;
     name = name_;
     description = description_;
     rule_type = rule_type_;
     rule_revision = rule_revision_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     schedule = schedule_;
     status = status_;
     tags = tags_;
     created_timestamp = created_timestamp_;
   }
    : create_automation_rule_response)

let make_create_automation_rule_request ?description:(description_ : rule_description option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?criteria:(criteria_ : criteria option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : rule_name)
    ~rule_type:(rule_type_ : rule_type)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list)
    ~schedule:(schedule_ : schedule) ~status:(status_ : rule_status) () =
  ({
     name = name_;
     description = description_;
     rule_type = rule_type_;
     organization_configuration = organization_configuration_;
     priority = priority_;
     recommended_action_types = recommended_action_types_;
     criteria = criteria_;
     schedule = schedule_;
     status = status_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_automation_rule_request)
