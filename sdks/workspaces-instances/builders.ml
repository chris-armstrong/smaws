open Types

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; reason = reason_; message = message_ } : validation_exception_field)

let make_associate_volume_response () = (() : unit)

let make_associate_volume_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id)
    ~volume_id:(volume_id_ : volume_id) ~device:(device_ : device_name) () =
  ({ workspace_instance_id = workspace_instance_id_; volume_id = volume_id_; device = device_ }
    : associate_volume_request)

let make_billing_configuration ~billing_mode:(billing_mode_ : billing_mode) () =
  ({ billing_mode = billing_mode_ } : billing_configuration)

let make_ebs_block_device ?volume_type:(volume_type_ : volume_type_enum option)
    ?encrypted:(encrypted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?iops:(iops_ : non_negative_integer option)
    ?throughput:(throughput_ : non_negative_integer option)
    ?volume_size:(volume_size_ : non_negative_integer option) () =
  ({
     volume_type = volume_type_;
     encrypted = encrypted_;
     kms_key_id = kms_key_id_;
     iops = iops_;
     throughput = throughput_;
     volume_size = volume_size_;
   }
    : ebs_block_device)

let make_block_device_mapping_request ?device_name:(device_name_ : device_name option)
    ?ebs:(ebs_ : ebs_block_device option) ?no_device:(no_device_ : device_name option)
    ?virtual_name:(virtual_name_ : virtual_name option) () =
  ({ device_name = device_name_; ebs = ebs_; no_device = no_device_; virtual_name = virtual_name_ }
    : block_device_mapping_request)

let make_capacity_reservation_target
    ?capacity_reservation_id:(capacity_reservation_id_ : string128 option)
    ?capacity_reservation_resource_group_arn:
      (capacity_reservation_resource_group_arn_ : ar_n option) () =
  ({
     capacity_reservation_id = capacity_reservation_id_;
     capacity_reservation_resource_group_arn = capacity_reservation_resource_group_arn_;
   }
    : capacity_reservation_target)

let make_capacity_reservation_specification
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference_enum option)
    ?capacity_reservation_target:(capacity_reservation_target_ : capacity_reservation_target option)
    () =
  ({
     capacity_reservation_preference = capacity_reservation_preference_;
     capacity_reservation_target = capacity_reservation_target_;
   }
    : capacity_reservation_specification)

let make_connection_tracking_specification_request
    ?tcp_established_timeout:(tcp_established_timeout_ : non_negative_integer option)
    ?udp_stream_timeout:(udp_stream_timeout_ : non_negative_integer option)
    ?udp_timeout:(udp_timeout_ : non_negative_integer option) () =
  ({
     tcp_established_timeout = tcp_established_timeout_;
     udp_stream_timeout = udp_stream_timeout_;
     udp_timeout = udp_timeout_;
   }
    : connection_tracking_specification_request)

let make_cpu_options_request ?amd_sev_snp:(amd_sev_snp_ : amd_sev_snp_enum option)
    ?core_count:(core_count_ : non_negative_integer option)
    ?threads_per_core:(threads_per_core_ : non_negative_integer option) () =
  ({ amd_sev_snp = amd_sev_snp_; core_count = core_count_; threads_per_core = threads_per_core_ }
    : cpu_options_request)

let make_create_volume_response ?volume_id:(volume_id_ : volume_id option) () =
  ({ volume_id = volume_id_ } : create_volume_response)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_specification ?resource_type:(resource_type_ : resource_type_enum option)
    ?tags:(tags_ : tag_list option) () =
  ({ resource_type = resource_type_; tags = tags_ } : tag_specification)

let make_create_volume_request ?client_token:(client_token_ : client_token option)
    ?encrypted:(encrypted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?iops:(iops_ : non_negative_integer option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?size_in_g_b:(size_in_g_b_ : non_negative_integer option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?tag_specifications:(tag_specifications_ : tag_specifications option)
    ?throughput:(throughput_ : non_negative_integer option)
    ?volume_type:(volume_type_ : volume_type_enum option)
    ~availability_zone:(availability_zone_ : string64) () =
  ({
     availability_zone = availability_zone_;
     client_token = client_token_;
     encrypted = encrypted_;
     iops = iops_;
     kms_key_id = kms_key_id_;
     size_in_g_b = size_in_g_b_;
     snapshot_id = snapshot_id_;
     tag_specifications = tag_specifications_;
     throughput = throughput_;
     volume_type = volume_type_;
   }
    : create_volume_request)

let make_create_workspace_instance_response
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option) () =
  ({ workspace_instance_id = workspace_instance_id_ } : create_workspace_instance_response)

let make_private_dns_name_options_request
    ?hostname_type:(hostname_type_ : hostname_type_enum option)
    ?enable_resource_name_dns_a_record:
      (enable_resource_name_dns_a_record_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enable_resource_name_dns_aaaa_record:
      (enable_resource_name_dns_aaaa_record_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     hostname_type = hostname_type_;
     enable_resource_name_dns_a_record = enable_resource_name_dns_a_record_;
     enable_resource_name_dns_aaaa_record = enable_resource_name_dns_aaaa_record_;
   }
    : private_dns_name_options_request)

let make_placement ?affinity:(affinity_ : string64 option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?group_id:(group_id_ : placement_group_id option) ?group_name:(group_name_ : string64 option)
    ?host_id:(host_id_ : host_id option)
    ?host_resource_group_arn:(host_resource_group_arn_ : ar_n option)
    ?partition_number:(partition_number_ : non_negative_integer option)
    ?tenancy:(tenancy_ : tenancy_enum option) () =
  ({
     affinity = affinity_;
     availability_zone = availability_zone_;
     group_id = group_id_;
     group_name = group_name_;
     host_id = host_id_;
     host_resource_group_arn = host_resource_group_arn_;
     partition_number = partition_number_;
     tenancy = tenancy_;
   }
    : placement)

let make_instance_network_performance_options_request
    ?bandwidth_weighting:(bandwidth_weighting_ : bandwidth_weighting_enum option) () =
  ({ bandwidth_weighting = bandwidth_weighting_ } : instance_network_performance_options_request)

let make_private_ip_address_specification
    ?primary:(primary_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?private_ip_address:(private_ip_address_ : ipv4_address option) () =
  ({ primary = primary_; private_ip_address = private_ip_address_ }
    : private_ip_address_specification)

let make_ipv6_prefix_specification_request ?ipv6_prefix:(ipv6_prefix_ : ipv6_prefix option) () =
  ({ ipv6_prefix = ipv6_prefix_ } : ipv6_prefix_specification_request)

let make_instance_ipv6_address ?ipv6_address:(ipv6_address_ : ipv6_address option)
    ?is_primary_ipv6:(is_primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ ipv6_address = ipv6_address_; is_primary_ipv6 = is_primary_ipv6_ } : instance_ipv6_address)

let make_ipv4_prefix_specification_request ?ipv4_prefix:(ipv4_prefix_ : ipv4_prefix option) () =
  ({ ipv4_prefix = ipv4_prefix_ } : ipv4_prefix_specification_request)

let make_ena_srd_udp_specification_request
    ?ena_srd_udp_enabled:(ena_srd_udp_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ ena_srd_udp_enabled = ena_srd_udp_enabled_ } : ena_srd_udp_specification_request)

let make_ena_srd_specification_request
    ?ena_srd_enabled:(ena_srd_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?ena_srd_udp_specification:
      (ena_srd_udp_specification_ : ena_srd_udp_specification_request option) () =
  ({ ena_srd_enabled = ena_srd_enabled_; ena_srd_udp_specification = ena_srd_udp_specification_ }
    : ena_srd_specification_request)

let make_instance_network_interface_specification
    ?associate_carrier_ip_address:
      (associate_carrier_ip_address_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?associate_public_ip_address:
      (associate_public_ip_address_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?connection_tracking_specification:
      (connection_tracking_specification_ : connection_tracking_specification_request option)
    ?description:(description_ : description option)
    ?device_index:(device_index_ : non_negative_integer option)
    ?ena_srd_specification:(ena_srd_specification_ : ena_srd_specification_request option)
    ?interface_type:(interface_type_ : interface_type_enum option)
    ?ipv4_prefixes:(ipv4_prefixes_ : ipv4_prefixes option)
    ?ipv4_prefix_count:(ipv4_prefix_count_ : non_negative_integer option)
    ?ipv6_address_count:(ipv6_address_count_ : non_negative_integer option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option)
    ?ipv6_prefixes:(ipv6_prefixes_ : ipv6_prefixes option)
    ?ipv6_prefix_count:(ipv6_prefix_count_ : non_negative_integer option)
    ?network_card_index:(network_card_index_ : non_negative_integer option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?primary_ipv6:(primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?private_ip_address:(private_ip_address_ : ipv4_address option)
    ?private_ip_addresses:(private_ip_addresses_ : private_ip_addresses option)
    ?secondary_private_ip_address_count:
      (secondary_private_ip_address_count_ : non_negative_integer option)
    ?groups:(groups_ : security_group_ids option) ?subnet_id:(subnet_id_ : subnet_id option) () =
  ({
     associate_carrier_ip_address = associate_carrier_ip_address_;
     associate_public_ip_address = associate_public_ip_address_;
     connection_tracking_specification = connection_tracking_specification_;
     description = description_;
     device_index = device_index_;
     ena_srd_specification = ena_srd_specification_;
     interface_type = interface_type_;
     ipv4_prefixes = ipv4_prefixes_;
     ipv4_prefix_count = ipv4_prefix_count_;
     ipv6_address_count = ipv6_address_count_;
     ipv6_addresses = ipv6_addresses_;
     ipv6_prefixes = ipv6_prefixes_;
     ipv6_prefix_count = ipv6_prefix_count_;
     network_card_index = network_card_index_;
     network_interface_id = network_interface_id_;
     primary_ipv6 = primary_ipv6_;
     private_ip_address = private_ip_address_;
     private_ip_addresses = private_ip_addresses_;
     secondary_private_ip_address_count = secondary_private_ip_address_count_;
     groups = groups_;
     subnet_id = subnet_id_;
   }
    : instance_network_interface_specification)

let make_run_instances_monitoring_enabled
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ enabled = enabled_ } : run_instances_monitoring_enabled)

let make_instance_metadata_options_request
    ?http_endpoint:(http_endpoint_ : http_endpoint_enum option)
    ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6_enum option)
    ?http_put_response_hop_limit:(http_put_response_hop_limit_ : http_put_response_hop_limit option)
    ?http_tokens:(http_tokens_ : http_tokens_enum option)
    ?instance_metadata_tags:(instance_metadata_tags_ : instance_metadata_tags_enum option) () =
  ({
     http_endpoint = http_endpoint_;
     http_protocol_ipv6 = http_protocol_ipv6_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_tokens = http_tokens_;
     instance_metadata_tags = instance_metadata_tags_;
   }
    : instance_metadata_options_request)

let make_instance_maintenance_options_request
    ?auto_recovery:(auto_recovery_ : auto_recovery_enum option) () =
  ({ auto_recovery = auto_recovery_ } : instance_maintenance_options_request)

let make_license_configuration_request
    ?license_configuration_arn:(license_configuration_arn_ : ar_n option) () =
  ({ license_configuration_arn = license_configuration_arn_ } : license_configuration_request)

let make_spot_market_options
    ?block_duration_minutes:(block_duration_minutes_ : non_negative_integer option)
    ?instance_interruption_behavior:
      (instance_interruption_behavior_ : instance_interruption_behavior_enum option)
    ?max_price:(max_price_ : string64 option)
    ?spot_instance_type:(spot_instance_type_ : spot_instance_type_enum option)
    ?valid_until_utc:(valid_until_utc_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     block_duration_minutes = block_duration_minutes_;
     instance_interruption_behavior = instance_interruption_behavior_;
     max_price = max_price_;
     spot_instance_type = spot_instance_type_;
     valid_until_utc = valid_until_utc_;
   }
    : spot_market_options)

let make_instance_market_options_request ?market_type:(market_type_ : market_type_enum option)
    ?spot_options:(spot_options_ : spot_market_options option) () =
  ({ market_type = market_type_; spot_options = spot_options_ } : instance_market_options_request)

let make_iam_instance_profile_specification ?arn:(arn_ : ar_n option)
    ?name:(name_ : string64 option) () =
  ({ arn = arn_; name = name_ } : iam_instance_profile_specification)

let make_hibernation_options_request
    ?configured:(configured_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ configured = configured_ } : hibernation_options_request)

let make_enclave_options_request ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ()
    =
  ({ enabled = enabled_ } : enclave_options_request)

let make_credit_specification_request ?cpu_credits:(cpu_credits_ : cpu_credits_enum option) () =
  ({ cpu_credits = cpu_credits_ } : credit_specification_request)

let make_managed_instance_request
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?cpu_options:(cpu_options_ : cpu_options_request option)
    ?credit_specification:(credit_specification_ : credit_specification_request option)
    ?disable_api_stop:(disable_api_stop_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?ebs_optimized:(ebs_optimized_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enable_primary_ipv6:(enable_primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enclave_options:(enclave_options_ : enclave_options_request option)
    ?hibernation_options:(hibernation_options_ : hibernation_options_request option)
    ?iam_instance_profile:(iam_instance_profile_ : iam_instance_profile_specification option)
    ?image_id:(image_id_ : image_id option)
    ?instance_market_options:(instance_market_options_ : instance_market_options_request option)
    ?instance_type:(instance_type_ : instance_type option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option)
    ?ipv6_address_count:(ipv6_address_count_ : non_negative_integer option)
    ?kernel_id:(kernel_id_ : string128 option) ?key_name:(key_name_ : string64 option)
    ?license_specifications:(license_specifications_ : license_specifications option)
    ?maintenance_options:(maintenance_options_ : instance_maintenance_options_request option)
    ?metadata_options:(metadata_options_ : instance_metadata_options_request option)
    ?monitoring:(monitoring_ : run_instances_monitoring_enabled option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?network_performance_options:
      (network_performance_options_ : instance_network_performance_options_request option)
    ?placement:(placement_ : placement option)
    ?private_dns_name_options:(private_dns_name_options_ : private_dns_name_options_request option)
    ?private_ip_address:(private_ip_address_ : ipv4_address option)
    ?ramdisk_id:(ramdisk_id_ : string128 option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?security_groups:(security_groups_ : security_group_names option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?tag_specifications:(tag_specifications_ : tag_specifications option)
    ?user_data:(user_data_ : user_data option) () =
  ({
     block_device_mappings = block_device_mappings_;
     capacity_reservation_specification = capacity_reservation_specification_;
     cpu_options = cpu_options_;
     credit_specification = credit_specification_;
     disable_api_stop = disable_api_stop_;
     ebs_optimized = ebs_optimized_;
     enable_primary_ipv6 = enable_primary_ipv6_;
     enclave_options = enclave_options_;
     hibernation_options = hibernation_options_;
     iam_instance_profile = iam_instance_profile_;
     image_id = image_id_;
     instance_market_options = instance_market_options_;
     instance_type = instance_type_;
     ipv6_addresses = ipv6_addresses_;
     ipv6_address_count = ipv6_address_count_;
     kernel_id = kernel_id_;
     key_name = key_name_;
     license_specifications = license_specifications_;
     maintenance_options = maintenance_options_;
     metadata_options = metadata_options_;
     monitoring = monitoring_;
     network_interfaces = network_interfaces_;
     network_performance_options = network_performance_options_;
     placement = placement_;
     private_dns_name_options = private_dns_name_options_;
     private_ip_address = private_ip_address_;
     ramdisk_id = ramdisk_id_;
     security_group_ids = security_group_ids_;
     security_groups = security_groups_;
     subnet_id = subnet_id_;
     tag_specifications = tag_specifications_;
     user_data = user_data_;
   }
    : managed_instance_request)

let make_create_workspace_instance_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ?billing_configuration:(billing_configuration_ : billing_configuration option)
    ~managed_instance:(managed_instance_ : managed_instance_request) () =
  ({
     client_token = client_token_;
     tags = tags_;
     managed_instance = managed_instance_;
     billing_configuration = billing_configuration_;
   }
    : create_workspace_instance_request)

let make_delete_volume_response () = (() : unit)

let make_delete_volume_request ~volume_id:(volume_id_ : volume_id) () =
  ({ volume_id = volume_id_ } : delete_volume_request)

let make_delete_workspace_instance_response () = (() : unit)

let make_delete_workspace_instance_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : delete_workspace_instance_request)

let make_disassociate_volume_response () = (() : unit)

let make_disassociate_volume_request ?device:(device_ : device_name option)
    ?disassociate_mode:(disassociate_mode_ : disassociate_mode_enum option)
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id)
    ~volume_id:(volume_id_ : volume_id) () =
  ({
     workspace_instance_id = workspace_instance_id_;
     volume_id = volume_id_;
     device = device_;
     disassociate_mode = disassociate_mode_;
   }
    : disassociate_volume_request)

let make_ec2_instance_error
    ?ec2_error_code:(ec2_error_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ec2_exception_type:(ec2_exception_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ec2_error_message:(ec2_error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     ec2_error_code = ec2_error_code_;
     ec2_exception_type = ec2_exception_type_;
     ec2_error_message = ec2_error_message_;
   }
    : ec2_instance_error)

let make_ec2_managed_instance
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ instance_id = instance_id_ } : ec2_managed_instance)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ workspace_instance_id = workspace_instance_id_; tag_keys = tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) ~tags:(tags_ : tag_list)
    () =
  ({ workspace_instance_id = workspace_instance_id_; tags = tags_ } : tag_resource_request)

let make_workspace_instance ?provision_state:(provision_state_ : provision_state_enum option)
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option)
    ?ec2_managed_instance:(ec2_managed_instance_ : ec2_managed_instance option) () =
  ({
     provision_state = provision_state_;
     workspace_instance_id = workspace_instance_id_;
     ec2_managed_instance = ec2_managed_instance_;
   }
    : workspace_instance)

let make_list_workspace_instances_response ?next_token:(next_token_ : next_token option)
    ~workspace_instances:(workspace_instances_ : workspace_instances) () =
  ({ workspace_instances = workspace_instances_; next_token = next_token_ }
    : list_workspace_instances_response)

let make_list_workspace_instances_request
    ?provision_states:(provision_states_ : provision_states option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ provision_states = provision_states_; max_results = max_results_; next_token = next_token_ }
    : list_workspace_instances_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : list_tags_for_resource_request)

let make_region ?region_name:(region_name_ : region_name option) () =
  ({ region_name = region_name_ } : region)

let make_list_regions_response ?next_token:(next_token_ : next_token option)
    ~regions:(regions_ : region_list) () =
  ({ regions = regions_; next_token = next_token_ } : list_regions_response)

let make_list_regions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_regions_request)

let make_supported_instance_configuration ?billing_mode:(billing_mode_ : billing_mode option)
    ?platform_type:(platform_type_ : platform_type_enum option)
    ?tenancy:(tenancy_ : instance_configuration_tenancy_enum option) () =
  ({ billing_mode = billing_mode_; platform_type = platform_type_; tenancy = tenancy_ }
    : supported_instance_configuration)

let make_instance_type_info ?instance_type:(instance_type_ : instance_type option)
    ?supported_instance_configurations:
      (supported_instance_configurations_ : supported_instance_configurations option) () =
  ({
     instance_type = instance_type_;
     supported_instance_configurations = supported_instance_configurations_;
   }
    : instance_type_info)

let make_list_instance_types_response ?next_token:(next_token_ : next_token option)
    ~instance_types:(instance_types_ : instance_types) () =
  ({ instance_types = instance_types_; next_token = next_token_ } : list_instance_types_response)

let make_instance_configuration_filter ~billing_mode:(billing_mode_ : billing_mode)
    ~platform_type:(platform_type_ : platform_type_enum)
    ~tenancy:(tenancy_ : instance_configuration_tenancy_enum) () =
  ({ billing_mode = billing_mode_; platform_type = platform_type_; tenancy = tenancy_ }
    : instance_configuration_filter)

let make_list_instance_types_request
    ?max_results:(max_results_ : list_instance_types_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?instance_configuration_filter:
      (instance_configuration_filter_ : instance_configuration_filter option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     instance_configuration_filter = instance_configuration_filter_;
   }
    : list_instance_types_request)

let make_workspace_instance_error
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ } : workspace_instance_error)

let make_get_workspace_instance_response
    ?workspace_instance_errors:(workspace_instance_errors_ : workspace_instance_errors option)
    ?ec2_instance_errors:(ec2_instance_errors_ : ec2_instance_errors option)
    ?provision_state:(provision_state_ : provision_state_enum option)
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option)
    ?ec2_managed_instance:(ec2_managed_instance_ : ec2_managed_instance option)
    ?billing_configuration:(billing_configuration_ : billing_configuration option) () =
  ({
     workspace_instance_errors = workspace_instance_errors_;
     ec2_instance_errors = ec2_instance_errors_;
     provision_state = provision_state_;
     workspace_instance_id = workspace_instance_id_;
     ec2_managed_instance = ec2_managed_instance_;
     billing_configuration = billing_configuration_;
   }
    : get_workspace_instance_response)

let make_get_workspace_instance_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : get_workspace_instance_request)
