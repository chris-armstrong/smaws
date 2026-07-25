open Types

let make_account_sharing_info ?account_id:(account_id_ : account_id option)
    ?shared_document_version:(shared_document_version_ : shared_document_version option) () =
  ({ account_id = account_id_; shared_document_version = shared_document_version_ }
    : account_sharing_info)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_activation ?activation_id:(activation_id_ : activation_id option)
    ?description:(description_ : activation_description option)
    ?default_instance_name:(default_instance_name_ : default_instance_name option)
    ?iam_role:(iam_role_ : iam_role option)
    ?registration_limit:(registration_limit_ : registration_limit option)
    ?registrations_count:(registrations_count_ : registrations_count option)
    ?expiration_date:(expiration_date_ : expiration_date option)
    ?expired:(expired_ : boolean_ option) ?created_date:(created_date_ : created_date option)
    ?tags:(tags_ : tag_list option) () =
  ({
     activation_id = activation_id_;
     description = description_;
     default_instance_name = default_instance_name_;
     iam_role = iam_role_;
     registration_limit = registration_limit_;
     registrations_count = registrations_count_;
     expiration_date = expiration_date_;
     expired = expired_;
     created_date = created_date_;
     tags = tags_;
   }
    : activation)

let make_add_tags_to_resource_request ~resource_type:(resource_type_ : resource_type_for_tagging)
    ~resource_id:(resource_id_ : resource_id) ~tags:(tags_ : tag_list) () =
  ({ resource_type = resource_type_; resource_id = resource_id_; tags = tags_ }
    : add_tags_to_resource_request)

let make_alarm ~name:(name_ : alarm_name) () = ({ name = name_ } : alarm)

let make_alarm_configuration
    ?ignore_poll_alarm_failure:(ignore_poll_alarm_failure_ : boolean_ option)
    ~alarms:(alarms_ : alarm_list) () =
  ({ ignore_poll_alarm_failure = ignore_poll_alarm_failure_; alarms = alarms_ }
    : alarm_configuration)

let make_alarm_state_information ~name:(name_ : alarm_name) ~state:(state_ : external_alarm_state)
    () =
  ({ name = name_; state = state_ } : alarm_state_information)

let make_update_service_setting_request ~setting_id:(setting_id_ : service_setting_id)
    ~setting_value:(setting_value_ : service_setting_value) () =
  ({ setting_id = setting_id_; setting_value = setting_value_ } : update_service_setting_request)

let make_resource_data_sync_organizational_unit
    ?organizational_unit_id:
      (organizational_unit_id_ : resource_data_sync_organizational_unit_id option) () =
  ({ organizational_unit_id = organizational_unit_id_ } : resource_data_sync_organizational_unit)

let make_resource_data_sync_aws_organizations_source
    ?organizational_units:
      (organizational_units_ : resource_data_sync_organizational_unit_list option)
    ~organization_source_type:
      (organization_source_type_ : resource_data_sync_organization_source_type) () =
  ({
     organization_source_type = organization_source_type_;
     organizational_units = organizational_units_;
   }
    : resource_data_sync_aws_organizations_source)

let make_resource_data_sync_source
    ?aws_organizations_source:
      (aws_organizations_source_ : resource_data_sync_aws_organizations_source option)
    ?include_future_regions:
      (include_future_regions_ : resource_data_sync_include_future_regions option)
    ?enable_all_ops_data_sources:
      (enable_all_ops_data_sources_ : resource_data_sync_enable_all_ops_data_sources option)
    ~source_type:(source_type_ : resource_data_sync_source_type)
    ~source_regions:(source_regions_ : resource_data_sync_source_region_list) () =
  ({
     source_type = source_type_;
     aws_organizations_source = aws_organizations_source_;
     source_regions = source_regions_;
     include_future_regions = include_future_regions_;
     enable_all_ops_data_sources = enable_all_ops_data_sources_;
   }
    : resource_data_sync_source)

let make_update_resource_data_sync_request ~sync_name:(sync_name_ : resource_data_sync_name)
    ~sync_type:(sync_type_ : resource_data_sync_type)
    ~sync_source:(sync_source_ : resource_data_sync_source) () =
  ({ sync_name = sync_name_; sync_type = sync_type_; sync_source = sync_source_ }
    : update_resource_data_sync_request)

let make_patch_source ~name:(name_ : patch_source_name)
    ~products:(products_ : patch_source_product_list)
    ~configuration:(configuration_ : patch_source_configuration) () =
  ({ name = name_; products = products_; configuration = configuration_ } : patch_source)

let make_patch_filter ~key:(key_ : patch_filter_key) ~values:(values_ : patch_filter_value_list) ()
    =
  ({ key = key_; values = values_ } : patch_filter)

let make_patch_filter_group ~patch_filters:(patch_filters_ : patch_filter_list) () =
  ({ patch_filters = patch_filters_ } : patch_filter_group)

let make_patch_rule ?compliance_level:(compliance_level_ : patch_compliance_level option)
    ?approve_after_days:(approve_after_days_ : approve_after_days option)
    ?approve_until_date:(approve_until_date_ : patch_string_date_time option)
    ?enable_non_security:(enable_non_security_ : boolean_ option)
    ~patch_filter_group:(patch_filter_group_ : patch_filter_group) () =
  ({
     patch_filter_group = patch_filter_group_;
     compliance_level = compliance_level_;
     approve_after_days = approve_after_days_;
     approve_until_date = approve_until_date_;
     enable_non_security = enable_non_security_;
   }
    : patch_rule)

let make_patch_rule_group ~patch_rules:(patch_rules_ : patch_rule_list) () =
  ({ patch_rules = patch_rules_ } : patch_rule_group)

let make_update_patch_baseline_request ?name:(name_ : baseline_name option)
    ?global_filters:(global_filters_ : patch_filter_group option)
    ?approval_rules:(approval_rules_ : patch_rule_group option)
    ?approved_patches:(approved_patches_ : patch_id_list option)
    ?approved_patches_compliance_level:
      (approved_patches_compliance_level_ : patch_compliance_level option)
    ?approved_patches_enable_non_security:(approved_patches_enable_non_security_ : boolean_ option)
    ?rejected_patches:(rejected_patches_ : patch_id_list option)
    ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
    ?description:(description_ : baseline_description option)
    ?sources:(sources_ : patch_source_list option)
    ?available_security_updates_compliance_status:
      (available_security_updates_compliance_status_ : patch_compliance_status option)
    ?replace:(replace_ : boolean_ option) ~baseline_id:(baseline_id_ : baseline_id) () =
  ({
     baseline_id = baseline_id_;
     name = name_;
     global_filters = global_filters_;
     approval_rules = approval_rules_;
     approved_patches = approved_patches_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     approved_patches_enable_non_security = approved_patches_enable_non_security_;
     rejected_patches = rejected_patches_;
     rejected_patches_action = rejected_patches_action_;
     description = description_;
     sources = sources_;
     available_security_updates_compliance_status = available_security_updates_compliance_status_;
     replace = replace_;
   }
    : update_patch_baseline_request)

let make_metadata_value ?value:(value_ : metadata_value_string option) () =
  ({ value = value_ } : metadata_value)

let make_update_ops_metadata_request ?metadata_to_update:(metadata_to_update_ : metadata_map option)
    ?keys_to_delete:(keys_to_delete_ : metadata_keys_to_delete_list option)
    ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({
     ops_metadata_arn = ops_metadata_arn_;
     metadata_to_update = metadata_to_update_;
     keys_to_delete = keys_to_delete_;
   }
    : update_ops_metadata_request)

let make_update_ops_item_response () = (() : unit)

let make_related_ops_item ~ops_item_id:(ops_item_id_ : string_) () =
  ({ ops_item_id = ops_item_id_ } : related_ops_item)

let make_ops_item_notification ?arn:(arn_ : string_ option) () =
  ({ arn = arn_ } : ops_item_notification)

let make_ops_item_data_value ?value:(value_ : ops_item_data_value_string option)
    ?type_:(type__ : ops_item_data_type option) () =
  ({ value = value_; type_ = type__ } : ops_item_data_value)

let make_update_ops_item_request ?description:(description_ : ops_item_description option)
    ?operational_data:(operational_data_ : ops_item_operational_data option)
    ?operational_data_to_delete:(operational_data_to_delete_ : ops_item_ops_data_keys_list option)
    ?notifications:(notifications_ : ops_item_notifications option)
    ?priority:(priority_ : ops_item_priority option)
    ?related_ops_items:(related_ops_items_ : related_ops_items option)
    ?status:(status_ : ops_item_status option) ?title:(title_ : ops_item_title option)
    ?category:(category_ : ops_item_category option)
    ?severity:(severity_ : ops_item_severity option)
    ?actual_start_time:(actual_start_time_ : date_time option)
    ?actual_end_time:(actual_end_time_ : date_time option)
    ?planned_start_time:(planned_start_time_ : date_time option)
    ?planned_end_time:(planned_end_time_ : date_time option)
    ?ops_item_arn:(ops_item_arn_ : ops_item_arn option) ~ops_item_id:(ops_item_id_ : ops_item_id) ()
    =
  ({
     description = description_;
     operational_data = operational_data_;
     operational_data_to_delete = operational_data_to_delete_;
     notifications = notifications_;
     priority = priority_;
     related_ops_items = related_ops_items_;
     status = status_;
     ops_item_id = ops_item_id_;
     title = title_;
     category = category_;
     severity = severity_;
     actual_start_time = actual_start_time_;
     actual_end_time = actual_end_time_;
     planned_start_time = planned_start_time_;
     planned_end_time = planned_end_time_;
     ops_item_arn = ops_item_arn_;
   }
    : update_ops_item_request)

let make_update_managed_instance_role_request ~instance_id:(instance_id_ : managed_instance_id)
    ~iam_role:(iam_role_ : iam_role) () =
  ({ instance_id = instance_id_; iam_role = iam_role_ } : update_managed_instance_role_request)

let make_logging_info ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix option)
    ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name) ~s3_region:(s3_region_ : s3_region) () =
  ({ s3_bucket_name = s3_bucket_name_; s3_key_prefix = s3_key_prefix_; s3_region = s3_region_ }
    : logging_info)

let make_maintenance_window_lambda_parameters
    ?client_context:(client_context_ : maintenance_window_lambda_client_context option)
    ?qualifier:(qualifier_ : maintenance_window_lambda_qualifier option)
    ?payload:(payload_ : maintenance_window_lambda_payload option) () =
  ({ client_context = client_context_; qualifier = qualifier_; payload = payload_ }
    : maintenance_window_lambda_parameters)

let make_maintenance_window_step_functions_parameters
    ?input:(input_ : maintenance_window_step_functions_input option)
    ?name:(name_ : maintenance_window_step_functions_name option) () =
  ({ input = input_; name = name_ } : maintenance_window_step_functions_parameters)

let make_maintenance_window_automation_parameters
    ?document_version:(document_version_ : document_version option)
    ?parameters:(parameters_ : automation_parameter_map option) () =
  ({ document_version = document_version_; parameters = parameters_ }
    : maintenance_window_automation_parameters)

let make_notification_config ?notification_arn:(notification_arn_ : notification_arn option)
    ?notification_events:(notification_events_ : notification_event_list option)
    ?notification_type:(notification_type_ : notification_type option) () =
  ({
     notification_arn = notification_arn_;
     notification_events = notification_events_;
     notification_type = notification_type_;
   }
    : notification_config)

let make_cloud_watch_output_config
    ?cloud_watch_log_group_name:(cloud_watch_log_group_name_ : cloud_watch_log_group_name option)
    ?cloud_watch_output_enabled:(cloud_watch_output_enabled_ : cloud_watch_output_enabled option) ()
    =
  ({
     cloud_watch_log_group_name = cloud_watch_log_group_name_;
     cloud_watch_output_enabled = cloud_watch_output_enabled_;
   }
    : cloud_watch_output_config)

let make_maintenance_window_run_command_parameters ?comment:(comment_ : comment option)
    ?cloud_watch_output_config:(cloud_watch_output_config_ : cloud_watch_output_config option)
    ?document_hash:(document_hash_ : document_hash option)
    ?document_hash_type:(document_hash_type_ : document_hash_type option)
    ?document_version:(document_version_ : document_version option)
    ?notification_config:(notification_config_ : notification_config option)
    ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
    ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
    ?parameters:(parameters_ : parameters option)
    ?service_role_arn:(service_role_arn_ : service_role option)
    ?timeout_seconds:(timeout_seconds_ : timeout_seconds option) () =
  ({
     comment = comment_;
     cloud_watch_output_config = cloud_watch_output_config_;
     document_hash = document_hash_;
     document_hash_type = document_hash_type_;
     document_version = document_version_;
     notification_config = notification_config_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_key_prefix = output_s3_key_prefix_;
     parameters = parameters_;
     service_role_arn = service_role_arn_;
     timeout_seconds = timeout_seconds_;
   }
    : maintenance_window_run_command_parameters)

let make_maintenance_window_task_invocation_parameters
    ?run_command:(run_command_ : maintenance_window_run_command_parameters option)
    ?automation:(automation_ : maintenance_window_automation_parameters option)
    ?step_functions:(step_functions_ : maintenance_window_step_functions_parameters option)
    ?lambda:(lambda_ : maintenance_window_lambda_parameters option) () =
  ({
     run_command = run_command_;
     automation = automation_;
     step_functions = step_functions_;
     lambda = lambda_;
   }
    : maintenance_window_task_invocation_parameters)

let make_maintenance_window_task_parameter_value_expression
    ?values:(values_ : maintenance_window_task_parameter_value_list option) () =
  ({ values = values_ } : maintenance_window_task_parameter_value_expression)

let make_target ?key:(key_ : target_key option) ?values:(values_ : target_values option) () =
  ({ key = key_; values = values_ } : target)

let make_update_maintenance_window_task_request ?targets:(targets_ : targets option)
    ?task_arn:(task_arn_ : maintenance_window_task_arn option)
    ?service_role_arn:(service_role_arn_ : service_role option)
    ?task_parameters:(task_parameters_ : maintenance_window_task_parameters option)
    ?task_invocation_parameters:
      (task_invocation_parameters_ : maintenance_window_task_invocation_parameters option)
    ?priority:(priority_ : maintenance_window_task_priority option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?logging_info:(logging_info_ : logging_info option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?replace:(replace_ : boolean_ option)
    ?cutoff_behavior:(cutoff_behavior_ : maintenance_window_task_cutoff_behavior option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ~window_id:(window_id_ : maintenance_window_id)
    ~window_task_id:(window_task_id_ : maintenance_window_task_id) () =
  ({
     window_id = window_id_;
     window_task_id = window_task_id_;
     targets = targets_;
     task_arn = task_arn_;
     service_role_arn = service_role_arn_;
     task_parameters = task_parameters_;
     task_invocation_parameters = task_invocation_parameters_;
     priority = priority_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     logging_info = logging_info_;
     name = name_;
     description = description_;
     replace = replace_;
     cutoff_behavior = cutoff_behavior_;
     alarm_configuration = alarm_configuration_;
   }
    : update_maintenance_window_task_request)

let make_update_maintenance_window_target_request ?targets:(targets_ : targets option)
    ?owner_information:(owner_information_ : owner_information option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?replace:(replace_ : boolean_ option) ~window_id:(window_id_ : maintenance_window_id)
    ~window_target_id:(window_target_id_ : maintenance_window_target_id) () =
  ({
     window_id = window_id_;
     window_target_id = window_target_id_;
     targets = targets_;
     owner_information = owner_information_;
     name = name_;
     description = description_;
     replace = replace_;
   }
    : update_maintenance_window_target_request)

let make_update_maintenance_window_request ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?start_date:(start_date_ : maintenance_window_string_date_time option)
    ?end_date:(end_date_ : maintenance_window_string_date_time option)
    ?schedule:(schedule_ : maintenance_window_schedule option)
    ?schedule_timezone:(schedule_timezone_ : maintenance_window_timezone option)
    ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
    ?duration:(duration_ : maintenance_window_duration_hours option)
    ?cutoff:(cutoff_ : maintenance_window_cutoff option)
    ?allow_unassociated_targets:
      (allow_unassociated_targets_ : maintenance_window_allow_unassociated_targets option)
    ?enabled:(enabled_ : maintenance_window_enabled option) ?replace:(replace_ : boolean_ option)
    ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     window_id = window_id_;
     name = name_;
     description = description_;
     start_date = start_date_;
     end_date = end_date_;
     schedule = schedule_;
     schedule_timezone = schedule_timezone_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     cutoff = cutoff_;
     allow_unassociated_targets = allow_unassociated_targets_;
     enabled = enabled_;
     replace = replace_;
   }
    : update_maintenance_window_request)

let make_update_document_metadata_response () = (() : unit)

let make_document_review_comment_source ?type_:(type__ : document_review_comment_type option)
    ?content:(content_ : document_review_comment option) () =
  ({ type_ = type__; content = content_ } : document_review_comment_source)

let make_document_reviews ?comment:(comment_ : document_review_comment_list option)
    ~action:(action_ : document_review_action) () =
  ({ action = action_; comment = comment_ } : document_reviews)

let make_update_document_metadata_request
    ?document_version:(document_version_ : document_version option) ~name:(name_ : document_name)
    ~document_reviews:(document_reviews_ : document_reviews) () =
  ({ name = name_; document_version = document_version_; document_reviews = document_reviews_ }
    : update_document_metadata_request)

let make_document_default_version_description ?name:(name_ : document_name option)
    ?default_version:(default_version_ : document_version option)
    ?default_version_name:(default_version_name_ : document_version_name option) () =
  ({
     name = name_;
     default_version = default_version_;
     default_version_name = default_version_name_;
   }
    : document_default_version_description)

let make_update_document_default_version_request ~name:(name_ : document_name)
    ~document_version:(document_version_ : document_version_number) () =
  ({ name = name_; document_version = document_version_ } : update_document_default_version_request)

let make_review_information ?reviewed_time:(reviewed_time_ : date_time option)
    ?status:(status_ : review_status option) ?reviewer:(reviewer_ : reviewer option) () =
  ({ reviewed_time = reviewed_time_; status = status_; reviewer = reviewer_ } : review_information)

let make_document_requires ?version:(version_ : document_version option)
    ?require_type:(require_type_ : require_type option)
    ?version_name:(version_name_ : document_version_name option) ~name:(name_ : document_ar_n) () =
  ({ name = name_; version = version_; require_type = require_type_; version_name = version_name_ }
    : document_requires)

let make_attachment_information ?name:(name_ : attachment_name option) () =
  ({ name = name_ } : attachment_information)

let make_document_parameter ?name:(name_ : document_parameter_name option)
    ?type_:(type__ : document_parameter_type option)
    ?description:(description_ : document_parameter_descrption option)
    ?default_value:(default_value_ : document_parameter_default_value option) () =
  ({ name = name_; type_ = type__; description = description_; default_value = default_value_ }
    : document_parameter)

let make_document_description ?sha1:(sha1_ : document_sha1 option)
    ?hash:(hash_ : document_hash option) ?hash_type:(hash_type_ : document_hash_type option)
    ?name:(name_ : document_ar_n option)
    ?display_name:(display_name_ : document_display_name option)
    ?version_name:(version_name_ : document_version_name option)
    ?owner:(owner_ : document_owner option) ?created_date:(created_date_ : date_time option)
    ?status:(status_ : document_status option)
    ?status_information:(status_information_ : document_status_information option)
    ?document_version:(document_version_ : document_version option)
    ?description:(description_ : description_in_document option)
    ?parameters:(parameters_ : document_parameter_list option)
    ?platform_types:(platform_types_ : platform_type_list option)
    ?document_type:(document_type_ : document_type option)
    ?schema_version:(schema_version_ : document_schema_version option)
    ?latest_version:(latest_version_ : document_version option)
    ?default_version:(default_version_ : document_version option)
    ?document_format:(document_format_ : document_format option)
    ?target_type:(target_type_ : target_type option) ?tags:(tags_ : tag_list option)
    ?attachments_information:(attachments_information_ : attachment_information_list option)
    ?requires:(requires_ : document_requires_list option) ?author:(author_ : document_author option)
    ?review_information:(review_information_ : review_information_list option)
    ?approved_version:(approved_version_ : document_version option)
    ?pending_review_version:(pending_review_version_ : document_version option)
    ?review_status:(review_status_ : review_status option)
    ?category:(category_ : category_list option)
    ?category_enum:(category_enum_ : category_enum_list option) () =
  ({
     sha1 = sha1_;
     hash = hash_;
     hash_type = hash_type_;
     name = name_;
     display_name = display_name_;
     version_name = version_name_;
     owner = owner_;
     created_date = created_date_;
     status = status_;
     status_information = status_information_;
     document_version = document_version_;
     description = description_;
     parameters = parameters_;
     platform_types = platform_types_;
     document_type = document_type_;
     schema_version = schema_version_;
     latest_version = latest_version_;
     default_version = default_version_;
     document_format = document_format_;
     target_type = target_type_;
     tags = tags_;
     attachments_information = attachments_information_;
     requires = requires_;
     author = author_;
     review_information = review_information_;
     approved_version = approved_version_;
     pending_review_version = pending_review_version_;
     review_status = review_status_;
     category = category_;
     category_enum = category_enum_;
   }
    : document_description)

let make_attachments_source ?key:(key_ : attachments_source_key option)
    ?values:(values_ : attachments_source_values option)
    ?name:(name_ : attachment_identifier option) () =
  ({ key = key_; values = values_; name = name_ } : attachments_source)

let make_update_document_request ?attachments:(attachments_ : attachments_source_list option)
    ?display_name:(display_name_ : document_display_name option)
    ?version_name:(version_name_ : document_version_name option)
    ?document_version:(document_version_ : document_version option)
    ?document_format:(document_format_ : document_format option)
    ?target_type:(target_type_ : target_type option) ~content:(content_ : document_content)
    ~name:(name_ : document_name) () =
  ({
     content = content_;
     attachments = attachments_;
     name = name_;
     display_name = display_name_;
     version_name = version_name_;
     document_version = document_version_;
     document_format = document_format_;
     target_type = target_type_;
   }
    : update_document_request)

let make_target_location ?accounts:(accounts_ : accounts option)
    ?regions:(regions_ : regions option)
    ?target_location_max_concurrency:(target_location_max_concurrency_ : max_concurrency option)
    ?target_location_max_errors:(target_location_max_errors_ : max_errors option)
    ?execution_role_name:(execution_role_name_ : execution_role_name option)
    ?target_location_alarm_configuration:
      (target_location_alarm_configuration_ : alarm_configuration option)
    ?include_child_organization_units:(include_child_organization_units_ : boolean_ option)
    ?exclude_accounts:(exclude_accounts_ : exclude_accounts option)
    ?targets:(targets_ : targets option)
    ?targets_max_concurrency:(targets_max_concurrency_ : max_concurrency option)
    ?targets_max_errors:(targets_max_errors_ : max_errors option) () =
  ({
     accounts = accounts_;
     regions = regions_;
     target_location_max_concurrency = target_location_max_concurrency_;
     target_location_max_errors = target_location_max_errors_;
     execution_role_name = execution_role_name_;
     target_location_alarm_configuration = target_location_alarm_configuration_;
     include_child_organization_units = include_child_organization_units_;
     exclude_accounts = exclude_accounts_;
     targets = targets_;
     targets_max_concurrency = targets_max_concurrency_;
     targets_max_errors = targets_max_errors_;
   }
    : target_location)

let make_s3_output_location ?output_s3_region:(output_s3_region_ : s3_region option)
    ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
    ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option) () =
  ({
     output_s3_region = output_s3_region_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_key_prefix = output_s3_key_prefix_;
   }
    : s3_output_location)

let make_instance_association_output_location
    ?s3_location:(s3_location_ : s3_output_location option) () =
  ({ s3_location = s3_location_ } : instance_association_output_location)

let make_association_overview ?status:(status_ : status_name option)
    ?detailed_status:(detailed_status_ : status_name option)
    ?association_status_aggregated_count:
      (association_status_aggregated_count_ : association_status_aggregated_count option) () =
  ({
     status = status_;
     detailed_status = detailed_status_;
     association_status_aggregated_count = association_status_aggregated_count_;
   }
    : association_overview)

let make_association_status ?additional_info:(additional_info_ : status_additional_info option)
    ~date:(date_ : date_time) ~name:(name_ : association_status_name)
    ~message:(message_ : status_message) () =
  ({ date = date_; name = name_; message = message_; additional_info = additional_info_ }
    : association_status)

let make_association_description ?name:(name_ : document_ar_n option)
    ?instance_id:(instance_id_ : instance_id option)
    ?association_version:(association_version_ : association_version option)
    ?date:(date_ : date_time option)
    ?last_update_association_date:(last_update_association_date_ : date_time option)
    ?status:(status_ : association_status option)
    ?overview:(overview_ : association_overview option)
    ?document_version:(document_version_ : document_version option)
    ?automation_target_parameter_name:
      (automation_target_parameter_name_ : automation_target_parameter_name option)
    ?parameters:(parameters_ : parameters option)
    ?association_id:(association_id_ : association_id option) ?targets:(targets_ : targets option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?output_location:(output_location_ : instance_association_output_location option)
    ?last_execution_date:(last_execution_date_ : date_time option)
    ?last_successful_execution_date:(last_successful_execution_date_ : date_time option)
    ?association_name:(association_name_ : association_name option)
    ?max_errors:(max_errors_ : max_errors option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?compliance_severity:(compliance_severity_ : association_compliance_severity option)
    ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
    ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : apply_only_at_cron_interval option)
    ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
    ?target_locations:(target_locations_ : target_locations option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
    ?association_dispatch_assume_role:
      (association_dispatch_assume_role_ : association_dispatch_assume_role_arn option) () =
  ({
     name = name_;
     instance_id = instance_id_;
     association_version = association_version_;
     date = date_;
     last_update_association_date = last_update_association_date_;
     status = status_;
     overview = overview_;
     document_version = document_version_;
     automation_target_parameter_name = automation_target_parameter_name_;
     parameters = parameters_;
     association_id = association_id_;
     targets = targets_;
     schedule_expression = schedule_expression_;
     output_location = output_location_;
     last_execution_date = last_execution_date_;
     last_successful_execution_date = last_successful_execution_date_;
     association_name = association_name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     compliance_severity = compliance_severity_;
     sync_compliance = sync_compliance_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     calendar_names = calendar_names_;
     target_locations = target_locations_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
     association_dispatch_assume_role = association_dispatch_assume_role_;
   }
    : association_description)

let make_update_association_status_request ~name:(name_ : document_ar_n)
    ~instance_id:(instance_id_ : instance_id)
    ~association_status:(association_status_ : association_status) () =
  ({ name = name_; instance_id = instance_id_; association_status = association_status_ }
    : update_association_status_request)

let make_update_association_request ?parameters:(parameters_ : parameters option)
    ?document_version:(document_version_ : document_version option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?output_location:(output_location_ : instance_association_output_location option)
    ?name:(name_ : document_ar_n option) ?targets:(targets_ : targets option)
    ?association_name:(association_name_ : association_name option)
    ?association_version:(association_version_ : association_version option)
    ?automation_target_parameter_name:
      (automation_target_parameter_name_ : automation_target_parameter_name option)
    ?max_errors:(max_errors_ : max_errors option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?compliance_severity:(compliance_severity_ : association_compliance_severity option)
    ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
    ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : apply_only_at_cron_interval option)
    ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
    ?target_locations:(target_locations_ : target_locations option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?association_dispatch_assume_role:
      (association_dispatch_assume_role_ : association_dispatch_assume_role_arn option)
    ~association_id:(association_id_ : association_id) () =
  ({
     association_id = association_id_;
     parameters = parameters_;
     document_version = document_version_;
     schedule_expression = schedule_expression_;
     output_location = output_location_;
     name = name_;
     targets = targets_;
     association_name = association_name_;
     association_version = association_version_;
     automation_target_parameter_name = automation_target_parameter_name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     compliance_severity = compliance_severity_;
     sync_compliance = sync_compliance_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     calendar_names = calendar_names_;
     target_locations = target_locations_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
     alarm_configuration = alarm_configuration_;
     association_dispatch_assume_role = association_dispatch_assume_role_;
   }
    : update_association_request)

let make_unlabel_parameter_version_request ~name:(name_ : ps_parameter_name)
    ~parameter_version:(parameter_version_ : ps_parameter_version)
    ~labels:(labels_ : parameter_label_list) () =
  ({ name = name_; parameter_version = parameter_version_; labels = labels_ }
    : unlabel_parameter_version_request)

let make_terminate_session_response ?session_id:(session_id_ : session_id option) () =
  ({ session_id = session_id_ } : terminate_session_response)

let make_terminate_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : terminate_session_request)

let make_stop_automation_execution_request ?type_:(type__ : stop_type option)
    ~automation_execution_id:(automation_execution_id_ : automation_execution_id) () =
  ({ automation_execution_id = automation_execution_id_; type_ = type__ }
    : stop_automation_execution_request)

let make_start_session_response ?session_id:(session_id_ : session_id option)
    ?token_value:(token_value_ : token_value option) ?stream_url:(stream_url_ : stream_url option)
    () =
  ({ session_id = session_id_; token_value = token_value_; stream_url = stream_url_ }
    : start_session_response)

let make_start_session_request ?document_name:(document_name_ : document_ar_n option)
    ?reason:(reason_ : session_reason option)
    ?parameters:(parameters_ : session_manager_parameters option) ~target:(target_ : session_target)
    () =
  ({ target = target_; document_name = document_name_; reason = reason_; parameters = parameters_ }
    : start_session_request)

let make_start_execution_preview_response
    ?execution_preview_id:(execution_preview_id_ : execution_preview_id option) () =
  ({ execution_preview_id = execution_preview_id_ } : start_execution_preview_response)

let make_automation_execution_inputs ?parameters:(parameters_ : automation_parameter_map option)
    ?target_parameter_name:(target_parameter_name_ : automation_parameter_key option)
    ?targets:(targets_ : targets option) ?target_maps:(target_maps_ : target_maps option)
    ?target_locations:(target_locations_ : target_locations option)
    ?target_locations_ur_l:(target_locations_ur_l_ : target_locations_ur_l option) () =
  ({
     parameters = parameters_;
     target_parameter_name = target_parameter_name_;
     targets = targets_;
     target_maps = target_maps_;
     target_locations = target_locations_;
     target_locations_ur_l = target_locations_ur_l_;
   }
    : automation_execution_inputs)

let make_start_execution_preview_request
    ?document_version:(document_version_ : document_version option)
    ?execution_inputs:(execution_inputs_ : execution_inputs option)
    ~document_name:(document_name_ : document_name) () =
  ({
     document_name = document_name_;
     document_version = document_version_;
     execution_inputs = execution_inputs_;
   }
    : start_execution_preview_request)

let make_runbook ?document_version:(document_version_ : document_version option)
    ?parameters:(parameters_ : automation_parameter_map option)
    ?target_parameter_name:(target_parameter_name_ : automation_parameter_key option)
    ?targets:(targets_ : targets option) ?target_maps:(target_maps_ : target_maps option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?target_locations:(target_locations_ : target_locations option)
    ~document_name:(document_name_ : document_ar_n) () =
  ({
     document_name = document_name_;
     document_version = document_version_;
     parameters = parameters_;
     target_parameter_name = target_parameter_name_;
     targets = targets_;
     target_maps = target_maps_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     target_locations = target_locations_;
   }
    : runbook)

let make_start_change_request_execution_request ?scheduled_time:(scheduled_time_ : date_time option)
    ?document_version:(document_version_ : document_version option)
    ?parameters:(parameters_ : automation_parameter_map option)
    ?change_request_name:(change_request_name_ : change_request_name option)
    ?client_token:(client_token_ : idempotency_token option)
    ?auto_approve:(auto_approve_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ?scheduled_end_time:(scheduled_end_time_ : date_time option)
    ?change_details:(change_details_ : change_details_value option)
    ~document_name:(document_name_ : document_ar_n) ~runbooks:(runbooks_ : runbooks) () =
  ({
     scheduled_time = scheduled_time_;
     document_name = document_name_;
     document_version = document_version_;
     parameters = parameters_;
     change_request_name = change_request_name_;
     client_token = client_token_;
     auto_approve = auto_approve_;
     runbooks = runbooks_;
     tags = tags_;
     scheduled_end_time = scheduled_end_time_;
     change_details = change_details_;
   }
    : start_change_request_execution_request)

let make_start_automation_execution_request
    ?document_version:(document_version_ : document_version option)
    ?parameters:(parameters_ : automation_parameter_map option)
    ?client_token:(client_token_ : idempotency_token option) ?mode:(mode_ : execution_mode option)
    ?target_parameter_name:(target_parameter_name_ : automation_parameter_key option)
    ?targets:(targets_ : targets option) ?target_maps:(target_maps_ : target_maps option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?target_locations:(target_locations_ : target_locations option) ?tags:(tags_ : tag_list option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?target_locations_ur_l:(target_locations_ur_l_ : target_locations_ur_l option)
    ~document_name:(document_name_ : document_ar_n) () =
  ({
     document_name = document_name_;
     document_version = document_version_;
     parameters = parameters_;
     client_token = client_token_;
     mode = mode_;
     target_parameter_name = target_parameter_name_;
     targets = targets_;
     target_maps = target_maps_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     target_locations = target_locations_;
     tags = tags_;
     alarm_configuration = alarm_configuration_;
     target_locations_ur_l = target_locations_ur_l_;
   }
    : start_automation_execution_request)

let make_start_associations_once_request ~association_ids:(association_ids_ : association_id_list)
    () =
  ({ association_ids = association_ids_ } : start_associations_once_request)

let make_start_access_request_response
    ?access_request_id:(access_request_id_ : access_request_id option) () =
  ({ access_request_id = access_request_id_ } : start_access_request_response)

let make_start_access_request_request ?tags:(tags_ : tag_list option)
    ~reason:(reason_ : string1to256) ~targets:(targets_ : targets) () =
  ({ reason = reason_; targets = targets_; tags = tags_ } : start_access_request_request)

let make_command ?command_id:(command_id_ : command_id option)
    ?document_name:(document_name_ : document_name option)
    ?document_version:(document_version_ : document_version option)
    ?comment:(comment_ : comment option) ?expires_after:(expires_after_ : date_time option)
    ?parameters:(parameters_ : parameters option)
    ?instance_ids:(instance_ids_ : instance_id_list option) ?targets:(targets_ : targets option)
    ?requested_date_time:(requested_date_time_ : date_time option)
    ?status:(status_ : command_status option)
    ?status_details:(status_details_ : status_details option)
    ?output_s3_region:(output_s3_region_ : s3_region option)
    ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
    ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?target_count:(target_count_ : target_count option)
    ?completed_count:(completed_count_ : completed_count option)
    ?error_count:(error_count_ : error_count option)
    ?delivery_timed_out_count:(delivery_timed_out_count_ : delivery_timed_out_count option)
    ?service_role:(service_role_ : service_role option)
    ?notification_config:(notification_config_ : notification_config option)
    ?cloud_watch_output_config:(cloud_watch_output_config_ : cloud_watch_output_config option)
    ?timeout_seconds:(timeout_seconds_ : timeout_seconds option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option) () =
  ({
     command_id = command_id_;
     document_name = document_name_;
     document_version = document_version_;
     comment = comment_;
     expires_after = expires_after_;
     parameters = parameters_;
     instance_ids = instance_ids_;
     targets = targets_;
     requested_date_time = requested_date_time_;
     status = status_;
     status_details = status_details_;
     output_s3_region = output_s3_region_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_key_prefix = output_s3_key_prefix_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     target_count = target_count_;
     completed_count = completed_count_;
     error_count = error_count_;
     delivery_timed_out_count = delivery_timed_out_count_;
     service_role = service_role_;
     notification_config = notification_config_;
     cloud_watch_output_config = cloud_watch_output_config_;
     timeout_seconds = timeout_seconds_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
   }
    : command)

let make_send_command_request ?instance_ids:(instance_ids_ : instance_id_list option)
    ?targets:(targets_ : targets option)
    ?document_version:(document_version_ : document_version option)
    ?document_hash:(document_hash_ : document_hash option)
    ?document_hash_type:(document_hash_type_ : document_hash_type option)
    ?timeout_seconds:(timeout_seconds_ : timeout_seconds option)
    ?comment:(comment_ : comment option) ?parameters:(parameters_ : parameters option)
    ?output_s3_region:(output_s3_region_ : s3_region option)
    ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
    ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?service_role_arn:(service_role_arn_ : service_role option)
    ?notification_config:(notification_config_ : notification_config option)
    ?cloud_watch_output_config:(cloud_watch_output_config_ : cloud_watch_output_config option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ~document_name:(document_name_ : document_ar_n) () =
  ({
     instance_ids = instance_ids_;
     targets = targets_;
     document_name = document_name_;
     document_version = document_version_;
     document_hash = document_hash_;
     document_hash_type = document_hash_type_;
     timeout_seconds = timeout_seconds_;
     comment = comment_;
     parameters = parameters_;
     output_s3_region = output_s3_region_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_key_prefix = output_s3_key_prefix_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     service_role_arn = service_role_arn_;
     notification_config = notification_config_;
     cloud_watch_output_config = cloud_watch_output_config_;
     alarm_configuration = alarm_configuration_;
   }
    : send_command_request)

let make_send_automation_signal_request ?payload:(payload_ : automation_parameter_map option)
    ~automation_execution_id:(automation_execution_id_ : automation_execution_id)
    ~signal_type:(signal_type_ : signal_type) () =
  ({
     automation_execution_id = automation_execution_id_;
     signal_type = signal_type_;
     payload = payload_;
   }
    : send_automation_signal_request)

let make_resume_session_response ?session_id:(session_id_ : session_id option)
    ?token_value:(token_value_ : token_value option) ?stream_url:(stream_url_ : stream_url option)
    () =
  ({ session_id = session_id_; token_value = token_value_; stream_url = stream_url_ }
    : resume_session_response)

let make_resume_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : resume_session_request)

let make_service_setting ?setting_id:(setting_id_ : service_setting_id option)
    ?setting_value:(setting_value_ : service_setting_value option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?last_modified_user:(last_modified_user_ : string_ option) ?ar_n:(ar_n_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({
     setting_id = setting_id_;
     setting_value = setting_value_;
     last_modified_date = last_modified_date_;
     last_modified_user = last_modified_user_;
     ar_n = ar_n_;
     status = status_;
   }
    : service_setting)

let make_reset_service_setting_request ~setting_id:(setting_id_ : service_setting_id) () =
  ({ setting_id = setting_id_ } : reset_service_setting_request)

let make_remove_tags_from_resource_request
    ~resource_type:(resource_type_ : resource_type_for_tagging)
    ~resource_id:(resource_id_ : resource_id) ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_type = resource_type_; resource_id = resource_id_; tag_keys = tag_keys_ }
    : remove_tags_from_resource_request)

let make_register_task_with_maintenance_window_request ?targets:(targets_ : targets option)
    ?service_role_arn:(service_role_arn_ : service_role option)
    ?task_parameters:(task_parameters_ : maintenance_window_task_parameters option)
    ?task_invocation_parameters:
      (task_invocation_parameters_ : maintenance_window_task_invocation_parameters option)
    ?priority:(priority_ : maintenance_window_task_priority option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option)
    ?logging_info:(logging_info_ : logging_info option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?client_token:(client_token_ : client_token option)
    ?cutoff_behavior:(cutoff_behavior_ : maintenance_window_task_cutoff_behavior option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ~window_id:(window_id_ : maintenance_window_id)
    ~task_arn:(task_arn_ : maintenance_window_task_arn)
    ~task_type:(task_type_ : maintenance_window_task_type) () =
  ({
     window_id = window_id_;
     targets = targets_;
     task_arn = task_arn_;
     service_role_arn = service_role_arn_;
     task_type = task_type_;
     task_parameters = task_parameters_;
     task_invocation_parameters = task_invocation_parameters_;
     priority = priority_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     logging_info = logging_info_;
     name = name_;
     description = description_;
     client_token = client_token_;
     cutoff_behavior = cutoff_behavior_;
     alarm_configuration = alarm_configuration_;
   }
    : register_task_with_maintenance_window_request)

let make_register_target_with_maintenance_window_request
    ?owner_information:(owner_information_ : owner_information option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?client_token:(client_token_ : client_token option)
    ~window_id:(window_id_ : maintenance_window_id)
    ~resource_type:(resource_type_ : maintenance_window_resource_type) ~targets:(targets_ : targets)
    () =
  ({
     window_id = window_id_;
     resource_type = resource_type_;
     targets = targets_;
     owner_information = owner_information_;
     name = name_;
     description = description_;
     client_token = client_token_;
   }
    : register_target_with_maintenance_window_request)

let make_register_patch_baseline_for_patch_group_request ~baseline_id:(baseline_id_ : baseline_id)
    ~patch_group:(patch_group_ : patch_group) () =
  ({ baseline_id = baseline_id_; patch_group = patch_group_ }
    : register_patch_baseline_for_patch_group_request)

let make_register_default_patch_baseline_request ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_ } : register_default_patch_baseline_request)

let make_put_resource_policy_response ?policy_id:(policy_id_ : policy_id option)
    ?policy_hash:(policy_hash_ : policy_hash option) () =
  ({ policy_id = policy_id_; policy_hash = policy_hash_ } : put_resource_policy_response)

let make_put_resource_policy_request ?policy_id:(policy_id_ : policy_id option)
    ?policy_hash:(policy_hash_ : policy_hash option)
    ~resource_arn:(resource_arn_ : resource_arn_string) ~policy:(policy_ : policy) () =
  ({
     resource_arn = resource_arn_;
     policy = policy_;
     policy_id = policy_id_;
     policy_hash = policy_hash_;
   }
    : put_resource_policy_request)

let make_put_parameter_request ?description:(description_ : parameter_description option)
    ?type_:(type__ : parameter_type option) ?key_id:(key_id_ : parameter_key_id option)
    ?overwrite:(overwrite_ : boolean_ option)
    ?allowed_pattern:(allowed_pattern_ : allowed_pattern option) ?tags:(tags_ : tag_list option)
    ?tier:(tier_ : parameter_tier option) ?policies:(policies_ : parameter_policies option)
    ?data_type:(data_type_ : parameter_data_type option) ~name:(name_ : ps_parameter_name)
    ~value:(value_ : ps_parameter_value) () =
  ({
     name = name_;
     description = description_;
     value = value_;
     type_ = type__;
     key_id = key_id_;
     overwrite = overwrite_;
     allowed_pattern = allowed_pattern_;
     tags = tags_;
     tier = tier_;
     policies = policies_;
     data_type = data_type_;
   }
    : put_parameter_request)

let make_inventory_item ?content_hash:(content_hash_ : inventory_item_content_hash option)
    ?content:(content_ : inventory_item_entry_list option)
    ?context:(context_ : inventory_item_content_context option)
    ~type_name:(type_name_ : inventory_item_type_name)
    ~schema_version:(schema_version_ : inventory_item_schema_version)
    ~capture_time:(capture_time_ : inventory_item_capture_time) () =
  ({
     type_name = type_name_;
     schema_version = schema_version_;
     capture_time = capture_time_;
     content_hash = content_hash_;
     content = content_;
     context = context_;
   }
    : inventory_item)

let make_put_inventory_request ~instance_id:(instance_id_ : instance_id)
    ~items:(items_ : inventory_item_list) () =
  ({ instance_id = instance_id_; items = items_ } : put_inventory_request)

let make_compliance_item_entry ?id:(id_ : compliance_item_id option)
    ?title:(title_ : compliance_item_title option)
    ?details:(details_ : compliance_item_details option) ~severity:(severity_ : compliance_severity)
    ~status:(status_ : compliance_status) () =
  ({ id = id_; title = title_; severity = severity_; status = status_; details = details_ }
    : compliance_item_entry)

let make_compliance_execution_summary ?execution_id:(execution_id_ : compliance_execution_id option)
    ?execution_type:(execution_type_ : compliance_execution_type option)
    ~execution_time:(execution_time_ : date_time) () =
  ({
     execution_time = execution_time_;
     execution_id = execution_id_;
     execution_type = execution_type_;
   }
    : compliance_execution_summary)

let make_put_compliance_items_request
    ?item_content_hash:(item_content_hash_ : compliance_item_content_hash option)
    ?upload_type:(upload_type_ : compliance_upload_type option)
    ~resource_id:(resource_id_ : compliance_resource_id)
    ~resource_type:(resource_type_ : compliance_resource_type)
    ~compliance_type:(compliance_type_ : compliance_type_name)
    ~execution_summary:(execution_summary_ : compliance_execution_summary)
    ~items:(items_ : compliance_item_entry_list) () =
  ({
     resource_id = resource_id_;
     resource_type = resource_type_;
     compliance_type = compliance_type_;
     execution_summary = execution_summary_;
     items = items_;
     item_content_hash = item_content_hash_;
     upload_type = upload_type_;
   }
    : put_compliance_items_request)

let make_modify_document_permission_response () = (() : unit)

let make_modify_document_permission_request
    ?account_ids_to_add:(account_ids_to_add_ : account_id_list option)
    ?account_ids_to_remove:(account_ids_to_remove_ : account_id_list option)
    ?shared_document_version:(shared_document_version_ : shared_document_version option)
    ~name:(name_ : document_name) ~permission_type:(permission_type_ : document_permission_type) ()
    =
  ({
     name = name_;
     permission_type = permission_type_;
     account_ids_to_add = account_ids_to_add_;
     account_ids_to_remove = account_ids_to_remove_;
     shared_document_version = shared_document_version_;
   }
    : modify_document_permission_request)

let make_list_tags_for_resource_request ~resource_type:(resource_type_ : resource_type_for_tagging)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : list_tags_for_resource_request)

let make_resource_data_sync_destination_data_sharing
    ?destination_data_sharing_type:
      (destination_data_sharing_type_ : resource_data_sync_destination_data_sharing_type option) ()
    =
  ({ destination_data_sharing_type = destination_data_sharing_type_ }
    : resource_data_sync_destination_data_sharing)

let make_resource_data_sync_s3_destination ?prefix:(prefix_ : resource_data_sync_s3_prefix option)
    ?awskms_key_ar_n:(awskms_key_ar_n_ : resource_data_sync_awskms_key_ar_n option)
    ?destination_data_sharing:
      (destination_data_sharing_ : resource_data_sync_destination_data_sharing option)
    ~bucket_name:(bucket_name_ : resource_data_sync_s3_bucket_name)
    ~sync_format:(sync_format_ : resource_data_sync_s3_format)
    ~region:(region_ : resource_data_sync_s3_region) () =
  ({
     bucket_name = bucket_name_;
     prefix = prefix_;
     sync_format = sync_format_;
     region = region_;
     awskms_key_ar_n = awskms_key_ar_n_;
     destination_data_sharing = destination_data_sharing_;
   }
    : resource_data_sync_s3_destination)

let make_resource_data_sync_source_with_state
    ?source_type:(source_type_ : resource_data_sync_source_type option)
    ?aws_organizations_source:
      (aws_organizations_source_ : resource_data_sync_aws_organizations_source option)
    ?source_regions:(source_regions_ : resource_data_sync_source_region_list option)
    ?include_future_regions:
      (include_future_regions_ : resource_data_sync_include_future_regions option)
    ?state:(state_ : resource_data_sync_state option)
    ?enable_all_ops_data_sources:
      (enable_all_ops_data_sources_ : resource_data_sync_enable_all_ops_data_sources option) () =
  ({
     source_type = source_type_;
     aws_organizations_source = aws_organizations_source_;
     source_regions = source_regions_;
     include_future_regions = include_future_regions_;
     state = state_;
     enable_all_ops_data_sources = enable_all_ops_data_sources_;
   }
    : resource_data_sync_source_with_state)

let make_resource_data_sync_item ?sync_name:(sync_name_ : resource_data_sync_name option)
    ?sync_type:(sync_type_ : resource_data_sync_type option)
    ?sync_source:(sync_source_ : resource_data_sync_source_with_state option)
    ?s3_destination:(s3_destination_ : resource_data_sync_s3_destination option)
    ?last_sync_time:(last_sync_time_ : last_resource_data_sync_time option)
    ?last_successful_sync_time:
      (last_successful_sync_time_ : last_successful_resource_data_sync_time option)
    ?sync_last_modified_time:
      (sync_last_modified_time_ : resource_data_sync_last_modified_time option)
    ?last_status:(last_status_ : last_resource_data_sync_status option)
    ?sync_created_time:(sync_created_time_ : resource_data_sync_created_time option)
    ?last_sync_status_message:(last_sync_status_message_ : last_resource_data_sync_message option)
    () =
  ({
     sync_name = sync_name_;
     sync_type = sync_type_;
     sync_source = sync_source_;
     s3_destination = s3_destination_;
     last_sync_time = last_sync_time_;
     last_successful_sync_time = last_successful_sync_time_;
     sync_last_modified_time = sync_last_modified_time_;
     last_status = last_status_;
     sync_created_time = sync_created_time_;
     last_sync_status_message = last_sync_status_message_;
   }
    : resource_data_sync_item)

let make_list_resource_data_sync_request ?sync_type:(sync_type_ : resource_data_sync_type option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ sync_type = sync_type_; next_token = next_token_; max_results = max_results_ }
    : list_resource_data_sync_request)

let make_severity_summary ?critical_count:(critical_count_ : compliance_summary_count option)
    ?high_count:(high_count_ : compliance_summary_count option)
    ?medium_count:(medium_count_ : compliance_summary_count option)
    ?low_count:(low_count_ : compliance_summary_count option)
    ?informational_count:(informational_count_ : compliance_summary_count option)
    ?unspecified_count:(unspecified_count_ : compliance_summary_count option) () =
  ({
     critical_count = critical_count_;
     high_count = high_count_;
     medium_count = medium_count_;
     low_count = low_count_;
     informational_count = informational_count_;
     unspecified_count = unspecified_count_;
   }
    : severity_summary)

let make_non_compliant_summary
    ?non_compliant_count:(non_compliant_count_ : compliance_summary_count option)
    ?severity_summary:(severity_summary_ : severity_summary option) () =
  ({ non_compliant_count = non_compliant_count_; severity_summary = severity_summary_ }
    : non_compliant_summary)

let make_compliant_summary ?compliant_count:(compliant_count_ : compliance_summary_count option)
    ?severity_summary:(severity_summary_ : severity_summary option) () =
  ({ compliant_count = compliant_count_; severity_summary = severity_summary_ } : compliant_summary)

let make_resource_compliance_summary_item
    ?compliance_type:(compliance_type_ : compliance_type_name option)
    ?resource_type:(resource_type_ : compliance_resource_type option)
    ?resource_id:(resource_id_ : compliance_resource_id option)
    ?status:(status_ : compliance_status option)
    ?overall_severity:(overall_severity_ : compliance_severity option)
    ?execution_summary:(execution_summary_ : compliance_execution_summary option)
    ?compliant_summary:(compliant_summary_ : compliant_summary option)
    ?non_compliant_summary:(non_compliant_summary_ : non_compliant_summary option) () =
  ({
     compliance_type = compliance_type_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     status = status_;
     overall_severity = overall_severity_;
     execution_summary = execution_summary_;
     compliant_summary = compliant_summary_;
     non_compliant_summary = non_compliant_summary_;
   }
    : resource_compliance_summary_item)

let make_compliance_string_filter ?key:(key_ : compliance_string_filter_key option)
    ?values:(values_ : compliance_string_filter_value_list option)
    ?type_:(type__ : compliance_query_operator_type option) () =
  ({ key = key_; values = values_; type_ = type__ } : compliance_string_filter)

let make_list_resource_compliance_summaries_request
    ?filters:(filters_ : compliance_string_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_resource_compliance_summaries_request)

let make_ops_metadata ?resource_id:(resource_id_ : ops_metadata_resource_id option)
    ?ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?last_modified_user:(last_modified_user_ : string_ option)
    ?creation_date:(creation_date_ : date_time option) () =
  ({
     resource_id = resource_id_;
     ops_metadata_arn = ops_metadata_arn_;
     last_modified_date = last_modified_date_;
     last_modified_user = last_modified_user_;
     creation_date = creation_date_;
   }
    : ops_metadata)

let make_ops_metadata_filter ~key:(key_ : ops_metadata_filter_key)
    ~values:(values_ : ops_metadata_filter_value_list) () =
  ({ key = key_; values = values_ } : ops_metadata_filter)

let make_list_ops_metadata_request ?filters:(filters_ : ops_metadata_filter_list option)
    ?max_results:(max_results_ : list_ops_metadata_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_ops_metadata_request)

let make_ops_item_identity ?arn:(arn_ : string_ option) () = ({ arn = arn_ } : ops_item_identity)

let make_ops_item_related_item_summary ?ops_item_id:(ops_item_id_ : ops_item_id option)
    ?association_id:(association_id_ : ops_item_related_item_association_id option)
    ?resource_type:(resource_type_ : ops_item_related_item_association_resource_type option)
    ?association_type:(association_type_ : ops_item_related_item_association_type option)
    ?resource_uri:(resource_uri_ : ops_item_related_item_association_resource_uri option)
    ?created_by:(created_by_ : ops_item_identity option)
    ?created_time:(created_time_ : date_time option)
    ?last_modified_by:(last_modified_by_ : ops_item_identity option)
    ?last_modified_time:(last_modified_time_ : date_time option) () =
  ({
     ops_item_id = ops_item_id_;
     association_id = association_id_;
     resource_type = resource_type_;
     association_type = association_type_;
     resource_uri = resource_uri_;
     created_by = created_by_;
     created_time = created_time_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
   }
    : ops_item_related_item_summary)

let make_list_ops_item_related_items_response ?next_token:(next_token_ : string_ option)
    ?summaries:(summaries_ : ops_item_related_item_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_ops_item_related_items_response)

let make_ops_item_related_items_filter ~key:(key_ : ops_item_related_items_filter_key)
    ~values:(values_ : ops_item_related_items_filter_values)
    ~operator:(operator_ : ops_item_related_items_filter_operator) () =
  ({ key = key_; values = values_; operator = operator_ } : ops_item_related_items_filter)

let make_list_ops_item_related_items_request ?ops_item_id:(ops_item_id_ : ops_item_id option)
    ?filters:(filters_ : ops_item_related_items_filters option)
    ?max_results:(max_results_ : ops_item_related_items_max_results option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     ops_item_id = ops_item_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_ops_item_related_items_request)

let make_ops_item_event_summary ?ops_item_id:(ops_item_id_ : string_ option)
    ?event_id:(event_id_ : string_ option) ?source:(source_ : string_ option)
    ?detail_type:(detail_type_ : string_ option) ?detail:(detail_ : string_ option)
    ?created_by:(created_by_ : ops_item_identity option)
    ?created_time:(created_time_ : date_time option) () =
  ({
     ops_item_id = ops_item_id_;
     event_id = event_id_;
     source = source_;
     detail_type = detail_type_;
     detail = detail_;
     created_by = created_by_;
     created_time = created_time_;
   }
    : ops_item_event_summary)

let make_list_ops_item_events_response ?next_token:(next_token_ : string_ option)
    ?summaries:(summaries_ : ops_item_event_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_ops_item_events_response)

let make_ops_item_event_filter ~key:(key_ : ops_item_event_filter_key)
    ~values:(values_ : ops_item_event_filter_values)
    ~operator:(operator_ : ops_item_event_filter_operator) () =
  ({ key = key_; values = values_; operator = operator_ } : ops_item_event_filter)

let make_list_ops_item_events_request ?filters:(filters_ : ops_item_event_filters option)
    ?max_results:(max_results_ : ops_item_event_max_results option)
    ?next_token:(next_token_ : string_ option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_ops_item_events_request)

let make_node_aggregator ?aggregators:(aggregators_ : node_aggregator_list option)
    ~aggregator_type:(aggregator_type_ : node_aggregator_type)
    ~type_name:(type_name_ : node_type_name) ~attribute_name:(attribute_name_ : node_attribute_name)
    () =
  ({
     aggregator_type = aggregator_type_;
     type_name = type_name_;
     attribute_name = attribute_name_;
     aggregators = aggregators_;
   }
    : node_aggregator)

let make_node_filter ?type_:(type__ : node_filter_operator_type option)
    ~key:(key_ : node_filter_key) ~values:(values_ : node_filter_value_list) () =
  ({ key = key_; values = values_; type_ = type__ } : node_filter)

let make_list_nodes_summary_request ?sync_name:(sync_name_ : resource_data_sync_name option)
    ?filters:(filters_ : node_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~aggregators:(aggregators_ : node_aggregator_list) () =
  ({
     sync_name = sync_name_;
     filters = filters_;
     aggregators = aggregators_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_nodes_summary_request)

let make_instance_info ?agent_type:(agent_type_ : agent_type option)
    ?agent_version:(agent_version_ : agent_version option)
    ?computer_name:(computer_name_ : computer_name option)
    ?instance_status:(instance_status_ : instance_status option)
    ?ip_address:(ip_address_ : ip_address option)
    ?managed_status:(managed_status_ : managed_status option)
    ?platform_type:(platform_type_ : platform_type option)
    ?platform_name:(platform_name_ : platform_name option)
    ?platform_version:(platform_version_ : platform_version option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     agent_type = agent_type_;
     agent_version = agent_version_;
     computer_name = computer_name_;
     instance_status = instance_status_;
     ip_address = ip_address_;
     managed_status = managed_status_;
     platform_type = platform_type_;
     platform_name = platform_name_;
     platform_version = platform_version_;
     resource_type = resource_type_;
   }
    : instance_info)

let make_node_owner_info ?account_id:(account_id_ : node_account_id option)
    ?organizational_unit_id:(organizational_unit_id_ : node_organizational_unit_id option)
    ?organizational_unit_path:(organizational_unit_path_ : node_organizational_unit_path option) ()
    =
  ({
     account_id = account_id_;
     organizational_unit_id = organizational_unit_id_;
     organizational_unit_path = organizational_unit_path_;
   }
    : node_owner_info)

let make_node ?capture_time:(capture_time_ : node_capture_time option) ?id:(id_ : node_id option)
    ?owner:(owner_ : node_owner_info option) ?region:(region_ : node_region option)
    ?node_type:(node_type_ : node_type option) () =
  ({
     capture_time = capture_time_;
     id = id_;
     owner = owner_;
     region = region_;
     node_type = node_type_;
   }
    : node)

let make_list_nodes_request ?sync_name:(sync_name_ : resource_data_sync_name option)
    ?filters:(filters_ : node_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     sync_name = sync_name_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_nodes_request)

let make_inventory_filter ?type_:(type__ : inventory_query_operator_type option)
    ~key:(key_ : inventory_filter_key) ~values:(values_ : inventory_filter_value_list) () =
  ({ key = key_; values = values_; type_ = type__ } : inventory_filter)

let make_list_inventory_entries_request ?filters:(filters_ : inventory_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~instance_id:(instance_id_ : instance_id) ~type_name:(type_name_ : inventory_item_type_name) ()
    =
  ({
     instance_id = instance_id_;
     type_name = type_name_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_inventory_entries_request)

let make_document_version_info ?name:(name_ : document_name option)
    ?display_name:(display_name_ : document_display_name option)
    ?document_version:(document_version_ : document_version option)
    ?version_name:(version_name_ : document_version_name option)
    ?created_date:(created_date_ : date_time option)
    ?is_default_version:(is_default_version_ : boolean_ option)
    ?document_format:(document_format_ : document_format option)
    ?status:(status_ : document_status option)
    ?status_information:(status_information_ : document_status_information option)
    ?review_status:(review_status_ : review_status option) () =
  ({
     name = name_;
     display_name = display_name_;
     document_version = document_version_;
     version_name = version_name_;
     created_date = created_date_;
     is_default_version = is_default_version_;
     document_format = document_format_;
     status = status_;
     status_information = status_information_;
     review_status = review_status_;
   }
    : document_version_info)

let make_list_document_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~name:(name_ : document_ar_n) () =
  ({ name = name_; max_results = max_results_; next_token = next_token_ }
    : list_document_versions_request)

let make_document_identifier ?name:(name_ : document_ar_n option)
    ?created_date:(created_date_ : date_time option)
    ?display_name:(display_name_ : document_display_name option)
    ?owner:(owner_ : document_owner option)
    ?version_name:(version_name_ : document_version_name option)
    ?platform_types:(platform_types_ : platform_type_list option)
    ?document_version:(document_version_ : document_version option)
    ?document_type:(document_type_ : document_type option)
    ?schema_version:(schema_version_ : document_schema_version option)
    ?document_format:(document_format_ : document_format option)
    ?target_type:(target_type_ : target_type option) ?tags:(tags_ : tag_list option)
    ?requires:(requires_ : document_requires_list option)
    ?review_status:(review_status_ : review_status option)
    ?author:(author_ : document_author option) () =
  ({
     name = name_;
     created_date = created_date_;
     display_name = display_name_;
     owner = owner_;
     version_name = version_name_;
     platform_types = platform_types_;
     document_version = document_version_;
     document_type = document_type_;
     schema_version = schema_version_;
     document_format = document_format_;
     target_type = target_type_;
     tags = tags_;
     requires = requires_;
     review_status = review_status_;
     author = author_;
   }
    : document_identifier)

let make_document_key_values_filter ?key:(key_ : document_key_values_filter_key option)
    ?values:(values_ : document_key_values_filter_values option) () =
  ({ key = key_; values = values_ } : document_key_values_filter)

let make_document_filter ~key:(key_ : document_filter_key) ~value:(value_ : document_filter_value)
    () =
  ({ key = key_; value = value_ } : document_filter)

let make_list_documents_request
    ?document_filter_list:(document_filter_list_ : document_filter_list option)
    ?filters:(filters_ : document_key_values_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     document_filter_list = document_filter_list_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_documents_request)

let make_document_reviewer_response_source ?create_time:(create_time_ : date_time option)
    ?updated_time:(updated_time_ : date_time option)
    ?review_status:(review_status_ : review_status option)
    ?comment:(comment_ : document_review_comment_list option)
    ?reviewer:(reviewer_ : reviewer option) () =
  ({
     create_time = create_time_;
     updated_time = updated_time_;
     review_status = review_status_;
     comment = comment_;
     reviewer = reviewer_;
   }
    : document_reviewer_response_source)

let make_document_metadata_response_info
    ?reviewer_response:(reviewer_response_ : document_reviewer_response_list option) () =
  ({ reviewer_response = reviewer_response_ } : document_metadata_response_info)

let make_list_document_metadata_history_response ?name:(name_ : document_name option)
    ?document_version:(document_version_ : document_version option)
    ?author:(author_ : document_author option)
    ?metadata:(metadata_ : document_metadata_response_info option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     name = name_;
     document_version = document_version_;
     author = author_;
     metadata = metadata_;
     next_token = next_token_;
   }
    : list_document_metadata_history_response)

let make_list_document_metadata_history_request
    ?document_version:(document_version_ : document_version option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~name:(name_ : document_name) ~metadata:(metadata_ : document_metadata_enum) () =
  ({
     name = name_;
     document_version = document_version_;
     metadata = metadata_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_document_metadata_history_request)

let make_compliance_summary_item ?compliance_type:(compliance_type_ : compliance_type_name option)
    ?compliant_summary:(compliant_summary_ : compliant_summary option)
    ?non_compliant_summary:(non_compliant_summary_ : non_compliant_summary option) () =
  ({
     compliance_type = compliance_type_;
     compliant_summary = compliant_summary_;
     non_compliant_summary = non_compliant_summary_;
   }
    : compliance_summary_item)

let make_list_compliance_summaries_request
    ?filters:(filters_ : compliance_string_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_compliance_summaries_request)

let make_compliance_item ?compliance_type:(compliance_type_ : compliance_type_name option)
    ?resource_type:(resource_type_ : compliance_resource_type option)
    ?resource_id:(resource_id_ : compliance_resource_id option)
    ?id:(id_ : compliance_item_id option) ?title:(title_ : compliance_item_title option)
    ?status:(status_ : compliance_status option) ?severity:(severity_ : compliance_severity option)
    ?execution_summary:(execution_summary_ : compliance_execution_summary option)
    ?details:(details_ : compliance_item_details option) () =
  ({
     compliance_type = compliance_type_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     id = id_;
     title = title_;
     status = status_;
     severity = severity_;
     execution_summary = execution_summary_;
     details = details_;
   }
    : compliance_item)

let make_list_compliance_items_request ?filters:(filters_ : compliance_string_filter_list option)
    ?resource_ids:(resource_ids_ : compliance_resource_id_list option)
    ?resource_types:(resource_types_ : compliance_resource_type_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     filters = filters_;
     resource_ids = resource_ids_;
     resource_types = resource_types_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_compliance_items_request)

let make_command_filter ~key:(key_ : command_filter_key) ~value:(value_ : command_filter_value) () =
  ({ key = key_; value = value_ } : command_filter)

let make_list_commands_request ?command_id:(command_id_ : command_id option)
    ?instance_id:(instance_id_ : instance_id option)
    ?max_results:(max_results_ : command_max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : command_filter_list option)
    () =
  ({
     command_id = command_id_;
     instance_id = instance_id_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_commands_request)

let make_command_plugin ?name:(name_ : command_plugin_name option)
    ?status:(status_ : command_plugin_status option)
    ?status_details:(status_details_ : status_details option)
    ?response_code:(response_code_ : response_code option)
    ?response_start_date_time:(response_start_date_time_ : date_time option)
    ?response_finish_date_time:(response_finish_date_time_ : date_time option)
    ?output:(output_ : command_plugin_output option)
    ?standard_output_url:(standard_output_url_ : url option)
    ?standard_error_url:(standard_error_url_ : url option)
    ?output_s3_region:(output_s3_region_ : s3_region option)
    ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
    ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option) () =
  ({
     name = name_;
     status = status_;
     status_details = status_details_;
     response_code = response_code_;
     response_start_date_time = response_start_date_time_;
     response_finish_date_time = response_finish_date_time_;
     output = output_;
     standard_output_url = standard_output_url_;
     standard_error_url = standard_error_url_;
     output_s3_region = output_s3_region_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_key_prefix = output_s3_key_prefix_;
   }
    : command_plugin)

let make_command_invocation ?command_id:(command_id_ : command_id option)
    ?instance_id:(instance_id_ : instance_id option)
    ?instance_name:(instance_name_ : instance_tag_name option) ?comment:(comment_ : comment option)
    ?document_name:(document_name_ : document_name option)
    ?document_version:(document_version_ : document_version option)
    ?requested_date_time:(requested_date_time_ : date_time option)
    ?status:(status_ : command_invocation_status option)
    ?status_details:(status_details_ : status_details option)
    ?trace_output:(trace_output_ : invocation_trace_output option)
    ?standard_output_url:(standard_output_url_ : url option)
    ?standard_error_url:(standard_error_url_ : url option)
    ?command_plugins:(command_plugins_ : command_plugin_list option)
    ?service_role:(service_role_ : service_role option)
    ?notification_config:(notification_config_ : notification_config option)
    ?cloud_watch_output_config:(cloud_watch_output_config_ : cloud_watch_output_config option) () =
  ({
     command_id = command_id_;
     instance_id = instance_id_;
     instance_name = instance_name_;
     comment = comment_;
     document_name = document_name_;
     document_version = document_version_;
     requested_date_time = requested_date_time_;
     status = status_;
     status_details = status_details_;
     trace_output = trace_output_;
     standard_output_url = standard_output_url_;
     standard_error_url = standard_error_url_;
     command_plugins = command_plugins_;
     service_role = service_role_;
     notification_config = notification_config_;
     cloud_watch_output_config = cloud_watch_output_config_;
   }
    : command_invocation)

let make_list_command_invocations_request ?command_id:(command_id_ : command_id option)
    ?instance_id:(instance_id_ : instance_id option)
    ?max_results:(max_results_ : command_max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : command_filter_list option)
    ?details:(details_ : boolean_ option) () =
  ({
     command_id = command_id_;
     instance_id = instance_id_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     details = details_;
   }
    : list_command_invocations_request)

let make_association_version_info ?association_id:(association_id_ : association_id option)
    ?association_version:(association_version_ : association_version option)
    ?created_date:(created_date_ : date_time option) ?name:(name_ : document_ar_n option)
    ?document_version:(document_version_ : document_version option)
    ?parameters:(parameters_ : parameters option) ?targets:(targets_ : targets option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?output_location:(output_location_ : instance_association_output_location option)
    ?association_name:(association_name_ : association_name option)
    ?max_errors:(max_errors_ : max_errors option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?compliance_severity:(compliance_severity_ : association_compliance_severity option)
    ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
    ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : apply_only_at_cron_interval option)
    ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
    ?target_locations:(target_locations_ : target_locations option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option)
    ?association_dispatch_assume_role:
      (association_dispatch_assume_role_ : association_dispatch_assume_role_arn option) () =
  ({
     association_id = association_id_;
     association_version = association_version_;
     created_date = created_date_;
     name = name_;
     document_version = document_version_;
     parameters = parameters_;
     targets = targets_;
     schedule_expression = schedule_expression_;
     output_location = output_location_;
     association_name = association_name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     compliance_severity = compliance_severity_;
     sync_compliance = sync_compliance_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     calendar_names = calendar_names_;
     target_locations = target_locations_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
     association_dispatch_assume_role = association_dispatch_assume_role_;
   }
    : association_version_info)

let make_list_association_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~association_id:(association_id_ : association_id)
    () =
  ({ association_id = association_id_; max_results = max_results_; next_token = next_token_ }
    : list_association_versions_request)

let make_association ?name:(name_ : document_ar_n option)
    ?instance_id:(instance_id_ : instance_id option)
    ?association_id:(association_id_ : association_id option)
    ?association_version:(association_version_ : association_version option)
    ?document_version:(document_version_ : document_version option)
    ?targets:(targets_ : targets option)
    ?last_execution_date:(last_execution_date_ : date_time option)
    ?overview:(overview_ : association_overview option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?association_name:(association_name_ : association_name option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option) () =
  ({
     name = name_;
     instance_id = instance_id_;
     association_id = association_id_;
     association_version = association_version_;
     document_version = document_version_;
     targets = targets_;
     last_execution_date = last_execution_date_;
     overview = overview_;
     schedule_expression = schedule_expression_;
     association_name = association_name_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
   }
    : association)

let make_association_filter ~key:(key_ : association_filter_key)
    ~value:(value_ : association_filter_value) () =
  ({ key = key_; value = value_ } : association_filter)

let make_list_associations_request
    ?association_filter_list:(association_filter_list_ : association_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     association_filter_list = association_filter_list_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_associations_request)

let make_label_parameter_version_request
    ?parameter_version:(parameter_version_ : ps_parameter_version option)
    ~name:(name_ : ps_parameter_name) ~labels:(labels_ : parameter_label_list) () =
  ({ name = name_; parameter_version = parameter_version_; labels = labels_ }
    : label_parameter_version_request)

let make_get_service_setting_request ~setting_id:(setting_id_ : service_setting_id) () =
  ({ setting_id = setting_id_ } : get_service_setting_request)

let make_get_resource_policies_response_entry ?policy_id:(policy_id_ : policy_id option)
    ?policy_hash:(policy_hash_ : policy_hash option) ?policy:(policy_ : policy option) () =
  ({ policy_id = policy_id_; policy_hash = policy_hash_; policy = policy_ }
    : get_resource_policies_response_entry)

let make_get_resource_policies_response ?next_token:(next_token_ : string_ option)
    ?policies:(policies_ : get_resource_policies_response_entries option) () =
  ({ next_token = next_token_; policies = policies_ } : get_resource_policies_response)

let make_get_resource_policies_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : resource_policy_max_results option)
    ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : get_resource_policies_request)

let make_get_patch_baseline_for_patch_group_request
    ?operating_system:(operating_system_ : operating_system option)
    ~patch_group:(patch_group_ : patch_group) () =
  ({ patch_group = patch_group_; operating_system = operating_system_ }
    : get_patch_baseline_for_patch_group_request)

let make_get_patch_baseline_request ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_ } : get_patch_baseline_request)

let make_parameter ?name:(name_ : ps_parameter_name option) ?type_:(type__ : parameter_type option)
    ?value:(value_ : ps_parameter_value option) ?version:(version_ : ps_parameter_version option)
    ?selector:(selector_ : ps_parameter_selector option)
    ?source_result:(source_result_ : string_ option)
    ?last_modified_date:(last_modified_date_ : date_time option) ?ar_n:(ar_n_ : string_ option)
    ?data_type:(data_type_ : parameter_data_type option) () =
  ({
     name = name_;
     type_ = type__;
     value = value_;
     version = version_;
     selector = selector_;
     source_result = source_result_;
     last_modified_date = last_modified_date_;
     ar_n = ar_n_;
     data_type = data_type_;
   }
    : parameter)

let make_parameter_string_filter ?option_:(option__ : parameter_string_query_option option)
    ?values:(values_ : parameter_string_filter_value_list option)
    ~key:(key_ : parameter_string_filter_key) () =
  ({ key = key_; option_ = option__; values = values_ } : parameter_string_filter)

let make_get_parameters_by_path_request ?recursive:(recursive_ : boolean_ option)
    ?parameter_filters:(parameter_filters_ : parameter_string_filter_list option)
    ?with_decryption:(with_decryption_ : boolean_ option)
    ?max_results:(max_results_ : get_parameters_by_path_max_results option)
    ?next_token:(next_token_ : next_token option) ~path:(path_ : ps_parameter_name) () =
  ({
     path = path_;
     recursive = recursive_;
     parameter_filters = parameter_filters_;
     with_decryption = with_decryption_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_parameters_by_path_request)

let make_get_parameters_request ?with_decryption:(with_decryption_ : boolean_ option)
    ~names:(names_ : parameter_name_list) () =
  ({ names = names_; with_decryption = with_decryption_ } : get_parameters_request)

let make_parameter_inline_policy ?policy_text:(policy_text_ : string_ option)
    ?policy_type:(policy_type_ : string_ option) ?policy_status:(policy_status_ : string_ option) ()
    =
  ({ policy_text = policy_text_; policy_type = policy_type_; policy_status = policy_status_ }
    : parameter_inline_policy)

let make_parameter_history ?name:(name_ : ps_parameter_name option)
    ?type_:(type__ : parameter_type option) ?key_id:(key_id_ : parameter_key_id option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?last_modified_user:(last_modified_user_ : string_ option)
    ?description:(description_ : parameter_description option)
    ?value:(value_ : ps_parameter_value option)
    ?allowed_pattern:(allowed_pattern_ : allowed_pattern option)
    ?version:(version_ : ps_parameter_version option)
    ?labels:(labels_ : parameter_label_list option) ?tier:(tier_ : parameter_tier option)
    ?policies:(policies_ : parameter_policy_list option)
    ?data_type:(data_type_ : parameter_data_type option) () =
  ({
     name = name_;
     type_ = type__;
     key_id = key_id_;
     last_modified_date = last_modified_date_;
     last_modified_user = last_modified_user_;
     description = description_;
     value = value_;
     allowed_pattern = allowed_pattern_;
     version = version_;
     labels = labels_;
     tier = tier_;
     policies = policies_;
     data_type = data_type_;
   }
    : parameter_history)

let make_get_parameter_history_request ?with_decryption:(with_decryption_ : boolean_ option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~name:(name_ : ps_parameter_name) () =
  ({
     name = name_;
     with_decryption = with_decryption_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_parameter_history_request)

let make_get_parameter_request ?with_decryption:(with_decryption_ : boolean_ option)
    ~name:(name_ : ps_parameter_name) () =
  ({ name = name_; with_decryption = with_decryption_ } : get_parameter_request)

let make_ops_entity_item ?capture_time:(capture_time_ : ops_entity_item_capture_time option)
    ?content:(content_ : ops_entity_item_entry_list option) () =
  ({ capture_time = capture_time_; content = content_ } : ops_entity_item)

let make_ops_entity ?id:(id_ : ops_entity_id option) ?data:(data_ : ops_entity_item_map option) () =
  ({ id = id_; data = data_ } : ops_entity)

let make_ops_result_attribute ~type_name:(type_name_ : ops_data_type_name) () =
  ({ type_name = type_name_ } : ops_result_attribute)

let make_ops_filter ?type_:(type__ : ops_filter_operator_type option) ~key:(key_ : ops_filter_key)
    ~values:(values_ : ops_filter_value_list) () =
  ({ key = key_; values = values_; type_ = type__ } : ops_filter)

let make_ops_aggregator ?aggregator_type:(aggregator_type_ : ops_aggregator_type option)
    ?type_name:(type_name_ : ops_data_type_name option)
    ?attribute_name:(attribute_name_ : ops_data_attribute_name option)
    ?values:(values_ : ops_aggregator_value_map option) ?filters:(filters_ : ops_filter_list option)
    ?aggregators:(aggregators_ : ops_aggregator_list option) () =
  ({
     aggregator_type = aggregator_type_;
     type_name = type_name_;
     attribute_name = attribute_name_;
     values = values_;
     filters = filters_;
     aggregators = aggregators_;
   }
    : ops_aggregator)

let make_get_ops_summary_request ?sync_name:(sync_name_ : resource_data_sync_name option)
    ?filters:(filters_ : ops_filter_list option)
    ?aggregators:(aggregators_ : ops_aggregator_list option)
    ?result_attributes:(result_attributes_ : ops_result_attribute_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sync_name = sync_name_;
     filters = filters_;
     aggregators = aggregators_;
     result_attributes = result_attributes_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_ops_summary_request)

let make_get_ops_metadata_request ?max_results:(max_results_ : get_ops_metadata_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({ ops_metadata_arn = ops_metadata_arn_; max_results = max_results_; next_token = next_token_ }
    : get_ops_metadata_request)

let make_ops_item ?created_by:(created_by_ : string_ option)
    ?ops_item_type:(ops_item_type_ : ops_item_type option)
    ?created_time:(created_time_ : date_time option)
    ?description:(description_ : ops_item_description option)
    ?last_modified_by:(last_modified_by_ : string_ option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?notifications:(notifications_ : ops_item_notifications option)
    ?priority:(priority_ : ops_item_priority option)
    ?related_ops_items:(related_ops_items_ : related_ops_items option)
    ?status:(status_ : ops_item_status option) ?ops_item_id:(ops_item_id_ : ops_item_id option)
    ?version:(version_ : string_ option) ?title:(title_ : ops_item_title option)
    ?source:(source_ : ops_item_source option)
    ?operational_data:(operational_data_ : ops_item_operational_data option)
    ?category:(category_ : ops_item_category option)
    ?severity:(severity_ : ops_item_severity option)
    ?actual_start_time:(actual_start_time_ : date_time option)
    ?actual_end_time:(actual_end_time_ : date_time option)
    ?planned_start_time:(planned_start_time_ : date_time option)
    ?planned_end_time:(planned_end_time_ : date_time option)
    ?ops_item_arn:(ops_item_arn_ : ops_item_arn option) () =
  ({
     created_by = created_by_;
     ops_item_type = ops_item_type_;
     created_time = created_time_;
     description = description_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     notifications = notifications_;
     priority = priority_;
     related_ops_items = related_ops_items_;
     status = status_;
     ops_item_id = ops_item_id_;
     version = version_;
     title = title_;
     source = source_;
     operational_data = operational_data_;
     category = category_;
     severity = severity_;
     actual_start_time = actual_start_time_;
     actual_end_time = actual_end_time_;
     planned_start_time = planned_start_time_;
     planned_end_time = planned_end_time_;
     ops_item_arn = ops_item_arn_;
   }
    : ops_item)

let make_get_ops_item_response ?ops_item:(ops_item_ : ops_item option) () =
  ({ ops_item = ops_item_ } : get_ops_item_response)

let make_get_ops_item_request ?ops_item_arn:(ops_item_arn_ : ops_item_arn option)
    ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({ ops_item_id = ops_item_id_; ops_item_arn = ops_item_arn_ } : get_ops_item_request)

let make_get_maintenance_window_task_request ~window_id:(window_id_ : maintenance_window_id)
    ~window_task_id:(window_task_id_ : maintenance_window_task_id) () =
  ({ window_id = window_id_; window_task_id = window_task_id_ }
    : get_maintenance_window_task_request)

let make_get_maintenance_window_execution_task_invocation_request
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id)
    ~task_id:(task_id_ : maintenance_window_execution_task_id)
    ~invocation_id:(invocation_id_ : maintenance_window_execution_task_invocation_id) () =
  ({
     window_execution_id = window_execution_id_;
     task_id = task_id_;
     invocation_id = invocation_id_;
   }
    : get_maintenance_window_execution_task_invocation_request)

let make_get_maintenance_window_execution_task_request
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id)
    ~task_id:(task_id_ : maintenance_window_execution_task_id) () =
  ({ window_execution_id = window_execution_id_; task_id = task_id_ }
    : get_maintenance_window_execution_task_request)

let make_get_maintenance_window_execution_request
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id) () =
  ({ window_execution_id = window_execution_id_ } : get_maintenance_window_execution_request)

let make_get_maintenance_window_request ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_id = window_id_ } : get_maintenance_window_request)

let make_inventory_item_attribute ~name:(name_ : inventory_item_attribute_name)
    ~data_type:(data_type_ : inventory_attribute_data_type) () =
  ({ name = name_; data_type = data_type_ } : inventory_item_attribute)

let make_inventory_item_schema ?version:(version_ : inventory_item_schema_version option)
    ?display_name:(display_name_ : inventory_type_display_name option)
    ~type_name:(type_name_ : inventory_item_type_name)
    ~attributes:(attributes_ : inventory_item_attribute_list) () =
  ({
     type_name = type_name_;
     version = version_;
     attributes = attributes_;
     display_name = display_name_;
   }
    : inventory_item_schema)

let make_get_inventory_schema_request
    ?type_name:(type_name_ : inventory_item_type_name_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : get_inventory_schema_max_results option)
    ?aggregator:(aggregator_ : aggregator_schema_only option)
    ?sub_type:(sub_type_ : is_sub_type_schema option) () =
  ({
     type_name = type_name_;
     next_token = next_token_;
     max_results = max_results_;
     aggregator = aggregator_;
     sub_type = sub_type_;
   }
    : get_inventory_schema_request)

let make_inventory_result_item ?capture_time:(capture_time_ : inventory_item_capture_time option)
    ?content_hash:(content_hash_ : inventory_item_content_hash option)
    ~type_name:(type_name_ : inventory_item_type_name)
    ~schema_version:(schema_version_ : inventory_item_schema_version)
    ~content:(content_ : inventory_item_entry_list) () =
  ({
     type_name = type_name_;
     schema_version = schema_version_;
     capture_time = capture_time_;
     content_hash = content_hash_;
     content = content_;
   }
    : inventory_result_item)

let make_inventory_result_entity ?id:(id_ : inventory_result_entity_id option)
    ?data:(data_ : inventory_result_item_map option) () =
  ({ id = id_; data = data_ } : inventory_result_entity)

let make_result_attribute ~type_name:(type_name_ : inventory_item_type_name) () =
  ({ type_name = type_name_ } : result_attribute)

let make_inventory_group ~name:(name_ : inventory_group_name)
    ~filters:(filters_ : inventory_filter_list) () =
  ({ name = name_; filters = filters_ } : inventory_group)

let make_inventory_aggregator ?expression:(expression_ : inventory_aggregator_expression option)
    ?aggregators:(aggregators_ : inventory_aggregator_list option)
    ?groups:(groups_ : inventory_group_list option) () =
  ({ expression = expression_; aggregators = aggregators_; groups = groups_ }
    : inventory_aggregator)

let make_get_inventory_request ?filters:(filters_ : inventory_filter_list option)
    ?aggregators:(aggregators_ : inventory_aggregator_list option)
    ?result_attributes:(result_attributes_ : result_attribute_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     filters = filters_;
     aggregators = aggregators_;
     result_attributes = result_attributes_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_inventory_request)

let make_target_preview ?count:(count_ : integer option)
    ?target_type:(target_type_ : string_ option) () =
  ({ count = count_; target_type = target_type_ } : target_preview)

let make_automation_execution_preview ?step_previews:(step_previews_ : step_preview_map option)
    ?regions:(regions_ : region_list option)
    ?target_previews:(target_previews_ : target_preview_list option)
    ?total_accounts:(total_accounts_ : integer option) () =
  ({
     step_previews = step_previews_;
     regions = regions_;
     target_previews = target_previews_;
     total_accounts = total_accounts_;
   }
    : automation_execution_preview)

let make_get_execution_preview_response
    ?execution_preview_id:(execution_preview_id_ : execution_preview_id option)
    ?ended_at:(ended_at_ : date_time option) ?status:(status_ : execution_preview_status option)
    ?status_message:(status_message_ : string_ option)
    ?execution_preview:(execution_preview_ : execution_preview option) () =
  ({
     execution_preview_id = execution_preview_id_;
     ended_at = ended_at_;
     status = status_;
     status_message = status_message_;
     execution_preview = execution_preview_;
   }
    : get_execution_preview_response)

let make_get_execution_preview_request
    ~execution_preview_id:(execution_preview_id_ : execution_preview_id) () =
  ({ execution_preview_id = execution_preview_id_ } : get_execution_preview_request)

let make_attachment_content ?name:(name_ : attachment_name option)
    ?size:(size_ : content_length option) ?hash:(hash_ : attachment_hash option)
    ?hash_type:(hash_type_ : attachment_hash_type option) ?url:(url_ : attachment_url option) () =
  ({ name = name_; size = size_; hash = hash_; hash_type = hash_type_; url = url_ }
    : attachment_content)

let make_get_document_request ?version_name:(version_name_ : document_version_name option)
    ?document_version:(document_version_ : document_version option)
    ?document_format:(document_format_ : document_format option) ~name:(name_ : document_ar_n) () =
  ({
     name = name_;
     version_name = version_name_;
     document_version = document_version_;
     document_format = document_format_;
   }
    : get_document_request)

let make_baseline_override ?operating_system:(operating_system_ : operating_system option)
    ?global_filters:(global_filters_ : patch_filter_group option)
    ?approval_rules:(approval_rules_ : patch_rule_group option)
    ?approved_patches:(approved_patches_ : patch_id_list option)
    ?approved_patches_compliance_level:
      (approved_patches_compliance_level_ : patch_compliance_level option)
    ?rejected_patches:(rejected_patches_ : patch_id_list option)
    ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
    ?approved_patches_enable_non_security:(approved_patches_enable_non_security_ : boolean_ option)
    ?sources:(sources_ : patch_source_list option)
    ?available_security_updates_compliance_status:
      (available_security_updates_compliance_status_ : patch_compliance_status option) () =
  ({
     operating_system = operating_system_;
     global_filters = global_filters_;
     approval_rules = approval_rules_;
     approved_patches = approved_patches_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     rejected_patches = rejected_patches_;
     rejected_patches_action = rejected_patches_action_;
     approved_patches_enable_non_security = approved_patches_enable_non_security_;
     sources = sources_;
     available_security_updates_compliance_status = available_security_updates_compliance_status_;
   }
    : baseline_override)

let make_get_deployable_patch_snapshot_for_instance_request
    ?baseline_override:(baseline_override_ : baseline_override option)
    ?use_s3_dual_stack_endpoint:(use_s3_dual_stack_endpoint_ : boolean_ option)
    ~instance_id:(instance_id_ : instance_id) ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({
     instance_id = instance_id_;
     snapshot_id = snapshot_id_;
     baseline_override = baseline_override_;
     use_s3_dual_stack_endpoint = use_s3_dual_stack_endpoint_;
   }
    : get_deployable_patch_snapshot_for_instance_request)

let make_get_default_patch_baseline_request
    ?operating_system:(operating_system_ : operating_system option) () =
  ({ operating_system = operating_system_ } : get_default_patch_baseline_request)

let make_get_connection_status_response ?target:(target_ : session_target option)
    ?status:(status_ : connection_status option) () =
  ({ target = target_; status = status_ } : get_connection_status_response)

let make_get_connection_status_request ~target:(target_ : session_target) () =
  ({ target = target_ } : get_connection_status_request)

let make_get_command_invocation_request ?plugin_name:(plugin_name_ : command_plugin_name option)
    ~command_id:(command_id_ : command_id) ~instance_id:(instance_id_ : instance_id) () =
  ({ command_id = command_id_; instance_id = instance_id_; plugin_name = plugin_name_ }
    : get_command_invocation_request)

let make_get_calendar_state_response ?state:(state_ : calendar_state option)
    ?at_time:(at_time_ : iso8601_string option)
    ?next_transition_time:(next_transition_time_ : iso8601_string option) () =
  ({ state = state_; at_time = at_time_; next_transition_time = next_transition_time_ }
    : get_calendar_state_response)

let make_get_calendar_state_request ?at_time:(at_time_ : iso8601_string option)
    ~calendar_names:(calendar_names_ : calendar_name_or_arn_list) () =
  ({ calendar_names = calendar_names_; at_time = at_time_ } : get_calendar_state_request)

let make_progress_counters ?total_steps:(total_steps_ : integer option)
    ?success_steps:(success_steps_ : integer option) ?failed_steps:(failed_steps_ : integer option)
    ?cancelled_steps:(cancelled_steps_ : integer option)
    ?timed_out_steps:(timed_out_steps_ : integer option) () =
  ({
     total_steps = total_steps_;
     success_steps = success_steps_;
     failed_steps = failed_steps_;
     cancelled_steps = cancelled_steps_;
     timed_out_steps = timed_out_steps_;
   }
    : progress_counters)

let make_resolved_targets ?parameter_values:(parameter_values_ : target_parameter_list option)
    ?truncated:(truncated_ : boolean_ option) () =
  ({ parameter_values = parameter_values_; truncated = truncated_ } : resolved_targets)

let make_parent_step_details ?step_execution_id:(step_execution_id_ : string_ option)
    ?step_name:(step_name_ : string_ option) ?action:(action_ : automation_action_name option)
    ?iteration:(iteration_ : integer option) ?iterator_value:(iterator_value_ : string_ option) () =
  ({
     step_execution_id = step_execution_id_;
     step_name = step_name_;
     action = action_;
     iteration = iteration_;
     iterator_value = iterator_value_;
   }
    : parent_step_details)

let make_failure_details ?failure_stage:(failure_stage_ : string_ option)
    ?failure_type:(failure_type_ : string_ option)
    ?details:(details_ : automation_parameter_map option) () =
  ({ failure_stage = failure_stage_; failure_type = failure_type_; details = details_ }
    : failure_details)

let make_step_execution ?step_name:(step_name_ : string_ option)
    ?action:(action_ : automation_action_name option)
    ?timeout_seconds:(timeout_seconds_ : long option) ?on_failure:(on_failure_ : string_ option)
    ?max_attempts:(max_attempts_ : integer option)
    ?execution_start_time:(execution_start_time_ : date_time option)
    ?execution_end_time:(execution_end_time_ : date_time option)
    ?step_status:(step_status_ : automation_execution_status option)
    ?response_code:(response_code_ : string_ option) ?inputs:(inputs_ : normal_string_map option)
    ?outputs:(outputs_ : automation_parameter_map option) ?response:(response_ : string_ option)
    ?failure_message:(failure_message_ : string_ option)
    ?failure_details:(failure_details_ : failure_details option)
    ?step_execution_id:(step_execution_id_ : string_ option)
    ?overridden_parameters:(overridden_parameters_ : automation_parameter_map option)
    ?is_end:(is_end_ : boolean_ option) ?next_step:(next_step_ : string_ option)
    ?is_critical:(is_critical_ : boolean_ option)
    ?valid_next_steps:(valid_next_steps_ : valid_next_step_list option)
    ?targets:(targets_ : targets option)
    ?target_location:(target_location_ : target_location option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
    ?parent_step_details:(parent_step_details_ : parent_step_details option) () =
  ({
     step_name = step_name_;
     action = action_;
     timeout_seconds = timeout_seconds_;
     on_failure = on_failure_;
     max_attempts = max_attempts_;
     execution_start_time = execution_start_time_;
     execution_end_time = execution_end_time_;
     step_status = step_status_;
     response_code = response_code_;
     inputs = inputs_;
     outputs = outputs_;
     response = response_;
     failure_message = failure_message_;
     failure_details = failure_details_;
     step_execution_id = step_execution_id_;
     overridden_parameters = overridden_parameters_;
     is_end = is_end_;
     next_step = next_step_;
     is_critical = is_critical_;
     valid_next_steps = valid_next_steps_;
     targets = targets_;
     target_location = target_location_;
     triggered_alarms = triggered_alarms_;
     parent_step_details = parent_step_details_;
   }
    : step_execution)

let make_automation_execution
    ?automation_execution_id:(automation_execution_id_ : automation_execution_id option)
    ?document_name:(document_name_ : document_name option)
    ?document_version:(document_version_ : document_version option)
    ?execution_start_time:(execution_start_time_ : date_time option)
    ?execution_end_time:(execution_end_time_ : date_time option)
    ?automation_execution_status:(automation_execution_status_ : automation_execution_status option)
    ?step_executions:(step_executions_ : step_execution_list option)
    ?step_executions_truncated:(step_executions_truncated_ : boolean_ option)
    ?parameters:(parameters_ : automation_parameter_map option)
    ?outputs:(outputs_ : automation_parameter_map option)
    ?failure_message:(failure_message_ : string_ option) ?mode:(mode_ : execution_mode option)
    ?parent_automation_execution_id:
      (parent_automation_execution_id_ : automation_execution_id option)
    ?executed_by:(executed_by_ : string_ option)
    ?current_step_name:(current_step_name_ : string_ option)
    ?current_action:(current_action_ : string_ option)
    ?target_parameter_name:(target_parameter_name_ : automation_parameter_key option)
    ?targets:(targets_ : targets option) ?target_maps:(target_maps_ : target_maps option)
    ?resolved_targets:(resolved_targets_ : resolved_targets option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option) ?target:(target_ : string_ option)
    ?target_locations:(target_locations_ : target_locations option)
    ?progress_counters:(progress_counters_ : progress_counters option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
    ?target_locations_ur_l:(target_locations_ur_l_ : target_locations_ur_l option)
    ?automation_subtype:(automation_subtype_ : automation_subtype option)
    ?scheduled_time:(scheduled_time_ : date_time option) ?runbooks:(runbooks_ : runbooks option)
    ?ops_item_id:(ops_item_id_ : string_ option) ?association_id:(association_id_ : string_ option)
    ?change_request_name:(change_request_name_ : change_request_name option)
    ?variables:(variables_ : automation_parameter_map option) () =
  ({
     automation_execution_id = automation_execution_id_;
     document_name = document_name_;
     document_version = document_version_;
     execution_start_time = execution_start_time_;
     execution_end_time = execution_end_time_;
     automation_execution_status = automation_execution_status_;
     step_executions = step_executions_;
     step_executions_truncated = step_executions_truncated_;
     parameters = parameters_;
     outputs = outputs_;
     failure_message = failure_message_;
     mode = mode_;
     parent_automation_execution_id = parent_automation_execution_id_;
     executed_by = executed_by_;
     current_step_name = current_step_name_;
     current_action = current_action_;
     target_parameter_name = target_parameter_name_;
     targets = targets_;
     target_maps = target_maps_;
     resolved_targets = resolved_targets_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     target = target_;
     target_locations = target_locations_;
     progress_counters = progress_counters_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
     target_locations_ur_l = target_locations_ur_l_;
     automation_subtype = automation_subtype_;
     scheduled_time = scheduled_time_;
     runbooks = runbooks_;
     ops_item_id = ops_item_id_;
     association_id = association_id_;
     change_request_name = change_request_name_;
     variables = variables_;
   }
    : automation_execution)

let make_get_automation_execution_request
    ~automation_execution_id:(automation_execution_id_ : automation_execution_id) () =
  ({ automation_execution_id = automation_execution_id_ } : get_automation_execution_request)

let make_credentials ~access_key_id:(access_key_id_ : access_key_id_type)
    ~secret_access_key:(secret_access_key_ : access_key_secret_type)
    ~session_token:(session_token_ : session_token_type)
    ~expiration_time:(expiration_time_ : date_time) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     session_token = session_token_;
     expiration_time = expiration_time_;
   }
    : credentials)

let make_get_access_token_response ?credentials:(credentials_ : credentials option)
    ?access_request_status:(access_request_status_ : access_request_status option) () =
  ({ credentials = credentials_; access_request_status = access_request_status_ }
    : get_access_token_response)

let make_get_access_token_request ~access_request_id:(access_request_id_ : access_request_id) () =
  ({ access_request_id = access_request_id_ } : get_access_token_request)

let make_disassociate_ops_item_related_item_response () = (() : unit)

let make_disassociate_ops_item_related_item_request ~ops_item_id:(ops_item_id_ : ops_item_id)
    ~association_id:(association_id_ : ops_item_related_item_association_id) () =
  ({ ops_item_id = ops_item_id_; association_id = association_id_ }
    : disassociate_ops_item_related_item_request)

let make_session_manager_output_url
    ?s3_output_url:(s3_output_url_ : session_manager_s3_output_url option)
    ?cloud_watch_output_url:
      (cloud_watch_output_url_ : session_manager_cloud_watch_output_url option) () =
  ({ s3_output_url = s3_output_url_; cloud_watch_output_url = cloud_watch_output_url_ }
    : session_manager_output_url)

let make_session ?session_id:(session_id_ : session_id option)
    ?target:(target_ : session_target option) ?status:(status_ : session_status option)
    ?start_date:(start_date_ : date_time option) ?end_date:(end_date_ : date_time option)
    ?document_name:(document_name_ : document_name option) ?owner:(owner_ : session_owner option)
    ?reason:(reason_ : session_reason option) ?details:(details_ : session_details option)
    ?output_url:(output_url_ : session_manager_output_url option)
    ?max_session_duration:(max_session_duration_ : max_session_duration option)
    ?access_type:(access_type_ : access_type option) () =
  ({
     session_id = session_id_;
     target = target_;
     status = status_;
     start_date = start_date_;
     end_date = end_date_;
     document_name = document_name_;
     owner = owner_;
     reason = reason_;
     details = details_;
     output_url = output_url_;
     max_session_duration = max_session_duration_;
     access_type = access_type_;
   }
    : session)

let make_describe_sessions_response ?sessions:(sessions_ : session_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ sessions = sessions_; next_token = next_token_ } : describe_sessions_response)

let make_session_filter ~key:(key_ : session_filter_key) ~value:(value_ : session_filter_value) () =
  ({ key = key_; value = value_ } : session_filter)

let make_describe_sessions_request ?max_results:(max_results_ : session_max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : session_filter_list option)
    ~state:(state_ : session_state) () =
  ({ state = state_; max_results = max_results_; next_token = next_token_; filters = filters_ }
    : describe_sessions_request)

let make_describe_patch_properties_request ?patch_set:(patch_set_ : patch_set option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~operating_system:(operating_system_ : operating_system) ~property:(property_ : patch_property)
    () =
  ({
     operating_system = operating_system_;
     property = property_;
     patch_set = patch_set_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_patch_properties_request)

let make_describe_patch_group_state_request ~patch_group:(patch_group_ : patch_group) () =
  ({ patch_group = patch_group_ } : describe_patch_group_state_request)

let make_patch_baseline_identity ?baseline_id:(baseline_id_ : baseline_id option)
    ?baseline_name:(baseline_name_ : baseline_name option)
    ?operating_system:(operating_system_ : operating_system option)
    ?baseline_description:(baseline_description_ : baseline_description option)
    ?default_baseline:(default_baseline_ : default_baseline option) () =
  ({
     baseline_id = baseline_id_;
     baseline_name = baseline_name_;
     operating_system = operating_system_;
     baseline_description = baseline_description_;
     default_baseline = default_baseline_;
   }
    : patch_baseline_identity)

let make_patch_group_patch_baseline_mapping ?patch_group:(patch_group_ : patch_group option)
    ?baseline_identity:(baseline_identity_ : patch_baseline_identity option) () =
  ({ patch_group = patch_group_; baseline_identity = baseline_identity_ }
    : patch_group_patch_baseline_mapping)

let make_patch_orchestrator_filter ?key:(key_ : patch_orchestrator_filter_key option)
    ?values:(values_ : patch_orchestrator_filter_values option) () =
  ({ key = key_; values = values_ } : patch_orchestrator_filter)

let make_describe_patch_groups_request
    ?max_results:(max_results_ : patch_baseline_max_results option)
    ?filters:(filters_ : patch_orchestrator_filter_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; filters = filters_; next_token = next_token_ }
    : describe_patch_groups_request)

let make_describe_patch_baselines_request
    ?filters:(filters_ : patch_orchestrator_filter_list option)
    ?max_results:(max_results_ : patch_baseline_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_patch_baselines_request)

let make_parameter_metadata ?name:(name_ : ps_parameter_name option) ?ar_n:(ar_n_ : string_ option)
    ?type_:(type__ : parameter_type option) ?key_id:(key_id_ : parameter_key_id option)
    ?last_modified_date:(last_modified_date_ : date_time option)
    ?last_modified_user:(last_modified_user_ : string_ option)
    ?description:(description_ : parameter_description option)
    ?allowed_pattern:(allowed_pattern_ : allowed_pattern option)
    ?version:(version_ : ps_parameter_version option) ?tier:(tier_ : parameter_tier option)
    ?policies:(policies_ : parameter_policy_list option)
    ?data_type:(data_type_ : parameter_data_type option) () =
  ({
     name = name_;
     ar_n = ar_n_;
     type_ = type__;
     key_id = key_id_;
     last_modified_date = last_modified_date_;
     last_modified_user = last_modified_user_;
     description = description_;
     allowed_pattern = allowed_pattern_;
     version = version_;
     tier = tier_;
     policies = policies_;
     data_type = data_type_;
   }
    : parameter_metadata)

let make_parameters_filter ~key:(key_ : parameters_filter_key)
    ~values:(values_ : parameters_filter_value_list) () =
  ({ key = key_; values = values_ } : parameters_filter)

let make_describe_parameters_request ?filters:(filters_ : parameters_filter_list option)
    ?parameter_filters:(parameter_filters_ : parameter_string_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?shared:(shared_ : boolean_ option) () =
  ({
     filters = filters_;
     parameter_filters = parameter_filters_;
     max_results = max_results_;
     next_token = next_token_;
     shared = shared_;
   }
    : describe_parameters_request)

let make_ops_item_summary ?created_by:(created_by_ : string_ option)
    ?created_time:(created_time_ : date_time option)
    ?last_modified_by:(last_modified_by_ : string_ option)
    ?last_modified_time:(last_modified_time_ : date_time option)
    ?priority:(priority_ : ops_item_priority option) ?source:(source_ : ops_item_source option)
    ?status:(status_ : ops_item_status option) ?ops_item_id:(ops_item_id_ : ops_item_id option)
    ?title:(title_ : ops_item_title option)
    ?operational_data:(operational_data_ : ops_item_operational_data option)
    ?category:(category_ : ops_item_category option)
    ?severity:(severity_ : ops_item_severity option)
    ?ops_item_type:(ops_item_type_ : ops_item_type option)
    ?actual_start_time:(actual_start_time_ : date_time option)
    ?actual_end_time:(actual_end_time_ : date_time option)
    ?planned_start_time:(planned_start_time_ : date_time option)
    ?planned_end_time:(planned_end_time_ : date_time option) () =
  ({
     created_by = created_by_;
     created_time = created_time_;
     last_modified_by = last_modified_by_;
     last_modified_time = last_modified_time_;
     priority = priority_;
     source = source_;
     status = status_;
     ops_item_id = ops_item_id_;
     title = title_;
     operational_data = operational_data_;
     category = category_;
     severity = severity_;
     ops_item_type = ops_item_type_;
     actual_start_time = actual_start_time_;
     actual_end_time = actual_end_time_;
     planned_start_time = planned_start_time_;
     planned_end_time = planned_end_time_;
   }
    : ops_item_summary)

let make_describe_ops_items_response ?next_token:(next_token_ : string_ option)
    ?ops_item_summaries:(ops_item_summaries_ : ops_item_summaries option) () =
  ({ next_token = next_token_; ops_item_summaries = ops_item_summaries_ }
    : describe_ops_items_response)

let make_ops_item_filter ~key:(key_ : ops_item_filter_key)
    ~values:(values_ : ops_item_filter_values) ~operator:(operator_ : ops_item_filter_operator) () =
  ({ key = key_; values = values_; operator = operator_ } : ops_item_filter)

let make_describe_ops_items_request ?ops_item_filters:(ops_item_filters_ : ops_item_filters option)
    ?max_results:(max_results_ : ops_item_max_results option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ops_item_filters = ops_item_filters_; max_results = max_results_; next_token = next_token_ }
    : describe_ops_items_request)

let make_maintenance_window_task ?window_id:(window_id_ : maintenance_window_id option)
    ?window_task_id:(window_task_id_ : maintenance_window_task_id option)
    ?task_arn:(task_arn_ : maintenance_window_task_arn option)
    ?type_:(type__ : maintenance_window_task_type option) ?targets:(targets_ : targets option)
    ?task_parameters:(task_parameters_ : maintenance_window_task_parameters option)
    ?priority:(priority_ : maintenance_window_task_priority option)
    ?logging_info:(logging_info_ : logging_info option)
    ?service_role_arn:(service_role_arn_ : service_role option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option) ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?cutoff_behavior:(cutoff_behavior_ : maintenance_window_task_cutoff_behavior option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) () =
  ({
     window_id = window_id_;
     window_task_id = window_task_id_;
     task_arn = task_arn_;
     type_ = type__;
     targets = targets_;
     task_parameters = task_parameters_;
     priority = priority_;
     logging_info = logging_info_;
     service_role_arn = service_role_arn_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     name = name_;
     description = description_;
     cutoff_behavior = cutoff_behavior_;
     alarm_configuration = alarm_configuration_;
   }
    : maintenance_window_task)

let make_maintenance_window_filter ?key:(key_ : maintenance_window_filter_key option)
    ?values:(values_ : maintenance_window_filter_values option) () =
  ({ key = key_; values = values_ } : maintenance_window_filter)

let make_describe_maintenance_window_tasks_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option) ~window_id:(window_id_ : maintenance_window_id) ()
    =
  ({
     window_id = window_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_tasks_request)

let make_maintenance_window_target ?window_id:(window_id_ : maintenance_window_id option)
    ?window_target_id:(window_target_id_ : maintenance_window_target_id option)
    ?resource_type:(resource_type_ : maintenance_window_resource_type option)
    ?targets:(targets_ : targets option)
    ?owner_information:(owner_information_ : owner_information option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option) () =
  ({
     window_id = window_id_;
     window_target_id = window_target_id_;
     resource_type = resource_type_;
     targets = targets_;
     owner_information = owner_information_;
     name = name_;
     description = description_;
   }
    : maintenance_window_target)

let make_describe_maintenance_window_targets_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option) ~window_id:(window_id_ : maintenance_window_id) ()
    =
  ({
     window_id = window_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_targets_request)

let make_maintenance_window_identity_for_target
    ?window_id:(window_id_ : maintenance_window_id option)
    ?name:(name_ : maintenance_window_name option) () =
  ({ window_id = window_id_; name = name_ } : maintenance_window_identity_for_target)

let make_describe_maintenance_windows_for_target_request
    ?max_results:(max_results_ : maintenance_window_search_max_results option)
    ?next_token:(next_token_ : next_token option) ~targets:(targets_ : targets)
    ~resource_type:(resource_type_ : maintenance_window_resource_type) () =
  ({
     targets = targets_;
     resource_type = resource_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_windows_for_target_request)

let make_scheduled_window_execution ?window_id:(window_id_ : maintenance_window_id option)
    ?name:(name_ : maintenance_window_name option)
    ?execution_time:(execution_time_ : maintenance_window_string_date_time option) () =
  ({ window_id = window_id_; name = name_; execution_time = execution_time_ }
    : scheduled_window_execution)

let make_describe_maintenance_window_schedule_request
    ?window_id:(window_id_ : maintenance_window_id option) ?targets:(targets_ : targets option)
    ?resource_type:(resource_type_ : maintenance_window_resource_type option)
    ?filters:(filters_ : patch_orchestrator_filter_list option)
    ?max_results:(max_results_ : maintenance_window_search_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     window_id = window_id_;
     targets = targets_;
     resource_type = resource_type_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_schedule_request)

let make_maintenance_window_identity ?window_id:(window_id_ : maintenance_window_id option)
    ?name:(name_ : maintenance_window_name option)
    ?description:(description_ : maintenance_window_description option)
    ?enabled:(enabled_ : maintenance_window_enabled option)
    ?duration:(duration_ : maintenance_window_duration_hours option)
    ?cutoff:(cutoff_ : maintenance_window_cutoff option)
    ?schedule:(schedule_ : maintenance_window_schedule option)
    ?schedule_timezone:(schedule_timezone_ : maintenance_window_timezone option)
    ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
    ?end_date:(end_date_ : maintenance_window_string_date_time option)
    ?start_date:(start_date_ : maintenance_window_string_date_time option)
    ?next_execution_time:(next_execution_time_ : maintenance_window_string_date_time option) () =
  ({
     window_id = window_id_;
     name = name_;
     description = description_;
     enabled = enabled_;
     duration = duration_;
     cutoff = cutoff_;
     schedule = schedule_;
     schedule_timezone = schedule_timezone_;
     schedule_offset = schedule_offset_;
     end_date = end_date_;
     start_date = start_date_;
     next_execution_time = next_execution_time_;
   }
    : maintenance_window_identity)

let make_describe_maintenance_windows_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_maintenance_windows_request)

let make_maintenance_window_execution_task_identity
    ?window_execution_id:(window_execution_id_ : maintenance_window_execution_id option)
    ?task_execution_id:(task_execution_id_ : maintenance_window_execution_task_id option)
    ?status:(status_ : maintenance_window_execution_status option)
    ?status_details:(status_details_ : maintenance_window_execution_status_details option)
    ?start_time:(start_time_ : date_time option) ?end_time:(end_time_ : date_time option)
    ?task_arn:(task_arn_ : maintenance_window_task_arn option)
    ?task_type:(task_type_ : maintenance_window_task_type option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option) () =
  ({
     window_execution_id = window_execution_id_;
     task_execution_id = task_execution_id_;
     status = status_;
     status_details = status_details_;
     start_time = start_time_;
     end_time = end_time_;
     task_arn = task_arn_;
     task_type = task_type_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
   }
    : maintenance_window_execution_task_identity)

let make_describe_maintenance_window_execution_tasks_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id) () =
  ({
     window_execution_id = window_execution_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_execution_tasks_request)

let make_maintenance_window_execution_task_invocation_identity
    ?window_execution_id:(window_execution_id_ : maintenance_window_execution_id option)
    ?task_execution_id:(task_execution_id_ : maintenance_window_execution_task_id option)
    ?invocation_id:(invocation_id_ : maintenance_window_execution_task_invocation_id option)
    ?execution_id:(execution_id_ : maintenance_window_execution_task_execution_id option)
    ?task_type:(task_type_ : maintenance_window_task_type option)
    ?parameters:(parameters_ : maintenance_window_execution_task_invocation_parameters option)
    ?status:(status_ : maintenance_window_execution_status option)
    ?status_details:(status_details_ : maintenance_window_execution_status_details option)
    ?start_time:(start_time_ : date_time option) ?end_time:(end_time_ : date_time option)
    ?owner_information:(owner_information_ : owner_information option)
    ?window_target_id:(window_target_id_ : maintenance_window_task_target_id option) () =
  ({
     window_execution_id = window_execution_id_;
     task_execution_id = task_execution_id_;
     invocation_id = invocation_id_;
     execution_id = execution_id_;
     task_type = task_type_;
     parameters = parameters_;
     status = status_;
     status_details = status_details_;
     start_time = start_time_;
     end_time = end_time_;
     owner_information = owner_information_;
     window_target_id = window_target_id_;
   }
    : maintenance_window_execution_task_invocation_identity)

let make_describe_maintenance_window_execution_task_invocations_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id)
    ~task_id:(task_id_ : maintenance_window_execution_task_id) () =
  ({
     window_execution_id = window_execution_id_;
     task_id = task_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_execution_task_invocations_request)

let make_maintenance_window_execution ?window_id:(window_id_ : maintenance_window_id option)
    ?window_execution_id:(window_execution_id_ : maintenance_window_execution_id option)
    ?status:(status_ : maintenance_window_execution_status option)
    ?status_details:(status_details_ : maintenance_window_execution_status_details option)
    ?start_time:(start_time_ : date_time option) ?end_time:(end_time_ : date_time option) () =
  ({
     window_id = window_id_;
     window_execution_id = window_execution_id_;
     status = status_;
     status_details = status_details_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : maintenance_window_execution)

let make_describe_maintenance_window_executions_request
    ?filters:(filters_ : maintenance_window_filter_list option)
    ?max_results:(max_results_ : maintenance_window_max_results option)
    ?next_token:(next_token_ : next_token option) ~window_id:(window_id_ : maintenance_window_id) ()
    =
  ({
     window_id = window_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_maintenance_window_executions_request)

let make_inventory_deletion_summary_item ?version:(version_ : inventory_item_schema_version option)
    ?count:(count_ : resource_count option)
    ?remaining_count:(remaining_count_ : remaining_count option) () =
  ({ version = version_; count = count_; remaining_count = remaining_count_ }
    : inventory_deletion_summary_item)

let make_inventory_deletion_summary ?total_count:(total_count_ : total_count option)
    ?remaining_count:(remaining_count_ : remaining_count option)
    ?summary_items:(summary_items_ : inventory_deletion_summary_items option) () =
  ({
     total_count = total_count_;
     remaining_count = remaining_count_;
     summary_items = summary_items_;
   }
    : inventory_deletion_summary)

let make_inventory_deletion_status_item ?deletion_id:(deletion_id_ : uui_d option)
    ?type_name:(type_name_ : inventory_item_type_name option)
    ?deletion_start_time:(deletion_start_time_ : inventory_deletion_start_time option)
    ?last_status:(last_status_ : inventory_deletion_status option)
    ?last_status_message:(last_status_message_ : inventory_deletion_last_status_message option)
    ?deletion_summary:(deletion_summary_ : inventory_deletion_summary option)
    ?last_status_update_time:
      (last_status_update_time_ : inventory_deletion_last_status_update_time option) () =
  ({
     deletion_id = deletion_id_;
     type_name = type_name_;
     deletion_start_time = deletion_start_time_;
     last_status = last_status_;
     last_status_message = last_status_message_;
     deletion_summary = deletion_summary_;
     last_status_update_time = last_status_update_time_;
   }
    : inventory_deletion_status_item)

let make_describe_inventory_deletions_request ?deletion_id:(deletion_id_ : uui_d option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ deletion_id = deletion_id_; next_token = next_token_; max_results = max_results_ }
    : describe_inventory_deletions_request)

let make_instance_aggregated_association_overview
    ?detailed_status:(detailed_status_ : status_name option)
    ?instance_association_status_aggregated_count:
      (instance_association_status_aggregated_count_ :
         instance_association_status_aggregated_count option) () =
  ({
     detailed_status = detailed_status_;
     instance_association_status_aggregated_count = instance_association_status_aggregated_count_;
   }
    : instance_aggregated_association_overview)

let make_instance_property ?name:(name_ : instance_name option)
    ?instance_id:(instance_id_ : instance_id option)
    ?instance_type:(instance_type_ : instance_type option)
    ?instance_role:(instance_role_ : instance_role option) ?key_name:(key_name_ : key_name option)
    ?instance_state:(instance_state_ : instance_state option)
    ?architecture:(architecture_ : architecture option)
    ?ip_address:(ip_address_ : ip_address option) ?launch_time:(launch_time_ : date_time option)
    ?ping_status:(ping_status_ : ping_status option)
    ?last_ping_date_time:(last_ping_date_time_ : date_time option)
    ?agent_version:(agent_version_ : version option)
    ?platform_type:(platform_type_ : platform_type option)
    ?platform_name:(platform_name_ : platform_name option)
    ?platform_version:(platform_version_ : platform_version option)
    ?activation_id:(activation_id_ : activation_id option) ?iam_role:(iam_role_ : iam_role option)
    ?registration_date:(registration_date_ : date_time option)
    ?resource_type:(resource_type_ : string_ option)
    ?computer_name:(computer_name_ : computer_name option)
    ?association_status:(association_status_ : status_name option)
    ?last_association_execution_date:(last_association_execution_date_ : date_time option)
    ?last_successful_association_execution_date:
      (last_successful_association_execution_date_ : date_time option)
    ?association_overview:(association_overview_ : instance_aggregated_association_overview option)
    ?source_id:(source_id_ : source_id option) ?source_type:(source_type_ : source_type option) () =
  ({
     name = name_;
     instance_id = instance_id_;
     instance_type = instance_type_;
     instance_role = instance_role_;
     key_name = key_name_;
     instance_state = instance_state_;
     architecture = architecture_;
     ip_address = ip_address_;
     launch_time = launch_time_;
     ping_status = ping_status_;
     last_ping_date_time = last_ping_date_time_;
     agent_version = agent_version_;
     platform_type = platform_type_;
     platform_name = platform_name_;
     platform_version = platform_version_;
     activation_id = activation_id_;
     iam_role = iam_role_;
     registration_date = registration_date_;
     resource_type = resource_type_;
     computer_name = computer_name_;
     association_status = association_status_;
     last_association_execution_date = last_association_execution_date_;
     last_successful_association_execution_date = last_successful_association_execution_date_;
     association_overview = association_overview_;
     source_id = source_id_;
     source_type = source_type_;
   }
    : instance_property)

let make_instance_property_string_filter
    ?operator:(operator_ : instance_property_filter_operator option)
    ~key:(key_ : instance_property_string_filter_key)
    ~values:(values_ : instance_property_filter_value_set) () =
  ({ key = key_; values = values_; operator = operator_ } : instance_property_string_filter)

let make_instance_property_filter ~key:(key_ : instance_property_filter_key)
    ~value_set:(value_set_ : instance_property_filter_value_set) () =
  ({ key = key_; value_set = value_set_ } : instance_property_filter)

let make_describe_instance_properties_request
    ?instance_property_filter_list:
      (instance_property_filter_list_ : instance_property_filter_list option)
    ?filters_with_operator:(filters_with_operator_ : instance_property_string_filter_list option)
    ?max_results:(max_results_ : describe_instance_properties_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     instance_property_filter_list = instance_property_filter_list_;
     filters_with_operator = filters_with_operator_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_instance_properties_request)

let make_instance_patch_state ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?install_override_list:(install_override_list_ : install_override_list option)
    ?owner_information:(owner_information_ : owner_information option)
    ?installed_count:(installed_count_ : patch_installed_count option)
    ?installed_other_count:(installed_other_count_ : patch_installed_other_count option)
    ?installed_pending_reboot_count:
      (installed_pending_reboot_count_ : patch_installed_pending_reboot_count option)
    ?installed_rejected_count:(installed_rejected_count_ : patch_installed_rejected_count option)
    ?missing_count:(missing_count_ : patch_missing_count option)
    ?failed_count:(failed_count_ : patch_failed_count option)
    ?unreported_not_applicable_count:
      (unreported_not_applicable_count_ : patch_unreported_not_applicable_count option)
    ?not_applicable_count:(not_applicable_count_ : patch_not_applicable_count option)
    ?available_security_update_count:
      (available_security_update_count_ : patch_available_security_update_count option)
    ?last_no_reboot_install_operation_time:
      (last_no_reboot_install_operation_time_ : date_time option)
    ?reboot_option:(reboot_option_ : reboot_option option)
    ?critical_non_compliant_count:
      (critical_non_compliant_count_ : patch_critical_non_compliant_count option)
    ?security_non_compliant_count:
      (security_non_compliant_count_ : patch_security_non_compliant_count option)
    ?other_non_compliant_count:(other_non_compliant_count_ : patch_other_non_compliant_count option)
    ~instance_id:(instance_id_ : instance_id) ~patch_group:(patch_group_ : patch_group)
    ~baseline_id:(baseline_id_ : baseline_id)
    ~operation_start_time:(operation_start_time_ : date_time)
    ~operation_end_time:(operation_end_time_ : date_time)
    ~operation:(operation_ : patch_operation_type) () =
  ({
     instance_id = instance_id_;
     patch_group = patch_group_;
     baseline_id = baseline_id_;
     snapshot_id = snapshot_id_;
     install_override_list = install_override_list_;
     owner_information = owner_information_;
     installed_count = installed_count_;
     installed_other_count = installed_other_count_;
     installed_pending_reboot_count = installed_pending_reboot_count_;
     installed_rejected_count = installed_rejected_count_;
     missing_count = missing_count_;
     failed_count = failed_count_;
     unreported_not_applicable_count = unreported_not_applicable_count_;
     not_applicable_count = not_applicable_count_;
     available_security_update_count = available_security_update_count_;
     operation_start_time = operation_start_time_;
     operation_end_time = operation_end_time_;
     operation = operation_;
     last_no_reboot_install_operation_time = last_no_reboot_install_operation_time_;
     reboot_option = reboot_option_;
     critical_non_compliant_count = critical_non_compliant_count_;
     security_non_compliant_count = security_non_compliant_count_;
     other_non_compliant_count = other_non_compliant_count_;
   }
    : instance_patch_state)

let make_instance_patch_state_filter ~key:(key_ : instance_patch_state_filter_key)
    ~values:(values_ : instance_patch_state_filter_values)
    ~type_:(type__ : instance_patch_state_operator_type) () =
  ({ key = key_; values = values_; type_ = type__ } : instance_patch_state_filter)

let make_describe_instance_patch_states_for_patch_group_request
    ?filters:(filters_ : instance_patch_state_filter_list option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : patch_compliance_max_results option)
    ~patch_group:(patch_group_ : patch_group) () =
  ({
     patch_group = patch_group_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_instance_patch_states_for_patch_group_request)

let make_describe_instance_patch_states_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : patch_compliance_max_results option)
    ~instance_ids:(instance_ids_ : instance_id_list) () =
  ({ instance_ids = instance_ids_; next_token = next_token_; max_results = max_results_ }
    : describe_instance_patch_states_request)

let make_patch_compliance_data ?cve_ids:(cve_ids_ : patch_cve_ids option)
    ~title:(title_ : patch_title) ~kb_id:(kb_id_ : patch_kb_number)
    ~classification:(classification_ : patch_classification) ~severity:(severity_ : patch_severity)
    ~state:(state_ : patch_compliance_data_state) ~installed_time:(installed_time_ : date_time) () =
  ({
     title = title_;
     kb_id = kb_id_;
     classification = classification_;
     severity = severity_;
     state = state_;
     installed_time = installed_time_;
     cve_ids = cve_ids_;
   }
    : patch_compliance_data)

let make_describe_instance_patches_request
    ?filters:(filters_ : patch_orchestrator_filter_list option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : patch_compliance_max_results option)
    ~instance_id:(instance_id_ : instance_id) () =
  ({
     instance_id = instance_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_instance_patches_request)

let make_instance_information ?instance_id:(instance_id_ : instance_id option)
    ?ping_status:(ping_status_ : ping_status option)
    ?last_ping_date_time:(last_ping_date_time_ : date_time option)
    ?agent_version:(agent_version_ : version option)
    ?is_latest_version:(is_latest_version_ : boolean_ option)
    ?platform_type:(platform_type_ : platform_type option)
    ?platform_name:(platform_name_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?activation_id:(activation_id_ : activation_id option) ?iam_role:(iam_role_ : iam_role option)
    ?registration_date:(registration_date_ : date_time option)
    ?resource_type:(resource_type_ : resource_type option) ?name:(name_ : string_ option)
    ?ip_address:(ip_address_ : ip_address option)
    ?computer_name:(computer_name_ : computer_name option)
    ?association_status:(association_status_ : status_name option)
    ?last_association_execution_date:(last_association_execution_date_ : date_time option)
    ?last_successful_association_execution_date:
      (last_successful_association_execution_date_ : date_time option)
    ?association_overview:(association_overview_ : instance_aggregated_association_overview option)
    ?source_id:(source_id_ : source_id option) ?source_type:(source_type_ : source_type option) () =
  ({
     instance_id = instance_id_;
     ping_status = ping_status_;
     last_ping_date_time = last_ping_date_time_;
     agent_version = agent_version_;
     is_latest_version = is_latest_version_;
     platform_type = platform_type_;
     platform_name = platform_name_;
     platform_version = platform_version_;
     activation_id = activation_id_;
     iam_role = iam_role_;
     registration_date = registration_date_;
     resource_type = resource_type_;
     name = name_;
     ip_address = ip_address_;
     computer_name = computer_name_;
     association_status = association_status_;
     last_association_execution_date = last_association_execution_date_;
     last_successful_association_execution_date = last_successful_association_execution_date_;
     association_overview = association_overview_;
     source_id = source_id_;
     source_type = source_type_;
   }
    : instance_information)

let make_instance_information_string_filter ~key:(key_ : instance_information_string_filter_key)
    ~values:(values_ : instance_information_filter_value_set) () =
  ({ key = key_; values = values_ } : instance_information_string_filter)

let make_instance_information_filter ~key:(key_ : instance_information_filter_key)
    ~value_set:(value_set_ : instance_information_filter_value_set) () =
  ({ key = key_; value_set = value_set_ } : instance_information_filter)

let make_describe_instance_information_request
    ?instance_information_filter_list:
      (instance_information_filter_list_ : instance_information_filter_list option)
    ?filters:(filters_ : instance_information_string_filter_list option)
    ?max_results:(max_results_ : max_results_ec2_compatible option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     instance_information_filter_list = instance_information_filter_list_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_instance_information_request)

let make_s3_output_url ?output_url:(output_url_ : url option) () =
  ({ output_url = output_url_ } : s3_output_url)

let make_instance_association_output_url ?s3_output_url:(s3_output_url_ : s3_output_url option) () =
  ({ s3_output_url = s3_output_url_ } : instance_association_output_url)

let make_instance_association_status_info ?association_id:(association_id_ : association_id option)
    ?name:(name_ : document_ar_n option)
    ?document_version:(document_version_ : document_version option)
    ?association_version:(association_version_ : association_version option)
    ?instance_id:(instance_id_ : instance_id option)
    ?execution_date:(execution_date_ : date_time option) ?status:(status_ : status_name option)
    ?detailed_status:(detailed_status_ : status_name option)
    ?execution_summary:(execution_summary_ : instance_association_execution_summary option)
    ?error_code:(error_code_ : agent_error_code option)
    ?output_url:(output_url_ : instance_association_output_url option)
    ?association_name:(association_name_ : association_name option) () =
  ({
     association_id = association_id_;
     name = name_;
     document_version = document_version_;
     association_version = association_version_;
     instance_id = instance_id_;
     execution_date = execution_date_;
     status = status_;
     detailed_status = detailed_status_;
     execution_summary = execution_summary_;
     error_code = error_code_;
     output_url = output_url_;
     association_name = association_name_;
   }
    : instance_association_status_info)

let make_describe_instance_associations_status_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~instance_id:(instance_id_ : instance_id) () =
  ({ instance_id = instance_id_; max_results = max_results_; next_token = next_token_ }
    : describe_instance_associations_status_request)

let make_patch_status ?deployment_status:(deployment_status_ : patch_deployment_status option)
    ?compliance_level:(compliance_level_ : patch_compliance_level option)
    ?approval_date:(approval_date_ : date_time option) () =
  ({
     deployment_status = deployment_status_;
     compliance_level = compliance_level_;
     approval_date = approval_date_;
   }
    : patch_status)

let make_patch ?id:(id_ : patch_id option) ?release_date:(release_date_ : date_time option)
    ?title:(title_ : patch_title option) ?description:(description_ : patch_description option)
    ?content_url:(content_url_ : patch_content_url option) ?vendor:(vendor_ : patch_vendor option)
    ?product_family:(product_family_ : patch_product_family option)
    ?product:(product_ : patch_product option)
    ?classification:(classification_ : patch_classification option)
    ?msrc_severity:(msrc_severity_ : patch_msrc_severity option)
    ?kb_number:(kb_number_ : patch_kb_number option)
    ?msrc_number:(msrc_number_ : patch_msrc_number option)
    ?language:(language_ : patch_language option)
    ?advisory_ids:(advisory_ids_ : patch_advisory_id_list option)
    ?bugzilla_ids:(bugzilla_ids_ : patch_bugzilla_id_list option)
    ?cve_ids:(cve_ids_ : patch_cve_id_list option) ?name:(name_ : patch_name option)
    ?epoch:(epoch_ : patch_epoch option) ?version:(version_ : patch_version option)
    ?release:(release_ : patch_release option) ?arch:(arch_ : patch_arch option)
    ?severity:(severity_ : patch_severity option)
    ?repository:(repository_ : patch_repository option) () =
  ({
     id = id_;
     release_date = release_date_;
     title = title_;
     description = description_;
     content_url = content_url_;
     vendor = vendor_;
     product_family = product_family_;
     product = product_;
     classification = classification_;
     msrc_severity = msrc_severity_;
     kb_number = kb_number_;
     msrc_number = msrc_number_;
     language = language_;
     advisory_ids = advisory_ids_;
     bugzilla_ids = bugzilla_ids_;
     cve_ids = cve_ids_;
     name = name_;
     epoch = epoch_;
     version = version_;
     release = release_;
     arch = arch_;
     severity = severity_;
     repository = repository_;
   }
    : patch)

let make_effective_patch ?patch:(patch_ : patch option)
    ?patch_status:(patch_status_ : patch_status option) () =
  ({ patch = patch_; patch_status = patch_status_ } : effective_patch)

let make_describe_effective_patches_for_patch_baseline_request
    ?max_results:(max_results_ : patch_baseline_max_results option)
    ?next_token:(next_token_ : next_token option) ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_; max_results = max_results_; next_token = next_token_ }
    : describe_effective_patches_for_patch_baseline_request)

let make_instance_association ?association_id:(association_id_ : association_id option)
    ?instance_id:(instance_id_ : instance_id option) ?content:(content_ : document_content option)
    ?association_version:(association_version_ : association_version option) () =
  ({
     association_id = association_id_;
     instance_id = instance_id_;
     content = content_;
     association_version = association_version_;
   }
    : instance_association)

let make_describe_effective_instance_associations_request
    ?max_results:(max_results_ : effective_instance_association_max_results option)
    ?next_token:(next_token_ : next_token option) ~instance_id:(instance_id_ : instance_id) () =
  ({ instance_id = instance_id_; max_results = max_results_; next_token = next_token_ }
    : describe_effective_instance_associations_request)

let make_describe_document_permission_response ?account_ids:(account_ids_ : account_id_list option)
    ?account_sharing_info_list:(account_sharing_info_list_ : account_sharing_info_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     account_ids = account_ids_;
     account_sharing_info_list = account_sharing_info_list_;
     next_token = next_token_;
   }
    : describe_document_permission_response)

let make_describe_document_permission_request
    ?max_results:(max_results_ : document_permission_max_results option)
    ?next_token:(next_token_ : next_token option) ~name:(name_ : document_name)
    ~permission_type:(permission_type_ : document_permission_type) () =
  ({
     name = name_;
     permission_type = permission_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_document_permission_request)

let make_describe_document_request ?document_version:(document_version_ : document_version option)
    ?version_name:(version_name_ : document_version_name option) ~name:(name_ : document_ar_n) () =
  ({ name = name_; document_version = document_version_; version_name = version_name_ }
    : describe_document_request)

let make_describe_available_patches_request
    ?filters:(filters_ : patch_orchestrator_filter_list option)
    ?max_results:(max_results_ : patch_baseline_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_available_patches_request)

let make_step_execution_filter ~key:(key_ : step_execution_filter_key)
    ~values:(values_ : step_execution_filter_value_list) () =
  ({ key = key_; values = values_ } : step_execution_filter)

let make_describe_automation_step_executions_request
    ?filters:(filters_ : step_execution_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?reverse_order:(reverse_order_ : boolean_ option)
    ~automation_execution_id:(automation_execution_id_ : automation_execution_id) () =
  ({
     automation_execution_id = automation_execution_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     reverse_order = reverse_order_;
   }
    : describe_automation_step_executions_request)

let make_automation_execution_metadata
    ?automation_execution_id:(automation_execution_id_ : automation_execution_id option)
    ?document_name:(document_name_ : document_name option)
    ?document_version:(document_version_ : document_version option)
    ?automation_execution_status:(automation_execution_status_ : automation_execution_status option)
    ?execution_start_time:(execution_start_time_ : date_time option)
    ?execution_end_time:(execution_end_time_ : date_time option)
    ?executed_by:(executed_by_ : string_ option) ?log_file:(log_file_ : string_ option)
    ?outputs:(outputs_ : automation_parameter_map option) ?mode:(mode_ : execution_mode option)
    ?parent_automation_execution_id:
      (parent_automation_execution_id_ : automation_execution_id option)
    ?current_step_name:(current_step_name_ : string_ option)
    ?current_action:(current_action_ : string_ option)
    ?failure_message:(failure_message_ : string_ option)
    ?target_parameter_name:(target_parameter_name_ : automation_parameter_key option)
    ?targets:(targets_ : targets option) ?target_maps:(target_maps_ : target_maps option)
    ?resolved_targets:(resolved_targets_ : resolved_targets option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?max_errors:(max_errors_ : max_errors option) ?target:(target_ : string_ option)
    ?automation_type:(automation_type_ : automation_type option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
    ?target_locations_ur_l:(target_locations_ur_l_ : target_locations_ur_l option)
    ?automation_subtype:(automation_subtype_ : automation_subtype option)
    ?scheduled_time:(scheduled_time_ : date_time option) ?runbooks:(runbooks_ : runbooks option)
    ?ops_item_id:(ops_item_id_ : string_ option) ?association_id:(association_id_ : string_ option)
    ?change_request_name:(change_request_name_ : change_request_name option) () =
  ({
     automation_execution_id = automation_execution_id_;
     document_name = document_name_;
     document_version = document_version_;
     automation_execution_status = automation_execution_status_;
     execution_start_time = execution_start_time_;
     execution_end_time = execution_end_time_;
     executed_by = executed_by_;
     log_file = log_file_;
     outputs = outputs_;
     mode = mode_;
     parent_automation_execution_id = parent_automation_execution_id_;
     current_step_name = current_step_name_;
     current_action = current_action_;
     failure_message = failure_message_;
     target_parameter_name = target_parameter_name_;
     targets = targets_;
     target_maps = target_maps_;
     resolved_targets = resolved_targets_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     target = target_;
     automation_type = automation_type_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
     target_locations_ur_l = target_locations_ur_l_;
     automation_subtype = automation_subtype_;
     scheduled_time = scheduled_time_;
     runbooks = runbooks_;
     ops_item_id = ops_item_id_;
     association_id = association_id_;
     change_request_name = change_request_name_;
   }
    : automation_execution_metadata)

let make_automation_execution_filter ~key:(key_ : automation_execution_filter_key)
    ~values:(values_ : automation_execution_filter_value_list) () =
  ({ key = key_; values = values_ } : automation_execution_filter)

let make_describe_automation_executions_request
    ?filters:(filters_ : automation_execution_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_automation_executions_request)

let make_output_source ?output_source_id:(output_source_id_ : output_source_id option)
    ?output_source_type:(output_source_type_ : output_source_type option) () =
  ({ output_source_id = output_source_id_; output_source_type = output_source_type_ }
    : output_source)

let make_association_execution_target ?association_id:(association_id_ : association_id option)
    ?association_version:(association_version_ : association_version option)
    ?execution_id:(execution_id_ : association_execution_id option)
    ?resource_id:(resource_id_ : association_resource_id option)
    ?resource_type:(resource_type_ : association_resource_type option)
    ?status:(status_ : status_name option) ?detailed_status:(detailed_status_ : status_name option)
    ?last_execution_date:(last_execution_date_ : date_time option)
    ?output_source:(output_source_ : output_source option) () =
  ({
     association_id = association_id_;
     association_version = association_version_;
     execution_id = execution_id_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     status = status_;
     detailed_status = detailed_status_;
     last_execution_date = last_execution_date_;
     output_source = output_source_;
   }
    : association_execution_target)

let make_association_execution_targets_filter ~key:(key_ : association_execution_targets_filter_key)
    ~value:(value_ : association_execution_targets_filter_value) () =
  ({ key = key_; value = value_ } : association_execution_targets_filter)

let make_describe_association_execution_targets_request
    ?filters:(filters_ : association_execution_targets_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~association_id:(association_id_ : association_id)
    ~execution_id:(execution_id_ : association_execution_id) () =
  ({
     association_id = association_id_;
     execution_id = execution_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_association_execution_targets_request)

let make_association_execution ?association_id:(association_id_ : association_id option)
    ?association_version:(association_version_ : association_version option)
    ?execution_id:(execution_id_ : association_execution_id option)
    ?status:(status_ : status_name option) ?detailed_status:(detailed_status_ : status_name option)
    ?created_time:(created_time_ : date_time option)
    ?last_execution_date:(last_execution_date_ : date_time option)
    ?resource_count_by_status:(resource_count_by_status_ : resource_count_by_status option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option) () =
  ({
     association_id = association_id_;
     association_version = association_version_;
     execution_id = execution_id_;
     status = status_;
     detailed_status = detailed_status_;
     created_time = created_time_;
     last_execution_date = last_execution_date_;
     resource_count_by_status = resource_count_by_status_;
     alarm_configuration = alarm_configuration_;
     triggered_alarms = triggered_alarms_;
   }
    : association_execution)

let make_association_execution_filter ~key:(key_ : association_execution_filter_key)
    ~value:(value_ : association_execution_filter_value)
    ~type_:(type__ : association_filter_operator_type) () =
  ({ key = key_; value = value_; type_ = type__ } : association_execution_filter)

let make_describe_association_executions_request
    ?filters:(filters_ : association_execution_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~association_id:(association_id_ : association_id) () =
  ({
     association_id = association_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_association_executions_request)

let make_describe_association_request ?name:(name_ : document_ar_n option)
    ?instance_id:(instance_id_ : instance_id option)
    ?association_id:(association_id_ : association_id option)
    ?association_version:(association_version_ : association_version option) () =
  ({
     name = name_;
     instance_id = instance_id_;
     association_id = association_id_;
     association_version = association_version_;
   }
    : describe_association_request)

let make_describe_activations_filter
    ?filter_key:(filter_key_ : describe_activations_filter_keys option)
    ?filter_values:(filter_values_ : string_list option) () =
  ({ filter_key = filter_key_; filter_values = filter_values_ } : describe_activations_filter)

let make_describe_activations_request ?filters:(filters_ : describe_activations_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : describe_activations_request)

let make_deregister_task_from_maintenance_window_request
    ~window_id:(window_id_ : maintenance_window_id)
    ~window_task_id:(window_task_id_ : maintenance_window_task_id) () =
  ({ window_id = window_id_; window_task_id = window_task_id_ }
    : deregister_task_from_maintenance_window_request)

let make_deregister_target_from_maintenance_window_request ?safe:(safe_ : boolean_ option)
    ~window_id:(window_id_ : maintenance_window_id)
    ~window_target_id:(window_target_id_ : maintenance_window_target_id) () =
  ({ window_id = window_id_; window_target_id = window_target_id_; safe = safe_ }
    : deregister_target_from_maintenance_window_request)

let make_deregister_patch_baseline_for_patch_group_request ~baseline_id:(baseline_id_ : baseline_id)
    ~patch_group:(patch_group_ : patch_group) () =
  ({ baseline_id = baseline_id_; patch_group = patch_group_ }
    : deregister_patch_baseline_for_patch_group_request)

let make_deregister_managed_instance_request ~instance_id:(instance_id_ : managed_instance_id) () =
  ({ instance_id = instance_id_ } : deregister_managed_instance_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : resource_arn_string)
    ~policy_id:(policy_id_ : policy_id) ~policy_hash:(policy_hash_ : policy_hash) () =
  ({ resource_arn = resource_arn_; policy_id = policy_id_; policy_hash = policy_hash_ }
    : delete_resource_policy_request)

let make_delete_resource_data_sync_request ?sync_type:(sync_type_ : resource_data_sync_type option)
    ~sync_name:(sync_name_ : resource_data_sync_name) () =
  ({ sync_name = sync_name_; sync_type = sync_type_ } : delete_resource_data_sync_request)

let make_delete_patch_baseline_request ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_ } : delete_patch_baseline_request)

let make_delete_parameters_request ~names:(names_ : parameter_name_list) () =
  ({ names = names_ } : delete_parameters_request)

let make_delete_parameter_request ~name:(name_ : ps_parameter_name) () =
  ({ name = name_ } : delete_parameter_request)

let make_delete_ops_metadata_request ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({ ops_metadata_arn = ops_metadata_arn_ } : delete_ops_metadata_request)

let make_delete_ops_item_response () = (() : unit)

let make_delete_ops_item_request ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({ ops_item_id = ops_item_id_ } : delete_ops_item_request)

let make_delete_maintenance_window_request ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_id = window_id_ } : delete_maintenance_window_request)

let make_delete_inventory_request
    ?schema_delete_option:(schema_delete_option_ : inventory_schema_delete_option option)
    ?dry_run:(dry_run_ : dry_run option) ?client_token:(client_token_ : uui_d option)
    ~type_name:(type_name_ : inventory_item_type_name) () =
  ({
     type_name = type_name_;
     schema_delete_option = schema_delete_option_;
     dry_run = dry_run_;
     client_token = client_token_;
   }
    : delete_inventory_request)

let make_delete_document_request ?document_version:(document_version_ : document_version option)
    ?version_name:(version_name_ : document_version_name option) ?force:(force_ : boolean_ option)
    ~name:(name_ : document_name) () =
  ({
     name = name_;
     document_version = document_version_;
     version_name = version_name_;
     force = force_;
   }
    : delete_document_request)

let make_delete_association_request ?name:(name_ : document_ar_n option)
    ?instance_id:(instance_id_ : instance_id option)
    ?association_id:(association_id_ : association_id option) () =
  ({ name = name_; instance_id = instance_id_; association_id = association_id_ }
    : delete_association_request)

let make_delete_activation_request ~activation_id:(activation_id_ : activation_id) () =
  ({ activation_id = activation_id_ } : delete_activation_request)

let make_create_resource_data_sync_request
    ?s3_destination:(s3_destination_ : resource_data_sync_s3_destination option)
    ?sync_type:(sync_type_ : resource_data_sync_type option)
    ?sync_source:(sync_source_ : resource_data_sync_source option)
    ~sync_name:(sync_name_ : resource_data_sync_name) () =
  ({
     sync_name = sync_name_;
     s3_destination = s3_destination_;
     sync_type = sync_type_;
     sync_source = sync_source_;
   }
    : create_resource_data_sync_request)

let make_create_patch_baseline_request
    ?operating_system:(operating_system_ : operating_system option)
    ?global_filters:(global_filters_ : patch_filter_group option)
    ?approval_rules:(approval_rules_ : patch_rule_group option)
    ?approved_patches:(approved_patches_ : patch_id_list option)
    ?approved_patches_compliance_level:
      (approved_patches_compliance_level_ : patch_compliance_level option)
    ?approved_patches_enable_non_security:(approved_patches_enable_non_security_ : boolean_ option)
    ?rejected_patches:(rejected_patches_ : patch_id_list option)
    ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
    ?description:(description_ : baseline_description option)
    ?sources:(sources_ : patch_source_list option)
    ?available_security_updates_compliance_status:
      (available_security_updates_compliance_status_ : patch_compliance_status option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : baseline_name) () =
  ({
     operating_system = operating_system_;
     name = name_;
     global_filters = global_filters_;
     approval_rules = approval_rules_;
     approved_patches = approved_patches_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     approved_patches_enable_non_security = approved_patches_enable_non_security_;
     rejected_patches = rejected_patches_;
     rejected_patches_action = rejected_patches_action_;
     description = description_;
     sources = sources_;
     available_security_updates_compliance_status = available_security_updates_compliance_status_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_patch_baseline_request)

let make_create_ops_metadata_request ?metadata:(metadata_ : metadata_map option)
    ?tags:(tags_ : tag_list option) ~resource_id:(resource_id_ : ops_metadata_resource_id) () =
  ({ resource_id = resource_id_; metadata = metadata_; tags = tags_ } : create_ops_metadata_request)

let make_create_ops_item_response ?ops_item_id:(ops_item_id_ : string_ option)
    ?ops_item_arn:(ops_item_arn_ : ops_item_arn option) () =
  ({ ops_item_id = ops_item_id_; ops_item_arn = ops_item_arn_ } : create_ops_item_response)

let make_create_ops_item_request ?ops_item_type:(ops_item_type_ : ops_item_type option)
    ?operational_data:(operational_data_ : ops_item_operational_data option)
    ?notifications:(notifications_ : ops_item_notifications option)
    ?priority:(priority_ : ops_item_priority option)
    ?related_ops_items:(related_ops_items_ : related_ops_items option)
    ?tags:(tags_ : tag_list option) ?category:(category_ : ops_item_category option)
    ?severity:(severity_ : ops_item_severity option)
    ?actual_start_time:(actual_start_time_ : date_time option)
    ?actual_end_time:(actual_end_time_ : date_time option)
    ?planned_start_time:(planned_start_time_ : date_time option)
    ?planned_end_time:(planned_end_time_ : date_time option)
    ?account_id:(account_id_ : ops_item_account_id option)
    ~description:(description_ : ops_item_description) ~source:(source_ : ops_item_source)
    ~title:(title_ : ops_item_title) () =
  ({
     description = description_;
     ops_item_type = ops_item_type_;
     operational_data = operational_data_;
     notifications = notifications_;
     priority = priority_;
     related_ops_items = related_ops_items_;
     source = source_;
     title = title_;
     tags = tags_;
     category = category_;
     severity = severity_;
     actual_start_time = actual_start_time_;
     actual_end_time = actual_end_time_;
     planned_start_time = planned_start_time_;
     planned_end_time = planned_end_time_;
     account_id = account_id_;
   }
    : create_ops_item_request)

let make_create_maintenance_window_request
    ?description:(description_ : maintenance_window_description option)
    ?start_date:(start_date_ : maintenance_window_string_date_time option)
    ?end_date:(end_date_ : maintenance_window_string_date_time option)
    ?schedule_timezone:(schedule_timezone_ : maintenance_window_timezone option)
    ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : maintenance_window_name) ~schedule:(schedule_ : maintenance_window_schedule)
    ~duration:(duration_ : maintenance_window_duration_hours)
    ~cutoff:(cutoff_ : maintenance_window_cutoff)
    ~allow_unassociated_targets:
      (allow_unassociated_targets_ : maintenance_window_allow_unassociated_targets) () =
  ({
     name = name_;
     description = description_;
     start_date = start_date_;
     end_date = end_date_;
     schedule = schedule_;
     schedule_timezone = schedule_timezone_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     cutoff = cutoff_;
     allow_unassociated_targets = allow_unassociated_targets_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_maintenance_window_request)

let make_create_document_request ?requires:(requires_ : document_requires_list option)
    ?attachments:(attachments_ : attachments_source_list option)
    ?display_name:(display_name_ : document_display_name option)
    ?version_name:(version_name_ : document_version_name option)
    ?document_type:(document_type_ : document_type option)
    ?document_format:(document_format_ : document_format option)
    ?target_type:(target_type_ : target_type option) ?tags:(tags_ : tag_list option)
    ~content:(content_ : document_content) ~name:(name_ : document_name) () =
  ({
     content = content_;
     requires = requires_;
     attachments = attachments_;
     name = name_;
     display_name = display_name_;
     version_name = version_name_;
     document_type = document_type_;
     document_format = document_format_;
     target_type = target_type_;
     tags = tags_;
   }
    : create_document_request)

let make_create_association_batch_request_entry ?instance_id:(instance_id_ : instance_id option)
    ?parameters:(parameters_ : parameters option)
    ?automation_target_parameter_name:
      (automation_target_parameter_name_ : automation_target_parameter_name option)
    ?document_version:(document_version_ : document_version option)
    ?targets:(targets_ : targets option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?output_location:(output_location_ : instance_association_output_location option)
    ?association_name:(association_name_ : association_name option)
    ?max_errors:(max_errors_ : max_errors option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?compliance_severity:(compliance_severity_ : association_compliance_severity option)
    ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
    ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : apply_only_at_cron_interval option)
    ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
    ?target_locations:(target_locations_ : target_locations option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ~name:(name_ : document_ar_n) () =
  ({
     name = name_;
     instance_id = instance_id_;
     parameters = parameters_;
     automation_target_parameter_name = automation_target_parameter_name_;
     document_version = document_version_;
     targets = targets_;
     schedule_expression = schedule_expression_;
     output_location = output_location_;
     association_name = association_name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     compliance_severity = compliance_severity_;
     sync_compliance = sync_compliance_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     calendar_names = calendar_names_;
     target_locations = target_locations_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
     alarm_configuration = alarm_configuration_;
   }
    : create_association_batch_request_entry)

let make_failed_create_association ?entry:(entry_ : create_association_batch_request_entry option)
    ?message:(message_ : batch_error_message option) ?fault:(fault_ : fault option) () =
  ({ entry = entry_; message = message_; fault = fault_ } : failed_create_association)

let make_create_association_batch_request
    ?association_dispatch_assume_role:
      (association_dispatch_assume_role_ : association_dispatch_assume_role_arn option)
    ~entries:(entries_ : create_association_batch_request_entries) () =
  ({ entries = entries_; association_dispatch_assume_role = association_dispatch_assume_role_ }
    : create_association_batch_request)

let make_create_association_request ?document_version:(document_version_ : document_version option)
    ?instance_id:(instance_id_ : instance_id option) ?parameters:(parameters_ : parameters option)
    ?targets:(targets_ : targets option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?output_location:(output_location_ : instance_association_output_location option)
    ?association_name:(association_name_ : association_name option)
    ?automation_target_parameter_name:
      (automation_target_parameter_name_ : automation_target_parameter_name option)
    ?max_errors:(max_errors_ : max_errors option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?compliance_severity:(compliance_severity_ : association_compliance_severity option)
    ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
    ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : apply_only_at_cron_interval option)
    ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
    ?target_locations:(target_locations_ : target_locations option)
    ?schedule_offset:(schedule_offset_ : schedule_offset option)
    ?duration:(duration_ : duration option) ?target_maps:(target_maps_ : target_maps option)
    ?tags:(tags_ : tag_list option)
    ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
    ?association_dispatch_assume_role:
      (association_dispatch_assume_role_ : association_dispatch_assume_role_arn option)
    ~name:(name_ : document_ar_n) () =
  ({
     name = name_;
     document_version = document_version_;
     instance_id = instance_id_;
     parameters = parameters_;
     targets = targets_;
     schedule_expression = schedule_expression_;
     output_location = output_location_;
     association_name = association_name_;
     automation_target_parameter_name = automation_target_parameter_name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     compliance_severity = compliance_severity_;
     sync_compliance = sync_compliance_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     calendar_names = calendar_names_;
     target_locations = target_locations_;
     schedule_offset = schedule_offset_;
     duration = duration_;
     target_maps = target_maps_;
     tags = tags_;
     alarm_configuration = alarm_configuration_;
     association_dispatch_assume_role = association_dispatch_assume_role_;
   }
    : create_association_request)

let make_registration_metadata_item ~key:(key_ : registration_metadata_key)
    ~value:(value_ : registration_metadata_value) () =
  ({ key = key_; value = value_ } : registration_metadata_item)

let make_create_activation_request ?description:(description_ : activation_description option)
    ?default_instance_name:(default_instance_name_ : default_instance_name option)
    ?registration_limit:(registration_limit_ : registration_limit option)
    ?expiration_date:(expiration_date_ : expiration_date option) ?tags:(tags_ : tag_list option)
    ?registration_metadata:(registration_metadata_ : registration_metadata_list option)
    ~iam_role:(iam_role_ : iam_role) () =
  ({
     description = description_;
     default_instance_name = default_instance_name_;
     iam_role = iam_role_;
     registration_limit = registration_limit_;
     expiration_date = expiration_date_;
     tags = tags_;
     registration_metadata = registration_metadata_;
   }
    : create_activation_request)

let make_cancel_maintenance_window_execution_request
    ~window_execution_id:(window_execution_id_ : maintenance_window_execution_id) () =
  ({ window_execution_id = window_execution_id_ } : cancel_maintenance_window_execution_request)

let make_cancel_command_request ?instance_ids:(instance_ids_ : instance_id_list option)
    ~command_id:(command_id_ : command_id) () =
  ({ command_id = command_id_; instance_ids = instance_ids_ } : cancel_command_request)

let make_associate_ops_item_related_item_response
    ?association_id:(association_id_ : ops_item_related_item_association_id option) () =
  ({ association_id = association_id_ } : associate_ops_item_related_item_response)

let make_associate_ops_item_related_item_request ~ops_item_id:(ops_item_id_ : ops_item_id)
    ~association_type:(association_type_ : ops_item_related_item_association_type)
    ~resource_type:(resource_type_ : ops_item_related_item_association_resource_type)
    ~resource_uri:(resource_uri_ : ops_item_related_item_association_resource_uri) () =
  ({
     ops_item_id = ops_item_id_;
     association_type = association_type_;
     resource_type = resource_type_;
     resource_uri = resource_uri_;
   }
    : associate_ops_item_related_item_request)
