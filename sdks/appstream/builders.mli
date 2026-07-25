open Types

val make_access_endpoint :
  ?vpce_id:string_ -> endpoint_type:access_endpoint_type -> unit -> access_endpoint

val make_admin_app_license_usage_record :
  user_arn:string_ ->
  billing_period:string_ ->
  owner_aws_account_id:aws_account_id ->
  subscription_first_used_date:timestamp ->
  subscription_last_used_date:timestamp ->
  license_type:string_ ->
  user_id:string_ ->
  unit ->
  admin_app_license_usage_record

val make_agent_access_setting :
  agent_action:agent_action -> permission:permission -> unit -> agent_access_setting

val make_agent_access_config :
  ?s3_bucket_arn:s3_bucket_arn ->
  ?screenshots_upload_enabled:boolean_object ->
  ?user_control_mode:user_control_mode ->
  settings:agent_access_setting_list ->
  screen_resolution:screen_resolution ->
  screen_image_format:screen_image_format ->
  unit ->
  agent_access_config

val make_agent_access_config_for_update :
  ?settings:agent_access_setting_list ->
  ?s3_bucket_arn:s3_bucket_arn ->
  ?screenshots_upload_enabled:boolean_object ->
  ?screen_resolution:screen_resolution ->
  ?screen_image_format:screen_image_format ->
  ?user_control_mode:user_control_mode ->
  unit ->
  agent_access_config_for_update

val make_error_details : ?error_code:string_ -> ?error_message:string_ -> unit -> error_details
val make_s3_location : ?s3_key:s3_key -> s3_bucket:s3_bucket -> unit -> s3_location

val make_script_details :
  ?executable_parameters:string_ ->
  script_s3_location:s3_location ->
  executable_path:string_ ->
  timeout_in_seconds:integer ->
  unit ->
  script_details

val make_app_block :
  ?description:string_ ->
  ?display_name:string_ ->
  ?source_s3_location:s3_location ->
  ?setup_script_details:script_details ->
  ?created_time:timestamp ->
  ?post_setup_script_details:script_details ->
  ?packaging_type:packaging_type ->
  ?state:app_block_state ->
  ?app_block_errors:error_details_list ->
  name:string_ ->
  arn:arn ->
  unit ->
  app_block

val make_app_block_builder_state_change_reason :
  ?code:app_block_builder_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  app_block_builder_state_change_reason

val make_resource_error :
  ?error_code:fleet_error_code ->
  ?error_message:string_ ->
  ?error_timestamp:timestamp ->
  unit ->
  resource_error

val make_vpc_config :
  ?subnet_ids:subnet_id_list -> ?security_group_ids:security_group_id_list -> unit -> vpc_config

val make_app_block_builder :
  ?display_name:string_ ->
  ?description:string_ ->
  ?enable_default_internet_access:boolean_object ->
  ?iam_role_arn:arn ->
  ?created_time:timestamp ->
  ?app_block_builder_errors:resource_errors ->
  ?state_change_reason:app_block_builder_state_change_reason ->
  ?access_endpoints:access_endpoint_list ->
  ?disable_imds_v1:boolean_object ->
  arn:arn ->
  name:string_ ->
  platform:app_block_builder_platform_type ->
  instance_type:string_ ->
  vpc_config:vpc_config ->
  state:app_block_builder_state ->
  unit ->
  app_block_builder

val make_app_block_builder_app_block_association :
  app_block_arn:arn ->
  app_block_builder_name:name ->
  unit ->
  app_block_builder_app_block_association

val make_application_config :
  ?display_name:app_display_name ->
  ?absolute_icon_path:file_path ->
  ?absolute_manifest_path:file_path ->
  ?working_directory:file_path ->
  ?launch_parameters:launch_parameters ->
  name:app_name ->
  absolute_app_path:file_path ->
  unit ->
  application_config

val make_application :
  ?name:string_ ->
  ?display_name:string_ ->
  ?icon_ur_l:string_ ->
  ?launch_path:string_ ->
  ?launch_parameters:string_ ->
  ?enabled:boolean_ ->
  ?metadata:metadata ->
  ?working_directory:string_ ->
  ?description:string_ ->
  ?arn:arn ->
  ?app_block_arn:arn ->
  ?icon_s3_location:s3_location ->
  ?platforms:platforms ->
  ?instance_families:string_list ->
  ?created_time:timestamp ->
  unit ->
  application

val make_application_fleet_association :
  fleet_name:string_ -> application_arn:arn -> unit -> application_fleet_association

val make_application_settings :
  ?settings_group:settings_group -> enabled:boolean_ -> unit -> application_settings

val make_application_settings_response :
  ?enabled:boolean_ ->
  ?settings_group:settings_group ->
  ?s3_bucket_name:string_ ->
  unit ->
  application_settings_response

val make_associate_app_block_builder_app_block_request :
  app_block_arn:arn ->
  app_block_builder_name:name ->
  unit ->
  associate_app_block_builder_app_block_request

val make_associate_application_fleet_request :
  fleet_name:name -> application_arn:arn -> unit -> associate_application_fleet_request

val make_associate_application_to_entitlement_request :
  stack_name:name ->
  entitlement_name:name ->
  application_identifier:string_ ->
  unit ->
  associate_application_to_entitlement_request

val make_associate_fleet_request :
  fleet_name:string_ -> stack_name:string_ -> unit -> associate_fleet_request

val make_associate_software_to_image_builder_request :
  image_builder_name:name ->
  software_names:string_list ->
  unit ->
  associate_software_to_image_builder_request

val make_user_stack_association :
  ?send_email_notification:boolean_ ->
  stack_name:string_ ->
  user_name:username ->
  authentication_type:authentication_type ->
  unit ->
  user_stack_association

val make_user_stack_association_error :
  ?user_stack_association:user_stack_association ->
  ?error_code:user_stack_association_error_code ->
  ?error_message:string_ ->
  unit ->
  user_stack_association_error

val make_batch_associate_user_stack_request :
  user_stack_associations:user_stack_association_list -> unit -> batch_associate_user_stack_request

val make_batch_disassociate_user_stack_request :
  user_stack_associations:user_stack_association_list ->
  unit ->
  batch_disassociate_user_stack_request

val make_certificate_based_auth_properties :
  ?status:certificate_based_auth_status ->
  ?certificate_authority_arn:arn ->
  unit ->
  certificate_based_auth_properties

val make_compute_capacity :
  ?desired_instances:integer -> ?desired_sessions:integer -> unit -> compute_capacity

val make_compute_capacity_status :
  ?running:integer ->
  ?in_use:integer ->
  ?available:integer ->
  ?desired_user_sessions:integer ->
  ?available_user_sessions:integer ->
  ?active_user_sessions:integer ->
  ?actual_user_sessions:integer ->
  ?draining:integer ->
  ?drain_mode_active_user_sessions:integer ->
  ?drain_mode_unused_user_sessions:integer ->
  desired:integer ->
  unit ->
  compute_capacity_status

val make_url_redirection_config :
  ?allowed_urls:url_pattern_list ->
  ?denied_urls:url_pattern_list ->
  enabled:boolean_object ->
  unit ->
  url_redirection_config

val make_content_redirection : ?host_to_client:url_redirection_config -> unit -> content_redirection
val make_copy_image_response : ?destination_image_name:name -> unit -> copy_image_response

val make_copy_image_request :
  ?destination_image_description:description ->
  source_image_name:name ->
  destination_image_name:name ->
  destination_region:region_name ->
  unit ->
  copy_image_request

val make_create_app_block_request :
  ?description:description ->
  ?display_name:display_name ->
  ?setup_script_details:script_details ->
  ?tags:tags ->
  ?post_setup_script_details:script_details ->
  ?packaging_type:packaging_type ->
  name:name ->
  source_s3_location:s3_location ->
  unit ->
  create_app_block_request

val make_create_app_block_builder_request :
  ?description:description ->
  ?display_name:display_name ->
  ?tags:tags ->
  ?enable_default_internet_access:boolean_object ->
  ?iam_role_arn:arn ->
  ?access_endpoints:access_endpoint_list ->
  ?disable_imds_v1:boolean_object ->
  name:name ->
  platform:app_block_builder_platform_type ->
  instance_type:string_ ->
  vpc_config:vpc_config ->
  unit ->
  create_app_block_builder_request

val make_create_app_block_builder_streaming_url_request :
  ?validity:long ->
  app_block_builder_name:name ->
  unit ->
  create_app_block_builder_streaming_url_request

val make_create_application_request :
  ?display_name:display_name ->
  ?description:description ->
  ?working_directory:string_ ->
  ?launch_parameters:string_ ->
  ?tags:tags ->
  name:name ->
  icon_s3_location:s3_location ->
  launch_path:string_ ->
  platforms:platforms ->
  instance_families:string_list ->
  app_block_arn:arn ->
  unit ->
  create_application_request

val make_service_account_credentials :
  account_name:account_name ->
  account_password:account_password ->
  unit ->
  service_account_credentials

val make_directory_config :
  ?organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  ?service_account_credentials:service_account_credentials ->
  ?created_time:timestamp ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  directory_name:directory_name ->
  unit ->
  directory_config

val make_create_directory_config_request :
  ?service_account_credentials:service_account_credentials ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  directory_name:directory_name ->
  organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  unit ->
  create_directory_config_request

val make_entitlement_attribute : name:string_ -> value:string_ -> unit -> entitlement_attribute

val make_entitlement :
  ?description:description ->
  ?created_time:timestamp ->
  ?last_modified_time:timestamp ->
  name:name ->
  stack_name:name ->
  app_visibility:app_visibility ->
  attributes:entitlement_attribute_list ->
  unit ->
  entitlement

val make_create_entitlement_request :
  ?description:description ->
  name:name ->
  stack_name:name ->
  app_visibility:app_visibility ->
  attributes:entitlement_attribute_list ->
  unit ->
  create_entitlement_request

val make_export_image_task :
  ?ami_description:description ->
  ?state:export_image_task_state ->
  ?ami_id:photon_ami_id ->
  ?tag_specifications:tags ->
  ?error_details:error_details_list ->
  task_id:uui_d ->
  image_arn:arn ->
  ami_name:ami_name ->
  created_date:timestamp ->
  unit ->
  export_image_task

val make_create_export_image_task_request :
  ?tag_specifications:tags ->
  ?ami_description:description ->
  image_name:name ->
  ami_name:ami_name ->
  iam_role_arn:arn ->
  unit ->
  create_export_image_task_request

val make_volume_config : ?volume_size_in_gb:integer -> unit -> volume_config

val make_domain_join_info :
  ?directory_name:directory_name ->
  ?organizational_unit_distinguished_name:organizational_unit_distinguished_name ->
  unit ->
  domain_join_info

val make_fleet_error : ?error_code:fleet_error_code -> ?error_message:string_ -> unit -> fleet_error

val make_fleet :
  ?display_name:string_ ->
  ?description:string_ ->
  ?image_name:string_ ->
  ?image_arn:arn ->
  ?fleet_type:fleet_type ->
  ?max_user_duration_in_seconds:integer ->
  ?disconnect_timeout_in_seconds:integer ->
  ?vpc_config:vpc_config ->
  ?created_time:timestamp ->
  ?fleet_errors:fleet_errors ->
  ?enable_default_internet_access:boolean_object ->
  ?domain_join_info:domain_join_info ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?iam_role_arn:arn ->
  ?stream_view:stream_view ->
  ?platform:platform_type ->
  ?max_concurrent_sessions:integer ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?session_script_s3_location:s3_location ->
  ?max_sessions_per_instance:integer ->
  ?root_volume_config:volume_config ->
  ?disable_imds_v1:boolean_object ->
  arn:arn ->
  name:string_ ->
  instance_type:string_ ->
  compute_capacity_status:compute_capacity_status ->
  state:fleet_state ->
  unit ->
  fleet

val make_create_fleet_request :
  ?image_name:name ->
  ?image_arn:arn ->
  ?fleet_type:fleet_type ->
  ?compute_capacity:compute_capacity ->
  ?vpc_config:vpc_config ->
  ?max_user_duration_in_seconds:integer ->
  ?disconnect_timeout_in_seconds:integer ->
  ?description:description ->
  ?display_name:display_name ->
  ?enable_default_internet_access:boolean_object ->
  ?domain_join_info:domain_join_info ->
  ?tags:tags ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?iam_role_arn:arn ->
  ?stream_view:stream_view ->
  ?platform:platform_type ->
  ?max_concurrent_sessions:integer ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?session_script_s3_location:s3_location ->
  ?max_sessions_per_instance:integer ->
  ?root_volume_config:volume_config ->
  ?disable_imds_v1:boolean_object ->
  name:name ->
  instance_type:string_ ->
  unit ->
  create_fleet_request

val make_network_access_configuration :
  ?eni_private_ip_address:string_ ->
  ?eni_ipv6_addresses:string_list ->
  ?eni_id:string_ ->
  unit ->
  network_access_configuration

val make_image_builder_state_change_reason :
  ?code:image_builder_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  image_builder_state_change_reason

val make_image_builder :
  ?arn:arn ->
  ?image_arn:arn ->
  ?description:string_ ->
  ?display_name:string_ ->
  ?vpc_config:vpc_config ->
  ?instance_type:string_ ->
  ?platform:platform_type ->
  ?iam_role_arn:arn ->
  ?state:image_builder_state ->
  ?state_change_reason:image_builder_state_change_reason ->
  ?created_time:timestamp ->
  ?enable_default_internet_access:boolean_object ->
  ?domain_join_info:domain_join_info ->
  ?network_access_configuration:network_access_configuration ->
  ?image_builder_errors:resource_errors ->
  ?appstream_agent_version:appstream_agent_version ->
  ?access_endpoints:access_endpoint_list ->
  ?root_volume_config:volume_config ->
  ?latest_appstream_agent_version:latest_appstream_agent_version ->
  ?disable_imds_v1:boolean_object ->
  name:string_ ->
  unit ->
  image_builder

val make_create_image_builder_request :
  ?image_name:string_ ->
  ?image_arn:arn ->
  ?description:description ->
  ?display_name:display_name ->
  ?vpc_config:vpc_config ->
  ?iam_role_arn:arn ->
  ?enable_default_internet_access:boolean_object ->
  ?domain_join_info:domain_join_info ->
  ?appstream_agent_version:appstream_agent_version ->
  ?tags:tags ->
  ?access_endpoints:access_endpoint_list ->
  ?root_volume_config:volume_config ->
  ?softwares_to_install:string_list ->
  ?softwares_to_uninstall:string_list ->
  ?disable_imds_v1:boolean_object ->
  name:name ->
  instance_type:string_ ->
  unit ->
  create_image_builder_request

val make_create_image_builder_streaming_url_request :
  ?validity:long -> name:string_ -> unit -> create_image_builder_streaming_url_request

val make_image_permissions :
  ?allow_fleet:boolean_object -> ?allow_image_builder:boolean_object -> unit -> image_permissions

val make_image_state_change_reason :
  ?code:image_state_change_reason_code -> ?message:string_ -> unit -> image_state_change_reason

val make_image :
  ?arn:arn ->
  ?base_image_arn:arn ->
  ?display_name:string_ ->
  ?state:image_state ->
  ?visibility:visibility_type ->
  ?image_builder_supported:boolean_ ->
  ?image_builder_name:string_ ->
  ?platform:platform_type ->
  ?description:string_ ->
  ?state_change_reason:image_state_change_reason ->
  ?applications:applications ->
  ?created_time:timestamp ->
  ?public_base_image_released_date:timestamp ->
  ?appstream_agent_version:appstream_agent_version ->
  ?image_permissions:image_permissions ->
  ?image_errors:resource_errors ->
  ?latest_appstream_agent_version:latest_appstream_agent_version ->
  ?supported_instance_families:string_list ->
  ?dynamic_app_providers_enabled:dynamic_app_providers_enabled ->
  ?image_shared_with_others:image_shared_with_others ->
  ?managed_software_included:boolean_ ->
  ?image_type:image_type ->
  name:string_ ->
  unit ->
  image

val make_runtime_validation_config :
  ?intended_instance_type:instance_type -> unit -> runtime_validation_config

val make_create_imported_image_request :
  ?source_ami_id:photon_ami_id ->
  ?workspace_image_id:workspace_image_id ->
  ?iam_role_arn:arn ->
  ?description:image_import_description ->
  ?display_name:image_import_display_name ->
  ?tags:tags ->
  ?runtime_validation_config:runtime_validation_config ->
  ?agent_software_version:agent_software_version ->
  ?app_catalog_config:app_catalog_config ->
  ?dry_run:boolean_ ->
  name:name ->
  unit ->
  create_imported_image_request

val make_streaming_experience_settings :
  ?preferred_protocol:preferred_protocol -> unit -> streaming_experience_settings

val make_user_setting :
  ?maximum_length:integer -> action:action -> permission:permission -> unit -> user_setting

val make_stack_error : ?error_code:stack_error_code -> ?error_message:string_ -> unit -> stack_error

val make_storage_connector :
  ?resource_identifier:resource_identifier ->
  ?domains:domain_list ->
  ?domains_require_admin_consent:domain_list ->
  connector_type:storage_connector_type ->
  unit ->
  storage_connector

val make_stack :
  ?arn:arn ->
  ?description:string_ ->
  ?display_name:string_ ->
  ?created_time:timestamp ->
  ?storage_connectors:storage_connector_list ->
  ?redirect_ur_l:redirect_ur_l ->
  ?feedback_ur_l:feedback_ur_l ->
  ?stack_errors:stack_errors ->
  ?user_settings:user_setting_list ->
  ?application_settings:application_settings_response ->
  ?access_endpoints:access_endpoint_list ->
  ?embed_host_domains:embed_host_domains ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?content_redirection:content_redirection ->
  ?agent_access_config:agent_access_config ->
  name:string_ ->
  unit ->
  stack

val make_create_stack_request :
  ?description:description ->
  ?display_name:display_name ->
  ?storage_connectors:storage_connector_list ->
  ?redirect_ur_l:redirect_ur_l ->
  ?feedback_ur_l:feedback_ur_l ->
  ?user_settings:user_setting_list ->
  ?application_settings:application_settings ->
  ?tags:tags ->
  ?access_endpoints:access_endpoint_list ->
  ?embed_host_domains:embed_host_domains ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?content_redirection:content_redirection ->
  ?agent_access_config:agent_access_config ->
  name:name ->
  unit ->
  create_stack_request

val make_create_streaming_url_request :
  ?application_id:string_ ->
  ?validity:long ->
  ?session_context:string_ ->
  stack_name:string_ ->
  fleet_name:string_ ->
  user_id:streaming_url_user_id ->
  unit ->
  create_streaming_url_request

val make_theme_footer_link :
  ?display_name:theme_footer_link_display_name ->
  ?footer_link_ur_l:theme_footer_link_ur_l ->
  unit ->
  theme_footer_link

val make_theme :
  ?stack_name:name ->
  ?state:theme_state ->
  ?theme_title_text:theme_title_text ->
  ?theme_styling:theme_styling ->
  ?theme_footer_links:theme_footer_links ->
  ?theme_organization_logo_ur_l:string_ ->
  ?theme_favicon_ur_l:string_ ->
  ?created_time:timestamp ->
  unit ->
  theme

val make_create_theme_for_stack_request :
  ?footer_links:theme_footer_links ->
  stack_name:name ->
  title_text:theme_title_text ->
  theme_styling:theme_styling ->
  organization_logo_s3_location:s3_location ->
  favicon_s3_location:s3_location ->
  unit ->
  create_theme_for_stack_request

val make_create_updated_image_request :
  ?new_image_description:description ->
  ?new_image_display_name:display_name ->
  ?new_image_tags:tags ->
  ?dry_run:boolean_ ->
  existing_image_name:name ->
  new_image_name:name ->
  unit ->
  create_updated_image_request

val make_create_usage_report_subscription_request : unit -> unit

val make_create_user_request :
  ?message_action:message_action ->
  ?first_name:user_attribute_value ->
  ?last_name:user_attribute_value ->
  user_name:username ->
  authentication_type:authentication_type ->
  unit ->
  create_user_request

val make_delete_app_block_request : name:name -> unit -> delete_app_block_request
val make_delete_app_block_builder_request : name:name -> unit -> delete_app_block_builder_request
val make_delete_application_request : name:name -> unit -> delete_application_request

val make_delete_directory_config_request :
  directory_name:directory_name -> unit -> delete_directory_config_request

val make_delete_entitlement_request :
  name:name -> stack_name:name -> unit -> delete_entitlement_request

val make_delete_fleet_request : name:string_ -> unit -> delete_fleet_request
val make_delete_image_request : name:name -> unit -> delete_image_request
val make_delete_image_builder_request : name:name -> unit -> delete_image_builder_request

val make_delete_image_permissions_request :
  name:name -> shared_account_id:aws_account_id -> unit -> delete_image_permissions_request

val make_delete_stack_request : name:string_ -> unit -> delete_stack_request
val make_delete_theme_for_stack_request : stack_name:name -> unit -> delete_theme_for_stack_request
val make_delete_usage_report_subscription_request : unit -> unit

val make_delete_user_request :
  user_name:username -> authentication_type:authentication_type -> unit -> delete_user_request

val make_describe_app_block_builder_app_block_associations_request :
  ?app_block_arn:arn ->
  ?app_block_builder_name:name ->
  ?max_results:integer ->
  ?next_token:string_ ->
  unit ->
  describe_app_block_builder_app_block_associations_request

val make_describe_app_block_builders_request :
  ?names:string_list ->
  ?next_token:string_ ->
  ?max_results:integer ->
  unit ->
  describe_app_block_builders_request

val make_describe_app_blocks_request :
  ?arns:arn_list ->
  ?next_token:string_ ->
  ?max_results:integer ->
  unit ->
  describe_app_blocks_request

val make_describe_app_license_usage_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  billing_period:string_ ->
  unit ->
  describe_app_license_usage_request

val make_describe_application_fleet_associations_request :
  ?fleet_name:name ->
  ?application_arn:arn ->
  ?max_results:integer ->
  ?next_token:string_ ->
  unit ->
  describe_application_fleet_associations_request

val make_describe_applications_request :
  ?arns:arn_list ->
  ?next_token:string_ ->
  ?max_results:integer ->
  unit ->
  describe_applications_request

val make_describe_directory_configs_request :
  ?directory_names:directory_name_list ->
  ?max_results:integer ->
  ?next_token:string_ ->
  unit ->
  describe_directory_configs_request

val make_describe_entitlements_request :
  ?name:name ->
  ?next_token:string_ ->
  ?max_results:integer ->
  stack_name:name ->
  unit ->
  describe_entitlements_request

val make_describe_fleets_request :
  ?names:string_list -> ?next_token:string_ -> unit -> describe_fleets_request

val make_describe_image_builders_request :
  ?names:string_list ->
  ?max_results:integer ->
  ?next_token:string_ ->
  unit ->
  describe_image_builders_request

val make_shared_image_permissions :
  shared_account_id:aws_account_id ->
  image_permissions:image_permissions ->
  unit ->
  shared_image_permissions

val make_describe_image_permissions_request :
  ?max_results:max_results ->
  ?shared_aws_account_ids:aws_account_id_list ->
  ?next_token:string_ ->
  name:name ->
  unit ->
  describe_image_permissions_request

val make_describe_images_request :
  ?names:string_list ->
  ?arns:arn_list ->
  ?type_:visibility_type ->
  ?next_token:string_ ->
  ?max_results:describe_images_max_results ->
  unit ->
  describe_images_request

val make_session :
  ?connection_state:session_connection_state ->
  ?start_time:timestamp ->
  ?max_expiration_time:timestamp ->
  ?authentication_type:authentication_type ->
  ?network_access_configuration:network_access_configuration ->
  ?instance_id:string_ ->
  ?instance_drain_status:instance_drain_status ->
  id:string_ ->
  user_id:user_id ->
  stack_name:string_ ->
  fleet_name:string_ ->
  state:session_state ->
  unit ->
  session

val make_describe_sessions_request :
  ?user_id:user_id ->
  ?next_token:string_ ->
  ?limit:integer ->
  ?authentication_type:authentication_type ->
  ?instance_id:string_ ->
  stack_name:name ->
  fleet_name:name ->
  unit ->
  describe_sessions_request

val make_software_associations :
  ?software_name:string_ ->
  ?status:software_deployment_status ->
  ?deployment_error:error_details_list ->
  unit ->
  software_associations

val make_describe_software_associations_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  associated_resource:arn ->
  unit ->
  describe_software_associations_request

val make_describe_stacks_request :
  ?names:string_list -> ?next_token:string_ -> unit -> describe_stacks_request

val make_describe_theme_for_stack_request :
  stack_name:name -> unit -> describe_theme_for_stack_request

val make_last_report_generation_execution_error :
  ?error_code:usage_report_execution_error_code ->
  ?error_message:string_ ->
  unit ->
  last_report_generation_execution_error

val make_usage_report_subscription :
  ?s3_bucket_name:string_ ->
  ?schedule:usage_report_schedule ->
  ?last_generated_report_date:timestamp ->
  ?subscription_errors:last_report_generation_execution_errors ->
  unit ->
  usage_report_subscription

val make_describe_usage_report_subscriptions_request :
  ?max_results:integer -> ?next_token:string_ -> unit -> describe_usage_report_subscriptions_request

val make_describe_user_stack_associations_request :
  ?stack_name:string_ ->
  ?user_name:username ->
  ?authentication_type:authentication_type ->
  ?max_results:max_results ->
  ?next_token:string_ ->
  unit ->
  describe_user_stack_associations_request

val make_user :
  ?arn:arn ->
  ?user_name:username ->
  ?enabled:boolean_ ->
  ?status:string_ ->
  ?first_name:user_attribute_value ->
  ?last_name:user_attribute_value ->
  ?created_time:timestamp ->
  authentication_type:authentication_type ->
  unit ->
  user

val make_describe_users_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  authentication_type:authentication_type ->
  unit ->
  describe_users_request

val make_disable_user_request :
  user_name:username -> authentication_type:authentication_type -> unit -> disable_user_request

val make_disassociate_app_block_builder_app_block_request :
  app_block_arn:arn ->
  app_block_builder_name:name ->
  unit ->
  disassociate_app_block_builder_app_block_request

val make_disassociate_application_fleet_request :
  fleet_name:name -> application_arn:arn -> unit -> disassociate_application_fleet_request

val make_disassociate_application_from_entitlement_request :
  stack_name:name ->
  entitlement_name:name ->
  application_identifier:string_ ->
  unit ->
  disassociate_application_from_entitlement_request

val make_disassociate_fleet_request :
  fleet_name:string_ -> stack_name:string_ -> unit -> disassociate_fleet_request

val make_disassociate_software_from_image_builder_request :
  image_builder_name:name ->
  software_names:string_list ->
  unit ->
  disassociate_software_from_image_builder_request

val make_drain_session_instance_request :
  session_id:string_ -> unit -> drain_session_instance_request

val make_enable_user_request :
  user_name:username -> authentication_type:authentication_type -> unit -> enable_user_request

val make_entitled_application : application_identifier:string_ -> unit -> entitled_application
val make_expire_session_request : session_id:string_ -> unit -> expire_session_request
val make_filter : name:filter_name -> values:filter_values -> unit -> filter
val make_get_export_image_task_request : ?task_id:uui_d -> unit -> get_export_image_task_request

val make_list_associated_fleets_request :
  ?next_token:string_ -> stack_name:string_ -> unit -> list_associated_fleets_request

val make_list_associated_stacks_request :
  ?next_token:string_ -> fleet_name:string_ -> unit -> list_associated_stacks_request

val make_list_entitled_applications_request :
  ?next_token:string_ ->
  ?max_results:integer ->
  stack_name:name ->
  entitlement_name:name ->
  unit ->
  list_entitled_applications_request

val make_list_export_image_tasks_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:string_ ->
  unit ->
  list_export_image_tasks_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_update_theme_for_stack_request :
  ?footer_links:theme_footer_links ->
  ?title_text:theme_title_text ->
  ?theme_styling:theme_styling ->
  ?organization_logo_s3_location:s3_location ->
  ?favicon_s3_location:s3_location ->
  ?state:theme_state ->
  ?attributes_to_delete:theme_attributes ->
  stack_name:name ->
  unit ->
  update_theme_for_stack_request

val make_update_stack_request :
  ?display_name:display_name ->
  ?description:description ->
  ?storage_connectors:storage_connector_list ->
  ?delete_storage_connectors:boolean_ ->
  ?redirect_ur_l:redirect_ur_l ->
  ?feedback_ur_l:feedback_ur_l ->
  ?attributes_to_delete:stack_attributes ->
  ?user_settings:user_setting_list ->
  ?application_settings:application_settings ->
  ?access_endpoints:access_endpoint_list ->
  ?embed_host_domains:embed_host_domains ->
  ?streaming_experience_settings:streaming_experience_settings ->
  ?content_redirection:content_redirection ->
  ?agent_access_config:agent_access_config_for_update ->
  name:string_ ->
  unit ->
  update_stack_request

val make_update_image_permissions_request :
  name:name ->
  shared_account_id:aws_account_id ->
  image_permissions:image_permissions ->
  unit ->
  update_image_permissions_request

val make_update_fleet_request :
  ?image_name:string_ ->
  ?image_arn:arn ->
  ?name:name ->
  ?instance_type:string_ ->
  ?compute_capacity:compute_capacity ->
  ?vpc_config:vpc_config ->
  ?max_user_duration_in_seconds:integer ->
  ?disconnect_timeout_in_seconds:integer ->
  ?delete_vpc_config:boolean_ ->
  ?description:description ->
  ?display_name:display_name ->
  ?enable_default_internet_access:boolean_object ->
  ?domain_join_info:domain_join_info ->
  ?idle_disconnect_timeout_in_seconds:integer ->
  ?attributes_to_delete:fleet_attributes ->
  ?iam_role_arn:arn ->
  ?stream_view:stream_view ->
  ?platform:platform_type ->
  ?max_concurrent_sessions:integer ->
  ?usb_device_filter_strings:usb_device_filter_strings ->
  ?session_script_s3_location:s3_location ->
  ?max_sessions_per_instance:integer ->
  ?root_volume_config:volume_config ->
  ?disable_imds_v1:boolean_object ->
  unit ->
  update_fleet_request

val make_update_entitlement_request :
  ?description:description ->
  ?app_visibility:app_visibility ->
  ?attributes:entitlement_attribute_list ->
  name:name ->
  stack_name:name ->
  unit ->
  update_entitlement_request

val make_update_directory_config_request :
  ?organizational_unit_distinguished_names:organizational_unit_distinguished_names_list ->
  ?service_account_credentials:service_account_credentials ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  directory_name:directory_name ->
  unit ->
  update_directory_config_request

val make_update_application_request :
  ?display_name:display_name ->
  ?description:description ->
  ?icon_s3_location:s3_location ->
  ?launch_path:string_ ->
  ?working_directory:string_ ->
  ?launch_parameters:string_ ->
  ?app_block_arn:arn ->
  ?attributes_to_delete:application_attributes ->
  name:name ->
  unit ->
  update_application_request

val make_update_app_block_builder_request :
  ?description:description ->
  ?display_name:display_name ->
  ?platform:platform_type ->
  ?instance_type:string_ ->
  ?vpc_config:vpc_config ->
  ?enable_default_internet_access:boolean_object ->
  ?iam_role_arn:arn ->
  ?access_endpoints:access_endpoint_list ->
  ?attributes_to_delete:app_block_builder_attributes ->
  ?disable_imds_v1:boolean_object ->
  name:name ->
  unit ->
  update_app_block_builder_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : resource_arn:arn -> tags:tags -> unit -> tag_resource_request
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
