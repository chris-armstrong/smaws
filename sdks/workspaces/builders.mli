open Types

val make_capacity_status :
  active_user_sessions:active_user_sessions ->
  actual_user_sessions:actual_user_sessions ->
  desired_user_sessions:desired_user_sessions ->
  available_user_sessions:available_user_sessions ->
  unit ->
  capacity_status

val make_workspaces_pool_error :
  ?error_message:error_message ->
  ?error_code:workspaces_pool_error_code ->
  unit ->
  workspaces_pool_error

val make_application_settings_response :
  ?s3_bucket_name:s3_bucket_name ->
  ?settings_group:settings_group ->
  status:application_settings_status_enum ->
  unit ->
  application_settings_response

val make_timeout_settings :
  ?max_user_duration_in_seconds:max_user_duration_in_seconds ->
  ?idle_disconnect_timeout_in_seconds:idle_disconnect_timeout_in_seconds ->
  ?disconnect_timeout_in_seconds:disconnect_timeout_in_seconds ->
  unit ->
  timeout_settings

val make_workspaces_pool :
  ?timeout_settings:timeout_settings ->
  ?application_settings:application_settings_response ->
  ?errors:workspaces_pool_errors ->
  ?description:update_description ->
  running_mode:pools_running_mode ->
  directory_id:directory_id ->
  bundle_id:bundle_id ->
  created_at:timestamp ->
  state:workspaces_pool_state ->
  pool_name:workspaces_pool_name ->
  capacity_status:capacity_status ->
  pool_arn:ar_n ->
  pool_id:workspaces_pool_id ->
  unit ->
  workspaces_pool

val make_capacity : desired_user_sessions:desired_user_sessions -> unit -> capacity

val make_application_settings_request :
  ?settings_group:settings_group ->
  status:application_settings_status_enum ->
  unit ->
  application_settings_request

val make_update_workspaces_pool_request :
  ?running_mode:pools_running_mode ->
  ?timeout_settings:timeout_settings ->
  ?application_settings:application_settings_request ->
  ?capacity:capacity ->
  ?directory_id:directory_id ->
  ?bundle_id:bundle_id ->
  ?description:update_description ->
  pool_id:workspaces_pool_id ->
  unit ->
  update_workspaces_pool_request

val make_update_workspace_image_permission_request :
  shared_account_id:aws_account ->
  allow_copy_image:boolean_object ->
  image_id:workspace_image_id ->
  unit ->
  update_workspace_image_permission_request

val make_update_workspace_bundle_request :
  ?image_id:workspace_image_id -> ?bundle_id:bundle_id -> unit -> update_workspace_bundle_request

val make_ip_rule_item : ?rule_desc:ip_rule_desc -> ?ip_rule:ip_rule -> unit -> ip_rule_item

val make_update_rules_of_ip_group_request :
  user_rules:ip_rule_list -> group_id:ip_group_id -> unit -> update_rules_of_ip_group_request

val make_connection_alias_permission :
  allow_association:boolean_object ->
  shared_account_id:aws_account ->
  unit ->
  connection_alias_permission

val make_update_connection_alias_permission_request :
  connection_alias_permission:connection_alias_permission ->
  alias_id:connection_alias_id ->
  unit ->
  update_connection_alias_permission_request

val make_update_connect_client_add_in_request :
  ?ur_l:add_in_url ->
  ?name:add_in_name ->
  resource_id:directory_id ->
  add_in_id:amazon_uuid ->
  unit ->
  update_connect_client_add_in_request

val make_terminate_workspaces_pool_session_request :
  session_id:amazon_uuid -> unit -> terminate_workspaces_pool_session_request

val make_terminate_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> terminate_workspaces_pool_request

val make_failed_workspace_change_request :
  ?error_message:description ->
  ?error_code:error_type ->
  ?workspace_id:workspace_id ->
  unit ->
  failed_workspace_change_request

val make_terminate_request : workspace_id:workspace_id -> unit -> terminate_request

val make_terminate_workspaces_request :
  terminate_workspace_requests:terminate_workspace_requests -> unit -> terminate_workspaces_request

val make_stop_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> stop_workspaces_pool_request

val make_stop_request : ?workspace_id:workspace_id -> unit -> stop_request

val make_stop_workspaces_request :
  stop_workspace_requests:stop_workspace_requests -> unit -> stop_workspaces_request

val make_start_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> start_workspaces_pool_request

val make_start_request : ?workspace_id:workspace_id -> unit -> start_request

val make_start_workspaces_request :
  start_workspace_requests:start_workspace_requests -> unit -> start_workspaces_request

val make_revoke_ip_rules_request :
  user_rules:ip_revoked_rule_list -> group_id:ip_group_id -> unit -> revoke_ip_rules_request

val make_restore_workspace_request : workspace_id:workspace_id -> unit -> restore_workspace_request

val make_account_link :
  ?target_account_id:aws_account ->
  ?source_account_id:aws_account ->
  ?account_link_status:account_link_status_enum ->
  ?account_link_id:link_id ->
  unit ->
  account_link

val make_reject_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> reject_account_link_invitation_request

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_microsoft_entra_config :
  ?application_config_secret_arn:secrets_manager_arn ->
  ?tenant_id:microsoft_entra_config_tenant_id ->
  unit ->
  microsoft_entra_config

val make_active_directory_config :
  service_account_secret_arn:secrets_manager_arn ->
  domain_name:domain_name ->
  unit ->
  active_directory_config

val make_register_workspace_directory_request :
  ?active_directory_config:active_directory_config ->
  ?workspace_type:workspace_type ->
  ?microsoft_entra_config:microsoft_entra_config ->
  ?idc_instance_arn:ar_n ->
  ?user_identity_type:user_identity_type ->
  ?workspace_directory_description:workspace_directory_description ->
  ?workspace_directory_name:workspace_directory_name ->
  ?tags:tag_list ->
  ?tenancy:tenancy ->
  ?enable_self_service:boolean_object ->
  ?subnet_ids:subnet_ids ->
  ?directory_id:directory_id ->
  unit ->
  register_workspace_directory_request

val make_rebuild_request : workspace_id:workspace_id -> unit -> rebuild_request

val make_rebuild_workspaces_request :
  rebuild_workspace_requests:rebuild_workspace_requests -> unit -> rebuild_workspaces_request

val make_reboot_request : workspace_id:workspace_id -> unit -> reboot_request

val make_reboot_workspaces_request :
  reboot_workspace_requests:reboot_workspace_requests -> unit -> reboot_workspaces_request

val make_modify_workspace_state_request :
  workspace_state:target_workspace_state ->
  workspace_id:workspace_id ->
  unit ->
  modify_workspace_state_request

val make_global_accelerator_for_work_space :
  ?preferred_protocol:aga_preferred_protocol_for_work_space ->
  mode:aga_mode_for_work_space_enum ->
  unit ->
  global_accelerator_for_work_space

val make_workspace_properties :
  ?global_accelerator:global_accelerator_for_work_space ->
  ?operating_system_name:operating_system_name ->
  ?protocols:protocol_list ->
  ?compute_type_name:compute ->
  ?user_volume_size_gib:user_volume_size_gib ->
  ?root_volume_size_gib:root_volume_size_gib ->
  ?running_mode_auto_stop_timeout_in_minutes:running_mode_auto_stop_timeout_in_minutes ->
  ?running_mode:running_mode ->
  unit ->
  workspace_properties

val make_modify_workspace_properties_request :
  ?data_replication:data_replication ->
  ?workspace_properties:workspace_properties ->
  workspace_id:workspace_id ->
  unit ->
  modify_workspace_properties_request

val make_workspace_creation_properties :
  ?instance_iam_role_arn:ar_n ->
  ?enable_maintenance_mode:boolean_object ->
  ?user_enabled_as_local_administrator:boolean_object ->
  ?custom_security_group_id:security_group_id ->
  ?default_ou:default_ou ->
  ?enable_internet_access:boolean_object ->
  unit ->
  workspace_creation_properties

val make_modify_workspace_creation_properties_request :
  workspace_creation_properties:workspace_creation_properties ->
  resource_id:directory_id ->
  unit ->
  modify_workspace_creation_properties_request

val make_access_endpoint :
  ?vpc_endpoint_id:alphanumeric_dash_underscore_non_empty_string ->
  ?access_endpoint_type:access_endpoint_type ->
  unit ->
  access_endpoint

val make_access_endpoint_config :
  ?internet_fallback_protocols:internet_fallback_protocol_list ->
  access_endpoints:access_endpoint_list ->
  unit ->
  access_endpoint_config

val make_workspace_access_properties :
  ?access_endpoint_config:access_endpoint_config ->
  ?device_type_work_spaces_thin_client:access_property_value ->
  ?device_type_linux:access_property_value ->
  ?device_type_zero_client:access_property_value ->
  ?device_type_chrome_os:access_property_value ->
  ?device_type_android:access_property_value ->
  ?device_type_ios:access_property_value ->
  ?device_type_web:access_property_value ->
  ?device_type_osx:access_property_value ->
  ?device_type_windows:access_property_value ->
  unit ->
  workspace_access_properties

val make_modify_workspace_access_properties_request :
  workspace_access_properties:workspace_access_properties ->
  resource_id:directory_id ->
  unit ->
  modify_workspace_access_properties_request

val make_user_setting :
  ?maximum_length:maximum_length ->
  permission:user_setting_permission_enum ->
  action:user_setting_action_enum ->
  unit ->
  user_setting

val make_storage_connector :
  status:storage_connector_status_enum ->
  connector_type:storage_connector_type_enum ->
  unit ->
  storage_connector

val make_global_accelerator_for_directory :
  ?preferred_protocol:aga_preferred_protocol_for_directory ->
  mode:aga_mode_for_directory_enum ->
  unit ->
  global_accelerator_for_directory

val make_streaming_properties :
  ?global_accelerator:global_accelerator_for_directory ->
  ?storage_connectors:storage_connectors ->
  ?user_settings:user_settings ->
  ?streaming_experience_preferred_protocol:streaming_experience_preferred_protocol_enum ->
  unit ->
  streaming_properties

val make_modify_streaming_properties_request :
  ?streaming_properties:streaming_properties ->
  resource_id:directory_id ->
  unit ->
  modify_streaming_properties_request

val make_selfservice_permissions :
  ?rebuild_workspace:reconnect_enum ->
  ?switch_running_mode:reconnect_enum ->
  ?change_compute_type:reconnect_enum ->
  ?increase_volume_size:reconnect_enum ->
  ?restart_workspace:reconnect_enum ->
  unit ->
  selfservice_permissions

val make_modify_selfservice_permissions_request :
  selfservice_permissions:selfservice_permissions ->
  resource_id:directory_id ->
  unit ->
  modify_selfservice_permissions_request

val make_saml_properties :
  ?relay_state_parameter_name:non_empty_string ->
  ?user_access_url:saml_user_access_url ->
  ?status:saml_status_enum ->
  unit ->
  saml_properties

val make_modify_saml_properties_request :
  ?properties_to_delete:deletable_saml_properties_list ->
  ?saml_properties:saml_properties ->
  resource_id:directory_id ->
  unit ->
  modify_saml_properties_request

val make_modify_endpoint_encryption_mode_response : unit -> unit

val make_modify_endpoint_encryption_mode_request :
  endpoint_encryption_mode:endpoint_encryption_mode ->
  directory_id:directory_id ->
  unit ->
  modify_endpoint_encryption_mode_request

val make_client_properties :
  ?log_upload_enabled:log_upload_enum ->
  ?reconnect_enabled:reconnect_enum ->
  unit ->
  client_properties

val make_modify_client_properties_request :
  client_properties:client_properties ->
  resource_id:non_empty_string ->
  unit ->
  modify_client_properties_request

val make_certificate_based_auth_properties :
  ?certificate_authority_arn:certificate_authority_arn ->
  ?status:certificate_based_auth_status_enum ->
  unit ->
  certificate_based_auth_properties

val make_modify_certificate_based_auth_properties_request :
  ?properties_to_delete:deletable_certificate_based_auth_properties_list ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  resource_id:directory_id ->
  unit ->
  modify_certificate_based_auth_properties_request

val make_modify_account_request :
  ?dedicated_tenancy_management_cidr_range:dedicated_tenancy_management_cidr_range ->
  ?dedicated_tenancy_support:dedicated_tenancy_support_enum ->
  unit ->
  modify_account_request

val make_migrate_workspace_request :
  bundle_id:bundle_id -> source_workspace_id:workspace_id -> unit -> migrate_workspace_request

val make_list_available_management_cidr_ranges_request :
  ?next_token:pagination_token ->
  ?max_results:management_cidr_range_max_results ->
  management_cidr_range_constraint:management_cidr_range_constraint ->
  unit ->
  list_available_management_cidr_ranges_request

val make_list_account_links_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  ?link_status_filter:link_status_filter_list ->
  unit ->
  list_account_links_request

val make_import_workspace_image_request :
  ?applications:application_list ->
  ?tags:tag_list ->
  image_description:workspace_image_description ->
  image_name:workspace_image_name ->
  ingestion_process:workspace_image_ingestion_process ->
  ec2_image_id:ec2_image_id ->
  unit ->
  import_workspace_image_request

val make_import_custom_workspace_image_request :
  ?tags:tag_list ->
  os_version:os_version ->
  platform:platform ->
  infrastructure_configuration_arn:infrastructure_configuration_arn ->
  image_source:image_source_identifier ->
  protocol:custom_image_protocol ->
  compute_type:image_compute_type ->
  image_description:workspace_image_description ->
  image_name:workspace_image_name ->
  unit ->
  import_custom_workspace_image_request

val make_default_client_branding_attributes :
  ?login_message:login_message ->
  ?forgot_password_link:client_url ->
  ?support_link:client_url ->
  ?support_email:client_email ->
  ?logo_url:client_url ->
  unit ->
  default_client_branding_attributes

val make_ios_client_branding_attributes :
  ?login_message:login_message ->
  ?forgot_password_link:client_url ->
  ?support_link:client_url ->
  ?support_email:client_email ->
  ?logo3x_url:client_url ->
  ?logo2x_url:client_url ->
  ?logo_url:client_url ->
  unit ->
  ios_client_branding_attributes

val make_default_import_client_branding_attributes :
  ?login_message:login_message ->
  ?forgot_password_link:client_url ->
  ?support_link:client_url ->
  ?support_email:client_email ->
  ?logo:default_logo ->
  unit ->
  default_import_client_branding_attributes

val make_ios_import_client_branding_attributes :
  ?login_message:login_message ->
  ?forgot_password_link:client_url ->
  ?support_link:client_url ->
  ?support_email:client_email ->
  ?logo3x:ios3_x_logo ->
  ?logo2x:ios2_x_logo ->
  ?logo:ios_logo ->
  unit ->
  ios_import_client_branding_attributes

val make_import_client_branding_request :
  ?device_type_web:default_import_client_branding_attributes ->
  ?device_type_linux:default_import_client_branding_attributes ->
  ?device_type_ios:ios_import_client_branding_attributes ->
  ?device_type_android:default_import_client_branding_attributes ->
  ?device_type_osx:default_import_client_branding_attributes ->
  ?device_type_windows:default_import_client_branding_attributes ->
  resource_id:directory_id ->
  unit ->
  import_client_branding_request

val make_get_account_link_request :
  ?linked_account_id:aws_account -> ?link_id:link_id -> unit -> get_account_link_request

val make_association_state_reason :
  ?error_message:string2048 ->
  ?error_code:association_error_code ->
  unit ->
  association_state_reason

val make_workspace_resource_association :
  ?workspace_id:workspace_id ->
  ?state_reason:association_state_reason ->
  ?state:association_state ->
  ?last_updated_time:timestamp ->
  ?created:timestamp ->
  ?associated_resource_type:work_space_associated_resource_type ->
  ?associated_resource_id:non_empty_string ->
  unit ->
  workspace_resource_association

val make_disassociate_workspace_application_request :
  application_id:work_space_application_id ->
  workspace_id:workspace_id ->
  unit ->
  disassociate_workspace_application_request

val make_disassociate_ip_groups_request :
  group_ids:ip_group_id_list -> directory_id:directory_id -> unit -> disassociate_ip_groups_request

val make_disassociate_connection_alias_request :
  alias_id:connection_alias_id -> unit -> disassociate_connection_alias_request

val make_network_access_configuration :
  ?eni_id:non_empty_string ->
  ?eni_private_ip_address:non_empty_string ->
  unit ->
  network_access_configuration

val make_workspaces_pool_session :
  ?start_time:timestamp ->
  ?network_access_configuration:network_access_configuration ->
  ?expiration_time:timestamp ->
  ?instance_id:session_instance_id ->
  ?connection_state:session_connection_state ->
  ?authentication_type:authentication_type ->
  user_id:workspaces_pool_user_id ->
  pool_id:workspaces_pool_id ->
  session_id:amazon_uuid ->
  unit ->
  workspaces_pool_session

val make_describe_workspaces_pool_sessions_request :
  ?next_token:pagination_token ->
  ?limit:limit50 ->
  ?user_id:workspaces_pool_user_id ->
  pool_id:workspaces_pool_id ->
  unit ->
  describe_workspaces_pool_sessions_request

val make_describe_workspaces_pools_filter :
  operator:describe_workspaces_pools_filter_operator ->
  values:describe_workspaces_pools_filter_values ->
  name:describe_workspaces_pools_filter_name ->
  unit ->
  describe_workspaces_pools_filter

val make_describe_workspaces_pools_request :
  ?next_token:pagination_token ->
  ?limit:limit ->
  ?filters:describe_workspaces_pools_filters ->
  ?pool_ids:workspaces_pool_ids ->
  unit ->
  describe_workspaces_pools_request

val make_snapshot : ?snapshot_time:timestamp -> unit -> snapshot

val make_describe_workspace_snapshots_request :
  workspace_id:workspace_id -> unit -> describe_workspace_snapshots_request

val make_workspace_connection_status :
  ?last_known_user_connection_timestamp:timestamp ->
  ?connection_state_check_timestamp:timestamp ->
  ?connection_state:connection_state ->
  ?workspace_id:workspace_id ->
  unit ->
  workspace_connection_status

val make_describe_workspaces_connection_status_request :
  ?next_token:pagination_token ->
  ?workspace_ids:workspace_id_list ->
  unit ->
  describe_workspaces_connection_status_request

val make_modification_state :
  ?state:modification_state_enum ->
  ?resource:modification_resource_enum ->
  unit ->
  modification_state

val make_related_workspace_properties :
  ?type_:standby_workspace_relationship_type ->
  ?state:workspace_state ->
  ?region:region ->
  ?workspace_id:workspace_id ->
  unit ->
  related_workspace_properties

val make_data_replication_settings :
  ?recovery_snapshot_time:timestamp ->
  ?data_replication:data_replication ->
  unit ->
  data_replication_settings

val make_standby_workspaces_properties :
  ?recovery_snapshot_time:timestamp ->
  ?data_replication:data_replication ->
  ?standby_workspace_id:workspace_id ->
  unit ->
  standby_workspaces_properties

val make_workspace :
  ?standby_workspaces_properties:standby_workspaces_properties_list ->
  ?data_replication_settings:data_replication_settings ->
  ?related_workspaces:related_workspaces ->
  ?modification_states:modification_state_list ->
  ?workspace_properties:workspace_properties ->
  ?workspace_name:workspace_name ->
  ?root_volume_encryption_enabled:boolean_object ->
  ?user_volume_encryption_enabled:boolean_object ->
  ?volume_encryption_key:volume_encryption_key ->
  ?computer_name:computer_name ->
  ?error_code:workspace_error_code ->
  ?error_message:description ->
  ?subnet_id:subnet_id ->
  ?bundle_id:bundle_id ->
  ?state:workspace_state ->
  ?ipv6_address:ipv6_address ->
  ?ip_address:ip_address ->
  ?user_name:user_name ->
  ?directory_id:directory_id ->
  ?workspace_id:workspace_id ->
  unit ->
  workspace

val make_describe_workspaces_request :
  ?workspace_name:workspace_name ->
  ?next_token:pagination_token ->
  ?limit:limit ->
  ?bundle_id:bundle_id ->
  ?user_name:user_name ->
  ?directory_id:directory_id ->
  ?workspace_ids:workspace_id_list ->
  unit ->
  describe_workspaces_request

val make_operating_system : ?type_:operating_system_type -> unit -> operating_system

val make_error_details :
  ?error_message:description ->
  ?error_code:workspace_image_error_detail_code ->
  unit ->
  error_details

val make_workspace_image :
  ?error_details:error_details_list ->
  ?updates:update_result ->
  ?owner_account_id:aws_account ->
  ?created:timestamp ->
  ?error_message:description ->
  ?error_code:workspace_image_error_code ->
  ?required_tenancy:workspace_image_required_tenancy ->
  ?state:workspace_image_state ->
  ?operating_system:operating_system ->
  ?description:workspace_image_description ->
  ?name:workspace_image_name ->
  ?image_id:workspace_image_id ->
  unit ->
  workspace_image

val make_describe_workspace_images_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  ?image_type:image_type ->
  ?image_ids:workspace_image_id_list ->
  unit ->
  describe_workspace_images_request

val make_image_permission : ?shared_account_id:aws_account -> unit -> image_permission

val make_describe_workspace_image_permissions_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  image_id:workspace_image_id ->
  unit ->
  describe_workspace_image_permissions_request

val make_default_workspace_creation_properties :
  ?instance_iam_role_arn:ar_n ->
  ?enable_maintenance_mode:boolean_object ->
  ?user_enabled_as_local_administrator:boolean_object ->
  ?custom_security_group_id:security_group_id ->
  ?default_ou:default_ou ->
  ?enable_internet_access:boolean_object ->
  unit ->
  default_workspace_creation_properties

val make_idc_config : ?application_arn:ar_n -> ?instance_arn:ar_n -> unit -> idc_config

val make_workspace_directory :
  ?error_message:description ->
  ?streaming_properties:streaming_properties ->
  ?active_directory_config:active_directory_config ->
  ?idc_config:idc_config ->
  ?workspace_type:workspace_type ->
  ?user_identity_type:user_identity_type ->
  ?workspace_directory_description:workspace_directory_description ->
  ?workspace_directory_name:workspace_directory_name ->
  ?microsoft_entra_config:microsoft_entra_config ->
  ?endpoint_encryption_mode:endpoint_encryption_mode ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?saml_properties:saml_properties ->
  ?selfservice_permissions:selfservice_permissions ->
  ?tenancy:tenancy ->
  ?workspace_access_properties:workspace_access_properties ->
  ?ip_group_ids:ip_group_id_list ->
  ?workspace_creation_properties:default_workspace_creation_properties ->
  ?state:workspace_directory_state ->
  ?workspace_security_group_id:security_group_id ->
  ?directory_type:workspace_directory_type ->
  ?iam_role_id:ar_n ->
  ?customer_user_name:user_name ->
  ?dns_ipv6_addresses:dns_ipv6_addresses ->
  ?dns_ip_addresses:dns_ip_addresses ->
  ?subnet_ids:subnet_ids ->
  ?registration_code:registration_code ->
  ?directory_name:directory_name ->
  ?alias:alias ->
  ?directory_id:directory_id ->
  unit ->
  workspace_directory

val make_describe_workspace_directories_filter :
  values:describe_workspace_directories_filter_values ->
  name:describe_workspace_directories_filter_name ->
  unit ->
  describe_workspace_directories_filter

val make_describe_workspace_directories_request :
  ?filters:describe_workspace_directories_filter_list ->
  ?next_token:pagination_token ->
  ?limit:limit ->
  ?workspace_directory_names:workspace_directory_name_list ->
  ?directory_ids:directory_id_list ->
  unit ->
  describe_workspace_directories_request

val make_root_storage : capacity:non_empty_string -> unit -> root_storage
val make_user_storage : capacity:non_empty_string -> unit -> user_storage
val make_compute_type : ?name:compute -> unit -> compute_type

val make_workspace_bundle :
  ?bundle_type:bundle_type ->
  ?state:workspace_bundle_state ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  ?compute_type:compute_type ->
  ?user_storage:user_storage ->
  ?root_storage:root_storage ->
  ?image_id:workspace_image_id ->
  ?description:description ->
  ?owner:bundle_owner ->
  ?name:non_empty_string ->
  ?bundle_id:bundle_id ->
  unit ->
  workspace_bundle

val make_describe_workspace_bundles_request :
  ?next_token:pagination_token ->
  ?owner:bundle_owner ->
  ?bundle_ids:bundle_id_list ->
  unit ->
  describe_workspace_bundles_request

val make_describe_workspace_associations_request :
  associated_resource_types:work_space_associated_resource_type_list ->
  workspace_id:workspace_id ->
  unit ->
  describe_workspace_associations_request

val make_describe_tags_request : resource_id:non_empty_string -> unit -> describe_tags_request

val make_workspaces_ip_group :
  ?user_rules:ip_rule_list ->
  ?group_desc:ip_group_desc ->
  ?group_name:ip_group_name ->
  ?group_id:ip_group_id ->
  unit ->
  workspaces_ip_group

val make_describe_ip_groups_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  ?group_ids:ip_group_id_list ->
  unit ->
  describe_ip_groups_request

val make_image_resource_association :
  ?state_reason:association_state_reason ->
  ?state:association_state ->
  ?image_id:workspace_image_id ->
  ?last_updated_time:timestamp ->
  ?created:timestamp ->
  ?associated_resource_type:image_associated_resource_type ->
  ?associated_resource_id:non_empty_string ->
  unit ->
  image_resource_association

val make_describe_image_associations_request :
  associated_resource_types:image_associated_resource_type_list ->
  image_id:workspace_image_id ->
  unit ->
  describe_image_associations_request

val make_custom_workspace_image_import_error_details :
  ?error_message:image_error_message ->
  ?error_code:error_code ->
  unit ->
  custom_workspace_image_import_error_details

val make_describe_custom_workspace_image_import_request :
  image_id:workspace_image_id -> unit -> describe_custom_workspace_image_import_request

val make_describe_connection_alias_permissions_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  alias_id:connection_alias_id ->
  unit ->
  describe_connection_alias_permissions_request

val make_connection_alias_association :
  ?connection_identifier:connection_identifier ->
  ?resource_id:non_empty_string ->
  ?associated_account_id:aws_account ->
  ?association_status:association_status ->
  unit ->
  connection_alias_association

val make_connection_alias :
  ?associations:connection_alias_association_list ->
  ?owner_account_id:aws_account ->
  ?state:connection_alias_state ->
  ?alias_id:connection_alias_id ->
  ?connection_string:connection_string ->
  unit ->
  connection_alias

val make_describe_connection_aliases_request :
  ?next_token:pagination_token ->
  ?limit:limit ->
  ?resource_id:non_empty_string ->
  ?alias_ids:connection_alias_id_list ->
  unit ->
  describe_connection_aliases_request

val make_connect_client_add_in :
  ?ur_l:add_in_url ->
  ?name:add_in_name ->
  ?resource_id:directory_id ->
  ?add_in_id:amazon_uuid ->
  unit ->
  connect_client_add_in

val make_describe_connect_client_add_ins_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  resource_id:directory_id ->
  unit ->
  describe_connect_client_add_ins_request

val make_describe_client_properties_request :
  resource_ids:resource_id_list -> unit -> describe_client_properties_request

val make_describe_client_branding_request :
  resource_id:directory_id -> unit -> describe_client_branding_request

val make_bundle_resource_association :
  ?state_reason:association_state_reason ->
  ?state:association_state ->
  ?last_updated_time:timestamp ->
  ?created:timestamp ->
  ?bundle_id:bundle_id ->
  ?associated_resource_type:bundle_associated_resource_type ->
  ?associated_resource_id:non_empty_string ->
  unit ->
  bundle_resource_association

val make_describe_bundle_associations_request :
  associated_resource_types:bundle_associated_resource_type_list ->
  bundle_id:bundle_id ->
  unit ->
  describe_bundle_associations_request

val make_work_space_application :
  ?supported_operating_system_names:operating_system_name_list ->
  ?supported_compute_type_names:compute_list ->
  ?state:work_space_application_state ->
  ?owner:work_space_application_owner ->
  ?name:non_empty_string ->
  ?license_type:work_space_application_license_type ->
  ?description:string2048 ->
  ?created:timestamp ->
  ?application_id:work_space_application_id ->
  unit ->
  work_space_application

val make_describe_applications_request :
  ?next_token:pagination_token ->
  ?max_results:limit ->
  ?owner:work_space_application_owner ->
  ?operating_system_names:operating_system_name_list ->
  ?license_type:work_space_application_license_type ->
  ?compute_type_names:compute_list ->
  ?application_ids:work_space_application_id_list ->
  unit ->
  describe_applications_request

val make_application_resource_association :
  ?state_reason:association_state_reason ->
  ?state:association_state ->
  ?last_updated_time:timestamp ->
  ?created:timestamp ->
  ?associated_resource_type:application_associated_resource_type ->
  ?associated_resource_id:non_empty_string ->
  ?application_id:work_space_application_id ->
  unit ->
  application_resource_association

val make_describe_application_associations_request :
  ?next_token:pagination_token ->
  ?max_results:limit ->
  associated_resource_types:application_associated_resource_type_list ->
  application_id:work_space_application_id ->
  unit ->
  describe_application_associations_request

val make_account_modification :
  ?error_message:description ->
  ?error_code:workspace_error_code ->
  ?start_time:timestamp ->
  ?dedicated_tenancy_management_cidr_range:dedicated_tenancy_management_cidr_range ->
  ?dedicated_tenancy_support:dedicated_tenancy_support_result_enum ->
  ?modification_state:dedicated_tenancy_modification_state_enum ->
  unit ->
  account_modification

val make_describe_account_modifications_request :
  ?next_token:pagination_token -> unit -> describe_account_modifications_request

val make_describe_account_request : unit -> unit

val make_deregister_workspace_directory_request :
  directory_id:directory_id -> unit -> deregister_workspace_directory_request

val make_work_space_application_deployment :
  ?associations:workspace_resource_association_list -> unit -> work_space_application_deployment

val make_deploy_workspace_applications_request :
  ?force:boolean_object ->
  workspace_id:workspace_id ->
  unit ->
  deploy_workspace_applications_request

val make_delete_workspace_image_request :
  image_id:workspace_image_id -> unit -> delete_workspace_image_request

val make_delete_workspace_bundle_request :
  ?bundle_id:bundle_id -> unit -> delete_workspace_bundle_request

val make_delete_tags_request :
  tag_keys:tag_key_list -> resource_id:non_empty_string -> unit -> delete_tags_request

val make_delete_ip_group_request : group_id:ip_group_id -> unit -> delete_ip_group_request

val make_delete_connection_alias_request :
  alias_id:connection_alias_id -> unit -> delete_connection_alias_request

val make_delete_connect_client_add_in_request :
  resource_id:directory_id -> add_in_id:amazon_uuid -> unit -> delete_connect_client_add_in_request

val make_delete_client_branding_request :
  platforms:client_device_type_list ->
  resource_id:directory_id ->
  unit ->
  delete_client_branding_request

val make_delete_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> delete_account_link_invitation_request

val make_create_workspaces_pool_request :
  ?running_mode:pools_running_mode ->
  ?timeout_settings:timeout_settings ->
  ?application_settings:application_settings_request ->
  ?tags:tag_list ->
  capacity:capacity ->
  directory_id:directory_id ->
  bundle_id:bundle_id ->
  description:update_description ->
  pool_name:workspaces_pool_name ->
  unit ->
  create_workspaces_pool_request

val make_workspace_request :
  ?ipv6_address:ipv6_address ->
  ?workspace_name:workspace_name ->
  ?tags:tag_list ->
  ?workspace_properties:workspace_properties ->
  ?root_volume_encryption_enabled:boolean_object ->
  ?user_volume_encryption_enabled:boolean_object ->
  ?volume_encryption_key:volume_encryption_key ->
  bundle_id:bundle_id ->
  user_name:user_name ->
  directory_id:directory_id ->
  unit ->
  workspace_request

val make_failed_create_workspace_request :
  ?error_message:description ->
  ?error_code:error_type ->
  ?workspace_request:workspace_request ->
  unit ->
  failed_create_workspace_request

val make_create_workspaces_request :
  workspaces:workspace_request_list -> unit -> create_workspaces_request

val make_create_workspace_image_request :
  ?tags:tag_list ->
  workspace_id:workspace_id ->
  description:workspace_image_description ->
  name:workspace_image_name ->
  unit ->
  create_workspace_image_request

val make_create_workspace_bundle_request :
  ?tags:tag_list ->
  ?root_storage:root_storage ->
  user_storage:user_storage ->
  compute_type:compute_type ->
  image_id:workspace_image_id ->
  bundle_description:workspace_bundle_description ->
  bundle_name:workspace_bundle_name ->
  unit ->
  create_workspace_bundle_request

val make_create_updated_workspace_image_request :
  ?tags:tag_list ->
  source_image_id:workspace_image_id ->
  description:workspace_image_description ->
  name:workspace_image_name ->
  unit ->
  create_updated_workspace_image_request

val make_create_tags_request :
  tags:tag_list -> resource_id:non_empty_string -> unit -> create_tags_request

val make_standby_workspace :
  ?data_replication:data_replication ->
  ?tags:tag_list ->
  ?volume_encryption_key:volume_encryption_key ->
  directory_id:directory_id ->
  primary_workspace_id:workspace_id ->
  unit ->
  standby_workspace

val make_failed_create_standby_workspaces_request :
  ?error_message:description ->
  ?error_code:workspace_error_code ->
  ?standby_workspace_request:standby_workspace ->
  unit ->
  failed_create_standby_workspaces_request

val make_pending_create_standby_workspaces_request :
  ?workspace_id:workspace_id ->
  ?state:workspace_state ->
  ?directory_id:directory_id ->
  ?user_name:user_name ->
  unit ->
  pending_create_standby_workspaces_request

val make_create_standby_workspaces_request :
  standby_workspaces:standby_workspaces_list ->
  primary_region:region ->
  unit ->
  create_standby_workspaces_request

val make_create_ip_group_request :
  ?tags:tag_list ->
  ?user_rules:ip_rule_list ->
  ?group_desc:ip_group_desc ->
  group_name:ip_group_name ->
  unit ->
  create_ip_group_request

val make_create_connection_alias_request :
  ?tags:tag_list -> connection_string:connection_string -> unit -> create_connection_alias_request

val make_create_connect_client_add_in_request :
  ur_l:add_in_url ->
  name:add_in_name ->
  resource_id:directory_id ->
  unit ->
  create_connect_client_add_in_request

val make_create_account_link_invitation_request :
  ?client_token:client_token ->
  target_account_id:aws_account ->
  unit ->
  create_account_link_invitation_request

val make_copy_workspace_image_request :
  ?tags:tag_list ->
  ?description:workspace_image_description ->
  source_region:region ->
  source_image_id:workspace_image_id ->
  name:workspace_image_name ->
  unit ->
  copy_workspace_image_request

val make_authorize_ip_rules_request :
  user_rules:ip_rule_list -> group_id:ip_group_id -> unit -> authorize_ip_rules_request

val make_associate_workspace_application_request :
  application_id:work_space_application_id ->
  workspace_id:workspace_id ->
  unit ->
  associate_workspace_application_request

val make_associate_ip_groups_request :
  group_ids:ip_group_id_list -> directory_id:directory_id -> unit -> associate_ip_groups_request

val make_associate_connection_alias_request :
  resource_id:non_empty_string ->
  alias_id:connection_alias_id ->
  unit ->
  associate_connection_alias_request

val make_accept_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> accept_account_link_invitation_request
