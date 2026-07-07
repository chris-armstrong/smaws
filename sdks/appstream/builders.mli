open Types

val make_vpc_config :
  ?security_group_ids:security_group_id_list -> ?subnet_ids:subnet_id_list -> unit -> vpc_config

val make_volume_config : ?volume_size_in_gb:integer -> unit -> volume_config

val make_user_stack_association :
  ?send_email_notification:boolean_ ->
  authentication_type:authentication_type ->
  user_name:username ->
  stack_name:string_ ->
  unit ->
  user_stack_association

val make_user_stack_association_error :
  ?error_message:string_ ->
  ?error_code:user_stack_association_error_code ->
  ?user_stack_association:user_stack_association ->
  unit ->
  user_stack_association_error

val make_user_setting :
  ?maximum_length:integer -> permission:permission -> action:action -> unit -> user_setting

val make_user :
  ?created_time:timestamp ->
  ?last_name:user_attribute_value ->
  ?first_name:user_attribute_value ->
  ?status:string_ ->
  ?enabled:boolean_ ->
  ?user_name:username ->
  ?arn:arn ->
  authentication_type:authentication_type ->
  unit ->
  user

val make_last_report_generation_execution_error :
  ?error_message:string_ ->
  ?error_code:usage_report_execution_error_code ->
  unit ->
  last_report_generation_execution_error

val make_usage_report_subscription :
  ?subscription_errors:last_report_generation_execution_errors ->
  ?last_generated_report_date:timestamp ->
  ?schedule:usage_report_schedule ->
  ?s3_bucket_name:string_ ->
  unit ->
  usage_report_subscription

val make_url_redirection_config :
  ?denied_urls:url_pattern_list ->
  ?allowed_urls:url_pattern_list ->
  enabled:boolean_object ->
  unit ->
  url_redirection_config

val make_theme_footer_link :
  ?footer_link_ur_l:theme_footer_link_ur_l ->
  ?display_name:theme_footer_link_display_name ->
  unit ->
  theme_footer_link

val make_theme :
  ?created_time:timestamp ->
  ?theme_favicon_ur_l:string_ ->
  ?theme_organization_logo_ur_l:string_ ->
  ?theme_footer_links:theme_footer_links ->
  ?theme_styling:theme_styling ->
  ?theme_title_text:theme_title_text ->
  ?state:theme_state ->
  ?stack_name:name ->
  unit ->
  theme

val make_s3_location : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> s3_location

val make_update_theme_for_stack_request :
  ?attributes_to_delete:theme_attributes ->
  ?state:theme_state ->
  ?favicon_s3_location:s3_location ->
  ?organization_logo_s3_location:s3_location ->
  ?theme_styling:theme_styling ->
  ?title_text:theme_title_text ->
  ?footer_links:theme_footer_links ->
  stack_name:name ->
  unit ->
  update_theme_for_stack_request

val make_storage_connector :
  ?domains_require_admin_consent:domain_list ->
  ?domains:domain_list ->
  ?resource_identifier:resource_identifier ->
  connector_type:storage_connector_type ->
  unit ->
  storage_connector

val make_stack_error : ?error_message:string_ -> ?error_code:stack_error_code -> unit -> stack_error

val make_application_settings_response :
  ?s3_bucket_name:string_ ->
  ?settings_group:settings_group ->
  ?enabled:boolean_ ->
  unit ->
  application_settings_response

val make_access_endpoint :
  ?vpce_id:string_ -> endpoint_type:access_endpoint_type -> unit -> access_endpoint

val make_streaming_experience_settings :
  ?preferred_protocol:preferred_protocol -> unit -> streaming_experience_settings

val make_content_redirection : ?host_to_client:url_redirection_config -> unit -> content_redirection

val make_agent_access_setting :
  permission:permission -> agent_action:agent_action -> unit -> agent_access_setting

val make_agent_access_config :
  ?user_control_mode:user_control_mode ->
  ?screenshots_upload_enabled:boolean_object ->
  ?s3_bucket_arn:s3_bucket_arn ->
  screen_image_format:screen_image_format ->
  screen_resolution:screen_resolution ->
  settings:agent_access_setting_list ->
  unit ->
  agent_access_config

val make_stack :
  ?agent_access_config:agent_access_config ->
  ?content_redirection:content_redirection ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?embed_host_domains:embed_host_domains ->
  ?access_endpoints:access_endpoint_list ->
  ?application_settings:application_settings_response ->
  ?user_settings:user_setting_list ->
  ?stack_errors:stack_errors ->
  ?feedback_ur_l:feedback_ur_l ->
  ?redirect_ur_l:redirect_ur_l ->
  ?storage_connectors:storage_connector_list ->
  ?created_time:timestamp ->
  ?display_name:string_ ->
  ?description:string_ ->
  ?arn:arn ->
  name:string_ ->
  unit ->
  stack

val make_application_settings :
  ?settings_group:settings_group -> enabled:boolean_ -> unit -> application_settings

val make_agent_access_config_for_update :
  ?user_control_mode:user_control_mode ->
  ?screen_image_format:screen_image_format ->
  ?screen_resolution:screen_resolution ->
  ?screenshots_upload_enabled:boolean_object ->
  ?s3_bucket_arn:s3_bucket_arn ->
  ?settings:agent_access_setting_list ->
  unit ->
  agent_access_config_for_update

val make_update_stack_request :
  ?agent_access_config:agent_access_config_for_update ->
  ?content_redirection:content_redirection ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?embed_host_domains:embed_host_domains ->
  ?access_endpoints:access_endpoint_list ->
  ?application_settings:application_settings ->
  ?user_settings:user_setting_list ->
  ?attributes_to_delete:stack_attributes ->
  ?feedback_ur_l:feedback_ur_l ->
  ?redirect_ur_l:redirect_ur_l ->
  ?delete_storage_connectors:boolean_ ->
  ?storage_connectors:storage_connector_list ->
  ?description:description ->
  ?display_name:display_name ->
  name:string_ ->
  unit ->
  update_stack_request

val make_image_permissions :
  ?allow_image_builder:boolean_object -> ?allow_fleet:boolean_object -> unit -> image_permissions

val make_update_image_permissions_request :
  image_permissions:image_permissions ->
  shared_account_id:aws_account_id ->
  name:name ->
  unit ->
  update_image_permissions_request

val make_compute_capacity_status :
  ?drain_mode_unused_user_sessions:integer ->
  ?drain_mode_active_user_sessions:integer ->
  ?draining:integer ->
  ?actual_user_sessions:integer ->
  ?active_user_sessions:integer ->
  ?available_user_sessions:integer ->
  ?desired_user_sessions:integer ->
  ?available:integer ->
  ?in_use:integer ->
  ?running:integer ->
  desired:integer ->
  unit ->
  compute_capacity_status

val make_fleet_error : ?error_message:string_ -> ?error_code:fleet_error_code -> unit -> fleet_error

val make_domain_join_info :
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  ?directory_name:directory_name ->
  unit ->
  domain_join_info

val make_fleet :
  ?disable_imds_v1:boolean_object ->
  ?root_volume_config:volume_config ->
  ?max_sessions_per_instance:integer ->
  ?session_script_s3_location:s3_location ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?max_concurrent_sessions:integer ->
  ?platform:platform_type ->
  ?stream_view:stream_view ->
  ?iam_role_arn:arn ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?domain_join_info:domain_join_info ->
  ?enable_default_internet_access:boolean_object ->
  ?fleet_errors:fleet_errors ->
  ?created_time:timestamp ->
  ?vpc_config:vpc_config ->
  ?disconnect_timeout_in_seconds:integer ->
  ?max_user_duration_in_seconds:integer ->
  ?fleet_type:fleet_type ->
  ?image_arn:arn ->
  ?image_name:string_ ->
  ?description:string_ ->
  ?display_name:string_ ->
  state:fleet_state ->
  compute_capacity_status:compute_capacity_status ->
  instance_type:string_ ->
  name:string_ ->
  arn:arn ->
  unit ->
  fleet

val make_compute_capacity :
  ?desired_sessions:integer -> ?desired_instances:integer -> unit -> compute_capacity

val make_update_fleet_request :
  ?disable_imds_v1:boolean_object ->
  ?root_volume_config:volume_config ->
  ?max_sessions_per_instance:integer ->
  ?session_script_s3_location:s3_location ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?max_concurrent_sessions:integer ->
  ?platform:platform_type ->
  ?stream_view:stream_view ->
  ?iam_role_arn:arn ->
  ?attributes_to_delete:fleet_attributes ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?domain_join_info:domain_join_info ->
  ?enable_default_internet_access:boolean_object ->
  ?display_name:display_name ->
  ?description:description ->
  ?delete_vpc_config:boolean_ ->
  ?disconnect_timeout_in_seconds:integer ->
  ?max_user_duration_in_seconds:integer ->
  ?vpc_config:vpc_config ->
  ?compute_capacity:compute_capacity ->
  ?instance_type:string_ ->
  ?name:name ->
  ?image_arn:arn ->
  ?image_name:string_ ->
  unit ->
  update_fleet_request

val make_entitlement_attribute : value:string_ -> name:string_ -> unit -> entitlement_attribute

val make_entitlement :
  ?last_modified_time:timestamp ->
  ?created_time:timestamp ->
  ?description:description ->
  attributes:entitlement_attribute_list ->
  app_visibility:app_visibility ->
  stack_name:name ->
  name:name ->
  unit ->
  entitlement

val make_update_entitlement_request :
  ?attributes:entitlement_attribute_list ->
  ?app_visibility:app_visibility ->
  ?description:description ->
  stack_name:name ->
  name:name ->
  unit ->
  update_entitlement_request

val make_service_account_credentials :
  account_password:account_password ->
  account_name:account_name ->
  unit ->
  service_account_credentials

val make_certificate_based_auth_properties :
  ?certificate_authority_arn:arn ->
  ?status:certificate_based_auth_status ->
  unit ->
  certificate_based_auth_properties

val make_directory_config :
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?created_time:timestamp ->
  ?service_account_credentials:service_account_credentials ->
  ?organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  directory_name:directory_name ->
  unit ->
  directory_config

val make_update_directory_config_request :
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?service_account_credentials:service_account_credentials ->
  ?organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  directory_name:directory_name ->
  unit ->
  update_directory_config_request

val make_application :
  ?created_time:timestamp ->
  ?instance_families:string_list ->
  ?platforms:platforms ->
  ?icon_s3_location:s3_location ->
  ?app_block_arn:arn ->
  ?arn:arn ->
  ?description:string_ ->
  ?working_directory:string_ ->
  ?metadata:metadata ->
  ?enabled:boolean_ ->
  ?launch_parameters:string_ ->
  ?launch_path:string_ ->
  ?icon_ur_l:string_ ->
  ?display_name:string_ ->
  ?name:string_ ->
  unit ->
  application

val make_update_application_request :
  ?attributes_to_delete:application_attributes ->
  ?app_block_arn:arn ->
  ?launch_parameters:string_ ->
  ?working_directory:string_ ->
  ?launch_path:string_ ->
  ?icon_s3_location:s3_location ->
  ?description:description ->
  ?display_name:display_name ->
  name:name ->
  unit ->
  update_application_request

val make_resource_error :
  ?error_timestamp:timestamp ->
  ?error_message:string_ ->
  ?error_code:fleet_error_code ->
  unit ->
  resource_error

val make_app_block_builder_state_change_reason :
  ?message:string_ ->
  ?code:app_block_builder_state_change_reason_code ->
  unit ->
  app_block_builder_state_change_reason

val make_app_block_builder :
  ?disable_imds_v1:boolean_object ->
  ?access_endpoints:access_endpoint_list ->
  ?state_change_reason:app_block_builder_state_change_reason ->
  ?app_block_builder_errors:resource_errors ->
  ?created_time:timestamp ->
  ?iam_role_arn:arn ->
  ?enable_default_internet_access:boolean_object ->
  ?description:string_ ->
  ?display_name:string_ ->
  state:app_block_builder_state ->
  vpc_config:vpc_config ->
  instance_type:string_ ->
  platform:app_block_builder_platform_type ->
  name:string_ ->
  arn:arn ->
  unit ->
  app_block_builder

val make_update_app_block_builder_request :
  ?disable_imds_v1:boolean_object ->
  ?attributes_to_delete:app_block_builder_attributes ->
  ?access_endpoints:access_endpoint_list ->
  ?iam_role_arn:arn ->
  ?enable_default_internet_access:boolean_object ->
  ?vpc_config:vpc_config ->
  ?instance_type:string_ ->
  ?platform:platform_type ->
  ?display_name:display_name ->
  ?description:description ->
  name:name ->
  unit ->
  update_app_block_builder_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> resource_arn:arn -> unit -> tag_resource_request

val make_image_builder_state_change_reason :
  ?message:string_ ->
  ?code:image_builder_state_change_reason_code ->
  unit ->
  image_builder_state_change_reason

val make_network_access_configuration :
  ?eni_id:string_ ->
  ?eni_ipv6_addresses:string_list ->
  ?eni_private_ip_address:string_ ->
  unit ->
  network_access_configuration

val make_image_builder :
  ?disable_imds_v1:boolean_object ->
  ?latest_appstream_agent_version:latest_appstream_agent_version ->
  ?root_volume_config:volume_config ->
  ?access_endpoints:access_endpoint_list ->
  ?appstream_agent_version:appstream_agent_version ->
  ?image_builder_errors:resource_errors ->
  ?network_access_configuration:network_access_configuration ->
  ?domain_join_info:domain_join_info ->
  ?enable_default_internet_access:boolean_object ->
  ?created_time:timestamp ->
  ?state_change_reason:image_builder_state_change_reason ->
  ?state:image_builder_state ->
  ?iam_role_arn:arn ->
  ?platform:platform_type ->
  ?instance_type:string_ ->
  ?vpc_config:vpc_config ->
  ?display_name:string_ ->
  ?description:string_ ->
  ?image_arn:arn ->
  ?arn:arn ->
  name:string_ ->
  unit ->
  image_builder

val make_stop_image_builder_request : name:string_ -> unit -> stop_image_builder_request
val make_stop_fleet_request : name:string_ -> unit -> stop_fleet_request
val make_stop_app_block_builder_request : name:name -> unit -> stop_app_block_builder_request

val make_start_software_deployment_to_image_builder_request :
  ?retry_failed_deployments:boolean_ ->
  image_builder_name:name ->
  unit ->
  start_software_deployment_to_image_builder_request

val make_start_image_builder_request :
  ?appstream_agent_version:appstream_agent_version ->
  name:string_ ->
  unit ->
  start_image_builder_request

val make_start_fleet_request : name:string_ -> unit -> start_fleet_request
val make_start_app_block_builder_request : name:name -> unit -> start_app_block_builder_request
val make_error_details : ?error_message:string_ -> ?error_code:string_ -> unit -> error_details

val make_software_associations :
  ?deployment_error:error_details_list ->
  ?status:software_deployment_status ->
  ?software_name:string_ ->
  unit ->
  software_associations

val make_shared_image_permissions :
  image_permissions:image_permissions ->
  shared_account_id:aws_account_id ->
  unit ->
  shared_image_permissions

val make_session :
  ?instance_drain_status:instance_drain_status ->
  ?instance_id:string_ ->
  ?network_access_configuration:network_access_configuration ->
  ?authentication_type:authentication_type ->
  ?max_expiration_time:timestamp ->
  ?start_time:timestamp ->
  ?connection_state:session_connection_state ->
  state:session_state ->
  fleet_name:string_ ->
  stack_name:string_ ->
  user_id:user_id ->
  id:string_ ->
  unit ->
  session

val make_script_details :
  ?executable_parameters:string_ ->
  timeout_in_seconds:integer ->
  executable_path:string_ ->
  script_s3_location:s3_location ->
  unit ->
  script_details

val make_runtime_validation_config :
  ?intended_instance_type:instance_type -> unit -> runtime_validation_config

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_export_image_task :
  ?error_details:error_details_list ->
  ?tag_specifications:tags ->
  ?ami_id:photon_ami_id ->
  ?state:export_image_task_state ->
  ?ami_description:description ->
  created_date:timestamp ->
  ami_name:ami_name ->
  image_arn:arn ->
  task_id:uui_d ->
  unit ->
  export_image_task

val make_filter : values:filter_values -> name:filter_name -> unit -> filter

val make_list_export_image_tasks_request :
  ?next_token:string_ ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_export_image_tasks_request

val make_entitled_application : application_identifier:string_ -> unit -> entitled_application

val make_list_entitled_applications_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  entitlement_name:name ->
  stack_name:name ->
  unit ->
  list_entitled_applications_request

val make_list_associated_stacks_request :
  ?next_token:string_ -> fleet_name:string_ -> unit -> list_associated_stacks_request

val make_list_associated_fleets_request :
  ?next_token:string_ -> stack_name:string_ -> unit -> list_associated_fleets_request

val make_get_export_image_task_request : ?task_id:uui_d -> unit -> get_export_image_task_request
val make_expire_session_request : session_id:string_ -> unit -> expire_session_request

val make_enable_user_request :
  authentication_type:authentication_type -> user_name:username -> unit -> enable_user_request

val make_drain_session_instance_request :
  session_id:string_ -> unit -> drain_session_instance_request

val make_disassociate_software_from_image_builder_request :
  software_names:string_list ->
  image_builder_name:name ->
  unit ->
  disassociate_software_from_image_builder_request

val make_disassociate_fleet_request :
  stack_name:string_ -> fleet_name:string_ -> unit -> disassociate_fleet_request

val make_disassociate_application_from_entitlement_request :
  application_identifier:string_ ->
  entitlement_name:name ->
  stack_name:name ->
  unit ->
  disassociate_application_from_entitlement_request

val make_disassociate_application_fleet_request :
  application_arn:arn -> fleet_name:name -> unit -> disassociate_application_fleet_request

val make_disassociate_app_block_builder_app_block_request :
  app_block_builder_name:name ->
  app_block_arn:arn ->
  unit ->
  disassociate_app_block_builder_app_block_request

val make_disable_user_request :
  authentication_type:authentication_type -> user_name:username -> unit -> disable_user_request

val make_describe_user_stack_associations_request :
  ?next_token:string_ ->
  ?max_results:max_results ->
  ?authentication_type:authentication_type ->
  ?user_name:username ->
  ?stack_name:string_ ->
  unit ->
  describe_user_stack_associations_request

val make_describe_users_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  authentication_type:authentication_type ->
  unit ->
  describe_users_request

val make_describe_usage_report_subscriptions_request :
  ?next_token:string_ -> ?max_results:integer -> unit -> describe_usage_report_subscriptions_request

val make_describe_theme_for_stack_request :
  stack_name:name -> unit -> describe_theme_for_stack_request

val make_describe_stacks_request :
  ?next_token:string_ -> ?names:string_list -> unit -> describe_stacks_request

val make_describe_software_associations_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  associated_resource:arn ->
  unit ->
  describe_software_associations_request

val make_describe_sessions_request :
  ?instance_id:string_ ->
  ?authentication_type:authentication_type ->
  ?limit:integer ->
  ?next_token:string_ ->
  ?user_id:user_id ->
  fleet_name:name ->
  stack_name:name ->
  unit ->
  describe_sessions_request

val make_image_state_change_reason :
  ?message:string_ -> ?code:image_state_change_reason_code -> unit -> image_state_change_reason

val make_image :
  ?image_type:image_type ->
  ?managed_software_included:boolean_ ->
  ?image_shared_with_others:image_shared_with_others ->
  ?dynamic_app_providers_enabled:dynamic_app_providers_enabled ->
  ?supported_instance_families:string_list ->
  ?latest_appstream_agent_version:latest_appstream_agent_version ->
  ?image_errors:resource_errors ->
  ?image_permissions:image_permissions ->
  ?appstream_agent_version:appstream_agent_version ->
  ?public_base_image_released_date:timestamp ->
  ?created_time:timestamp ->
  ?applications:applications ->
  ?state_change_reason:image_state_change_reason ->
  ?description:string_ ->
  ?platform:platform_type ->
  ?image_builder_name:string_ ->
  ?image_builder_supported:boolean_ ->
  ?visibility:visibility_type ->
  ?state:image_state ->
  ?display_name:string_ ->
  ?base_image_arn:arn ->
  ?arn:arn ->
  name:string_ ->
  unit ->
  image

val make_describe_images_request :
  ?max_results:describe_images_max_results ->
  ?next_token:string_ ->
  ?type_:visibility_type ->
  ?arns:arn_list ->
  ?names:string_list ->
  unit ->
  describe_images_request

val make_describe_image_permissions_request :
  ?next_token:string_ ->
  ?shared_aws_account_ids:aws_account_id_list ->
  ?max_results:max_results ->
  name:name ->
  unit ->
  describe_image_permissions_request

val make_describe_image_builders_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  ?names:string_list ->
  unit ->
  describe_image_builders_request

val make_describe_fleets_request :
  ?next_token:string_ -> ?names:string_list -> unit -> describe_fleets_request

val make_describe_entitlements_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  ?name:name ->
  stack_name:name ->
  unit ->
  describe_entitlements_request

val make_describe_directory_configs_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  ?directory_names:directory_name_list ->
  unit ->
  describe_directory_configs_request

val make_admin_app_license_usage_record :
  user_id:string_ ->
  license_type:string_ ->
  subscription_last_used_date:timestamp ->
  subscription_first_used_date:timestamp ->
  owner_aws_account_id:aws_account_id ->
  billing_period:string_ ->
  user_arn:string_ ->
  unit ->
  admin_app_license_usage_record

val make_describe_app_license_usage_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  billing_period:string_ ->
  unit ->
  describe_app_license_usage_request

val make_describe_applications_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  ?arns:arn_list ->
  unit ->
  describe_applications_request

val make_application_fleet_association :
  application_arn:arn -> fleet_name:string_ -> unit -> application_fleet_association

val make_describe_application_fleet_associations_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  ?application_arn:arn ->
  ?fleet_name:name ->
  unit ->
  describe_application_fleet_associations_request

val make_app_block :
  ?app_block_errors:error_details_list ->
  ?state:app_block_state ->
  ?packaging_type:packaging_type ->
  ?post_setup_script_details:script_details ->
  ?created_time:timestamp ->
  ?setup_script_details:script_details ->
  ?source_s3_location:s3_location ->
  ?display_name:string_ ->
  ?description:string_ ->
  arn:arn ->
  name:string_ ->
  unit ->
  app_block

val make_describe_app_blocks_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  ?arns:arn_list ->
  unit ->
  describe_app_blocks_request

val make_describe_app_block_builders_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  ?names:string_list ->
  unit ->
  describe_app_block_builders_request

val make_app_block_builder_app_block_association :
  app_block_builder_name:name ->
  app_block_arn:arn ->
  unit ->
  app_block_builder_app_block_association

val make_describe_app_block_builder_app_block_associations_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  ?app_block_builder_name:name ->
  ?app_block_arn:arn ->
  unit ->
  describe_app_block_builder_app_block_associations_request

val make_delete_user_request :
  authentication_type:authentication_type -> user_name:username -> unit -> delete_user_request

val make_delete_usage_report_subscription_request : unit -> unit
val make_delete_theme_for_stack_request : stack_name:name -> unit -> delete_theme_for_stack_request
val make_delete_stack_request : name:string_ -> unit -> delete_stack_request

val make_delete_image_permissions_request :
  shared_account_id:aws_account_id -> name:name -> unit -> delete_image_permissions_request

val make_delete_image_builder_request : name:name -> unit -> delete_image_builder_request
val make_delete_image_request : name:name -> unit -> delete_image_request
val make_delete_fleet_request : name:string_ -> unit -> delete_fleet_request

val make_delete_entitlement_request :
  stack_name:name -> name:name -> unit -> delete_entitlement_request

val make_delete_directory_config_request :
  directory_name:directory_name -> unit -> delete_directory_config_request

val make_delete_application_request : name:name -> unit -> delete_application_request
val make_delete_app_block_builder_request : name:name -> unit -> delete_app_block_builder_request
val make_delete_app_block_request : name:name -> unit -> delete_app_block_request

val make_create_user_request :
  ?last_name:user_attribute_value ->
  ?first_name:user_attribute_value ->
  ?message_action:message_action ->
  authentication_type:authentication_type ->
  user_name:username ->
  unit ->
  create_user_request

val make_create_usage_report_subscription_request : unit -> unit

val make_create_updated_image_request :
  ?dry_run:boolean_ ->
  ?new_image_tags:tags ->
  ?new_image_display_name:display_name ->
  ?new_image_description:description ->
  new_image_name:name ->
  existing_image_name:name ->
  unit ->
  create_updated_image_request

val make_create_theme_for_stack_request :
  ?footer_links:theme_footer_links ->
  favicon_s3_location:s3_location ->
  organization_logo_s3_location:s3_location ->
  theme_styling:theme_styling ->
  title_text:theme_title_text ->
  stack_name:name ->
  unit ->
  create_theme_for_stack_request

val make_create_streaming_url_request :
  ?session_context:string_ ->
  ?validity:long ->
  ?application_id:string_ ->
  user_id:streaming_url_user_id ->
  fleet_name:string_ ->
  stack_name:string_ ->
  unit ->
  create_streaming_url_request

val make_create_stack_request :
  ?agent_access_config:agent_access_config ->
  ?content_redirection:content_redirection ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?embed_host_domains:embed_host_domains ->
  ?access_endpoints:access_endpoint_list ->
  ?tags:tags ->
  ?application_settings:application_settings ->
  ?user_settings:user_setting_list ->
  ?feedback_ur_l:feedback_ur_l ->
  ?redirect_ur_l:redirect_ur_l ->
  ?storage_connectors:storage_connector_list ->
  ?display_name:display_name ->
  ?description:description ->
  name:name ->
  unit ->
  create_stack_request

val make_application_config :
  ?launch_parameters:launch_parameters ->
  ?working_directory:file_path ->
  ?absolute_manifest_path:file_path ->
  ?absolute_icon_path:file_path ->
  ?display_name:app_display_name ->
  absolute_app_path:file_path ->
  name:app_name ->
  unit ->
  application_config

val make_create_imported_image_request :
  ?dry_run:boolean_ ->
  ?app_catalog_config:app_catalog_config ->
  ?agent_software_version:agent_software_version ->
  ?runtime_validation_config:runtime_validation_config ->
  ?tags:tags ->
  ?display_name:image_import_display_name ->
  ?description:image_import_description ->
  ?iam_role_arn:arn ->
  ?workspace_image_id:workspace_image_id ->
  ?source_ami_id:photon_ami_id ->
  name:name ->
  unit ->
  create_imported_image_request

val make_create_image_builder_streaming_url_request :
  ?validity:long -> name:string_ -> unit -> create_image_builder_streaming_url_request

val make_create_image_builder_request :
  ?disable_imds_v1:boolean_object ->
  ?softwares_to_uninstall:string_list ->
  ?softwares_to_install:string_list ->
  ?root_volume_config:volume_config ->
  ?access_endpoints:access_endpoint_list ->
  ?tags:tags ->
  ?appstream_agent_version:appstream_agent_version ->
  ?domain_join_info:domain_join_info ->
  ?enable_default_internet_access:boolean_object ->
  ?iam_role_arn:arn ->
  ?vpc_config:vpc_config ->
  ?display_name:display_name ->
  ?description:description ->
  ?image_arn:arn ->
  ?image_name:string_ ->
  instance_type:string_ ->
  name:name ->
  unit ->
  create_image_builder_request

val make_create_fleet_request :
  ?disable_imds_v1:boolean_object ->
  ?root_volume_config:volume_config ->
  ?max_sessions_per_instance:integer ->
  ?session_script_s3_location:s3_location ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?max_concurrent_sessions:integer ->
  ?platform:platform_type ->
  ?stream_view:stream_view ->
  ?iam_role_arn:arn ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?tags:tags ->
  ?domain_join_info:domain_join_info ->
  ?enable_default_internet_access:boolean_object ->
  ?display_name:display_name ->
  ?description:description ->
  ?disconnect_timeout_in_seconds:integer ->
  ?max_user_duration_in_seconds:integer ->
  ?vpc_config:vpc_config ->
  ?compute_capacity:compute_capacity ->
  ?fleet_type:fleet_type ->
  ?image_arn:arn ->
  ?image_name:name ->
  instance_type:string_ ->
  name:name ->
  unit ->
  create_fleet_request

val make_create_export_image_task_request :
  ?ami_description:description ->
  ?tag_specifications:tags ->
  iam_role_arn:arn ->
  ami_name:ami_name ->
  image_name:name ->
  unit ->
  create_export_image_task_request

val make_create_entitlement_request :
  ?description:description ->
  attributes:entitlement_attribute_list ->
  app_visibility:app_visibility ->
  stack_name:name ->
  name:name ->
  unit ->
  create_entitlement_request

val make_create_directory_config_request :
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?service_account_credentials:service_account_credentials ->
  organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  directory_name:directory_name ->
  unit ->
  create_directory_config_request

val make_create_application_request :
  ?tags:tags ->
  ?launch_parameters:string_ ->
  ?working_directory:string_ ->
  ?description:description ->
  ?display_name:display_name ->
  app_block_arn:arn ->
  instance_families:string_list ->
  platforms:platforms ->
  launch_path:string_ ->
  icon_s3_location:s3_location ->
  name:name ->
  unit ->
  create_application_request

val make_create_app_block_builder_streaming_url_request :
  ?validity:long ->
  app_block_builder_name:name ->
  unit ->
  create_app_block_builder_streaming_url_request

val make_create_app_block_builder_request :
  ?disable_imds_v1:boolean_object ->
  ?access_endpoints:access_endpoint_list ->
  ?iam_role_arn:arn ->
  ?enable_default_internet_access:boolean_object ->
  ?tags:tags ->
  ?display_name:display_name ->
  ?description:description ->
  vpc_config:vpc_config ->
  instance_type:string_ ->
  platform:app_block_builder_platform_type ->
  name:name ->
  unit ->
  create_app_block_builder_request

val make_create_app_block_request :
  ?packaging_type:packaging_type ->
  ?post_setup_script_details:script_details ->
  ?tags:tags ->
  ?setup_script_details:script_details ->
  ?display_name:display_name ->
  ?description:description ->
  source_s3_location:s3_location ->
  name:name ->
  unit ->
  create_app_block_request

val make_copy_image_response : ?destination_image_name:name -> unit -> copy_image_response

val make_copy_image_request :
  ?destination_image_description:description ->
  destination_region:region_name ->
  destination_image_name:name ->
  source_image_name:name ->
  unit ->
  copy_image_request

val make_batch_disassociate_user_stack_request :
  user_stack_associations:user_stack_association_list ->
  unit ->
  batch_disassociate_user_stack_request

val make_batch_associate_user_stack_request :
  user_stack_associations:user_stack_association_list -> unit -> batch_associate_user_stack_request

val make_associate_software_to_image_builder_request :
  software_names:string_list ->
  image_builder_name:name ->
  unit ->
  associate_software_to_image_builder_request

val make_associate_fleet_request :
  stack_name:string_ -> fleet_name:string_ -> unit -> associate_fleet_request

val make_associate_application_to_entitlement_request :
  application_identifier:string_ ->
  entitlement_name:name ->
  stack_name:name ->
  unit ->
  associate_application_to_entitlement_request

val make_associate_application_fleet_request :
  application_arn:arn -> fleet_name:name -> unit -> associate_application_fleet_request

val make_associate_app_block_builder_app_block_request :
  app_block_builder_name:name ->
  app_block_arn:arn ->
  unit ->
  associate_app_block_builder_app_block_request
