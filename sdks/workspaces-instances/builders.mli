open Types

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_associate_volume_response : unit -> unit

val make_associate_volume_request :
  workspace_instance_id:workspace_instance_id ->
  volume_id:volume_id ->
  device:device_name ->
  unit ->
  associate_volume_request

val make_billing_configuration : billing_mode:billing_mode -> unit -> billing_configuration

val make_ebs_block_device :
  ?volume_type:volume_type_enum ->
  ?encrypted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?kms_key_id:kms_key_id ->
  ?iops:non_negative_integer ->
  ?throughput:non_negative_integer ->
  ?volume_size:non_negative_integer ->
  unit ->
  ebs_block_device

val make_block_device_mapping_request :
  ?device_name:device_name ->
  ?ebs:ebs_block_device ->
  ?no_device:device_name ->
  ?virtual_name:virtual_name ->
  unit ->
  block_device_mapping_request

val make_capacity_reservation_target :
  ?capacity_reservation_id:string128 ->
  ?capacity_reservation_resource_group_arn:ar_n ->
  unit ->
  capacity_reservation_target

val make_capacity_reservation_specification :
  ?capacity_reservation_preference:capacity_reservation_preference_enum ->
  ?capacity_reservation_target:capacity_reservation_target ->
  unit ->
  capacity_reservation_specification

val make_connection_tracking_specification_request :
  ?tcp_established_timeout:non_negative_integer ->
  ?udp_stream_timeout:non_negative_integer ->
  ?udp_timeout:non_negative_integer ->
  unit ->
  connection_tracking_specification_request

val make_cpu_options_request :
  ?amd_sev_snp:amd_sev_snp_enum ->
  ?core_count:non_negative_integer ->
  ?threads_per_core:non_negative_integer ->
  unit ->
  cpu_options_request

val make_create_volume_response : ?volume_id:volume_id -> unit -> create_volume_response
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_tag_specification :
  ?resource_type:resource_type_enum -> ?tags:tag_list -> unit -> tag_specification

val make_create_volume_request :
  ?client_token:client_token ->
  ?encrypted:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?iops:non_negative_integer ->
  ?kms_key_id:kms_key_id ->
  ?size_in_g_b:non_negative_integer ->
  ?snapshot_id:snapshot_id ->
  ?tag_specifications:tag_specifications ->
  ?throughput:non_negative_integer ->
  ?volume_type:volume_type_enum ->
  availability_zone:string64 ->
  unit ->
  create_volume_request

val make_create_workspace_instance_response :
  ?workspace_instance_id:workspace_instance_id -> unit -> create_workspace_instance_response

val make_private_dns_name_options_request :
  ?hostname_type:hostname_type_enum ->
  ?enable_resource_name_dns_a_record:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enable_resource_name_dns_aaaa_record:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  private_dns_name_options_request

val make_placement :
  ?affinity:string64 ->
  ?availability_zone:availability_zone ->
  ?group_id:placement_group_id ->
  ?group_name:string64 ->
  ?host_id:host_id ->
  ?host_resource_group_arn:ar_n ->
  ?partition_number:non_negative_integer ->
  ?tenancy:tenancy_enum ->
  unit ->
  placement

val make_instance_network_performance_options_request :
  ?bandwidth_weighting:bandwidth_weighting_enum ->
  unit ->
  instance_network_performance_options_request

val make_private_ip_address_specification :
  ?primary:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?private_ip_address:ipv4_address ->
  unit ->
  private_ip_address_specification

val make_ipv6_prefix_specification_request :
  ?ipv6_prefix:ipv6_prefix -> unit -> ipv6_prefix_specification_request

val make_instance_ipv6_address :
  ?ipv6_address:ipv6_address ->
  ?is_primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  instance_ipv6_address

val make_ipv4_prefix_specification_request :
  ?ipv4_prefix:ipv4_prefix -> unit -> ipv4_prefix_specification_request

val make_ena_srd_udp_specification_request :
  ?ena_srd_udp_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  ena_srd_udp_specification_request

val make_ena_srd_specification_request :
  ?ena_srd_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?ena_srd_udp_specification:ena_srd_udp_specification_request ->
  unit ->
  ena_srd_specification_request

val make_instance_network_interface_specification :
  ?associate_carrier_ip_address:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?associate_public_ip_address:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?connection_tracking_specification:connection_tracking_specification_request ->
  ?description:description ->
  ?device_index:non_negative_integer ->
  ?ena_srd_specification:ena_srd_specification_request ->
  ?interface_type:interface_type_enum ->
  ?ipv4_prefixes:ipv4_prefixes ->
  ?ipv4_prefix_count:non_negative_integer ->
  ?ipv6_address_count:non_negative_integer ->
  ?ipv6_addresses:ipv6_addresses ->
  ?ipv6_prefixes:ipv6_prefixes ->
  ?ipv6_prefix_count:non_negative_integer ->
  ?network_card_index:non_negative_integer ->
  ?network_interface_id:network_interface_id ->
  ?primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?private_ip_address:ipv4_address ->
  ?private_ip_addresses:private_ip_addresses ->
  ?secondary_private_ip_address_count:non_negative_integer ->
  ?groups:security_group_ids ->
  ?subnet_id:subnet_id ->
  unit ->
  instance_network_interface_specification

val make_run_instances_monitoring_enabled :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> run_instances_monitoring_enabled

val make_instance_metadata_options_request :
  ?http_endpoint:http_endpoint_enum ->
  ?http_protocol_ipv6:http_protocol_ipv6_enum ->
  ?http_put_response_hop_limit:http_put_response_hop_limit ->
  ?http_tokens:http_tokens_enum ->
  ?instance_metadata_tags:instance_metadata_tags_enum ->
  unit ->
  instance_metadata_options_request

val make_instance_maintenance_options_request :
  ?auto_recovery:auto_recovery_enum -> unit -> instance_maintenance_options_request

val make_license_configuration_request :
  ?license_configuration_arn:ar_n -> unit -> license_configuration_request

val make_spot_market_options :
  ?block_duration_minutes:non_negative_integer ->
  ?instance_interruption_behavior:instance_interruption_behavior_enum ->
  ?max_price:string64 ->
  ?spot_instance_type:spot_instance_type_enum ->
  ?valid_until_utc:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  spot_market_options

val make_instance_market_options_request :
  ?market_type:market_type_enum ->
  ?spot_options:spot_market_options ->
  unit ->
  instance_market_options_request

val make_iam_instance_profile_specification :
  ?arn:ar_n -> ?name:string64 -> unit -> iam_instance_profile_specification

val make_hibernation_options_request :
  ?configured:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> hibernation_options_request

val make_enclave_options_request :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> enclave_options_request

val make_credit_specification_request :
  ?cpu_credits:cpu_credits_enum -> unit -> credit_specification_request

val make_managed_instance_request :
  ?block_device_mappings:block_device_mappings ->
  ?capacity_reservation_specification:capacity_reservation_specification ->
  ?cpu_options:cpu_options_request ->
  ?credit_specification:credit_specification_request ->
  ?disable_api_stop:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?ebs_optimized:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enable_primary_ipv6:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enclave_options:enclave_options_request ->
  ?hibernation_options:hibernation_options_request ->
  ?iam_instance_profile:iam_instance_profile_specification ->
  ?image_id:image_id ->
  ?instance_market_options:instance_market_options_request ->
  ?instance_type:instance_type ->
  ?ipv6_addresses:ipv6_addresses ->
  ?ipv6_address_count:non_negative_integer ->
  ?kernel_id:string128 ->
  ?key_name:string64 ->
  ?license_specifications:license_specifications ->
  ?maintenance_options:instance_maintenance_options_request ->
  ?metadata_options:instance_metadata_options_request ->
  ?monitoring:run_instances_monitoring_enabled ->
  ?network_interfaces:network_interfaces ->
  ?network_performance_options:instance_network_performance_options_request ->
  ?placement:placement ->
  ?private_dns_name_options:private_dns_name_options_request ->
  ?private_ip_address:ipv4_address ->
  ?ramdisk_id:string128 ->
  ?security_group_ids:security_group_ids ->
  ?security_groups:security_group_names ->
  ?subnet_id:subnet_id ->
  ?tag_specifications:tag_specifications ->
  ?user_data:user_data ->
  unit ->
  managed_instance_request

val make_create_workspace_instance_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?billing_configuration:billing_configuration ->
  managed_instance:managed_instance_request ->
  unit ->
  create_workspace_instance_request

val make_delete_volume_response : unit -> unit
val make_delete_volume_request : volume_id:volume_id -> unit -> delete_volume_request
val make_delete_workspace_instance_response : unit -> unit

val make_delete_workspace_instance_request :
  workspace_instance_id:workspace_instance_id -> unit -> delete_workspace_instance_request

val make_disassociate_volume_response : unit -> unit

val make_disassociate_volume_request :
  ?device:device_name ->
  ?disassociate_mode:disassociate_mode_enum ->
  workspace_instance_id:workspace_instance_id ->
  volume_id:volume_id ->
  unit ->
  disassociate_volume_request

val make_ec2_instance_error :
  ?ec2_error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ec2_exception_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ec2_error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ec2_instance_error

val make_ec2_managed_instance :
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> ec2_managed_instance

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  workspace_instance_id:workspace_instance_id ->
  tag_keys:tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  workspace_instance_id:workspace_instance_id -> tags:tag_list -> unit -> tag_resource_request

val make_workspace_instance :
  ?provision_state:provision_state_enum ->
  ?workspace_instance_id:workspace_instance_id ->
  ?ec2_managed_instance:ec2_managed_instance ->
  unit ->
  workspace_instance

val make_list_workspace_instances_response :
  ?next_token:next_token ->
  workspace_instances:workspace_instances ->
  unit ->
  list_workspace_instances_response

val make_list_workspace_instances_request :
  ?provision_states:provision_states ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_workspace_instances_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  workspace_instance_id:workspace_instance_id -> unit -> list_tags_for_resource_request

val make_region : ?region_name:region_name -> unit -> region

val make_list_regions_response :
  ?next_token:next_token -> regions:region_list -> unit -> list_regions_response

val make_list_regions_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_regions_request

val make_supported_instance_configuration :
  ?billing_mode:billing_mode ->
  ?platform_type:platform_type_enum ->
  ?tenancy:instance_configuration_tenancy_enum ->
  unit ->
  supported_instance_configuration

val make_instance_type_info :
  ?instance_type:instance_type ->
  ?supported_instance_configurations:supported_instance_configurations ->
  unit ->
  instance_type_info

val make_list_instance_types_response :
  ?next_token:next_token -> instance_types:instance_types -> unit -> list_instance_types_response

val make_instance_configuration_filter :
  billing_mode:billing_mode ->
  platform_type:platform_type_enum ->
  tenancy:instance_configuration_tenancy_enum ->
  unit ->
  instance_configuration_filter

val make_list_instance_types_request :
  ?max_results:list_instance_types_max_results ->
  ?next_token:next_token ->
  ?instance_configuration_filter:instance_configuration_filter ->
  unit ->
  list_instance_types_request

val make_workspace_instance_error :
  ?error_code:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  workspace_instance_error

val make_get_workspace_instance_response :
  ?workspace_instance_errors:workspace_instance_errors ->
  ?ec2_instance_errors:ec2_instance_errors ->
  ?provision_state:provision_state_enum ->
  ?workspace_instance_id:workspace_instance_id ->
  ?ec2_managed_instance:ec2_managed_instance ->
  ?billing_configuration:billing_configuration ->
  unit ->
  get_workspace_instance_response

val make_get_workspace_instance_request :
  workspace_instance_id:workspace_instance_id -> unit -> get_workspace_instance_request
