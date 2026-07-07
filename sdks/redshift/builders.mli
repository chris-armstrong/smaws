open Types

val make_vpc_security_group_membership :
  ?status:string_ -> ?vpc_security_group_id:string_ -> unit -> vpc_security_group_membership

val make_network_interface :
  ?ipv6_address:string_ ->
  ?availability_zone:string_ ->
  ?private_ip_address:string_ ->
  ?subnet_id:string_ ->
  ?network_interface_id:string_ ->
  unit ->
  network_interface

val make_vpc_endpoint :
  ?network_interfaces:network_interface_list ->
  ?vpc_id:string_ ->
  ?vpc_endpoint_id:string_ ->
  unit ->
  vpc_endpoint

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag

val make_usage_limit :
  ?tags:tag_list ->
  ?breach_action:usage_limit_breach_action ->
  ?period:usage_limit_period ->
  ?amount:long ->
  ?limit_type:usage_limit_limit_type ->
  ?feature_type:usage_limit_feature_type ->
  ?cluster_identifier:string_ ->
  ?usage_limit_id:string_ ->
  unit ->
  usage_limit

val make_usage_limit_list :
  ?marker:string_ -> ?usage_limits:usage_limits -> unit -> usage_limit_list

val make_supported_operation : ?operation_name:string_ -> unit -> supported_operation

val make_update_target :
  ?supported_operations:supported_operation_list ->
  ?database_version:string_ ->
  ?maintenance_track_name:string_ ->
  unit ->
  update_target

val make_update_partner_status_input_message :
  ?status_message:partner_integration_status_message ->
  status:partner_integration_status ->
  partner_name:partner_integration_partner_name ->
  database_name:partner_integration_database_name ->
  cluster_identifier:partner_integration_cluster_identifier ->
  account_id:partner_integration_account_id ->
  unit ->
  update_partner_status_input_message

val make_partner_integration_output_message :
  ?partner_name:partner_integration_partner_name ->
  ?database_name:partner_integration_database_name ->
  unit ->
  partner_integration_output_message

val make_maintenance_track :
  ?update_targets:eligible_tracks_to_update_list ->
  ?database_version:string_ ->
  ?maintenance_track_name:string_ ->
  unit ->
  maintenance_track

val make_track_list_message :
  ?marker:string_ -> ?maintenance_tracks:track_list -> unit -> track_list_message

val make_tagged_resource :
  ?resource_type:string_ -> ?resource_name:string_ -> ?tag:tag -> unit -> tagged_resource

val make_tagged_resource_list_message :
  ?marker:string_ -> ?tagged_resources:tagged_resource_list -> unit -> tagged_resource_list_message

val make_table_restore_status :
  ?new_table_name:string_ ->
  ?target_schema_name:string_ ->
  ?target_database_name:string_ ->
  ?source_table_name:string_ ->
  ?source_schema_name:string_ ->
  ?source_database_name:string_ ->
  ?snapshot_identifier:string_ ->
  ?cluster_identifier:string_ ->
  ?total_data_in_mega_bytes:long_optional ->
  ?progress_in_mega_bytes:long_optional ->
  ?request_time:t_stamp ->
  ?message:string_ ->
  ?status:table_restore_status_type ->
  ?table_restore_request_id:string_ ->
  unit ->
  table_restore_status

val make_table_restore_status_message :
  ?marker:string_ ->
  ?table_restore_status_details:table_restore_status_list ->
  unit ->
  table_restore_status_message

val make_supported_platform : ?name:string_ -> unit -> supported_platform

val make_availability_zone :
  ?supported_platforms:supported_platforms_list -> ?name:string_ -> unit -> availability_zone

val make_subnet :
  ?subnet_status:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_identifier:string_ ->
  unit ->
  subnet

val make_snapshot_sorting_entity :
  ?sort_order:sort_by_order ->
  attribute:snapshot_attribute_to_sort_by ->
  unit ->
  snapshot_sorting_entity

val make_cluster_associated_to_schedule :
  ?schedule_association_state:schedule_state ->
  ?cluster_identifier:string_ ->
  unit ->
  cluster_associated_to_schedule

val make_snapshot_schedule :
  ?associated_clusters:associated_cluster_list ->
  ?associated_cluster_count:integer_optional ->
  ?next_invocations:scheduled_snapshot_time_list ->
  ?tags:tag_list ->
  ?schedule_description:string_ ->
  ?schedule_identifier:string_ ->
  ?schedule_definitions:schedule_definition_list ->
  unit ->
  snapshot_schedule

val make_account_with_restore_access :
  ?account_alias:string_ -> ?account_id:string_ -> unit -> account_with_restore_access

val make_snapshot :
  ?snapshot_arn:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?master_password_secret_arn:string_ ->
  ?snapshot_retention_start_time:t_stamp ->
  ?manual_snapshot_remaining_days:integer_optional ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?maintenance_track_name:string_ ->
  ?enhanced_vpc_routing:boolean_ ->
  ?restorable_node_types:restorable_node_type_list ->
  ?tags:tag_list ->
  ?source_region:string_ ->
  ?elapsed_time_in_seconds:long ->
  ?estimated_seconds_to_completion:long ->
  ?current_backup_rate_in_mega_bytes_per_second:double ->
  ?backup_progress_in_mega_bytes:double ->
  ?actual_incremental_backup_size_in_mega_bytes:double ->
  ?total_backup_size_in_mega_bytes:double ->
  ?owner_account:string_ ->
  ?accounts_with_restore_access:accounts_with_restore_access_list ->
  ?encrypted_with_hs_m:boolean_ ->
  ?kms_key_id:string_ ->
  ?encrypted:boolean_ ->
  ?vpc_id:string_ ->
  ?db_name:string_ ->
  ?number_of_nodes:integer ->
  ?node_type:string_ ->
  ?snapshot_type:string_ ->
  ?engine_full_version:string_ ->
  ?cluster_version:string_ ->
  ?master_username:string_ ->
  ?cluster_create_time:t_stamp ->
  ?availability_zone:string_ ->
  ?port:integer ->
  ?status:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  unit ->
  snapshot

val make_snapshot_message : ?snapshots:snapshot_list -> ?marker:string_ -> unit -> snapshot_message

val make_snapshot_error_message :
  ?failure_reason:string_ ->
  ?failure_code:string_ ->
  ?snapshot_cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  unit ->
  snapshot_error_message

val make_snapshot_copy_grant :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?snapshot_copy_grant_name:string_ ->
  unit ->
  snapshot_copy_grant

val make_snapshot_copy_grant_message :
  ?snapshot_copy_grants:snapshot_copy_grant_list ->
  ?marker:string_ ->
  unit ->
  snapshot_copy_grant_message

val make_lake_formation_query : authorization:service_authorization -> unit -> lake_formation_query
val make_read_write_access : authorization:service_authorization -> unit -> read_write_access
val make_connect : authorization:service_authorization -> unit -> connect

val make_serverless_identifier :
  workgroup_identifier:string_ -> namespace_identifier:string_ -> unit -> serverless_identifier

val make_cluster_node :
  ?public_ip_address:string_ ->
  ?private_ip_address:string_ ->
  ?node_role:string_ ->
  unit ->
  cluster_node

val make_secondary_cluster_info :
  ?cluster_nodes:cluster_nodes_list -> ?availability_zone:string_ -> unit -> secondary_cluster_info

val make_resize_cluster_message :
  ?target_reserved_node_offering_id:string_ ->
  ?reserved_node_id:string_ ->
  ?classic:boolean_optional ->
  ?number_of_nodes:integer_optional ->
  ?node_type:string_ ->
  ?cluster_type:string_ ->
  cluster_identifier:string_ ->
  unit ->
  resize_cluster_message

val make_pause_cluster_message : cluster_identifier:string_ -> unit -> pause_cluster_message
val make_resume_cluster_message : cluster_identifier:string_ -> unit -> resume_cluster_message

val make_scheduled_action_type :
  ?resume_cluster:resume_cluster_message ->
  ?pause_cluster:pause_cluster_message ->
  ?resize_cluster:resize_cluster_message ->
  unit ->
  scheduled_action_type

val make_scheduled_action :
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?next_invocations:scheduled_action_time_list ->
  ?state:scheduled_action_state ->
  ?scheduled_action_description:string_ ->
  ?iam_role:string_ ->
  ?schedule:string_ ->
  ?target_action:scheduled_action_type ->
  ?scheduled_action_name:string_ ->
  unit ->
  scheduled_action

val make_scheduled_actions_message :
  ?scheduled_actions:scheduled_action_list -> ?marker:string_ -> unit -> scheduled_actions_message

val make_scheduled_action_filter :
  values:value_string_list -> name:scheduled_action_filter_name -> unit -> scheduled_action_filter

val make_endpoint :
  ?vpc_endpoints:vpc_endpoints_list -> ?port:integer -> ?address:string_ -> unit -> endpoint

val make_cluster_security_group_membership :
  ?status:string_ ->
  ?cluster_security_group_name:string_ ->
  unit ->
  cluster_security_group_membership

val make_cluster_parameter_status :
  ?parameter_apply_error_description:string_ ->
  ?parameter_apply_status:string_ ->
  ?parameter_name:string_ ->
  unit ->
  cluster_parameter_status

val make_cluster_parameter_group_status :
  ?cluster_parameter_status_list:cluster_parameter_status_list ->
  ?parameter_apply_status:string_ ->
  ?parameter_group_name:string_ ->
  unit ->
  cluster_parameter_group_status

val make_pending_modified_values :
  ?encryption_type:string_ ->
  ?maintenance_track_name:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?cluster_identifier:string_ ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?cluster_version:string_ ->
  ?cluster_type:string_ ->
  ?number_of_nodes:integer_optional ->
  ?node_type:string_ ->
  ?master_user_password:sensitive_string ->
  unit ->
  pending_modified_values

val make_restore_status :
  ?estimated_time_to_completion_in_seconds:long ->
  ?elapsed_time_in_seconds:long ->
  ?progress_in_mega_bytes:long ->
  ?snapshot_size_in_mega_bytes:long ->
  ?current_restore_rate_in_mega_bytes_per_second:double ->
  ?status:string_ ->
  unit ->
  restore_status

val make_data_transfer_progress :
  ?elapsed_time_in_seconds:long_optional ->
  ?estimated_time_to_completion_in_seconds:long_optional ->
  ?data_transferred_in_mega_bytes:long ->
  ?total_data_in_mega_bytes:long ->
  ?current_rate_in_mega_bytes_per_second:double_optional ->
  ?status:string_ ->
  unit ->
  data_transfer_progress

val make_hsm_status :
  ?status:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  unit ->
  hsm_status

val make_cluster_snapshot_copy_status :
  ?snapshot_copy_grant_name:string_ ->
  ?manual_snapshot_retention_period:integer ->
  ?retention_period:long ->
  ?destination_region:string_ ->
  unit ->
  cluster_snapshot_copy_status

val make_elastic_ip_status : ?status:string_ -> ?elastic_ip:string_ -> unit -> elastic_ip_status

val make_cluster_iam_role :
  ?apply_status:string_ -> ?iam_role_arn:string_ -> unit -> cluster_iam_role

val make_deferred_maintenance_window :
  ?defer_maintenance_end_time:t_stamp ->
  ?defer_maintenance_start_time:t_stamp ->
  ?defer_maintenance_identifier:string_ ->
  unit ->
  deferred_maintenance_window

val make_resize_info : ?allow_cancel_resize:boolean_ -> ?resize_type:string_ -> unit -> resize_info

val make_aqua_configuration :
  ?aqua_configuration_status:aqua_configuration_status ->
  ?aqua_status:aqua_status ->
  unit ->
  aqua_configuration

val make_reserved_node_exchange_status :
  ?target_reserved_node_count:integer ->
  ?target_reserved_node_type:string_ ->
  ?target_reserved_node_offering_id:string_ ->
  ?source_reserved_node_count:integer ->
  ?source_reserved_node_type:string_ ->
  ?source_reserved_node_id:string_ ->
  ?request_time:t_stamp ->
  ?status:reserved_node_exchange_status_type ->
  ?reserved_node_exchange_request_id:string_ ->
  unit ->
  reserved_node_exchange_status

val make_cluster :
  ?extra_compute_for_automatic_optimization:string_ ->
  ?catalog_arn:string_ ->
  ?lakehouse_registration_status:string_ ->
  ?multi_az_secondary:secondary_cluster_info ->
  ?multi_a_z:string_ ->
  ?ip_address_type:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?master_password_secret_arn:string_ ->
  ?custom_domain_certificate_expiry_date:t_stamp ->
  ?custom_domain_certificate_arn:string_ ->
  ?custom_domain_name:string_ ->
  ?reserved_node_exchange_status:reserved_node_exchange_status ->
  ?default_iam_role_arn:string_ ->
  ?aqua_configuration:aqua_configuration ->
  ?total_storage_capacity_in_mega_bytes:long_optional ->
  ?cluster_namespace_arn:string_ ->
  ?availability_zone_relocation_status:string_ ->
  ?resize_info:resize_info ->
  ?next_maintenance_window_start_time:t_stamp ->
  ?expected_next_snapshot_schedule_time_status:string_ ->
  ?expected_next_snapshot_schedule_time:t_stamp ->
  ?snapshot_schedule_state:schedule_state ->
  ?snapshot_schedule_identifier:string_ ->
  ?deferred_maintenance_windows:deferred_maintenance_windows_list ->
  ?elastic_resize_number_of_node_options:string_ ->
  ?maintenance_track_name:string_ ->
  ?pending_actions:pending_actions_list ->
  ?iam_roles:cluster_iam_role_list ->
  ?enhanced_vpc_routing:boolean_ ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?cluster_revision_number:string_ ->
  ?elastic_ip_status:elastic_ip_status ->
  ?cluster_nodes:cluster_nodes_list ->
  ?cluster_public_key:string_ ->
  ?cluster_snapshot_copy_status:cluster_snapshot_copy_status ->
  ?hsm_status:hsm_status ->
  ?data_transfer_progress:data_transfer_progress ->
  ?restore_status:restore_status ->
  ?encrypted:boolean_ ->
  ?publicly_accessible:boolean_ ->
  ?number_of_nodes:integer ->
  ?allow_version_upgrade:boolean_ ->
  ?cluster_version:string_ ->
  ?pending_modified_values:pending_modified_values ->
  ?preferred_maintenance_window:string_ ->
  ?availability_zone:string_ ->
  ?vpc_id:string_ ->
  ?cluster_subnet_group_name:string_ ->
  ?cluster_parameter_groups:cluster_parameter_group_status_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?cluster_security_groups:cluster_security_group_membership_list ->
  ?manual_snapshot_retention_period:integer ->
  ?automated_snapshot_retention_period:integer ->
  ?cluster_create_time:t_stamp ->
  ?endpoint:endpoint ->
  ?db_name:string_ ->
  ?master_username:string_ ->
  ?modify_status:string_ ->
  ?cluster_availability_status:string_ ->
  ?cluster_status:string_ ->
  ?node_type:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  cluster

val make_rotate_encryption_key_message :
  cluster_identifier:string_ -> unit -> rotate_encryption_key_message

val make_revoke_snapshot_access_message :
  ?snapshot_cluster_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_identifier:string_ ->
  account_with_restore_access:string_ ->
  unit ->
  revoke_snapshot_access_message

val make_revoke_endpoint_access_message :
  ?force:boolean_ ->
  ?vpc_ids:vpc_identifier_list ->
  ?account:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  revoke_endpoint_access_message

val make_endpoint_authorization :
  ?endpoint_count:integer ->
  ?allowed_vp_cs:vpc_identifier_list ->
  ?allowed_all_vp_cs:boolean_ ->
  ?status:authorization_status ->
  ?cluster_status:string_ ->
  ?authorize_time:t_stamp ->
  ?cluster_identifier:string_ ->
  ?grantee:string_ ->
  ?grantor:string_ ->
  unit ->
  endpoint_authorization

val make_ec2_security_group :
  ?tags:tag_list ->
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?status:string_ ->
  unit ->
  ec2_security_group

val make_ip_range : ?tags:tag_list -> ?cidri_p:string_ -> ?status:string_ -> unit -> ip_range

val make_cluster_security_group :
  ?tags:tag_list ->
  ?ip_ranges:ip_range_list ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?description:string_ ->
  ?cluster_security_group_name:string_ ->
  unit ->
  cluster_security_group

val make_revoke_cluster_security_group_ingress_message :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?cidri_p:string_ ->
  cluster_security_group_name:string_ ->
  unit ->
  revoke_cluster_security_group_ingress_message

val make_revision_target :
  ?database_revision_release_date:t_stamp ->
  ?description:string_ ->
  ?database_revision:string_ ->
  unit ->
  revision_target

val make_restore_table_from_cluster_snapshot_message :
  ?enable_case_sensitive_identifier:boolean_optional ->
  ?target_schema_name:string_ ->
  ?target_database_name:string_ ->
  ?source_schema_name:string_ ->
  new_table_name:string_ ->
  source_table_name:string_ ->
  source_database_name:string_ ->
  snapshot_identifier:string_ ->
  cluster_identifier:string_ ->
  unit ->
  restore_table_from_cluster_snapshot_message

val make_restore_from_cluster_snapshot_message :
  ?redshift_idc_application_arn:string_ ->
  ?catalog_name:catalog_name_string ->
  ?multi_a_z:boolean_optional ->
  ?ip_address_type:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?manage_master_password:boolean_optional ->
  ?encrypted:boolean_optional ->
  ?target_reserved_node_offering_id:string_ ->
  ?reserved_node_id:string_ ->
  ?default_iam_role_arn:string_ ->
  ?aqua_configuration_status:aqua_configuration_status ->
  ?availability_zone_relocation:boolean_optional ->
  ?number_of_nodes:integer_optional ->
  ?snapshot_schedule_identifier:string_ ->
  ?maintenance_track_name:string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?additional_info:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?node_type:string_ ->
  ?kms_key_id:string_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?preferred_maintenance_window:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?cluster_parameter_group_name:string_ ->
  ?elastic_ip:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  ?owner_account:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?cluster_subnet_group_name:string_ ->
  ?allow_version_upgrade:boolean_optional ->
  ?availability_zone:string_ ->
  ?port:integer_optional ->
  ?snapshot_cluster_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_identifier:string_ ->
  cluster_identifier:string_ ->
  unit ->
  restore_from_cluster_snapshot_message

val make_resource_policy : ?policy:string_ -> ?resource_arn:string_ -> unit -> resource_policy

val make_resize_progress_message :
  ?data_transfer_progress_percent:double_optional ->
  ?target_encryption_type:string_ ->
  ?message:string_ ->
  ?resize_type:string_ ->
  ?estimated_time_to_completion_in_seconds:long_optional ->
  ?elapsed_time_in_seconds:long_optional ->
  ?progress_in_mega_bytes:long_optional ->
  ?total_resize_data_in_mega_bytes:long_optional ->
  ?avg_resize_rate_in_mega_bytes_per_second:double_optional ->
  ?import_tables_not_started:import_tables_not_started ->
  ?import_tables_in_progress:import_tables_in_progress ->
  ?import_tables_completed:import_tables_completed ->
  ?status:string_ ->
  ?target_cluster_type:string_ ->
  ?target_number_of_nodes:integer_optional ->
  ?target_node_type:string_ ->
  unit ->
  resize_progress_message

val make_parameter :
  ?minimum_engine_version:string_ ->
  ?is_modifiable:boolean_ ->
  ?apply_type:parameter_apply_type ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?parameter_value:string_ ->
  ?parameter_name:string_ ->
  unit ->
  parameter

val make_reset_cluster_parameter_group_message :
  ?parameters:parameters_list ->
  ?reset_all_parameters:boolean_ ->
  parameter_group_name:string_ ->
  unit ->
  reset_cluster_parameter_group_message

val make_cluster_parameter_group_name_message :
  ?parameter_group_status:string_ ->
  ?parameter_group_name:string_ ->
  unit ->
  cluster_parameter_group_name_message

val make_recurring_charge :
  ?recurring_charge_frequency:string_ -> ?recurring_charge_amount:double -> unit -> recurring_charge

val make_reserved_node :
  ?reserved_node_offering_type:reserved_node_offering_type ->
  ?recurring_charges:recurring_charge_list ->
  ?offering_type:string_ ->
  ?state:string_ ->
  ?node_count:integer ->
  ?currency_code:string_ ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?start_time:t_stamp ->
  ?node_type:string_ ->
  ?reserved_node_offering_id:string_ ->
  ?reserved_node_id:string_ ->
  unit ->
  reserved_node

val make_reserved_nodes_message :
  ?reserved_nodes:reserved_node_list -> ?marker:string_ -> unit -> reserved_nodes_message

val make_reserved_node_offering :
  ?reserved_node_offering_type:reserved_node_offering_type ->
  ?recurring_charges:recurring_charge_list ->
  ?offering_type:string_ ->
  ?currency_code:string_ ->
  ?usage_price:double ->
  ?fixed_price:double ->
  ?duration:integer ->
  ?node_type:string_ ->
  ?reserved_node_offering_id:string_ ->
  unit ->
  reserved_node_offering

val make_reserved_node_offerings_message :
  ?reserved_node_offerings:reserved_node_offering_list ->
  ?marker:string_ ->
  unit ->
  reserved_node_offerings_message

val make_reserved_node_configuration_option :
  ?target_reserved_node_offering:reserved_node_offering ->
  ?target_reserved_node_count:integer ->
  ?source_reserved_node:reserved_node ->
  unit ->
  reserved_node_configuration_option

val make_reject_data_share_message : data_share_arn:string_ -> unit -> reject_data_share_message

val make_data_share_association :
  ?consumer_accepted_writes:boolean_optional ->
  ?producer_allowed_writes:boolean_optional ->
  ?status_change_date:t_stamp ->
  ?created_date:t_stamp ->
  ?consumer_region:string_ ->
  ?status:data_share_status ->
  ?consumer_identifier:string_ ->
  unit ->
  data_share_association

val make_data_share :
  ?data_share_type:data_share_type ->
  ?managed_by:string_ ->
  ?data_share_associations:data_share_association_list ->
  ?allow_publicly_accessible_consumers:boolean_ ->
  ?producer_arn:string_ ->
  ?data_share_arn:string_ ->
  unit ->
  data_share

val make_register_namespace_output_message :
  ?status:namespace_registration_status -> unit -> register_namespace_output_message

val make_provisioned_identifier : cluster_identifier:string_ -> unit -> provisioned_identifier

val make_register_namespace_input_message :
  consumer_identifiers:consumer_identifier_list ->
  namespace_identifier:namespace_identifier_union ->
  unit ->
  register_namespace_input_message

val make_reference_link : ?link:string_ -> ?text:string_ -> unit -> reference_link
val make_reboot_cluster_message : cluster_identifier:string_ -> unit -> reboot_cluster_message

val make_put_resource_policy_message :
  policy:string_ -> resource_arn:string_ -> unit -> put_resource_policy_message

val make_purchase_reserved_node_offering_message :
  ?node_count:integer_optional ->
  reserved_node_offering_id:string_ ->
  unit ->
  purchase_reserved_node_offering_message

val make_modify_usage_limit_message :
  ?breach_action:usage_limit_breach_action ->
  ?amount:long_optional ->
  usage_limit_id:string_ ->
  unit ->
  modify_usage_limit_message

val make_modify_snapshot_schedule_message :
  schedule_definitions:schedule_definition_list ->
  schedule_identifier:string_ ->
  unit ->
  modify_snapshot_schedule_message

val make_modify_snapshot_copy_retention_period_message :
  ?manual:boolean_ ->
  retention_period:integer ->
  cluster_identifier:string_ ->
  unit ->
  modify_snapshot_copy_retention_period_message

val make_modify_scheduled_action_message :
  ?enable:boolean_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?scheduled_action_description:string_ ->
  ?iam_role:string_ ->
  ?schedule:string_ ->
  ?target_action:scheduled_action_type ->
  scheduled_action_name:string_ ->
  unit ->
  modify_scheduled_action_message

val make_authorized_token_issuer :
  ?authorized_audiences_list:authorized_audience_list ->
  ?trusted_token_issuer_arn:string_ ->
  unit ->
  authorized_token_issuer

val make_redshift_idc_application :
  ?sso_tag_keys:tag_key_list ->
  ?tags:tag_list ->
  ?application_type:application_type ->
  ?service_integrations:service_integration_list ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?idc_onboard_status:string_ ->
  ?idc_managed_application_arn:string_ ->
  ?iam_role_arn:string_ ->
  ?idc_display_name:idc_display_name_string ->
  ?identity_namespace:identity_namespace_string ->
  ?redshift_idc_application_arn:string_ ->
  ?redshift_idc_application_name:redshift_idc_application_name ->
  ?idc_instance_arn:string_ ->
  unit ->
  redshift_idc_application

val make_modify_redshift_idc_application_message :
  ?service_integrations:service_integration_list ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?idc_display_name:idc_display_name_string ->
  ?iam_role_arn:string_ ->
  ?identity_namespace:identity_namespace_string ->
  redshift_idc_application_arn:string_ ->
  unit ->
  modify_redshift_idc_application_message

val make_lakehouse_configuration :
  ?catalog_arn:string_ ->
  ?lakehouse_registration_status:string_ ->
  ?lakehouse_idc_application_arn:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  lakehouse_configuration

val make_modify_lakehouse_configuration_message :
  ?dry_run:boolean_optional ->
  ?lakehouse_idc_application_arn:string_ ->
  ?lakehouse_idc_registration:lakehouse_idc_registration ->
  ?catalog_name:catalog_name_string ->
  ?lakehouse_registration:lakehouse_registration ->
  cluster_identifier:string_ ->
  unit ->
  modify_lakehouse_configuration_message

val make_integration_error :
  ?error_message:string_ -> error_code:string_ -> unit -> integration_error

val make_integration :
  ?tags:tag_list ->
  ?additional_encryption_context:encryption_context_map ->
  ?kms_key_id:string_ ->
  ?description:description ->
  ?create_time:t_stamp ->
  ?errors:integration_error_list ->
  ?status:zero_etl_integration_status ->
  ?target_arn:target_arn ->
  ?source_arn:source_arn ->
  ?integration_name:integration_name ->
  ?integration_arn:integration_arn ->
  unit ->
  integration

val make_modify_integration_message :
  ?integration_name:integration_name ->
  ?description:integration_description ->
  integration_arn:integration_arn ->
  unit ->
  modify_integration_message

val make_event_subscription :
  ?tags:tag_list ->
  ?enabled:boolean_ ->
  ?severity:string_ ->
  ?event_categories_list:event_categories_list ->
  ?source_ids_list:source_ids_list ->
  ?source_type:string_ ->
  ?subscription_creation_time:t_stamp ->
  ?status:string_ ->
  ?sns_topic_arn:string_ ->
  ?cust_subscription_id:string_ ->
  ?customer_aws_id:string_ ->
  unit ->
  event_subscription

val make_modify_event_subscription_message :
  ?enabled:boolean_optional ->
  ?severity:string_ ->
  ?event_categories:event_categories_list ->
  ?source_ids:source_ids_list ->
  ?source_type:string_ ->
  ?sns_topic_arn:string_ ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_endpoint_access :
  ?vpc_endpoint:vpc_endpoint ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?address:string_ ->
  ?port:integer ->
  ?endpoint_create_time:t_stamp ->
  ?endpoint_name:string_ ->
  ?endpoint_status:string_ ->
  ?subnet_group_name:string_ ->
  ?resource_owner:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  endpoint_access

val make_modify_endpoint_access_message :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  endpoint_name:string_ ->
  unit ->
  modify_endpoint_access_message

val make_modify_custom_domain_association_message :
  cluster_identifier:string_ ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  custom_domain_name:custom_domain_name_string ->
  unit ->
  modify_custom_domain_association_message

val make_cluster_subnet_group :
  ?supported_cluster_ip_address_types:value_string_list ->
  ?tags:tag_list ->
  ?subnets:subnet_list ->
  ?subnet_group_status:string_ ->
  ?vpc_id:string_ ->
  ?description:string_ ->
  ?cluster_subnet_group_name:string_ ->
  unit ->
  cluster_subnet_group

val make_modify_cluster_subnet_group_message :
  ?description:string_ ->
  subnet_ids:subnet_identifier_list ->
  cluster_subnet_group_name:string_ ->
  unit ->
  modify_cluster_subnet_group_message

val make_modify_cluster_snapshot_schedule_message :
  ?disassociate_schedule:boolean_optional ->
  ?schedule_identifier:string_ ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_snapshot_schedule_message

val make_modify_cluster_snapshot_message :
  ?force:boolean_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  snapshot_identifier:string_ ->
  unit ->
  modify_cluster_snapshot_message

val make_modify_cluster_parameter_group_message :
  parameters:parameters_list ->
  parameter_group_name:string_ ->
  unit ->
  modify_cluster_parameter_group_message

val make_modify_cluster_maintenance_message :
  ?defer_maintenance_duration:integer_optional ->
  ?defer_maintenance_end_time:t_stamp ->
  ?defer_maintenance_start_time:t_stamp ->
  ?defer_maintenance_identifier:string_ ->
  ?defer_maintenance:boolean_optional ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_maintenance_message

val make_modify_cluster_iam_roles_message :
  ?default_iam_role_arn:string_ ->
  ?remove_iam_roles:iam_role_arn_list ->
  ?add_iam_roles:iam_role_arn_list ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_iam_roles_message

val make_modify_cluster_db_revision_message :
  revision_target:string_ ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_db_revision_message

val make_modify_cluster_message :
  ?extra_compute_for_automatic_optimization:boolean_optional ->
  ?multi_a_z:boolean_optional ->
  ?ip_address_type:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?manage_master_password:boolean_optional ->
  ?port:integer_optional ->
  ?availability_zone:string_ ->
  ?availability_zone_relocation:boolean_optional ->
  ?kms_key_id:string_ ->
  ?encrypted:boolean_optional ->
  ?maintenance_track_name:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?elastic_ip:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?new_cluster_identifier:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  ?allow_version_upgrade:boolean_optional ->
  ?cluster_version:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?cluster_parameter_group_name:string_ ->
  ?master_user_password:sensitive_string ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?number_of_nodes:integer_optional ->
  ?node_type:string_ ->
  ?cluster_type:string_ ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_message

val make_modify_authentication_profile_message :
  authentication_profile_content:string_ ->
  authentication_profile_name:authentication_profile_name_string ->
  unit ->
  modify_authentication_profile_message

val make_modify_aqua_output_message :
  ?aqua_configuration:aqua_configuration -> unit -> modify_aqua_output_message

val make_modify_aqua_input_message :
  ?aqua_configuration_status:aqua_configuration_status ->
  cluster_identifier:string_ ->
  unit ->
  modify_aqua_input_message

val make_recommended_action :
  ?type_:recommended_action_type ->
  ?command:string_ ->
  ?database:string_ ->
  ?text:string_ ->
  unit ->
  recommended_action

val make_recommendation :
  ?reference_links:reference_link_list ->
  ?recommended_actions:recommended_action_list ->
  ?recommendation_text:string_ ->
  ?impact_ranking:impact_ranking_type ->
  ?observation:string_ ->
  ?description:string_ ->
  ?title:string_ ->
  ?recommendation_type:string_ ->
  ?created_at:t_stamp ->
  ?namespace_arn:string_ ->
  ?cluster_identifier:string_ ->
  ?id:string_ ->
  unit ->
  recommendation

val make_list_recommendations_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?namespace_arn:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  list_recommendations_message

val make_get_resource_policy_message : resource_arn:string_ -> unit -> get_resource_policy_message

val make_get_reserved_node_exchange_offerings_output_message :
  ?reserved_node_offerings:reserved_node_offering_list ->
  ?marker:string_ ->
  unit ->
  get_reserved_node_exchange_offerings_output_message

val make_get_reserved_node_exchange_offerings_input_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  reserved_node_id:string_ ->
  unit ->
  get_reserved_node_exchange_offerings_input_message

val make_get_reserved_node_exchange_configuration_options_output_message :
  ?reserved_node_configuration_option_list:reserved_node_configuration_option_list ->
  ?marker:string_ ->
  unit ->
  get_reserved_node_exchange_configuration_options_output_message

val make_get_reserved_node_exchange_configuration_options_input_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?snapshot_identifier:string_ ->
  ?cluster_identifier:string_ ->
  action_type:reserved_node_exchange_action_type ->
  unit ->
  get_reserved_node_exchange_configuration_options_input_message

val make_get_identity_center_auth_token_response :
  ?expiration_time:t_stamp ->
  ?token:sensitive_string ->
  unit ->
  get_identity_center_auth_token_response

val make_get_identity_center_auth_token_request :
  cluster_ids:cluster_identifier_list -> unit -> get_identity_center_auth_token_request

val make_cluster_extended_credentials :
  ?next_refresh_time:t_stamp ->
  ?expiration:t_stamp ->
  ?db_password:sensitive_string ->
  ?db_user:string_ ->
  unit ->
  cluster_extended_credentials

val make_get_cluster_credentials_with_iam_message :
  ?custom_domain_name:string_ ->
  ?duration_seconds:integer_optional ->
  ?cluster_identifier:string_ ->
  ?db_name:string_ ->
  unit ->
  get_cluster_credentials_with_iam_message

val make_cluster_credentials :
  ?expiration:t_stamp ->
  ?db_password:sensitive_string ->
  ?db_user:string_ ->
  unit ->
  cluster_credentials

val make_get_cluster_credentials_message :
  ?custom_domain_name:string_ ->
  ?db_groups:db_group_list ->
  ?auto_create:boolean_optional ->
  ?duration_seconds:integer_optional ->
  ?cluster_identifier:string_ ->
  ?db_name:string_ ->
  db_user:string_ ->
  unit ->
  get_cluster_credentials_message

val make_failover_primary_compute_input_message :
  cluster_identifier:string_ -> unit -> failover_primary_compute_input_message

val make_enable_snapshot_copy_message :
  ?manual_snapshot_retention_period:integer_optional ->
  ?snapshot_copy_grant_name:string_ ->
  ?retention_period:integer_optional ->
  destination_region:string_ ->
  cluster_identifier:string_ ->
  unit ->
  enable_snapshot_copy_message

val make_logging_status :
  ?log_exports:log_type_list ->
  ?log_destination_type:log_destination_type ->
  ?last_failure_message:string_ ->
  ?last_failure_time:t_stamp ->
  ?last_successful_delivery_time:t_stamp ->
  ?s3_key_prefix:s3_key_prefix_value ->
  ?bucket_name:string_ ->
  ?logging_enabled:boolean_ ->
  unit ->
  logging_status

val make_enable_logging_message :
  ?log_exports:log_type_list ->
  ?log_destination_type:log_destination_type ->
  ?s3_key_prefix:s3_key_prefix_value ->
  ?bucket_name:string_ ->
  cluster_identifier:string_ ->
  unit ->
  enable_logging_message

val make_disassociate_data_share_consumer_message :
  ?consumer_region:string_ ->
  ?consumer_arn:string_ ->
  ?disassociate_entire_account:boolean_optional ->
  data_share_arn:string_ ->
  unit ->
  disassociate_data_share_consumer_message

val make_disable_snapshot_copy_message :
  cluster_identifier:string_ -> unit -> disable_snapshot_copy_message

val make_disable_logging_message : cluster_identifier:string_ -> unit -> disable_logging_message

val make_describe_usage_limits_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?feature_type:usage_limit_feature_type ->
  ?cluster_identifier:string_ ->
  ?usage_limit_id:string_ ->
  unit ->
  describe_usage_limits_message

val make_describe_tags_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?resource_type:string_ ->
  ?resource_name:string_ ->
  unit ->
  describe_tags_message

val make_describe_table_restore_status_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?table_restore_request_id:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_table_restore_status_message

val make_customer_storage_message :
  ?total_provisioned_storage_in_mega_bytes:double ->
  ?total_backup_size_in_mega_bytes:double ->
  unit ->
  customer_storage_message

val make_describe_snapshot_schedules_output_message :
  ?marker:string_ ->
  ?snapshot_schedules:snapshot_schedule_list ->
  unit ->
  describe_snapshot_schedules_output_message

val make_describe_snapshot_schedules_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?schedule_identifier:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_snapshot_schedules_message

val make_describe_snapshot_copy_grants_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?snapshot_copy_grant_name:string_ ->
  unit ->
  describe_snapshot_copy_grants_message

val make_describe_scheduled_actions_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:scheduled_action_filter_list ->
  ?active:boolean_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?target_action_type:scheduled_action_type_values ->
  ?scheduled_action_name:string_ ->
  unit ->
  describe_scheduled_actions_message

val make_describe_resize_message : cluster_identifier:string_ -> unit -> describe_resize_message

val make_describe_reserved_nodes_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?reserved_node_id:string_ ->
  unit ->
  describe_reserved_nodes_message

val make_describe_reserved_node_offerings_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?reserved_node_offering_id:string_ ->
  unit ->
  describe_reserved_node_offerings_message

val make_describe_reserved_node_exchange_status_output_message :
  ?marker:string_ ->
  ?reserved_node_exchange_status_details:reserved_node_exchange_status_list ->
  unit ->
  describe_reserved_node_exchange_status_output_message

val make_describe_reserved_node_exchange_status_input_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?reserved_node_exchange_request_id:string_ ->
  ?reserved_node_id:string_ ->
  unit ->
  describe_reserved_node_exchange_status_input_message

val make_describe_redshift_idc_applications_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?redshift_idc_application_arn:string_ ->
  unit ->
  describe_redshift_idc_applications_message

val make_partner_integration_info :
  ?updated_at:t_stamp ->
  ?created_at:t_stamp ->
  ?status_message:partner_integration_status_message ->
  ?status:partner_integration_status ->
  ?partner_name:partner_integration_partner_name ->
  ?database_name:partner_integration_database_name ->
  unit ->
  partner_integration_info

val make_describe_partners_output_message :
  ?partner_integration_info_list:partner_integration_info_list ->
  unit ->
  describe_partners_output_message

val make_describe_partners_input_message :
  ?partner_name:partner_integration_partner_name ->
  ?database_name:partner_integration_database_name ->
  cluster_identifier:partner_integration_cluster_identifier ->
  account_id:partner_integration_account_id ->
  unit ->
  describe_partners_input_message

val make_orderable_cluster_option :
  ?availability_zones:availability_zone_list ->
  ?node_type:string_ ->
  ?cluster_type:string_ ->
  ?cluster_version:string_ ->
  unit ->
  orderable_cluster_option

val make_orderable_cluster_options_message :
  ?marker:string_ ->
  ?orderable_cluster_options:orderable_cluster_options_list ->
  unit ->
  orderable_cluster_options_message

val make_describe_orderable_cluster_options_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?node_type:string_ ->
  ?cluster_version:string_ ->
  unit ->
  describe_orderable_cluster_options_message

val make_node_configuration_option :
  ?mode:mode ->
  ?estimated_disk_utilization_percent:double_optional ->
  ?number_of_nodes:integer ->
  ?node_type:string_ ->
  unit ->
  node_configuration_option

val make_node_configuration_options_message :
  ?marker:string_ ->
  ?node_configuration_option_list:node_configuration_option_list ->
  unit ->
  node_configuration_options_message

val make_node_configuration_options_filter :
  ?values:value_string_list ->
  ?operator:operator_type ->
  ?name:node_configuration_options_filter_name ->
  unit ->
  node_configuration_options_filter

val make_describe_node_configuration_options_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:node_configuration_options_filter_list ->
  ?owner_account:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_identifier:string_ ->
  ?cluster_identifier:string_ ->
  action_type:action_type ->
  unit ->
  describe_node_configuration_options_message

val make_describe_logging_status_message :
  cluster_identifier:string_ -> unit -> describe_logging_status_message

val make_integrations_message :
  ?integrations:integration_list -> ?marker:string_ -> unit -> integrations_message

val make_describe_integrations_filter :
  values:describe_integrations_filter_value_list ->
  name:describe_integrations_filter_name ->
  unit ->
  describe_integrations_filter

val make_describe_integrations_message :
  ?filters:describe_integrations_filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?integration_arn:integration_arn ->
  unit ->
  describe_integrations_message

val make_inbound_integration :
  ?create_time:t_stamp ->
  ?errors:integration_error_list ->
  ?status:zero_etl_integration_status ->
  ?target_arn:target_arn ->
  ?source_arn:string_ ->
  ?integration_arn:inbound_integration_arn ->
  unit ->
  inbound_integration

val make_inbound_integrations_message :
  ?inbound_integrations:inbound_integration_list ->
  ?marker:string_ ->
  unit ->
  inbound_integrations_message

val make_describe_inbound_integrations_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?target_arn:target_arn ->
  ?integration_arn:inbound_integration_arn ->
  unit ->
  describe_inbound_integrations_message

val make_hsm_configuration :
  ?tags:tag_list ->
  ?hsm_partition_name:string_ ->
  ?hsm_ip_address:string_ ->
  ?description:string_ ->
  ?hsm_configuration_identifier:string_ ->
  unit ->
  hsm_configuration

val make_hsm_configuration_message :
  ?hsm_configurations:hsm_configuration_list -> ?marker:string_ -> unit -> hsm_configuration_message

val make_describe_hsm_configurations_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?hsm_configuration_identifier:string_ ->
  unit ->
  describe_hsm_configurations_message

val make_hsm_client_certificate :
  ?tags:tag_list ->
  ?hsm_client_certificate_public_key:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  unit ->
  hsm_client_certificate

val make_hsm_client_certificate_message :
  ?hsm_client_certificates:hsm_client_certificate_list ->
  ?marker:string_ ->
  unit ->
  hsm_client_certificate_message

val make_describe_hsm_client_certificates_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?hsm_client_certificate_identifier:string_ ->
  unit ->
  describe_hsm_client_certificates_message

val make_event_subscriptions_message :
  ?event_subscriptions_list:event_subscriptions_list ->
  ?marker:string_ ->
  unit ->
  event_subscriptions_message

val make_describe_event_subscriptions_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?subscription_name:string_ ->
  unit ->
  describe_event_subscriptions_message

val make_event :
  ?event_id:string_ ->
  ?date:t_stamp ->
  ?severity:string_ ->
  ?event_categories:event_categories_list ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  event

val make_events_message : ?events:event_list -> ?marker:string_ -> unit -> events_message

val make_describe_events_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?duration:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?source_type:source_type ->
  ?source_identifier:string_ ->
  unit ->
  describe_events_message

val make_event_info_map :
  ?severity:string_ ->
  ?event_description:string_ ->
  ?event_categories:event_categories_list ->
  ?event_id:string_ ->
  unit ->
  event_info_map

val make_event_categories_map :
  ?events:event_info_map_list -> ?source_type:string_ -> unit -> event_categories_map

val make_event_categories_message :
  ?event_categories_map_list:event_categories_map_list -> unit -> event_categories_message

val make_describe_event_categories_message :
  ?source_type:string_ -> unit -> describe_event_categories_message

val make_endpoint_authorization_list :
  ?marker:string_ ->
  ?endpoint_authorization_list:endpoint_authorizations ->
  unit ->
  endpoint_authorization_list

val make_describe_endpoint_authorization_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?grantee:boolean_optional ->
  ?account:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_endpoint_authorization_message

val make_endpoint_access_list :
  ?marker:string_ -> ?endpoint_access_list:endpoint_accesses -> unit -> endpoint_access_list

val make_describe_endpoint_access_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?vpc_id:string_ ->
  ?endpoint_name:string_ ->
  ?resource_owner:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_endpoint_access_message

val make_default_cluster_parameters :
  ?parameters:parameters_list ->
  ?marker:string_ ->
  ?parameter_group_family:string_ ->
  unit ->
  default_cluster_parameters

val make_describe_default_cluster_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  parameter_group_family:string_ ->
  unit ->
  describe_default_cluster_parameters_message

val make_describe_data_shares_for_producer_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?status:data_share_status_for_producer ->
  ?producer_arn:string_ ->
  unit ->
  describe_data_shares_for_producer_message

val make_describe_data_shares_for_consumer_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?status:data_share_status_for_consumer ->
  ?consumer_arn:string_ ->
  unit ->
  describe_data_shares_for_consumer_message

val make_describe_data_shares_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?data_share_arn:string_ ->
  unit ->
  describe_data_shares_message

val make_certificate_association :
  ?cluster_identifier:string_ -> ?custom_domain_name:string_ -> unit -> certificate_association

val make_association :
  ?certificate_associations:certificate_association_list ->
  ?custom_domain_certificate_expiry_date:t_stamp ->
  ?custom_domain_certificate_arn:string_ ->
  unit ->
  association

val make_custom_domain_associations_message :
  ?associations:association_list -> ?marker:string_ -> unit -> custom_domain_associations_message

val make_describe_custom_domain_associations_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_name:custom_domain_name_string ->
  unit ->
  describe_custom_domain_associations_message

val make_cluster_version :
  ?description:string_ ->
  ?cluster_parameter_group_family:string_ ->
  ?cluster_version:string_ ->
  unit ->
  cluster_version

val make_cluster_versions_message :
  ?cluster_versions:cluster_version_list -> ?marker:string_ -> unit -> cluster_versions_message

val make_describe_cluster_versions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cluster_parameter_group_family:string_ ->
  ?cluster_version:string_ ->
  unit ->
  describe_cluster_versions_message

val make_describe_cluster_tracks_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?maintenance_track_name:string_ ->
  unit ->
  describe_cluster_tracks_message

val make_cluster_subnet_group_message :
  ?cluster_subnet_groups:cluster_subnet_groups ->
  ?marker:string_ ->
  unit ->
  cluster_subnet_group_message

val make_describe_cluster_subnet_groups_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cluster_subnet_group_name:string_ ->
  unit ->
  describe_cluster_subnet_groups_message

val make_describe_cluster_snapshots_message :
  ?sorting_entities:snapshot_sorting_entity_list ->
  ?cluster_exists:boolean_optional ->
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?owner_account:string_ ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?snapshot_type:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_identifier:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_cluster_snapshots_message

val make_cluster_security_group_message :
  ?cluster_security_groups:cluster_security_groups ->
  ?marker:string_ ->
  unit ->
  cluster_security_group_message

val make_describe_cluster_security_groups_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cluster_security_group_name:string_ ->
  unit ->
  describe_cluster_security_groups_message

val make_clusters_message : ?clusters:cluster_list -> ?marker:string_ -> unit -> clusters_message

val make_describe_clusters_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_clusters_message

val make_cluster_parameter_group_details :
  ?marker:string_ -> ?parameters:parameters_list -> unit -> cluster_parameter_group_details

val make_describe_cluster_parameters_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?source:string_ ->
  parameter_group_name:string_ ->
  unit ->
  describe_cluster_parameters_message

val make_cluster_parameter_group :
  ?tags:tag_list ->
  ?description:string_ ->
  ?parameter_group_family:string_ ->
  ?parameter_group_name:string_ ->
  unit ->
  cluster_parameter_group

val make_cluster_parameter_groups_message :
  ?parameter_groups:parameter_group_list ->
  ?marker:string_ ->
  unit ->
  cluster_parameter_groups_message

val make_describe_cluster_parameter_groups_message :
  ?tag_values:tag_value_list ->
  ?tag_keys:tag_key_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?parameter_group_name:string_ ->
  unit ->
  describe_cluster_parameter_groups_message

val make_cluster_db_revision :
  ?revision_targets:revision_targets_list ->
  ?database_revision_release_date:t_stamp ->
  ?current_database_revision:string_ ->
  ?cluster_identifier:string_ ->
  unit ->
  cluster_db_revision

val make_cluster_db_revisions_message :
  ?cluster_db_revisions:cluster_db_revisions_list ->
  ?marker:string_ ->
  unit ->
  cluster_db_revisions_message

val make_describe_cluster_db_revisions_message :
  ?marker:string_ ->
  ?max_records:integer_optional ->
  ?cluster_identifier:string_ ->
  unit ->
  describe_cluster_db_revisions_message

val make_authentication_profile :
  ?authentication_profile_content:string_ ->
  ?authentication_profile_name:authentication_profile_name_string ->
  unit ->
  authentication_profile

val make_describe_authentication_profiles_message :
  ?authentication_profile_name:authentication_profile_name_string ->
  unit ->
  describe_authentication_profiles_message

val make_attribute_value_target : ?attribute_value:string_ -> unit -> attribute_value_target

val make_account_attribute :
  ?attribute_values:attribute_value_list -> ?attribute_name:string_ -> unit -> account_attribute

val make_account_attribute_list :
  ?account_attributes:attribute_list -> unit -> account_attribute_list

val make_describe_account_attributes_message :
  ?attribute_names:attribute_name_list -> unit -> describe_account_attributes_message

val make_deregister_namespace_output_message :
  ?status:namespace_registration_status -> unit -> deregister_namespace_output_message

val make_deregister_namespace_input_message :
  consumer_identifiers:consumer_identifier_list ->
  namespace_identifier:namespace_identifier_union ->
  unit ->
  deregister_namespace_input_message

val make_delete_usage_limit_message : usage_limit_id:string_ -> unit -> delete_usage_limit_message

val make_delete_tags_message :
  tag_keys:tag_key_list -> resource_name:string_ -> unit -> delete_tags_message

val make_delete_snapshot_schedule_message :
  schedule_identifier:string_ -> unit -> delete_snapshot_schedule_message

val make_delete_snapshot_copy_grant_message :
  snapshot_copy_grant_name:string_ -> unit -> delete_snapshot_copy_grant_message

val make_delete_scheduled_action_message :
  scheduled_action_name:string_ -> unit -> delete_scheduled_action_message

val make_delete_resource_policy_message :
  resource_arn:string_ -> unit -> delete_resource_policy_message

val make_delete_redshift_idc_application_message :
  redshift_idc_application_arn:string_ -> unit -> delete_redshift_idc_application_message

val make_partner_integration_input_message :
  partner_name:partner_integration_partner_name ->
  database_name:partner_integration_database_name ->
  cluster_identifier:partner_integration_cluster_identifier ->
  account_id:partner_integration_account_id ->
  unit ->
  partner_integration_input_message

val make_delete_integration_message :
  integration_arn:integration_arn -> unit -> delete_integration_message

val make_delete_hsm_configuration_message :
  hsm_configuration_identifier:string_ -> unit -> delete_hsm_configuration_message

val make_delete_hsm_client_certificate_message :
  hsm_client_certificate_identifier:string_ -> unit -> delete_hsm_client_certificate_message

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_endpoint_access_message :
  endpoint_name:string_ -> unit -> delete_endpoint_access_message

val make_delete_custom_domain_association_message :
  custom_domain_name:custom_domain_name_string ->
  cluster_identifier:string_ ->
  unit ->
  delete_custom_domain_association_message

val make_delete_cluster_subnet_group_message :
  cluster_subnet_group_name:string_ -> unit -> delete_cluster_subnet_group_message

val make_delete_cluster_snapshot_message :
  ?snapshot_cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  unit ->
  delete_cluster_snapshot_message

val make_delete_cluster_security_group_message :
  cluster_security_group_name:string_ -> unit -> delete_cluster_security_group_message

val make_delete_cluster_parameter_group_message :
  parameter_group_name:string_ -> unit -> delete_cluster_parameter_group_message

val make_delete_cluster_message :
  ?final_cluster_snapshot_retention_period:integer_optional ->
  ?final_cluster_snapshot_identifier:string_ ->
  ?skip_final_cluster_snapshot:boolean_ ->
  cluster_identifier:string_ ->
  unit ->
  delete_cluster_message

val make_delete_authentication_profile_message :
  authentication_profile_name:authentication_profile_name_string ->
  unit ->
  delete_authentication_profile_message

val make_deauthorize_data_share_message :
  consumer_identifier:string_ -> data_share_arn:string_ -> unit -> deauthorize_data_share_message

val make_create_usage_limit_message :
  ?tags:tag_list ->
  ?breach_action:usage_limit_breach_action ->
  ?period:usage_limit_period ->
  amount:long ->
  limit_type:usage_limit_limit_type ->
  feature_type:usage_limit_feature_type ->
  cluster_identifier:string_ ->
  unit ->
  create_usage_limit_message

val make_create_tags_message : tags:tag_list -> resource_name:string_ -> unit -> create_tags_message

val make_create_snapshot_schedule_message :
  ?next_invocations:integer_optional ->
  ?dry_run:boolean_optional ->
  ?tags:tag_list ->
  ?schedule_description:string_ ->
  ?schedule_identifier:string_ ->
  ?schedule_definitions:schedule_definition_list ->
  unit ->
  create_snapshot_schedule_message

val make_create_snapshot_copy_grant_message :
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  snapshot_copy_grant_name:string_ ->
  unit ->
  create_snapshot_copy_grant_message

val make_create_scheduled_action_message :
  ?enable:boolean_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?scheduled_action_description:string_ ->
  iam_role:string_ ->
  schedule:string_ ->
  target_action:scheduled_action_type ->
  scheduled_action_name:string_ ->
  unit ->
  create_scheduled_action_message

val make_create_redshift_idc_application_message :
  ?sso_tag_keys:tag_key_list ->
  ?tags:tag_list ->
  ?application_type:application_type ->
  ?service_integrations:service_integration_list ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?identity_namespace:identity_namespace_string ->
  iam_role_arn:string_ ->
  idc_display_name:idc_display_name_string ->
  redshift_idc_application_name:redshift_idc_application_name ->
  idc_instance_arn:string_ ->
  unit ->
  create_redshift_idc_application_message

val make_create_integration_message :
  ?description:integration_description ->
  ?additional_encryption_context:encryption_context_map ->
  ?tag_list:tag_list ->
  ?kms_key_id:string_ ->
  integration_name:integration_name ->
  target_arn:target_arn ->
  source_arn:source_arn ->
  unit ->
  create_integration_message

val make_create_hsm_configuration_message :
  ?tags:tag_list ->
  hsm_server_public_certificate:string_ ->
  hsm_partition_password:string_ ->
  hsm_partition_name:string_ ->
  hsm_ip_address:string_ ->
  description:string_ ->
  hsm_configuration_identifier:string_ ->
  unit ->
  create_hsm_configuration_message

val make_create_hsm_client_certificate_message :
  ?tags:tag_list ->
  hsm_client_certificate_identifier:string_ ->
  unit ->
  create_hsm_client_certificate_message

val make_create_event_subscription_message :
  ?tags:tag_list ->
  ?enabled:boolean_optional ->
  ?severity:string_ ->
  ?event_categories:event_categories_list ->
  ?source_ids:source_ids_list ->
  ?source_type:string_ ->
  sns_topic_arn:string_ ->
  subscription_name:string_ ->
  unit ->
  create_event_subscription_message

val make_create_endpoint_access_message :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?resource_owner:string_ ->
  ?cluster_identifier:string_ ->
  subnet_group_name:string_ ->
  endpoint_name:string_ ->
  unit ->
  create_endpoint_access_message

val make_create_custom_domain_association_message :
  cluster_identifier:string_ ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  custom_domain_name:custom_domain_name_string ->
  unit ->
  create_custom_domain_association_message

val make_create_cluster_subnet_group_message :
  ?tags:tag_list ->
  subnet_ids:subnet_identifier_list ->
  description:string_ ->
  cluster_subnet_group_name:string_ ->
  unit ->
  create_cluster_subnet_group_message

val make_create_cluster_snapshot_message :
  ?tags:tag_list ->
  ?manual_snapshot_retention_period:integer_optional ->
  cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  unit ->
  create_cluster_snapshot_message

val make_create_cluster_security_group_message :
  ?tags:tag_list ->
  description:string_ ->
  cluster_security_group_name:string_ ->
  unit ->
  create_cluster_security_group_message

val make_create_cluster_parameter_group_message :
  ?tags:tag_list ->
  description:string_ ->
  parameter_group_family:string_ ->
  parameter_group_name:string_ ->
  unit ->
  create_cluster_parameter_group_message

val make_create_cluster_message :
  ?extra_compute_for_automatic_optimization:boolean_optional ->
  ?catalog_name:catalog_name_string ->
  ?redshift_idc_application_arn:string_ ->
  ?multi_a_z:boolean_optional ->
  ?ip_address_type:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?manage_master_password:boolean_optional ->
  ?load_sample_data:string_ ->
  ?default_iam_role_arn:string_ ->
  ?aqua_configuration_status:aqua_configuration_status ->
  ?availability_zone_relocation:boolean_optional ->
  ?snapshot_schedule_identifier:string_ ->
  ?maintenance_track_name:string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?additional_info:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  ?elastic_ip:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  ?encrypted:boolean_optional ->
  ?publicly_accessible:boolean_optional ->
  ?number_of_nodes:integer_optional ->
  ?allow_version_upgrade:boolean_optional ->
  ?cluster_version:string_ ->
  ?port:integer_optional ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?cluster_parameter_group_name:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?availability_zone:string_ ->
  ?cluster_subnet_group_name:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?master_user_password:sensitive_string ->
  ?cluster_type:string_ ->
  ?db_name:string_ ->
  master_username:string_ ->
  node_type:string_ ->
  cluster_identifier:string_ ->
  unit ->
  create_cluster_message

val make_create_authentication_profile_message :
  authentication_profile_content:string_ ->
  authentication_profile_name:authentication_profile_name_string ->
  unit ->
  create_authentication_profile_message

val make_copy_cluster_snapshot_message :
  ?manual_snapshot_retention_period:integer_optional ->
  ?source_snapshot_cluster_identifier:string_ ->
  target_snapshot_identifier:string_ ->
  source_snapshot_identifier:string_ ->
  unit ->
  copy_cluster_snapshot_message

val make_cancel_resize_message : cluster_identifier:string_ -> unit -> cancel_resize_message

val make_batch_modify_cluster_snapshots_output_message :
  ?errors:batch_snapshot_operation_errors ->
  ?resources:snapshot_identifier_list ->
  unit ->
  batch_modify_cluster_snapshots_output_message

val make_batch_modify_cluster_snapshots_message :
  ?force:boolean_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  snapshot_identifier_list:snapshot_identifier_list ->
  unit ->
  batch_modify_cluster_snapshots_message

val make_batch_delete_cluster_snapshots_request :
  identifiers:delete_cluster_snapshot_message_list -> unit -> batch_delete_cluster_snapshots_request

val make_authorize_snapshot_access_message :
  ?snapshot_cluster_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_identifier:string_ ->
  account_with_restore_access:string_ ->
  unit ->
  authorize_snapshot_access_message

val make_authorize_endpoint_access_message :
  ?vpc_ids:vpc_identifier_list ->
  ?cluster_identifier:string_ ->
  account:string_ ->
  unit ->
  authorize_endpoint_access_message

val make_authorize_data_share_message :
  ?allow_writes:boolean_optional ->
  consumer_identifier:string_ ->
  data_share_arn:string_ ->
  unit ->
  authorize_data_share_message

val make_authorize_cluster_security_group_ingress_message :
  ?ec2_security_group_owner_id:string_ ->
  ?ec2_security_group_name:string_ ->
  ?cidri_p:string_ ->
  cluster_security_group_name:string_ ->
  unit ->
  authorize_cluster_security_group_ingress_message

val make_associate_data_share_consumer_message :
  ?allow_writes:boolean_optional ->
  ?consumer_region:string_ ->
  ?consumer_arn:string_ ->
  ?associate_entire_account:boolean_optional ->
  data_share_arn:string_ ->
  unit ->
  associate_data_share_consumer_message

val make_accept_reserved_node_exchange_output_message :
  ?exchanged_reserved_node:reserved_node -> unit -> accept_reserved_node_exchange_output_message

val make_accept_reserved_node_exchange_input_message :
  target_reserved_node_offering_id:string_ ->
  reserved_node_id:string_ ->
  unit ->
  accept_reserved_node_exchange_input_message
