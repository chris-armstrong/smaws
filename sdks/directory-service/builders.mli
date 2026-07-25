open Types

val make_shared_directory :
  ?owner_account_id:customer_id ->
  ?owner_directory_id:directory_id ->
  ?share_method:share_method ->
  ?shared_account_id:customer_id ->
  ?shared_directory_id:directory_id ->
  ?share_status:share_status ->
  ?share_notes:notes ->
  ?created_date_time:created_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  unit ->
  shared_directory

val make_accept_shared_directory_request :
  shared_directory_id:directory_id -> unit -> accept_shared_directory_request

val make_ip_route :
  ?cidr_ip:cidr_ip -> ?cidr_ipv6:cidr_ipv6 -> ?description:description -> unit -> ip_route

val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:update_security_group_for_directory_controllers ->
  directory_id:directory_id ->
  ip_routes:ip_routes ->
  unit ->
  add_ip_routes_request

val make_directory_vpc_settings :
  vpc_id:vpc_id -> subnet_ids:subnet_ids -> unit -> directory_vpc_settings

val make_add_region_request :
  directory_id:directory_id ->
  region_name:region_name ->
  vpc_settings:directory_vpc_settings ->
  unit ->
  add_region_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_add_tags_to_resource_request :
  resource_id:resource_id -> tags:tags -> unit -> add_tags_to_resource_request

val make_assessment :
  ?assessment_id:assessment_id ->
  ?directory_id:directory_id ->
  ?dns_name:directory_name ->
  ?start_time:assessment_start_time ->
  ?last_update_date_time:last_update_date_time ->
  ?status:assessment_status ->
  ?status_code:assessment_status_code ->
  ?status_reason:assessment_status_reason ->
  ?customer_dns_ips:customer_dns_ips ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?security_group_ids:security_group_ids ->
  ?self_managed_instance_ids:assessment_instance_ids ->
  ?report_type:assessment_report_type ->
  ?version:assessment_version ->
  unit ->
  assessment

val make_assessment_configuration :
  ?security_group_ids:security_group_ids ->
  customer_dns_ips:customer_dns_ips ->
  dns_name:directory_name ->
  vpc_settings:directory_vpc_settings ->
  instance_ids:assessment_instance_ids ->
  unit ->
  assessment_configuration

val make_assessment_validation :
  ?category:assessment_validation_category ->
  ?name:assessment_validation_name ->
  ?status:assessment_validation_status ->
  ?status_code:assessment_validation_status_code ->
  ?status_reason:assessment_validation_status_reason ->
  ?start_time:assessment_validation_time_stamp ->
  ?last_update_date_time:assessment_validation_time_stamp ->
  unit ->
  assessment_validation

val make_assessment_report :
  ?domain_controller_ip:ip_addr -> ?validations:assessment_validations -> unit -> assessment_report

val make_assessment_summary :
  ?assessment_id:assessment_id ->
  ?directory_id:directory_id ->
  ?dns_name:directory_name ->
  ?start_time:assessment_start_time ->
  ?last_update_date_time:last_update_date_time ->
  ?status:assessment_status ->
  ?customer_dns_ips:customer_dns_ips ->
  ?report_type:assessment_report_type ->
  unit ->
  assessment_summary

val make_attribute : ?name:attribute_name -> ?value:attribute_value -> unit -> attribute

val make_cancel_schema_extension_request :
  directory_id:directory_id ->
  schema_extension_id:schema_extension_id ->
  unit ->
  cancel_schema_extension_request

val make_client_cert_auth_settings : ?ocsp_url:ocsp_url -> unit -> client_cert_auth_settings

val make_certificate :
  ?certificate_id:certificate_id ->
  ?state:certificate_state ->
  ?state_reason:certificate_state_reason ->
  ?common_name:certificate_c_n ->
  ?registered_date_time:certificate_registered_date_time ->
  ?expiry_date_time:certificate_expiry_date_time ->
  ?type_:certificate_type ->
  ?client_cert_auth_settings:client_cert_auth_settings ->
  unit ->
  certificate

val make_certificate_info :
  ?certificate_id:certificate_id ->
  ?common_name:certificate_c_n ->
  ?state:certificate_state ->
  ?expiry_date_time:certificate_expiry_date_time ->
  ?type_:certificate_type ->
  unit ->
  certificate_info

val make_client_authentication_setting_info :
  ?type_:client_authentication_type ->
  ?status:client_authentication_status ->
  ?last_updated_date_time:last_updated_date_time ->
  unit ->
  client_authentication_setting_info

val make_computer :
  ?computer_id:si_d ->
  ?computer_name:computer_name ->
  ?computer_attributes:attributes ->
  unit ->
  computer

val make_conditional_forwarder :
  ?remote_domain_name:remote_domain_name ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?replication_scope:replication_scope ->
  unit ->
  conditional_forwarder

val make_directory_connect_settings :
  ?customer_dns_ips:dns_ip_addrs ->
  ?customer_dns_ips_v6:dns_ipv6_addrs ->
  vpc_id:vpc_id ->
  subnet_ids:subnet_ids ->
  customer_user_name:user_name ->
  unit ->
  directory_connect_settings

val make_connect_directory_request :
  ?short_name:directory_short_name ->
  ?description:description ->
  ?tags:tags ->
  ?network_type:network_type ->
  name:directory_name ->
  password:connect_password ->
  size:directory_size ->
  connect_settings:directory_connect_settings ->
  unit ->
  connect_directory_request

val make_create_alias_request :
  directory_id:directory_id -> alias:alias_name -> unit -> create_alias_request

val make_create_computer_request :
  ?organizational_unit_distinguished_name:organizational_unit_d_n ->
  ?computer_attributes:attributes ->
  directory_id:directory_id ->
  computer_name:computer_name ->
  password:computer_password ->
  unit ->
  create_computer_request

val make_create_conditional_forwarder_request :
  ?dns_ip_addrs:dns_ip_addrs ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  directory_id:directory_id ->
  remote_domain_name:remote_domain_name ->
  unit ->
  create_conditional_forwarder_request

val make_create_directory_request :
  ?short_name:directory_short_name ->
  ?description:description ->
  ?vpc_settings:directory_vpc_settings ->
  ?tags:tags ->
  ?network_type:network_type ->
  name:directory_name ->
  password:password ->
  size:directory_size ->
  unit ->
  create_directory_request

val make_create_hybrid_ad_request :
  ?tags:tags ->
  secret_arn:secret_arn ->
  assessment_id:assessment_id ->
  unit ->
  create_hybrid_ad_request

val make_create_log_subscription_request :
  directory_id:directory_id ->
  log_group_name:log_group_name ->
  unit ->
  create_log_subscription_request

val make_create_microsoft_ad_request :
  ?short_name:directory_short_name ->
  ?description:description ->
  ?edition:directory_edition ->
  ?tags:tags ->
  ?network_type:network_type ->
  name:directory_name ->
  password:password ->
  vpc_settings:directory_vpc_settings ->
  unit ->
  create_microsoft_ad_request

val make_create_snapshot_request :
  ?name:snapshot_name -> directory_id:directory_id -> unit -> create_snapshot_request

val make_create_trust_request :
  ?trust_type:trust_type ->
  ?conditional_forwarder_ip_addrs:dns_ip_addrs ->
  ?conditional_forwarder_ipv6_addrs:dns_ipv6_addrs ->
  ?selective_auth:selective_auth ->
  directory_id:directory_id ->
  remote_domain_name:remote_domain_name ->
  trust_password:trust_password ->
  trust_direction:trust_direction ->
  unit ->
  create_trust_request

val make_delete_ad_assessment_request :
  assessment_id:assessment_id -> unit -> delete_ad_assessment_request

val make_delete_conditional_forwarder_request :
  directory_id:directory_id ->
  remote_domain_name:remote_domain_name ->
  unit ->
  delete_conditional_forwarder_request

val make_delete_directory_request : directory_id:directory_id -> unit -> delete_directory_request

val make_delete_log_subscription_request :
  directory_id:directory_id -> unit -> delete_log_subscription_request

val make_delete_snapshot_request : snapshot_id:snapshot_id -> unit -> delete_snapshot_request

val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:delete_associated_conditional_forwarder ->
  trust_id:trust_id ->
  unit ->
  delete_trust_request

val make_deregister_certificate_request :
  directory_id:directory_id ->
  certificate_id:certificate_id ->
  unit ->
  deregister_certificate_request

val make_deregister_event_topic_request :
  directory_id:directory_id -> topic_name:topic_name -> unit -> deregister_event_topic_request

val make_describe_ad_assessment_request :
  assessment_id:assessment_id -> unit -> describe_ad_assessment_request

val make_describe_ca_enrollment_policy_request :
  directory_id:directory_id -> unit -> describe_ca_enrollment_policy_request

val make_describe_certificate_request :
  directory_id:directory_id -> certificate_id:certificate_id -> unit -> describe_certificate_request

val make_describe_client_authentication_settings_request :
  ?type_:client_authentication_type ->
  ?next_token:next_token ->
  ?limit:page_limit ->
  directory_id:directory_id ->
  unit ->
  describe_client_authentication_settings_request

val make_describe_conditional_forwarders_request :
  ?remote_domain_names:remote_domain_names ->
  directory_id:directory_id ->
  unit ->
  describe_conditional_forwarders_request

val make_hybrid_settings_description :
  ?self_managed_dns_ip_addrs:ip_addrs ->
  ?self_managed_instance_ids:assessment_instance_ids ->
  unit ->
  hybrid_settings_description

val make_regions_info :
  ?primary_region:region_name -> ?additional_regions:additional_regions -> unit -> regions_info

val make_radius_settings :
  ?radius_servers:servers ->
  ?radius_servers_ipv6:servers ->
  ?radius_port:port_number ->
  ?radius_timeout:radius_timeout ->
  ?radius_retries:radius_retries ->
  ?shared_secret:radius_shared_secret ->
  ?authentication_protocol:radius_authentication_protocol ->
  ?display_label:radius_display_label ->
  ?use_same_username:use_same_username ->
  unit ->
  radius_settings

val make_directory_vpc_settings_description :
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?security_group_id:security_group_id ->
  ?availability_zones:availability_zones ->
  unit ->
  directory_vpc_settings_description

val make_owner_directory_description :
  ?directory_id:directory_id ->
  ?account_id:customer_id ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?radius_settings:radius_settings ->
  ?radius_status:radius_status ->
  ?network_type:network_type ->
  unit ->
  owner_directory_description

val make_directory_connect_settings_description :
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  ?customer_user_name:user_name ->
  ?security_group_id:security_group_id ->
  ?availability_zones:availability_zones ->
  ?connect_ips:ip_addrs ->
  ?connect_ips_v6:ip_v6_addrs ->
  unit ->
  directory_connect_settings_description

val make_directory_description :
  ?directory_id:directory_id ->
  ?name:directory_name ->
  ?short_name:directory_short_name ->
  ?size:directory_size ->
  ?edition:directory_edition ->
  ?alias:alias_name ->
  ?access_url:access_url ->
  ?description:description ->
  ?dns_ip_addrs:dns_ip_addrs ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  ?stage:directory_stage ->
  ?share_status:share_status ->
  ?share_method:share_method ->
  ?share_notes:notes ->
  ?launch_time:launch_time ->
  ?stage_last_updated_date_time:last_updated_date_time ->
  ?type_:directory_type ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?connect_settings:directory_connect_settings_description ->
  ?radius_settings:radius_settings ->
  ?radius_status:radius_status ->
  ?stage_reason:stage_reason ->
  ?sso_enabled:sso_enabled ->
  ?desired_number_of_domain_controllers:desired_number_of_domain_controllers ->
  ?owner_directory_description:owner_directory_description ->
  ?regions_info:regions_info ->
  ?os_version:os_version ->
  ?hybrid_settings:hybrid_settings_description ->
  ?network_type:network_type ->
  unit ->
  directory_description

val make_describe_directories_request :
  ?directory_ids:directory_ids ->
  ?next_token:next_token ->
  ?limit:limit ->
  unit ->
  describe_directories_request

val make_describe_directory_data_access_request :
  directory_id:directory_id -> unit -> describe_directory_data_access_request

val make_domain_controller :
  ?directory_id:directory_id ->
  ?domain_controller_id:domain_controller_id ->
  ?dns_ip_addr:ip_addr ->
  ?dns_ipv6_addr:ipv6_addr ->
  ?vpc_id:vpc_id ->
  ?subnet_id:subnet_id ->
  ?availability_zone:availability_zone ->
  ?status:domain_controller_status ->
  ?status_reason:domain_controller_status_reason ->
  ?launch_time:launch_time ->
  ?status_last_updated_date_time:last_updated_date_time ->
  unit ->
  domain_controller

val make_describe_domain_controllers_request :
  ?domain_controller_ids:domain_controller_ids ->
  ?next_token:next_token ->
  ?limit:limit ->
  directory_id:directory_id ->
  unit ->
  describe_domain_controllers_request

val make_event_topic :
  ?directory_id:directory_id ->
  ?topic_name:topic_name ->
  ?topic_arn:topic_arn ->
  ?created_date_time:created_date_time ->
  ?status:topic_status ->
  unit ->
  event_topic

val make_describe_event_topics_request :
  ?directory_id:directory_id -> ?topic_names:topic_names -> unit -> describe_event_topics_request

val make_hybrid_update_value :
  ?instance_ids:assessment_instance_ids -> ?dns_ips:customer_dns_ips -> unit -> hybrid_update_value

val make_hybrid_update_info_entry :
  ?status:update_status ->
  ?status_reason:update_status_reason ->
  ?initiated_by:initiated_by ->
  ?new_value:hybrid_update_value ->
  ?previous_value:hybrid_update_value ->
  ?start_time:start_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  ?assessment_id:assessment_id ->
  unit ->
  hybrid_update_info_entry

val make_hybrid_update_activities :
  ?self_managed_instances:hybrid_update_info_entries ->
  ?hybrid_administrator_account:hybrid_update_info_entries ->
  unit ->
  hybrid_update_activities

val make_describe_hybrid_ad_update_request :
  ?update_type:hybrid_update_type ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  describe_hybrid_ad_update_request

val make_ldaps_setting_info :
  ?ldaps_status:ldaps_status ->
  ?ldaps_status_reason:ldaps_status_reason ->
  ?last_updated_date_time:last_updated_date_time ->
  unit ->
  ldaps_setting_info

val make_describe_ldaps_settings_request :
  ?type_:ldaps_type ->
  ?next_token:next_token ->
  ?limit:page_limit ->
  directory_id:directory_id ->
  unit ->
  describe_ldaps_settings_request

val make_region_description :
  ?directory_id:directory_id ->
  ?region_name:region_name ->
  ?region_type:region_type ->
  ?status:directory_stage ->
  ?vpc_settings:directory_vpc_settings ->
  ?desired_number_of_domain_controllers:desired_number_of_domain_controllers ->
  ?launch_time:launch_time ->
  ?status_last_updated_date_time:state_last_updated_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  unit ->
  region_description

val make_describe_regions_request :
  ?region_name:region_name ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  describe_regions_request

val make_setting_entry :
  ?type_:directory_configuration_setting_type ->
  ?name:directory_configuration_setting_name ->
  ?allowed_values:directory_configuration_setting_allowed_values ->
  ?applied_value:directory_configuration_setting_value ->
  ?requested_value:directory_configuration_setting_value ->
  ?request_status:directory_configuration_status ->
  ?request_detailed_status:directory_configuration_setting_request_detailed_status ->
  ?request_status_message:directory_configuration_setting_request_status_message ->
  ?last_updated_date_time:directory_configuration_setting_last_updated_date_time ->
  ?last_requested_date_time:directory_configuration_setting_last_requested_date_time ->
  ?data_type:directory_configuration_setting_data_type ->
  unit ->
  setting_entry

val make_describe_settings_request :
  ?status:directory_configuration_status ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  unit ->
  describe_settings_request

val make_describe_shared_directories_request :
  ?shared_directory_ids:directory_ids ->
  ?next_token:next_token ->
  ?limit:limit ->
  owner_directory_id:directory_id ->
  unit ->
  describe_shared_directories_request

val make_snapshot :
  ?directory_id:directory_id ->
  ?snapshot_id:snapshot_id ->
  ?type_:snapshot_type ->
  ?name:snapshot_name ->
  ?status:snapshot_status ->
  ?start_time:start_time ->
  unit ->
  snapshot

val make_describe_snapshots_request :
  ?directory_id:directory_id ->
  ?snapshot_ids:snapshot_ids ->
  ?next_token:next_token ->
  ?limit:limit ->
  unit ->
  describe_snapshots_request

val make_trust :
  ?directory_id:directory_id ->
  ?trust_id:trust_id ->
  ?remote_domain_name:remote_domain_name ->
  ?trust_type:trust_type ->
  ?trust_direction:trust_direction ->
  ?trust_state:trust_state ->
  ?created_date_time:created_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  ?state_last_updated_date_time:state_last_updated_date_time ->
  ?trust_state_reason:trust_state_reason ->
  ?selective_auth:selective_auth ->
  unit ->
  trust

val make_describe_trusts_request :
  ?directory_id:directory_id ->
  ?trust_ids:trust_ids ->
  ?next_token:next_token ->
  ?limit:limit ->
  unit ->
  describe_trusts_request

val make_os_update_settings : ?os_version:os_version -> unit -> os_update_settings
val make_update_value : ?os_update_settings:os_update_settings -> unit -> update_value

val make_update_info_entry :
  ?region:region_name ->
  ?status:update_status ->
  ?status_reason:update_status_reason ->
  ?initiated_by:initiated_by ->
  ?new_value:update_value ->
  ?previous_value:update_value ->
  ?start_time:start_date_time ->
  ?last_updated_date_time:last_updated_date_time ->
  unit ->
  update_info_entry

val make_describe_update_directory_request :
  ?region_name:region_name ->
  ?next_token:next_token ->
  directory_id:directory_id ->
  update_type:update_type ->
  unit ->
  describe_update_directory_request

val make_directory_limits :
  ?cloud_only_directories_limit:limit ->
  ?cloud_only_directories_current_count:limit ->
  ?cloud_only_directories_limit_reached:cloud_only_directories_limit_reached ->
  ?cloud_only_microsoft_ad_limit:limit ->
  ?cloud_only_microsoft_ad_current_count:limit ->
  ?cloud_only_microsoft_ad_limit_reached:cloud_only_directories_limit_reached ->
  ?connected_directories_limit:limit ->
  ?connected_directories_current_count:limit ->
  ?connected_directories_limit_reached:connected_directories_limit_reached ->
  unit ->
  directory_limits

val make_verify_trust_request : trust_id:trust_id -> unit -> verify_trust_request

val make_update_trust_request :
  ?selective_auth:selective_auth -> trust_id:trust_id -> unit -> update_trust_request

val make_setting :
  name:directory_configuration_setting_name ->
  value:directory_configuration_setting_value ->
  unit ->
  setting

val make_update_settings_request :
  directory_id:directory_id -> settings:settings -> unit -> update_settings_request

val make_update_radius_request :
  directory_id:directory_id -> radius_settings:radius_settings -> unit -> update_radius_request

val make_update_number_of_domain_controllers_request :
  directory_id:directory_id ->
  desired_number:desired_number_of_domain_controllers ->
  unit ->
  update_number_of_domain_controllers_request

val make_hybrid_customer_instances_settings :
  customer_dns_ips:customer_dns_ips ->
  instance_ids:assessment_instance_ids ->
  unit ->
  hybrid_customer_instances_settings

val make_hybrid_administrator_account_update :
  secret_arn:secret_arn -> unit -> hybrid_administrator_account_update

val make_update_hybrid_ad_request :
  ?hybrid_administrator_account_update:hybrid_administrator_account_update ->
  ?self_managed_instances_settings:hybrid_customer_instances_settings ->
  directory_id:directory_id ->
  unit ->
  update_hybrid_ad_request

val make_network_update_settings :
  ?network_type:network_type ->
  ?customer_dns_ips_v6:dns_ipv6_addrs ->
  unit ->
  network_update_settings

val make_directory_size_update_settings :
  ?directory_size:directory_size -> unit -> directory_size_update_settings

val make_update_directory_setup_request :
  ?os_update_settings:os_update_settings ->
  ?directory_size_update_settings:directory_size_update_settings ->
  ?network_update_settings:network_update_settings ->
  ?create_snapshot_before_update:create_snapshot_before_update ->
  directory_id:directory_id ->
  update_type:update_type ->
  unit ->
  update_directory_setup_request

val make_update_conditional_forwarder_request :
  ?dns_ip_addrs:dns_ip_addrs ->
  ?dns_ipv6_addrs:dns_ipv6_addrs ->
  directory_id:directory_id ->
  remote_domain_name:remote_domain_name ->
  unit ->
  update_conditional_forwarder_request

val make_unshare_target : id:target_id -> type_:target_type -> unit -> unshare_target

val make_unshare_directory_request :
  directory_id:directory_id -> unshare_target:unshare_target -> unit -> unshare_directory_request

val make_start_schema_extension_request :
  directory_id:directory_id ->
  create_snapshot_before_schema_extension:create_snapshot_before_schema_extension ->
  ldif_content:ldif_content ->
  description:description ->
  unit ->
  start_schema_extension_request

val make_start_ad_assessment_request :
  ?assessment_configuration:assessment_configuration ->
  ?directory_id:directory_id ->
  unit ->
  start_ad_assessment_request

val make_share_target : id:target_id -> type_:target_type -> unit -> share_target

val make_share_directory_request :
  ?share_notes:notes ->
  directory_id:directory_id ->
  share_target:share_target ->
  share_method:share_method ->
  unit ->
  share_directory_request

val make_restore_from_snapshot_request :
  snapshot_id:snapshot_id -> unit -> restore_from_snapshot_request

val make_reset_user_password_request :
  directory_id:directory_id ->
  user_name:customer_user_name ->
  new_password:user_password ->
  unit ->
  reset_user_password_request

val make_remove_tags_from_resource_request :
  resource_id:resource_id -> tag_keys:tag_keys -> unit -> remove_tags_from_resource_request

val make_remove_region_request : directory_id:directory_id -> unit -> remove_region_request

val make_remove_ip_routes_request :
  ?cidr_ips:cidr_ips ->
  ?cidr_ipv6s:cidr_ipv6s ->
  directory_id:directory_id ->
  unit ->
  remove_ip_routes_request

val make_reject_shared_directory_request :
  shared_directory_id:directory_id -> unit -> reject_shared_directory_request

val make_register_event_topic_request :
  directory_id:directory_id -> topic_name:topic_name -> unit -> register_event_topic_request

val make_register_certificate_request :
  ?type_:certificate_type ->
  ?client_cert_auth_settings:client_cert_auth_settings ->
  directory_id:directory_id ->
  certificate_data:certificate_data ->
  unit ->
  register_certificate_request

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?limit:limit ->
  resource_id:resource_id ->
  unit ->
  list_tags_for_resource_request

val make_schema_extension_info :
  ?directory_id:directory_id ->
  ?schema_extension_id:schema_extension_id ->
  ?description:description ->
  ?schema_extension_status:schema_extension_status ->
  ?schema_extension_status_reason:schema_extension_status_reason ->
  ?start_date_time:start_date_time ->
  ?end_date_time:end_date_time ->
  unit ->
  schema_extension_info

val make_list_schema_extensions_request :
  ?next_token:next_token ->
  ?limit:limit ->
  directory_id:directory_id ->
  unit ->
  list_schema_extensions_request

val make_log_subscription :
  ?directory_id:directory_id ->
  ?log_group_name:log_group_name ->
  ?subscription_created_date_time:subscription_created_date_time ->
  unit ->
  log_subscription

val make_list_log_subscriptions_request :
  ?directory_id:directory_id ->
  ?next_token:next_token ->
  ?limit:limit ->
  unit ->
  list_log_subscriptions_request

val make_ip_route_info :
  ?directory_id:directory_id ->
  ?cidr_ip:cidr_ip ->
  ?cidr_ipv6:cidr_ipv6 ->
  ?ip_route_status_msg:ip_route_status_msg ->
  ?added_date_time:added_date_time ->
  ?ip_route_status_reason:ip_route_status_reason ->
  ?description:description ->
  unit ->
  ip_route_info

val make_list_ip_routes_request :
  ?next_token:next_token ->
  ?limit:limit ->
  directory_id:directory_id ->
  unit ->
  list_ip_routes_request

val make_list_certificates_request :
  ?next_token:next_token ->
  ?limit:page_limit ->
  directory_id:directory_id ->
  unit ->
  list_certificates_request

val make_list_ad_assessments_request :
  ?directory_id:directory_id ->
  ?next_token:next_token ->
  ?limit:assessment_limit ->
  unit ->
  list_ad_assessments_request

val make_snapshot_limits :
  ?manual_snapshots_limit:limit ->
  ?manual_snapshots_current_count:limit ->
  ?manual_snapshots_limit_reached:manual_snapshots_limit_reached ->
  unit ->
  snapshot_limits

val make_get_snapshot_limits_request :
  directory_id:directory_id -> unit -> get_snapshot_limits_request

val make_get_directory_limits_request : unit -> unit

val make_enable_sso_request :
  ?user_name:user_name ->
  ?password:connect_password ->
  directory_id:directory_id ->
  unit ->
  enable_sso_request

val make_enable_radius_request :
  directory_id:directory_id -> radius_settings:radius_settings -> unit -> enable_radius_request

val make_enable_ldaps_request :
  directory_id:directory_id -> type_:ldaps_type -> unit -> enable_ldaps_request

val make_enable_directory_data_access_request :
  directory_id:directory_id -> unit -> enable_directory_data_access_request

val make_enable_client_authentication_request :
  directory_id:directory_id ->
  type_:client_authentication_type ->
  unit ->
  enable_client_authentication_request

val make_enable_ca_enrollment_policy_request :
  directory_id:directory_id ->
  pca_connector_arn:pca_connector_arn ->
  unit ->
  enable_ca_enrollment_policy_request

val make_disable_sso_request :
  ?user_name:user_name ->
  ?password:connect_password ->
  directory_id:directory_id ->
  unit ->
  disable_sso_request

val make_disable_radius_request : directory_id:directory_id -> unit -> disable_radius_request

val make_disable_ldaps_request :
  directory_id:directory_id -> type_:ldaps_type -> unit -> disable_ldaps_request

val make_disable_directory_data_access_request :
  directory_id:directory_id -> unit -> disable_directory_data_access_request

val make_disable_client_authentication_request :
  directory_id:directory_id ->
  type_:client_authentication_type ->
  unit ->
  disable_client_authentication_request

val make_disable_ca_enrollment_policy_request :
  directory_id:directory_id -> unit -> disable_ca_enrollment_policy_request
