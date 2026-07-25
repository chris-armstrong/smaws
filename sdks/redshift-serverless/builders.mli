open Types

val make_association :
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_name:custom_domain_name ->
  ?workgroup_name:workgroup_name ->
  unit ->
  association

val make_config_parameter :
  ?parameter_key:parameter_key -> ?parameter_value:parameter_value -> unit -> config_parameter

val make_snapshot :
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?admin_username:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:snapshot_status ->
  ?kms_key_id:kms_key_id ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_backup_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?actual_incremental_backup_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?backup_progress_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?current_backup_rate_in_mega_bytes_per_second:Smaws_Lib.Smithy_api.Types.double ->
  ?estimated_seconds_to_completion:Smaws_Lib.Smithy_api.Types.long ->
  ?elapsed_time_in_seconds:Smaws_Lib.Smithy_api.Types.long ->
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?snapshot_remaining_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?snapshot_retention_start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?accounts_with_restore_access:account_id_list ->
  ?accounts_with_provisioned_restore_access:account_id_list ->
  ?admin_password_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  unit ->
  snapshot

val make_convert_recovery_point_to_snapshot_response :
  ?snapshot:snapshot -> unit -> convert_recovery_point_to_snapshot_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_convert_recovery_point_to_snapshot_request :
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?tags:tag_list ->
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  convert_recovery_point_to_snapshot_request

val make_create_custom_domain_association_response :
  ?custom_domain_name:custom_domain_name ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  create_custom_domain_association_response

val make_create_custom_domain_association_request :
  workgroup_name:workgroup_name ->
  custom_domain_name:custom_domain_name ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  unit ->
  create_custom_domain_association_request

val make_network_interface :
  ?network_interface_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subnet_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ipv6_address:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  network_interface

val make_vpc_endpoint :
  ?vpc_endpoint_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?network_interfaces:network_interface_list ->
  unit ->
  vpc_endpoint

val make_vpc_security_group_membership :
  ?vpc_security_group_id:vpc_security_group_id ->
  ?status:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  vpc_security_group_membership

val make_endpoint_access :
  ?endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subnet_ids:subnet_id_list ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?vpc_endpoint:vpc_endpoint ->
  ?endpoint_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  endpoint_access

val make_create_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> create_endpoint_access_response

val make_create_endpoint_access_request :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  ?owner_account:owner_account ->
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  subnet_ids:subnet_id_list ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_endpoint_access_request

val make_namespace :
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  ?admin_username:db_user ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?log_exports:log_export_list ->
  ?status:namespace_status ->
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?admin_password_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?lakehouse_registration_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  namespace

val make_create_namespace_response : ?namespace:namespace -> unit -> create_namespace_response

val make_create_namespace_request :
  ?admin_username:db_user ->
  ?admin_user_password:db_password ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?log_exports:log_export_list ->
  ?tags:tag_list ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?redshift_idc_application_arn:redshift_idc_application_arn ->
  namespace_name:namespace_name ->
  unit ->
  create_namespace_request

val make_reservation_offering :
  ?offering_id:offering_id ->
  ?duration:duration ->
  ?upfront_charge:charge ->
  ?hourly_charge:charge ->
  ?currency_code:currency_code ->
  ?offering_type:offering_type ->
  unit ->
  reservation_offering

val make_reservation :
  ?reservation_id:reservation_id ->
  ?reservation_arn:reservation_arn ->
  ?start_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?capacity:capacity ->
  ?offering:reservation_offering ->
  ?status:status ->
  unit ->
  reservation

val make_create_reservation_response :
  ?reservation:reservation -> unit -> create_reservation_response

val make_create_reservation_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  capacity:capacity ->
  offering_id:offering_id ->
  unit ->
  create_reservation_request

val make_create_snapshot_schedule_action_parameters :
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?tags:tag_list ->
  namespace_name:namespace_name ->
  snapshot_name_prefix:snapshot_name_prefix ->
  unit ->
  create_snapshot_schedule_action_parameters

val make_scheduled_action_response :
  ?scheduled_action_name:scheduled_action_name ->
  ?schedule:schedule ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_invocations:next_invocations_list ->
  ?role_arn:iam_role_arn ->
  ?state:state ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?target_action:target_action ->
  ?namespace_name:namespace_name ->
  ?scheduled_action_uuid:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  scheduled_action_response

val make_create_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> create_scheduled_action_response

val make_create_scheduled_action_request :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  scheduled_action_name:scheduled_action_name ->
  target_action:target_action ->
  schedule:schedule ->
  role_arn:iam_role_arn ->
  namespace_name:namespace_name ->
  unit ->
  create_scheduled_action_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?tags:tag_list ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_snapshot_request

val make_snapshot_copy_configuration :
  ?snapshot_copy_configuration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_copy_configuration_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  ?destination_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?destination_kms_key_id:kms_key_id ->
  unit ->
  snapshot_copy_configuration

val make_create_snapshot_copy_configuration_response :
  snapshot_copy_configuration:snapshot_copy_configuration ->
  unit ->
  create_snapshot_copy_configuration_response

val make_create_snapshot_copy_configuration_request :
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?destination_kms_key_id:kms_key_id ->
  namespace_name:namespace_name ->
  destination_region:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_snapshot_copy_configuration_request

val make_usage_limit :
  ?usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_limit_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_type:usage_limit_usage_type ->
  ?amount:Smaws_Lib.Smithy_api.Types.long ->
  ?period:usage_limit_period ->
  ?breach_action:usage_limit_breach_action ->
  unit ->
  usage_limit

val make_create_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> create_usage_limit_response

val make_create_usage_limit_request :
  ?period:usage_limit_period ->
  ?breach_action:usage_limit_breach_action ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  usage_type:usage_limit_usage_type ->
  amount:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  create_usage_limit_request

val make_performance_target :
  ?status:performance_target_status ->
  ?level:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  performance_target

val make_endpoint :
  ?address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?vpc_endpoints:vpc_endpoint_list ->
  unit ->
  endpoint

val make_workgroup :
  ?workgroup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:workgroup_name ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?config_parameters:config_parameter_list ->
  ?security_group_ids:security_group_id_list ->
  ?subnet_ids:subnet_id_list ->
  ?status:workgroup_status ->
  ?endpoint:endpoint ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?custom_domain_name:custom_domain_name ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?patch_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?cross_account_vpcs:vpc_ids ->
  ?ip_address_type:ip_address_type ->
  ?price_performance_target:performance_target ->
  ?track_name:track_name ->
  ?pending_track_name:track_name ->
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  workgroup

val make_create_workgroup_response : ?workgroup:workgroup -> unit -> create_workgroup_response

val make_create_workgroup_request :
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?config_parameters:config_parameter_list ->
  ?security_group_ids:security_group_id_list ->
  ?subnet_ids:subnet_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?price_performance_target:performance_target ->
  ?ip_address_type:ip_address_type ->
  ?track_name:track_name ->
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  workgroup_name:workgroup_name ->
  namespace_name:namespace_name ->
  unit ->
  create_workgroup_request

val make_delete_custom_domain_association_response : unit -> unit

val make_delete_custom_domain_association_request :
  workgroup_name:workgroup_name ->
  custom_domain_name:custom_domain_name ->
  unit ->
  delete_custom_domain_association_request

val make_delete_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> delete_endpoint_access_response

val make_delete_endpoint_access_request :
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_endpoint_access_request

val make_delete_namespace_response : namespace:namespace -> unit -> delete_namespace_response

val make_delete_namespace_request :
  ?final_snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?final_snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  namespace_name:namespace_name ->
  unit ->
  delete_namespace_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_resource_policy_request

val make_delete_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> delete_scheduled_action_response

val make_delete_scheduled_action_request :
  scheduled_action_name:scheduled_action_name -> unit -> delete_scheduled_action_request

val make_delete_snapshot_response : ?snapshot:snapshot -> unit -> delete_snapshot_response

val make_delete_snapshot_request :
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_snapshot_request

val make_delete_snapshot_copy_configuration_response :
  snapshot_copy_configuration:snapshot_copy_configuration ->
  unit ->
  delete_snapshot_copy_configuration_response

val make_delete_snapshot_copy_configuration_request :
  snapshot_copy_configuration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  delete_snapshot_copy_configuration_request

val make_delete_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> delete_usage_limit_response

val make_delete_usage_limit_request :
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_usage_limit_request

val make_delete_workgroup_response : workgroup:workgroup -> unit -> delete_workgroup_response

val make_delete_workgroup_request :
  workgroup_name:workgroup_name -> unit -> delete_workgroup_request

val make_get_credentials_response :
  ?db_user:db_user ->
  ?db_password:db_password ->
  ?expiration:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?next_refresh_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_credentials_response

val make_get_credentials_request :
  ?db_name:db_name ->
  ?duration_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_name:custom_domain_name ->
  unit ->
  get_credentials_request

val make_get_custom_domain_association_response :
  ?custom_domain_name:custom_domain_name ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_custom_domain_association_response

val make_get_custom_domain_association_request :
  custom_domain_name:custom_domain_name ->
  workgroup_name:workgroup_name ->
  unit ->
  get_custom_domain_association_request

val make_get_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> get_endpoint_access_response

val make_get_endpoint_access_request :
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_endpoint_access_request

val make_get_identity_center_auth_token_response :
  ?token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expiration_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_identity_center_auth_token_response

val make_get_identity_center_auth_token_request :
  workgroup_names:workgroup_name_list -> unit -> get_identity_center_auth_token_request

val make_get_namespace_response : namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : namespace_name:namespace_name -> unit -> get_namespace_request

val make_recovery_point :
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recovery_point_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?total_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?namespace_name:namespace_name ->
  ?workgroup_name:workgroup_name ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recovery_point

val make_get_recovery_point_response :
  ?recovery_point:recovery_point -> unit -> get_recovery_point_response

val make_get_recovery_point_request :
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_recovery_point_request

val make_get_reservation_response : reservation:reservation -> unit -> get_reservation_response
val make_get_reservation_request : reservation_id:reservation_id -> unit -> get_reservation_request

val make_get_reservation_offering_response :
  reservation_offering:reservation_offering -> unit -> get_reservation_offering_response

val make_get_reservation_offering_request :
  offering_id:offering_id -> unit -> get_reservation_offering_request

val make_resource_policy :
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?policy:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_policy

val make_get_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_resource_policy_request

val make_get_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> get_scheduled_action_response

val make_get_scheduled_action_request :
  scheduled_action_name:scheduled_action_name -> unit -> get_scheduled_action_request

val make_get_snapshot_response : ?snapshot:snapshot -> unit -> get_snapshot_response

val make_get_snapshot_request :
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_snapshot_request

val make_table_restore_status :
  ?table_restore_request_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?request_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?progress_in_mega_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?total_data_in_mega_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  table_restore_status

val make_get_table_restore_status_response :
  ?table_restore_status:table_restore_status -> unit -> get_table_restore_status_response

val make_get_table_restore_status_request :
  table_restore_request_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_table_restore_status_request

val make_update_target :
  ?track_name:track_name ->
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_target

val make_serverless_track :
  ?track_name:track_name ->
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?update_targets:update_targets_list ->
  unit ->
  serverless_track

val make_get_track_response : ?track:serverless_track -> unit -> get_track_response
val make_get_track_request : track_name:track_name -> unit -> get_track_request
val make_get_usage_limit_response : ?usage_limit:usage_limit -> unit -> get_usage_limit_response

val make_get_usage_limit_request :
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_usage_limit_request

val make_get_workgroup_response : workgroup:workgroup -> unit -> get_workgroup_response
val make_get_workgroup_request : workgroup_name:workgroup_name -> unit -> get_workgroup_request

val make_list_custom_domain_associations_response :
  ?next_token:pagination_token ->
  ?associations:association_list ->
  unit ->
  list_custom_domain_associations_response

val make_list_custom_domain_associations_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?custom_domain_name:custom_domain_name ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  unit ->
  list_custom_domain_associations_request

val make_list_endpoint_access_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  endpoints:endpoint_access_list ->
  unit ->
  list_endpoint_access_response

val make_list_endpoint_access_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:owner_account ->
  unit ->
  list_endpoint_access_request

val make_managed_workgroup_list_item :
  ?managed_workgroup_name:managed_workgroup_name ->
  ?managed_workgroup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_arn:source_arn ->
  ?status:managed_workgroup_status ->
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  managed_workgroup_list_item

val make_list_managed_workgroups_response :
  ?next_token:pagination_token ->
  ?managed_workgroups:managed_workgroups ->
  unit ->
  list_managed_workgroups_response

val make_list_managed_workgroups_request :
  ?source_arn:source_arn ->
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_managed_workgroups_request

val make_list_namespaces_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  namespaces:namespace_list ->
  unit ->
  list_namespaces_response

val make_list_namespaces_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_namespaces_request

val make_list_recovery_points_response :
  ?recovery_points:recovery_point_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recovery_points_response

val make_list_recovery_points_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?namespace_name:namespace_name ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recovery_points_request

val make_list_reservation_offerings_response :
  ?next_token:pagination_token ->
  reservation_offerings_list:reservation_offerings_list ->
  unit ->
  list_reservation_offerings_response

val make_list_reservation_offerings_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_reservation_offerings_request

val make_list_reservations_response :
  ?next_token:pagination_token ->
  reservations_list:reservations_list ->
  unit ->
  list_reservations_response

val make_list_reservations_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_reservations_request

val make_scheduled_action_association :
  ?namespace_name:namespace_name ->
  ?scheduled_action_name:scheduled_action_name ->
  unit ->
  scheduled_action_association

val make_list_scheduled_actions_response :
  ?next_token:pagination_token ->
  ?scheduled_actions:scheduled_actions_list ->
  unit ->
  list_scheduled_actions_response

val make_list_scheduled_actions_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?namespace_name:namespace_name ->
  unit ->
  list_scheduled_actions_request

val make_list_snapshot_copy_configurations_response :
  ?next_token:pagination_token ->
  snapshot_copy_configurations:snapshot_copy_configurations ->
  unit ->
  list_snapshot_copy_configurations_response

val make_list_snapshot_copy_configurations_request :
  ?namespace_name:namespace_name ->
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_snapshot_copy_configurations_request

val make_list_snapshots_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshots:snapshot_list ->
  unit ->
  list_snapshots_response

val make_list_snapshots_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  list_snapshots_request

val make_list_table_restore_status_response :
  ?next_token:pagination_token ->
  ?table_restore_statuses:table_restore_status_list ->
  unit ->
  list_table_restore_status_response

val make_list_table_restore_status_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_table_restore_status_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_tracks_response :
  ?tracks:track_list -> ?next_token:pagination_token -> unit -> list_tracks_response

val make_list_tracks_request :
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_tracks_request

val make_list_usage_limits_response :
  ?usage_limits:usage_limits -> ?next_token:pagination_token -> unit -> list_usage_limits_response

val make_list_usage_limits_request :
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_type:usage_limit_usage_type ->
  ?next_token:pagination_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_usage_limits_request

val make_list_workgroups_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroups:workgroup_list ->
  unit ->
  list_workgroups_response

val make_list_workgroups_request :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?owner_account:owner_account ->
  unit ->
  list_workgroups_request

val make_put_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  policy:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  put_resource_policy_request

val make_update_custom_domain_association_response :
  ?custom_domain_name:custom_domain_name ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  update_custom_domain_association_response

val make_update_custom_domain_association_request :
  workgroup_name:workgroup_name ->
  custom_domain_name:custom_domain_name ->
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  unit ->
  update_custom_domain_association_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_restore_from_recovery_point_response :
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace:namespace ->
  unit ->
  restore_from_recovery_point_response

val make_restore_from_recovery_point_request :
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:namespace_name ->
  workgroup_name:workgroup_name ->
  unit ->
  restore_from_recovery_point_request

val make_restore_from_snapshot_response :
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace:namespace ->
  unit ->
  restore_from_snapshot_response

val make_restore_from_snapshot_request :
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  namespace_name:namespace_name ->
  workgroup_name:workgroup_name ->
  unit ->
  restore_from_snapshot_request

val make_restore_table_from_recovery_point_response :
  ?table_restore_status:table_restore_status -> unit -> restore_table_from_recovery_point_response

val make_restore_table_from_recovery_point_request :
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?activate_case_sensitive_identifier:Smaws_Lib.Smithy_api.Types.boolean_ ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_table_from_recovery_point_request

val make_restore_table_from_snapshot_response :
  ?table_restore_status:table_restore_status -> unit -> restore_table_from_snapshot_response

val make_restore_table_from_snapshot_request :
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?activate_case_sensitive_identifier:Smaws_Lib.Smithy_api.Types.boolean_ ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_table_from_snapshot_request

val make_update_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> update_endpoint_access_response

val make_update_endpoint_access_request :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_endpoint_access_request

val make_update_lakehouse_configuration_response :
  ?namespace_name:namespace_name ->
  ?lakehouse_idc_application_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lakehouse_registration_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?catalog_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_lakehouse_configuration_response

val make_update_lakehouse_configuration_request :
  ?lakehouse_registration:lakehouse_registration ->
  ?catalog_name:catalog_name_string ->
  ?lakehouse_idc_registration:lakehouse_idc_registration ->
  ?lakehouse_idc_application_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.boolean_ ->
  namespace_name:namespace_name ->
  unit ->
  update_lakehouse_configuration_request

val make_update_namespace_response : namespace:namespace -> unit -> update_namespace_response

val make_update_namespace_request :
  ?admin_user_password:db_password ->
  ?admin_username:db_user ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?iam_roles:iam_role_arn_list ->
  ?log_exports:log_export_list ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  namespace_name:namespace_name ->
  unit ->
  update_namespace_request

val make_update_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> update_scheduled_action_response

val make_update_scheduled_action_request :
  ?target_action:target_action ->
  ?schedule:schedule ->
  ?role_arn:iam_role_arn ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  scheduled_action_name:scheduled_action_name ->
  unit ->
  update_scheduled_action_request

val make_update_snapshot_response : ?snapshot:snapshot -> unit -> update_snapshot_response

val make_update_snapshot_request :
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_snapshot_request

val make_update_snapshot_copy_configuration_response :
  snapshot_copy_configuration:snapshot_copy_configuration ->
  unit ->
  update_snapshot_copy_configuration_response

val make_update_snapshot_copy_configuration_request :
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_copy_configuration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_snapshot_copy_configuration_request

val make_update_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> update_usage_limit_response

val make_update_usage_limit_request :
  ?amount:Smaws_Lib.Smithy_api.Types.long ->
  ?breach_action:usage_limit_breach_action ->
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_usage_limit_request

val make_update_workgroup_response : workgroup:workgroup -> unit -> update_workgroup_response

val make_update_workgroup_request :
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?config_parameters:config_parameter_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?subnet_ids:subnet_id_list ->
  ?security_group_ids:security_group_id_list ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?ip_address_type:ip_address_type ->
  ?price_performance_target:performance_target ->
  ?track_name:track_name ->
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  workgroup_name:workgroup_name ->
  unit ->
  update_workgroup_request
