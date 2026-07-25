open Types

val make_account_link :
  ?account_link_id:link_id ->
  ?account_link_status:account_link_status_enum ->
  ?source_account_id:aws_account ->
  ?target_account_id:aws_account ->
  unit ->
  account_link

val make_accept_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> accept_account_link_invitation_request

val make_access_endpoint :
  ?access_endpoint_type:access_endpoint_type ->
  ?vpc_endpoint_id:alphanumeric_dash_underscore_non_empty_string ->
  unit ->
  access_endpoint

val make_access_endpoint_config :
  ?internet_fallback_protocols:internet_fallback_protocol_list ->
  access_endpoints:access_endpoint_list ->
  unit ->
  access_endpoint_config

val make_account_modification :
  ?modification_state:dedicated_tenancy_modification_state_enum ->
  ?dedicated_tenancy_support:dedicated_tenancy_support_result_enum ->
  ?dedicated_tenancy_management_cidr_range:dedicated_tenancy_management_cidr_range ->
  ?start_time:timestamp ->
  ?error_code:workspace_error_code ->
  ?error_message:description ->
  unit ->
  account_modification

val make_active_directory_config :
  domain_name:domain_name ->
  service_account_secret_arn:secrets_manager_arn ->
  unit ->
  active_directory_config

val make_association_state_reason :
  ?error_code:association_error_code ->
  ?error_message:string2048 ->
  unit ->
  association_state_reason

val make_application_resource_association :
  ?application_id:work_space_application_id ->
  ?associated_resource_id:non_empty_string ->
  ?associated_resource_type:application_associated_resource_type ->
  ?created:timestamp ->
  ?last_updated_time:timestamp ->
  ?state:association_state ->
  ?state_reason:association_state_reason ->
  unit ->
  application_resource_association

val make_application_settings_request :
  ?settings_group:settings_group ->
  status:application_settings_status_enum ->
  unit ->
  application_settings_request

val make_application_settings_response :
  ?settings_group:settings_group ->
  ?s3_bucket_name:s3_bucket_name ->
  status:application_settings_status_enum ->
  unit ->
  application_settings_response

val make_associate_connection_alias_request :
  alias_id:connection_alias_id ->
  resource_id:non_empty_string ->
  unit ->
  associate_connection_alias_request

val make_associate_ip_groups_request :
  directory_id:directory_id -> group_ids:ip_group_id_list -> unit -> associate_ip_groups_request

val make_workspace_resource_association :
  ?associated_resource_id:non_empty_string ->
  ?associated_resource_type:work_space_associated_resource_type ->
  ?created:timestamp ->
  ?last_updated_time:timestamp ->
  ?state:association_state ->
  ?state_reason:association_state_reason ->
  ?workspace_id:workspace_id ->
  unit ->
  workspace_resource_association

val make_associate_workspace_application_request :
  workspace_id:workspace_id ->
  application_id:work_space_application_id ->
  unit ->
  associate_workspace_application_request

val make_ip_rule_item : ?ip_rule:ip_rule -> ?rule_desc:ip_rule_desc -> unit -> ip_rule_item

val make_authorize_ip_rules_request :
  group_id:ip_group_id -> user_rules:ip_rule_list -> unit -> authorize_ip_rules_request

val make_compute_type : ?name:compute -> unit -> compute_type
val make_user_storage : capacity:non_empty_string -> unit -> user_storage
val make_root_storage : capacity:non_empty_string -> unit -> root_storage

val make_workspace_bundle :
  ?bundle_id:bundle_id ->
  ?name:non_empty_string ->
  ?owner:bundle_owner ->
  ?description:description ->
  ?image_id:workspace_image_id ->
  ?root_storage:root_storage ->
  ?user_storage:user_storage ->
  ?compute_type:compute_type ->
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?state:workspace_bundle_state ->
  ?bundle_type:bundle_type ->
  unit ->
  workspace_bundle

val make_bundle_resource_association :
  ?associated_resource_id:non_empty_string ->
  ?associated_resource_type:bundle_associated_resource_type ->
  ?bundle_id:bundle_id ->
  ?created:timestamp ->
  ?last_updated_time:timestamp ->
  ?state:association_state ->
  ?state_reason:association_state_reason ->
  unit ->
  bundle_resource_association

val make_capacity : desired_user_sessions:desired_user_sessions -> unit -> capacity

val make_capacity_status :
  available_user_sessions:available_user_sessions ->
  desired_user_sessions:desired_user_sessions ->
  actual_user_sessions:actual_user_sessions ->
  active_user_sessions:active_user_sessions ->
  unit ->
  capacity_status

val make_certificate_based_auth_properties :
  ?status:certificate_based_auth_status_enum ->
  ?certificate_authority_arn:certificate_authority_arn ->
  unit ->
  certificate_based_auth_properties

val make_client_properties :
  ?reconnect_enabled:reconnect_enum ->
  ?log_upload_enabled:log_upload_enum ->
  unit ->
  client_properties

val make_connect_client_add_in :
  ?add_in_id:amazon_uuid ->
  ?resource_id:directory_id ->
  ?name:add_in_name ->
  ?ur_l:add_in_url ->
  unit ->
  connect_client_add_in

val make_connection_alias_association :
  ?association_status:association_status ->
  ?associated_account_id:aws_account ->
  ?resource_id:non_empty_string ->
  ?connection_identifier:connection_identifier ->
  unit ->
  connection_alias_association

val make_connection_alias :
  ?connection_string:connection_string ->
  ?alias_id:connection_alias_id ->
  ?state:connection_alias_state ->
  ?owner_account_id:aws_account ->
  ?associations:connection_alias_association_list ->
  unit ->
  connection_alias

val make_connection_alias_permission :
  shared_account_id:aws_account ->
  allow_association:boolean_object ->
  unit ->
  connection_alias_permission

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_copy_workspace_image_request :
  ?description:workspace_image_description ->
  ?tags:tag_list ->
  name:workspace_image_name ->
  source_image_id:workspace_image_id ->
  source_region:region ->
  unit ->
  copy_workspace_image_request

val make_create_account_link_invitation_request :
  ?client_token:client_token ->
  target_account_id:aws_account ->
  unit ->
  create_account_link_invitation_request

val make_create_connect_client_add_in_request :
  resource_id:directory_id ->
  name:add_in_name ->
  ur_l:add_in_url ->
  unit ->
  create_connect_client_add_in_request

val make_create_connection_alias_request :
  ?tags:tag_list -> connection_string:connection_string -> unit -> create_connection_alias_request

val make_create_ip_group_request :
  ?group_desc:ip_group_desc ->
  ?user_rules:ip_rule_list ->
  ?tags:tag_list ->
  group_name:ip_group_name ->
  unit ->
  create_ip_group_request

val make_pending_create_standby_workspaces_request :
  ?user_name:user_name ->
  ?directory_id:directory_id ->
  ?state:workspace_state ->
  ?workspace_id:workspace_id ->
  unit ->
  pending_create_standby_workspaces_request

val make_standby_workspace :
  ?volume_encryption_key:volume_encryption_key ->
  ?tags:tag_list ->
  ?data_replication:data_replication ->
  primary_workspace_id:workspace_id ->
  directory_id:directory_id ->
  unit ->
  standby_workspace

val make_failed_create_standby_workspaces_request :
  ?standby_workspace_request:standby_workspace ->
  ?error_code:workspace_error_code ->
  ?error_message:description ->
  unit ->
  failed_create_standby_workspaces_request

val make_create_standby_workspaces_request :
  primary_region:region ->
  standby_workspaces:standby_workspaces_list ->
  unit ->
  create_standby_workspaces_request

val make_create_tags_request :
  resource_id:non_empty_string -> tags:tag_list -> unit -> create_tags_request

val make_create_updated_workspace_image_request :
  ?tags:tag_list ->
  name:workspace_image_name ->
  description:workspace_image_description ->
  source_image_id:workspace_image_id ->
  unit ->
  create_updated_workspace_image_request

val make_create_workspace_bundle_request :
  ?root_storage:root_storage ->
  ?tags:tag_list ->
  bundle_name:workspace_bundle_name ->
  bundle_description:workspace_bundle_description ->
  image_id:workspace_image_id ->
  compute_type:compute_type ->
  user_storage:user_storage ->
  unit ->
  create_workspace_bundle_request

val make_operating_system : ?type_:operating_system_type -> unit -> operating_system

val make_create_workspace_image_request :
  ?tags:tag_list ->
  name:workspace_image_name ->
  description:workspace_image_description ->
  workspace_id:workspace_id ->
  unit ->
  create_workspace_image_request

val make_standby_workspaces_properties :
  ?standby_workspace_id:workspace_id ->
  ?data_replication:data_replication ->
  ?recovery_snapshot_time:timestamp ->
  unit ->
  standby_workspaces_properties

val make_data_replication_settings :
  ?data_replication:data_replication ->
  ?recovery_snapshot_time:timestamp ->
  unit ->
  data_replication_settings

val make_related_workspace_properties :
  ?workspace_id:workspace_id ->
  ?region:region ->
  ?state:workspace_state ->
  ?type_:standby_workspace_relationship_type ->
  unit ->
  related_workspace_properties

val make_modification_state :
  ?resource:modification_resource_enum ->
  ?state:modification_state_enum ->
  unit ->
  modification_state

val make_global_accelerator_for_work_space :
  ?preferred_protocol:aga_preferred_protocol_for_work_space ->
  mode:aga_mode_for_work_space_enum ->
  unit ->
  global_accelerator_for_work_space

val make_workspace_properties :
  ?running_mode:running_mode ->
  ?running_mode_auto_stop_timeout_in_minutes:running_mode_auto_stop_timeout_in_minutes ->
  ?root_volume_size_gib:root_volume_size_gib ->
  ?user_volume_size_gib:user_volume_size_gib ->
  ?compute_type_name:compute ->
  ?protocols:protocol_list ->
  ?operating_system_name:operating_system_name ->
  ?global_accelerator:global_accelerator_for_work_space ->
  unit ->
  workspace_properties

val make_workspace :
  ?workspace_id:workspace_id ->
  ?directory_id:directory_id ->
  ?user_name:user_name ->
  ?ip_address:ip_address ->
  ?ipv6_address:ipv6_address ->
  ?state:workspace_state ->
  ?bundle_id:bundle_id ->
  ?subnet_id:subnet_id ->
  ?error_message:description ->
  ?error_code:workspace_error_code ->
  ?computer_name:computer_name ->
  ?volume_encryption_key:volume_encryption_key ->
  ?user_volume_encryption_enabled:boolean_object ->
  ?root_volume_encryption_enabled:boolean_object ->
  ?workspace_name:workspace_name ->
  ?workspace_properties:workspace_properties ->
  ?modification_states:modification_state_list ->
  ?related_workspaces:related_workspaces ->
  ?data_replication_settings:data_replication_settings ->
  ?standby_workspaces_properties:standby_workspaces_properties_list ->
  unit ->
  workspace

val make_workspace_request :
  ?volume_encryption_key:volume_encryption_key ->
  ?user_volume_encryption_enabled:boolean_object ->
  ?root_volume_encryption_enabled:boolean_object ->
  ?workspace_properties:workspace_properties ->
  ?tags:tag_list ->
  ?workspace_name:workspace_name ->
  ?ipv6_address:ipv6_address ->
  directory_id:directory_id ->
  user_name:user_name ->
  bundle_id:bundle_id ->
  unit ->
  workspace_request

val make_failed_create_workspace_request :
  ?workspace_request:workspace_request ->
  ?error_code:error_type ->
  ?error_message:description ->
  unit ->
  failed_create_workspace_request

val make_create_workspaces_request :
  workspaces:workspace_request_list -> unit -> create_workspaces_request

val make_timeout_settings :
  ?disconnect_timeout_in_seconds:disconnect_timeout_in_seconds ->
  ?idle_disconnect_timeout_in_seconds:idle_disconnect_timeout_in_seconds ->
  ?max_user_duration_in_seconds:max_user_duration_in_seconds ->
  unit ->
  timeout_settings

val make_workspaces_pool_error :
  ?error_code:workspaces_pool_error_code ->
  ?error_message:error_message ->
  unit ->
  workspaces_pool_error

val make_workspaces_pool :
  ?description:update_description ->
  ?errors:workspaces_pool_errors ->
  ?application_settings:application_settings_response ->
  ?timeout_settings:timeout_settings ->
  pool_id:workspaces_pool_id ->
  pool_arn:ar_n ->
  capacity_status:capacity_status ->
  pool_name:workspaces_pool_name ->
  state:workspaces_pool_state ->
  created_at:timestamp ->
  bundle_id:bundle_id ->
  directory_id:directory_id ->
  running_mode:pools_running_mode ->
  unit ->
  workspaces_pool

val make_create_workspaces_pool_request :
  ?tags:tag_list ->
  ?application_settings:application_settings_request ->
  ?timeout_settings:timeout_settings ->
  ?running_mode:pools_running_mode ->
  pool_name:workspaces_pool_name ->
  description:update_description ->
  bundle_id:bundle_id ->
  directory_id:directory_id ->
  capacity:capacity ->
  unit ->
  create_workspaces_pool_request

val make_custom_workspace_image_import_error_details :
  ?error_code:error_code ->
  ?error_message:image_error_message ->
  unit ->
  custom_workspace_image_import_error_details

val make_default_client_branding_attributes :
  ?logo_url:client_url ->
  ?support_email:client_email ->
  ?support_link:client_url ->
  ?forgot_password_link:client_url ->
  ?login_message:login_message ->
  unit ->
  default_client_branding_attributes

val make_default_import_client_branding_attributes :
  ?logo:default_logo ->
  ?support_email:client_email ->
  ?support_link:client_url ->
  ?forgot_password_link:client_url ->
  ?login_message:login_message ->
  unit ->
  default_import_client_branding_attributes

val make_default_workspace_creation_properties :
  ?enable_internet_access:boolean_object ->
  ?default_ou:default_ou ->
  ?custom_security_group_id:security_group_id ->
  ?user_enabled_as_local_administrator:boolean_object ->
  ?enable_maintenance_mode:boolean_object ->
  ?instance_iam_role_arn:ar_n ->
  unit ->
  default_workspace_creation_properties

val make_delete_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> delete_account_link_invitation_request

val make_delete_client_branding_request :
  resource_id:directory_id ->
  platforms:client_device_type_list ->
  unit ->
  delete_client_branding_request

val make_delete_connect_client_add_in_request :
  add_in_id:amazon_uuid -> resource_id:directory_id -> unit -> delete_connect_client_add_in_request

val make_delete_connection_alias_request :
  alias_id:connection_alias_id -> unit -> delete_connection_alias_request

val make_delete_ip_group_request : group_id:ip_group_id -> unit -> delete_ip_group_request

val make_delete_tags_request :
  resource_id:non_empty_string -> tag_keys:tag_key_list -> unit -> delete_tags_request

val make_delete_workspace_bundle_request :
  ?bundle_id:bundle_id -> unit -> delete_workspace_bundle_request

val make_delete_workspace_image_request :
  image_id:workspace_image_id -> unit -> delete_workspace_image_request

val make_work_space_application_deployment :
  ?associations:workspace_resource_association_list -> unit -> work_space_application_deployment

val make_deploy_workspace_applications_request :
  ?force:boolean_object ->
  workspace_id:workspace_id ->
  unit ->
  deploy_workspace_applications_request

val make_deregister_workspace_directory_request :
  directory_id:directory_id -> unit -> deregister_workspace_directory_request

val make_describe_account_request : unit -> unit

val make_describe_account_modifications_request :
  ?next_token:pagination_token -> unit -> describe_account_modifications_request

val make_describe_application_associations_request :
  ?max_results:limit ->
  ?next_token:pagination_token ->
  application_id:work_space_application_id ->
  associated_resource_types:application_associated_resource_type_list ->
  unit ->
  describe_application_associations_request

val make_work_space_application :
  ?application_id:work_space_application_id ->
  ?created:timestamp ->
  ?description:string2048 ->
  ?license_type:work_space_application_license_type ->
  ?name:non_empty_string ->
  ?owner:work_space_application_owner ->
  ?state:work_space_application_state ->
  ?supported_compute_type_names:compute_list ->
  ?supported_operating_system_names:operating_system_name_list ->
  unit ->
  work_space_application

val make_describe_applications_request :
  ?application_ids:work_space_application_id_list ->
  ?compute_type_names:compute_list ->
  ?license_type:work_space_application_license_type ->
  ?operating_system_names:operating_system_name_list ->
  ?owner:work_space_application_owner ->
  ?max_results:limit ->
  ?next_token:pagination_token ->
  unit ->
  describe_applications_request

val make_describe_bundle_associations_request :
  bundle_id:bundle_id ->
  associated_resource_types:bundle_associated_resource_type_list ->
  unit ->
  describe_bundle_associations_request

val make_ios_client_branding_attributes :
  ?logo_url:client_url ->
  ?logo2x_url:client_url ->
  ?logo3x_url:client_url ->
  ?support_email:client_email ->
  ?support_link:client_url ->
  ?forgot_password_link:client_url ->
  ?login_message:login_message ->
  unit ->
  ios_client_branding_attributes

val make_describe_client_branding_request :
  resource_id:directory_id -> unit -> describe_client_branding_request

val make_describe_client_properties_request :
  resource_ids:resource_id_list -> unit -> describe_client_properties_request

val make_describe_connect_client_add_ins_request :
  ?next_token:pagination_token ->
  ?max_results:limit ->
  resource_id:directory_id ->
  unit ->
  describe_connect_client_add_ins_request

val make_describe_connection_alias_permissions_request :
  ?next_token:pagination_token ->
  ?max_results:limit ->
  alias_id:connection_alias_id ->
  unit ->
  describe_connection_alias_permissions_request

val make_describe_connection_aliases_request :
  ?alias_ids:connection_alias_id_list ->
  ?resource_id:non_empty_string ->
  ?limit:limit ->
  ?next_token:pagination_token ->
  unit ->
  describe_connection_aliases_request

val make_describe_custom_workspace_image_import_request :
  image_id:workspace_image_id -> unit -> describe_custom_workspace_image_import_request

val make_image_resource_association :
  ?associated_resource_id:non_empty_string ->
  ?associated_resource_type:image_associated_resource_type ->
  ?created:timestamp ->
  ?last_updated_time:timestamp ->
  ?image_id:workspace_image_id ->
  ?state:association_state ->
  ?state_reason:association_state_reason ->
  unit ->
  image_resource_association

val make_describe_image_associations_request :
  image_id:workspace_image_id ->
  associated_resource_types:image_associated_resource_type_list ->
  unit ->
  describe_image_associations_request

val make_workspaces_ip_group :
  ?group_id:ip_group_id ->
  ?group_name:ip_group_name ->
  ?group_desc:ip_group_desc ->
  ?user_rules:ip_rule_list ->
  unit ->
  workspaces_ip_group

val make_describe_ip_groups_request :
  ?group_ids:ip_group_id_list ->
  ?next_token:pagination_token ->
  ?max_results:limit ->
  unit ->
  describe_ip_groups_request

val make_describe_tags_request : resource_id:non_empty_string -> unit -> describe_tags_request

val make_describe_workspace_associations_request :
  workspace_id:workspace_id ->
  associated_resource_types:work_space_associated_resource_type_list ->
  unit ->
  describe_workspace_associations_request

val make_describe_workspace_bundles_request :
  ?bundle_ids:bundle_id_list ->
  ?owner:bundle_owner ->
  ?next_token:pagination_token ->
  unit ->
  describe_workspace_bundles_request

val make_global_accelerator_for_directory :
  ?preferred_protocol:aga_preferred_protocol_for_directory ->
  mode:aga_mode_for_directory_enum ->
  unit ->
  global_accelerator_for_directory

val make_storage_connector :
  connector_type:storage_connector_type_enum ->
  status:storage_connector_status_enum ->
  unit ->
  storage_connector

val make_user_setting :
  ?maximum_length:maximum_length ->
  action:user_setting_action_enum ->
  permission:user_setting_permission_enum ->
  unit ->
  user_setting

val make_streaming_properties :
  ?streaming_experience_preferred_protocol:streaming_experience_preferred_protocol_enum ->
  ?user_settings:user_settings ->
  ?storage_connectors:storage_connectors ->
  ?global_accelerator:global_accelerator_for_directory ->
  unit ->
  streaming_properties

val make_idc_config : ?instance_arn:ar_n -> ?application_arn:ar_n -> unit -> idc_config

val make_microsoft_entra_config :
  ?tenant_id:microsoft_entra_config_tenant_id ->
  ?application_config_secret_arn:secrets_manager_arn ->
  unit ->
  microsoft_entra_config

val make_saml_properties :
  ?status:saml_status_enum ->
  ?user_access_url:saml_user_access_url ->
  ?relay_state_parameter_name:non_empty_string ->
  unit ->
  saml_properties

val make_selfservice_permissions :
  ?restart_workspace:reconnect_enum ->
  ?increase_volume_size:reconnect_enum ->
  ?change_compute_type:reconnect_enum ->
  ?switch_running_mode:reconnect_enum ->
  ?rebuild_workspace:reconnect_enum ->
  unit ->
  selfservice_permissions

val make_workspace_access_properties :
  ?device_type_windows:access_property_value ->
  ?device_type_osx:access_property_value ->
  ?device_type_web:access_property_value ->
  ?device_type_ios:access_property_value ->
  ?device_type_android:access_property_value ->
  ?device_type_chrome_os:access_property_value ->
  ?device_type_zero_client:access_property_value ->
  ?device_type_linux:access_property_value ->
  ?device_type_work_spaces_thin_client:access_property_value ->
  ?access_endpoint_config:access_endpoint_config ->
  unit ->
  workspace_access_properties

val make_workspace_directory :
  ?directory_id:directory_id ->
  ?alias:alias ->
  ?directory_name:directory_name ->
  ?registration_code:registration_code ->
  ?subnet_ids:subnet_ids ->
  ?dns_ip_addresses:dns_ip_addresses ->
  ?dns_ipv6_addresses:dns_ipv6_addresses ->
  ?customer_user_name:user_name ->
  ?iam_role_id:ar_n ->
  ?directory_type:workspace_directory_type ->
  ?workspace_security_group_id:security_group_id ->
  ?state:workspace_directory_state ->
  ?workspace_creation_properties:default_workspace_creation_properties ->
  ?ip_group_ids:ip_group_id_list ->
  ?workspace_access_properties:workspace_access_properties ->
  ?tenancy:tenancy ->
  ?selfservice_permissions:selfservice_permissions ->
  ?saml_properties:saml_properties ->
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?endpoint_encryption_mode:endpoint_encryption_mode ->
  ?microsoft_entra_config:microsoft_entra_config ->
  ?workspace_directory_name:workspace_directory_name ->
  ?workspace_directory_description:workspace_directory_description ->
  ?user_identity_type:user_identity_type ->
  ?workspace_type:workspace_type ->
  ?idc_config:idc_config ->
  ?active_directory_config:active_directory_config ->
  ?streaming_properties:streaming_properties ->
  ?error_message:description ->
  unit ->
  workspace_directory

val make_describe_workspace_directories_filter :
  name:describe_workspace_directories_filter_name ->
  values:describe_workspace_directories_filter_values ->
  unit ->
  describe_workspace_directories_filter

val make_describe_workspace_directories_request :
  ?directory_ids:directory_id_list ->
  ?workspace_directory_names:workspace_directory_name_list ->
  ?limit:limit ->
  ?next_token:pagination_token ->
  ?filters:describe_workspace_directories_filter_list ->
  unit ->
  describe_workspace_directories_request

val make_image_permission : ?shared_account_id:aws_account -> unit -> image_permission

val make_describe_workspace_image_permissions_request :
  ?next_token:pagination_token ->
  ?max_results:limit ->
  image_id:workspace_image_id ->
  unit ->
  describe_workspace_image_permissions_request

val make_error_details :
  ?error_code:workspace_image_error_detail_code ->
  ?error_message:description ->
  unit ->
  error_details

val make_workspace_image :
  ?image_id:workspace_image_id ->
  ?name:workspace_image_name ->
  ?description:workspace_image_description ->
  ?operating_system:operating_system ->
  ?state:workspace_image_state ->
  ?required_tenancy:workspace_image_required_tenancy ->
  ?error_code:workspace_image_error_code ->
  ?error_message:description ->
  ?created:timestamp ->
  ?owner_account_id:aws_account ->
  ?updates:update_result ->
  ?error_details:error_details_list ->
  unit ->
  workspace_image

val make_describe_workspace_images_request :
  ?image_ids:workspace_image_id_list ->
  ?image_type:image_type ->
  ?next_token:pagination_token ->
  ?max_results:limit ->
  unit ->
  describe_workspace_images_request

val make_snapshot : ?snapshot_time:timestamp -> unit -> snapshot

val make_describe_workspace_snapshots_request :
  workspace_id:workspace_id -> unit -> describe_workspace_snapshots_request

val make_describe_workspaces_request :
  ?workspace_ids:workspace_id_list ->
  ?directory_id:directory_id ->
  ?user_name:user_name ->
  ?bundle_id:bundle_id ->
  ?limit:limit ->
  ?next_token:pagination_token ->
  ?workspace_name:workspace_name ->
  unit ->
  describe_workspaces_request

val make_workspace_connection_status :
  ?workspace_id:workspace_id ->
  ?connection_state:connection_state ->
  ?connection_state_check_timestamp:timestamp ->
  ?last_known_user_connection_timestamp:timestamp ->
  unit ->
  workspace_connection_status

val make_describe_workspaces_connection_status_request :
  ?workspace_ids:workspace_id_list ->
  ?next_token:pagination_token ->
  unit ->
  describe_workspaces_connection_status_request

val make_network_access_configuration :
  ?eni_private_ip_address:non_empty_string ->
  ?eni_id:non_empty_string ->
  unit ->
  network_access_configuration

val make_workspaces_pool_session :
  ?authentication_type:authentication_type ->
  ?connection_state:session_connection_state ->
  ?instance_id:session_instance_id ->
  ?expiration_time:timestamp ->
  ?network_access_configuration:network_access_configuration ->
  ?start_time:timestamp ->
  session_id:amazon_uuid ->
  pool_id:workspaces_pool_id ->
  user_id:workspaces_pool_user_id ->
  unit ->
  workspaces_pool_session

val make_describe_workspaces_pool_sessions_request :
  ?user_id:workspaces_pool_user_id ->
  ?limit:limit50 ->
  ?next_token:pagination_token ->
  pool_id:workspaces_pool_id ->
  unit ->
  describe_workspaces_pool_sessions_request

val make_describe_workspaces_pools_filter :
  name:describe_workspaces_pools_filter_name ->
  values:describe_workspaces_pools_filter_values ->
  operator:describe_workspaces_pools_filter_operator ->
  unit ->
  describe_workspaces_pools_filter

val make_describe_workspaces_pools_request :
  ?pool_ids:workspaces_pool_ids ->
  ?filters:describe_workspaces_pools_filters ->
  ?limit:limit ->
  ?next_token:pagination_token ->
  unit ->
  describe_workspaces_pools_request

val make_disassociate_connection_alias_request :
  alias_id:connection_alias_id -> unit -> disassociate_connection_alias_request

val make_disassociate_ip_groups_request :
  directory_id:directory_id -> group_ids:ip_group_id_list -> unit -> disassociate_ip_groups_request

val make_disassociate_workspace_application_request :
  workspace_id:workspace_id ->
  application_id:work_space_application_id ->
  unit ->
  disassociate_workspace_application_request

val make_failed_workspace_change_request :
  ?workspace_id:workspace_id ->
  ?error_code:error_type ->
  ?error_message:description ->
  unit ->
  failed_workspace_change_request

val make_get_account_link_request :
  ?link_id:link_id -> ?linked_account_id:aws_account -> unit -> get_account_link_request

val make_ios_import_client_branding_attributes :
  ?logo:ios_logo ->
  ?logo2x:ios2_x_logo ->
  ?logo3x:ios3_x_logo ->
  ?support_email:client_email ->
  ?support_link:client_url ->
  ?forgot_password_link:client_url ->
  ?login_message:login_message ->
  unit ->
  ios_import_client_branding_attributes

val make_import_client_branding_request :
  ?device_type_windows:default_import_client_branding_attributes ->
  ?device_type_osx:default_import_client_branding_attributes ->
  ?device_type_android:default_import_client_branding_attributes ->
  ?device_type_ios:ios_import_client_branding_attributes ->
  ?device_type_linux:default_import_client_branding_attributes ->
  ?device_type_web:default_import_client_branding_attributes ->
  resource_id:directory_id ->
  unit ->
  import_client_branding_request

val make_import_custom_workspace_image_request :
  ?tags:tag_list ->
  image_name:workspace_image_name ->
  image_description:workspace_image_description ->
  compute_type:image_compute_type ->
  protocol:custom_image_protocol ->
  image_source:image_source_identifier ->
  infrastructure_configuration_arn:infrastructure_configuration_arn ->
  platform:platform ->
  os_version:os_version ->
  unit ->
  import_custom_workspace_image_request

val make_import_workspace_image_request :
  ?tags:tag_list ->
  ?applications:application_list ->
  ec2_image_id:ec2_image_id ->
  ingestion_process:workspace_image_ingestion_process ->
  image_name:workspace_image_name ->
  image_description:workspace_image_description ->
  unit ->
  import_workspace_image_request

val make_list_account_links_request :
  ?link_status_filter:link_status_filter_list ->
  ?next_token:pagination_token ->
  ?max_results:limit ->
  unit ->
  list_account_links_request

val make_list_available_management_cidr_ranges_request :
  ?max_results:management_cidr_range_max_results ->
  ?next_token:pagination_token ->
  management_cidr_range_constraint:management_cidr_range_constraint ->
  unit ->
  list_available_management_cidr_ranges_request

val make_migrate_workspace_request :
  source_workspace_id:workspace_id -> bundle_id:bundle_id -> unit -> migrate_workspace_request

val make_modify_account_request :
  ?dedicated_tenancy_support:dedicated_tenancy_support_enum ->
  ?dedicated_tenancy_management_cidr_range:dedicated_tenancy_management_cidr_range ->
  unit ->
  modify_account_request

val make_modify_certificate_based_auth_properties_request :
  ?certificate_based_auth_properties:certificate_based_auth_properties ->
  ?properties_to_delete:deletable_certificate_based_auth_properties_list ->
  resource_id:directory_id ->
  unit ->
  modify_certificate_based_auth_properties_request

val make_modify_client_properties_request :
  resource_id:non_empty_string ->
  client_properties:client_properties ->
  unit ->
  modify_client_properties_request

val make_modify_endpoint_encryption_mode_response : unit -> unit

val make_modify_endpoint_encryption_mode_request :
  directory_id:directory_id ->
  endpoint_encryption_mode:endpoint_encryption_mode ->
  unit ->
  modify_endpoint_encryption_mode_request

val make_modify_saml_properties_request :
  ?saml_properties:saml_properties ->
  ?properties_to_delete:deletable_saml_properties_list ->
  resource_id:directory_id ->
  unit ->
  modify_saml_properties_request

val make_modify_selfservice_permissions_request :
  resource_id:directory_id ->
  selfservice_permissions:selfservice_permissions ->
  unit ->
  modify_selfservice_permissions_request

val make_modify_streaming_properties_request :
  ?streaming_properties:streaming_properties ->
  resource_id:directory_id ->
  unit ->
  modify_streaming_properties_request

val make_modify_workspace_access_properties_request :
  resource_id:directory_id ->
  workspace_access_properties:workspace_access_properties ->
  unit ->
  modify_workspace_access_properties_request

val make_workspace_creation_properties :
  ?enable_internet_access:boolean_object ->
  ?default_ou:default_ou ->
  ?custom_security_group_id:security_group_id ->
  ?user_enabled_as_local_administrator:boolean_object ->
  ?enable_maintenance_mode:boolean_object ->
  ?instance_iam_role_arn:ar_n ->
  unit ->
  workspace_creation_properties

val make_modify_workspace_creation_properties_request :
  resource_id:directory_id ->
  workspace_creation_properties:workspace_creation_properties ->
  unit ->
  modify_workspace_creation_properties_request

val make_modify_workspace_properties_request :
  ?workspace_properties:workspace_properties ->
  ?data_replication:data_replication ->
  workspace_id:workspace_id ->
  unit ->
  modify_workspace_properties_request

val make_modify_workspace_state_request :
  workspace_id:workspace_id ->
  workspace_state:target_workspace_state ->
  unit ->
  modify_workspace_state_request

val make_reboot_request : workspace_id:workspace_id -> unit -> reboot_request

val make_reboot_workspaces_request :
  reboot_workspace_requests:reboot_workspace_requests -> unit -> reboot_workspaces_request

val make_rebuild_request : workspace_id:workspace_id -> unit -> rebuild_request

val make_rebuild_workspaces_request :
  rebuild_workspace_requests:rebuild_workspace_requests -> unit -> rebuild_workspaces_request

val make_register_workspace_directory_request :
  ?directory_id:directory_id ->
  ?subnet_ids:subnet_ids ->
  ?enable_self_service:boolean_object ->
  ?tenancy:tenancy ->
  ?tags:tag_list ->
  ?workspace_directory_name:workspace_directory_name ->
  ?workspace_directory_description:workspace_directory_description ->
  ?user_identity_type:user_identity_type ->
  ?idc_instance_arn:ar_n ->
  ?microsoft_entra_config:microsoft_entra_config ->
  ?workspace_type:workspace_type ->
  ?active_directory_config:active_directory_config ->
  unit ->
  register_workspace_directory_request

val make_reject_account_link_invitation_request :
  ?client_token:client_token -> link_id:link_id -> unit -> reject_account_link_invitation_request

val make_restore_workspace_request : workspace_id:workspace_id -> unit -> restore_workspace_request

val make_revoke_ip_rules_request :
  group_id:ip_group_id -> user_rules:ip_revoked_rule_list -> unit -> revoke_ip_rules_request

val make_start_request : ?workspace_id:workspace_id -> unit -> start_request

val make_start_workspaces_request :
  start_workspace_requests:start_workspace_requests -> unit -> start_workspaces_request

val make_start_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> start_workspaces_pool_request

val make_stop_request : ?workspace_id:workspace_id -> unit -> stop_request

val make_stop_workspaces_request :
  stop_workspace_requests:stop_workspace_requests -> unit -> stop_workspaces_request

val make_stop_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> stop_workspaces_pool_request

val make_terminate_request : workspace_id:workspace_id -> unit -> terminate_request

val make_terminate_workspaces_request :
  terminate_workspace_requests:terminate_workspace_requests -> unit -> terminate_workspaces_request

val make_terminate_workspaces_pool_request :
  pool_id:workspaces_pool_id -> unit -> terminate_workspaces_pool_request

val make_terminate_workspaces_pool_session_request :
  session_id:amazon_uuid -> unit -> terminate_workspaces_pool_session_request

val make_update_connect_client_add_in_request :
  ?name:add_in_name ->
  ?ur_l:add_in_url ->
  add_in_id:amazon_uuid ->
  resource_id:directory_id ->
  unit ->
  update_connect_client_add_in_request

val make_update_connection_alias_permission_request :
  alias_id:connection_alias_id ->
  connection_alias_permission:connection_alias_permission ->
  unit ->
  update_connection_alias_permission_request

val make_update_rules_of_ip_group_request :
  group_id:ip_group_id -> user_rules:ip_rule_list -> unit -> update_rules_of_ip_group_request

val make_update_workspace_bundle_request :
  ?bundle_id:bundle_id -> ?image_id:workspace_image_id -> unit -> update_workspace_bundle_request

val make_update_workspace_image_permission_request :
  image_id:workspace_image_id ->
  allow_copy_image:boolean_object ->
  shared_account_id:aws_account ->
  unit ->
  update_workspace_image_permission_request

val make_update_workspaces_pool_request :
  ?description:update_description ->
  ?bundle_id:bundle_id ->
  ?directory_id:directory_id ->
  ?capacity:capacity ->
  ?application_settings:application_settings_request ->
  ?timeout_settings:timeout_settings ->
  ?running_mode:pools_running_mode ->
  pool_id:workspaces_pool_id ->
  unit ->
  update_workspaces_pool_request
