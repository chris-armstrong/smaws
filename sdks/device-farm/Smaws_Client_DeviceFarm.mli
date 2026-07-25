(** Device Farm client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module GetAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_settings_request ->
    ( get_account_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_settings_request ->
    ( get_account_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the number of unmetered iOS or unmetered Android devices that have been purchased by \
   the account.\n"]

module GetDevice : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_request ->
    ( get_device_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a unique device type.\n"]

module GetDeviceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_instance_request ->
    ( get_device_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_instance_request ->
    ( get_device_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a device instance that belongs to a private device fleet.\n"]

module GetDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_request ->
    ( get_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_request ->
    ( get_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a device pool.\n"]

module GetDevicePoolCompatibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_compatibility_request ->
    ( get_device_pool_compatibility_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_device_pool_compatibility_request ->
    ( get_device_pool_compatibility_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about compatibility with a device pool.\n"]

module GetInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_instance_profile_request ->
    ( get_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about the specified instance profile.\n"]

module GetJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a job.\n"]

module GetNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_network_profile_request ->
    ( get_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_network_profile_request ->
    ( get_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a network profile.\n"]

module GetOfferingStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_offering_status_request ->
    ( get_offering_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_offering_status_request ->
    ( get_offering_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the current status and future status of all offerings purchased by an AWS account. The \
   response indicates how many offerings are currently available and the offerings that will be \
   available in the next period. The API returns a [NotEligible] error if the user is not \
   permitted to invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module GetProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_project_request ->
    ( get_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_project_request ->
    ( get_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a project.\n"]

module GetRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_remote_access_session_request ->
    ( get_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_remote_access_session_request ->
    ( get_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a link to a currently running remote access session.\n"]

module GetRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_run_request ->
    ( get_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_run_request ->
    ( get_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a run.\n"]

module GetSuite : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_suite_request ->
    ( get_suite_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_suite_request ->
    ( get_suite_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a suite.\n"]

module GetTest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_request ->
    ( get_test_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_request ->
    ( get_test_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a test.\n"]

module GetTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_project_request ->
    ( get_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_project_request ->
    ( get_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a Selenium testing project.\n"]

module GetTestGridSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_session_request ->
    ( get_test_grid_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_test_grid_session_request ->
    ( get_test_grid_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A session is an instance of a browser created through a [RemoteWebDriver] with the URL from \
   [CreateTestGridUrlResult$url]. You can use the following to look up sessions:\n\n\
  \ {ul\n\
  \       {-  The session ARN ([GetTestGridSessionRequest$sessionArn]).\n\
  \           \n\
  \            }\n\
  \       {-  The project ARN and a session ID ([GetTestGridSessionRequest$projectArn] and \
   [GetTestGridSessionRequest$sessionId]).\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   \n\
  \   "]

module GetUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_upload_request ->
    ( get_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_upload_request ->
    ( get_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an upload.\n"]

module GetVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_vpce_configuration_request ->
    ( get_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_vpce_configuration_request ->
    ( get_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the configuration settings for your Amazon Virtual Private Cloud \
   (VPC) endpoint.\n"]

module InstallToRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    install_to_remote_access_session_request ->
    ( install_to_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    install_to_remote_access_session_request ->
    ( install_to_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Installs an application to the device in a remote access session. For Android applications, the \
   file must be in .apk format. For iOS applications, the file must be in .ipa format.\n"]

module ListArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_artifacts_request ->
    ( list_artifacts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about artifacts.\n"]

module ListDeviceInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_device_instances_request ->
    ( list_device_instances_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_device_instances_request ->
    ( list_device_instances_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the private device instances associated with one or more AWS accounts.\n"]

module ListDevicePools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_device_pools_request ->
    ( list_device_pools_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_device_pools_request ->
    ( list_device_pools_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about device pools.\n"]

module ListDevices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_devices_request ->
    ( list_devices_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about unique device types.\n"]

module ListInstanceProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_profiles_request ->
    ( list_instance_profiles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about all the instance profiles in an AWS account.\n"]

module ListJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about jobs for a given test run.\n"]

module ListNetworkProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_network_profiles_request ->
    ( list_network_profiles_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_network_profiles_request ->
    ( list_network_profiles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the list of available network profiles.\n"]

module ListOfferingPromotions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offering_promotions_request ->
    ( list_offering_promotions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offering_promotions_request ->
    ( list_offering_promotions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of offering promotions. Each offering promotion record contains the ID and \
   description of the promotion. The API returns a [NotEligible] error if the caller is not \
   permitted to invoke the operation. Contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com} if you must be \
   able to invoke this operation.\n"]

module ListOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offerings_request ->
    ( list_offerings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offerings_request ->
    ( list_offerings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of products or offerings that the user can manage through the API. Each offering \
   record indicates the recurring price per unit and the frequency for that offering. The API \
   returns a [NotEligible] error if the user is not permitted to invoke the operation. If you must \
   be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ListOfferingTransactions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_offering_transactions_request ->
    ( list_offering_transactions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_offering_transactions_request ->
    ( list_offering_transactions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all historical purchases, renewals, and system renewal transactions for an \
   AWS account. The list is paginated and ordered by a descending timestamp (most recent \
   transactions are first). The API returns a [NotEligible] error if the user is not permitted to \
   invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ListProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_projects_request ->
    ( list_projects_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_projects_request ->
    ( list_projects_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about projects.\n"]

module ListRemoteAccessSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_remote_access_sessions_request ->
    ( list_remote_access_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_remote_access_sessions_request ->
    ( list_remote_access_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all currently running remote access sessions.\n"]

module ListRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_runs_request ->
    ( list_runs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_runs_request ->
    ( list_runs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about runs, given an AWS Device Farm project ARN.\n"]

module ListSamples : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_samples_request ->
    ( list_samples_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_samples_request ->
    ( list_samples_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about samples, given an AWS Device Farm job ARN.\n"]

module ListSuites : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_suites_request ->
    ( list_suites_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_suites_request ->
    ( list_suites_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about test suites for a given job.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the tags for an AWS Device Farm resource.\n"]

module ListTestGridProjects : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_projects_request ->
    ( list_test_grid_projects_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_projects_request ->
    ( list_test_grid_projects_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of all Selenium testing projects in your account.\n"]

module ListTestGridSessionActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_actions_request ->
    ( list_test_grid_session_actions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_actions_request ->
    ( list_test_grid_session_actions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the actions taken in a [TestGridSession].\n"]

module ListTestGridSessionArtifacts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_artifacts_request ->
    ( list_test_grid_session_artifacts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_session_artifacts_request ->
    ( list_test_grid_session_artifacts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of artifacts created during the session.\n"]

module ListTestGridSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_sessions_request ->
    ( list_test_grid_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_test_grid_sessions_request ->
    ( list_test_grid_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of sessions for a [TestGridProject].\n"]

module ListTests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tests_request ->
    ( list_tests_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tests_request ->
    ( list_tests_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about tests in a given test suite.\n"]

module ListUniqueProblems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_unique_problems_request ->
    ( list_unique_problems_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_unique_problems_request ->
    ( list_unique_problems_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about unique problems, such as exceptions or crashes.\n\n\
  \ Unique problems are defined as a single instance of an error across a run, job, or suite. For \
   example, if a call in your application consistently raises an exception ([OutOfBoundsException \
   in\n\
  \                MyActivity.java:386]), [ListUniqueProblems] returns a single entry instead of \
   many individual entries for that exception.\n\
  \ "]

module ListUploads : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_uploads_request ->
    ( list_uploads_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_uploads_request ->
    ( list_uploads_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about uploads, given an AWS Device Farm project ARN.\n"]

module ListVPCEConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpce_configurations_request ->
    ( list_vpce_configurations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_vpce_configurations_request ->
    ( list_vpce_configurations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all Amazon Virtual Private Cloud (VPC) endpoint configurations in the \
   AWS account.\n"]

module PurchaseOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    purchase_offering_request ->
    ( purchase_offering_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    purchase_offering_request ->
    ( purchase_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Immediately purchases offerings for an AWS account. Offerings renew with the latest total \
   purchased quantity for an offering, unless the renewal was overridden. The API returns a \
   [NotEligible] error if the user is not permitted to invoke the operation. If you must be able \
   to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module RenewOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotEligibleException of not_eligible_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    renew_offering_request ->
    ( renew_offering_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    renew_offering_request ->
    ( renew_offering_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotEligibleException of not_eligible_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Explicitly sets the quantity of devices to renew for an offering, starting from the \
   [effectiveDate] of the next period. The API returns a [NotEligible] error if the user is not \
   permitted to invoke the operation. If you must be able to invoke this operation, contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com}.\n"]

module ScheduleRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `IdempotencyException of idempotency_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    schedule_run_request ->
    ( schedule_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `IdempotencyException of idempotency_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    schedule_run_request ->
    ( schedule_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `IdempotencyException of idempotency_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Schedules a run.\n"]

module StopJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_job_request ->
    ( stop_job_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a stop request for the current job. AWS Device Farm immediately stops the job on the \
   device where tests have not started. You are not billed for this device. On the device where \
   tests have started, setup suite and teardown suite tests run to completion on the device. You \
   are billed for setup, teardown, and any tests that were in progress or already completed.\n"]

module StopRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_remote_access_session_request ->
    ( stop_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_remote_access_session_request ->
    ( stop_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Ends a specified remote access session.\n"]

module StopRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_run_request ->
    ( stop_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_run_request ->
    ( stop_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a stop request for the current test run. AWS Device Farm immediately stops the run on \
   devices where tests have not started. You are not billed for these devices. On devices where \
   tests have started executing, setup suite and teardown suite tests run to completion on those \
   devices. You are billed for setup, teardown, and any tests that were in progress or already \
   completed.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception
    | `TagPolicyException of tag_policy_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception
      | `TagPolicyException of tag_policy_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [resourceArn]. If existing tags \
   on a resource are not specified in the request parameters, they are not changed. When a \
   resource is deleted, the tags associated with that resource are also deleted.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `NotFoundException of not_found_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `NotFoundException of not_found_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags from a resource.\n"]

module UpdateDeviceInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_instance_request ->
    ( update_device_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_instance_request ->
    ( update_device_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates information about a private device instance.\n"]

module UpdateDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_device_pool_request ->
    ( update_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_device_pool_request ->
    ( update_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the name, description, and rules in a device pool given the attributes and the pool \
   ARN. Rule updates are all-or-nothing, meaning they can only be updated as a whole (or not at \
   all).\n"]

module UpdateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_instance_profile_request ->
    ( update_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_instance_profile_request ->
    ( update_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates information about an existing private device instance profile.\n"]

module UpdateNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_network_profile_request ->
    ( update_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_network_profile_request ->
    ( update_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the network profile.\n"]

module UpdateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_project_request ->
    ( update_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_project_request ->
    ( update_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified project name, given the project ARN and a new name.\n"]

module UpdateTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_test_grid_project_request ->
    ( update_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_test_grid_project_request ->
    ( update_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Change details of a project.\n"]

module UpdateUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_upload_request ->
    ( update_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_upload_request ->
    ( update_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an uploaded test spec.\n"]

module UpdateVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InvalidOperationException of invalid_operation_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_vpce_configuration_request ->
    ( update_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_vpce_configuration_request ->
    ( update_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates information about an Amazon Virtual Private Cloud (VPC) endpoint configuration.\n"]

module DeleteVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InvalidOperationException of invalid_operation_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpce_configuration_request ->
    ( delete_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_vpce_configuration_request ->
    ( delete_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InvalidOperationException of invalid_operation_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a configuration for your Amazon Virtual Private Cloud (VPC) endpoint.\n"]

module DeleteUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_upload_request ->
    ( delete_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_upload_request ->
    ( delete_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an upload given the upload ARN.\n"]

module DeleteTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `CannotDeleteException of cannot_delete_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_test_grid_project_request ->
    ( delete_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `CannotDeleteException of cannot_delete_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_test_grid_project_request ->
    ( delete_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `CannotDeleteException of cannot_delete_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Deletes a Selenium testing project and all content generated under it. You cannot delete a \
   project if it has active sessions.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_run_request ->
    ( delete_run_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_run_request ->
    ( delete_run_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the run, given the run ARN. You cannot delete a run if it is still active.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_remote_access_session_request ->
    ( delete_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_remote_access_session_request ->
    ( delete_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a completed remote access session and its results. You cannot delete a remote access \
   session if it is still active.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_project_request ->
    ( delete_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an AWS Device Farm project, given the project ARN. You cannot delete a project if it \
   has an active run or session.\n\n\
  \  You cannot undo this operation.\n\
  \  \n\
  \   "]

module DeleteNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_network_profile_request ->
    ( delete_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_network_profile_request ->
    ( delete_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a network profile.\n"]

module DeleteInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( delete_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_profile_request ->
    ( delete_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a profile that can be applied to one or more private device instances.\n"]

module DeleteDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_device_pool_request ->
    ( delete_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_device_pool_request ->
    ( delete_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a device pool given the pool ARN. Does not allow deletion of curated pools owned by the \
   system.\n"]

module CreateVPCEConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpce_configuration_request ->
    ( create_vpce_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_vpce_configuration_request ->
    ( create_vpce_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration record in Device Farm for your Amazon Virtual Private Cloud (VPC) \
   endpoint.\n"]

module CreateUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_upload_request ->
    ( create_upload_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_upload_request ->
    ( create_upload_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Uploads an app or test scripts.\n"]

module CreateTestGridUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_url_request ->
    ( create_test_grid_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_url_request ->
    ( create_test_grid_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a signed, short-term URL that can be passed to a Selenium [RemoteWebDriver] constructor.\n"]

module CreateTestGridProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_project_request ->
    ( create_test_grid_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_test_grid_project_request ->
    ( create_test_grid_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Selenium testing project. Projects are used to track [TestGridSession] instances.\n"]

module CreateRemoteAccessSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_remote_access_session_request ->
    ( create_remote_access_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_remote_access_session_request ->
    ( create_remote_access_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Specifies and starts a remote access session.\n"]

module CreateProject : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception
    | `TagOperationException of tag_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception
      | `TagOperationException of tag_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_project_request ->
    ( create_project_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception
      | `TagOperationException of tag_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a project.\n"]

module CreateNetworkProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_network_profile_request ->
    ( create_network_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_network_profile_request ->
    ( create_network_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a network profile.\n"]

module CreateInstanceProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_instance_profile_request ->
    ( create_instance_profile_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a profile that can be applied to one or more private fleet device instances.\n"]

(** {1:Serialization and Deserialization} *)
module CreateDevicePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArgumentException of argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `ServiceAccountException of service_account_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_device_pool_request ->
    ( create_device_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_device_pool_request ->
    ( create_device_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArgumentException of argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `ServiceAccountException of service_account_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a device pool.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
