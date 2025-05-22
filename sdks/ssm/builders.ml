open Smaws_Lib
open Types
let make_update_service_setting_request
  ~setting_value:(setting_value_ : string) 
  ~setting_id:(setting_id_ : string)  () =
  ({ setting_value = setting_value_; setting_id = setting_id_ } : update_service_setting_request)
let make_resource_data_sync_organizational_unit
  ?organizational_unit_id:(organizational_unit_id_ : string option)  () =
  ({ organizational_unit_id = organizational_unit_id_ } : resource_data_sync_organizational_unit)
let make_resource_data_sync_aws_organizations_source
  ?organizational_units:(organizational_units_ :
                          resource_data_sync_organizational_unit list option)
   ~organization_source_type:(organization_source_type_ : string)  () =
  ({
     organizational_units = organizational_units_;
     organization_source_type = organization_source_type_
   } : resource_data_sync_aws_organizations_source)
let make_resource_data_sync_source
  ?enable_all_ops_data_sources:(enable_all_ops_data_sources_ : bool option) 
  ?include_future_regions:(include_future_regions_ : bool option) 
  ?aws_organizations_source:(aws_organizations_source_ :
                              resource_data_sync_aws_organizations_source
                                option)
   ~source_regions:(source_regions_ : string list) 
  ~source_type:(source_type_ : string)  () =
  ({
     enable_all_ops_data_sources = enable_all_ops_data_sources_;
     include_future_regions = include_future_regions_;
     source_regions = source_regions_;
     aws_organizations_source = aws_organizations_source_;
     source_type = source_type_
   } : resource_data_sync_source)
let make_update_resource_data_sync_request
  ~sync_source:(sync_source_ : resource_data_sync_source) 
  ~sync_type:(sync_type_ : string)  ~sync_name:(sync_name_ : string)  () =
  ({
     sync_source = sync_source_;
     sync_type = sync_type_;
     sync_name = sync_name_
   } : update_resource_data_sync_request)
let make_patch_filter ~values:(values_ : string list) 
  ~key:(key_ : patch_filter_key)  () =
  ({ values = values_; key = key_ } : patch_filter)
let make_patch_filter_group
  ~patch_filters:(patch_filters_ : patch_filter list)  () =
  ({ patch_filters = patch_filters_ } : patch_filter_group)
let make_patch_rule ?enable_non_security:(enable_non_security_ : bool option)
   ?approve_until_date:(approve_until_date_ : string option) 
  ?approve_after_days:(approve_after_days_ : int option) 
  ?compliance_level:(compliance_level_ : patch_compliance_level option) 
  ~patch_filter_group:(patch_filter_group_ : patch_filter_group)  () =
  ({
     enable_non_security = enable_non_security_;
     approve_until_date = approve_until_date_;
     approve_after_days = approve_after_days_;
     compliance_level = compliance_level_;
     patch_filter_group = patch_filter_group_
   } : patch_rule)
let make_patch_rule_group ~patch_rules:(patch_rules_ : patch_rule list)  () =
  ({ patch_rules = patch_rules_ } : patch_rule_group)
let make_patch_source ~configuration:(configuration_ : string) 
  ~products:(products_ : string list)  ~name:(name_ : string)  () =
  ({ configuration = configuration_; products = products_; name = name_ } : 
  patch_source)
let make_update_patch_baseline_request ?replace:(replace_ : bool option) 
  ?sources:(sources_ : patch_source list option) 
  ?description:(description_ : string option) 
  ?rejected_patches_action:(rejected_patches_action_ : patch_action option) 
  ?rejected_patches:(rejected_patches_ : string list option) 
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : bool option)
   ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                        patch_compliance_level option)
   ?approved_patches:(approved_patches_ : string list option) 
  ?approval_rules:(approval_rules_ : patch_rule_group option) 
  ?global_filters:(global_filters_ : patch_filter_group option) 
  ?name:(name_ : string option)  ~baseline_id:(baseline_id_ : string)  () =
  ({
     replace = replace_;
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
let make_metadata_value ?value:(value_ : string option)  () =
  ({ value = value_ } : metadata_value)
let make_update_ops_metadata_request
  ?keys_to_delete:(keys_to_delete_ : string list option) 
  ?metadata_to_update:(metadata_to_update_ : metadata_map option) 
  ~ops_metadata_arn:(ops_metadata_arn_ : string)  () =
  ({
     keys_to_delete = keys_to_delete_;
     metadata_to_update = metadata_to_update_;
     ops_metadata_arn = ops_metadata_arn_
   } : update_ops_metadata_request)
let make_update_ops_item_response () = (() : unit)
let make_ops_item_data_value ?type_:(type__ : ops_item_data_type option) 
  ?value:(value_ : string option)  () =
  ({ type_ = type__; value = value_ } : ops_item_data_value)
let make_ops_item_notification ?arn:(arn_ : string option)  () =
  ({ arn = arn_ } : ops_item_notification)
let make_related_ops_item ~ops_item_id:(ops_item_id_ : string)  () =
  ({ ops_item_id = ops_item_id_ } : related_ops_item)
let make_update_ops_item_request
  ?ops_item_arn:(ops_item_arn_ : string option) 
  ?planned_end_time:(planned_end_time_ : CoreTypes.Timestamp.t option) 
  ?planned_start_time:(planned_start_time_ : CoreTypes.Timestamp.t option) 
  ?actual_end_time:(actual_end_time_ : CoreTypes.Timestamp.t option) 
  ?actual_start_time:(actual_start_time_ : CoreTypes.Timestamp.t option) 
  ?severity:(severity_ : string option) 
  ?category:(category_ : string option)  ?title:(title_ : string option) 
  ?status:(status_ : ops_item_status option) 
  ?related_ops_items:(related_ops_items_ : related_ops_item list option) 
  ?priority:(priority_ : int option) 
  ?notifications:(notifications_ : ops_item_notification list option) 
  ?operational_data_to_delete:(operational_data_to_delete_ :
                                string list option)
   ?operational_data:(operational_data_ : ops_item_operational_data option) 
  ?description:(description_ : string option) 
  ~ops_item_id:(ops_item_id_ : string)  () =
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
let make_update_managed_instance_role_request ~iam_role:(iam_role_ : string) 
  ~instance_id:(instance_id_ : string)  () =
  ({ iam_role = iam_role_; instance_id = instance_id_ } : update_managed_instance_role_request)
let make_target ?values:(values_ : string list option) 
  ?key:(key_ : string option)  () =
  ({ values = values_; key = key_ } : target)
let make_maintenance_window_task_parameter_value_expression
  ?values:(values_ : string list option)  () =
  ({ values = values_ } : maintenance_window_task_parameter_value_expression)
let make_cloud_watch_output_config
  ?cloud_watch_output_enabled:(cloud_watch_output_enabled_ : bool option) 
  ?cloud_watch_log_group_name:(cloud_watch_log_group_name_ : string option) 
  () =
  ({
     cloud_watch_output_enabled = cloud_watch_output_enabled_;
     cloud_watch_log_group_name = cloud_watch_log_group_name_
   } : cloud_watch_output_config)
let make_notification_config
  ?notification_type:(notification_type_ : notification_type option) 
  ?notification_events:(notification_events_ :
                         notification_event list option)
   ?notification_arn:(notification_arn_ : string option)  () =
  ({
     notification_type = notification_type_;
     notification_events = notification_events_;
     notification_arn = notification_arn_
   } : notification_config)
let make_maintenance_window_run_command_parameters
  ?timeout_seconds:(timeout_seconds_ : int option) 
  ?service_role_arn:(service_role_arn_ : string option) 
  ?parameters:(parameters_ : parameters option) 
  ?output_s3_key_prefix:(output_s3_key_prefix_ : string option) 
  ?output_s3_bucket_name:(output_s3_bucket_name_ : string option) 
  ?notification_config:(notification_config_ : notification_config option) 
  ?document_version:(document_version_ : string option) 
  ?document_hash_type:(document_hash_type_ : document_hash_type option) 
  ?document_hash:(document_hash_ : string option) 
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
   ?comment:(comment_ : string option)  () =
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
  ?document_version:(document_version_ : string option)  () =
  ({ parameters = parameters_; document_version = document_version_ } : 
  maintenance_window_automation_parameters)
let make_maintenance_window_step_functions_parameters
  ?name:(name_ : string option)  ?input:(input_ : string option)  () =
  ({ name = name_; input = input_ } : maintenance_window_step_functions_parameters)
let make_maintenance_window_lambda_parameters
  ?payload:(payload_ : bytes option)  ?qualifier:(qualifier_ : string option)
   ?client_context:(client_context_ : string option)  () =
  ({
     payload = payload_;
     qualifier = qualifier_;
     client_context = client_context_
   } : maintenance_window_lambda_parameters)
let make_maintenance_window_task_invocation_parameters
  ?lambda:(lambda_ : maintenance_window_lambda_parameters option) 
  ?step_functions:(step_functions_ :
                    maintenance_window_step_functions_parameters option)
   ?automation:(automation_ :
                 maintenance_window_automation_parameters option)
   ?run_command:(run_command_ :
                  maintenance_window_run_command_parameters option)
   () =
  ({
     lambda = lambda_;
     step_functions = step_functions_;
     automation = automation_;
     run_command = run_command_
   } : maintenance_window_task_invocation_parameters)
let make_logging_info ?s3_key_prefix:(s3_key_prefix_ : string option) 
  ~s3_region:(s3_region_ : string) 
  ~s3_bucket_name:(s3_bucket_name_ : string)  () =
  ({
     s3_region = s3_region_;
     s3_key_prefix = s3_key_prefix_;
     s3_bucket_name = s3_bucket_name_
   } : logging_info)
let make_alarm ~name:(name_ : string)  () = ({ name = name_ } : alarm)
let make_alarm_configuration
  ?ignore_poll_alarm_failure:(ignore_poll_alarm_failure_ : bool option) 
  ~alarms:(alarms_ : alarm list)  () =
  ({ alarms = alarms_; ignore_poll_alarm_failure = ignore_poll_alarm_failure_
   } : alarm_configuration)
let make_update_maintenance_window_task_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
   ?replace:(replace_ : bool option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?logging_info:(logging_info_ : logging_info option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?priority:(priority_ : int option) 
  ?task_invocation_parameters:(task_invocation_parameters_ :
                                maintenance_window_task_invocation_parameters
                                  option)
   ?task_parameters:(task_parameters_ :
                      maintenance_window_task_parameters option)
   ?service_role_arn:(service_role_arn_ : string option) 
  ?task_arn:(task_arn_ : string option) 
  ?targets:(targets_ : target list option) 
  ~window_task_id:(window_task_id_ : string) 
  ~window_id:(window_id_ : string)  () =
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
  ?replace:(replace_ : bool option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?owner_information:(owner_information_ : string option) 
  ?targets:(targets_ : target list option) 
  ~window_target_id:(window_target_id_ : string) 
  ~window_id:(window_id_ : string)  () =
  ({
     replace = replace_;
     description = description_;
     name = name_;
     owner_information = owner_information_;
     targets = targets_;
     window_target_id = window_target_id_;
     window_id = window_id_
   } : update_maintenance_window_target_request)
let make_update_maintenance_window_request ?replace:(replace_ : bool option) 
  ?enabled:(enabled_ : bool option) 
  ?allow_unassociated_targets:(allow_unassociated_targets_ : bool option) 
  ?cutoff:(cutoff_ : int option)  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?schedule_timezone:(schedule_timezone_ : string option) 
  ?schedule:(schedule_ : string option) 
  ?end_date:(end_date_ : string option) 
  ?start_date:(start_date_ : string option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ~window_id:(window_id_ : string)  () =
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
let make_document_parameter ?default_value:(default_value_ : string option) 
  ?description:(description_ : string option) 
  ?type_:(type__ : document_parameter_type option) 
  ?name:(name_ : string option)  () =
  ({
     default_value = default_value_;
     description = description_;
     type_ = type__;
     name = name_
   } : document_parameter)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_attachment_information ?name:(name_ : string option)  () =
  ({ name = name_ } : attachment_information)
let make_document_requires ?version_name:(version_name_ : string option) 
  ?require_type:(require_type_ : string option) 
  ?version:(version_ : string option)  ~name:(name_ : string)  () =
  ({
     version_name = version_name_;
     require_type = require_type_;
     version = version_;
     name = name_
   } : document_requires)
let make_review_information ?reviewer:(reviewer_ : string option) 
  ?status:(status_ : review_status option) 
  ?reviewed_time:(reviewed_time_ : CoreTypes.Timestamp.t option)  () =
  ({ reviewer = reviewer_; status = status_; reviewed_time = reviewed_time_ } : 
  review_information)
let make_document_description
  ?category_enum:(category_enum_ : string list option) 
  ?category:(category_ : string list option) 
  ?review_status:(review_status_ : review_status option) 
  ?pending_review_version:(pending_review_version_ : string option) 
  ?approved_version:(approved_version_ : string option) 
  ?review_information:(review_information_ : review_information list option) 
  ?author:(author_ : string option) 
  ?requires:(requires_ : document_requires list option) 
  ?attachments_information:(attachments_information_ :
                             attachment_information list option)
   ?tags:(tags_ : tag list option) 
  ?target_type:(target_type_ : string option) 
  ?document_format:(document_format_ : document_format option) 
  ?default_version:(default_version_ : string option) 
  ?latest_version:(latest_version_ : string option) 
  ?schema_version:(schema_version_ : string option) 
  ?document_type:(document_type_ : document_type option) 
  ?platform_types:(platform_types_ : platform_type list option) 
  ?parameters:(parameters_ : document_parameter list option) 
  ?description:(description_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?status_information:(status_information_ : string option) 
  ?status:(status_ : document_status option) 
  ?created_date:(created_date_ : CoreTypes.Timestamp.t option) 
  ?owner:(owner_ : string option) 
  ?version_name:(version_name_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?name:(name_ : string option) 
  ?hash_type:(hash_type_ : document_hash_type option) 
  ?hash:(hash_ : string option)  ?sha1:(sha1_ : string option)  () =
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
let make_attachments_source ?name:(name_ : string option) 
  ?values:(values_ : string list option) 
  ?key:(key_ : attachments_source_key option)  () =
  ({ name = name_; values = values_; key = key_ } : attachments_source)
let make_update_document_request ?target_type:(target_type_ : string option) 
  ?document_format:(document_format_ : document_format option) 
  ?document_version:(document_version_ : string option) 
  ?version_name:(version_name_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?attachments:(attachments_ : attachments_source list option) 
  ~name:(name_ : string)  ~content:(content_ : string)  () =
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
let make_document_review_comment_source ?content:(content_ : string option) 
  ?type_:(type__ : document_review_comment_type option)  () =
  ({ content = content_; type_ = type__ } : document_review_comment_source)
let make_document_reviews
  ?comment:(comment_ : document_review_comment_source list option) 
  ~action:(action_ : document_review_action)  () =
  ({ comment = comment_; action = action_ } : document_reviews)
let make_update_document_metadata_request
  ?document_version:(document_version_ : string option) 
  ~document_reviews:(document_reviews_ : document_reviews) 
  ~name:(name_ : string)  () =
  ({
     document_reviews = document_reviews_;
     document_version = document_version_;
     name = name_
   } : update_document_metadata_request)
let make_document_default_version_description
  ?default_version_name:(default_version_name_ : string option) 
  ?default_version:(default_version_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     default_version_name = default_version_name_;
     default_version = default_version_;
     name = name_
   } : document_default_version_description)
let make_update_document_default_version_request
  ~document_version:(document_version_ : string)  ~name:(name_ : string)  ()
  =
  ({ document_version = document_version_; name = name_ } : update_document_default_version_request)
let make_association_status
  ?additional_info:(additional_info_ : string option) 
  ~message:(message_ : string)  ~name:(name_ : association_status_name) 
  ~date:(date_ : CoreTypes.Timestamp.t)  () =
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
   ?detailed_status:(detailed_status_ : string option) 
  ?status:(status_ : string option)  () =
  ({
     association_status_aggregated_count =
       association_status_aggregated_count_;
     detailed_status = detailed_status_;
     status = status_
   } : association_overview)
let make_s3_output_location
  ?output_s3_key_prefix:(output_s3_key_prefix_ : string option) 
  ?output_s3_bucket_name:(output_s3_bucket_name_ : string option) 
  ?output_s3_region:(output_s3_region_ : string option)  () =
  ({
     output_s3_key_prefix = output_s3_key_prefix_;
     output_s3_bucket_name = output_s3_bucket_name_;
     output_s3_region = output_s3_region_
   } : s3_output_location)
let make_instance_association_output_location
  ?s3_location:(s3_location_ : s3_output_location option)  () =
  ({ s3_location = s3_location_ } : instance_association_output_location)
let make_target_location
  ?target_location_alarm_configuration:(target_location_alarm_configuration_
                                         : alarm_configuration option)
   ?execution_role_name:(execution_role_name_ : string option) 
  ?target_location_max_errors:(target_location_max_errors_ : string option) 
  ?target_location_max_concurrency:(target_location_max_concurrency_ :
                                     string option)
   ?regions:(regions_ : string list option) 
  ?accounts:(accounts_ : string list option)  () =
  ({
     target_location_alarm_configuration =
       target_location_alarm_configuration_;
     execution_role_name = execution_role_name_;
     target_location_max_errors = target_location_max_errors_;
     target_location_max_concurrency = target_location_max_concurrency_;
     regions = regions_;
     accounts = accounts_
   } : target_location)
let make_alarm_state_information ~state:(state_ : external_alarm_state) 
  ~name:(name_ : string)  () =
  ({ state = state_; name = name_ } : alarm_state_information)
let make_association_description
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?calendar_names:(calendar_names_ : string list option) 
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : bool option) 
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option) 
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
   ?max_concurrency:(max_concurrency_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?association_name:(association_name_ : string option) 
  ?last_successful_execution_date:(last_successful_execution_date_ :
                                    CoreTypes.Timestamp.t option)
   ?last_execution_date:(last_execution_date_ : CoreTypes.Timestamp.t option)
   ?output_location:(output_location_ :
                      instance_association_output_location option)
   ?schedule_expression:(schedule_expression_ : string option) 
  ?targets:(targets_ : target list option) 
  ?association_id:(association_id_ : string option) 
  ?parameters:(parameters_ : parameters option) 
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      string option)
   ?document_version:(document_version_ : string option) 
  ?overview:(overview_ : association_overview option) 
  ?status:(status_ : association_status option) 
  ?last_update_association_date:(last_update_association_date_ :
                                  CoreTypes.Timestamp.t option)
   ?date:(date_ : CoreTypes.Timestamp.t option) 
  ?association_version:(association_version_ : string option) 
  ?instance_id:(instance_id_ : string option)  ?name:(name_ : string option) 
  () =
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
  ~instance_id:(instance_id_ : string)  ~name:(name_ : string)  () =
  ({
     association_status = association_status_;
     instance_id = instance_id_;
     name = name_
   } : update_association_status_request)
let make_update_association_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?calendar_names:(calendar_names_ : string list option) 
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : bool option) 
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option) 
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
   ?max_concurrency:(max_concurrency_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      string option)
   ?association_version:(association_version_ : string option) 
  ?association_name:(association_name_ : string option) 
  ?targets:(targets_ : target list option)  ?name:(name_ : string option) 
  ?output_location:(output_location_ :
                     instance_association_output_location option)
   ?schedule_expression:(schedule_expression_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?parameters:(parameters_ : parameters option) 
  ~association_id:(association_id_ : string)  () =
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
let make_unlabel_parameter_version_request ~labels:(labels_ : string list) 
  ~parameter_version:(parameter_version_ : int)  ~name:(name_ : string)  () =
  ({ labels = labels_; parameter_version = parameter_version_; name = name_ } : 
  unlabel_parameter_version_request)
let make_terminate_session_response ?session_id:(session_id_ : string option)
   () = ({ session_id = session_id_ } : terminate_session_response)
let make_terminate_session_request ~session_id:(session_id_ : string)  () =
  ({ session_id = session_id_ } : terminate_session_request)
let make_stop_automation_execution_request ?type_:(type__ : stop_type option)
   ~automation_execution_id:(automation_execution_id_ : string)  () =
  ({ type_ = type__; automation_execution_id = automation_execution_id_ } : 
  stop_automation_execution_request)
let make_failure_details
  ?details:(details_ : automation_parameter_map option) 
  ?failure_type:(failure_type_ : string option) 
  ?failure_stage:(failure_stage_ : string option)  () =
  ({
     details = details_;
     failure_type = failure_type_;
     failure_stage = failure_stage_
   } : failure_details)
let make_parent_step_details
  ?iterator_value:(iterator_value_ : string option) 
  ?iteration:(iteration_ : int option)  ?action:(action_ : string option) 
  ?step_name:(step_name_ : string option) 
  ?step_execution_id:(step_execution_id_ : string option)  () =
  ({
     iterator_value = iterator_value_;
     iteration = iteration_;
     action = action_;
     step_name = step_name_;
     step_execution_id = step_execution_id_
   } : parent_step_details)
let make_step_execution
  ?parent_step_details:(parent_step_details_ : parent_step_details option) 
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?target_location:(target_location_ : target_location option) 
  ?targets:(targets_ : target list option) 
  ?valid_next_steps:(valid_next_steps_ : string list option) 
  ?is_critical:(is_critical_ : bool option) 
  ?next_step:(next_step_ : string option)  ?is_end:(is_end_ : bool option) 
  ?overridden_parameters:(overridden_parameters_ :
                           automation_parameter_map option)
   ?step_execution_id:(step_execution_id_ : string option) 
  ?failure_details:(failure_details_ : failure_details option) 
  ?failure_message:(failure_message_ : string option) 
  ?response:(response_ : string option) 
  ?outputs:(outputs_ : automation_parameter_map option) 
  ?inputs:(inputs_ : normal_string_map option) 
  ?response_code:(response_code_ : string option) 
  ?step_status:(step_status_ : automation_execution_status option) 
  ?execution_end_time:(execution_end_time_ : CoreTypes.Timestamp.t option) 
  ?execution_start_time:(execution_start_time_ :
                          CoreTypes.Timestamp.t option)
   ?max_attempts:(max_attempts_ : int option) 
  ?on_failure:(on_failure_ : string option) 
  ?timeout_seconds:(timeout_seconds_ : int option) 
  ?action:(action_ : string option)  ?step_name:(step_name_ : string option) 
  () =
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
let make_step_execution_filter ~values:(values_ : string list) 
  ~key:(key_ : step_execution_filter_key)  () =
  ({ values = values_; key = key_ } : step_execution_filter)
let make_start_session_response ?stream_url:(stream_url_ : string option) 
  ?token_value:(token_value_ : string option) 
  ?session_id:(session_id_ : string option)  () =
  ({
     stream_url = stream_url_;
     token_value = token_value_;
     session_id = session_id_
   } : start_session_response)
let make_start_session_request
  ?parameters:(parameters_ : session_manager_parameters option) 
  ?reason:(reason_ : string option) 
  ?document_name:(document_name_ : string option)  ~target:(target_ : string)
   () =
  ({
     parameters = parameters_;
     reason = reason_;
     document_name = document_name_;
     target = target_
   } : start_session_request)
let make_runbook
  ?target_locations:(target_locations_ : target_location list option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?targets:(targets_ : target list option) 
  ?target_parameter_name:(target_parameter_name_ : string option) 
  ?parameters:(parameters_ : automation_parameter_map option) 
  ?document_version:(document_version_ : string option) 
  ~document_name:(document_name_ : string)  () =
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
  ?change_details:(change_details_ : string option) 
  ?scheduled_end_time:(scheduled_end_time_ : CoreTypes.Timestamp.t option) 
  ?tags:(tags_ : tag list option) 
  ?auto_approve:(auto_approve_ : bool option) 
  ?client_token:(client_token_ : string option) 
  ?change_request_name:(change_request_name_ : string option) 
  ?parameters:(parameters_ : automation_parameter_map option) 
  ?document_version:(document_version_ : string option) 
  ?scheduled_time:(scheduled_time_ : CoreTypes.Timestamp.t option) 
  ~runbooks:(runbooks_ : runbook list) 
  ~document_name:(document_name_ : string)  () =
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
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?tags:(tags_ : tag list option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?targets:(targets_ : target list option) 
  ?target_parameter_name:(target_parameter_name_ : string option) 
  ?mode:(mode_ : execution_mode option) 
  ?client_token:(client_token_ : string option) 
  ?parameters:(parameters_ : automation_parameter_map option) 
  ?document_version:(document_version_ : string option) 
  ~document_name:(document_name_ : string)  () =
  ({
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
  ~association_ids:(association_ids_ : string list)  () =
  ({ association_ids = association_ids_ } : start_associations_once_request)
let make_severity_summary
  ?unspecified_count:(unspecified_count_ : int option) 
  ?informational_count:(informational_count_ : int option) 
  ?low_count:(low_count_ : int option) 
  ?medium_count:(medium_count_ : int option) 
  ?high_count:(high_count_ : int option) 
  ?critical_count:(critical_count_ : int option)  () =
  ({
     unspecified_count = unspecified_count_;
     informational_count = informational_count_;
     low_count = low_count_;
     medium_count = medium_count_;
     high_count = high_count_;
     critical_count = critical_count_
   } : severity_summary)
let make_session_manager_output_url
  ?cloud_watch_output_url:(cloud_watch_output_url_ : string option) 
  ?s3_output_url:(s3_output_url_ : string option)  () =
  ({
     cloud_watch_output_url = cloud_watch_output_url_;
     s3_output_url = s3_output_url_
   } : session_manager_output_url)
let make_session
  ?max_session_duration:(max_session_duration_ : string option) 
  ?output_url:(output_url_ : session_manager_output_url option) 
  ?details:(details_ : string option)  ?reason:(reason_ : string option) 
  ?owner:(owner_ : string option) 
  ?document_name:(document_name_ : string option) 
  ?end_date:(end_date_ : CoreTypes.Timestamp.t option) 
  ?start_date:(start_date_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : session_status option) 
  ?target:(target_ : string option) 
  ?session_id:(session_id_ : string option)  () =
  ({
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
let make_session_filter ~value:(value_ : string) 
  ~key:(key_ : session_filter_key)  () =
  ({ value = value_; key = key_ } : session_filter)
let make_service_setting ?status:(status_ : string option) 
  ?ar_n:(ar_n_ : string option) 
  ?last_modified_user:(last_modified_user_ : string option) 
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?setting_value:(setting_value_ : string option) 
  ?setting_id:(setting_id_ : string option)  () =
  ({
     status = status_;
     ar_n = ar_n_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     setting_value = setting_value_;
     setting_id = setting_id_
   } : service_setting)
let make_command
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?timeout_seconds:(timeout_seconds_ : int option) 
  ?cloud_watch_output_config:(cloud_watch_output_config_ :
                               cloud_watch_output_config option)
   ?notification_config:(notification_config_ : notification_config option) 
  ?service_role:(service_role_ : string option) 
  ?delivery_timed_out_count:(delivery_timed_out_count_ : int option) 
  ?error_count:(error_count_ : int option) 
  ?completed_count:(completed_count_ : int option) 
  ?target_count:(target_count_ : int option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?output_s3_key_prefix:(output_s3_key_prefix_ : string option) 
  ?output_s3_bucket_name:(output_s3_bucket_name_ : string option) 
  ?output_s3_region:(output_s3_region_ : string option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : command_status option) 
  ?requested_date_time:(requested_date_time_ : CoreTypes.Timestamp.t option) 
  ?targets:(targets_ : target list option) 
  ?instance_ids:(instance_ids_ : string list option) 
  ?parameters:(parameters_ : parameters option) 
  ?expires_after:(expires_after_ : CoreTypes.Timestamp.t option) 
  ?comment:(comment_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?document_name:(document_name_ : string option) 
  ?command_id:(command_id_ : string option)  () =
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
  ?service_role_arn:(service_role_arn_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?output_s3_key_prefix:(output_s3_key_prefix_ : string option) 
  ?output_s3_bucket_name:(output_s3_bucket_name_ : string option) 
  ?output_s3_region:(output_s3_region_ : string option) 
  ?parameters:(parameters_ : parameters option) 
  ?comment:(comment_ : string option) 
  ?timeout_seconds:(timeout_seconds_ : int option) 
  ?document_hash_type:(document_hash_type_ : document_hash_type option) 
  ?document_hash:(document_hash_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?targets:(targets_ : target list option) 
  ?instance_ids:(instance_ids_ : string list option) 
  ~document_name:(document_name_ : string)  () =
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
  ~automation_execution_id:(automation_execution_id_ : string)  () =
  ({
     payload = payload_;
     signal_type = signal_type_;
     automation_execution_id = automation_execution_id_
   } : send_automation_signal_request)
let make_scheduled_window_execution
  ?execution_time:(execution_time_ : string option) 
  ?name:(name_ : string option)  ?window_id:(window_id_ : string option)  ()
  =
  ({ execution_time = execution_time_; name = name_; window_id = window_id_ } : 
  scheduled_window_execution)
let make_s3_output_url ?output_url:(output_url_ : string option)  () =
  ({ output_url = output_url_ } : s3_output_url)
let make_resume_session_response ?stream_url:(stream_url_ : string option) 
  ?token_value:(token_value_ : string option) 
  ?session_id:(session_id_ : string option)  () =
  ({
     stream_url = stream_url_;
     token_value = token_value_;
     session_id = session_id_
   } : resume_session_response)
let make_resume_session_request ~session_id:(session_id_ : string)  () =
  ({ session_id = session_id_ } : resume_session_request)
let make_result_attribute ~type_name:(type_name_ : string)  () =
  ({ type_name = type_name_ } : result_attribute)
let make_resource_data_sync_source_with_state
  ?enable_all_ops_data_sources:(enable_all_ops_data_sources_ : bool option) 
  ?state:(state_ : string option) 
  ?include_future_regions:(include_future_regions_ : bool option) 
  ?source_regions:(source_regions_ : string list option) 
  ?aws_organizations_source:(aws_organizations_source_ :
                              resource_data_sync_aws_organizations_source
                                option)
   ?source_type:(source_type_ : string option)  () =
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
                                   string option)
   () =
  ({ destination_data_sharing_type = destination_data_sharing_type_ } : 
  resource_data_sync_destination_data_sharing)
let make_resource_data_sync_s3_destination
  ?destination_data_sharing:(destination_data_sharing_ :
                              resource_data_sync_destination_data_sharing
                                option)
   ?awskms_key_ar_n:(awskms_key_ar_n_ : string option) 
  ?prefix:(prefix_ : string option)  ~region:(region_ : string) 
  ~sync_format:(sync_format_ : resource_data_sync_s3_format) 
  ~bucket_name:(bucket_name_ : string)  () =
  ({
     destination_data_sharing = destination_data_sharing_;
     awskms_key_ar_n = awskms_key_ar_n_;
     region = region_;
     sync_format = sync_format_;
     prefix = prefix_;
     bucket_name = bucket_name_
   } : resource_data_sync_s3_destination)
let make_resource_data_sync_item
  ?last_sync_status_message:(last_sync_status_message_ : string option) 
  ?sync_created_time:(sync_created_time_ : CoreTypes.Timestamp.t option) 
  ?last_status:(last_status_ : last_resource_data_sync_status option) 
  ?sync_last_modified_time:(sync_last_modified_time_ :
                             CoreTypes.Timestamp.t option)
   ?last_successful_sync_time:(last_successful_sync_time_ :
                                CoreTypes.Timestamp.t option)
   ?last_sync_time:(last_sync_time_ : CoreTypes.Timestamp.t option) 
  ?s3_destination:(s3_destination_ :
                    resource_data_sync_s3_destination option)
   ?sync_source:(sync_source_ : resource_data_sync_source_with_state option) 
  ?sync_type:(sync_type_ : string option) 
  ?sync_name:(sync_name_ : string option)  () =
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
  ?execution_type:(execution_type_ : string option) 
  ?execution_id:(execution_id_ : string option) 
  ~execution_time:(execution_time_ : CoreTypes.Timestamp.t)  () =
  ({
     execution_type = execution_type_;
     execution_id = execution_id_;
     execution_time = execution_time_
   } : compliance_execution_summary)
let make_compliant_summary
  ?severity_summary:(severity_summary_ : severity_summary option) 
  ?compliant_count:(compliant_count_ : int option)  () =
  ({ severity_summary = severity_summary_; compliant_count = compliant_count_
   } : compliant_summary)
let make_non_compliant_summary
  ?severity_summary:(severity_summary_ : severity_summary option) 
  ?non_compliant_count:(non_compliant_count_ : int option)  () =
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
  ?resource_id:(resource_id_ : string option) 
  ?resource_type:(resource_type_ : string option) 
  ?compliance_type:(compliance_type_ : string option)  () =
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
let make_resolved_targets ?truncated:(truncated_ : bool option) 
  ?parameter_values:(parameter_values_ : string list option)  () =
  ({ truncated = truncated_; parameter_values = parameter_values_ } : 
  resolved_targets)
let make_reset_service_setting_request ~setting_id:(setting_id_ : string)  ()
  = ({ setting_id = setting_id_ } : reset_service_setting_request)
let make_remove_tags_from_resource_request
  ~tag_keys:(tag_keys_ : string list)  ~resource_id:(resource_id_ : string) 
  ~resource_type:(resource_type_ : resource_type_for_tagging)  () =
  ({
     tag_keys = tag_keys_;
     resource_id = resource_id_;
     resource_type = resource_type_
   } : remove_tags_from_resource_request)
let make_registration_metadata_item ~value:(value_ : string) 
  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : registration_metadata_item)
let make_register_task_with_maintenance_window_request
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
   ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?logging_info:(logging_info_ : logging_info option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?priority:(priority_ : int option) 
  ?task_invocation_parameters:(task_invocation_parameters_ :
                                maintenance_window_task_invocation_parameters
                                  option)
   ?task_parameters:(task_parameters_ :
                      maintenance_window_task_parameters option)
   ?service_role_arn:(service_role_arn_ : string option) 
  ?targets:(targets_ : target list option) 
  ~task_type:(task_type_ : maintenance_window_task_type) 
  ~task_arn:(task_arn_ : string)  ~window_id:(window_id_ : string)  () =
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
  ?client_token:(client_token_ : string option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?owner_information:(owner_information_ : string option) 
  ~targets:(targets_ : target list) 
  ~resource_type:(resource_type_ : maintenance_window_resource_type) 
  ~window_id:(window_id_ : string)  () =
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
  ~patch_group:(patch_group_ : string)  ~baseline_id:(baseline_id_ : string) 
  () =
  ({ patch_group = patch_group_; baseline_id = baseline_id_ } : register_patch_baseline_for_patch_group_request)
let make_register_default_patch_baseline_request
  ~baseline_id:(baseline_id_ : string)  () =
  ({ baseline_id = baseline_id_ } : register_default_patch_baseline_request)
let make_put_resource_policy_response
  ?policy_hash:(policy_hash_ : string option) 
  ?policy_id:(policy_id_ : string option)  () =
  ({ policy_hash = policy_hash_; policy_id = policy_id_ } : put_resource_policy_response)
let make_put_resource_policy_request
  ?policy_hash:(policy_hash_ : string option) 
  ?policy_id:(policy_id_ : string option)  ~policy:(policy_ : string) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({
     policy_hash = policy_hash_;
     policy_id = policy_id_;
     policy = policy_;
     resource_arn = resource_arn_
   } : put_resource_policy_request)
let make_put_parameter_request ?data_type:(data_type_ : string option) 
  ?policies:(policies_ : string option) 
  ?tier:(tier_ : parameter_tier option)  ?tags:(tags_ : tag list option) 
  ?allowed_pattern:(allowed_pattern_ : string option) 
  ?overwrite:(overwrite_ : bool option)  ?key_id:(key_id_ : string option) 
  ?type_:(type__ : parameter_type option) 
  ?description:(description_ : string option)  ~value:(value_ : string) 
  ~name:(name_ : string)  () =
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
  ?content:(content_ : inventory_item_entry list option) 
  ?content_hash:(content_hash_ : string option) 
  ~capture_time:(capture_time_ : string) 
  ~schema_version:(schema_version_ : string) 
  ~type_name:(type_name_ : string)  () =
  ({
     context = context_;
     content = content_;
     content_hash = content_hash_;
     capture_time = capture_time_;
     schema_version = schema_version_;
     type_name = type_name_
   } : inventory_item)
let make_put_inventory_request ~items:(items_ : inventory_item list) 
  ~instance_id:(instance_id_ : string)  () =
  ({ items = items_; instance_id = instance_id_ } : put_inventory_request)
let make_compliance_item_entry
  ?details:(details_ : compliance_item_details option) 
  ?title:(title_ : string option)  ?id:(id_ : string option) 
  ~status:(status_ : compliance_status) 
  ~severity:(severity_ : compliance_severity)  () =
  ({
     details = details_;
     status = status_;
     severity = severity_;
     title = title_;
     id = id_
   } : compliance_item_entry)
let make_put_compliance_items_request
  ?upload_type:(upload_type_ : compliance_upload_type option) 
  ?item_content_hash:(item_content_hash_ : string option) 
  ~items:(items_ : compliance_item_entry list) 
  ~execution_summary:(execution_summary_ : compliance_execution_summary) 
  ~compliance_type:(compliance_type_ : string) 
  ~resource_type:(resource_type_ : string) 
  ~resource_id:(resource_id_ : string)  () =
  ({
     upload_type = upload_type_;
     item_content_hash = item_content_hash_;
     items = items_;
     execution_summary = execution_summary_;
     compliance_type = compliance_type_;
     resource_type = resource_type_;
     resource_id = resource_id_
   } : put_compliance_items_request)
let make_progress_counters ?timed_out_steps:(timed_out_steps_ : int option) 
  ?cancelled_steps:(cancelled_steps_ : int option) 
  ?failed_steps:(failed_steps_ : int option) 
  ?success_steps:(success_steps_ : int option) 
  ?total_steps:(total_steps_ : int option)  () =
  ({
     timed_out_steps = timed_out_steps_;
     cancelled_steps = cancelled_steps_;
     failed_steps = failed_steps_;
     success_steps = success_steps_;
     total_steps = total_steps_
   } : progress_counters)
let make_patch_status
  ?approval_date:(approval_date_ : CoreTypes.Timestamp.t option) 
  ?compliance_level:(compliance_level_ : patch_compliance_level option) 
  ?deployment_status:(deployment_status_ : patch_deployment_status option) 
  () =
  ({
     approval_date = approval_date_;
     compliance_level = compliance_level_;
     deployment_status = deployment_status_
   } : patch_status)
let make_patch_orchestrator_filter ?values:(values_ : string list option) 
  ?key:(key_ : string option)  () =
  ({ values = values_; key = key_ } : patch_orchestrator_filter)
let make_patch ?repository:(repository_ : string option) 
  ?severity:(severity_ : string option)  ?arch:(arch_ : string option) 
  ?release:(release_ : string option)  ?version:(version_ : string option) 
  ?epoch:(epoch_ : int option)  ?name:(name_ : string option) 
  ?cve_ids:(cve_ids_ : string list option) 
  ?bugzilla_ids:(bugzilla_ids_ : string list option) 
  ?advisory_ids:(advisory_ids_ : string list option) 
  ?language:(language_ : string option) 
  ?msrc_number:(msrc_number_ : string option) 
  ?kb_number:(kb_number_ : string option) 
  ?msrc_severity:(msrc_severity_ : string option) 
  ?classification:(classification_ : string option) 
  ?product:(product_ : string option) 
  ?product_family:(product_family_ : string option) 
  ?vendor:(vendor_ : string option) 
  ?content_url:(content_url_ : string option) 
  ?description:(description_ : string option) 
  ?title:(title_ : string option) 
  ?release_date:(release_date_ : CoreTypes.Timestamp.t option) 
  ?id:(id_ : string option)  () =
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
  ?default_baseline:(default_baseline_ : bool option) 
  ?baseline_description:(baseline_description_ : string option) 
  ?operating_system:(operating_system_ : operating_system option) 
  ?baseline_name:(baseline_name_ : string option) 
  ?baseline_id:(baseline_id_ : string option)  () =
  ({
     default_baseline = default_baseline_;
     baseline_description = baseline_description_;
     operating_system = operating_system_;
     baseline_name = baseline_name_;
     baseline_id = baseline_id_
   } : patch_baseline_identity)
let make_patch_group_patch_baseline_mapping
  ?baseline_identity:(baseline_identity_ : patch_baseline_identity option) 
  ?patch_group:(patch_group_ : string option)  () =
  ({ baseline_identity = baseline_identity_; patch_group = patch_group_ } : 
  patch_group_patch_baseline_mapping)
let make_patch_compliance_data ?cve_ids:(cve_ids_ : string option) 
  ~installed_time:(installed_time_ : CoreTypes.Timestamp.t) 
  ~state:(state_ : patch_compliance_data_state) 
  ~severity:(severity_ : string)  ~classification:(classification_ : string) 
  ~kb_id:(kb_id_ : string)  ~title:(title_ : string)  () =
  ({
     cve_ids = cve_ids_;
     installed_time = installed_time_;
     state = state_;
     severity = severity_;
     classification = classification_;
     kb_id = kb_id_;
     title = title_
   } : patch_compliance_data)
let make_parameters_filter ~values:(values_ : string list) 
  ~key:(key_ : parameters_filter_key)  () =
  ({ values = values_; key = key_ } : parameters_filter)
let make_parameter_string_filter ?values:(values_ : string list option) 
  ?option_:(option__ : string option)  ~key:(key_ : string)  () =
  ({ values = values_; option_ = option__; key = key_ } : parameter_string_filter)
let make_parameter_inline_policy
  ?policy_status:(policy_status_ : string option) 
  ?policy_type:(policy_type_ : string option) 
  ?policy_text:(policy_text_ : string option)  () =
  ({
     policy_status = policy_status_;
     policy_type = policy_type_;
     policy_text = policy_text_
   } : parameter_inline_policy)
let make_parameter_metadata ?data_type:(data_type_ : string option) 
  ?policies:(policies_ : parameter_inline_policy list option) 
  ?tier:(tier_ : parameter_tier option)  ?version:(version_ : int option) 
  ?allowed_pattern:(allowed_pattern_ : string option) 
  ?description:(description_ : string option) 
  ?last_modified_user:(last_modified_user_ : string option) 
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?key_id:(key_id_ : string option)  ?type_:(type__ : parameter_type option) 
  ?ar_n:(ar_n_ : string option)  ?name:(name_ : string option)  () =
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
let make_parameter ?data_type:(data_type_ : string option) 
  ?ar_n:(ar_n_ : string option) 
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?source_result:(source_result_ : string option) 
  ?selector:(selector_ : string option)  ?version:(version_ : int option) 
  ?value:(value_ : string option)  ?type_:(type__ : parameter_type option) 
  ?name:(name_ : string option)  () =
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
let make_parameter_history ?data_type:(data_type_ : string option) 
  ?policies:(policies_ : parameter_inline_policy list option) 
  ?tier:(tier_ : parameter_tier option) 
  ?labels:(labels_ : string list option)  ?version:(version_ : int option) 
  ?allowed_pattern:(allowed_pattern_ : string option) 
  ?value:(value_ : string option) 
  ?description:(description_ : string option) 
  ?last_modified_user:(last_modified_user_ : string option) 
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?key_id:(key_id_ : string option)  ?type_:(type__ : parameter_type option) 
  ?name:(name_ : string option)  () =
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
  ?output_source_type:(output_source_type_ : string option) 
  ?output_source_id:(output_source_id_ : string option)  () =
  ({
     output_source_type = output_source_type_;
     output_source_id = output_source_id_
   } : output_source)
let make_ops_result_attribute ~type_name:(type_name_ : string)  () =
  ({ type_name = type_name_ } : ops_result_attribute)
let make_ops_metadata
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?last_modified_user:(last_modified_user_ : string option) 
  ?last_modified_date:(last_modified_date_ : CoreTypes.Timestamp.t option) 
  ?ops_metadata_arn:(ops_metadata_arn_ : string option) 
  ?resource_id:(resource_id_ : string option)  () =
  ({
     creation_date = creation_date_;
     last_modified_user = last_modified_user_;
     last_modified_date = last_modified_date_;
     ops_metadata_arn = ops_metadata_arn_;
     resource_id = resource_id_
   } : ops_metadata)
let make_ops_metadata_filter ~values:(values_ : string list) 
  ~key:(key_ : string)  () =
  ({ values = values_; key = key_ } : ops_metadata_filter)
let make_ops_item_summary
  ?planned_end_time:(planned_end_time_ : CoreTypes.Timestamp.t option) 
  ?planned_start_time:(planned_start_time_ : CoreTypes.Timestamp.t option) 
  ?actual_end_time:(actual_end_time_ : CoreTypes.Timestamp.t option) 
  ?actual_start_time:(actual_start_time_ : CoreTypes.Timestamp.t option) 
  ?ops_item_type:(ops_item_type_ : string option) 
  ?severity:(severity_ : string option) 
  ?category:(category_ : string option) 
  ?operational_data:(operational_data_ : ops_item_operational_data option) 
  ?title:(title_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option) 
  ?status:(status_ : ops_item_status option) 
  ?source:(source_ : string option)  ?priority:(priority_ : int option) 
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?last_modified_by:(last_modified_by_ : string option) 
  ?created_time:(created_time_ : CoreTypes.Timestamp.t option) 
  ?created_by:(created_by_ : string option)  () =
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
  ~values:(values_ : string list) 
  ~key:(key_ : ops_item_related_items_filter_key)  () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_related_items_filter)
let make_ops_item_identity ?arn:(arn_ : string option)  () =
  ({ arn = arn_ } : ops_item_identity)
let make_ops_item_related_item_summary
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?last_modified_by:(last_modified_by_ : ops_item_identity option) 
  ?created_time:(created_time_ : CoreTypes.Timestamp.t option) 
  ?created_by:(created_by_ : ops_item_identity option) 
  ?resource_uri:(resource_uri_ : string option) 
  ?association_type:(association_type_ : string option) 
  ?resource_type:(resource_type_ : string option) 
  ?association_id:(association_id_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option)  () =
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
  ~values:(values_ : string list)  ~key:(key_ : ops_item_filter_key)  () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_filter)
let make_ops_item_event_summary
  ?created_time:(created_time_ : CoreTypes.Timestamp.t option) 
  ?created_by:(created_by_ : ops_item_identity option) 
  ?detail:(detail_ : string option) 
  ?detail_type:(detail_type_ : string option) 
  ?source:(source_ : string option)  ?event_id:(event_id_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option)  () =
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
  ~values:(values_ : string list)  ~key:(key_ : ops_item_event_filter_key) 
  () =
  ({ operator = operator_; values = values_; key = key_ } : ops_item_event_filter)
let make_ops_item ?ops_item_arn:(ops_item_arn_ : string option) 
  ?planned_end_time:(planned_end_time_ : CoreTypes.Timestamp.t option) 
  ?planned_start_time:(planned_start_time_ : CoreTypes.Timestamp.t option) 
  ?actual_end_time:(actual_end_time_ : CoreTypes.Timestamp.t option) 
  ?actual_start_time:(actual_start_time_ : CoreTypes.Timestamp.t option) 
  ?severity:(severity_ : string option) 
  ?category:(category_ : string option) 
  ?operational_data:(operational_data_ : ops_item_operational_data option) 
  ?source:(source_ : string option)  ?title:(title_ : string option) 
  ?version:(version_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option) 
  ?status:(status_ : ops_item_status option) 
  ?related_ops_items:(related_ops_items_ : related_ops_item list option) 
  ?priority:(priority_ : int option) 
  ?notifications:(notifications_ : ops_item_notification list option) 
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?last_modified_by:(last_modified_by_ : string option) 
  ?description:(description_ : string option) 
  ?created_time:(created_time_ : CoreTypes.Timestamp.t option) 
  ?ops_item_type:(ops_item_type_ : string option) 
  ?created_by:(created_by_ : string option)  () =
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
  ~values:(values_ : string list)  ~key:(key_ : string)  () =
  ({ type_ = type__; values = values_; key = key_ } : ops_filter)
let make_ops_entity_item
  ?content:(content_ : ops_entity_item_entry list option) 
  ?capture_time:(capture_time_ : string option)  () =
  ({ content = content_; capture_time = capture_time_ } : ops_entity_item)
let make_ops_entity ?data:(data_ : ops_entity_item_map option) 
  ?id:(id_ : string option)  () = ({ data = data_; id = id_ } : ops_entity)
let make_ops_aggregator
  ?aggregators:(aggregators_ : ops_aggregator list option) 
  ?filters:(filters_ : ops_filter list option) 
  ?values:(values_ : ops_aggregator_value_map option) 
  ?attribute_name:(attribute_name_ : string option) 
  ?type_name:(type_name_ : string option) 
  ?aggregator_type:(aggregator_type_ : string option)  () =
  ({
     aggregators = aggregators_;
     filters = filters_;
     values = values_;
     attribute_name = attribute_name_;
     type_name = type_name_;
     aggregator_type = aggregator_type_
   } : ops_aggregator)
let make_modify_document_permission_response () = (() : unit)
let make_modify_document_permission_request
  ?shared_document_version:(shared_document_version_ : string option) 
  ?account_ids_to_remove:(account_ids_to_remove_ : string list option) 
  ?account_ids_to_add:(account_ids_to_add_ : string list option) 
  ~permission_type:(permission_type_ : document_permission_type) 
  ~name:(name_ : string)  () =
  ({
     shared_document_version = shared_document_version_;
     account_ids_to_remove = account_ids_to_remove_;
     account_ids_to_add = account_ids_to_add_;
     permission_type = permission_type_;
     name = name_
   } : modify_document_permission_request)
let make_maintenance_window_identity_for_target ?name:(name_ : string option)
   ?window_id:(window_id_ : string option)  () =
  ({ name = name_; window_id = window_id_ } : maintenance_window_identity_for_target)
let make_maintenance_window_task
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?cutoff_behavior:(cutoff_behavior_ :
                     maintenance_window_task_cutoff_behavior option)
   ?description:(description_ : string option)  ?name:(name_ : string option)
   ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?service_role_arn:(service_role_arn_ : string option) 
  ?logging_info:(logging_info_ : logging_info option) 
  ?priority:(priority_ : int option) 
  ?task_parameters:(task_parameters_ :
                     maintenance_window_task_parameters option)
   ?targets:(targets_ : target list option) 
  ?type_:(type__ : maintenance_window_task_type option) 
  ?task_arn:(task_arn_ : string option) 
  ?window_task_id:(window_task_id_ : string option) 
  ?window_id:(window_id_ : string option)  () =
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
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?owner_information:(owner_information_ : string option) 
  ?targets:(targets_ : target list option) 
  ?resource_type:(resource_type_ : maintenance_window_resource_type option) 
  ?window_target_id:(window_target_id_ : string option) 
  ?window_id:(window_id_ : string option)  () =
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
  ?next_execution_time:(next_execution_time_ : string option) 
  ?start_date:(start_date_ : string option) 
  ?end_date:(end_date_ : string option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?schedule_timezone:(schedule_timezone_ : string option) 
  ?schedule:(schedule_ : string option)  ?cutoff:(cutoff_ : int option) 
  ?duration:(duration_ : int option)  ?enabled:(enabled_ : bool option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?window_id:(window_id_ : string option)  () =
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
let make_maintenance_window_filter ?values:(values_ : string list option) 
  ?key:(key_ : string option)  () =
  ({ values = values_; key = key_ } : maintenance_window_filter)
let make_maintenance_window_execution_task_invocation_identity
  ?window_target_id:(window_target_id_ : string option) 
  ?owner_information:(owner_information_ : string option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : maintenance_window_execution_status option) 
  ?parameters:(parameters_ : string option) 
  ?task_type:(task_type_ : maintenance_window_task_type option) 
  ?execution_id:(execution_id_ : string option) 
  ?invocation_id:(invocation_id_ : string option) 
  ?task_execution_id:(task_execution_id_ : string option) 
  ?window_execution_id:(window_execution_id_ : string option)  () =
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
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?task_type:(task_type_ : maintenance_window_task_type option) 
  ?task_arn:(task_arn_ : string option) 
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : maintenance_window_execution_status option) 
  ?task_execution_id:(task_execution_id_ : string option) 
  ?window_execution_id:(window_execution_id_ : string option)  () =
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
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : maintenance_window_execution_status option) 
  ?window_execution_id:(window_execution_id_ : string option) 
  ?window_id:(window_id_ : string option)  () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     status_details = status_details_;
     status = status_;
     window_execution_id = window_execution_id_;
     window_id = window_id_
   } : maintenance_window_execution)
let make_list_tags_for_resource_request ~resource_id:(resource_id_ : string) 
  ~resource_type:(resource_type_ : resource_type_for_tagging)  () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : list_tags_for_resource_request)
let make_list_resource_data_sync_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?sync_type:(sync_type_ : string option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sync_type = sync_type_
   } : list_resource_data_sync_request)
let make_compliance_string_filter
  ?type_:(type__ : compliance_query_operator_type option) 
  ?values:(values_ : string list option)  ?key:(key_ : string option)  () =
  ({ type_ = type__; values = values_; key = key_ } : compliance_string_filter)
let make_list_resource_compliance_summaries_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : compliance_string_filter list option)  () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_
   } : list_resource_compliance_summaries_request)
let make_list_ops_metadata_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : ops_metadata_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : list_ops_metadata_request)
let make_list_ops_item_related_items_response
  ?summaries:(summaries_ : ops_item_related_item_summary list option) 
  ?next_token:(next_token_ : string option)  () =
  ({ summaries = summaries_; next_token = next_token_ } : list_ops_item_related_items_response)
let make_list_ops_item_related_items_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : ops_item_related_items_filter list option) 
  ?ops_item_id:(ops_item_id_ : string option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     ops_item_id = ops_item_id_
   } : list_ops_item_related_items_request)
let make_list_ops_item_events_response
  ?summaries:(summaries_ : ops_item_event_summary list option) 
  ?next_token:(next_token_ : string option)  () =
  ({ summaries = summaries_; next_token = next_token_ } : list_ops_item_events_response)
let make_list_ops_item_events_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : ops_item_event_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : list_ops_item_events_request)
let make_inventory_filter
  ?type_:(type__ : inventory_query_operator_type option) 
  ~values:(values_ : string list)  ~key:(key_ : string)  () =
  ({ type_ = type__; values = values_; key = key_ } : inventory_filter)
let make_list_inventory_entries_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : inventory_filter list option) 
  ~type_name:(type_name_ : string)  ~instance_id:(instance_id_ : string)  ()
  =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     type_name = type_name_;
     instance_id = instance_id_
   } : list_inventory_entries_request)
let make_document_identifier ?author:(author_ : string option) 
  ?review_status:(review_status_ : review_status option) 
  ?requires:(requires_ : document_requires list option) 
  ?tags:(tags_ : tag list option) 
  ?target_type:(target_type_ : string option) 
  ?document_format:(document_format_ : document_format option) 
  ?schema_version:(schema_version_ : string option) 
  ?document_type:(document_type_ : document_type option) 
  ?document_version:(document_version_ : string option) 
  ?platform_types:(platform_types_ : platform_type list option) 
  ?version_name:(version_name_ : string option) 
  ?owner:(owner_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?created_date:(created_date_ : CoreTypes.Timestamp.t option) 
  ?name:(name_ : string option)  () =
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
let make_document_filter ~value:(value_ : string) 
  ~key:(key_ : document_filter_key)  () =
  ({ value = value_; key = key_ } : document_filter)
let make_document_key_values_filter ?values:(values_ : string list option) 
  ?key:(key_ : string option)  () =
  ({ values = values_; key = key_ } : document_key_values_filter)
let make_list_documents_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : document_key_values_filter list option) 
  ?document_filter_list:(document_filter_list_ : document_filter list option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     document_filter_list = document_filter_list_
   } : list_documents_request)
let make_document_version_info
  ?review_status:(review_status_ : review_status option) 
  ?status_information:(status_information_ : string option) 
  ?status:(status_ : document_status option) 
  ?document_format:(document_format_ : document_format option) 
  ?is_default_version:(is_default_version_ : bool option) 
  ?created_date:(created_date_ : CoreTypes.Timestamp.t option) 
  ?version_name:(version_name_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?name:(name_ : string option)  () =
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
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  ~name:(name_ : string)  () =
  ({ next_token = next_token_; max_results = max_results_; name = name_ } : 
  list_document_versions_request)
let make_document_reviewer_response_source
  ?reviewer:(reviewer_ : string option) 
  ?comment:(comment_ : document_review_comment_source list option) 
  ?review_status:(review_status_ : review_status option) 
  ?updated_time:(updated_time_ : CoreTypes.Timestamp.t option) 
  ?create_time:(create_time_ : CoreTypes.Timestamp.t option)  () =
  ({
     reviewer = reviewer_;
     comment = comment_;
     review_status = review_status_;
     updated_time = updated_time_;
     create_time = create_time_
   } : document_reviewer_response_source)
let make_document_metadata_response_info
  ?reviewer_response:(reviewer_response_ :
                       document_reviewer_response_source list option)
   () =
  ({ reviewer_response = reviewer_response_ } : document_metadata_response_info)
let make_list_document_metadata_history_response
  ?next_token:(next_token_ : string option) 
  ?metadata:(metadata_ : document_metadata_response_info option) 
  ?author:(author_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     next_token = next_token_;
     metadata = metadata_;
     author = author_;
     document_version = document_version_;
     name = name_
   } : list_document_metadata_history_response)
let make_list_document_metadata_history_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?document_version:(document_version_ : string option) 
  ~metadata:(metadata_ : document_metadata_enum)  ~name:(name_ : string)  ()
  =
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
  ?compliance_type:(compliance_type_ : string option)  () =
  ({
     non_compliant_summary = non_compliant_summary_;
     compliant_summary = compliant_summary_;
     compliance_type = compliance_type_
   } : compliance_summary_item)
let make_list_compliance_summaries_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : compliance_string_filter list option)  () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_
   } : list_compliance_summaries_request)
let make_compliance_item ?details:(details_ : compliance_item_details option)
   ?execution_summary:(execution_summary_ :
                        compliance_execution_summary option)
   ?severity:(severity_ : compliance_severity option) 
  ?status:(status_ : compliance_status option) 
  ?title:(title_ : string option)  ?id:(id_ : string option) 
  ?resource_id:(resource_id_ : string option) 
  ?resource_type:(resource_type_ : string option) 
  ?compliance_type:(compliance_type_ : string option)  () =
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
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?resource_types:(resource_types_ : string list option) 
  ?resource_ids:(resource_ids_ : string list option) 
  ?filters:(filters_ : compliance_string_filter list option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_types = resource_types_;
     resource_ids = resource_ids_;
     filters = filters_
   } : list_compliance_items_request)
let make_command_filter ~value:(value_ : string) 
  ~key:(key_ : command_filter_key)  () =
  ({ value = value_; key = key_ } : command_filter)
let make_list_commands_request
  ?filters:(filters_ : command_filter list option) 
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?instance_id:(instance_id_ : string option) 
  ?command_id:(command_id_ : string option)  () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_;
     command_id = command_id_
   } : list_commands_request)
let make_command_plugin
  ?output_s3_key_prefix:(output_s3_key_prefix_ : string option) 
  ?output_s3_bucket_name:(output_s3_bucket_name_ : string option) 
  ?output_s3_region:(output_s3_region_ : string option) 
  ?standard_error_url:(standard_error_url_ : string option) 
  ?standard_output_url:(standard_output_url_ : string option) 
  ?output:(output_ : string option) 
  ?response_finish_date_time:(response_finish_date_time_ :
                               CoreTypes.Timestamp.t option)
   ?response_start_date_time:(response_start_date_time_ :
                               CoreTypes.Timestamp.t option)
   ?response_code:(response_code_ : int option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : command_plugin_status option) 
  ?name:(name_ : string option)  () =
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
  ?service_role:(service_role_ : string option) 
  ?command_plugins:(command_plugins_ : command_plugin list option) 
  ?standard_error_url:(standard_error_url_ : string option) 
  ?standard_output_url:(standard_output_url_ : string option) 
  ?trace_output:(trace_output_ : string option) 
  ?status_details:(status_details_ : string option) 
  ?status:(status_ : command_invocation_status option) 
  ?requested_date_time:(requested_date_time_ : CoreTypes.Timestamp.t option) 
  ?document_version:(document_version_ : string option) 
  ?document_name:(document_name_ : string option) 
  ?comment:(comment_ : string option) 
  ?instance_name:(instance_name_ : string option) 
  ?instance_id:(instance_id_ : string option) 
  ?command_id:(command_id_ : string option)  () =
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
let make_list_command_invocations_request ?details:(details_ : bool option) 
  ?filters:(filters_ : command_filter list option) 
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?instance_id:(instance_id_ : string option) 
  ?command_id:(command_id_ : string option)  () =
  ({
     details = details_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_;
     command_id = command_id_
   } : list_command_invocations_request)
let make_association ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?association_name:(association_name_ : string option) 
  ?schedule_expression:(schedule_expression_ : string option) 
  ?overview:(overview_ : association_overview option) 
  ?last_execution_date:(last_execution_date_ : CoreTypes.Timestamp.t option) 
  ?targets:(targets_ : target list option) 
  ?document_version:(document_version_ : string option) 
  ?association_version:(association_version_ : string option) 
  ?association_id:(association_id_ : string option) 
  ?instance_id:(instance_id_ : string option)  ?name:(name_ : string option) 
  () =
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
let make_association_filter ~value:(value_ : string) 
  ~key:(key_ : association_filter_key)  () =
  ({ value = value_; key = key_ } : association_filter)
let make_list_associations_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?association_filter_list:(association_filter_list_ :
                             association_filter list option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     association_filter_list = association_filter_list_
   } : list_associations_request)
let make_association_version_info
  ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?calendar_names:(calendar_names_ : string list option) 
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : bool option) 
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option) 
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
   ?max_concurrency:(max_concurrency_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?association_name:(association_name_ : string option) 
  ?output_location:(output_location_ :
                     instance_association_output_location option)
   ?schedule_expression:(schedule_expression_ : string option) 
  ?targets:(targets_ : target list option) 
  ?parameters:(parameters_ : parameters option) 
  ?document_version:(document_version_ : string option) 
  ?name:(name_ : string option) 
  ?created_date:(created_date_ : CoreTypes.Timestamp.t option) 
  ?association_version:(association_version_ : string option) 
  ?association_id:(association_id_ : string option)  () =
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
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~association_id:(association_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     association_id = association_id_
   } : list_association_versions_request)
let make_label_parameter_version_request
  ?parameter_version:(parameter_version_ : int option) 
  ~labels:(labels_ : string list)  ~name:(name_ : string)  () =
  ({ labels = labels_; parameter_version = parameter_version_; name = name_ } : 
  label_parameter_version_request)
let make_inventory_result_item ?content_hash:(content_hash_ : string option) 
  ?capture_time:(capture_time_ : string option) 
  ~content:(content_ : inventory_item_entry list) 
  ~schema_version:(schema_version_ : string) 
  ~type_name:(type_name_ : string)  () =
  ({
     content = content_;
     content_hash = content_hash_;
     capture_time = capture_time_;
     schema_version = schema_version_;
     type_name = type_name_
   } : inventory_result_item)
let make_inventory_result_entity
  ?data:(data_ : inventory_result_item_map option)  ?id:(id_ : string option)
   () = ({ data = data_; id = id_ } : inventory_result_entity)
let make_inventory_item_attribute
  ~data_type:(data_type_ : inventory_attribute_data_type) 
  ~name:(name_ : string)  () =
  ({ data_type = data_type_; name = name_ } : inventory_item_attribute)
let make_inventory_item_schema ?display_name:(display_name_ : string option) 
  ?version:(version_ : string option) 
  ~attributes:(attributes_ : inventory_item_attribute list) 
  ~type_name:(type_name_ : string)  () =
  ({
     display_name = display_name_;
     attributes = attributes_;
     version = version_;
     type_name = type_name_
   } : inventory_item_schema)
let make_inventory_group ~filters:(filters_ : inventory_filter list) 
  ~name:(name_ : string)  () =
  ({ filters = filters_; name = name_ } : inventory_group)
let make_inventory_deletion_summary_item
  ?remaining_count:(remaining_count_ : int option) 
  ?count:(count_ : int option)  ?version:(version_ : string option)  () =
  ({ remaining_count = remaining_count_; count = count_; version = version_ } : 
  inventory_deletion_summary_item)
let make_inventory_deletion_summary
  ?summary_items:(summary_items_ :
                   inventory_deletion_summary_item list option)
   ?remaining_count:(remaining_count_ : int option) 
  ?total_count:(total_count_ : int option)  () =
  ({
     summary_items = summary_items_;
     remaining_count = remaining_count_;
     total_count = total_count_
   } : inventory_deletion_summary)
let make_inventory_deletion_status_item
  ?last_status_update_time:(last_status_update_time_ :
                             CoreTypes.Timestamp.t option)
   ?deletion_summary:(deletion_summary_ : inventory_deletion_summary option) 
  ?last_status_message:(last_status_message_ : string option) 
  ?last_status:(last_status_ : inventory_deletion_status option) 
  ?deletion_start_time:(deletion_start_time_ : CoreTypes.Timestamp.t option) 
  ?type_name:(type_name_ : string option) 
  ?deletion_id:(deletion_id_ : string option)  () =
  ({
     last_status_update_time = last_status_update_time_;
     deletion_summary = deletion_summary_;
     last_status_message = last_status_message_;
     last_status = last_status_;
     deletion_start_time = deletion_start_time_;
     type_name = type_name_;
     deletion_id = deletion_id_
   } : inventory_deletion_status_item)
let make_inventory_aggregator ?groups:(groups_ : inventory_group list option)
   ?aggregators:(aggregators_ : inventory_aggregator list option) 
  ?expression:(expression_ : string option)  () =
  ({ groups = groups_; aggregators = aggregators_; expression = expression_ } : 
  inventory_aggregator)
let make_instance_property_string_filter
  ?operator:(operator_ : instance_property_filter_operator option) 
  ~values:(values_ : string list)  ~key:(key_ : string)  () =
  ({ operator = operator_; values = values_; key = key_ } : instance_property_string_filter)
let make_instance_property_filter ~value_set:(value_set_ : string list) 
  ~key:(key_ : instance_property_filter_key)  () =
  ({ value_set = value_set_; key = key_ } : instance_property_filter)
let make_instance_aggregated_association_overview
  ?instance_association_status_aggregated_count:(instance_association_status_aggregated_count_
                                                  :
                                                  instance_association_status_aggregated_count
                                                    option)
   ?detailed_status:(detailed_status_ : string option)  () =
  ({
     instance_association_status_aggregated_count =
       instance_association_status_aggregated_count_;
     detailed_status = detailed_status_
   } : instance_aggregated_association_overview)
let make_instance_property ?source_type:(source_type_ : source_type option) 
  ?source_id:(source_id_ : string option) 
  ?association_overview:(association_overview_ :
                          instance_aggregated_association_overview option)
   ?last_successful_association_execution_date:(last_successful_association_execution_date_
                                                 :
                                                 CoreTypes.Timestamp.t option)
   ?last_association_execution_date:(last_association_execution_date_ :
                                      CoreTypes.Timestamp.t option)
   ?association_status:(association_status_ : string option) 
  ?computer_name:(computer_name_ : string option) 
  ?resource_type:(resource_type_ : string option) 
  ?registration_date:(registration_date_ : CoreTypes.Timestamp.t option) 
  ?iam_role:(iam_role_ : string option) 
  ?activation_id:(activation_id_ : string option) 
  ?platform_version:(platform_version_ : string option) 
  ?platform_name:(platform_name_ : string option) 
  ?platform_type:(platform_type_ : platform_type option) 
  ?agent_version:(agent_version_ : string option) 
  ?last_ping_date_time:(last_ping_date_time_ : CoreTypes.Timestamp.t option) 
  ?ping_status:(ping_status_ : ping_status option) 
  ?launch_time:(launch_time_ : CoreTypes.Timestamp.t option) 
  ?ip_address:(ip_address_ : string option) 
  ?architecture:(architecture_ : string option) 
  ?instance_state:(instance_state_ : string option) 
  ?key_name:(key_name_ : string option) 
  ?instance_role:(instance_role_ : string option) 
  ?instance_type:(instance_type_ : string option) 
  ?instance_id:(instance_id_ : string option)  ?name:(name_ : string option) 
  () =
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
  ?other_non_compliant_count:(other_non_compliant_count_ : int option) 
  ?security_non_compliant_count:(security_non_compliant_count_ : int option) 
  ?critical_non_compliant_count:(critical_non_compliant_count_ : int option) 
  ?reboot_option:(reboot_option_ : reboot_option option) 
  ?last_no_reboot_install_operation_time:(last_no_reboot_install_operation_time_
                                           : CoreTypes.Timestamp.t option)
   ?not_applicable_count:(not_applicable_count_ : int option) 
  ?unreported_not_applicable_count:(unreported_not_applicable_count_ :
                                     int option)
   ?failed_count:(failed_count_ : int option) 
  ?missing_count:(missing_count_ : int option) 
  ?installed_rejected_count:(installed_rejected_count_ : int option) 
  ?installed_pending_reboot_count:(installed_pending_reboot_count_ :
                                    int option)
   ?installed_other_count:(installed_other_count_ : int option) 
  ?installed_count:(installed_count_ : int option) 
  ?owner_information:(owner_information_ : string option) 
  ?install_override_list:(install_override_list_ : string option) 
  ?snapshot_id:(snapshot_id_ : string option) 
  ~operation:(operation_ : patch_operation_type) 
  ~operation_end_time:(operation_end_time_ : CoreTypes.Timestamp.t) 
  ~operation_start_time:(operation_start_time_ : CoreTypes.Timestamp.t) 
  ~baseline_id:(baseline_id_ : string)  ~patch_group:(patch_group_ : string) 
  ~instance_id:(instance_id_ : string)  () =
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
  ~values:(values_ : string list)  ~key:(key_ : string)  () =
  ({ type_ = type__; values = values_; key = key_ } : instance_patch_state_filter)
let make_instance_information_string_filter ~values:(values_ : string list) 
  ~key:(key_ : string)  () =
  ({ values = values_; key = key_ } : instance_information_string_filter)
let make_instance_information
  ?source_type:(source_type_ : source_type option) 
  ?source_id:(source_id_ : string option) 
  ?association_overview:(association_overview_ :
                          instance_aggregated_association_overview option)
   ?last_successful_association_execution_date:(last_successful_association_execution_date_
                                                 :
                                                 CoreTypes.Timestamp.t option)
   ?last_association_execution_date:(last_association_execution_date_ :
                                      CoreTypes.Timestamp.t option)
   ?association_status:(association_status_ : string option) 
  ?computer_name:(computer_name_ : string option) 
  ?ip_address:(ip_address_ : string option)  ?name:(name_ : string option) 
  ?resource_type:(resource_type_ : resource_type option) 
  ?registration_date:(registration_date_ : CoreTypes.Timestamp.t option) 
  ?iam_role:(iam_role_ : string option) 
  ?activation_id:(activation_id_ : string option) 
  ?platform_version:(platform_version_ : string option) 
  ?platform_name:(platform_name_ : string option) 
  ?platform_type:(platform_type_ : platform_type option) 
  ?is_latest_version:(is_latest_version_ : bool option) 
  ?agent_version:(agent_version_ : string option) 
  ?last_ping_date_time:(last_ping_date_time_ : CoreTypes.Timestamp.t option) 
  ?ping_status:(ping_status_ : ping_status option) 
  ?instance_id:(instance_id_ : string option)  () =
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
let make_instance_information_filter ~value_set:(value_set_ : string list) 
  ~key:(key_ : instance_information_filter_key)  () =
  ({ value_set = value_set_; key = key_ } : instance_information_filter)
let make_instance_association_output_url
  ?s3_output_url:(s3_output_url_ : s3_output_url option)  () =
  ({ s3_output_url = s3_output_url_ } : instance_association_output_url)
let make_instance_association_status_info
  ?association_name:(association_name_ : string option) 
  ?output_url:(output_url_ : instance_association_output_url option) 
  ?error_code:(error_code_ : string option) 
  ?execution_summary:(execution_summary_ : string option) 
  ?detailed_status:(detailed_status_ : string option) 
  ?status:(status_ : string option) 
  ?execution_date:(execution_date_ : CoreTypes.Timestamp.t option) 
  ?instance_id:(instance_id_ : string option) 
  ?association_version:(association_version_ : string option) 
  ?document_version:(document_version_ : string option) 
  ?name:(name_ : string option) 
  ?association_id:(association_id_ : string option)  () =
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
  ?association_version:(association_version_ : string option) 
  ?content:(content_ : string option) 
  ?instance_id:(instance_id_ : string option) 
  ?association_id:(association_id_ : string option)  () =
  ({
     association_version = association_version_;
     content = content_;
     instance_id = instance_id_;
     association_id = association_id_
   } : instance_association)
let make_get_service_setting_request ~setting_id:(setting_id_ : string)  () =
  ({ setting_id = setting_id_ } : get_service_setting_request)
let make_get_resource_policies_response_entry
  ?policy:(policy_ : string option) 
  ?policy_hash:(policy_hash_ : string option) 
  ?policy_id:(policy_id_ : string option)  () =
  ({ policy = policy_; policy_hash = policy_hash_; policy_id = policy_id_ } : 
  get_resource_policies_response_entry)
let make_get_resource_policies_response
  ?policies:(policies_ : get_resource_policies_response_entry list option) 
  ?next_token:(next_token_ : string option)  () =
  ({ policies = policies_; next_token = next_token_ } : get_resource_policies_response)
let make_get_resource_policies_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_arn = resource_arn_
   } : get_resource_policies_request)
let make_get_patch_baseline_request ~baseline_id:(baseline_id_ : string)  ()
  = ({ baseline_id = baseline_id_ } : get_patch_baseline_request)
let make_get_patch_baseline_for_patch_group_request
  ?operating_system:(operating_system_ : operating_system option) 
  ~patch_group:(patch_group_ : string)  () =
  ({ operating_system = operating_system_; patch_group = patch_group_ } : 
  get_patch_baseline_for_patch_group_request)
let make_get_parameters_request
  ?with_decryption:(with_decryption_ : bool option) 
  ~names:(names_ : string list)  () =
  ({ with_decryption = with_decryption_; names = names_ } : get_parameters_request)
let make_get_parameters_by_path_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?with_decryption:(with_decryption_ : bool option) 
  ?parameter_filters:(parameter_filters_ :
                       parameter_string_filter list option)
   ?recursive:(recursive_ : bool option)  ~path:(path_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     with_decryption = with_decryption_;
     parameter_filters = parameter_filters_;
     recursive = recursive_;
     path = path_
   } : get_parameters_by_path_request)
let make_get_parameter_request
  ?with_decryption:(with_decryption_ : bool option)  ~name:(name_ : string) 
  () =
  ({ with_decryption = with_decryption_; name = name_ } : get_parameter_request)
let make_get_parameter_history_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?with_decryption:(with_decryption_ : bool option)  ~name:(name_ : string) 
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     with_decryption = with_decryption_;
     name = name_
   } : get_parameter_history_request)
let make_get_ops_summary_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?result_attributes:(result_attributes_ : ops_result_attribute list option) 
  ?aggregators:(aggregators_ : ops_aggregator list option) 
  ?filters:(filters_ : ops_filter list option) 
  ?sync_name:(sync_name_ : string option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     result_attributes = result_attributes_;
     aggregators = aggregators_;
     filters = filters_;
     sync_name = sync_name_
   } : get_ops_summary_request)
let make_get_ops_metadata_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~ops_metadata_arn:(ops_metadata_arn_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     ops_metadata_arn = ops_metadata_arn_
   } : get_ops_metadata_request)
let make_get_ops_item_response ?ops_item:(ops_item_ : ops_item option)  () =
  ({ ops_item = ops_item_ } : get_ops_item_response)
let make_get_ops_item_request ?ops_item_arn:(ops_item_arn_ : string option) 
  ~ops_item_id:(ops_item_id_ : string)  () =
  ({ ops_item_arn = ops_item_arn_; ops_item_id = ops_item_id_ } : get_ops_item_request)
let make_get_maintenance_window_task_request
  ~window_task_id:(window_task_id_ : string) 
  ~window_id:(window_id_ : string)  () =
  ({ window_task_id = window_task_id_; window_id = window_id_ } : get_maintenance_window_task_request)
let make_get_maintenance_window_request ~window_id:(window_id_ : string)  ()
  = ({ window_id = window_id_ } : get_maintenance_window_request)
let make_get_maintenance_window_execution_task_request
  ~task_id:(task_id_ : string) 
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({ task_id = task_id_; window_execution_id = window_execution_id_ } : 
  get_maintenance_window_execution_task_request)
let make_get_maintenance_window_execution_task_invocation_request
  ~invocation_id:(invocation_id_ : string)  ~task_id:(task_id_ : string) 
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({
     invocation_id = invocation_id_;
     task_id = task_id_;
     window_execution_id = window_execution_id_
   } : get_maintenance_window_execution_task_invocation_request)
let make_get_maintenance_window_execution_request
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({ window_execution_id = window_execution_id_ } : get_maintenance_window_execution_request)
let make_get_inventory_schema_request ?sub_type:(sub_type_ : bool option) 
  ?aggregator:(aggregator_ : bool option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?type_name:(type_name_ : string option)  () =
  ({
     sub_type = sub_type_;
     aggregator = aggregator_;
     max_results = max_results_;
     next_token = next_token_;
     type_name = type_name_
   } : get_inventory_schema_request)
let make_get_inventory_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?result_attributes:(result_attributes_ : result_attribute list option) 
  ?aggregators:(aggregators_ : inventory_aggregator list option) 
  ?filters:(filters_ : inventory_filter list option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     result_attributes = result_attributes_;
     aggregators = aggregators_;
     filters = filters_
   } : get_inventory_request)
let make_attachment_content ?url:(url_ : string option) 
  ?hash_type:(hash_type_ : attachment_hash_type option) 
  ?hash:(hash_ : string option)  ?size:(size_ : int option) 
  ?name:(name_ : string option)  () =
  ({
     url = url_;
     hash_type = hash_type_;
     hash = hash_;
     size = size_;
     name = name_
   } : attachment_content)
let make_get_document_request
  ?document_format:(document_format_ : document_format option) 
  ?document_version:(document_version_ : string option) 
  ?version_name:(version_name_ : string option)  ~name:(name_ : string)  () =
  ({
     document_format = document_format_;
     document_version = document_version_;
     version_name = version_name_;
     name = name_
   } : get_document_request)
let make_baseline_override ?sources:(sources_ : patch_source list option) 
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : bool option)
   ?rejected_patches_action:(rejected_patches_action_ : patch_action option) 
  ?rejected_patches:(rejected_patches_ : string list option) 
  ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                       patch_compliance_level option)
   ?approved_patches:(approved_patches_ : string list option) 
  ?approval_rules:(approval_rules_ : patch_rule_group option) 
  ?global_filters:(global_filters_ : patch_filter_group option) 
  ?operating_system:(operating_system_ : operating_system option)  () =
  ({
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
  ~snapshot_id:(snapshot_id_ : string)  ~instance_id:(instance_id_ : string) 
  () =
  ({
     baseline_override = baseline_override_;
     snapshot_id = snapshot_id_;
     instance_id = instance_id_
   } : get_deployable_patch_snapshot_for_instance_request)
let make_get_default_patch_baseline_request
  ?operating_system:(operating_system_ : operating_system option)  () =
  ({ operating_system = operating_system_ } : get_default_patch_baseline_request)
let make_get_connection_status_response
  ?status:(status_ : connection_status option) 
  ?target:(target_ : string option)  () =
  ({ status = status_; target = target_ } : get_connection_status_response)
let make_get_connection_status_request ~target:(target_ : string)  () =
  ({ target = target_ } : get_connection_status_request)
let make_get_command_invocation_request
  ?plugin_name:(plugin_name_ : string option) 
  ~instance_id:(instance_id_ : string)  ~command_id:(command_id_ : string) 
  () =
  ({
     plugin_name = plugin_name_;
     instance_id = instance_id_;
     command_id = command_id_
   } : get_command_invocation_request)
let make_get_calendar_state_response
  ?next_transition_time:(next_transition_time_ : string option) 
  ?at_time:(at_time_ : string option) 
  ?state:(state_ : calendar_state option)  () =
  ({
     next_transition_time = next_transition_time_;
     at_time = at_time_;
     state = state_
   } : get_calendar_state_response)
let make_get_calendar_state_request ?at_time:(at_time_ : string option) 
  ~calendar_names:(calendar_names_ : string list)  () =
  ({ at_time = at_time_; calendar_names = calendar_names_ } : get_calendar_state_request)
let make_automation_execution
  ?variables:(variables_ : automation_parameter_map option) 
  ?change_request_name:(change_request_name_ : string option) 
  ?association_id:(association_id_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option) 
  ?runbooks:(runbooks_ : runbook list option) 
  ?scheduled_time:(scheduled_time_ : CoreTypes.Timestamp.t option) 
  ?automation_subtype:(automation_subtype_ : automation_subtype option) 
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?progress_counters:(progress_counters_ : progress_counters option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?target:(target_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?resolved_targets:(resolved_targets_ : resolved_targets option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?targets:(targets_ : target list option) 
  ?target_parameter_name:(target_parameter_name_ : string option) 
  ?current_action:(current_action_ : string option) 
  ?current_step_name:(current_step_name_ : string option) 
  ?executed_by:(executed_by_ : string option) 
  ?parent_automation_execution_id:(parent_automation_execution_id_ :
                                    string option)
   ?mode:(mode_ : execution_mode option) 
  ?failure_message:(failure_message_ : string option) 
  ?outputs:(outputs_ : automation_parameter_map option) 
  ?parameters:(parameters_ : automation_parameter_map option) 
  ?step_executions_truncated:(step_executions_truncated_ : bool option) 
  ?step_executions:(step_executions_ : step_execution list option) 
  ?automation_execution_status:(automation_execution_status_ :
                                 automation_execution_status option)
   ?execution_end_time:(execution_end_time_ : CoreTypes.Timestamp.t option) 
  ?execution_start_time:(execution_start_time_ :
                          CoreTypes.Timestamp.t option)
   ?document_version:(document_version_ : string option) 
  ?document_name:(document_name_ : string option) 
  ?automation_execution_id:(automation_execution_id_ : string option)  () =
  ({
     variables = variables_;
     change_request_name = change_request_name_;
     association_id = association_id_;
     ops_item_id = ops_item_id_;
     runbooks = runbooks_;
     scheduled_time = scheduled_time_;
     automation_subtype = automation_subtype_;
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
  ~automation_execution_id:(automation_execution_id_ : string)  () =
  ({ automation_execution_id = automation_execution_id_ } : get_automation_execution_request)
let make_create_association_batch_request_entry
  ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?calendar_names:(calendar_names_ : string list option) 
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : bool option) 
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option) 
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
   ?max_concurrency:(max_concurrency_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?association_name:(association_name_ : string option) 
  ?output_location:(output_location_ :
                     instance_association_output_location option)
   ?schedule_expression:(schedule_expression_ : string option) 
  ?targets:(targets_ : target list option) 
  ?document_version:(document_version_ : string option) 
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      string option)
   ?parameters:(parameters_ : parameters option) 
  ?instance_id:(instance_id_ : string option)  ~name:(name_ : string)  () =
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
  ?message:(message_ : string option) 
  ?entry:(entry_ : create_association_batch_request_entry option)  () =
  ({ fault = fault_; message = message_; entry = entry_ } : failed_create_association)
let make_effective_patch ?patch_status:(patch_status_ : patch_status option) 
  ?patch:(patch_ : patch option)  () =
  ({ patch_status = patch_status_; patch = patch_ } : effective_patch)
let make_disassociate_ops_item_related_item_response () = (() : unit)
let make_disassociate_ops_item_related_item_request
  ~association_id:(association_id_ : string) 
  ~ops_item_id:(ops_item_id_ : string)  () =
  ({ association_id = association_id_; ops_item_id = ops_item_id_ } : 
  disassociate_ops_item_related_item_request)
let make_describe_sessions_response ?next_token:(next_token_ : string option)
   ?sessions:(sessions_ : session list option)  () =
  ({ next_token = next_token_; sessions = sessions_ } : describe_sessions_response)
let make_describe_sessions_request
  ?filters:(filters_ : session_filter list option) 
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  ~state:(state_ : session_state) 
  () =
  ({
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     state = state_
   } : describe_sessions_request)
let make_describe_patch_properties_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?patch_set:(patch_set_ : patch_set option) 
  ~property:(property_ : patch_property) 
  ~operating_system:(operating_system_ : operating_system)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     patch_set = patch_set_;
     property = property_;
     operating_system = operating_system_
   } : describe_patch_properties_request)
let make_describe_patch_groups_request
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : patch_orchestrator_filter list option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; filters = filters_; max_results = max_results_
   } : describe_patch_groups_request)
let make_describe_patch_group_state_request
  ~patch_group:(patch_group_ : string)  () =
  ({ patch_group = patch_group_ } : describe_patch_group_state_request)
let make_describe_patch_baselines_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : patch_orchestrator_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_patch_baselines_request)
let make_describe_parameters_request ?shared:(shared_ : bool option) 
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?parameter_filters:(parameter_filters_ :
                       parameter_string_filter list option)
   ?filters:(filters_ : parameters_filter list option)  () =
  ({
     shared = shared_;
     next_token = next_token_;
     max_results = max_results_;
     parameter_filters = parameter_filters_;
     filters = filters_
   } : describe_parameters_request)
let make_describe_ops_items_response
  ?ops_item_summaries:(ops_item_summaries_ : ops_item_summary list option) 
  ?next_token:(next_token_ : string option)  () =
  ({ ops_item_summaries = ops_item_summaries_; next_token = next_token_ } : 
  describe_ops_items_response)
let make_describe_ops_items_request ?next_token:(next_token_ : string option)
   ?max_results:(max_results_ : int option) 
  ?ops_item_filters:(ops_item_filters_ : ops_item_filter list option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     ops_item_filters = ops_item_filters_
   } : describe_ops_items_request)
let make_describe_maintenance_windows_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_maintenance_windows_request)
let make_describe_maintenance_windows_for_target_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~resource_type:(resource_type_ : maintenance_window_resource_type) 
  ~targets:(targets_ : target list)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     resource_type = resource_type_;
     targets = targets_
   } : describe_maintenance_windows_for_target_request)
let make_describe_maintenance_window_tasks_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option) 
  ~window_id:(window_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_tasks_request)
let make_describe_maintenance_window_targets_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option) 
  ~window_id:(window_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_targets_request)
let make_describe_maintenance_window_schedule_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : patch_orchestrator_filter list option) 
  ?resource_type:(resource_type_ : maintenance_window_resource_type option) 
  ?targets:(targets_ : target list option) 
  ?window_id:(window_id_ : string option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     resource_type = resource_type_;
     targets = targets_;
     window_id = window_id_
   } : describe_maintenance_window_schedule_request)
let make_describe_maintenance_window_executions_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option) 
  ~window_id:(window_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_id = window_id_
   } : describe_maintenance_window_executions_request)
let make_describe_maintenance_window_execution_tasks_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option) 
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     window_execution_id = window_execution_id_
   } : describe_maintenance_window_execution_tasks_request)
let make_describe_maintenance_window_execution_task_invocations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : maintenance_window_filter list option) 
  ~task_id:(task_id_ : string) 
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     task_id = task_id_;
     window_execution_id = window_execution_id_
   } : describe_maintenance_window_execution_task_invocations_request)
let make_describe_inventory_deletions_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?deletion_id:(deletion_id_ : string option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     deletion_id = deletion_id_
   } : describe_inventory_deletions_request)
let make_describe_instance_properties_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters_with_operator:(filters_with_operator_ :
                           instance_property_string_filter list option)
   ?instance_property_filter_list:(instance_property_filter_list_ :
                                    instance_property_filter list option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters_with_operator = filters_with_operator_;
     instance_property_filter_list = instance_property_filter_list_
   } : describe_instance_properties_request)
let make_describe_instance_patches_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : patch_orchestrator_filter list option) 
  ~instance_id:(instance_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     instance_id = instance_id_
   } : describe_instance_patches_request)
let make_describe_instance_patch_states_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~instance_ids:(instance_ids_ : string list)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     instance_ids = instance_ids_
   } : describe_instance_patch_states_request)
let make_describe_instance_patch_states_for_patch_group_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : instance_patch_state_filter list option) 
  ~patch_group:(patch_group_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     patch_group = patch_group_
   } : describe_instance_patch_states_for_patch_group_request)
let make_describe_instance_information_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : instance_information_string_filter list option) 
  ?instance_information_filter_list:(instance_information_filter_list_ :
                                      instance_information_filter list option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     instance_information_filter_list = instance_information_filter_list_
   } : describe_instance_information_request)
let make_describe_instance_associations_status_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~instance_id:(instance_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_
   } : describe_instance_associations_status_request)
let make_describe_effective_patches_for_patch_baseline_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~baseline_id:(baseline_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     baseline_id = baseline_id_
   } : describe_effective_patches_for_patch_baseline_request)
let make_describe_effective_instance_associations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~instance_id:(instance_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     instance_id = instance_id_
   } : describe_effective_instance_associations_request)
let make_describe_document_request
  ?version_name:(version_name_ : string option) 
  ?document_version:(document_version_ : string option) 
  ~name:(name_ : string)  () =
  ({
     version_name = version_name_;
     document_version = document_version_;
     name = name_
   } : describe_document_request)
let make_account_sharing_info
  ?shared_document_version:(shared_document_version_ : string option) 
  ?account_id:(account_id_ : string option)  () =
  ({
     shared_document_version = shared_document_version_;
     account_id = account_id_
   } : account_sharing_info)
let make_describe_document_permission_response
  ?next_token:(next_token_ : string option) 
  ?account_sharing_info_list:(account_sharing_info_list_ :
                               account_sharing_info list option)
   ?account_ids:(account_ids_ : string list option)  () =
  ({
     next_token = next_token_;
     account_sharing_info_list = account_sharing_info_list_;
     account_ids = account_ids_
   } : describe_document_permission_response)
let make_describe_document_permission_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~permission_type:(permission_type_ : document_permission_type) 
  ~name:(name_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     permission_type = permission_type_;
     name = name_
   } : describe_document_permission_request)
let make_describe_available_patches_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : patch_orchestrator_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_available_patches_request)
let make_describe_automation_step_executions_request
  ?reverse_order:(reverse_order_ : bool option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : step_execution_filter list option) 
  ~automation_execution_id:(automation_execution_id_ : string)  () =
  ({
     reverse_order = reverse_order_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     automation_execution_id = automation_execution_id_
   } : describe_automation_step_executions_request)
let make_automation_execution_metadata
  ?change_request_name:(change_request_name_ : string option) 
  ?association_id:(association_id_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option) 
  ?runbooks:(runbooks_ : runbook list option) 
  ?scheduled_time:(scheduled_time_ : CoreTypes.Timestamp.t option) 
  ?automation_subtype:(automation_subtype_ : automation_subtype option) 
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?automation_type:(automation_type_ : automation_type option) 
  ?target:(target_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?max_concurrency:(max_concurrency_ : string option) 
  ?resolved_targets:(resolved_targets_ : resolved_targets option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?targets:(targets_ : target list option) 
  ?target_parameter_name:(target_parameter_name_ : string option) 
  ?failure_message:(failure_message_ : string option) 
  ?current_action:(current_action_ : string option) 
  ?current_step_name:(current_step_name_ : string option) 
  ?parent_automation_execution_id:(parent_automation_execution_id_ :
                                    string option)
   ?mode:(mode_ : execution_mode option) 
  ?outputs:(outputs_ : automation_parameter_map option) 
  ?log_file:(log_file_ : string option) 
  ?executed_by:(executed_by_ : string option) 
  ?execution_end_time:(execution_end_time_ : CoreTypes.Timestamp.t option) 
  ?execution_start_time:(execution_start_time_ :
                          CoreTypes.Timestamp.t option)
   ?automation_execution_status:(automation_execution_status_ :
                                  automation_execution_status option)
   ?document_version:(document_version_ : string option) 
  ?document_name:(document_name_ : string option) 
  ?automation_execution_id:(automation_execution_id_ : string option)  () =
  ({
     change_request_name = change_request_name_;
     association_id = association_id_;
     ops_item_id = ops_item_id_;
     runbooks = runbooks_;
     scheduled_time = scheduled_time_;
     automation_subtype = automation_subtype_;
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
let make_automation_execution_filter ~values:(values_ : string list) 
  ~key:(key_ : automation_execution_filter_key)  () =
  ({ values = values_; key = key_ } : automation_execution_filter)
let make_describe_automation_executions_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : automation_execution_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_automation_executions_request)
let make_describe_association_request
  ?association_version:(association_version_ : string option) 
  ?association_id:(association_id_ : string option) 
  ?instance_id:(instance_id_ : string option)  ?name:(name_ : string option) 
  () =
  ({
     association_version = association_version_;
     association_id = association_id_;
     instance_id = instance_id_;
     name = name_
   } : describe_association_request)
let make_association_execution
  ?triggered_alarms:(triggered_alarms_ : alarm_state_information list option)
   ?alarm_configuration:(alarm_configuration_ : alarm_configuration option) 
  ?resource_count_by_status:(resource_count_by_status_ : string option) 
  ?last_execution_date:(last_execution_date_ : CoreTypes.Timestamp.t option) 
  ?created_time:(created_time_ : CoreTypes.Timestamp.t option) 
  ?detailed_status:(detailed_status_ : string option) 
  ?status:(status_ : string option) 
  ?execution_id:(execution_id_ : string option) 
  ?association_version:(association_version_ : string option) 
  ?association_id:(association_id_ : string option)  () =
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
  ~value:(value_ : string)  ~key:(key_ : association_execution_filter_key) 
  () =
  ({ type_ = type__; value = value_; key = key_ } : association_execution_filter)
let make_describe_association_executions_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : association_execution_filter list option) 
  ~association_id:(association_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     association_id = association_id_
   } : describe_association_executions_request)
let make_association_execution_target
  ?output_source:(output_source_ : output_source option) 
  ?last_execution_date:(last_execution_date_ : CoreTypes.Timestamp.t option) 
  ?detailed_status:(detailed_status_ : string option) 
  ?status:(status_ : string option) 
  ?resource_type:(resource_type_ : string option) 
  ?resource_id:(resource_id_ : string option) 
  ?execution_id:(execution_id_ : string option) 
  ?association_version:(association_version_ : string option) 
  ?association_id:(association_id_ : string option)  () =
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
let make_association_execution_targets_filter ~value:(value_ : string) 
  ~key:(key_ : association_execution_targets_filter_key)  () =
  ({ value = value_; key = key_ } : association_execution_targets_filter)
let make_describe_association_execution_targets_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : association_execution_targets_filter list option) 
  ~execution_id:(execution_id_ : string) 
  ~association_id:(association_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     execution_id = execution_id_;
     association_id = association_id_
   } : describe_association_execution_targets_request)
let make_activation ?tags:(tags_ : tag list option) 
  ?created_date:(created_date_ : CoreTypes.Timestamp.t option) 
  ?expired:(expired_ : bool option) 
  ?expiration_date:(expiration_date_ : CoreTypes.Timestamp.t option) 
  ?registrations_count:(registrations_count_ : int option) 
  ?registration_limit:(registration_limit_ : int option) 
  ?iam_role:(iam_role_ : string option) 
  ?default_instance_name:(default_instance_name_ : string option) 
  ?description:(description_ : string option) 
  ?activation_id:(activation_id_ : string option)  () =
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
  ?filter_values:(filter_values_ : string list option) 
  ?filter_key:(filter_key_ : describe_activations_filter_keys option)  () =
  ({ filter_values = filter_values_; filter_key = filter_key_ } : describe_activations_filter)
let make_describe_activations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filters:(filters_ : describe_activations_filter list option)  () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_
   } : describe_activations_request)
let make_deregister_task_from_maintenance_window_request
  ~window_task_id:(window_task_id_ : string) 
  ~window_id:(window_id_ : string)  () =
  ({ window_task_id = window_task_id_; window_id = window_id_ } : deregister_task_from_maintenance_window_request)
let make_deregister_target_from_maintenance_window_request
  ?safe:(safe_ : bool option)  ~window_target_id:(window_target_id_ : string)
   ~window_id:(window_id_ : string)  () =
  ({
     safe = safe_;
     window_target_id = window_target_id_;
     window_id = window_id_
   } : deregister_target_from_maintenance_window_request)
let make_deregister_patch_baseline_for_patch_group_request
  ~patch_group:(patch_group_ : string)  ~baseline_id:(baseline_id_ : string) 
  () =
  ({ patch_group = patch_group_; baseline_id = baseline_id_ } : deregister_patch_baseline_for_patch_group_request)
let make_deregister_managed_instance_request
  ~instance_id:(instance_id_ : string)  () =
  ({ instance_id = instance_id_ } : deregister_managed_instance_request)
let make_delete_resource_policy_response () = (() : unit)
let make_delete_resource_policy_request ~policy_hash:(policy_hash_ : string) 
  ~policy_id:(policy_id_ : string)  ~resource_arn:(resource_arn_ : string) 
  () =
  ({
     policy_hash = policy_hash_;
     policy_id = policy_id_;
     resource_arn = resource_arn_
   } : delete_resource_policy_request)
let make_delete_resource_data_sync_request
  ?sync_type:(sync_type_ : string option)  ~sync_name:(sync_name_ : string) 
  () =
  ({ sync_type = sync_type_; sync_name = sync_name_ } : delete_resource_data_sync_request)
let make_delete_patch_baseline_request ~baseline_id:(baseline_id_ : string) 
  () = ({ baseline_id = baseline_id_ } : delete_patch_baseline_request)
let make_delete_parameters_request ~names:(names_ : string list)  () =
  ({ names = names_ } : delete_parameters_request)
let make_delete_parameter_request ~name:(name_ : string)  () =
  ({ name = name_ } : delete_parameter_request)
let make_delete_ops_metadata_request
  ~ops_metadata_arn:(ops_metadata_arn_ : string)  () =
  ({ ops_metadata_arn = ops_metadata_arn_ } : delete_ops_metadata_request)
let make_delete_ops_item_response () = (() : unit)
let make_delete_ops_item_request ~ops_item_id:(ops_item_id_ : string)  () =
  ({ ops_item_id = ops_item_id_ } : delete_ops_item_request)
let make_delete_maintenance_window_request ~window_id:(window_id_ : string) 
  () = ({ window_id = window_id_ } : delete_maintenance_window_request)
let make_delete_inventory_request
  ?client_token:(client_token_ : string option) 
  ?dry_run:(dry_run_ : bool option) 
  ?schema_delete_option:(schema_delete_option_ :
                          inventory_schema_delete_option option)
   ~type_name:(type_name_ : string)  () =
  ({
     client_token = client_token_;
     dry_run = dry_run_;
     schema_delete_option = schema_delete_option_;
     type_name = type_name_
   } : delete_inventory_request)
let make_delete_document_request ?force:(force_ : bool option) 
  ?version_name:(version_name_ : string option) 
  ?document_version:(document_version_ : string option) 
  ~name:(name_ : string)  () =
  ({
     force = force_;
     version_name = version_name_;
     document_version = document_version_;
     name = name_
   } : delete_document_request)
let make_delete_association_request
  ?association_id:(association_id_ : string option) 
  ?instance_id:(instance_id_ : string option)  ?name:(name_ : string option) 
  () =
  ({
     association_id = association_id_;
     instance_id = instance_id_;
     name = name_
   } : delete_association_request)
let make_delete_activation_request ~activation_id:(activation_id_ : string) 
  () = ({ activation_id = activation_id_ } : delete_activation_request)
let make_create_resource_data_sync_request
  ?sync_source:(sync_source_ : resource_data_sync_source option) 
  ?sync_type:(sync_type_ : string option) 
  ?s3_destination:(s3_destination_ :
                    resource_data_sync_s3_destination option)
   ~sync_name:(sync_name_ : string)  () =
  ({
     sync_source = sync_source_;
     sync_type = sync_type_;
     s3_destination = s3_destination_;
     sync_name = sync_name_
   } : create_resource_data_sync_request)
let make_create_patch_baseline_request ?tags:(tags_ : tag list option) 
  ?client_token:(client_token_ : string option) 
  ?sources:(sources_ : patch_source list option) 
  ?description:(description_ : string option) 
  ?rejected_patches_action:(rejected_patches_action_ : patch_action option) 
  ?rejected_patches:(rejected_patches_ : string list option) 
  ?approved_patches_enable_non_security:(approved_patches_enable_non_security_
                                          : bool option)
   ?approved_patches_compliance_level:(approved_patches_compliance_level_ :
                                        patch_compliance_level option)
   ?approved_patches:(approved_patches_ : string list option) 
  ?approval_rules:(approval_rules_ : patch_rule_group option) 
  ?global_filters:(global_filters_ : patch_filter_group option) 
  ?operating_system:(operating_system_ : operating_system option) 
  ~name:(name_ : string)  () =
  ({
     tags = tags_;
     client_token = client_token_;
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
let make_create_ops_metadata_request ?tags:(tags_ : tag list option) 
  ?metadata:(metadata_ : metadata_map option) 
  ~resource_id:(resource_id_ : string)  () =
  ({ tags = tags_; metadata = metadata_; resource_id = resource_id_ } : 
  create_ops_metadata_request)
let make_create_ops_item_response
  ?ops_item_arn:(ops_item_arn_ : string option) 
  ?ops_item_id:(ops_item_id_ : string option)  () =
  ({ ops_item_arn = ops_item_arn_; ops_item_id = ops_item_id_ } : create_ops_item_response)
let make_create_ops_item_request ?account_id:(account_id_ : string option) 
  ?planned_end_time:(planned_end_time_ : CoreTypes.Timestamp.t option) 
  ?planned_start_time:(planned_start_time_ : CoreTypes.Timestamp.t option) 
  ?actual_end_time:(actual_end_time_ : CoreTypes.Timestamp.t option) 
  ?actual_start_time:(actual_start_time_ : CoreTypes.Timestamp.t option) 
  ?severity:(severity_ : string option) 
  ?category:(category_ : string option)  ?tags:(tags_ : tag list option) 
  ?related_ops_items:(related_ops_items_ : related_ops_item list option) 
  ?priority:(priority_ : int option) 
  ?notifications:(notifications_ : ops_item_notification list option) 
  ?operational_data:(operational_data_ : ops_item_operational_data option) 
  ?ops_item_type:(ops_item_type_ : string option)  ~title:(title_ : string) 
  ~source:(source_ : string)  ~description:(description_ : string)  () =
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
let make_create_maintenance_window_request ?tags:(tags_ : tag list option) 
  ?client_token:(client_token_ : string option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?schedule_timezone:(schedule_timezone_ : string option) 
  ?end_date:(end_date_ : string option) 
  ?start_date:(start_date_ : string option) 
  ?description:(description_ : string option) 
  ~allow_unassociated_targets:(allow_unassociated_targets_ : bool) 
  ~cutoff:(cutoff_ : int)  ~duration:(duration_ : int) 
  ~schedule:(schedule_ : string)  ~name:(name_ : string)  () =
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
let make_create_document_request ?tags:(tags_ : tag list option) 
  ?target_type:(target_type_ : string option) 
  ?document_format:(document_format_ : document_format option) 
  ?document_type:(document_type_ : document_type option) 
  ?version_name:(version_name_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?attachments:(attachments_ : attachments_source list option) 
  ?requires:(requires_ : document_requires list option) 
  ~name:(name_ : string)  ~content:(content_ : string)  () =
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
  ?tags:(tags_ : tag list option) 
  ?target_maps:(target_maps_ : target_map list option) 
  ?duration:(duration_ : int option) 
  ?schedule_offset:(schedule_offset_ : int option) 
  ?target_locations:(target_locations_ : target_location list option) 
  ?calendar_names:(calendar_names_ : string list option) 
  ?apply_only_at_cron_interval:(apply_only_at_cron_interval_ : bool option) 
  ?sync_compliance:(sync_compliance_ : association_sync_compliance option) 
  ?compliance_severity:(compliance_severity_ :
                         association_compliance_severity option)
   ?max_concurrency:(max_concurrency_ : string option) 
  ?max_errors:(max_errors_ : string option) 
  ?automation_target_parameter_name:(automation_target_parameter_name_ :
                                      string option)
   ?association_name:(association_name_ : string option) 
  ?output_location:(output_location_ :
                     instance_association_output_location option)
   ?schedule_expression:(schedule_expression_ : string option) 
  ?targets:(targets_ : target list option) 
  ?parameters:(parameters_ : parameters option) 
  ?instance_id:(instance_id_ : string option) 
  ?document_version:(document_version_ : string option) 
  ~name:(name_ : string)  () =
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
  ~entries:(entries_ : create_association_batch_request_entry list)  () =
  ({ entries = entries_ } : create_association_batch_request)
let make_create_activation_request
  ?registration_metadata:(registration_metadata_ :
                           registration_metadata_item list option)
   ?tags:(tags_ : tag list option) 
  ?expiration_date:(expiration_date_ : CoreTypes.Timestamp.t option) 
  ?registration_limit:(registration_limit_ : int option) 
  ?default_instance_name:(default_instance_name_ : string option) 
  ?description:(description_ : string option)  ~iam_role:(iam_role_ : string)
   () =
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
  ~window_execution_id:(window_execution_id_ : string)  () =
  ({ window_execution_id = window_execution_id_ } : cancel_maintenance_window_execution_request)
let make_cancel_command_request
  ?instance_ids:(instance_ids_ : string list option) 
  ~command_id:(command_id_ : string)  () =
  ({ instance_ids = instance_ids_; command_id = command_id_ } : cancel_command_request)
let make_associate_ops_item_related_item_response
  ?association_id:(association_id_ : string option)  () =
  ({ association_id = association_id_ } : associate_ops_item_related_item_response)
let make_associate_ops_item_related_item_request
  ~resource_uri:(resource_uri_ : string) 
  ~resource_type:(resource_type_ : string) 
  ~association_type:(association_type_ : string) 
  ~ops_item_id:(ops_item_id_ : string)  () =
  ({
     resource_uri = resource_uri_;
     resource_type = resource_type_;
     association_type = association_type_;
     ops_item_id = ops_item_id_
   } : associate_ops_item_related_item_request)
let make_add_tags_to_resource_request ~tags:(tags_ : tag list) 
  ~resource_id:(resource_id_ : string) 
  ~resource_type:(resource_type_ : resource_type_for_tagging)  () =
  ({ tags = tags_; resource_id = resource_id_; resource_type = resource_type_
   } : add_tags_to_resource_request)