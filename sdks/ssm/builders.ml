open Types
let make_update_service_setting_request
  ~setting_value:(setting_value_ : service_setting_value)
  ~setting_id:(setting_id_ : service_setting_id) () =
  ({ setting_value = setting_value_; setting_id = setting_id_ } : update_service_setting_request)
let make_resource_data_sync_organizational_unit
  ?organizational_unit_id:(organizational_unit_id_ :
                            resource_data_sync_organizational_unit_id option)
  () =
  ({ organizational_unit_id = organizational_unit_id_ } : resource_data_sync_organizational_unit)
let make_resource_data_sync_aws_organizations_source
  ?organizational_units:(organizational_units_ :
                          resource_data_sync_organizational_unit_list option)
  ~organization_source_type:(organization_source_type_ :
                              resource_data_sync_organization_source_type)
  () =
  ({
     organizational_units = organizational_units_;
     organization_source_type = organization_source_type_
   } : resource_data_sync_aws_organizations_source)
let make_resource_data_sync_source
  ?enable_all_ops_data_sources:(enable_all_ops_data_sources_ :
                                 resource_data_sync_enable_all_ops_data_sources
                                   option)
  ?include_future_regions:(include_future_regions_ :
                            resource_data_sync_include_future_regions option)
  ?aws_organizations_source:(aws_organizations_source_ :
                              resource_data_sync_aws_organizations_source
                                option)
  ~source_regions:(source_regions_ : resource_data_sync_source_region_list)
  ~source_type:(source_type_ : resource_data_sync_source_type) () =
  ({
     enable_all_ops_data_sources = enable_all_ops_data_sources_;
     include_future_regions = include_future_regions_;
     source_regions = source_regions_;
     aws_organizations_source = aws_organizations_source_;
     source_type = source_type_
   } : resource_data_sync_source)
let make_update_resource_data_sync_request
  ~sync_source:(sync_source_ : resource_data_sync_source)
  ~sync_type:(sync_type_ : resource_data_sync_type)
  ~sync_name:(sync_name_ : resource_data_sync_name) () =
  ({
     sync_source = sync_source_;
     sync_type = sync_type_;
     sync_name = sync_name_
   } : update_resource_data_sync_request)
let make_patch_filter ~values:(values_ : patch_filter_value_list)
  ~key:(key_ : patch_filter_key) () =
  ({ values = values_; key = key_ } : patch_filter)
let make_patch_filter_group
  ~patch_filters:(patch_filters_ : patch_filter_list) () =
  ({ patch_filters = patch_filters_ } : patch_filter_group)
let make_patch_rule
  ?enable_non_security:(enable_non_security_ : boolean_ option)
  ?approve_until_date:(approve_until_date_ : patch_string_date_time option)
  ?approve_after_days:(approve_after_days_ : approve_after_days option)
  ?compliance_level:(compliance_level_ : patch_compliance_level option)
  ~patch_filter_group:(patch_filter_group_ : patch_filter_group) () =
  ({
     enable_non_security = enable_non_security_;
     approve_until_date = approve_until_date_;
     approve_after_days = approve_after_days_;
     compliance_level = compliance_level_;
     patch_filter_group = patch_filter_group_
   } : patch_rule)
let make_patch_rule_group ~patch_rules:(patch_rules_ : patch_rule_list) () =
  ({ patch_rules = patch_rules_ } : patch_rule_group)
let make_patch_source
  ~configuration:(configuration_ : patch_source_configuration)
  ~products:(products_ : patch_source_product_list)
  ~name:(name_ : patch_source_name) () =
  ({ configuration = configuration_; products = products_; name = name_ } : 
  patch_source)
let make_update_patch_baseline_request ?replace:(replace_ : boolean_ option)
  ?available_security_updates_compliance_status:(available_security_updates_compliance_status_
                                                  :
                                                  patch_compliance_status
                                                    option)
  ?sources:(sources_ : patch_source_list option)
  ?description:(description_ : baseline_description option)
  ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
  ?rejected_patches:(rejected_patches_ : patch_id_list option)
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : boolean_ option)
  ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                       patch_compliance_level option)
  ?approved_patches:(approved_patches_ : patch_id_list option)
  ?approval_rules:(approval_rules_ : patch_rule_group option)
  ?global_filters:(global_filters_ : patch_filter_group option)
  ?name:(name_ : baseline_name option)
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({
     replace = replace_;
     available_security_updates_compliance_status =
       available_security_updates_compliance_status_;
     sources = sources_;
     description = description_;
     rejected_patches_action = rejected_patches_action_;
     rejected_patches = rejected_patches_;
     approved_patches_enable_non_security =
       approved_patches_enable_non_security_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     approved_patches = approved_patches_;
     approval_rules = approval_rules_;
     global_filters = global_filters_;
     name = name_;
     baseline_id = baseline_id_
   } : update_patch_baseline_request)
let make_metadata_value ?value:(value_ : metadata_value_string option) () =
  ({ value = value_ } : metadata_value)
let make_update_ops_metadata_request
  ?keys_to_delete:(keys_to_delete_ : metadata_keys_to_delete_list option)
  ?metadata_to_update:(metadata_to_update_ : metadata_map option)
  ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({
     keys_to_delete = keys_to_delete_;
     metadata_to_update = metadata_to_update_;
     ops_metadata_arn = ops_metadata_arn_
   } : update_ops_metadata_request)
let make_update_ops_item_response () = (() : unit)
let make_ops_item_data_value ?type_:(type__ : ops_item_data_type option)
  ?value:(value_ : ops_item_data_value_string option) () =
  ({ type_ = type__; value = value_ } : ops_item_data_value)
let make_ops_item_notification ?arn:(arn_ : string_ option) () =
  ({ arn = arn_ } : ops_item_notification)
let make_related_ops_item ~ops_item_id:(ops_item_id_ : string_) () =
  ({ ops_item_id = ops_item_id_ } : related_ops_item)
let make_update_ops_item_request
  ?ops_item_arn:(ops_item_arn_ : ops_item_arn option)
  ?planned_end_time:(planned_end_time_ : date_time option)
  ?planned_start_time:(planned_start_time_ : date_time option)
  ?actual_end_time:(actual_end_time_ : date_time option)
  ?actual_start_time:(actual_start_time_ : date_time option)
  ?severity:(severity_ : ops_item_severity option)
  ?category:(category_ : ops_item_category option)
  ?title:(title_ : ops_item_title option)
  ?status:(status_ : ops_item_status option)
  ?related_ops_items:(related_ops_items_ : related_ops_items option)
  ?priority:(priority_ : ops_item_priority option)
  ?notifications:(notifications_ : ops_item_notifications option)
  ?operational_data_to_delete:(operational_data_to_delete_ :
                                ops_item_ops_data_keys_list option)
  ?operational_data:(operational_data_ : ops_item_operational_data option)
  ?description:(description_ : ops_item_description option)
  ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({
     ops_item_arn = ops_item_arn_;
     planned_end_time = planned_end_time_;
     planned_start_time = planned_start_time_;
     actual_end_time = actual_end_time_;
     actual_start_time = actual_start_time_;
     severity = severity_;
     category = category_;
     title = title_;
     ops_item_id = ops_item_id_;
     status = status_;
     related_ops_items = related_ops_items_;
     priority = priority_;
     notifications = notifications_;
     operational_data_to_delete = operational_data_to_delete_;
     operational_data = operational_data_;
     description = description_
   } : update_ops_item_request)
let make_update_managed_instance_role_request
  ~iam_role:(iam_role_ : iam_role)
  ~instance_id:(instance_id_ : managed_instance_id) () =
  ({ iam_role = iam_role_; instance_id = instance_id_ } : update_managed_instance_role_request)
let make_target ?values:(values_ : target_values option)
  ?key:(key_ : target_key option) () =
  ({ values = values_; key = key_ } : target)
let make_maintenance_window_task_parameter_value_expression
  ?values:(values_ : maintenance_window_task_parameter_value_list option) ()
  =
  ({ values = values_ } : maintenance_window_task_parameter_value_expression)
let make_cloud_watch_output_config
  ?cloud_watch_output_enabled:(cloud_watch_output_enabled_ :
                                cloud_watch_output_enabled option)
  ?cloud_watch_log_group_name:(cloud_watch_log_group_name_ :
                                cloud_watch_log_group_name option)
  () =
  ({
     cloud_watch_output_enabled = cloud_watch_output_enabled_;
     cloud_watch_log_group_name = cloud_watch_log_group_name_
   } : cloud_watch_output_config)
let make_notification_config
  ?notification_type:(notification_type_ : notification_type option)
  ?notification_events:(notification_events_ :
                         notification_event_list option)
  ?notification_arn:(notification_arn_ : notification_arn option) () =
  ({
     notification_type = notification_type_;
     notification_events = notification_events_;
     notification_arn = notification_arn_
   } : notification_config)
let make_maintenance_window_run_command_parameters
  ?timeout_seconds:(timeout_seconds_ : timeout_seconds option)
  ?service_role_arn:(service_role_arn_ : service_role option)
  ?parameters:(parameters_ : parameters option)
  ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
  ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
  ?notification_config:(notification_config_ : notification_config option)
  ?document_version:(document_version_ : document_version option)
  ?document_hash_type:(document_hash_type_ : document_hash_type option)
  ?document_hash:(document_hash_ : document_hash option)
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
  ?comment:(comment_ : comment option) () =
  ({
     timeout_seconds = timeout_seconds_;
     service_role_arn = service_role_arn_;
     parameters = parameters_;
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     notification_config = notification_config_;
     document_version = document_version_;
     document_hash_type = document_hash_type_;
     document_hash = document_hash_;
     cloud_watch_output_config = cloud_watch_output_config_;
     comment = comment_
   } : maintenance_window_run_command_parameters)
let make_maintenance_window_automation_parameters
  ?parameters:(parameters_ : automation_parameter_map option)
  ?document_version:(document_version_ : document_version option) () =
  ({ parameters = parameters_; document_version = document_version_ } : 
  maintenance_window_automation_parameters)
let make_maintenance_window_step_functions_parameters
  ?name:(name_ : maintenance_window_step_functions_name option)
  ?input:(input_ : maintenance_window_step_functions_input option) () =
  ({ name = name_; input = input_ } : maintenance_window_step_functions_parameters)
let make_maintenance_window_lambda_parameters
  ?payload:(payload_ : maintenance_window_lambda_payload option)
  ?qualifier:(qualifier_ : maintenance_window_lambda_qualifier option)
  ?client_context:(client_context_ :
                    maintenance_window_lambda_client_context option)
  () =
  ({
     payload = payload_;
     qualifier = qualifier_;
     client_context = client_context_
   } : maintenance_window_lambda_parameters)
let make_maintenance_window_task_invocation_parameters
  ?lambda:(lambda_ : maintenance_window_lambda_parameters option)
  ?step_functions:(step_functions_ :
                    maintenance_window_step_functions_parameters option)
  ?automation:(automation_ : maintenance_window_automation_parameters option)
  ?run_command:(run_command_ :
                 maintenance_window_run_command_parameters option)
  () =
  ({
     lambda = lambda_;
     step_functions = step_functions_;
     automation = automation_;
     run_command = run_command_
   } : maintenance_window_task_invocation_parameters)
let make_logging_info ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix option)
  ~s3_region:(s3_region_ : s3_region)
  ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name) () =
  ({
     s3_region = s3_region_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_
   } : logging_info)
let make_alarm ~name:(name_ : alarm_name) () = ({ name = name_ } : alarm)
let make_alarm_configuration
  ?ignore_poll_alarm_failure:(ignore_poll_alarm_failure_ : boolean_ option)
  ~alarms:(alarms_ : alarm_list) () =
  ({ alarms = alarms_; ignore_poll_alarm_failure = ignore_poll_alarm_failure_
   } : alarm_configuration)
let make_update_maintenance_window_task_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
  ?replace:(replace_ : boolean_ option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?logging_info:(logging_info_ : logging_info option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?priority:(priority_ : maintenance_window_task_priority option)
  ?task_invocation_parameters:(task_invocation_parameters_ :
                                maintenance_window_task_invocation_parameters
                                  option)
  ?task_parameters:(task_parameters_ :
                     maintenance_window_task_parameters option)
  ?service_role_arn:(service_role_arn_ : service_role option)
  ?task_arn:(task_arn_ : maintenance_window_task_arn option)
  ?targets:(targets_ : targets option)
  ~window_task_id:(window_task_id_ : maintenance_window_task_id)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     alarm_configuration = alarm_configuration_;
     cutoff_behavior = cutoff_behavior_;
     replace = replace_;
     description = description_;
     name = name_;
     logging_info = logging_info_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     priority = priority_;
     task_invocation_parameters = task_invocation_parameters_;
     task_parameters = task_parameters_;
     service_role_arn = service_role_arn_;
     task_arn = task_arn_;
     targets = targets_;
     window_task_id = window_task_id_;
     window_id = window_id_
   } : update_maintenance_window_task_request)
let make_update_maintenance_window_target_request
  ?replace:(replace_ : boolean_ option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?owner_information:(owner_information_ : owner_information option)
  ?targets:(targets_ : targets option)
  ~window_target_id:(window_target_id_ : maintenance_window_target_id)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     replace = replace_;
     description = description_;
     name = name_;
     owner_information = owner_information_;
     targets = targets_;
     window_target_id = window_target_id_;
     window_id = window_id_
   } : update_maintenance_window_target_request)
let make_update_maintenance_window_request
  ?replace:(replace_ : boolean_ option)
  ?enabled:(enabled_ : maintenance_window_enabled option)
  ?allow_unassociated_targets:(allow_unassociated_targets_ :
                                maintenance_window_allow_unassociated_targets
                                  option)
  ?cutoff:(cutoff_ : maintenance_window_cutoff option)
  ?duration:(duration_ : maintenance_window_duration_hours option)
  ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
  ?schedule_timezone:(schedule_timezone_ :
                       maintenance_window_timezone option)
  ?schedule:(schedule_ : maintenance_window_schedule option)
  ?end_date:(end_date_ : maintenance_window_string_date_time option)
  ?start_date:(start_date_ : maintenance_window_string_date_time option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     replace = replace_;
     enabled = enabled_;
     allow_unassociated_targets = allow_unassociated_targets_;
     cutoff = cutoff_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     schedule_timezone = schedule_timezone_;
     schedule = schedule_;
     end_date = end_date_;
     start_date = start_date_;
     description = description_;
     name = name_;
     window_id = window_id_
   } : update_maintenance_window_request)
let make_document_parameter
  ?default_value:(default_value_ : document_parameter_default_value option)
  ?description:(description_ : document_parameter_descrption option)
  ?type_:(type__ : document_parameter_type option)
  ?name:(name_ : document_parameter_name option) () =
  ({
     default_value = default_value_;
     description = description_;
     type_ = type__;
     name = name_
   } : document_parameter)
let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_attachment_information ?name:(name_ : attachment_name option) () =
  ({ name = name_ } : attachment_information)
let make_document_requires
  ?version_name:(version_name_ : document_version_name option)
  ?require_type:(require_type_ : require_type option)
  ?version:(version_ : document_version option) ~name:(name_ : document_ar_n)
  () =
  ({
     version_name = version_name_;
     require_type = require_type_;
     version = version_;
     name = name_
   } : document_requires)
let make_review_information ?reviewer:(reviewer_ : reviewer option)
  ?status:(status_ : review_status option)
  ?reviewed_time:(reviewed_time_ : date_time option) () =
  ({ reviewer = reviewer_; status = status_; reviewed_time = reviewed_time_ } : 
  review_information)
let make_document_description
  ?category_enum:(category_enum_ : category_enum_list option)
  ?category:(category_ : category_list option)
  ?review_status:(review_status_ : review_status option)
  ?pending_review_version:(pending_review_version_ : document_version option)
  ?approved_version:(approved_version_ : document_version option)
  ?review_information:(review_information_ : review_information_list option)
  ?author:(author_ : document_author option)
  ?requires:(requires_ : document_requires_list option)
  ?attachments_information:(attachments_information_ :
                             attachment_information_list option)
  ?tags:(tags_ : tag_list option)
  ?target_type:(target_type_ : target_type option)
  ?document_format:(document_format_ : document_format option)
  ?default_version:(default_version_ : document_version option)
  ?latest_version:(latest_version_ : document_version option)
  ?schema_version:(schema_version_ : document_schema_version option)
  ?document_type:(document_type_ : document_type option)
  ?platform_types:(platform_types_ : platform_type_list option)
  ?parameters:(parameters_ : document_parameter_list option)
  ?description:(description_ : description_in_document option)
  ?document_version:(document_version_ : document_version option)
  ?status_information:(status_information_ :
                        document_status_information option)
  ?status:(status_ : document_status option)
  ?created_date:(created_date_ : date_time option)
  ?owner:(owner_ : document_owner option)
  ?version_name:(version_name_ : document_version_name option)
  ?display_name:(display_name_ : document_display_name option)
  ?name:(name_ : document_ar_n option)
  ?hash_type:(hash_type_ : document_hash_type option)
  ?hash:(hash_ : document_hash option) ?sha1:(sha1_ : document_sha1 option)
  () =
  ({
     category_enum = category_enum_;
     category = category_;
     review_status = review_status_;
     pending_review_version = pending_review_version_;
     approved_version = approved_version_;
     review_information = review_information_;
     author = author_;
     requires = requires_;
     attachments_information = attachments_information_;
     tags = tags_;
     target_type = target_type_;
     document_format = document_format_;
     default_version = default_version_;
     latest_version = latest_version_;
     schema_version = schema_version_;
     document_type = document_type_;
     platform_types = platform_types_;
     parameters = parameters_;
     description = description_;
     document_version = document_version_;
     status_information = status_information_;
     status = status_;
     created_date = created_date_;
     owner = owner_;
     version_name = version_name_;
     display_name = display_name_;
     name = name_;
     hash_type = hash_type_;
     hash = hash_;
     sha1 = sha1_
   } : document_description)
let make_attachments_source ?name:(name_ : attachment_identifier option)
  ?values:(values_ : attachments_source_values option)
  ?key:(key_ : attachments_source_key option) () =
  ({ name = name_; values = values_; key = key_ } : attachments_source)
let make_update_document_request
  ?target_type:(target_type_ : target_type option)
  ?document_format:(document_format_ : document_format option)
  ?document_version:(document_version_ : document_version option)
  ?version_name:(version_name_ : document_version_name option)
  ?display_name:(display_name_ : document_display_name option)
  ?attachments:(attachments_ : attachments_source_list option)
  ~name:(name_ : document_name) ~content:(content_ : document_content) () =
  ({
     target_type = target_type_;
     document_format = document_format_;
     document_version = document_version_;
     version_name = version_name_;
     display_name = display_name_;
     name = name_;
     attachments = attachments_;
     content = content_
   } : update_document_request)
let make_update_document_metadata_response () = (() : unit)
let make_document_review_comment_source
  ?content:(content_ : document_review_comment option)
  ?type_:(type__ : document_review_comment_type option) () =
  ({ content = content_; type_ = type__ } : document_review_comment_source)
let make_document_reviews
  ?comment:(comment_ : document_review_comment_list option)
  ~action:(action_ : document_review_action) () =
  ({ comment = comment_; action = action_ } : document_reviews)
let make_update_document_metadata_request
  ?document_version:(document_version_ : document_version option)
  ~document_reviews:(document_reviews_ : document_reviews)
  ~name:(name_ : document_name) () =
  ({
     document_reviews = document_reviews_;
     document_version = document_version_;
     name = name_
   } : update_document_metadata_request)
let make_document_default_version_description
  ?default_version_name:(default_version_name_ :
                          document_version_name option)
  ?default_version:(default_version_ : document_version option)
  ?name:(name_ : document_name option) () =
  ({
     default_version_name = default_version_name_;
     default_version = default_version_;
     name = name_
   } : document_default_version_description)
let make_update_document_default_version_request
  ~document_version:(document_version_ : document_version_number)
  ~name:(name_ : document_name) () =
  ({ document_version = document_version_; name = name_ } : update_document_default_version_request)
let make_association_status
  ?additional_info:(additional_info_ : status_additional_info option)
  ~message:(message_ : status_message)
  ~name:(name_ : association_status_name) ~date:(date_ : date_time) () =
  ({
     additional_info = additional_info_;
     message = message_;
     name = name_;
     date = date_
   } : association_status)
let make_association_overview
  ?association_status_aggregated_count:(association_status_aggregated_count_
                                         :
                                         association_status_aggregated_count
                                           option)
  ?detailed_status:(detailed_status_ : status_name option)
  ?status:(status_ : status_name option) () =
  ({
     association_status_aggregated_count =
       association_status_aggregated_count_;
     detailed_status = detailed_status_;
     status = status_
   } : association_overview)
let make_s3_output_location
  ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
  ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
  ?output_s3_region:(output_s3_region_ : s3_region option) () =
  ({
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_region = output_s3_region_
   } : s3_output_location)
let make_instance_association_output_location
  ?s3_location:(s3_location_ : s3_output_location option) () =
  ({ s3_location = s3_location_ } : instance_association_output_location)
let make_target_location
  ?targets_max_errors:(targets_max_errors_ : max_errors option)
  ?targets_max_concurrency:(targets_max_concurrency_ :
                             max_concurrency option)
  ?targets:(targets_ : targets option)
  ?exclude_accounts:(exclude_accounts_ : exclude_accounts option)
  ?include_child_organization_units:(include_child_organization_units_ :
                                      boolean_ option)
  ?target_location_alarm_configuration:(target_location_alarm_configuration_
                                         : alarm_configuration option)
  ?execution_role_name:(execution_role_name_ : execution_role_name option)
  ?target_location_max_errors:(target_location_max_errors_ :
                                max_errors option)
  ?target_location_max_concurrency:(target_location_max_concurrency_ :
                                     max_concurrency option)
  ?regions:(regions_ : regions option)
  ?accounts:(accounts_ : accounts option) () =
  ({
     targets_max_errors = targets_max_errors_;
     targets_max_concurrency = targets_max_concurrency_;
     targets = targets_;
     exclude_accounts = exclude_accounts_;
     include_child_organization_units = include_child_organization_units_;
     target_location_alarm_configuration =
       target_location_alarm_configuration_;
     execution_role_name = execution_role_name_;
     target_location_max_errors = target_location_max_errors_;
     target_location_max_concurrency = target_location_max_concurrency_;
     regions = regions_;
     accounts = accounts_
   } : target_location)
let make_alarm_state_information ~state:(state_ : external_alarm_state)
  ~name:(name_ : alarm_name) () =
  ({ state = state_; name = name_ } : alarm_state_information)
let make_association_description
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?target_locations:(target_locations_ : target_locations option)
  ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ :
                                 apply_only_at_cron_interval option)
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?max_errors:(max_errors_ : max_errors option)
  ?association_name:(association_name_ : association_name option)
  ?last_successful_execution_date:(last_successful_execution_date_ :
                                    date_time option)
  ?last_execution_date:(last_execution_date_ : date_time option)
  ?output_location:(output_location_ :
                     instance_association_output_location option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?targets:(targets_ : targets option)
  ?association_id:(association_id_ : association_id option)
  ?parameters:(parameters_ : parameters option)
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      automation_target_parameter_name option)
  ?document_version:(document_version_ : document_version option)
  ?overview:(overview_ : association_overview option)
  ?status:(status_ : association_status option)
  ?last_update_association_date:(last_update_association_date_ :
                                  date_time option)
  ?date:(date_ : date_time option)
  ?association_version:(association_version_ : association_version option)
  ?instance_id:(instance_id_ : instance_id option)
  ?name:(name_ : document_ar_n option) () =
  ({
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     target_locations = target_locations_;
     calendar_names = calendar_names_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     sync_compliance = sync_compliance_;
     compliance_severity = compliance_severity_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     association_name = association_name_;
     last_successful_execution_date = last_successful_execution_date_;
     last_execution_date = last_execution_date_;
     output_location = output_location_;
     schedule_expression = schedule_expression_;
     targets = targets_;
     association_id = association_id_;
     parameters = parameters_;
     automation_target_parameter_name = automation_target_parameter_name_;
     document_version = document_version_;
     overview = overview_;
     status = status_;
     last_update_association_date = last_update_association_date_;
     date = date_;
     association_version = association_version_;
     instance_id = instance_id_;
     name = name_
   } : association_description)
let make_update_association_status_request
  ~association_status:(association_status_ : association_status)
  ~instance_id:(instance_id_ : instance_id) ~name:(name_ : document_ar_n) ()
  =
  ({
     association_status = association_status_;
     instance_id = instance_id_;
     name = name_
   } : update_association_status_request)
let make_update_association_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?target_locations:(target_locations_ : target_locations option)
  ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ :
                                 apply_only_at_cron_interval option)
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?max_errors:(max_errors_ : max_errors option)
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      automation_target_parameter_name option)
  ?association_version:(association_version_ : association_version option)
  ?association_name:(association_name_ : association_name option)
  ?targets:(targets_ : targets option) ?name:(name_ : document_ar_n option)
  ?output_location:(output_location_ :
                     instance_association_output_location option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?document_version:(document_version_ : document_version option)
  ?parameters:(parameters_ : parameters option)
  ~association_id:(association_id_ : association_id) () =
  ({
     alarm_configuration = alarm_configuration_;
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     target_locations = target_locations_;
     calendar_names = calendar_names_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     sync_compliance = sync_compliance_;
     compliance_severity = compliance_severity_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     automation_target_parameter_name = automation_target_parameter_name_;
     association_version = association_version_;
     association_name = association_name_;
     targets = targets_;
     name = name_;
     output_location = output_location_;
     schedule_expression = schedule_expression_;
     document_version = document_version_;
     parameters = parameters_;
     association_id = association_id_
   } : update_association_request)
let make_unlabel_parameter_version_request
  ~labels:(labels_ : parameter_label_list)
  ~parameter_version:(parameter_version_ : ps_parameter_version)
  ~name:(name_ : ps_parameter_name) () =
  ({ labels = labels_; parameter_version = parameter_version_; name = name_ } : 
  unlabel_parameter_version_request)
let make_terminate_session_response
  ?session_id:(session_id_ : session_id option) () =
  ({ session_id = session_id_ } : terminate_session_response)
let make_terminate_session_request ~session_id:(session_id_ : session_id) ()
  = ({ session_id = session_id_ } : terminate_session_request)
let make_target_preview ?target_type:(target_type_ : string_ option)
  ?count:(count_ : integer option) () =
  ({ target_type = target_type_; count = count_ } : target_preview)
let make_stop_automation_execution_request ?type_:(type__ : stop_type option)
  ~automation_execution_id:(automation_execution_id_ :
                             automation_execution_id)
  () =
  ({ type_ = type__; automation_execution_id = automation_execution_id_ } : 
  stop_automation_execution_request)
let make_failure_details
  ?details:(details_ : automation_parameter_map option)
  ?failure_type:(failure_type_ : string_ option)
  ?failure_stage:(failure_stage_ : string_ option) () =
  ({
     details = details_;
     failure_type = failure_type_;
     failure_stage = failure_stage_
   } : failure_details)
let make_parent_step_details
  ?iterator_value:(iterator_value_ : string_ option)
  ?iteration:(iteration_ : integer option)
  ?action:(action_ : automation_action_name option)
  ?step_name:(step_name_ : string_ option)
  ?step_execution_id:(step_execution_id_ : string_ option) () =
  ({
     iterator_value = iterator_value_;
     iteration = iteration_;
     action = action_;
     step_name = step_name_;
     step_execution_id = step_execution_id_
   } : parent_step_details)
let make_step_execution
  ?parent_step_details:(parent_step_details_ : parent_step_details option)
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?target_location:(target_location_ : target_location option)
  ?targets:(targets_ : targets option)
  ?valid_next_steps:(valid_next_steps_ : valid_next_step_list option)
  ?is_critical:(is_critical_ : boolean_ option)
  ?next_step:(next_step_ : string_ option)
  ?is_end:(is_end_ : boolean_ option)
  ?overridden_parameters:(overridden_parameters_ :
                           automation_parameter_map option)
  ?step_execution_id:(step_execution_id_ : string_ option)
  ?failure_details:(failure_details_ : failure_details option)
  ?failure_message:(failure_message_ : string_ option)
  ?response:(response_ : string_ option)
  ?outputs:(outputs_ : automation_parameter_map option)
  ?inputs:(inputs_ : normal_string_map option)
  ?response_code:(response_code_ : string_ option)
  ?step_status:(step_status_ : automation_execution_status option)
  ?execution_end_time:(execution_end_time_ : date_time option)
  ?execution_start_time:(execution_start_time_ : date_time option)
  ?max_attempts:(max_attempts_ : integer option)
  ?on_failure:(on_failure_ : string_ option)
  ?timeout_seconds:(timeout_seconds_ : long option)
  ?action:(action_ : automation_action_name option)
  ?step_name:(step_name_ : string_ option) () =
  ({
     parent_step_details = parent_step_details_;
     triggered_alarms = triggered_alarms_;
     target_location = target_location_;
     targets = targets_;
     valid_next_steps = valid_next_steps_;
     is_critical = is_critical_;
     next_step = next_step_;
     is_end = is_end_;
     overridden_parameters = overridden_parameters_;
     step_execution_id = step_execution_id_;
     failure_details = failure_details_;
     failure_message = failure_message_;
     response = response_;
     outputs = outputs_;
     inputs = inputs_;
     response_code = response_code_;
     step_status = step_status_;
     execution_end_time = execution_end_time_;
     execution_start_time = execution_start_time_;
     max_attempts = max_attempts_;
     on_failure = on_failure_;
     timeout_seconds = timeout_seconds_;
     action = action_;
     step_name = step_name_
   } : step_execution)
let make_step_execution_filter
  ~values:(values_ : step_execution_filter_value_list)
  ~key:(key_ : step_execution_filter_key) () =
  ({ values = values_; key = key_ } : step_execution_filter)
let make_start_session_response ?stream_url:(stream_url_ : stream_url option)
  ?token_value:(token_value_ : token_value option)
  ?session_id:(session_id_ : session_id option) () =
  ({
     stream_url = stream_url_;
     token_value = token_value_;
     session_id = session_id_
   } : start_session_response)
let make_start_session_request
  ?parameters:(parameters_ : session_manager_parameters option)
  ?reason:(reason_ : session_reason option)
  ?document_name:(document_name_ : document_ar_n option)
  ~target:(target_ : session_target) () =
  ({
     parameters = parameters_;
     reason = reason_;
     document_name = document_name_;
     target = target_
   } : start_session_request)
let make_start_execution_preview_response
  ?execution_preview_id:(execution_preview_id_ : execution_preview_id option)
  () =
  ({ execution_preview_id = execution_preview_id_ } : start_execution_preview_response)
let make_automation_execution_inputs
  ?target_locations_ur_l:(target_locations_ur_l_ :
                           target_locations_ur_l option)
  ?target_locations:(target_locations_ : target_locations option)
  ?target_maps:(target_maps_ : target_maps option)
  ?targets:(targets_ : targets option)
  ?target_parameter_name:(target_parameter_name_ :
                           automation_parameter_key option)
  ?parameters:(parameters_ : automation_parameter_map option) () =
  ({
     target_locations_ur_l = target_locations_ur_l_;
     target_locations = target_locations_;
     target_maps = target_maps_;
     targets = targets_;
     target_parameter_name = target_parameter_name_;
     parameters = parameters_
   } : automation_execution_inputs)
let make_start_execution_preview_request
  ?execution_inputs:(execution_inputs_ : execution_inputs option)
  ?document_version:(document_version_ : document_version option)
  ~document_name:(document_name_ : document_name) () =
  ({
     execution_inputs = execution_inputs_;
     document_version = document_version_;
     document_name = document_name_
   } : start_execution_preview_request)
let make_runbook
  ?target_locations:(target_locations_ : target_locations option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?target_maps:(target_maps_ : target_maps option)
  ?targets:(targets_ : targets option)
  ?target_parameter_name:(target_parameter_name_ :
                           automation_parameter_key option)
  ?parameters:(parameters_ : automation_parameter_map option)
  ?document_version:(document_version_ : document_version option)
  ~document_name:(document_name_ : document_ar_n) () =
  ({
     target_locations = target_locations_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     target_maps = target_maps_;
     targets = targets_;
     target_parameter_name = target_parameter_name_;
     parameters = parameters_;
     document_version = document_version_;
     document_name = document_name_
   } : runbook)
let make_start_change_request_execution_request
  ?change_details:(change_details_ : change_details_value option)
  ?scheduled_end_time:(scheduled_end_time_ : date_time option)
  ?tags:(tags_ : tag_list option)
  ?auto_approve:(auto_approve_ : boolean_ option)
  ?client_token:(client_token_ : idempotency_token option)
  ?change_request_name:(change_request_name_ : change_request_name option)
  ?parameters:(parameters_ : automation_parameter_map option)
  ?document_version:(document_version_ : document_version option)
  ?scheduled_time:(scheduled_time_ : date_time option)
  ~runbooks:(runbooks_ : runbooks)
  ~document_name:(document_name_ : document_ar_n) () =
  ({
     change_details = change_details_;
     scheduled_end_time = scheduled_end_time_;
     tags = tags_;
     runbooks = runbooks_;
     auto_approve = auto_approve_;
     client_token = client_token_;
     change_request_name = change_request_name_;
     parameters = parameters_;
     document_version = document_version_;
     document_name = document_name_;
     scheduled_time = scheduled_time_
   } : start_change_request_execution_request)
let make_start_automation_execution_request
  ?target_locations_ur_l:(target_locations_ur_l_ :
                           target_locations_ur_l option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?tags:(tags_ : tag_list option)
  ?target_locations:(target_locations_ : target_locations option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?target_maps:(target_maps_ : target_maps option)
  ?targets:(targets_ : targets option)
  ?target_parameter_name:(target_parameter_name_ :
                           automation_parameter_key option)
  ?mode:(mode_ : execution_mode option)
  ?client_token:(client_token_ : idempotency_token option)
  ?parameters:(parameters_ : automation_parameter_map option)
  ?document_version:(document_version_ : document_version option)
  ~document_name:(document_name_ : document_ar_n) () =
  ({
     target_locations_ur_l = target_locations_ur_l_;
     alarm_configuration = alarm_configuration_;
     tags = tags_;
     target_locations = target_locations_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     target_maps = target_maps_;
     targets = targets_;
     target_parameter_name = target_parameter_name_;
     mode = mode_;
     client_token = client_token_;
     parameters = parameters_;
     document_version = document_version_;
     document_name = document_name_
   } : start_automation_execution_request)
let make_start_associations_once_request
  ~association_ids:(association_ids_ : association_id_list) () =
  ({ association_ids = association_ids_ } : start_associations_once_request)
let make_start_access_request_response
  ?access_request_id:(access_request_id_ : access_request_id option) () =
  ({ access_request_id = access_request_id_ } : start_access_request_response)
let make_start_access_request_request ?tags:(tags_ : tag_list option)
  ~targets:(targets_ : targets) ~reason:(reason_ : string1to256) () =
  ({ tags = tags_; targets = targets_; reason = reason_ } : start_access_request_request)
let make_severity_summary
  ?unspecified_count:(unspecified_count_ : compliance_summary_count option)
  ?informational_count:(informational_count_ :
                         compliance_summary_count option)
  ?low_count:(low_count_ : compliance_summary_count option)
  ?medium_count:(medium_count_ : compliance_summary_count option)
  ?high_count:(high_count_ : compliance_summary_count option)
  ?critical_count:(critical_count_ : compliance_summary_count option) () =
  ({
     unspecified_count = unspecified_count_;
     informational_count = informational_count_;
     low_count = low_count_;
     medium_count = medium_count_;
     high_count = high_count_;
     critical_count = critical_count_
   } : severity_summary)
let make_session_manager_output_url
  ?cloud_watch_output_url:(cloud_watch_output_url_ :
                            session_manager_cloud_watch_output_url option)
  ?s3_output_url:(s3_output_url_ : session_manager_s3_output_url option) () =
  ({
     cloud_watch_output_url = cloud_watch_output_url_;
     s3_output_url = s3_output_url_
   } : session_manager_output_url)
let make_session ?access_type:(access_type_ : access_type option)
  ?max_session_duration:(max_session_duration_ : max_session_duration option)
  ?output_url:(output_url_ : session_manager_output_url option)
  ?details:(details_ : session_details option)
  ?reason:(reason_ : session_reason option)
  ?owner:(owner_ : session_owner option)
  ?document_name:(document_name_ : document_name option)
  ?end_date:(end_date_ : date_time option)
  ?start_date:(start_date_ : date_time option)
  ?status:(status_ : session_status option)
  ?target:(target_ : session_target option)
  ?session_id:(session_id_ : session_id option) () =
  ({
     access_type = access_type_;
     max_session_duration = max_session_duration_;
     output_url = output_url_;
     details = details_;
     reason = reason_;
     owner = owner_;
     document_name = document_name_;
     end_date = end_date_;
     start_date = start_date_;
     status = status_;
     target = target_;
     session_id = session_id_
   } : session)
let make_session_filter ~value:(value_ : session_filter_value)
  ~key:(key_ : session_filter_key) () =
  ({ value = value_; key = key_ } : session_filter)
let make_service_setting ?status:(status_ : string_ option)
  ?ar_n:(ar_n_ : string_ option)
  ?last_modified_user:(last_modified_user_ : string_ option)
  ?last_modified_date:(last_modified_date_ : date_time option)
  ?setting_value:(setting_value_ : service_setting_value option)
  ?setting_id:(setting_id_ : service_setting_id option) () =
  ({
     status = status_;
     ar_n = ar_n_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     setting_value = setting_value_;
     setting_id = setting_id_
   } : service_setting)
let make_command
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?timeout_seconds:(timeout_seconds_ : timeout_seconds option)
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
  ?notification_config:(notification_config_ : notification_config option)
  ?service_role:(service_role_ : service_role option)
  ?delivery_timed_out_count:(delivery_timed_out_count_ :
                              delivery_timed_out_count option)
  ?error_count:(error_count_ : error_count option)
  ?completed_count:(completed_count_ : completed_count option)
  ?target_count:(target_count_ : target_count option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
  ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
  ?output_s3_region:(output_s3_region_ : s3_region option)
  ?status_details:(status_details_ : status_details option)
  ?status:(status_ : command_status option)
  ?requested_date_time:(requested_date_time_ : date_time option)
  ?targets:(targets_ : targets option)
  ?instance_ids:(instance_ids_ : instance_id_list option)
  ?parameters:(parameters_ : parameters option)
  ?expires_after:(expires_after_ : date_time option)
  ?comment:(comment_ : comment option)
  ?document_version:(document_version_ : document_version option)
  ?document_name:(document_name_ : document_name option)
  ?command_id:(command_id_ : command_id option) () =
  ({
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     timeout_seconds = timeout_seconds_;
     cloud_watch_output_config = cloud_watch_output_config_;
     notification_config = notification_config_;
     service_role = service_role_;
     delivery_timed_out_count = delivery_timed_out_count_;
     error_count = error_count_;
     completed_count = completed_count_;
     target_count = target_count_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_region = output_s3_region_;
     status_details = status_details_;
     status = status_;
     requested_date_time = requested_date_time_;
     targets = targets_;
     instance_ids = instance_ids_;
     parameters = parameters_;
     expires_after = expires_after_;
     comment = comment_;
     document_version = document_version_;
     document_name = document_name_;
     command_id = command_id_
   } : command)
let make_send_command_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
  ?notification_config:(notification_config_ : notification_config option)
  ?service_role_arn:(service_role_arn_ : service_role option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
  ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
  ?output_s3_region:(output_s3_region_ : s3_region option)
  ?parameters:(parameters_ : parameters option)
  ?comment:(comment_ : comment option)
  ?timeout_seconds:(timeout_seconds_ : timeout_seconds option)
  ?document_hash_type:(document_hash_type_ : document_hash_type option)
  ?document_hash:(document_hash_ : document_hash option)
  ?document_version:(document_version_ : document_version option)
  ?targets:(targets_ : targets option)
  ?instance_ids:(instance_ids_ : instance_id_list option)
  ~document_name:(document_name_ : document_ar_n) () =
  ({
     alarm_configuration = alarm_configuration_;
     cloud_watch_output_config = cloud_watch_output_config_;
     notification_config = notification_config_;
     service_role_arn = service_role_arn_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_region = output_s3_region_;
     parameters = parameters_;
     comment = comment_;
     timeout_seconds = timeout_seconds_;
     document_hash_type = document_hash_type_;
     document_hash = document_hash_;
     document_version = document_version_;
     document_name = document_name_;
     targets = targets_;
     instance_ids = instance_ids_
   } : send_command_request)
let make_send_automation_signal_request
  ?payload:(payload_ : automation_parameter_map option)
  ~signal_type:(signal_type_ : signal_type)
  ~automation_execution_id:(automation_execution_id_ :
                             automation_execution_id)
  () =
  ({
     payload = payload_;
     signal_type = signal_type_;
     automation_execution_id = automation_execution_id_
   } : send_automation_signal_request)
let make_scheduled_window_execution
  ?execution_time:(execution_time_ :
                    maintenance_window_string_date_time option)
  ?name:(name_ : maintenance_window_name option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({ execution_time = execution_time_; name = name_; window_id = window_id_ } : 
  scheduled_window_execution)
let make_s3_output_url ?output_url:(output_url_ : url option) () =
  ({ output_url = output_url_ } : s3_output_url)
let make_resume_session_response
  ?stream_url:(stream_url_ : stream_url option)
  ?token_value:(token_value_ : token_value option)
  ?session_id:(session_id_ : session_id option) () =
  ({
     stream_url = stream_url_;
     token_value = token_value_;
     session_id = session_id_
   } : resume_session_response)
let make_resume_session_request ~session_id:(session_id_ : session_id) () =
  ({ session_id = session_id_ } : resume_session_request)
let make_result_attribute ~type_name:(type_name_ : inventory_item_type_name)
  () = ({ type_name = type_name_ } : result_attribute)
let make_resource_data_sync_source_with_state
  ?enable_all_ops_data_sources:(enable_all_ops_data_sources_ :
                                 resource_data_sync_enable_all_ops_data_sources
                                   option)
  ?state:(state_ : resource_data_sync_state option)
  ?include_future_regions:(include_future_regions_ :
                            resource_data_sync_include_future_regions option)
  ?source_regions:(source_regions_ :
                    resource_data_sync_source_region_list option)
  ?aws_organizations_source:(aws_organizations_source_ :
                              resource_data_sync_aws_organizations_source
                                option)
  ?source_type:(source_type_ : resource_data_sync_source_type option) () =
  ({
     enable_all_ops_data_sources = enable_all_ops_data_sources_;
     state = state_;
     include_future_regions = include_future_regions_;
     source_regions = source_regions_;
     aws_organizations_source = aws_organizations_source_;
     source_type = source_type_
   } : resource_data_sync_source_with_state)
let make_resource_data_sync_destination_data_sharing
  ?destination_data_sharing_type:(destination_data_sharing_type_ :
                                   resource_data_sync_destination_data_sharing_type
                                     option)
  () =
  ({ destination_data_sharing_type = destination_data_sharing_type_ } : 
  resource_data_sync_destination_data_sharing)
let make_resource_data_sync_s3_destination
  ?destination_data_sharing:(destination_data_sharing_ :
                              resource_data_sync_destination_data_sharing
                                option)
  ?awskms_key_ar_n:(awskms_key_ar_n_ :
                     resource_data_sync_awskms_key_ar_n option)
  ?prefix:(prefix_ : resource_data_sync_s3_prefix option)
  ~region:(region_ : resource_data_sync_s3_region)
  ~sync_format:(sync_format_ : resource_data_sync_s3_format)
  ~bucket_name:(bucket_name_ : resource_data_sync_s3_bucket_name) () =
  ({
     destination_data_sharing = destination_data_sharing_;
     awskms_key_ar_n = awskms_key_ar_n_;
     region = region_;
     sync_format = sync_format_;
     prefix = prefix_;
     bucket_name = bucket_name_
   } : resource_data_sync_s3_destination)
let make_resource_data_sync_item
  ?last_sync_status_message:(last_sync_status_message_ :
                              last_resource_data_sync_message option)
  ?sync_created_time:(sync_created_time_ :
                       resource_data_sync_created_time option)
  ?last_status:(last_status_ : last_resource_data_sync_status option)
  ?sync_last_modified_time:(sync_last_modified_time_ :
                             resource_data_sync_last_modified_time option)
  ?last_successful_sync_time:(last_successful_sync_time_ :
                               last_successful_resource_data_sync_time option)
  ?last_sync_time:(last_sync_time_ : last_resource_data_sync_time option)
  ?s3_destination:(s3_destination_ :
                    resource_data_sync_s3_destination option)
  ?sync_source:(sync_source_ : resource_data_sync_source_with_state option)
  ?sync_type:(sync_type_ : resource_data_sync_type option)
  ?sync_name:(sync_name_ : resource_data_sync_name option) () =
  ({
     last_sync_status_message = last_sync_status_message_;
     sync_created_time = sync_created_time_;
     last_status = last_status_;
     sync_last_modified_time = sync_last_modified_time_;
     last_successful_sync_time = last_successful_sync_time_;
     last_sync_time = last_sync_time_;
     s3_destination = s3_destination_;
     sync_source = sync_source_;
     sync_type = sync_type_;
     sync_name = sync_name_
   } : resource_data_sync_item)
let make_compliance_execution_summary
  ?execution_type:(execution_type_ : compliance_execution_type option)
  ?execution_id:(execution_id_ : compliance_execution_id option)
  ~execution_time:(execution_time_ : date_time) () =
  ({
     execution_type = execution_type_;
     execution_id = execution_id_;
     execution_time = execution_time_
   } : compliance_execution_summary)
let make_compliant_summary
  ?severity_summary:(severity_summary_ : severity_summary option)
  ?compliant_count:(compliant_count_ : compliance_summary_count option) () =
  ({ severity_summary = severity_summary_; compliant_count = compliant_count_
   } : compliant_summary)
let make_non_compliant_summary
  ?severity_summary:(severity_summary_ : severity_summary option)
  ?non_compliant_count:(non_compliant_count_ :
                         compliance_summary_count option)
  () =
  ({
     severity_summary = severity_summary_;
     non_compliant_count = non_compliant_count_
   } : non_compliant_summary)
let make_resource_compliance_summary_item
  ?non_compliant_summary:(non_compliant_summary_ :
                           non_compliant_summary option)
  ?compliant_summary:(compliant_summary_ : compliant_summary option)
  ?execution_summary:(execution_summary_ :
                       compliance_execution_summary option)
  ?overall_severity:(overall_severity_ : compliance_severity option)
  ?status:(status_ : compliance_status option)
  ?resource_id:(resource_id_ : compliance_resource_id option)
  ?resource_type:(resource_type_ : compliance_resource_type option)
  ?compliance_type:(compliance_type_ : compliance_type_name option) () =
  ({
     non_compliant_summary = non_compliant_summary_;
     compliant_summary = compliant_summary_;
     execution_summary = execution_summary_;
     overall_severity = overall_severity_;
     status = status_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     compliance_type = compliance_type_
   } : resource_compliance_summary_item)
let make_resolved_targets ?truncated:(truncated_ : boolean_ option)
  ?parameter_values:(parameter_values_ : target_parameter_list option) () =
  ({ truncated = truncated_; parameter_values = parameter_values_ } : 
  resolved_targets)
let make_reset_service_setting_request
  ~setting_id:(setting_id_ : service_setting_id) () =
  ({ setting_id = setting_id_ } : reset_service_setting_request)
let make_remove_tags_from_resource_request ~tag_keys:(tag_keys_ : key_list)
  ~resource_id:(resource_id_ : resource_id)
  ~resource_type:(resource_type_ : resource_type_for_tagging) () =
  ({
     tag_keys = tag_keys_;
     resource_id = resource_id_;
     resource_type = resource_type_
   } : remove_tags_from_resource_request)
let make_registration_metadata_item
  ~value:(value_ : registration_metadata_value)
  ~key:(key_ : registration_metadata_key) () =
  ({ value = value_; key = key_ } : registration_metadata_item)
let make_register_task_with_maintenance_window_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?logging_info:(logging_info_ : logging_info option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?priority:(priority_ : maintenance_window_task_priority option)
  ?task_invocation_parameters:(task_invocation_parameters_ :
                                maintenance_window_task_invocation_parameters
                                  option)
  ?task_parameters:(task_parameters_ :
                     maintenance_window_task_parameters option)
  ?service_role_arn:(service_role_arn_ : service_role option)
  ?targets:(targets_ : targets option)
  ~task_type:(task_type_ : maintenance_window_task_type)
  ~task_arn:(task_arn_ : maintenance_window_task_arn)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     alarm_configuration = alarm_configuration_;
     cutoff_behavior = cutoff_behavior_;
     client_token = client_token_;
     description = description_;
     name = name_;
     logging_info = logging_info_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     priority = priority_;
     task_invocation_parameters = task_invocation_parameters_;
     task_parameters = task_parameters_;
     task_type = task_type_;
     service_role_arn = service_role_arn_;
     task_arn = task_arn_;
     targets = targets_;
     window_id = window_id_
   } : register_task_with_maintenance_window_request)
let make_register_target_with_maintenance_window_request
  ?client_token:(client_token_ : client_token option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?owner_information:(owner_information_ : owner_information option)
  ~targets:(targets_ : targets)
  ~resource_type:(resource_type_ : maintenance_window_resource_type)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     client_token = client_token_;
     description = description_;
     name = name_;
     owner_information = owner_information_;
     targets = targets_;
     resource_type = resource_type_;
     window_id = window_id_
   } : register_target_with_maintenance_window_request)
let make_register_patch_baseline_for_patch_group_request
  ~patch_group:(patch_group_ : patch_group)
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ patch_group = patch_group_; baseline_id = baseline_id_ } : register_patch_baseline_for_patch_group_request)
let make_register_default_patch_baseline_request
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_ } : register_default_patch_baseline_request)
let make_put_resource_policy_response
  ?policy_hash:(policy_hash_ : policy_hash option)
  ?policy_id:(policy_id_ : policy_id option) () =
  ({ policy_hash = policy_hash_; policy_id = policy_id_ } : put_resource_policy_response)
let make_put_resource_policy_request
  ?policy_hash:(policy_hash_ : policy_hash option)
  ?policy_id:(policy_id_ : policy_id option) ~policy:(policy_ : policy)
  ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({
     policy_hash = policy_hash_;
     policy_id = policy_id_;
     policy = policy_;
     resource_arn = resource_arn_
   } : put_resource_policy_request)
let make_put_parameter_request
  ?data_type:(data_type_ : parameter_data_type option)
  ?policies:(policies_ : parameter_policies option)
  ?tier:(tier_ : parameter_tier option) ?tags:(tags_ : tag_list option)
  ?allowed_pattern:(allowed_pattern_ : allowed_pattern option)
  ?overwrite:(overwrite_ : boolean_ option)
  ?key_id:(key_id_ : parameter_key_id option)
  ?type_:(type__ : parameter_type option)
  ?description:(description_ : parameter_description option)
  ~value:(value_ : ps_parameter_value) ~name:(name_ : ps_parameter_name) () =
  ({
     data_type = data_type_;
     policies = policies_;
     tier = tier_;
     tags = tags_;
     allowed_pattern = allowed_pattern_;
     overwrite = overwrite_;
     key_id = key_id_;
     type_ = type__;
     value = value_;
     description = description_;
     name = name_
   } : put_parameter_request)
let make_inventory_item
  ?context:(context_ : inventory_item_content_context option)
  ?content:(content_ : inventory_item_entry_list option)
  ?content_hash:(content_hash_ : inventory_item_content_hash option)
  ~capture_time:(capture_time_ : inventory_item_capture_time)
  ~schema_version:(schema_version_ : inventory_item_schema_version)
  ~type_name:(type_name_ : inventory_item_type_name) () =
  ({
     context = context_;
     content = content_;
     content_hash = content_hash_;
     capture_time = capture_time_;
     schema_version = schema_version_;
     type_name = type_name_
   } : inventory_item)
let make_put_inventory_request ~items:(items_ : inventory_item_list)
  ~instance_id:(instance_id_ : instance_id) () =
  ({ items = items_; instance_id = instance_id_ } : put_inventory_request)
let make_compliance_item_entry
  ?details:(details_ : compliance_item_details option)
  ?title:(title_ : compliance_item_title option)
  ?id:(id_ : compliance_item_id option) ~status:(status_ : compliance_status)
  ~severity:(severity_ : compliance_severity) () =
  ({
     details = details_;
     status = status_;
     severity = severity_;
     title = title_;
     id = id_
   } : compliance_item_entry)
let make_put_compliance_items_request
  ?upload_type:(upload_type_ : compliance_upload_type option)
  ?item_content_hash:(item_content_hash_ :
                       compliance_item_content_hash option)
  ~items:(items_ : compliance_item_entry_list)
  ~execution_summary:(execution_summary_ : compliance_execution_summary)
  ~compliance_type:(compliance_type_ : compliance_type_name)
  ~resource_type:(resource_type_ : compliance_resource_type)
  ~resource_id:(resource_id_ : compliance_resource_id) () =
  ({
     upload_type = upload_type_;
     item_content_hash = item_content_hash_;
     items = items_;
     execution_summary = execution_summary_;
     compliance_type = compliance_type_;
     resource_type = resource_type_;
     resource_id = resource_id_
   } : put_compliance_items_request)
let make_progress_counters
  ?timed_out_steps:(timed_out_steps_ : integer option)
  ?cancelled_steps:(cancelled_steps_ : integer option)
  ?failed_steps:(failed_steps_ : integer option)
  ?success_steps:(success_steps_ : integer option)
  ?total_steps:(total_steps_ : integer option) () =
  ({
     timed_out_steps = timed_out_steps_;
     cancelled_steps = cancelled_steps_;
     failed_steps = failed_steps_;
     success_steps = success_steps_;
     total_steps = total_steps_
   } : progress_counters)
let make_patch_status ?approval_date:(approval_date_ : date_time option)
  ?compliance_level:(compliance_level_ : patch_compliance_level option)
  ?deployment_status:(deployment_status_ : patch_deployment_status option) ()
  =
  ({
     approval_date = approval_date_;
     compliance_level = compliance_level_;
     deployment_status = deployment_status_
   } : patch_status)
let make_patch_orchestrator_filter
  ?values:(values_ : patch_orchestrator_filter_values option)
  ?key:(key_ : patch_orchestrator_filter_key option) () =
  ({ values = values_; key = key_ } : patch_orchestrator_filter)
let make_patch ?repository:(repository_ : patch_repository option)
  ?severity:(severity_ : patch_severity option)
  ?arch:(arch_ : patch_arch option)
  ?release:(release_ : patch_release option)
  ?version:(version_ : patch_version option)
  ?epoch:(epoch_ : patch_epoch option) ?name:(name_ : patch_name option)
  ?cve_ids:(cve_ids_ : patch_cve_id_list option)
  ?bugzilla_ids:(bugzilla_ids_ : patch_bugzilla_id_list option)
  ?advisory_ids:(advisory_ids_ : patch_advisory_id_list option)
  ?language:(language_ : patch_language option)
  ?msrc_number:(msrc_number_ : patch_msrc_number option)
  ?kb_number:(kb_number_ : patch_kb_number option)
  ?msrc_severity:(msrc_severity_ : patch_msrc_severity option)
  ?classification:(classification_ : patch_classification option)
  ?product:(product_ : patch_product option)
  ?product_family:(product_family_ : patch_product_family option)
  ?vendor:(vendor_ : patch_vendor option)
  ?content_url:(content_url_ : patch_content_url option)
  ?description:(description_ : patch_description option)
  ?title:(title_ : patch_title option)
  ?release_date:(release_date_ : date_time option)
  ?id:(id_ : patch_id option) () =
  ({
     repository = repository_;
     severity = severity_;
     arch = arch_;
     release = release_;
     version = version_;
     epoch = epoch_;
     name = name_;
     cve_ids = cve_ids_;
     bugzilla_ids = bugzilla_ids_;
     advisory_ids = advisory_ids_;
     language = language_;
     msrc_number = msrc_number_;
     kb_number = kb_number_;
     msrc_severity = msrc_severity_;
     classification = classification_;
     product = product_;
     product_family = product_family_;
     vendor = vendor_;
     content_url = content_url_;
     description = description_;
     title = title_;
     release_date = release_date_;
     id = id_
   } : patch)
let make_patch_baseline_identity
  ?default_baseline:(default_baseline_ : default_baseline option)
  ?baseline_description:(baseline_description_ : baseline_description option)
  ?operating_system:(operating_system_ : operating_system option)
  ?baseline_name:(baseline_name_ : baseline_name option)
  ?baseline_id:(baseline_id_ : baseline_id option) () =
  ({
     default_baseline = default_baseline_;
     baseline_description = baseline_description_;
     operating_system = operating_system_;
     baseline_name = baseline_name_;
     baseline_id = baseline_id_
   } : patch_baseline_identity)
let make_patch_group_patch_baseline_mapping
  ?baseline_identity:(baseline_identity_ : patch_baseline_identity option)
  ?patch_group:(patch_group_ : patch_group option) () =
  ({ baseline_identity = baseline_identity_; patch_group = patch_group_ } : 
  patch_group_patch_baseline_mapping)
let make_patch_compliance_data ?cve_ids:(cve_ids_ : patch_cve_ids option)
  ~installed_time:(installed_time_ : date_time)
  ~state:(state_ : patch_compliance_data_state)
  ~severity:(severity_ : patch_severity)
  ~classification:(classification_ : patch_classification)
  ~kb_id:(kb_id_ : patch_kb_number) ~title:(title_ : patch_title) () =
  ({
     cve_ids = cve_ids_;
     installed_time = installed_time_;
     state = state_;
     severity = severity_;
     classification = classification_;
     kb_id = kb_id_;
     title = title_
   } : patch_compliance_data)
let make_parameters_filter ~values:(values_ : parameters_filter_value_list)
  ~key:(key_ : parameters_filter_key) () =
  ({ values = values_; key = key_ } : parameters_filter)
let make_parameter_string_filter
  ?values:(values_ : parameter_string_filter_value_list option)
  ?option_:(option__ : parameter_string_query_option option)
  ~key:(key_ : parameter_string_filter_key) () =
  ({ values = values_; option_ = option__; key = key_ } : parameter_string_filter)
let make_parameter_inline_policy
  ?policy_status:(policy_status_ : string_ option)
  ?policy_type:(policy_type_ : string_ option)
  ?policy_text:(policy_text_ : string_ option) () =
  ({
     policy_status = policy_status_;
     policy_type = policy_type_;
     policy_text = policy_text_
   } : parameter_inline_policy)
let make_parameter_metadata
  ?data_type:(data_type_ : parameter_data_type option)
  ?policies:(policies_ : parameter_policy_list option)
  ?tier:(tier_ : parameter_tier option)
  ?version:(version_ : ps_parameter_version option)
  ?allowed_pattern:(allowed_pattern_ : allowed_pattern option)
  ?description:(description_ : parameter_description option)
  ?last_modified_user:(last_modified_user_ : string_ option)
  ?last_modified_date:(last_modified_date_ : date_time option)
  ?key_id:(key_id_ : parameter_key_id option)
  ?type_:(type__ : parameter_type option) ?ar_n:(ar_n_ : string_ option)
  ?name:(name_ : ps_parameter_name option) () =
  ({
     data_type = data_type_;
     policies = policies_;
     tier = tier_;
     version = version_;
     allowed_pattern = allowed_pattern_;
     description = description_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     key_id = key_id_;
     type_ = type__;
     ar_n = ar_n_;
     name = name_
   } : parameter_metadata)
let make_parameter ?data_type:(data_type_ : parameter_data_type option)
  ?ar_n:(ar_n_ : string_ option)
  ?last_modified_date:(last_modified_date_ : date_time option)
  ?source_result:(source_result_ : string_ option)
  ?selector:(selector_ : ps_parameter_selector option)
  ?version:(version_ : ps_parameter_version option)
  ?value:(value_ : ps_parameter_value option)
  ?type_:(type__ : parameter_type option)
  ?name:(name_ : ps_parameter_name option) () =
  ({
     data_type = data_type_;
     ar_n = ar_n_;
     last_modified_date = last_modified_date_;
     source_result = source_result_;
     selector = selector_;
     version = version_;
     value = value_;
     type_ = type__;
     name = name_
   } : parameter)
let make_parameter_history
  ?data_type:(data_type_ : parameter_data_type option)
  ?policies:(policies_ : parameter_policy_list option)
  ?tier:(tier_ : parameter_tier option)
  ?labels:(labels_ : parameter_label_list option)
  ?version:(version_ : ps_parameter_version option)
  ?allowed_pattern:(allowed_pattern_ : allowed_pattern option)
  ?value:(value_ : ps_parameter_value option)
  ?description:(description_ : parameter_description option)
  ?last_modified_user:(last_modified_user_ : string_ option)
  ?last_modified_date:(last_modified_date_ : date_time option)
  ?key_id:(key_id_ : parameter_key_id option)
  ?type_:(type__ : parameter_type option)
  ?name:(name_ : ps_parameter_name option) () =
  ({
     data_type = data_type_;
     policies = policies_;
     tier = tier_;
     labels = labels_;
     version = version_;
     allowed_pattern = allowed_pattern_;
     value = value_;
     description = description_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     key_id = key_id_;
     type_ = type__;
     name = name_
   } : parameter_history)
let make_output_source
  ?output_source_type:(output_source_type_ : output_source_type option)
  ?output_source_id:(output_source_id_ : output_source_id option) () =
  ({
     output_source_type = output_source_type_;
     output_source_id = output_source_id_
   } : output_source)
let make_ops_result_attribute ~type_name:(type_name_ : ops_data_type_name) ()
  = ({ type_name = type_name_ } : ops_result_attribute)
let make_ops_metadata ?creation_date:(creation_date_ : date_time option)
  ?last_modified_user:(last_modified_user_ : string_ option)
  ?last_modified_date:(last_modified_date_ : date_time option)
  ?ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn option)
  ?resource_id:(resource_id_ : ops_metadata_resource_id option) () =
  ({
     creation_date = creation_date_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     ops_metadata_arn = ops_metadata_arn_;
     resource_id = resource_id_
   } : ops_metadata)
let make_ops_metadata_filter
  ~values:(values_ : ops_metadata_filter_value_list)
  ~key:(key_ : ops_metadata_filter_key) () =
  ({ values = values_; key = key_ } : ops_metadata_filter)
let make_ops_item_summary
  ?planned_end_time:(planned_end_time_ : date_time option)
  ?planned_start_time:(planned_start_time_ : date_time option)
  ?actual_end_time:(actual_end_time_ : date_time option)
  ?actual_start_time:(actual_start_time_ : date_time option)
  ?ops_item_type:(ops_item_type_ : ops_item_type option)
  ?severity:(severity_ : ops_item_severity option)
  ?category:(category_ : ops_item_category option)
  ?operational_data:(operational_data_ : ops_item_operational_data option)
  ?title:(title_ : ops_item_title option)
  ?ops_item_id:(ops_item_id_ : ops_item_id option)
  ?status:(status_ : ops_item_status option)
  ?source:(source_ : ops_item_source option)
  ?priority:(priority_ : ops_item_priority option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?last_modified_by:(last_modified_by_ : string_ option)
  ?created_time:(created_time_ : date_time option)
  ?created_by:(created_by_ : string_ option) () =
  ({
     planned_end_time = planned_end_time_;
     planned_start_time = planned_start_time_;
     actual_end_time = actual_end_time_;
     actual_start_time = actual_start_time_;
     ops_item_type = ops_item_type_;
     severity = severity_;
     category = category_;
     operational_data = operational_data_;
     title = title_;
     ops_item_id = ops_item_id_;
     status = status_;
     source = source_;
     priority = priority_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     created_time = created_time_;
     created_by = created_by_
   } : ops_item_summary)
let make_ops_item_related_items_filter
  ~operator:(operator_ : ops_item_related_items_filter_operator)
  ~values:(values_ : ops_item_related_items_filter_values)
  ~key:(key_ : ops_item_related_items_filter_key) () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_related_items_filter)
let make_ops_item_identity ?arn:(arn_ : string_ option) () =
  ({ arn = arn_ } : ops_item_identity)
let make_ops_item_related_item_summary
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?last_modified_by:(last_modified_by_ : ops_item_identity option)
  ?created_time:(created_time_ : date_time option)
  ?created_by:(created_by_ : ops_item_identity option)
  ?resource_uri:(resource_uri_ :
                  ops_item_related_item_association_resource_uri option)
  ?association_type:(association_type_ :
                      ops_item_related_item_association_type option)
  ?resource_type:(resource_type_ :
                   ops_item_related_item_association_resource_type option)
  ?association_id:(association_id_ :
                    ops_item_related_item_association_id option)
  ?ops_item_id:(ops_item_id_ : ops_item_id option) () =
  ({
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     created_time = created_time_;
     created_by = created_by_;
     resource_uri = resource_uri_;
     association_type = association_type_;
     resource_type = resource_type_;
     association_id = association_id_;
     ops_item_id = ops_item_id_
   } : ops_item_related_item_summary)
let make_ops_item_filter ~operator:(operator_ : ops_item_filter_operator)
  ~values:(values_ : ops_item_filter_values)
  ~key:(key_ : ops_item_filter_key) () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_filter)
let make_ops_item_event_summary
  ?created_time:(created_time_ : date_time option)
  ?created_by:(created_by_ : ops_item_identity option)
  ?detail:(detail_ : string_ option)
  ?detail_type:(detail_type_ : string_ option)
  ?source:(source_ : string_ option) ?event_id:(event_id_ : string_ option)
  ?ops_item_id:(ops_item_id_ : string_ option) () =
  ({
     created_time = created_time_;
     created_by = created_by_;
     detail = detail_;
     detail_type = detail_type_;
     source = source_;
     event_id = event_id_;
     ops_item_id = ops_item_id_
   } : ops_item_event_summary)
let make_ops_item_event_filter
  ~operator:(operator_ : ops_item_event_filter_operator)
  ~values:(values_ : ops_item_event_filter_values)
  ~key:(key_ : ops_item_event_filter_key) () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_event_filter)
let make_ops_item ?ops_item_arn:(ops_item_arn_ : ops_item_arn option)
  ?planned_end_time:(planned_end_time_ : date_time option)
  ?planned_start_time:(planned_start_time_ : date_time option)
  ?actual_end_time:(actual_end_time_ : date_time option)
  ?actual_start_time:(actual_start_time_ : date_time option)
  ?severity:(severity_ : ops_item_severity option)
  ?category:(category_ : ops_item_category option)
  ?operational_data:(operational_data_ : ops_item_operational_data option)
  ?source:(source_ : ops_item_source option)
  ?title:(title_ : ops_item_title option)
  ?version:(version_ : string_ option)
  ?ops_item_id:(ops_item_id_ : ops_item_id option)
  ?status:(status_ : ops_item_status option)
  ?related_ops_items:(related_ops_items_ : related_ops_items option)
  ?priority:(priority_ : ops_item_priority option)
  ?notifications:(notifications_ : ops_item_notifications option)
  ?last_modified_time:(last_modified_time_ : date_time option)
  ?last_modified_by:(last_modified_by_ : string_ option)
  ?description:(description_ : ops_item_description option)
  ?created_time:(created_time_ : date_time option)
  ?ops_item_type:(ops_item_type_ : ops_item_type option)
  ?created_by:(created_by_ : string_ option) () =
  ({
     ops_item_arn = ops_item_arn_;
     planned_end_time = planned_end_time_;
     planned_start_time = planned_start_time_;
     actual_end_time = actual_end_time_;
     actual_start_time = actual_start_time_;
     severity = severity_;
     category = category_;
     operational_data = operational_data_;
     source = source_;
     title = title_;
     version = version_;
     ops_item_id = ops_item_id_;
     status = status_;
     related_ops_items = related_ops_items_;
     priority = priority_;
     notifications = notifications_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     description = description_;
     created_time = created_time_;
     ops_item_type = ops_item_type_;
     created_by = created_by_
   } : ops_item)
let make_ops_filter ?type_:(type__ : ops_filter_operator_type option)
  ~values:(values_ : ops_filter_value_list) ~key:(key_ : ops_filter_key) () =
  ({ type_ = type__; values = values_; key = key_ } : ops_filter)
let make_ops_entity_item
  ?content:(content_ : ops_entity_item_entry_list option)
  ?capture_time:(capture_time_ : ops_entity_item_capture_time option) () =
  ({ content = content_; capture_time = capture_time_ } : ops_entity_item)
let make_ops_entity ?data:(data_ : ops_entity_item_map option)
  ?id:(id_ : ops_entity_id option) () =
  ({ data = data_; id = id_ } : ops_entity)
let make_ops_aggregator
  ?aggregators:(aggregators_ : ops_aggregator_list option)
  ?filters:(filters_ : ops_filter_list option)
  ?values:(values_ : ops_aggregator_value_map option)
  ?attribute_name:(attribute_name_ : ops_data_attribute_name option)
  ?type_name:(type_name_ : ops_data_type_name option)
  ?aggregator_type:(aggregator_type_ : ops_aggregator_type option) () =
  ({
     aggregators = aggregators_;
     filters = filters_;
     values = values_;
     attribute_name = attribute_name_;
     type_name = type_name_;
     aggregator_type = aggregator_type_
   } : ops_aggregator)
let make_instance_info ?resource_type:(resource_type_ : resource_type option)
  ?platform_version:(platform_version_ : platform_version option)
  ?platform_name:(platform_name_ : platform_name option)
  ?platform_type:(platform_type_ : platform_type option)
  ?managed_status:(managed_status_ : managed_status option)
  ?ip_address:(ip_address_ : ip_address option)
  ?instance_status:(instance_status_ : instance_status option)
  ?computer_name:(computer_name_ : computer_name option)
  ?agent_version:(agent_version_ : agent_version option)
  ?agent_type:(agent_type_ : agent_type option) () =
  ({
     resource_type = resource_type_;
     platform_version = platform_version_;
     platform_name = platform_name_;
     platform_type = platform_type_;
     managed_status = managed_status_;
     ip_address = ip_address_;
     instance_status = instance_status_;
     computer_name = computer_name_;
     agent_version = agent_version_;
     agent_type = agent_type_
   } : instance_info)
let make_node_owner_info
  ?organizational_unit_path:(organizational_unit_path_ :
                              node_organizational_unit_path option)
  ?organizational_unit_id:(organizational_unit_id_ :
                            node_organizational_unit_id option)
  ?account_id:(account_id_ : node_account_id option) () =
  ({
     organizational_unit_path = organizational_unit_path_;
     organizational_unit_id = organizational_unit_id_;
     account_id = account_id_
   } : node_owner_info)
let make_node ?node_type:(node_type_ : node_type option)
  ?region:(region_ : node_region option)
  ?owner:(owner_ : node_owner_info option) ?id:(id_ : node_id option)
  ?capture_time:(capture_time_ : node_capture_time option) () =
  ({
     node_type = node_type_;
     region = region_;
     owner = owner_;
     id = id_;
     capture_time = capture_time_
   } : node)
let make_node_filter ?type_:(type__ : node_filter_operator_type option)
  ~values:(values_ : node_filter_value_list) ~key:(key_ : node_filter_key) ()
  = ({ type_ = type__; values = values_; key = key_ } : node_filter)
let make_node_aggregator
  ?aggregators:(aggregators_ : node_aggregator_list option)
  ~attribute_name:(attribute_name_ : node_attribute_name)
  ~type_name:(type_name_ : node_type_name)
  ~aggregator_type:(aggregator_type_ : node_aggregator_type) () =
  ({
     aggregators = aggregators_;
     attribute_name = attribute_name_;
     type_name = type_name_;
     aggregator_type = aggregator_type_
   } : node_aggregator)
let make_modify_document_permission_response () = (() : unit)
let make_modify_document_permission_request
  ?shared_document_version:(shared_document_version_ :
                             shared_document_version option)
  ?account_ids_to_remove:(account_ids_to_remove_ : account_id_list option)
  ?account_ids_to_add:(account_ids_to_add_ : account_id_list option)
  ~permission_type:(permission_type_ : document_permission_type)
  ~name:(name_ : document_name) () =
  ({
     shared_document_version = shared_document_version_;
     account_ids_to_remove = account_ids_to_remove_;
     account_ids_to_add = account_ids_to_add_;
     permission_type = permission_type_;
     name = name_
   } : modify_document_permission_request)
let make_maintenance_window_identity_for_target
  ?name:(name_ : maintenance_window_name option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({ name = name_; window_id = window_id_ } : maintenance_window_identity_for_target)
let make_maintenance_window_task
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?service_role_arn:(service_role_arn_ : service_role option)
  ?logging_info:(logging_info_ : logging_info option)
  ?priority:(priority_ : maintenance_window_task_priority option)
  ?task_parameters:(task_parameters_ :
                     maintenance_window_task_parameters option)
  ?targets:(targets_ : targets option)
  ?type_:(type__ : maintenance_window_task_type option)
  ?task_arn:(task_arn_ : maintenance_window_task_arn option)
  ?window_task_id:(window_task_id_ : maintenance_window_task_id option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({
     alarm_configuration = alarm_configuration_;
     cutoff_behavior = cutoff_behavior_;
     description = description_;
     name = name_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     service_role_arn = service_role_arn_;
     logging_info = logging_info_;
     priority = priority_;
     task_parameters = task_parameters_;
     targets = targets_;
     type_ = type__;
     task_arn = task_arn_;
     window_task_id = window_task_id_;
     window_id = window_id_
   } : maintenance_window_task)
let make_maintenance_window_target
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?owner_information:(owner_information_ : owner_information option)
  ?targets:(targets_ : targets option)
  ?resource_type:(resource_type_ : maintenance_window_resource_type option)
  ?window_target_id:(window_target_id_ : maintenance_window_target_id option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({
     description = description_;
     name = name_;
     owner_information = owner_information_;
     targets = targets_;
     resource_type = resource_type_;
     window_target_id = window_target_id_;
     window_id = window_id_
   } : maintenance_window_target)
let make_maintenance_window_identity
  ?next_execution_time:(next_execution_time_ :
                         maintenance_window_string_date_time option)
  ?start_date:(start_date_ : maintenance_window_string_date_time option)
  ?end_date:(end_date_ : maintenance_window_string_date_time option)
  ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
  ?schedule_timezone:(schedule_timezone_ :
                       maintenance_window_timezone option)
  ?schedule:(schedule_ : maintenance_window_schedule option)
  ?cutoff:(cutoff_ : maintenance_window_cutoff option)
  ?duration:(duration_ : maintenance_window_duration_hours option)
  ?enabled:(enabled_ : maintenance_window_enabled option)
  ?description:(description_ : maintenance_window_description option)
  ?name:(name_ : maintenance_window_name option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({
     next_execution_time = next_execution_time_;
     start_date = start_date_;
     end_date = end_date_;
     schedule_offset = schedule_offset_;
     schedule_timezone = schedule_timezone_;
     schedule = schedule_;
     cutoff = cutoff_;
     duration = duration_;
     enabled = enabled_;
     description = description_;
     name = name_;
     window_id = window_id_
   } : maintenance_window_identity)
let make_maintenance_window_filter
  ?values:(values_ : maintenance_window_filter_values option)
  ?key:(key_ : maintenance_window_filter_key option) () =
  ({ values = values_; key = key_ } : maintenance_window_filter)
let make_maintenance_window_execution_task_invocation_identity
  ?window_target_id:(window_target_id_ :
                      maintenance_window_task_target_id option)
  ?owner_information:(owner_information_ : owner_information option)
  ?end_time:(end_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?status_details:(status_details_ :
                    maintenance_window_execution_status_details option)
  ?status:(status_ : maintenance_window_execution_status option)
  ?parameters:(parameters_ :
                maintenance_window_execution_task_invocation_parameters
                  option)
  ?task_type:(task_type_ : maintenance_window_task_type option)
  ?execution_id:(execution_id_ :
                  maintenance_window_execution_task_execution_id option)
  ?invocation_id:(invocation_id_ :
                   maintenance_window_execution_task_invocation_id option)
  ?task_execution_id:(task_execution_id_ :
                       maintenance_window_execution_task_id option)
  ?window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id option)
  () =
  ({
     window_target_id = window_target_id_;
     owner_information = owner_information_;
     end_time = end_time_;
     start_time = start_time_;
     status_details = status_details_;
     status = status_;
     parameters = parameters_;
     task_type = task_type_;
     execution_id = execution_id_;
     invocation_id = invocation_id_;
     task_execution_id = task_execution_id_;
     window_execution_id = window_execution_id_
   } : maintenance_window_execution_task_invocation_identity)
let make_maintenance_window_execution_task_identity
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?task_type:(task_type_ : maintenance_window_task_type option)
  ?task_arn:(task_arn_ : maintenance_window_task_arn option)
  ?end_time:(end_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?status_details:(status_details_ :
                    maintenance_window_execution_status_details option)
  ?status:(status_ : maintenance_window_execution_status option)
  ?task_execution_id:(task_execution_id_ :
                       maintenance_window_execution_task_id option)
  ?window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id option)
  () =
  ({
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     task_type = task_type_;
     task_arn = task_arn_;
     end_time = end_time_;
     start_time = start_time_;
     status_details = status_details_;
     status = status_;
     task_execution_id = task_execution_id_;
     window_execution_id = window_execution_id_
   } : maintenance_window_execution_task_identity)
let make_maintenance_window_execution
  ?end_time:(end_time_ : date_time option)
  ?start_time:(start_time_ : date_time option)
  ?status_details:(status_details_ :
                    maintenance_window_execution_status_details option)
  ?status:(status_ : maintenance_window_execution_status option)
  ?window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     status_details = status_details_;
     status = status_;
     window_execution_id = window_execution_id_;
     window_id = window_id_
   } : maintenance_window_execution)
let make_list_tags_for_resource_request
  ~resource_id:(resource_id_ : resource_id)
  ~resource_type:(resource_type_ : resource_type_for_tagging) () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : list_tags_for_resource_request)
let make_list_resource_data_sync_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?sync_type:(sync_type_ : resource_data_sync_type option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sync_type = sync_type_
   } : list_resource_data_sync_request)
let make_compliance_string_filter
  ?type_:(type__ : compliance_query_operator_type option)
  ?values:(values_ : compliance_string_filter_value_list option)
  ?key:(key_ : compliance_string_filter_key option) () =
  ({ type_ = type__; values = values_; key = key_ } : compliance_string_filter)
let make_list_resource_compliance_summaries_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : compliance_string_filter_list option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_
   } : list_resource_compliance_summaries_request)
let make_list_ops_metadata_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : list_ops_metadata_max_results option)
  ?filters:(filters_ : ops_metadata_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : list_ops_metadata_request)
let make_list_ops_item_related_items_response
  ?summaries:(summaries_ : ops_item_related_item_summaries option)
  ?next_token:(next_token_ : string_ option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_ops_item_related_items_response)
let make_list_ops_item_related_items_request
  ?next_token:(next_token_ : string_ option)
  ?max_results:(max_results_ : ops_item_related_items_max_results option)
  ?filters:(filters_ : ops_item_related_items_filters option)
  ?ops_item_id:(ops_item_id_ : ops_item_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     ops_item_id = ops_item_id_
   } : list_ops_item_related_items_request)
let make_list_ops_item_events_response
  ?summaries:(summaries_ : ops_item_event_summaries option)
  ?next_token:(next_token_ : string_ option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_ops_item_events_response)
let make_list_ops_item_events_request
  ?next_token:(next_token_ : string_ option)
  ?max_results:(max_results_ : ops_item_event_max_results option)
  ?filters:(filters_ : ops_item_event_filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : list_ops_item_events_request)
let make_list_nodes_summary_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : node_filter_list option)
  ?sync_name:(sync_name_ : resource_data_sync_name option)
  ~aggregators:(aggregators_ : node_aggregator_list) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     aggregators = aggregators_;
     filters = filters_;
     sync_name = sync_name_
   } : list_nodes_summary_request)
let make_list_nodes_request ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : node_filter_list option)
  ?sync_name:(sync_name_ : resource_data_sync_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     sync_name = sync_name_
   } : list_nodes_request)
let make_inventory_filter
  ?type_:(type__ : inventory_query_operator_type option)
  ~values:(values_ : inventory_filter_value_list)
  ~key:(key_ : inventory_filter_key) () =
  ({ type_ = type__; values = values_; key = key_ } : inventory_filter)
let make_list_inventory_entries_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : inventory_filter_list option)
  ~type_name:(type_name_ : inventory_item_type_name)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     type_name = type_name_;
     instance_id = instance_id_
   } : list_inventory_entries_request)
let make_document_identifier ?author:(author_ : document_author option)
  ?review_status:(review_status_ : review_status option)
  ?requires:(requires_ : document_requires_list option)
  ?tags:(tags_ : tag_list option)
  ?target_type:(target_type_ : target_type option)
  ?document_format:(document_format_ : document_format option)
  ?schema_version:(schema_version_ : document_schema_version option)
  ?document_type:(document_type_ : document_type option)
  ?document_version:(document_version_ : document_version option)
  ?platform_types:(platform_types_ : platform_type_list option)
  ?version_name:(version_name_ : document_version_name option)
  ?owner:(owner_ : document_owner option)
  ?display_name:(display_name_ : document_display_name option)
  ?created_date:(created_date_ : date_time option)
  ?name:(name_ : document_ar_n option) () =
  ({
     author = author_;
     review_status = review_status_;
     requires = requires_;
     tags = tags_;
     target_type = target_type_;
     document_format = document_format_;
     schema_version = schema_version_;
     document_type = document_type_;
     document_version = document_version_;
     platform_types = platform_types_;
     version_name = version_name_;
     owner = owner_;
     display_name = display_name_;
     created_date = created_date_;
     name = name_
   } : document_identifier)
let make_document_filter ~value:(value_ : document_filter_value)
  ~key:(key_ : document_filter_key) () =
  ({ value = value_; key = key_ } : document_filter)
let make_document_key_values_filter
  ?values:(values_ : document_key_values_filter_values option)
  ?key:(key_ : document_key_values_filter_key option) () =
  ({ values = values_; key = key_ } : document_key_values_filter)
let make_list_documents_request ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?filters:(filters_ : document_key_values_filter_list option)
  ?document_filter_list:(document_filter_list_ : document_filter_list option)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     document_filter_list = document_filter_list_
   } : list_documents_request)
let make_document_version_info
  ?review_status:(review_status_ : review_status option)
  ?status_information:(status_information_ :
                        document_status_information option)
  ?status:(status_ : document_status option)
  ?document_format:(document_format_ : document_format option)
  ?is_default_version:(is_default_version_ : boolean_ option)
  ?created_date:(created_date_ : date_time option)
  ?version_name:(version_name_ : document_version_name option)
  ?document_version:(document_version_ : document_version option)
  ?display_name:(display_name_ : document_display_name option)
  ?name:(name_ : document_name option) () =
  ({
     review_status = review_status_;
     status_information = status_information_;
     status = status_;
     document_format = document_format_;
     is_default_version = is_default_version_;
     created_date = created_date_;
     version_name = version_name_;
     document_version = document_version_;
     display_name = display_name_;
     name = name_
   } : document_version_info)
let make_list_document_versions_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ~name:(name_ : document_ar_n) () =
  ({ next_token = next_token_; max_results = max_results_; name = name_ } : 
  list_document_versions_request)
let make_document_reviewer_response_source
  ?reviewer:(reviewer_ : reviewer option)
  ?comment:(comment_ : document_review_comment_list option)
  ?review_status:(review_status_ : review_status option)
  ?updated_time:(updated_time_ : date_time option)
  ?create_time:(create_time_ : date_time option) () =
  ({
     reviewer = reviewer_;
     comment = comment_;
     review_status = review_status_;
     updated_time = updated_time_;
     create_time = create_time_
   } : document_reviewer_response_source)
let make_document_metadata_response_info
  ?reviewer_response:(reviewer_response_ :
                       document_reviewer_response_list option)
  () =
  ({ reviewer_response = reviewer_response_ } : document_metadata_response_info)
let make_list_document_metadata_history_response
  ?next_token:(next_token_ : next_token option)
  ?metadata:(metadata_ : document_metadata_response_info option)
  ?author:(author_ : document_author option)
  ?document_version:(document_version_ : document_version option)
  ?name:(name_ : document_name option) () =
  ({
     next_token = next_token_;
     metadata = metadata_;
     author = author_;
     document_version = document_version_;
     name = name_
   } : list_document_metadata_history_response)
let make_list_document_metadata_history_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?document_version:(document_version_ : document_version option)
  ~metadata:(metadata_ : document_metadata_enum)
  ~name:(name_ : document_name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     metadata = metadata_;
     document_version = document_version_;
     name = name_
   } : list_document_metadata_history_request)
let make_compliance_summary_item
  ?non_compliant_summary:(non_compliant_summary_ :
                           non_compliant_summary option)
  ?compliant_summary:(compliant_summary_ : compliant_summary option)
  ?compliance_type:(compliance_type_ : compliance_type_name option) () =
  ({
     non_compliant_summary = non_compliant_summary_;
     compliant_summary = compliant_summary_;
     compliance_type = compliance_type_
   } : compliance_summary_item)
let make_list_compliance_summaries_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : compliance_string_filter_list option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_
   } : list_compliance_summaries_request)
let make_compliance_item ?details:(details_ : compliance_item_details option)
  ?execution_summary:(execution_summary_ :
                       compliance_execution_summary option)
  ?severity:(severity_ : compliance_severity option)
  ?status:(status_ : compliance_status option)
  ?title:(title_ : compliance_item_title option)
  ?id:(id_ : compliance_item_id option)
  ?resource_id:(resource_id_ : compliance_resource_id option)
  ?resource_type:(resource_type_ : compliance_resource_type option)
  ?compliance_type:(compliance_type_ : compliance_type_name option) () =
  ({
     details = details_;
     execution_summary = execution_summary_;
     severity = severity_;
     status = status_;
     title = title_;
     id = id_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     compliance_type = compliance_type_
   } : compliance_item)
let make_list_compliance_items_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?resource_types:(resource_types_ : compliance_resource_type_list option)
  ?resource_ids:(resource_ids_ : compliance_resource_id_list option)
  ?filters:(filters_ : compliance_string_filter_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_types = resource_types_;
     resource_ids = resource_ids_;
     filters = filters_
   } : list_compliance_items_request)
let make_command_filter ~value:(value_ : command_filter_value)
  ~key:(key_ : command_filter_key) () =
  ({ value = value_; key = key_ } : command_filter)
let make_list_commands_request
  ?filters:(filters_ : command_filter_list option)
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : command_max_results option)
  ?instance_id:(instance_id_ : instance_id option)
  ?command_id:(command_id_ : command_id option) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_;
     command_id = command_id_
   } : list_commands_request)
let make_command_plugin
  ?output_s3_key_prefix:(output_s3_key_prefix_ : s3_key_prefix option)
  ?output_s3_bucket_name:(output_s3_bucket_name_ : s3_bucket_name option)
  ?output_s3_region:(output_s3_region_ : s3_region option)
  ?standard_error_url:(standard_error_url_ : url option)
  ?standard_output_url:(standard_output_url_ : url option)
  ?output:(output_ : command_plugin_output option)
  ?response_finish_date_time:(response_finish_date_time_ : date_time option)
  ?response_start_date_time:(response_start_date_time_ : date_time option)
  ?response_code:(response_code_ : response_code option)
  ?status_details:(status_details_ : status_details option)
  ?status:(status_ : command_plugin_status option)
  ?name:(name_ : command_plugin_name option) () =
  ({
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_region = output_s3_region_;
     standard_error_url = standard_error_url_;
     standard_output_url = standard_output_url_;
     output = output_;
     response_finish_date_time = response_finish_date_time_;
     response_start_date_time = response_start_date_time_;
     response_code = response_code_;
     status_details = status_details_;
     status = status_;
     name = name_
   } : command_plugin)
let make_command_invocation
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
  ?notification_config:(notification_config_ : notification_config option)
  ?service_role:(service_role_ : service_role option)
  ?command_plugins:(command_plugins_ : command_plugin_list option)
  ?standard_error_url:(standard_error_url_ : url option)
  ?standard_output_url:(standard_output_url_ : url option)
  ?trace_output:(trace_output_ : invocation_trace_output option)
  ?status_details:(status_details_ : status_details option)
  ?status:(status_ : command_invocation_status option)
  ?requested_date_time:(requested_date_time_ : date_time option)
  ?document_version:(document_version_ : document_version option)
  ?document_name:(document_name_ : document_name option)
  ?comment:(comment_ : comment option)
  ?instance_name:(instance_name_ : instance_tag_name option)
  ?instance_id:(instance_id_ : instance_id option)
  ?command_id:(command_id_ : command_id option) () =
  ({
     cloud_watch_output_config = cloud_watch_output_config_;
     notification_config = notification_config_;
     service_role = service_role_;
     command_plugins = command_plugins_;
     standard_error_url = standard_error_url_;
     standard_output_url = standard_output_url_;
     trace_output = trace_output_;
     status_details = status_details_;
     status = status_;
     requested_date_time = requested_date_time_;
     document_version = document_version_;
     document_name = document_name_;
     comment = comment_;
     instance_name = instance_name_;
     instance_id = instance_id_;
     command_id = command_id_
   } : command_invocation)
let make_list_command_invocations_request
  ?details:(details_ : boolean_ option)
  ?filters:(filters_ : command_filter_list option)
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : command_max_results option)
  ?instance_id:(instance_id_ : instance_id option)
  ?command_id:(command_id_ : command_id option) () =
  ({
     details = details_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_;
     command_id = command_id_
   } : list_command_invocations_request)
let make_association ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?association_name:(association_name_ : association_name option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?overview:(overview_ : association_overview option)
  ?last_execution_date:(last_execution_date_ : date_time option)
  ?targets:(targets_ : targets option)
  ?document_version:(document_version_ : document_version option)
  ?association_version:(association_version_ : association_version option)
  ?association_id:(association_id_ : association_id option)
  ?instance_id:(instance_id_ : instance_id option)
  ?name:(name_ : document_ar_n option) () =
  ({
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     association_name = association_name_;
     schedule_expression = schedule_expression_;
     overview = overview_;
     last_execution_date = last_execution_date_;
     targets = targets_;
     document_version = document_version_;
     association_version = association_version_;
     association_id = association_id_;
     instance_id = instance_id_;
     name = name_
   } : association)
let make_association_filter ~value:(value_ : association_filter_value)
  ~key:(key_ : association_filter_key) () =
  ({ value = value_; key = key_ } : association_filter)
let make_list_associations_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?association_filter_list:(association_filter_list_ :
                             association_filter_list option)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     association_filter_list = association_filter_list_
   } : list_associations_request)
let make_association_version_info
  ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?target_locations:(target_locations_ : target_locations option)
  ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ :
                                 apply_only_at_cron_interval option)
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?max_errors:(max_errors_ : max_errors option)
  ?association_name:(association_name_ : association_name option)
  ?output_location:(output_location_ :
                     instance_association_output_location option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?targets:(targets_ : targets option)
  ?parameters:(parameters_ : parameters option)
  ?document_version:(document_version_ : document_version option)
  ?name:(name_ : document_ar_n option)
  ?created_date:(created_date_ : date_time option)
  ?association_version:(association_version_ : association_version option)
  ?association_id:(association_id_ : association_id option) () =
  ({
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     target_locations = target_locations_;
     calendar_names = calendar_names_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     sync_compliance = sync_compliance_;
     compliance_severity = compliance_severity_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     association_name = association_name_;
     output_location = output_location_;
     schedule_expression = schedule_expression_;
     targets = targets_;
     parameters = parameters_;
     document_version = document_version_;
     name = name_;
     created_date = created_date_;
     association_version = association_version_;
     association_id = association_id_
   } : association_version_info)
let make_list_association_versions_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ~association_id:(association_id_ : association_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     association_id = association_id_
   } : list_association_versions_request)
let make_label_parameter_version_request
  ?parameter_version:(parameter_version_ : ps_parameter_version option)
  ~labels:(labels_ : parameter_label_list) ~name:(name_ : ps_parameter_name)
  () =
  ({ labels = labels_; parameter_version = parameter_version_; name = name_ } : 
  label_parameter_version_request)
let make_inventory_result_item
  ?content_hash:(content_hash_ : inventory_item_content_hash option)
  ?capture_time:(capture_time_ : inventory_item_capture_time option)
  ~content:(content_ : inventory_item_entry_list)
  ~schema_version:(schema_version_ : inventory_item_schema_version)
  ~type_name:(type_name_ : inventory_item_type_name) () =
  ({
     content = content_;
     content_hash = content_hash_;
     capture_time = capture_time_;
     schema_version = schema_version_;
     type_name = type_name_
   } : inventory_result_item)
let make_inventory_result_entity
  ?data:(data_ : inventory_result_item_map option)
  ?id:(id_ : inventory_result_entity_id option) () =
  ({ data = data_; id = id_ } : inventory_result_entity)
let make_inventory_item_attribute
  ~data_type:(data_type_ : inventory_attribute_data_type)
  ~name:(name_ : inventory_item_attribute_name) () =
  ({ data_type = data_type_; name = name_ } : inventory_item_attribute)
let make_inventory_item_schema
  ?display_name:(display_name_ : inventory_type_display_name option)
  ?version:(version_ : inventory_item_schema_version option)
  ~attributes:(attributes_ : inventory_item_attribute_list)
  ~type_name:(type_name_ : inventory_item_type_name) () =
  ({
     display_name = display_name_;
     attributes = attributes_;
     version = version_;
     type_name = type_name_
   } : inventory_item_schema)
let make_inventory_group ~filters:(filters_ : inventory_filter_list)
  ~name:(name_ : inventory_group_name) () =
  ({ filters = filters_; name = name_ } : inventory_group)
let make_inventory_deletion_summary_item
  ?remaining_count:(remaining_count_ : remaining_count option)
  ?count:(count_ : resource_count option)
  ?version:(version_ : inventory_item_schema_version option) () =
  ({ remaining_count = remaining_count_; count = count_; version = version_ } : 
  inventory_deletion_summary_item)
let make_inventory_deletion_summary
  ?summary_items:(summary_items_ : inventory_deletion_summary_items option)
  ?remaining_count:(remaining_count_ : remaining_count option)
  ?total_count:(total_count_ : total_count option) () =
  ({
     summary_items = summary_items_;
     remaining_count = remaining_count_;
     total_count = total_count_
   } : inventory_deletion_summary)
let make_inventory_deletion_status_item
  ?last_status_update_time:(last_status_update_time_ :
                             inventory_deletion_last_status_update_time
                               option)
  ?deletion_summary:(deletion_summary_ : inventory_deletion_summary option)
  ?last_status_message:(last_status_message_ :
                         inventory_deletion_last_status_message option)
  ?last_status:(last_status_ : inventory_deletion_status option)
  ?deletion_start_time:(deletion_start_time_ :
                         inventory_deletion_start_time option)
  ?type_name:(type_name_ : inventory_item_type_name option)
  ?deletion_id:(deletion_id_ : uui_d option) () =
  ({
     last_status_update_time = last_status_update_time_;
     deletion_summary = deletion_summary_;
     last_status_message = last_status_message_;
     last_status = last_status_;
     deletion_start_time = deletion_start_time_;
     type_name = type_name_;
     deletion_id = deletion_id_
   } : inventory_deletion_status_item)
let make_inventory_aggregator ?groups:(groups_ : inventory_group_list option)
  ?aggregators:(aggregators_ : inventory_aggregator_list option)
  ?expression:(expression_ : inventory_aggregator_expression option) () =
  ({ groups = groups_; aggregators = aggregators_; expression = expression_ } : 
  inventory_aggregator)
let make_instance_property_string_filter
  ?operator:(operator_ : instance_property_filter_operator option)
  ~values:(values_ : instance_property_filter_value_set)
  ~key:(key_ : instance_property_string_filter_key) () =
  ({ operator = operator_; values = values_; key = key_ } : instance_property_string_filter)
let make_instance_property_filter
  ~value_set:(value_set_ : instance_property_filter_value_set)
  ~key:(key_ : instance_property_filter_key) () =
  ({ value_set = value_set_; key = key_ } : instance_property_filter)
let make_instance_aggregated_association_overview
  ?instance_association_status_aggregated_count:(instance_association_status_aggregated_count_
                                                  :
                                                  instance_association_status_aggregated_count
                                                    option)
  ?detailed_status:(detailed_status_ : status_name option) () =
  ({
     instance_association_status_aggregated_count =
       instance_association_status_aggregated_count_;
     detailed_status = detailed_status_
   } : instance_aggregated_association_overview)
let make_instance_property ?source_type:(source_type_ : source_type option)
  ?source_id:(source_id_ : source_id option)
  ?association_overview:(association_overview_ :
                          instance_aggregated_association_overview option)
  ?last_successful_association_execution_date:(last_successful_association_execution_date_
                                                : date_time option)
  ?last_association_execution_date:(last_association_execution_date_ :
                                     date_time option)
  ?association_status:(association_status_ : status_name option)
  ?computer_name:(computer_name_ : computer_name option)
  ?resource_type:(resource_type_ : string_ option)
  ?registration_date:(registration_date_ : date_time option)
  ?iam_role:(iam_role_ : iam_role option)
  ?activation_id:(activation_id_ : activation_id option)
  ?platform_version:(platform_version_ : platform_version option)
  ?platform_name:(platform_name_ : platform_name option)
  ?platform_type:(platform_type_ : platform_type option)
  ?agent_version:(agent_version_ : version option)
  ?last_ping_date_time:(last_ping_date_time_ : date_time option)
  ?ping_status:(ping_status_ : ping_status option)
  ?launch_time:(launch_time_ : date_time option)
  ?ip_address:(ip_address_ : ip_address option)
  ?architecture:(architecture_ : architecture option)
  ?instance_state:(instance_state_ : instance_state option)
  ?key_name:(key_name_ : key_name option)
  ?instance_role:(instance_role_ : instance_role option)
  ?instance_type:(instance_type_ : instance_type option)
  ?instance_id:(instance_id_ : instance_id option)
  ?name:(name_ : instance_name option) () =
  ({
     source_type = source_type_;
     source_id = source_id_;
     association_overview = association_overview_;
     last_successful_association_execution_date =
       last_successful_association_execution_date_;
     last_association_execution_date = last_association_execution_date_;
     association_status = association_status_;
     computer_name = computer_name_;
     resource_type = resource_type_;
     registration_date = registration_date_;
     iam_role = iam_role_;
     activation_id = activation_id_;
     platform_version = platform_version_;
     platform_name = platform_name_;
     platform_type = platform_type_;
     agent_version = agent_version_;
     last_ping_date_time = last_ping_date_time_;
     ping_status = ping_status_;
     launch_time = launch_time_;
     ip_address = ip_address_;
     architecture = architecture_;
     instance_state = instance_state_;
     key_name = key_name_;
     instance_role = instance_role_;
     instance_type = instance_type_;
     instance_id = instance_id_;
     name = name_
   } : instance_property)
let make_instance_patch_state
  ?other_non_compliant_count:(other_non_compliant_count_ :
                               patch_other_non_compliant_count option)
  ?security_non_compliant_count:(security_non_compliant_count_ :
                                  patch_security_non_compliant_count option)
  ?critical_non_compliant_count:(critical_non_compliant_count_ :
                                  patch_critical_non_compliant_count option)
  ?reboot_option:(reboot_option_ : reboot_option option)
  ?last_no_reboot_install_operation_time:(last_no_reboot_install_operation_time_
                                           : date_time option)
  ?available_security_update_count:(available_security_update_count_ :
                                     patch_available_security_update_count
                                       option)
  ?not_applicable_count:(not_applicable_count_ :
                          patch_not_applicable_count option)
  ?unreported_not_applicable_count:(unreported_not_applicable_count_ :
                                     patch_unreported_not_applicable_count
                                       option)
  ?failed_count:(failed_count_ : patch_failed_count option)
  ?missing_count:(missing_count_ : patch_missing_count option)
  ?installed_rejected_count:(installed_rejected_count_ :
                              patch_installed_rejected_count option)
  ?installed_pending_reboot_count:(installed_pending_reboot_count_ :
                                    patch_installed_pending_reboot_count
                                      option)
  ?installed_other_count:(installed_other_count_ :
                           patch_installed_other_count option)
  ?installed_count:(installed_count_ : patch_installed_count option)
  ?owner_information:(owner_information_ : owner_information option)
  ?install_override_list:(install_override_list_ :
                           install_override_list option)
  ?snapshot_id:(snapshot_id_ : snapshot_id option)
  ~operation:(operation_ : patch_operation_type)
  ~operation_end_time:(operation_end_time_ : date_time)
  ~operation_start_time:(operation_start_time_ : date_time)
  ~baseline_id:(baseline_id_ : baseline_id)
  ~patch_group:(patch_group_ : patch_group)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     other_non_compliant_count = other_non_compliant_count_;
     security_non_compliant_count = security_non_compliant_count_;
     critical_non_compliant_count = critical_non_compliant_count_;
     reboot_option = reboot_option_;
     last_no_reboot_install_operation_time =
       last_no_reboot_install_operation_time_;
     operation = operation_;
     operation_end_time = operation_end_time_;
     operation_start_time = operation_start_time_;
     available_security_update_count = available_security_update_count_;
     not_applicable_count = not_applicable_count_;
     unreported_not_applicable_count = unreported_not_applicable_count_;
     failed_count = failed_count_;
     missing_count = missing_count_;
     installed_rejected_count = installed_rejected_count_;
     installed_pending_reboot_count = installed_pending_reboot_count_;
     installed_other_count = installed_other_count_;
     installed_count = installed_count_;
     owner_information = owner_information_;
     install_override_list = install_override_list_;
     snapshot_id = snapshot_id_;
     baseline_id = baseline_id_;
     patch_group = patch_group_;
     instance_id = instance_id_
   } : instance_patch_state)
let make_instance_patch_state_filter
  ~type_:(type__ : instance_patch_state_operator_type)
  ~values:(values_ : instance_patch_state_filter_values)
  ~key:(key_ : instance_patch_state_filter_key) () =
  ({ type_ = type__; values = values_; key = key_ } : instance_patch_state_filter)
let make_instance_information_string_filter
  ~values:(values_ : instance_information_filter_value_set)
  ~key:(key_ : instance_information_string_filter_key) () =
  ({ values = values_; key = key_ } : instance_information_string_filter)
let make_instance_information
  ?source_type:(source_type_ : source_type option)
  ?source_id:(source_id_ : source_id option)
  ?association_overview:(association_overview_ :
                          instance_aggregated_association_overview option)
  ?last_successful_association_execution_date:(last_successful_association_execution_date_
                                                : date_time option)
  ?last_association_execution_date:(last_association_execution_date_ :
                                     date_time option)
  ?association_status:(association_status_ : status_name option)
  ?computer_name:(computer_name_ : computer_name option)
  ?ip_address:(ip_address_ : ip_address option)
  ?name:(name_ : string_ option)
  ?resource_type:(resource_type_ : resource_type option)
  ?registration_date:(registration_date_ : date_time option)
  ?iam_role:(iam_role_ : iam_role option)
  ?activation_id:(activation_id_ : activation_id option)
  ?platform_version:(platform_version_ : string_ option)
  ?platform_name:(platform_name_ : string_ option)
  ?platform_type:(platform_type_ : platform_type option)
  ?is_latest_version:(is_latest_version_ : boolean_ option)
  ?agent_version:(agent_version_ : version option)
  ?last_ping_date_time:(last_ping_date_time_ : date_time option)
  ?ping_status:(ping_status_ : ping_status option)
  ?instance_id:(instance_id_ : instance_id option) () =
  ({
     source_type = source_type_;
     source_id = source_id_;
     association_overview = association_overview_;
     last_successful_association_execution_date =
       last_successful_association_execution_date_;
     last_association_execution_date = last_association_execution_date_;
     association_status = association_status_;
     computer_name = computer_name_;
     ip_address = ip_address_;
     name = name_;
     resource_type = resource_type_;
     registration_date = registration_date_;
     iam_role = iam_role_;
     activation_id = activation_id_;
     platform_version = platform_version_;
     platform_name = platform_name_;
     platform_type = platform_type_;
     is_latest_version = is_latest_version_;
     agent_version = agent_version_;
     last_ping_date_time = last_ping_date_time_;
     ping_status = ping_status_;
     instance_id = instance_id_
   } : instance_information)
let make_instance_information_filter
  ~value_set:(value_set_ : instance_information_filter_value_set)
  ~key:(key_ : instance_information_filter_key) () =
  ({ value_set = value_set_; key = key_ } : instance_information_filter)
let make_instance_association_output_url
  ?s3_output_url:(s3_output_url_ : s3_output_url option) () =
  ({ s3_output_url = s3_output_url_ } : instance_association_output_url)
let make_instance_association_status_info
  ?association_name:(association_name_ : association_name option)
  ?output_url:(output_url_ : instance_association_output_url option)
  ?error_code:(error_code_ : agent_error_code option)
  ?execution_summary:(execution_summary_ :
                       instance_association_execution_summary option)
  ?detailed_status:(detailed_status_ : status_name option)
  ?status:(status_ : status_name option)
  ?execution_date:(execution_date_ : date_time option)
  ?instance_id:(instance_id_ : instance_id option)
  ?association_version:(association_version_ : association_version option)
  ?document_version:(document_version_ : document_version option)
  ?name:(name_ : document_ar_n option)
  ?association_id:(association_id_ : association_id option) () =
  ({
     association_name = association_name_;
     output_url = output_url_;
     error_code = error_code_;
     execution_summary = execution_summary_;
     detailed_status = detailed_status_;
     status = status_;
     execution_date = execution_date_;
     instance_id = instance_id_;
     association_version = association_version_;
     document_version = document_version_;
     name = name_;
     association_id = association_id_
   } : instance_association_status_info)
let make_instance_association
  ?association_version:(association_version_ : association_version option)
  ?content:(content_ : document_content option)
  ?instance_id:(instance_id_ : instance_id option)
  ?association_id:(association_id_ : association_id option) () =
  ({
     association_version = association_version_;
     content = content_;
     instance_id = instance_id_;
     association_id = association_id_
   } : instance_association)
let make_get_service_setting_request
  ~setting_id:(setting_id_ : service_setting_id) () =
  ({ setting_id = setting_id_ } : get_service_setting_request)
let make_get_resource_policies_response_entry
  ?policy:(policy_ : policy option)
  ?policy_hash:(policy_hash_ : policy_hash option)
  ?policy_id:(policy_id_ : policy_id option) () =
  ({ policy = policy_; policy_hash = policy_hash_; policy_id = policy_id_ } : 
  get_resource_policies_response_entry)
let make_get_resource_policies_response
  ?policies:(policies_ : get_resource_policies_response_entries option)
  ?next_token:(next_token_ : string_ option) () =
  ({ policies = policies_; next_token = next_token_ } : get_resource_policies_response)
let make_get_resource_policies_request
  ?max_results:(max_results_ : resource_policy_max_results option)
  ?next_token:(next_token_ : string_ option)
  ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_arn = resource_arn_
   } : get_resource_policies_request)
let make_get_patch_baseline_request ~baseline_id:(baseline_id_ : baseline_id)
  () = ({ baseline_id = baseline_id_ } : get_patch_baseline_request)
let make_get_patch_baseline_for_patch_group_request
  ?operating_system:(operating_system_ : operating_system option)
  ~patch_group:(patch_group_ : patch_group) () =
  ({ operating_system = operating_system_; patch_group = patch_group_ } : 
  get_patch_baseline_for_patch_group_request)
let make_get_parameters_request
  ?with_decryption:(with_decryption_ : boolean_ option)
  ~names:(names_ : parameter_name_list) () =
  ({ with_decryption = with_decryption_; names = names_ } : get_parameters_request)
let make_get_parameters_by_path_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : get_parameters_by_path_max_results option)
  ?with_decryption:(with_decryption_ : boolean_ option)
  ?parameter_filters:(parameter_filters_ :
                       parameter_string_filter_list option)
  ?recursive:(recursive_ : boolean_ option) ~path:(path_ : ps_parameter_name)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     with_decryption = with_decryption_;
     parameter_filters = parameter_filters_;
     recursive = recursive_;
     path = path_
   } : get_parameters_by_path_request)
let make_get_parameter_request
  ?with_decryption:(with_decryption_ : boolean_ option)
  ~name:(name_ : ps_parameter_name) () =
  ({ with_decryption = with_decryption_; name = name_ } : get_parameter_request)
let make_get_parameter_history_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?with_decryption:(with_decryption_ : boolean_ option)
  ~name:(name_ : ps_parameter_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     with_decryption = with_decryption_;
     name = name_
   } : get_parameter_history_request)
let make_get_ops_summary_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?result_attributes:(result_attributes_ : ops_result_attribute_list option)
  ?aggregators:(aggregators_ : ops_aggregator_list option)
  ?filters:(filters_ : ops_filter_list option)
  ?sync_name:(sync_name_ : resource_data_sync_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     result_attributes = result_attributes_;
     aggregators = aggregators_;
     filters = filters_;
     sync_name = sync_name_
   } : get_ops_summary_request)
let make_get_ops_metadata_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : get_ops_metadata_max_results option)
  ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     ops_metadata_arn = ops_metadata_arn_
   } : get_ops_metadata_request)
let make_get_ops_item_response ?ops_item:(ops_item_ : ops_item option) () =
  ({ ops_item = ops_item_ } : get_ops_item_response)
let make_get_ops_item_request
  ?ops_item_arn:(ops_item_arn_ : ops_item_arn option)
  ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({ ops_item_arn = ops_item_arn_; ops_item_id = ops_item_id_ } : get_ops_item_request)
let make_get_maintenance_window_task_request
  ~window_task_id:(window_task_id_ : maintenance_window_task_id)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_task_id = window_task_id_; window_id = window_id_ } : get_maintenance_window_task_request)
let make_get_maintenance_window_request
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_id = window_id_ } : get_maintenance_window_request)
let make_get_maintenance_window_execution_task_request
  ~task_id:(task_id_ : maintenance_window_execution_task_id)
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({ task_id = task_id_; window_execution_id = window_execution_id_ } : 
  get_maintenance_window_execution_task_request)
let make_get_maintenance_window_execution_task_invocation_request
  ~invocation_id:(invocation_id_ :
                   maintenance_window_execution_task_invocation_id)
  ~task_id:(task_id_ : maintenance_window_execution_task_id)
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({
     invocation_id = invocation_id_;
     task_id = task_id_;
     window_execution_id = window_execution_id_
   } : get_maintenance_window_execution_task_invocation_request)
let make_get_maintenance_window_execution_request
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({ window_execution_id = window_execution_id_ } : get_maintenance_window_execution_request)
let make_get_inventory_schema_request
  ?sub_type:(sub_type_ : is_sub_type_schema option)
  ?aggregator:(aggregator_ : aggregator_schema_only option)
  ?max_results:(max_results_ : get_inventory_schema_max_results option)
  ?next_token:(next_token_ : next_token option)
  ?type_name:(type_name_ : inventory_item_type_name_filter option) () =
  ({
     sub_type = sub_type_;
     aggregator = aggregator_;
     max_results = max_results_;
     next_token = next_token_;
     type_name = type_name_
   } : get_inventory_schema_request)
let make_get_inventory_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?result_attributes:(result_attributes_ : result_attribute_list option)
  ?aggregators:(aggregators_ : inventory_aggregator_list option)
  ?filters:(filters_ : inventory_filter_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     result_attributes = result_attributes_;
     aggregators = aggregators_;
     filters = filters_
   } : get_inventory_request)
let make_automation_execution_preview
  ?total_accounts:(total_accounts_ : integer option)
  ?target_previews:(target_previews_ : target_preview_list option)
  ?regions:(regions_ : region_list option)
  ?step_previews:(step_previews_ : step_preview_map option) () =
  ({
     total_accounts = total_accounts_;
     target_previews = target_previews_;
     regions = regions_;
     step_previews = step_previews_
   } : automation_execution_preview)
let make_get_execution_preview_response
  ?execution_preview:(execution_preview_ : execution_preview option)
  ?status_message:(status_message_ : string_ option)
  ?status:(status_ : execution_preview_status option)
  ?ended_at:(ended_at_ : date_time option)
  ?execution_preview_id:(execution_preview_id_ : execution_preview_id option)
  () =
  ({
     execution_preview = execution_preview_;
     status_message = status_message_;
     status = status_;
     ended_at = ended_at_;
     execution_preview_id = execution_preview_id_
   } : get_execution_preview_response)
let make_get_execution_preview_request
  ~execution_preview_id:(execution_preview_id_ : execution_preview_id) () =
  ({ execution_preview_id = execution_preview_id_ } : get_execution_preview_request)
let make_attachment_content ?url:(url_ : attachment_url option)
  ?hash_type:(hash_type_ : attachment_hash_type option)
  ?hash:(hash_ : attachment_hash option)
  ?size:(size_ : content_length option)
  ?name:(name_ : attachment_name option) () =
  ({
     url = url_;
     hash_type = hash_type_;
     hash = hash_;
     size = size_;
     name = name_
   } : attachment_content)
let make_get_document_request
  ?document_format:(document_format_ : document_format option)
  ?document_version:(document_version_ : document_version option)
  ?version_name:(version_name_ : document_version_name option)
  ~name:(name_ : document_ar_n) () =
  ({
     document_format = document_format_;
     document_version = document_version_;
     version_name = version_name_;
     name = name_
   } : get_document_request)
let make_baseline_override
  ?available_security_updates_compliance_status:(available_security_updates_compliance_status_
                                                  :
                                                  patch_compliance_status
                                                    option)
  ?sources:(sources_ : patch_source_list option)
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : boolean_ option)
  ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
  ?rejected_patches:(rejected_patches_ : patch_id_list option)
  ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                       patch_compliance_level option)
  ?approved_patches:(approved_patches_ : patch_id_list option)
  ?approval_rules:(approval_rules_ : patch_rule_group option)
  ?global_filters:(global_filters_ : patch_filter_group option)
  ?operating_system:(operating_system_ : operating_system option) () =
  ({
     available_security_updates_compliance_status =
       available_security_updates_compliance_status_;
     sources = sources_;
     approved_patches_enable_non_security =
       approved_patches_enable_non_security_;
     rejected_patches_action = rejected_patches_action_;
     rejected_patches = rejected_patches_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     approved_patches = approved_patches_;
     approval_rules = approval_rules_;
     global_filters = global_filters_;
     operating_system = operating_system_
   } : baseline_override)
let make_get_deployable_patch_snapshot_for_instance_request
  ?baseline_override:(baseline_override_ : baseline_override option)
  ~snapshot_id:(snapshot_id_ : snapshot_id)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     baseline_override = baseline_override_;
     snapshot_id = snapshot_id_;
     instance_id = instance_id_
   } : get_deployable_patch_snapshot_for_instance_request)
let make_get_default_patch_baseline_request
  ?operating_system:(operating_system_ : operating_system option) () =
  ({ operating_system = operating_system_ } : get_default_patch_baseline_request)
let make_get_connection_status_response
  ?status:(status_ : connection_status option)
  ?target:(target_ : session_target option) () =
  ({ status = status_; target = target_ } : get_connection_status_response)
let make_get_connection_status_request ~target:(target_ : session_target) ()
  = ({ target = target_ } : get_connection_status_request)
let make_get_command_invocation_request
  ?plugin_name:(plugin_name_ : command_plugin_name option)
  ~instance_id:(instance_id_ : instance_id)
  ~command_id:(command_id_ : command_id) () =
  ({
     plugin_name = plugin_name_;
     instance_id = instance_id_;
     command_id = command_id_
   } : get_command_invocation_request)
let make_get_calendar_state_response
  ?next_transition_time:(next_transition_time_ : iso8601_string option)
  ?at_time:(at_time_ : iso8601_string option)
  ?state:(state_ : calendar_state option) () =
  ({
     next_transition_time = next_transition_time_;
     at_time = at_time_;
     state = state_
   } : get_calendar_state_response)
let make_get_calendar_state_request
  ?at_time:(at_time_ : iso8601_string option)
  ~calendar_names:(calendar_names_ : calendar_name_or_arn_list) () =
  ({ at_time = at_time_; calendar_names = calendar_names_ } : get_calendar_state_request)
let make_automation_execution
  ?variables:(variables_ : automation_parameter_map option)
  ?change_request_name:(change_request_name_ : change_request_name option)
  ?association_id:(association_id_ : string_ option)
  ?ops_item_id:(ops_item_id_ : string_ option)
  ?runbooks:(runbooks_ : runbooks option)
  ?scheduled_time:(scheduled_time_ : date_time option)
  ?automation_subtype:(automation_subtype_ : automation_subtype option)
  ?target_locations_ur_l:(target_locations_ur_l_ :
                           target_locations_ur_l option)
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?progress_counters:(progress_counters_ : progress_counters option)
  ?target_locations:(target_locations_ : target_locations option)
  ?target:(target_ : string_ option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?resolved_targets:(resolved_targets_ : resolved_targets option)
  ?target_maps:(target_maps_ : target_maps option)
  ?targets:(targets_ : targets option)
  ?target_parameter_name:(target_parameter_name_ :
                           automation_parameter_key option)
  ?current_action:(current_action_ : string_ option)
  ?current_step_name:(current_step_name_ : string_ option)
  ?executed_by:(executed_by_ : string_ option)
  ?parent_automation_execution_id:(parent_automation_execution_id_ :
                                    automation_execution_id option)
  ?mode:(mode_ : execution_mode option)
  ?failure_message:(failure_message_ : string_ option)
  ?outputs:(outputs_ : automation_parameter_map option)
  ?parameters:(parameters_ : automation_parameter_map option)
  ?step_executions_truncated:(step_executions_truncated_ : boolean_ option)
  ?step_executions:(step_executions_ : step_execution_list option)
  ?automation_execution_status:(automation_execution_status_ :
                                 automation_execution_status option)
  ?execution_end_time:(execution_end_time_ : date_time option)
  ?execution_start_time:(execution_start_time_ : date_time option)
  ?document_version:(document_version_ : document_version option)
  ?document_name:(document_name_ : document_name option)
  ?automation_execution_id:(automation_execution_id_ :
                             automation_execution_id option)
  () =
  ({
     variables = variables_;
     change_request_name = change_request_name_;
     association_id = association_id_;
     ops_item_id = ops_item_id_;
     runbooks = runbooks_;
     scheduled_time = scheduled_time_;
     automation_subtype = automation_subtype_;
     target_locations_ur_l = target_locations_ur_l_;
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     progress_counters = progress_counters_;
     target_locations = target_locations_;
     target = target_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     resolved_targets = resolved_targets_;
     target_maps = target_maps_;
     targets = targets_;
     target_parameter_name = target_parameter_name_;
     current_action = current_action_;
     current_step_name = current_step_name_;
     executed_by = executed_by_;
     parent_automation_execution_id = parent_automation_execution_id_;
     mode = mode_;
     failure_message = failure_message_;
     outputs = outputs_;
     parameters = parameters_;
     step_executions_truncated = step_executions_truncated_;
     step_executions = step_executions_;
     automation_execution_status = automation_execution_status_;
     execution_end_time = execution_end_time_;
     execution_start_time = execution_start_time_;
     document_version = document_version_;
     document_name = document_name_;
     automation_execution_id = automation_execution_id_
   } : automation_execution)
let make_get_automation_execution_request
  ~automation_execution_id:(automation_execution_id_ :
                             automation_execution_id)
  () =
  ({ automation_execution_id = automation_execution_id_ } : get_automation_execution_request)
let make_credentials ~expiration_time:(expiration_time_ : date_time)
  ~session_token:(session_token_ : session_token_type)
  ~secret_access_key:(secret_access_key_ : access_key_secret_type)
  ~access_key_id:(access_key_id_ : access_key_id_type) () =
  ({
     expiration_time = expiration_time_;
     session_token = session_token_;
     secret_access_key = secret_access_key_;
     access_key_id = access_key_id_
   } : credentials)
let make_get_access_token_response
  ?access_request_status:(access_request_status_ :
                           access_request_status option)
  ?credentials:(credentials_ : credentials option) () =
  ({
     access_request_status = access_request_status_;
     credentials = credentials_
   } : get_access_token_response)
let make_get_access_token_request
  ~access_request_id:(access_request_id_ : access_request_id) () =
  ({ access_request_id = access_request_id_ } : get_access_token_request)
let make_create_association_batch_request_entry
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?target_locations:(target_locations_ : target_locations option)
  ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ :
                                 apply_only_at_cron_interval option)
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?max_errors:(max_errors_ : max_errors option)
  ?association_name:(association_name_ : association_name option)
  ?output_location:(output_location_ :
                     instance_association_output_location option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?targets:(targets_ : targets option)
  ?document_version:(document_version_ : document_version option)
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      automation_target_parameter_name option)
  ?parameters:(parameters_ : parameters option)
  ?instance_id:(instance_id_ : instance_id option)
  ~name:(name_ : document_ar_n) () =
  ({
     alarm_configuration = alarm_configuration_;
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     target_locations = target_locations_;
     calendar_names = calendar_names_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     sync_compliance = sync_compliance_;
     compliance_severity = compliance_severity_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     association_name = association_name_;
     output_location = output_location_;
     schedule_expression = schedule_expression_;
     targets = targets_;
     document_version = document_version_;
     automation_target_parameter_name = automation_target_parameter_name_;
     parameters = parameters_;
     instance_id = instance_id_;
     name = name_
   } : create_association_batch_request_entry)
let make_failed_create_association ?fault:(fault_ : fault option)
  ?message:(message_ : batch_error_message option)
  ?entry:(entry_ : create_association_batch_request_entry option) () =
  ({ fault = fault_; message = message_; entry = entry_ } : failed_create_association)
let make_effective_patch ?patch_status:(patch_status_ : patch_status option)
  ?patch:(patch_ : patch option) () =
  ({ patch_status = patch_status_; patch = patch_ } : effective_patch)
let make_disassociate_ops_item_related_item_response () = (() : unit)
let make_disassociate_ops_item_related_item_request
  ~association_id:(association_id_ : ops_item_related_item_association_id)
  ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({ association_id = association_id_; ops_item_id = ops_item_id_ } : 
  disassociate_ops_item_related_item_request)
let make_describe_sessions_response
  ?next_token:(next_token_ : next_token option)
  ?sessions:(sessions_ : session_list option) () =
  ({ next_token = next_token_; sessions = sessions_ } : describe_sessions_response)
let make_describe_sessions_request
  ?filters:(filters_ : session_filter_list option)
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : session_max_results option)
  ~state:(state_ : session_state) () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     state = state_
   } : describe_sessions_request)
let make_describe_patch_properties_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?patch_set:(patch_set_ : patch_set option)
  ~property:(property_ : patch_property)
  ~operating_system:(operating_system_ : operating_system) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     patch_set = patch_set_;
     property = property_;
     operating_system = operating_system_
   } : describe_patch_properties_request)
let make_describe_patch_groups_request
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : patch_orchestrator_filter_list option)
  ?max_results:(max_results_ : patch_baseline_max_results option) () =
  ({ next_token = next_token_; filters = filters_; max_results = max_results_
   } : describe_patch_groups_request)
let make_describe_patch_group_state_request
  ~patch_group:(patch_group_ : patch_group) () =
  ({ patch_group = patch_group_ } : describe_patch_group_state_request)
let make_describe_patch_baselines_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : patch_baseline_max_results option)
  ?filters:(filters_ : patch_orchestrator_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_patch_baselines_request)
let make_describe_parameters_request ?shared:(shared_ : boolean_ option)
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?parameter_filters:(parameter_filters_ :
                       parameter_string_filter_list option)
  ?filters:(filters_ : parameters_filter_list option) () =
  ({
     shared = shared_;
     next_token = next_token_;
     max_results = max_results_;
     parameter_filters = parameter_filters_;
     filters = filters_
   } : describe_parameters_request)
let make_describe_ops_items_response
  ?ops_item_summaries:(ops_item_summaries_ : ops_item_summaries option)
  ?next_token:(next_token_ : string_ option) () =
  ({ ops_item_summaries = ops_item_summaries_; next_token = next_token_ } : 
  describe_ops_items_response)
let make_describe_ops_items_request
  ?next_token:(next_token_ : string_ option)
  ?max_results:(max_results_ : ops_item_max_results option)
  ?ops_item_filters:(ops_item_filters_ : ops_item_filters option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     ops_item_filters = ops_item_filters_
   } : describe_ops_items_request)
let make_describe_maintenance_windows_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_maintenance_windows_request)
let make_describe_maintenance_windows_for_target_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_search_max_results option)
  ~resource_type:(resource_type_ : maintenance_window_resource_type)
  ~targets:(targets_ : targets) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resource_type = resource_type_;
     targets = targets_
   } : describe_maintenance_windows_for_target_request)
let make_describe_maintenance_window_tasks_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_tasks_request)
let make_describe_maintenance_window_targets_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_targets_request)
let make_describe_maintenance_window_schedule_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_search_max_results option)
  ?filters:(filters_ : patch_orchestrator_filter_list option)
  ?resource_type:(resource_type_ : maintenance_window_resource_type option)
  ?targets:(targets_ : targets option)
  ?window_id:(window_id_ : maintenance_window_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     resource_type = resource_type_;
     targets = targets_;
     window_id = window_id_
   } : describe_maintenance_window_schedule_request)
let make_describe_maintenance_window_executions_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_executions_request)
let make_describe_maintenance_window_execution_tasks_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option)
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_execution_id = window_execution_id_
   } : describe_maintenance_window_execution_tasks_request)
let make_describe_maintenance_window_execution_task_invocations_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : maintenance_window_max_results option)
  ?filters:(filters_ : maintenance_window_filter_list option)
  ~task_id:(task_id_ : maintenance_window_execution_task_id)
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     task_id = task_id_;
     window_execution_id = window_execution_id_
   } : describe_maintenance_window_execution_task_invocations_request)
let make_describe_inventory_deletions_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?deletion_id:(deletion_id_ : uui_d option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     deletion_id = deletion_id_
   } : describe_inventory_deletions_request)
let make_describe_instance_properties_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ :
                 describe_instance_properties_max_results option)
  ?filters_with_operator:(filters_with_operator_ :
                           instance_property_string_filter_list option)
  ?instance_property_filter_list:(instance_property_filter_list_ :
                                   instance_property_filter_list option)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters_with_operator = filters_with_operator_;
     instance_property_filter_list = instance_property_filter_list_
   } : describe_instance_properties_request)
let make_describe_instance_patches_request
  ?max_results:(max_results_ : patch_compliance_max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : patch_orchestrator_filter_list option)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     instance_id = instance_id_
   } : describe_instance_patches_request)
let make_describe_instance_patch_states_request
  ?max_results:(max_results_ : patch_compliance_max_results option)
  ?next_token:(next_token_ : next_token option)
  ~instance_ids:(instance_ids_ : instance_id_list) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     instance_ids = instance_ids_
   } : describe_instance_patch_states_request)
let make_describe_instance_patch_states_for_patch_group_request
  ?max_results:(max_results_ : patch_compliance_max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : instance_patch_state_filter_list option)
  ~patch_group:(patch_group_ : patch_group) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     patch_group = patch_group_
   } : describe_instance_patch_states_for_patch_group_request)
let make_describe_instance_information_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results_ec2_compatible option)
  ?filters:(filters_ : instance_information_string_filter_list option)
  ?instance_information_filter_list:(instance_information_filter_list_ :
                                      instance_information_filter_list option)
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     instance_information_filter_list = instance_information_filter_list_
   } : describe_instance_information_request)
let make_describe_instance_associations_status_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_
   } : describe_instance_associations_status_request)
let make_describe_effective_patches_for_patch_baseline_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : patch_baseline_max_results option)
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     baseline_id = baseline_id_
   } : describe_effective_patches_for_patch_baseline_request)
let make_describe_effective_instance_associations_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ :
                 effective_instance_association_max_results option)
  ~instance_id:(instance_id_ : instance_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_
   } : describe_effective_instance_associations_request)
let make_describe_document_request
  ?version_name:(version_name_ : document_version_name option)
  ?document_version:(document_version_ : document_version option)
  ~name:(name_ : document_ar_n) () =
  ({
     version_name = version_name_;
     document_version = document_version_;
     name = name_
   } : describe_document_request)
let make_account_sharing_info
  ?shared_document_version:(shared_document_version_ :
                             shared_document_version option)
  ?account_id:(account_id_ : account_id option) () =
  ({
     shared_document_version = shared_document_version_;
     account_id = account_id_
   } : account_sharing_info)
let make_describe_document_permission_response
  ?next_token:(next_token_ : next_token option)
  ?account_sharing_info_list:(account_sharing_info_list_ :
                               account_sharing_info_list option)
  ?account_ids:(account_ids_ : account_id_list option) () =
  ({
     next_token = next_token_;
     account_sharing_info_list = account_sharing_info_list_;
     account_ids = account_ids_
   } : describe_document_permission_response)
let make_describe_document_permission_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : document_permission_max_results option)
  ~permission_type:(permission_type_ : document_permission_type)
  ~name:(name_ : document_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     permission_type = permission_type_;
     name = name_
   } : describe_document_permission_request)
let make_describe_available_patches_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : patch_baseline_max_results option)
  ?filters:(filters_ : patch_orchestrator_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_available_patches_request)
let make_describe_automation_step_executions_request
  ?reverse_order:(reverse_order_ : boolean_ option)
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ?filters:(filters_ : step_execution_filter_list option)
  ~automation_execution_id:(automation_execution_id_ :
                             automation_execution_id)
  () =
  ({
     reverse_order = reverse_order_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     automation_execution_id = automation_execution_id_
   } : describe_automation_step_executions_request)
let make_automation_execution_metadata
  ?change_request_name:(change_request_name_ : change_request_name option)
  ?association_id:(association_id_ : string_ option)
  ?ops_item_id:(ops_item_id_ : string_ option)
  ?runbooks:(runbooks_ : runbooks option)
  ?scheduled_time:(scheduled_time_ : date_time option)
  ?automation_subtype:(automation_subtype_ : automation_subtype option)
  ?target_locations_ur_l:(target_locations_ur_l_ :
                           target_locations_ur_l option)
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?automation_type:(automation_type_ : automation_type option)
  ?target:(target_ : string_ option)
  ?max_errors:(max_errors_ : max_errors option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?resolved_targets:(resolved_targets_ : resolved_targets option)
  ?target_maps:(target_maps_ : target_maps option)
  ?targets:(targets_ : targets option)
  ?target_parameter_name:(target_parameter_name_ :
                           automation_parameter_key option)
  ?failure_message:(failure_message_ : string_ option)
  ?current_action:(current_action_ : string_ option)
  ?current_step_name:(current_step_name_ : string_ option)
  ?parent_automation_execution_id:(parent_automation_execution_id_ :
                                    automation_execution_id option)
  ?mode:(mode_ : execution_mode option)
  ?outputs:(outputs_ : automation_parameter_map option)
  ?log_file:(log_file_ : string_ option)
  ?executed_by:(executed_by_ : string_ option)
  ?execution_end_time:(execution_end_time_ : date_time option)
  ?execution_start_time:(execution_start_time_ : date_time option)
  ?automation_execution_status:(automation_execution_status_ :
                                 automation_execution_status option)
  ?document_version:(document_version_ : document_version option)
  ?document_name:(document_name_ : document_name option)
  ?automation_execution_id:(automation_execution_id_ :
                             automation_execution_id option)
  () =
  ({
     change_request_name = change_request_name_;
     association_id = association_id_;
     ops_item_id = ops_item_id_;
     runbooks = runbooks_;
     scheduled_time = scheduled_time_;
     automation_subtype = automation_subtype_;
     target_locations_ur_l = target_locations_ur_l_;
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     automation_type = automation_type_;
     target = target_;
     max_errors = max_errors_;
     max_concurrency = max_concurrency_;
     resolved_targets = resolved_targets_;
     target_maps = target_maps_;
     targets = targets_;
     target_parameter_name = target_parameter_name_;
     failure_message = failure_message_;
     current_action = current_action_;
     current_step_name = current_step_name_;
     parent_automation_execution_id = parent_automation_execution_id_;
     mode = mode_;
     outputs = outputs_;
     log_file = log_file_;
     executed_by = executed_by_;
     execution_end_time = execution_end_time_;
     execution_start_time = execution_start_time_;
     automation_execution_status = automation_execution_status_;
     document_version = document_version_;
     document_name = document_name_;
     automation_execution_id = automation_execution_id_
   } : automation_execution_metadata)
let make_automation_execution_filter
  ~values:(values_ : automation_execution_filter_value_list)
  ~key:(key_ : automation_execution_filter_key) () =
  ({ values = values_; key = key_ } : automation_execution_filter)
let make_describe_automation_executions_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?filters:(filters_ : automation_execution_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_automation_executions_request)
let make_describe_association_request
  ?association_version:(association_version_ : association_version option)
  ?association_id:(association_id_ : association_id option)
  ?instance_id:(instance_id_ : instance_id option)
  ?name:(name_ : document_ar_n option) () =
  ({
     association_version = association_version_;
     association_id = association_id_;
     instance_id = instance_id_;
     name = name_
   } : describe_association_request)
let make_association_execution
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information_list option)
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?resource_count_by_status:(resource_count_by_status_ :
                              resource_count_by_status option)
  ?last_execution_date:(last_execution_date_ : date_time option)
  ?created_time:(created_time_ : date_time option)
  ?detailed_status:(detailed_status_ : status_name option)
  ?status:(status_ : status_name option)
  ?execution_id:(execution_id_ : association_execution_id option)
  ?association_version:(association_version_ : association_version option)
  ?association_id:(association_id_ : association_id option) () =
  ({
     triggered_alarms = triggered_alarms_;
     alarm_configuration = alarm_configuration_;
     resource_count_by_status = resource_count_by_status_;
     last_execution_date = last_execution_date_;
     created_time = created_time_;
     detailed_status = detailed_status_;
     status = status_;
     execution_id = execution_id_;
     association_version = association_version_;
     association_id = association_id_
   } : association_execution)
let make_association_execution_filter
  ~type_:(type__ : association_filter_operator_type)
  ~value:(value_ : association_execution_filter_value)
  ~key:(key_ : association_execution_filter_key) () =
  ({ type_ = type__; value = value_; key = key_ } : association_execution_filter)
let make_describe_association_executions_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?filters:(filters_ : association_execution_filter_list option)
  ~association_id:(association_id_ : association_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     association_id = association_id_
   } : describe_association_executions_request)
let make_association_execution_target
  ?output_source:(output_source_ : output_source option)
  ?last_execution_date:(last_execution_date_ : date_time option)
  ?detailed_status:(detailed_status_ : status_name option)
  ?status:(status_ : status_name option)
  ?resource_type:(resource_type_ : association_resource_type option)
  ?resource_id:(resource_id_ : association_resource_id option)
  ?execution_id:(execution_id_ : association_execution_id option)
  ?association_version:(association_version_ : association_version option)
  ?association_id:(association_id_ : association_id option) () =
  ({
     output_source = output_source_;
     last_execution_date = last_execution_date_;
     detailed_status = detailed_status_;
     status = status_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     execution_id = execution_id_;
     association_version = association_version_;
     association_id = association_id_
   } : association_execution_target)
let make_association_execution_targets_filter
  ~value:(value_ : association_execution_targets_filter_value)
  ~key:(key_ : association_execution_targets_filter_key) () =
  ({ value = value_; key = key_ } : association_execution_targets_filter)
let make_describe_association_execution_targets_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?filters:(filters_ : association_execution_targets_filter_list option)
  ~execution_id:(execution_id_ : association_execution_id)
  ~association_id:(association_id_ : association_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     execution_id = execution_id_;
     association_id = association_id_
   } : describe_association_execution_targets_request)
let make_activation ?tags:(tags_ : tag_list option)
  ?created_date:(created_date_ : created_date option)
  ?expired:(expired_ : boolean_ option)
  ?expiration_date:(expiration_date_ : expiration_date option)
  ?registrations_count:(registrations_count_ : registrations_count option)
  ?registration_limit:(registration_limit_ : registration_limit option)
  ?iam_role:(iam_role_ : iam_role option)
  ?default_instance_name:(default_instance_name_ :
                           default_instance_name option)
  ?description:(description_ : activation_description option)
  ?activation_id:(activation_id_ : activation_id option) () =
  ({
     tags = tags_;
     created_date = created_date_;
     expired = expired_;
     expiration_date = expiration_date_;
     registrations_count = registrations_count_;
     registration_limit = registration_limit_;
     iam_role = iam_role_;
     default_instance_name = default_instance_name_;
     description = description_;
     activation_id = activation_id_
   } : activation)
let make_describe_activations_filter
  ?filter_values:(filter_values_ : string_list option)
  ?filter_key:(filter_key_ : describe_activations_filter_keys option) () =
  ({ filter_values = filter_values_; filter_key = filter_key_ } : describe_activations_filter)
let make_describe_activations_request
  ?next_token:(next_token_ : next_token option)
  ?max_results:(max_results_ : max_results option)
  ?filters:(filters_ : describe_activations_filter_list option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_activations_request)
let make_deregister_task_from_maintenance_window_request
  ~window_task_id:(window_task_id_ : maintenance_window_task_id)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_task_id = window_task_id_; window_id = window_id_ } : deregister_task_from_maintenance_window_request)
let make_deregister_target_from_maintenance_window_request
  ?safe:(safe_ : boolean_ option)
  ~window_target_id:(window_target_id_ : maintenance_window_target_id)
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({
     safe = safe_;
     window_target_id = window_target_id_;
     window_id = window_id_
   } : deregister_target_from_maintenance_window_request)
let make_deregister_patch_baseline_for_patch_group_request
  ~patch_group:(patch_group_ : patch_group)
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ patch_group = patch_group_; baseline_id = baseline_id_ } : deregister_patch_baseline_for_patch_group_request)
let make_deregister_managed_instance_request
  ~instance_id:(instance_id_ : managed_instance_id) () =
  ({ instance_id = instance_id_ } : deregister_managed_instance_request)
let make_delete_resource_policy_response () = (() : unit)
let make_delete_resource_policy_request
  ~policy_hash:(policy_hash_ : policy_hash)
  ~policy_id:(policy_id_ : policy_id)
  ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({
     policy_hash = policy_hash_;
     policy_id = policy_id_;
     resource_arn = resource_arn_
   } : delete_resource_policy_request)
let make_delete_resource_data_sync_request
  ?sync_type:(sync_type_ : resource_data_sync_type option)
  ~sync_name:(sync_name_ : resource_data_sync_name) () =
  ({ sync_type = sync_type_; sync_name = sync_name_ } : delete_resource_data_sync_request)
let make_delete_patch_baseline_request
  ~baseline_id:(baseline_id_ : baseline_id) () =
  ({ baseline_id = baseline_id_ } : delete_patch_baseline_request)
let make_delete_parameters_request ~names:(names_ : parameter_name_list) () =
  ({ names = names_ } : delete_parameters_request)
let make_delete_parameter_request ~name:(name_ : ps_parameter_name) () =
  ({ name = name_ } : delete_parameter_request)
let make_delete_ops_metadata_request
  ~ops_metadata_arn:(ops_metadata_arn_ : ops_metadata_arn) () =
  ({ ops_metadata_arn = ops_metadata_arn_ } : delete_ops_metadata_request)
let make_delete_ops_item_response () = (() : unit)
let make_delete_ops_item_request ~ops_item_id:(ops_item_id_ : ops_item_id) ()
  = ({ ops_item_id = ops_item_id_ } : delete_ops_item_request)
let make_delete_maintenance_window_request
  ~window_id:(window_id_ : maintenance_window_id) () =
  ({ window_id = window_id_ } : delete_maintenance_window_request)
let make_delete_inventory_request
  ?client_token:(client_token_ : uui_d option)
  ?dry_run:(dry_run_ : dry_run option)
  ?schema_delete_option:(schema_delete_option_ :
                          inventory_schema_delete_option option)
  ~type_name:(type_name_ : inventory_item_type_name) () =
  ({
     client_token = client_token_;
     dry_run = dry_run_;
     schema_delete_option = schema_delete_option_;
     type_name = type_name_
   } : delete_inventory_request)
let make_delete_document_request ?force:(force_ : boolean_ option)
  ?version_name:(version_name_ : document_version_name option)
  ?document_version:(document_version_ : document_version option)
  ~name:(name_ : document_name) () =
  ({
     force = force_;
     version_name = version_name_;
     document_version = document_version_;
     name = name_
   } : delete_document_request)
let make_delete_association_request
  ?association_id:(association_id_ : association_id option)
  ?instance_id:(instance_id_ : instance_id option)
  ?name:(name_ : document_ar_n option) () =
  ({
     association_id = association_id_;
     instance_id = instance_id_;
     name = name_
   } : delete_association_request)
let make_delete_activation_request
  ~activation_id:(activation_id_ : activation_id) () =
  ({ activation_id = activation_id_ } : delete_activation_request)
let make_create_resource_data_sync_request
  ?sync_source:(sync_source_ : resource_data_sync_source option)
  ?sync_type:(sync_type_ : resource_data_sync_type option)
  ?s3_destination:(s3_destination_ :
                    resource_data_sync_s3_destination option)
  ~sync_name:(sync_name_ : resource_data_sync_name) () =
  ({
     sync_source = sync_source_;
     sync_type = sync_type_;
     s3_destination = s3_destination_;
     sync_name = sync_name_
   } : create_resource_data_sync_request)
let make_create_patch_baseline_request ?tags:(tags_ : tag_list option)
  ?client_token:(client_token_ : client_token option)
  ?available_security_updates_compliance_status:(available_security_updates_compliance_status_
                                                  :
                                                  patch_compliance_status
                                                    option)
  ?sources:(sources_ : patch_source_list option)
  ?description:(description_ : baseline_description option)
  ?rejected_patches_action:(rejected_patches_action_ : patch_action option)
  ?rejected_patches:(rejected_patches_ : patch_id_list option)
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : boolean_ option)
  ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                       patch_compliance_level option)
  ?approved_patches:(approved_patches_ : patch_id_list option)
  ?approval_rules:(approval_rules_ : patch_rule_group option)
  ?global_filters:(global_filters_ : patch_filter_group option)
  ?operating_system:(operating_system_ : operating_system option)
  ~name:(name_ : baseline_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     available_security_updates_compliance_status =
       available_security_updates_compliance_status_;
     sources = sources_;
     description = description_;
     rejected_patches_action = rejected_patches_action_;
     rejected_patches = rejected_patches_;
     approved_patches_enable_non_security =
       approved_patches_enable_non_security_;
     approved_patches_compliance_level = approved_patches_compliance_level_;
     approved_patches = approved_patches_;
     approval_rules = approval_rules_;
     global_filters = global_filters_;
     name = name_;
     operating_system = operating_system_
   } : create_patch_baseline_request)
let make_create_ops_metadata_request ?tags:(tags_ : tag_list option)
  ?metadata:(metadata_ : metadata_map option)
  ~resource_id:(resource_id_ : ops_metadata_resource_id) () =
  ({ tags = tags_; metadata = metadata_; resource_id = resource_id_ } : 
  create_ops_metadata_request)
let make_create_ops_item_response
  ?ops_item_arn:(ops_item_arn_ : ops_item_arn option)
  ?ops_item_id:(ops_item_id_ : string_ option) () =
  ({ ops_item_arn = ops_item_arn_; ops_item_id = ops_item_id_ } : create_ops_item_response)
let make_create_ops_item_request
  ?account_id:(account_id_ : ops_item_account_id option)
  ?planned_end_time:(planned_end_time_ : date_time option)
  ?planned_start_time:(planned_start_time_ : date_time option)
  ?actual_end_time:(actual_end_time_ : date_time option)
  ?actual_start_time:(actual_start_time_ : date_time option)
  ?severity:(severity_ : ops_item_severity option)
  ?category:(category_ : ops_item_category option)
  ?tags:(tags_ : tag_list option)
  ?related_ops_items:(related_ops_items_ : related_ops_items option)
  ?priority:(priority_ : ops_item_priority option)
  ?notifications:(notifications_ : ops_item_notifications option)
  ?operational_data:(operational_data_ : ops_item_operational_data option)
  ?ops_item_type:(ops_item_type_ : ops_item_type option)
  ~title:(title_ : ops_item_title) ~source:(source_ : ops_item_source)
  ~description:(description_ : ops_item_description) () =
  ({
     account_id = account_id_;
     planned_end_time = planned_end_time_;
     planned_start_time = planned_start_time_;
     actual_end_time = actual_end_time_;
     actual_start_time = actual_start_time_;
     severity = severity_;
     category = category_;
     tags = tags_;
     title = title_;
     source = source_;
     related_ops_items = related_ops_items_;
     priority = priority_;
     notifications = notifications_;
     operational_data = operational_data_;
     ops_item_type = ops_item_type_;
     description = description_
   } : create_ops_item_request)
let make_create_maintenance_window_request ?tags:(tags_ : tag_list option)
  ?client_token:(client_token_ : client_token option)
  ?schedule_offset:(schedule_offset_ : maintenance_window_offset option)
  ?schedule_timezone:(schedule_timezone_ :
                       maintenance_window_timezone option)
  ?end_date:(end_date_ : maintenance_window_string_date_time option)
  ?start_date:(start_date_ : maintenance_window_string_date_time option)
  ?description:(description_ : maintenance_window_description option)
  ~allow_unassociated_targets:(allow_unassociated_targets_ :
                                maintenance_window_allow_unassociated_targets)
  ~cutoff:(cutoff_ : maintenance_window_cutoff)
  ~duration:(duration_ : maintenance_window_duration_hours)
  ~schedule:(schedule_ : maintenance_window_schedule)
  ~name:(name_ : maintenance_window_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     allow_unassociated_targets = allow_unassociated_targets_;
     cutoff = cutoff_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     schedule_timezone = schedule_timezone_;
     schedule = schedule_;
     end_date = end_date_;
     start_date = start_date_;
     description = description_;
     name = name_
   } : create_maintenance_window_request)
let make_create_document_request ?tags:(tags_ : tag_list option)
  ?target_type:(target_type_ : target_type option)
  ?document_format:(document_format_ : document_format option)
  ?document_type:(document_type_ : document_type option)
  ?version_name:(version_name_ : document_version_name option)
  ?display_name:(display_name_ : document_display_name option)
  ?attachments:(attachments_ : attachments_source_list option)
  ?requires:(requires_ : document_requires_list option)
  ~name:(name_ : document_name) ~content:(content_ : document_content) () =
  ({
     tags = tags_;
     target_type = target_type_;
     document_format = document_format_;
     document_type = document_type_;
     version_name = version_name_;
     display_name = display_name_;
     name = name_;
     attachments = attachments_;
     requires = requires_;
     content = content_
   } : create_document_request)
let make_create_association_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option)
  ?tags:(tags_ : tag_list option)
  ?target_maps:(target_maps_ : target_maps option)
  ?duration:(duration_ : duration option)
  ?schedule_offset:(schedule_offset_ : schedule_offset option)
  ?target_locations:(target_locations_ : target_locations option)
  ?calendar_names:(calendar_names_ : calendar_name_or_arn_list option)
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ :
                                 apply_only_at_cron_interval option)
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option)
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
  ?max_concurrency:(max_concurrency_ : max_concurrency option)
  ?max_errors:(max_errors_ : max_errors option)
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      automation_target_parameter_name option)
  ?association_name:(association_name_ : association_name option)
  ?output_location:(output_location_ :
                     instance_association_output_location option)
  ?schedule_expression:(schedule_expression_ : schedule_expression option)
  ?targets:(targets_ : targets option)
  ?parameters:(parameters_ : parameters option)
  ?instance_id:(instance_id_ : instance_id option)
  ?document_version:(document_version_ : document_version option)
  ~name:(name_ : document_ar_n) () =
  ({
     alarm_configuration = alarm_configuration_;
     tags = tags_;
     target_maps = target_maps_;
     duration = duration_;
     schedule_offset = schedule_offset_;
     target_locations = target_locations_;
     calendar_names = calendar_names_;
     apply_only_at_cron_interval = apply_only_at_cron_interval_;
     sync_compliance = sync_compliance_;
     compliance_severity = compliance_severity_;
     max_concurrency = max_concurrency_;
     max_errors = max_errors_;
     automation_target_parameter_name = automation_target_parameter_name_;
     association_name = association_name_;
     output_location = output_location_;
     schedule_expression = schedule_expression_;
     targets = targets_;
     parameters = parameters_;
     instance_id = instance_id_;
     document_version = document_version_;
     name = name_
   } : create_association_request)
let make_create_association_batch_request
  ~entries:(entries_ : create_association_batch_request_entries) () =
  ({ entries = entries_ } : create_association_batch_request)
let make_create_activation_request
  ?registration_metadata:(registration_metadata_ :
                           registration_metadata_list option)
  ?tags:(tags_ : tag_list option)
  ?expiration_date:(expiration_date_ : expiration_date option)
  ?registration_limit:(registration_limit_ : registration_limit option)
  ?default_instance_name:(default_instance_name_ :
                           default_instance_name option)
  ?description:(description_ : activation_description option)
  ~iam_role:(iam_role_ : iam_role) () =
  ({
     registration_metadata = registration_metadata_;
     tags = tags_;
     expiration_date = expiration_date_;
     registration_limit = registration_limit_;
     iam_role = iam_role_;
     default_instance_name = default_instance_name_;
     description = description_
   } : create_activation_request)
let make_cancel_maintenance_window_execution_request
  ~window_execution_id:(window_execution_id_ :
                         maintenance_window_execution_id)
  () =
  ({ window_execution_id = window_execution_id_ } : cancel_maintenance_window_execution_request)
let make_cancel_command_request
  ?instance_ids:(instance_ids_ : instance_id_list option)
  ~command_id:(command_id_ : command_id) () =
  ({ instance_ids = instance_ids_; command_id = command_id_ } : cancel_command_request)
let make_associate_ops_item_related_item_response
  ?association_id:(association_id_ :
                    ops_item_related_item_association_id option)
  () =
  ({ association_id = association_id_ } : associate_ops_item_related_item_response)
let make_associate_ops_item_related_item_request
  ~resource_uri:(resource_uri_ :
                  ops_item_related_item_association_resource_uri)
  ~resource_type:(resource_type_ :
                   ops_item_related_item_association_resource_type)
  ~association_type:(association_type_ :
                      ops_item_related_item_association_type)
  ~ops_item_id:(ops_item_id_ : ops_item_id) () =
  ({
     resource_uri = resource_uri_;
     resource_type = resource_type_;
     association_type = association_type_;
     ops_item_id = ops_item_id_
   } : associate_ops_item_related_item_request)
let make_add_tags_to_resource_request ~tags:(tags_ : tag_list)
  ~resource_id:(resource_id_ : resource_id)
  ~resource_type:(resource_type_ : resource_type_for_tagging) () =
  ({ tags = tags_; resource_id = resource_id_; resource_type = resource_type_
   } : add_tags_to_resource_request)