open Types

let make_shared_directory ?owner_account_id:(owner_account_id_ : customer_id option)
    ?owner_directory_id:(owner_directory_id_ : directory_id option)
    ?share_method:(share_method_ : share_method option)
    ?shared_account_id:(shared_account_id_ : customer_id option)
    ?shared_directory_id:(shared_directory_id_ : directory_id option)
    ?share_status:(share_status_ : share_status option) ?share_notes:(share_notes_ : notes option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option) () =
  ({
     owner_account_id = owner_account_id_;
     owner_directory_id = owner_directory_id_;
     share_method = share_method_;
     shared_account_id = shared_account_id_;
     shared_directory_id = shared_directory_id_;
     share_status = share_status_;
     share_notes = share_notes_;
     created_date_time = created_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : shared_directory)

let make_accept_shared_directory_request ~shared_directory_id:(shared_directory_id_ : directory_id)
    () =
  ({ shared_directory_id = shared_directory_id_ } : accept_shared_directory_request)

let make_ip_route ?cidr_ip:(cidr_ip_ : cidr_ip option) ?cidr_ipv6:(cidr_ipv6_ : cidr_ipv6 option)
    ?description:(description_ : description option) () =
  ({ cidr_ip = cidr_ip_; cidr_ipv6 = cidr_ipv6_; description = description_ } : ip_route)

let make_add_ip_routes_request
    ?update_security_group_for_directory_controllers:
      (update_security_group_for_directory_controllers_ :
         update_security_group_for_directory_controllers option)
    ~directory_id:(directory_id_ : directory_id) ~ip_routes:(ip_routes_ : ip_routes) () =
  ({
     directory_id = directory_id_;
     ip_routes = ip_routes_;
     update_security_group_for_directory_controllers =
       update_security_group_for_directory_controllers_;
   }
    : add_ip_routes_request)

let make_directory_vpc_settings ~vpc_id:(vpc_id_ : vpc_id) ~subnet_ids:(subnet_ids_ : subnet_ids) ()
    =
  ({ vpc_id = vpc_id_; subnet_ids = subnet_ids_ } : directory_vpc_settings)

let make_add_region_request ~directory_id:(directory_id_ : directory_id)
    ~region_name:(region_name_ : region_name) ~vpc_settings:(vpc_settings_ : directory_vpc_settings)
    () =
  ({ directory_id = directory_id_; region_name = region_name_; vpc_settings = vpc_settings_ }
    : add_region_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_to_resource_request ~resource_id:(resource_id_ : resource_id) ~tags:(tags_ : tags)
    () =
  ({ resource_id = resource_id_; tags = tags_ } : add_tags_to_resource_request)

let make_assessment ?assessment_id:(assessment_id_ : assessment_id option)
    ?directory_id:(directory_id_ : directory_id option)
    ?dns_name:(dns_name_ : directory_name option)
    ?start_time:(start_time_ : assessment_start_time option)
    ?last_update_date_time:(last_update_date_time_ : last_update_date_time option)
    ?status:(status_ : assessment_status option)
    ?status_code:(status_code_ : assessment_status_code option)
    ?status_reason:(status_reason_ : assessment_status_reason option)
    ?customer_dns_ips:(customer_dns_ips_ : customer_dns_ips option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?self_managed_instance_ids:(self_managed_instance_ids_ : assessment_instance_ids option)
    ?report_type:(report_type_ : assessment_report_type option)
    ?version:(version_ : assessment_version option) () =
  ({
     assessment_id = assessment_id_;
     directory_id = directory_id_;
     dns_name = dns_name_;
     start_time = start_time_;
     last_update_date_time = last_update_date_time_;
     status = status_;
     status_code = status_code_;
     status_reason = status_reason_;
     customer_dns_ips = customer_dns_ips_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     self_managed_instance_ids = self_managed_instance_ids_;
     report_type = report_type_;
     version = version_;
   }
    : assessment)

let make_assessment_configuration
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ~customer_dns_ips:(customer_dns_ips_ : customer_dns_ips) ~dns_name:(dns_name_ : directory_name)
    ~vpc_settings:(vpc_settings_ : directory_vpc_settings)
    ~instance_ids:(instance_ids_ : assessment_instance_ids) () =
  ({
     customer_dns_ips = customer_dns_ips_;
     dns_name = dns_name_;
     vpc_settings = vpc_settings_;
     instance_ids = instance_ids_;
     security_group_ids = security_group_ids_;
   }
    : assessment_configuration)

let make_assessment_validation ?category:(category_ : assessment_validation_category option)
    ?name:(name_ : assessment_validation_name option)
    ?status:(status_ : assessment_validation_status option)
    ?status_code:(status_code_ : assessment_validation_status_code option)
    ?status_reason:(status_reason_ : assessment_validation_status_reason option)
    ?start_time:(start_time_ : assessment_validation_time_stamp option)
    ?last_update_date_time:(last_update_date_time_ : assessment_validation_time_stamp option) () =
  ({
     category = category_;
     name = name_;
     status = status_;
     status_code = status_code_;
     status_reason = status_reason_;
     start_time = start_time_;
     last_update_date_time = last_update_date_time_;
   }
    : assessment_validation)

let make_assessment_report ?domain_controller_ip:(domain_controller_ip_ : ip_addr option)
    ?validations:(validations_ : assessment_validations option) () =
  ({ domain_controller_ip = domain_controller_ip_; validations = validations_ } : assessment_report)

let make_assessment_summary ?assessment_id:(assessment_id_ : assessment_id option)
    ?directory_id:(directory_id_ : directory_id option)
    ?dns_name:(dns_name_ : directory_name option)
    ?start_time:(start_time_ : assessment_start_time option)
    ?last_update_date_time:(last_update_date_time_ : last_update_date_time option)
    ?status:(status_ : assessment_status option)
    ?customer_dns_ips:(customer_dns_ips_ : customer_dns_ips option)
    ?report_type:(report_type_ : assessment_report_type option) () =
  ({
     assessment_id = assessment_id_;
     directory_id = directory_id_;
     dns_name = dns_name_;
     start_time = start_time_;
     last_update_date_time = last_update_date_time_;
     status = status_;
     customer_dns_ips = customer_dns_ips_;
     report_type = report_type_;
   }
    : assessment_summary)

let make_attribute ?name:(name_ : attribute_name option) ?value:(value_ : attribute_value option) ()
    =
  ({ name = name_; value = value_ } : attribute)

let make_cancel_schema_extension_request ~directory_id:(directory_id_ : directory_id)
    ~schema_extension_id:(schema_extension_id_ : schema_extension_id) () =
  ({ directory_id = directory_id_; schema_extension_id = schema_extension_id_ }
    : cancel_schema_extension_request)

let make_client_cert_auth_settings ?ocsp_url:(ocsp_url_ : ocsp_url option) () =
  ({ ocsp_url = ocsp_url_ } : client_cert_auth_settings)

let make_certificate ?certificate_id:(certificate_id_ : certificate_id option)
    ?state:(state_ : certificate_state option)
    ?state_reason:(state_reason_ : certificate_state_reason option)
    ?common_name:(common_name_ : certificate_c_n option)
    ?registered_date_time:(registered_date_time_ : certificate_registered_date_time option)
    ?expiry_date_time:(expiry_date_time_ : certificate_expiry_date_time option)
    ?type_:(type__ : certificate_type option)
    ?client_cert_auth_settings:(client_cert_auth_settings_ : client_cert_auth_settings option) () =
  ({
     certificate_id = certificate_id_;
     state = state_;
     state_reason = state_reason_;
     common_name = common_name_;
     registered_date_time = registered_date_time_;
     expiry_date_time = expiry_date_time_;
     type_ = type__;
     client_cert_auth_settings = client_cert_auth_settings_;
   }
    : certificate)

let make_certificate_info ?certificate_id:(certificate_id_ : certificate_id option)
    ?common_name:(common_name_ : certificate_c_n option) ?state:(state_ : certificate_state option)
    ?expiry_date_time:(expiry_date_time_ : certificate_expiry_date_time option)
    ?type_:(type__ : certificate_type option) () =
  ({
     certificate_id = certificate_id_;
     common_name = common_name_;
     state = state_;
     expiry_date_time = expiry_date_time_;
     type_ = type__;
   }
    : certificate_info)

let make_client_authentication_setting_info ?type_:(type__ : client_authentication_type option)
    ?status:(status_ : client_authentication_status option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option) () =
  ({ type_ = type__; status = status_; last_updated_date_time = last_updated_date_time_ }
    : client_authentication_setting_info)

let make_computer ?computer_id:(computer_id_ : si_d option)
    ?computer_name:(computer_name_ : computer_name option)
    ?computer_attributes:(computer_attributes_ : attributes option) () =
  ({
     computer_id = computer_id_;
     computer_name = computer_name_;
     computer_attributes = computer_attributes_;
   }
    : computer)

let make_conditional_forwarder ?remote_domain_name:(remote_domain_name_ : remote_domain_name option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?dns_ipv6_addrs:(dns_ipv6_addrs_ : dns_ipv6_addrs option)
    ?replication_scope:(replication_scope_ : replication_scope option) () =
  ({
     remote_domain_name = remote_domain_name_;
     dns_ip_addrs = dns_ip_addrs_;
     dns_ipv6_addrs = dns_ipv6_addrs_;
     replication_scope = replication_scope_;
   }
    : conditional_forwarder)

let make_directory_connect_settings ?customer_dns_ips:(customer_dns_ips_ : dns_ip_addrs option)
    ?customer_dns_ips_v6:(customer_dns_ips_v6_ : dns_ipv6_addrs option) ~vpc_id:(vpc_id_ : vpc_id)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~customer_user_name:(customer_user_name_ : user_name) ()
    =
  ({
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     customer_dns_ips = customer_dns_ips_;
     customer_dns_ips_v6 = customer_dns_ips_v6_;
     customer_user_name = customer_user_name_;
   }
    : directory_connect_settings)

let make_connect_directory_request ?short_name:(short_name_ : directory_short_name option)
    ?description:(description_ : description option) ?tags:(tags_ : tags option)
    ?network_type:(network_type_ : network_type option) ~name:(name_ : directory_name)
    ~password:(password_ : connect_password) ~size:(size_ : directory_size)
    ~connect_settings:(connect_settings_ : directory_connect_settings) () =
  ({
     name = name_;
     short_name = short_name_;
     password = password_;
     description = description_;
     size = size_;
     connect_settings = connect_settings_;
     tags = tags_;
     network_type = network_type_;
   }
    : connect_directory_request)

let make_create_alias_request ~directory_id:(directory_id_ : directory_id)
    ~alias:(alias_ : alias_name) () =
  ({ directory_id = directory_id_; alias = alias_ } : create_alias_request)

let make_create_computer_request
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_d_n option)
    ?computer_attributes:(computer_attributes_ : attributes option)
    ~directory_id:(directory_id_ : directory_id) ~computer_name:(computer_name_ : computer_name)
    ~password:(password_ : computer_password) () =
  ({
     directory_id = directory_id_;
     computer_name = computer_name_;
     password = password_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     computer_attributes = computer_attributes_;
   }
    : create_computer_request)

let make_create_conditional_forwarder_request ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?dns_ipv6_addrs:(dns_ipv6_addrs_ : dns_ipv6_addrs option)
    ~directory_id:(directory_id_ : directory_id)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name) () =
  ({
     directory_id = directory_id_;
     remote_domain_name = remote_domain_name_;
     dns_ip_addrs = dns_ip_addrs_;
     dns_ipv6_addrs = dns_ipv6_addrs_;
   }
    : create_conditional_forwarder_request)

let make_create_directory_request ?short_name:(short_name_ : directory_short_name option)
    ?description:(description_ : description option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings option) ?tags:(tags_ : tags option)
    ?network_type:(network_type_ : network_type option) ~name:(name_ : directory_name)
    ~password:(password_ : password) ~size:(size_ : directory_size) () =
  ({
     name = name_;
     short_name = short_name_;
     password = password_;
     description = description_;
     size = size_;
     vpc_settings = vpc_settings_;
     tags = tags_;
     network_type = network_type_;
   }
    : create_directory_request)

let make_create_hybrid_ad_request ?tags:(tags_ : tags option) ~secret_arn:(secret_arn_ : secret_arn)
    ~assessment_id:(assessment_id_ : assessment_id) () =
  ({ secret_arn = secret_arn_; assessment_id = assessment_id_; tags = tags_ }
    : create_hybrid_ad_request)

let make_create_log_subscription_request ~directory_id:(directory_id_ : directory_id)
    ~log_group_name:(log_group_name_ : log_group_name) () =
  ({ directory_id = directory_id_; log_group_name = log_group_name_ }
    : create_log_subscription_request)

let make_create_microsoft_ad_request ?short_name:(short_name_ : directory_short_name option)
    ?description:(description_ : description option) ?edition:(edition_ : directory_edition option)
    ?tags:(tags_ : tags option) ?network_type:(network_type_ : network_type option)
    ~name:(name_ : directory_name) ~password:(password_ : password)
    ~vpc_settings:(vpc_settings_ : directory_vpc_settings) () =
  ({
     name = name_;
     short_name = short_name_;
     password = password_;
     description = description_;
     vpc_settings = vpc_settings_;
     edition = edition_;
     tags = tags_;
     network_type = network_type_;
   }
    : create_microsoft_ad_request)

let make_create_snapshot_request ?name:(name_ : snapshot_name option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; name = name_ } : create_snapshot_request)

let make_create_trust_request ?trust_type:(trust_type_ : trust_type option)
    ?conditional_forwarder_ip_addrs:(conditional_forwarder_ip_addrs_ : dns_ip_addrs option)
    ?conditional_forwarder_ipv6_addrs:(conditional_forwarder_ipv6_addrs_ : dns_ipv6_addrs option)
    ?selective_auth:(selective_auth_ : selective_auth option)
    ~directory_id:(directory_id_ : directory_id)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name)
    ~trust_password:(trust_password_ : trust_password)
    ~trust_direction:(trust_direction_ : trust_direction) () =
  ({
     directory_id = directory_id_;
     remote_domain_name = remote_domain_name_;
     trust_password = trust_password_;
     trust_direction = trust_direction_;
     trust_type = trust_type_;
     conditional_forwarder_ip_addrs = conditional_forwarder_ip_addrs_;
     conditional_forwarder_ipv6_addrs = conditional_forwarder_ipv6_addrs_;
     selective_auth = selective_auth_;
   }
    : create_trust_request)

let make_delete_ad_assessment_request ~assessment_id:(assessment_id_ : assessment_id) () =
  ({ assessment_id = assessment_id_ } : delete_ad_assessment_request)

let make_delete_conditional_forwarder_request ~directory_id:(directory_id_ : directory_id)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name) () =
  ({ directory_id = directory_id_; remote_domain_name = remote_domain_name_ }
    : delete_conditional_forwarder_request)

let make_delete_directory_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : delete_directory_request)

let make_delete_log_subscription_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : delete_log_subscription_request)

let make_delete_snapshot_request ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ snapshot_id = snapshot_id_ } : delete_snapshot_request)

let make_delete_trust_request
    ?delete_associated_conditional_forwarder:
      (delete_associated_conditional_forwarder_ : delete_associated_conditional_forwarder option)
    ~trust_id:(trust_id_ : trust_id) () =
  ({
     trust_id = trust_id_;
     delete_associated_conditional_forwarder = delete_associated_conditional_forwarder_;
   }
    : delete_trust_request)

let make_deregister_certificate_request ~directory_id:(directory_id_ : directory_id)
    ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ directory_id = directory_id_; certificate_id = certificate_id_ }
    : deregister_certificate_request)

let make_deregister_event_topic_request ~directory_id:(directory_id_ : directory_id)
    ~topic_name:(topic_name_ : topic_name) () =
  ({ directory_id = directory_id_; topic_name = topic_name_ } : deregister_event_topic_request)

let make_describe_ad_assessment_request ~assessment_id:(assessment_id_ : assessment_id) () =
  ({ assessment_id = assessment_id_ } : describe_ad_assessment_request)

let make_describe_ca_enrollment_policy_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : describe_ca_enrollment_policy_request)

let make_describe_certificate_request ~directory_id:(directory_id_ : directory_id)
    ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ directory_id = directory_id_; certificate_id = certificate_id_ }
    : describe_certificate_request)

let make_describe_client_authentication_settings_request
    ?type_:(type__ : client_authentication_type option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : page_limit option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; type_ = type__; next_token = next_token_; limit = limit_ }
    : describe_client_authentication_settings_request)

let make_describe_conditional_forwarders_request
    ?remote_domain_names:(remote_domain_names_ : remote_domain_names option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; remote_domain_names = remote_domain_names_ }
    : describe_conditional_forwarders_request)

let make_hybrid_settings_description
    ?self_managed_dns_ip_addrs:(self_managed_dns_ip_addrs_ : ip_addrs option)
    ?self_managed_instance_ids:(self_managed_instance_ids_ : assessment_instance_ids option) () =
  ({
     self_managed_dns_ip_addrs = self_managed_dns_ip_addrs_;
     self_managed_instance_ids = self_managed_instance_ids_;
   }
    : hybrid_settings_description)

let make_regions_info ?primary_region:(primary_region_ : region_name option)
    ?additional_regions:(additional_regions_ : additional_regions option) () =
  ({ primary_region = primary_region_; additional_regions = additional_regions_ } : regions_info)

let make_radius_settings ?radius_servers:(radius_servers_ : servers option)
    ?radius_servers_ipv6:(radius_servers_ipv6_ : servers option)
    ?radius_port:(radius_port_ : port_number option)
    ?radius_timeout:(radius_timeout_ : radius_timeout option)
    ?radius_retries:(radius_retries_ : radius_retries option)
    ?shared_secret:(shared_secret_ : radius_shared_secret option)
    ?authentication_protocol:(authentication_protocol_ : radius_authentication_protocol option)
    ?display_label:(display_label_ : radius_display_label option)
    ?use_same_username:(use_same_username_ : use_same_username option) () =
  ({
     radius_servers = radius_servers_;
     radius_servers_ipv6 = radius_servers_ipv6_;
     radius_port = radius_port_;
     radius_timeout = radius_timeout_;
     radius_retries = radius_retries_;
     shared_secret = shared_secret_;
     authentication_protocol = authentication_protocol_;
     display_label = display_label_;
     use_same_username = use_same_username_;
   }
    : radius_settings)

let make_directory_vpc_settings_description ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?security_group_id:(security_group_id_ : security_group_id option)
    ?availability_zones:(availability_zones_ : availability_zones option) () =
  ({
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_id = security_group_id_;
     availability_zones = availability_zones_;
   }
    : directory_vpc_settings_description)

let make_owner_directory_description ?directory_id:(directory_id_ : directory_id option)
    ?account_id:(account_id_ : customer_id option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?dns_ipv6_addrs:(dns_ipv6_addrs_ : dns_ipv6_addrs option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings_description option)
    ?radius_settings:(radius_settings_ : radius_settings option)
    ?radius_status:(radius_status_ : radius_status option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     directory_id = directory_id_;
     account_id = account_id_;
     dns_ip_addrs = dns_ip_addrs_;
     dns_ipv6_addrs = dns_ipv6_addrs_;
     vpc_settings = vpc_settings_;
     radius_settings = radius_settings_;
     radius_status = radius_status_;
     network_type = network_type_;
   }
    : owner_directory_description)

let make_directory_connect_settings_description ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?customer_user_name:(customer_user_name_ : user_name option)
    ?security_group_id:(security_group_id_ : security_group_id option)
    ?availability_zones:(availability_zones_ : availability_zones option)
    ?connect_ips:(connect_ips_ : ip_addrs option)
    ?connect_ips_v6:(connect_ips_v6_ : ip_v6_addrs option) () =
  ({
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     customer_user_name = customer_user_name_;
     security_group_id = security_group_id_;
     availability_zones = availability_zones_;
     connect_ips = connect_ips_;
     connect_ips_v6 = connect_ips_v6_;
   }
    : directory_connect_settings_description)

let make_directory_description ?directory_id:(directory_id_ : directory_id option)
    ?name:(name_ : directory_name option) ?short_name:(short_name_ : directory_short_name option)
    ?size:(size_ : directory_size option) ?edition:(edition_ : directory_edition option)
    ?alias:(alias_ : alias_name option) ?access_url:(access_url_ : access_url option)
    ?description:(description_ : description option)
    ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?dns_ipv6_addrs:(dns_ipv6_addrs_ : dns_ipv6_addrs option)
    ?stage:(stage_ : directory_stage option) ?share_status:(share_status_ : share_status option)
    ?share_method:(share_method_ : share_method option) ?share_notes:(share_notes_ : notes option)
    ?launch_time:(launch_time_ : launch_time option)
    ?stage_last_updated_date_time:(stage_last_updated_date_time_ : last_updated_date_time option)
    ?type_:(type__ : directory_type option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings_description option)
    ?connect_settings:(connect_settings_ : directory_connect_settings_description option)
    ?radius_settings:(radius_settings_ : radius_settings option)
    ?radius_status:(radius_status_ : radius_status option)
    ?stage_reason:(stage_reason_ : stage_reason option)
    ?sso_enabled:(sso_enabled_ : sso_enabled option)
    ?desired_number_of_domain_controllers:
      (desired_number_of_domain_controllers_ : desired_number_of_domain_controllers option)
    ?owner_directory_description:(owner_directory_description_ : owner_directory_description option)
    ?regions_info:(regions_info_ : regions_info option)
    ?os_version:(os_version_ : os_version option)
    ?hybrid_settings:(hybrid_settings_ : hybrid_settings_description option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     directory_id = directory_id_;
     name = name_;
     short_name = short_name_;
     size = size_;
     edition = edition_;
     alias = alias_;
     access_url = access_url_;
     description = description_;
     dns_ip_addrs = dns_ip_addrs_;
     dns_ipv6_addrs = dns_ipv6_addrs_;
     stage = stage_;
     share_status = share_status_;
     share_method = share_method_;
     share_notes = share_notes_;
     launch_time = launch_time_;
     stage_last_updated_date_time = stage_last_updated_date_time_;
     type_ = type__;
     vpc_settings = vpc_settings_;
     connect_settings = connect_settings_;
     radius_settings = radius_settings_;
     radius_status = radius_status_;
     stage_reason = stage_reason_;
     sso_enabled = sso_enabled_;
     desired_number_of_domain_controllers = desired_number_of_domain_controllers_;
     owner_directory_description = owner_directory_description_;
     regions_info = regions_info_;
     os_version = os_version_;
     hybrid_settings = hybrid_settings_;
     network_type = network_type_;
   }
    : directory_description)

let make_describe_directories_request ?directory_ids:(directory_ids_ : directory_ids option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit option) () =
  ({ directory_ids = directory_ids_; next_token = next_token_; limit = limit_ }
    : describe_directories_request)

let make_describe_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : describe_directory_data_access_request)

let make_domain_controller ?directory_id:(directory_id_ : directory_id option)
    ?domain_controller_id:(domain_controller_id_ : domain_controller_id option)
    ?dns_ip_addr:(dns_ip_addr_ : ip_addr option) ?dns_ipv6_addr:(dns_ipv6_addr_ : ipv6_addr option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?status:(status_ : domain_controller_status option)
    ?status_reason:(status_reason_ : domain_controller_status_reason option)
    ?launch_time:(launch_time_ : launch_time option)
    ?status_last_updated_date_time:(status_last_updated_date_time_ : last_updated_date_time option)
    () =
  ({
     directory_id = directory_id_;
     domain_controller_id = domain_controller_id_;
     dns_ip_addr = dns_ip_addr_;
     dns_ipv6_addr = dns_ipv6_addr_;
     vpc_id = vpc_id_;
     subnet_id = subnet_id_;
     availability_zone = availability_zone_;
     status = status_;
     status_reason = status_reason_;
     launch_time = launch_time_;
     status_last_updated_date_time = status_last_updated_date_time_;
   }
    : domain_controller)

let make_describe_domain_controllers_request
    ?domain_controller_ids:(domain_controller_ids_ : domain_controller_ids option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     directory_id = directory_id_;
     domain_controller_ids = domain_controller_ids_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_domain_controllers_request)

let make_event_topic ?directory_id:(directory_id_ : directory_id option)
    ?topic_name:(topic_name_ : topic_name option) ?topic_arn:(topic_arn_ : topic_arn option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?status:(status_ : topic_status option) () =
  ({
     directory_id = directory_id_;
     topic_name = topic_name_;
     topic_arn = topic_arn_;
     created_date_time = created_date_time_;
     status = status_;
   }
    : event_topic)

let make_describe_event_topics_request ?directory_id:(directory_id_ : directory_id option)
    ?topic_names:(topic_names_ : topic_names option) () =
  ({ directory_id = directory_id_; topic_names = topic_names_ } : describe_event_topics_request)

let make_hybrid_update_value ?instance_ids:(instance_ids_ : assessment_instance_ids option)
    ?dns_ips:(dns_ips_ : customer_dns_ips option) () =
  ({ instance_ids = instance_ids_; dns_ips = dns_ips_ } : hybrid_update_value)

let make_hybrid_update_info_entry ?status:(status_ : update_status option)
    ?status_reason:(status_reason_ : update_status_reason option)
    ?initiated_by:(initiated_by_ : initiated_by option)
    ?new_value:(new_value_ : hybrid_update_value option)
    ?previous_value:(previous_value_ : hybrid_update_value option)
    ?start_time:(start_time_ : start_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?assessment_id:(assessment_id_ : assessment_id option) () =
  ({
     status = status_;
     status_reason = status_reason_;
     initiated_by = initiated_by_;
     new_value = new_value_;
     previous_value = previous_value_;
     start_time = start_time_;
     last_updated_date_time = last_updated_date_time_;
     assessment_id = assessment_id_;
   }
    : hybrid_update_info_entry)

let make_hybrid_update_activities
    ?self_managed_instances:(self_managed_instances_ : hybrid_update_info_entries option)
    ?hybrid_administrator_account:
      (hybrid_administrator_account_ : hybrid_update_info_entries option) () =
  ({
     self_managed_instances = self_managed_instances_;
     hybrid_administrator_account = hybrid_administrator_account_;
   }
    : hybrid_update_activities)

let make_describe_hybrid_ad_update_request ?update_type:(update_type_ : hybrid_update_type option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; update_type = update_type_; next_token = next_token_ }
    : describe_hybrid_ad_update_request)

let make_ldaps_setting_info ?ldaps_status:(ldaps_status_ : ldaps_status option)
    ?ldaps_status_reason:(ldaps_status_reason_ : ldaps_status_reason option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option) () =
  ({
     ldaps_status = ldaps_status_;
     ldaps_status_reason = ldaps_status_reason_;
     last_updated_date_time = last_updated_date_time_;
   }
    : ldaps_setting_info)

let make_describe_ldaps_settings_request ?type_:(type__ : ldaps_type option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : page_limit option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; type_ = type__; next_token = next_token_; limit = limit_ }
    : describe_ldaps_settings_request)

let make_region_description ?directory_id:(directory_id_ : directory_id option)
    ?region_name:(region_name_ : region_name option)
    ?region_type:(region_type_ : region_type option) ?status:(status_ : directory_stage option)
    ?vpc_settings:(vpc_settings_ : directory_vpc_settings option)
    ?desired_number_of_domain_controllers:
      (desired_number_of_domain_controllers_ : desired_number_of_domain_controllers option)
    ?launch_time:(launch_time_ : launch_time option)
    ?status_last_updated_date_time:
      (status_last_updated_date_time_ : state_last_updated_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option) () =
  ({
     directory_id = directory_id_;
     region_name = region_name_;
     region_type = region_type_;
     status = status_;
     vpc_settings = vpc_settings_;
     desired_number_of_domain_controllers = desired_number_of_domain_controllers_;
     launch_time = launch_time_;
     status_last_updated_date_time = status_last_updated_date_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : region_description)

let make_describe_regions_request ?region_name:(region_name_ : region_name option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; region_name = region_name_; next_token = next_token_ }
    : describe_regions_request)

let make_setting_entry ?type_:(type__ : directory_configuration_setting_type option)
    ?name:(name_ : directory_configuration_setting_name option)
    ?allowed_values:(allowed_values_ : directory_configuration_setting_allowed_values option)
    ?applied_value:(applied_value_ : directory_configuration_setting_value option)
    ?requested_value:(requested_value_ : directory_configuration_setting_value option)
    ?request_status:(request_status_ : directory_configuration_status option)
    ?request_detailed_status:
      (request_detailed_status_ : directory_configuration_setting_request_detailed_status option)
    ?request_status_message:
      (request_status_message_ : directory_configuration_setting_request_status_message option)
    ?last_updated_date_time:
      (last_updated_date_time_ : directory_configuration_setting_last_updated_date_time option)
    ?last_requested_date_time:
      (last_requested_date_time_ : directory_configuration_setting_last_requested_date_time option)
    ?data_type:(data_type_ : directory_configuration_setting_data_type option) () =
  ({
     type_ = type__;
     name = name_;
     allowed_values = allowed_values_;
     applied_value = applied_value_;
     requested_value = requested_value_;
     request_status = request_status_;
     request_detailed_status = request_detailed_status_;
     request_status_message = request_status_message_;
     last_updated_date_time = last_updated_date_time_;
     last_requested_date_time = last_requested_date_time_;
     data_type = data_type_;
   }
    : setting_entry)

let make_describe_settings_request ?status:(status_ : directory_configuration_status option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; status = status_; next_token = next_token_ }
    : describe_settings_request)

let make_describe_shared_directories_request
    ?shared_directory_ids:(shared_directory_ids_ : directory_ids option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit option)
    ~owner_directory_id:(owner_directory_id_ : directory_id) () =
  ({
     owner_directory_id = owner_directory_id_;
     shared_directory_ids = shared_directory_ids_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_shared_directories_request)

let make_snapshot ?directory_id:(directory_id_ : directory_id option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option) ?type_:(type__ : snapshot_type option)
    ?name:(name_ : snapshot_name option) ?status:(status_ : snapshot_status option)
    ?start_time:(start_time_ : start_time option) () =
  ({
     directory_id = directory_id_;
     snapshot_id = snapshot_id_;
     type_ = type__;
     name = name_;
     status = status_;
     start_time = start_time_;
   }
    : snapshot)

let make_describe_snapshots_request ?directory_id:(directory_id_ : directory_id option)
    ?snapshot_ids:(snapshot_ids_ : snapshot_ids option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit option) () =
  ({
     directory_id = directory_id_;
     snapshot_ids = snapshot_ids_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_snapshots_request)

let make_trust ?directory_id:(directory_id_ : directory_id option)
    ?trust_id:(trust_id_ : trust_id option)
    ?remote_domain_name:(remote_domain_name_ : remote_domain_name option)
    ?trust_type:(trust_type_ : trust_type option)
    ?trust_direction:(trust_direction_ : trust_direction option)
    ?trust_state:(trust_state_ : trust_state option)
    ?created_date_time:(created_date_time_ : created_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option)
    ?state_last_updated_date_time:
      (state_last_updated_date_time_ : state_last_updated_date_time option)
    ?trust_state_reason:(trust_state_reason_ : trust_state_reason option)
    ?selective_auth:(selective_auth_ : selective_auth option) () =
  ({
     directory_id = directory_id_;
     trust_id = trust_id_;
     remote_domain_name = remote_domain_name_;
     trust_type = trust_type_;
     trust_direction = trust_direction_;
     trust_state = trust_state_;
     created_date_time = created_date_time_;
     last_updated_date_time = last_updated_date_time_;
     state_last_updated_date_time = state_last_updated_date_time_;
     trust_state_reason = trust_state_reason_;
     selective_auth = selective_auth_;
   }
    : trust)

let make_describe_trusts_request ?directory_id:(directory_id_ : directory_id option)
    ?trust_ids:(trust_ids_ : trust_ids option) ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit option) () =
  ({
     directory_id = directory_id_;
     trust_ids = trust_ids_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_trusts_request)

let make_os_update_settings ?os_version:(os_version_ : os_version option) () =
  ({ os_version = os_version_ } : os_update_settings)

let make_update_value ?os_update_settings:(os_update_settings_ : os_update_settings option) () =
  ({ os_update_settings = os_update_settings_ } : update_value)

let make_update_info_entry ?region:(region_ : region_name option)
    ?status:(status_ : update_status option)
    ?status_reason:(status_reason_ : update_status_reason option)
    ?initiated_by:(initiated_by_ : initiated_by option)
    ?new_value:(new_value_ : update_value option)
    ?previous_value:(previous_value_ : update_value option)
    ?start_time:(start_time_ : start_date_time option)
    ?last_updated_date_time:(last_updated_date_time_ : last_updated_date_time option) () =
  ({
     region = region_;
     status = status_;
     status_reason = status_reason_;
     initiated_by = initiated_by_;
     new_value = new_value_;
     previous_value = previous_value_;
     start_time = start_time_;
     last_updated_date_time = last_updated_date_time_;
   }
    : update_info_entry)

let make_describe_update_directory_request ?region_name:(region_name_ : region_name option)
    ?next_token:(next_token_ : next_token option) ~directory_id:(directory_id_ : directory_id)
    ~update_type:(update_type_ : update_type) () =
  ({
     directory_id = directory_id_;
     update_type = update_type_;
     region_name = region_name_;
     next_token = next_token_;
   }
    : describe_update_directory_request)

let make_directory_limits
    ?cloud_only_directories_limit:(cloud_only_directories_limit_ : limit option)
    ?cloud_only_directories_current_count:(cloud_only_directories_current_count_ : limit option)
    ?cloud_only_directories_limit_reached:
      (cloud_only_directories_limit_reached_ : cloud_only_directories_limit_reached option)
    ?cloud_only_microsoft_ad_limit:(cloud_only_microsoft_ad_limit_ : limit option)
    ?cloud_only_microsoft_ad_current_count:(cloud_only_microsoft_ad_current_count_ : limit option)
    ?cloud_only_microsoft_ad_limit_reached:
      (cloud_only_microsoft_ad_limit_reached_ : cloud_only_directories_limit_reached option)
    ?connected_directories_limit:(connected_directories_limit_ : limit option)
    ?connected_directories_current_count:(connected_directories_current_count_ : limit option)
    ?connected_directories_limit_reached:
      (connected_directories_limit_reached_ : connected_directories_limit_reached option) () =
  ({
     cloud_only_directories_limit = cloud_only_directories_limit_;
     cloud_only_directories_current_count = cloud_only_directories_current_count_;
     cloud_only_directories_limit_reached = cloud_only_directories_limit_reached_;
     cloud_only_microsoft_ad_limit = cloud_only_microsoft_ad_limit_;
     cloud_only_microsoft_ad_current_count = cloud_only_microsoft_ad_current_count_;
     cloud_only_microsoft_ad_limit_reached = cloud_only_microsoft_ad_limit_reached_;
     connected_directories_limit = connected_directories_limit_;
     connected_directories_current_count = connected_directories_current_count_;
     connected_directories_limit_reached = connected_directories_limit_reached_;
   }
    : directory_limits)

let make_verify_trust_request ~trust_id:(trust_id_ : trust_id) () =
  ({ trust_id = trust_id_ } : verify_trust_request)

let make_update_trust_request ?selective_auth:(selective_auth_ : selective_auth option)
    ~trust_id:(trust_id_ : trust_id) () =
  ({ trust_id = trust_id_; selective_auth = selective_auth_ } : update_trust_request)

let make_setting ~name:(name_ : directory_configuration_setting_name)
    ~value:(value_ : directory_configuration_setting_value) () =
  ({ name = name_; value = value_ } : setting)

let make_update_settings_request ~directory_id:(directory_id_ : directory_id)
    ~settings:(settings_ : settings) () =
  ({ directory_id = directory_id_; settings = settings_ } : update_settings_request)

let make_update_radius_request ~directory_id:(directory_id_ : directory_id)
    ~radius_settings:(radius_settings_ : radius_settings) () =
  ({ directory_id = directory_id_; radius_settings = radius_settings_ } : update_radius_request)

let make_update_number_of_domain_controllers_request ~directory_id:(directory_id_ : directory_id)
    ~desired_number:(desired_number_ : desired_number_of_domain_controllers) () =
  ({ directory_id = directory_id_; desired_number = desired_number_ }
    : update_number_of_domain_controllers_request)

let make_hybrid_customer_instances_settings ~customer_dns_ips:(customer_dns_ips_ : customer_dns_ips)
    ~instance_ids:(instance_ids_ : assessment_instance_ids) () =
  ({ customer_dns_ips = customer_dns_ips_; instance_ids = instance_ids_ }
    : hybrid_customer_instances_settings)

let make_hybrid_administrator_account_update ~secret_arn:(secret_arn_ : secret_arn) () =
  ({ secret_arn = secret_arn_ } : hybrid_administrator_account_update)

let make_update_hybrid_ad_request
    ?hybrid_administrator_account_update:
      (hybrid_administrator_account_update_ : hybrid_administrator_account_update option)
    ?self_managed_instances_settings:
      (self_managed_instances_settings_ : hybrid_customer_instances_settings option)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     directory_id = directory_id_;
     hybrid_administrator_account_update = hybrid_administrator_account_update_;
     self_managed_instances_settings = self_managed_instances_settings_;
   }
    : update_hybrid_ad_request)

let make_network_update_settings ?network_type:(network_type_ : network_type option)
    ?customer_dns_ips_v6:(customer_dns_ips_v6_ : dns_ipv6_addrs option) () =
  ({ network_type = network_type_; customer_dns_ips_v6 = customer_dns_ips_v6_ }
    : network_update_settings)

let make_directory_size_update_settings ?directory_size:(directory_size_ : directory_size option) ()
    =
  ({ directory_size = directory_size_ } : directory_size_update_settings)

let make_update_directory_setup_request
    ?os_update_settings:(os_update_settings_ : os_update_settings option)
    ?directory_size_update_settings:
      (directory_size_update_settings_ : directory_size_update_settings option)
    ?network_update_settings:(network_update_settings_ : network_update_settings option)
    ?create_snapshot_before_update:
      (create_snapshot_before_update_ : create_snapshot_before_update option)
    ~directory_id:(directory_id_ : directory_id) ~update_type:(update_type_ : update_type) () =
  ({
     directory_id = directory_id_;
     update_type = update_type_;
     os_update_settings = os_update_settings_;
     directory_size_update_settings = directory_size_update_settings_;
     network_update_settings = network_update_settings_;
     create_snapshot_before_update = create_snapshot_before_update_;
   }
    : update_directory_setup_request)

let make_update_conditional_forwarder_request ?dns_ip_addrs:(dns_ip_addrs_ : dns_ip_addrs option)
    ?dns_ipv6_addrs:(dns_ipv6_addrs_ : dns_ipv6_addrs option)
    ~directory_id:(directory_id_ : directory_id)
    ~remote_domain_name:(remote_domain_name_ : remote_domain_name) () =
  ({
     directory_id = directory_id_;
     remote_domain_name = remote_domain_name_;
     dns_ip_addrs = dns_ip_addrs_;
     dns_ipv6_addrs = dns_ipv6_addrs_;
   }
    : update_conditional_forwarder_request)

let make_unshare_target ~id:(id_ : target_id) ~type_:(type__ : target_type) () =
  ({ id = id_; type_ = type__ } : unshare_target)

let make_unshare_directory_request ~directory_id:(directory_id_ : directory_id)
    ~unshare_target:(unshare_target_ : unshare_target) () =
  ({ directory_id = directory_id_; unshare_target = unshare_target_ } : unshare_directory_request)

let make_start_schema_extension_request ~directory_id:(directory_id_ : directory_id)
    ~create_snapshot_before_schema_extension:
      (create_snapshot_before_schema_extension_ : create_snapshot_before_schema_extension)
    ~ldif_content:(ldif_content_ : ldif_content) ~description:(description_ : description) () =
  ({
     directory_id = directory_id_;
     create_snapshot_before_schema_extension = create_snapshot_before_schema_extension_;
     ldif_content = ldif_content_;
     description = description_;
   }
    : start_schema_extension_request)

let make_start_ad_assessment_request
    ?assessment_configuration:(assessment_configuration_ : assessment_configuration option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({ assessment_configuration = assessment_configuration_; directory_id = directory_id_ }
    : start_ad_assessment_request)

let make_share_target ~id:(id_ : target_id) ~type_:(type__ : target_type) () =
  ({ id = id_; type_ = type__ } : share_target)

let make_share_directory_request ?share_notes:(share_notes_ : notes option)
    ~directory_id:(directory_id_ : directory_id) ~share_target:(share_target_ : share_target)
    ~share_method:(share_method_ : share_method) () =
  ({
     directory_id = directory_id_;
     share_notes = share_notes_;
     share_target = share_target_;
     share_method = share_method_;
   }
    : share_directory_request)

let make_restore_from_snapshot_request ~snapshot_id:(snapshot_id_ : snapshot_id) () =
  ({ snapshot_id = snapshot_id_ } : restore_from_snapshot_request)

let make_reset_user_password_request ~directory_id:(directory_id_ : directory_id)
    ~user_name:(user_name_ : customer_user_name) ~new_password:(new_password_ : user_password) () =
  ({ directory_id = directory_id_; user_name = user_name_; new_password = new_password_ }
    : reset_user_password_request)

let make_remove_tags_from_resource_request ~resource_id:(resource_id_ : resource_id)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_id = resource_id_; tag_keys = tag_keys_ } : remove_tags_from_resource_request)

let make_remove_region_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : remove_region_request)

let make_remove_ip_routes_request ?cidr_ips:(cidr_ips_ : cidr_ips option)
    ?cidr_ipv6s:(cidr_ipv6s_ : cidr_ipv6s option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; cidr_ips = cidr_ips_; cidr_ipv6s = cidr_ipv6s_ }
    : remove_ip_routes_request)

let make_reject_shared_directory_request ~shared_directory_id:(shared_directory_id_ : directory_id)
    () =
  ({ shared_directory_id = shared_directory_id_ } : reject_shared_directory_request)

let make_register_event_topic_request ~directory_id:(directory_id_ : directory_id)
    ~topic_name:(topic_name_ : topic_name) () =
  ({ directory_id = directory_id_; topic_name = topic_name_ } : register_event_topic_request)

let make_register_certificate_request ?type_:(type__ : certificate_type option)
    ?client_cert_auth_settings:(client_cert_auth_settings_ : client_cert_auth_settings option)
    ~directory_id:(directory_id_ : directory_id)
    ~certificate_data:(certificate_data_ : certificate_data) () =
  ({
     directory_id = directory_id_;
     certificate_data = certificate_data_;
     type_ = type__;
     client_cert_auth_settings = client_cert_auth_settings_;
   }
    : register_certificate_request)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit option) ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_; next_token = next_token_; limit = limit_ }
    : list_tags_for_resource_request)

let make_schema_extension_info ?directory_id:(directory_id_ : directory_id option)
    ?schema_extension_id:(schema_extension_id_ : schema_extension_id option)
    ?description:(description_ : description option)
    ?schema_extension_status:(schema_extension_status_ : schema_extension_status option)
    ?schema_extension_status_reason:
      (schema_extension_status_reason_ : schema_extension_status_reason option)
    ?start_date_time:(start_date_time_ : start_date_time option)
    ?end_date_time:(end_date_time_ : end_date_time option) () =
  ({
     directory_id = directory_id_;
     schema_extension_id = schema_extension_id_;
     description = description_;
     schema_extension_status = schema_extension_status_;
     schema_extension_status_reason = schema_extension_status_reason_;
     start_date_time = start_date_time_;
     end_date_time = end_date_time_;
   }
    : schema_extension_info)

let make_list_schema_extensions_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; next_token = next_token_; limit = limit_ }
    : list_schema_extensions_request)

let make_log_subscription ?directory_id:(directory_id_ : directory_id option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?subscription_created_date_time:
      (subscription_created_date_time_ : subscription_created_date_time option) () =
  ({
     directory_id = directory_id_;
     log_group_name = log_group_name_;
     subscription_created_date_time = subscription_created_date_time_;
   }
    : log_subscription)

let make_list_log_subscriptions_request ?directory_id:(directory_id_ : directory_id option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit option) () =
  ({ directory_id = directory_id_; next_token = next_token_; limit = limit_ }
    : list_log_subscriptions_request)

let make_ip_route_info ?directory_id:(directory_id_ : directory_id option)
    ?cidr_ip:(cidr_ip_ : cidr_ip option) ?cidr_ipv6:(cidr_ipv6_ : cidr_ipv6 option)
    ?ip_route_status_msg:(ip_route_status_msg_ : ip_route_status_msg option)
    ?added_date_time:(added_date_time_ : added_date_time option)
    ?ip_route_status_reason:(ip_route_status_reason_ : ip_route_status_reason option)
    ?description:(description_ : description option) () =
  ({
     directory_id = directory_id_;
     cidr_ip = cidr_ip_;
     cidr_ipv6 = cidr_ipv6_;
     ip_route_status_msg = ip_route_status_msg_;
     added_date_time = added_date_time_;
     ip_route_status_reason = ip_route_status_reason_;
     description = description_;
   }
    : ip_route_info)

let make_list_ip_routes_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; next_token = next_token_; limit = limit_ }
    : list_ip_routes_request)

let make_list_certificates_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : page_limit option) ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_; next_token = next_token_; limit = limit_ }
    : list_certificates_request)

let make_list_ad_assessments_request ?directory_id:(directory_id_ : directory_id option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : assessment_limit option) () =
  ({ directory_id = directory_id_; next_token = next_token_; limit = limit_ }
    : list_ad_assessments_request)

let make_snapshot_limits ?manual_snapshots_limit:(manual_snapshots_limit_ : limit option)
    ?manual_snapshots_current_count:(manual_snapshots_current_count_ : limit option)
    ?manual_snapshots_limit_reached:
      (manual_snapshots_limit_reached_ : manual_snapshots_limit_reached option) () =
  ({
     manual_snapshots_limit = manual_snapshots_limit_;
     manual_snapshots_current_count = manual_snapshots_current_count_;
     manual_snapshots_limit_reached = manual_snapshots_limit_reached_;
   }
    : snapshot_limits)

let make_get_snapshot_limits_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : get_snapshot_limits_request)

let make_get_directory_limits_request () = (() : unit)

let make_enable_sso_request ?user_name:(user_name_ : user_name option)
    ?password:(password_ : connect_password option) ~directory_id:(directory_id_ : directory_id) ()
    =
  ({ directory_id = directory_id_; user_name = user_name_; password = password_ }
    : enable_sso_request)

let make_enable_radius_request ~directory_id:(directory_id_ : directory_id)
    ~radius_settings:(radius_settings_ : radius_settings) () =
  ({ directory_id = directory_id_; radius_settings = radius_settings_ } : enable_radius_request)

let make_enable_ldaps_request ~directory_id:(directory_id_ : directory_id)
    ~type_:(type__ : ldaps_type) () =
  ({ directory_id = directory_id_; type_ = type__ } : enable_ldaps_request)

let make_enable_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : enable_directory_data_access_request)

let make_enable_client_authentication_request ~directory_id:(directory_id_ : directory_id)
    ~type_:(type__ : client_authentication_type) () =
  ({ directory_id = directory_id_; type_ = type__ } : enable_client_authentication_request)

let make_enable_ca_enrollment_policy_request ~directory_id:(directory_id_ : directory_id)
    ~pca_connector_arn:(pca_connector_arn_ : pca_connector_arn) () =
  ({ directory_id = directory_id_; pca_connector_arn = pca_connector_arn_ }
    : enable_ca_enrollment_policy_request)

let make_disable_sso_request ?user_name:(user_name_ : user_name option)
    ?password:(password_ : connect_password option) ~directory_id:(directory_id_ : directory_id) ()
    =
  ({ directory_id = directory_id_; user_name = user_name_; password = password_ }
    : disable_sso_request)

let make_disable_radius_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : disable_radius_request)

let make_disable_ldaps_request ~directory_id:(directory_id_ : directory_id)
    ~type_:(type__ : ldaps_type) () =
  ({ directory_id = directory_id_; type_ = type__ } : disable_ldaps_request)

let make_disable_directory_data_access_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : disable_directory_data_access_request)

let make_disable_client_authentication_request ~directory_id:(directory_id_ : directory_id)
    ~type_:(type__ : client_authentication_type) () =
  ({ directory_id = directory_id_; type_ = type__ } : disable_client_authentication_request)

let make_disable_ca_enrollment_policy_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : disable_ca_enrollment_policy_request)
