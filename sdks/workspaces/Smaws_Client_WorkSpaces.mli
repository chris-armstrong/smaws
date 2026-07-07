(** WorkSpaces client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AcceptAccountLinkInvitation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_account_link_invitation_request ->
    ( accept_account_link_invitation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_account_link_invitation_request ->
    ( accept_account_link_invitation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts the account link invitation.\n\n\
  \  There's currently no unlinking capability after you accept the account linking invitation.\n\
  \  \n\
  \   "]

module AssociateConnectionAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAssociatedException of resource_associated_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_alias_request ->
    ( associate_connection_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_connection_alias_request ->
    ( associate_connection_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified connection alias with the specified directory to enable cross-Region \
   redirection. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n\n\
  \  Before performing this operation, call \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html} \
   DescribeConnectionAliases} to make sure that the current state of the connection alias is \
   [CREATED].\n\
  \  \n\
  \   "]

module AssociateIpGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_ip_groups_request ->
    ( associate_ip_groups_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_ip_groups_request ->
    ( associate_ip_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified IP access control group with the specified directory.\n"]

module AssociateWorkspaceApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ApplicationNotSupportedException of application_not_supported_exception
    | `ComputeNotCompatibleException of compute_not_compatible_exception
    | `IncompatibleApplicationsException of incompatible_applications_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperatingSystemNotCompatibleException of operating_system_not_compatible_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_workspace_application_request ->
    ( associate_workspace_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ApplicationNotSupportedException of application_not_supported_exception
      | `ComputeNotCompatibleException of compute_not_compatible_exception
      | `IncompatibleApplicationsException of incompatible_applications_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperatingSystemNotCompatibleException of operating_system_not_compatible_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_workspace_application_request ->
    ( associate_workspace_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ApplicationNotSupportedException of application_not_supported_exception
      | `ComputeNotCompatibleException of compute_not_compatible_exception
      | `IncompatibleApplicationsException of incompatible_applications_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperatingSystemNotCompatibleException of operating_system_not_compatible_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified application to the specified WorkSpace.\n"]

module AuthorizeIpRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    authorize_ip_rules_request ->
    ( authorize_ip_rules_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    authorize_ip_rules_request ->
    ( authorize_ip_rules_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more rules to the specified IP access control group.\n\n\
  \ This action gives users permission to access their WorkSpaces from the CIDR address ranges \
   specified in the rules.\n\
  \ "]

module CopyWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_workspace_image_request ->
    ( copy_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_workspace_image_request ->
    ( copy_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the specified image from the specified Region to the current Region. For more \
   information about copying images, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/copy-custom-image.html} Copy a \
   Custom WorkSpaces Image}.\n\n\
  \ In the China (Ningxia) Region, you can copy images only within the same Region.\n\
  \ \n\
  \  In Amazon Web Services GovCloud (US), to copy images to and from other Regions, contact \
   Amazon Web Services Support.\n\
  \  \n\
  \    Before copying a shared image, be sure to verify that it has been shared from the correct \
   Amazon Web Services account. To determine if an image has been shared and to see the ID of the \
   Amazon Web Services account that owns an image, use the \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html}DescribeWorkSpaceImages} \
   and \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImagePermissions.html}DescribeWorkspaceImagePermissions} \
   API operations. \n\
  \    \n\
  \     "]

module CreateAccountLinkInvitation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_account_link_invitation_request ->
    ( create_account_link_invitation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_account_link_invitation_request ->
    ( create_account_link_invitation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the account link invitation.\n"]

module CreateConnectClientAddIn : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceCreationFailedException of resource_creation_failed_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connect_client_add_in_request ->
    ( create_connect_client_add_in_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceCreationFailedException of resource_creation_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connect_client_add_in_request ->
    ( create_connect_client_add_in_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceCreationFailedException of resource_creation_failed_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a client-add-in for Connect Customer within a directory. You can create only one \
   Connect Customer client add-in within a directory.\n\n\
  \ This client add-in allows WorkSpaces users to seamlessly connect to Connect Customer.\n\
  \ "]

module CreateConnectionAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_alias_request ->
    ( create_connection_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_alias_request ->
    ( create_connection_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the specified connection alias for use with cross-Region redirection. For more \
   information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

module CreateIpGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceCreationFailedException of resource_creation_failed_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ip_group_request ->
    ( create_ip_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceCreationFailedException of resource_creation_failed_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ip_group_request ->
    ( create_ip_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceCreationFailedException of resource_creation_failed_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an IP access control group.\n\n\
  \ An IP access control group provides you with the ability to control the IP addresses from \
   which users are allowed to access their WorkSpaces. To specify the CIDR address ranges, add \
   rules to your IP access control group and then associate the group with your directory. You can \
   add rules when you create the group or at any time using [AuthorizeIpRules].\n\
  \ \n\
  \  There is a default IP access control group associated with your directory. If you don't \
   associate an IP access control group with your directory, the default group is used. The \
   default group includes a default rule that allows users to access their WorkSpaces from \
   anywhere. You cannot modify the default IP access control group for your directory.\n\
  \  "]

module CreateStandbyWorkspaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_standby_workspaces_request ->
    ( create_standby_workspaces_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_standby_workspaces_request ->
    ( create_standby_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a standby WorkSpace in a secondary Region.\n"]

module CreateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_tags_request ->
    ( create_tags_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the specified tags for the specified WorkSpaces resource.\n"]

module CreateUpdatedWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_updated_workspace_image_request ->
    ( create_updated_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_updated_workspace_image_request ->
    ( create_updated_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new updated WorkSpace image based on the specified source image. The new updated \
   WorkSpace image has the latest drivers and other updates required by the Amazon WorkSpaces \
   components.\n\n\
  \ To determine which WorkSpace images need to be updated with the latest Amazon WorkSpaces \
   requirements, use \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceImages.html} \
   DescribeWorkspaceImages}.\n\
  \ \n\
  \   {ul\n\
  \         {-  Only Windows 10, Windows Server 2016, and Windows Server 2019 WorkSpace images can \
   be programmatically updated at this time.\n\
  \             \n\
  \              }\n\
  \         {-  Microsoft Windows updates and other application updates are not included in the \
   update process.\n\
  \             \n\
  \              }\n\
  \         {-  The source WorkSpace image is not deleted. You can delete the source image after \
   you've verified your new updated image and created a new bundle. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module CreateWorkspaceBundle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workspace_bundle_request ->
    ( create_workspace_bundle_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workspace_bundle_request ->
    ( create_workspace_bundle_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the specified WorkSpace bundle. For more information about creating WorkSpace bundles, \
   see {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/create-custom-bundle.html} \
   Create a Custom WorkSpaces Image and Bundle}.\n"]

module CreateWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workspace_image_request ->
    ( create_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workspace_image_request ->
    ( create_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new WorkSpace image from an existing WorkSpace.\n"]

module CreateWorkspaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workspaces_request ->
    ( create_workspaces_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workspaces_request ->
    ( create_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates one or more WorkSpaces.\n\n\
  \ This operation is asynchronous and returns before the WorkSpaces are created.\n\
  \ \n\
  \   {ul\n\
  \         {-  The [MANUAL] running mode value is only supported by Amazon WorkSpaces Core. \
   Contact your account team to be allow-listed to use this value. For more information, see \
   {{:http://aws.amazon.com/workspaces/core/}Amazon WorkSpaces Core}.\n\
  \             \n\
  \              }\n\
  \         {-  You don't need to specify the [PCOIP] protocol for Linux bundles because [DCV] \
   (formerly WSP) is the default protocol for those bundles.\n\
  \             \n\
  \              }\n\
  \         {-  User-decoupled WorkSpaces are only supported by Amazon WorkSpaces Core.\n\
  \             \n\
  \              }\n\
  \         {-  Review your running mode to ensure you are using one that is optimal for your \
   needs and budget. For more information on switching running modes, see \
   {{:http://aws.amazon.com/workspaces-family/workspaces/faqs/#:~:text=Can%20I%20switch%20between%20hourly%20and%20monthly%20billing%20on%20WorkSpaces%20Personal%3F} \
   Can I switch between hourly and monthly billing?} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module CreateWorkspacesPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workspaces_pool_request ->
    ( create_workspaces_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workspaces_pool_request ->
    ( create_workspaces_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a pool of WorkSpaces.\n"]

module DeleteAccountLinkInvitation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_account_link_invitation_request ->
    ( delete_account_link_invitation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_account_link_invitation_request ->
    ( delete_account_link_invitation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the account link invitation.\n"]

module DeleteClientBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_client_branding_request ->
    ( delete_client_branding_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_client_branding_request ->
    ( delete_client_branding_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes customized client branding. Client branding allows you to customize your WorkSpace's \
   client login portal. You can tailor your login portal company logo, the support email address, \
   support link, link to reset password, and a custom message for users trying to sign in.\n\n\
  \ After you delete your customized client branding, your login portal reverts to the default \
   client branding.\n\
  \ "]

module DeleteConnectClientAddIn : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connect_client_add_in_request ->
    ( delete_connect_client_add_in_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connect_client_add_in_request ->
    ( delete_connect_client_add_in_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a client-add-in for Connect Customer that is configured within a directory.\n"]

module DeleteConnectionAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAssociatedException of resource_associated_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_alias_request ->
    ( delete_connection_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_alias_request ->
    ( delete_connection_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified connection alias. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n\n\
  \   {b If you will no longer be using a fully qualified domain name (FQDN) as the registration \
   code for your WorkSpaces users, you must take certain precautions to prevent potential security \
   issues.} For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html#cross-region-redirection-security-considerations} \
   Security Considerations if You Stop Using Cross-Region Redirection}.\n\
  \  \n\
  \     To delete a connection alias that has been shared, the shared account must first \
   disassociate the connection alias from any directories it has been associated with. Then you \
   must unshare the connection alias from the account it has been shared with. You can delete a \
   connection alias only after it is no longer shared with any accounts or associated with any \
   directories.\n\
  \     \n\
  \      "]

module DeleteIpGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceAssociatedException of resource_associated_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ip_group_request ->
    ( delete_ip_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ip_group_request ->
    ( delete_ip_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified IP access control group.\n\n\
  \ You cannot delete an IP access control group that is associated with a directory.\n\
  \ "]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_request ->
    ( delete_tags_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags from the specified WorkSpaces resource.\n"]

module DeleteWorkspaceBundle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceAssociatedException of resource_associated_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workspace_bundle_request ->
    ( delete_workspace_bundle_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workspace_bundle_request ->
    ( delete_workspace_bundle_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified WorkSpace bundle. For more information about deleting WorkSpace bundles, \
   see {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/delete_bundle.html} Delete a \
   Custom WorkSpaces Bundle or Image}.\n"]

module DeleteWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `ResourceAssociatedException of resource_associated_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workspace_image_request ->
    ( delete_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceAssociatedException of resource_associated_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workspace_image_request ->
    ( delete_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceAssociatedException of resource_associated_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified image from your account. To delete an image, you must first delete any \
   bundles that are associated with the image and unshare the image if it is shared with other \
   accounts. \n"]

module DeployWorkspaceApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `IncompatibleApplicationsException of incompatible_applications_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deploy_workspace_applications_request ->
    ( deploy_workspace_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IncompatibleApplicationsException of incompatible_applications_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deploy_workspace_applications_request ->
    ( deploy_workspace_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `IncompatibleApplicationsException of incompatible_applications_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deploys associated applications to the specified WorkSpace\n"]

module DeregisterWorkspaceDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_workspace_directory_request ->
    ( deregister_workspace_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_workspace_directory_request ->
    ( deregister_workspace_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified directory. This operation is asynchronous and returns before the \
   WorkSpace directory is deregistered. If any WorkSpaces are registered to this directory, you \
   must remove them before you can deregister the directory.\n\n\
  \  Simple AD and AD Connector are made available to you free of charge to use with WorkSpaces. \
   If there are no WorkSpaces being used with your Simple AD or AD Connector directory for 30 \
   consecutive days, this directory will be automatically deregistered for use with Amazon \
   WorkSpaces, and you will be charged for this directory as per the \
   {{:http://aws.amazon.com/directoryservice/pricing/}Directory Service pricing terms}.\n\
  \  \n\
  \   To delete empty directories, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html} \
   Delete the Directory for Your WorkSpaces}. If you delete your Simple AD or AD Connector \
   directory, you can always create a new one when you want to start using WorkSpaces again.\n\
  \   \n\
  \    "]

module DescribeAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_request ->
    ( describe_account_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_request ->
    ( describe_account_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the configuration of Bring Your Own License (BYOL) for the \
   specified account.\n"]

module DescribeAccountModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_modifications_request ->
    ( describe_account_modifications_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_modifications_request ->
    ( describe_account_modifications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes modifications to the configuration of Bring Your Own License \
   (BYOL) for the specified account.\n"]

module DescribeApplicationAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_associations_request ->
    ( describe_application_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_associations_request ->
    ( describe_application_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the associations between the application and the specified associated resources.\n"]

module DescribeApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified applications by filtering based on their compute types, license \
   availability, operating systems, and owners.\n"]

module DescribeBundleAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_bundle_associations_request ->
    ( describe_bundle_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_bundle_associations_request ->
    ( describe_bundle_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the associations between the applications and the specified bundle.\n"]

module DescribeClientBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_client_branding_request ->
    ( describe_client_branding_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_client_branding_request ->
    ( describe_client_branding_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified client branding. Client branding allows you to customize the log in \
   page of various device types for your users. You can add your company logo, the support email \
   address, support link, link to reset password, and a custom message for users trying to sign \
   in.\n\n\
  \  Only device types that have branding information configured will be shown in the response.\n\
  \  \n\
  \   "]

module DescribeClientProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_client_properties_request ->
    ( describe_client_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_client_properties_request ->
    ( describe_client_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more specified Amazon WorkSpaces clients.\n"]

module DescribeConnectClientAddIns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connect_client_add_ins_request ->
    ( describe_connect_client_add_ins_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connect_client_add_ins_request ->
    ( describe_connect_client_add_ins_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of Connect Customer client add-ins that have been created.\n"]

module DescribeConnectionAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_aliases_request ->
    ( describe_connection_aliases_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_aliases_request ->
    ( describe_connection_aliases_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the connection aliases used for cross-Region redirection. For \
   more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

module DescribeConnectionAliasPermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_alias_permissions_request ->
    ( describe_connection_alias_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_alias_permissions_request ->
    ( describe_connection_alias_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the permissions that the owner of a connection alias has granted to another Amazon \
   Web Services account for the specified connection alias. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

module DescribeCustomWorkspaceImageImport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_workspace_image_import_request ->
    ( describe_custom_workspace_image_import_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_workspace_image_import_request ->
    ( describe_custom_workspace_image_import_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a WorkSpace BYOL image being imported via ImportCustomWorkspaceImage.\n"]

module DescribeImageAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_associations_request ->
    ( describe_image_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_associations_request ->
    ( describe_image_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the associations between the applications and the specified image.\n"]

module DescribeIpGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ip_groups_request ->
    ( describe_ip_groups_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ip_groups_request ->
    ( describe_ip_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more of your IP access control groups.\n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_request ->
    ( describe_tags_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified tags for the specified WorkSpaces resource.\n"]

module DescribeWorkspaceAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_associations_request ->
    ( describe_workspace_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_associations_request ->
    ( describe_workspace_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the associations betweens applications and the specified WorkSpace.\n"]

module DescribeWorkspaceBundles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_bundles_request ->
    ( describe_workspace_bundles_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_bundles_request ->
    ( describe_workspace_bundles_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the available WorkSpace bundles.\n\n\
  \ You can filter the results using either bundle ID or owner, but not both.\n\
  \ "]

module DescribeWorkspaceDirectories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_directories_request ->
    ( describe_workspace_directories_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_directories_request ->
    ( describe_workspace_directories_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the available directories that are registered with Amazon WorkSpaces.\n"]

module DescribeWorkspaceImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_image_permissions_request ->
    ( describe_workspace_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_image_permissions_request ->
    ( describe_workspace_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the permissions that the owner of an image has granted to other Amazon Web Services \
   accounts for an image.\n"]

module DescribeWorkspaceImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_images_request ->
    ( describe_workspace_images_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_images_request ->
    ( describe_workspace_images_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified images, if the image identifiers are \
   provided. Otherwise, all images in the account are described. \n"]

module DescribeWorkspaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_request ->
    ( describe_workspaces_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_request ->
    ( describe_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified WorkSpaces.\n\n\
  \ You can filter the results by using the bundle identifier, directory identifier, or owner, but \
   you can specify only one filter at a time.\n\
  \ "]

module DescribeWorkspacesConnectionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_connection_status_request ->
    ( describe_workspaces_connection_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_connection_status_request ->
    ( describe_workspaces_connection_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the connection status of the specified WorkSpaces.\n"]

module DescribeWorkspaceSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_snapshots_request ->
    ( describe_workspace_snapshots_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspace_snapshots_request ->
    ( describe_workspace_snapshots_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the snapshots for the specified WorkSpace.\n"]

module DescribeWorkspacesPools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_pools_request ->
    ( describe_workspaces_pools_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_pools_request ->
    ( describe_workspaces_pools_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified WorkSpaces Pools.\n"]

module DescribeWorkspacesPoolSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_pool_sessions_request ->
    ( describe_workspaces_pool_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workspaces_pool_sessions_request ->
    ( describe_workspaces_pool_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes the streaming sessions for a specified pool.\n"]

module DisassociateConnectionAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_alias_request ->
    ( disassociate_connection_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_connection_alias_request ->
    ( disassociate_connection_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates a connection alias from a directory. Disassociating a connection alias disables \
   cross-Region redirection between two directories in different Regions. For more information, \
   see {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n\n\
  \  Before performing this operation, call \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html} \
   DescribeConnectionAliases} to make sure that the current state of the connection alias is \
   [CREATED].\n\
  \  \n\
  \   "]

module DisassociateIpGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_ip_groups_request ->
    ( disassociate_ip_groups_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_ip_groups_request ->
    ( disassociate_ip_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified IP access control group from the specified directory.\n"]

module DisassociateWorkspaceApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_workspace_application_request ->
    ( disassociate_workspace_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_workspace_application_request ->
    ( disassociate_workspace_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified application from a WorkSpace.\n"]

module GetAccountLink : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_account_link_request ->
    ( get_account_link_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_account_link_request ->
    ( get_account_link_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves account link information.\n"]

module ImportClientBranding : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_client_branding_request ->
    ( import_client_branding_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_client_branding_request ->
    ( import_client_branding_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports client branding. Client branding allows you to customize your WorkSpace's client login \
   portal. You can tailor your login portal company logo, the support email address, support link, \
   link to reset password, and a custom message for users trying to sign in.\n\n\
  \ After you import client branding, the default branding experience for the specified platform \
   type is replaced with the imported experience\n\
  \ \n\
  \   {ul\n\
  \         {-  You must specify at least one platform type when importing client branding.\n\
  \             \n\
  \              }\n\
  \         {-  You can import up to 6 MB of data with each request. If your request exceeds this \
   limit, you can import client branding for different platform types using separate requests.\n\
  \             \n\
  \              }\n\
  \         {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
   mutually exclusive. You can specify only one parameter for each platform type, but not both.\n\
  \             \n\
  \              }\n\
  \         {-  Imported data can take up to a minute to appear in the WorkSpaces client.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module ImportCustomWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_custom_workspace_image_request ->
    ( import_custom_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_custom_workspace_image_request ->
    ( import_custom_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports the specified Windows 10 or 11 Bring Your Own License (BYOL) image into Amazon \
   WorkSpaces using EC2 Image Builder. The image must be an already licensed image that is in your \
   Amazon Web Services account, and you must own the image. For more information about creating \
   BYOL images, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html} Bring \
   Your Own Windows Desktop Licenses}. \n"]

module ImportWorkspaceImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_workspace_image_request ->
    ( import_workspace_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_workspace_image_request ->
    ( import_workspace_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports the specified Windows 10 or 11 Bring Your Own License (BYOL) image into Amazon \
   WorkSpaces. The image must be an already licensed Amazon EC2 image that is in your Amazon Web \
   Services account, and you must own the image. For more information about creating BYOL images, \
   see {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html} Bring \
   Your Own Windows Desktop Licenses}.\n"]

module ListAccountLinks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_links_request ->
    ( list_account_links_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_links_request ->
    ( list_account_links_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all account links.\n"]

module ListAvailableManagementCidrRanges : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_available_management_cidr_ranges_request ->
    ( list_available_management_cidr_ranges_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_available_management_cidr_ranges_request ->
    ( list_available_management_cidr_ranges_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that you can use for the \
   network management interface when you enable Bring Your Own License (BYOL). \n\n\
  \ This operation can be run only by Amazon Web Services accounts that are enabled for BYOL. If \
   your account isn't enabled for BYOL, you'll receive an [AccessDeniedException] error.\n\
  \ \n\
  \  The management network interface is connected to a secure Amazon WorkSpaces management \
   network. It is used for interactive streaming of the WorkSpace desktop to Amazon WorkSpaces \
   clients, and to allow Amazon WorkSpaces to manage the WorkSpace.\n\
  \  "]

module MigrateWorkspace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    migrate_workspace_request ->
    ( migrate_workspace_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    migrate_workspace_request ->
    ( migrate_workspace_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Migrates a WorkSpace from one operating system or bundle type to another, while retaining the \
   data on the user volume.\n\n\
  \ The migration process recreates the WorkSpace by using a new root volume from the target \
   bundle image and the user volume from the last available snapshot of the original WorkSpace. \
   During migration, the original [D:\\Users\\%USERNAME%] user profile folder is renamed to \
   [D:\\Users\\%USERNAME%MMddyyTHHmmss%.NotMigrated]. A new [D:\\Users\\%USERNAME%\\] folder is \
   generated by the new OS. Certain files in the old user profile are moved to the new user \
   profile.\n\
  \ \n\
  \  For available migration scenarios, details about what happens during migration, and best \
   practices, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/migrate-workspaces.html}Migrate a \
   WorkSpace}.\n\
  \  "]

module ModifyAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_account_request ->
    ( modify_account_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_account_request ->
    ( modify_account_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the configuration of Bring Your Own License (BYOL) for the specified account.\n"]

module ModifyCertificateBasedAuthProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_certificate_based_auth_properties_request ->
    ( modify_certificate_based_auth_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_certificate_based_auth_properties_request ->
    ( modify_certificate_based_auth_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the properties of the certificate-based authentication you want to use with your \
   WorkSpaces.\n"]

module ModifyClientProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_client_properties_request ->
    ( modify_client_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_client_properties_request ->
    ( modify_client_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the properties of the specified Amazon WorkSpaces clients.\n"]

module ModifyEndpointEncryptionMode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_encryption_mode_request ->
    ( modify_endpoint_encryption_mode_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_endpoint_encryption_mode_request ->
    ( modify_endpoint_encryption_mode_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the endpoint encryption mode that allows you to configure the specified directory \
   between Standard TLS and FIPS 140-2 validated mode. \n"]

module ModifySamlProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_saml_properties_request ->
    ( modify_saml_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_saml_properties_request ->
    ( modify_saml_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies multiple properties related to SAML 2.0 authentication, including the enablement \
   status, user access URL, and relay state parameter name that are used for configuring \
   federation with an SAML 2.0 identity provider.\n"]

module ModifySelfservicePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_selfservice_permissions_request ->
    ( modify_selfservice_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_selfservice_permissions_request ->
    ( modify_selfservice_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the self-service WorkSpace management capabilities for your users. For more \
   information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html}Enable \
   Self-Service WorkSpace Management Capabilities for Your Users}.\n"]

module ModifyStreamingProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_streaming_properties_request ->
    ( modify_streaming_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_streaming_properties_request ->
    ( modify_streaming_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified streaming properties.\n"]

module ModifyWorkspaceAccessProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_access_properties_request ->
    ( modify_workspace_access_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_access_properties_request ->
    ( modify_workspace_access_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies which devices and operating systems users can use to access their WorkSpaces. For \
   more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html#control-device-access} \
   Control Device Access}.\n"]

module ModifyWorkspaceCreationProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_creation_properties_request ->
    ( modify_workspace_creation_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_creation_properties_request ->
    ( modify_workspace_creation_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modify the default properties used to create WorkSpaces.\n"]

module ModifyWorkspaceProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `UnsupportedWorkspaceConfigurationException of unsupported_workspace_configuration_exception
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_properties_request ->
    ( modify_workspace_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `UnsupportedWorkspaceConfigurationException of unsupported_workspace_configuration_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_properties_request ->
    ( modify_workspace_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `UnsupportedWorkspaceConfigurationException of unsupported_workspace_configuration_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified WorkSpace properties. For important information about how to modify the \
   size of the root and user volumes, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html} Modify a \
   WorkSpace}. \n\n\
  \  The [MANUAL] running mode value is only supported by Amazon WorkSpaces Core. Contact your \
   account team to be allow-listed to use this value. For more information, see \
   {{:http://aws.amazon.com/workspaces/core/}Amazon WorkSpaces Core}.\n\
  \  \n\
  \   "]

module ModifyWorkspaceState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_state_request ->
    ( modify_workspace_state_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_workspace_state_request ->
    ( modify_workspace_state_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the state of the specified WorkSpace.\n\n\
  \ To maintain a WorkSpace without being interrupted, set the WorkSpace state to \
   [ADMIN_MAINTENANCE]. WorkSpaces in this state do not respond to requests to reboot, stop, \
   start, rebuild, or restore. An AutoStop WorkSpace in this state is not stopped. Users cannot \
   log into a WorkSpace in the [ADMIN_MAINTENANCE] state.\n\
  \ "]

module RebootWorkspaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reboot_workspaces_request ->
    ( reboot_workspaces_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reboot_workspaces_request ->
    ( reboot_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reboots the specified WorkSpaces.\n\n\
  \ You cannot reboot a WorkSpace unless its state is [AVAILABLE], [UNHEALTHY], or [REBOOTING]. \
   Reboot a WorkSpace in the [REBOOTING] state only if your WorkSpace has been stuck in the \
   [REBOOTING] state for over 20 minutes.\n\
  \ \n\
  \  This operation is asynchronous and returns before the WorkSpaces have rebooted.\n\
  \  "]

module RebuildWorkspaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rebuild_workspaces_request ->
    ( rebuild_workspaces_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rebuild_workspaces_request ->
    ( rebuild_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rebuilds the specified WorkSpace.\n\n\
  \ You cannot rebuild a WorkSpace unless its state is [AVAILABLE], [ERROR], [UNHEALTHY], \
   [STOPPED], or [REBOOTING].\n\
  \ \n\
  \  Rebuilding a WorkSpace is a potentially destructive action that can result in the loss of \
   data. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/reset-workspace.html}Rebuild a \
   WorkSpace}.\n\
  \  \n\
  \   This operation is asynchronous and returns before the WorkSpaces have been completely rebuilt.\n\
  \   "]

module RegisterWorkspaceDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedNetworkConfigurationException of unsupported_network_configuration_exception
    | `WorkspacesDefaultRoleNotFoundException of workspaces_default_role_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_workspace_directory_request ->
    ( register_workspace_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedNetworkConfigurationException of unsupported_network_configuration_exception
      | `WorkspacesDefaultRoleNotFoundException of workspaces_default_role_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_workspace_directory_request ->
    ( register_workspace_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedNetworkConfigurationException of unsupported_network_configuration_exception
      | `WorkspacesDefaultRoleNotFoundException of workspaces_default_role_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the specified directory. This operation is asynchronous and returns before the \
   WorkSpace directory is registered. If this is the first time you are registering a directory, \
   you will need to create the workspaces_DefaultRole role before you can register a directory. \
   For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-access-control.html#create-default-role} \
   Creating the workspaces_DefaultRole Role}.\n"]

module RejectAccountLinkInvitation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_account_link_invitation_request ->
    ( reject_account_link_invitation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_account_link_invitation_request ->
    ( reject_account_link_invitation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects the account link invitation.\n"]

module RestoreWorkspace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_workspace_request ->
    ( restore_workspace_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_workspace_request ->
    ( restore_workspace_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores the specified WorkSpace to its last known healthy state.\n\n\
  \ You cannot restore a WorkSpace unless its state is [ AVAILABLE], [ERROR], [UNHEALTHY], or \
   [STOPPED].\n\
  \ \n\
  \  Restoring a WorkSpace is a potentially destructive action that can result in the loss of \
   data. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/restore-workspace.html}Restore a \
   WorkSpace}.\n\
  \  \n\
  \   This operation is asynchronous and returns before the WorkSpace is completely restored.\n\
  \   "]

module RevokeIpRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    revoke_ip_rules_request ->
    ( revoke_ip_rules_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    revoke_ip_rules_request ->
    ( revoke_ip_rules_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more rules from the specified IP access control group.\n"]

module StartWorkspaces : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_workspaces_request ->
    (start_workspaces_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_workspaces_request ->
    ( start_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified WorkSpaces.\n\n\
  \ You cannot start a WorkSpace unless it has a running mode of [AutoStop] or [Manual] and a \
   state of [STOPPED].\n\
  \ "]

module StartWorkspacesPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_workspaces_pool_request ->
    ( start_workspaces_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_workspaces_pool_request ->
    ( start_workspaces_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified pool.\n\n\
  \ You cannot start a pool unless it has a running mode of [AutoStop] and a state of [STOPPED].\n\
  \ "]

module StopWorkspaces : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_workspaces_request ->
    (stop_workspaces_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_workspaces_request ->
    ( stop_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops the specified WorkSpaces.\n\n\
  \ You cannot stop a WorkSpace unless it has a running mode of [AutoStop] or [Manual] and a state \
   of [AVAILABLE], [IMPAIRED], [UNHEALTHY], or [ERROR].\n\
  \ "]

module StopWorkspacesPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_workspaces_pool_request ->
    ( stop_workspaces_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_workspaces_pool_request ->
    ( stop_workspaces_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops the specified pool.\n\n\
  \ You cannot stop a WorkSpace pool unless it has a running mode of [AutoStop] and a state of \
   [AVAILABLE], [IMPAIRED], [UNHEALTHY], or [ERROR].\n\
  \ "]

module TerminateWorkspaces : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_request ->
    (terminate_workspaces_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_request ->
    ( terminate_workspaces_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the specified WorkSpaces.\n\n\
  \  Terminating a WorkSpace is a permanent action and cannot be undone. The user's data is \
   destroyed. If you need to archive any user data, contact Amazon Web Services Support before \
   terminating the WorkSpace.\n\
  \  \n\
  \    You can terminate a WorkSpace that is in any state except [SUSPENDED].\n\
  \    \n\
  \     This operation is asynchronous and returns before the WorkSpaces have been completely \
   terminated. After a WorkSpace is terminated, the [TERMINATED] state is returned only briefly \
   before the WorkSpace directory metadata is cleaned up, so this state is rarely returned. To \
   confirm that a WorkSpace is terminated, check for the WorkSpace ID by using \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html} \
   DescribeWorkSpaces}. If the WorkSpace ID isn't returned, then the WorkSpace has been \
   successfully terminated.\n\
  \     \n\
  \       Simple AD and AD Connector are made available to you free of charge to use with \
   WorkSpaces. If there are no WorkSpaces being used with your Simple AD or AD Connector directory \
   for 30 consecutive days, this directory will be automatically deregistered for use with Amazon \
   WorkSpaces, and you will be charged for this directory as per the \
   {{:http://aws.amazon.com/directoryservice/pricing/}Directory Service pricing terms}.\n\
  \       \n\
  \        To delete empty directories, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/delete-workspaces-directory.html} \
   Delete the Directory for Your WorkSpaces}. If you delete your Simple AD or AD Connector \
   directory, you can always create a new one when you want to start using WorkSpaces again.\n\
  \        \n\
  \         "]

module TerminateWorkspacesPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_pool_request ->
    ( terminate_workspaces_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_pool_request ->
    ( terminate_workspaces_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Terminates the specified pool.\n"]

module TerminateWorkspacesPoolSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_pool_session_request ->
    ( terminate_workspaces_pool_session_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_workspaces_pool_session_request ->
    ( terminate_workspaces_pool_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Terminates the pool session.\n"]

module UpdateConnectClientAddIn : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connect_client_add_in_request ->
    ( update_connect_client_add_in_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connect_client_add_in_request ->
    ( update_connect_client_add_in_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a Connect Customer client add-in. Use this action to update the name and endpoint URL \
   of a Connect Customer client add-in.\n"]

module UpdateConnectionAliasPermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceAssociatedException of resource_associated_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_alias_permission_request ->
    ( update_connection_alias_permission_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_alias_permission_request ->
    ( update_connection_alias_permission_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceAssociatedException of resource_associated_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares or unshares a connection alias with one account by specifying whether that account has \
   permission to associate the connection alias with a directory. If the association permission is \
   granted, the connection alias is shared with that account. If the association permission is \
   revoked, the connection alias is unshared with the account. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n\n\
  \  {ul\n\
  \        {-  Before performing this operation, call \
   {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeConnectionAliases.html} \
   DescribeConnectionAliases} to make sure that the current state of the connection alias is \
   [CREATED].\n\
  \            \n\
  \             }\n\
  \        {-  To delete a connection alias that has been shared, the shared account must first \
   disassociate the connection alias from any directories it has been associated with. Then you \
   must unshare the connection alias from the account it has been shared with. You can delete a \
   connection alias only after it is no longer shared with any accounts or associated with any \
   directories.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module UpdateRulesOfIpGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rules_of_ip_group_request ->
    ( update_rules_of_ip_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rules_of_ip_group_request ->
    ( update_rules_of_ip_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the current rules of the specified IP access control group with the specified rules.\n"]

module UpdateWorkspaceBundle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workspace_bundle_request ->
    ( update_workspace_bundle_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workspace_bundle_request ->
    ( update_workspace_bundle_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a WorkSpace bundle with a new image. For more information about updating WorkSpace \
   bundles, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/update-custom-bundle.html} Update a \
   Custom WorkSpaces Bundle}.\n\n\
  \  Existing WorkSpaces aren't automatically updated when you update the bundle that they're \
   based on. To update existing WorkSpaces that are based on a bundle that you've updated, you \
   must either rebuild the WorkSpaces or delete and recreate them.\n\
  \  \n\
  \   "]

module UpdateWorkspaceImagePermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workspace_image_permission_request ->
    ( update_workspace_image_permission_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workspace_image_permission_request ->
    ( update_workspace_image_permission_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares or unshares an image with one account in the same Amazon Web Services Region by \
   specifying whether that account has permission to copy the image. If the copy image permission \
   is granted, the image is shared with that account. If the copy image permission is revoked, the \
   image is unshared with the account.\n\n\
  \ After an image has been shared, the recipient account can copy the image to other Regions as \
   needed.\n\
  \ \n\
  \  In the China (Ningxia) Region, you can copy images only within the same Region.\n\
  \  \n\
  \   In Amazon Web Services GovCloud (US), to copy images to and from other Regions, contact \
   Amazon Web Services Support.\n\
  \   \n\
  \    For more information about sharing images, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html} Share or \
   Unshare a Custom WorkSpaces Image}.\n\
  \    \n\
  \      {ul\n\
  \            {-  To delete an image that has been shared, you must unshare the image before you \
   delete it.\n\
  \                \n\
  \                 }\n\
  \            {-  Sharing Bring Your Own License (BYOL) images across Amazon Web Services \
   accounts isn't supported at this time in Amazon Web Services GovCloud (US). To share BYOL \
   images across accounts in Amazon Web Services GovCloud (US), contact Amazon Web Services \
   Support.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateWorkspacesPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidParameterValuesException of invalid_parameter_values_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workspaces_pool_request ->
    ( update_workspaces_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workspaces_pool_request ->
    ( update_workspaces_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidParameterValuesException of invalid_parameter_values_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified pool.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
