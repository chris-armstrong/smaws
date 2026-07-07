open Types

let make_ec2_managed_instance
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ instance_id = instance_id_ } : ec2_managed_instance)

let make_workspace_instance
    ?ec2_managed_instance:(ec2_managed_instance_ : ec2_managed_instance option)
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option)
    ?provision_state:(provision_state_ : provision_state_enum option) () =
  ({
     ec2_managed_instance = ec2_managed_instance_;
     workspace_instance_id = workspace_instance_id_;
     provision_state = provision_state_;
   }
    : workspace_instance)

let make_workspace_instance_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ error_message = error_message_; error_code = error_code_ } : workspace_instance_error)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; reason = reason_; name = name_ } : validation_exception_field)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ tag_keys = tag_keys_; workspace_instance_id = workspace_instance_id_ }
    : untag_resource_request)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_specification ?tags:(tags_ : tag_list option)
    ?resource_type:(resource_type_ : resource_type_enum option) () =
  ({ tags = tags_; resource_type = resource_type_ } : tag_specification)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ tags = tags_; workspace_instance_id = workspace_instance_id_ } : tag_resource_request)

let make_supported_instance_configuration
    ?tenancy:(tenancy_ : instance_configuration_tenancy_enum option)
    ?platform_type:(platform_type_ : platform_type_enum option)
    ?billing_mode:(billing_mode_ : billing_mode option) () =
  ({ tenancy = tenancy_; platform_type = platform_type_; billing_mode = billing_mode_ }
    : supported_instance_configuration)

let make_spot_market_options
    ?valid_until_utc:(valid_until_utc_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?spot_instance_type:(spot_instance_type_ : spot_instance_type_enum option)
    ?max_price:(max_price_ : string64 option)
    ?instance_interruption_behavior:
      (instance_interruption_behavior_ : instance_interruption_behavior_enum option)
    ?block_duration_minutes:(block_duration_minutes_ : non_negative_integer option) () =
  ({
     valid_until_utc = valid_until_utc_;
     spot_instance_type = spot_instance_type_;
     max_price = max_price_;
     instance_interruption_behavior = instance_interruption_behavior_;
     block_duration_minutes = block_duration_minutes_;
   }
    : spot_market_options)

let make_run_instances_monitoring_enabled
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ enabled = enabled_ } : run_instances_monitoring_enabled)

let make_region ?region_name:(region_name_ : region_name option) () =
  ({ region_name = region_name_ } : region)

let make_private_ip_address_specification
    ?private_ip_address:(private_ip_address_ : ipv4_address option)
    ?primary:(primary_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ private_ip_address = private_ip_address_; primary = primary_ }
    : private_ip_address_specification)

let make_private_dns_name_options_request
    ?enable_resource_name_dns_aaaa_record:
      (enable_resource_name_dns_aaaa_record_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enable_resource_name_dns_a_record:
      (enable_resource_name_dns_a_record_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?hostname_type:(hostname_type_ : hostname_type_enum option) () =
  ({
     enable_resource_name_dns_aaaa_record = enable_resource_name_dns_aaaa_record_;
     enable_resource_name_dns_a_record = enable_resource_name_dns_a_record_;
     hostname_type = hostname_type_;
   }
    : private_dns_name_options_request)

let make_placement ?tenancy:(tenancy_ : tenancy_enum option)
    ?partition_number:(partition_number_ : non_negative_integer option)
    ?host_resource_group_arn:(host_resource_group_arn_ : ar_n option)
    ?host_id:(host_id_ : host_id option) ?group_name:(group_name_ : string64 option)
    ?group_id:(group_id_ : placement_group_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?affinity:(affinity_ : string64 option) () =
  ({
     tenancy = tenancy_;
     partition_number = partition_number_;
     host_resource_group_arn = host_resource_group_arn_;
     host_id = host_id_;
     group_name = group_name_;
     group_id = group_id_;
     availability_zone = availability_zone_;
     affinity = affinity_;
   }
    : placement)

let make_connection_tracking_specification_request
    ?udp_timeout:(udp_timeout_ : non_negative_integer option)
    ?udp_stream_timeout:(udp_stream_timeout_ : non_negative_integer option)
    ?tcp_established_timeout:(tcp_established_timeout_ : non_negative_integer option) () =
  ({
     udp_timeout = udp_timeout_;
     udp_stream_timeout = udp_stream_timeout_;
     tcp_established_timeout = tcp_established_timeout_;
   }
    : connection_tracking_specification_request)

let make_ena_srd_udp_specification_request
    ?ena_srd_udp_enabled:(ena_srd_udp_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ ena_srd_udp_enabled = ena_srd_udp_enabled_ } : ena_srd_udp_specification_request)

let make_ena_srd_specification_request
    ?ena_srd_udp_specification:
      (ena_srd_udp_specification_ : ena_srd_udp_specification_request option)
    ?ena_srd_enabled:(ena_srd_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ ena_srd_udp_specification = ena_srd_udp_specification_; ena_srd_enabled = ena_srd_enabled_ }
    : ena_srd_specification_request)

let make_ipv4_prefix_specification_request ?ipv4_prefix:(ipv4_prefix_ : ipv4_prefix option) () =
  ({ ipv4_prefix = ipv4_prefix_ } : ipv4_prefix_specification_request)

let make_instance_ipv6_address
    ?is_primary_ipv6:(is_primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?ipv6_address:(ipv6_address_ : ipv6_address option) () =
  ({ is_primary_ipv6 = is_primary_ipv6_; ipv6_address = ipv6_address_ } : instance_ipv6_address)

let make_ipv6_prefix_specification_request ?ipv6_prefix:(ipv6_prefix_ : ipv6_prefix option) () =
  ({ ipv6_prefix = ipv6_prefix_ } : ipv6_prefix_specification_request)

let make_instance_network_interface_specification ?subnet_id:(subnet_id_ : subnet_id option)
    ?groups:(groups_ : security_group_ids option)
    ?secondary_private_ip_address_count:
      (secondary_private_ip_address_count_ : non_negative_integer option)
    ?private_ip_addresses:(private_ip_addresses_ : private_ip_addresses option)
    ?private_ip_address:(private_ip_address_ : ipv4_address option)
    ?primary_ipv6:(primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?network_card_index:(network_card_index_ : non_negative_integer option)
    ?ipv6_prefix_count:(ipv6_prefix_count_ : non_negative_integer option)
    ?ipv6_prefixes:(ipv6_prefixes_ : ipv6_prefixes option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option)
    ?ipv6_address_count:(ipv6_address_count_ : non_negative_integer option)
    ?ipv4_prefix_count:(ipv4_prefix_count_ : non_negative_integer option)
    ?ipv4_prefixes:(ipv4_prefixes_ : ipv4_prefixes option)
    ?interface_type:(interface_type_ : interface_type_enum option)
    ?ena_srd_specification:(ena_srd_specification_ : ena_srd_specification_request option)
    ?device_index:(device_index_ : non_negative_integer option)
    ?description:(description_ : description option)
    ?connection_tracking_specification:
      (connection_tracking_specification_ : connection_tracking_specification_request option)
    ?associate_public_ip_address:
      (associate_public_ip_address_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?associate_carrier_ip_address:
      (associate_carrier_ip_address_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     subnet_id = subnet_id_;
     groups = groups_;
     secondary_private_ip_address_count = secondary_private_ip_address_count_;
     private_ip_addresses = private_ip_addresses_;
     private_ip_address = private_ip_address_;
     primary_ipv6 = primary_ipv6_;
     network_interface_id = network_interface_id_;
     network_card_index = network_card_index_;
     ipv6_prefix_count = ipv6_prefix_count_;
     ipv6_prefixes = ipv6_prefixes_;
     ipv6_addresses = ipv6_addresses_;
     ipv6_address_count = ipv6_address_count_;
     ipv4_prefix_count = ipv4_prefix_count_;
     ipv4_prefixes = ipv4_prefixes_;
     interface_type = interface_type_;
     ena_srd_specification = ena_srd_specification_;
     device_index = device_index_;
     description = description_;
     connection_tracking_specification = connection_tracking_specification_;
     associate_public_ip_address = associate_public_ip_address_;
     associate_carrier_ip_address = associate_carrier_ip_address_;
   }
    : instance_network_interface_specification)

let make_ebs_block_device ?volume_size:(volume_size_ : non_negative_integer option)
    ?throughput:(throughput_ : non_negative_integer option)
    ?iops:(iops_ : non_negative_integer option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?encrypted:(encrypted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?volume_type:(volume_type_ : volume_type_enum option) () =
  ({
     volume_size = volume_size_;
     throughput = throughput_;
     iops = iops_;
     kms_key_id = kms_key_id_;
     encrypted = encrypted_;
     volume_type = volume_type_;
   }
    : ebs_block_device)

let make_block_device_mapping_request ?virtual_name:(virtual_name_ : virtual_name option)
    ?no_device:(no_device_ : device_name option) ?ebs:(ebs_ : ebs_block_device option)
    ?device_name:(device_name_ : device_name option) () =
  ({ virtual_name = virtual_name_; no_device = no_device_; ebs = ebs_; device_name = device_name_ }
    : block_device_mapping_request)

let make_capacity_reservation_target
    ?capacity_reservation_resource_group_arn:
      (capacity_reservation_resource_group_arn_ : ar_n option)
    ?capacity_reservation_id:(capacity_reservation_id_ : string128 option) () =
  ({
     capacity_reservation_resource_group_arn = capacity_reservation_resource_group_arn_;
     capacity_reservation_id = capacity_reservation_id_;
   }
    : capacity_reservation_target)

let make_capacity_reservation_specification
    ?capacity_reservation_target:(capacity_reservation_target_ : capacity_reservation_target option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference_enum option) () =
  ({
     capacity_reservation_target = capacity_reservation_target_;
     capacity_reservation_preference = capacity_reservation_preference_;
   }
    : capacity_reservation_specification)

let make_cpu_options_request ?threads_per_core:(threads_per_core_ : non_negative_integer option)
    ?core_count:(core_count_ : non_negative_integer option)
    ?amd_sev_snp:(amd_sev_snp_ : amd_sev_snp_enum option) () =
  ({ threads_per_core = threads_per_core_; core_count = core_count_; amd_sev_snp = amd_sev_snp_ }
    : cpu_options_request)

let make_credit_specification_request ?cpu_credits:(cpu_credits_ : cpu_credits_enum option) () =
  ({ cpu_credits = cpu_credits_ } : credit_specification_request)

let make_enclave_options_request ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ()
    =
  ({ enabled = enabled_ } : enclave_options_request)

let make_hibernation_options_request
    ?configured:(configured_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ configured = configured_ } : hibernation_options_request)

let make_iam_instance_profile_specification ?name:(name_ : string64 option)
    ?arn:(arn_ : ar_n option) () =
  ({ name = name_; arn = arn_ } : iam_instance_profile_specification)

let make_instance_market_options_request ?spot_options:(spot_options_ : spot_market_options option)
    ?market_type:(market_type_ : market_type_enum option) () =
  ({ spot_options = spot_options_; market_type = market_type_ } : instance_market_options_request)

let make_license_configuration_request
    ?license_configuration_arn:(license_configuration_arn_ : ar_n option) () =
  ({ license_configuration_arn = license_configuration_arn_ } : license_configuration_request)

let make_instance_maintenance_options_request
    ?auto_recovery:(auto_recovery_ : auto_recovery_enum option) () =
  ({ auto_recovery = auto_recovery_ } : instance_maintenance_options_request)

let make_instance_metadata_options_request
    ?instance_metadata_tags:(instance_metadata_tags_ : instance_metadata_tags_enum option)
    ?http_tokens:(http_tokens_ : http_tokens_enum option)
    ?http_put_response_hop_limit:(http_put_response_hop_limit_ : http_put_response_hop_limit option)
    ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6_enum option)
    ?http_endpoint:(http_endpoint_ : http_endpoint_enum option) () =
  ({
     instance_metadata_tags = instance_metadata_tags_;
     http_tokens = http_tokens_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_protocol_ipv6 = http_protocol_ipv6_;
     http_endpoint = http_endpoint_;
   }
    : instance_metadata_options_request)

let make_instance_network_performance_options_request
    ?bandwidth_weighting:(bandwidth_weighting_ : bandwidth_weighting_enum option) () =
  ({ bandwidth_weighting = bandwidth_weighting_ } : instance_network_performance_options_request)

let make_managed_instance_request ?user_data:(user_data_ : user_data option)
    ?tag_specifications:(tag_specifications_ : tag_specifications option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?security_groups:(security_groups_ : security_group_names option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?ramdisk_id:(ramdisk_id_ : string128 option)
    ?private_ip_address:(private_ip_address_ : ipv4_address option)
    ?private_dns_name_options:(private_dns_name_options_ : private_dns_name_options_request option)
    ?placement:(placement_ : placement option)
    ?network_performance_options:
      (network_performance_options_ : instance_network_performance_options_request option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?monitoring:(monitoring_ : run_instances_monitoring_enabled option)
    ?metadata_options:(metadata_options_ : instance_metadata_options_request option)
    ?maintenance_options:(maintenance_options_ : instance_maintenance_options_request option)
    ?license_specifications:(license_specifications_ : license_specifications option)
    ?key_name:(key_name_ : string64 option) ?kernel_id:(kernel_id_ : string128 option)
    ?ipv6_address_count:(ipv6_address_count_ : non_negative_integer option)
    ?ipv6_addresses:(ipv6_addresses_ : ipv6_addresses option)
    ?instance_type:(instance_type_ : instance_type option)
    ?instance_market_options:(instance_market_options_ : instance_market_options_request option)
    ?image_id:(image_id_ : image_id option)
    ?iam_instance_profile:(iam_instance_profile_ : iam_instance_profile_specification option)
    ?hibernation_options:(hibernation_options_ : hibernation_options_request option)
    ?enclave_options:(enclave_options_ : enclave_options_request option)
    ?enable_primary_ipv6:(enable_primary_ipv6_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?ebs_optimized:(ebs_optimized_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?disable_api_stop:(disable_api_stop_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?credit_specification:(credit_specification_ : credit_specification_request option)
    ?cpu_options:(cpu_options_ : cpu_options_request option)
    ?capacity_reservation_specification:
      (capacity_reservation_specification_ : capacity_reservation_specification option)
    ?block_device_mappings:(block_device_mappings_ : block_device_mappings option) () =
  ({
     user_data = user_data_;
     tag_specifications = tag_specifications_;
     subnet_id = subnet_id_;
     security_groups = security_groups_;
     security_group_ids = security_group_ids_;
     ramdisk_id = ramdisk_id_;
     private_ip_address = private_ip_address_;
     private_dns_name_options = private_dns_name_options_;
     placement = placement_;
     network_performance_options = network_performance_options_;
     network_interfaces = network_interfaces_;
     monitoring = monitoring_;
     metadata_options = metadata_options_;
     maintenance_options = maintenance_options_;
     license_specifications = license_specifications_;
     key_name = key_name_;
     kernel_id = kernel_id_;
     ipv6_address_count = ipv6_address_count_;
     ipv6_addresses = ipv6_addresses_;
     instance_type = instance_type_;
     instance_market_options = instance_market_options_;
     image_id = image_id_;
     iam_instance_profile = iam_instance_profile_;
     hibernation_options = hibernation_options_;
     enclave_options = enclave_options_;
     enable_primary_ipv6 = enable_primary_ipv6_;
     ebs_optimized = ebs_optimized_;
     disable_api_stop = disable_api_stop_;
     credit_specification = credit_specification_;
     cpu_options = cpu_options_;
     capacity_reservation_specification = capacity_reservation_specification_;
     block_device_mappings = block_device_mappings_;
   }
    : managed_instance_request)

let make_list_workspace_instances_response ?next_token:(next_token_ : next_token option)
    ~workspace_instances:(workspace_instances_ : workspace_instances) () =
  ({ next_token = next_token_; workspace_instances = workspace_instances_ }
    : list_workspace_instances_response)

let make_list_workspace_instances_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?provision_states:(provision_states_ : provision_states option) () =
  ({ next_token = next_token_; max_results = max_results_; provision_states = provision_states_ }
    : list_workspace_instances_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : list_tags_for_resource_request)

let make_list_regions_response ?next_token:(next_token_ : next_token option)
    ~regions:(regions_ : region_list) () =
  ({ next_token = next_token_; regions = regions_ } : list_regions_response)

let make_list_regions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_regions_request)

let make_instance_type_info
    ?supported_instance_configurations:
      (supported_instance_configurations_ : supported_instance_configurations option)
    ?instance_type:(instance_type_ : instance_type option) () =
  ({
     supported_instance_configurations = supported_instance_configurations_;
     instance_type = instance_type_;
   }
    : instance_type_info)

let make_list_instance_types_response ?next_token:(next_token_ : next_token option)
    ~instance_types:(instance_types_ : instance_types) () =
  ({ next_token = next_token_; instance_types = instance_types_ } : list_instance_types_response)

let make_instance_configuration_filter ~tenancy:(tenancy_ : instance_configuration_tenancy_enum)
    ~platform_type:(platform_type_ : platform_type_enum)
    ~billing_mode:(billing_mode_ : billing_mode) () =
  ({ tenancy = tenancy_; platform_type = platform_type_; billing_mode = billing_mode_ }
    : instance_configuration_filter)

let make_list_instance_types_request
    ?instance_configuration_filter:
      (instance_configuration_filter_ : instance_configuration_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_instance_types_max_results option) () =
  ({
     instance_configuration_filter = instance_configuration_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_instance_types_request)

let make_ec2_instance_error
    ?ec2_error_message:(ec2_error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ec2_exception_type:(ec2_exception_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ec2_error_code:(ec2_error_code_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     ec2_error_message = ec2_error_message_;
     ec2_exception_type = ec2_exception_type_;
     ec2_error_code = ec2_error_code_;
   }
    : ec2_instance_error)

let make_billing_configuration ~billing_mode:(billing_mode_ : billing_mode) () =
  ({ billing_mode = billing_mode_ } : billing_configuration)

let make_get_workspace_instance_response
    ?billing_configuration:(billing_configuration_ : billing_configuration option)
    ?ec2_managed_instance:(ec2_managed_instance_ : ec2_managed_instance option)
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option)
    ?provision_state:(provision_state_ : provision_state_enum option)
    ?ec2_instance_errors:(ec2_instance_errors_ : ec2_instance_errors option)
    ?workspace_instance_errors:(workspace_instance_errors_ : workspace_instance_errors option) () =
  ({
     billing_configuration = billing_configuration_;
     ec2_managed_instance = ec2_managed_instance_;
     workspace_instance_id = workspace_instance_id_;
     provision_state = provision_state_;
     ec2_instance_errors = ec2_instance_errors_;
     workspace_instance_errors = workspace_instance_errors_;
   }
    : get_workspace_instance_response)

let make_get_workspace_instance_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : get_workspace_instance_request)

let make_disassociate_volume_response () = (() : unit)

let make_disassociate_volume_request
    ?disassociate_mode:(disassociate_mode_ : disassociate_mode_enum option)
    ?device:(device_ : device_name option) ~volume_id:(volume_id_ : volume_id)
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({
     disassociate_mode = disassociate_mode_;
     device = device_;
     volume_id = volume_id_;
     workspace_instance_id = workspace_instance_id_;
   }
    : disassociate_volume_request)

let make_delete_workspace_instance_response () = (() : unit)

let make_delete_workspace_instance_request
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ workspace_instance_id = workspace_instance_id_ } : delete_workspace_instance_request)

let make_delete_volume_response () = (() : unit)

let make_delete_volume_request ~volume_id:(volume_id_ : volume_id) () =
  ({ volume_id = volume_id_ } : delete_volume_request)

let make_create_workspace_instance_response
    ?workspace_instance_id:(workspace_instance_id_ : workspace_instance_id option) () =
  ({ workspace_instance_id = workspace_instance_id_ } : create_workspace_instance_response)

let make_create_workspace_instance_request
    ?billing_configuration:(billing_configuration_ : billing_configuration option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ~managed_instance:(managed_instance_ : managed_instance_request) () =
  ({
     billing_configuration = billing_configuration_;
     managed_instance = managed_instance_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_workspace_instance_request)

let make_create_volume_response ?volume_id:(volume_id_ : volume_id option) () =
  ({ volume_id = volume_id_ } : create_volume_response)

let make_create_volume_request ?volume_type:(volume_type_ : volume_type_enum option)
    ?throughput:(throughput_ : non_negative_integer option)
    ?tag_specifications:(tag_specifications_ : tag_specifications option)
    ?snapshot_id:(snapshot_id_ : snapshot_id option)
    ?size_in_g_b:(size_in_g_b_ : non_negative_integer option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?iops:(iops_ : non_negative_integer option)
    ?encrypted:(encrypted_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?client_token:(client_token_ : client_token option)
    ~availability_zone:(availability_zone_ : string64) () =
  ({
     volume_type = volume_type_;
     throughput = throughput_;
     tag_specifications = tag_specifications_;
     snapshot_id = snapshot_id_;
     size_in_g_b = size_in_g_b_;
     kms_key_id = kms_key_id_;
     iops = iops_;
     encrypted = encrypted_;
     client_token = client_token_;
     availability_zone = availability_zone_;
   }
    : create_volume_request)

let make_associate_volume_response () = (() : unit)

let make_associate_volume_request ~device:(device_ : device_name)
    ~volume_id:(volume_id_ : volume_id)
    ~workspace_instance_id:(workspace_instance_id_ : workspace_instance_id) () =
  ({ device = device_; volume_id = volume_id_; workspace_instance_id = workspace_instance_id_ }
    : associate_volume_request)
