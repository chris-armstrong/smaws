open Types

let make_verify_trust_request ~trust_id:(trust_id_ : trust_id) () =
  ({ trust_id = trust_id_ } : verify_trust_request)

let make_os_update_settings ?os_version:(os_version_ : os_version option) () =
  ({ os_version = os_version_ } : os_update_settings)

let make_update_value ?os_update_settings:(os_update_settings_ : os_update_settings option) () =
  ({ os_update_settings = os_update_settings_ } : update_value)

let make_update_trust_request ?selective_auth:(selective_auth_ : selective_auth option)
    ~trust_id:(trust_id_ : trust_id) () =
  ({ selective_auth = selective_auth_; trust_id = trust_id_ } : update_trust_request)

let make_setting ~value:(value_ : directory_configuration_setting_value)
    ~name:(name_ : directory_configuration_setting_name) () =
  ({ value = value_; name = name_ } : setting)

let make_update_settings_request ~settings:(settings_ : settings)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ settings = settings_; directory_id = directory_id_ } : update_settings_request)

let make_radius_settings ?use_same_username:(use_same_username_ : use_same_username option)
    ?display_label:(display_label_ : radius_display_label option)
    ?authentication_protocol:(authentication_protocol_ : radius_authentication_protocol option)
    ?shared_secret:(shared_secret_ : radius_shared_secret option)
    ?radius_retries:(radius_retries_ : radius_retries option)
    ?radius_timeout:(radius_timeout_ : radius_timeout option)
    ?radius_port:(radius_port_ : port_number option)
    ?radius_servers:(radius_servers_ : servers option) () =
  ({
     use_same_username = use_same_username_;
     display_label = display_label_;
     authentication_protocol = authentication_protocol_;
     shared_secret = shared_secret_;
     radius_retries = radius_retries_;
     radius_timeout = radius_timeout_;
     radius_port = radius_port_;
     radius_servers = radius_servers_;
   }
    : radius_settings)

let make_update_radius_request ~radius_settings:(radius_settings_ : radius_settings)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ radius_settings = radius_settings_; directory_id = directory_id_ } : update_radius_request)

let make_update_number_of_domain_controllers_request
    ~desired_number:(desired_number_ : desired_number_of_domain_controllers)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ desired_number = desired_number_; directory_id = directory_id_ }
    : update_number_of_domain_controllers_request)

let make_update_info_entry
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?start_time:(start_time_ : start_date_time option)
    ?previous_value:(previous_value_ : update_value option)
    ?new_value:(new_value_ : update_value option)
    ?initiated_by:(initiated_by_ : initiated_by option)
    ?status_reason:(status_reason_ : update_status_reason option)
    ?status:(status_ : update_status option) ?region:(region_ : region_name option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     start_time = start_time_;
     previous_value = previous_value_;
     new_value = new_value_;
     initiated_by = initiated_by_;
     status_reason = status_reason_;
     status = status_;
     region = region_;
   }
    : update_info_entry)

let make_update_directory_setup_request
    ?create_snapshot_before_update:
      (create_snapshot_before_update_ : create_snapshot_before_update option)
    ?os_update_settings:(os_update_settings_ : os_update_settings option)
    ~update_type:(update_type_ : update_type) ~directory_id:(directory_id_ : directory_id) () =
  ({
     create_snapshot_before_update = create_snapshot_before_update_;
     os_update_settings = os_update_settings_;
     update_type = update_type_;
     directory_id = directory_id_;
   }
    : update_directory_setup_request)

let make_update_conditional_forwarder_request ~dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     dns_ip_addrs = dns_ip_addrs_;
     remote_domain_name = remote_domain_name_;
     directory_id = directory_id_;
   }
    : update_conditional_forwarder_request)

let make_unshare_target ~type_:(type__ : target_type) ~id:(id_ : target_id) () =
  ({ type_ = type__; id = id_ } : unshare_target)

let make_unshare_directory_request ~unshare_target:(unshare_target_ : unshare_target)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ unshare_target = unshare_target_; directory_id = directory_id_ } : unshare_directory_request)

let make_trust ?selective_auth:(selective_auth_ : selective_auth option)
    ?trust_state_reason:(trust_state_reason_ : trust_state_reason option)
    ?state_last_updated_date_time:
      (state_last_updated_date_time_ : state_last_updated_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?trust_state:(trust_state_ : trust_state option)
    ?trust_direction:(trust_direction_ : trust_direction option)
    ?trust_type:(trust_type_ : trust_type option)
    ?remote_domain_name:(remote_domain_name_ : remote_domain_name option)
    ?trust_id:(trust_id_ : trust_id option) ?directory_id:(directory_id_ : directory_id option) () =
  ({
     selective_auth = selective_auth_;
     trust_state_reason = trust_state_reason_;
     state_last_updated_date_time = state_last_updated_date_time_;
     last_updated_date_time = last_updated_date_time_;
     created_date_time = created_date_time_;
     trust_state = trust_state_;
     trust_direction = trust_direction_;
     trust_type = trust_type_;
     remote_domain_name = remote_domain_name_;
     trust_id = trust_id_;
     directory_id = directory_id_;
   }
    : trust)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_start_schema_extension_request ~description:(description_ : description)
    ~ldif_content:(ldif_content_ : ldif_content)
    ~create_snapshot_before_schema_extension:
      (create_snapshot_before_schema_extension_ : create_snapshot_before_schema_extension)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     description = description_;
     ldif_content = ldif_content_;
     create_snapshot_before_schema_extension = create_snapshot_before_schema_extension_;
     directory_id = directory_id_;
   }
    : start_schema_extension_request)

let make_snapshot ?start_time:(start_time_ : start_time option)
    ?status:(status_ : snapshot_status option) ?name:(name_ : snapshot_name option)
    ?type_:(type__ : snapshot_type option) ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     start_time = start_time_;
     status = status_;
     name = name_;
     type_ = type__;
     snapshot_id = snapshot_id_;
     directory_id = directory_id_;
   }
    : snapshot)

let make_snapshot_limits
    ?manual_snapshots_limit_reached:
      (manual_snapshots_limit_reached_ : manual_snapshots_limit_reached option)
    ?manual_snapshots_current_count:(manual_snapshots_current_count_ : limit option)
    ?manual_snapshots_limit:(manual_snapshots_limit_ : limit option) () =
  ({
     manual_snapshots_limit_reached = manual_snapshots_limit_reached_;
     manual_snapshots_current_count = manual_snapshots_current_count_;
     manual_snapshots_limit = manual_snapshots_limit_;
   }
    : snapshot_limits)

let make_shared_directory
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?share_notes:(share_notes_ : notes option) ?share_status:(share_status_ : share_status option)
    ?shared_directory_id:(shared_directory_id_ : directory_id option)
    ?shared_account_id:(shared_account_id_ : customer_id option)
    ?share_method:(share_method_ : share_method option)
    ?owner_directory_id:(owner_directory_id_ : directory_id option)
    ?owner_account_id:(owner_account_id_ : customer_id option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     created_date_time = created_date_time_;
     share_notes = share_notes_;
     share_status = share_status_;
     shared_directory_id = shared_directory_id_;
     shared_account_id = shared_account_id_;
     share_method = share_method_;
     owner_directory_id = owner_directory_id_;
     owner_account_id = owner_account_id_;
   }
    : shared_directory)

let make_share_target ~type_:(type__ : target_type) ~id:(id_ : target_id) () =
  ({ type_ = type__; id = id_ } : share_target)

let make_share_directory_request ?share_notes:(share_notes_ : notes option)
    ~share_method:(share_method_ : share_method) ~share_target:(share_target_ : share_target)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     share_method = share_method_;
     share_target = share_target_;
     share_notes = share_notes_;
     directory_id = directory_id_;
   }
    : share_directory_request)

let make_setting_entry ?data_type:(data_type_ : directory_configuration_setting_data_type option)
    ?last_requested_date_time:
      (last_requested_date_time_ : directory_configuration_setting_last_requested_date_time option)
    ?last_updated_date_time:
      (last_updated_date_time_ : directory_configuration_setting_last_updated_date_time option)
    ?request_status_message:
      (request_status_message_ : directory_configuration_setting_request_status_message option)
    ?request_detailed_status:
      (request_detailed_status_ : directory_configuration_setting_request_detailed_status option)
    ?request_status:(request_status_ : directory_configuration_status option)
    ?requested_value:(requested_value_ : directory_configuration_setting_value option)
    ?applied_value:(applied_value_ : directory_configuration_setting_value option)
    ?allowed_values:(allowed_values_ : directory_configuration_setting_allowed_values option)
    ?name:(name_ : directory_configuration_setting_name option)
    ?type_:(type__ : directory_configuration_setting_type option) () =
  ({
     data_type = data_type_;
     last_requested_date_time = last_requested_date_time_;
     last_updated_date_time = last_updated_date_time_;
     request_status_message = request_status_message_;
     request_detailed_status = request_detailed_status_;
     request_status = request_status_;
     requested_value = requested_value_;
     applied_value = applied_value_;
     allowed_values = allowed_values_;
     name = name_;
     type_ = type__;
   }
    : setting_entry)

let make_schema_extension_info ?end_date_time:(end_date_time_ : end_date_time option)
    ?start_date_time:(start_date_time_ : start_date_time option)
    ?schema_extension_status_reason:
      (schema_extension_status_reason_ : schema_extension_status_reason option)
    ?schema_extension_status:(schema_extension_status_ : schema_extension_status option)
    ?description:(description_ : description option)
    ?schema_extension_id:(schema_extension_id_ : schema_extension_id option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     end_date_time = end_date_time_;
     start_date_time = start_date_time_;
     schema_extension_status_reason = schema_extension_status_reason_;
     schema_extension_status = schema_extension_status_;
     description = description_;
     schema_extension_id = schema_extension_id_;
     directory_id = directory_id_;
   }
    : schema_extension_info)

let make_restore_from_snapshot_request ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ snapshot_id = snapshot_id_ } : restore_from_snapshot_request)

let make_reset_user_password_request ~new_password:(new_password_ : user_password)
    ~user_name:(user_name_ : customer_user_name) ~directory_id:(directory_id_ : directory_id) () =
  ({ new_password = new_password_; user_name = user_name_; directory_id = directory_id_ }
    : reset_user_password_request)

let make_remove_tags_from_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ tag_keys = tag_keys_; resource_id = resource_id_ } : remove_tags_from_resource_request)

let make_remove_region_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : remove_region_request)

let make_remove_ip_routes_request ~cidr_ips:(cidr_ips_ : cidr_ips)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ cidr_ips = cidr_ips_; directory_id = directory_id_ } : remove_ip_routes_request)

let make_reject_shared_directory_request ~shared_directory_id:(shared_directory_id_ : directory_id)
    () =
  ({ shared_directory_id = shared_directory_id_ } : reject_shared_directory_request)

let make_register_event_topic_request ~topic_name:(topic_name_ : topic_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ topic_name = topic_name_; directory_id = directory_id_ } : register_event_topic_request)

let make_client_cert_auth_settings ?ocsp_url:(ocsp_url_ : ocsp_url option) () =
  ({ ocsp_url = ocsp_url_ } : client_cert_auth_settings)

let make_register_certificate_request
    ?client_cert_auth_settings:(client_cert_auth_settings_ : client_cert_auth_settings option)
    ?type_:(type__ : certificate_type option)
    ~certificate_data:(certificate_data_ : certificate_data)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     client_cert_auth_settings = client_cert_auth_settings_;
     type_ = type__;
     certificate_data = certificate_data_;
     directory_id = directory_id_;
   }
    : register_certificate_request)

let make_regions_info ?additional_regions:(additional_regions_ : additional_regions option)
    ?primary_region:(primary_region_ : region_name option) () =
  ({ additional_regions = additional_regions_; primary_region = primary_region_ } : regions_info)

let make_directory_vpc_settings ~subnet_ids:(subnet_ids_ : subnet_ids) ~vpc_id:(vpc_id_ : vpc_id) ()
    =
  ({ subnet_ids = subnet_ids_; vpc_id = vpc_id_ } : directory_vpc_settings)

let make_region_description
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?status_last_updated_date_time:
      (status_last_updated_date_time_ : state_last_updated_date_time option)
    ?launch_time:(launch_time_ : launch_time option)
    ?desired_number_of_domain_controllers:
      (desired_number_of_domain_controllers_ : desired_number_of_domain_controllers option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings option)
    ?status:(status_ : directory_stage option) ?region_type:(region_type_ : region_type option)
    ?region_name:(region_name_ : region_name option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     status_last_updated_date_time = status_last_updated_date_time_;
     launch_time = launch_time_;
     desired_number_of_domain_controllers = desired_number_of_domain_controllers_;
     vpc_settings = vpc_settings_;
     status = status_;
     region_type = region_type_;
     region_name = region_name_;
     directory_id = directory_id_;
   }
    : region_description)

let make_directory_vpc_settings_description
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?security_group_id:(security_group_id_ : security_group_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) ?vpc_id:(vpc_id_ : vpc_id option) () =
  ({
     availability_zones = availability_zones_;
     security_group_id = security_group_id_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
   }
    : directory_vpc_settings_description)

let make_owner_directory_description ?radius_status:(radius_status_ : radius_status option)
    ?radius_settings:(radius_settings_ : radius_settings option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings_description option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?account_id:(account_id_ : customer_id option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     radius_status = radius_status_;
     radius_settings = radius_settings_;
     vpc_settings = vpc_settings_;
     dns_ip_addrs = dns_ip_addrs_;
     account_id = account_id_;
     directory_id = directory_id_;
   }
    : owner_directory_description)

let make_log_subscription
    ?subscription_created_date_time:
      (subscription_created_date_time_ : subscription_created_date_time option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     subscription_created_date_time = subscription_created_date_time_;
     log_group_name = log_group_name_;
     directory_id = directory_id_;
   }
    : log_subscription)

let make_list_tags_for_resource_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) ~resource_id:(resource_id_ : resource_id) () =
  ({ limit = limit_; next_token = next_token_; resource_id = resource_id_ }
    : list_tags_for_resource_request)

let make_list_schema_extensions_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ limit = limit_; next_token = next_token_; directory_id = directory_id_ }
    : list_schema_extensions_request)

let make_list_log_subscriptions_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({ limit = limit_; next_token = next_token_; directory_id = directory_id_ }
    : list_log_subscriptions_request)

let make_ip_route_info ?description:(description_ : description option)
    ?ip_route_status_reason:(ip_route_status_reason_ : ip_route_status_reason option)
    ?added_date_time:(added_date_time_ : added_date_time option)
    ?ip_route_status_msg:(ip_route_status_msg_ : ip_route_status_msg option)
    ?cidr_ip:(cidr_ip_ : cidr_ip option) ?directory_id:(directory_id_ : directory_id option) () =
  ({
     description = description_;
     ip_route_status_reason = ip_route_status_reason_;
     added_date_time = added_date_time_;
     ip_route_status_msg = ip_route_status_msg_;
     cidr_ip = cidr_ip_;
     directory_id = directory_id_;
   }
    : ip_route_info)

let make_list_ip_routes_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ limit = limit_; next_token = next_token_; directory_id = directory_id_ }
    : list_ip_routes_request)

let make_certificate_info ?type_:(type__ : certificate_type option)
    ?expiry_date_time:(expiry_date_time_ : certificate_expiry_date_time option)
    ?state:(state_ : certificate_state option) ?common_name:(common_name_ : certificate_c_n option)
    ?certificate_id:(certificate_id_ : certificate_id option) () =
  ({
     type_ = type__;
     expiry_date_time = expiry_date_time_;
     state = state_;
     common_name = common_name_;
     certificate_id = certificate_id_;
   }
    : certificate_info)

let make_list_certificates_request ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ limit = limit_; next_token = next_token_; directory_id = directory_id_ }
    : list_certificates_request)

let make_ldaps_setting_info
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?ldaps_status_reason:(ldaps_status_reason_ : ldaps_status_reason option)
    ?ldaps_status:(ldaps_status_ : ldaps_status option) () =
  ({
     last_updated_date_time = last_updated_date_time_;
     ldaps_status_reason = ldaps_status_reason_;
     ldaps_status = ldaps_status_;
   }
    : ldaps_setting_info)

let make_ip_route ?description:(description_ : description option)
    ?cidr_ip:(cidr_ip_ : cidr_ip option) () =
  ({ description = description_; cidr_ip = cidr_ip_ } : ip_route)

let make_get_snapshot_limits_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : get_snapshot_limits_request)

let make_directory_limits
    ?connected_directories_limit_reached:
      (connected_directories_limit_reached_ : connected_directories_limit_reached option)
    ?connected_directories_current_count:(connected_directories_current_count_ : limit option)
    ?connected_directories_limit:(connected_directories_limit_ : limit option)
    ?cloud_only_microsoft_ad_limit_reached:
      (cloud_only_microsoft_ad_limit_reached_ : cloud_only_directories_limit_reached option)
    ?cloud_only_microsoft_ad_current_count:(cloud_only_microsoft_ad_current_count_ : limit option)
    ?cloud_only_microsoft_ad_limit:(cloud_only_microsoft_ad_limit_ : limit option)
    ?cloud_only_directories_limit_reached:
      (cloud_only_directories_limit_reached_ : cloud_only_directories_limit_reached option)
    ?cloud_only_directories_current_count:(cloud_only_directories_current_count_ : limit option)
    ?cloud_only_directories_limit:(cloud_only_directories_limit_ : limit option) () =
  ({
     connected_directories_limit_reached = connected_directories_limit_reached_;
     connected_directories_current_count = connected_directories_current_count_;
     connected_directories_limit = connected_directories_limit_;
     cloud_only_microsoft_ad_limit_reached = cloud_only_microsoft_ad_limit_reached_;
     cloud_only_microsoft_ad_current_count = cloud_only_microsoft_ad_current_count_;
     cloud_only_microsoft_ad_limit = cloud_only_microsoft_ad_limit_;
     cloud_only_directories_limit_reached = cloud_only_directories_limit_reached_;
     cloud_only_directories_current_count = cloud_only_directories_current_count_;
     cloud_only_directories_limit = cloud_only_directories_limit_;
   }
    : directory_limits)

let make_get_directory_limits_request () = (() : unit)

let make_event_topic ?status:(status_ : topic_status option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?topic_arn:(topic_arn_ : topic_arn option) ?topic_name:(topic_name_ : topic_name option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     status = status_;
     created_date_time = created_date_time_;
     topic_arn = topic_arn_;
     topic_name = topic_name_;
     directory_id = directory_id_;
   }
    : event_topic)

let make_enable_sso_request ?password:(password_ : connect_password option)
    ?user_name:(user_name_ : user_name option) ~directory_id:(directory_id_ : directory_id) () =
  ({ password = password_; user_name = user_name_; directory_id = directory_id_ }
    : enable_sso_request)

let make_enable_radius_request ~radius_settings:(radius_settings_ : radius_settings)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ radius_settings = radius_settings_; directory_id = directory_id_ } : enable_radius_request)

let make_enable_ldaps_request ~type_:(type__ : ldaps_type)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ type_ = type__; directory_id = directory_id_ } : enable_ldaps_request)

let make_enable_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : enable_directory_data_access_request)

let make_enable_client_authentication_request ~type_:(type__ : client_authentication_type)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ type_ = type__; directory_id = directory_id_ } : enable_client_authentication_request)

let make_domain_controller
    ?status_last_updated_date_time:(status_last_updated_date_time_ : last_updated_date_time option)
    ?launch_time:(launch_time_ : launch_time option)
    ?status_reason:(status_reason_ : domain_controller_status_reason option)
    ?status:(status_ : domain_controller_status option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?dns_ip_addr:(dns_ip_addr_ : ip_addr option)
    ?domain_controller_id:(domain_controller_id_ : domain_controller_id option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     status_last_updated_date_time = status_last_updated_date_time_;
     launch_time = launch_time_;
     status_reason = status_reason_;
     status = status_;
     availability_zone = availability_zone_;
     subnet_id = subnet_id_;
     vpc_id = vpc_id_;
     dns_ip_addr = dns_ip_addr_;
     domain_controller_id = domain_controller_id_;
     directory_id = directory_id_;
   }
    : domain_controller)

let make_disable_sso_request ?password:(password_ : connect_password option)
    ?user_name:(user_name_ : user_name option) ~directory_id:(directory_id_ : directory_id) () =
  ({ password = password_; user_name = user_name_; directory_id = directory_id_ }
    : disable_sso_request)

let make_disable_radius_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : disable_radius_request)

let make_disable_ldaps_request ~type_:(type__ : ldaps_type)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ type_ = type__; directory_id = directory_id_ } : disable_ldaps_request)

let make_disable_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : disable_directory_data_access_request)

let make_disable_client_authentication_request ~type_:(type__ : client_authentication_type)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ type_ = type__; directory_id = directory_id_ } : disable_client_authentication_request)

let make_describe_update_directory_request ?next_token:(next_token_ : next_token option)
    ?region_name:(region_name_ : region_name option) ~update_type:(update_type_ : update_type)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     next_token = next_token_;
     region_name = region_name_;
     update_type = update_type_;
     directory_id = directory_id_;
   }
    : describe_update_directory_request)

let make_describe_trusts_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option) ?trust_ids:(trust_ids_ : trust_ids option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     trust_ids = trust_ids_;
     directory_id = directory_id_;
   }
    : describe_trusts_request)

let make_describe_snapshots_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ?snapshot_ids:(snapshot_ids_ : snapshot_ids option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     snapshot_ids = snapshot_ids_;
     directory_id = directory_id_;
   }
    : describe_snapshots_request)

let make_describe_shared_directories_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ?shared_directory_ids:(shared_directory_ids_ : directory_ids option)
    ~owner_directory_id:(owner_directory_id_ : directory_id) () =
  ({
     limit = limit_;
     next_token = next_token_;
     shared_directory_ids = shared_directory_ids_;
     owner_directory_id = owner_directory_id_;
   }
    : describe_shared_directories_request)

let make_describe_settings_request ?next_token:(next_token_ : next_token option)
    ?status:(status_ : directory_configuration_status option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ next_token = next_token_; status = status_; directory_id = directory_id_ }
    : describe_settings_request)

let make_describe_regions_request ?next_token:(next_token_ : next_token option)
    ?region_name:(region_name_ : region_name option) ~directory_id:(directory_id_ : directory_id) ()
    =
  ({ next_token = next_token_; region_name = region_name_; directory_id = directory_id_ }
    : describe_regions_request)

let make_describe_ldaps_settings_request ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : next_token option) ?type_:(type__ : ldaps_type option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ limit = limit_; next_token = next_token_; type_ = type__; directory_id = directory_id_ }
    : describe_ldaps_settings_request)

let make_describe_event_topics_request ?topic_names:(topic_names_ : topic_names option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({ topic_names = topic_names_; directory_id = directory_id_ } : describe_event_topics_request)

let make_describe_domain_controllers_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ?domain_controller_ids:(domain_controller_ids_ : domain_controller_ids option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     limit = limit_;
     next_token = next_token_;
     domain_controller_ids = domain_controller_ids_;
     directory_id = directory_id_;
   }
    : describe_domain_controllers_request)

let make_describe_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : describe_directory_data_access_request)

let make_directory_connect_settings_description ?connect_ips:(connect_ips_ : ip_addrs option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?security_group_id:(security_group_id_ : security_group_id option)
    ?customer_user_name:(customer_user_name_ : user_name option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) ?vpc_id:(vpc_id_ : vpc_id option) () =
  ({
     connect_ips = connect_ips_;
     availability_zones = availability_zones_;
     security_group_id = security_group_id_;
     customer_user_name = customer_user_name_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
   }
    : directory_connect_settings_description)

let make_directory_description ?os_version:(os_version_ : os_version option)
    ?regions_info:(regions_info_ : regions_info option)
    ?owner_directory_description:(owner_directory_description_ : owner_directory_description option)
    ?desired_number_of_domain_controllers:
      (desired_number_of_domain_controllers_ : desired_number_of_domain_controllers option)
    ?sso_enabled:(sso_enabled_ : sso_enabled option)
    ?stage_reason:(stage_reason_ : stage_reason option)
    ?radius_status:(radius_status_ : radius_status option)
    ?radius_settings:(radius_settings_ : radius_settings option)
    ?connect_settings:(connect_settings_ : directory_connect_settings_description option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings_description option)
    ?type_:(type__ : directory_type option)
    ?stage_last_updated_date_time:(stage_last_updated_date_time_ : last_updated_date_time option)
    ?launch_time:(launch_time_ : launch_time option) ?share_notes:(share_notes_ : notes option)
    ?share_method:(share_method_ : share_method option)
    ?share_status:(share_status_ : share_status option) ?stage:(stage_ : directory_stage option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?description:(description_ : description option) ?access_url:(access_url_ : access_url option)
    ?alias:(alias_ : alias_name option) ?edition:(edition_ : directory_edition option)
    ?size:(size_ : directory_size option) ?short_name:(short_name_ : directory_short_name option)
    ?name:(name_ : directory_name option) ?directory_id:(directory_id_ : directory_id option) () =
  ({
     os_version = os_version_;
     regions_info = regions_info_;
     owner_directory_description = owner_directory_description_;
     desired_number_of_domain_controllers = desired_number_of_domain_controllers_;
     sso_enabled = sso_enabled_;
     stage_reason = stage_reason_;
     radius_status = radius_status_;
     radius_settings = radius_settings_;
     connect_settings = connect_settings_;
     vpc_settings = vpc_settings_;
     type_ = type__;
     stage_last_updated_date_time = stage_last_updated_date_time_;
     launch_time = launch_time_;
     share_notes = share_notes_;
     share_method = share_method_;
     share_status = share_status_;
     stage = stage_;
     dns_ip_addrs = dns_ip_addrs_;
     description = description_;
     access_url = access_url_;
     alias = alias_;
     edition = edition_;
     size = size_;
     short_name = short_name_;
     name = name_;
     directory_id = directory_id_;
   }
    : directory_description)

let make_describe_directories_request ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : next_token option)
    ?directory_ids:(directory_ids_ : directory_ids option) () =
  ({ limit = limit_; next_token = next_token_; directory_ids = directory_ids_ }
    : describe_directories_request)

let make_conditional_forwarder ?replication_scope:(replication_scope_ : replication_scope option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?remote_domain_name:(remote_domain_name_ : remote_domain_name option) () =
  ({
     replication_scope = replication_scope_;
     dns_ip_addrs = dns_ip_addrs_;
     remote_domain_name = remote_domain_name_;
   }
    : conditional_forwarder)

let make_describe_conditional_forwarders_request
    ?remote_domain_names:(remote_domain_names_ : remote_domain_names option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ remote_domain_names = remote_domain_names_; directory_id = directory_id_ }
    : describe_conditional_forwarders_request)

let make_client_authentication_setting_info
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?status:(status_ : client_authentication_status option)
    ?type_:(type__ : client_authentication_type option) () =
  ({ last_updated_date_time = last_updated_date_time_; status = status_; type_ = type__ }
    : client_authentication_setting_info)

let make_describe_client_authentication_settings_request ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : next_token option)
    ?type_:(type__ : client_authentication_type option) ~directory_id:(directory_id_ : directory_id)
    () =
  ({ limit = limit_; next_token = next_token_; type_ = type__; directory_id = directory_id_ }
    : describe_client_authentication_settings_request)

let make_certificate
    ?client_cert_auth_settings:(client_cert_auth_settings_ : client_cert_auth_settings option)
    ?type_:(type__ : certificate_type option)
    ?expiry_date_time:(expiry_date_time_ : certificate_expiry_date_time option)
    ?registered_date_time:(registered_date_time_ : certificate_registered_date_time option)
    ?common_name:(common_name_ : certificate_c_n option)
    ?state_reason:(state_reason_ : certificate_state_reason option)
    ?state:(state_ : certificate_state option)
    ?certificate_id:(certificate_id_ : certificate_id option) () =
  ({
     client_cert_auth_settings = client_cert_auth_settings_;
     type_ = type__;
     expiry_date_time = expiry_date_time_;
     registered_date_time = registered_date_time_;
     common_name = common_name_;
     state_reason = state_reason_;
     state = state_;
     certificate_id = certificate_id_;
   }
    : certificate)

let make_describe_certificate_request ~certificate_id:(certificate_id_ : certificate_id)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ certificate_id = certificate_id_; directory_id = directory_id_ }
    : describe_certificate_request)

let make_deregister_event_topic_request ~topic_name:(topic_name_ : topic_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ topic_name = topic_name_; directory_id = directory_id_ } : deregister_event_topic_request)

let make_deregister_certificate_request ~certificate_id:(certificate_id_ : certificate_id)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ certificate_id = certificate_id_; directory_id = directory_id_ }
    : deregister_certificate_request)

let make_delete_trust_request
    ?delete_associated_conditional_forwarder:
      (delete_associated_conditional_forwarder_ : delete_associated_conditional_forwarder option)
    ~trust_id:(trust_id_ : trust_id) () =
  ({
     delete_associated_conditional_forwarder = delete_associated_conditional_forwarder_;
     trust_id = trust_id_;
   }
    : delete_trust_request)

let make_delete_snapshot_request ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ snapshot_id = snapshot_id_ } : delete_snapshot_request)

let make_delete_log_subscription_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : delete_log_subscription_request)

let make_delete_directory_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : delete_directory_request)

let make_delete_conditional_forwarder_request
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ remote_domain_name = remote_domain_name_; directory_id = directory_id_ }
    : delete_conditional_forwarder_request)

let make_create_trust_request ?selective_auth:(selective_auth_ : selective_auth option)
    ?conditional_forwarder_ip_addrs:(conditional_forwarder_ip_addrs_ : dns_ip_addrs option)
    ?trust_type:(trust_type_ : trust_type option)
    ~trust_direction:(trust_direction_ : trust_direction)
    ~trust_password:(trust_password_ : trust_password)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     selective_auth = selective_auth_;
     conditional_forwarder_ip_addrs = conditional_forwarder_ip_addrs_;
     trust_type = trust_type_;
     trust_direction = trust_direction_;
     trust_password = trust_password_;
     remote_domain_name = remote_domain_name_;
     directory_id = directory_id_;
   }
    : create_trust_request)

let make_create_snapshot_request ?name:(name_ : snapshot_name option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ name = name_; directory_id = directory_id_ } : create_snapshot_request)

let make_create_microsoft_ad_request ?tags:(tags_ : tags option)
    ?edition:(edition_ : directory_edition option) ?description:(description_ : description option)
    ?short_name:(short_name_ : directory_short_name option)
    ~vpc_settings:(vpc_settings_ : directory_vpc_settings) ~password:(password_ : password)
    ~name:(name_ : directory_name) () =
  ({
     tags = tags_;
     edition = edition_;
     vpc_settings = vpc_settings_;
     description = description_;
     password = password_;
     short_name = short_name_;
     name = name_;
   }
    : create_microsoft_ad_request)

let make_create_log_subscription_request ~log_group_name:(log_group_name_ : log_group_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ log_group_name = log_group_name_; directory_id = directory_id_ }
    : create_log_subscription_request)

let make_create_directory_request ?tags:(tags_ : tags option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings option)
    ?description:(description_ : description option)
    ?short_name:(short_name_ : directory_short_name option) ~size:(size_ : directory_size)
    ~password:(password_ : password) ~name:(name_ : directory_name) () =
  ({
     tags = tags_;
     vpc_settings = vpc_settings_;
     size = size_;
     description = description_;
     password = password_;
     short_name = short_name_;
     name = name_;
   }
    : create_directory_request)

let make_create_conditional_forwarder_request ~dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     dns_ip_addrs = dns_ip_addrs_;
     remote_domain_name = remote_domain_name_;
     directory_id = directory_id_;
   }
    : create_conditional_forwarder_request)

let make_attribute ?value:(value_ : attribute_value option) ?name:(name_ : attribute_name option) ()
    =
  ({ value = value_; name = name_ } : attribute)

let make_computer ?computer_attributes:(computer_attributes_ : attributes option)
    ?computer_name:(computer_name_ : computer_name option) ?computer_id:(computer_id_ : si_d option)
    () =
  ({
     computer_attributes = computer_attributes_;
     computer_name = computer_name_;
     computer_id = computer_id_;
   }
    : computer)

let make_create_computer_request ?computer_attributes:(computer_attributes_ : attributes option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_d_n option)
    ~password:(password_ : computer_password) ~computer_name:(computer_name_ : computer_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     computer_attributes = computer_attributes_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     password = password_;
     computer_name = computer_name_;
     directory_id = directory_id_;
   }
    : create_computer_request)

let make_create_alias_request ~alias:(alias_ : alias_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ alias = alias_; directory_id = directory_id_ } : create_alias_request)

let make_directory_connect_settings ~customer_user_name:(customer_user_name_ : user_name)
    ~customer_dns_ips:(customer_dns_ips_ : dns_ip_addrs) ~subnet_ids:(subnet_ids_ : subnet_ids)
    ~vpc_id:(vpc_id_ : vpc_id) () =
  ({
     customer_user_name = customer_user_name_;
     customer_dns_ips = customer_dns_ips_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
   }
    : directory_connect_settings)

let make_connect_directory_request ?tags:(tags_ : tags option)
    ?description:(description_ : description option)
    ?short_name:(short_name_ : directory_short_name option)
    ~connect_settings:(connect_settings_ : directory_connect_settings)
    ~size:(size_ : directory_size) ~password:(password_ : connect_password)
    ~name:(name_ : directory_name) () =
  ({
     tags = tags_;
     connect_settings = connect_settings_;
     size = size_;
     description = description_;
     password = password_;
     short_name = short_name_;
     name = name_;
   }
    : connect_directory_request)

let make_cancel_schema_extension_request
    ~schema_extension_id:(schema_extension_id_ : schema_extension_id)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ schema_extension_id = schema_extension_id_; directory_id = directory_id_ }
    : cancel_schema_extension_request)

let make_add_tags_to_resource_request ~tags:(tags_ : tags) ~resource_id:(resource_id_ : resource_id)
    () =
  ({ tags = tags_; resource_id = resource_id_ } : add_tags_to_resource_request)

let make_add_region_request ~vpc_settings:(vpc_settings_ : directory_vpc_settings)
    ~region_name:(region_name_ : region_name) ~directory_id:(directory_id_ : directory_id) () =
  ({ vpc_settings = vpc_settings_; region_name = region_name_; directory_id = directory_id_ }
    : add_region_request)

let make_add_ip_routes_request
    ?update_security_group_for_directory_controllers:
      (update_security_group_for_directory_controllers_ :
         update_security_group_for_directory_controllers option) ~ip_routes:(ip_routes_ : ip_routes)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     update_security_group_for_directory_controllers =
       update_security_group_for_directory_controllers_;
     ip_routes = ip_routes_;
     directory_id = directory_id_;
   }
    : add_ip_routes_request)

let make_accept_shared_directory_request ~shared_directory_id:(shared_directory_id_ : directory_id)
    () =
  ({ shared_directory_id = shared_directory_id_ } : accept_shared_directory_request)
