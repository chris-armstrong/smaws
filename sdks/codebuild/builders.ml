open Types

let make_webhook_filter ?exclude_matched_pattern:(exclude_matched_pattern_ : wrapper_boolean option)
    ~pattern:(pattern_ : string_) ~type_:(type__ : webhook_filter_type) () =
  ({ exclude_matched_pattern = exclude_matched_pattern_; pattern = pattern_; type_ = type__ }
    : webhook_filter)

let make_scope_configuration ?domain:(domain_ : string_ option) ~scope:(scope_ : webhook_scope_type)
    ~name:(name_ : string_) () =
  ({ scope = scope_; domain = domain_; name = name_ } : scope_configuration)

let make_pull_request_build_policy
    ?approver_roles:(approver_roles_ : pull_request_build_approver_roles option)
    ~requires_comment_approval:(requires_comment_approval_ : pull_request_build_comment_approval) ()
    =
  ({ approver_roles = approver_roles_; requires_comment_approval = requires_comment_approval_ }
    : pull_request_build_policy)

let make_webhook
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option)
    ?status_message:(status_message_ : string_ option) ?status:(status_ : webhook_status option)
    ?scope_configuration:(scope_configuration_ : scope_configuration option)
    ?last_modified_secret:(last_modified_secret_ : timestamp option)
    ?manual_creation:(manual_creation_ : wrapper_boolean option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?branch_filter:(branch_filter_ : string_ option) ?secret:(secret_ : non_empty_string option)
    ?payload_url:(payload_url_ : non_empty_string option) ?url:(url_ : non_empty_string option) () =
  ({
     pull_request_build_policy = pull_request_build_policy_;
     status_message = status_message_;
     status = status_;
     scope_configuration = scope_configuration_;
     last_modified_secret = last_modified_secret_;
     manual_creation = manual_creation_;
     build_type = build_type_;
     filter_groups = filter_groups_;
     branch_filter = branch_filter_;
     secret = secret_;
     payload_url = payload_url_;
     url = url_;
   }
    : webhook)

let make_vpc_config ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?subnets:(subnets_ : subnets option) ?vpc_id:(vpc_id_ : non_empty_string option) () =
  ({ security_group_ids = security_group_ids_; subnets = subnets_; vpc_id = vpc_id_ } : vpc_config)

let make_update_webhook_output ?webhook:(webhook_ : webhook option) () =
  ({ webhook = webhook_ } : update_webhook_output)

let make_update_webhook_input
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?rotate_secret:(rotate_secret_ : boolean_ option)
    ?branch_filter:(branch_filter_ : string_ option) ~project_name:(project_name_ : project_name) ()
    =
  ({
     pull_request_build_policy = pull_request_build_policy_;
     build_type = build_type_;
     filter_groups = filter_groups_;
     rotate_secret = rotate_secret_;
     branch_filter = branch_filter_;
     project_name = project_name_;
   }
    : update_webhook_input)

let make_s3_report_export_config
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?packaging:(packaging_ : report_packaging_type option) ?path:(path_ : string_ option)
    ?bucket_owner:(bucket_owner_ : string_ option) ?bucket:(bucket_ : non_empty_string option) () =
  ({
     encryption_disabled = encryption_disabled_;
     encryption_key = encryption_key_;
     packaging = packaging_;
     path = path_;
     bucket_owner = bucket_owner_;
     bucket = bucket_;
   }
    : s3_report_export_config)

let make_report_export_config ?s3_destination:(s3_destination_ : s3_report_export_config option)
    ?export_config_type:(export_config_type_ : report_export_config_type option) () =
  ({ s3_destination = s3_destination_; export_config_type = export_config_type_ }
    : report_export_config)

let make_tag ?value:(value_ : value_input option) ?key:(key_ : key_input option) () =
  ({ value = value_; key = key_ } : tag)

let make_report_group ?status:(status_ : report_group_status_type option)
    ?tags:(tags_ : tag_list option) ?last_modified:(last_modified_ : timestamp option)
    ?created:(created_ : timestamp option)
    ?export_config:(export_config_ : report_export_config option)
    ?type_:(type__ : report_type option) ?name:(name_ : report_group_name option)
    ?arn:(arn_ : non_empty_string option) () =
  ({
     status = status_;
     tags = tags_;
     last_modified = last_modified_;
     created = created_;
     export_config = export_config_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : report_group)

let make_update_report_group_output ?report_group:(report_group_ : report_group option) () =
  ({ report_group = report_group_ } : update_report_group_output)

let make_update_report_group_input ?tags:(tags_ : tag_list option)
    ?export_config:(export_config_ : report_export_config option) ~arn:(arn_ : non_empty_string) ()
    =
  ({ tags = tags_; export_config = export_config_; arn = arn_ } : update_report_group_input)

let make_update_project_visibility_output
    ?project_visibility:(project_visibility_ : project_visibility_type option)
    ?public_project_alias:(public_project_alias_ : non_empty_string option)
    ?project_arn:(project_arn_ : non_empty_string option) () =
  ({
     project_visibility = project_visibility_;
     public_project_alias = public_project_alias_;
     project_arn = project_arn_;
   }
    : update_project_visibility_output)

let make_update_project_visibility_input
    ?resource_access_role:(resource_access_role_ : non_empty_string option)
    ~project_visibility:(project_visibility_ : project_visibility_type)
    ~project_arn:(project_arn_ : non_empty_string) () =
  ({
     resource_access_role = resource_access_role_;
     project_visibility = project_visibility_;
     project_arn = project_arn_;
   }
    : update_project_visibility_input)

let make_git_submodules_config ~fetch_submodules:(fetch_submodules_ : wrapper_boolean) () =
  ({ fetch_submodules = fetch_submodules_ } : git_submodules_config)

let make_source_auth ?resource:(resource_ : string_ option) ~type_:(type__ : source_auth_type) () =
  ({ resource = resource_; type_ = type__ } : source_auth)

let make_build_status_config ?target_url:(target_url_ : string_ option)
    ?context:(context_ : string_ option) () =
  ({ target_url = target_url_; context = context_ } : build_status_config)

let make_project_source ?source_identifier:(source_identifier_ : string_ option)
    ?insecure_ssl:(insecure_ssl_ : wrapper_boolean option)
    ?build_status_config:(build_status_config_ : build_status_config option)
    ?report_build_status:(report_build_status_ : wrapper_boolean option)
    ?auth:(auth_ : source_auth option) ?buildspec:(buildspec_ : string_ option)
    ?git_submodules_config:(git_submodules_config_ : git_submodules_config option)
    ?git_clone_depth:(git_clone_depth_ : git_clone_depth option)
    ?location:(location_ : string_ option) ~type_:(type__ : source_type) () =
  ({
     source_identifier = source_identifier_;
     insecure_ssl = insecure_ssl_;
     build_status_config = build_status_config_;
     report_build_status = report_build_status_;
     auth = auth_;
     buildspec = buildspec_;
     git_submodules_config = git_submodules_config_;
     git_clone_depth = git_clone_depth_;
     location = location_;
     type_ = type__;
   }
    : project_source)

let make_project_source_version ~source_version:(source_version_ : string_)
    ~source_identifier:(source_identifier_ : string_) () =
  ({ source_version = source_version_; source_identifier = source_identifier_ }
    : project_source_version)

let make_project_artifacts ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option)
    ?artifact_identifier:(artifact_identifier_ : string_ option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?override_artifact_name:(override_artifact_name_ : wrapper_boolean option)
    ?packaging:(packaging_ : artifact_packaging option) ?name:(name_ : string_ option)
    ?namespace_type:(namespace_type_ : artifact_namespace option) ?path:(path_ : string_ option)
    ?location:(location_ : string_ option) ~type_:(type__ : artifacts_type) () =
  ({
     bucket_owner_access = bucket_owner_access_;
     artifact_identifier = artifact_identifier_;
     encryption_disabled = encryption_disabled_;
     override_artifact_name = override_artifact_name_;
     packaging = packaging_;
     name = name_;
     namespace_type = namespace_type_;
     path = path_;
     location = location_;
     type_ = type__;
   }
    : project_artifacts)

let make_project_cache ?cache_namespace:(cache_namespace_ : string_ option)
    ?modes:(modes_ : project_cache_modes option) ?location:(location_ : string_ option)
    ~type_:(type__ : cache_type) () =
  ({ cache_namespace = cache_namespace_; modes = modes_; location = location_; type_ = type__ }
    : project_cache)

let make_compute_configuration ?instance_type:(instance_type_ : non_empty_string option)
    ?machine_type:(machine_type_ : machine_type option) ?disk:(disk_ : wrapper_long option)
    ?memory:(memory_ : wrapper_long option) ?v_cpu:(v_cpu_ : wrapper_long option) () =
  ({
     instance_type = instance_type_;
     machine_type = machine_type_;
     disk = disk_;
     memory = memory_;
     v_cpu = v_cpu_;
   }
    : compute_configuration)

let make_project_fleet ?fleet_arn:(fleet_arn_ : string_ option) () =
  ({ fleet_arn = fleet_arn_ } : project_fleet)

let make_environment_variable ?type_:(type__ : environment_variable_type option)
    ~value:(value_ : string_) ~name:(name_ : non_empty_string) () =
  ({ type_ = type__; value = value_; name = name_ } : environment_variable)

let make_registry_credential ~credential_provider:(credential_provider_ : credential_provider_type)
    ~credential:(credential_ : non_empty_string) () =
  ({ credential_provider = credential_provider_; credential = credential_ } : registry_credential)

let make_docker_server_status ?message:(message_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ message = message_; status = status_ } : docker_server_status)

let make_docker_server ?status:(status_ : docker_server_status option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ~compute_type:(compute_type_ : compute_type) () =
  ({ status = status_; security_group_ids = security_group_ids_; compute_type = compute_type_ }
    : docker_server)

let make_project_environment ?host_kernel:(host_kernel_ : host_kernel option)
    ?docker_server:(docker_server_ : docker_server option)
    ?image_pull_credentials_type:(image_pull_credentials_type_ : image_pull_credentials_type option)
    ?registry_credential:(registry_credential_ : registry_credential option)
    ?certificate:(certificate_ : string_ option)
    ?privileged_mode:(privileged_mode_ : wrapper_boolean option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?fleet:(fleet_ : project_fleet option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ~compute_type:(compute_type_ : compute_type) ~image:(image_ : non_empty_string)
    ~type_:(type__ : environment_type) () =
  ({
     host_kernel = host_kernel_;
     docker_server = docker_server_;
     image_pull_credentials_type = image_pull_credentials_type_;
     registry_credential = registry_credential_;
     certificate = certificate_;
     privileged_mode = privileged_mode_;
     environment_variables = environment_variables_;
     fleet = fleet_;
     compute_configuration = compute_configuration_;
     compute_type = compute_type_;
     image = image_;
     type_ = type__;
   }
    : project_environment)

let make_project_badge ?badge_request_url:(badge_request_url_ : string_ option)
    ?badge_enabled:(badge_enabled_ : boolean_ option) () =
  ({ badge_request_url = badge_request_url_; badge_enabled = badge_enabled_ } : project_badge)

let make_cloud_watch_logs_config ?stream_name:(stream_name_ : string_ option)
    ?group_name:(group_name_ : string_ option) ~status:(status_ : logs_config_status_type) () =
  ({ stream_name = stream_name_; group_name = group_name_; status = status_ }
    : cloud_watch_logs_config)

let make_s3_logs_config ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?location:(location_ : string_ option) ~status:(status_ : logs_config_status_type) () =
  ({
     bucket_owner_access = bucket_owner_access_;
     encryption_disabled = encryption_disabled_;
     location = location_;
     status = status_;
   }
    : s3_logs_config)

let make_logs_config ?s3_logs:(s3_logs_ : s3_logs_config option)
    ?cloud_watch_logs:(cloud_watch_logs_ : cloud_watch_logs_config option) () =
  ({ s3_logs = s3_logs_; cloud_watch_logs = cloud_watch_logs_ } : logs_config)

let make_project_file_system_location ?mount_options:(mount_options_ : string_ option)
    ?identifier:(identifier_ : string_ option) ?mount_point:(mount_point_ : string_ option)
    ?location:(location_ : string_ option) ?type_:(type__ : file_system_type option) () =
  ({
     mount_options = mount_options_;
     identifier = identifier_;
     mount_point = mount_point_;
     location = location_;
     type_ = type__;
   }
    : project_file_system_location)

let make_batch_restrictions ?fleets_allowed:(fleets_allowed_ : fleets_allowed option)
    ?compute_types_allowed:(compute_types_allowed_ : compute_types_allowed option)
    ?maximum_builds_allowed:(maximum_builds_allowed_ : wrapper_int option) () =
  ({
     fleets_allowed = fleets_allowed_;
     compute_types_allowed = compute_types_allowed_;
     maximum_builds_allowed = maximum_builds_allowed_;
   }
    : batch_restrictions)

let make_project_build_batch_config
    ?batch_report_mode:(batch_report_mode_ : batch_report_mode_type option)
    ?timeout_in_mins:(timeout_in_mins_ : wrapper_int option)
    ?restrictions:(restrictions_ : batch_restrictions option)
    ?combine_artifacts:(combine_artifacts_ : wrapper_boolean option)
    ?service_role:(service_role_ : non_empty_string option) () =
  ({
     batch_report_mode = batch_report_mode_;
     timeout_in_mins = timeout_in_mins_;
     restrictions = restrictions_;
     combine_artifacts = combine_artifacts_;
     service_role = service_role_;
   }
    : project_build_batch_config)

let make_project ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option)
    ?resource_access_role:(resource_access_role_ : non_empty_string option)
    ?public_project_alias:(public_project_alias_ : non_empty_string option)
    ?project_visibility:(project_visibility_ : project_visibility_type option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?logs_config:(logs_config_ : logs_config option) ?badge:(badge_ : project_badge option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?webhook:(webhook_ : webhook option)
    ?last_modified:(last_modified_ : timestamp option) ?created:(created_ : timestamp option)
    ?tags:(tags_ : tag_list option) ?encryption_key:(encryption_key_ : non_empty_string option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?service_role:(service_role_ : non_empty_string option)
    ?environment:(environment_ : project_environment option) ?cache:(cache_ : project_cache option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?artifacts:(artifacts_ : project_artifacts option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source:(source_ : project_source option)
    ?description:(description_ : project_description option) ?arn:(arn_ : string_ option)
    ?name:(name_ : project_name option) () =
  ({
     auto_retry_limit = auto_retry_limit_;
     resource_access_role = resource_access_role_;
     public_project_alias = public_project_alias_;
     project_visibility = project_visibility_;
     concurrent_build_limit = concurrent_build_limit_;
     build_batch_config = build_batch_config_;
     file_system_locations = file_system_locations_;
     logs_config = logs_config_;
     badge = badge_;
     vpc_config = vpc_config_;
     webhook = webhook_;
     last_modified = last_modified_;
     created = created_;
     tags = tags_;
     encryption_key = encryption_key_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     timeout_in_minutes = timeout_in_minutes_;
     service_role = service_role_;
     environment = environment_;
     cache = cache_;
     secondary_artifacts = secondary_artifacts_;
     artifacts = artifacts_;
     secondary_source_versions = secondary_source_versions_;
     source_version = source_version_;
     secondary_sources = secondary_sources_;
     source = source_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : project)

let make_update_project_output ?project:(project_ : project option) () =
  ({ project = project_ } : update_project_output)

let make_update_project_input ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?logs_config:(logs_config_ : logs_config option)
    ?badge_enabled:(badge_enabled_ : wrapper_boolean option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?tags:(tags_ : tag_list option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?service_role:(service_role_ : non_empty_string option)
    ?environment:(environment_ : project_environment option) ?cache:(cache_ : project_cache option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?artifacts:(artifacts_ : project_artifacts option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source:(source_ : project_source option)
    ?description:(description_ : project_description option) ~name:(name_ : non_empty_string) () =
  ({
     auto_retry_limit = auto_retry_limit_;
     concurrent_build_limit = concurrent_build_limit_;
     build_batch_config = build_batch_config_;
     file_system_locations = file_system_locations_;
     logs_config = logs_config_;
     badge_enabled = badge_enabled_;
     vpc_config = vpc_config_;
     tags = tags_;
     encryption_key = encryption_key_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     timeout_in_minutes = timeout_in_minutes_;
     service_role = service_role_;
     environment = environment_;
     cache = cache_;
     secondary_artifacts = secondary_artifacts_;
     artifacts = artifacts_;
     secondary_source_versions = secondary_source_versions_;
     source_version = source_version_;
     secondary_sources = secondary_sources_;
     source = source_;
     description = description_;
     name = name_;
   }
    : update_project_input)

let make_fleet_status ?message:(message_ : string_ option)
    ?context:(context_ : fleet_context_code option)
    ?status_code:(status_code_ : fleet_status_code option) () =
  ({ message = message_; context = context_; status_code = status_code_ } : fleet_status)

let make_target_tracking_scaling_configuration ?target_value:(target_value_ : wrapper_double option)
    ?metric_type:(metric_type_ : fleet_scaling_metric_type option) () =
  ({ target_value = target_value_; metric_type = metric_type_ }
    : target_tracking_scaling_configuration)

let make_scaling_configuration_output ?desired_capacity:(desired_capacity_ : fleet_capacity option)
    ?max_capacity:(max_capacity_ : fleet_capacity option)
    ?target_tracking_scaling_configs:
      (target_tracking_scaling_configs_ : target_tracking_scaling_configurations option)
    ?scaling_type:(scaling_type_ : fleet_scaling_type option) () =
  ({
     desired_capacity = desired_capacity_;
     max_capacity = max_capacity_;
     target_tracking_scaling_configs = target_tracking_scaling_configs_;
     scaling_type = scaling_type_;
   }
    : scaling_configuration_output)

let make_fleet_proxy_rule ~entities:(entities_ : fleet_proxy_rule_entities)
    ~effect_:(effect__ : fleet_proxy_rule_effect_type) ~type_:(type__ : fleet_proxy_rule_type) () =
  ({ entities = entities_; effect_ = effect__; type_ = type__ } : fleet_proxy_rule)

let make_proxy_configuration ?ordered_proxy_rules:(ordered_proxy_rules_ : fleet_proxy_rules option)
    ?default_behavior:(default_behavior_ : fleet_proxy_rule_behavior option) () =
  ({ ordered_proxy_rules = ordered_proxy_rules_; default_behavior = default_behavior_ }
    : proxy_configuration)

let make_fleet ?tags:(tags_ : tag_list option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?image_id:(image_id_ : non_empty_string option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_output option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?compute_type:(compute_type_ : compute_type option)
    ?environment_type:(environment_type_ : environment_type option)
    ?base_capacity:(base_capacity_ : fleet_capacity option) ?status:(status_ : fleet_status option)
    ?last_modified:(last_modified_ : timestamp option) ?created:(created_ : timestamp option)
    ?id:(id_ : non_empty_string option) ?name:(name_ : fleet_name option)
    ?arn:(arn_ : non_empty_string option) () =
  ({
     tags = tags_;
     fleet_service_role = fleet_service_role_;
     image_id = image_id_;
     proxy_configuration = proxy_configuration_;
     vpc_config = vpc_config_;
     overflow_behavior = overflow_behavior_;
     scaling_configuration = scaling_configuration_;
     compute_configuration = compute_configuration_;
     compute_type = compute_type_;
     environment_type = environment_type_;
     base_capacity = base_capacity_;
     status = status_;
     last_modified = last_modified_;
     created = created_;
     id = id_;
     name = name_;
     arn = arn_;
   }
    : fleet)

let make_update_fleet_output ?fleet:(fleet_ : fleet option) () =
  ({ fleet = fleet_ } : update_fleet_output)

let make_scaling_configuration_input ?max_capacity:(max_capacity_ : fleet_capacity option)
    ?target_tracking_scaling_configs:
      (target_tracking_scaling_configs_ : target_tracking_scaling_configurations option)
    ?scaling_type:(scaling_type_ : fleet_scaling_type option) () =
  ({
     max_capacity = max_capacity_;
     target_tracking_scaling_configs = target_tracking_scaling_configs_;
     scaling_type = scaling_type_;
   }
    : scaling_configuration_input)

let make_update_fleet_input ?tags:(tags_ : tag_list option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?image_id:(image_id_ : non_empty_string option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_input option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ?compute_type:(compute_type_ : compute_type option)
    ?environment_type:(environment_type_ : environment_type option)
    ?base_capacity:(base_capacity_ : fleet_capacity option) ~arn:(arn_ : non_empty_string) () =
  ({
     tags = tags_;
     fleet_service_role = fleet_service_role_;
     image_id = image_id_;
     proxy_configuration = proxy_configuration_;
     vpc_config = vpc_config_;
     overflow_behavior = overflow_behavior_;
     scaling_configuration = scaling_configuration_;
     compute_configuration = compute_configuration_;
     compute_type = compute_type_;
     environment_type = environment_type_;
     base_capacity = base_capacity_;
     arn = arn_;
   }
    : update_fleet_input)

let make_test_report_summary ~duration_in_nano_seconds:(duration_in_nano_seconds_ : wrapper_long)
    ~status_counts:(status_counts_ : report_status_counts) ~total:(total_ : wrapper_int) () =
  ({
     duration_in_nano_seconds = duration_in_nano_seconds_;
     status_counts = status_counts_;
     total = total_;
   }
    : test_report_summary)

let make_test_case ?test_suite_name:(test_suite_name_ : string_ option)
    ?expired:(expired_ : timestamp option) ?message:(message_ : string_ option)
    ?duration_in_nano_seconds:(duration_in_nano_seconds_ : wrapper_long option)
    ?status:(status_ : string_ option) ?name:(name_ : string_ option)
    ?prefix:(prefix_ : string_ option) ?test_raw_data_path:(test_raw_data_path_ : string_ option)
    ?report_arn:(report_arn_ : non_empty_string option) () =
  ({
     test_suite_name = test_suite_name_;
     expired = expired_;
     message = message_;
     duration_in_nano_seconds = duration_in_nano_seconds_;
     status = status_;
     name = name_;
     prefix = prefix_;
     test_raw_data_path = test_raw_data_path_;
     report_arn = report_arn_;
   }
    : test_case)

let make_test_case_filter ?keyword:(keyword_ : string_ option) ?status:(status_ : string_ option) ()
    =
  ({ keyword = keyword_; status = status_ } : test_case_filter)

let make_phase_context ?message:(message_ : string_ option)
    ?status_code:(status_code_ : string_ option) () =
  ({ message = message_; status_code = status_code_ } : phase_context)

let make_sandbox_session_phase ?contexts:(contexts_ : phase_contexts option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?phase_status:(phase_status_ : status_type option) ?phase_type:(phase_type_ : string_ option) ()
    =
  ({
     contexts = contexts_;
     duration_in_seconds = duration_in_seconds_;
     end_time = end_time_;
     start_time = start_time_;
     phase_status = phase_status_;
     phase_type = phase_type_;
   }
    : sandbox_session_phase)

let make_logs_location ?s3_logs:(s3_logs_ : s3_logs_config option)
    ?cloud_watch_logs:(cloud_watch_logs_ : cloud_watch_logs_config option)
    ?s3_logs_arn:(s3_logs_arn_ : string_ option)
    ?cloud_watch_logs_arn:(cloud_watch_logs_arn_ : string_ option)
    ?s3_deep_link:(s3_deep_link_ : string_ option) ?deep_link:(deep_link_ : string_ option)
    ?stream_name:(stream_name_ : string_ option) ?group_name:(group_name_ : string_ option) () =
  ({
     s3_logs = s3_logs_;
     cloud_watch_logs = cloud_watch_logs_;
     s3_logs_arn = s3_logs_arn_;
     cloud_watch_logs_arn = cloud_watch_logs_arn_;
     s3_deep_link = s3_deep_link_;
     deep_link = deep_link_;
     stream_name = stream_name_;
     group_name = group_name_;
   }
    : logs_location)

let make_network_interface ?network_interface_id:(network_interface_id_ : non_empty_string option)
    ?subnet_id:(subnet_id_ : non_empty_string option) () =
  ({ network_interface_id = network_interface_id_; subnet_id = subnet_id_ } : network_interface)

let make_sandbox_session ?network_interface:(network_interface_ : network_interface option)
    ?logs:(logs_ : logs_location option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?phases:(phases_ : sandbox_session_phases option)
    ?current_phase:(current_phase_ : string_ option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?status:(status_ : string_ option)
    ?id:(id_ : non_empty_string option) () =
  ({
     network_interface = network_interface_;
     logs = logs_;
     resolved_source_version = resolved_source_version_;
     phases = phases_;
     current_phase = current_phase_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     id = id_;
   }
    : sandbox_session)

let make_sandbox ?current_session:(current_session_ : sandbox_session option)
    ?service_role:(service_role_ : non_empty_string option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?log_config:(log_config_ : logs_config option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?timeout_in_minutes:(timeout_in_minutes_ : wrapper_int option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?environment:(environment_ : project_environment option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source_version:(source_version_ : non_empty_string option)
    ?source:(source_ : project_source option) ?status:(status_ : string_ option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?request_time:(request_time_ : timestamp option)
    ?project_name:(project_name_ : non_empty_string option) ?arn:(arn_ : non_empty_string option)
    ?id:(id_ : non_empty_string option) () =
  ({
     current_session = current_session_;
     service_role = service_role_;
     encryption_key = encryption_key_;
     log_config = log_config_;
     vpc_config = vpc_config_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     timeout_in_minutes = timeout_in_minutes_;
     file_system_locations = file_system_locations_;
     environment = environment_;
     secondary_source_versions = secondary_source_versions_;
     secondary_sources = secondary_sources_;
     source_version = source_version_;
     source = source_;
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     request_time = request_time_;
     project_name = project_name_;
     arn = arn_;
     id = id_;
   }
    : sandbox)

let make_stop_sandbox_output ?sandbox:(sandbox_ : sandbox option) () =
  ({ sandbox = sandbox_ } : stop_sandbox_output)

let make_stop_sandbox_input ~id:(id_ : non_empty_string) () = ({ id = id_ } : stop_sandbox_input)

let make_build_phase ?contexts:(contexts_ : phase_contexts option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?phase_status:(phase_status_ : status_type option)
    ?phase_type:(phase_type_ : build_phase_type option) () =
  ({
     contexts = contexts_;
     duration_in_seconds = duration_in_seconds_;
     end_time = end_time_;
     start_time = start_time_;
     phase_status = phase_status_;
     phase_type = phase_type_;
   }
    : build_phase)

let make_build_artifacts ?bucket_owner_access:(bucket_owner_access_ : bucket_owner_access option)
    ?artifact_identifier:(artifact_identifier_ : string_ option)
    ?encryption_disabled:(encryption_disabled_ : wrapper_boolean option)
    ?override_artifact_name:(override_artifact_name_ : wrapper_boolean option)
    ?md5sum:(md5sum_ : string_ option) ?sha256sum:(sha256sum_ : string_ option)
    ?location:(location_ : string_ option) () =
  ({
     bucket_owner_access = bucket_owner_access_;
     artifact_identifier = artifact_identifier_;
     encryption_disabled = encryption_disabled_;
     override_artifact_name = override_artifact_name_;
     md5sum = md5sum_;
     sha256sum = sha256sum_;
     location = location_;
   }
    : build_artifacts)

let make_exported_environment_variable ?value:(value_ : string_ option)
    ?name:(name_ : non_empty_string option) () =
  ({ value = value_; name = name_ } : exported_environment_variable)

let make_debug_session ?session_target:(session_target_ : non_empty_string option)
    ?session_enabled:(session_enabled_ : wrapper_boolean option) () =
  ({ session_target = session_target_; session_enabled = session_enabled_ } : debug_session)

let make_auto_retry_config ?previous_auto_retry:(previous_auto_retry_ : string_ option)
    ?next_auto_retry:(next_auto_retry_ : string_ option)
    ?auto_retry_number:(auto_retry_number_ : wrapper_int option)
    ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option) () =
  ({
     previous_auto_retry = previous_auto_retry_;
     next_auto_retry = next_auto_retry_;
     auto_retry_number = auto_retry_number_;
     auto_retry_limit = auto_retry_limit_;
   }
    : auto_retry_config)

let make_build ?auto_retry_config:(auto_retry_config_ : auto_retry_config option)
    ?build_batch_arn:(build_batch_arn_ : string_ option)
    ?debug_session:(debug_session_ : debug_session option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?report_arns:(report_arns_ : build_report_arns option)
    ?exported_environment_variables:
      (exported_environment_variables_ : exported_environment_variables option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?network_interface:(network_interface_ : network_interface option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?initiator:(initiator_ : string_ option)
    ?build_complete:(build_complete_ : boolean_ option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?timeout_in_minutes:(timeout_in_minutes_ : wrapper_int option)
    ?logs:(logs_ : logs_location option) ?service_role:(service_role_ : non_empty_string option)
    ?environment:(environment_ : project_environment option) ?cache:(cache_ : project_cache option)
    ?secondary_artifacts:(secondary_artifacts_ : build_artifacts_list option)
    ?artifacts:(artifacts_ : build_artifacts option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source:(source_ : project_source option) ?phases:(phases_ : build_phases option)
    ?project_name:(project_name_ : non_empty_string option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?source_version:(source_version_ : non_empty_string option)
    ?build_status:(build_status_ : status_type option)
    ?current_phase:(current_phase_ : string_ option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?build_number:(build_number_ : wrapper_long option)
    ?arn:(arn_ : non_empty_string option) ?id:(id_ : non_empty_string option) () =
  ({
     auto_retry_config = auto_retry_config_;
     build_batch_arn = build_batch_arn_;
     debug_session = debug_session_;
     file_system_locations = file_system_locations_;
     report_arns = report_arns_;
     exported_environment_variables = exported_environment_variables_;
     encryption_key = encryption_key_;
     network_interface = network_interface_;
     vpc_config = vpc_config_;
     initiator = initiator_;
     build_complete = build_complete_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     timeout_in_minutes = timeout_in_minutes_;
     logs = logs_;
     service_role = service_role_;
     environment = environment_;
     cache = cache_;
     secondary_artifacts = secondary_artifacts_;
     artifacts = artifacts_;
     secondary_source_versions = secondary_source_versions_;
     secondary_sources = secondary_sources_;
     source = source_;
     phases = phases_;
     project_name = project_name_;
     resolved_source_version = resolved_source_version_;
     source_version = source_version_;
     build_status = build_status_;
     current_phase = current_phase_;
     end_time = end_time_;
     start_time = start_time_;
     build_number = build_number_;
     arn = arn_;
     id = id_;
   }
    : build)

let make_stop_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : stop_build_output)

let make_stop_build_input ~id:(id_ : non_empty_string) () = ({ id = id_ } : stop_build_input)

let make_build_batch_phase ?contexts:(contexts_ : phase_contexts option)
    ?duration_in_seconds:(duration_in_seconds_ : wrapper_long option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?phase_status:(phase_status_ : status_type option)
    ?phase_type:(phase_type_ : build_batch_phase_type option) () =
  ({
     contexts = contexts_;
     duration_in_seconds = duration_in_seconds_;
     end_time = end_time_;
     start_time = start_time_;
     phase_status = phase_status_;
     phase_type = phase_type_;
   }
    : build_batch_phase)

let make_resolved_artifact ?identifier:(identifier_ : string_ option)
    ?location:(location_ : string_ option) ?type_:(type__ : artifacts_type option) () =
  ({ identifier = identifier_; location = location_; type_ = type__ } : resolved_artifact)

let make_build_summary
    ?secondary_artifacts:(secondary_artifacts_ : resolved_secondary_artifacts option)
    ?primary_artifact:(primary_artifact_ : resolved_artifact option)
    ?build_status:(build_status_ : status_type option)
    ?requested_on:(requested_on_ : timestamp option) ?arn:(arn_ : string_ option) () =
  ({
     secondary_artifacts = secondary_artifacts_;
     primary_artifact = primary_artifact_;
     build_status = build_status_;
     requested_on = requested_on_;
     arn = arn_;
   }
    : build_summary)

let make_build_group ?prior_build_summary_list:(prior_build_summary_list_ : build_summaries option)
    ?current_build_summary:(current_build_summary_ : build_summary option)
    ?ignore_failure:(ignore_failure_ : boolean_ option)
    ?depends_on:(depends_on_ : identifiers option) ?identifier:(identifier_ : string_ option) () =
  ({
     prior_build_summary_list = prior_build_summary_list_;
     current_build_summary = current_build_summary_;
     ignore_failure = ignore_failure_;
     depends_on = depends_on_;
     identifier = identifier_;
   }
    : build_group)

let make_build_batch ?report_arns:(report_arns_ : build_report_arns option)
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ?build_groups:(build_groups_ : build_groups option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?build_batch_number:(build_batch_number_ : wrapper_long option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?initiator:(initiator_ : string_ option)
    ?complete:(complete_ : boolean_ option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : wrapper_int option)
    ?build_timeout_in_minutes:(build_timeout_in_minutes_ : wrapper_int option)
    ?log_config:(log_config_ : logs_config option)
    ?service_role:(service_role_ : non_empty_string option)
    ?environment:(environment_ : project_environment option) ?cache:(cache_ : project_cache option)
    ?secondary_artifacts:(secondary_artifacts_ : build_artifacts_list option)
    ?artifacts:(artifacts_ : build_artifacts option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?source:(source_ : project_source option) ?phases:(phases_ : build_batch_phases option)
    ?project_name:(project_name_ : non_empty_string option)
    ?resolved_source_version:(resolved_source_version_ : non_empty_string option)
    ?source_version:(source_version_ : non_empty_string option)
    ?build_batch_status:(build_batch_status_ : status_type option)
    ?current_phase:(current_phase_ : string_ option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?arn:(arn_ : non_empty_string option)
    ?id:(id_ : non_empty_string option) () =
  ({
     report_arns = report_arns_;
     debug_session_enabled = debug_session_enabled_;
     build_groups = build_groups_;
     build_batch_config = build_batch_config_;
     file_system_locations = file_system_locations_;
     build_batch_number = build_batch_number_;
     encryption_key = encryption_key_;
     vpc_config = vpc_config_;
     initiator = initiator_;
     complete = complete_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     build_timeout_in_minutes = build_timeout_in_minutes_;
     log_config = log_config_;
     service_role = service_role_;
     environment = environment_;
     cache = cache_;
     secondary_artifacts = secondary_artifacts_;
     artifacts = artifacts_;
     secondary_source_versions = secondary_source_versions_;
     secondary_sources = secondary_sources_;
     source = source_;
     phases = phases_;
     project_name = project_name_;
     resolved_source_version = resolved_source_version_;
     source_version = source_version_;
     build_batch_status = build_batch_status_;
     current_phase = current_phase_;
     end_time = end_time_;
     start_time = start_time_;
     arn = arn_;
     id = id_;
   }
    : build_batch)

let make_stop_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : stop_build_batch_output)

let make_stop_build_batch_input ~id:(id_ : non_empty_string) () =
  ({ id = id_ } : stop_build_batch_input)

let make_start_sandbox_output ?sandbox:(sandbox_ : sandbox option) () =
  ({ sandbox = sandbox_ } : start_sandbox_output)

let make_start_sandbox_input ?idempotency_token:(idempotency_token_ : sensitive_string option)
    ?project_name:(project_name_ : non_empty_string option) () =
  ({ idempotency_token = idempotency_token_; project_name = project_name_ } : start_sandbox_input)

let make_ssm_session ?stream_url:(stream_url_ : string_ option)
    ?token_value:(token_value_ : string_ option) ?session_id:(session_id_ : string_ option) () =
  ({ stream_url = stream_url_; token_value = token_value_; session_id = session_id_ } : ssm_session)

let make_start_sandbox_connection_output ?ssm_session:(ssm_session_ : ssm_session option) () =
  ({ ssm_session = ssm_session_ } : start_sandbox_connection_output)

let make_start_sandbox_connection_input ~sandbox_id:(sandbox_id_ : non_empty_string) () =
  ({ sandbox_id = sandbox_id_ } : start_sandbox_connection_input)

let make_command_execution ?sandbox_arn:(sandbox_arn_ : non_empty_string option)
    ?logs:(logs_ : logs_location option)
    ?standard_err_content:(standard_err_content_ : sensitive_non_empty_string option)
    ?standard_output_content:(standard_output_content_ : sensitive_non_empty_string option)
    ?exit_code:(exit_code_ : non_empty_string option) ?type_:(type__ : command_type option)
    ?command:(command_ : sensitive_non_empty_string option)
    ?status:(status_ : non_empty_string option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?submit_time:(submit_time_ : timestamp option)
    ?sandbox_id:(sandbox_id_ : non_empty_string option) ?id:(id_ : non_empty_string option) () =
  ({
     sandbox_arn = sandbox_arn_;
     logs = logs_;
     standard_err_content = standard_err_content_;
     standard_output_content = standard_output_content_;
     exit_code = exit_code_;
     type_ = type__;
     command = command_;
     status = status_;
     end_time = end_time_;
     start_time = start_time_;
     submit_time = submit_time_;
     sandbox_id = sandbox_id_;
     id = id_;
   }
    : command_execution)

let make_start_command_execution_output
    ?command_execution:(command_execution_ : command_execution option) () =
  ({ command_execution = command_execution_ } : start_command_execution_output)

let make_start_command_execution_input ?type_:(type__ : command_type option)
    ~command:(command_ : sensitive_non_empty_string) ~sandbox_id:(sandbox_id_ : non_empty_string) ()
    =
  ({ type_ = type__; command = command_; sandbox_id = sandbox_id_ } : start_command_execution_input)

let make_start_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : start_build_output)

let make_start_build_input ?host_kernel_override:(host_kernel_override_ : host_kernel option)
    ?auto_retry_limit_override:(auto_retry_limit_override_ : wrapper_int option)
    ?fleet_override:(fleet_override_ : project_fleet option)
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ?image_pull_credentials_type_override:
      (image_pull_credentials_type_override_ : image_pull_credentials_type option)
    ?registry_credential_override:(registry_credential_override_ : registry_credential option)
    ?logs_config_override:(logs_config_override_ : logs_config option)
    ?idempotency_token:(idempotency_token_ : string_ option)
    ?encryption_key_override:(encryption_key_override_ : non_empty_string option)
    ?queued_timeout_in_minutes_override:(queued_timeout_in_minutes_override_ : time_out option)
    ?timeout_in_minutes_override:(timeout_in_minutes_override_ : build_time_out option)
    ?privileged_mode_override:(privileged_mode_override_ : wrapper_boolean option)
    ?service_role_override:(service_role_override_ : non_empty_string option)
    ?cache_override:(cache_override_ : project_cache option)
    ?certificate_override:(certificate_override_ : string_ option)
    ?compute_type_override:(compute_type_override_ : compute_type option)
    ?image_override:(image_override_ : non_empty_string option)
    ?environment_type_override:(environment_type_override_ : environment_type option)
    ?build_status_config_override:(build_status_config_override_ : build_status_config option)
    ?report_build_status_override:(report_build_status_override_ : wrapper_boolean option)
    ?insecure_ssl_override:(insecure_ssl_override_ : wrapper_boolean option)
    ?buildspec_override:(buildspec_override_ : string_ option)
    ?git_submodules_config_override:(git_submodules_config_override_ : git_submodules_config option)
    ?git_clone_depth_override:(git_clone_depth_override_ : git_clone_depth option)
    ?source_auth_override:(source_auth_override_ : source_auth option)
    ?source_location_override:(source_location_override_ : string_ option)
    ?source_type_override:(source_type_override_ : source_type option)
    ?environment_variables_override:(environment_variables_override_ : environment_variables option)
    ?secondary_artifacts_override:(secondary_artifacts_override_ : project_artifacts_list option)
    ?artifacts_override:(artifacts_override_ : project_artifacts option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_sources_version_override:
      (secondary_sources_version_override_ : project_secondary_source_versions option)
    ?secondary_sources_override:(secondary_sources_override_ : project_sources option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({
     host_kernel_override = host_kernel_override_;
     auto_retry_limit_override = auto_retry_limit_override_;
     fleet_override = fleet_override_;
     debug_session_enabled = debug_session_enabled_;
     image_pull_credentials_type_override = image_pull_credentials_type_override_;
     registry_credential_override = registry_credential_override_;
     logs_config_override = logs_config_override_;
     idempotency_token = idempotency_token_;
     encryption_key_override = encryption_key_override_;
     queued_timeout_in_minutes_override = queued_timeout_in_minutes_override_;
     timeout_in_minutes_override = timeout_in_minutes_override_;
     privileged_mode_override = privileged_mode_override_;
     service_role_override = service_role_override_;
     cache_override = cache_override_;
     certificate_override = certificate_override_;
     compute_type_override = compute_type_override_;
     image_override = image_override_;
     environment_type_override = environment_type_override_;
     build_status_config_override = build_status_config_override_;
     report_build_status_override = report_build_status_override_;
     insecure_ssl_override = insecure_ssl_override_;
     buildspec_override = buildspec_override_;
     git_submodules_config_override = git_submodules_config_override_;
     git_clone_depth_override = git_clone_depth_override_;
     source_auth_override = source_auth_override_;
     source_location_override = source_location_override_;
     source_type_override = source_type_override_;
     environment_variables_override = environment_variables_override_;
     secondary_artifacts_override = secondary_artifacts_override_;
     artifacts_override = artifacts_override_;
     source_version = source_version_;
     secondary_sources_version_override = secondary_sources_version_override_;
     secondary_sources_override = secondary_sources_override_;
     project_name = project_name_;
   }
    : start_build_input)

let make_start_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : start_build_batch_output)

let make_start_build_batch_input
    ?debug_session_enabled:(debug_session_enabled_ : wrapper_boolean option)
    ?build_batch_config_override:(build_batch_config_override_ : project_build_batch_config option)
    ?image_pull_credentials_type_override:
      (image_pull_credentials_type_override_ : image_pull_credentials_type option)
    ?registry_credential_override:(registry_credential_override_ : registry_credential option)
    ?logs_config_override:(logs_config_override_ : logs_config option)
    ?idempotency_token:(idempotency_token_ : string_ option)
    ?encryption_key_override:(encryption_key_override_ : non_empty_string option)
    ?queued_timeout_in_minutes_override:(queued_timeout_in_minutes_override_ : time_out option)
    ?build_timeout_in_minutes_override:(build_timeout_in_minutes_override_ : build_time_out option)
    ?privileged_mode_override:(privileged_mode_override_ : wrapper_boolean option)
    ?service_role_override:(service_role_override_ : non_empty_string option)
    ?cache_override:(cache_override_ : project_cache option)
    ?certificate_override:(certificate_override_ : string_ option)
    ?compute_type_override:(compute_type_override_ : compute_type option)
    ?image_override:(image_override_ : non_empty_string option)
    ?environment_type_override:(environment_type_override_ : environment_type option)
    ?report_build_batch_status_override:
      (report_build_batch_status_override_ : wrapper_boolean option)
    ?insecure_ssl_override:(insecure_ssl_override_ : wrapper_boolean option)
    ?buildspec_override:(buildspec_override_ : string_ option)
    ?git_submodules_config_override:(git_submodules_config_override_ : git_submodules_config option)
    ?git_clone_depth_override:(git_clone_depth_override_ : git_clone_depth option)
    ?source_auth_override:(source_auth_override_ : source_auth option)
    ?source_location_override:(source_location_override_ : string_ option)
    ?source_type_override:(source_type_override_ : source_type option)
    ?environment_variables_override:(environment_variables_override_ : environment_variables option)
    ?secondary_artifacts_override:(secondary_artifacts_override_ : project_artifacts_list option)
    ?artifacts_override:(artifacts_override_ : project_artifacts option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_sources_version_override:
      (secondary_sources_version_override_ : project_secondary_source_versions option)
    ?secondary_sources_override:(secondary_sources_override_ : project_sources option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({
     debug_session_enabled = debug_session_enabled_;
     build_batch_config_override = build_batch_config_override_;
     image_pull_credentials_type_override = image_pull_credentials_type_override_;
     registry_credential_override = registry_credential_override_;
     logs_config_override = logs_config_override_;
     idempotency_token = idempotency_token_;
     encryption_key_override = encryption_key_override_;
     queued_timeout_in_minutes_override = queued_timeout_in_minutes_override_;
     build_timeout_in_minutes_override = build_timeout_in_minutes_override_;
     privileged_mode_override = privileged_mode_override_;
     service_role_override = service_role_override_;
     cache_override = cache_override_;
     certificate_override = certificate_override_;
     compute_type_override = compute_type_override_;
     image_override = image_override_;
     environment_type_override = environment_type_override_;
     report_build_batch_status_override = report_build_batch_status_override_;
     insecure_ssl_override = insecure_ssl_override_;
     buildspec_override = buildspec_override_;
     git_submodules_config_override = git_submodules_config_override_;
     git_clone_depth_override = git_clone_depth_override_;
     source_auth_override = source_auth_override_;
     source_location_override = source_location_override_;
     source_type_override = source_type_override_;
     environment_variables_override = environment_variables_override_;
     secondary_artifacts_override = secondary_artifacts_override_;
     artifacts_override = artifacts_override_;
     source_version = source_version_;
     secondary_sources_version_override = secondary_sources_version_override_;
     secondary_sources_override = secondary_sources_override_;
     project_name = project_name_;
   }
    : start_build_batch_input)

let make_source_credentials_info ?resource:(resource_ : string_ option)
    ?auth_type:(auth_type_ : auth_type option) ?server_type:(server_type_ : server_type option)
    ?arn:(arn_ : non_empty_string option) () =
  ({ resource = resource_; auth_type = auth_type_; server_type = server_type_; arn = arn_ }
    : source_credentials_info)

let make_retry_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : retry_build_output)

let make_retry_build_input ?idempotency_token:(idempotency_token_ : string_ option)
    ?id:(id_ : non_empty_string option) () =
  ({ idempotency_token = idempotency_token_; id = id_ } : retry_build_input)

let make_retry_build_batch_output ?build_batch:(build_batch_ : build_batch option) () =
  ({ build_batch = build_batch_ } : retry_build_batch_output)

let make_retry_build_batch_input ?retry_type:(retry_type_ : retry_build_batch_type option)
    ?idempotency_token:(idempotency_token_ : string_ option) ?id:(id_ : non_empty_string option) ()
    =
  ({ retry_type = retry_type_; idempotency_token = idempotency_token_; id = id_ }
    : retry_build_batch_input)

let make_code_coverage_report_summary ?branches_missed:(branches_missed_ : non_negative_int option)
    ?branches_covered:(branches_covered_ : non_negative_int option)
    ?branch_coverage_percentage:(branch_coverage_percentage_ : percentage option)
    ?lines_missed:(lines_missed_ : non_negative_int option)
    ?lines_covered:(lines_covered_ : non_negative_int option)
    ?line_coverage_percentage:(line_coverage_percentage_ : percentage option) () =
  ({
     branches_missed = branches_missed_;
     branches_covered = branches_covered_;
     branch_coverage_percentage = branch_coverage_percentage_;
     lines_missed = lines_missed_;
     lines_covered = lines_covered_;
     line_coverage_percentage = line_coverage_percentage_;
   }
    : code_coverage_report_summary)

let make_report
    ?code_coverage_summary:(code_coverage_summary_ : code_coverage_report_summary option)
    ?test_summary:(test_summary_ : test_report_summary option)
    ?truncated:(truncated_ : wrapper_boolean option)
    ?export_config:(export_config_ : report_export_config option)
    ?expired:(expired_ : timestamp option) ?created:(created_ : timestamp option)
    ?status:(status_ : report_status_type option) ?execution_id:(execution_id_ : string_ option)
    ?report_group_arn:(report_group_arn_ : non_empty_string option) ?name:(name_ : string_ option)
    ?type_:(type__ : report_type option) ?arn:(arn_ : non_empty_string option) () =
  ({
     code_coverage_summary = code_coverage_summary_;
     test_summary = test_summary_;
     truncated = truncated_;
     export_config = export_config_;
     expired = expired_;
     created = created_;
     status = status_;
     execution_id = execution_id_;
     report_group_arn = report_group_arn_;
     name = name_;
     type_ = type__;
     arn = arn_;
   }
    : report)

let make_report_with_raw_data ?data:(data_ : string_ option)
    ?report_arn:(report_arn_ : non_empty_string option) () =
  ({ data = data_; report_arn = report_arn_ } : report_with_raw_data)

let make_report_group_trend_stats ?min:(min_ : string_ option) ?max:(max_ : string_ option)
    ?average:(average_ : string_ option) () =
  ({ min = min_; max = max_; average = average_ } : report_group_trend_stats)

let make_report_filter ?status:(status_ : report_status_type option) () =
  ({ status = status_ } : report_filter)

let make_put_resource_policy_output ?resource_arn:(resource_arn_ : non_empty_string option) () =
  ({ resource_arn = resource_arn_ } : put_resource_policy_output)

let make_put_resource_policy_input ~resource_arn:(resource_arn_ : non_empty_string)
    ~policy:(policy_ : non_empty_string) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_input)

let make_list_source_credentials_output
    ?source_credentials_infos:(source_credentials_infos_ : source_credentials_infos option) () =
  ({ source_credentials_infos = source_credentials_infos_ } : list_source_credentials_output)

let make_list_source_credentials_input () = (() : unit)

let make_list_shared_report_groups_output ?report_groups:(report_groups_ : report_group_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ report_groups = report_groups_; next_token = next_token_ } : list_shared_report_groups_output)

let make_list_shared_report_groups_input ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : string_ option)
    ?sort_by:(sort_by_ : shared_resource_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_shared_report_groups_input)

let make_list_shared_projects_output ?projects:(projects_ : project_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ projects = projects_; next_token = next_token_ } : list_shared_projects_output)

let make_list_shared_projects_input ?next_token:(next_token_ : non_empty_string option)
    ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : shared_resource_sort_by_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
   }
    : list_shared_projects_input)

let make_list_sandboxes_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : sandbox_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_sandboxes_output)

let make_list_sandboxes_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; sort_order = sort_order_; max_results = max_results_ }
    : list_sandboxes_input)

let make_list_sandboxes_for_project_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : sandbox_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_sandboxes_for_project_output)

let make_list_sandboxes_for_project_input ?next_token:(next_token_ : sensitive_string option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ~project_name:(project_name_ : non_empty_string)
    () =
  ({
     next_token = next_token_;
     sort_order = sort_order_;
     max_results = max_results_;
     project_name = project_name_;
   }
    : list_sandboxes_for_project_input)

let make_list_reports_output ?reports:(reports_ : report_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ reports = reports_; next_token = next_token_ } : list_reports_output)

let make_list_reports_input ?filter:(filter_ : report_filter option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     sort_order = sort_order_;
   }
    : list_reports_input)

let make_list_reports_for_report_group_output ?reports:(reports_ : report_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ reports = reports_; next_token = next_token_ } : list_reports_for_report_group_output)

let make_list_reports_for_report_group_input ?filter:(filter_ : report_filter option)
    ?max_results:(max_results_ : page_size option)
    ?sort_order:(sort_order_ : sort_order_type option) ?next_token:(next_token_ : string_ option)
    ~report_group_arn:(report_group_arn_ : string_) () =
  ({
     filter = filter_;
     max_results = max_results_;
     sort_order = sort_order_;
     next_token = next_token_;
     report_group_arn = report_group_arn_;
   }
    : list_reports_for_report_group_input)

let make_list_report_groups_output ?report_groups:(report_groups_ : report_group_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ report_groups = report_groups_; next_token = next_token_ } : list_report_groups_output)

let make_list_report_groups_input ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : string_ option)
    ?sort_by:(sort_by_ : report_group_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_report_groups_input)

let make_list_projects_output ?projects:(projects_ : project_names option)
    ?next_token:(next_token_ : string_ option) () =
  ({ projects = projects_; next_token = next_token_ } : list_projects_output)

let make_list_projects_input ?next_token:(next_token_ : non_empty_string option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?sort_by:(sort_by_ : project_sort_by_type option) () =
  ({ next_token = next_token_; sort_order = sort_order_; sort_by = sort_by_ } : list_projects_input)

let make_list_fleets_output ?fleets:(fleets_ : fleet_arns option)
    ?next_token:(next_token_ : string_ option) () =
  ({ fleets = fleets_; next_token = next_token_ } : list_fleets_output)

let make_list_fleets_input ?sort_by:(sort_by_ : fleet_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : sensitive_string option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_fleets_input)

let make_environment_image ?versions:(versions_ : image_versions option)
    ?description:(description_ : string_ option) ?name:(name_ : string_ option) () =
  ({ versions = versions_; description = description_; name = name_ } : environment_image)

let make_environment_language ?images:(images_ : environment_images option)
    ?language:(language_ : language_type option) () =
  ({ images = images_; language = language_ } : environment_language)

let make_environment_platform ?languages:(languages_ : environment_languages option)
    ?platform:(platform_ : platform_type option) () =
  ({ languages = languages_; platform = platform_ } : environment_platform)

let make_list_curated_environment_images_output
    ?platforms:(platforms_ : environment_platforms option) () =
  ({ platforms = platforms_ } : list_curated_environment_images_output)

let make_list_curated_environment_images_input () = (() : unit)

let make_list_command_executions_for_sandbox_output ?next_token:(next_token_ : string_ option)
    ?command_executions:(command_executions_ : command_executions option) () =
  ({ next_token = next_token_; command_executions = command_executions_ }
    : list_command_executions_for_sandbox_output)

let make_list_command_executions_for_sandbox_input
    ?next_token:(next_token_ : sensitive_string option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ~sandbox_id:(sandbox_id_ : non_empty_string) () =
  ({
     next_token = next_token_;
     sort_order = sort_order_;
     max_results = max_results_;
     sandbox_id = sandbox_id_;
   }
    : list_command_executions_for_sandbox_input)

let make_list_builds_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : build_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_builds_output)

let make_list_builds_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option) () =
  ({ next_token = next_token_; sort_order = sort_order_ } : list_builds_input)

let make_list_builds_for_project_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : build_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_builds_for_project_output)

let make_list_builds_for_project_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ~project_name:(project_name_ : non_empty_string) () =
  ({ next_token = next_token_; sort_order = sort_order_; project_name = project_name_ }
    : list_builds_for_project_input)

let make_list_build_batches_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : build_batch_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_build_batches_output)

let make_build_batch_filter ?status:(status_ : status_type option) () =
  ({ status = status_ } : build_batch_filter)

let make_list_build_batches_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ?filter:(filter_ : build_batch_filter option) ()
    =
  ({
     next_token = next_token_;
     sort_order = sort_order_;
     max_results = max_results_;
     filter = filter_;
   }
    : list_build_batches_input)

let make_list_build_batches_for_project_output ?next_token:(next_token_ : string_ option)
    ?ids:(ids_ : build_batch_ids option) () =
  ({ next_token = next_token_; ids = ids_ } : list_build_batches_for_project_output)

let make_list_build_batches_for_project_input ?next_token:(next_token_ : string_ option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ?filter:(filter_ : build_batch_filter option)
    ?project_name:(project_name_ : non_empty_string option) () =
  ({
     next_token = next_token_;
     sort_order = sort_order_;
     max_results = max_results_;
     filter = filter_;
     project_name = project_name_;
   }
    : list_build_batches_for_project_input)

let make_invalidate_project_cache_output () = (() : unit)

let make_invalidate_project_cache_input ~project_name:(project_name_ : non_empty_string) () =
  ({ project_name = project_name_ } : invalidate_project_cache_input)

let make_import_source_credentials_output ?arn:(arn_ : non_empty_string option) () =
  ({ arn = arn_ } : import_source_credentials_output)

let make_import_source_credentials_input
    ?should_overwrite:(should_overwrite_ : wrapper_boolean option)
    ?username:(username_ : non_empty_string option) ~auth_type:(auth_type_ : auth_type)
    ~server_type:(server_type_ : server_type) ~token:(token_ : sensitive_non_empty_string) () =
  ({
     should_overwrite = should_overwrite_;
     auth_type = auth_type_;
     server_type = server_type_;
     token = token_;
     username = username_;
   }
    : import_source_credentials_input)

let make_get_resource_policy_output ?policy:(policy_ : non_empty_string option) () =
  ({ policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : non_empty_string) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_get_report_group_trend_output
    ?raw_data:(raw_data_ : report_group_trend_raw_data_list option)
    ?stats:(stats_ : report_group_trend_stats option) () =
  ({ raw_data = raw_data_; stats = stats_ } : get_report_group_trend_output)

let make_get_report_group_trend_input ?num_of_reports:(num_of_reports_ : page_size option)
    ~trend_field:(trend_field_ : report_group_trend_field_type)
    ~report_group_arn:(report_group_arn_ : non_empty_string) () =
  ({
     trend_field = trend_field_;
     num_of_reports = num_of_reports_;
     report_group_arn = report_group_arn_;
   }
    : get_report_group_trend_input)

let make_describe_test_cases_output ?test_cases:(test_cases_ : test_cases option)
    ?next_token:(next_token_ : string_ option) () =
  ({ test_cases = test_cases_; next_token = next_token_ } : describe_test_cases_output)

let make_describe_test_cases_input ?filter:(filter_ : test_case_filter option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ~report_arn:(report_arn_ : string_) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     report_arn = report_arn_;
   }
    : describe_test_cases_input)

let make_code_coverage ?expired:(expired_ : timestamp option)
    ?branches_missed:(branches_missed_ : non_negative_int option)
    ?branches_covered:(branches_covered_ : non_negative_int option)
    ?branch_coverage_percentage:(branch_coverage_percentage_ : percentage option)
    ?lines_missed:(lines_missed_ : non_negative_int option)
    ?lines_covered:(lines_covered_ : non_negative_int option)
    ?line_coverage_percentage:(line_coverage_percentage_ : percentage option)
    ?file_path:(file_path_ : non_empty_string option)
    ?report_ar_n:(report_ar_n_ : non_empty_string option) ?id:(id_ : non_empty_string option) () =
  ({
     expired = expired_;
     branches_missed = branches_missed_;
     branches_covered = branches_covered_;
     branch_coverage_percentage = branch_coverage_percentage_;
     lines_missed = lines_missed_;
     lines_covered = lines_covered_;
     line_coverage_percentage = line_coverage_percentage_;
     file_path = file_path_;
     report_ar_n = report_ar_n_;
     id = id_;
   }
    : code_coverage)

let make_describe_code_coverages_output ?code_coverages:(code_coverages_ : code_coverages option)
    ?next_token:(next_token_ : string_ option) () =
  ({ code_coverages = code_coverages_; next_token = next_token_ } : describe_code_coverages_output)

let make_describe_code_coverages_input
    ?max_line_coverage_percentage:(max_line_coverage_percentage_ : percentage option)
    ?min_line_coverage_percentage:(min_line_coverage_percentage_ : percentage option)
    ?sort_by:(sort_by_ : report_code_coverage_sort_by_type option)
    ?sort_order:(sort_order_ : sort_order_type option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : string_ option)
    ~report_arn:(report_arn_ : non_empty_string) () =
  ({
     max_line_coverage_percentage = max_line_coverage_percentage_;
     min_line_coverage_percentage = min_line_coverage_percentage_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
     report_arn = report_arn_;
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

let make_delete_report_output () = (() : unit)

let make_delete_report_input ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_ } : delete_report_input)

let make_delete_report_group_output () = (() : unit)

let make_delete_report_group_input ?delete_reports:(delete_reports_ : boolean_ option)
    ~arn:(arn_ : non_empty_string) () =
  ({ delete_reports = delete_reports_; arn = arn_ } : delete_report_group_input)

let make_delete_project_output () = (() : unit)

let make_delete_project_input ~name:(name_ : non_empty_string) () =
  ({ name = name_ } : delete_project_input)

let make_delete_fleet_output () = (() : unit)

let make_delete_fleet_input ~arn:(arn_ : non_empty_string) () =
  ({ arn = arn_ } : delete_fleet_input)

let make_build_not_deleted ?status_code:(status_code_ : string_ option)
    ?id:(id_ : non_empty_string option) () =
  ({ status_code = status_code_; id = id_ } : build_not_deleted)

let make_delete_build_batch_output
    ?builds_not_deleted:(builds_not_deleted_ : builds_not_deleted option)
    ?builds_deleted:(builds_deleted_ : build_ids option)
    ?status_code:(status_code_ : string_ option) () =
  ({
     builds_not_deleted = builds_not_deleted_;
     builds_deleted = builds_deleted_;
     status_code = status_code_;
   }
    : delete_build_batch_output)

let make_delete_build_batch_input ~id:(id_ : non_empty_string) () =
  ({ id = id_ } : delete_build_batch_input)

let make_create_webhook_output ?webhook:(webhook_ : webhook option) () =
  ({ webhook = webhook_ } : create_webhook_output)

let make_create_webhook_input
    ?pull_request_build_policy:(pull_request_build_policy_ : pull_request_build_policy option)
    ?scope_configuration:(scope_configuration_ : scope_configuration option)
    ?manual_creation:(manual_creation_ : wrapper_boolean option)
    ?build_type:(build_type_ : webhook_build_type option)
    ?filter_groups:(filter_groups_ : filter_groups option)
    ?branch_filter:(branch_filter_ : string_ option) ~project_name:(project_name_ : project_name) ()
    =
  ({
     pull_request_build_policy = pull_request_build_policy_;
     scope_configuration = scope_configuration_;
     manual_creation = manual_creation_;
     build_type = build_type_;
     filter_groups = filter_groups_;
     branch_filter = branch_filter_;
     project_name = project_name_;
   }
    : create_webhook_input)

let make_create_report_group_output ?report_group:(report_group_ : report_group option) () =
  ({ report_group = report_group_ } : create_report_group_output)

let make_create_report_group_input ?tags:(tags_ : tag_list option)
    ~export_config:(export_config_ : report_export_config) ~type_:(type__ : report_type)
    ~name:(name_ : report_group_name) () =
  ({ tags = tags_; export_config = export_config_; type_ = type__; name = name_ }
    : create_report_group_input)

let make_create_project_output ?project:(project_ : project option) () =
  ({ project = project_ } : create_project_output)

let make_create_project_input ?auto_retry_limit:(auto_retry_limit_ : wrapper_int option)
    ?concurrent_build_limit:(concurrent_build_limit_ : wrapper_int option)
    ?build_batch_config:(build_batch_config_ : project_build_batch_config option)
    ?file_system_locations:(file_system_locations_ : project_file_system_locations option)
    ?logs_config:(logs_config_ : logs_config option)
    ?badge_enabled:(badge_enabled_ : wrapper_boolean option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?tags:(tags_ : tag_list option)
    ?encryption_key:(encryption_key_ : non_empty_string option)
    ?queued_timeout_in_minutes:(queued_timeout_in_minutes_ : time_out option)
    ?timeout_in_minutes:(timeout_in_minutes_ : build_time_out option)
    ?cache:(cache_ : project_cache option)
    ?secondary_artifacts:(secondary_artifacts_ : project_artifacts_list option)
    ?secondary_source_versions:
      (secondary_source_versions_ : project_secondary_source_versions option)
    ?source_version:(source_version_ : string_ option)
    ?secondary_sources:(secondary_sources_ : project_sources option)
    ?description:(description_ : project_description option)
    ~service_role:(service_role_ : non_empty_string)
    ~environment:(environment_ : project_environment) ~artifacts:(artifacts_ : project_artifacts)
    ~source:(source_ : project_source) ~name:(name_ : project_name) () =
  ({
     auto_retry_limit = auto_retry_limit_;
     concurrent_build_limit = concurrent_build_limit_;
     build_batch_config = build_batch_config_;
     file_system_locations = file_system_locations_;
     logs_config = logs_config_;
     badge_enabled = badge_enabled_;
     vpc_config = vpc_config_;
     tags = tags_;
     encryption_key = encryption_key_;
     queued_timeout_in_minutes = queued_timeout_in_minutes_;
     timeout_in_minutes = timeout_in_minutes_;
     service_role = service_role_;
     environment = environment_;
     cache = cache_;
     secondary_artifacts = secondary_artifacts_;
     artifacts = artifacts_;
     secondary_source_versions = secondary_source_versions_;
     source_version = source_version_;
     secondary_sources = secondary_sources_;
     source = source_;
     description = description_;
     name = name_;
   }
    : create_project_input)

let make_create_fleet_output ?fleet:(fleet_ : fleet option) () =
  ({ fleet = fleet_ } : create_fleet_output)

let make_create_fleet_input ?tags:(tags_ : tag_list option)
    ?fleet_service_role:(fleet_service_role_ : non_empty_string option)
    ?image_id:(image_id_ : non_empty_string option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?overflow_behavior:(overflow_behavior_ : fleet_overflow_behavior option)
    ?scaling_configuration:(scaling_configuration_ : scaling_configuration_input option)
    ?compute_configuration:(compute_configuration_ : compute_configuration option)
    ~compute_type:(compute_type_ : compute_type)
    ~environment_type:(environment_type_ : environment_type)
    ~base_capacity:(base_capacity_ : fleet_capacity) ~name:(name_ : fleet_name) () =
  ({
     tags = tags_;
     fleet_service_role = fleet_service_role_;
     image_id = image_id_;
     proxy_configuration = proxy_configuration_;
     vpc_config = vpc_config_;
     overflow_behavior = overflow_behavior_;
     scaling_configuration = scaling_configuration_;
     compute_configuration = compute_configuration_;
     compute_type = compute_type_;
     environment_type = environment_type_;
     base_capacity = base_capacity_;
     name = name_;
   }
    : create_fleet_input)

let make_batch_get_sandboxes_output ?sandboxes_not_found:(sandboxes_not_found_ : sandbox_ids option)
    ?sandboxes:(sandboxes_ : sandboxes option) () =
  ({ sandboxes_not_found = sandboxes_not_found_; sandboxes = sandboxes_ }
    : batch_get_sandboxes_output)

let make_batch_get_sandboxes_input ~ids:(ids_ : sandbox_ids) () =
  ({ ids = ids_ } : batch_get_sandboxes_input)

let make_batch_get_reports_output ?reports_not_found:(reports_not_found_ : report_arns option)
    ?reports:(reports_ : reports option) () =
  ({ reports_not_found = reports_not_found_; reports = reports_ } : batch_get_reports_output)

let make_batch_get_reports_input ~report_arns:(report_arns_ : report_arns) () =
  ({ report_arns = report_arns_ } : batch_get_reports_input)

let make_batch_get_report_groups_output
    ?report_groups_not_found:(report_groups_not_found_ : report_group_arns option)
    ?report_groups:(report_groups_ : report_groups option) () =
  ({ report_groups_not_found = report_groups_not_found_; report_groups = report_groups_ }
    : batch_get_report_groups_output)

let make_batch_get_report_groups_input ~report_group_arns:(report_group_arns_ : report_group_arns)
    () =
  ({ report_group_arns = report_group_arns_ } : batch_get_report_groups_input)

let make_batch_get_projects_output ?projects_not_found:(projects_not_found_ : project_names option)
    ?projects:(projects_ : projects option) () =
  ({ projects_not_found = projects_not_found_; projects = projects_ } : batch_get_projects_output)

let make_batch_get_projects_input ~names:(names_ : project_names) () =
  ({ names = names_ } : batch_get_projects_input)

let make_batch_get_fleets_output ?fleets_not_found:(fleets_not_found_ : fleet_names option)
    ?fleets:(fleets_ : fleets option) () =
  ({ fleets_not_found = fleets_not_found_; fleets = fleets_ } : batch_get_fleets_output)

let make_batch_get_fleets_input ~names:(names_ : fleet_names) () =
  ({ names = names_ } : batch_get_fleets_input)

let make_batch_get_command_executions_output
    ?command_executions_not_found:(command_executions_not_found_ : command_execution_ids option)
    ?command_executions:(command_executions_ : command_executions option) () =
  ({
     command_executions_not_found = command_executions_not_found_;
     command_executions = command_executions_;
   }
    : batch_get_command_executions_output)

let make_batch_get_command_executions_input
    ~command_execution_ids:(command_execution_ids_ : command_execution_ids)
    ~sandbox_id:(sandbox_id_ : non_empty_string) () =
  ({ command_execution_ids = command_execution_ids_; sandbox_id = sandbox_id_ }
    : batch_get_command_executions_input)

let make_batch_get_builds_output ?builds_not_found:(builds_not_found_ : build_ids option)
    ?builds:(builds_ : builds option) () =
  ({ builds_not_found = builds_not_found_; builds = builds_ } : batch_get_builds_output)

let make_batch_get_builds_input ~ids:(ids_ : build_ids) () =
  ({ ids = ids_ } : batch_get_builds_input)

let make_batch_get_build_batches_output
    ?build_batches_not_found:(build_batches_not_found_ : build_batch_ids option)
    ?build_batches:(build_batches_ : build_batches option) () =
  ({ build_batches_not_found = build_batches_not_found_; build_batches = build_batches_ }
    : batch_get_build_batches_output)

let make_batch_get_build_batches_input ~ids:(ids_ : build_batch_ids) () =
  ({ ids = ids_ } : batch_get_build_batches_input)

let make_batch_delete_builds_output
    ?builds_not_deleted:(builds_not_deleted_ : builds_not_deleted option)
    ?builds_deleted:(builds_deleted_ : build_ids option) () =
  ({ builds_not_deleted = builds_not_deleted_; builds_deleted = builds_deleted_ }
    : batch_delete_builds_output)

let make_batch_delete_builds_input ~ids:(ids_ : build_ids) () =
  ({ ids = ids_ } : batch_delete_builds_input)
