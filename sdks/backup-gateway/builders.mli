open Types
val make_vmware_to_aws_tag_mapping :
  aws_tag_value:tag_value ->
    aws_tag_key:tag_key ->
      vmware_tag_name:vmware_tag_name ->
        vmware_category:vmware_category -> unit -> vmware_to_aws_tag_mapping
val make_vmware_tag :
  ?vmware_tag_description:string_ ->
    ?vmware_tag_name:vmware_tag_name ->
      ?vmware_category:vmware_category -> unit -> vmware_tag
val make_virtual_machine :
  ?last_backup_date:time ->
    ?resource_arn:resource_arn ->
      ?path:path ->
        ?name:name ->
          ?hypervisor_id:string_ ->
            ?host_name:name -> unit -> virtual_machine
val make_virtual_machine_details :
  ?vmware_tags:vmware_tags ->
    ?last_backup_date:time ->
      ?resource_arn:resource_arn ->
        ?path:path ->
          ?name:name ->
            ?hypervisor_id:string_ ->
              ?host_name:name -> unit -> virtual_machine_details
val make_update_hypervisor_output :
  ?hypervisor_arn:server_arn -> unit -> update_hypervisor_output
val make_update_hypervisor_input :
  ?log_group_arn:log_group_arn ->
    ?name:name ->
      ?password:password ->
        ?username:username ->
          ?host:host ->
            hypervisor_arn:server_arn -> unit -> update_hypervisor_input
val make_update_gateway_software_now_output :
  ?gateway_arn:gateway_arn -> unit -> update_gateway_software_now_output
val make_update_gateway_software_now_input :
  gateway_arn:gateway_arn -> unit -> update_gateway_software_now_input
val make_update_gateway_information_output :
  ?gateway_arn:gateway_arn -> unit -> update_gateway_information_output
val make_update_gateway_information_input :
  ?gateway_display_name:name ->
    gateway_arn:gateway_arn -> unit -> update_gateway_information_input
val make_untag_resource_output :
  ?resource_ar_n:resource_arn -> unit -> untag_resource_output
val make_untag_resource_input :
  tag_keys:tag_keys ->
    resource_ar_n:resource_arn -> unit -> untag_resource_input
val make_test_hypervisor_configuration_output : unit -> unit
val make_test_hypervisor_configuration_input :
  ?password:password ->
    ?username:username ->
      host:host ->
        gateway_arn:gateway_arn ->
          unit -> test_hypervisor_configuration_input
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_output :
  ?resource_ar_n:resource_arn -> unit -> tag_resource_output
val make_tag_resource_input :
  tags:tags -> resource_ar_n:resource_arn -> unit -> tag_resource_input
val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:server_arn ->
    unit -> start_virtual_machines_metadata_sync_output
val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:server_arn ->
    unit -> start_virtual_machines_metadata_sync_input
val make_put_maintenance_start_time_output :
  ?gateway_arn:gateway_arn -> unit -> put_maintenance_start_time_output
val make_put_maintenance_start_time_input :
  ?day_of_month:day_of_month ->
    ?day_of_week:day_of_week ->
      minute_of_hour:minute_of_hour ->
        hour_of_day:hour_of_day ->
          gateway_arn:gateway_arn -> unit -> put_maintenance_start_time_input
val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:server_arn ->
    unit -> put_hypervisor_property_mappings_output
val make_put_hypervisor_property_mappings_input :
  iam_role_arn:iam_role_arn ->
    vmware_to_aws_tag_mappings:vmware_to_aws_tag_mappings ->
      hypervisor_arn:server_arn ->
        unit -> put_hypervisor_property_mappings_input
val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:gateway_arn ->
    unit -> put_bandwidth_rate_limit_schedule_output
val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:average_upload_rate_limit ->
    days_of_week:days_of_week ->
      end_minute_of_hour:minute_of_hour ->
        start_minute_of_hour:minute_of_hour ->
          end_hour_of_day:hour_of_day ->
            start_hour_of_day:hour_of_day ->
              unit -> bandwidth_rate_limit_interval
val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
    gateway_arn:gateway_arn ->
      unit -> put_bandwidth_rate_limit_schedule_input
val make_maintenance_start_time :
  ?day_of_week:day_of_week ->
    ?day_of_month:day_of_month ->
      minute_of_hour:minute_of_hour ->
        hour_of_day:hour_of_day -> unit -> maintenance_start_time
val make_list_virtual_machines_output :
  ?next_token:next_token ->
    ?virtual_machines:virtual_machines ->
      unit -> list_virtual_machines_output
val make_list_virtual_machines_input :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?hypervisor_arn:server_arn -> unit -> list_virtual_machines_input
val make_list_tags_for_resource_output :
  ?tags:tags ->
    ?resource_arn:resource_arn -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_input
val make_hypervisor :
  ?state:hypervisor_state ->
    ?name:name ->
      ?kms_key_arn:kms_key_arn ->
        ?hypervisor_arn:server_arn -> ?host:host -> unit -> hypervisor
val make_list_hypervisors_output :
  ?next_token:next_token ->
    ?hypervisors:hypervisors -> unit -> list_hypervisors_output
val make_list_hypervisors_input :
  ?next_token:next_token ->
    ?max_results:max_results -> unit -> list_hypervisors_input
val make_gateway :
  ?last_seen_time:time ->
    ?hypervisor_id:hypervisor_id ->
      ?gateway_type:gateway_type ->
        ?gateway_display_name:name ->
          ?gateway_arn:gateway_arn -> unit -> gateway
val make_list_gateways_output :
  ?next_token:next_token ->
    ?gateways:gateways -> unit -> list_gateways_output
val make_list_gateways_input :
  ?next_token:next_token ->
    ?max_results:max_results -> unit -> list_gateways_input
val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:server_arn ->
    unit -> import_hypervisor_configuration_output
val make_import_hypervisor_configuration_input :
  ?tags:tags ->
    ?kms_key_arn:kms_key_arn ->
      ?password:password ->
        ?username:username ->
          host:host ->
            name:name -> unit -> import_hypervisor_configuration_input
val make_hypervisor_details :
  ?latest_metadata_sync_status:sync_metadata_status ->
    ?latest_metadata_sync_status_message:string_ ->
      ?last_successful_metadata_sync_time:time ->
        ?state:hypervisor_state ->
          ?log_group_arn:log_group_arn ->
            ?name:name ->
              ?kms_key_arn:kms_key_arn ->
                ?hypervisor_arn:server_arn ->
                  ?host:host -> unit -> hypervisor_details
val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details ->
    unit -> get_virtual_machine_output
val make_get_virtual_machine_input :
  resource_arn:resource_arn -> unit -> get_virtual_machine_input
val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:iam_role_arn ->
    ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mappings ->
      ?hypervisor_arn:server_arn ->
        unit -> get_hypervisor_property_mappings_output
val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:server_arn -> unit -> get_hypervisor_property_mappings_input
val make_get_hypervisor_output :
  ?hypervisor:hypervisor_details -> unit -> get_hypervisor_output
val make_get_hypervisor_input :
  hypervisor_arn:server_arn -> unit -> get_hypervisor_input
val make_gateway_details :
  ?vpc_endpoint:vpc_endpoint ->
    ?next_update_availability_time:time ->
      ?maintenance_start_time:maintenance_start_time ->
        ?last_seen_time:time ->
          ?hypervisor_id:hypervisor_id ->
            ?gateway_type:gateway_type ->
              ?gateway_display_name:name ->
                ?gateway_arn:gateway_arn -> unit -> gateway_details
val make_get_gateway_output :
  ?gateway:gateway_details -> unit -> get_gateway_output
val make_get_gateway_input :
  gateway_arn:gateway_arn -> unit -> get_gateway_input
val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_intervals ->
    ?gateway_arn:gateway_arn ->
      unit -> get_bandwidth_rate_limit_schedule_output
val make_get_bandwidth_rate_limit_schedule_input :
  gateway_arn:gateway_arn -> unit -> get_bandwidth_rate_limit_schedule_input
val make_disassociate_gateway_from_server_output :
  ?gateway_arn:gateway_arn -> unit -> disassociate_gateway_from_server_output
val make_disassociate_gateway_from_server_input :
  gateway_arn:gateway_arn -> unit -> disassociate_gateway_from_server_input
val make_delete_hypervisor_output :
  ?hypervisor_arn:server_arn -> unit -> delete_hypervisor_output
val make_delete_hypervisor_input :
  hypervisor_arn:server_arn -> unit -> delete_hypervisor_input
val make_delete_gateway_output :
  ?gateway_arn:gateway_arn -> unit -> delete_gateway_output
val make_delete_gateway_input :
  gateway_arn:gateway_arn -> unit -> delete_gateway_input
val make_create_gateway_output :
  ?gateway_arn:gateway_arn -> unit -> create_gateway_output
val make_create_gateway_input :
  ?tags:tags ->
    gateway_type:gateway_type ->
      gateway_display_name:name ->
        activation_key:activation_key -> unit -> create_gateway_input
val make_associate_gateway_to_server_output :
  ?gateway_arn:gateway_arn -> unit -> associate_gateway_to_server_output
val make_associate_gateway_to_server_input :
  server_arn:server_arn ->
    gateway_arn:gateway_arn -> unit -> associate_gateway_to_server_input