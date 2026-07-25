open Types

val make_recurring_charge :
  ?recurring_charge_amount:double -> ?recurring_charge_frequency:string_ -> unit -> recurring_charge

val make_reserved_node :
  ?reserved_node_id:string_ ->
  ?reserved_node_offering_id:string_ ->
  ?node_type:string_ ->
  ?start_time:t_stamp ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?currency_code:string_ ->
  ?node_count:integer ->
  ?state:string_ ->
  ?offering_type:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?reserved_node_offering_type:reserved_node_offering_type ->
  unit ->
  reserved_node

val make_accept_reserved_node_exchange_output_message :
  ?exchanged_reserved_node:reserved_node -> unit -> accept_reserved_node_exchange_output_message

val make_accept_reserved_node_exchange_input_message :
  reserved_node_id:string_ ->
  target_reserved_node_offering_id:string_ ->
  unit ->
  accept_reserved_node_exchange_input_message

val make_attribute_value_target : ?attribute_value:string_ -> unit -> attribute_value_target

val make_account_attribute :
  ?attribute_name:string_ -> ?attribute_values:attribute_value_list -> unit -> account_attribute

val make_account_attribute_list :
  ?account_attributes:attribute_list -> unit -> account_attribute_list

val make_account_with_restore_access :
  ?account_id:string_ -> ?account_alias:string_ -> unit -> account_with_restore_access

val make_partner_integration_output_message :
  ?database_name:partner_integration_database_name ->
  ?partner_name:partner_integration_partner_name ->
  unit ->
  partner_integration_output_message

val make_partner_integration_input_message :
  account_id:partner_integration_account_id ->
  cluster_identifier:partner_integration_cluster_identifier ->
  database_name:partner_integration_database_name ->
  partner_name:partner_integration_partner_name ->
  unit ->
  partner_integration_input_message

val make_aqua_configuration :
  ?aqua_status:aqua_status ->
  ?aqua_configuration_status:aqua_configuration_status ->
  unit ->
  aqua_configuration

val make_data_share_association :
  ?consumer_identifier:string_ ->
  ?status:data_share_status ->
  ?consumer_region:string_ ->
  ?created_date:t_stamp ->
  ?status_change_date:t_stamp ->
  ?producer_allowed_writes:boolean_optional ->
  ?consumer_accepted_writes:boolean_optional ->
  unit ->
  data_share_association

val make_data_share :
  ?data_share_arn:string_ ->
  ?producer_arn:string_ ->
  ?allow_publicly_accessible_consumers:boolean_ ->
  ?data_share_associations:data_share_association_list ->
  ?managed_by:string_ ->
  ?data_share_type:data_share_type ->
  unit ->
  data_share

val make_associate_data_share_consumer_message :
  ?associate_entire_account:boolean_optional ->
  ?consumer_arn:string_ ->
  ?consumer_region:string_ ->
  ?allow_writes:boolean_optional ->
  data_share_arn:string_ ->
  unit ->
  associate_data_share_consumer_message

val make_cluster_associated_to_schedule :
  ?cluster_identifier:string_ ->
  ?schedule_association_state:schedule_state ->
  unit ->
  cluster_associated_to_schedule

val make_certificate_association :
  ?custom_domain_name:string_ -> ?cluster_identifier:string_ -> unit -> certificate_association

val make_association :
  ?custom_domain_certificate_arn:string_ ->
  ?custom_domain_certificate_expiry_date:t_stamp ->
  ?certificate_associations:certificate_association_list ->
  unit ->
  association

val make_authentication_profile :
  ?authentication_profile_name:authentication_profile_name_string ->
  ?authentication_profile_content:string_ ->
  unit ->
  authentication_profile

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag
val make_ip_range : ?status:string_ -> ?cidri_p:string_ -> ?tags:tag_list -> unit -> ip_range

val make_ec2_security_group :
  ?status:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  ?tags:tag_list ->
  unit ->
  ec2_security_group

val make_cluster_security_group :
  ?cluster_security_group_name:string_ ->
  ?description:string_ ->
  ?ec2_security_groups:ec2_security_group_list ->
  ?ip_ranges:ip_range_list ->
  ?tags:tag_list ->
  unit ->
  cluster_security_group

val make_authorize_cluster_security_group_ingress_message :
  ?cidri_p:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  cluster_security_group_name:string_ ->
  unit ->
  authorize_cluster_security_group_ingress_message

val make_authorize_data_share_message :
  ?allow_writes:boolean_optional ->
  data_share_arn:string_ ->
  consumer_identifier:string_ ->
  unit ->
  authorize_data_share_message

val make_endpoint_authorization :
  ?grantor:string_ ->
  ?grantee:string_ ->
  ?cluster_identifier:string_ ->
  ?authorize_time:t_stamp ->
  ?cluster_status:string_ ->
  ?status:authorization_status ->
  ?allowed_all_vp_cs:boolean_ ->
  ?allowed_vp_cs:vpc_identifier_list ->
  ?endpoint_count:integer ->
  unit ->
  endpoint_authorization

val make_authorize_endpoint_access_message :
  ?cluster_identifier:string_ ->
  ?vpc_ids:vpc_identifier_list ->
  account:string_ ->
  unit ->
  authorize_endpoint_access_message

val make_snapshot :
  ?snapshot_identifier:string_ ->
  ?cluster_identifier:string_ ->
  ?snapshot_create_time:t_stamp ->
  ?status:string_ ->
  ?port:integer ->
  ?availability_zone:string_ ->
  ?cluster_create_time:t_stamp ->
  ?master_username:string_ ->
  ?cluster_version:string_ ->
  ?engine_full_version:string_ ->
  ?snapshot_type:string_ ->
  ?node_type:string_ ->
  ?number_of_nodes:integer ->
  ?db_name:string_ ->
  ?vpc_id:string_ ->
  ?encrypted:boolean_ ->
  ?kms_key_id:string_ ->
  ?encrypted_with_hs_m:boolean_ ->
  ?accounts_with_restore_access:accounts_with_restore_access_list ->
  ?owner_account:string_ ->
  ?total_backup_size_in_mega_bytes:double ->
  ?actual_incremental_backup_size_in_mega_bytes:double ->
  ?backup_progress_in_mega_bytes:double ->
  ?current_backup_rate_in_mega_bytes_per_second:double ->
  ?estimated_seconds_to_completion:long ->
  ?elapsed_time_in_seconds:long ->
  ?source_region:string_ ->
  ?tags:tag_list ->
  ?restorable_node_types:restorable_node_type_list ->
  ?enhanced_vpc_routing:boolean_ ->
  ?maintenance_track_name:string_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?manual_snapshot_remaining_days:integer_optional ->
  ?snapshot_retention_start_time:t_stamp ->
  ?master_password_secret_arn:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?snapshot_arn:string_ ->
  unit ->
  snapshot

val make_authorize_snapshot_access_message :
  ?snapshot_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_cluster_identifier:string_ ->
  account_with_restore_access:string_ ->
  unit ->
  authorize_snapshot_access_message

val make_authorized_token_issuer :
  ?trusted_token_issuer_arn:string_ ->
  ?authorized_audiences_list:authorized_audience_list ->
  unit ->
  authorized_token_issuer

val make_supported_platform : ?name:string_ -> unit -> supported_platform

val make_availability_zone :
  ?name:string_ -> ?supported_platforms:supported_platforms_list -> unit -> availability_zone

val make_snapshot_error_message :
  ?snapshot_identifier:string_ ->
  ?snapshot_cluster_identifier:string_ ->
  ?failure_code:string_ ->
  ?failure_reason:string_ ->
  unit ->
  snapshot_error_message

val make_delete_cluster_snapshot_message :
  ?snapshot_cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  unit ->
  delete_cluster_snapshot_message

val make_batch_delete_cluster_snapshots_request :
  identifiers:delete_cluster_snapshot_message_list -> unit -> batch_delete_cluster_snapshots_request

val make_batch_modify_cluster_snapshots_output_message :
  ?resources:snapshot_identifier_list ->
  ?errors:batch_snapshot_operation_errors ->
  unit ->
  batch_modify_cluster_snapshots_output_message

val make_batch_modify_cluster_snapshots_message :
  ?manual_snapshot_retention_period:integer_optional ->
  ?force:boolean_ ->
  snapshot_identifier_list:snapshot_identifier_list ->
  unit ->
  batch_modify_cluster_snapshots_message

val make_resize_progress_message :
  ?target_node_type:string_ ->
  ?target_number_of_nodes:integer_optional ->
  ?target_cluster_type:string_ ->
  ?status:string_ ->
  ?import_tables_completed:import_tables_completed ->
  ?import_tables_in_progress:import_tables_in_progress ->
  ?import_tables_not_started:import_tables_not_started ->
  ?avg_resize_rate_in_mega_bytes_per_second:double_optional ->
  ?total_resize_data_in_mega_bytes:long_optional ->
  ?progress_in_mega_bytes:long_optional ->
  ?elapsed_time_in_seconds:long_optional ->
  ?estimated_time_to_completion_in_seconds:long_optional ->
  ?resize_type:string_ ->
  ?message:string_ ->
  ?target_encryption_type:string_ ->
  ?data_transfer_progress_percent:double_optional ->
  unit ->
  resize_progress_message

val make_cancel_resize_message : cluster_identifier:string_ -> unit -> cancel_resize_message

val make_cluster_node :
  ?node_role:string_ ->
  ?private_ip_address:string_ ->
  ?public_ip_address:string_ ->
  unit ->
  cluster_node

val make_secondary_cluster_info :
  ?availability_zone:string_ -> ?cluster_nodes:cluster_nodes_list -> unit -> secondary_cluster_info

val make_reserved_node_exchange_status :
  ?reserved_node_exchange_request_id:string_ ->
  ?status:reserved_node_exchange_status_type ->
  ?request_time:t_stamp ->
  ?source_reserved_node_id:string_ ->
  ?source_reserved_node_type:string_ ->
  ?source_reserved_node_count:integer ->
  ?target_reserved_node_offering_id:string_ ->
  ?target_reserved_node_type:string_ ->
  ?target_reserved_node_count:integer ->
  unit ->
  reserved_node_exchange_status

val make_resize_info : ?resize_type:string_ -> ?allow_cancel_resize:boolean_ -> unit -> resize_info

val make_deferred_maintenance_window :
  ?defer_maintenance_identifier:string_ ->
  ?defer_maintenance_start_time:t_stamp ->
  ?defer_maintenance_end_time:t_stamp ->
  unit ->
  deferred_maintenance_window

val make_cluster_iam_role :
  ?iam_role_arn:string_ -> ?apply_status:string_ -> unit -> cluster_iam_role

val make_elastic_ip_status : ?elastic_ip:string_ -> ?status:string_ -> unit -> elastic_ip_status

val make_cluster_snapshot_copy_status :
  ?destination_region:string_ ->
  ?retention_period:long ->
  ?manual_snapshot_retention_period:integer ->
  ?snapshot_copy_grant_name:string_ ->
  unit ->
  cluster_snapshot_copy_status

val make_hsm_status :
  ?hsm_client_certificate_identifier:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?status:string_ ->
  unit ->
  hsm_status

val make_data_transfer_progress :
  ?status:string_ ->
  ?current_rate_in_mega_bytes_per_second:double_optional ->
  ?total_data_in_mega_bytes:long ->
  ?data_transferred_in_mega_bytes:long ->
  ?estimated_time_to_completion_in_seconds:long_optional ->
  ?elapsed_time_in_seconds:long_optional ->
  unit ->
  data_transfer_progress

val make_restore_status :
  ?status:string_ ->
  ?current_restore_rate_in_mega_bytes_per_second:double ->
  ?snapshot_size_in_mega_bytes:long ->
  ?progress_in_mega_bytes:long ->
  ?elapsed_time_in_seconds:long ->
  ?estimated_time_to_completion_in_seconds:long ->
  unit ->
  restore_status

val make_pending_modified_values :
  ?master_user_password:sensitive_string ->
  ?node_type:string_ ->
  ?number_of_nodes:integer_optional ->
  ?cluster_type:string_ ->
  ?cluster_version:string_ ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?cluster_identifier:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?maintenance_track_name:string_ ->
  ?encryption_type:string_ ->
  unit ->
  pending_modified_values

val make_cluster_parameter_status :
  ?parameter_name:string_ ->
  ?parameter_apply_status:string_ ->
  ?parameter_apply_error_description:string_ ->
  unit ->
  cluster_parameter_status

val make_cluster_parameter_group_status :
  ?parameter_group_name:string_ ->
  ?parameter_apply_status:string_ ->
  ?cluster_parameter_status_list:cluster_parameter_status_list ->
  unit ->
  cluster_parameter_group_status

val make_vpc_security_group_membership :
  ?vpc_security_group_id:string_ -> ?status:string_ -> unit -> vpc_security_group_membership

val make_cluster_security_group_membership :
  ?cluster_security_group_name:string_ ->
  ?status:string_ ->
  unit ->
  cluster_security_group_membership

val make_network_interface :
  ?network_interface_id:string_ ->
  ?subnet_id:string_ ->
  ?private_ip_address:string_ ->
  ?availability_zone:string_ ->
  ?ipv6_address:string_ ->
  unit ->
  network_interface

val make_vpc_endpoint :
  ?vpc_endpoint_id:string_ ->
  ?vpc_id:string_ ->
  ?network_interfaces:network_interface_list ->
  unit ->
  vpc_endpoint

val make_endpoint :
  ?address:string_ -> ?port:integer -> ?vpc_endpoints:vpc_endpoints_list -> unit -> endpoint

val make_cluster :
  ?cluster_identifier:string_ ->
  ?node_type:string_ ->
  ?cluster_status:string_ ->
  ?cluster_availability_status:string_ ->
  ?modify_status:string_ ->
  ?master_username:string_ ->
  ?db_name:string_ ->
  ?endpoint:endpoint ->
  ?cluster_create_time:t_stamp ->
  ?automated_snapshot_retention_period:integer ->
  ?manual_snapshot_retention_period:integer ->
  ?cluster_security_groups:cluster_security_group_membership_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?cluster_parameter_groups:cluster_parameter_group_status_list ->
  ?cluster_subnet_group_name:string_ ->
  ?vpc_id:string_ ->
  ?availability_zone:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?pending_modified_values:pending_modified_values ->
  ?cluster_version:string_ ->
  ?allow_version_upgrade:boolean_ ->
  ?number_of_nodes:integer ->
  ?publicly_accessible:boolean_ ->
  ?encrypted:boolean_ ->
  ?restore_status:restore_status ->
  ?data_transfer_progress:data_transfer_progress ->
  ?hsm_status:hsm_status ->
  ?cluster_snapshot_copy_status:cluster_snapshot_copy_status ->
  ?cluster_public_key:string_ ->
  ?cluster_nodes:cluster_nodes_list ->
  ?elastic_ip_status:elastic_ip_status ->
  ?cluster_revision_number:string_ ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enhanced_vpc_routing:boolean_ ->
  ?iam_roles:cluster_iam_role_list ->
  ?pending_actions:pending_actions_list ->
  ?maintenance_track_name:string_ ->
  ?elastic_resize_number_of_node_options:string_ ->
  ?deferred_maintenance_windows:deferred_maintenance_windows_list ->
  ?snapshot_schedule_identifier:string_ ->
  ?snapshot_schedule_state:schedule_state ->
  ?expected_next_snapshot_schedule_time:t_stamp ->
  ?expected_next_snapshot_schedule_time_status:string_ ->
  ?next_maintenance_window_start_time:t_stamp ->
  ?resize_info:resize_info ->
  ?availability_zone_relocation_status:string_ ->
  ?cluster_namespace_arn:string_ ->
  ?total_storage_capacity_in_mega_bytes:long_optional ->
  ?aqua_configuration:aqua_configuration ->
  ?default_iam_role_arn:string_ ->
  ?reserved_node_exchange_status:reserved_node_exchange_status ->
  ?custom_domain_name:string_ ->
  ?custom_domain_certificate_arn:string_ ->
  ?custom_domain_certificate_expiry_date:t_stamp ->
  ?master_password_secret_arn:string_ ->
  ?master_password_secret_kms_key_id:string_ ->
  ?ip_address_type:string_ ->
  ?multi_a_z:string_ ->
  ?multi_az_secondary:secondary_cluster_info ->
  ?lakehouse_registration_status:string_ ->
  ?catalog_arn:string_ ->
  ?extra_compute_for_automatic_optimization:string_ ->
  unit ->
  cluster

val make_cluster_credentials :
  ?db_user:string_ ->
  ?db_password:sensitive_string ->
  ?expiration:t_stamp ->
  unit ->
  cluster_credentials

val make_revision_target :
  ?database_revision:string_ ->
  ?description:string_ ->
  ?database_revision_release_date:t_stamp ->
  unit ->
  revision_target

val make_cluster_db_revision :
  ?cluster_identifier:string_ ->
  ?current_database_revision:string_ ->
  ?database_revision_release_date:t_stamp ->
  ?revision_targets:revision_targets_list ->
  unit ->
  cluster_db_revision

val make_cluster_db_revisions_message :
  ?marker:string_ ->
  ?cluster_db_revisions:cluster_db_revisions_list ->
  unit ->
  cluster_db_revisions_message

val make_cluster_extended_credentials :
  ?db_user:string_ ->
  ?db_password:sensitive_string ->
  ?expiration:t_stamp ->
  ?next_refresh_time:t_stamp ->
  unit ->
  cluster_extended_credentials

val make_cluster_parameter_group :
  ?parameter_group_name:string_ ->
  ?parameter_group_family:string_ ->
  ?description:string_ ->
  ?tags:tag_list ->
  unit ->
  cluster_parameter_group

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_value:string_ ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?apply_type:parameter_apply_type ->
  ?is_modifiable:boolean_ ->
  ?minimum_engine_version:string_ ->
  unit ->
  parameter

val make_cluster_parameter_group_details :
  ?parameters:parameters_list -> ?marker:string_ -> unit -> cluster_parameter_group_details

val make_cluster_parameter_group_name_message :
  ?parameter_group_name:string_ ->
  ?parameter_group_status:string_ ->
  unit ->
  cluster_parameter_group_name_message

val make_cluster_parameter_groups_message :
  ?marker:string_ ->
  ?parameter_groups:parameter_group_list ->
  unit ->
  cluster_parameter_groups_message

val make_cluster_security_group_message :
  ?marker:string_ ->
  ?cluster_security_groups:cluster_security_groups ->
  unit ->
  cluster_security_group_message

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:availability_zone ->
  ?subnet_status:string_ ->
  unit ->
  subnet

val make_cluster_subnet_group :
  ?cluster_subnet_group_name:string_ ->
  ?description:string_ ->
  ?vpc_id:string_ ->
  ?subnet_group_status:string_ ->
  ?subnets:subnet_list ->
  ?tags:tag_list ->
  ?supported_cluster_ip_address_types:value_string_list ->
  unit ->
  cluster_subnet_group

val make_cluster_subnet_group_message :
  ?marker:string_ ->
  ?cluster_subnet_groups:cluster_subnet_groups ->
  unit ->
  cluster_subnet_group_message

val make_cluster_version :
  ?cluster_version:string_ ->
  ?cluster_parameter_group_family:string_ ->
  ?description:string_ ->
  unit ->
  cluster_version

val make_cluster_versions_message :
  ?marker:string_ -> ?cluster_versions:cluster_version_list -> unit -> cluster_versions_message

val make_clusters_message : ?marker:string_ -> ?clusters:cluster_list -> unit -> clusters_message
val make_connect : authorization:service_authorization -> unit -> connect

val make_copy_cluster_snapshot_message :
  ?source_snapshot_cluster_identifier:string_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  source_snapshot_identifier:string_ ->
  target_snapshot_identifier:string_ ->
  unit ->
  copy_cluster_snapshot_message

val make_create_authentication_profile_message :
  authentication_profile_name:authentication_profile_name_string ->
  authentication_profile_content:string_ ->
  unit ->
  create_authentication_profile_message

val make_create_cluster_message :
  ?db_name:string_ ->
  ?cluster_type:string_ ->
  ?master_user_password:sensitive_string ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?cluster_subnet_group_name:string_ ->
  ?availability_zone:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?cluster_parameter_group_name:string_ ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?port:integer_optional ->
  ?cluster_version:string_ ->
  ?allow_version_upgrade:boolean_optional ->
  ?number_of_nodes:integer_optional ->
  ?publicly_accessible:boolean_optional ->
  ?encrypted:boolean_optional ->
  ?hsm_client_certificate_identifier:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?elastic_ip:string_ ->
  ?tags:tag_list ->
  ?kms_key_id:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?additional_info:string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?maintenance_track_name:string_ ->
  ?snapshot_schedule_identifier:string_ ->
  ?availability_zone_relocation:boolean_optional ->
  ?aqua_configuration_status:aqua_configuration_status ->
  ?default_iam_role_arn:string_ ->
  ?load_sample_data:string_ ->
  ?manage_master_password:boolean_optional ->
  ?master_password_secret_kms_key_id:string_ ->
  ?ip_address_type:string_ ->
  ?multi_a_z:boolean_optional ->
  ?redshift_idc_application_arn:string_ ->
  ?catalog_name:catalog_name_string ->
  ?extra_compute_for_automatic_optimization:boolean_optional ->
  cluster_identifier:string_ ->
  node_type:string_ ->
  master_username:string_ ->
  unit ->
  create_cluster_message

val make_create_cluster_parameter_group_message :
  ?tags:tag_list ->
  parameter_group_name:string_ ->
  parameter_group_family:string_ ->
  description:string_ ->
  unit ->
  create_cluster_parameter_group_message

val make_create_cluster_security_group_message :
  ?tags:tag_list ->
  cluster_security_group_name:string_ ->
  description:string_ ->
  unit ->
  create_cluster_security_group_message

val make_create_cluster_snapshot_message :
  ?manual_snapshot_retention_period:integer_optional ->
  ?tags:tag_list ->
  snapshot_identifier:string_ ->
  cluster_identifier:string_ ->
  unit ->
  create_cluster_snapshot_message

val make_create_cluster_subnet_group_message :
  ?tags:tag_list ->
  cluster_subnet_group_name:string_ ->
  description:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_cluster_subnet_group_message

val make_create_custom_domain_association_message :
  custom_domain_name:custom_domain_name_string ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  cluster_identifier:string_ ->
  unit ->
  create_custom_domain_association_message

val make_endpoint_access :
  ?cluster_identifier:string_ ->
  ?resource_owner:string_ ->
  ?subnet_group_name:string_ ->
  ?endpoint_status:string_ ->
  ?endpoint_name:string_ ->
  ?endpoint_create_time:t_stamp ->
  ?port:integer ->
  ?address:string_ ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?vpc_endpoint:vpc_endpoint ->
  unit ->
  endpoint_access

val make_create_endpoint_access_message :
  ?cluster_identifier:string_ ->
  ?resource_owner:string_ ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  endpoint_name:string_ ->
  subnet_group_name:string_ ->
  unit ->
  create_endpoint_access_message

val make_event_subscription :
  ?customer_aws_id:string_ ->
  ?cust_subscription_id:string_ ->
  ?sns_topic_arn:string_ ->
  ?status:string_ ->
  ?subscription_creation_time:t_stamp ->
  ?source_type:string_ ->
  ?source_ids_list:source_ids_list ->
  ?event_categories_list:event_categories_list ->
  ?severity:string_ ->
  ?enabled:boolean_ ->
  ?tags:tag_list ->
  unit ->
  event_subscription

val make_create_event_subscription_message :
  ?source_type:string_ ->
  ?source_ids:source_ids_list ->
  ?event_categories:event_categories_list ->
  ?severity:string_ ->
  ?enabled:boolean_optional ->
  ?tags:tag_list ->
  subscription_name:string_ ->
  sns_topic_arn:string_ ->
  unit ->
  create_event_subscription_message

val make_hsm_client_certificate :
  ?hsm_client_certificate_identifier:string_ ->
  ?hsm_client_certificate_public_key:string_ ->
  ?tags:tag_list ->
  unit ->
  hsm_client_certificate

val make_create_hsm_client_certificate_message :
  ?tags:tag_list ->
  hsm_client_certificate_identifier:string_ ->
  unit ->
  create_hsm_client_certificate_message

val make_hsm_configuration :
  ?hsm_configuration_identifier:string_ ->
  ?description:string_ ->
  ?hsm_ip_address:string_ ->
  ?hsm_partition_name:string_ ->
  ?tags:tag_list ->
  unit ->
  hsm_configuration

val make_create_hsm_configuration_message :
  ?tags:tag_list ->
  hsm_configuration_identifier:string_ ->
  description:string_ ->
  hsm_ip_address:string_ ->
  hsm_partition_name:string_ ->
  hsm_partition_password:string_ ->
  hsm_server_public_certificate:string_ ->
  unit ->
  create_hsm_configuration_message

val make_integration_error :
  ?error_message:string_ -> error_code:string_ -> unit -> integration_error

val make_integration :
  ?integration_arn:integration_arn ->
  ?integration_name:integration_name ->
  ?source_arn:source_arn ->
  ?target_arn:target_arn ->
  ?status:zero_etl_integration_status ->
  ?errors:integration_error_list ->
  ?create_time:t_stamp ->
  ?description:description ->
  ?kms_key_id:string_ ->
  ?additional_encryption_context:encryption_context_map ->
  ?tags:tag_list ->
  unit ->
  integration

val make_create_integration_message :
  ?kms_key_id:string_ ->
  ?tag_list:tag_list ->
  ?additional_encryption_context:encryption_context_map ->
  ?description:integration_description ->
  source_arn:source_arn ->
  target_arn:target_arn ->
  integration_name:integration_name ->
  unit ->
  create_integration_message

val make_read_write_access : authorization:service_authorization -> unit -> read_write_access
val make_lake_formation_query : authorization:service_authorization -> unit -> lake_formation_query

val make_redshift_idc_application :
  ?idc_instance_arn:string_ ->
  ?redshift_idc_application_name:redshift_idc_application_name ->
  ?redshift_idc_application_arn:string_ ->
  ?identity_namespace:identity_namespace_string ->
  ?idc_display_name:idc_display_name_string ->
  ?iam_role_arn:string_ ->
  ?idc_managed_application_arn:string_ ->
  ?idc_onboard_status:string_ ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?service_integrations:service_integration_list ->
  ?application_type:application_type ->
  ?tags:tag_list ->
  ?sso_tag_keys:tag_key_list ->
  unit ->
  redshift_idc_application

val make_create_redshift_idc_application_message :
  ?identity_namespace:identity_namespace_string ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?service_integrations:service_integration_list ->
  ?application_type:application_type ->
  ?tags:tag_list ->
  ?sso_tag_keys:tag_key_list ->
  idc_instance_arn:string_ ->
  redshift_idc_application_name:redshift_idc_application_name ->
  idc_display_name:idc_display_name_string ->
  iam_role_arn:string_ ->
  unit ->
  create_redshift_idc_application_message

val make_resume_cluster_message : cluster_identifier:string_ -> unit -> resume_cluster_message
val make_pause_cluster_message : cluster_identifier:string_ -> unit -> pause_cluster_message

val make_resize_cluster_message :
  ?cluster_type:string_ ->
  ?node_type:string_ ->
  ?number_of_nodes:integer_optional ->
  ?classic:boolean_optional ->
  ?reserved_node_id:string_ ->
  ?target_reserved_node_offering_id:string_ ->
  cluster_identifier:string_ ->
  unit ->
  resize_cluster_message

val make_scheduled_action_type :
  ?resize_cluster:resize_cluster_message ->
  ?pause_cluster:pause_cluster_message ->
  ?resume_cluster:resume_cluster_message ->
  unit ->
  scheduled_action_type

val make_scheduled_action :
  ?scheduled_action_name:string_ ->
  ?target_action:scheduled_action_type ->
  ?schedule:string_ ->
  ?iam_role:string_ ->
  ?scheduled_action_description:string_ ->
  ?state:scheduled_action_state ->
  ?next_invocations:scheduled_action_time_list ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  unit ->
  scheduled_action

val make_create_scheduled_action_message :
  ?scheduled_action_description:string_ ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?enable:boolean_optional ->
  scheduled_action_name:string_ ->
  target_action:scheduled_action_type ->
  schedule:string_ ->
  iam_role:string_ ->
  unit ->
  create_scheduled_action_message

val make_snapshot_copy_grant :
  ?snapshot_copy_grant_name:string_ ->
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  unit ->
  snapshot_copy_grant

val make_create_snapshot_copy_grant_message :
  ?kms_key_id:string_ ->
  ?tags:tag_list ->
  snapshot_copy_grant_name:string_ ->
  unit ->
  create_snapshot_copy_grant_message

val make_snapshot_schedule :
  ?schedule_definitions:schedule_definition_list ->
  ?schedule_identifier:string_ ->
  ?schedule_description:string_ ->
  ?tags:tag_list ->
  ?next_invocations:scheduled_snapshot_time_list ->
  ?associated_cluster_count:integer_optional ->
  ?associated_clusters:associated_cluster_list ->
  unit ->
  snapshot_schedule

val make_create_snapshot_schedule_message :
  ?schedule_definitions:schedule_definition_list ->
  ?schedule_identifier:string_ ->
  ?schedule_description:string_ ->
  ?tags:tag_list ->
  ?dry_run:boolean_optional ->
  ?next_invocations:integer_optional ->
  unit ->
  create_snapshot_schedule_message

val make_create_tags_message : resource_name:string_ -> tags:tag_list -> unit -> create_tags_message

val make_usage_limit :
  ?usage_limit_id:string_ ->
  ?cluster_identifier:string_ ->
  ?feature_type:usage_limit_feature_type ->
  ?limit_type:usage_limit_limit_type ->
  ?amount:long ->
  ?period:usage_limit_period ->
  ?breach_action:usage_limit_breach_action ->
  ?tags:tag_list ->
  unit ->
  usage_limit

val make_create_usage_limit_message :
  ?period:usage_limit_period ->
  ?breach_action:usage_limit_breach_action ->
  ?tags:tag_list ->
  cluster_identifier:string_ ->
  feature_type:usage_limit_feature_type ->
  limit_type:usage_limit_limit_type ->
  amount:long ->
  unit ->
  create_usage_limit_message

val make_custom_domain_associations_message :
  ?marker:string_ -> ?associations:association_list -> unit -> custom_domain_associations_message

val make_customer_storage_message :
  ?total_backup_size_in_mega_bytes:double ->
  ?total_provisioned_storage_in_mega_bytes:double ->
  unit ->
  customer_storage_message

val make_deauthorize_data_share_message :
  data_share_arn:string_ -> consumer_identifier:string_ -> unit -> deauthorize_data_share_message

val make_default_cluster_parameters :
  ?parameter_group_family:string_ ->
  ?marker:string_ ->
  ?parameters:parameters_list ->
  unit ->
  default_cluster_parameters

val make_delete_authentication_profile_message :
  authentication_profile_name:authentication_profile_name_string ->
  unit ->
  delete_authentication_profile_message

val make_delete_cluster_message :
  ?skip_final_cluster_snapshot:boolean_ ->
  ?final_cluster_snapshot_identifier:string_ ->
  ?final_cluster_snapshot_retention_period:integer_optional ->
  cluster_identifier:string_ ->
  unit ->
  delete_cluster_message

val make_delete_cluster_parameter_group_message :
  parameter_group_name:string_ -> unit -> delete_cluster_parameter_group_message

val make_delete_cluster_security_group_message :
  cluster_security_group_name:string_ -> unit -> delete_cluster_security_group_message

val make_delete_cluster_subnet_group_message :
  cluster_subnet_group_name:string_ -> unit -> delete_cluster_subnet_group_message

val make_delete_custom_domain_association_message :
  cluster_identifier:string_ ->
  custom_domain_name:custom_domain_name_string ->
  unit ->
  delete_custom_domain_association_message

val make_delete_endpoint_access_message :
  endpoint_name:string_ -> unit -> delete_endpoint_access_message

val make_delete_event_subscription_message :
  subscription_name:string_ -> unit -> delete_event_subscription_message

val make_delete_hsm_client_certificate_message :
  hsm_client_certificate_identifier:string_ -> unit -> delete_hsm_client_certificate_message

val make_delete_hsm_configuration_message :
  hsm_configuration_identifier:string_ -> unit -> delete_hsm_configuration_message

val make_delete_integration_message :
  integration_arn:integration_arn -> unit -> delete_integration_message

val make_delete_redshift_idc_application_message :
  redshift_idc_application_arn:string_ -> unit -> delete_redshift_idc_application_message

val make_delete_resource_policy_message :
  resource_arn:string_ -> unit -> delete_resource_policy_message

val make_delete_scheduled_action_message :
  scheduled_action_name:string_ -> unit -> delete_scheduled_action_message

val make_delete_snapshot_copy_grant_message :
  snapshot_copy_grant_name:string_ -> unit -> delete_snapshot_copy_grant_message

val make_delete_snapshot_schedule_message :
  schedule_identifier:string_ -> unit -> delete_snapshot_schedule_message

val make_delete_tags_message :
  resource_name:string_ -> tag_keys:tag_key_list -> unit -> delete_tags_message

val make_delete_usage_limit_message : usage_limit_id:string_ -> unit -> delete_usage_limit_message

val make_deregister_namespace_output_message :
  ?status:namespace_registration_status -> unit -> deregister_namespace_output_message

val make_provisioned_identifier : cluster_identifier:string_ -> unit -> provisioned_identifier

val make_serverless_identifier :
  namespace_identifier:string_ -> workgroup_identifier:string_ -> unit -> serverless_identifier

val make_deregister_namespace_input_message :
  namespace_identifier:namespace_identifier_union ->
  consumer_identifiers:consumer_identifier_list ->
  unit ->
  deregister_namespace_input_message

val make_describe_account_attributes_message :
  ?attribute_names:attribute_name_list -> unit -> describe_account_attributes_message

val make_describe_authentication_profiles_message :
  ?authentication_profile_name:authentication_profile_name_string ->
  unit ->
  describe_authentication_profiles_message

val make_describe_cluster_db_revisions_message :
  ?cluster_identifier:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cluster_db_revisions_message

val make_describe_cluster_parameter_groups_message :
  ?parameter_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_cluster_parameter_groups_message

val make_describe_cluster_parameters_message :
  ?source:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  parameter_group_name:string_ ->
  unit ->
  describe_cluster_parameters_message

val make_describe_cluster_security_groups_message :
  ?cluster_security_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_cluster_security_groups_message

val make_snapshot_message : ?marker:string_ -> ?snapshots:snapshot_list -> unit -> snapshot_message

val make_snapshot_sorting_entity :
  ?sort_order:sort_by_order ->
  attribute:snapshot_attribute_to_sort_by ->
  unit ->
  snapshot_sorting_entity

val make_describe_cluster_snapshots_message :
  ?cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_type:string_ ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?owner_account:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  ?cluster_exists:boolean_optional ->
  ?sorting_entities:snapshot_sorting_entity_list ->
  unit ->
  describe_cluster_snapshots_message

val make_describe_cluster_subnet_groups_message :
  ?cluster_subnet_group_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_cluster_subnet_groups_message

val make_supported_operation : ?operation_name:string_ -> unit -> supported_operation

val make_update_target :
  ?maintenance_track_name:string_ ->
  ?database_version:string_ ->
  ?supported_operations:supported_operation_list ->
  unit ->
  update_target

val make_maintenance_track :
  ?maintenance_track_name:string_ ->
  ?database_version:string_ ->
  ?update_targets:eligible_tracks_to_update_list ->
  unit ->
  maintenance_track

val make_track_list_message :
  ?maintenance_tracks:track_list -> ?marker:string_ -> unit -> track_list_message

val make_describe_cluster_tracks_message :
  ?maintenance_track_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cluster_tracks_message

val make_describe_cluster_versions_message :
  ?cluster_version:string_ ->
  ?cluster_parameter_group_family:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_cluster_versions_message

val make_describe_clusters_message :
  ?cluster_identifier:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_clusters_message

val make_describe_custom_domain_associations_message :
  ?custom_domain_name:custom_domain_name_string ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_custom_domain_associations_message

val make_describe_data_shares_message :
  ?data_share_arn:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_data_shares_message

val make_describe_data_shares_for_consumer_message :
  ?consumer_arn:string_ ->
  ?status:data_share_status_for_consumer ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_data_shares_for_consumer_message

val make_describe_data_shares_for_producer_message :
  ?producer_arn:string_ ->
  ?status:data_share_status_for_producer ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_data_shares_for_producer_message

val make_describe_default_cluster_parameters_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  parameter_group_family:string_ ->
  unit ->
  describe_default_cluster_parameters_message

val make_endpoint_access_list :
  ?endpoint_access_list:endpoint_accesses -> ?marker:string_ -> unit -> endpoint_access_list

val make_describe_endpoint_access_message :
  ?cluster_identifier:string_ ->
  ?resource_owner:string_ ->
  ?endpoint_name:string_ ->
  ?vpc_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_endpoint_access_message

val make_endpoint_authorization_list :
  ?endpoint_authorization_list:endpoint_authorizations ->
  ?marker:string_ ->
  unit ->
  endpoint_authorization_list

val make_describe_endpoint_authorization_message :
  ?cluster_identifier:string_ ->
  ?account:string_ ->
  ?grantee:boolean_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_endpoint_authorization_message

val make_event_info_map :
  ?event_id:string_ ->
  ?event_categories:event_categories_list ->
  ?event_description:string_ ->
  ?severity:string_ ->
  unit ->
  event_info_map

val make_event_categories_map :
  ?source_type:string_ -> ?events:event_info_map_list -> unit -> event_categories_map

val make_event_categories_message :
  ?event_categories_map_list:event_categories_map_list -> unit -> event_categories_message

val make_describe_event_categories_message :
  ?source_type:string_ -> unit -> describe_event_categories_message

val make_event_subscriptions_message :
  ?marker:string_ ->
  ?event_subscriptions_list:event_subscriptions_list ->
  unit ->
  event_subscriptions_message

val make_describe_event_subscriptions_message :
  ?subscription_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_event_subscriptions_message

val make_event :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?message:string_ ->
  ?event_categories:event_categories_list ->
  ?severity:string_ ->
  ?date:t_stamp ->
  ?event_id:string_ ->
  unit ->
  event

val make_events_message : ?marker:string_ -> ?events:event_list -> unit -> events_message

val make_describe_events_message :
  ?source_identifier:string_ ->
  ?source_type:source_type ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?duration:integer_optional ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_events_message

val make_hsm_client_certificate_message :
  ?marker:string_ ->
  ?hsm_client_certificates:hsm_client_certificate_list ->
  unit ->
  hsm_client_certificate_message

val make_describe_hsm_client_certificates_message :
  ?hsm_client_certificate_identifier:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_hsm_client_certificates_message

val make_hsm_configuration_message :
  ?marker:string_ -> ?hsm_configurations:hsm_configuration_list -> unit -> hsm_configuration_message

val make_describe_hsm_configurations_message :
  ?hsm_configuration_identifier:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_hsm_configurations_message

val make_inbound_integration :
  ?integration_arn:inbound_integration_arn ->
  ?source_arn:string_ ->
  ?target_arn:target_arn ->
  ?status:zero_etl_integration_status ->
  ?errors:integration_error_list ->
  ?create_time:t_stamp ->
  unit ->
  inbound_integration

val make_inbound_integrations_message :
  ?marker:string_ ->
  ?inbound_integrations:inbound_integration_list ->
  unit ->
  inbound_integrations_message

val make_describe_inbound_integrations_message :
  ?integration_arn:inbound_integration_arn ->
  ?target_arn:target_arn ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_inbound_integrations_message

val make_integrations_message :
  ?marker:string_ -> ?integrations:integration_list -> unit -> integrations_message

val make_describe_integrations_filter :
  name:describe_integrations_filter_name ->
  values:describe_integrations_filter_value_list ->
  unit ->
  describe_integrations_filter

val make_describe_integrations_message :
  ?integration_arn:integration_arn ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?filters:describe_integrations_filter_list ->
  unit ->
  describe_integrations_message

val make_logging_status :
  ?logging_enabled:boolean_ ->
  ?bucket_name:string_ ->
  ?s3_key_prefix:s3_key_prefix_value ->
  ?last_successful_delivery_time:t_stamp ->
  ?last_failure_time:t_stamp ->
  ?last_failure_message:string_ ->
  ?log_destination_type:log_destination_type ->
  ?log_exports:log_type_list ->
  unit ->
  logging_status

val make_describe_logging_status_message :
  cluster_identifier:string_ -> unit -> describe_logging_status_message

val make_node_configuration_option :
  ?node_type:string_ ->
  ?number_of_nodes:integer ->
  ?estimated_disk_utilization_percent:double_optional ->
  ?mode:mode ->
  unit ->
  node_configuration_option

val make_node_configuration_options_message :
  ?node_configuration_option_list:node_configuration_option_list ->
  ?marker:string_ ->
  unit ->
  node_configuration_options_message

val make_node_configuration_options_filter :
  ?name:node_configuration_options_filter_name ->
  ?operator:operator_type ->
  ?values:value_string_list ->
  unit ->
  node_configuration_options_filter

val make_describe_node_configuration_options_message :
  ?cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?owner_account:string_ ->
  ?filters:node_configuration_options_filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  action_type:action_type ->
  unit ->
  describe_node_configuration_options_message

val make_orderable_cluster_option :
  ?cluster_version:string_ ->
  ?cluster_type:string_ ->
  ?node_type:string_ ->
  ?availability_zones:availability_zone_list ->
  unit ->
  orderable_cluster_option

val make_orderable_cluster_options_message :
  ?orderable_cluster_options:orderable_cluster_options_list ->
  ?marker:string_ ->
  unit ->
  orderable_cluster_options_message

val make_describe_orderable_cluster_options_message :
  ?cluster_version:string_ ->
  ?node_type:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_orderable_cluster_options_message

val make_partner_integration_info :
  ?database_name:partner_integration_database_name ->
  ?partner_name:partner_integration_partner_name ->
  ?status:partner_integration_status ->
  ?status_message:partner_integration_status_message ->
  ?created_at:t_stamp ->
  ?updated_at:t_stamp ->
  unit ->
  partner_integration_info

val make_describe_partners_output_message :
  ?partner_integration_info_list:partner_integration_info_list ->
  unit ->
  describe_partners_output_message

val make_describe_partners_input_message :
  ?database_name:partner_integration_database_name ->
  ?partner_name:partner_integration_partner_name ->
  account_id:partner_integration_account_id ->
  cluster_identifier:partner_integration_cluster_identifier ->
  unit ->
  describe_partners_input_message

val make_describe_redshift_idc_applications_message :
  ?redshift_idc_application_arn:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_redshift_idc_applications_message

val make_describe_reserved_node_exchange_status_output_message :
  ?reserved_node_exchange_status_details:reserved_node_exchange_status_list ->
  ?marker:string_ ->
  unit ->
  describe_reserved_node_exchange_status_output_message

val make_describe_reserved_node_exchange_status_input_message :
  ?reserved_node_id:string_ ->
  ?reserved_node_exchange_request_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_node_exchange_status_input_message

val make_reserved_node_offering :
  ?reserved_node_offering_id:string_ ->
  ?node_type:string_ ->
  ?duration:integer ->
  ?fixed_price:double ->
  ?usage_price:double ->
  ?currency_code:string_ ->
  ?offering_type:string_ ->
  ?recurring_charges:recurring_charge_list ->
  ?reserved_node_offering_type:reserved_node_offering_type ->
  unit ->
  reserved_node_offering

val make_reserved_node_offerings_message :
  ?marker:string_ ->
  ?reserved_node_offerings:reserved_node_offering_list ->
  unit ->
  reserved_node_offerings_message

val make_describe_reserved_node_offerings_message :
  ?reserved_node_offering_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_node_offerings_message

val make_reserved_nodes_message :
  ?marker:string_ -> ?reserved_nodes:reserved_node_list -> unit -> reserved_nodes_message

val make_describe_reserved_nodes_message :
  ?reserved_node_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_reserved_nodes_message

val make_describe_resize_message : cluster_identifier:string_ -> unit -> describe_resize_message

val make_scheduled_actions_message :
  ?marker:string_ -> ?scheduled_actions:scheduled_action_list -> unit -> scheduled_actions_message

val make_scheduled_action_filter :
  name:scheduled_action_filter_name -> values:value_string_list -> unit -> scheduled_action_filter

val make_describe_scheduled_actions_message :
  ?scheduled_action_name:string_ ->
  ?target_action_type:scheduled_action_type_values ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?active:boolean_optional ->
  ?filters:scheduled_action_filter_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_scheduled_actions_message

val make_snapshot_copy_grant_message :
  ?marker:string_ ->
  ?snapshot_copy_grants:snapshot_copy_grant_list ->
  unit ->
  snapshot_copy_grant_message

val make_describe_snapshot_copy_grants_message :
  ?snapshot_copy_grant_name:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_snapshot_copy_grants_message

val make_describe_snapshot_schedules_output_message :
  ?snapshot_schedules:snapshot_schedule_list ->
  ?marker:string_ ->
  unit ->
  describe_snapshot_schedules_output_message

val make_describe_snapshot_schedules_message :
  ?cluster_identifier:string_ ->
  ?schedule_identifier:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  ?marker:string_ ->
  ?max_records:integer_optional ->
  unit ->
  describe_snapshot_schedules_message

val make_table_restore_status :
  ?table_restore_request_id:string_ ->
  ?status:table_restore_status_type ->
  ?message:string_ ->
  ?request_time:t_stamp ->
  ?progress_in_mega_bytes:long_optional ->
  ?total_data_in_mega_bytes:long_optional ->
  ?cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  ?source_database_name:string_ ->
  ?source_schema_name:string_ ->
  ?source_table_name:string_ ->
  ?target_database_name:string_ ->
  ?target_schema_name:string_ ->
  ?new_table_name:string_ ->
  unit ->
  table_restore_status

val make_table_restore_status_message :
  ?table_restore_status_details:table_restore_status_list ->
  ?marker:string_ ->
  unit ->
  table_restore_status_message

val make_describe_table_restore_status_message :
  ?cluster_identifier:string_ ->
  ?table_restore_request_id:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  describe_table_restore_status_message

val make_tagged_resource :
  ?tag:tag -> ?resource_name:string_ -> ?resource_type:string_ -> unit -> tagged_resource

val make_tagged_resource_list_message :
  ?tagged_resources:tagged_resource_list -> ?marker:string_ -> unit -> tagged_resource_list_message

val make_describe_tags_message :
  ?resource_name:string_ ->
  ?resource_type:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_tags_message

val make_usage_limit_list :
  ?usage_limits:usage_limits -> ?marker:string_ -> unit -> usage_limit_list

val make_describe_usage_limits_message :
  ?usage_limit_id:string_ ->
  ?cluster_identifier:string_ ->
  ?feature_type:usage_limit_feature_type ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  ?tag_keys:tag_key_list ->
  ?tag_values:tag_value_list ->
  unit ->
  describe_usage_limits_message

val make_disable_logging_message : cluster_identifier:string_ -> unit -> disable_logging_message

val make_disable_snapshot_copy_message :
  cluster_identifier:string_ -> unit -> disable_snapshot_copy_message

val make_disassociate_data_share_consumer_message :
  ?disassociate_entire_account:boolean_optional ->
  ?consumer_arn:string_ ->
  ?consumer_region:string_ ->
  data_share_arn:string_ ->
  unit ->
  disassociate_data_share_consumer_message

val make_enable_logging_message :
  ?bucket_name:string_ ->
  ?s3_key_prefix:s3_key_prefix_value ->
  ?log_destination_type:log_destination_type ->
  ?log_exports:log_type_list ->
  cluster_identifier:string_ ->
  unit ->
  enable_logging_message

val make_enable_snapshot_copy_message :
  ?retention_period:integer_optional ->
  ?snapshot_copy_grant_name:string_ ->
  ?manual_snapshot_retention_period:integer_optional ->
  cluster_identifier:string_ ->
  destination_region:string_ ->
  unit ->
  enable_snapshot_copy_message

val make_failover_primary_compute_input_message :
  cluster_identifier:string_ -> unit -> failover_primary_compute_input_message

val make_get_cluster_credentials_message :
  ?db_name:string_ ->
  ?cluster_identifier:string_ ->
  ?duration_seconds:integer_optional ->
  ?auto_create:boolean_optional ->
  ?db_groups:db_group_list ->
  ?custom_domain_name:string_ ->
  db_user:string_ ->
  unit ->
  get_cluster_credentials_message

val make_get_cluster_credentials_with_iam_message :
  ?db_name:string_ ->
  ?cluster_identifier:string_ ->
  ?duration_seconds:integer_optional ->
  ?custom_domain_name:string_ ->
  unit ->
  get_cluster_credentials_with_iam_message

val make_get_identity_center_auth_token_response :
  ?token:sensitive_string ->
  ?expiration_time:t_stamp ->
  unit ->
  get_identity_center_auth_token_response

val make_get_identity_center_auth_token_request :
  cluster_ids:cluster_identifier_list -> unit -> get_identity_center_auth_token_request

val make_reserved_node_configuration_option :
  ?source_reserved_node:reserved_node ->
  ?target_reserved_node_count:integer ->
  ?target_reserved_node_offering:reserved_node_offering ->
  unit ->
  reserved_node_configuration_option

val make_get_reserved_node_exchange_configuration_options_output_message :
  ?marker:string_ ->
  ?reserved_node_configuration_option_list:reserved_node_configuration_option_list ->
  unit ->
  get_reserved_node_exchange_configuration_options_output_message

val make_get_reserved_node_exchange_configuration_options_input_message :
  ?cluster_identifier:string_ ->
  ?snapshot_identifier:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  action_type:reserved_node_exchange_action_type ->
  unit ->
  get_reserved_node_exchange_configuration_options_input_message

val make_get_reserved_node_exchange_offerings_output_message :
  ?marker:string_ ->
  ?reserved_node_offerings:reserved_node_offering_list ->
  unit ->
  get_reserved_node_exchange_offerings_output_message

val make_get_reserved_node_exchange_offerings_input_message :
  ?max_records:integer_optional ->
  ?marker:string_ ->
  reserved_node_id:string_ ->
  unit ->
  get_reserved_node_exchange_offerings_input_message

val make_resource_policy : ?resource_arn:string_ -> ?policy:string_ -> unit -> resource_policy
val make_get_resource_policy_message : resource_arn:string_ -> unit -> get_resource_policy_message

val make_lakehouse_configuration :
  ?cluster_identifier:string_ ->
  ?lakehouse_idc_application_arn:string_ ->
  ?lakehouse_registration_status:string_ ->
  ?catalog_arn:string_ ->
  unit ->
  lakehouse_configuration

val make_reference_link : ?text:string_ -> ?link:string_ -> unit -> reference_link

val make_recommended_action :
  ?text:string_ ->
  ?database:string_ ->
  ?command:string_ ->
  ?type_:recommended_action_type ->
  unit ->
  recommended_action

val make_recommendation :
  ?id:string_ ->
  ?cluster_identifier:string_ ->
  ?namespace_arn:string_ ->
  ?created_at:t_stamp ->
  ?recommendation_type:string_ ->
  ?title:string_ ->
  ?description:string_ ->
  ?observation:string_ ->
  ?impact_ranking:impact_ranking_type ->
  ?recommendation_text:string_ ->
  ?recommended_actions:recommended_action_list ->
  ?reference_links:reference_link_list ->
  unit ->
  recommendation

val make_list_recommendations_message :
  ?cluster_identifier:string_ ->
  ?namespace_arn:string_ ->
  ?max_records:integer_optional ->
  ?marker:string_ ->
  unit ->
  list_recommendations_message

val make_modify_aqua_output_message :
  ?aqua_configuration:aqua_configuration -> unit -> modify_aqua_output_message

val make_modify_aqua_input_message :
  ?aqua_configuration_status:aqua_configuration_status ->
  cluster_identifier:string_ ->
  unit ->
  modify_aqua_input_message

val make_modify_authentication_profile_message :
  authentication_profile_name:authentication_profile_name_string ->
  authentication_profile_content:string_ ->
  unit ->
  modify_authentication_profile_message

val make_modify_cluster_message :
  ?cluster_type:string_ ->
  ?node_type:string_ ->
  ?number_of_nodes:integer_optional ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?master_user_password:sensitive_string ->
  ?cluster_parameter_group_name:string_ ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?preferred_maintenance_window:string_ ->
  ?cluster_version:string_ ->
  ?allow_version_upgrade:boolean_optional ->
  ?hsm_client_certificate_identifier:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?new_cluster_identifier:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?elastic_ip:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?maintenance_track_name:string_ ->
  ?encrypted:boolean_optional ->
  ?kms_key_id:string_ ->
  ?availability_zone_relocation:boolean_optional ->
  ?availability_zone:string_ ->
  ?port:integer_optional ->
  ?manage_master_password:boolean_optional ->
  ?master_password_secret_kms_key_id:string_ ->
  ?ip_address_type:string_ ->
  ?multi_a_z:boolean_optional ->
  ?extra_compute_for_automatic_optimization:boolean_optional ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_message

val make_modify_cluster_db_revision_message :
  cluster_identifier:string_ ->
  revision_target:string_ ->
  unit ->
  modify_cluster_db_revision_message

val make_modify_cluster_iam_roles_message :
  ?add_iam_roles:iam_role_arn_list ->
  ?remove_iam_roles:iam_role_arn_list ->
  ?default_iam_role_arn:string_ ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_iam_roles_message

val make_modify_cluster_maintenance_message :
  ?defer_maintenance:boolean_optional ->
  ?defer_maintenance_identifier:string_ ->
  ?defer_maintenance_start_time:t_stamp ->
  ?defer_maintenance_end_time:t_stamp ->
  ?defer_maintenance_duration:integer_optional ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_maintenance_message

val make_modify_cluster_parameter_group_message :
  parameter_group_name:string_ ->
  parameters:parameters_list ->
  unit ->
  modify_cluster_parameter_group_message

val make_modify_cluster_snapshot_message :
  ?manual_snapshot_retention_period:integer_optional ->
  ?force:boolean_ ->
  snapshot_identifier:string_ ->
  unit ->
  modify_cluster_snapshot_message

val make_modify_cluster_snapshot_schedule_message :
  ?schedule_identifier:string_ ->
  ?disassociate_schedule:boolean_optional ->
  cluster_identifier:string_ ->
  unit ->
  modify_cluster_snapshot_schedule_message

val make_modify_cluster_subnet_group_message :
  ?description:string_ ->
  cluster_subnet_group_name:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  modify_cluster_subnet_group_message

val make_modify_custom_domain_association_message :
  custom_domain_name:custom_domain_name_string ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  cluster_identifier:string_ ->
  unit ->
  modify_custom_domain_association_message

val make_modify_endpoint_access_message :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  endpoint_name:string_ ->
  unit ->
  modify_endpoint_access_message

val make_modify_event_subscription_message :
  ?sns_topic_arn:string_ ->
  ?source_type:string_ ->
  ?source_ids:source_ids_list ->
  ?event_categories:event_categories_list ->
  ?severity:string_ ->
  ?enabled:boolean_optional ->
  subscription_name:string_ ->
  unit ->
  modify_event_subscription_message

val make_modify_integration_message :
  ?description:integration_description ->
  ?integration_name:integration_name ->
  integration_arn:integration_arn ->
  unit ->
  modify_integration_message

val make_modify_lakehouse_configuration_message :
  ?lakehouse_registration:lakehouse_registration ->
  ?catalog_name:catalog_name_string ->
  ?lakehouse_idc_registration:lakehouse_idc_registration ->
  ?lakehouse_idc_application_arn:string_ ->
  ?dry_run:boolean_optional ->
  cluster_identifier:string_ ->
  unit ->
  modify_lakehouse_configuration_message

val make_modify_redshift_idc_application_message :
  ?identity_namespace:identity_namespace_string ->
  ?iam_role_arn:string_ ->
  ?idc_display_name:idc_display_name_string ->
  ?authorized_token_issuer_list:authorized_token_issuer_list ->
  ?service_integrations:service_integration_list ->
  redshift_idc_application_arn:string_ ->
  unit ->
  modify_redshift_idc_application_message

val make_modify_scheduled_action_message :
  ?target_action:scheduled_action_type ->
  ?schedule:string_ ->
  ?iam_role:string_ ->
  ?scheduled_action_description:string_ ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?enable:boolean_optional ->
  scheduled_action_name:string_ ->
  unit ->
  modify_scheduled_action_message

val make_modify_snapshot_copy_retention_period_message :
  ?manual:boolean_ ->
  cluster_identifier:string_ ->
  retention_period:integer ->
  unit ->
  modify_snapshot_copy_retention_period_message

val make_modify_snapshot_schedule_message :
  schedule_identifier:string_ ->
  schedule_definitions:schedule_definition_list ->
  unit ->
  modify_snapshot_schedule_message

val make_modify_usage_limit_message :
  ?amount:long_optional ->
  ?breach_action:usage_limit_breach_action ->
  usage_limit_id:string_ ->
  unit ->
  modify_usage_limit_message

val make_purchase_reserved_node_offering_message :
  ?node_count:integer_optional ->
  reserved_node_offering_id:string_ ->
  unit ->
  purchase_reserved_node_offering_message

val make_put_resource_policy_message :
  resource_arn:string_ -> policy:string_ -> unit -> put_resource_policy_message

val make_reboot_cluster_message : cluster_identifier:string_ -> unit -> reboot_cluster_message

val make_update_partner_status_input_message :
  ?status_message:partner_integration_status_message ->
  account_id:partner_integration_account_id ->
  cluster_identifier:partner_integration_cluster_identifier ->
  database_name:partner_integration_database_name ->
  partner_name:partner_integration_partner_name ->
  status:partner_integration_status ->
  unit ->
  update_partner_status_input_message

val make_rotate_encryption_key_message :
  cluster_identifier:string_ -> unit -> rotate_encryption_key_message

val make_revoke_snapshot_access_message :
  ?snapshot_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_cluster_identifier:string_ ->
  account_with_restore_access:string_ ->
  unit ->
  revoke_snapshot_access_message

val make_revoke_endpoint_access_message :
  ?cluster_identifier:string_ ->
  ?account:string_ ->
  ?vpc_ids:vpc_identifier_list ->
  ?force:boolean_ ->
  unit ->
  revoke_endpoint_access_message

val make_revoke_cluster_security_group_ingress_message :
  ?cidri_p:string_ ->
  ?ec2_security_group_name:string_ ->
  ?ec2_security_group_owner_id:string_ ->
  cluster_security_group_name:string_ ->
  unit ->
  revoke_cluster_security_group_ingress_message

val make_restore_table_from_cluster_snapshot_message :
  ?source_schema_name:string_ ->
  ?target_database_name:string_ ->
  ?target_schema_name:string_ ->
  ?enable_case_sensitive_identifier:boolean_optional ->
  cluster_identifier:string_ ->
  snapshot_identifier:string_ ->
  source_database_name:string_ ->
  source_table_name:string_ ->
  new_table_name:string_ ->
  unit ->
  restore_table_from_cluster_snapshot_message

val make_restore_from_cluster_snapshot_message :
  ?snapshot_identifier:string_ ->
  ?snapshot_arn:string_ ->
  ?snapshot_cluster_identifier:string_ ->
  ?port:integer_optional ->
  ?availability_zone:string_ ->
  ?allow_version_upgrade:boolean_optional ->
  ?cluster_subnet_group_name:string_ ->
  ?publicly_accessible:boolean_optional ->
  ?owner_account:string_ ->
  ?hsm_client_certificate_identifier:string_ ->
  ?hsm_configuration_identifier:string_ ->
  ?elastic_ip:string_ ->
  ?cluster_parameter_group_name:string_ ->
  ?cluster_security_groups:cluster_security_group_name_list ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?preferred_maintenance_window:string_ ->
  ?automated_snapshot_retention_period:integer_optional ->
  ?manual_snapshot_retention_period:integer_optional ->
  ?kms_key_id:string_ ->
  ?node_type:string_ ->
  ?enhanced_vpc_routing:boolean_optional ->
  ?additional_info:string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?maintenance_track_name:string_ ->
  ?snapshot_schedule_identifier:string_ ->
  ?number_of_nodes:integer_optional ->
  ?availability_zone_relocation:boolean_optional ->
  ?aqua_configuration_status:aqua_configuration_status ->
  ?default_iam_role_arn:string_ ->
  ?reserved_node_id:string_ ->
  ?target_reserved_node_offering_id:string_ ->
  ?encrypted:boolean_optional ->
  ?manage_master_password:boolean_optional ->
  ?master_password_secret_kms_key_id:string_ ->
  ?ip_address_type:string_ ->
  ?multi_a_z:boolean_optional ->
  ?catalog_name:catalog_name_string ->
  ?redshift_idc_application_arn:string_ ->
  cluster_identifier:string_ ->
  unit ->
  restore_from_cluster_snapshot_message

val make_reset_cluster_parameter_group_message :
  ?reset_all_parameters:boolean_ ->
  ?parameters:parameters_list ->
  parameter_group_name:string_ ->
  unit ->
  reset_cluster_parameter_group_message

val make_reject_data_share_message : data_share_arn:string_ -> unit -> reject_data_share_message

val make_register_namespace_output_message :
  ?status:namespace_registration_status -> unit -> register_namespace_output_message

val make_register_namespace_input_message :
  namespace_identifier:namespace_identifier_union ->
  consumer_identifiers:consumer_identifier_list ->
  unit ->
  register_namespace_input_message
