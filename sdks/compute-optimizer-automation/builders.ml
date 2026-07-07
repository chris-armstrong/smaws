open Types

let make_update_enrollment_configuration_response
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : enrollment_status) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     status_reason = status_reason_;
     status = status_;
   }
    : update_enrollment_configuration_response)

let make_update_enrollment_configuration_request ?client_token:(client_token_ : client_token option)
    ~status:(status_ : enrollment_status) () =
  ({ client_token = client_token_; status = status_ } : update_enrollment_configuration_request)

let make_organization_configuration
    ?account_ids:(account_ids_ : organization_configuration_account_ids option)
    ?rule_apply_order:(rule_apply_order_ : rule_apply_order option) () =
  ({ account_ids = account_ids_; rule_apply_order = rule_apply_order_ }
    : organization_configuration)

let make_string_criteria_condition ?values:(values_ : string_criteria_values option)
    ?comparison:(comparison_ : comparison_operator option) () =
  ({ values = values_; comparison = comparison_ } : string_criteria_condition)

let make_integer_criteria_condition ?values:(values_ : integer_list option)
    ?comparison:(comparison_ : comparison_operator option) () =
  ({ values = values_; comparison = comparison_ } : integer_criteria_condition)

let make_double_criteria_condition ?values:(values_ : double_list option)
    ?comparison:(comparison_ : comparison_operator option) () =
  ({ values = values_; comparison = comparison_ } : double_criteria_condition)

let make_resource_tags_criteria_condition ?values:(values_ : string_criteria_values option)
    ?key:(key_ : string_criteria_value option)
    ?comparison:(comparison_ : comparison_operator option) () =
  ({ values = values_; key = key_; comparison = comparison_ } : resource_tags_criteria_condition)

let make_criteria ?restart_needed:(restart_needed_ : string_criteria_condition_list option)
    ?look_back_period_in_days:(look_back_period_in_days_ : integer_criteria_condition_list option)
    ?resource_tag:(resource_tag_ : resource_tags_criteria_condition_list option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : double_criteria_condition_list option)
    ?ebs_volume_size_in_gib:(ebs_volume_size_in_gib_ : integer_criteria_condition_list option)
    ?ebs_volume_type:(ebs_volume_type_ : string_criteria_condition_list option)
    ?resource_arn:(resource_arn_ : string_criteria_condition_list option)
    ?region:(region_ : string_criteria_condition_list option) () =
  ({
     restart_needed = restart_needed_;
     look_back_period_in_days = look_back_period_in_days_;
     resource_tag = resource_tag_;
     estimated_monthly_savings = estimated_monthly_savings_;
     ebs_volume_size_in_gib = ebs_volume_size_in_gib_;
     ebs_volume_type = ebs_volume_type_;
     resource_arn = resource_arn_;
     region = region_;
   }
    : criteria)

let make_schedule
    ?execution_window_in_minutes:
      (execution_window_in_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?schedule_expression_timezone:
      (schedule_expression_timezone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?schedule_expression:(schedule_expression_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     execution_window_in_minutes = execution_window_in_minutes_;
     schedule_expression_timezone = schedule_expression_timezone_;
     schedule_expression = schedule_expression_;
   }
    : schedule)

let make_update_automation_rule_response
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : rule_status option) ?schedule:(schedule_ : schedule option)
    ?criteria:(criteria_ : criteria option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?rule_type:(rule_type_ : rule_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : rule_name option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     status = status_;
     schedule = schedule_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
     rule_revision = rule_revision_;
     rule_arn = rule_arn_;
   }
    : update_automation_rule_response)

let make_update_automation_rule_request ?client_token:(client_token_ : client_token option)
    ?status:(status_ : rule_status option) ?schedule:(schedule_ : schedule option)
    ?criteria:(criteria_ : criteria option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?rule_type:(rule_type_ : rule_type option) ?description:(description_ : rule_description option)
    ?name:(name_ : rule_name option)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long)
    ~rule_arn:(rule_arn_ : rule_arn) () =
  ({
     client_token = client_token_;
     status = status_;
     schedule = schedule_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
     rule_revision = rule_revision_;
     rule_arn = rule_arn_;
   }
    : update_automation_rule_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ?client_token:(client_token_ : client_token option)
    ~tag_keys:(tag_keys_ : tag_key_list)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long)
    ~resource_arn:(resource_arn_ : rule_arn) () =
  ({
     client_token = client_token_;
     tag_keys = tag_keys_;
     rule_revision = rule_revision_;
     resource_arn = resource_arn_;
   }
    : untag_resource_request)

let make_time_period
    ?end_time_exclusive:(end_time_exclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time_inclusive:(start_time_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ end_time_exclusive = end_time_exclusive_; start_time_inclusive = start_time_inclusive_ }
    : time_period)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ?client_token:(client_token_ : client_token option)
    ~tags:(tags_ : tag_list) ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long)
    ~resource_arn:(resource_arn_ : rule_arn) () =
  ({
     client_token = client_token_;
     tags = tags_;
     rule_revision = rule_revision_;
     resource_arn = resource_arn_;
   }
    : tag_resource_request)

let make_estimated_monthly_savings
    ~savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode)
    ~after_discount_savings:(after_discount_savings_ : Smaws_Lib.Smithy_api.Types.double)
    ~before_discount_savings:(before_discount_savings_ : Smaws_Lib.Smithy_api.Types.double)
    ~currency:(currency_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     after_discount_savings = after_discount_savings_;
     before_discount_savings = before_discount_savings_;
     currency = currency_;
   }
    : estimated_monthly_savings)

let make_summary_totals
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?automation_event_count:(automation_event_count_ : Smaws_Lib.Smithy_api.Types.integer option) ()
    =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     automation_event_count = automation_event_count_;
   }
    : summary_totals)

let make_summary_dimension ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~key:(key_ : summary_dimension_key) () =
  ({ value = value_; key = key_ } : summary_dimension)

let make_start_automation_event_response ?event_status:(event_status_ : event_status option)
    ?event_id:(event_id_ : event_id option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option) () =
  ({
     event_status = event_status_;
     event_id = event_id_;
     recommended_action_id = recommended_action_id_;
   }
    : start_automation_event_response)

let make_start_automation_event_request ?client_token:(client_token_ : client_token option)
    ~recommended_action_id:(recommended_action_id_ : recommended_action_id) () =
  ({ client_token = client_token_; recommended_action_id = recommended_action_id_ }
    : start_automation_event_request)

let make_rule_preview_total
    ~estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings)
    ~recommended_action_count:(recommended_action_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     recommended_action_count = recommended_action_count_;
   }
    : rule_preview_total)

let make_rollback_automation_event_response ?event_status:(event_status_ : event_status option)
    ?event_id:(event_id_ : event_id option) () =
  ({ event_status = event_status_; event_id = event_id_ } : rollback_automation_event_response)

let make_rollback_automation_event_request ?client_token:(client_token_ : client_token option)
    ~event_id:(event_id_ : event_id) () =
  ({ client_token = client_token_; event_id = event_id_ } : rollback_automation_event_request)

let make_ebs_volume_configuration
    ?throughput:(throughput_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?size_in_gib:(size_in_gib_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ throughput = throughput_; iops = iops_; size_in_gib = size_in_gib_; type_ = type__ }
    : ebs_volume_configuration)

let make_ebs_volume ?configuration:(configuration_ : ebs_volume_configuration option) () =
  ({ configuration = configuration_ } : ebs_volume)

let make_recommended_action ?resource_tags:(resource_tags_ : tag_list option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?recommended_resource_details:(recommended_resource_details_ : resource_details option)
    ?recommended_resource_summary:
      (recommended_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_resource_details:(current_resource_details_ : resource_details option)
    ?current_resource_summary:
      (current_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_action_type:(recommended_action_type_ : recommended_action_type option)
    ?look_back_period_in_days:
      (look_back_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?resource_type:(resource_type_ : resource_type option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : account_id option) ?resource_id:(resource_id_ : resource_id option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option) () =
  ({
     resource_tags = resource_tags_;
     estimated_monthly_savings = estimated_monthly_savings_;
     restart_needed = restart_needed_;
     recommended_resource_details = recommended_resource_details_;
     recommended_resource_summary = recommended_resource_summary_;
     current_resource_details = current_resource_details_;
     current_resource_summary = current_resource_summary_;
     recommended_action_type = recommended_action_type_;
     look_back_period_in_days = look_back_period_in_days_;
     resource_type = resource_type_;
     region = region_;
     account_id = account_id_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     recommended_action_id = recommended_action_id_;
   }
    : recommended_action)

let make_recommended_action_total
    ~estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings)
    ~recommended_action_count:(recommended_action_count_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     recommended_action_count = recommended_action_count_;
   }
    : recommended_action_total)

let make_recommended_action_summary ~total:(total_ : recommended_action_total)
    ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ total = total_; key = key_ } : recommended_action_summary)

let make_recommended_action_filter ~values:(values_ : filter_values)
    ~name:(name_ : recommended_action_filter_name) () =
  ({ values = values_; name = name_ } : recommended_action_filter)

let make_preview_result_summary ~total:(total_ : rule_preview_total)
    ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ total = total_; key = key_ } : preview_result_summary)

let make_organization_scope
    ?account_ids:(account_ids_ : organization_configuration_account_ids option) () =
  ({ account_ids = account_ids_ } : organization_scope)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : rule_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_recommended_actions_response ?next_token:(next_token_ : next_token option)
    ?recommended_actions:(recommended_actions_ : recommended_actions option) () =
  ({ next_token = next_token_; recommended_actions = recommended_actions_ }
    : list_recommended_actions_response)

let make_list_recommended_actions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?filters:(filters_ : recommended_action_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_recommended_actions_request)

let make_list_recommended_action_summaries_response ?next_token:(next_token_ : next_token option)
    ?recommended_action_summaries:
      (recommended_action_summaries_ : recommended_action_summaries option) () =
  ({ next_token = next_token_; recommended_action_summaries = recommended_action_summaries_ }
    : list_recommended_action_summaries_response)

let make_list_recommended_action_summaries_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?filters:(filters_ : recommended_action_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_recommended_action_summaries_request)

let make_automation_rule
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : rule_status option) ?schedule:(schedule_ : schedule option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?account_id:(account_id_ : account_id option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?rule_type:(rule_type_ : rule_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : rule_name option) ?rule_id:(rule_id_ : rule_id option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     status = status_;
     schedule = schedule_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     account_id = account_id_;
     rule_revision = rule_revision_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
     rule_id = rule_id_;
     rule_arn = rule_arn_;
   }
    : automation_rule)

let make_list_automation_rules_response ?next_token:(next_token_ : next_token option)
    ?automation_rules:(automation_rules_ : automation_rules option) () =
  ({ next_token = next_token_; automation_rules = automation_rules_ }
    : list_automation_rules_response)

let make_filter ~values:(values_ : filter_values) ~name:(name_ : automation_rule_filter_name) () =
  ({ values = values_; name = name_ } : filter)

let make_list_automation_rules_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?filters:(filters_ : filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_automation_rules_request)

let make_list_automation_rule_preview_summaries_response
    ?next_token:(next_token_ : next_token option)
    ?preview_result_summaries:(preview_result_summaries_ : preview_result_summaries option) () =
  ({ next_token = next_token_; preview_result_summaries = preview_result_summaries_ }
    : list_automation_rule_preview_summaries_response)

let make_list_automation_rule_preview_summaries_request
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?criteria:(criteria_ : criteria option)
    ?organization_scope:(organization_scope_ : organization_scope option)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list)
    ~rule_type:(rule_type_ : rule_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     organization_scope = organization_scope_;
     rule_type = rule_type_;
   }
    : list_automation_rule_preview_summaries_request)

let make_list_automation_rule_preview_response ?next_token:(next_token_ : next_token option)
    ?preview_results:(preview_results_ : preview_results option) () =
  ({ next_token = next_token_; preview_results = preview_results_ }
    : list_automation_rule_preview_response)

let make_list_automation_rule_preview_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?criteria:(criteria_ : criteria option)
    ?organization_scope:(organization_scope_ : organization_scope option)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list)
    ~rule_type:(rule_type_ : rule_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     organization_scope = organization_scope_;
     rule_type = rule_type_;
   }
    : list_automation_rule_preview_request)

let make_automation_event
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?resource_type:(resource_type_ : resource_type option) ?rule_id:(rule_id_ : rule_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : account_id option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?event_status_reason:(event_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_status:(event_status_ : event_status option)
    ?event_type:(event_type_ : event_type option)
    ?event_description:(event_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_id:(event_id_ : event_id option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     completed_timestamp = completed_timestamp_;
     created_timestamp = created_timestamp_;
     resource_type = resource_type_;
     rule_id = rule_id_;
     region = region_;
     account_id = account_id_;
     recommended_action_id = recommended_action_id_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     event_status_reason = event_status_reason_;
     event_status = event_status_;
     event_type = event_type_;
     event_description = event_description_;
     event_id = event_id_;
   }
    : automation_event)

let make_list_automation_events_response ?next_token:(next_token_ : next_token option)
    ?automation_events:(automation_events_ : automation_events option) () =
  ({ next_token = next_token_; automation_events = automation_events_ }
    : list_automation_events_response)

let make_automation_event_filter ~values:(values_ : filter_values)
    ~name:(name_ : automation_event_filter_name) () =
  ({ values = values_; name = name_ } : automation_event_filter)

let make_list_automation_events_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?end_time_exclusive:(end_time_exclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time_inclusive:(start_time_inclusive_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?filters:(filters_ : automation_event_filter_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     end_time_exclusive = end_time_exclusive_;
     start_time_inclusive = start_time_inclusive_;
     filters = filters_;
   }
    : list_automation_events_request)

let make_automation_event_summary ?total:(total_ : summary_totals option)
    ?time_period:(time_period_ : time_period option)
    ?dimensions:(dimensions_ : summary_dimensions option)
    ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ total = total_; time_period = time_period_; dimensions = dimensions_; key = key_ }
    : automation_event_summary)

let make_list_automation_event_summaries_response ?next_token:(next_token_ : next_token option)
    ?automation_event_summaries:(automation_event_summaries_ : automation_event_summary_list option)
    () =
  ({ next_token = next_token_; automation_event_summaries = automation_event_summaries_ }
    : list_automation_event_summaries_response)

let make_list_automation_event_summaries_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?end_date_exclusive:(end_date_exclusive_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?start_date_inclusive:(start_date_inclusive_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?filters:(filters_ : automation_event_filter_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     end_date_exclusive = end_date_exclusive_;
     start_date_inclusive = start_date_inclusive_;
     filters = filters_;
   }
    : list_automation_event_summaries_request)

let make_automation_event_step
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?resource_id:(resource_id_ : resource_id option)
    ?step_status:(step_status_ : step_status option) ?step_type:(step_type_ : step_type option)
    ?step_id:(step_id_ : step_id option) ?event_id:(event_id_ : event_id option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     completed_timestamp = completed_timestamp_;
     start_timestamp = start_timestamp_;
     resource_id = resource_id_;
     step_status = step_status_;
     step_type = step_type_;
     step_id = step_id_;
     event_id = event_id_;
   }
    : automation_event_step)

let make_list_automation_event_steps_response ?next_token:(next_token_ : next_token option)
    ?automation_event_steps:(automation_event_steps_ : automation_event_steps option) () =
  ({ next_token = next_token_; automation_event_steps = automation_event_steps_ }
    : list_automation_event_steps_response)

let make_list_automation_event_steps_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~event_id:(event_id_ : event_id) () =
  ({ next_token = next_token_; max_results = max_results_; event_id = event_id_ }
    : list_automation_event_steps_request)

let make_account_info ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~organization_rule_mode:(organization_rule_mode_ : organization_rule_mode)
    ~status:(status_ : enrollment_status) ~account_id:(account_id_ : account_id) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     status_reason = status_reason_;
     organization_rule_mode = organization_rule_mode_;
     status = status_;
     account_id = account_id_;
   }
    : account_info)

let make_list_accounts_response ?next_token:(next_token_ : next_token option)
    ~accounts:(accounts_ : account_info_list) () =
  ({ next_token = next_token_; accounts = accounts_ } : list_accounts_response)

let make_list_accounts_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_accounts_request)

let make_get_enrollment_configuration_response
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?organization_rule_mode:(organization_rule_mode_ : organization_rule_mode option)
    ?status_reason:(status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : enrollment_status) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     organization_rule_mode = organization_rule_mode_;
     status_reason = status_reason_;
     status = status_;
   }
    : get_enrollment_configuration_response)

let make_get_enrollment_configuration_request () = (() : unit)

let make_get_automation_rule_response
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?tags:(tags_ : tag_list option) ?status:(status_ : rule_status option)
    ?schedule:(schedule_ : schedule option) ?criteria:(criteria_ : criteria option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?account_id:(account_id_ : account_id option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?rule_type:(rule_type_ : rule_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : rule_name option) ?rule_id:(rule_id_ : rule_id option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     tags = tags_;
     status = status_;
     schedule = schedule_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     account_id = account_id_;
     rule_revision = rule_revision_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
     rule_id = rule_id_;
     rule_arn = rule_arn_;
   }
    : get_automation_rule_response)

let make_get_automation_rule_request ~rule_arn:(rule_arn_ : rule_arn) () =
  ({ rule_arn = rule_arn_ } : get_automation_rule_request)

let make_get_automation_event_response
    ?estimated_monthly_savings:(estimated_monthly_savings_ : estimated_monthly_savings option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?resource_type:(resource_type_ : resource_type option) ?rule_id:(rule_id_ : rule_id option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : account_id option)
    ?recommended_action_id:(recommended_action_id_ : recommended_action_id option)
    ?resource_id:(resource_id_ : resource_id option)
    ?resource_arn:(resource_arn_ : resource_arn option)
    ?event_status_reason:(event_status_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_status:(event_status_ : event_status option)
    ?event_type:(event_type_ : event_type option)
    ?event_description:(event_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_id:(event_id_ : event_id option) () =
  ({
     estimated_monthly_savings = estimated_monthly_savings_;
     completed_timestamp = completed_timestamp_;
     created_timestamp = created_timestamp_;
     resource_type = resource_type_;
     rule_id = rule_id_;
     region = region_;
     account_id = account_id_;
     recommended_action_id = recommended_action_id_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     event_status_reason = event_status_reason_;
     event_status = event_status_;
     event_type = event_type_;
     event_description = event_description_;
     event_id = event_id_;
   }
    : get_automation_event_response)

let make_get_automation_event_request ~event_id:(event_id_ : event_id) () =
  ({ event_id = event_id_ } : get_automation_event_request)

let make_disassociate_accounts_response ?errors:(errors_ : string_list option)
    ?account_ids:(account_ids_ : account_id_list option) () =
  ({ errors = errors_; account_ids = account_ids_ } : disassociate_accounts_response)

let make_disassociate_accounts_request ?client_token:(client_token_ : client_token option)
    ~account_ids:(account_ids_ : account_id_list) () =
  ({ client_token = client_token_; account_ids = account_ids_ } : disassociate_accounts_request)

let make_delete_automation_rule_response () = (() : unit)

let make_delete_automation_rule_request ?client_token:(client_token_ : client_token option)
    ~rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long)
    ~rule_arn:(rule_arn_ : rule_arn) () =
  ({ client_token = client_token_; rule_revision = rule_revision_; rule_arn = rule_arn_ }
    : delete_automation_rule_request)

let make_create_automation_rule_response
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?tags:(tags_ : tag_list option) ?status:(status_ : rule_status option)
    ?schedule:(schedule_ : schedule option) ?criteria:(criteria_ : criteria option)
    ?recommended_action_types:(recommended_action_types_ : recommended_action_type_list option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?rule_revision:(rule_revision_ : Smaws_Lib.Smithy_api.Types.long option)
    ?rule_type:(rule_type_ : rule_type option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : rule_name option) ?rule_id:(rule_id_ : rule_id option)
    ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({
     created_timestamp = created_timestamp_;
     tags = tags_;
     status = status_;
     schedule = schedule_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     rule_revision = rule_revision_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
     rule_id = rule_id_;
     rule_arn = rule_arn_;
   }
    : create_automation_rule_response)

let make_create_automation_rule_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ?criteria:(criteria_ : criteria option)
    ?priority:(priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?description:(description_ : rule_description option) ~status:(status_ : rule_status)
    ~schedule:(schedule_ : schedule)
    ~recommended_action_types:(recommended_action_types_ : recommended_action_type_list)
    ~rule_type:(rule_type_ : rule_type) ~name:(name_ : rule_name) () =
  ({
     client_token = client_token_;
     tags = tags_;
     status = status_;
     schedule = schedule_;
     criteria = criteria_;
     recommended_action_types = recommended_action_types_;
     priority = priority_;
     organization_configuration = organization_configuration_;
     rule_type = rule_type_;
     description = description_;
     name = name_;
   }
    : create_automation_rule_request)

let make_associate_accounts_response ?errors:(errors_ : string_list option)
    ?account_ids:(account_ids_ : account_id_list option) () =
  ({ errors = errors_; account_ids = account_ids_ } : associate_accounts_response)

let make_associate_accounts_request ?client_token:(client_token_ : client_token option)
    ~account_ids:(account_ids_ : account_id_list) () =
  ({ client_token = client_token_; account_ids = account_ids_ } : associate_accounts_request)
