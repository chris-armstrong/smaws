open Types

val make_verify_trust_request : trust_id:trust_id -> unit -> verify_trust_request
val make_os_update_settings : ?os_version:os_version -> unit -> os_update_settings
val make_update_value : ?os_update_settings:os_update_settings -> unit -> update_value

val make_update_trust_request :
  ?selective_auth:selective_auth -> trust_id:trust_id -> unit -> update_trust_request

val make_setting :
  value:directory_configuration_setting_value ->
  name:directory_configuration_setting_name ->
  unit ->
  setting

val make_update_settings_request :
  settings:settings -> directory_id:directory_id -> unit -> update_settings_request

val make_radius_settings :
  ?use_same_username:use_same_username ->
  ?display_label:radius_display_label ->
  ?authentication_protocol:radius_authentication_protocol ->
  ?shared_secret:radius_shared_secret ->
  ?radius_retries:radius_retries ->
  ?radius_timeout:radius_timeout ->
  ?radius_port:port_number ->
  ?radius_servers_ipv6:servers ->
  ?radius_servers:servers ->
  unit ->
  radius_settings

val make_update_radius_request :
  radius_settings:radius_settings -> directory_id:directory_id -> unit -> update_radius_request

val make_update_number_of_domain_controllers_request :
  desired_number:desired_number_of_domain_controllers ->
  directory_id:directory_id ->
  unit ->
  update_number_of_domain_controllers_request

val make_update_info_entry :
  ?last_updated_date_time:last_updated_date_time ->
  ?start_time:start_date_time ->
  ?previous_value:update_value ->
  ?new_value:update_value ->
  ?initiated_by:initiated_by ->
  ?status_reason:update_status_reason ->
  ?status:update_status ->
  ?region:region_name ->
  unit ->
  update_info_entry

val make_hybrid_administrator_account_update :
  secret_arn:secret_arn -> unit -> hybrid_administrator_account_update

val make_hybrid_customer_instances_settings :
  instance_ids:assessment_instance_ids ->
  customer_dns_ips:customer_dns_ips ->
  unit ->
  hybrid_customer_instances_settings

val make_update_hybrid_ad_request :
  ?self_managed_instances_settings:hybrid_customer_instances_settings ->
  ?hybrid_administrator_account_update:hybrid_administrator_account_update ->
  directory_id:directory_id ->
  unit ->
  update_hybrid_ad_request

val make_directory_size_update_settings :
  ?directory_size:directory_size -> unit -> directory_size_update_settings

val make_network_update_settings :
  ?customer_dns_ips_v6:dns_ipv6_addrs ->
  ?network_type:network_type ->
  unit ->
  network_update_settings

val make_update_directory_setup_request :
  ?create_snapshot_before_update:create_snapshot_before_update ->
  ?network_update_settings:network_update_settings ->
  ?directory_size_update_settings:directory_size_update_settings ->
  ?os_update_settings:os_update_settings ->
  update_type:update_type ->
  directory_id:directory_id ->
  unit ->
  update_directory_setup_request

val make_update_conditional_forwarder_request :
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?dns_ip_addrs:dns_ip_addrs ->
  remote_domain_name:remote_domain_name ->
  directory_id:directory_id ->
  unit ->
  update_conditional_forwarder_request

val make_unshare_target : type_:target_type -> id:target_id -> unit -> unshare_target

val make_unshare_directory_request :
  unshare_target:unshare_target -> directory_id:directory_id -> unit -> unshare_directory_request

val make_trust :
  ?selective_auth:selective_auth ->
  ?trust_state_reason:trust_state_reason ->
  ?state_last_updated_date_time:state_last_updated_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  ?created_date_time:created_date_time ->
  ?trust_state:trust_state ->
  ?trust_direction:trust_direction ->
  ?trust_type:trust_type ->
  ?remote_domain_name:remote_domain_name ->
  ?trust_id:trust_id ->
  ?directory_id:directory_id ->
  unit ->
  trust

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_start_schema_extension_request :
  description:description ->
  ldif_content:ldif_content ->
  create_snapshot_before_schema_extension:create_snapshot_before_schema_extension ->
  directory_id:directory_id ->
  unit ->
  start_schema_extension_request

val make_directory_vpc_settings :
  subnet_ids:subnet_ids -> vpc_id:vpc_id -> unit -> directory_vpc_settings

val make_assessment_configuration :
  ?security_group_ids:security_group_ids ->
  instance_ids:assessment_instance_ids ->
  vpc_settings:directory_vpc_settings ->
  dns_name:directory_name ->
  customer_dns_ips:customer_dns_ips ->
  unit ->
  assessment_configuration

val make_start_ad_assessment_request :
  ?directory_id:directory_id ->
  ?assessment_configuration:assessment_configuration ->
  unit ->
  start_ad_assessment_request

val make_snapshot :
  ?start_time:start_time ->
  ?status:snapshot_status ->
  ?name:snapshot_name ->
  ?type_:snapshot_type ->
  ?snapshot_id:snapshot_id ->
  ?directory_id:directory_id ->
  unit ->
  snapshot

val make_snapshot_limits :
  ?manual_snapshots_limit_reached:manual_snapshots_limit_reached ->
  ?manual_snapshots_current_count:limit ->
  ?manual_snapshots_limit:limit ->
  unit ->
  snapshot_limits

val make_shared_directory :
  ?last_updated_date_time:last_updated_date_time ->
  ?created_date_time:created_date_time ->
  ?share_notes:notes ->
  ?share_status:share_status ->
  ?shared_directory_id:directory_id ->
  ?shared_account_id:customer_id ->
  ?share_method:share_method ->
  ?owner_directory_id:directory_id ->
  ?owner_account_id:customer_id ->
  unit ->
  shared_directory

val make_share_target : type_:target_type -> id:target_id -> unit -> share_target

val make_share_directory_request :
  ?share_notes:notes ->
  share_method:share_method ->
  share_target:share_target ->
  directory_id:directory_id ->
  unit ->
  share_directory_request

val make_setting_entry :
  ?data_type:directory_configuration_setting_data_type ->
  ?last_requested_date_time:directory_configuration_setting_last_requested_date_time ->
  ?last_updated_date_time:directory_configuration_setting_last_updated_date_time ->
  ?request_status_message:directory_configuration_setting_request_status_message ->
  ?request_detailed_status:directory_configuration_setting_request_detailed_status ->
  ?request_status:directory_configuration_status ->
  ?requested_value:directory_configuration_setting_value ->
  ?applied_value:directory_configuration_setting_value ->
  ?allowed_values:directory_configuration_setting_allowed_values ->
  ?name:directory_configuration_setting_name ->
  ?type_:directory_configuration_setting_type ->
  unit ->
  setting_entry

val make_schema_extension_info :
  ?end_date_time:end_date_time ->
  ?start_date_time:start_date_time ->
  ?schema_extension_status_reason:schema_extension_status_reason ->
  ?schema_extension_status:schema_extension_status ->
  ?description:description ->
  ?schema_extension_id:schema_extension_id ->
  ?directory_id:directory_id ->
  unit ->
  schema_extension_info

val make_restore_from_snapshot_request :
  snapshot_id:snapshot_id -> unit -> restore_from_snapshot_request

val make_reset_user_password_request :
  new_password:user_password ->
  user_name:customer_user_name ->
  directory_id:directory_id ->
  unit ->
  reset_user_password_request

val make_remove_tags_from_resource_request :
  tag_keys:tag_keys -> resource_id:resource_id -> unit -> remove_tags_from_resource_request

val make_remove_region_request : directory_id:directory_id -> unit -> remove_region_request

val make_remove_ip_routes_request :
  ?cidr_ipv6s:cidr_ipv6s ->
  ?cidr_ips:cidr_ips ->
  directory_id:directory_id ->
  unit ->
  remove_ip_routes_request

val make_reject_shared_directory_request :
  shared_directory_id:directory_id -> unit -> reject_shared_directory_request

val make_register_event_topic_request :
  topic_name:topic_name -> directory_id:directory_id -> unit -> register_event_topic_request

val make_client_cert_auth_settings : ?ocsp_url:ocsp_url -> unit -> client_cert_auth_settings

val make_register_certificate_request :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  certificate_data:certificate_data ->
  directory_id:directory_id ->
  unit ->
  register_certificate_request

val make_regions_info :
  ?additional_regions:additional_regions -> ?primary_region:region_name -> unit -> regions_info

val make_region_description :
  ?last_updated_date_time:last_updated_date_time ->
  ?status_last_updated_date_time:state_last_updated_date_time ->
  ?launch_time:launch_time ->
  ?desired_number_of_domain_controllers:desired_number_of_domain_controllers ->
  ?vpc_settings:directory_vpc_settings ->
  ?status:directory_stage ->
  ?region_type:region_type ->
  ?region_name:region_name ->
  ?directory_id:directory_id ->
  unit ->
  region_description

val make_directory_vpc_settings_description :
  ?availability_zones:availability_zones ->
  ?security_group_id:security_group_id ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  unit ->
  directory_vpc_settings_description

val make_owner_directory_description :
  ?network_type:network_type ->
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?account_id:customer_id ->
  ?directory_id:directory_id ->
  unit ->
  owner_directory_description

val make_log_subscription :
  ?subscription_created_date_time:subscription_created_date_time ->
  ?log_group_name:log_group_name ->
  ?directory_id:directory_id ->
  unit ->
  log_subscription

val make_list_tags_for_resource_request :
  ?limit:limit ->
  ?next_token:next_token ->
  resource_id:resource_id ->
  unit ->
  list_tags_for_resource_request

val make_list_schema_extensions_request :
  ?limit:limit ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  list_schema_extensions_request

val make_list_log_subscriptions_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?directory_id:directory_id ->
  unit ->
  list_log_subscriptions_request

val make_ip_route_info :
  ?description:description ->
  ?ip_route_status_reason:ip_route_status_reason ->
  ?added_date_time:added_date_time ->
  ?ip_route_status_msg:ip_route_status_msg ->
  ?cidr_ipv6:cidr_ipv6 ->
  ?cidr_ip:cidr_ip ->
  ?directory_id:directory_id ->
  unit ->
  ip_route_info

val make_list_ip_routes_request :
  ?limit:limit ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  list_ip_routes_request

val make_certificate_info :
  ?type_:certificate_type ->
  ?expiry_date_time:certificate_expiry_date_time ->
  ?state:certificate_state ->
  ?common_name:certificate_c_n ->
  ?certificate_id:certificate_id ->
  unit ->
  certificate_info

val make_list_certificates_request :
  ?limit:page_limit ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  list_certificates_request

val make_assessment_summary :
  ?report_type:assessment_report_type ->
  ?customer_dns_ips:customer_dns_ips ->
  ?status:assessment_status ->
  ?last_update_date_time:last_update_date_time ->
  ?start_time:assessment_start_time ->
  ?dns_name:directory_name ->
  ?directory_id:directory_id ->
  ?assessment_id:assessment_id ->
  unit ->
  assessment_summary

val make_list_ad_assessments_request :
  ?limit:assessment_limit ->
  ?next_token:next_token ->
  ?directory_id:directory_id ->
  unit ->
  list_ad_assessments_request

val make_ldaps_setting_info :
  ?last_updated_date_time:last_updated_date_time ->
  ?ldaps_status_reason:ldaps_status_reason ->
  ?ldaps_status:ldaps_status ->
  unit ->
  ldaps_setting_info

val make_ip_route :
  ?description:description -> ?cidr_ipv6:cidr_ipv6 -> ?cidr_ip:cidr_ip -> unit -> ip_route

val make_hybrid_update_value :
  ?dns_ips:customer_dns_ips -> ?instance_ids:assessment_instance_ids -> unit -> hybrid_update_value

val make_hybrid_update_info_entry :
  ?assessment_id:assessment_id ->
  ?last_updated_date_time:last_updated_date_time ->
  ?start_time:start_date_time ->
  ?previous_value:hybrid_update_value ->
  ?new_value:hybrid_update_value ->
  ?initiated_by:initiated_by ->
  ?status_reason:update_status_reason ->
  ?status:update_status ->
  unit ->
  hybrid_update_info_entry

val make_hybrid_update_activities :
  ?hybrid_administrator_account:hybrid_update_info_entries ->
  ?self_managed_instances:hybrid_update_info_entries ->
  unit ->
  hybrid_update_activities

val make_hybrid_settings_description :
  ?self_managed_instance_ids:assessment_instance_ids ->
  ?self_managed_dns_ip_addrs:ip_addrs ->
  unit ->
  hybrid_settings_description

val make_get_snapshot_limits_request :
  directory_id:directory_id -> unit -> get_snapshot_limits_request

val make_directory_limits :
  ?connected_directories_limit_reached:connected_directories_limit_reached ->
  ?connected_directories_current_count:limit ->
  ?connected_directories_limit:limit ->
  ?cloud_only_microsoft_ad_limit_reached:cloud_only_directories_limit_reached ->
  ?cloud_only_microsoft_ad_current_count:limit ->
  ?cloud_only_microsoft_ad_limit:limit ->
  ?cloud_only_directories_limit_reached:cloud_only_directories_limit_reached ->
  ?cloud_only_directories_current_count:limit ->
  ?cloud_only_directories_limit:limit ->
  unit ->
  directory_limits

val make_get_directory_limits_request : unit -> unit

val make_event_topic :
  ?status:topic_status ->
  ?created_date_time:created_date_time ->
  ?topic_arn:topic_arn ->
  ?topic_name:topic_name ->
  ?directory_id:directory_id ->
  unit ->
  event_topic

val make_enable_sso_request :
  ?password:connect_password ->
  ?user_name:user_name ->
  directory_id:directory_id ->
  unit ->
  enable_sso_request

val make_enable_radius_request :
  radius_settings:radius_settings -> directory_id:directory_id -> unit -> enable_radius_request

val make_enable_ldaps_request :
  type_:ldaps_type -> directory_id:directory_id -> unit -> enable_ldaps_request

val make_enable_directory_data_access_request :
  directory_id:directory_id -> unit -> enable_directory_data_access_request

val make_enable_client_authentication_request :
  type_:client_authentication_type ->
  directory_id:directory_id ->
  unit ->
  enable_client_authentication_request

val make_enable_ca_enrollment_policy_request :
  pca_connector_arn:pca_connector_arn ->
  directory_id:directory_id ->
  unit ->
  enable_ca_enrollment_policy_request

val make_domain_controller :
  ?status_last_updated_date_time:last_updated_date_time ->
  ?launch_time:launch_time ->
  ?status_reason:domain_controller_status_reason ->
  ?status:domain_controller_status ->
  ?availability_zone:availability_zone ->
  ?subnet_id:subnet_id ->
  ?vpc_id:vpc_id ->
  ?dns_ipv6_addr:ipv6_addr ->
  ?dns_ip_addr:ip_addr ->
  ?domain_controller_id:domain_controller_id ->
  ?directory_id:directory_id ->
  unit ->
  domain_controller

val make_disable_sso_request :
  ?password:connect_password ->
  ?user_name:user_name ->
  directory_id:directory_id ->
  unit ->
  disable_sso_request

val make_disable_radius_request : directory_id:directory_id -> unit -> disable_radius_request

val make_disable_ldaps_request :
  type_:ldaps_type -> directory_id:directory_id -> unit -> disable_ldaps_request

val make_disable_directory_data_access_request :
  directory_id:directory_id -> unit -> disable_directory_data_access_request

val make_disable_client_authentication_request :
  type_:client_authentication_type ->
  directory_id:directory_id ->
  unit ->
  disable_client_authentication_request

val make_disable_ca_enrollment_policy_request :
  directory_id:directory_id -> unit -> disable_ca_enrollment_policy_request

val make_describe_update_directory_request :
  ?next_token:next_token ->
  ?region_name:region_name ->
  update_type:update_type ->
  directory_id:directory_id ->
  unit ->
  describe_update_directory_request

val make_describe_trusts_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?trust_ids:trust_ids ->
  ?directory_id:directory_id ->
  unit ->
  describe_trusts_request

val make_describe_snapshots_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?snapshot_ids:snapshot_ids ->
  ?directory_id:directory_id ->
  unit ->
  describe_snapshots_request

val make_describe_shared_directories_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?shared_directory_ids:directory_ids ->
  owner_directory_id:directory_id ->
  unit ->
  describe_shared_directories_request

val make_describe_settings_request :
  ?next_token:next_token ->
  ?status:directory_configuration_status ->
  directory_id:directory_id ->
  unit ->
  describe_settings_request

val make_describe_regions_request :
  ?next_token:next_token ->
  ?region_name:region_name ->
  directory_id:directory_id ->
  unit ->
  describe_regions_request

val make_describe_ldaps_settings_request :
  ?limit:page_limit ->
  ?next_token:next_token ->
  ?type_:ldaps_type ->
  directory_id:directory_id ->
  unit ->
  describe_ldaps_settings_request

val make_describe_hybrid_ad_update_request :
  ?next_token:next_token ->
  ?update_type:hybrid_update_type ->
  directory_id:directory_id ->
  unit ->
  describe_hybrid_ad_update_request

val make_describe_event_topics_request :
  ?topic_names:topic_names -> ?directory_id:directory_id -> unit -> describe_event_topics_request

val make_describe_domain_controllers_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?domain_controller_ids:domain_controller_ids ->
  directory_id:directory_id ->
  unit ->
  describe_domain_controllers_request

val make_describe_directory_data_access_request :
  directory_id:directory_id -> unit -> describe_directory_data_access_request

val make_directory_connect_settings_description :
  ?connect_ips_v6:ip_v6_addrs ->
  ?connect_ips:ip_addrs ->
  ?availability_zones:availability_zones ->
  ?security_group_id:security_group_id ->
  ?customer_user_name:user_name ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  unit ->
  directory_connect_settings_description

val make_directory_description :
  ?network_type:network_type ->
  ?hybrid_settings:hybrid_settings_description ->
  ?os_version:os_version ->
  ?regions_info:regions_info ->
  ?owner_directory_description:owner_directory_description ->
  ?desired_number_of_domain_controllers:desired_number_of_domain_controllers ->
  ?sso_enabled:sso_enabled ->
  ?stage_reason:stage_reason ->
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?connect_settings:directory_connect_settings_description ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?type_:directory_type ->
  ?stage_last_updated_date_time:last_updated_date_time ->
  ?launch_time:launch_time ->
  ?share_notes:notes ->
  ?share_method:share_method ->
  ?share_status:share_status ->
  ?stage:directory_stage ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?description:description ->
  ?access_url:access_url ->
  ?alias:alias_name ->
  ?edition:directory_edition ->
  ?size:directory_size ->
  ?short_name:directory_short_name ->
  ?name:directory_name ->
  ?directory_id:directory_id ->
  unit ->
  directory_description

val make_describe_directories_request :
  ?limit:limit ->
  ?next_token:next_token ->
  ?directory_ids:directory_ids ->
  unit ->
  describe_directories_request

val make_conditional_forwarder :
  ?replication_scope:replication_scope ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?remote_domain_name:remote_domain_name ->
  unit ->
  conditional_forwarder

val make_describe_conditional_forwarders_request :
  ?remote_domain_names:remote_domain_names ->
  directory_id:directory_id ->
  unit ->
  describe_conditional_forwarders_request

val make_client_authentication_setting_info :
  ?last_updated_date_time:last_updated_date_time ->
  ?status:client_authentication_status ->
  ?type_:client_authentication_type ->
  unit ->
  client_authentication_setting_info

val make_describe_client_authentication_settings_request :
  ?limit:page_limit ->
  ?next_token:next_token ->
  ?type_:client_authentication_type ->
  directory_id:directory_id ->
  unit ->
  describe_client_authentication_settings_request

val make_certificate :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  ?expiry_date_time:certificate_expiry_date_time ->
  ?registered_date_time:certificate_registered_date_time ->
  ?common_name:certificate_c_n ->
  ?state_reason:certificate_state_reason ->
  ?state:certificate_state ->
  ?certificate_id:certificate_id ->
  unit ->
  certificate

val make_describe_certificate_request :
  certificate_id:certificate_id -> directory_id:directory_id -> unit -> describe_certificate_request

val make_describe_ca_enrollment_policy_request :
  directory_id:directory_id -> unit -> describe_ca_enrollment_policy_request

val make_assessment :
  ?version:assessment_version ->
  ?report_type:assessment_report_type ->
  ?self_managed_instance_ids:assessment_instance_ids ->
  ?security_group_ids:security_group_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?customer_dns_ips:customer_dns_ips ->
  ?status_reason:assessment_status_reason ->
  ?status_code:assessment_status_code ->
  ?status:assessment_status ->
  ?last_update_date_time:last_update_date_time ->
  ?start_time:assessment_start_time ->
  ?dns_name:directory_name ->
  ?directory_id:directory_id ->
  ?assessment_id:assessment_id ->
  unit ->
  assessment

val make_assessment_validation :
  ?last_update_date_time:assessment_validation_time_stamp ->
  ?start_time:assessment_validation_time_stamp ->
  ?status_reason:assessment_validation_status_reason ->
  ?status_code:assessment_validation_status_code ->
  ?status:assessment_validation_status ->
  ?name:assessment_validation_name ->
  ?category:assessment_validation_category ->
  unit ->
  assessment_validation

val make_assessment_report :
  ?validations:assessment_validations -> ?domain_controller_ip:ip_addr -> unit -> assessment_report

val make_describe_ad_assessment_request :
  assessment_id:assessment_id -> unit -> describe_ad_assessment_request

val make_deregister_event_topic_request :
  topic_name:topic_name -> directory_id:directory_id -> unit -> deregister_event_topic_request

val make_deregister_certificate_request :
  certificate_id:certificate_id ->
  directory_id:directory_id ->
  unit ->
  deregister_certificate_request

val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:delete_associated_conditional_forwarder ->
  trust_id:trust_id ->
  unit ->
  delete_trust_request

val make_delete_snapshot_request : snapshot_id:snapshot_id -> unit -> delete_snapshot_request

val make_delete_log_subscription_request :
  directory_id:directory_id -> unit -> delete_log_subscription_request

val make_delete_directory_request : directory_id:directory_id -> unit -> delete_directory_request

val make_delete_conditional_forwarder_request :
  remote_domain_name:remote_domain_name ->
  directory_id:directory_id ->
  unit ->
  delete_conditional_forwarder_request

val make_delete_ad_assessment_request :
  assessment_id:assessment_id -> unit -> delete_ad_assessment_request

val make_create_trust_request :
  ?selective_auth:selective_auth ->
  ?conditional_forwarder_ipv6_addrs:dns_ipv6_addrs ->
  ?conditional_forwarder_ip_addrs:dns_ip_addrs ->
  ?trust_type:trust_type ->
  trust_direction:trust_direction ->
  trust_password:trust_password ->
  remote_domain_name:remote_domain_name ->
  directory_id:directory_id ->
  unit ->
  create_trust_request

val make_create_snapshot_request :
  ?name:snapshot_name -> directory_id:directory_id -> unit -> create_snapshot_request

val make_create_microsoft_ad_request :
  ?network_type:network_type ->
  ?tags:tags ->
  ?edition:directory_edition ->
  ?description:description ->
  ?short_name:directory_short_name ->
  vpc_settings:directory_vpc_settings ->
  password:password ->
  name:directory_name ->
  unit ->
  create_microsoft_ad_request

val make_create_log_subscription_request :
  log_group_name:log_group_name ->
  directory_id:directory_id ->
  unit ->
  create_log_subscription_request

val make_create_hybrid_ad_request :
  ?tags:tags ->
  assessment_id:assessment_id ->
  secret_arn:secret_arn ->
  unit ->
  create_hybrid_ad_request

val make_create_directory_request :
  ?network_type:network_type ->
  ?tags:tags ->
  ?vpc_settings:directory_vpc_settings ->
  ?description:description ->
  ?short_name:directory_short_name ->
  size:directory_size ->
  password:password ->
  name:directory_name ->
  unit ->
  create_directory_request

val make_create_conditional_forwarder_request :
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?dns_ip_addrs:dns_ip_addrs ->
  remote_domain_name:remote_domain_name ->
  directory_id:directory_id ->
  unit ->
  create_conditional_forwarder_request

val make_attribute : ?value:attribute_value -> ?name:attribute_name -> unit -> attribute

val make_computer :
  ?computer_attributes:attributes ->
  ?computer_name:computer_name ->
  ?computer_id:si_d ->
  unit ->
  computer

val make_create_computer_request :
  ?computer_attributes:attributes ->
  ?organizational_unit_distinguished_name:organizational_unit_d_n ->
  password:computer_password ->
  computer_name:computer_name ->
  directory_id:directory_id ->
  unit ->
  create_computer_request

val make_create_alias_request :
  alias:alias_name -> directory_id:directory_id -> unit -> create_alias_request

val make_directory_connect_settings :
  ?customer_dns_ips_v6:dns_ipv6_addrs ->
  ?customer_dns_ips:dns_ip_addrs ->
  customer_user_name:user_name ->
  subnet_ids:subnet_ids ->
  vpc_id:vpc_id ->
  unit ->
  directory_connect_settings

val make_connect_directory_request :
  ?network_type:network_type ->
  ?tags:tags ->
  ?description:description ->
  ?short_name:directory_short_name ->
  connect_settings:directory_connect_settings ->
  size:directory_size ->
  password:connect_password ->
  name:directory_name ->
  unit ->
  connect_directory_request

val make_cancel_schema_extension_request :
  schema_extension_id:schema_extension_id ->
  directory_id:directory_id ->
  unit ->
  cancel_schema_extension_request

val make_add_tags_to_resource_request :
  tags:tags -> resource_id:resource_id -> unit -> add_tags_to_resource_request

val make_add_region_request :
  vpc_settings:directory_vpc_settings ->
  region_name:region_name ->
  directory_id:directory_id ->
  unit ->
  add_region_request

val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:update_security_group_for_directory_controllers ->
  ip_routes:ip_routes ->
  directory_id:directory_id ->
  unit ->
  add_ip_routes_request

val make_accept_shared_directory_request :
  shared_directory_id:directory_id -> unit -> accept_shared_directory_request
