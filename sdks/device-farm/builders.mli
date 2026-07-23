open Types

val make_trial_minutes : ?total:double -> ?remaining:double -> unit -> trial_minutes

val make_account_settings :
  ?aws_account_number:aws_account_number ->
  ?unmetered_devices:purchased_devices_map ->
  ?unmetered_remote_access_devices:purchased_devices_map ->
  ?max_job_timeout_minutes:job_timeout_minutes ->
  ?trial_minutes:trial_minutes ->
  ?max_slots:max_slot_map ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?skip_app_resign:skip_app_resign ->
  unit ->
  account_settings

val make_artifact :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?type_:artifact_type ->
  ?extension:string_ ->
  ?url:ur_l ->
  unit ->
  artifact

val make_cp_u : ?frequency:string_ -> ?architecture:string_ -> ?clock:double -> unit -> cp_u

val make_counters :
  ?total:integer ->
  ?passed:integer ->
  ?failed:integer ->
  ?warned:integer ->
  ?errored:integer ->
  ?stopped:integer ->
  ?skipped:integer ->
  unit ->
  counters

val make_rule :
  ?attribute:device_attribute -> ?operator:rule_operator -> ?value:string_ -> unit -> rule

val make_device_pool :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?description:message ->
  ?type_:device_pool_type ->
  ?rules:rules ->
  ?max_devices:integer ->
  unit ->
  device_pool

val make_create_device_pool_request :
  ?description:message ->
  ?max_devices:integer ->
  project_arn:amazon_resource_name ->
  name:name ->
  rules:rules ->
  unit ->
  create_device_pool_request

val make_instance_profile :
  ?arn:amazon_resource_name ->
  ?package_cleanup:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?reboot_after_use:boolean_ ->
  ?name:name ->
  ?description:message ->
  unit ->
  instance_profile

val make_create_instance_profile_request :
  ?description:message ->
  ?package_cleanup:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?reboot_after_use:boolean_ ->
  name:name ->
  unit ->
  create_instance_profile_request

val make_network_profile :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?description:message ->
  ?type_:network_profile_type ->
  ?uplink_bandwidth_bits:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_delay_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_jitter_ms:long ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_loss_percent:percent_integer ->
  unit ->
  network_profile

val make_create_network_profile_request :
  ?description:message ->
  ?type_:network_profile_type ->
  ?uplink_bandwidth_bits:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_delay_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_jitter_ms:long ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_loss_percent:percent_integer ->
  project_arn:amazon_resource_name ->
  name:name ->
  unit ->
  create_network_profile_request

val make_environment_variable :
  name:environment_variable_name -> value:environment_variable_value -> unit -> environment_variable

val make_vpc_config :
  security_group_ids:vpc_security_group_ids ->
  subnet_ids:vpc_subnet_ids ->
  vpc_id:non_empty_string ->
  unit ->
  vpc_config

val make_project :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?created:date_time ->
  ?vpc_config:vpc_config ->
  ?environment_variables:environment_variables ->
  ?execution_role_arn:amazon_role_resource_name ->
  unit ->
  project

val make_create_project_request :
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?vpc_config:vpc_config ->
  ?environment_variables:environment_variables ->
  ?execution_role_arn:amazon_role_resource_name ->
  name:name ->
  unit ->
  create_project_request

val make_remote_access_endpoints :
  ?remote_driver_endpoint:sensitive_ur_l ->
  ?interactive_endpoint:sensitive_ur_l ->
  unit ->
  remote_access_endpoints

val make_device_proxy : host:device_proxy_host -> port:device_proxy_port -> unit -> device_proxy

val make_device_minutes :
  ?total:double -> ?metered:double -> ?unmetered:double -> unit -> device_minutes

val make_device_instance :
  ?arn:amazon_resource_name ->
  ?device_arn:amazon_resource_name ->
  ?labels:instance_labels ->
  ?status:instance_status ->
  ?udid:string_ ->
  ?instance_profile:instance_profile ->
  unit ->
  device_instance

val make_resolution : ?width:integer -> ?height:integer -> unit -> resolution

val make_device :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?manufacturer:string_ ->
  ?model:string_ ->
  ?model_id:string_ ->
  ?form_factor:device_form_factor ->
  ?platform:device_platform ->
  ?os:string_ ->
  ?cpu:cp_u ->
  ?resolution:resolution ->
  ?heap_size:long ->
  ?memory:long ->
  ?image:string_ ->
  ?carrier:string_ ->
  ?radio:string_ ->
  ?remote_access_enabled:boolean_ ->
  ?remote_debug_enabled:boolean_ ->
  ?fleet_type:string_ ->
  ?fleet_name:string_ ->
  ?instances:device_instances ->
  ?availability:device_availability ->
  unit ->
  device

val make_remote_access_session :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?created:date_time ->
  ?status:execution_status ->
  ?result_:execution_result ->
  ?message:message ->
  ?started:date_time ->
  ?stopped:date_time ->
  ?device:device ->
  ?instance_arn:amazon_resource_name ->
  ?billing_method:billing_method ->
  ?device_minutes:device_minutes ->
  ?endpoint:string_ ->
  ?device_udid:string_ ->
  ?interaction_mode:interaction_mode ->
  ?skip_app_resign:skip_app_resign ->
  ?vpc_config:vpc_config ->
  ?device_proxy:device_proxy ->
  ?app_upload:amazon_resource_name ->
  ?endpoints:remote_access_endpoints ->
  unit ->
  remote_access_session

val make_create_remote_access_session_configuration :
  ?auxiliary_apps:auxiliary_app_arn_list ->
  ?billing_method:billing_method ->
  ?vpce_configuration_arns:amazon_resource_names ->
  ?device_proxy:device_proxy ->
  unit ->
  create_remote_access_session_configuration

val make_create_remote_access_session_request :
  ?app_arn:amazon_resource_name ->
  ?instance_arn:amazon_resource_name ->
  ?name:name ->
  ?configuration:create_remote_access_session_configuration ->
  ?interaction_mode:interaction_mode ->
  ?skip_app_resign:boolean_ ->
  project_arn:amazon_resource_name ->
  device_arn:amazon_resource_name ->
  unit ->
  create_remote_access_session_request

val make_test_grid_vpc_config :
  security_group_ids:security_group_ids ->
  subnet_ids:subnet_ids ->
  vpc_id:non_empty_string ->
  unit ->
  test_grid_vpc_config

val make_test_grid_project :
  ?arn:device_farm_arn ->
  ?name:string_ ->
  ?description:string_ ->
  ?vpc_config:test_grid_vpc_config ->
  ?created:date_time ->
  unit ->
  test_grid_project

val make_create_test_grid_project_request :
  ?description:resource_description ->
  ?vpc_config:test_grid_vpc_config ->
  name:resource_name ->
  unit ->
  create_test_grid_project_request

val make_create_test_grid_url_request :
  project_arn:device_farm_arn ->
  expires_in_seconds:test_grid_url_expires_in_seconds_input ->
  unit ->
  create_test_grid_url_request

val make_upload :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?created:date_time ->
  ?type_:upload_type ->
  ?status:upload_status ->
  ?url:sensitive_ur_l ->
  ?metadata:metadata ->
  ?content_type:content_type ->
  ?message:message ->
  ?category:upload_category ->
  unit ->
  upload

val make_create_upload_request :
  ?content_type:content_type ->
  project_arn:amazon_resource_name ->
  name:name ->
  type_:upload_type ->
  unit ->
  create_upload_request

val make_vpce_configuration :
  ?arn:amazon_resource_name ->
  ?vpce_configuration_name:vpce_configuration_name ->
  ?vpce_service_name:vpce_service_name ->
  ?service_dns_name:service_dns_name ->
  ?vpce_configuration_description:vpce_configuration_description ->
  unit ->
  vpce_configuration

val make_create_vpce_configuration_request :
  ?vpce_configuration_description:vpce_configuration_description ->
  vpce_configuration_name:vpce_configuration_name ->
  vpce_service_name:vpce_service_name ->
  service_dns_name:service_dns_name ->
  unit ->
  create_vpce_configuration_request

val make_customer_artifact_paths :
  ?ios_paths:ios_paths ->
  ?android_paths:android_paths ->
  ?device_host_paths:device_host_paths ->
  unit ->
  customer_artifact_paths

val make_delete_device_pool_request : arn:amazon_resource_name -> unit -> delete_device_pool_request

val make_delete_instance_profile_request :
  arn:amazon_resource_name -> unit -> delete_instance_profile_request

val make_delete_network_profile_request :
  arn:amazon_resource_name -> unit -> delete_network_profile_request

val make_delete_project_request : arn:amazon_resource_name -> unit -> delete_project_request

val make_delete_remote_access_session_request :
  arn:amazon_resource_name -> unit -> delete_remote_access_session_request

val make_delete_run_request : arn:amazon_resource_name -> unit -> delete_run_request

val make_delete_test_grid_project_request :
  project_arn:device_farm_arn -> unit -> delete_test_grid_project_request

val make_delete_upload_request : arn:amazon_resource_name -> unit -> delete_upload_request

val make_delete_vpce_configuration_request :
  arn:amazon_resource_name -> unit -> delete_vpce_configuration_request

val make_update_vpce_configuration_request :
  ?vpce_configuration_name:vpce_configuration_name ->
  ?vpce_service_name:vpce_service_name ->
  ?service_dns_name:service_dns_name ->
  ?vpce_configuration_description:vpce_configuration_description ->
  arn:amazon_resource_name ->
  unit ->
  update_vpce_configuration_request

val make_update_upload_request :
  ?name:name ->
  ?content_type:content_type ->
  ?edit_content:boolean_ ->
  arn:amazon_resource_name ->
  unit ->
  update_upload_request

val make_update_test_grid_project_request :
  ?name:resource_name ->
  ?description:resource_description ->
  ?vpc_config:test_grid_vpc_config ->
  project_arn:device_farm_arn ->
  unit ->
  update_test_grid_project_request

val make_update_project_request :
  ?name:name ->
  ?default_job_timeout_minutes:job_timeout_minutes ->
  ?vpc_config:vpc_config ->
  ?environment_variables:environment_variables ->
  ?execution_role_arn:amazon_role_resource_name ->
  arn:amazon_resource_name ->
  unit ->
  update_project_request

val make_update_network_profile_request :
  ?name:name ->
  ?description:message ->
  ?type_:network_profile_type ->
  ?uplink_bandwidth_bits:long ->
  ?downlink_bandwidth_bits:long ->
  ?uplink_delay_ms:long ->
  ?downlink_delay_ms:long ->
  ?uplink_jitter_ms:long ->
  ?downlink_jitter_ms:long ->
  ?uplink_loss_percent:percent_integer ->
  ?downlink_loss_percent:percent_integer ->
  arn:amazon_resource_name ->
  unit ->
  update_network_profile_request

val make_update_instance_profile_request :
  ?name:name ->
  ?description:message ->
  ?package_cleanup:boolean_ ->
  ?exclude_app_packages_from_cleanup:package_ids ->
  ?reboot_after_use:boolean_ ->
  arn:amazon_resource_name ->
  unit ->
  update_instance_profile_request

val make_update_device_pool_request :
  ?name:name ->
  ?description:message ->
  ?rules:rules ->
  ?max_devices:integer ->
  ?clear_max_devices:boolean_ ->
  arn:amazon_resource_name ->
  unit ->
  update_device_pool_request

val make_update_device_instance_request :
  ?profile_arn:amazon_resource_name ->
  ?labels:instance_labels ->
  arn:amazon_resource_name ->
  unit ->
  update_device_instance_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:device_farm_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:device_farm_arn -> tags:tag_list -> unit -> tag_resource_request

val make_device_filter :
  attribute:device_filter_attribute ->
  operator:rule_operator ->
  values:device_filter_values ->
  unit ->
  device_filter

val make_location : latitude:double -> longitude:double -> unit -> location

val make_radios :
  ?wifi:boolean_ -> ?bluetooth:boolean_ -> ?nfc:boolean_ -> ?gps:boolean_ -> unit -> radios

val make_run :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?type_:test_type ->
  ?platform:device_platform ->
  ?created:date_time ->
  ?status:execution_status ->
  ?result_:execution_result ->
  ?started:date_time ->
  ?stopped:date_time ->
  ?counters:counters ->
  ?message:message ->
  ?total_jobs:integer ->
  ?completed_jobs:integer ->
  ?billing_method:billing_method ->
  ?device_minutes:device_minutes ->
  ?network_profile:network_profile ->
  ?device_proxy:device_proxy ->
  ?parsing_result_url:string_ ->
  ?result_code:execution_result_code ->
  ?seed:integer ->
  ?app_upload:amazon_resource_name ->
  ?event_count:integer ->
  ?job_timeout_minutes:job_timeout_minutes ->
  ?device_pool_arn:amazon_resource_name ->
  ?locale:string_ ->
  ?radios:radios ->
  ?location:location ->
  ?customer_artifact_paths:customer_artifact_paths ->
  ?web_url:string_ ->
  ?skip_app_resign:skip_app_resign ->
  ?test_spec_arn:amazon_resource_name ->
  ?device_selection_result:device_selection_result ->
  ?vpc_config:vpc_config ->
  ?execution_role_arn:amazon_role_resource_name ->
  ?environment_variables:environment_variables ->
  unit ->
  run

val make_stop_run_request : arn:amazon_resource_name -> unit -> stop_run_request

val make_stop_remote_access_session_request :
  arn:amazon_resource_name -> unit -> stop_remote_access_session_request

val make_job :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?type_:test_type ->
  ?created:date_time ->
  ?status:execution_status ->
  ?result_:execution_result ->
  ?started:date_time ->
  ?stopped:date_time ->
  ?counters:counters ->
  ?message:message ->
  ?device:device ->
  ?instance_arn:amazon_resource_name ->
  ?device_minutes:device_minutes ->
  ?video_endpoint:string_ ->
  ?video_capture:video_capture ->
  unit ->
  job

val make_stop_job_request : arn:amazon_resource_name -> unit -> stop_job_request

val make_execution_configuration :
  ?job_timeout_minutes:job_timeout_minutes ->
  ?accounts_cleanup:accounts_cleanup ->
  ?app_packages_cleanup:app_packages_cleanup ->
  ?video_capture:video_capture ->
  ?skip_app_resign:skip_app_resign ->
  unit ->
  execution_configuration

val make_schedule_run_configuration :
  ?extra_data_package_arn:amazon_resource_name ->
  ?network_profile_arn:amazon_resource_name ->
  ?locale:string_ ->
  ?location:location ->
  ?vpce_configuration_arns:amazon_resource_names ->
  ?device_proxy:device_proxy ->
  ?customer_artifact_paths:customer_artifact_paths ->
  ?radios:radios ->
  ?auxiliary_apps:amazon_resource_names ->
  ?billing_method:billing_method ->
  ?environment_variables:environment_variables ->
  ?execution_role_arn:amazon_role_resource_name ->
  unit ->
  schedule_run_configuration

val make_schedule_run_test :
  ?test_package_arn:amazon_resource_name ->
  ?test_spec_arn:amazon_resource_name ->
  ?filter:filter ->
  ?parameters:test_parameters ->
  type_:test_type ->
  unit ->
  schedule_run_test

val make_device_selection_configuration :
  filters:device_filters -> max_devices:integer -> unit -> device_selection_configuration

val make_schedule_run_request :
  ?app_arn:amazon_resource_name ->
  ?device_pool_arn:amazon_resource_name ->
  ?device_selection_configuration:device_selection_configuration ->
  ?name:name ->
  ?configuration:schedule_run_configuration ->
  ?execution_configuration:execution_configuration ->
  project_arn:amazon_resource_name ->
  test:schedule_run_test ->
  unit ->
  schedule_run_request

val make_monetary_amount : ?amount:double -> ?currency_code:currency_code -> unit -> monetary_amount

val make_recurring_charge :
  ?cost:monetary_amount -> ?frequency:recurring_charge_frequency -> unit -> recurring_charge

val make_offering :
  ?id:offering_identifier ->
  ?description:message ->
  ?type_:offering_type ->
  ?platform:device_platform ->
  ?recurring_charges:recurring_charges ->
  unit ->
  offering

val make_offering_status :
  ?type_:offering_transaction_type ->
  ?offering:offering ->
  ?quantity:integer ->
  ?effective_on:date_time ->
  unit ->
  offering_status

val make_offering_transaction :
  ?offering_status:offering_status ->
  ?transaction_id:transaction_identifier ->
  ?offering_promotion_id:offering_promotion_identifier ->
  ?created_on:date_time ->
  ?cost:monetary_amount ->
  unit ->
  offering_transaction

val make_renew_offering_request :
  offering_id:offering_identifier -> quantity:integer -> unit -> renew_offering_request

val make_purchase_offering_request :
  ?offering_promotion_id:offering_promotion_identifier ->
  offering_id:offering_identifier ->
  quantity:integer ->
  unit ->
  purchase_offering_request

val make_list_vpce_configurations_request :
  ?max_results:integer -> ?next_token:pagination_token -> unit -> list_vpce_configurations_request

val make_list_uploads_request :
  ?type_:upload_type ->
  ?next_token:pagination_token ->
  arn:amazon_resource_name ->
  unit ->
  list_uploads_request

val make_problem_detail : ?arn:amazon_resource_name -> ?name:name -> unit -> problem_detail

val make_problem :
  ?run:problem_detail ->
  ?job:problem_detail ->
  ?suite:problem_detail ->
  ?test:problem_detail ->
  ?device:device ->
  ?result_:execution_result ->
  ?message:message ->
  unit ->
  problem

val make_unique_problem : ?message:message -> ?problems:problems -> unit -> unique_problem

val make_list_unique_problems_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_unique_problems_request

val make_test :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?type_:test_type ->
  ?created:date_time ->
  ?status:execution_status ->
  ?result_:execution_result ->
  ?started:date_time ->
  ?stopped:date_time ->
  ?counters:counters ->
  ?message:message ->
  ?device_minutes:device_minutes ->
  unit ->
  test

val make_list_tests_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_tests_request

val make_test_grid_session :
  ?arn:device_farm_arn ->
  ?status:test_grid_session_status ->
  ?created:date_time ->
  ?ended:date_time ->
  ?billing_minutes:double ->
  ?selenium_properties:string_ ->
  unit ->
  test_grid_session

val make_list_test_grid_sessions_request :
  ?status:test_grid_session_status ->
  ?creation_time_after:date_time ->
  ?creation_time_before:date_time ->
  ?end_time_after:date_time ->
  ?end_time_before:date_time ->
  ?max_result:max_page_size ->
  ?next_token:pagination_token ->
  project_arn:device_farm_arn ->
  unit ->
  list_test_grid_sessions_request

val make_test_grid_session_artifact :
  ?filename:string_ ->
  ?type_:test_grid_session_artifact_type ->
  ?url:sensitive_string ->
  unit ->
  test_grid_session_artifact

val make_list_test_grid_session_artifacts_request :
  ?type_:test_grid_session_artifact_category ->
  ?max_result:max_page_size ->
  ?next_token:pagination_token ->
  session_arn:device_farm_arn ->
  unit ->
  list_test_grid_session_artifacts_request

val make_test_grid_session_action :
  ?action:string_ ->
  ?started:date_time ->
  ?duration:long ->
  ?status_code:string_ ->
  ?request_method:string_ ->
  unit ->
  test_grid_session_action

val make_list_test_grid_session_actions_request :
  ?max_result:max_page_size ->
  ?next_token:pagination_token ->
  session_arn:device_farm_arn ->
  unit ->
  list_test_grid_session_actions_request

val make_list_test_grid_projects_request :
  ?max_result:max_page_size ->
  ?next_token:pagination_token ->
  unit ->
  list_test_grid_projects_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:device_farm_arn -> unit -> list_tags_for_resource_request

val make_suite :
  ?arn:amazon_resource_name ->
  ?name:name ->
  ?type_:test_type ->
  ?created:date_time ->
  ?status:execution_status ->
  ?result_:execution_result ->
  ?started:date_time ->
  ?stopped:date_time ->
  ?counters:counters ->
  ?message:message ->
  ?device_minutes:device_minutes ->
  unit ->
  suite

val make_list_suites_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_suites_request

val make_sample : ?arn:amazon_resource_name -> ?type_:sample_type -> ?url:ur_l -> unit -> sample

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
  ?arn:amazon_resource_name -> ?next_token:pagination_token -> unit -> list_projects_request

val make_list_offering_transactions_request :
  ?next_token:pagination_token -> unit -> list_offering_transactions_request

val make_list_offerings_request : ?next_token:pagination_token -> unit -> list_offerings_request

val make_offering_promotion :
  ?id:offering_promotion_identifier -> ?description:message -> unit -> offering_promotion

val make_list_offering_promotions_request :
  ?next_token:pagination_token -> unit -> list_offering_promotions_request

val make_list_network_profiles_request :
  ?type_:network_profile_type ->
  ?next_token:pagination_token ->
  arn:amazon_resource_name ->
  unit ->
  list_network_profiles_request

val make_list_jobs_request :
  ?next_token:pagination_token -> arn:amazon_resource_name -> unit -> list_jobs_request

val make_list_instance_profiles_request :
  ?max_results:integer -> ?next_token:pagination_token -> unit -> list_instance_profiles_request

val make_list_devices_request :
  ?arn:amazon_resource_name ->
  ?next_token:pagination_token ->
  ?filters:device_filters ->
  unit ->
  list_devices_request

val make_list_device_pools_request :
  ?type_:device_pool_type ->
  ?next_token:pagination_token ->
  arn:amazon_resource_name ->
  unit ->
  list_device_pools_request

val make_list_device_instances_request :
  ?max_results:integer -> ?next_token:pagination_token -> unit -> list_device_instances_request

val make_list_artifacts_request :
  ?next_token:pagination_token ->
  arn:amazon_resource_name ->
  type_:artifact_category ->
  unit ->
  list_artifacts_request

val make_install_to_remote_access_session_request :
  remote_access_session_arn:amazon_resource_name ->
  app_arn:amazon_resource_name ->
  unit ->
  install_to_remote_access_session_request

val make_get_vpce_configuration_request :
  arn:amazon_resource_name -> unit -> get_vpce_configuration_request

val make_get_upload_request : arn:amazon_resource_name -> unit -> get_upload_request

val make_get_test_grid_session_request :
  ?project_arn:device_farm_arn ->
  ?session_id:resource_id ->
  ?session_arn:device_farm_arn ->
  unit ->
  get_test_grid_session_request

val make_get_test_grid_project_request :
  project_arn:device_farm_arn -> unit -> get_test_grid_project_request

val make_get_test_request : arn:amazon_resource_name -> unit -> get_test_request
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

val make_incompatibility_message :
  ?message:message -> ?type_:device_attribute -> unit -> incompatibility_message

val make_get_device_pool_compatibility_request :
  ?app_arn:amazon_resource_name ->
  ?test_type:test_type ->
  ?test:schedule_run_test ->
  ?configuration:schedule_run_configuration ->
  ?project_arn:amazon_resource_name ->
  device_pool_arn:amazon_resource_name ->
  unit ->
  get_device_pool_compatibility_request

val make_get_device_pool_request : arn:amazon_resource_name -> unit -> get_device_pool_request

val make_get_device_instance_request :
  arn:amazon_resource_name -> unit -> get_device_instance_request

val make_get_device_request : arn:amazon_resource_name -> unit -> get_device_request
val make_get_account_settings_request : unit -> unit
