(** Directory Service client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AcceptSharedDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_shared_directory_request ->
    ( accept_shared_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_shared_directory_request ->
    ( accept_shared_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Accepts a directory sharing request that was sent from the directory owner account.\n"]

module AddIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_ip_routes_request ->
    ( add_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_ip_routes_request ->
    ( add_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "If the DNS server for your self-managed domain uses a publicly addressable IP address, you must \
   add a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web \
   Services. {i AddIpRoutes} adds this address block. You can also use {i AddIpRoutes} to \
   facilitate routing traffic that uses public IP ranges from your Microsoft AD on Amazon Web \
   Services to a peer VPC. \n\n\
  \ Before you call {i AddIpRoutes}, ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   {i AddIpRoutes} operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module AddRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RegionLimitExceededException of region_limit_exceeded_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RegionLimitExceededException of region_limit_exceeded_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RegionLimitExceededException of region_limit_exceeded_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Adds two domain controllers in the specified Region for the specified directory.\n"]

module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified directory. Each directory can have a \
   maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to \
   each resource.\n"]

module CancelSchemaExtension : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_schema_extension_request ->
    ( cancel_schema_extension_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_schema_extension_request ->
    ( cancel_schema_extension_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension \
   has started replicating to all domain controllers, the task can no longer be canceled. A schema \
   extension can be canceled during any of the following states; [Initializing], \
   [CreatingSnapshot], and [UpdatingSchema].\n"]

module ConnectDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    connect_directory_request ->
    ( connect_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    connect_directory_request ->
    ( connect_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Creates an AD Connector to connect to a self-managed directory.\n\n\
  \ Before you call [ConnectDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [ConnectDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CreateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_alias_request ->
    ( create_alias_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_alias_request ->
    ( create_alias_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Creates an alias for a directory and assigns the alias to the directory. The alias is used to \
   construct the access URL for the directory, such as \n\
   {[\n\
   http://.awsapps.com\n\
   ]}\n\
   .\n\n\
  \  After an alias has been created, it cannot be deleted or reused, so this operation should \
   only be used when absolutely necessary.\n\
  \  \n\
  \   "]

module CreateComputer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_computer_request ->
    ( create_computer_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_computer_request ->
    ( create_computer_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Creates an Active Directory computer object in the specified directory.\n"]

module CreateConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_conditional_forwarder_request ->
    ( create_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_conditional_forwarder_request ->
    ( create_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a conditional forwarder associated with your Amazon Web Services directory. Conditional \
   forwarders are required in order to set up a trust relationship with another domain. The \
   conditional forwarder points to the trusted domain.\n"]

module CreateDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_directory_request ->
    ( create_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_directory_request ->
    ( create_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Creates a Simple AD directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html}Simple \
   Active Directory} in the {i Directory Service Admin Guide}.\n\n\
  \ Before you call [CreateDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [CreateDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CreateHybridAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_hybrid_ad_request ->
    ( create_hybrid_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_hybrid_ad_request ->
    ( create_hybrid_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a hybrid directory that connects your self-managed Active Directory (AD) infrastructure \
   and Amazon Web Services.\n\n\
  \ You must have a successful directory assessment using [StartADAssessment] to validate your \
   environment compatibility before you use this operation.\n\
  \ \n\
  \  Updates are applied asynchronously. Use [DescribeDirectories] to monitor the progress of \
   directory creation.\n\
  \  "]

module CreateLogSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_subscription_request ->
    ( create_log_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_subscription_request ->
    ( create_log_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a subscription to forward real-time Directory Service domain controller security logs \
   to the specified Amazon CloudWatch log group in your Amazon Web Services account.\n"]

module CreateMicrosoftAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryLimitExceededException of directory_limit_exceeded_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_microsoft_ad_request ->
    ( create_microsoft_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_microsoft_ad_request ->
    ( create_microsoft_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryLimitExceededException of directory_limit_exceeded_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a Microsoft AD directory in the Amazon Web Services Cloud. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html}Managed \
   Microsoft AD} in the {i Directory Service Admin Guide}.\n\n\
  \ Before you call {i CreateMicrosoftAD}, ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   {i CreateMicrosoftAD} operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon Web Services cloud.\n\n\
  \  You cannot take snapshots of AD Connector directories.\n\
  \  \n\
  \   "]

module CreateTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trust_request ->
    ( create_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trust_request ->
    ( create_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Directory Service for Microsoft Active Directory allows you to configure trust relationships. \
   For example, you can establish a trust between your Managed Microsoft AD directory, and your \
   existing self-managed Microsoft Active Directory. This would allow you to provide users and \
   groups access to resources in either domain, with a single set of credentials.\n\n\
  \ This action initiates the creation of the Amazon Web Services side of a trust relationship \
   between an Managed Microsoft AD directory and an external domain. You can create either a \
   forest trust or an external trust.\n\
  \ "]

module DeleteADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ad_assessment_request ->
    ( delete_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ad_assessment_request ->
    ( delete_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a directory assessment and all associated data. This operation permanently removes the \
   assessment results, validation reports, and configuration information.\n\n\
  \ You cannot delete system-initiated assessments. You can delete customer-created assessments \
   even if they are in progress.\n\
  \ "]

module DeleteConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_conditional_forwarder_request ->
    ( delete_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_conditional_forwarder_request ->
    ( delete_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a conditional forwarder that has been set up for your Amazon Web Services directory.\n"]

module DeleteDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_request ->
    ( delete_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_request ->
    ( delete_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an Directory Service directory.\n\n\
  \ Before you call [DeleteDirectory], ensure that all of the required permissions have been \
   explicitly granted through a policy. For details about what permissions are required to run the \
   [DeleteDirectory] operation, see \
   {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory \
   Service API Permissions: Actions, Resources, and Conditions Reference}.\n\
  \ "]

module DeleteLogSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_subscription_request ->
    ( delete_log_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_subscription_request ->
    ( delete_log_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Deletes the specified log subscription.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Deletes a directory snapshot.\n"]

module DeleteTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_request ->
    ( delete_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_request ->
    ( delete_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an existing trust relationship between your Managed Microsoft AD directory and an \
   external domain.\n"]

module DeregisterCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateDoesNotExistException of certificate_does_not_exist_exception
    | `CertificateInUseException of certificate_in_use_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_certificate_request ->
    ( deregister_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `CertificateInUseException of certificate_in_use_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_certificate_request ->
    ( deregister_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `CertificateInUseException of certificate_in_use_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes from the system the certificate that was registered for secure LDAP or client \
   certificate authentication.\n"]

module DeregisterEventTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_event_topic_request ->
    ( deregister_event_topic_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_event_topic_request ->
    ( deregister_event_topic_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Removes the specified directory as a publisher to the specified Amazon SNS topic.\n"]

module DescribeADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ad_assessment_request ->
    ( describe_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ad_assessment_request ->
    ( describe_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a directory assessment, including its current status, \
   validation results, and configuration details. Use this operation to monitor assessment \
   progress and review results.\n"]

module DescribeCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ca_enrollment_policy_request ->
    ( describe_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ca_enrollment_policy_request ->
    ( describe_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about the certificate authority (CA) enrollment policy for the \
   specified directory. This policy determines how client certificates are automatically enrolled \
   and managed through Amazon Web Services Private Certificate Authority. \n"]

module DescribeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateDoesNotExistException of certificate_does_not_exist_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateDoesNotExistException of certificate_does_not_exist_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Displays information about the certificate registered for secure LDAP or client certificate \
   authentication.\n"]

module DescribeClientAuthenticationSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_client_authentication_settings_request ->
    ( describe_client_authentication_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_client_authentication_settings_request ->
    ( describe_client_authentication_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves information about the type of client authentication for the specified directory, if \
   the type is specified. If no type is specified, information about all client authentication \
   types that are supported for the specified directory is retrieved. Currently, only [SmartCard] \
   is supported. \n"]

module DescribeConditionalForwarders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_conditional_forwarders_request ->
    ( describe_conditional_forwarders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_conditional_forwarders_request ->
    ( describe_conditional_forwarders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Obtains information about the conditional forwarders for this account.\n\n\
  \ If no input parameters are provided for RemoteDomainNames, this request describes all \
   conditional forwarders for the specified directory ID.\n\
  \ "]

module DescribeDirectories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directories_request ->
    ( describe_directories_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directories_request ->
    ( describe_directories_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Obtains information about the directories that belong to this account.\n\n\
  \ You can retrieve information about specific directories by passing the directory identifiers \
   in the [DirectoryIds] parameter. Otherwise, all directories that belong to the current account \
   are returned.\n\
  \ \n\
  \  This operation supports pagination with the use of the [NextToken] request and response \
   parameters. If more results are available, the [DescribeDirectoriesResult.NextToken] member \
   contains a token that you pass in the next call to [DescribeDirectories] to retrieve the next \
   set of items.\n\
  \  \n\
  \   You can also specify a maximum number of return results with the [Limit] parameter.\n\
  \   "]

module DescribeDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_data_access_request ->
    ( describe_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_data_access_request ->
    ( describe_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Obtains status of directory data access enablement through the Directory Service Data API for \
   the specified directory.\n"]

module DescribeDomainControllers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_controllers_request ->
    ( describe_domain_controllers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_controllers_request ->
    ( describe_domain_controllers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Provides information about any domain controllers in your directory.\n"]

module DescribeEventTopics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_topics_request ->
    ( describe_event_topics_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_topics_request ->
    ( describe_event_topics_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Obtains information about which Amazon SNS topics receive status messages from the specified \
   directory.\n\n\
  \ If no input parameters are provided, such as DirectoryId or TopicName, this request describes \
   all of the associations in the account.\n\
  \ "]

module DescribeHybridADUpdate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_hybrid_ad_update_request ->
    ( describe_hybrid_ad_update_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_hybrid_ad_update_request ->
    ( describe_hybrid_ad_update_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves information about update activities for a hybrid directory. This operation provides \
   details about configuration changes, administrator account updates, and self-managed instance \
   settings (IDs and DNS IPs).\n"]

module DescribeLDAPSSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ldaps_settings_request ->
    ( describe_ldaps_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ldaps_settings_request ->
    ( describe_ldaps_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Describes the status of LDAP security for the specified directory.\n"]

module DescribeRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_regions_request ->
    ( describe_regions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_regions_request ->
    ( describe_regions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Provides information about the Regions that are configured for multi-Region replication.\n"]

module DescribeSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_settings_request ->
    ( describe_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_settings_request ->
    ( describe_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Retrieves information about the configurable settings for the specified directory.\n"]

module DescribeSharedDirectories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_directories_request ->
    ( describe_shared_directories_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_shared_directories_request ->
    ( describe_shared_directories_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Returns the shared directories in your account. \n"]

module DescribeSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_snapshots_request ->
    ( describe_snapshots_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Obtains information about the directory snapshots that belong to this account.\n\n\
  \ This operation supports pagination with the use of the {i NextToken} request and response \
   parameters. If more results are available, the {i DescribeSnapshots.NextToken} member contains \
   a token that you pass in the next call to [DescribeSnapshots] to retrieve the next set of items.\n\
  \ \n\
  \  You can also specify a maximum number of return results with the {i Limit} parameter.\n\
  \  "]

module DescribeTrusts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusts_request ->
    ( describe_trusts_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusts_request ->
    ( describe_trusts_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Obtains information about the trust relationships for this account.\n\n\
  \ If no input parameters are provided, such as DirectoryId or TrustIds, this request describes \
   all the trust relationships belonging to the account.\n\
  \ "]

module DescribeUpdateDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_update_directory_request ->
    ( describe_update_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_update_directory_request ->
    ( describe_update_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc " Describes the updates of a directory for a particular update type. \n"]

module DisableCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `DisableAlreadyInProgressException of disable_already_in_progress_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_ca_enrollment_policy_request ->
    ( disable_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DisableAlreadyInProgressException of disable_already_in_progress_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_ca_enrollment_policy_request ->
    ( disable_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DisableAlreadyInProgressException of disable_already_in_progress_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Disables the certificate authority (CA) enrollment policy for the specified directory. This \
   stops automatic certificate enrollment and management for domain-joined clients, but does not \
   affect existing certificates.\n\n\
  \  Disabling the CA enrollment policy prevents new certificates from being automatically \
   enrolled, but existing certificates remain valid and functional until they expire.\n\
  \  \n\
  \   "]

module DisableClientAuthentication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_client_authentication_request ->
    ( disable_client_authentication_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_client_authentication_request ->
    ( disable_client_authentication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Disables alternative client authentication methods for the specified directory. \n"]

module DisableDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_directory_data_access_request ->
    ( disable_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_directory_data_access_request ->
    ( disable_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Deactivates access to directory data via the Directory Service Data API for the specified \
   directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html}Directory \
   Service Data API Reference}.\n"]

module DisableLDAPS : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_ldaps_request ->
    ( disable_ldaps_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_ldaps_request ->
    ( disable_ldaps_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Deactivates LDAP secure calls for the specified directory.\n"]

module DisableRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_radius_request ->
    ( disable_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_radius_request ->
    ( disable_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service \
   (RADIUS) server for an AD Connector or Microsoft AD directory.\n"]

module DisableSso : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_sso_request ->
    ( disable_sso_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_sso_request ->
    ( disable_sso_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Disables single-sign on for a directory.\n"]

module EnableCAEnrollmentPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EnableAlreadyInProgressException of enable_already_in_progress_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_ca_enrollment_policy_request ->
    ( enable_ca_enrollment_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EnableAlreadyInProgressException of enable_already_in_progress_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_ca_enrollment_policy_request ->
    ( enable_ca_enrollment_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EnableAlreadyInProgressException of enable_already_in_progress_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Enables certificate authority (CA) enrollment policy for the specified directory. This allows \
   domain-joined clients to automatically request and receive certificates from the specified \
   Amazon Web Services Private Certificate Authority.\n\n\
  \  Before enabling CA enrollment, ensure that the PCA connector is properly configured and \
   accessible from the directory. The connector must be in an active state and have the necessary \
   permissions.\n\
  \  \n\
  \   "]

module EnableClientAuthentication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
    | `NoAvailableCertificateException of no_available_certificate_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_client_authentication_request ->
    ( enable_client_authentication_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_client_authentication_request ->
    ( enable_client_authentication_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Enables alternative client authentication methods for the specified directory.\n"]

module EnableDirectoryDataAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_directory_data_access_request ->
    ( enable_directory_data_access_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_directory_data_access_request ->
    ( enable_directory_data_access_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Enables access to directory data via the Directory Service Data API for the specified \
   directory. For more information, see \
   {{:https://docs.aws.amazon.com/directoryservicedata/latest/DirectoryServiceDataAPIReference/Welcome.html}Directory \
   Service Data API Reference}.\n"]

module EnableLDAPS : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NoAvailableCertificateException of no_available_certificate_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_ldaps_request ->
    ( enable_ldaps_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_ldaps_request ->
    ( enable_ldaps_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NoAvailableCertificateException of no_available_certificate_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Activates the switch for the specific directory to always use LDAP secure calls.\n"]

module EnableRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityAlreadyExistsException of entity_already_exists_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_radius_request ->
    ( enable_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_radius_request ->
    ( enable_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityAlreadyExistsException of entity_already_exists_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service \
   (RADIUS) server for an AD Connector or Microsoft AD directory.\n"]

module EnableSso : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AuthenticationFailedException of authentication_failed_exception
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InsufficientPermissionsException of insufficient_permissions_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_sso_request ->
    ( enable_sso_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_sso_request ->
    ( enable_sso_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AuthenticationFailedException of authentication_failed_exception
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Enables single sign-on for a directory. Single sign-on allows users in your directory to access \
   certain Amazon Web Services services from a computer joined to the directory without having to \
   enter their credentials separately.\n"]

module GetDirectoryLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_directory_limits_request ->
    ( get_directory_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_directory_limits_request ->
    ( get_directory_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Obtains directory limit information for the current Region.\n"]

module GetSnapshotLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_limits_request ->
    ( get_snapshot_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_limits_request ->
    ( get_snapshot_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Obtains the manual snapshot limits for a directory.\n"]

module ListADAssessments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ad_assessments_request ->
    ( list_ad_assessments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ad_assessments_request ->
    ( list_ad_assessments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves a list of directory assessments for the specified directory or all assessments in \
   your account. Use this operation to monitor assessment status and manage multiple assessments.\n"]

module ListCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "For the specified directory, lists all the certificates registered for a secure LDAP or client \
   certificate authentication.\n"]

module ListIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ip_routes_request ->
    ( list_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ip_routes_request ->
    ( list_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Lists the address blocks that you have added to a directory.\n"]

module ListLogSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_subscriptions_request ->
    ( list_log_subscriptions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_subscriptions_request ->
    ( list_log_subscriptions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Lists the active log subscriptions for the Amazon Web Services account.\n"]

module ListSchemaExtensions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schema_extensions_request ->
    ( list_schema_extensions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schema_extensions_request ->
    ( list_schema_extensions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Lists all schema extensions applied to a Microsoft AD Directory.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Lists all tags on a directory.\n"]

module RegisterCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CertificateAlreadyExistsException of certificate_already_exists_exception
    | `CertificateLimitExceededException of certificate_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidCertificateException of invalid_certificate_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_certificate_request ->
    ( register_certificate_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateAlreadyExistsException of certificate_already_exists_exception
      | `CertificateLimitExceededException of certificate_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_certificate_request ->
    ( register_certificate_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CertificateAlreadyExistsException of certificate_already_exists_exception
      | `CertificateLimitExceededException of certificate_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidCertificateException of invalid_certificate_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Registers a certificate for a secure LDAP or client certificate authentication.\n"]

module RegisterEventTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_event_topic_request ->
    ( register_event_topic_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_event_topic_request ->
    ( register_event_topic_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Associates a directory with an Amazon SNS topic. This establishes the directory as a publisher \
   to the specified Amazon SNS topic. You can then receive email or text (SMS) messages when the \
   status of your directory changes. You get notified if your directory goes from an Active status \
   to an Impaired or Inoperable status. You also receive a notification when the directory returns \
   to an Active status.\n"]

module RejectSharedDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_shared_directory_request ->
    ( reject_shared_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_shared_directory_request ->
    ( reject_shared_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Rejects a directory sharing request that was sent from the directory owner account.\n"]

module RemoveIpRoutes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_ip_routes_request ->
    ( remove_ip_routes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_ip_routes_request ->
    ( remove_ip_routes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Removes IP address blocks from a directory.\n"]

module RemoveRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_region_request ->
    ( remove_region_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_region_request ->
    ( remove_region_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Stops all replication and removes the domain controllers from the specified Region. You cannot \
   remove the primary Region with this operation. Instead, use the [DeleteDirectory] API.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Removes tags from a directory.\n"]

module ResetUserPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidPasswordException of invalid_password_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UserDoesNotExistException of user_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_user_password_request ->
    ( reset_user_password_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidPasswordException of invalid_password_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserDoesNotExistException of user_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_user_password_request ->
    ( reset_user_password_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidPasswordException of invalid_password_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UserDoesNotExistException of user_does_not_exist_exception ] )
    result
end
[@@ocaml.doc
  "Resets the password for any user in your Managed Microsoft AD or Simple AD directory. Disabled \
   users will become enabled and can be authenticated following the API call.\n\n\
  \ You can reset the password for any user in your directory with the following exceptions:\n\
  \ \n\
  \  {ul\n\
  \        {-  For Simple AD, you cannot reset the password for any user that is a member of \
   either the {b Domain Admins} or {b Enterprise Admins} group except for the administrator user.\n\
  \            \n\
  \             }\n\
  \        {-  For Managed Microsoft AD, you can only reset the password for a user that is in an \
   OU based off of the NetBIOS name that you typed when you created your directory. For example, \
   you cannot reset the password for a user in the {b Amazon Web Services Reserved} OU. For more \
   information about the OU structure for an Managed Microsoft AD directory, see \
   {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html}What \
   Gets Created} in the {i Directory Service Administration Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module RestoreFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Restores a directory using an existing directory snapshot.\n\n\
  \ When you restore a directory from a snapshot, any changes made to the directory after the \
   snapshot date are overwritten.\n\
  \ \n\
  \  This action returns as soon as the restore operation is initiated. You can monitor the \
   progress of the restore operation by calling the [DescribeDirectories] operation with the \
   directory identifier. When the {b DirectoryDescription.Stage} value changes to [Active], the \
   restore operation is complete.\n\
  \  "]

module ShareDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryAlreadySharedException of directory_already_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTargetException of invalid_target_exception
    | `OrganizationsException of organizations_exception
    | `ServiceException of service_exception
    | `ShareLimitExceededException of share_limit_exceeded_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    share_directory_request ->
    ( share_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTargetException of invalid_target_exception
      | `OrganizationsException of organizations_exception
      | `ServiceException of service_exception
      | `ShareLimitExceededException of share_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    share_directory_request ->
    ( share_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryAlreadySharedException of directory_already_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTargetException of invalid_target_exception
      | `OrganizationsException of organizations_exception
      | `ServiceException of service_exception
      | `ShareLimitExceededException of share_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Shares a specified directory ([DirectoryId]) in your Amazon Web Services account (directory \
   owner) with another Amazon Web Services account (directory consumer). With this operation you \
   can use your directory from any Amazon Web Services account and from any Amazon VPC within an \
   Amazon Web Services Region.\n\n\
  \ When you share your Managed Microsoft AD directory, Directory Service creates a shared \
   directory in the directory consumer account. This shared directory contains the metadata to \
   provide access to the directory within the directory owner account. The shared directory is \
   visible in all VPCs in the directory consumer account.\n\
  \ \n\
  \  The [ShareMethod] parameter determines whether the specified directory can be shared between \
   Amazon Web Services accounts inside the same Amazon Web Services organization \
   ([ORGANIZATIONS]). It also determines whether you can share the directory with any other Amazon \
   Web Services account either inside or outside of the organization ([HANDSHAKE]).\n\
  \  \n\
  \   The [ShareNotes] parameter is only used when [HANDSHAKE] is called, which sends a directory \
   sharing request to the directory consumer. \n\
  \   "]

module StartADAssessment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ad_assessment_request ->
    ( start_ad_assessment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ad_assessment_request ->
    ( start_ad_assessment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Initiates a directory assessment to validate your self-managed AD environment for hybrid domain \
   join. The assessment checks compatibility and connectivity of the self-managed AD environment.\n\n\
  \ A directory assessment is automatically created when you create a hybrid directory. There are \
   two types of assessments: [CUSTOMER] and [SYSTEM]. Your Amazon Web Services account has a limit \
   of 100 [CUSTOMER] directory assessments.\n\
  \ \n\
  \  The assessment process typically takes 30 minutes or more to complete. The assessment process \
   is asynchronous and you can monitor it with [DescribeADAssessment].\n\
  \  \n\
  \   The [InstanceIds] must have a one-to-one correspondence with [CustomerDnsIps], meaning that \
   if the IP address for instance i-10243410 is 10.24.34.100 and the IP address for instance \
   i-10243420 is 10.24.34.200, then the input arrays must maintain the same order relationship, \
   either \\[10.24.34.100, 10.24.34.200\\] paired with \\[i-10243410, i-10243420\\] or \
   \\[10.24.34.200, 10.24.34.100\\] paired with \\[i-10243420, i-10243410\\].\n\
  \   \n\
  \    Note: You must provide exactly one [DirectoryId] or [AssessmentConfiguration].\n\
  \    "]

module StartSchemaExtension : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_schema_extension_request ->
    ( start_schema_extension_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_schema_extension_request ->
    ( start_schema_extension_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception ] )
    result
end
[@@ocaml.doc "Applies a schema extension to a Microsoft AD directory.\n"]

module UnshareDirectory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryNotSharedException of directory_not_shared_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidTargetException of invalid_target_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unshare_directory_request ->
    ( unshare_directory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryNotSharedException of directory_not_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidTargetException of invalid_target_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unshare_directory_request ->
    ( unshare_directory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryNotSharedException of directory_not_shared_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidTargetException of invalid_target_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc "Stops the directory sharing between the directory owner and consumer accounts. \n"]

module UpdateConditionalForwarder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_conditional_forwarder_request ->
    ( update_conditional_forwarder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_conditional_forwarder_request ->
    ( update_conditional_forwarder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates a conditional forwarder that has been set up for your Amazon Web Services directory.\n"]

module UpdateDirectorySetup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryInDesiredStateException of directory_in_desired_state_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_directory_setup_request ->
    ( update_directory_setup_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_directory_setup_request ->
    ( update_directory_setup_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryInDesiredStateException of directory_in_desired_state_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Updates directory configuration for the specified update type.\n"]

module UpdateHybridAD : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_hybrid_ad_request ->
    ( update_hybrid_ad_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_hybrid_ad_request ->
    ( update_hybrid_ad_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ADAssessmentLimitExceededException of ad_assessment_limit_exceeded_exception
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing hybrid directory. You can recover hybrid directory \
   administrator account or modify self-managed instance settings.\n\n\
  \ Updates are applied asynchronously. Use [DescribeHybridADUpdate] to monitor the progress of \
   configuration changes.\n\
  \ \n\
  \  The [InstanceIds] must have a one-to-one correspondence with [CustomerDnsIps], meaning that \
   if the IP address for instance i-10243410 is 10.24.34.100 and the IP address for instance \
   i-10243420 is 10.24.34.200, then the input arrays must maintain the same order relationship, \
   either \\[10.24.34.100, 10.24.34.200\\] paired with \\[i-10243410, i-10243420\\] or \
   \\[10.24.34.200, 10.24.34.100\\] paired with \\[i-10243420, i-10243410\\].\n\
  \  \n\
  \    You must provide at least one update to \
   [UpdateHybridADRequest$HybridAdministratorAccountUpdate] or \
   [UpdateHybridADRequest$SelfManagedInstancesSettings].\n\
  \    \n\
  \     "]

module UpdateNumberOfDomainControllers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_number_of_domain_controllers_request ->
    ( update_number_of_domain_controllers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_number_of_domain_controllers_request ->
    ( update_number_of_domain_controllers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Adds or removes domain controllers to or from the directory. Based on the difference between \
   current value and new value (provided through this API call), domain controllers will be added \
   or removed. It may take up to 45 minutes for any new domain controllers to become fully active \
   once the requested number of domain controllers is updated. During this time, you cannot make \
   another update request.\n"]

module UpdateRadius : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_radius_request ->
    ( update_radius_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_radius_request ->
    ( update_radius_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD \
   Connector or Microsoft AD directory.\n"]

module UpdateSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `DirectoryDoesNotExistException of directory_does_not_exist_exception
    | `DirectoryUnavailableException of directory_unavailable_exception
    | `IncompatibleSettingsException of incompatible_settings_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception
    | `UnsupportedSettingsException of unsupported_settings_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_settings_request ->
    ( update_settings_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `IncompatibleSettingsException of incompatible_settings_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedSettingsException of unsupported_settings_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_settings_request ->
    ( update_settings_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `DirectoryDoesNotExistException of directory_does_not_exist_exception
      | `DirectoryUnavailableException of directory_unavailable_exception
      | `IncompatibleSettingsException of incompatible_settings_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception
      | `UnsupportedSettingsException of unsupported_settings_exception ] )
    result
end
[@@ocaml.doc "Updates the configurable settings for the specified directory.\n"]

module UpdateTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trust_request ->
    ( update_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trust_request ->
    ( update_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception ] )
    result
end
[@@ocaml.doc
  "Updates the trust that has been set up between your Managed Microsoft AD directory and an \
   self-managed Active Directory.\n"]

(** {1:Serialization and Deserialization} *)
module VerifyTrust : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ClientException of client_exception
    | `EntityDoesNotExistException of entity_does_not_exist_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServiceException of service_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_trust_request ->
    ( verify_trust_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_trust_request ->
    ( verify_trust_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ClientException of client_exception
      | `EntityDoesNotExistException of entity_does_not_exist_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServiceException of service_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Directory Service for Microsoft Active Directory allows you to configure and verify trust \
   relationships.\n\n\
  \ This action verifies a trust relationship between your Managed Microsoft AD directory and an \
   external domain.\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
