open Types

let make_access_key_last_used ?last_used_date:(last_used_date_ : iso_date option)
    ?region:(region_ : string_ option) ?service_name:(service_name_ : string_ option) () =
  ({ last_used_date = last_used_date_; region = region_; service_name = service_name_ }
    : access_key_last_used)

let make_access_key ?access_key_id:(access_key_id_ : iam_access_key_id option)
    ?secret_access_key:(secret_access_key_ : non_empty_string option)
    ?status:(status_ : status_type option) ?created_at:(created_at_ : iso_date option)
    ?last_used:(last_used_ : access_key_last_used option) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     status = status_;
     created_at = created_at_;
     last_used = last_used_;
   }
    : access_key)

let make_resource_receiving_access ?name:(name_ : non_empty_string option)
    ?resource_type:(resource_type_ : non_empty_string option) () =
  ({ name = name_; resource_type = resource_type_ } : resource_receiving_access)

let make_access_rules ?get_object:(get_object_ : access_type option)
    ?allow_public_overrides:(allow_public_overrides_ : boolean_ option) () =
  ({ get_object = get_object_; allow_public_overrides = allow_public_overrides_ } : access_rules)

let make_account_level_bpa_sync ?status:(status_ : account_level_bpa_sync_status option)
    ?last_synced_at:(last_synced_at_ : iso_date option)
    ?message:(message_ : bpa_status_message option)
    ?bpa_impacts_lightsail:(bpa_impacts_lightsail_ : boolean_ option) () =
  ({
     status = status_;
     last_synced_at = last_synced_at_;
     message = message_;
     bpa_impacts_lightsail = bpa_impacts_lightsail_;
   }
    : account_level_bpa_sync)

let make_add_on ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?snapshot_time_of_day:(snapshot_time_of_day_ : time_of_day option)
    ?next_snapshot_time_of_day:(next_snapshot_time_of_day_ : time_of_day option)
    ?threshold:(threshold_ : string_ option) ?duration:(duration_ : string_ option) () =
  ({
     name = name_;
     status = status_;
     snapshot_time_of_day = snapshot_time_of_day_;
     next_snapshot_time_of_day = next_snapshot_time_of_day_;
     threshold = threshold_;
     duration = duration_;
   }
    : add_on)

let make_stop_instance_on_idle_request ?threshold:(threshold_ : string_ option)
    ?duration:(duration_ : string_ option) () =
  ({ threshold = threshold_; duration = duration_ } : stop_instance_on_idle_request)

let make_auto_snapshot_add_on_request
    ?snapshot_time_of_day:(snapshot_time_of_day_ : time_of_day option) () =
  ({ snapshot_time_of_day = snapshot_time_of_day_ } : auto_snapshot_add_on_request)

let make_add_on_request
    ?auto_snapshot_add_on_request:
      (auto_snapshot_add_on_request_ : auto_snapshot_add_on_request option)
    ?stop_instance_on_idle_request:
      (stop_instance_on_idle_request_ : stop_instance_on_idle_request option)
    ~add_on_type:(add_on_type_ : add_on_type) () =
  ({
     add_on_type = add_on_type_;
     auto_snapshot_add_on_request = auto_snapshot_add_on_request_;
     stop_instance_on_idle_request = stop_instance_on_idle_request_;
   }
    : add_on_request)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_monitored_resource_info ?arn:(arn_ : resource_arn option)
    ?name:(name_ : resource_name option) ?resource_type:(resource_type_ : resource_type option) () =
  ({ arn = arn_; name = name_; resource_type = resource_type_ } : monitored_resource_info)

let make_resource_location ?availability_zone:(availability_zone_ : string_ option)
    ?region_name:(region_name_ : region_name option) () =
  ({ availability_zone = availability_zone_; region_name = region_name_ } : resource_location)

let make_alarm ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option)
    ?support_code:(support_code_ : string_ option)
    ?monitored_resource_info:(monitored_resource_info_ : monitored_resource_info option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?evaluation_periods:(evaluation_periods_ : integer option)
    ?period:(period_ : metric_period option) ?threshold:(threshold_ : double option)
    ?datapoints_to_alarm:(datapoints_to_alarm_ : integer option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?statistic:(statistic_ : metric_statistic option)
    ?metric_name:(metric_name_ : metric_name option) ?state:(state_ : alarm_state option)
    ?unit_:(unit__ : metric_unit option)
    ?contact_protocols:(contact_protocols_ : contact_protocols_list option)
    ?notification_triggers:(notification_triggers_ : notification_trigger_list option)
    ?notification_enabled:(notification_enabled_ : boolean_ option) ?tags:(tags_ : tag_list option)
    () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     support_code = support_code_;
     monitored_resource_info = monitored_resource_info_;
     comparison_operator = comparison_operator_;
     evaluation_periods = evaluation_periods_;
     period = period_;
     threshold = threshold_;
     datapoints_to_alarm = datapoints_to_alarm_;
     treat_missing_data = treat_missing_data_;
     statistic = statistic_;
     metric_name = metric_name_;
     state = state_;
     unit_ = unit__;
     contact_protocols = contact_protocols_;
     notification_triggers = notification_triggers_;
     notification_enabled = notification_enabled_;
     tags = tags_;
   }
    : alarm)

let make_operation ?id:(id_ : non_empty_string option)
    ?resource_name:(resource_name_ : resource_name option)
    ?resource_type:(resource_type_ : resource_type option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?is_terminal:(is_terminal_ : boolean_ option)
    ?operation_details:(operation_details_ : string_ option)
    ?operation_type:(operation_type_ : operation_type option)
    ?status:(status_ : operation_status option)
    ?status_changed_at:(status_changed_at_ : iso_date option)
    ?error_code:(error_code_ : string_ option) ?error_details:(error_details_ : string_ option) () =
  ({
     id = id_;
     resource_name = resource_name_;
     resource_type = resource_type_;
     created_at = created_at_;
     location = location_;
     is_terminal = is_terminal_;
     operation_details = operation_details_;
     operation_type = operation_type_;
     status = status_;
     status_changed_at = status_changed_at_;
     error_code = error_code_;
     error_details = error_details_;
   }
    : operation)

let make_allocate_static_ip_request ~static_ip_name:(static_ip_name_ : resource_name) () =
  ({ static_ip_name = static_ip_name_ } : allocate_static_ip_request)

let make_attach_certificate_to_distribution_request
    ~distribution_name:(distribution_name_ : resource_name)
    ~certificate_name:(certificate_name_ : resource_name) () =
  ({ distribution_name = distribution_name_; certificate_name = certificate_name_ }
    : attach_certificate_to_distribution_request)

let make_attach_disk_request ?auto_mounting:(auto_mounting_ : boolean_ option)
    ~disk_name:(disk_name_ : resource_name) ~instance_name:(instance_name_ : resource_name)
    ~disk_path:(disk_path_ : non_empty_string) () =
  ({
     disk_name = disk_name_;
     instance_name = instance_name_;
     disk_path = disk_path_;
     auto_mounting = auto_mounting_;
   }
    : attach_disk_request)

let make_attach_instances_to_load_balancer_request
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~instance_names:(instance_names_ : resource_name_list) () =
  ({ load_balancer_name = load_balancer_name_; instance_names = instance_names_ }
    : attach_instances_to_load_balancer_request)

let make_attach_load_balancer_tls_certificate_request
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~certificate_name:(certificate_name_ : resource_name) () =
  ({ load_balancer_name = load_balancer_name_; certificate_name = certificate_name_ }
    : attach_load_balancer_tls_certificate_request)

let make_attach_static_ip_request ~static_ip_name:(static_ip_name_ : resource_name)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ static_ip_name = static_ip_name_; instance_name = instance_name_ } : attach_static_ip_request)

let make_attached_disk ?path:(path_ : string_ option) ?size_in_gb:(size_in_gb_ : integer option) ()
    =
  ({ path = path_; size_in_gb = size_in_gb_ } : attached_disk)

let make_disk_map ?original_disk_path:(original_disk_path_ : non_empty_string option)
    ?new_disk_name:(new_disk_name_ : resource_name option) () =
  ({ original_disk_path = original_disk_path_; new_disk_name = new_disk_name_ } : disk_map)

let make_auto_snapshot_details ?date:(date_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?status:(status_ : auto_snapshot_status option)
    ?from_attached_disks:(from_attached_disks_ : attached_disk_list option) () =
  ({
     date = date_;
     created_at = created_at_;
     status = status_;
     from_attached_disks = from_attached_disks_;
   }
    : auto_snapshot_details)

let make_availability_zone ?zone_name:(zone_name_ : non_empty_string option)
    ?state:(state_ : non_empty_string option) () =
  ({ zone_name = zone_name_; state = state_ } : availability_zone)

let make_blueprint ?blueprint_id:(blueprint_id_ : non_empty_string option)
    ?name:(name_ : resource_name option) ?group:(group_ : non_empty_string option)
    ?type_:(type__ : blueprint_type option) ?description:(description_ : string_ option)
    ?is_active:(is_active_ : boolean_ option) ?min_power:(min_power_ : integer option)
    ?version:(version_ : string_ option) ?version_code:(version_code_ : string_ option)
    ?product_url:(product_url_ : string_ option) ?license_url:(license_url_ : string_ option)
    ?platform:(platform_ : instance_platform option)
    ?app_category:(app_category_ : app_category option) () =
  ({
     blueprint_id = blueprint_id_;
     name = name_;
     group = group_;
     type_ = type__;
     description = description_;
     is_active = is_active_;
     min_power = min_power_;
     version = version_;
     version_code = version_code_;
     product_url = product_url_;
     license_url = license_url_;
     platform = platform_;
     app_category = app_category_;
   }
    : blueprint)

let make_bucket_cors_rule ?id:(id_ : bucket_cors_rule_id option)
    ?allowed_headers:(allowed_headers_ : bucket_cors_allowed_headers option)
    ?expose_headers:(expose_headers_ : bucket_cors_expose_headers option)
    ?max_age_seconds:(max_age_seconds_ : integer option)
    ~allowed_methods:(allowed_methods_ : bucket_cors_allowed_methods)
    ~allowed_origins:(allowed_origins_ : bucket_cors_allowed_origins) () =
  ({
     id = id_;
     allowed_methods = allowed_methods_;
     allowed_origins = allowed_origins_;
     allowed_headers = allowed_headers_;
     expose_headers = expose_headers_;
     max_age_seconds = max_age_seconds_;
   }
    : bucket_cors_rule)

let make_bucket_cors_config ?rules:(rules_ : bucket_cors_rules option) () =
  ({ rules = rules_ } : bucket_cors_config)

let make_bucket_access_log_config ?destination:(destination_ : bucket_name option)
    ?prefix:(prefix_ : bucket_access_log_prefix option) ~enabled:(enabled_ : boolean_) () =
  ({ enabled = enabled_; destination = destination_; prefix = prefix_ } : bucket_access_log_config)

let make_bucket_state ?code:(code_ : non_empty_string option) ?message:(message_ : string_ option)
    () =
  ({ code = code_; message = message_ } : bucket_state)

let make_bucket ?resource_type:(resource_type_ : non_empty_string option)
    ?access_rules:(access_rules_ : access_rules option) ?arn:(arn_ : non_empty_string option)
    ?bundle_id:(bundle_id_ : non_empty_string option) ?created_at:(created_at_ : iso_date option)
    ?url:(url_ : non_empty_string option) ?location:(location_ : resource_location option)
    ?name:(name_ : bucket_name option) ?support_code:(support_code_ : non_empty_string option)
    ?tags:(tags_ : tag_list option)
    ?object_versioning:(object_versioning_ : non_empty_string option)
    ?able_to_update_bundle:(able_to_update_bundle_ : boolean_ option)
    ?readonly_access_accounts:(readonly_access_accounts_ : partner_id_list option)
    ?resources_receiving_access:(resources_receiving_access_ : access_receiver_list option)
    ?state:(state_ : bucket_state option)
    ?access_log_config:(access_log_config_ : bucket_access_log_config option)
    ?cors:(cors_ : bucket_cors_config option) () =
  ({
     resource_type = resource_type_;
     access_rules = access_rules_;
     arn = arn_;
     bundle_id = bundle_id_;
     created_at = created_at_;
     url = url_;
     location = location_;
     name = name_;
     support_code = support_code_;
     tags = tags_;
     object_versioning = object_versioning_;
     able_to_update_bundle = able_to_update_bundle_;
     readonly_access_accounts = readonly_access_accounts_;
     resources_receiving_access = resources_receiving_access_;
     state = state_;
     access_log_config = access_log_config_;
     cors = cors_;
   }
    : bucket)

let make_bucket_bundle ?bundle_id:(bundle_id_ : non_empty_string option)
    ?name:(name_ : non_empty_string option) ?price:(price_ : float_ option)
    ?storage_per_month_in_gb:(storage_per_month_in_gb_ : integer option)
    ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : integer option)
    ?is_active:(is_active_ : boolean_ option) () =
  ({
     bundle_id = bundle_id_;
     name = name_;
     price = price_;
     storage_per_month_in_gb = storage_per_month_in_gb_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     is_active = is_active_;
   }
    : bucket_bundle)

let make_bundle ?price:(price_ : float_ option) ?cpu_count:(cpu_count_ : integer option)
    ?disk_size_in_gb:(disk_size_in_gb_ : integer option)
    ?bundle_id:(bundle_id_ : non_empty_string option)
    ?instance_type:(instance_type_ : string_ option) ?is_active:(is_active_ : boolean_ option)
    ?name:(name_ : string_ option) ?power:(power_ : integer option)
    ?ram_size_in_gb:(ram_size_in_gb_ : float_ option)
    ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : integer option)
    ?supported_platforms:(supported_platforms_ : instance_platform_list option)
    ?supported_app_categories:(supported_app_categories_ : app_category_list option)
    ?public_ipv4_address_count:(public_ipv4_address_count_ : integer option) () =
  ({
     price = price_;
     cpu_count = cpu_count_;
     disk_size_in_gb = disk_size_in_gb_;
     bundle_id = bundle_id_;
     instance_type = instance_type_;
     is_active = is_active_;
     name = name_;
     power = power_;
     ram_size_in_gb = ram_size_in_gb_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     supported_platforms = supported_platforms_;
     supported_app_categories = supported_app_categories_;
     public_ipv4_address_count = public_ipv4_address_count_;
   }
    : bundle)

let make_cache_behavior ?behavior:(behavior_ : behavior_enum option) () =
  ({ behavior = behavior_ } : cache_behavior)

let make_cache_behavior_per_path ?path:(path_ : string_ option)
    ?behavior:(behavior_ : behavior_enum option) () =
  ({ path = path_; behavior = behavior_ } : cache_behavior_per_path)

let make_query_string_object ?option_:(option__ : boolean_ option)
    ?query_strings_allow_list:(query_strings_allow_list_ : string_list option) () =
  ({ option_ = option__; query_strings_allow_list = query_strings_allow_list_ }
    : query_string_object)

let make_header_object ?option_:(option__ : forward_values option)
    ?headers_allow_list:(headers_allow_list_ : header_forward_list option) () =
  ({ option_ = option__; headers_allow_list = headers_allow_list_ } : header_object)

let make_cookie_object ?option_:(option__ : forward_values option)
    ?cookies_allow_list:(cookies_allow_list_ : string_list option) () =
  ({ option_ = option__; cookies_allow_list = cookies_allow_list_ } : cookie_object)

let make_cache_settings ?default_tt_l:(default_tt_l_ : long option)
    ?minimum_tt_l:(minimum_tt_l_ : long option) ?maximum_tt_l:(maximum_tt_l_ : long option)
    ?allowed_http_methods:(allowed_http_methods_ : non_empty_string option)
    ?cached_http_methods:(cached_http_methods_ : non_empty_string option)
    ?forwarded_cookies:(forwarded_cookies_ : cookie_object option)
    ?forwarded_headers:(forwarded_headers_ : header_object option)
    ?forwarded_query_strings:(forwarded_query_strings_ : query_string_object option) () =
  ({
     default_tt_l = default_tt_l_;
     minimum_tt_l = minimum_tt_l_;
     maximum_tt_l = maximum_tt_l_;
     allowed_http_methods = allowed_http_methods_;
     cached_http_methods = cached_http_methods_;
     forwarded_cookies = forwarded_cookies_;
     forwarded_headers = forwarded_headers_;
     forwarded_query_strings = forwarded_query_strings_;
   }
    : cache_settings)

let make_dns_record_creation_state ?code:(code_ : dns_record_creation_state_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : dns_record_creation_state)

let make_resource_record ?name:(name_ : string_ option) ?type_:(type__ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ name = name_; type_ = type__; value = value_ } : resource_record)

let make_domain_validation_record ?domain_name:(domain_name_ : domain_name option)
    ?resource_record:(resource_record_ : resource_record option)
    ?dns_record_creation_state:(dns_record_creation_state_ : dns_record_creation_state option)
    ?validation_status:(validation_status_ : certificate_domain_validation_status option) () =
  ({
     domain_name = domain_name_;
     resource_record = resource_record_;
     dns_record_creation_state = dns_record_creation_state_;
     validation_status = validation_status_;
   }
    : domain_validation_record)

let make_renewal_summary
    ?domain_validation_records:(domain_validation_records_ : domain_validation_record_list option)
    ?renewal_status:(renewal_status_ : renewal_status option)
    ?renewal_status_reason:(renewal_status_reason_ : renewal_status_reason option)
    ?updated_at:(updated_at_ : iso_date option) () =
  ({
     domain_validation_records = domain_validation_records_;
     renewal_status = renewal_status_;
     renewal_status_reason = renewal_status_reason_;
     updated_at = updated_at_;
   }
    : renewal_summary)

let make_certificate ?arn:(arn_ : non_empty_string option) ?name:(name_ : certificate_name option)
    ?domain_name:(domain_name_ : domain_name option) ?status:(status_ : certificate_status option)
    ?serial_number:(serial_number_ : serial_number option)
    ?subject_alternative_names:(subject_alternative_names_ : subject_alternative_name_list option)
    ?domain_validation_records:(domain_validation_records_ : domain_validation_record_list option)
    ?request_failure_reason:(request_failure_reason_ : request_failure_reason option)
    ?in_use_resource_count:(in_use_resource_count_ : in_use_resource_count option)
    ?key_algorithm:(key_algorithm_ : key_algorithm option)
    ?created_at:(created_at_ : iso_date option) ?issued_at:(issued_at_ : iso_date option)
    ?issuer_c_a:(issuer_c_a_ : issuer_c_a option) ?not_before:(not_before_ : iso_date option)
    ?not_after:(not_after_ : iso_date option)
    ?eligible_to_renew:(eligible_to_renew_ : eligible_to_renew option)
    ?renewal_summary:(renewal_summary_ : renewal_summary option)
    ?revoked_at:(revoked_at_ : iso_date option)
    ?revocation_reason:(revocation_reason_ : revocation_reason option)
    ?tags:(tags_ : tag_list option) ?support_code:(support_code_ : string_ option) () =
  ({
     arn = arn_;
     name = name_;
     domain_name = domain_name_;
     status = status_;
     serial_number = serial_number_;
     subject_alternative_names = subject_alternative_names_;
     domain_validation_records = domain_validation_records_;
     request_failure_reason = request_failure_reason_;
     in_use_resource_count = in_use_resource_count_;
     key_algorithm = key_algorithm_;
     created_at = created_at_;
     issued_at = issued_at_;
     issuer_c_a = issuer_c_a_;
     not_before = not_before_;
     not_after = not_after_;
     eligible_to_renew = eligible_to_renew_;
     renewal_summary = renewal_summary_;
     revoked_at = revoked_at_;
     revocation_reason = revocation_reason_;
     tags = tags_;
     support_code = support_code_;
   }
    : certificate)

let make_certificate_summary ?certificate_arn:(certificate_arn_ : non_empty_string option)
    ?certificate_name:(certificate_name_ : certificate_name option)
    ?domain_name:(domain_name_ : domain_name option)
    ?certificate_detail:(certificate_detail_ : certificate option) ?tags:(tags_ : tag_list option)
    () =
  ({
     certificate_arn = certificate_arn_;
     certificate_name = certificate_name_;
     domain_name = domain_name_;
     certificate_detail = certificate_detail_;
     tags = tags_;
   }
    : certificate_summary)

let make_port_info ?from_port:(from_port_ : port option) ?to_port:(to_port_ : port option)
    ?protocol:(protocol_ : network_protocol option) ?cidrs:(cidrs_ : string_list option)
    ?ipv6_cidrs:(ipv6_cidrs_ : string_list option)
    ?cidr_list_aliases:(cidr_list_aliases_ : string_list option) () =
  ({
     from_port = from_port_;
     to_port = to_port_;
     protocol = protocol_;
     cidrs = cidrs_;
     ipv6_cidrs = ipv6_cidrs_;
     cidr_list_aliases = cidr_list_aliases_;
   }
    : port_info)

let make_close_instance_public_ports_request ~port_info:(port_info_ : port_info)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ port_info = port_info_; instance_name = instance_name_ } : close_instance_public_ports_request)

let make_destination_info ?id:(id_ : non_empty_string option)
    ?service:(service_ : non_empty_string option) () =
  ({ id = id_; service = service_ } : destination_info)

let make_cloud_formation_stack_record_source_info
    ?resource_type:(resource_type_ : cloud_formation_stack_record_source_type option)
    ?name:(name_ : non_empty_string option) ?arn:(arn_ : non_empty_string option) () =
  ({ resource_type = resource_type_; name = name_; arn = arn_ }
    : cloud_formation_stack_record_source_info)

let make_cloud_formation_stack_record ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?state:(state_ : record_state option)
    ?source_info:(source_info_ : cloud_formation_stack_record_source_info_list option)
    ?destination_info:(destination_info_ : destination_info option) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     state = state_;
     source_info = source_info_;
     destination_info = destination_info_;
   }
    : cloud_formation_stack_record)

let make_contact_method ?contact_endpoint:(contact_endpoint_ : non_empty_string option)
    ?status:(status_ : contact_method_status option) ?protocol:(protocol_ : contact_protocol option)
    ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option)
    ?support_code:(support_code_ : string_ option) ?tags:(tags_ : tag_list option) () =
  ({
     contact_endpoint = contact_endpoint_;
     status = status_;
     protocol = protocol_;
     name = name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     support_code = support_code_;
     tags = tags_;
   }
    : contact_method)

let make_container ?image:(image_ : string_ option) ?command:(command_ : string_list option)
    ?environment:(environment_ : environment option) ?ports:(ports_ : port_map option) () =
  ({ image = image_; command = command_; environment = environment_; ports = ports_ } : container)

let make_container_image ?image:(image_ : string_ option) ?digest:(digest_ : string_ option)
    ?created_at:(created_at_ : iso_date option) () =
  ({ image = image_; digest = digest_; created_at = created_at_ } : container_image)

let make_container_service_ecr_image_puller_role ?is_active:(is_active_ : boolean_ option)
    ?principal_arn:(principal_arn_ : string_ option) () =
  ({ is_active = is_active_; principal_arn = principal_arn_ }
    : container_service_ecr_image_puller_role)

let make_private_registry_access
    ?ecr_image_puller_role:(ecr_image_puller_role_ : container_service_ecr_image_puller_role option)
    () =
  ({ ecr_image_puller_role = ecr_image_puller_role_ } : private_registry_access)

let make_container_service_health_check_config
    ?healthy_threshold:(healthy_threshold_ : integer option)
    ?unhealthy_threshold:(unhealthy_threshold_ : integer option)
    ?timeout_seconds:(timeout_seconds_ : integer option)
    ?interval_seconds:(interval_seconds_ : integer option) ?path:(path_ : string_ option)
    ?success_codes:(success_codes_ : string_ option) () =
  ({
     healthy_threshold = healthy_threshold_;
     unhealthy_threshold = unhealthy_threshold_;
     timeout_seconds = timeout_seconds_;
     interval_seconds = interval_seconds_;
     path = path_;
     success_codes = success_codes_;
   }
    : container_service_health_check_config)

let make_container_service_endpoint ?container_name:(container_name_ : string_ option)
    ?container_port:(container_port_ : integer option)
    ?health_check:(health_check_ : container_service_health_check_config option) () =
  ({
     container_name = container_name_;
     container_port = container_port_;
     health_check = health_check_;
   }
    : container_service_endpoint)

let make_container_service_deployment ?version:(version_ : integer option)
    ?state:(state_ : container_service_deployment_state option)
    ?containers:(containers_ : container_map option)
    ?public_endpoint:(public_endpoint_ : container_service_endpoint option)
    ?created_at:(created_at_ : iso_date option) () =
  ({
     version = version_;
     state = state_;
     containers = containers_;
     public_endpoint = public_endpoint_;
     created_at = created_at_;
   }
    : container_service_deployment)

let make_container_service_state_detail ?code:(code_ : container_service_state_detail_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : container_service_state_detail)

let make_container_service
    ?container_service_name:(container_service_name_ : container_service_name option)
    ?arn:(arn_ : non_empty_string option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?power:(power_ : container_service_power_name option) ?power_id:(power_id_ : string_ option)
    ?state:(state_ : container_service_state option)
    ?state_detail:(state_detail_ : container_service_state_detail option)
    ?scale:(scale_ : container_service_scale option)
    ?current_deployment:(current_deployment_ : container_service_deployment option)
    ?next_deployment:(next_deployment_ : container_service_deployment option)
    ?is_disabled:(is_disabled_ : boolean_ option) ?principal_arn:(principal_arn_ : string_ option)
    ?private_domain_name:(private_domain_name_ : string_ option)
    ?public_domain_names:(public_domain_names_ : container_service_public_domains option)
    ?url:(url_ : string_ option)
    ?private_registry_access:(private_registry_access_ : private_registry_access option) () =
  ({
     container_service_name = container_service_name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     power = power_;
     power_id = power_id_;
     state = state_;
     state_detail = state_detail_;
     scale = scale_;
     current_deployment = current_deployment_;
     next_deployment = next_deployment_;
     is_disabled = is_disabled_;
     principal_arn = principal_arn_;
     private_domain_name = private_domain_name_;
     public_domain_names = public_domain_names_;
     url = url_;
     private_registry_access = private_registry_access_;
   }
    : container_service)

let make_endpoint_request
    ?health_check:(health_check_ : container_service_health_check_config option)
    ~container_name:(container_name_ : string_) ~container_port:(container_port_ : integer) () =
  ({
     container_name = container_name_;
     container_port = container_port_;
     health_check = health_check_;
   }
    : endpoint_request)

let make_container_service_deployment_request ?containers:(containers_ : container_map option)
    ?public_endpoint:(public_endpoint_ : endpoint_request option) () =
  ({ containers = containers_; public_endpoint = public_endpoint_ }
    : container_service_deployment_request)

let make_container_service_ecr_image_puller_role_request ?is_active:(is_active_ : boolean_ option)
    () =
  ({ is_active = is_active_ } : container_service_ecr_image_puller_role_request)

let make_container_service_log_event ?created_at:(created_at_ : iso_date option)
    ?message:(message_ : string_ option) () =
  ({ created_at = created_at_; message = message_ } : container_service_log_event)

let make_container_service_power ?power_id:(power_id_ : string_ option)
    ?price:(price_ : float_ option) ?cpu_count:(cpu_count_ : float_ option)
    ?ram_size_in_gb:(ram_size_in_gb_ : float_ option) ?name:(name_ : string_ option)
    ?is_active:(is_active_ : boolean_ option) () =
  ({
     power_id = power_id_;
     price = price_;
     cpu_count = cpu_count_;
     ram_size_in_gb = ram_size_in_gb_;
     name = name_;
     is_active = is_active_;
   }
    : container_service_power)

let make_container_service_registry_login ?username:(username_ : string_ option)
    ?password:(password_ : string_ option) ?expires_at:(expires_at_ : iso_date option)
    ?registry:(registry_ : string_ option) () =
  ({ username = username_; password = password_; expires_at = expires_at_; registry = registry_ }
    : container_service_registry_login)

let make_copy_snapshot_request ?source_snapshot_name:(source_snapshot_name_ : resource_name option)
    ?source_resource_name:(source_resource_name_ : string_ option)
    ?restore_date:(restore_date_ : string_ option)
    ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_ : boolean_ option)
    ~target_snapshot_name:(target_snapshot_name_ : resource_name)
    ~source_region:(source_region_ : region_name) () =
  ({
     source_snapshot_name = source_snapshot_name_;
     source_resource_name = source_resource_name_;
     restore_date = restore_date_;
     use_latest_restorable_auto_snapshot = use_latest_restorable_auto_snapshot_;
     target_snapshot_name = target_snapshot_name_;
     source_region = source_region_;
   }
    : copy_snapshot_request)

let make_time_period ?start:(start_ : iso_date option) ?end_:(end__ : iso_date option) () =
  ({ start = start_; end_ = end__ } : time_period)

let make_estimate_by_time ?usage_cost:(usage_cost_ : double option)
    ?pricing_unit:(pricing_unit_ : pricing_unit option) ?unit_:(unit__ : double option)
    ?currency:(currency_ : currency option) ?time_period:(time_period_ : time_period option) () =
  ({
     usage_cost = usage_cost_;
     pricing_unit = pricing_unit_;
     unit_ = unit__;
     currency = currency_;
     time_period = time_period_;
   }
    : estimate_by_time)

let make_cost_estimate ?usage_type:(usage_type_ : non_empty_string option)
    ?results_by_time:(results_by_time_ : estimates_by_time option) () =
  ({ usage_type = usage_type_; results_by_time = results_by_time_ } : cost_estimate)

let make_create_bucket_request ?tags:(tags_ : tag_list option)
    ?enable_object_versioning:(enable_object_versioning_ : boolean_ option)
    ~bucket_name:(bucket_name_ : bucket_name) ~bundle_id:(bundle_id_ : non_empty_string) () =
  ({
     bucket_name = bucket_name_;
     bundle_id = bundle_id_;
     tags = tags_;
     enable_object_versioning = enable_object_versioning_;
   }
    : create_bucket_request)

let make_create_bucket_access_key_request ~bucket_name:(bucket_name_ : bucket_name) () =
  ({ bucket_name = bucket_name_ } : create_bucket_access_key_request)

let make_create_certificate_request
    ?subject_alternative_names:(subject_alternative_names_ : subject_alternative_name_list option)
    ?tags:(tags_ : tag_list option) ~certificate_name:(certificate_name_ : certificate_name)
    ~domain_name:(domain_name_ : domain_name) () =
  ({
     certificate_name = certificate_name_;
     domain_name = domain_name_;
     subject_alternative_names = subject_alternative_names_;
     tags = tags_;
   }
    : create_certificate_request)

let make_instance_entry ?user_data:(user_data_ : string_ option)
    ~source_name:(source_name_ : resource_name) ~instance_type:(instance_type_ : non_empty_string)
    ~port_info_source:(port_info_source_ : port_info_source_type)
    ~availability_zone:(availability_zone_ : string_) () =
  ({
     source_name = source_name_;
     instance_type = instance_type_;
     port_info_source = port_info_source_;
     user_data = user_data_;
     availability_zone = availability_zone_;
   }
    : instance_entry)

let make_create_cloud_formation_stack_request ~instances:(instances_ : instance_entry_list) () =
  ({ instances = instances_ } : create_cloud_formation_stack_request)

let make_create_contact_method_request ?tags:(tags_ : tag_list option)
    ~protocol:(protocol_ : contact_protocol) ~contact_endpoint:(contact_endpoint_ : string_max256)
    () =
  ({ protocol = protocol_; contact_endpoint = contact_endpoint_; tags = tags_ }
    : create_contact_method_request)

let make_private_registry_access_request
    ?ecr_image_puller_role:
      (ecr_image_puller_role_ : container_service_ecr_image_puller_role_request option) () =
  ({ ecr_image_puller_role = ecr_image_puller_role_ } : private_registry_access_request)

let make_create_container_service_request ?tags:(tags_ : tag_list option)
    ?public_domain_names:(public_domain_names_ : container_service_public_domains option)
    ?deployment:(deployment_ : container_service_deployment_request option)
    ?private_registry_access:(private_registry_access_ : private_registry_access_request option)
    ~service_name:(service_name_ : container_service_name)
    ~power:(power_ : container_service_power_name) ~scale:(scale_ : container_service_scale) () =
  ({
     service_name = service_name_;
     power = power_;
     scale = scale_;
     tags = tags_;
     public_domain_names = public_domain_names_;
     deployment = deployment_;
     private_registry_access = private_registry_access_;
   }
    : create_container_service_request)

let make_create_container_service_deployment_request
    ?containers:(containers_ : container_map option)
    ?public_endpoint:(public_endpoint_ : endpoint_request option)
    ~service_name:(service_name_ : container_service_name) () =
  ({ service_name = service_name_; containers = containers_; public_endpoint = public_endpoint_ }
    : create_container_service_deployment_request)

let make_create_container_service_registry_login_request () = (() : unit)

let make_create_disk_request ?tags:(tags_ : tag_list option)
    ?add_ons:(add_ons_ : add_on_request_list option) ~disk_name:(disk_name_ : resource_name)
    ~availability_zone:(availability_zone_ : non_empty_string) ~size_in_gb:(size_in_gb_ : integer)
    () =
  ({
     disk_name = disk_name_;
     availability_zone = availability_zone_;
     size_in_gb = size_in_gb_;
     tags = tags_;
     add_ons = add_ons_;
   }
    : create_disk_request)

let make_create_disk_from_snapshot_request
    ?disk_snapshot_name:(disk_snapshot_name_ : resource_name option) ?tags:(tags_ : tag_list option)
    ?add_ons:(add_ons_ : add_on_request_list option)
    ?source_disk_name:(source_disk_name_ : string_ option)
    ?restore_date:(restore_date_ : string_ option)
    ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_ : boolean_ option)
    ~disk_name:(disk_name_ : resource_name)
    ~availability_zone:(availability_zone_ : non_empty_string) ~size_in_gb:(size_in_gb_ : integer)
    () =
  ({
     disk_name = disk_name_;
     disk_snapshot_name = disk_snapshot_name_;
     availability_zone = availability_zone_;
     size_in_gb = size_in_gb_;
     tags = tags_;
     add_ons = add_ons_;
     source_disk_name = source_disk_name_;
     restore_date = restore_date_;
     use_latest_restorable_auto_snapshot = use_latest_restorable_auto_snapshot_;
   }
    : create_disk_from_snapshot_request)

let make_create_disk_snapshot_request ?disk_name:(disk_name_ : resource_name option)
    ?instance_name:(instance_name_ : resource_name option) ?tags:(tags_ : tag_list option)
    ~disk_snapshot_name:(disk_snapshot_name_ : resource_name) () =
  ({
     disk_name = disk_name_;
     disk_snapshot_name = disk_snapshot_name_;
     instance_name = instance_name_;
     tags = tags_;
   }
    : create_disk_snapshot_request)

let make_origin ?name:(name_ : resource_name option)
    ?resource_type:(resource_type_ : resource_type option)
    ?region_name:(region_name_ : region_name option)
    ?protocol_policy:(protocol_policy_ : origin_protocol_policy_enum option)
    ?response_timeout:(response_timeout_ : integer option)
    ?ip_address_type:(ip_address_type_ : origin_ip_address_type_enum option) () =
  ({
     name = name_;
     resource_type = resource_type_;
     region_name = region_name_;
     protocol_policy = protocol_policy_;
     response_timeout = response_timeout_;
     ip_address_type = ip_address_type_;
   }
    : origin)

let make_lightsail_distribution ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?support_code:(support_code_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option)
    ?alternative_domain_names:(alternative_domain_names_ : string_list option)
    ?status:(status_ : string_ option) ?is_enabled:(is_enabled_ : boolean_ option)
    ?domain_name:(domain_name_ : string_ option) ?bundle_id:(bundle_id_ : string_ option)
    ?certificate_name:(certificate_name_ : resource_name option) ?origin:(origin_ : origin option)
    ?origin_public_dn_s:(origin_public_dn_s_ : string_ option)
    ?default_cache_behavior:(default_cache_behavior_ : cache_behavior option)
    ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
    ?cache_behaviors:(cache_behaviors_ : cache_behavior_list option)
    ?able_to_update_bundle:(able_to_update_bundle_ : boolean_ option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) ?tags:(tags_ : tag_list option)
    ?viewer_minimum_tls_protocol_version:(viewer_minimum_tls_protocol_version_ : string_ option) ()
    =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     alternative_domain_names = alternative_domain_names_;
     status = status_;
     is_enabled = is_enabled_;
     domain_name = domain_name_;
     bundle_id = bundle_id_;
     certificate_name = certificate_name_;
     origin = origin_;
     origin_public_dn_s = origin_public_dn_s_;
     default_cache_behavior = default_cache_behavior_;
     cache_behavior_settings = cache_behavior_settings_;
     cache_behaviors = cache_behaviors_;
     able_to_update_bundle = able_to_update_bundle_;
     ip_address_type = ip_address_type_;
     tags = tags_;
     viewer_minimum_tls_protocol_version = viewer_minimum_tls_protocol_version_;
   }
    : lightsail_distribution)

let make_input_origin ?name:(name_ : resource_name option)
    ?region_name:(region_name_ : region_name option)
    ?protocol_policy:(protocol_policy_ : origin_protocol_policy_enum option)
    ?response_timeout:(response_timeout_ : integer option)
    ?ip_address_type:(ip_address_type_ : origin_ip_address_type_enum option) () =
  ({
     name = name_;
     region_name = region_name_;
     protocol_policy = protocol_policy_;
     response_timeout = response_timeout_;
     ip_address_type = ip_address_type_;
   }
    : input_origin)

let make_create_distribution_request
    ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
    ?cache_behaviors:(cache_behaviors_ : cache_behavior_list option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) ?tags:(tags_ : tag_list option)
    ?certificate_name:(certificate_name_ : resource_name option)
    ?viewer_minimum_tls_protocol_version:
      (viewer_minimum_tls_protocol_version_ : viewer_minimum_tls_protocol_version_enum option)
    ~distribution_name:(distribution_name_ : resource_name) ~origin:(origin_ : input_origin)
    ~default_cache_behavior:(default_cache_behavior_ : cache_behavior)
    ~bundle_id:(bundle_id_ : string_) () =
  ({
     distribution_name = distribution_name_;
     origin = origin_;
     default_cache_behavior = default_cache_behavior_;
     cache_behavior_settings = cache_behavior_settings_;
     cache_behaviors = cache_behaviors_;
     bundle_id = bundle_id_;
     ip_address_type = ip_address_type_;
     tags = tags_;
     certificate_name = certificate_name_;
     viewer_minimum_tls_protocol_version = viewer_minimum_tls_protocol_version_;
   }
    : create_distribution_request)

let make_create_domain_request ?tags:(tags_ : tag_list option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; tags = tags_ } : create_domain_request)

let make_domain_entry ?id:(id_ : non_empty_string option) ?name:(name_ : domain_name option)
    ?target:(target_ : string_ option) ?is_alias:(is_alias_ : boolean_ option)
    ?type_:(type__ : domain_entry_type option) ?options:(options_ : domain_entry_options option) ()
    =
  ({
     id = id_;
     name = name_;
     target = target_;
     is_alias = is_alias_;
     type_ = type__;
     options = options_;
   }
    : domain_entry)

let make_create_domain_entry_request ~domain_name:(domain_name_ : domain_name)
    ~domain_entry:(domain_entry_ : domain_entry) () =
  ({ domain_name = domain_name_; domain_entry = domain_entry_ } : create_domain_entry_request)

let make_session ?name:(name_ : non_empty_string option)
    ?url:(url_ : sensitive_non_empty_string option) ?is_primary:(is_primary_ : boolean_ option) () =
  ({ name = name_; url = url_; is_primary = is_primary_ } : session)

let make_create_gui_session_access_details_request ~resource_name:(resource_name_ : resource_name)
    () =
  ({ resource_name = resource_name_ } : create_gui_session_access_details_request)

let make_create_instance_snapshot_request ?tags:(tags_ : tag_list option)
    ~instance_snapshot_name:(instance_snapshot_name_ : resource_name)
    ~instance_name:(instance_name_ : resource_name) () =
  ({
     instance_snapshot_name = instance_snapshot_name_;
     instance_name = instance_name_;
     tags = tags_;
   }
    : create_instance_snapshot_request)

let make_create_instances_request ?custom_image_name:(custom_image_name_ : resource_name option)
    ?user_data:(user_data_ : string_ option) ?key_pair_name:(key_pair_name_ : resource_name option)
    ?tags:(tags_ : tag_list option) ?add_ons:(add_ons_ : add_on_request_list option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ~instance_names:(instance_names_ : string_list)
    ~availability_zone:(availability_zone_ : string_)
    ~blueprint_id:(blueprint_id_ : non_empty_string) ~bundle_id:(bundle_id_ : non_empty_string) () =
  ({
     instance_names = instance_names_;
     availability_zone = availability_zone_;
     custom_image_name = custom_image_name_;
     blueprint_id = blueprint_id_;
     bundle_id = bundle_id_;
     user_data = user_data_;
     key_pair_name = key_pair_name_;
     tags = tags_;
     add_ons = add_ons_;
     ip_address_type = ip_address_type_;
   }
    : create_instances_request)

let make_create_instances_from_snapshot_request
    ?attached_disk_mapping:(attached_disk_mapping_ : attached_disk_map option)
    ?instance_snapshot_name:(instance_snapshot_name_ : resource_name option)
    ?user_data:(user_data_ : string_ option) ?key_pair_name:(key_pair_name_ : resource_name option)
    ?tags:(tags_ : tag_list option) ?add_ons:(add_ons_ : add_on_request_list option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?source_instance_name:(source_instance_name_ : string_ option)
    ?restore_date:(restore_date_ : string_ option)
    ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_ : boolean_ option)
    ~instance_names:(instance_names_ : string_list)
    ~availability_zone:(availability_zone_ : string_) ~bundle_id:(bundle_id_ : non_empty_string) ()
    =
  ({
     instance_names = instance_names_;
     attached_disk_mapping = attached_disk_mapping_;
     availability_zone = availability_zone_;
     instance_snapshot_name = instance_snapshot_name_;
     bundle_id = bundle_id_;
     user_data = user_data_;
     key_pair_name = key_pair_name_;
     tags = tags_;
     add_ons = add_ons_;
     ip_address_type = ip_address_type_;
     source_instance_name = source_instance_name_;
     restore_date = restore_date_;
     use_latest_restorable_auto_snapshot = use_latest_restorable_auto_snapshot_;
   }
    : create_instances_from_snapshot_request)

let make_key_pair ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?fingerprint:(fingerprint_ : base64 option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     fingerprint = fingerprint_;
   }
    : key_pair)

let make_create_key_pair_request ?tags:(tags_ : tag_list option)
    ~key_pair_name:(key_pair_name_ : resource_name) () =
  ({ key_pair_name = key_pair_name_; tags = tags_ } : create_key_pair_request)

let make_create_load_balancer_request ?health_check_path:(health_check_path_ : string_ option)
    ?certificate_name:(certificate_name_ : resource_name option)
    ?certificate_domain_name:(certificate_domain_name_ : domain_name option)
    ?certificate_alternative_names:(certificate_alternative_names_ : domain_name_list option)
    ?tags:(tags_ : tag_list option) ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?tls_policy_name:(tls_policy_name_ : string_ option)
    ~load_balancer_name:(load_balancer_name_ : resource_name) ~instance_port:(instance_port_ : port)
    () =
  ({
     load_balancer_name = load_balancer_name_;
     instance_port = instance_port_;
     health_check_path = health_check_path_;
     certificate_name = certificate_name_;
     certificate_domain_name = certificate_domain_name_;
     certificate_alternative_names = certificate_alternative_names_;
     tags = tags_;
     ip_address_type = ip_address_type_;
     tls_policy_name = tls_policy_name_;
   }
    : create_load_balancer_request)

let make_create_load_balancer_tls_certificate_request
    ?certificate_alternative_names:(certificate_alternative_names_ : domain_name_list option)
    ?tags:(tags_ : tag_list option) ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~certificate_name:(certificate_name_ : resource_name)
    ~certificate_domain_name:(certificate_domain_name_ : domain_name) () =
  ({
     load_balancer_name = load_balancer_name_;
     certificate_name = certificate_name_;
     certificate_domain_name = certificate_domain_name_;
     certificate_alternative_names = certificate_alternative_names_;
     tags = tags_;
   }
    : create_load_balancer_tls_certificate_request)

let make_create_relational_database_request ?availability_zone:(availability_zone_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ~relational_database_name:(relational_database_name_ : resource_name)
    ~relational_database_blueprint_id:(relational_database_blueprint_id_ : string_)
    ~relational_database_bundle_id:(relational_database_bundle_id_ : string_)
    ~master_database_name:(master_database_name_ : string_)
    ~master_username:(master_username_ : string_) () =
  ({
     relational_database_name = relational_database_name_;
     availability_zone = availability_zone_;
     relational_database_blueprint_id = relational_database_blueprint_id_;
     relational_database_bundle_id = relational_database_bundle_id_;
     master_database_name = master_database_name_;
     master_username = master_username_;
     master_user_password = master_user_password_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
   }
    : create_relational_database_request)

let make_create_relational_database_from_snapshot_request
    ?availability_zone:(availability_zone_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?relational_database_snapshot_name:(relational_database_snapshot_name_ : resource_name option)
    ?relational_database_bundle_id:(relational_database_bundle_id_ : string_ option)
    ?source_relational_database_name:(source_relational_database_name_ : resource_name option)
    ?restore_time:(restore_time_ : iso_date option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_ option)
    ?tags:(tags_ : tag_list option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     availability_zone = availability_zone_;
     publicly_accessible = publicly_accessible_;
     relational_database_snapshot_name = relational_database_snapshot_name_;
     relational_database_bundle_id = relational_database_bundle_id_;
     source_relational_database_name = source_relational_database_name_;
     restore_time = restore_time_;
     use_latest_restorable_time = use_latest_restorable_time_;
     tags = tags_;
   }
    : create_relational_database_from_snapshot_request)

let make_create_relational_database_snapshot_request ?tags:(tags_ : tag_list option)
    ~relational_database_name:(relational_database_name_ : resource_name)
    ~relational_database_snapshot_name:(relational_database_snapshot_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     relational_database_snapshot_name = relational_database_snapshot_name_;
     tags = tags_;
   }
    : create_relational_database_snapshot_request)

let make_delete_alarm_request ~alarm_name:(alarm_name_ : resource_name) () =
  ({ alarm_name = alarm_name_ } : delete_alarm_request)

let make_delete_auto_snapshot_request ~resource_name:(resource_name_ : resource_name)
    ~date:(date_ : auto_snapshot_date) () =
  ({ resource_name = resource_name_; date = date_ } : delete_auto_snapshot_request)

let make_delete_bucket_request ?force_delete:(force_delete_ : boolean_ option)
    ~bucket_name:(bucket_name_ : bucket_name) () =
  ({ bucket_name = bucket_name_; force_delete = force_delete_ } : delete_bucket_request)

let make_delete_bucket_access_key_request ~bucket_name:(bucket_name_ : bucket_name)
    ~access_key_id:(access_key_id_ : non_empty_string) () =
  ({ bucket_name = bucket_name_; access_key_id = access_key_id_ }
    : delete_bucket_access_key_request)

let make_delete_certificate_request ~certificate_name:(certificate_name_ : certificate_name) () =
  ({ certificate_name = certificate_name_ } : delete_certificate_request)

let make_delete_contact_method_request ~protocol:(protocol_ : contact_protocol) () =
  ({ protocol = protocol_ } : delete_contact_method_request)

let make_delete_container_image_request ~service_name:(service_name_ : container_service_name)
    ~image:(image_ : string_) () =
  ({ service_name = service_name_; image = image_ } : delete_container_image_request)

let make_delete_container_service_request ~service_name:(service_name_ : container_service_name) ()
    =
  ({ service_name = service_name_ } : delete_container_service_request)

let make_delete_disk_request ?force_delete_add_ons:(force_delete_add_ons_ : boolean_ option)
    ~disk_name:(disk_name_ : resource_name) () =
  ({ disk_name = disk_name_; force_delete_add_ons = force_delete_add_ons_ } : delete_disk_request)

let make_delete_disk_snapshot_request ~disk_snapshot_name:(disk_snapshot_name_ : resource_name) () =
  ({ disk_snapshot_name = disk_snapshot_name_ } : delete_disk_snapshot_request)

let make_delete_distribution_request ?distribution_name:(distribution_name_ : resource_name option)
    () =
  ({ distribution_name = distribution_name_ } : delete_distribution_request)

let make_delete_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : delete_domain_request)

let make_delete_domain_entry_request ~domain_name:(domain_name_ : domain_name)
    ~domain_entry:(domain_entry_ : domain_entry) () =
  ({ domain_name = domain_name_; domain_entry = domain_entry_ } : delete_domain_entry_request)

let make_delete_instance_request ?force_delete_add_ons:(force_delete_add_ons_ : boolean_ option)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_; force_delete_add_ons = force_delete_add_ons_ }
    : delete_instance_request)

let make_delete_instance_snapshot_request
    ~instance_snapshot_name:(instance_snapshot_name_ : resource_name) () =
  ({ instance_snapshot_name = instance_snapshot_name_ } : delete_instance_snapshot_request)

let make_delete_key_pair_request ?expected_fingerprint:(expected_fingerprint_ : string_ option)
    ~key_pair_name:(key_pair_name_ : resource_name) () =
  ({ key_pair_name = key_pair_name_; expected_fingerprint = expected_fingerprint_ }
    : delete_key_pair_request)

let make_delete_known_host_keys_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : delete_known_host_keys_request)

let make_delete_load_balancer_request ~load_balancer_name:(load_balancer_name_ : resource_name) () =
  ({ load_balancer_name = load_balancer_name_ } : delete_load_balancer_request)

let make_delete_load_balancer_tls_certificate_request ?force:(force_ : boolean_ option)
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~certificate_name:(certificate_name_ : resource_name) () =
  ({
     load_balancer_name = load_balancer_name_;
     certificate_name = certificate_name_;
     force = force_;
   }
    : delete_load_balancer_tls_certificate_request)

let make_delete_relational_database_request
    ?skip_final_snapshot:(skip_final_snapshot_ : boolean_ option)
    ?final_relational_database_snapshot_name:
      (final_relational_database_snapshot_name_ : resource_name option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     skip_final_snapshot = skip_final_snapshot_;
     final_relational_database_snapshot_name = final_relational_database_snapshot_name_;
   }
    : delete_relational_database_request)

let make_delete_relational_database_snapshot_request
    ~relational_database_snapshot_name:(relational_database_snapshot_name_ : resource_name) () =
  ({ relational_database_snapshot_name = relational_database_snapshot_name_ }
    : delete_relational_database_snapshot_request)

let make_detach_certificate_from_distribution_request
    ~distribution_name:(distribution_name_ : resource_name) () =
  ({ distribution_name = distribution_name_ } : detach_certificate_from_distribution_request)

let make_detach_disk_request ~disk_name:(disk_name_ : resource_name) () =
  ({ disk_name = disk_name_ } : detach_disk_request)

let make_detach_instances_from_load_balancer_request
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~instance_names:(instance_names_ : resource_name_list) () =
  ({ load_balancer_name = load_balancer_name_; instance_names = instance_names_ }
    : detach_instances_from_load_balancer_request)

let make_detach_static_ip_request ~static_ip_name:(static_ip_name_ : resource_name) () =
  ({ static_ip_name = static_ip_name_ } : detach_static_ip_request)

let make_disable_add_on_request ~add_on_type:(add_on_type_ : add_on_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ add_on_type = add_on_type_; resource_name = resource_name_ } : disable_add_on_request)

let make_disk ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?add_ons:(add_ons_ : add_on_list option) ?size_in_gb:(size_in_gb_ : integer option)
    ?is_system_disk:(is_system_disk_ : boolean_ option) ?iops:(iops_ : integer option)
    ?path:(path_ : string_ option) ?state:(state_ : disk_state option)
    ?attached_to:(attached_to_ : resource_name option) ?is_attached:(is_attached_ : boolean_ option)
    ?attachment_state:(attachment_state_ : string_ option) ?gb_in_use:(gb_in_use_ : integer option)
    ?auto_mount_status:(auto_mount_status_ : auto_mount_status option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     add_ons = add_ons_;
     size_in_gb = size_in_gb_;
     is_system_disk = is_system_disk_;
     iops = iops_;
     path = path_;
     state = state_;
     attached_to = attached_to_;
     is_attached = is_attached_;
     attachment_state = attachment_state_;
     gb_in_use = gb_in_use_;
     auto_mount_status = auto_mount_status_;
   }
    : disk)

let make_disk_info ?name:(name_ : string_ option) ?path:(path_ : non_empty_string option)
    ?size_in_gb:(size_in_gb_ : integer option) ?is_system_disk:(is_system_disk_ : boolean_ option)
    () =
  ({ name = name_; path = path_; size_in_gb = size_in_gb_; is_system_disk = is_system_disk_ }
    : disk_info)

let make_disk_snapshot ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?size_in_gb:(size_in_gb_ : integer option) ?state:(state_ : disk_snapshot_state option)
    ?progress:(progress_ : string_ option) ?from_disk_name:(from_disk_name_ : resource_name option)
    ?from_disk_arn:(from_disk_arn_ : non_empty_string option)
    ?from_instance_name:(from_instance_name_ : resource_name option)
    ?from_instance_arn:(from_instance_arn_ : non_empty_string option)
    ?is_from_auto_snapshot:(is_from_auto_snapshot_ : boolean_ option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     size_in_gb = size_in_gb_;
     state = state_;
     progress = progress_;
     from_disk_name = from_disk_name_;
     from_disk_arn = from_disk_arn_;
     from_instance_name = from_instance_name_;
     from_instance_arn = from_instance_arn_;
     is_from_auto_snapshot = is_from_auto_snapshot_;
   }
    : disk_snapshot)

let make_disk_snapshot_info ?size_in_gb:(size_in_gb_ : integer option) () =
  ({ size_in_gb = size_in_gb_ } : disk_snapshot_info)

let make_distribution_bundle ?bundle_id:(bundle_id_ : string_ option) ?name:(name_ : string_ option)
    ?price:(price_ : float_ option)
    ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : integer option)
    ?is_active:(is_active_ : boolean_ option) () =
  ({
     bundle_id = bundle_id_;
     name = name_;
     price = price_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     is_active = is_active_;
   }
    : distribution_bundle)

let make_r53_hosted_zone_deletion_state ?code:(code_ : r53_hosted_zone_deletion_state_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : r53_hosted_zone_deletion_state)

let make_name_servers_update_state ?code:(code_ : name_servers_update_state_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : name_servers_update_state)

let make_registered_domain_delegation_info
    ?name_servers_update_state:(name_servers_update_state_ : name_servers_update_state option)
    ?r53_hosted_zone_deletion_state:
      (r53_hosted_zone_deletion_state_ : r53_hosted_zone_deletion_state option) () =
  ({
     name_servers_update_state = name_servers_update_state_;
     r53_hosted_zone_deletion_state = r53_hosted_zone_deletion_state_;
   }
    : registered_domain_delegation_info)

let make_domain ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?domain_entries:(domain_entries_ : domain_entry_list option)
    ?registered_domain_delegation_info:
      (registered_domain_delegation_info_ : registered_domain_delegation_info option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     domain_entries = domain_entries_;
     registered_domain_delegation_info = registered_domain_delegation_info_;
   }
    : domain)

let make_download_default_key_pair_request () = (() : unit)

let make_enable_add_on_request ~resource_name:(resource_name_ : resource_name)
    ~add_on_request:(add_on_request_ : add_on_request) () =
  ({ resource_name = resource_name_; add_on_request = add_on_request_ } : enable_add_on_request)

let make_export_snapshot_request ~source_snapshot_name:(source_snapshot_name_ : resource_name) () =
  ({ source_snapshot_name = source_snapshot_name_ } : export_snapshot_request)

let make_instance_snapshot_info ?from_bundle_id:(from_bundle_id_ : non_empty_string option)
    ?from_blueprint_id:(from_blueprint_id_ : non_empty_string option)
    ?from_disk_info:(from_disk_info_ : disk_info_list option) () =
  ({
     from_bundle_id = from_bundle_id_;
     from_blueprint_id = from_blueprint_id_;
     from_disk_info = from_disk_info_;
   }
    : instance_snapshot_info)

let make_export_snapshot_record_source_info
    ?resource_type:(resource_type_ : export_snapshot_record_source_type option)
    ?created_at:(created_at_ : iso_date option) ?name:(name_ : non_empty_string option)
    ?arn:(arn_ : non_empty_string option)
    ?from_resource_name:(from_resource_name_ : non_empty_string option)
    ?from_resource_arn:(from_resource_arn_ : non_empty_string option)
    ?instance_snapshot_info:(instance_snapshot_info_ : instance_snapshot_info option)
    ?disk_snapshot_info:(disk_snapshot_info_ : disk_snapshot_info option) () =
  ({
     resource_type = resource_type_;
     created_at = created_at_;
     name = name_;
     arn = arn_;
     from_resource_name = from_resource_name_;
     from_resource_arn = from_resource_arn_;
     instance_snapshot_info = instance_snapshot_info_;
     disk_snapshot_info = disk_snapshot_info_;
   }
    : export_snapshot_record_source_info)

let make_export_snapshot_record ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?state:(state_ : record_state option)
    ?source_info:(source_info_ : export_snapshot_record_source_info option)
    ?destination_info:(destination_info_ : destination_info option) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     state = state_;
     source_info = source_info_;
     destination_info = destination_info_;
   }
    : export_snapshot_record)

let make_get_active_names_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_active_names_request)

let make_get_alarms_request ?alarm_name:(alarm_name_ : resource_name option)
    ?page_token:(page_token_ : string_ option)
    ?monitored_resource_name:(monitored_resource_name_ : resource_name option) () =
  ({
     alarm_name = alarm_name_;
     page_token = page_token_;
     monitored_resource_name = monitored_resource_name_;
   }
    : get_alarms_request)

let make_get_auto_snapshots_request ~resource_name:(resource_name_ : resource_name) () =
  ({ resource_name = resource_name_ } : get_auto_snapshots_request)

let make_get_blueprints_request ?include_inactive:(include_inactive_ : boolean_ option)
    ?page_token:(page_token_ : string_ option) ?app_category:(app_category_ : app_category option)
    () =
  ({ include_inactive = include_inactive_; page_token = page_token_; app_category = app_category_ }
    : get_blueprints_request)

let make_get_bucket_access_keys_request ~bucket_name:(bucket_name_ : bucket_name) () =
  ({ bucket_name = bucket_name_ } : get_bucket_access_keys_request)

let make_get_bucket_bundles_request ?include_inactive:(include_inactive_ : boolean_ option) () =
  ({ include_inactive = include_inactive_ } : get_bucket_bundles_request)

let make_metric_datapoint ?average:(average_ : double option) ?maximum:(maximum_ : double option)
    ?minimum:(minimum_ : double option) ?sample_count:(sample_count_ : double option)
    ?sum:(sum_ : double option) ?timestamp:(timestamp_ : timestamp option)
    ?unit_:(unit__ : metric_unit option) () =
  ({
     average = average_;
     maximum = maximum_;
     minimum = minimum_;
     sample_count = sample_count_;
     sum = sum_;
     timestamp = timestamp_;
     unit_ = unit__;
   }
    : metric_datapoint)

let make_get_bucket_metric_data_request ~bucket_name:(bucket_name_ : bucket_name)
    ~metric_name:(metric_name_ : bucket_metric_name) ~start_time:(start_time_ : iso_date)
    ~end_time:(end_time_ : iso_date) ~period:(period_ : metric_period)
    ~statistics:(statistics_ : metric_statistic_list) ~unit_:(unit__ : metric_unit) () =
  ({
     bucket_name = bucket_name_;
     metric_name = metric_name_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     statistics = statistics_;
     unit_ = unit__;
   }
    : get_bucket_metric_data_request)

let make_get_buckets_request ?bucket_name:(bucket_name_ : bucket_name option)
    ?page_token:(page_token_ : string_ option)
    ?include_connected_resources:(include_connected_resources_ : boolean_ option)
    ?include_cors:(include_cors_ : boolean_ option) () =
  ({
     bucket_name = bucket_name_;
     page_token = page_token_;
     include_connected_resources = include_connected_resources_;
     include_cors = include_cors_;
   }
    : get_buckets_request)

let make_get_bundles_request ?include_inactive:(include_inactive_ : boolean_ option)
    ?page_token:(page_token_ : string_ option) ?app_category:(app_category_ : app_category option)
    () =
  ({ include_inactive = include_inactive_; page_token = page_token_; app_category = app_category_ }
    : get_bundles_request)

let make_get_certificates_request
    ?certificate_statuses:(certificate_statuses_ : certificate_status_list option)
    ?include_certificate_details:(include_certificate_details_ : include_certificate_details option)
    ?certificate_name:(certificate_name_ : certificate_name option)
    ?page_token:(page_token_ : string_ option) () =
  ({
     certificate_statuses = certificate_statuses_;
     include_certificate_details = include_certificate_details_;
     certificate_name = certificate_name_;
     page_token = page_token_;
   }
    : get_certificates_request)

let make_get_cloud_formation_stack_records_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_cloud_formation_stack_records_request)

let make_get_contact_methods_request ?protocols:(protocols_ : contact_protocols_list option) () =
  ({ protocols = protocols_ } : get_contact_methods_request)

let make_get_container_api_metadata_request () = (() : unit)

let make_get_container_images_request ~service_name:(service_name_ : container_service_name) () =
  ({ service_name = service_name_ } : get_container_images_request)

let make_get_container_log_request ?start_time:(start_time_ : iso_date option)
    ?end_time:(end_time_ : iso_date option) ?filter_pattern:(filter_pattern_ : string_ option)
    ?page_token:(page_token_ : string_ option)
    ~service_name:(service_name_ : container_service_name)
    ~container_name:(container_name_ : string_) () =
  ({
     service_name = service_name_;
     container_name = container_name_;
     start_time = start_time_;
     end_time = end_time_;
     filter_pattern = filter_pattern_;
     page_token = page_token_;
   }
    : get_container_log_request)

let make_get_container_service_deployments_request
    ~service_name:(service_name_ : container_service_name) () =
  ({ service_name = service_name_ } : get_container_service_deployments_request)

let make_get_container_service_metric_data_request
    ~service_name:(service_name_ : container_service_name)
    ~metric_name:(metric_name_ : container_service_metric_name) ~start_time:(start_time_ : iso_date)
    ~end_time:(end_time_ : iso_date) ~period:(period_ : metric_period)
    ~statistics:(statistics_ : metric_statistic_list) () =
  ({
     service_name = service_name_;
     metric_name = metric_name_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     statistics = statistics_;
   }
    : get_container_service_metric_data_request)

let make_get_container_service_powers_request () = (() : unit)

let make_get_container_services_request
    ?service_name:(service_name_ : container_service_name option) () =
  ({ service_name = service_name_ } : get_container_services_request)

let make_resource_budget_estimate ?resource_name:(resource_name_ : resource_name option)
    ?resource_type:(resource_type_ : resource_type option)
    ?cost_estimates:(cost_estimates_ : cost_estimates option)
    ?start_time:(start_time_ : iso_date option) ?end_time:(end_time_ : iso_date option) () =
  ({
     resource_name = resource_name_;
     resource_type = resource_type_;
     cost_estimates = cost_estimates_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : resource_budget_estimate)

let make_get_cost_estimate_request ~resource_name:(resource_name_ : resource_name)
    ~start_time:(start_time_ : iso_date) ~end_time:(end_time_ : iso_date) () =
  ({ resource_name = resource_name_; start_time = start_time_; end_time = end_time_ }
    : get_cost_estimate_request)

let make_get_disk_request ~disk_name:(disk_name_ : resource_name) () =
  ({ disk_name = disk_name_ } : get_disk_request)

let make_get_disk_snapshot_request ~disk_snapshot_name:(disk_snapshot_name_ : resource_name) () =
  ({ disk_snapshot_name = disk_snapshot_name_ } : get_disk_snapshot_request)

let make_get_disk_snapshots_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_disk_snapshots_request)

let make_get_disks_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_disks_request)

let make_get_distribution_bundles_request () = (() : unit)

let make_get_distribution_latest_cache_reset_request
    ?distribution_name:(distribution_name_ : resource_name option) () =
  ({ distribution_name = distribution_name_ } : get_distribution_latest_cache_reset_request)

let make_get_distribution_metric_data_request
    ~distribution_name:(distribution_name_ : resource_name)
    ~metric_name:(metric_name_ : distribution_metric_name) ~start_time:(start_time_ : timestamp)
    ~end_time:(end_time_ : timestamp) ~period:(period_ : metric_period)
    ~unit_:(unit__ : metric_unit) ~statistics:(statistics_ : metric_statistic_list) () =
  ({
     distribution_name = distribution_name_;
     metric_name = metric_name_;
     start_time = start_time_;
     end_time = end_time_;
     period = period_;
     unit_ = unit__;
     statistics = statistics_;
   }
    : get_distribution_metric_data_request)

let make_get_distributions_request ?distribution_name:(distribution_name_ : resource_name option)
    ?page_token:(page_token_ : string_ option) () =
  ({ distribution_name = distribution_name_; page_token = page_token_ } : get_distributions_request)

let make_get_domain_request ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_ } : get_domain_request)

let make_get_domains_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_domains_request)

let make_get_export_snapshot_records_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_export_snapshot_records_request)

let make_instance_metadata_options ?state:(state_ : instance_metadata_state option)
    ?http_tokens:(http_tokens_ : http_tokens option)
    ?http_endpoint:(http_endpoint_ : http_endpoint option)
    ?http_put_response_hop_limit:(http_put_response_hop_limit_ : integer option)
    ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6 option) () =
  ({
     state = state_;
     http_tokens = http_tokens_;
     http_endpoint = http_endpoint_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_protocol_ipv6 = http_protocol_ipv6_;
   }
    : instance_metadata_options)

let make_instance_state ?code:(code_ : integer option) ?name:(name_ : string_ option) () =
  ({ code = code_; name = name_ } : instance_state)

let make_instance_port_info ?from_port:(from_port_ : port option) ?to_port:(to_port_ : port option)
    ?protocol:(protocol_ : network_protocol option) ?access_from:(access_from_ : string_ option)
    ?access_type:(access_type_ : port_access_type option)
    ?common_name:(common_name_ : string_ option)
    ?access_direction:(access_direction_ : access_direction option)
    ?cidrs:(cidrs_ : string_list option) ?ipv6_cidrs:(ipv6_cidrs_ : string_list option)
    ?cidr_list_aliases:(cidr_list_aliases_ : string_list option) () =
  ({
     from_port = from_port_;
     to_port = to_port_;
     protocol = protocol_;
     access_from = access_from_;
     access_type = access_type_;
     common_name = common_name_;
     access_direction = access_direction_;
     cidrs = cidrs_;
     ipv6_cidrs = ipv6_cidrs_;
     cidr_list_aliases = cidr_list_aliases_;
   }
    : instance_port_info)

let make_monthly_transfer ?gb_per_month_allocated:(gb_per_month_allocated_ : integer option) () =
  ({ gb_per_month_allocated = gb_per_month_allocated_ } : monthly_transfer)

let make_instance_networking ?monthly_transfer:(monthly_transfer_ : monthly_transfer option)
    ?ports:(ports_ : instance_port_info_list option) () =
  ({ monthly_transfer = monthly_transfer_; ports = ports_ } : instance_networking)

let make_instance_hardware ?cpu_count:(cpu_count_ : integer option)
    ?disks:(disks_ : disk_list option) ?ram_size_in_gb:(ram_size_in_gb_ : float_ option) () =
  ({ cpu_count = cpu_count_; disks = disks_; ram_size_in_gb = ram_size_in_gb_ } : instance_hardware)

let make_instance ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?blueprint_id:(blueprint_id_ : non_empty_string option)
    ?blueprint_name:(blueprint_name_ : non_empty_string option)
    ?bundle_id:(bundle_id_ : non_empty_string option) ?add_ons:(add_ons_ : add_on_list option)
    ?is_static_ip:(is_static_ip_ : boolean_ option)
    ?private_ip_address:(private_ip_address_ : ip_address option)
    ?public_ip_address:(public_ip_address_ : ip_address option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_address_list option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?hardware:(hardware_ : instance_hardware option)
    ?networking:(networking_ : instance_networking option) ?state:(state_ : instance_state option)
    ?username:(username_ : non_empty_string option)
    ?ssh_key_name:(ssh_key_name_ : resource_name option)
    ?metadata_options:(metadata_options_ : instance_metadata_options option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     blueprint_id = blueprint_id_;
     blueprint_name = blueprint_name_;
     bundle_id = bundle_id_;
     add_ons = add_ons_;
     is_static_ip = is_static_ip_;
     private_ip_address = private_ip_address_;
     public_ip_address = public_ip_address_;
     ipv6_addresses = ipv6_addresses_;
     ip_address_type = ip_address_type_;
     hardware = hardware_;
     networking = networking_;
     state = state_;
     username = username_;
     ssh_key_name = ssh_key_name_;
     metadata_options = metadata_options_;
   }
    : instance)

let make_get_instance_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : get_instance_request)

let make_host_key_attributes ?algorithm:(algorithm_ : string_ option)
    ?public_key:(public_key_ : string_ option) ?witnessed_at:(witnessed_at_ : iso_date option)
    ?fingerprint_sh_a1:(fingerprint_sh_a1_ : string_ option)
    ?fingerprint_sh_a256:(fingerprint_sh_a256_ : string_ option)
    ?not_valid_before:(not_valid_before_ : iso_date option)
    ?not_valid_after:(not_valid_after_ : iso_date option) () =
  ({
     algorithm = algorithm_;
     public_key = public_key_;
     witnessed_at = witnessed_at_;
     fingerprint_sh_a1 = fingerprint_sh_a1_;
     fingerprint_sh_a256 = fingerprint_sh_a256_;
     not_valid_before = not_valid_before_;
     not_valid_after = not_valid_after_;
   }
    : host_key_attributes)

let make_password_data ?ciphertext:(ciphertext_ : string_ option)
    ?key_pair_name:(key_pair_name_ : resource_name option) () =
  ({ ciphertext = ciphertext_; key_pair_name = key_pair_name_ } : password_data)

let make_instance_access_details ?cert_key:(cert_key_ : string_ option)
    ?expires_at:(expires_at_ : iso_date option) ?ip_address:(ip_address_ : ip_address option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_address_list option)
    ?password:(password_ : string_ option) ?password_data:(password_data_ : password_data option)
    ?private_key:(private_key_ : string_ option)
    ?protocol:(protocol_ : instance_access_protocol option)
    ?instance_name:(instance_name_ : resource_name option) ?username:(username_ : string_ option)
    ?host_keys:(host_keys_ : host_keys_list option) () =
  ({
     cert_key = cert_key_;
     expires_at = expires_at_;
     ip_address = ip_address_;
     ipv6_addresses = ipv6_addresses_;
     password = password_;
     password_data = password_data_;
     private_key = private_key_;
     protocol = protocol_;
     instance_name = instance_name_;
     username = username_;
     host_keys = host_keys_;
   }
    : instance_access_details)

let make_get_instance_access_details_request ?protocol:(protocol_ : instance_access_protocol option)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_; protocol = protocol_ } : get_instance_access_details_request)

let make_get_instance_metric_data_request ~instance_name:(instance_name_ : resource_name)
    ~metric_name:(metric_name_ : instance_metric_name) ~period:(period_ : metric_period)
    ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp)
    ~unit_:(unit__ : metric_unit) ~statistics:(statistics_ : metric_statistic_list) () =
  ({
     instance_name = instance_name_;
     metric_name = metric_name_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
     unit_ = unit__;
     statistics = statistics_;
   }
    : get_instance_metric_data_request)

let make_instance_port_state ?from_port:(from_port_ : port option) ?to_port:(to_port_ : port option)
    ?protocol:(protocol_ : network_protocol option) ?state:(state_ : port_state option)
    ?cidrs:(cidrs_ : string_list option) ?ipv6_cidrs:(ipv6_cidrs_ : string_list option)
    ?cidr_list_aliases:(cidr_list_aliases_ : string_list option) () =
  ({
     from_port = from_port_;
     to_port = to_port_;
     protocol = protocol_;
     state = state_;
     cidrs = cidrs_;
     ipv6_cidrs = ipv6_cidrs_;
     cidr_list_aliases = cidr_list_aliases_;
   }
    : instance_port_state)

let make_get_instance_port_states_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : get_instance_port_states_request)

let make_instance_snapshot ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?support_code:(support_code_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?state:(state_ : instance_snapshot_state option) ?progress:(progress_ : string_ option)
    ?from_attached_disks:(from_attached_disks_ : disk_list option)
    ?from_instance_name:(from_instance_name_ : resource_name option)
    ?from_instance_arn:(from_instance_arn_ : non_empty_string option)
    ?from_blueprint_id:(from_blueprint_id_ : string_ option)
    ?from_bundle_id:(from_bundle_id_ : string_ option)
    ?is_from_auto_snapshot:(is_from_auto_snapshot_ : boolean_ option)
    ?size_in_gb:(size_in_gb_ : integer option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     state = state_;
     progress = progress_;
     from_attached_disks = from_attached_disks_;
     from_instance_name = from_instance_name_;
     from_instance_arn = from_instance_arn_;
     from_blueprint_id = from_blueprint_id_;
     from_bundle_id = from_bundle_id_;
     is_from_auto_snapshot = is_from_auto_snapshot_;
     size_in_gb = size_in_gb_;
   }
    : instance_snapshot)

let make_get_instance_snapshot_request
    ~instance_snapshot_name:(instance_snapshot_name_ : resource_name) () =
  ({ instance_snapshot_name = instance_snapshot_name_ } : get_instance_snapshot_request)

let make_get_instance_snapshots_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_instance_snapshots_request)

let make_get_instance_state_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : get_instance_state_request)

let make_get_instances_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_instances_request)

let make_get_key_pair_request ~key_pair_name:(key_pair_name_ : resource_name) () =
  ({ key_pair_name = key_pair_name_ } : get_key_pair_request)

let make_get_key_pairs_request ?page_token:(page_token_ : string_ option)
    ?include_default_key_pair:(include_default_key_pair_ : boolean_ option) () =
  ({ page_token = page_token_; include_default_key_pair = include_default_key_pair_ }
    : get_key_pairs_request)

let make_load_balancer_tls_certificate_summary ?name:(name_ : resource_name option)
    ?is_attached:(is_attached_ : boolean_ option) () =
  ({ name = name_; is_attached = is_attached_ } : load_balancer_tls_certificate_summary)

let make_instance_health_summary ?instance_name:(instance_name_ : resource_name option)
    ?instance_health:(instance_health_ : instance_health_state option)
    ?instance_health_reason:(instance_health_reason_ : instance_health_reason option) () =
  ({
     instance_name = instance_name_;
     instance_health = instance_health_;
     instance_health_reason = instance_health_reason_;
   }
    : instance_health_summary)

let make_load_balancer ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?dns_name:(dns_name_ : non_empty_string option) ?state:(state_ : load_balancer_state option)
    ?protocol:(protocol_ : load_balancer_protocol option)
    ?public_ports:(public_ports_ : port_list option)
    ?health_check_path:(health_check_path_ : non_empty_string option)
    ?instance_port:(instance_port_ : integer option)
    ?instance_health_summary:(instance_health_summary_ : instance_health_summary_list option)
    ?tls_certificate_summaries:
      (tls_certificate_summaries_ : load_balancer_tls_certificate_summary_list option)
    ?configuration_options:(configuration_options_ : load_balancer_configuration_options option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?https_redirection_enabled:(https_redirection_enabled_ : boolean_ option)
    ?tls_policy_name:(tls_policy_name_ : resource_name option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     dns_name = dns_name_;
     state = state_;
     protocol = protocol_;
     public_ports = public_ports_;
     health_check_path = health_check_path_;
     instance_port = instance_port_;
     instance_health_summary = instance_health_summary_;
     tls_certificate_summaries = tls_certificate_summaries_;
     configuration_options = configuration_options_;
     ip_address_type = ip_address_type_;
     https_redirection_enabled = https_redirection_enabled_;
     tls_policy_name = tls_policy_name_;
   }
    : load_balancer)

let make_get_load_balancer_request ~load_balancer_name:(load_balancer_name_ : resource_name) () =
  ({ load_balancer_name = load_balancer_name_ } : get_load_balancer_request)

let make_get_load_balancer_metric_data_request
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~metric_name:(metric_name_ : load_balancer_metric_name) ~period:(period_ : metric_period)
    ~start_time:(start_time_ : timestamp) ~end_time:(end_time_ : timestamp)
    ~unit_:(unit__ : metric_unit) ~statistics:(statistics_ : metric_statistic_list) () =
  ({
     load_balancer_name = load_balancer_name_;
     metric_name = metric_name_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
     unit_ = unit__;
     statistics = statistics_;
   }
    : get_load_balancer_metric_data_request)

let make_load_balancer_tls_certificate_domain_validation_option
    ?domain_name:(domain_name_ : domain_name option)
    ?validation_status:(validation_status_ : load_balancer_tls_certificate_domain_status option) ()
    =
  ({ domain_name = domain_name_; validation_status = validation_status_ }
    : load_balancer_tls_certificate_domain_validation_option)

let make_load_balancer_tls_certificate_renewal_summary
    ?renewal_status:(renewal_status_ : load_balancer_tls_certificate_renewal_status option)
    ?domain_validation_options:
      (domain_validation_options_ :
         load_balancer_tls_certificate_domain_validation_option_list option) () =
  ({ renewal_status = renewal_status_; domain_validation_options = domain_validation_options_ }
    : load_balancer_tls_certificate_renewal_summary)

let make_load_balancer_tls_certificate_dns_record_creation_state
    ?code:(code_ : load_balancer_tls_certificate_dns_record_creation_state_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : load_balancer_tls_certificate_dns_record_creation_state)

let make_load_balancer_tls_certificate_domain_validation_record
    ?name:(name_ : non_empty_string option) ?type_:(type__ : non_empty_string option)
    ?value:(value_ : non_empty_string option)
    ?validation_status:(validation_status_ : load_balancer_tls_certificate_domain_status option)
    ?domain_name:(domain_name_ : domain_name option)
    ?dns_record_creation_state:
      (dns_record_creation_state_ : load_balancer_tls_certificate_dns_record_creation_state option)
    () =
  ({
     name = name_;
     type_ = type__;
     value = value_;
     validation_status = validation_status_;
     domain_name = domain_name_;
     dns_record_creation_state = dns_record_creation_state_;
   }
    : load_balancer_tls_certificate_domain_validation_record)

let make_load_balancer_tls_certificate ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?support_code:(support_code_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?load_balancer_name:(load_balancer_name_ : resource_name option)
    ?is_attached:(is_attached_ : boolean_ option)
    ?status:(status_ : load_balancer_tls_certificate_status option)
    ?domain_name:(domain_name_ : domain_name option)
    ?domain_validation_records:
      (domain_validation_records_ :
         load_balancer_tls_certificate_domain_validation_record_list option)
    ?failure_reason:(failure_reason_ : load_balancer_tls_certificate_failure_reason option)
    ?issued_at:(issued_at_ : iso_date option) ?issuer:(issuer_ : non_empty_string option)
    ?key_algorithm:(key_algorithm_ : non_empty_string option)
    ?not_after:(not_after_ : iso_date option) ?not_before:(not_before_ : iso_date option)
    ?renewal_summary:(renewal_summary_ : load_balancer_tls_certificate_renewal_summary option)
    ?revocation_reason:(revocation_reason_ : load_balancer_tls_certificate_revocation_reason option)
    ?revoked_at:(revoked_at_ : iso_date option) ?serial:(serial_ : non_empty_string option)
    ?signature_algorithm:(signature_algorithm_ : non_empty_string option)
    ?subject:(subject_ : non_empty_string option)
    ?subject_alternative_names:(subject_alternative_names_ : string_list option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     load_balancer_name = load_balancer_name_;
     is_attached = is_attached_;
     status = status_;
     domain_name = domain_name_;
     domain_validation_records = domain_validation_records_;
     failure_reason = failure_reason_;
     issued_at = issued_at_;
     issuer = issuer_;
     key_algorithm = key_algorithm_;
     not_after = not_after_;
     not_before = not_before_;
     renewal_summary = renewal_summary_;
     revocation_reason = revocation_reason_;
     revoked_at = revoked_at_;
     serial = serial_;
     signature_algorithm = signature_algorithm_;
     subject = subject_;
     subject_alternative_names = subject_alternative_names_;
   }
    : load_balancer_tls_certificate)

let make_get_load_balancer_tls_certificates_request
    ~load_balancer_name:(load_balancer_name_ : resource_name) () =
  ({ load_balancer_name = load_balancer_name_ } : get_load_balancer_tls_certificates_request)

let make_load_balancer_tls_policy ?name:(name_ : resource_name option)
    ?is_default:(is_default_ : boolean_ option) ?description:(description_ : string_ option)
    ?protocols:(protocols_ : string_list option) ?ciphers:(ciphers_ : string_list option) () =
  ({
     name = name_;
     is_default = is_default_;
     description = description_;
     protocols = protocols_;
     ciphers = ciphers_;
   }
    : load_balancer_tls_policy)

let make_get_load_balancer_tls_policies_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_load_balancer_tls_policies_request)

let make_get_load_balancers_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_load_balancers_request)

let make_get_operation_request ~operation_id:(operation_id_ : non_empty_string) () =
  ({ operation_id = operation_id_ } : get_operation_request)

let make_get_operations_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_operations_request)

let make_get_operations_for_resource_request ?page_token:(page_token_ : string_ option)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ resource_name = resource_name_; page_token = page_token_ }
    : get_operations_for_resource_request)

let make_region ?continent_code:(continent_code_ : string_ option)
    ?description:(description_ : string_ option) ?display_name:(display_name_ : string_ option)
    ?name:(name_ : region_name option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?relational_database_availability_zones:
      (relational_database_availability_zones_ : availability_zone_list option) () =
  ({
     continent_code = continent_code_;
     description = description_;
     display_name = display_name_;
     name = name_;
     availability_zones = availability_zones_;
     relational_database_availability_zones = relational_database_availability_zones_;
   }
    : region)

let make_get_regions_request
    ?include_availability_zones:(include_availability_zones_ : boolean_ option)
    ?include_relational_database_availability_zones:
      (include_relational_database_availability_zones_ : boolean_ option) () =
  ({
     include_availability_zones = include_availability_zones_;
     include_relational_database_availability_zones =
       include_relational_database_availability_zones_;
   }
    : get_regions_request)

let make_pending_maintenance_action ?action:(action_ : non_empty_string option)
    ?description:(description_ : non_empty_string option)
    ?current_apply_date:(current_apply_date_ : iso_date option) () =
  ({ action = action_; description = description_; current_apply_date = current_apply_date_ }
    : pending_maintenance_action)

let make_relational_database_endpoint ?port:(port_ : integer option)
    ?address:(address_ : non_empty_string option) () =
  ({ port = port_; address = address_ } : relational_database_endpoint)

let make_pending_modified_relational_database_values
    ?master_user_password:(master_user_password_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?backup_retention_enabled:(backup_retention_enabled_ : boolean_ option) () =
  ({
     master_user_password = master_user_password_;
     engine_version = engine_version_;
     backup_retention_enabled = backup_retention_enabled_;
   }
    : pending_modified_relational_database_values)

let make_relational_database_hardware ?cpu_count:(cpu_count_ : integer option)
    ?disk_size_in_gb:(disk_size_in_gb_ : integer option)
    ?ram_size_in_gb:(ram_size_in_gb_ : float_ option) () =
  ({ cpu_count = cpu_count_; disk_size_in_gb = disk_size_in_gb_; ram_size_in_gb = ram_size_in_gb_ }
    : relational_database_hardware)

let make_relational_database ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?support_code:(support_code_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?relational_database_blueprint_id:(relational_database_blueprint_id_ : non_empty_string option)
    ?relational_database_bundle_id:(relational_database_bundle_id_ : non_empty_string option)
    ?master_database_name:(master_database_name_ : string_ option)
    ?hardware:(hardware_ : relational_database_hardware option)
    ?state:(state_ : non_empty_string option)
    ?secondary_availability_zone:(secondary_availability_zone_ : string_ option)
    ?backup_retention_enabled:(backup_retention_enabled_ : boolean_ option)
    ?pending_modified_values:
      (pending_modified_values_ : pending_modified_relational_database_values option)
    ?engine:(engine_ : non_empty_string option)
    ?engine_version:(engine_version_ : non_empty_string option)
    ?latest_restorable_time:(latest_restorable_time_ : iso_date option)
    ?master_username:(master_username_ : non_empty_string option)
    ?parameter_apply_status:(parameter_apply_status_ : non_empty_string option)
    ?preferred_backup_window:(preferred_backup_window_ : non_empty_string option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : non_empty_string option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?master_endpoint:(master_endpoint_ : relational_database_endpoint option)
    ?pending_maintenance_actions:
      (pending_maintenance_actions_ : pending_maintenance_action_list option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     relational_database_blueprint_id = relational_database_blueprint_id_;
     relational_database_bundle_id = relational_database_bundle_id_;
     master_database_name = master_database_name_;
     hardware = hardware_;
     state = state_;
     secondary_availability_zone = secondary_availability_zone_;
     backup_retention_enabled = backup_retention_enabled_;
     pending_modified_values = pending_modified_values_;
     engine = engine_;
     engine_version = engine_version_;
     latest_restorable_time = latest_restorable_time_;
     master_username = master_username_;
     parameter_apply_status = parameter_apply_status_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     publicly_accessible = publicly_accessible_;
     master_endpoint = master_endpoint_;
     pending_maintenance_actions = pending_maintenance_actions_;
     ca_certificate_identifier = ca_certificate_identifier_;
   }
    : relational_database)

let make_get_relational_database_request
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_ } : get_relational_database_request)

let make_relational_database_blueprint ?blueprint_id:(blueprint_id_ : string_ option)
    ?engine:(engine_ : relational_database_engine option)
    ?engine_version:(engine_version_ : string_ option)
    ?engine_description:(engine_description_ : string_ option)
    ?engine_version_description:(engine_version_description_ : string_ option)
    ?is_engine_default:(is_engine_default_ : boolean_ option) () =
  ({
     blueprint_id = blueprint_id_;
     engine = engine_;
     engine_version = engine_version_;
     engine_description = engine_description_;
     engine_version_description = engine_version_description_;
     is_engine_default = is_engine_default_;
   }
    : relational_database_blueprint)

let make_get_relational_database_blueprints_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_relational_database_blueprints_request)

let make_relational_database_bundle ?bundle_id:(bundle_id_ : string_ option)
    ?name:(name_ : string_ option) ?price:(price_ : float_ option)
    ?ram_size_in_gb:(ram_size_in_gb_ : float_ option)
    ?disk_size_in_gb:(disk_size_in_gb_ : integer option)
    ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : integer option)
    ?cpu_count:(cpu_count_ : integer option) ?is_encrypted:(is_encrypted_ : boolean_ option)
    ?is_active:(is_active_ : boolean_ option) () =
  ({
     bundle_id = bundle_id_;
     name = name_;
     price = price_;
     ram_size_in_gb = ram_size_in_gb_;
     disk_size_in_gb = disk_size_in_gb_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     cpu_count = cpu_count_;
     is_encrypted = is_encrypted_;
     is_active = is_active_;
   }
    : relational_database_bundle)

let make_get_relational_database_bundles_request ?page_token:(page_token_ : string_ option)
    ?include_inactive:(include_inactive_ : boolean_ option) () =
  ({ page_token = page_token_; include_inactive = include_inactive_ }
    : get_relational_database_bundles_request)

let make_relational_database_event ?resource:(resource_ : resource_name option)
    ?created_at:(created_at_ : iso_date option) ?message:(message_ : string_ option)
    ?event_categories:(event_categories_ : string_list option) () =
  ({
     resource = resource_;
     created_at = created_at_;
     message = message_;
     event_categories = event_categories_;
   }
    : relational_database_event)

let make_get_relational_database_events_request
    ?duration_in_minutes:(duration_in_minutes_ : integer option)
    ?page_token:(page_token_ : string_ option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     duration_in_minutes = duration_in_minutes_;
     page_token = page_token_;
   }
    : get_relational_database_events_request)

let make_log_event ?created_at:(created_at_ : iso_date option) ?message:(message_ : string_ option)
    () =
  ({ created_at = created_at_; message = message_ } : log_event)

let make_get_relational_database_log_events_request ?start_time:(start_time_ : iso_date option)
    ?end_time:(end_time_ : iso_date option) ?start_from_head:(start_from_head_ : boolean_ option)
    ?page_token:(page_token_ : string_ option)
    ~relational_database_name:(relational_database_name_ : resource_name)
    ~log_stream_name:(log_stream_name_ : string_) () =
  ({
     relational_database_name = relational_database_name_;
     log_stream_name = log_stream_name_;
     start_time = start_time_;
     end_time = end_time_;
     start_from_head = start_from_head_;
     page_token = page_token_;
   }
    : get_relational_database_log_events_request)

let make_get_relational_database_log_streams_request
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_ }
    : get_relational_database_log_streams_request)

let make_get_relational_database_master_user_password_request
    ?password_version:(password_version_ : relational_database_password_version option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_; password_version = password_version_ }
    : get_relational_database_master_user_password_request)

let make_get_relational_database_metric_data_request
    ~relational_database_name:(relational_database_name_ : resource_name)
    ~metric_name:(metric_name_ : relational_database_metric_name) ~period:(period_ : metric_period)
    ~start_time:(start_time_ : iso_date) ~end_time:(end_time_ : iso_date)
    ~unit_:(unit__ : metric_unit) ~statistics:(statistics_ : metric_statistic_list) () =
  ({
     relational_database_name = relational_database_name_;
     metric_name = metric_name_;
     period = period_;
     start_time = start_time_;
     end_time = end_time_;
     unit_ = unit__;
     statistics = statistics_;
   }
    : get_relational_database_metric_data_request)

let make_relational_database_parameter ?allowed_values:(allowed_values_ : string_ option)
    ?apply_method:(apply_method_ : string_ option) ?apply_type:(apply_type_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?description:(description_ : string_ option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option) () =
  ({
     allowed_values = allowed_values_;
     apply_method = apply_method_;
     apply_type = apply_type_;
     data_type = data_type_;
     description = description_;
     is_modifiable = is_modifiable_;
     parameter_name = parameter_name_;
     parameter_value = parameter_value_;
   }
    : relational_database_parameter)

let make_get_relational_database_parameters_request ?page_token:(page_token_ : string_ option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_; page_token = page_token_ }
    : get_relational_database_parameters_request)

let make_relational_database_snapshot ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?support_code:(support_code_ : string_ option)
    ?created_at:(created_at_ : iso_date option) ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) ?tags:(tags_ : tag_list option)
    ?engine:(engine_ : non_empty_string option)
    ?engine_version:(engine_version_ : non_empty_string option)
    ?size_in_gb:(size_in_gb_ : integer option) ?state:(state_ : non_empty_string option)
    ?from_relational_database_name:(from_relational_database_name_ : non_empty_string option)
    ?from_relational_database_arn:(from_relational_database_arn_ : non_empty_string option)
    ?from_relational_database_bundle_id:(from_relational_database_bundle_id_ : string_ option)
    ?from_relational_database_blueprint_id:(from_relational_database_blueprint_id_ : string_ option)
    () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     tags = tags_;
     engine = engine_;
     engine_version = engine_version_;
     size_in_gb = size_in_gb_;
     state = state_;
     from_relational_database_name = from_relational_database_name_;
     from_relational_database_arn = from_relational_database_arn_;
     from_relational_database_bundle_id = from_relational_database_bundle_id_;
     from_relational_database_blueprint_id = from_relational_database_blueprint_id_;
   }
    : relational_database_snapshot)

let make_get_relational_database_snapshot_request
    ~relational_database_snapshot_name:(relational_database_snapshot_name_ : resource_name) () =
  ({ relational_database_snapshot_name = relational_database_snapshot_name_ }
    : get_relational_database_snapshot_request)

let make_get_relational_database_snapshots_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_relational_database_snapshots_request)

let make_get_relational_databases_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_relational_databases_request)

let make_setup_execution_details ?command:(command_ : string_ option)
    ?date_time:(date_time_ : iso_date option) ?name:(name_ : non_empty_string option)
    ?status:(status_ : setup_status option) ?standard_error:(standard_error_ : string_ option)
    ?standard_output:(standard_output_ : string_ option) ?version:(version_ : string_ option) () =
  ({
     command = command_;
     date_time = date_time_;
     name = name_;
     status = status_;
     standard_error = standard_error_;
     standard_output = standard_output_;
     version = version_;
   }
    : setup_execution_details)

let make_setup_history_resource ?name:(name_ : resource_name option)
    ?arn:(arn_ : non_empty_string option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
   }
    : setup_history_resource)

let make_setup_request ?instance_name:(instance_name_ : resource_name option)
    ?domain_names:(domain_names_ : setup_domain_name_list option)
    ?certificate_provider:(certificate_provider_ : certificate_provider option) () =
  ({
     instance_name = instance_name_;
     domain_names = domain_names_;
     certificate_provider = certificate_provider_;
   }
    : setup_request)

let make_setup_history ?operation_id:(operation_id_ : non_empty_string option)
    ?request:(request_ : setup_request option) ?resource:(resource_ : setup_history_resource option)
    ?execution_details:(execution_details_ : setup_execution_details_list option)
    ?status:(status_ : setup_status option) () =
  ({
     operation_id = operation_id_;
     request = request_;
     resource = resource_;
     execution_details = execution_details_;
     status = status_;
   }
    : setup_history)

let make_get_setup_history_request ?page_token:(page_token_ : setup_history_page_token option)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ resource_name = resource_name_; page_token = page_token_ } : get_setup_history_request)

let make_static_ip ?name:(name_ : resource_name option) ?arn:(arn_ : non_empty_string option)
    ?support_code:(support_code_ : string_ option) ?created_at:(created_at_ : iso_date option)
    ?location:(location_ : resource_location option)
    ?resource_type:(resource_type_ : resource_type option)
    ?ip_address:(ip_address_ : ip_address option) ?attached_to:(attached_to_ : resource_name option)
    ?is_attached:(is_attached_ : boolean_ option) () =
  ({
     name = name_;
     arn = arn_;
     support_code = support_code_;
     created_at = created_at_;
     location = location_;
     resource_type = resource_type_;
     ip_address = ip_address_;
     attached_to = attached_to_;
     is_attached = is_attached_;
   }
    : static_ip)

let make_get_static_ip_request ~static_ip_name:(static_ip_name_ : resource_name) () =
  ({ static_ip_name = static_ip_name_ } : get_static_ip_request)

let make_get_static_ips_request ?page_token:(page_token_ : string_ option) () =
  ({ page_token = page_token_ } : get_static_ips_request)

let make_import_key_pair_request ~key_pair_name:(key_pair_name_ : resource_name)
    ~public_key_base64:(public_key_base64_ : base64) () =
  ({ key_pair_name = key_pair_name_; public_key_base64 = public_key_base64_ }
    : import_key_pair_request)

let make_is_vpc_peered_request () = (() : unit)

let make_update_relational_database_parameters_request
    ~relational_database_name:(relational_database_name_ : resource_name)
    ~parameters:(parameters_ : relational_database_parameter_list) () =
  ({ relational_database_name = relational_database_name_; parameters = parameters_ }
    : update_relational_database_parameters_request)

let make_update_relational_database_request
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?rotate_master_user_password:(rotate_master_user_password_ : boolean_ option)
    ?preferred_backup_window:(preferred_backup_window_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?enable_backup_retention:(enable_backup_retention_ : boolean_ option)
    ?disable_backup_retention:(disable_backup_retention_ : boolean_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?apply_immediately:(apply_immediately_ : boolean_ option)
    ?ca_certificate_identifier:(ca_certificate_identifier_ : string_ option)
    ?relational_database_blueprint_id:(relational_database_blueprint_id_ : string_ option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     master_user_password = master_user_password_;
     rotate_master_user_password = rotate_master_user_password_;
     preferred_backup_window = preferred_backup_window_;
     preferred_maintenance_window = preferred_maintenance_window_;
     enable_backup_retention = enable_backup_retention_;
     disable_backup_retention = disable_backup_retention_;
     publicly_accessible = publicly_accessible_;
     apply_immediately = apply_immediately_;
     ca_certificate_identifier = ca_certificate_identifier_;
     relational_database_blueprint_id = relational_database_blueprint_id_;
   }
    : update_relational_database_request)

let make_update_load_balancer_attribute_request
    ~load_balancer_name:(load_balancer_name_ : resource_name)
    ~attribute_name:(attribute_name_ : load_balancer_attribute_name)
    ~attribute_value:(attribute_value_ : string_max256) () =
  ({
     load_balancer_name = load_balancer_name_;
     attribute_name = attribute_name_;
     attribute_value = attribute_value_;
   }
    : update_load_balancer_attribute_request)

let make_update_instance_metadata_options_request ?http_tokens:(http_tokens_ : http_tokens option)
    ?http_endpoint:(http_endpoint_ : http_endpoint option)
    ?http_put_response_hop_limit:(http_put_response_hop_limit_ : integer option)
    ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6 option)
    ~instance_name:(instance_name_ : resource_name) () =
  ({
     instance_name = instance_name_;
     http_tokens = http_tokens_;
     http_endpoint = http_endpoint_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_protocol_ipv6 = http_protocol_ipv6_;
   }
    : update_instance_metadata_options_request)

let make_update_domain_entry_request ~domain_name:(domain_name_ : domain_name)
    ~domain_entry:(domain_entry_ : domain_entry) () =
  ({ domain_name = domain_name_; domain_entry = domain_entry_ } : update_domain_entry_request)

let make_update_distribution_bundle_request
    ?distribution_name:(distribution_name_ : resource_name option)
    ?bundle_id:(bundle_id_ : string_ option) () =
  ({ distribution_name = distribution_name_; bundle_id = bundle_id_ }
    : update_distribution_bundle_request)

let make_update_distribution_request ?origin:(origin_ : input_origin option)
    ?default_cache_behavior:(default_cache_behavior_ : cache_behavior option)
    ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
    ?cache_behaviors:(cache_behaviors_ : cache_behavior_list option)
    ?is_enabled:(is_enabled_ : boolean_ option)
    ?viewer_minimum_tls_protocol_version:
      (viewer_minimum_tls_protocol_version_ : viewer_minimum_tls_protocol_version_enum option)
    ?certificate_name:(certificate_name_ : resource_name option)
    ?use_default_certificate:(use_default_certificate_ : boolean_ option)
    ~distribution_name:(distribution_name_ : resource_name) () =
  ({
     distribution_name = distribution_name_;
     origin = origin_;
     default_cache_behavior = default_cache_behavior_;
     cache_behavior_settings = cache_behavior_settings_;
     cache_behaviors = cache_behaviors_;
     is_enabled = is_enabled_;
     viewer_minimum_tls_protocol_version = viewer_minimum_tls_protocol_version_;
     certificate_name = certificate_name_;
     use_default_certificate = use_default_certificate_;
   }
    : update_distribution_request)

let make_update_container_service_request ?power:(power_ : container_service_power_name option)
    ?scale:(scale_ : container_service_scale option) ?is_disabled:(is_disabled_ : boolean_ option)
    ?public_domain_names:(public_domain_names_ : container_service_public_domains option)
    ?private_registry_access:(private_registry_access_ : private_registry_access_request option)
    ~service_name:(service_name_ : container_service_name) () =
  ({
     service_name = service_name_;
     power = power_;
     scale = scale_;
     is_disabled = is_disabled_;
     public_domain_names = public_domain_names_;
     private_registry_access = private_registry_access_;
   }
    : update_container_service_request)

let make_update_bucket_bundle_request ~bucket_name:(bucket_name_ : bucket_name)
    ~bundle_id:(bundle_id_ : non_empty_string) () =
  ({ bucket_name = bucket_name_; bundle_id = bundle_id_ } : update_bucket_bundle_request)

let make_update_bucket_request ?access_rules:(access_rules_ : access_rules option)
    ?versioning:(versioning_ : non_empty_string option)
    ?readonly_access_accounts:(readonly_access_accounts_ : partner_id_list option)
    ?access_log_config:(access_log_config_ : bucket_access_log_config option)
    ?cors:(cors_ : bucket_cors_config option) ~bucket_name:(bucket_name_ : bucket_name) () =
  ({
     bucket_name = bucket_name_;
     access_rules = access_rules_;
     versioning = versioning_;
     readonly_access_accounts = readonly_access_accounts_;
     access_log_config = access_log_config_;
     cors = cors_;
   }
    : update_bucket_request)

let make_untag_resource_request ?resource_arn:(resource_arn_ : resource_arn option)
    ~resource_name:(resource_name_ : resource_name) ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_name = resource_name_; resource_arn = resource_arn_; tag_keys = tag_keys_ }
    : untag_resource_request)

let make_unpeer_vpc_request () = (() : unit)

let make_test_alarm_request ~alarm_name:(alarm_name_ : resource_name) ~state:(state_ : alarm_state)
    () =
  ({ alarm_name = alarm_name_; state = state_ } : test_alarm_request)

let make_tag_resource_request ?resource_arn:(resource_arn_ : resource_arn option)
    ~resource_name:(resource_name_ : resource_name) ~tags:(tags_ : tag_list) () =
  ({ resource_name = resource_name_; resource_arn = resource_arn_; tags = tags_ }
    : tag_resource_request)

let make_stop_relational_database_request
    ?relational_database_snapshot_name:(relational_database_snapshot_name_ : resource_name option)
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({
     relational_database_name = relational_database_name_;
     relational_database_snapshot_name = relational_database_snapshot_name_;
   }
    : stop_relational_database_request)

let make_stop_instance_request ?force:(force_ : boolean_ option)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_; force = force_ } : stop_instance_request)

let make_stop_gui_session_request ~resource_name:(resource_name_ : resource_name) () =
  ({ resource_name = resource_name_ } : stop_gui_session_request)

let make_start_relational_database_request
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_ } : start_relational_database_request)

let make_start_instance_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : start_instance_request)

let make_start_gui_session_request ~resource_name:(resource_name_ : resource_name) () =
  ({ resource_name = resource_name_ } : start_gui_session_request)

let make_setup_instance_https_request ~instance_name:(instance_name_ : resource_name)
    ~email_address:(email_address_ : email_address)
    ~domain_names:(domain_names_ : setup_domain_name_list)
    ~certificate_provider:(certificate_provider_ : certificate_provider) () =
  ({
     instance_name = instance_name_;
     email_address = email_address_;
     domain_names = domain_names_;
     certificate_provider = certificate_provider_;
   }
    : setup_instance_https_request)

let make_set_resource_access_for_bucket_request ~resource_name:(resource_name_ : resource_name)
    ~bucket_name:(bucket_name_ : bucket_name) ~access:(access_ : resource_bucket_access) () =
  ({ resource_name = resource_name_; bucket_name = bucket_name_; access = access_ }
    : set_resource_access_for_bucket_request)

let make_set_ip_address_type_request ?accept_bundle_update:(accept_bundle_update_ : boolean_ option)
    ~resource_type:(resource_type_ : resource_type) ~resource_name:(resource_name_ : resource_name)
    ~ip_address_type:(ip_address_type_ : ip_address_type) () =
  ({
     resource_type = resource_type_;
     resource_name = resource_name_;
     ip_address_type = ip_address_type_;
     accept_bundle_update = accept_bundle_update_;
   }
    : set_ip_address_type_request)

let make_send_contact_method_verification_request
    ~protocol:(protocol_ : contact_method_verification_protocol) () =
  ({ protocol = protocol_ } : send_contact_method_verification_request)

let make_reset_distribution_cache_request
    ?distribution_name:(distribution_name_ : resource_name option) () =
  ({ distribution_name = distribution_name_ } : reset_distribution_cache_request)

let make_release_static_ip_request ~static_ip_name:(static_ip_name_ : resource_name) () =
  ({ static_ip_name = static_ip_name_ } : release_static_ip_request)

let make_register_container_image_request ~service_name:(service_name_ : container_service_name)
    ~label:(label_ : container_label) ~digest:(digest_ : string_) () =
  ({ service_name = service_name_; label = label_; digest = digest_ }
    : register_container_image_request)

let make_reboot_relational_database_request
    ~relational_database_name:(relational_database_name_ : resource_name) () =
  ({ relational_database_name = relational_database_name_ } : reboot_relational_database_request)

let make_reboot_instance_request ~instance_name:(instance_name_ : resource_name) () =
  ({ instance_name = instance_name_ } : reboot_instance_request)

let make_put_instance_public_ports_request ~port_infos:(port_infos_ : port_info_list)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ port_infos = port_infos_; instance_name = instance_name_ } : put_instance_public_ports_request)

let make_put_alarm_request ?datapoints_to_alarm:(datapoints_to_alarm_ : integer option)
    ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
    ?contact_protocols:(contact_protocols_ : contact_protocols_list option)
    ?notification_triggers:(notification_triggers_ : notification_trigger_list option)
    ?notification_enabled:(notification_enabled_ : boolean_ option) ?tags:(tags_ : tag_list option)
    ~alarm_name:(alarm_name_ : resource_name) ~metric_name:(metric_name_ : metric_name)
    ~monitored_resource_name:(monitored_resource_name_ : resource_name)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~threshold:(threshold_ : double) ~evaluation_periods:(evaluation_periods_ : integer) () =
  ({
     alarm_name = alarm_name_;
     metric_name = metric_name_;
     monitored_resource_name = monitored_resource_name_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     evaluation_periods = evaluation_periods_;
     datapoints_to_alarm = datapoints_to_alarm_;
     treat_missing_data = treat_missing_data_;
     contact_protocols = contact_protocols_;
     notification_triggers = notification_triggers_;
     notification_enabled = notification_enabled_;
     tags = tags_;
   }
    : put_alarm_request)

let make_peer_vpc_request () = (() : unit)

let make_open_instance_public_ports_request ~port_info:(port_info_ : port_info)
    ~instance_name:(instance_name_ : resource_name) () =
  ({ port_info = port_info_; instance_name = instance_name_ } : open_instance_public_ports_request)
