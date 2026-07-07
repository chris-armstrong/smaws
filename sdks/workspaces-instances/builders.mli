open Types

val make_ec2_managed_instance :
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> ec2_managed_instance

val make_workspace_instance :
  ?ec2_managed_instance:ec2_managed_instance ->
  ?workspace_instance_id:workspace_instance_id ->
  ?provision_state:provision_state_enum ->
  unit ->
  workspace_instance

val make_workspace_instance_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  workspace_instance_error

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list ->
  workspace_instance_id:workspace_instance_id ->
  unit ->
  untag_resource_request

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_tag_specification :
  ?tags:tag_list -> ?resource_type:resource_type_enum -> unit -> tag_specification

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> workspace_instance_id:workspace_instance_id -> unit -> tag_resource_request

val make_supported_instance_configuration :
  ?tenancy:instance_configuration_tenancy_enum ->
  ?platform_type:platform_type_enum ->
  ?billing_mode:billing_mode ->
  unit ->
  supported_instance_configuration

val make_spot_market_options :
  ?valid_until_utc:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?spot_instance_type:spot_instance_type_enum ->
  ?max_price:string64 ->
  ?instance_interruption_behavior:instance_interruption_behavior_enum ->
  ?block_duration_minutes:non_negative_integer ->
  unit ->
  spot_market_options

val make_run_instances_monitoring_enabled :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> run_instances_monitoring_enabled

val make_region : ?region_name:region_name -> unit -> region

val make_private_ip_address_specification :
  ?private_ip_address:ipv4_address ->
  ?primary:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  private_ip_address_specification

val make_private_dns_name_options_request :
  ?enable_resource_name_dns_aaaa_record:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enable_resource_name_dns_a_record:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?hostname_type:hostname_type_enum ->
  unit ->
  private_dns_name_options_request

val make_placement :
  ?tenancy:tenancy_enum ->
  ?partition_number:non_negative_integer ->
  ?host_resource_group_arn:ar_n ->
  ?host_id:host_id ->
  ?group_name:string64 ->
  ?group_id:placement_group_id ->
  ?availability_zone:availability_zone ->
  ?affinity:string64 ->
  unit ->
  placement

val make_connection_tracking_specification_request :
  ?udp_timeout:non_negative_integer ->
  ?udp_stream_timeout:non_negative_integer ->
  ?tcp_established_timeout:non_negative_integer ->
  unit ->
  connection_tracking_specification_request

val make_ena_srd_udp_specification_request :
  ?ena_srd_udp_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  ena_srd_udp_specification_request

val make_ena_srd_specification_request :
  ?ena_srd_udp_specification:ena_srd_udp_specification_request ->
  ?ena_srd_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  ena_srd_specification_request

val make_ipv4_prefix_specification_request :
  ?ipv4_prefix:ipv4_prefix -> unit -> ipv4_prefix_specification_request

val make_instance_ipv6_address :
  ?is_primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?ipv6_address:ipv6_address ->
  unit ->
  instance_ipv6_address

val make_ipv6_prefix_specification_request :
  ?ipv6_prefix:ipv6_prefix -> unit -> ipv6_prefix_specification_request

val make_instance_network_interface_specification :
  ?subnet_id:subnet_id ->
  ?groups:security_group_ids ->
  ?secondary_private_ip_address_count:non_negative_integer ->
  ?private_ip_addresses:private_ip_addresses ->
  ?private_ip_address:ipv4_address ->
  ?primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?network_interface_id:network_interface_id ->
  ?network_card_index:non_negative_integer ->
  ?ipv6_prefix_count:non_negative_integer ->
  ?ipv6_prefixes:ipv6_prefixes ->
  ?ipv6_addresses:ipv6_addresses ->
  ?ipv6_address_count:non_negative_integer ->
  ?ipv4_prefix_count:non_negative_integer ->
  ?ipv4_prefixes:ipv4_prefixes ->
  ?interface_type:interface_type_enum ->
  ?ena_srd_specification:ena_srd_specification_request ->
  ?device_index:non_negative_integer ->
  ?description:description ->
  ?connection_tracking_specification:connection_tracking_specification_request ->
  ?associate_public_ip_address:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?associate_carrier_ip_address:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  instance_network_interface_specification

val make_ebs_block_device :
  ?volume_size:non_negative_integer ->
  ?throughput:non_negative_integer ->
  ?iops:non_negative_integer ->
  ?kms_key_id:kms_key_id ->
  ?encrypted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?volume_type:volume_type_enum ->
  unit ->
  ebs_block_device

val make_block_device_mapping_request :
  ?virtual_name:virtual_name ->
  ?no_device:device_name ->
  ?ebs:ebs_block_device ->
  ?device_name:device_name ->
  unit ->
  block_device_mapping_request

val make_capacity_reservation_target :
  ?capacity_reservation_resource_group_arn:ar_n ->
  ?capacity_reservation_id:string128 ->
  unit ->
  capacity_reservation_target

val make_capacity_reservation_specification :
  ?capacity_reservation_target:capacity_reservation_target ->
  ?capacity_reservation_preference:capacity_reservation_preference_enum ->
  unit ->
  capacity_reservation_specification

val make_cpu_options_request :
  ?threads_per_core:non_negative_integer ->
  ?core_count:non_negative_integer ->
  ?amd_sev_snp:amd_sev_snp_enum ->
  unit ->
  cpu_options_request

val make_credit_specification_request :
  ?cpu_credits:cpu_credits_enum -> unit -> credit_specification_request

val make_enclave_options_request :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> enclave_options_request

val make_hibernation_options_request :
  ?configured:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> hibernation_options_request

val make_iam_instance_profile_specification :
  ?name:string64 -> ?arn:ar_n -> unit -> iam_instance_profile_specification

val make_instance_market_options_request :
  ?spot_options:spot_market_options ->
  ?market_type:market_type_enum ->
  unit ->
  instance_market_options_request

val make_license_configuration_request :
  ?license_configuration_arn:ar_n -> unit -> license_configuration_request

val make_instance_maintenance_options_request :
  ?auto_recovery:auto_recovery_enum -> unit -> instance_maintenance_options_request

val make_instance_metadata_options_request :
  ?instance_metadata_tags:instance_metadata_tags_enum ->
  ?http_tokens:http_tokens_enum ->
  ?http_put_response_hop_limit:http_put_response_hop_limit ->
  ?http_protocol_ipv6:http_protocol_ipv6_enum ->
  ?http_endpoint:http_endpoint_enum ->
  unit ->
  instance_metadata_options_request

val make_instance_network_performance_options_request :
  ?bandwidth_weighting:bandwidth_weighting_enum ->
  unit ->
  instance_network_performance_options_request

val make_managed_instance_request :
  ?user_data:user_data ->
  ?tag_specifications:tag_specifications ->
  ?subnet_id:subnet_id ->
  ?security_groups:security_group_names ->
  ?security_group_ids:security_group_ids ->
  ?ramdisk_id:string128 ->
  ?private_ip_address:ipv4_address ->
  ?private_dns_name_options:private_dns_name_options_request ->
  ?placement:placement ->
  ?network_performance_options:instance_network_performance_options_request ->
  ?network_interfaces:network_interfaces ->
  ?monitoring:run_instances_monitoring_enabled ->
  ?metadata_options:instance_metadata_options_request ->
  ?maintenance_options:instance_maintenance_options_request ->
  ?license_specifications:license_specifications ->
  ?key_name:string64 ->
  ?kernel_id:string128 ->
  ?ipv6_address_count:non_negative_integer ->
  ?ipv6_addresses:ipv6_addresses ->
  ?instance_type:instance_type ->
  ?instance_market_options:instance_market_options_request ->
  ?image_id:image_id ->
  ?iam_instance_profile:iam_instance_profile_specification ->
  ?hibernation_options:hibernation_options_request ->
  ?enclave_options:enclave_options_request ->
  ?enable_primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?ebs_optimized:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?disable_api_stop:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?credit_specification:credit_specification_request ->
  ?cpu_options:cpu_options_request ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?block_device_mappings:block_device_mappings ->
  unit ->
  managed_instance_request

val make_list_workspace_instances_response :
  ?next_token:next_token ->
  workspace_instances:workspace_instances ->
  unit ->
  list_workspace_instances_response

val make_list_workspace_instances_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?provision_states:provision_states ->
  unit ->
  list_workspace_instances_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  workspace_instance_id:workspace_instance_id -> unit -> list_tags_for_resource_request

val make_list_regions_response :
  ?next_token:next_token -> regions:region_list -> unit -> list_regions_response

val make_list_regions_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_regions_request

val make_instance_type_info :
  ?supported_instance_configurations:supported_instance_configurations ->
  ?instance_type:instance_type ->
  unit ->
  instance_type_info

val make_list_instance_types_response :
  ?next_token:next_token -> instance_types:instance_types -> unit -> list_instance_types_response

val make_instance_configuration_filter :
  tenancy:instance_configuration_tenancy_enum ->
  platform_type:platform_type_enum ->
  billing_mode:billing_mode ->
  unit ->
  instance_configuration_filter

val make_list_instance_types_request :
  ?instance_configuration_filter:instance_configuration_filter ->
  ?next_token:next_token ->
  ?max_results:list_instance_types_max_results ->
  unit ->
  list_instance_types_request

val make_ec2_instance_error :
  ?ec2_error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ec2_exception_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ec2_error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ec2_instance_error

val make_billing_configuration : billing_mode:billing_mode -> unit -> billing_configuration

val make_get_workspace_instance_response :
  ?billing_configuration:billing_configuration ->
  ?ec2_managed_instance:ec2_managed_instance ->
  ?workspace_instance_id:workspace_instance_id ->
  ?provision_state:provision_state_enum ->
  ?ec2_instance_errors:ec2_instance_errors ->
  ?workspace_instance_errors:workspace_instance_errors ->
  unit ->
  get_workspace_instance_response

val make_get_workspace_instance_request :
  workspace_instance_id:workspace_instance_id -> unit -> get_workspace_instance_request

val make_disassociate_volume_response : unit -> unit

val make_disassociate_volume_request :
  ?disassociate_mode:disassociate_mode_enum ->
  ?device:device_name ->
  volume_id:volume_id ->
  workspace_instance_id:workspace_instance_id ->
  unit ->
  disassociate_volume_request

val make_delete_workspace_instance_response : unit -> unit

val make_delete_workspace_instance_request :
  workspace_instance_id:workspace_instance_id -> unit -> delete_workspace_instance_request

val make_delete_volume_response : unit -> unit
val make_delete_volume_request : volume_id:volume_id -> unit -> delete_volume_request

val make_create_workspace_instance_response :
  ?workspace_instance_id:workspace_instance_id -> unit -> create_workspace_instance_response

val make_create_workspace_instance_request :
  ?billing_configuration:billing_configuration ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  managed_instance:managed_instance_request ->
  unit ->
  create_workspace_instance_request

val make_create_volume_response : ?volume_id:volume_id -> unit -> create_volume_response

val make_create_volume_request :
  ?volume_type:volume_type_enum ->
  ?throughput:non_negative_integer ->
  ?tag_specifications:tag_specifications ->
  ?snapshot_id:snapshot_id ->
  ?size_in_g_b:non_negative_integer ->
  ?kms_key_id:kms_key_id ->
  ?iops:non_negative_integer ->
  ?encrypted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  availability_zone:string64 ->
  unit ->
  create_volume_request

val make_associate_volume_response : unit -> unit

val make_associate_volume_request :
  device:device_name ->
  volume_id:volume_id ->
  workspace_instance_id:workspace_instance_id ->
  unit ->
  associate_volume_request
