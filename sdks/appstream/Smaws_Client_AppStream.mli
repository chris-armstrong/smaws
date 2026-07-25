(** AppStream client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module StartAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_app_block_builder_request ->
    ( start_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_app_block_builder_request ->
    ( start_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an app block builder.\n\n\
  \ An app block builder can only be started when it's associated with an app block.\n\
  \ \n\
  \  Starting an app block builder starts a new instance, which is equivalent to an elastic fleet \
   instance with application builder assistance functionality.\n\
  \  "]

module StartFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_request ->
    ( start_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_request ->
    ( start_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified fleet.\n"]

module StartImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_image_builder_request ->
    ( start_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_image_builder_request ->
    ( start_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified image builder.\n"]

module StartSoftwareDeploymentToImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_software_deployment_to_image_builder_request ->
    ( start_software_deployment_to_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_software_deployment_to_image_builder_request ->
    ( start_software_deployment_to_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initiates license included applications deployment to an image builder instance.\n"]

module StopAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_app_block_builder_request ->
    ( stop_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_app_block_builder_request ->
    ( stop_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an app block builder.\n\n\
  \ Stopping an app block builder terminates the instance, and the instance state is not persisted.\n\
  \ "]

module StopFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_request ->
    ( stop_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_request ->
    ( stop_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified fleet.\n"]

module StopImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_image_builder_request ->
    ( stop_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_image_builder_request ->
    ( stop_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified image builder.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified WorkSpaces Applications resource. You can \
   tag WorkSpaces Applications image builders, images, fleets, and stacks.\n\n\
  \ Each tag consists of a key and an optional value. If a resource already has a tag with the \
   same key, this operation updates its value.\n\
  \ \n\
  \  To list the current tags for your resources, use [ListTagsForResource]. To disassociate tags \
   from your resources, use [UntagResource].\n\
  \  \n\
  \   For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \   "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates one or more specified tags from the specified WorkSpaces Applications resource.\n\n\
  \ To list the current tags for your resources, use [ListTagsForResource].\n\
  \ \n\
  \  For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \  "]

module UpdateAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_app_block_builder_request ->
    ( update_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_app_block_builder_request ->
    ( update_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an app block builder.\n\n\
  \ If the app block builder is in the [STARTING] or [STOPPING] state, you can't update it. If the \
   app block builder is in the [RUNNING] state, you can only update the DisplayName and \
   Description. If the app block builder is in the [STOPPED] state, you can update any attribute \
   except the Name.\n\
  \ "]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified application.\n"]

module UpdateDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidRoleException of invalid_role_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_directory_config_request ->
    ( update_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidRoleException of invalid_role_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_directory_config_request ->
    ( update_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidRoleException of invalid_role_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified Directory Config object in WorkSpaces Applications. This object includes \
   the configuration information required to join fleets and image builders to Microsoft Active \
   Directory domains.\n"]

module UpdateEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_entitlement_request ->
    ( update_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_entitlement_request ->
    ( update_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified entitlement.\n"]

module UpdateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_request ->
    ( update_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_request ->
    ( update_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified fleet.\n\n\
  \ If the fleet is in the [STOPPED] state, you can update any attribute except the fleet name.\n\
  \ \n\
  \  If the fleet is in the [RUNNING] state, you can update the following based on the fleet type:\n\
  \  \n\
  \   {ul\n\
  \         {-  Always-On and On-Demand fleet types\n\
  \             \n\
  \              You can update the [DisplayName], [ComputeCapacity], [ImageARN], [ImageName], \
   [IdleDisconnectTimeoutInSeconds], and [DisconnectTimeoutInSeconds] attributes.\n\
  \              \n\
  \               }\n\
  \         {-  Elastic fleet type\n\
  \             \n\
  \              You can update the [DisplayName], [IdleDisconnectTimeoutInSeconds], \
   [DisconnectTimeoutInSeconds], [MaxConcurrentSessions], [SessionScriptS3Location] and \
   [UsbDeviceFilterStrings] attributes.\n\
  \              \n\
  \               }\n\
  \         }\n\
  \   If the fleet is in the [STARTING] or [STOPPED] state, you can't update it.\n\
  \   "]

module UpdateImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_image_permissions_request ->
    ( update_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_image_permissions_request ->
    ( update_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates permissions for the specified private image. \n"]

module UpdateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stack_request ->
    ( update_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stack_request ->
    ( update_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified fields for the specified stack.\n"]

module UpdateThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_theme_for_stack_request ->
    ( update_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_theme_for_stack_request ->
    ( update_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates custom branding that customizes the appearance of the streaming application catalog page.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of all tags for the specified WorkSpaces Applications resource. You can tag \
   WorkSpaces Applications image builders, images, fleets, and stacks.\n\n\
  \ For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \ "]

module ListExportImageTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_export_image_tasks_request ->
    ( list_export_image_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_export_image_tasks_request ->
    ( list_export_image_tasks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists export image tasks, with optional filtering and pagination. Use this operation to monitor \
   the status of multiple export operations.\n"]

module ListEntitledApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entitled_applications_request ->
    ( list_entitled_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entitled_applications_request ->
    ( list_entitled_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of entitled applications.\n"]

module ListAssociatedStacks : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associated_stacks_request ->
    (list_associated_stacks_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associated_stacks_request ->
    ( list_associated_stacks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the name of the stack with which the specified fleet is associated.\n"]

module ListAssociatedFleets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associated_fleets_request ->
    (list_associated_fleets_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associated_fleets_request ->
    ( list_associated_fleets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the name of the fleet that is associated with the specified stack.\n"]

module GetExportImageTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_export_image_task_request ->
    ( get_export_image_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_export_image_task_request ->
    ( get_export_image_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about an export image task, including its current state, progress, and \
   any error details.\n"]

module ExpireSession : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    expire_session_request ->
    (expire_session_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    expire_session_request ->
    ( expire_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Immediately stops the specified streaming session.\n"]

module EnableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_user_request ->
    ( enable_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_user_request ->
    ( enable_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables a user in the user pool. After being enabled, users can sign in to WorkSpaces \
   Applications and open applications from the stacks to which they are assigned.\n"]

module DrainSessionInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    drain_session_instance_request ->
    ( drain_session_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    drain_session_instance_request ->
    ( drain_session_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Drains the instance hosting the specified streaming session. The instance stops accepting new \
   sessions while existing sessions continue uninterrupted. Once all sessions end, the instance is \
   reclaimed and replaced. This only applies to multi-session fleets.\n"]

module DisassociateSoftwareFromImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_software_from_image_builder_request ->
    ( disassociate_software_from_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_software_from_image_builder_request ->
    ( disassociate_software_from_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes license included application(s) association(s) from an image builder instance.\n"]

module DisassociateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fleet_request ->
    ( disassociate_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fleet_request ->
    ( disassociate_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified fleet from the specified stack.\n"]

module DisassociateApplicationFromEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_from_entitlement_request ->
    ( disassociate_application_from_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_from_entitlement_request ->
    ( disassociate_application_from_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified application from the specified entitlement.\n"]

module DisassociateApplicationFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_fleet_request ->
    ( disassociate_application_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_fleet_request ->
    ( disassociate_application_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified application from the fleet.\n"]

module DisassociateAppBlockBuilderAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_app_block_builder_app_block_request ->
    ( disassociate_app_block_builder_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_app_block_builder_app_block_request ->
    ( disassociate_app_block_builder_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates a specified app block builder from a specified app block.\n"]

module DisableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_user_request ->
    ( disable_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_user_request ->
    ( disable_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the specified user in the user pool. Users can't sign in to WorkSpaces Applications \
   until they are re-enabled. This action does not delete the user. \n"]

module DescribeUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more specified users in the user pool.\n"]

module DescribeUserStackAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_stack_associations_request ->
    ( describe_user_stack_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_stack_associations_request ->
    ( describe_user_stack_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the UserStackAssociation objects. You must specify either or \
   both of the following:\n\n\
  \ {ul\n\
  \       {-  The stack name\n\
  \           \n\
  \            }\n\
  \       {-  The user name (email address of the user associated with the stack) and the \
   authentication type for the user\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeUsageReportSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_report_subscriptions_request ->
    ( describe_usage_report_subscriptions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_report_subscriptions_request ->
    ( describe_usage_report_subscriptions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more usage report subscriptions.\n"]

module DescribeThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_theme_for_stack_request ->
    ( describe_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_theme_for_stack_request ->
    ( describe_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the theme for a specified stack. A theme is custom branding \
   that customizes the appearance of the streaming application catalog page.\n"]

module DescribeStacks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_request ->
    ( describe_stacks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_request ->
    ( describe_stacks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified stacks, if the stack names are provided. \
   Otherwise, all stacks in the account are described.\n"]

module DescribeSoftwareAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_software_associations_request ->
    ( describe_software_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_software_associations_request ->
    ( describe_software_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves license included application associations for a specified resource.\n"]

module DescribeSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the streaming sessions for a specified stack and fleet. If a \
   UserId is provided for the stack and fleet, only streaming sessions for that user are \
   described. If an authentication type is not provided, the default is to authenticate users \
   using a streaming URL.\n"]

module DescribeImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified images, if the image names or image ARNs \
   are provided. Otherwise, all images in the account are described.\n"]

module DescribeImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_permissions_request ->
    ( describe_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_permissions_request ->
    ( describe_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the permissions for shared AWS account IDs on a private image \
   that you own. \n"]

module DescribeImageBuilders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_builders_request ->
    ( describe_image_builders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_builders_request ->
    ( describe_image_builders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified image builders, if the image builder \
   names are provided. Otherwise, all image builders in the account are described.\n"]

module DescribeFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleets_request ->
    ( describe_fleets_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleets_request ->
    ( describe_fleets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified fleets, if the fleet names are provided. \
   Otherwise, all fleets in the account are described.\n"]

module DescribeEntitlements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entitlements_request ->
    ( describe_entitlements_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entitlements_request ->
    ( describe_entitlements_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one of more entitlements.\n"]

module DescribeDirectoryConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_configs_request ->
    ( describe_directory_configs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_configs_request ->
    ( describe_directory_configs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified Directory Config objects for WorkSpaces \
   Applications, if the names for these objects are provided. Otherwise, all Directory Config \
   objects in the account are described. These objects include the configuration information \
   required to join fleets and image builders to Microsoft Active Directory domains. \n\n\
  \ Although the response syntax in this topic includes the account password, this password is not \
   returned in the actual response.\n\
  \ "]

module DescribeApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more applications.\n"]

module DescribeApplicationFleetAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_fleet_associations_request ->
    ( describe_application_fleet_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_fleet_associations_request ->
    ( describe_application_fleet_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more application fleet associations. Either \
   ApplicationArn or FleetName must be specified.\n"]

module DescribeAppLicenseUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_license_usage_request ->
    ( describe_app_license_usage_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_license_usage_request ->
    ( describe_app_license_usage_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves license included application usage information.\n"]

module DescribeAppBlocks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_blocks_request ->
    ( describe_app_blocks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_blocks_request ->
    ( describe_app_blocks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app blocks.\n"]

module DescribeAppBlockBuilders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builders_request ->
    ( describe_app_block_builders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builders_request ->
    ( describe_app_block_builders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app block builders.\n"]

module DescribeAppBlockBuilderAppBlockAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builder_app_block_associations_request ->
    ( describe_app_block_builder_app_block_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builder_app_block_associations_request ->
    ( describe_app_block_builder_app_block_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app block builder associations.\n"]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a user from the user pool.\n"]

module DeleteUsageReportSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_report_subscription_request ->
    ( delete_usage_report_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_report_subscription_request ->
    ( delete_usage_report_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables usage report generation.\n"]

module DeleteThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_theme_for_stack_request ->
    ( delete_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_theme_for_stack_request ->
    ( delete_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes custom branding that customizes the appearance of the streaming application catalog page.\n"]

module DeleteStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_request ->
    ( delete_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_request ->
    ( delete_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified stack. After the stack is deleted, the application streaming environment \
   provided by the stack is no longer available to users. Also, any reservations made for \
   application streaming sessions for the stack are released.\n"]

module DeleteImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_permissions_request ->
    ( delete_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_permissions_request ->
    ( delete_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes permissions for the specified private image. After you delete permissions for an image, \
   AWS accounts to which you previously granted these permissions can no longer use the image.\n"]

module DeleteImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_builder_request ->
    ( delete_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_builder_request ->
    ( delete_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified image builder and releases the capacity.\n"]

module DeleteImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified image. You cannot delete an image when it is in use. After you delete an \
   image, you cannot provision new capacity using the image.\n"]

module DeleteFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_request ->
    ( delete_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_request ->
    ( delete_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified fleet.\n"]

module DeleteEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified entitlement.\n"]

module DeleteDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_config_request ->
    ( delete_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_config_request ->
    ( delete_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Directory Config object from WorkSpaces Applications. This object \
   includes the information required to join streaming instances to an Active Directory domain.\n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an application.\n"]

module DeleteAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_builder_request ->
    ( delete_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_builder_request ->
    ( delete_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an app block builder.\n\n\
  \ An app block builder can only be deleted when it has no association with an app block.\n\
  \ "]

module DeleteAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_request ->
    ( delete_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_request ->
    ( delete_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an app block.\n"]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new user in the user pool.\n"]

module CreateUsageReportSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_report_subscription_request ->
    ( create_usage_report_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_report_subscription_request ->
    ( create_usage_report_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a usage report subscription. Usage reports are generated daily.\n"]

module CreateUpdatedImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_updated_image_request ->
    ( create_updated_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_updated_image_request ->
    ( create_updated_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new image with the latest Windows operating system updates, driver updates, and \
   WorkSpaces Applications agent software.\n\n\
  \ For more information, see the \"Update an Image by Using Managed WorkSpaces Applications Image \
   Updates\" section in \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/administer-images.html}Administer \
   Your WorkSpaces Applications Images}, in the {i Amazon WorkSpaces Applications Administration \
   Guide}.\n\
  \ "]

module CreateThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_theme_for_stack_request ->
    ( create_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_theme_for_stack_request ->
    ( create_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates custom branding that customizes the appearance of the streaming application catalog page.\n"]

module CreateStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_streaming_url_request ->
    ( create_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_streaming_url_request ->
    ( create_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a temporary URL to start an WorkSpaces Applications streaming session for the specified \
   user. A streaming URL enables application streaming to be tested without user setup. \n"]

module CreateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_request ->
    ( create_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_request ->
    ( create_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a stack to start streaming applications to users. A stack consists of an associated \
   fleet, user access policies, and storage configurations. \n"]

module CreateImportedImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DryRunOperationException of dry_run_operation_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_imported_image_request ->
    ( create_imported_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DryRunOperationException of dry_run_operation_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_imported_image_request ->
    ( create_imported_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DryRunOperationException of dry_run_operation_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a custom WorkSpaces Applications image by importing an EC2 AMI. This allows you to use \
   your own customized AMI to create WorkSpaces Applications images that support additional \
   instance types beyond the standard stream.* instances.\n"]

module CreateImageBuilderStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_streaming_url_request ->
    ( create_image_builder_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_streaming_url_request ->
    ( create_image_builder_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a URL to start an image builder streaming session.\n"]

module CreateImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_request ->
    ( create_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_request ->
    ( create_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an image builder. An image builder is a virtual machine that is used to create an \
   image.\n\n\
  \ The initial state of the builder is [PENDING]. When it is ready, the state is [RUNNING].\n\
  \ "]

module CreateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_request ->
    ( create_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_request ->
    ( create_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a fleet. A fleet consists of streaming instances that your users access for their \
   applications and desktops.\n"]

module CreateExportImageTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_export_image_task_request ->
    ( create_export_image_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_export_image_task_request ->
    ( create_export_image_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a task to export a WorkSpaces Applications image to an EC2 AMI. This allows you to use \
   your customized WorkSpaces Applications images with other AWS services or for backup purposes.\n"]

module CreateEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new entitlement. Entitlements control access to specific applications within a stack, \
   based on user attributes. Entitlements apply to SAML 2.0 federated user identities. WorkSpaces \
   Applications user pool and streaming URL users are entitled to all applications in a stack. \
   Entitlements don't apply to the desktop stream view application, or to applications managed by \
   a dynamic app provider using the Dynamic Application Framework.\n"]

module CreateDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_directory_config_request ->
    ( create_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_directory_config_request ->
    ( create_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Directory Config object in WorkSpaces Applications. This object includes the \
   configuration information required to join fleets and image builders to Microsoft Active \
   Directory domains.\n"]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an application.\n\n\
  \ Applications are a WorkSpaces Applications resource that stores the details about how to \
   launch applications on Elastic fleet streaming instances. An application consists of the launch \
   details, icon, and display name. Applications are associated with an app block that contains \
   the application binaries and other files. The applications assigned to an Elastic fleet are the \
   applications users can launch. \n\
  \ \n\
  \  This is only supported for Elastic fleets.\n\
  \  "]

module CreateAppBlockBuilderStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_streaming_url_request ->
    ( create_app_block_builder_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_streaming_url_request ->
    ( create_app_block_builder_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a URL to start a create app block builder streaming session.\n"]

module CreateAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_request ->
    ( create_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_request ->
    ( create_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an app block builder.\n"]

module CreateAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_request ->
    ( create_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_request ->
    ( create_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an app block.\n\n\
  \ App blocks are a WorkSpaces Applications resource that stores the details about the virtual \
   hard disk in an S3 bucket. It also stores the setup script with details about how to mount the \
   virtual hard disk. The virtual hard disk includes the application binaries and other files \
   necessary to launch your applications. Multiple applications can be assigned to a single app \
   block.\n\
  \ \n\
  \  This is only supported for Elastic fleets.\n\
  \  "]

module CopyImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_image_request ->
    ( copy_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_image_request ->
    ( copy_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the image within the same region or to a new region within the same AWS account. Note \
   that any tags you added to the image will not be copied.\n"]

module BatchDisassociateUserStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_user_stack_request ->
    ( batch_disassociate_user_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_user_stack_request ->
    ( batch_disassociate_user_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified users from the specified stacks.\n"]

module BatchAssociateUserStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_user_stack_request ->
    ( batch_associate_user_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_user_stack_request ->
    ( batch_associate_user_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified users with the specified stacks. Users in a user pool cannot be \
   assigned to stacks with fleets that are joined to an Active Directory domain.\n"]

module AssociateSoftwareToImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_software_to_image_builder_request ->
    ( associate_software_to_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_software_to_image_builder_request ->
    ( associate_software_to_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates license included application(s) with an existing image builder instance.\n"]

module AssociateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_fleet_request ->
    ( associate_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_fleet_request ->
    ( associate_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified fleet with the specified stack.\n"]

module AssociateApplicationToEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_application_to_entitlement_request ->
    ( associate_application_to_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_application_to_entitlement_request ->
    ( associate_application_to_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates an application to entitle.\n"]

module AssociateApplicationFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_application_fleet_request ->
    ( associate_application_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_application_fleet_request ->
    ( associate_application_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified application with the specified fleet. This is only supported for \
   Elastic fleets.\n"]

(** {1:Serialization and Deserialization} *)
module AssociateAppBlockBuilderAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_app_block_builder_app_block_request ->
    ( associate_app_block_builder_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_app_block_builder_app_block_request ->
    ( associate_app_block_builder_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified app block builder with the specified app block.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
