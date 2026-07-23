open Types

let make_trial_minutes ?total:(total_ : double option) ?remaining:(remaining_ : double option) () =
  ({ total = total_; remaining = remaining_ } : trial_minutes)

let make_account_settings ?aws_account_number:(aws_account_number_ : aws_account_number option)
    ?unmetered_devices:(unmetered_devices_ : purchased_devices_map option)
    ?unmetered_remote_access_devices:
      (unmetered_remote_access_devices_ : purchased_devices_map option)
    ?max_job_timeout_minutes:(max_job_timeout_minutes_ : job_timeout_minutes option)
    ?trial_minutes:(trial_minutes_ : trial_minutes option)
    ?max_slots:(max_slots_ : max_slot_map option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option) () =
  ({
     aws_account_number = aws_account_number_;
     unmetered_devices = unmetered_devices_;
     unmetered_remote_access_devices = unmetered_remote_access_devices_;
     max_job_timeout_minutes = max_job_timeout_minutes_;
     trial_minutes = trial_minutes_;
     max_slots = max_slots_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     skip_app_resign = skip_app_resign_;
   }
    : account_settings)

let make_artifact ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?type_:(type__ : artifact_type option) ?extension:(extension_ : string_ option)
    ?url:(url_ : ur_l option) () =
  ({ arn = arn_; name = name_; type_ = type__; extension = extension_; url = url_ } : artifact)

let make_cp_u ?frequency:(frequency_ : string_ option)
    ?architecture:(architecture_ : string_ option) ?clock:(clock_ : double option) () =
  ({ frequency = frequency_; architecture = architecture_; clock = clock_ } : cp_u)

let make_counters ?total:(total_ : integer option) ?passed:(passed_ : integer option)
    ?failed:(failed_ : integer option) ?warned:(warned_ : integer option)
    ?errored:(errored_ : integer option) ?stopped:(stopped_ : integer option)
    ?skipped:(skipped_ : integer option) () =
  ({
     total = total_;
     passed = passed_;
     failed = failed_;
     warned = warned_;
     errored = errored_;
     stopped = stopped_;
     skipped = skipped_;
   }
    : counters)

let make_rule ?attribute:(attribute_ : device_attribute option)
    ?operator:(operator_ : rule_operator option) ?value:(value_ : string_ option) () =
  ({ attribute = attribute_; operator = operator_; value = value_ } : rule)

let make_device_pool ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?description:(description_ : message option) ?type_:(type__ : device_pool_type option)
    ?rules:(rules_ : rules option) ?max_devices:(max_devices_ : integer option) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     rules = rules_;
     max_devices = max_devices_;
   }
    : device_pool)

let make_create_device_pool_request ?description:(description_ : message option)
    ?max_devices:(max_devices_ : integer option) ~project_arn:(project_arn_ : amazon_resource_name)
    ~name:(name_ : name) ~rules:(rules_ : rules) () =
  ({
     project_arn = project_arn_;
     name = name_;
     description = description_;
     rules = rules_;
     max_devices = max_devices_;
   }
    : create_device_pool_request)

let make_instance_profile ?arn:(arn_ : amazon_resource_name option)
    ?package_cleanup:(package_cleanup_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?reboot_after_use:(reboot_after_use_ : boolean_ option) ?name:(name_ : name option)
    ?description:(description_ : message option) () =
  ({
     arn = arn_;
     package_cleanup = package_cleanup_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     reboot_after_use = reboot_after_use_;
     name = name_;
     description = description_;
   }
    : instance_profile)

let make_create_instance_profile_request ?description:(description_ : message option)
    ?package_cleanup:(package_cleanup_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?reboot_after_use:(reboot_after_use_ : boolean_ option) ~name:(name_ : name) () =
  ({
     name = name_;
     description = description_;
     package_cleanup = package_cleanup_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     reboot_after_use = reboot_after_use_;
   }
    : create_instance_profile_request)

let make_network_profile ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?description:(description_ : message option) ?type_:(type__ : network_profile_type option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_loss_percent = downlink_loss_percent_;
   }
    : network_profile)

let make_create_network_profile_request ?description:(description_ : message option)
    ?type_:(type__ : network_profile_type option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option)
    ~project_arn:(project_arn_ : amazon_resource_name) ~name:(name_ : name) () =
  ({
     project_arn = project_arn_;
     name = name_;
     description = description_;
     type_ = type__;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_loss_percent = downlink_loss_percent_;
   }
    : create_network_profile_request)

let make_environment_variable ~name:(name_ : environment_variable_name)
    ~value:(value_ : environment_variable_value) () =
  ({ name = name_; value = value_ } : environment_variable)

let make_vpc_config ~security_group_ids:(security_group_ids_ : vpc_security_group_ids)
    ~subnet_ids:(subnet_ids_ : vpc_subnet_ids) ~vpc_id:(vpc_id_ : non_empty_string) () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_; vpc_id = vpc_id_ }
    : vpc_config)

let make_project ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?created:(created_ : date_time option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option) () =
  ({
     arn = arn_;
     name = name_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     created = created_;
     vpc_config = vpc_config_;
     environment_variables = environment_variables_;
     execution_role_arn = execution_role_arn_;
   }
    : project)

let make_create_project_request
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ~name:(name_ : name) () =
  ({
     name = name_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     vpc_config = vpc_config_;
     environment_variables = environment_variables_;
     execution_role_arn = execution_role_arn_;
   }
    : create_project_request)

let make_remote_access_endpoints
    ?remote_driver_endpoint:(remote_driver_endpoint_ : sensitive_ur_l option)
    ?interactive_endpoint:(interactive_endpoint_ : sensitive_ur_l option) () =
  ({
     remote_driver_endpoint = remote_driver_endpoint_;
     interactive_endpoint = interactive_endpoint_;
   }
    : remote_access_endpoints)

let make_device_proxy ~host:(host_ : device_proxy_host) ~port:(port_ : device_proxy_port) () =
  ({ host = host_; port = port_ } : device_proxy)

let make_device_minutes ?total:(total_ : double option) ?metered:(metered_ : double option)
    ?unmetered:(unmetered_ : double option) () =
  ({ total = total_; metered = metered_; unmetered = unmetered_ } : device_minutes)

let make_device_instance ?arn:(arn_ : amazon_resource_name option)
    ?device_arn:(device_arn_ : amazon_resource_name option)
    ?labels:(labels_ : instance_labels option) ?status:(status_ : instance_status option)
    ?udid:(udid_ : string_ option) ?instance_profile:(instance_profile_ : instance_profile option)
    () =
  ({
     arn = arn_;
     device_arn = device_arn_;
     labels = labels_;
     status = status_;
     udid = udid_;
     instance_profile = instance_profile_;
   }
    : device_instance)

let make_resolution ?width:(width_ : integer option) ?height:(height_ : integer option) () =
  ({ width = width_; height = height_ } : resolution)

let make_device ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?manufacturer:(manufacturer_ : string_ option) ?model:(model_ : string_ option)
    ?model_id:(model_id_ : string_ option) ?form_factor:(form_factor_ : device_form_factor option)
    ?platform:(platform_ : device_platform option) ?os:(os_ : string_ option)
    ?cpu:(cpu_ : cp_u option) ?resolution:(resolution_ : resolution option)
    ?heap_size:(heap_size_ : long option) ?memory:(memory_ : long option)
    ?image:(image_ : string_ option) ?carrier:(carrier_ : string_ option)
    ?radio:(radio_ : string_ option)
    ?remote_access_enabled:(remote_access_enabled_ : boolean_ option)
    ?remote_debug_enabled:(remote_debug_enabled_ : boolean_ option)
    ?fleet_type:(fleet_type_ : string_ option) ?fleet_name:(fleet_name_ : string_ option)
    ?instances:(instances_ : device_instances option)
    ?availability:(availability_ : device_availability option) () =
  ({
     arn = arn_;
     name = name_;
     manufacturer = manufacturer_;
     model = model_;
     model_id = model_id_;
     form_factor = form_factor_;
     platform = platform_;
     os = os_;
     cpu = cpu_;
     resolution = resolution_;
     heap_size = heap_size_;
     memory = memory_;
     image = image_;
     carrier = carrier_;
     radio = radio_;
     remote_access_enabled = remote_access_enabled_;
     remote_debug_enabled = remote_debug_enabled_;
     fleet_type = fleet_type_;
     fleet_name = fleet_name_;
     instances = instances_;
     availability = availability_;
   }
    : device)

let make_remote_access_session ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?created:(created_ : date_time option) ?status:(status_ : execution_status option)
    ?result_:(result__ : execution_result option) ?message:(message_ : message option)
    ?started:(started_ : date_time option) ?stopped:(stopped_ : date_time option)
    ?device:(device_ : device option) ?instance_arn:(instance_arn_ : amazon_resource_name option)
    ?billing_method:(billing_method_ : billing_method option)
    ?device_minutes:(device_minutes_ : device_minutes option) ?endpoint:(endpoint_ : string_ option)
    ?device_udid:(device_udid_ : string_ option)
    ?interaction_mode:(interaction_mode_ : interaction_mode option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?app_upload:(app_upload_ : amazon_resource_name option)
    ?endpoints:(endpoints_ : remote_access_endpoints option) () =
  ({
     arn = arn_;
     name = name_;
     created = created_;
     status = status_;
     result_ = result__;
     message = message_;
     started = started_;
     stopped = stopped_;
     device = device_;
     instance_arn = instance_arn_;
     billing_method = billing_method_;
     device_minutes = device_minutes_;
     endpoint = endpoint_;
     device_udid = device_udid_;
     interaction_mode = interaction_mode_;
     skip_app_resign = skip_app_resign_;
     vpc_config = vpc_config_;
     device_proxy = device_proxy_;
     app_upload = app_upload_;
     endpoints = endpoints_;
   }
    : remote_access_session)

let make_create_remote_access_session_configuration
    ?auxiliary_apps:(auxiliary_apps_ : auxiliary_app_arn_list option)
    ?billing_method:(billing_method_ : billing_method option)
    ?vpce_configuration_arns:(vpce_configuration_arns_ : amazon_resource_names option)
    ?device_proxy:(device_proxy_ : device_proxy option) () =
  ({
     auxiliary_apps = auxiliary_apps_;
     billing_method = billing_method_;
     vpce_configuration_arns = vpce_configuration_arns_;
     device_proxy = device_proxy_;
   }
    : create_remote_access_session_configuration)

let make_create_remote_access_session_request ?app_arn:(app_arn_ : amazon_resource_name option)
    ?instance_arn:(instance_arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?configuration:(configuration_ : create_remote_access_session_configuration option)
    ?interaction_mode:(interaction_mode_ : interaction_mode option)
    ?skip_app_resign:(skip_app_resign_ : boolean_ option)
    ~project_arn:(project_arn_ : amazon_resource_name)
    ~device_arn:(device_arn_ : amazon_resource_name) () =
  ({
     project_arn = project_arn_;
     device_arn = device_arn_;
     app_arn = app_arn_;
     instance_arn = instance_arn_;
     name = name_;
     configuration = configuration_;
     interaction_mode = interaction_mode_;
     skip_app_resign = skip_app_resign_;
   }
    : create_remote_access_session_request)

let make_test_grid_vpc_config ~security_group_ids:(security_group_ids_ : security_group_ids)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~vpc_id:(vpc_id_ : non_empty_string) () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_; vpc_id = vpc_id_ }
    : test_grid_vpc_config)

let make_test_grid_project ?arn:(arn_ : device_farm_arn option) ?name:(name_ : string_ option)
    ?description:(description_ : string_ option)
    ?vpc_config:(vpc_config_ : test_grid_vpc_config option) ?created:(created_ : date_time option)
    () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     vpc_config = vpc_config_;
     created = created_;
   }
    : test_grid_project)

let make_create_test_grid_project_request ?description:(description_ : resource_description option)
    ?vpc_config:(vpc_config_ : test_grid_vpc_config option) ~name:(name_ : resource_name) () =
  ({ name = name_; description = description_; vpc_config = vpc_config_ }
    : create_test_grid_project_request)

let make_create_test_grid_url_request ~project_arn:(project_arn_ : device_farm_arn)
    ~expires_in_seconds:(expires_in_seconds_ : test_grid_url_expires_in_seconds_input) () =
  ({ project_arn = project_arn_; expires_in_seconds = expires_in_seconds_ }
    : create_test_grid_url_request)

let make_upload ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?created:(created_ : date_time option) ?type_:(type__ : upload_type option)
    ?status:(status_ : upload_status option) ?url:(url_ : sensitive_ur_l option)
    ?metadata:(metadata_ : metadata option) ?content_type:(content_type_ : content_type option)
    ?message:(message_ : message option) ?category:(category_ : upload_category option) () =
  ({
     arn = arn_;
     name = name_;
     created = created_;
     type_ = type__;
     status = status_;
     url = url_;
     metadata = metadata_;
     content_type = content_type_;
     message = message_;
     category = category_;
   }
    : upload)

let make_create_upload_request ?content_type:(content_type_ : content_type option)
    ~project_arn:(project_arn_ : amazon_resource_name) ~name:(name_ : name)
    ~type_:(type__ : upload_type) () =
  ({ project_arn = project_arn_; name = name_; type_ = type__; content_type = content_type_ }
    : create_upload_request)

let make_vpce_configuration ?arn:(arn_ : amazon_resource_name option)
    ?vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name option)
    ?vpce_service_name:(vpce_service_name_ : vpce_service_name option)
    ?service_dns_name:(service_dns_name_ : service_dns_name option)
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option) () =
  ({
     arn = arn_;
     vpce_configuration_name = vpce_configuration_name_;
     vpce_service_name = vpce_service_name_;
     service_dns_name = service_dns_name_;
     vpce_configuration_description = vpce_configuration_description_;
   }
    : vpce_configuration)

let make_create_vpce_configuration_request
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option)
    ~vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name)
    ~vpce_service_name:(vpce_service_name_ : vpce_service_name)
    ~service_dns_name:(service_dns_name_ : service_dns_name) () =
  ({
     vpce_configuration_name = vpce_configuration_name_;
     vpce_service_name = vpce_service_name_;
     service_dns_name = service_dns_name_;
     vpce_configuration_description = vpce_configuration_description_;
   }
    : create_vpce_configuration_request)

let make_customer_artifact_paths ?ios_paths:(ios_paths_ : ios_paths option)
    ?android_paths:(android_paths_ : android_paths option)
    ?device_host_paths:(device_host_paths_ : device_host_paths option) () =
  ({
     ios_paths = ios_paths_;
     android_paths = android_paths_;
     device_host_paths = device_host_paths_;
   }
    : customer_artifact_paths)

let make_delete_device_pool_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_device_pool_request)

let make_delete_instance_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_instance_profile_request)

let make_delete_network_profile_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_network_profile_request)

let make_delete_project_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_project_request)

let make_delete_remote_access_session_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_remote_access_session_request)

let make_delete_run_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_run_request)

let make_delete_test_grid_project_request ~project_arn:(project_arn_ : device_farm_arn) () =
  ({ project_arn = project_arn_ } : delete_test_grid_project_request)

let make_delete_upload_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_upload_request)

let make_delete_vpce_configuration_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : delete_vpce_configuration_request)

let make_update_vpce_configuration_request
    ?vpce_configuration_name:(vpce_configuration_name_ : vpce_configuration_name option)
    ?vpce_service_name:(vpce_service_name_ : vpce_service_name option)
    ?service_dns_name:(service_dns_name_ : service_dns_name option)
    ?vpce_configuration_description:
      (vpce_configuration_description_ : vpce_configuration_description option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     arn = arn_;
     vpce_configuration_name = vpce_configuration_name_;
     vpce_service_name = vpce_service_name_;
     service_dns_name = service_dns_name_;
     vpce_configuration_description = vpce_configuration_description_;
   }
    : update_vpce_configuration_request)

let make_update_upload_request ?name:(name_ : name option)
    ?content_type:(content_type_ : content_type option)
    ?edit_content:(edit_content_ : boolean_ option) ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; name = name_; content_type = content_type_; edit_content = edit_content_ }
    : update_upload_request)

let make_update_test_grid_project_request ?name:(name_ : resource_name option)
    ?description:(description_ : resource_description option)
    ?vpc_config:(vpc_config_ : test_grid_vpc_config option)
    ~project_arn:(project_arn_ : device_farm_arn) () =
  ({
     project_arn = project_arn_;
     name = name_;
     description = description_;
     vpc_config = vpc_config_;
   }
    : update_test_grid_project_request)

let make_update_project_request ?name:(name_ : name option)
    ?default_job_timeout_minutes:(default_job_timeout_minutes_ : job_timeout_minutes option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     arn = arn_;
     name = name_;
     default_job_timeout_minutes = default_job_timeout_minutes_;
     vpc_config = vpc_config_;
     environment_variables = environment_variables_;
     execution_role_arn = execution_role_arn_;
   }
    : update_project_request)

let make_update_network_profile_request ?name:(name_ : name option)
    ?description:(description_ : message option) ?type_:(type__ : network_profile_type option)
    ?uplink_bandwidth_bits:(uplink_bandwidth_bits_ : long option)
    ?downlink_bandwidth_bits:(downlink_bandwidth_bits_ : long option)
    ?uplink_delay_ms:(uplink_delay_ms_ : long option)
    ?downlink_delay_ms:(downlink_delay_ms_ : long option)
    ?uplink_jitter_ms:(uplink_jitter_ms_ : long option)
    ?downlink_jitter_ms:(downlink_jitter_ms_ : long option)
    ?uplink_loss_percent:(uplink_loss_percent_ : percent_integer option)
    ?downlink_loss_percent:(downlink_loss_percent_ : percent_integer option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     uplink_bandwidth_bits = uplink_bandwidth_bits_;
     downlink_bandwidth_bits = downlink_bandwidth_bits_;
     uplink_delay_ms = uplink_delay_ms_;
     downlink_delay_ms = downlink_delay_ms_;
     uplink_jitter_ms = uplink_jitter_ms_;
     downlink_jitter_ms = downlink_jitter_ms_;
     uplink_loss_percent = uplink_loss_percent_;
     downlink_loss_percent = downlink_loss_percent_;
   }
    : update_network_profile_request)

let make_update_instance_profile_request ?name:(name_ : name option)
    ?description:(description_ : message option)
    ?package_cleanup:(package_cleanup_ : boolean_ option)
    ?exclude_app_packages_from_cleanup:(exclude_app_packages_from_cleanup_ : package_ids option)
    ?reboot_after_use:(reboot_after_use_ : boolean_ option) ~arn:(arn_ : amazon_resource_name) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     package_cleanup = package_cleanup_;
     exclude_app_packages_from_cleanup = exclude_app_packages_from_cleanup_;
     reboot_after_use = reboot_after_use_;
   }
    : update_instance_profile_request)

let make_update_device_pool_request ?name:(name_ : name option)
    ?description:(description_ : message option) ?rules:(rules_ : rules option)
    ?max_devices:(max_devices_ : integer option)
    ?clear_max_devices:(clear_max_devices_ : boolean_ option) ~arn:(arn_ : amazon_resource_name) ()
    =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     rules = rules_;
     max_devices = max_devices_;
     clear_max_devices = clear_max_devices_;
   }
    : update_device_pool_request)

let make_update_device_instance_request ?profile_arn:(profile_arn_ : amazon_resource_name option)
    ?labels:(labels_ : instance_labels option) ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; profile_arn = profile_arn_; labels = labels_ } : update_device_instance_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : device_farm_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : device_farm_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_device_filter ~attribute:(attribute_ : device_filter_attribute)
    ~operator:(operator_ : rule_operator) ~values:(values_ : device_filter_values) () =
  ({ attribute = attribute_; operator = operator_; values = values_ } : device_filter)

let make_location ~latitude:(latitude_ : double) ~longitude:(longitude_ : double) () =
  ({ latitude = latitude_; longitude = longitude_ } : location)

let make_radios ?wifi:(wifi_ : boolean_ option) ?bluetooth:(bluetooth_ : boolean_ option)
    ?nfc:(nfc_ : boolean_ option) ?gps:(gps_ : boolean_ option) () =
  ({ wifi = wifi_; bluetooth = bluetooth_; nfc = nfc_; gps = gps_ } : radios)

let make_run ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?type_:(type__ : test_type option) ?platform:(platform_ : device_platform option)
    ?created:(created_ : date_time option) ?status:(status_ : execution_status option)
    ?result_:(result__ : execution_result option) ?started:(started_ : date_time option)
    ?stopped:(stopped_ : date_time option) ?counters:(counters_ : counters option)
    ?message:(message_ : message option) ?total_jobs:(total_jobs_ : integer option)
    ?completed_jobs:(completed_jobs_ : integer option)
    ?billing_method:(billing_method_ : billing_method option)
    ?device_minutes:(device_minutes_ : device_minutes option)
    ?network_profile:(network_profile_ : network_profile option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?parsing_result_url:(parsing_result_url_ : string_ option)
    ?result_code:(result_code_ : execution_result_code option) ?seed:(seed_ : integer option)
    ?app_upload:(app_upload_ : amazon_resource_name option)
    ?event_count:(event_count_ : integer option)
    ?job_timeout_minutes:(job_timeout_minutes_ : job_timeout_minutes option)
    ?device_pool_arn:(device_pool_arn_ : amazon_resource_name option)
    ?locale:(locale_ : string_ option) ?radios:(radios_ : radios option)
    ?location:(location_ : location option)
    ?customer_artifact_paths:(customer_artifact_paths_ : customer_artifact_paths option)
    ?web_url:(web_url_ : string_ option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option)
    ?test_spec_arn:(test_spec_arn_ : amazon_resource_name option)
    ?device_selection_result:(device_selection_result_ : device_selection_result option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option)
    ?environment_variables:(environment_variables_ : environment_variables option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     platform = platform_;
     created = created_;
     status = status_;
     result_ = result__;
     started = started_;
     stopped = stopped_;
     counters = counters_;
     message = message_;
     total_jobs = total_jobs_;
     completed_jobs = completed_jobs_;
     billing_method = billing_method_;
     device_minutes = device_minutes_;
     network_profile = network_profile_;
     device_proxy = device_proxy_;
     parsing_result_url = parsing_result_url_;
     result_code = result_code_;
     seed = seed_;
     app_upload = app_upload_;
     event_count = event_count_;
     job_timeout_minutes = job_timeout_minutes_;
     device_pool_arn = device_pool_arn_;
     locale = locale_;
     radios = radios_;
     location = location_;
     customer_artifact_paths = customer_artifact_paths_;
     web_url = web_url_;
     skip_app_resign = skip_app_resign_;
     test_spec_arn = test_spec_arn_;
     device_selection_result = device_selection_result_;
     vpc_config = vpc_config_;
     execution_role_arn = execution_role_arn_;
     environment_variables = environment_variables_;
   }
    : run)

let make_stop_run_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_run_request)

let make_stop_remote_access_session_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_remote_access_session_request)

let make_job ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?type_:(type__ : test_type option) ?created:(created_ : date_time option)
    ?status:(status_ : execution_status option) ?result_:(result__ : execution_result option)
    ?started:(started_ : date_time option) ?stopped:(stopped_ : date_time option)
    ?counters:(counters_ : counters option) ?message:(message_ : message option)
    ?device:(device_ : device option) ?instance_arn:(instance_arn_ : amazon_resource_name option)
    ?device_minutes:(device_minutes_ : device_minutes option)
    ?video_endpoint:(video_endpoint_ : string_ option)
    ?video_capture:(video_capture_ : video_capture option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     created = created_;
     status = status_;
     result_ = result__;
     started = started_;
     stopped = stopped_;
     counters = counters_;
     message = message_;
     device = device_;
     instance_arn = instance_arn_;
     device_minutes = device_minutes_;
     video_endpoint = video_endpoint_;
     video_capture = video_capture_;
   }
    : job)

let make_stop_job_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : stop_job_request)

let make_execution_configuration
    ?job_timeout_minutes:(job_timeout_minutes_ : job_timeout_minutes option)
    ?accounts_cleanup:(accounts_cleanup_ : accounts_cleanup option)
    ?app_packages_cleanup:(app_packages_cleanup_ : app_packages_cleanup option)
    ?video_capture:(video_capture_ : video_capture option)
    ?skip_app_resign:(skip_app_resign_ : skip_app_resign option) () =
  ({
     job_timeout_minutes = job_timeout_minutes_;
     accounts_cleanup = accounts_cleanup_;
     app_packages_cleanup = app_packages_cleanup_;
     video_capture = video_capture_;
     skip_app_resign = skip_app_resign_;
   }
    : execution_configuration)

let make_schedule_run_configuration
    ?extra_data_package_arn:(extra_data_package_arn_ : amazon_resource_name option)
    ?network_profile_arn:(network_profile_arn_ : amazon_resource_name option)
    ?locale:(locale_ : string_ option) ?location:(location_ : location option)
    ?vpce_configuration_arns:(vpce_configuration_arns_ : amazon_resource_names option)
    ?device_proxy:(device_proxy_ : device_proxy option)
    ?customer_artifact_paths:(customer_artifact_paths_ : customer_artifact_paths option)
    ?radios:(radios_ : radios option)
    ?auxiliary_apps:(auxiliary_apps_ : amazon_resource_names option)
    ?billing_method:(billing_method_ : billing_method option)
    ?environment_variables:(environment_variables_ : environment_variables option)
    ?execution_role_arn:(execution_role_arn_ : amazon_role_resource_name option) () =
  ({
     extra_data_package_arn = extra_data_package_arn_;
     network_profile_arn = network_profile_arn_;
     locale = locale_;
     location = location_;
     vpce_configuration_arns = vpce_configuration_arns_;
     device_proxy = device_proxy_;
     customer_artifact_paths = customer_artifact_paths_;
     radios = radios_;
     auxiliary_apps = auxiliary_apps_;
     billing_method = billing_method_;
     environment_variables = environment_variables_;
     execution_role_arn = execution_role_arn_;
   }
    : schedule_run_configuration)

let make_schedule_run_test ?test_package_arn:(test_package_arn_ : amazon_resource_name option)
    ?test_spec_arn:(test_spec_arn_ : amazon_resource_name option) ?filter:(filter_ : filter option)
    ?parameters:(parameters_ : test_parameters option) ~type_:(type__ : test_type) () =
  ({
     type_ = type__;
     test_package_arn = test_package_arn_;
     test_spec_arn = test_spec_arn_;
     filter = filter_;
     parameters = parameters_;
   }
    : schedule_run_test)

let make_device_selection_configuration ~filters:(filters_ : device_filters)
    ~max_devices:(max_devices_ : integer) () =
  ({ filters = filters_; max_devices = max_devices_ } : device_selection_configuration)

let make_schedule_run_request ?app_arn:(app_arn_ : amazon_resource_name option)
    ?device_pool_arn:(device_pool_arn_ : amazon_resource_name option)
    ?device_selection_configuration:
      (device_selection_configuration_ : device_selection_configuration option)
    ?name:(name_ : name option) ?configuration:(configuration_ : schedule_run_configuration option)
    ?execution_configuration:(execution_configuration_ : execution_configuration option)
    ~project_arn:(project_arn_ : amazon_resource_name) ~test:(test_ : schedule_run_test) () =
  ({
     project_arn = project_arn_;
     app_arn = app_arn_;
     device_pool_arn = device_pool_arn_;
     device_selection_configuration = device_selection_configuration_;
     name = name_;
     test = test_;
     configuration = configuration_;
     execution_configuration = execution_configuration_;
   }
    : schedule_run_request)

let make_monetary_amount ?amount:(amount_ : double option)
    ?currency_code:(currency_code_ : currency_code option) () =
  ({ amount = amount_; currency_code = currency_code_ } : monetary_amount)

let make_recurring_charge ?cost:(cost_ : monetary_amount option)
    ?frequency:(frequency_ : recurring_charge_frequency option) () =
  ({ cost = cost_; frequency = frequency_ } : recurring_charge)

let make_offering ?id:(id_ : offering_identifier option)
    ?description:(description_ : message option) ?type_:(type__ : offering_type option)
    ?platform:(platform_ : device_platform option)
    ?recurring_charges:(recurring_charges_ : recurring_charges option) () =
  ({
     id = id_;
     description = description_;
     type_ = type__;
     platform = platform_;
     recurring_charges = recurring_charges_;
   }
    : offering)

let make_offering_status ?type_:(type__ : offering_transaction_type option)
    ?offering:(offering_ : offering option) ?quantity:(quantity_ : integer option)
    ?effective_on:(effective_on_ : date_time option) () =
  ({ type_ = type__; offering = offering_; quantity = quantity_; effective_on = effective_on_ }
    : offering_status)

let make_offering_transaction ?offering_status:(offering_status_ : offering_status option)
    ?transaction_id:(transaction_id_ : transaction_identifier option)
    ?offering_promotion_id:(offering_promotion_id_ : offering_promotion_identifier option)
    ?created_on:(created_on_ : date_time option) ?cost:(cost_ : monetary_amount option) () =
  ({
     offering_status = offering_status_;
     transaction_id = transaction_id_;
     offering_promotion_id = offering_promotion_id_;
     created_on = created_on_;
     cost = cost_;
   }
    : offering_transaction)

let make_renew_offering_request ~offering_id:(offering_id_ : offering_identifier)
    ~quantity:(quantity_ : integer) () =
  ({ offering_id = offering_id_; quantity = quantity_ } : renew_offering_request)

let make_purchase_offering_request
    ?offering_promotion_id:(offering_promotion_id_ : offering_promotion_identifier option)
    ~offering_id:(offering_id_ : offering_identifier) ~quantity:(quantity_ : integer) () =
  ({
     offering_id = offering_id_;
     quantity = quantity_;
     offering_promotion_id = offering_promotion_id_;
   }
    : purchase_offering_request)

let make_list_vpce_configurations_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_vpce_configurations_request)

let make_list_uploads_request ?type_:(type__ : upload_type option)
    ?next_token:(next_token_ : pagination_token option) ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; type_ = type__; next_token = next_token_ } : list_uploads_request)

let make_problem_detail ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option) () =
  ({ arn = arn_; name = name_ } : problem_detail)

let make_problem ?run:(run_ : problem_detail option) ?job:(job_ : problem_detail option)
    ?suite:(suite_ : problem_detail option) ?test:(test_ : problem_detail option)
    ?device:(device_ : device option) ?result_:(result__ : execution_result option)
    ?message:(message_ : message option) () =
  ({
     run = run_;
     job = job_;
     suite = suite_;
     test = test_;
     device = device_;
     result_ = result__;
     message = message_;
   }
    : problem)

let make_unique_problem ?message:(message_ : message option) ?problems:(problems_ : problems option)
    () =
  ({ message = message_; problems = problems_ } : unique_problem)

let make_list_unique_problems_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_unique_problems_request)

let make_test ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?type_:(type__ : test_type option) ?created:(created_ : date_time option)
    ?status:(status_ : execution_status option) ?result_:(result__ : execution_result option)
    ?started:(started_ : date_time option) ?stopped:(stopped_ : date_time option)
    ?counters:(counters_ : counters option) ?message:(message_ : message option)
    ?device_minutes:(device_minutes_ : device_minutes option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     created = created_;
     status = status_;
     result_ = result__;
     started = started_;
     stopped = stopped_;
     counters = counters_;
     message = message_;
     device_minutes = device_minutes_;
   }
    : test)

let make_list_tests_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_tests_request)

let make_test_grid_session ?arn:(arn_ : device_farm_arn option)
    ?status:(status_ : test_grid_session_status option) ?created:(created_ : date_time option)
    ?ended:(ended_ : date_time option) ?billing_minutes:(billing_minutes_ : double option)
    ?selenium_properties:(selenium_properties_ : string_ option) () =
  ({
     arn = arn_;
     status = status_;
     created = created_;
     ended = ended_;
     billing_minutes = billing_minutes_;
     selenium_properties = selenium_properties_;
   }
    : test_grid_session)

let make_list_test_grid_sessions_request ?status:(status_ : test_grid_session_status option)
    ?creation_time_after:(creation_time_after_ : date_time option)
    ?creation_time_before:(creation_time_before_ : date_time option)
    ?end_time_after:(end_time_after_ : date_time option)
    ?end_time_before:(end_time_before_ : date_time option)
    ?max_result:(max_result_ : max_page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~project_arn:(project_arn_ : device_farm_arn) () =
  ({
     project_arn = project_arn_;
     status = status_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     end_time_after = end_time_after_;
     end_time_before = end_time_before_;
     max_result = max_result_;
     next_token = next_token_;
   }
    : list_test_grid_sessions_request)

let make_test_grid_session_artifact ?filename:(filename_ : string_ option)
    ?type_:(type__ : test_grid_session_artifact_type option) ?url:(url_ : sensitive_string option)
    () =
  ({ filename = filename_; type_ = type__; url = url_ } : test_grid_session_artifact)

let make_list_test_grid_session_artifacts_request
    ?type_:(type__ : test_grid_session_artifact_category option)
    ?max_result:(max_result_ : max_page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~session_arn:(session_arn_ : device_farm_arn) () =
  ({
     session_arn = session_arn_;
     type_ = type__;
     max_result = max_result_;
     next_token = next_token_;
   }
    : list_test_grid_session_artifacts_request)

let make_test_grid_session_action ?action:(action_ : string_ option)
    ?started:(started_ : date_time option) ?duration:(duration_ : long option)
    ?status_code:(status_code_ : string_ option) ?request_method:(request_method_ : string_ option)
    () =
  ({
     action = action_;
     started = started_;
     duration = duration_;
     status_code = status_code_;
     request_method = request_method_;
   }
    : test_grid_session_action)

let make_list_test_grid_session_actions_request ?max_result:(max_result_ : max_page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~session_arn:(session_arn_ : device_farm_arn) () =
  ({ session_arn = session_arn_; max_result = max_result_; next_token = next_token_ }
    : list_test_grid_session_actions_request)

let make_list_test_grid_projects_request ?max_result:(max_result_ : max_page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_result = max_result_; next_token = next_token_ } : list_test_grid_projects_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : device_farm_arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_suite ?arn:(arn_ : amazon_resource_name option) ?name:(name_ : name option)
    ?type_:(type__ : test_type option) ?created:(created_ : date_time option)
    ?status:(status_ : execution_status option) ?result_:(result__ : execution_result option)
    ?started:(started_ : date_time option) ?stopped:(stopped_ : date_time option)
    ?counters:(counters_ : counters option) ?message:(message_ : message option)
    ?device_minutes:(device_minutes_ : device_minutes option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     created = created_;
     status = status_;
     result_ = result__;
     started = started_;
     stopped = stopped_;
     counters = counters_;
     message = message_;
     device_minutes = device_minutes_;
   }
    : suite)

let make_list_suites_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_suites_request)

let make_sample ?arn:(arn_ : amazon_resource_name option) ?type_:(type__ : sample_type option)
    ?url:(url_ : ur_l option) () =
  ({ arn = arn_; type_ = type__; url = url_ } : sample)

let make_list_samples_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_samples_request)

let make_list_runs_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_runs_request)

let make_list_remote_access_sessions_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_remote_access_sessions_request)

let make_list_projects_request ?arn:(arn_ : amazon_resource_name option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ arn = arn_; next_token = next_token_ } : list_projects_request)

let make_list_offering_transactions_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offering_transactions_request)

let make_list_offerings_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offerings_request)

let make_offering_promotion ?id:(id_ : offering_promotion_identifier option)
    ?description:(description_ : message option) () =
  ({ id = id_; description = description_ } : offering_promotion)

let make_list_offering_promotions_request ?next_token:(next_token_ : pagination_token option) () =
  ({ next_token = next_token_ } : list_offering_promotions_request)

let make_list_network_profiles_request ?type_:(type__ : network_profile_type option)
    ?next_token:(next_token_ : pagination_token option) ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; type_ = type__; next_token = next_token_ } : list_network_profiles_request)

let make_list_jobs_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; next_token = next_token_ } : list_jobs_request)

let make_list_instance_profiles_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_instance_profiles_request)

let make_list_devices_request ?arn:(arn_ : amazon_resource_name option)
    ?next_token:(next_token_ : pagination_token option) ?filters:(filters_ : device_filters option)
    () =
  ({ arn = arn_; next_token = next_token_; filters = filters_ } : list_devices_request)

let make_list_device_pools_request ?type_:(type__ : device_pool_type option)
    ?next_token:(next_token_ : pagination_token option) ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_; type_ = type__; next_token = next_token_ } : list_device_pools_request)

let make_list_device_instances_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_device_instances_request)

let make_list_artifacts_request ?next_token:(next_token_ : pagination_token option)
    ~arn:(arn_ : amazon_resource_name) ~type_:(type__ : artifact_category) () =
  ({ arn = arn_; type_ = type__; next_token = next_token_ } : list_artifacts_request)

let make_install_to_remote_access_session_request
    ~remote_access_session_arn:(remote_access_session_arn_ : amazon_resource_name)
    ~app_arn:(app_arn_ : amazon_resource_name) () =
  ({ remote_access_session_arn = remote_access_session_arn_; app_arn = app_arn_ }
    : install_to_remote_access_session_request)

let make_get_vpce_configuration_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_vpce_configuration_request)

let make_get_upload_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_upload_request)

let make_get_test_grid_session_request ?project_arn:(project_arn_ : device_farm_arn option)
    ?session_id:(session_id_ : resource_id option)
    ?session_arn:(session_arn_ : device_farm_arn option) () =
  ({ project_arn = project_arn_; session_id = session_id_; session_arn = session_arn_ }
    : get_test_grid_session_request)

let make_get_test_grid_project_request ~project_arn:(project_arn_ : device_farm_arn) () =
  ({ project_arn = project_arn_ } : get_test_grid_project_request)

let make_get_test_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_test_request)

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

let make_incompatibility_message ?message:(message_ : message option)
    ?type_:(type__ : device_attribute option) () =
  ({ message = message_; type_ = type__ } : incompatibility_message)

let make_get_device_pool_compatibility_request ?app_arn:(app_arn_ : amazon_resource_name option)
    ?test_type:(test_type_ : test_type option) ?test:(test_ : schedule_run_test option)
    ?configuration:(configuration_ : schedule_run_configuration option)
    ?project_arn:(project_arn_ : amazon_resource_name option)
    ~device_pool_arn:(device_pool_arn_ : amazon_resource_name) () =
  ({
     device_pool_arn = device_pool_arn_;
     app_arn = app_arn_;
     test_type = test_type_;
     test = test_;
     configuration = configuration_;
     project_arn = project_arn_;
   }
    : get_device_pool_compatibility_request)

let make_get_device_pool_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_pool_request)

let make_get_device_instance_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_instance_request)

let make_get_device_request ~arn:(arn_ : amazon_resource_name) () =
  ({ arn = arn_ } : get_device_request)

let make_get_account_settings_request () = (() : unit)
