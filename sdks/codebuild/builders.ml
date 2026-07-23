open Types

let make_auto_retry_config ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option)
    ?auto_retry_number:(auto_retry_number_ : wrapper_int option)
    ?next_auto_retry:(next_auto_retry_ : string_ option)
    ?previous_auto_retry:(previous_auto_retry_ : string_ option) () =
  ({
     auto_retry_limit = auto_retry_limit_;
     auto_retry_number = auto_retry_number_;
     next_auto_retry = next_auto_retry_;
     previous_auto_retry = previous_auto_retry_;
   }
    : auto_retry_config)

let make_build_not_deleted ?id:(id_ : non_empty_string option)
    ?status_code:(status_code_ : string_ option) () =
  ({ id = id_; status_code = status_code_ } : build_not_deleted)

let make_batch_delete_builds_output ?builds_deleted:(builds_deleted_ : build_ids option)
    ?builds_not_deleted:(builds_not_deleted_ : builds_not_deleted option) () =
  ({ builds_deleted = builds_deleted_; builds_not_deleted = builds_not_deleted_ }
    : batch_delete_builds_output)

let make_batch_delete_builds_input ~ids:(ids_ : build_ids) () =
  ({ ids = ids_ } : batch_delete_builds_input)

let make_resolved_artifact ?type_:(type__ : artifacts_type option)
    ?location:(location_ : string_ option) ?identifier:(identifier_ : string_ option) () =
  ({ type_ = type__; location = location_; identifier = identifier_ } : resolved_artifact)

let make_build_summary ?arn:(arn_ : string_ option) ?requested_on:(requested_on_ : timestamp option)
    ?build_status:(build_status_ : status_type option)
    ?primary_artifact:(primary_artifact_ : resolved_artifact option)
    ?secondary_artifacts:(secondary_artifacts_ : resolved_secondary_artifacts option) () =
  ({
     arn = arn_;
     requested_on = requested_on_;
     build_status = build_status_;
     primary_artifact = primary_artifact_;
     secondary_artifacts = secondary_artifacts_;
   }
    : build_summary)

let make_build_group ?identifier:(identifier_ : string_ option)
    ?depends_on:(depends_on_ : identifiers option)
    ?ignore_failure:(ignore_failure_ : boolean_ option)
    ?current_build_summary:(current_build_summary_ : build_summary option)
    ?prior_build_summary_list:(prior_build_summary_list_ : build_summaries option) () =
  ({
     identifier = identifier_;
     depends_on = depends_on_;
     ignore_failure = ignore_failure_;
     current_build_summary = current_build_summary_;
     prior_build_summary_list = prior_build_summary_list_;
   }
    : build_group)

let make_batch_restrictions ?maximum_builds_allowed:(maximum_builds_allowed_ : wrapper_int option)
    ?compute_types_allowed:(compute_types_allowed_ : compute_types_allowed option)
    ?fleets_allowed:(fleets_allowed_ : fleets_allowed option) () =
  ({
     maximum_builds_allowed = maximum_builds_allowed_;
     compute_types_allowed = compute_types_allowed_;
     fleets_allowed = fleets_allowed_;
   }
    : batch_restrictions)

let make_project_build_batch_config ?service_role:(service_role_ : non_empty_string option)
    ?combine_artifacts:(combine_artifacts_ : wrapper_boolean option)
    ?restrictions:(restrictions_ : batch_restrictions option)
    ?timeout_in_mins:(timeout_in_mins_ : wrapper_int option)
    ?batch_report_mode:(batch_report_mode_ : batch_report_mode_type option) () =
  ({
     service_role = service_role_;
     combine_artifacts = combine_artifacts_;
     restrictions = restrictions_;
     timeout_in_mins = timeout_in_mins_;
     batch_report_mode = batch_report_mode_;
   }
    : project_build_batch_config)

let make_project_file_system_location ?type_:(type__ : file_system_type option)
    ?location:(location_ : string_ option) ?mount_point:(mount_point_ : string_ option)
    ?identifier:(identifier_ : string_ option) ?mount_options:(mount_options_ : string_ option) () =
  ({
     type_ = type__;
     location = location_;
     mount_point = mount_point_;
     identifier = identifier_;
     mount_options = mount_options_;
   }
    : project_file_system_location)

let make_vpc_config ?vpc_id:(vpc_id_ : non_empty_string option) ?subnets:(subnets_ : subnets option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option) () =
  ({ vpc_id = vpc_id_; subnets = subnets_; security_group_ids = security_group_ids_ } : vpc_config)

let make_s3_logs_config ?location:(location_ : string_ option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option)
    ~status:(status_ : logs_config_status_type) () =
  ({
     status = status_;
     location = location_;
     encryption_disabled = encryption_disabled_;
     bucket_owner_access = bucket_owner_access_;
   }
    : s3_logs_config)

let make_cloud_watch_logs_config ?group_name:(group_name_ : string_ option)
    ?stream_name:(stream_name_ : string_ option) ~status:(status_ : logs_config_status_type) () =
  ({ status = status_; group_name = group_name_; stream_name = stream_name_ }
    : cloud_watch_logs_config)

let make_logs_config ?cloud_watch_logs:(cloud_watch_logs_ : cloud_watch_logs_config option)
    ?s3_logs:(s3_logs_ : s3_logs_config option) () =
  ({ cloud_watch_logs = cloud_watch_logs_; s3_logs = s3_logs_ } : logs_config)

let make_docker_server_status ?status:(status_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ status = status_; message = message_ } : docker_server_status)

let make_docker_server ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?status:(status_ : docker_server_status option) ~compute_type:(compute_type_ : compute_type) ()
    =
  ({ compute_type = compute_type_; security_group_ids = security_group_ids_; status = status_ }
    : docker_server)

let make_registry_credential ~credential:(credential_ : non_empty_string)
    ~credential_provider:(credential_provider_ : credential_provider_type) () =
  ({ credential = credential_; credential_provider = credential_provider_ } : registry_credential)

let make_environment_variable ?type_:(type__ : environment_variable_type option)
    ~name:(name_ : non_empty_string) ~value:(value_ : string_) () =
  ({ name = name_; value = value_; type_ = type__ } : environment_variable)

let make_project_fleet ?fleet_arn:(fleet_arn_ : string_ option) () =
  ({ fleet_arn = fleet_arn_ } : project_fleet)

let make_compute_configuration ?v_cpu:(v_cpu_ : wrapper_long option)
    ?memory:(memory_ : wrapper_long option) ?disk:(disk_ : wrapper_long option)
    ?machine_type:(machine_type_ : machine_type option)
    ?instance_type:(instance_type_ : non_empty_string option) () =
  ({
     v_cpu = v_cpu_;
     memory = memory_;
     disk = disk_;
     machine_type = machine_type_;
     instance_type = instance_type_;
   }
    : compute_configuration)

let make_project_environment
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?fleet:(fleet_ : project_fleet option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?privileged_mode:(privileged_mode_ : wrapper_boolean option)
    ?certificate:(certificate_ : string_ option)
    ?registry_credential:(registry_credential_ : registry_credential option)
    ?image_pull_credentials_type:(image_pull_credentials_type_ : image_pull_credentials_type option)
    ?docker_server:(docker_server_ : docker_server option)
    ?host_kernel:(host_kernel_ : host_kernel option) ~type_:(type__ : environment_type)
    ~image:(image_ : non_empty_string) ~compute_type:(compute_type_ : compute_type) () =
  ({
     type_ = type__;
     image = image_;
     compute_type = compute_type_;
     compute_configuration = compute_configuration_;
     fleet = fleet_;
     environment_variables = environment_variables_;
     privileged_mode = privileged_mode_;
     certificate = certificate_;
     registry_credential = registry_credential_;
     image_pull_credentials_type = image_pull_credentials_type_;
     docker_server = docker_server_;
     host_kernel = host_kernel_;
   }
    : project_environment)

let make_project_cache ?location:(location_ : string_ option)
    ?modes:(modes_ : project_cache_modes option)
    ?cache_namespace:(cache_namespace_ : string_ option) ~type_:(type__ : cache_type) () =
  ({ type_ = type__; location = location_; modes = modes_; cache_namespace = cache_namespace_ }
    : project_cache)

let make_build_artifacts ?location:(location_ : string_ option)
    ?sha256sum:(sha256sum_ : string_ option) ?md5sum:(md5sum_ : string_ option)
    ?override_artifact_name:(override_artifact_name_ : wrapper_boolean option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?artifact_identifier:(artifact_identifier_ : string_ option)
    ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option) () =
  ({
     location = location_;
     sha256sum = sha256sum_;
     md5sum = md5sum_;
     override_artifact_name = override_artifact_name_;
     encryption_disabled = encryption_disabled_;
     artifact_identifier = artifact_identifier_;
     bucket_owner_access = bucket_owner_access_;
   }
    : build_artifacts)

let make_project_source_version ~source_identifier:(source_identifier_ : string_)
    ~source_version:(source_version_ : string_) () =
  ({ source_identifier = source_identifier_; source_version = source_version_ }
    : project_source_version)

let make_build_status_config ?context:(context_ : string_ option)
    ?target_url:(target_url_ : string_ option) () =
  ({ context = context_; target_url = target_url_ } : build_status_config)

let make_source_auth ?resource:(resource_ : string_ option) ~type_:(type__ : source_auth_type) () =
  ({ type_ = type__; resource = resource_ } : source_auth)

let make_git_submodules_config ~fetch_submodules:(fetch_submodules_ : wrapper_boolean) () =
  ({ fetch_submodules = fetch_submodules_ } : git_submodules_config)

let make_project_source ?location:(location_ : string_ option)
    ?git_clone_depth:(git_clone_depth_ : git_clone_depth option)
    ?git_submodules_config:(git_submodules_config_ : git_submodules_config option)
    ?buildspec:(buildspec_ : string_ option) ?auth:(auth_ : source_auth option)
    ?report_build_status:(report_build_status_ : wrapper_boolean option)
    ?build_status_config:(build_status_config_ : build_status_config option)
    ?insecure_ssl:(insecure_ssl_ : wrapper_boolean option)
    ?source_identifier:(source_identifier_ : string_ option) ~type_:(type__ : source_type) () =
  ({
     type_ = type__;
     location = location_;
     git_clone_depth = git_clone_depth_;
     git_submodules_config = git_submodules_config_;
     buildspec = buildspec_;
     auth = auth_;
     report_build_status = report_build_status_;
     build_status_config = build_status_config_;
     insecure_ssl = insecure_ssl_;
     source_identifier = source_identifier_;
   }
    : project_source)

let make_phase_context ?status_code:(status_code_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ status_code = status_code_; message = message_ } : phase_context)

let make_build_batch_phase ?phase_type:(phase_type_ : build_batch_phase_type option)
    ?phase_status:(phase_status_ : status_type option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?contexts:(contexts_ : phase_contexts option) () =
  ({
     phase_type = phase_type_;
     phase_status = phase_status_;
     start_time = start_time_;
     end_time = end_time_;
     duration_in_seconds = duration_in_seconds_;
     contexts = contexts_;
   }
    : build_batch_phase)

let make_build_batch ?id:(id_ : non_empty_string option) ?arn:(arn_ : non_empty_string option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?current_phase:(current_phase_ : string_ option)
    ?build_batch_status:(build_batch_status_ : status_type option)
    ?source_version:(source_version_ : non_empty_string option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?project_name:(project_name_ : non_empty_string option)
    ?phases:(phases_ : build_batch_phases option) ?source:(source_ : project_source option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?artifacts:(artifacts_ : build_artifacts option)
    ?secondary_artifacts:(secondary_artifacts_ : build_artifacts_list option)
    ?cache:(cache_ : project_cache option) ?environment:(environment_ : project_environment option)
    ?service_role:(service_role_ : non_empty_string option)
    ?log_config:(log_config_ : logs_config option)
    ?build_timeout_in_minutes:(build_timeout_in_minutes_ : wrapper_int option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?complete:(complete_ : boolean_ option) ?initiator:(initiator_ : string_ option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?build_batch_number:(build_batch_number_ : wrapper_long option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?build_groups:(build_groups_ : build_groups option)
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ?report_arns:(report_arns_ : build_report_arns option) () =
  ({
     id = id_;
     arn = arn_;
     start_time = start_time_;
     end_time = end_time_;
     current_phase = current_phase_;
     build_batch_status = build_batch_status_;
     source_version = source_version_;
     resolved_source_version = resolved_source_version_;
     project_name = project_name_;
     phases = phases_;
     source = source_;
     secondary_sources = secondary_sources_;
     secondary_source_versions = secondary_source_versions_;
     artifacts = artifacts_;
     secondary_artifacts = secondary_artifacts_;
     cache = cache_;
     environment = environment_;
     service_role = service_role_;
     log_config = log_config_;
     build_timeout_in_minutes = build_timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     complete = complete_;
     initiator = initiator_;
     vpc_config = vpc_config_;
     encryption_key = encryption_key_;
     build_batch_number = build_batch_number_;
     file_system_locations = file_system_locations_;
     build_batch_config = build_batch_config_;
     build_groups = build_groups_;
     debug_session_enabled = debug_session_enabled_;
     report_arns = report_arns_;
   }
    : build_batch)

let make_batch_get_build_batches_output ?build_batches:(build_batches_ : build_batches option)
    ?build_batches_not_found:(build_batches_not_found_ : build_batch_ids option) () =
  ({ build_batches = build_batches_; build_batches_not_found = build_batches_not_found_ }
    : batch_get_build_batches_output)

let make_batch_get_build_batches_input ~ids:(ids_ : build_batch_ids) () =
  ({ ids = ids_ } : batch_get_build_batches_input)

let make_debug_session ?session_enabled:(session_enabled_ : wrapper_boolean option)
    ?session_target:(session_target_ : non_empty_string option) () =
  ({ session_enabled = session_enabled_; session_target = session_target_ } : debug_session)

let make_exported_environment_variable ?name:(name_ : non_empty_string option)
    ?value:(value_ : string_ option) () =
  ({ name = name_; value = value_ } : exported_environment_variable)

let make_network_interface ?subnet_id:(subnet_id_ : non_empty_string option)
    ?network_interface_id:(network_interface_id_ : non_empty_string option) () =
  ({ subnet_id = subnet_id_; network_interface_id = network_interface_id_ } : network_interface)

let make_logs_location ?group_name:(group_name_ : string_ option)
    ?stream_name:(stream_name_ : string_ option) ?deep_link:(deep_link_ : string_ option)
    ?s3_deep_link:(s3_deep_link_ : string_ option)
    ?cloud_watch_logs_arn:(cloud_watch_logs_arn_ : string_ option)
    ?s3_logs_arn:(s3_logs_arn_ : string_ option)
    ?cloud_watch_logs:(cloud_watch_logs_ : cloud_watch_logs_config option)
    ?s3_logs:(s3_logs_ : s3_logs_config option) () =
  ({
     group_name = group_name_;
     stream_name = stream_name_;
     deep_link = deep_link_;
     s3_deep_link = s3_deep_link_;
     cloud_watch_logs_arn = cloud_watch_logs_arn_;
     s3_logs_arn = s3_logs_arn_;
     cloud_watch_logs = cloud_watch_logs_;
     s3_logs = s3_logs_;
   }
    : logs_location)

let make_build_phase ?phase_type:(phase_type_ : build_phase_type option)
    ?phase_status:(phase_status_ : status_type option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?contexts:(contexts_ : phase_contexts option) () =
  ({
     phase_type = phase_type_;
     phase_status = phase_status_;
     start_time = start_time_;
     end_time = end_time_;
     duration_in_seconds = duration_in_seconds_;
     contexts = contexts_;
   }
    : build_phase)

let make_build ?id:(id_ : non_empty_string option) ?arn:(arn_ : non_empty_string option)
    ?build_number:(build_number_ : wrapper_long option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?current_phase:(current_phase_ : string_ option)
    ?build_status:(build_status_ : status_type option)
    ?source_version:(source_version_ : non_empty_string option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?project_name:(project_name_ : non_empty_string option) ?phases:(phases_ : build_phases option)
    ?source:(source_ : project_source option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?artifacts:(artifacts_ : build_artifacts option)
    ?secondary_artifacts:(secondary_artifacts_ : build_artifacts_list option)
    ?cache:(cache_ : project_cache option) ?environment:(environment_ : project_environment option)
    ?service_role:(service_role_ : non_empty_string option) ?logs:(logs_ : logs_location option)
    ?timeout_in_minutes:(timeout_in_minutes_ : wrapper_int option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?build_complete:(build_complete_ : boolean_ option) ?initiator:(initiator_ : string_ option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?network_interface:(network_interface_ : network_interface option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?exported_environment_variables:
      (exported_environment_variables_ : exported_environment_variables option)
    ?report_arns:(report_arns_ : build_report_arns option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?debug_session:(debug_session_ : debug_session option)
    ?build_batch_arn:(build_batch_arn_ : string_ option)
    ?auto_retry_config:(auto_retry_config_ : auto_retry_config option) () =
  ({
     id = id_;
     arn = arn_;
     build_number = build_number_;
     start_time = start_time_;
     end_time = end_time_;
     current_phase = current_phase_;
     build_status = build_status_;
     source_version = source_version_;
     resolved_source_version = resolved_source_version_;
     project_name = project_name_;
     phases = phases_;
     source = source_;
     secondary_sources = secondary_sources_;
     secondary_source_versions = secondary_source_versions_;
     artifacts = artifacts_;
     secondary_artifacts = secondary_artifacts_;
     cache = cache_;
     environment = environment_;
     service_role = service_role_;
     logs = logs_;
     timeout_in_minutes = timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     build_complete = build_complete_;
     initiator = initiator_;
     vpc_config = vpc_config_;
     network_interface = network_interface_;
     encryption_key = encryption_key_;
     exported_environment_variables = exported_environment_variables_;
     report_arns = report_arns_;
     file_system_locations = file_system_locations_;
     debug_session = debug_session_;
     build_batch_arn = build_batch_arn_;
     auto_retry_config = auto_retry_config_;
   }
    : build)

let make_batch_get_builds_output ?builds:(builds_ : builds option)
    ?builds_not_found:(builds_not_found_ : build_ids option) () =
  ({ builds = builds_; builds_not_found = builds_not_found_ } : batch_get_builds_output)

let make_batch_get_builds_input ~ids:(ids_ : build_ids) () =
  ({ ids = ids_ } : batch_get_builds_input)

let make_command_execution ?id:(id_ : non_empty_string option)
    ?sandbox_id:(sandbox_id_ : non_empty_string option)
    ?submit_time:(submit_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?status:(status_ : non_empty_string option)
    ?command:(command_ : sensitive_non_empty_string option) ?type_:(type__ : command_type option)
    ?exit_code:(exit_code_ : non_empty_string option)
    ?standard_output_content:(standard_output_content_ : sensitive_non_empty_string option)
    ?standard_err_content:(standard_err_content_ : sensitive_non_empty_string option)
    ?logs:(logs_ : logs_location option) ?sandbox_arn:(sandbox_arn_ : non_empty_string option) () =
  ({
     id = id_;
     sandbox_id = sandbox_id_;
     submit_time = submit_time_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
     command = command_;
     type_ = type__;
     exit_code = exit_code_;
     standard_output_content = standard_output_content_;
     standard_err_content = standard_err_content_;
     logs = logs_;
     sandbox_arn = sandbox_arn_;
   }
    : command_execution)

let make_batch_get_command_executions_output
    ?command_executions:(command_executions_ : command_executions option)
    ?command_executions_not_found:(command_executions_not_found_ : command_execution_ids option) ()
    =
  ({
     command_executions = command_executions_;
     command_executions_not_found = command_executions_not_found_;
   }
    : batch_get_command_executions_output)

let make_batch_get_command_executions_input ~sandbox_id:(sandbox_id_ : non_empty_string)
    ~command_execution_ids:(command_execution_ids_ : command_execution_ids) () =
  ({ sandbox_id = sandbox_id_; command_execution_ids = command_execution_ids_ }
    : batch_get_command_executions_input)

let make_tag ?key:(key_ : key_input option) ?value:(value_ : value_input option) () =
  ({ key = key_; value = value_ } : tag)

let make_fleet_proxy_rule ~type_:(type__ : fleet_proxy_rule_type)
    ~effect_:(effect__ : fleet_proxy_rule_effect_type)
    ~entities:(entities_ : fleet_proxy_rule_entities) () =
  ({ type_ = type__; effect_ = effect__; entities = entities_ } : fleet_proxy_rule)

let make_proxy_configuration
    ?default_behavior:(default_behavior_ : fleet_proxy_rule_behavior option)
    ?ordered_proxy_rules:(ordered_proxy_rules_ : fleet_proxy_rules option) () =
  ({ default_behavior = default_behavior_; ordered_proxy_rules = ordered_proxy_rules_ }
    : proxy_configuration)

let make_target_tracking_scaling_configuration
    ?metric_type:(metric_type_ : fleet_scaling_metric_type option)
    ?target_value:(target_value_ : wrapper_double option) () =
  ({ metric_type = metric_type_; target_value = target_value_ }
    : target_tracking_scaling_configuration)

let make_scaling_configuration_output ?scaling_type:(scaling_type_ : fleet_scaling_type option)
    ?target_tracking_scaling_configs:
      (target_tracking_scaling_configs_ : target_tracking_scaling_configurations option)
    ?max_capacity:(max_capacity_ : fleet_capacity option)
    ?desired_capacity:(desired_capacity_ : fleet_capacity option) () =
  ({
     scaling_type = scaling_type_;
     target_tracking_scaling_configs = target_tracking_scaling_configs_;
     max_capacity = max_capacity_;
     desired_capacity = desired_capacity_;
   }
    : scaling_configuration_output)

let make_fleet_status ?status_code:(status_code_ : fleet_status_code option)
    ?context:(context_ : fleet_context_code option) ?message:(message_ : string_ option) () =
  ({ status_code = status_code_; context = context_; message = message_ } : fleet_status)

let make_fleet ?arn:(arn_ : non_empty_string option) ?name:(name_ : fleet_name option)
    ?id:(id_ : non_empty_string option) ?created:(created_ : timestamp option)
    ?last_modified:(last_modified_ : timestamp option) ?status:(status_ : fleet_status option)
    ?base_capacity:(base_capacity_ : fleet_capacity option)
    ?environment_type:(environment_type_ : environment_type option)
    ?compute_type:(compute_type_ : compute_type option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_output option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?image_id:(image_id_ : non_empty_string option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?tags:(tags_ : tag_list option) () =
  ({
     arn = arn_;
     name = name_;
     id = id_;
     created = created_;
     last_modified = last_modified_;
     status = status_;
     base_capacity = base_capacity_;
     environment_type = environment_type_;
     compute_type = compute_type_;
     compute_configuration = compute_configuration_;
     scaling_configuration = scaling_configuration_;
     overflow_behavior = overflow_behavior_;
     vpc_config = vpc_config_;
     proxy_configuration = proxy_configuration_;
     image_id = image_id_;
     fleet_service_role = fleet_service_role_;
     tags = tags_;
   }
    : fleet)

let make_batch_get_fleets_output ?fleets:(fleets_ : fleets option)
    ?fleets_not_found:(fleets_not_found_ : fleet_names option) () =
  ({ fleets = fleets_; fleets_not_found = fleets_not_found_ } : batch_get_fleets_output)

let make_batch_get_fleets_input ~names:(names_ : fleet_names) () =
  ({ names = names_ } : batch_get_fleets_input)

let make_project_badge ?badge_enabled:(badge_enabled_ : boolean_ option)
    ?badge_request_url:(badge_request_url_ : string_ option) () =
  ({ badge_enabled = badge_enabled_; badge_request_url = badge_request_url_ } : project_badge)

let make_pull_request_build_policy
    ?approver_roles:(approver_roles_ : pull_request_build_approver_roles option)
    ~requires_comment_approval:(requires_comment_approval_ : pull_request_build_comment_approval) ()
    =
  ({ requires_comment_approval = requires_comment_approval_; approver_roles = approver_roles_ }
    : pull_request_build_policy)

let make_scope_configuration ?domain:(domain_ : string_ option) ~name:(name_ : string_)
    ~scope:(scope_ : webhook_scope_type) () =
  ({ name = name_; domain = domain_; scope = scope_ } : scope_configuration)

let make_webhook_filter ?exclude_matched_pattern:(exclude_matched_pattern_ : wrapper_boolean option)
    ~type_:(type__ : webhook_filter_type) ~pattern:(pattern_ : string_) () =
  ({ type_ = type__; pattern = pattern_; exclude_matched_pattern = exclude_matched_pattern_ }
    : webhook_filter)

let make_webhook ?url:(url_ : non_empty_string option)
    ?payload_url:(payload_url_ : non_empty_string option)
    ?secret:(secret_ : non_empty_string option) ?branch_filter:(branch_filter_ : string_ option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?manual_creation:(manual_creation_ : wrapper_boolean option)
    ?last_modified_secret:(last_modified_secret_ : timestamp option)
    ?scope_configuration:(scope_configuration_ : scope_configuration option)
    ?status:(status_ : webhook_status option) ?status_message:(status_message_ : string_ option)
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option) () =
  ({
     url = url_;
     payload_url = payload_url_;
     secret = secret_;
     branch_filter = branch_filter_;
     filter_groups = filter_groups_;
     build_type = build_type_;
     manual_creation = manual_creation_;
     last_modified_secret = last_modified_secret_;
     scope_configuration = scope_configuration_;
     status = status_;
     status_message = status_message_;
     pull_request_build_policy = pull_request_build_policy_;
   }
    : webhook)

let make_project_artifacts ?location:(location_ : string_ option) ?path:(path_ : string_ option)
    ?namespace_type:(namespace_type_ : artifact_namespace option) ?name:(name_ : string_ option)
    ?packaging:(packaging_ : artifact_packaging option)
    ?override_artifact_name:(override_artifact_name_ : wrapper_boolean option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?artifact_identifier:(artifact_identifier_ : string_ option)
    ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option)
    ~type_:(type__ : artifacts_type) () =
  ({
     type_ = type__;
     location = location_;
     path = path_;
     namespace_type = namespace_type_;
     name = name_;
     packaging = packaging_;
     override_artifact_name = override_artifact_name_;
     encryption_disabled = encryption_disabled_;
     artifact_identifier = artifact_identifier_;
     bucket_owner_access = bucket_owner_access_;
   }
    : project_artifacts)

let make_project ?name:(name_ : project_name option) ?arn:(arn_ : string_ option)
    ?description:(description_ : project_description option)
    ?source:(source_ : project_source option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?artifacts:(artifacts_ : project_artifacts option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?cache:(cache_ : project_cache option) ?environment:(environment_ : project_environment option)
    ?service_role:(service_role_ : non_empty_string option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?encryption_key:(encryption_key_ : non_empty_string option) ?tags:(tags_ : tag_list option)
    ?created:(created_ : timestamp option) ?last_modified:(last_modified_ : timestamp option)
    ?webhook:(webhook_ : webhook option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?badge:(badge_ : project_badge option) ?logs_config:(logs_config_ : logs_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?project_visibility:(project_visibility_ : project_visibility_type option)
    ?public_project_alias:(public_project_alias_ : non_empty_string option)
    ?resource_access_role:(resource_access_role_ : non_empty_string option)
    ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     source = source_;
     secondary_sources = secondary_sources_;
     source_version = source_version_;
     secondary_source_versions = secondary_source_versions_;
     artifacts = artifacts_;
     secondary_artifacts = secondary_artifacts_;
     cache = cache_;
     environment = environment_;
     service_role = service_role_;
     timeout_in_minutes = timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     encryption_key = encryption_key_;
     tags = tags_;
     created = created_;
     last_modified = last_modified_;
     webhook = webhook_;
     vpc_config = vpc_config_;
     badge = badge_;
     logs_config = logs_config_;
     file_system_locations = file_system_locations_;
     build_batch_config = build_batch_config_;
     concurrent_build_limit = concurrent_build_limit_;
     project_visibility = project_visibility_;
     public_project_alias = public_project_alias_;
     resource_access_role = resource_access_role_;
     auto_retry_limit = auto_retry_limit_;
   }
    : project)

let make_batch_get_projects_output ?projects:(projects_ : projects option)
    ?projects_not_found:(projects_not_found_ : project_names option) () =
  ({ projects = projects_; projects_not_found = projects_not_found_ } : batch_get_projects_output)

let make_batch_get_projects_input ~names:(names_ : project_names) () =
  ({ names = names_ } : batch_get_projects_input)

let make_s3_report_export_config ?bucket:(bucket_ : non_empty_string option)
    ?bucket_owner:(bucket_owner_ : string_ option) ?path:(path_ : string_ option)
    ?packaging:(packaging_ : report_packaging_type option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option) () =
  ({
     bucket = bucket_;
     bucket_owner = bucket_owner_;
     path = path_;
     packaging = packaging_;
     encryption_key = encryption_key_;
     encryption_disabled = encryption_disabled_;
   }
    : s3_report_export_config)

let make_report_export_config
    ?export_config_type:(export_config_type_ : report_export_config_type option)
    ?s3_destination:(s3_destination_ : s3_report_export_config option) () =
  ({ export_config_type = export_config_type_; s3_destination = s3_destination_ }
    : report_export_config)

let make_report_group ?arn:(arn_ : non_empty_string option) ?name:(name_ : report_group_name option)
    ?type_:(type__ : report_type option)
    ?export_config:(export_config_ : report_export_config option)
    ?created:(created_ : timestamp option) ?last_modified:(last_modified_ : timestamp option)
    ?tags:(tags_ : tag_list option) ?status:(status_ : report_group_status_type option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     export_config = export_config_;
     created = created_;
     last_modified = last_modified_;
     tags = tags_;
     status = status_;
   }
    : report_group)

let make_batch_get_report_groups_output ?report_groups:(report_groups_ : report_groups option)
    ?report_groups_not_found:(report_groups_not_found_ : report_group_arns option) () =
  ({ report_groups = report_groups_; report_groups_not_found = report_groups_not_found_ }
    : batch_get_report_groups_output)

let make_batch_get_report_groups_input ~report_group_arns:(report_group_arns_ : report_group_arns)
    () =
  ({ report_group_arns = report_group_arns_ } : batch_get_report_groups_input)

let make_code_coverage_report_summary
    ?line_coverage_percentage:(line_coverage_percentage_ : percentage option)
    ?lines_covered:(lines_covered_ : non_negative_int option)
    ?lines_missed:(lines_missed_ : non_negative_int option)
    ?branch_coverage_percentage:(branch_coverage_percentage_ : percentage option)
    ?branches_covered:(branches_covered_ : non_negative_int option)
    ?branches_missed:(branches_missed_ : non_negative_int option) () =
  ({
     line_coverage_percentage = line_coverage_percentage_;
     lines_covered = lines_covered_;
     lines_missed = lines_missed_;
     branch_coverage_percentage = branch_coverage_percentage_;
     branches_covered = branches_covered_;
     branches_missed = branches_missed_;
   }
    : code_coverage_report_summary)

let make_test_report_summary ~total:(total_ : wrapper_int)
    ~status_counts:(status_counts_ : report_status_counts)
    ~duration_in_nano_seconds:(duration_in_nano_seconds_ : wrapper_long) () =
  ({
     total = total_;
     status_counts = status_counts_;
     duration_in_nano_seconds = duration_in_nano_seconds_;
   }
    : test_report_summary)

let make_report ?arn:(arn_ : non_empty_string option) ?type_:(type__ : report_type option)
    ?name:(name_ : string_ option) ?report_group_arn:(report_group_arn_ : non_empty_string option)
    ?execution_id:(execution_id_ : string_ option) ?status:(status_ : report_status_type option)
    ?created:(created_ : timestamp option) ?expired:(expired_ : timestamp option)
    ?export_config:(export_config_ : report_export_config option)
    ?truncated:(truncated_ : wrapper_boolean option)
    ?test_summary:(test_summary_ : test_report_summary option)
    ?code_coverage_summary:(code_coverage_summary_ : code_coverage_report_summary option) () =
  ({
     arn = arn_;
     type_ = type__;
     name = name_;
     report_group_arn = report_group_arn_;
     execution_id = execution_id_;
     status = status_;
     created = created_;
     expired = expired_;
     export_config = export_config_;
     truncated = truncated_;
     test_summary = test_summary_;
     code_coverage_summary = code_coverage_summary_;
   }
    : report)

let make_batch_get_reports_output ?reports:(reports_ : reports option)
    ?reports_not_found:(reports_not_found_ : report_arns option) () =
  ({ reports = reports_; reports_not_found = reports_not_found_ } : batch_get_reports_output)

let make_batch_get_reports_input ~report_arns:(report_arns_ : report_arns) () =
  ({ report_arns = report_arns_ } : batch_get_reports_input)

let make_sandbox_session_phase ?phase_type:(phase_type_ : string_ option)
    ?phase_status:(phase_status_ : status_type option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?contexts:(contexts_ : phase_contexts option) () =
  ({
     phase_type = phase_type_;
     phase_status = phase_status_;
     start_time = start_time_;
     end_time = end_time_;
     duration_in_seconds = duration_in_seconds_;
     contexts = contexts_;
   }
    : sandbox_session_phase)

let make_sandbox_session ?id:(id_ : non_empty_string option) ?status:(status_ : string_ option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?current_phase:(current_phase_ : string_ option)
    ?phases:(phases_ : sandbox_session_phases option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?logs:(logs_ : logs_location option)
    ?network_interface:(network_interface_ : network_interface option) () =
  ({
     id = id_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     current_phase = current_phase_;
     phases = phases_;
     resolved_source_version = resolved_source_version_;
     logs = logs_;
     network_interface = network_interface_;
   }
    : sandbox_session)

let make_sandbox ?id:(id_ : non_empty_string option) ?arn:(arn_ : non_empty_string option)
    ?project_name:(project_name_ : non_empty_string option)
    ?request_time:(request_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?status:(status_ : string_ option)
    ?source:(source_ : project_source option)
    ?source_version:(source_version_ : non_empty_string option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?environment:(environment_ : project_environment option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?timeout_in_minutes:(timeout_in_minutes_ : wrapper_int option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?log_config:(log_config_ : logs_config option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?service_role:(service_role_ : non_empty_string option)
    ?current_session:(current_session_ : sandbox_session option) () =
  ({
     id = id_;
     arn = arn_;
     project_name = project_name_;
     request_time = request_time_;
     start_time = start_time_;
     end_time = end_time_;
     status = status_;
     source = source_;
     source_version = source_version_;
     secondary_sources = secondary_sources_;
     secondary_source_versions = secondary_source_versions_;
     environment = environment_;
     file_system_locations = file_system_locations_;
     timeout_in_minutes = timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     vpc_config = vpc_config_;
     log_config = log_config_;
     encryption_key = encryption_key_;
     service_role = service_role_;
     current_session = current_session_;
   }
    : sandbox)

let make_batch_get_sandboxes_output ?sandboxes:(sandboxes_ : sandboxes option)
    ?sandboxes_not_found:(sandboxes_not_found_ : sandbox_ids option) () =
  ({ sandboxes = sandboxes_; sandboxes_not_found = sandboxes_not_found_ }
    : batch_get_sandboxes_output)

let make_batch_get_sandboxes_input ~ids:(ids_ : sandbox_ids) () =
  ({ ids = ids_ } : batch_get_sandboxes_input)

let make_build_batch_filter ?status:(status_ : status_type option) () =
  ({ status = status_ } : build_batch_filter)

let make_update_webhook_output ?webhook:(webhook_ : webhook option) () =
  ({ webhook = webhook_ } : update_webhook_output)

let make_update_webhook_input ?branch_filter:(branch_filter_ : string_ option)
    ?rotate_secret:(rotate_secret_ : boolean_ option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option)
    ~project_name:(project_name_ : project_name) () =
  ({
     project_name = project_name_;
     branch_filter = branch_filter_;
     rotate_secret = rotate_secret_;
     filter_groups = filter_groups_;
     build_type = build_type_;
     pull_request_build_policy = pull_request_build_policy_;
   }
    : update_webhook_input)

let make_update_report_group_output ?report_group:(report_group_ : report_group option) () =
  ({ report_group = report_group_ } : update_report_group_output)

let make_update_report_group_input ?export_config:(export_config_ : report_export_config option)
    ?tags:(tags_ : tag_list option) ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_; export_config = export_config_; tags = tags_ } : update_report_group_input)

let make_update_project_visibility_output ?project_arn:(project_arn_ : non_empty_string option)
    ?public_project_alias:(public_project_alias_ : non_empty_string option)
    ?project_visibility:(project_visibility_ : project_visibility_type option) () =
  ({
     project_arn = project_arn_;
     public_project_alias = public_project_alias_;
     project_visibility = project_visibility_;
   }
    : update_project_visibility_output)

let make_update_project_visibility_input
    ?resource_access_role:(resource_access_role_ : non_empty_string option)
    ~project_arn:(project_arn_ : non_empty_string)
    ~project_visibility:(project_visibility_ : project_visibility_type) () =
  ({
     project_arn = project_arn_;
     project_visibility = project_visibility_;
     resource_access_role = resource_access_role_;
   }
    : update_project_visibility_input)

let make_update_project_output ?project:(project_ : project option) () =
  ({ project = project_ } : update_project_output)

let make_update_project_input ?description:(description_ : project_description option)
    ?source:(source_ : project_source option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?artifacts:(artifacts_ : project_artifacts option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?cache:(cache_ : project_cache option) ?environment:(environment_ : project_environment option)
    ?service_role:(service_role_ : non_empty_string option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?encryption_key:(encryption_key_ : non_empty_string option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?badge_enabled:(badge_enabled_ : wrapper_boolean option)
    ?logs_config:(logs_config_ : logs_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option) ~name:(name_ : non_empty_string) () =
  ({
     name = name_;
     description = description_;
     source = source_;
     secondary_sources = secondary_sources_;
     source_version = source_version_;
     secondary_source_versions = secondary_source_versions_;
     artifacts = artifacts_;
     secondary_artifacts = secondary_artifacts_;
     cache = cache_;
     environment = environment_;
     service_role = service_role_;
     timeout_in_minutes = timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     encryption_key = encryption_key_;
     tags = tags_;
     vpc_config = vpc_config_;
     badge_enabled = badge_enabled_;
     logs_config = logs_config_;
     file_system_locations = file_system_locations_;
     build_batch_config = build_batch_config_;
     concurrent_build_limit = concurrent_build_limit_;
     auto_retry_limit = auto_retry_limit_;
   }
    : update_project_input)

let make_update_fleet_output ?fleet:(fleet_ : fleet option) () =
  ({ fleet = fleet_ } : update_fleet_output)

let make_scaling_configuration_input ?scaling_type:(scaling_type_ : fleet_scaling_type option)
    ?target_tracking_scaling_configs:
      (target_tracking_scaling_configs_ : target_tracking_scaling_configurations option)
    ?max_capacity:(max_capacity_ : fleet_capacity option) () =
  ({
     scaling_type = scaling_type_;
     target_tracking_scaling_configs = target_tracking_scaling_configs_;
     max_capacity = max_capacity_;
   }
    : scaling_configuration_input)

let make_update_fleet_input ?base_capacity:(base_capacity_ : fleet_capacity option)
    ?environment_type:(environment_type_ : environment_type option)
    ?compute_type:(compute_type_ : compute_type option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_input option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?image_id:(image_id_ : non_empty_string option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?tags:(tags_ : tag_list option) ~arn:(arn_ : non_empty_string) () =
  ({
     arn = arn_;
     base_capacity = base_capacity_;
     environment_type = environment_type_;
     compute_type = compute_type_;
     compute_configuration = compute_configuration_;
     scaling_configuration = scaling_configuration_;
     overflow_behavior = overflow_behavior_;
     vpc_config = vpc_config_;
     proxy_configuration = proxy_configuration_;
     image_id = image_id_;
     fleet_service_role = fleet_service_role_;
     tags = tags_;
   }
    : update_fleet_input)

let make_stop_sandbox_output ?sandbox:(sandbox_ : sandbox option) () =
  ({ sandbox = sandbox_ } : stop_sandbox_output)

let make_stop_sandbox_input ~id:(id_ : non_empty_string) () = ({ id = id_ } : stop_sandbox_input)

let make_stop_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : stop_build_batch_output)

let make_stop_build_batch_input ~id:(id_ : non_empty_string) () =
  ({ id = id_ } : stop_build_batch_input)

let make_stop_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : stop_build_output)

let make_stop_build_input ~id:(id_ : non_empty_string) () = ({ id = id_ } : stop_build_input)

let make_ssm_session ?session_id:(session_id_ : string_ option)
    ?token_value:(token_value_ : string_ option) ?stream_url:(stream_url_ : string_ option) () =
  ({ session_id = session_id_; token_value = token_value_; stream_url = stream_url_ } : ssm_session)

let make_start_sandbox_connection_output ?ssm_session:(ssm_session_ : ssm_session option) () =
  ({ ssm_session = ssm_session_ } : start_sandbox_connection_output)

let make_start_sandbox_connection_input ~sandbox_id:(sandbox_id_ : non_empty_string) () =
  ({ sandbox_id = sandbox_id_ } : start_sandbox_connection_input)

let make_start_sandbox_output ?sandbox:(sandbox_ : sandbox option) () =
  ({ sandbox = sandbox_ } : start_sandbox_output)

let make_start_sandbox_input ?project_name:(project_name_ : non_empty_string option)
    ?idempotency_token:(idempotency_token_ : sensitive_string option) () =
  ({ project_name = project_name_; idempotency_token = idempotency_token_ } : start_sandbox_input)

let make_start_command_execution_output
    ?command_execution:(command_execution_ : command_execution option) () =
  ({ command_execution = command_execution_ } : start_command_execution_output)

let make_start_command_execution_input ?type_:(type__ : command_type option)
    ~sandbox_id:(sandbox_id_ : non_empty_string) ~command:(command_ : sensitive_non_empty_string) ()
    =
  ({ sandbox_id = sandbox_id_; command = command_; type_ = type__ } : start_command_execution_input)

let make_start_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : start_build_batch_output)

let make_start_build_batch_input
    ?secondary_sources_override:(secondary_sources_override_ : project_sources option)
    ?secondary_sources_version_override:
      (secondary_sources_version_override_ : project_secondary_source_versions option)
    ?source_version:(source_version_ : string_ option)
    ?artifacts_override:(artifacts_override_ : project_artifacts option)
    ?secondary_artifacts_override:(secondary_artifacts_override_ : project_artifacts_list option)
    ?environment_variables_override:(environment_variables_override_ : environment_variables option)
    ?source_type_override:(source_type_override_ : source_type option)
    ?source_location_override:(source_location_override_ : string_ option)
    ?source_auth_override:(source_auth_override_ : source_auth option)
    ?git_clone_depth_override:(git_clone_depth_override_ : git_clone_depth option)
    ?git_submodules_config_override:(git_submodules_config_override_ : git_submodules_config option)
    ?buildspec_override:(buildspec_override_ : string_ option)
    ?insecure_ssl_override:(insecure_ssl_override_ : wrapper_boolean option)
    ?report_build_batch_status_override:
      (report_build_batch_status_override_ : wrapper_boolean option)
    ?environment_type_override:(environment_type_override_ : environment_type option)
    ?image_override:(image_override_ : non_empty_string option)
    ?compute_type_override:(compute_type_override_ : compute_type option)
    ?certificate_override:(certificate_override_ : string_ option)
    ?cache_override:(cache_override_ : project_cache option)
    ?service_role_override:(service_role_override_ : non_empty_string option)
    ?privileged_mode_override:(privileged_mode_override_ : wrapper_boolean option)
    ?build_timeout_in_minutes_override:(build_timeout_in_minutes_override_ : build_time_out option)
    ?queued_timeout_in_minutes_override:(queued_timeout_in_minutes_override_ : time_out option)
    ?encryption_key_override:(encryption_key_override_ : non_empty_string option)
    ?idempotency_token:(idempotency_token_ : string_ option)
    ?logs_config_override:(logs_config_override_ : logs_config option)
    ?registry_credential_override:(registry_credential_override_ : registry_credential option)
    ?image_pull_credentials_type_override:
      (image_pull_credentials_type_override_ : image_pull_credentials_type option)
    ?build_batch_config_override:(build_batch_config_override_ : project_build_batch_config option)
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({
     project_name = project_name_;
     secondary_sources_override = secondary_sources_override_;
     secondary_sources_version_override = secondary_sources_version_override_;
     source_version = source_version_;
     artifacts_override = artifacts_override_;
     secondary_artifacts_override = secondary_artifacts_override_;
     environment_variables_override = environment_variables_override_;
     source_type_override = source_type_override_;
     source_location_override = source_location_override_;
     source_auth_override = source_auth_override_;
     git_clone_depth_override = git_clone_depth_override_;
     git_submodules_config_override = git_submodules_config_override_;
     buildspec_override = buildspec_override_;
     insecure_ssl_override = insecure_ssl_override_;
     report_build_batch_status_override = report_build_batch_status_override_;
     environment_type_override = environment_type_override_;
     image_override = image_override_;
     compute_type_override = compute_type_override_;
     certificate_override = certificate_override_;
     cache_override = cache_override_;
     service_role_override = service_role_override_;
     privileged_mode_override = privileged_mode_override_;
     build_timeout_in_minutes_override = build_timeout_in_minutes_override_;
     queued_timeout_in_minutes_override = queued_timeout_in_minutes_override_;
     encryption_key_override = encryption_key_override_;
     idempotency_token = idempotency_token_;
     logs_config_override = logs_config_override_;
     registry_credential_override = registry_credential_override_;
     image_pull_credentials_type_override = image_pull_credentials_type_override_;
     build_batch_config_override = build_batch_config_override_;
     debug_session_enabled = debug_session_enabled_;
   }
    : start_build_batch_input)

let make_start_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : start_build_output)

let make_start_build_input
    ?secondary_sources_override:(secondary_sources_override_ : project_sources option)
    ?secondary_sources_version_override:
      (secondary_sources_version_override_ : project_secondary_source_versions option)
    ?source_version:(source_version_ : string_ option)
    ?artifacts_override:(artifacts_override_ : project_artifacts option)
    ?secondary_artifacts_override:(secondary_artifacts_override_ : project_artifacts_list option)
    ?environment_variables_override:(environment_variables_override_ : environment_variables option)
    ?source_type_override:(source_type_override_ : source_type option)
    ?source_location_override:(source_location_override_ : string_ option)
    ?source_auth_override:(source_auth_override_ : source_auth option)
    ?git_clone_depth_override:(git_clone_depth_override_ : git_clone_depth option)
    ?git_submodules_config_override:(git_submodules_config_override_ : git_submodules_config option)
    ?buildspec_override:(buildspec_override_ : string_ option)
    ?insecure_ssl_override:(insecure_ssl_override_ : wrapper_boolean option)
    ?report_build_status_override:(report_build_status_override_ : wrapper_boolean option)
    ?build_status_config_override:(build_status_config_override_ : build_status_config option)
    ?environment_type_override:(environment_type_override_ : environment_type option)
    ?image_override:(image_override_ : non_empty_string option)
    ?compute_type_override:(compute_type_override_ : compute_type option)
    ?certificate_override:(certificate_override_ : string_ option)
    ?cache_override:(cache_override_ : project_cache option)
    ?service_role_override:(service_role_override_ : non_empty_string option)
    ?privileged_mode_override:(privileged_mode_override_ : wrapper_boolean option)
    ?timeout_in_minutes_override:(timeout_in_minutes_override_ : build_time_out option)
    ?queued_timeout_in_minutes_override:(queued_timeout_in_minutes_override_ : time_out option)
    ?encryption_key_override:(encryption_key_override_ : non_empty_string option)
    ?idempotency_token:(idempotency_token_ : string_ option)
    ?logs_config_override:(logs_config_override_ : logs_config option)
    ?registry_credential_override:(registry_credential_override_ : registry_credential option)
    ?image_pull_credentials_type_override:
      (image_pull_credentials_type_override_ : image_pull_credentials_type option)
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ?fleet_override:(fleet_override_ : project_fleet option)
    ?auto_retry_limit_override:(auto_retry_limit_override_ : wrapper_int option)
    ?host_kernel_override:(host_kernel_override_ : host_kernel option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({
     project_name = project_name_;
     secondary_sources_override = secondary_sources_override_;
     secondary_sources_version_override = secondary_sources_version_override_;
     source_version = source_version_;
     artifacts_override = artifacts_override_;
     secondary_artifacts_override = secondary_artifacts_override_;
     environment_variables_override = environment_variables_override_;
     source_type_override = source_type_override_;
     source_location_override = source_location_override_;
     source_auth_override = source_auth_override_;
     git_clone_depth_override = git_clone_depth_override_;
     git_submodules_config_override = git_submodules_config_override_;
     buildspec_override = buildspec_override_;
     insecure_ssl_override = insecure_ssl_override_;
     report_build_status_override = report_build_status_override_;
     build_status_config_override = build_status_config_override_;
     environment_type_override = environment_type_override_;
     image_override = image_override_;
     compute_type_override = compute_type_override_;
     certificate_override = certificate_override_;
     cache_override = cache_override_;
     service_role_override = service_role_override_;
     privileged_mode_override = privileged_mode_override_;
     timeout_in_minutes_override = timeout_in_minutes_override_;
     queued_timeout_in_minutes_override = queued_timeout_in_minutes_override_;
     encryption_key_override = encryption_key_override_;
     idempotency_token = idempotency_token_;
     logs_config_override = logs_config_override_;
     registry_credential_override = registry_credential_override_;
     image_pull_credentials_type_override = image_pull_credentials_type_override_;
     debug_session_enabled = debug_session_enabled_;
     fleet_override = fleet_override_;
     auto_retry_limit_override = auto_retry_limit_override_;
     host_kernel_override = host_kernel_override_;
   }
    : start_build_input)

let make_retry_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : retry_build_batch_output)

let make_retry_build_batch_input ?id:(id_ : non_empty_string option)
    ?idempotency_token:(idempotency_token_ : string_ option)
    ?retry_type:(retry_type_ : retry_build_batch_type option) () =
  ({ id = id_; idempotency_token = idempotency_token_; retry_type = retry_type_ }
    : retry_build_batch_input)

let make_retry_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : retry_build_output)

let make_retry_build_input ?id:(id_ : non_empty_string option)
    ?idempotency_token:(idempotency_token_ : string_ option) () =
  ({ id = id_; idempotency_token = idempotency_token_ } : retry_build_input)

let make_put_resource_policy_output ?resource_arn:(resource_arn_ : non_empty_string option) () =
  ({ resource_arn = resource_arn_ } : put_resource_policy_output)

let make_put_resource_policy_input ~policy:(policy_ : non_empty_string)
    ~resource_arn:(resource_arn_ : non_empty_string) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_input)

let make_source_credentials_info ?arn:(arn_ : non_empty_string option)
    ?server_type:(server_type_ : server_type option) ?auth_type:(auth_type_ : auth_type option)
    ?resource:(resource_ : string_ option) () =
  ({ arn = arn_; server_type = server_type_; auth_type = auth_type_; resource = resource_ }
    : source_credentials_info)

let make_list_source_credentials_output
    ?source_credentials_infos:(source_credentials_infos_ : source_credentials_infos option) () =
  ({ source_credentials_infos = source_credentials_infos_ } : list_source_credentials_output)

let make_list_source_credentials_input () = (() : unit)

let make_list_shared_report_groups_output ?next_token:(next_token_ : string_ option)
    ?report_groups:(report_groups_ : report_group_arns option) () =
  ({ next_token = next_token_; report_groups = report_groups_ } : list_shared_report_groups_output)

let make_list_shared_report_groups_input ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : shared_resource_sort_by_type option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : page_size option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_shared_report_groups_input)

let make_list_shared_projects_output ?next_token:(next_token_ : string_ option)
    ?projects:(projects_ : project_arns option) () =
  ({ next_token = next_token_; projects = projects_ } : list_shared_projects_output)

let make_list_shared_projects_input ?sort_by:(sort_by_ : shared_resource_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_shared_projects_input)

let make_list_sandboxes_for_project_output ?ids:(ids_ : sandbox_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_sandboxes_for_project_output)

let make_list_sandboxes_for_project_input ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : sensitive_string option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({
     project_name = project_name_;
     max_results = max_results_;
     sort_order = sort_order_;
     next_token = next_token_;
   }
    : list_sandboxes_for_project_input)

let make_list_sandboxes_output ?ids:(ids_ : sandbox_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_sandboxes_output)

let make_list_sandboxes_input ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option) ?next_token:(next_token_ : string_ option) ()
    =
  ({ max_results = max_results_; sort_order = sort_order_; next_token = next_token_ }
    : list_sandboxes_input)

let make_list_reports_for_report_group_output ?next_token:(next_token_ : string_ option)
    ?reports:(reports_ : report_arns option) () =
  ({ next_token = next_token_; reports = reports_ } : list_reports_for_report_group_output)

let make_report_filter ?status:(status_ : report_status_type option) () =
  ({ status = status_ } : report_filter)

let make_list_reports_for_report_group_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ?filter:(filter_ : report_filter option)
    ~report_group_arn:(report_group_arn_ : string_) () =
  ({
     report_group_arn = report_group_arn_;
     next_token = next_token_;
     sort_order = sort_order_;
     max_results = max_results_;
     filter = filter_;
   }
    : list_reports_for_report_group_input)

let make_list_reports_output ?next_token:(next_token_ : string_ option)
    ?reports:(reports_ : report_arns option) () =
  ({ next_token = next_token_; reports = reports_ } : list_reports_output)

let make_list_reports_input ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : page_size option)
    ?filter:(filter_ : report_filter option) () =
  ({
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : list_reports_input)

let make_list_report_groups_output ?next_token:(next_token_ : string_ option)
    ?report_groups:(report_groups_ : report_group_arns option) () =
  ({ next_token = next_token_; report_groups = report_groups_ } : list_report_groups_output)

let make_list_report_groups_input ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : report_group_sort_by_type option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : page_size option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_report_groups_input)

let make_list_projects_output ?next_token:(next_token_ : string_ option)
    ?projects:(projects_ : project_names option) () =
  ({ next_token = next_token_; projects = projects_ } : list_projects_output)

let make_list_projects_input ?sort_by:(sort_by_ : project_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({ sort_by = sort_by_; sort_order = sort_order_; next_token = next_token_ } : list_projects_input)

let make_list_fleets_output ?next_token:(next_token_ : string_ option)
    ?fleets:(fleets_ : fleet_arns option) () =
  ({ next_token = next_token_; fleets = fleets_ } : list_fleets_output)

let make_list_fleets_input ?next_token:(next_token_ : sensitive_string option)
    ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : fleet_sort_by_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_fleets_input)

let make_environment_image ?name:(name_ : string_ option)
    ?description:(description_ : string_ option) ?versions:(versions_ : image_versions option) () =
  ({ name = name_; description = description_; versions = versions_ } : environment_image)

let make_environment_language ?language:(language_ : language_type option)
    ?images:(images_ : environment_images option) () =
  ({ language = language_; images = images_ } : environment_language)

let make_environment_platform ?platform:(platform_ : platform_type option)
    ?languages:(languages_ : environment_languages option) () =
  ({ platform = platform_; languages = languages_ } : environment_platform)

let make_list_curated_environment_images_output
    ?platforms:(platforms_ : environment_platforms option) () =
  ({ platforms = platforms_ } : list_curated_environment_images_output)

let make_list_curated_environment_images_input () = (() : unit)

let make_list_command_executions_for_sandbox_output
    ?command_executions:(command_executions_ : command_executions option)
    ?next_token:(next_token_ : string_ option) () =
  ({ command_executions = command_executions_; next_token = next_token_ }
    : list_command_executions_for_sandbox_output)

let make_list_command_executions_for_sandbox_input ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : sensitive_string option) ~sandbox_id:(sandbox_id_ : non_empty_string)
    () =
  ({
     sandbox_id = sandbox_id_;
     max_results = max_results_;
     sort_order = sort_order_;
     next_token = next_token_;
   }
    : list_command_executions_for_sandbox_input)

let make_list_builds_for_project_output ?ids:(ids_ : build_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_builds_for_project_output)

let make_list_builds_for_project_input ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : string_ option) ~project_name:(project_name_ : non_empty_string) () =
  ({ project_name = project_name_; sort_order = sort_order_; next_token = next_token_ }
    : list_builds_for_project_input)

let make_list_builds_output ?ids:(ids_ : build_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_builds_output)

let make_list_builds_input ?sort_order:(sort_order_ : sort_order_type option)
    ?next_token:(next_token_ : string_ option) () =
  ({ sort_order = sort_order_; next_token = next_token_ } : list_builds_input)

let make_list_build_batches_for_project_output ?ids:(ids_ : build_batch_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_build_batches_for_project_output)

let make_list_build_batches_for_project_input
    ?project_name:(project_name_ : non_empty_string option)
    ?filter:(filter_ : build_batch_filter option) ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option) ?next_token:(next_token_ : string_ option) ()
    =
  ({
     project_name = project_name_;
     filter = filter_;
     max_results = max_results_;
     sort_order = sort_order_;
     next_token = next_token_;
   }
    : list_build_batches_for_project_input)

let make_list_build_batches_output ?ids:(ids_ : build_batch_ids option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ids = ids_; next_token = next_token_ } : list_build_batches_output)

let make_list_build_batches_input ?filter:(filter_ : build_batch_filter option)
    ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option) ?next_token:(next_token_ : string_ option) ()
    =
  ({
     filter = filter_;
     max_results = max_results_;
     sort_order = sort_order_;
     next_token = next_token_;
   }
    : list_build_batches_input)

let make_invalidate_project_cache_output () = (() : unit)

let make_invalidate_project_cache_input ~project_name:(project_name_ : non_empty_string) () =
  ({ project_name = project_name_ } : invalidate_project_cache_input)

let make_import_source_credentials_output ?arn:(arn_ : non_empty_string option) () =
  ({ arn = arn_ } : import_source_credentials_output)

let make_import_source_credentials_input ?username:(username_ : non_empty_string option)
    ?should_overwrite:(should_overwrite_ : wrapper_boolean option)
    ~token:(token_ : sensitive_non_empty_string) ~server_type:(server_type_ : server_type)
    ~auth_type:(auth_type_ : auth_type) () =
  ({
     username = username_;
     token = token_;
     server_type = server_type_;
     auth_type = auth_type_;
     should_overwrite = should_overwrite_;
   }
    : import_source_credentials_input)

let make_get_resource_policy_output ?policy:(policy_ : non_empty_string option) () =
  ({ policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : non_empty_string) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_report_with_raw_data ?report_arn:(report_arn_ : non_empty_string option)
    ?data:(data_ : string_ option) () =
  ({ report_arn = report_arn_; data = data_ } : report_with_raw_data)

let make_report_group_trend_stats ?average:(average_ : string_ option) ?max:(max_ : string_ option)
    ?min:(min_ : string_ option) () =
  ({ average = average_; max = max_; min = min_ } : report_group_trend_stats)

let make_get_report_group_trend_output ?stats:(stats_ : report_group_trend_stats option)
    ?raw_data:(raw_data_ : report_group_trend_raw_data_list option) () =
  ({ stats = stats_; raw_data = raw_data_ } : get_report_group_trend_output)

let make_get_report_group_trend_input ?num_of_reports:(num_of_reports_ : page_size option)
    ~report_group_arn:(report_group_arn_ : non_empty_string)
    ~trend_field:(trend_field_ : report_group_trend_field_type) () =
  ({
     report_group_arn = report_group_arn_;
     num_of_reports = num_of_reports_;
     trend_field = trend_field_;
   }
    : get_report_group_trend_input)

let make_test_case ?report_arn:(report_arn_ : non_empty_string option)
    ?test_raw_data_path:(test_raw_data_path_ : string_ option) ?prefix:(prefix_ : string_ option)
    ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?duration_in_nano_seconds:(duration_in_nano_seconds_ : wrapper_long option)
    ?message:(message_ : string_ option) ?expired:(expired_ : timestamp option)
    ?test_suite_name:(test_suite_name_ : string_ option) () =
  ({
     report_arn = report_arn_;
     test_raw_data_path = test_raw_data_path_;
     prefix = prefix_;
     name = name_;
     status = status_;
     duration_in_nano_seconds = duration_in_nano_seconds_;
     message = message_;
     expired = expired_;
     test_suite_name = test_suite_name_;
   }
    : test_case)

let make_describe_test_cases_output ?next_token:(next_token_ : string_ option)
    ?test_cases:(test_cases_ : test_cases option) () =
  ({ next_token = next_token_; test_cases = test_cases_ } : describe_test_cases_output)

let make_test_case_filter ?status:(status_ : string_ option) ?keyword:(keyword_ : string_ option) ()
    =
  ({ status = status_; keyword = keyword_ } : test_case_filter)

let make_describe_test_cases_input ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_size option) ?filter:(filter_ : test_case_filter option)
    ~report_arn:(report_arn_ : string_) () =
  ({
     report_arn = report_arn_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : describe_test_cases_input)

let make_code_coverage ?id:(id_ : non_empty_string option)
    ?report_ar_n:(report_ar_n_ : non_empty_string option)
    ?file_path:(file_path_ : non_empty_string option)
    ?line_coverage_percentage:(line_coverage_percentage_ : percentage option)
    ?lines_covered:(lines_covered_ : non_negative_int option)
    ?lines_missed:(lines_missed_ : non_negative_int option)
    ?branch_coverage_percentage:(branch_coverage_percentage_ : percentage option)
    ?branches_covered:(branches_covered_ : non_negative_int option)
    ?branches_missed:(branches_missed_ : non_negative_int option)
    ?expired:(expired_ : timestamp option) () =
  ({
     id = id_;
     report_ar_n = report_ar_n_;
     file_path = file_path_;
     line_coverage_percentage = line_coverage_percentage_;
     lines_covered = lines_covered_;
     lines_missed = lines_missed_;
     branch_coverage_percentage = branch_coverage_percentage_;
     branches_covered = branches_covered_;
     branches_missed = branches_missed_;
     expired = expired_;
   }
    : code_coverage)

let make_describe_code_coverages_output ?next_token:(next_token_ : string_ option)
    ?code_coverages:(code_coverages_ : code_coverages option) () =
  ({ next_token = next_token_; code_coverages = code_coverages_ } : describe_code_coverages_output)

let make_describe_code_coverages_input ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : report_code_coverage_sort_by_type option)
    ?min_line_coverage_percentage:(min_line_coverage_percentage_ : percentage option)
    ?max_line_coverage_percentage:(max_line_coverage_percentage_ : percentage option)
    ~report_arn:(report_arn_ : non_empty_string) () =
  ({
     report_arn = report_arn_;
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     min_line_coverage_percentage = min_line_coverage_percentage_;
     max_line_coverage_percentage = max_line_coverage_percentage_;
   }
    : describe_code_coverages_input)

let make_delete_webhook_output () = (() : unit)

let make_delete_webhook_input ~project_name:(project_name_ : project_name) () =
  ({ project_name = project_name_ } : delete_webhook_input)

let make_delete_source_credentials_output ?arn:(arn_ : non_empty_string option) () =
  ({ arn = arn_ } : delete_source_credentials_output)

let make_delete_source_credentials_input ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_ } : delete_source_credentials_input)

let make_delete_resource_policy_output () = (() : unit)

let make_delete_resource_policy_input ~resource_arn:(resource_arn_ : non_empty_string) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_input)

let make_delete_report_group_output () = (() : unit)

let make_delete_report_group_input ?delete_reports:(delete_reports_ : boolean_ option)
    ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_; delete_reports = delete_reports_ } : delete_report_group_input)

let make_delete_report_output () = (() : unit)

let make_delete_report_input ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_ } : delete_report_input)

let make_delete_project_output () = (() : unit)

let make_delete_project_input ~name:(name_ : non_empty_string) () =
  ({ name = name_ } : delete_project_input)

let make_delete_fleet_output () = (() : unit)

let make_delete_fleet_input ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_ } : delete_fleet_input)

let make_delete_build_batch_output ?status_code:(status_code_ : string_ option)
    ?builds_deleted:(builds_deleted_ : build_ids option)
    ?builds_not_deleted:(builds_not_deleted_ : builds_not_deleted option) () =
  ({
     status_code = status_code_;
     builds_deleted = builds_deleted_;
     builds_not_deleted = builds_not_deleted_;
   }
    : delete_build_batch_output)

let make_delete_build_batch_input ~id:(id_ : non_empty_string) () =
  ({ id = id_ } : delete_build_batch_input)

let make_create_webhook_output ?webhook:(webhook_ : webhook option) () =
  ({ webhook = webhook_ } : create_webhook_output)

let make_create_webhook_input ?branch_filter:(branch_filter_ : string_ option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?manual_creation:(manual_creation_ : wrapper_boolean option)
    ?scope_configuration:(scope_configuration_ : scope_configuration option)
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option)
    ~project_name:(project_name_ : project_name) () =
  ({
     project_name = project_name_;
     branch_filter = branch_filter_;
     filter_groups = filter_groups_;
     build_type = build_type_;
     manual_creation = manual_creation_;
     scope_configuration = scope_configuration_;
     pull_request_build_policy = pull_request_build_policy_;
   }
    : create_webhook_input)

let make_create_report_group_output ?report_group:(report_group_ : report_group option) () =
  ({ report_group = report_group_ } : create_report_group_output)

let make_create_report_group_input ?tags:(tags_ : tag_list option) ~name:(name_ : report_group_name)
    ~type_:(type__ : report_type) ~export_config:(export_config_ : report_export_config) () =
  ({ name = name_; type_ = type__; export_config = export_config_; tags = tags_ }
    : create_report_group_input)

let make_create_project_output ?project:(project_ : project option) () =
  ({ project = project_ } : create_project_output)

let make_create_project_input ?description:(description_ : project_description option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?cache:(cache_ : project_cache option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?encryption_key:(encryption_key_ : non_empty_string option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?badge_enabled:(badge_enabled_ : wrapper_boolean option)
    ?logs_config:(logs_config_ : logs_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option) ~name:(name_ : project_name)
    ~source:(source_ : project_source) ~artifacts:(artifacts_ : project_artifacts)
    ~environment:(environment_ : project_environment)
    ~service_role:(service_role_ : non_empty_string) () =
  ({
     name = name_;
     description = description_;
     source = source_;
     secondary_sources = secondary_sources_;
     source_version = source_version_;
     secondary_source_versions = secondary_source_versions_;
     artifacts = artifacts_;
     secondary_artifacts = secondary_artifacts_;
     cache = cache_;
     environment = environment_;
     service_role = service_role_;
     timeout_in_minutes = timeout_in_minutes_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     encryption_key = encryption_key_;
     tags = tags_;
     vpc_config = vpc_config_;
     badge_enabled = badge_enabled_;
     logs_config = logs_config_;
     file_system_locations = file_system_locations_;
     build_batch_config = build_batch_config_;
     concurrent_build_limit = concurrent_build_limit_;
     auto_retry_limit = auto_retry_limit_;
   }
    : create_project_input)

let make_create_fleet_output ?fleet:(fleet_ : fleet option) () =
  ({ fleet = fleet_ } : create_fleet_output)

let make_create_fleet_input
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_input option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?image_id:(image_id_ : non_empty_string option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : fleet_name)
    ~base_capacity:(base_capacity_ : fleet_capacity)
    ~environment_type:(environment_type_ : environment_type)
    ~compute_type:(compute_type_ : compute_type) () =
  ({
     name = name_;
     base_capacity = base_capacity_;
     environment_type = environment_type_;
     compute_type = compute_type_;
     compute_configuration = compute_configuration_;
     scaling_configuration = scaling_configuration_;
     overflow_behavior = overflow_behavior_;
     vpc_config = vpc_config_;
     proxy_configuration = proxy_configuration_;
     image_id = image_id_;
     fleet_service_role = fleet_service_role_;
     tags = tags_;
   }
    : create_fleet_input)
