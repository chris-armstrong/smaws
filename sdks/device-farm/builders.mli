open Types

val make_vpc_config :
  vpc_id:non_empty_string ->
  subnet_ids:vpc_subnet_ids ->
  security_group_ids:vpc_security_group_ids ->
  unit ->
  vpc_config

val make_vpce_configuration :
  ?vpce_configuration_description:vpce_configuration_description ->
  ?service_dns_name:service_dns_name ->
  ?vpce_service_name:vpce_service_name ->
  ?vpce_configuration_name:vpce_configuration_name ->
  ?arn:amazon_resource_name ->
  unit ->
  vpce_configuration

val make_upload :
  ?category:upload_category ->
  ?message:message ->
  ?content_type:content_type ->
  ?metadata:metadata ->
  ?url:sensitive_ur_l ->
  ?status:upload_status ->
  ?type_:upload_type ->
  ?created:date_time ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  upload

val make_update_vpce_configuration_request :
  ?vpce_configuration_description:vpce_configuration_description ->
  ?service_dns_name:service_dns_name ->
  ?vpce_service_name:vpce_service_name ->
  ?vpce_configuration_name:vpce_configuration_name ->
  arn:amazon_resource_name ->
  unit ->
  update_vpce_configuration_request

val make_update_upload_request :
  ?edit_content:boolean_ ->
  ?content_type:content_type ->
  ?name:name ->
  arn:amazon_resource_name ->
  unit ->
  update_upload_request

val make_test_grid_vpc_config :
  vpc_id:non_empty_string ->
  subnet_ids:subnet_ids ->
  security_group_ids:security_group_ids ->
  unit ->
  test_grid_vpc_config

val make_test_grid_project :
  ?created:date_time ->
  ?vpc_config:test_grid_vpc_config ->
  ?description:string_ ->
  ?name:string_ ->
  ?arn:device_farm_arn ->
  unit ->
  test_grid_project

val make_update_test_grid_project_request :
  ?vpc_config:test_grid_vpc_config ->
  ?description:resource_description ->
  ?name:resource_name ->
  project_arn:device_farm_arn ->
  unit ->
  update_test_grid_project_request

val make_environment_variable :
  value:environment_variable_value -> name:environment_variable_name -> unit -> environment_variable

val make_project :
  ?execution_role_arn:amazon_role_resource_name ->
  ?environment_variables:environment_variables ->
  ?vpc_config:vpc_config ->
  ?created:date_time ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  project

val make_update_project_request :
  ?execution_role_arn:amazon_role_resource_name ->
  ?environment_variables:environment_variables ->
  ?vpc_config:vpc_config ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?name:name ->
  arn:amazon_resource_name ->
  unit ->
  update_project_request

val make_network_profile :
  ?downlink_loss_percent:percent_integer ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_jitter_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_delay_ms:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_bandwidth_bits:long ->
  ?type_:network_profile_type ->
  ?description:message ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  network_profile

val make_update_network_profile_request :
  ?downlink_loss_percent:percent_integer ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_jitter_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_delay_ms:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_bandwidth_bits:long ->
  ?type_:network_profile_type ->
  ?description:message ->
  ?name:name ->
  arn:amazon_resource_name ->
  unit ->
  update_network_profile_request

val make_instance_profile :
  ?description:message ->
  ?name:name ->
  ?reboot_after_use:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?package_cleanup:boolean_ ->
  ?arn:amazon_resource_name ->
  unit ->
  instance_profile

val make_update_instance_profile_request :
  ?reboot_after_use:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?package_cleanup:boolean_ ->
  ?description:message ->
  ?name:name ->
  arn:amazon_resource_name ->
  unit ->
  update_instance_profile_request

val make_rule :
  ?value:string_ -> ?operator:rule_operator -> ?attribute:device_attribute -> unit -> rule

val make_device_pool :
  ?max_devices:integer ->
  ?rules:rules ->
  ?type_:device_pool_type ->
  ?description:message ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  device_pool

val make_update_device_pool_request :
  ?clear_max_devices:boolean_ ->
  ?max_devices:integer ->
  ?rules:rules ->
  ?description:message ->
  ?name:name ->
  arn:amazon_resource_name ->
  unit ->
  update_device_pool_request

val make_device_instance :
  ?instance_profile:instance_profile ->
  ?udid:string_ ->
  ?status:instance_status ->
  ?labels:instance_labels ->
  ?device_arn:amazon_resource_name ->
  ?arn:amazon_resource_name ->
  unit ->
  device_instance

val make_update_device_instance_request :
  ?labels:instance_labels ->
  ?profile_arn:amazon_resource_name ->
  arn:amazon_resource_name ->
  unit ->
  update_device_instance_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:device_farm_arn -> unit -> untag_resource_request

val make_problem_detail : ?name:name -> ?arn:amazon_resource_name -> unit -> problem_detail
val make_cp_u : ?clock:double -> ?architecture:string_ -> ?frequency:string_ -> unit -> cp_u
val make_resolution : ?height:integer -> ?width:integer -> unit -> resolution

val make_device :
  ?availability:device_availability ->
  ?instances:device_instances ->
  ?fleet_name:string_ ->
  ?fleet_type:string_ ->
  ?remote_debug_enabled:boolean_ ->
  ?remote_access_enabled:boolean_ ->
  ?radio:string_ ->
  ?carrier:string_ ->
  ?image:string_ ->
  ?memory:long ->
  ?heap_size:long ->
  ?resolution:resolution ->
  ?cpu:cp_u ->
  ?os:string_ ->
  ?platform:device_platform ->
  ?form_factor:device_form_factor ->
  ?model_id:string_ ->
  ?model:string_ ->
  ?manufacturer:string_ ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  device

val make_problem :
  ?message:message ->
  ?result_:execution_result ->
  ?device:device ->
  ?test:problem_detail ->
  ?suite:problem_detail ->
  ?job:problem_detail ->
  ?run:problem_detail ->
  unit ->
  problem

val make_unique_problem : ?problems:problems -> ?message:message -> unit -> unique_problem
val make_trial_minutes : ?remaining:double -> ?total:double -> unit -> trial_minutes

val make_counters :
  ?skipped:integer ->
  ?stopped:integer ->
  ?errored:integer ->
  ?warned:integer ->
  ?failed:integer ->
  ?passed:integer ->
  ?total:integer ->
  unit ->
  counters

val make_device_minutes :
  ?unmetered:double -> ?metered:double -> ?total:double -> unit -> device_minutes

val make_test :
  ?device_minutes:device_minutes ->
  ?message:message ->
  ?counters:counters ->
  ?stopped:date_time ->
  ?started:date_time ->
  ?result_:execution_result ->
  ?status:execution_status ->
  ?created:date_time ->
  ?type_:test_type ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  test

val make_test_grid_session :
  ?selenium_properties:string_ ->
  ?billing_minutes:double ->
  ?ended:date_time ->
  ?created:date_time ->
  ?status:test_grid_session_status ->
  ?arn:device_farm_arn ->
  unit ->
  test_grid_session

val make_test_grid_session_artifact :
  ?url:sensitive_string ->
  ?type_:test_grid_session_artifact_type ->
  ?filename:string_ ->
  unit ->
  test_grid_session_artifact

val make_test_grid_session_action :
  ?request_method:string_ ->
  ?status_code:string_ ->
  ?duration:long ->
  ?started:date_time ->
  ?action:string_ ->
  unit ->
  test_grid_session_action

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:device_farm_arn -> unit -> tag_resource_request

val make_suite :
  ?device_minutes:device_minutes ->
  ?message:message ->
  ?counters:counters ->
  ?stopped:date_time ->
  ?started:date_time ->
  ?result_:execution_result ->
  ?status:execution_status ->
  ?created:date_time ->
  ?type_:test_type ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  suite

val make_device_proxy : port:device_proxy_port -> host:device_proxy_host -> unit -> device_proxy

val make_radios :
  ?gps:boolean_ -> ?nfc:boolean_ -> ?bluetooth:boolean_ -> ?wifi:boolean_ -> unit -> radios

val make_location : longitude:double -> latitude:double -> unit -> location

val make_customer_artifact_paths :
  ?device_host_paths:device_host_paths ->
  ?android_paths:android_paths ->
  ?ios_paths:ios_paths ->
  unit ->
  customer_artifact_paths

val make_device_filter :
  values:device_filter_values ->
  operator:rule_operator ->
  attribute:device_filter_attribute ->
  unit ->
  device_filter

val make_run :
  ?environment_variables:environment_variables ->
  ?execution_role_arn:amazon_role_resource_name ->
  ?vpc_config:vpc_config ->
  ?device_selection_result:device_selection_result ->
  ?test_spec_arn:amazon_resource_name ->
  ?skip_app_resign:skip_app_resign ->
  ?web_url:string_ ->
  ?customer_artifact_paths:customer_artifact_paths ->
  ?location:location ->
  ?radios:radios ->
  ?locale:string_ ->
  ?device_pool_arn:amazon_resource_name ->
  ?job_timeout_minutes:job_timeout_minutes ->
  ?event_count:integer ->
  ?app_upload:amazon_resource_name ->
  ?seed:integer ->
  ?result_code:execution_result_code ->
  ?parsing_result_url:string_ ->
  ?device_proxy:device_proxy ->
  ?network_profile:network_profile ->
  ?device_minutes:device_minutes ->
  ?billing_method:billing_method ->
  ?completed_jobs:integer ->
  ?total_jobs:integer ->
  ?message:message ->
  ?counters:counters ->
  ?stopped:date_time ->
  ?started:date_time ->
  ?result_:execution_result ->
  ?status:execution_status ->
  ?created:date_time ->
  ?platform:device_platform ->
  ?type_:test_type ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  run

val make_stop_run_request : arn:amazon_resource_name -> unit -> stop_run_request

val make_remote_access_endpoints :
  ?interactive_endpoint:sensitive_ur_l ->
  ?remote_driver_endpoint:sensitive_ur_l ->
  unit ->
  remote_access_endpoints

val make_remote_access_session :
  ?endpoints:remote_access_endpoints ->
  ?app_upload:amazon_resource_name ->
  ?device_proxy:device_proxy ->
  ?vpc_config:vpc_config ->
  ?skip_app_resign:skip_app_resign ->
  ?interaction_mode:interaction_mode ->
  ?device_udid:string_ ->
  ?endpoint:string_ ->
  ?device_minutes:device_minutes ->
  ?billing_method:billing_method ->
  ?instance_arn:amazon_resource_name ->
  ?device:device ->
  ?stopped:date_time ->
  ?started:date_time ->
  ?message:message ->
  ?result_:execution_result ->
  ?status:execution_status ->
  ?created:date_time ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  remote_access_session

val make_stop_remote_access_session_request :
  arn:amazon_resource_name -> unit -> stop_remote_access_session_request

val make_job :
  ?video_capture:video_capture ->
  ?video_endpoint:string_ ->
  ?device_minutes:device_minutes ->
  ?instance_arn:amazon_resource_name ->
  ?device:device ->
  ?message:message ->
  ?counters:counters ->
  ?stopped:date_time ->
  ?started:date_time ->
  ?result_:execution_result ->
  ?status:execution_status ->
  ?created:date_time ->
  ?type_:test_type ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  job

val make_stop_job_request : arn:amazon_resource_name -> unit -> stop_job_request

val make_schedule_run_test :
  ?parameters:test_parameters ->
  ?filter:filter ->
  ?test_spec_arn:amazon_resource_name ->
  ?test_package_arn:amazon_resource_name ->
  type_:test_type ->
  unit ->
  schedule_run_test

val make_device_selection_configuration :
  max_devices:integer -> filters:device_filters -> unit -> device_selection_configuration

val make_schedule_run_configuration :
  ?execution_role_arn:amazon_role_resource_name ->
  ?environment_variables:environment_variables ->
  ?billing_method:billing_method ->
  ?auxiliary_apps:amazon_resource_names ->
  ?radios:radios ->
  ?customer_artifact_paths:customer_artifact_paths ->
  ?device_proxy:device_proxy ->
  ?vpce_configuration_arns:amazon_resource_names ->
  ?location:location ->
  ?locale:string_ ->
  ?network_profile_arn:amazon_resource_name ->
  ?extra_data_package_arn:amazon_resource_name ->
  unit ->
  schedule_run_configuration

val make_execution_configuration :
  ?skip_app_resign:skip_app_resign ->
  ?video_capture:video_capture ->
  ?app_packages_cleanup:app_packages_cleanup ->
  ?accounts_cleanup:accounts_cleanup ->
  ?job_timeout_minutes:job_timeout_minutes ->
  unit ->
  execution_configuration

val make_schedule_run_request :
  ?execution_configuration:execution_configuration ->
  ?configuration:schedule_run_configuration ->
  ?name:name ->
  ?device_selection_configuration:device_selection_configuration ->
  ?device_pool_arn:amazon_resource_name ->
  ?app_arn:amazon_resource_name ->
  test:schedule_run_test ->
  project_arn:amazon_resource_name ->
  unit ->
  schedule_run_request

val make_sample : ?url:ur_l -> ?type_:sample_type -> ?arn:amazon_resource_name -> unit -> sample
val make_monetary_amount : ?currency_code:currency_code -> ?amount:double -> unit -> monetary_amount

val make_recurring_charge :
  ?frequency:recurring_charge_frequency -> ?cost:monetary_amount -> unit -> recurring_charge

val make_offering :
  ?recurring_charges:recurring_charges ->
  ?platform:device_platform ->
  ?type_:offering_type ->
  ?description:message ->
  ?id:offering_identifier ->
  unit ->
  offering

val make_offering_status :
  ?effective_on:date_time ->
  ?quantity:integer ->
  ?offering:offering ->
  ?type_:offering_transaction_type ->
  unit ->
  offering_status

val make_offering_transaction :
  ?cost:monetary_amount ->
  ?created_on:date_time ->
  ?offering_promotion_id:offering_promotion_identifier ->
  ?transaction_id:transaction_identifier ->
  ?offering_status:offering_status ->
  unit ->
  offering_transaction

val make_renew_offering_request :
  quantity:integer -> offering_id:offering_identifier -> unit -> renew_offering_request

val make_purchase_offering_request :
  ?offering_promotion_id:offering_promotion_identifier ->
  quantity:integer ->
  offering_id:offering_identifier ->
  unit ->
  purchase_offering_request

val make_offering_promotion :
  ?description:message -> ?id:offering_promotion_identifier -> unit -> offering_promotion

val make_list_vpce_configurations_request :
  ?next_token:pagination_token -> ?max_results:integer -> unit -> list_vpce_configurations_request

val make_list_uploads_request :
  ?next_token:pagination_token ->
  ?type_:upload_type ->
  arn:amazon_resource_name ->
  unit ->
  list_uploads_request

val make_list_unique_problems_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_unique_problems_request

val make_list_tests_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_tests_request

val make_list_test_grid_sessions_request :
  ?next_token:pagination_token ->
  ?max_result:max_page_size ->
  ?end_time_before:date_time ->
  ?end_time_after:date_time ->
  ?creation_time_before:date_time ->
  ?creation_time_after:date_time ->
  ?status:test_grid_session_status ->
  project_arn:device_farm_arn ->
  unit ->
  list_test_grid_sessions_request

val make_list_test_grid_session_artifacts_request :
  ?next_token:pagination_token ->
  ?max_result:max_page_size ->
  ?type_:test_grid_session_artifact_category ->
  session_arn:device_farm_arn ->
  unit ->
  list_test_grid_session_artifacts_request

val make_list_test_grid_session_actions_request :
  ?next_token:pagination_token ->
  ?max_result:max_page_size ->
  session_arn:device_farm_arn ->
  unit ->
  list_test_grid_session_actions_request

val make_list_test_grid_projects_request :
  ?next_token:pagination_token ->
  ?max_result:max_page_size ->
  unit ->
  list_test_grid_projects_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:device_farm_arn -> unit -> list_tags_for_resource_request

val make_list_suites_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_suites_request

val make_list_samples_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_samples_request

val make_list_runs_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_runs_request

val make_list_remote_access_sessions_request :
  ?next_token:pagination_token ->
  arn:amazon_resource_name ->
  unit ->
  list_remote_access_sessions_request

val make_list_projects_request :
  ?next_token:pagination_token -> ?arn:amazon_resource_name -> unit -> list_projects_request

val make_list_offerings_request : ?next_token:pagination_token -> unit -> list_offerings_request

val make_list_offering_transactions_request :
  ?next_token:pagination_token -> unit -> list_offering_transactions_request

val make_list_offering_promotions_request :
  ?next_token:pagination_token -> unit -> list_offering_promotions_request

val make_list_network_profiles_request :
  ?next_token:pagination_token ->
  ?type_:network_profile_type ->
  arn:amazon_resource_name ->
  unit ->
  list_network_profiles_request

val make_list_jobs_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_jobs_request

val make_list_instance_profiles_request :
  ?next_token:pagination_token -> ?max_results:integer -> unit -> list_instance_profiles_request

val make_list_devices_request :
  ?filters:device_filters ->
  ?next_token:pagination_token ->
  ?arn:amazon_resource_name ->
  unit ->
  list_devices_request

val make_list_device_pools_request :
  ?next_token:pagination_token ->
  ?type_:device_pool_type ->
  arn:amazon_resource_name ->
  unit ->
  list_device_pools_request

val make_list_device_instances_request :
  ?next_token:pagination_token -> ?max_results:integer -> unit -> list_device_instances_request

val make_artifact :
  ?url:ur_l ->
  ?extension:string_ ->
  ?type_:artifact_type ->
  ?name:name ->
  ?arn:amazon_resource_name ->
  unit ->
  artifact

val make_list_artifacts_request :
  ?next_token:pagination_token ->
  type_:artifact_category ->
  arn:amazon_resource_name ->
  unit ->
  list_artifacts_request

val make_install_to_remote_access_session_request :
  app_arn:amazon_resource_name ->
  remote_access_session_arn:amazon_resource_name ->
  unit ->
  install_to_remote_access_session_request

val make_incompatibility_message :
  ?type_:device_attribute -> ?message:message -> unit -> incompatibility_message

val make_get_vpce_configuration_request :
  arn:amazon_resource_name -> unit -> get_vpce_configuration_request

val make_get_upload_request : arn:amazon_resource_name -> unit -> get_upload_request
val make_get_test_request : arn:amazon_resource_name -> unit -> get_test_request

val make_get_test_grid_session_request :
  ?session_arn:device_farm_arn ->
  ?session_id:resource_id ->
  ?project_arn:device_farm_arn ->
  unit ->
  get_test_grid_session_request

val make_get_test_grid_project_request :
  project_arn:device_farm_arn -> unit -> get_test_grid_project_request

val make_get_suite_request : arn:amazon_resource_name -> unit -> get_suite_request
val make_get_run_request : arn:amazon_resource_name -> unit -> get_run_request

val make_get_remote_access_session_request :
  arn:amazon_resource_name -> unit -> get_remote_access_session_request

val make_get_project_request : arn:amazon_resource_name -> unit -> get_project_request

val make_get_offering_status_request :
  ?next_token:pagination_token -> unit -> get_offering_status_request

val make_get_network_profile_request :
  arn:amazon_resource_name -> unit -> get_network_profile_request

val make_get_job_request : arn:amazon_resource_name -> unit -> get_job_request

val make_get_instance_profile_request :
  arn:amazon_resource_name -> unit -> get_instance_profile_request

val make_get_device_request : arn:amazon_resource_name -> unit -> get_device_request
val make_get_device_pool_request : arn:amazon_resource_name -> unit -> get_device_pool_request

val make_get_device_pool_compatibility_request :
  ?project_arn:amazon_resource_name ->
  ?configuration:schedule_run_configuration ->
  ?test:schedule_run_test ->
  ?test_type:test_type ->
  ?app_arn:amazon_resource_name ->
  device_pool_arn:amazon_resource_name ->
  unit ->
  get_device_pool_compatibility_request

val make_get_device_instance_request :
  arn:amazon_resource_name -> unit -> get_device_instance_request

val make_account_settings :
  ?skip_app_resign:skip_app_resign ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?max_slots:max_slot_map ->
  ?trial_minutes:trial_minutes ->
  ?max_job_timeout_minutes:job_timeout_minutes ->
  ?unmetered_remote_access_devices:purchased_devices_map ->
  ?unmetered_devices:purchased_devices_map ->
  ?aws_account_number:aws_account_number ->
  unit ->
  account_settings

val make_get_account_settings_request : unit -> unit

val make_delete_vpce_configuration_request :
  arn:amazon_resource_name -> unit -> delete_vpce_configuration_request

val make_delete_upload_request : arn:amazon_resource_name -> unit -> delete_upload_request

val make_delete_test_grid_project_request :
  project_arn:device_farm_arn -> unit -> delete_test_grid_project_request

val make_delete_run_request : arn:amazon_resource_name -> unit -> delete_run_request

val make_delete_remote_access_session_request :
  arn:amazon_resource_name -> unit -> delete_remote_access_session_request

val make_delete_project_request : arn:amazon_resource_name -> unit -> delete_project_request

val make_delete_network_profile_request :
  arn:amazon_resource_name -> unit -> delete_network_profile_request

val make_delete_instance_profile_request :
  arn:amazon_resource_name -> unit -> delete_instance_profile_request

val make_delete_device_pool_request : arn:amazon_resource_name -> unit -> delete_device_pool_request

val make_create_vpce_configuration_request :
  ?vpce_configuration_description:vpce_configuration_description ->
  service_dns_name:service_dns_name ->
  vpce_service_name:vpce_service_name ->
  vpce_configuration_name:vpce_configuration_name ->
  unit ->
  create_vpce_configuration_request

val make_create_upload_request :
  ?content_type:content_type ->
  type_:upload_type ->
  name:name ->
  project_arn:amazon_resource_name ->
  unit ->
  create_upload_request

val make_create_test_grid_url_request :
  expires_in_seconds:test_grid_url_expires_in_seconds_input ->
  project_arn:device_farm_arn ->
  unit ->
  create_test_grid_url_request

val make_create_test_grid_project_request :
  ?vpc_config:test_grid_vpc_config ->
  ?description:resource_description ->
  name:resource_name ->
  unit ->
  create_test_grid_project_request

val make_create_remote_access_session_configuration :
  ?device_proxy:device_proxy ->
  ?vpce_configuration_arns:amazon_resource_names ->
  ?billing_method:billing_method ->
  ?auxiliary_apps:auxiliary_app_arn_list ->
  unit ->
  create_remote_access_session_configuration

val make_create_remote_access_session_request :
  ?skip_app_resign:boolean_ ->
  ?interaction_mode:interaction_mode ->
  ?configuration:create_remote_access_session_configuration ->
  ?name:name ->
  ?instance_arn:amazon_resource_name ->
  ?app_arn:amazon_resource_name ->
  device_arn:amazon_resource_name ->
  project_arn:amazon_resource_name ->
  unit ->
  create_remote_access_session_request

val make_create_project_request :
  ?execution_role_arn:amazon_role_resource_name ->
  ?environment_variables:environment_variables ->
  ?vpc_config:vpc_config ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  name:name ->
  unit ->
  create_project_request

val make_create_network_profile_request :
  ?downlink_loss_percent:percent_integer ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_jitter_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_delay_ms:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_bandwidth_bits:long ->
  ?type_:network_profile_type ->
  ?description:message ->
  name:name ->
  project_arn:amazon_resource_name ->
  unit ->
  create_network_profile_request

val make_create_instance_profile_request :
  ?reboot_after_use:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?package_cleanup:boolean_ ->
  ?description:message ->
  name:name ->
  unit ->
  create_instance_profile_request

val make_create_device_pool_request :
  ?max_devices:integer ->
  ?description:message ->
  rules:rules ->
  name:name ->
  project_arn:amazon_resource_name ->
  unit ->
  create_device_pool_request
