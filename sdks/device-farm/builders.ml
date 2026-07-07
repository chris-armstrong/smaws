open Types

let make_vpc_config ~vpc_id:(vpc_id_ : non_empty_string) ~subnet_ids:(subnet_ids_ : vpc_subnet_ids)
    ~security_group_ids:(security_group_ids_ : vpc_security_group_ids) () =
  ({ vpc_id = vpc_id_; subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ }
    : vpc_config)

let make_vpce_configuration
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option)
    ?service_dns_name:(service_dns_name_ : service_dns_name option)
    ?vpce_service_name:(vpce_service_name_ : vpce_service_name option)
    ?vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({
     vpce_configuration_description = vpce_configuration_description_;
     service_dns_name = service_dns_name_;
     vpce_service_name = vpce_service_name_;
     vpce_configuration_name = vpce_configuration_name_;
     arn = arn_;
   }
    : vpce_configuration)

let make_upload ?category:(category_ : upload_category option) ?message:(message_ : message option)
    ?content_type:(content_type_ : content_type option) ?metadata:(metadata_ : metadata option)
    ?url:(url_ : sensitive_ur_l option) ?status:(status_ : upload_status option)
    ?type_:(type__ : upload_type option) ?created:(created_ : date_time option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     category = category_;
     message = message_;
     content_type = content_type_;
     metadata = metadata_;
     url = url_;
     status = status_;
     type_ = type__;
     created = created_;
     name = name_;
     arn = arn_;
   }
    : upload)

let make_update_vpce_configuration_request
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option)
    ?service_dns_name:(service_dns_name_ : service_dns_name option)
    ?vpce_service_name:(vpce_service_name_ : vpce_service_name option)
    ?vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     vpce_configuration_description = vpce_configuration_description_;
     service_dns_name = service_dns_name_;
     vpce_service_name = vpce_service_name_;
     vpce_configuration_name = vpce_configuration_name_;
     arn = arn_;
   }
    : update_vpce_configuration_request)

let make_update_upload_request ?edit_content:(edit_content_ : boolean_ option)
    ?content_type:(content_type_ : content_type option) ?name:(name_ : name option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ edit_content = edit_content_; content_type = content_type_; name = name_; arn = arn_ }
    : update_upload_request)

let make_test_grid_vpc_config ~vpc_id:(vpc_id_ : non_empty_string)
    ~subnet_ids:(subnet_ids_ : subnet_ids)
    ~security_group_ids:(security_group_ids_ : security_group_ids) () =
  ({ vpc_id = vpc_id_; subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ }
    : test_grid_vpc_config)

let make_test_grid_project ?created:(created_ : date_time option)
    ?vpc_config:(vpc_config_ : test_grid_vpc_config option)
    ?description:(description_ : string_ option) ?name:(name_ : string_ option)
    ?arn:(arn_ : device_farm_arn option) () =
  ({
     created = created_;
     vpc_config = vpc_config_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : test_grid_project)

let make_update_test_grid_project_request ?vpc_config:(vpc_config_ : test_grid_vpc_config option)
    ?description:(description_ : resource_description option) ?name:(name_ : resource_name option)
    ~project_arn:(project_arn_ : device_farm_arn) () =
  ({
     vpc_config = vpc_config_;
     description = description_;
     name = name_;
     project_arn = project_arn_;
   }
    : update_test_grid_project_request)

let make_environment_variable ~value:(value_ : environment_variable_value)
    ~name:(name_ : environment_variable_name) () =
  ({ value = value_; name = name_ } : environment_variable)

let make_project ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?created:(created_ : date_time option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     execution_role_arn = execution_role_arn_;
     environment_variables = environment_variables_;
     vpc_config = vpc_config_;
     created = created_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     name = name_;
     arn = arn_;
   }
    : project)

let make_update_project_request
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?name:(name_ : name option) ~arn:(arn_ : amazon_resource_name) () =
  ({
     execution_role_arn = execution_role_arn_;
     environment_variables = environment_variables_;
     vpc_config = vpc_config_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     name = name_;
     arn = arn_;
   }
    : update_project_request)

let make_network_profile ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?type_:(type__ : network_profile_type option) ?description:(description_ : message option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     downlink_loss_percent = downlink_loss_percent_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : network_profile)

let make_update_network_profile_request
    ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?type_:(type__ : network_profile_type option) ?description:(description_ : message option)
    ?name:(name_ : name option) ~arn:(arn_ : amazon_resource_name) () =
  ({
     downlink_loss_percent = downlink_loss_percent_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : update_network_profile_request)

let make_instance_profile ?description:(description_ : message option) ?name:(name_ : name option)
    ?reboot_after_use:(reboot_after_use_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?package_cleanup:(package_cleanup_ : boolean_ option) ?arn:(arn_ : amazon_resource_name option)
    () =
  ({
     description = description_;
     name = name_;
     reboot_after_use = reboot_after_use_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     package_cleanup = package_cleanup_;
     arn = arn_;
   }
    : instance_profile)

let make_update_instance_profile_request ?reboot_after_use:(reboot_after_use_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?package_cleanup:(package_cleanup_ : boolean_ option)
    ?description:(description_ : message option) ?name:(name_ : name option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     reboot_after_use = reboot_after_use_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     package_cleanup = package_cleanup_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : update_instance_profile_request)

let make_rule ?value:(value_ : string_ option) ?operator:(operator_ : rule_operator option)
    ?attribute:(attribute_ : device_attribute option) () =
  ({ value = value_; operator = operator_; attribute = attribute_ } : rule)

let make_device_pool ?max_devices:(max_devices_ : integer option) ?rules:(rules_ : rules option)
    ?type_:(type__ : device_pool_type option) ?description:(description_ : message option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     max_devices = max_devices_;
     rules = rules_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : device_pool)

let make_update_device_pool_request ?clear_max_devices:(clear_max_devices_ : boolean_ option)
    ?max_devices:(max_devices_ : integer option) ?rules:(rules_ : rules option)
    ?description:(description_ : message option) ?name:(name_ : name option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     clear_max_devices = clear_max_devices_;
     max_devices = max_devices_;
     rules = rules_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : update_device_pool_request)

let make_device_instance ?instance_profile:(instance_profile_ : instance_profile option)
    ?udid:(udid_ : string_ option) ?status:(status_ : instance_status option)
    ?labels:(labels_ : instance_labels option)
    ?device_arn:(device_arn_ : amazon_resource_name option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({
     instance_profile = instance_profile_;
     udid = udid_;
     status = status_;
     labels = labels_;
     device_arn = device_arn_;
     arn = arn_;
   }
    : device_instance)

let make_update_device_instance_request ?labels:(labels_ : instance_labels option)
    ?profile_arn:(profile_arn_ : amazon_resource_name option) ~arn:(arn_ : amazon_resource_name) ()
    =
  ({ labels = labels_; profile_arn = profile_arn_; arn = arn_ } : update_device_instance_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : device_farm_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_problem_detail ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({ name = name_; arn = arn_ } : problem_detail)

let make_cp_u ?clock:(clock_ : double option) ?architecture:(architecture_ : string_ option)
    ?frequency:(frequency_ : string_ option) () =
  ({ clock = clock_; architecture = architecture_; frequency = frequency_ } : cp_u)

let make_resolution ?height:(height_ : integer option) ?width:(width_ : integer option) () =
  ({ height = height_; width = width_ } : resolution)

let make_device ?availability:(availability_ : device_availability option)
    ?instances:(instances_ : device_instances option) ?fleet_name:(fleet_name_ : string_ option)
    ?fleet_type:(fleet_type_ : string_ option)
    ?remote_debug_enabled:(remote_debug_enabled_ : boolean_ option)
    ?remote_access_enabled:(remote_access_enabled_ : boolean_ option)
    ?radio:(radio_ : string_ option) ?carrier:(carrier_ : string_ option)
    ?image:(image_ : string_ option) ?memory:(memory_ : long option)
    ?heap_size:(heap_size_ : long option) ?resolution:(resolution_ : resolution option)
    ?cpu:(cpu_ : cp_u option) ?os:(os_ : string_ option)
    ?platform:(platform_ : device_platform option)
    ?form_factor:(form_factor_ : device_form_factor option) ?model_id:(model_id_ : string_ option)
    ?model:(model_ : string_ option) ?manufacturer:(manufacturer_ : string_ option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     availability = availability_;
     instances = instances_;
     fleet_name = fleet_name_;
     fleet_type = fleet_type_;
     remote_debug_enabled = remote_debug_enabled_;
     remote_access_enabled = remote_access_enabled_;
     radio = radio_;
     carrier = carrier_;
     image = image_;
     memory = memory_;
     heap_size = heap_size_;
     resolution = resolution_;
     cpu = cpu_;
     os = os_;
     platform = platform_;
     form_factor = form_factor_;
     model_id = model_id_;
     model = model_;
     manufacturer = manufacturer_;
     name = name_;
     arn = arn_;
   }
    : device)

let make_problem ?message:(message_ : message option) ?result_:(result__ : execution_result option)
    ?device:(device_ : device option) ?test:(test_ : problem_detail option)
    ?suite:(suite_ : problem_detail option) ?job:(job_ : problem_detail option)
    ?run:(run_ : problem_detail option) () =
  ({
     message = message_;
     result_ = result__;
     device = device_;
     test = test_;
     suite = suite_;
     job = job_;
     run = run_;
   }
    : problem)

let make_unique_problem ?problems:(problems_ : problems option) ?message:(message_ : message option)
    () =
  ({ problems = problems_; message = message_ } : unique_problem)

let make_trial_minutes ?remaining:(remaining_ : double option) ?total:(total_ : double option) () =
  ({ remaining = remaining_; total = total_ } : trial_minutes)

let make_counters ?skipped:(skipped_ : integer option) ?stopped:(stopped_ : integer option)
    ?errored:(errored_ : integer option) ?warned:(warned_ : integer option)
    ?failed:(failed_ : integer option) ?passed:(passed_ : integer option)
    ?total:(total_ : integer option) () =
  ({
     skipped = skipped_;
     stopped = stopped_;
     errored = errored_;
     warned = warned_;
     failed = failed_;
     passed = passed_;
     total = total_;
   }
    : counters)

let make_device_minutes ?unmetered:(unmetered_ : double option) ?metered:(metered_ : double option)
    ?total:(total_ : double option) () =
  ({ unmetered = unmetered_; metered = metered_; total = total_ } : device_minutes)

let make_test ?device_minutes:(device_minutes_ : device_minutes option)
    ?message:(message_ : message option) ?counters:(counters_ : counters option)
    ?stopped:(stopped_ : date_time option) ?started:(started_ : date_time option)
    ?result_:(result__ : execution_result option) ?status:(status_ : execution_status option)
    ?created:(created_ : date_time option) ?type_:(type__ : test_type option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     device_minutes = device_minutes_;
     message = message_;
     counters = counters_;
     stopped = stopped_;
     started = started_;
     result_ = result__;
     status = status_;
     created = created_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : test)

let make_test_grid_session ?selenium_properties:(selenium_properties_ : string_ option)
    ?billing_minutes:(billing_minutes_ : double option) ?ended:(ended_ : date_time option)
    ?created:(created_ : date_time option) ?status:(status_ : test_grid_session_status option)
    ?arn:(arn_ : device_farm_arn option) () =
  ({
     selenium_properties = selenium_properties_;
     billing_minutes = billing_minutes_;
     ended = ended_;
     created = created_;
     status = status_;
     arn = arn_;
   }
    : test_grid_session)

let make_test_grid_session_artifact ?url:(url_ : sensitive_string option)
    ?type_:(type__ : test_grid_session_artifact_type option) ?filename:(filename_ : string_ option)
    () =
  ({ url = url_; type_ = type__; filename = filename_ } : test_grid_session_artifact)

let make_test_grid_session_action ?request_method:(request_method_ : string_ option)
    ?status_code:(status_code_ : string_ option) ?duration:(duration_ : long option)
    ?started:(started_ : date_time option) ?action:(action_ : string_ option) () =
  ({
     request_method = request_method_;
     status_code = status_code_;
     duration = duration_;
     started = started_;
     action = action_;
   }
    : test_grid_session_action)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : device_farm_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_suite ?device_minutes:(device_minutes_ : device_minutes option)
    ?message:(message_ : message option) ?counters:(counters_ : counters option)
    ?stopped:(stopped_ : date_time option) ?started:(started_ : date_time option)
    ?result_:(result__ : execution_result option) ?status:(status_ : execution_status option)
    ?created:(created_ : date_time option) ?type_:(type__ : test_type option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     device_minutes = device_minutes_;
     message = message_;
     counters = counters_;
     stopped = stopped_;
     started = started_;
     result_ = result__;
     status = status_;
     created = created_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : suite)

let make_device_proxy ~port:(port_ : device_proxy_port) ~host:(host_ : device_proxy_host) () =
  ({ port = port_; host = host_ } : device_proxy)

let make_radios ?gps:(gps_ : boolean_ option) ?nfc:(nfc_ : boolean_ option)
    ?bluetooth:(bluetooth_ : boolean_ option) ?wifi:(wifi_ : boolean_ option) () =
  ({ gps = gps_; nfc = nfc_; bluetooth = bluetooth_; wifi = wifi_ } : radios)

let make_location ~longitude:(longitude_ : double) ~latitude:(latitude_ : double) () =
  ({ longitude = longitude_; latitude = latitude_ } : location)

let make_customer_artifact_paths ?device_host_paths:(device_host_paths_ : device_host_paths option)
    ?android_paths:(android_paths_ : android_paths option)
    ?ios_paths:(ios_paths_ : ios_paths option) () =
  ({
     device_host_paths = device_host_paths_;
     android_paths = android_paths_;
     ios_paths = ios_paths_;
   }
    : customer_artifact_paths)

let make_device_filter ~values:(values_ : device_filter_values)
    ~operator:(operator_ : rule_operator) ~attribute:(attribute_ : device_filter_attribute) () =
  ({ values = values_; operator = operator_; attribute = attribute_ } : device_filter)

let make_run ?environment_variables:(environment_variables_ : environment_variables option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?device_selection_result:(device_selection_result_ : device_selection_result option)
    ?test_spec_arn:(test_spec_arn_ : amazon_resource_name option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?web_url:(web_url_ : string_ option)
    ?customer_artifact_paths:(customer_artifact_paths_ : customer_artifact_paths option)
    ?location:(location_ : location option) ?radios:(radios_ : radios option)
    ?locale:(locale_ : string_ option)
    ?device_pool_arn:(device_pool_arn_ : amazon_resource_name option)
    ?job_timeout_minutes:(job_timeout_minutes_ : job_timeout_minutes option)
    ?event_count:(event_count_ : integer option)
    ?app_upload:(app_upload_ : amazon_resource_name option) ?seed:(seed_ : integer option)
    ?result_code:(result_code_ : execution_result_code option)
    ?parsing_result_url:(parsing_result_url_ : string_ option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?network_profile:(network_profile_ : network_profile option)
    ?device_minutes:(device_minutes_ : device_minutes option)
    ?billing_method:(billing_method_ : billing_method option)
    ?completed_jobs:(completed_jobs_ : integer option) ?total_jobs:(total_jobs_ : integer option)
    ?message:(message_ : message option) ?counters:(counters_ : counters option)
    ?stopped:(stopped_ : date_time option) ?started:(started_ : date_time option)
    ?result_:(result__ : execution_result option) ?status:(status_ : execution_status option)
    ?created:(created_ : date_time option) ?platform:(platform_ : device_platform option)
    ?type_:(type__ : test_type option) ?name:(name_ : name option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({
     environment_variables = environment_variables_;
     execution_role_arn = execution_role_arn_;
     vpc_config = vpc_config_;
     device_selection_result = device_selection_result_;
     test_spec_arn = test_spec_arn_;
     skip_app_resign = skip_app_resign_;
     web_url = web_url_;
     customer_artifact_paths = customer_artifact_paths_;
     location = location_;
     radios = radios_;
     locale = locale_;
     device_pool_arn = device_pool_arn_;
     job_timeout_minutes = job_timeout_minutes_;
     event_count = event_count_;
     app_upload = app_upload_;
     seed = seed_;
     result_code = result_code_;
     parsing_result_url = parsing_result_url_;
     device_proxy = device_proxy_;
     network_profile = network_profile_;
     device_minutes = device_minutes_;
     billing_method = billing_method_;
     completed_jobs = completed_jobs_;
     total_jobs = total_jobs_;
     message = message_;
     counters = counters_;
     stopped = stopped_;
     started = started_;
     result_ = result__;
     status = status_;
     created = created_;
     platform = platform_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : run)

let make_stop_run_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_run_request)

let make_remote_access_endpoints
    ?interactive_endpoint:(interactive_endpoint_ : sensitive_ur_l option)
    ?remote_driver_endpoint:(remote_driver_endpoint_ : sensitive_ur_l option) () =
  ({
     interactive_endpoint = interactive_endpoint_;
     remote_driver_endpoint = remote_driver_endpoint_;
   }
    : remote_access_endpoints)

let make_remote_access_session ?endpoints:(endpoints_ : remote_access_endpoints option)
    ?app_upload:(app_upload_ : amazon_resource_name option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?interaction_mode:(interaction_mode_ : interaction_mode option)
    ?device_udid:(device_udid_ : string_ option) ?endpoint:(endpoint_ : string_ option)
    ?device_minutes:(device_minutes_ : device_minutes option)
    ?billing_method:(billing_method_ : billing_method option)
    ?instance_arn:(instance_arn_ : amazon_resource_name option) ?device:(device_ : device option)
    ?stopped:(stopped_ : date_time option) ?started:(started_ : date_time option)
    ?message:(message_ : message option) ?result_:(result__ : execution_result option)
    ?status:(status_ : execution_status option) ?created:(created_ : date_time option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     endpoints = endpoints_;
     app_upload = app_upload_;
     device_proxy = device_proxy_;
     vpc_config = vpc_config_;
     skip_app_resign = skip_app_resign_;
     interaction_mode = interaction_mode_;
     device_udid = device_udid_;
     endpoint = endpoint_;
     device_minutes = device_minutes_;
     billing_method = billing_method_;
     instance_arn = instance_arn_;
     device = device_;
     stopped = stopped_;
     started = started_;
     message = message_;
     result_ = result__;
     status = status_;
     created = created_;
     name = name_;
     arn = arn_;
   }
    : remote_access_session)

let make_stop_remote_access_session_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_remote_access_session_request)

let make_job ?video_capture:(video_capture_ : video_capture option)
    ?video_endpoint:(video_endpoint_ : string_ option)
    ?device_minutes:(device_minutes_ : device_minutes option)
    ?instance_arn:(instance_arn_ : amazon_resource_name option) ?device:(device_ : device option)
    ?message:(message_ : message option) ?counters:(counters_ : counters option)
    ?stopped:(stopped_ : date_time option) ?started:(started_ : date_time option)
    ?result_:(result__ : execution_result option) ?status:(status_ : execution_status option)
    ?created:(created_ : date_time option) ?type_:(type__ : test_type option)
    ?name:(name_ : name option) ?arn:(arn_ : amazon_resource_name option) () =
  ({
     video_capture = video_capture_;
     video_endpoint = video_endpoint_;
     device_minutes = device_minutes_;
     instance_arn = instance_arn_;
     device = device_;
     message = message_;
     counters = counters_;
     stopped = stopped_;
     started = started_;
     result_ = result__;
     status = status_;
     created = created_;
     type_ = type__;
     name = name_;
     arn = arn_;
   }
    : job)

let make_stop_job_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_job_request)

let make_schedule_run_test ?parameters:(parameters_ : test_parameters option)
    ?filter:(filter_ : filter option) ?test_spec_arn:(test_spec_arn_ : amazon_resource_name option)
    ?test_package_arn:(test_package_arn_ : amazon_resource_name option) ~type_:(type__ : test_type)
    () =
  ({
     parameters = parameters_;
     filter = filter_;
     test_spec_arn = test_spec_arn_;
     test_package_arn = test_package_arn_;
     type_ = type__;
   }
    : schedule_run_test)

let make_device_selection_configuration ~max_devices:(max_devices_ : integer)
    ~filters:(filters_ : device_filters) () =
  ({ max_devices = max_devices_; filters = filters_ } : device_selection_configuration)

let make_schedule_run_configuration
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?billing_method:(billing_method_ : billing_method option)
    ?auxiliary_apps:(auxiliary_apps_ : amazon_resource_names option)
    ?radios:(radios_ : radios option)
    ?customer_artifact_paths:(customer_artifact_paths_ : customer_artifact_paths option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?vpce_configuration_arns:(vpce_configuration_arns_ : amazon_resource_names option)
    ?location:(location_ : location option) ?locale:(locale_ : string_ option)
    ?network_profile_arn:(network_profile_arn_ : amazon_resource_name option)
    ?extra_data_package_arn:(extra_data_package_arn_ : amazon_resource_name option) () =
  ({
     execution_role_arn = execution_role_arn_;
     environment_variables = environment_variables_;
     billing_method = billing_method_;
     auxiliary_apps = auxiliary_apps_;
     radios = radios_;
     customer_artifact_paths = customer_artifact_paths_;
     device_proxy = device_proxy_;
     vpce_configuration_arns = vpce_configuration_arns_;
     location = location_;
     locale = locale_;
     network_profile_arn = network_profile_arn_;
     extra_data_package_arn = extra_data_package_arn_;
   }
    : schedule_run_configuration)

let make_execution_configuration ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?video_capture:(video_capture_ : video_capture option)
    ?app_packages_cleanup:(app_packages_cleanup_ : app_packages_cleanup option)
    ?accounts_cleanup:(accounts_cleanup_ : accounts_cleanup option)
    ?job_timeout_minutes:(job_timeout_minutes_ : job_timeout_minutes option) () =
  ({
     skip_app_resign = skip_app_resign_;
     video_capture = video_capture_;
     app_packages_cleanup = app_packages_cleanup_;
     accounts_cleanup = accounts_cleanup_;
     job_timeout_minutes = job_timeout_minutes_;
   }
    : execution_configuration)

let make_schedule_run_request
    ?execution_configuration:(execution_configuration_ : execution_configuration option)
    ?configuration:(configuration_ : schedule_run_configuration option) ?name:(name_ : name option)
    ?device_selection_configuration:
      (device_selection_configuration_ : device_selection_configuration option)
    ?device_pool_arn:(device_pool_arn_ : amazon_resource_name option)
    ?app_arn:(app_arn_ : amazon_resource_name option) ~test:(test_ : schedule_run_test)
    ~project_arn:(project_arn_ : amazon_resource_name) () =
  ({
     execution_configuration = execution_configuration_;
     configuration = configuration_;
     test = test_;
     name = name_;
     device_selection_configuration = device_selection_configuration_;
     device_pool_arn = device_pool_arn_;
     app_arn = app_arn_;
     project_arn = project_arn_;
   }
    : schedule_run_request)

let make_sample ?url:(url_ : ur_l option) ?type_:(type__ : sample_type option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({ url = url_; type_ = type__; arn = arn_ } : sample)

let make_monetary_amount ?currency_code:(currency_code_ : currency_code option)
    ?amount:(amount_ : double option) () =
  ({ currency_code = currency_code_; amount = amount_ } : monetary_amount)

let make_recurring_charge ?frequency:(frequency_ : recurring_charge_frequency option)
    ?cost:(cost_ : monetary_amount option) () =
  ({ frequency = frequency_; cost = cost_ } : recurring_charge)

let make_offering ?recurring_charges:(recurring_charges_ : recurring_charges option)
    ?platform:(platform_ : device_platform option) ?type_:(type__ : offering_type option)
    ?description:(description_ : message option) ?id:(id_ : offering_identifier option) () =
  ({
     recurring_charges = recurring_charges_;
     platform = platform_;
     type_ = type__;
     description = description_;
     id = id_;
   }
    : offering)

let make_offering_status ?effective_on:(effective_on_ : date_time option)
    ?quantity:(quantity_ : integer option) ?offering:(offering_ : offering option)
    ?type_:(type__ : offering_transaction_type option) () =
  ({ effective_on = effective_on_; quantity = quantity_; offering = offering_; type_ = type__ }
    : offering_status)

let make_offering_transaction ?cost:(cost_ : monetary_amount option)
    ?created_on:(created_on_ : date_time option)
    ?offering_promotion_id:(offering_promotion_id_ : offering_promotion_identifier option)
    ?transaction_id:(transaction_id_ : transaction_identifier option)
    ?offering_status:(offering_status_ : offering_status option) () =
  ({
     cost = cost_;
     created_on = created_on_;
     offering_promotion_id = offering_promotion_id_;
     transaction_id = transaction_id_;
     offering_status = offering_status_;
   }
    : offering_transaction)

let make_renew_offering_request ~quantity:(quantity_ : integer)
    ~offering_id:(offering_id_ : offering_identifier) () =
  ({ quantity = quantity_; offering_id = offering_id_ } : renew_offering_request)

let make_purchase_offering_request
    ?offering_promotion_id:(offering_promotion_id_ : offering_promotion_identifier option)
    ~quantity:(quantity_ : integer) ~offering_id:(offering_id_ : offering_identifier) () =
  ({
     offering_promotion_id = offering_promotion_id_;
     quantity = quantity_;
     offering_id = offering_id_;
   }
    : purchase_offering_request)

let make_offering_promotion ?description:(description_ : message option)
    ?id:(id_ : offering_promotion_identifier option) () =
  ({ description = description_; id = id_ } : offering_promotion)

let make_list_vpce_configurations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_vpce_configurations_request)

let make_list_uploads_request ?next_token:(next_token_ : pagination_token option)
    ?type_:(type__ : upload_type option) ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; type_ = type__; arn = arn_ } : list_uploads_request)

let make_list_unique_problems_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_unique_problems_request)

let make_list_tests_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_tests_request)

let make_list_test_grid_sessions_request ?next_token:(next_token_ : pagination_token option)
    ?max_result:(max_result_ : max_page_size option)
    ?end_time_before:(end_time_before_ : date_time option)
    ?end_time_after:(end_time_after_ : date_time option)
    ?creation_time_before:(creation_time_before_ : date_time option)
    ?creation_time_after:(creation_time_after_ : date_time option)
    ?status:(status_ : test_grid_session_status option)
    ~project_arn:(project_arn_ : device_farm_arn) () =
  ({
     next_token = next_token_;
     max_result = max_result_;
     end_time_before = end_time_before_;
     end_time_after = end_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status = status_;
     project_arn = project_arn_;
   }
    : list_test_grid_sessions_request)

let make_list_test_grid_session_artifacts_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_result:(max_result_ : max_page_size option)
    ?type_:(type__ : test_grid_session_artifact_category option)
    ~session_arn:(session_arn_ : device_farm_arn) () =
  ({
     next_token = next_token_;
     max_result = max_result_;
     type_ = type__;
     session_arn = session_arn_;
   }
    : list_test_grid_session_artifacts_request)

let make_list_test_grid_session_actions_request ?next_token:(next_token_ : pagination_token option)
    ?max_result:(max_result_ : max_page_size option) ~session_arn:(session_arn_ : device_farm_arn)
    () =
  ({ next_token = next_token_; max_result = max_result_; session_arn = session_arn_ }
    : list_test_grid_session_actions_request)

let make_list_test_grid_projects_request ?next_token:(next_token_ : pagination_token option)
    ?max_result:(max_result_ : max_page_size option) () =
  ({ next_token = next_token_; max_result = max_result_ } : list_test_grid_projects_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : device_farm_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_suites_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_suites_request)

let make_list_samples_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_samples_request)

let make_list_runs_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_runs_request)

let make_list_remote_access_sessions_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_remote_access_sessions_request)

let make_list_projects_request ?next_token:(next_token_ : pagination_token option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({ next_token = next_token_; arn = arn_ } : list_projects_request)

let make_list_offerings_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offerings_request)

let make_list_offering_transactions_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offering_transactions_request)

let make_list_offering_promotions_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offering_promotions_request)

let make_list_network_profiles_request ?next_token:(next_token_ : pagination_token option)
    ?type_:(type__ : network_profile_type option) ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; type_ = type__; arn = arn_ } : list_network_profiles_request)

let make_list_jobs_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; arn = arn_ } : list_jobs_request)

let make_list_instance_profiles_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_instance_profiles_request)

let make_list_devices_request ?filters:(filters_ : device_filters option)
    ?next_token:(next_token_ : pagination_token option) ?arn:(arn_ : amazon_resource_name option) ()
    =
  ({ filters = filters_; next_token = next_token_; arn = arn_ } : list_devices_request)

let make_list_device_pools_request ?next_token:(next_token_ : pagination_token option)
    ?type_:(type__ : device_pool_type option) ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; type_ = type__; arn = arn_ } : list_device_pools_request)

let make_list_device_instances_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_device_instances_request)

let make_artifact ?url:(url_ : ur_l option) ?extension:(extension_ : string_ option)
    ?type_:(type__ : artifact_type option) ?name:(name_ : name option)
    ?arn:(arn_ : amazon_resource_name option) () =
  ({ url = url_; extension = extension_; type_ = type__; name = name_; arn = arn_ } : artifact)

let make_list_artifacts_request ?next_token:(next_token_ : pagination_token option)
    ~type_:(type__ : artifact_category) ~arn:(arn_ : amazon_resource_name) () =
  ({ next_token = next_token_; type_ = type__; arn = arn_ } : list_artifacts_request)

let make_install_to_remote_access_session_request ~app_arn:(app_arn_ : amazon_resource_name)
    ~remote_access_session_arn:(remote_access_session_arn_ : amazon_resource_name) () =
  ({ app_arn = app_arn_; remote_access_session_arn = remote_access_session_arn_ }
    : install_to_remote_access_session_request)

let make_incompatibility_message ?type_:(type__ : device_attribute option)
    ?message:(message_ : message option) () =
  ({ type_ = type__; message = message_ } : incompatibility_message)

let make_get_vpce_configuration_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_vpce_configuration_request)

let make_get_upload_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_upload_request)

let make_get_test_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_test_request)

let make_get_test_grid_session_request ?session_arn:(session_arn_ : device_farm_arn option)
    ?session_id:(session_id_ : resource_id option)
    ?project_arn:(project_arn_ : device_farm_arn option) () =
  ({ session_arn = session_arn_; session_id = session_id_; project_arn = project_arn_ }
    : get_test_grid_session_request)

let make_get_test_grid_project_request ~project_arn:(project_arn_ : device_farm_arn) () =
  ({ project_arn = project_arn_ } : get_test_grid_project_request)

let make_get_suite_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_suite_request)

let make_get_run_request ~arn:(arn_ : amazon_resource_name) () = ({ arn = arn_ } : get_run_request)

let make_get_remote_access_session_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_remote_access_session_request)

let make_get_project_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_project_request)

let make_get_offering_status_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : get_offering_status_request)

let make_get_network_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_network_profile_request)

let make_get_job_request ~arn:(arn_ : amazon_resource_name) () = ({ arn = arn_ } : get_job_request)

let make_get_instance_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_instance_profile_request)

let make_get_device_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_request)

let make_get_device_pool_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_pool_request)

let make_get_device_pool_compatibility_request
    ?project_arn:(project_arn_ : amazon_resource_name option)
    ?configuration:(configuration_ : schedule_run_configuration option)
    ?test:(test_ : schedule_run_test option) ?test_type:(test_type_ : test_type option)
    ?app_arn:(app_arn_ : amazon_resource_name option)
    ~device_pool_arn:(device_pool_arn_ : amazon_resource_name) () =
  ({
     project_arn = project_arn_;
     configuration = configuration_;
     test = test_;
     test_type = test_type_;
     app_arn = app_arn_;
     device_pool_arn = device_pool_arn_;
   }
    : get_device_pool_compatibility_request)

let make_get_device_instance_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_instance_request)

let make_account_settings ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?max_slots:(max_slots_ : max_slot_map option)
    ?trial_minutes:(trial_minutes_ : trial_minutes option)
    ?max_job_timeout_minutes:(max_job_timeout_minutes_ : job_timeout_minutes option)
    ?unmetered_remote_access_devices:
      (unmetered_remote_access_devices_ : purchased_devices_map option)
    ?unmetered_devices:(unmetered_devices_ : purchased_devices_map option)
    ?aws_account_number:(aws_account_number_ : aws_account_number option) () =
  ({
     skip_app_resign = skip_app_resign_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     max_slots = max_slots_;
     trial_minutes = trial_minutes_;
     max_job_timeout_minutes = max_job_timeout_minutes_;
     unmetered_remote_access_devices = unmetered_remote_access_devices_;
     unmetered_devices = unmetered_devices_;
     aws_account_number = aws_account_number_;
   }
    : account_settings)

let make_get_account_settings_request () = (() : unit)

let make_delete_vpce_configuration_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_vpce_configuration_request)

let make_delete_upload_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_upload_request)

let make_delete_test_grid_project_request ~project_arn:(project_arn_ : device_farm_arn) () =
  ({ project_arn = project_arn_ } : delete_test_grid_project_request)

let make_delete_run_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_run_request)

let make_delete_remote_access_session_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_remote_access_session_request)

let make_delete_project_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_project_request)

let make_delete_network_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_network_profile_request)

let make_delete_instance_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_instance_profile_request)

let make_delete_device_pool_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_device_pool_request)

let make_create_vpce_configuration_request
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option)
    ~service_dns_name:(service_dns_name_ : service_dns_name)
    ~vpce_service_name:(vpce_service_name_ : vpce_service_name)
    ~vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name) () =
  ({
     vpce_configuration_description = vpce_configuration_description_;
     service_dns_name = service_dns_name_;
     vpce_service_name = vpce_service_name_;
     vpce_configuration_name = vpce_configuration_name_;
   }
    : create_vpce_configuration_request)

let make_create_upload_request ?content_type:(content_type_ : content_type option)
    ~type_:(type__ : upload_type) ~name:(name_ : name)
    ~project_arn:(project_arn_ : amazon_resource_name) () =
  ({ content_type = content_type_; type_ = type__; name = name_; project_arn = project_arn_ }
    : create_upload_request)

let make_create_test_grid_url_request
    ~expires_in_seconds:(expires_in_seconds_ : test_grid_url_expires_in_seconds_input)
    ~project_arn:(project_arn_ : device_farm_arn) () =
  ({ expires_in_seconds = expires_in_seconds_; project_arn = project_arn_ }
    : create_test_grid_url_request)

let make_create_test_grid_project_request ?vpc_config:(vpc_config_ : test_grid_vpc_config option)
    ?description:(description_ : resource_description option) ~name:(name_ : resource_name) () =
  ({ vpc_config = vpc_config_; description = description_; name = name_ }
    : create_test_grid_project_request)

let make_create_remote_access_session_configuration
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?vpce_configuration_arns:(vpce_configuration_arns_ : amazon_resource_names option)
    ?billing_method:(billing_method_ : billing_method option)
    ?auxiliary_apps:(auxiliary_apps_ : auxiliary_app_arn_list option) () =
  ({
     device_proxy = device_proxy_;
     vpce_configuration_arns = vpce_configuration_arns_;
     billing_method = billing_method_;
     auxiliary_apps = auxiliary_apps_;
   }
    : create_remote_access_session_configuration)

let make_create_remote_access_session_request ?skip_app_resign:(skip_app_resign_ : boolean_ option)
    ?interaction_mode:(interaction_mode_ : interaction_mode option)
    ?configuration:(configuration_ : create_remote_access_session_configuration option)
    ?name:(name_ : name option) ?instance_arn:(instance_arn_ : amazon_resource_name option)
    ?app_arn:(app_arn_ : amazon_resource_name option)
    ~device_arn:(device_arn_ : amazon_resource_name)
    ~project_arn:(project_arn_ : amazon_resource_name) () =
  ({
     skip_app_resign = skip_app_resign_;
     interaction_mode = interaction_mode_;
     configuration = configuration_;
     name = name_;
     instance_arn = instance_arn_;
     app_arn = app_arn_;
     device_arn = device_arn_;
     project_arn = project_arn_;
   }
    : create_remote_access_session_request)

let make_create_project_request
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ~name:(name_ : name) () =
  ({
     execution_role_arn = execution_role_arn_;
     environment_variables = environment_variables_;
     vpc_config = vpc_config_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     name = name_;
   }
    : create_project_request)

let make_create_network_profile_request
    ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?type_:(type__ : network_profile_type option) ?description:(description_ : message option)
    ~name:(name_ : name) ~project_arn:(project_arn_ : amazon_resource_name) () =
  ({
     downlink_loss_percent = downlink_loss_percent_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     type_ = type__;
     description = description_;
     name = name_;
     project_arn = project_arn_;
   }
    : create_network_profile_request)

let make_create_instance_profile_request ?reboot_after_use:(reboot_after_use_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?package_cleanup:(package_cleanup_ : boolean_ option)
    ?description:(description_ : message option) ~name:(name_ : name) () =
  ({
     reboot_after_use = reboot_after_use_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     package_cleanup = package_cleanup_;
     description = description_;
     name = name_;
   }
    : create_instance_profile_request)

let make_create_device_pool_request ?max_devices:(max_devices_ : integer option)
    ?description:(description_ : message option) ~rules:(rules_ : rules) ~name:(name_ : name)
    ~project_arn:(project_arn_ : amazon_resource_name) () =
  ({
     max_devices = max_devices_;
     rules = rules_;
     description = description_;
     name = name_;
     project_arn = project_arn_;
   }
    : create_device_pool_request)
