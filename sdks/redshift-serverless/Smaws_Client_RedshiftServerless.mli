(** Redshift Serverless client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_config_parameter :
  ?parameter_value:parameter_value -> ?parameter_key:parameter_key -> unit -> config_parameter

val make_network_interface :
  ?ipv6_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?private_ip_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subnet_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?network_interface_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  network_interface

val make_vpc_endpoint :
  ?network_interfaces:network_interface_list ->
  ?vpc_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_endpoint_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  vpc_endpoint

val make_endpoint :
  ?vpc_endpoints:vpc_endpoint_list ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?address:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  endpoint

val make_performance_target :
  ?level:Smaws_Lib.Smithy_api.Types.integer ->
  ?status:performance_target_status ->
  unit ->
  performance_target

val make_workgroup :
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?pending_track_name:track_name ->
  ?track_name:track_name ->
  ?price_performance_target:performance_target ->
  ?ip_address_type:ip_address_type ->
  ?cross_account_vpcs:vpc_ids ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?patch_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_name:custom_domain_name ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?endpoint:endpoint ->
  ?status:workgroup_status ->
  ?subnet_ids:subnet_id_list ->
  ?security_group_ids:security_group_id_list ->
  ?config_parameters:config_parameter_list ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:workgroup_name ->
  ?workgroup_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  workgroup

val make_vpc_security_group_membership :
  ?status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_security_group_id:vpc_security_group_id ->
  unit ->
  vpc_security_group_membership

val make_usage_limit :
  ?breach_action:usage_limit_breach_action ->
  ?period:usage_limit_period ->
  ?amount:Smaws_Lib.Smithy_api.Types.long ->
  ?usage_type:usage_limit_usage_type ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_limit_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  usage_limit

val make_update_workgroup_response : workgroup:workgroup -> unit -> update_workgroup_response

val make_update_workgroup_request :
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?track_name:track_name ->
  ?price_performance_target:performance_target ->
  ?ip_address_type:ip_address_type ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?security_group_ids:security_group_id_list ->
  ?subnet_ids:subnet_id_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?config_parameters:config_parameter_list ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  workgroup_name:workgroup_name ->
  unit ->
  update_workgroup_request

val make_update_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> update_usage_limit_response

val make_update_usage_limit_request :
  ?breach_action:usage_limit_breach_action ->
  ?amount:Smaws_Lib.Smithy_api.Types.long ->
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_usage_limit_request

val make_update_target :
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?track_name:track_name ->
  unit ->
  update_target

val make_snapshot :
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?admin_password_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?accounts_with_provisioned_restore_access:account_id_list ->
  ?accounts_with_restore_access:account_id_list ->
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_retention_start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?snapshot_remaining_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?elapsed_time_in_seconds:Smaws_Lib.Smithy_api.Types.long ->
  ?estimated_seconds_to_completion:Smaws_Lib.Smithy_api.Types.long ->
  ?current_backup_rate_in_mega_bytes_per_second:Smaws_Lib.Smithy_api.Types.double ->
  ?backup_progress_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?actual_incremental_backup_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?total_backup_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:kms_key_id ->
  ?status:snapshot_status ->
  ?admin_username:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  snapshot

val make_update_snapshot_response : ?snapshot:snapshot -> unit -> update_snapshot_response

val make_update_snapshot_request :
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_snapshot_request

val make_snapshot_copy_configuration :
  ?destination_kms_key_id:kms_key_id ->
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?destination_region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  ?snapshot_copy_configuration_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_copy_configuration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  snapshot_copy_configuration

val make_update_snapshot_copy_configuration_response :
  snapshot_copy_configuration:snapshot_copy_configuration ->
  unit ->
  update_snapshot_copy_configuration_response

val make_update_snapshot_copy_configuration_request :
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_copy_configuration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_snapshot_copy_configuration_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_create_snapshot_schedule_action_parameters :
  ?tags:tag_list ->
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_name_prefix:snapshot_name_prefix ->
  namespace_name:namespace_name ->
  unit ->
  create_snapshot_schedule_action_parameters

val make_scheduled_action_response :
  ?scheduled_action_uuid:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  ?target_action:target_action ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?state:state ->
  ?role_arn:iam_role_arn ->
  ?next_invocations:next_invocations_list ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?schedule:schedule ->
  ?scheduled_action_name:scheduled_action_name ->
  unit ->
  scheduled_action_response

val make_update_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> update_scheduled_action_response

val make_update_scheduled_action_request :
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?role_arn:iam_role_arn ->
  ?schedule:schedule ->
  ?target_action:target_action ->
  scheduled_action_name:scheduled_action_name ->
  unit ->
  update_scheduled_action_request

val make_namespace :
  ?catalog_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lakehouse_registration_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?admin_password_secret_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:namespace_status ->
  ?log_exports:log_export_list ->
  ?iam_roles:iam_role_arn_list ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_username:db_user ->
  ?namespace_name:namespace_name ->
  ?namespace_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  namespace

val make_update_namespace_response : namespace:namespace -> unit -> update_namespace_response

val make_update_namespace_request :
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?log_exports:log_export_list ->
  ?iam_roles:iam_role_arn_list ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_username:db_user ->
  ?admin_user_password:db_password ->
  namespace_name:namespace_name ->
  unit ->
  update_namespace_request

val make_update_lakehouse_configuration_response :
  ?catalog_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lakehouse_registration_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lakehouse_idc_application_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  unit ->
  update_lakehouse_configuration_response

val make_update_lakehouse_configuration_request :
  ?dry_run:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?lakehouse_idc_application_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lakehouse_idc_registration:lakehouse_idc_registration ->
  ?catalog_name:catalog_name_string ->
  ?lakehouse_registration:lakehouse_registration ->
  namespace_name:namespace_name ->
  unit ->
  update_lakehouse_configuration_request

val make_endpoint_access :
  ?endpoint_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?vpc_endpoint:vpc_endpoint ->
  ?vpc_security_groups:vpc_security_group_membership_list ->
  ?subnet_ids:subnet_id_list ->
  ?address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?endpoint_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint_status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  endpoint_access

val make_update_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> update_endpoint_access_response

val make_update_endpoint_access_request :
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  update_endpoint_access_request

val make_update_custom_domain_association_response :
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_name:custom_domain_name ->
  unit ->
  update_custom_domain_association_response

val make_update_custom_domain_association_request :
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  custom_domain_name:custom_domain_name ->
  workgroup_name:workgroup_name ->
  unit ->
  update_custom_domain_association_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_serverless_track :
  ?update_targets:update_targets_list ->
  ?workgroup_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?track_name:track_name ->
  unit ->
  serverless_track

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_table_restore_status :
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?total_data_in_mega_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?progress_in_mega_bytes:Smaws_Lib.Smithy_api.Types.long ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?request_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:Smaws_Lib.Smithy_api.Types.string_ ->
  ?table_restore_request_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  table_restore_status

val make_scheduled_action_association :
  ?scheduled_action_name:scheduled_action_name ->
  ?namespace_name:namespace_name ->
  unit ->
  scheduled_action_association

val make_restore_table_from_snapshot_response :
  ?table_restore_status:table_restore_status -> unit -> restore_table_from_snapshot_response

val make_restore_table_from_snapshot_request :
  ?activate_case_sensitive_identifier:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_table_from_snapshot_request

val make_restore_table_from_recovery_point_response :
  ?table_restore_status:table_restore_status -> unit -> restore_table_from_recovery_point_response

val make_restore_table_from_recovery_point_request :
  ?activate_case_sensitive_identifier:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?target_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?target_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_schema_name:Smaws_Lib.Smithy_api.Types.string_ ->
  new_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_table_name:Smaws_Lib.Smithy_api.Types.string_ ->
  source_database_name:Smaws_Lib.Smithy_api.Types.string_ ->
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_table_from_recovery_point_request

val make_restore_from_snapshot_response :
  ?namespace:namespace ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_from_snapshot_response

val make_restore_from_snapshot_request :
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroup_name:workgroup_name ->
  namespace_name:namespace_name ->
  unit ->
  restore_from_snapshot_request

val make_restore_from_recovery_point_response :
  ?namespace:namespace ->
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_from_recovery_point_response

val make_restore_from_recovery_point_request :
  workgroup_name:workgroup_name ->
  namespace_name:namespace_name ->
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  restore_from_recovery_point_request

val make_resource_policy :
  ?policy:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_policy

val make_reservation_offering :
  ?offering_type:offering_type ->
  ?currency_code:currency_code ->
  ?hourly_charge:charge ->
  ?upfront_charge:charge ->
  ?duration:duration ->
  ?offering_id:offering_id ->
  unit ->
  reservation_offering

val make_reservation :
  ?status:status ->
  ?offering:reservation_offering ->
  ?capacity:capacity ->
  ?end_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?reservation_arn:reservation_arn ->
  ?reservation_id:reservation_id ->
  unit ->
  reservation

val make_put_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  policy:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  put_resource_policy_request

val make_list_tracks_response :
  ?next_token:pagination_token -> ?tracks:track_list -> unit -> list_tracks_response

val make_list_tracks_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_tracks_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_association :
  ?workgroup_name:workgroup_name ->
  ?custom_domain_name:custom_domain_name ->
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  unit ->
  association

val make_list_custom_domain_associations_response :
  ?associations:association_list ->
  ?next_token:pagination_token ->
  unit ->
  list_custom_domain_associations_response

val make_list_custom_domain_associations_request :
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?custom_domain_name:custom_domain_name ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_custom_domain_associations_request

val make_get_track_response : ?track:serverless_track -> unit -> get_track_response
val make_get_track_request : track_name:track_name -> unit -> get_track_request

val make_get_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_resource_policy_request

val make_get_identity_center_auth_token_response :
  ?expiration_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_identity_center_auth_token_response

val make_get_identity_center_auth_token_request :
  workgroup_names:workgroup_name_list -> unit -> get_identity_center_auth_token_request

val make_get_custom_domain_association_response :
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_name:custom_domain_name ->
  unit ->
  get_custom_domain_association_response

val make_get_custom_domain_association_request :
  workgroup_name:workgroup_name ->
  custom_domain_name:custom_domain_name ->
  unit ->
  get_custom_domain_association_request

val make_get_credentials_response :
  ?next_refresh_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expiration:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?db_password:db_password ->
  ?db_user:db_user ->
  unit ->
  get_credentials_response

val make_get_credentials_request :
  ?custom_domain_name:custom_domain_name ->
  ?workgroup_name:workgroup_name ->
  ?duration_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  ?db_name:db_name ->
  unit ->
  get_credentials_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_resource_policy_request

val make_delete_custom_domain_association_response : unit -> unit

val make_delete_custom_domain_association_request :
  custom_domain_name:custom_domain_name ->
  workgroup_name:workgroup_name ->
  unit ->
  delete_custom_domain_association_request

val make_create_custom_domain_association_response :
  ?custom_domain_certificate_expiry_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  ?workgroup_name:workgroup_name ->
  ?custom_domain_name:custom_domain_name ->
  unit ->
  create_custom_domain_association_response

val make_create_custom_domain_association_request :
  custom_domain_certificate_arn:custom_domain_certificate_arn_string ->
  custom_domain_name:custom_domain_name ->
  workgroup_name:workgroup_name ->
  unit ->
  create_custom_domain_association_request

val make_recovery_point :
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:workgroup_name ->
  ?namespace_name:namespace_name ->
  ?total_size_in_mega_bytes:Smaws_Lib.Smithy_api.Types.double ->
  ?recovery_point_create_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recovery_point

val make_managed_workgroup_list_item :
  ?creation_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:managed_workgroup_status ->
  ?source_arn:source_arn ->
  ?managed_workgroup_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?managed_workgroup_name:managed_workgroup_name ->
  unit ->
  managed_workgroup_list_item

val make_list_workgroups_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  workgroups:workgroup_list ->
  unit ->
  list_workgroups_response

val make_list_workgroups_request :
  ?owner_account:owner_account ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_workgroups_request

val make_list_usage_limits_response :
  ?next_token:pagination_token -> ?usage_limits:usage_limits -> unit -> list_usage_limits_response

val make_list_usage_limits_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  ?usage_type:usage_limit_usage_type ->
  ?resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_usage_limits_request

val make_list_table_restore_status_response :
  ?table_restore_statuses:table_restore_status_list ->
  ?next_token:pagination_token ->
  unit ->
  list_table_restore_status_response

val make_list_table_restore_status_request :
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_table_restore_status_request

val make_list_snapshots_response :
  ?snapshots:snapshot_list ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_snapshots_response

val make_list_snapshots_request :
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_snapshots_request

val make_list_snapshot_copy_configurations_response :
  ?next_token:pagination_token ->
  snapshot_copy_configurations:snapshot_copy_configurations ->
  unit ->
  list_snapshot_copy_configurations_response

val make_list_snapshot_copy_configurations_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  ?namespace_name:namespace_name ->
  unit ->
  list_snapshot_copy_configurations_request

val make_list_scheduled_actions_response :
  ?scheduled_actions:scheduled_actions_list ->
  ?next_token:pagination_token ->
  unit ->
  list_scheduled_actions_response

val make_list_scheduled_actions_request :
  ?namespace_name:namespace_name ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_scheduled_actions_request

val make_list_reservations_response :
  ?next_token:pagination_token ->
  reservations_list:reservations_list ->
  unit ->
  list_reservations_response

val make_list_reservations_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_reservations_request

val make_list_reservation_offerings_response :
  ?next_token:pagination_token ->
  reservation_offerings_list:reservation_offerings_list ->
  unit ->
  list_reservation_offerings_response

val make_list_reservation_offerings_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_reservation_offerings_request

val make_list_recovery_points_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recovery_points:recovery_point_list ->
  unit ->
  list_recovery_points_response

val make_list_recovery_points_request :
  ?namespace_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?namespace_name:namespace_name ->
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_recovery_points_request

val make_list_namespaces_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  namespaces:namespace_list ->
  unit ->
  list_namespaces_response

val make_list_namespaces_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_namespaces_request

val make_list_managed_workgroups_response :
  ?managed_workgroups:managed_workgroups ->
  ?next_token:pagination_token ->
  unit ->
  list_managed_workgroups_response

val make_list_managed_workgroups_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  ?source_arn:source_arn ->
  unit ->
  list_managed_workgroups_request

val make_list_endpoint_access_response :
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  endpoints:endpoint_access_list ->
  unit ->
  list_endpoint_access_response

val make_list_endpoint_access_request :
  ?owner_account:owner_account ->
  ?vpc_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  list_endpoint_access_request

val make_get_workgroup_response : workgroup:workgroup -> unit -> get_workgroup_response
val make_get_workgroup_request : workgroup_name:workgroup_name -> unit -> get_workgroup_request
val make_get_usage_limit_response : ?usage_limit:usage_limit -> unit -> get_usage_limit_response

val make_get_usage_limit_request :
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_usage_limit_request

val make_get_table_restore_status_response :
  ?table_restore_status:table_restore_status -> unit -> get_table_restore_status_response

val make_get_table_restore_status_request :
  table_restore_request_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_table_restore_status_request

val make_get_snapshot_response : ?snapshot:snapshot -> unit -> get_snapshot_response

val make_get_snapshot_request :
  ?snapshot_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?owner_account:Smaws_Lib.Smithy_api.Types.string_ ->
  ?snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  get_snapshot_request

val make_get_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> get_scheduled_action_response

val make_get_scheduled_action_request :
  scheduled_action_name:scheduled_action_name -> unit -> get_scheduled_action_request

val make_get_reservation_response : reservation:reservation -> unit -> get_reservation_response
val make_get_reservation_request : reservation_id:reservation_id -> unit -> get_reservation_request

val make_get_reservation_offering_response :
  reservation_offering:reservation_offering -> unit -> get_reservation_offering_response

val make_get_reservation_offering_request :
  offering_id:offering_id -> unit -> get_reservation_offering_request

val make_get_recovery_point_response :
  ?recovery_point:recovery_point -> unit -> get_recovery_point_response

val make_get_recovery_point_request :
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_recovery_point_request

val make_get_namespace_response : namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : namespace_name:namespace_name -> unit -> get_namespace_request

val make_get_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> get_endpoint_access_response

val make_get_endpoint_access_request :
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> get_endpoint_access_request

val make_delete_workgroup_response : workgroup:workgroup -> unit -> delete_workgroup_response

val make_delete_workgroup_request :
  workgroup_name:workgroup_name -> unit -> delete_workgroup_request

val make_delete_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> delete_usage_limit_response

val make_delete_usage_limit_request :
  usage_limit_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_usage_limit_request

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

val make_delete_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> delete_scheduled_action_response

val make_delete_scheduled_action_request :
  scheduled_action_name:scheduled_action_name -> unit -> delete_scheduled_action_request

val make_delete_namespace_response : namespace:namespace -> unit -> delete_namespace_response

val make_delete_namespace_request :
  ?final_snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  ?final_snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:namespace_name ->
  unit ->
  delete_namespace_request

val make_delete_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> delete_endpoint_access_response

val make_delete_endpoint_access_request :
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> delete_endpoint_access_request

val make_create_workgroup_response : ?workgroup:workgroup -> unit -> create_workgroup_response

val make_create_workgroup_request :
  ?extra_compute_for_automatic_optimization:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?track_name:track_name ->
  ?ip_address_type:ip_address_type ->
  ?price_performance_target:performance_target ->
  ?max_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  ?port:Smaws_Lib.Smithy_api.Types.integer ->
  ?tags:tag_list ->
  ?publicly_accessible:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?subnet_ids:subnet_id_list ->
  ?security_group_ids:security_group_id_list ->
  ?config_parameters:config_parameter_list ->
  ?enhanced_vpc_routing:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?base_capacity:Smaws_Lib.Smithy_api.Types.integer ->
  namespace_name:namespace_name ->
  workgroup_name:workgroup_name ->
  unit ->
  create_workgroup_request

val make_create_usage_limit_response :
  ?usage_limit:usage_limit -> unit -> create_usage_limit_response

val make_create_usage_limit_request :
  ?breach_action:usage_limit_breach_action ->
  ?period:usage_limit_period ->
  amount:Smaws_Lib.Smithy_api.Types.long ->
  usage_type:usage_limit_usage_type ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_usage_limit_request

val make_create_snapshot_response : ?snapshot:snapshot -> unit -> create_snapshot_response

val make_create_snapshot_request :
  ?tags:tag_list ->
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_snapshot_request

val make_create_snapshot_copy_configuration_response :
  snapshot_copy_configuration:snapshot_copy_configuration ->
  unit ->
  create_snapshot_copy_configuration_response

val make_create_snapshot_copy_configuration_request :
  ?destination_kms_key_id:kms_key_id ->
  ?snapshot_retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  destination_region:Smaws_Lib.Smithy_api.Types.string_ ->
  namespace_name:namespace_name ->
  unit ->
  create_snapshot_copy_configuration_request

val make_create_scheduled_action_response :
  ?scheduled_action:scheduled_action_response -> unit -> create_scheduled_action_response

val make_create_scheduled_action_request :
  ?end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?scheduled_action_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  namespace_name:namespace_name ->
  role_arn:iam_role_arn ->
  schedule:schedule ->
  target_action:target_action ->
  scheduled_action_name:scheduled_action_name ->
  unit ->
  create_scheduled_action_request

val make_create_reservation_response :
  ?reservation:reservation -> unit -> create_reservation_response

val make_create_reservation_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  offering_id:offering_id ->
  capacity:capacity ->
  unit ->
  create_reservation_request

val make_create_namespace_response : ?namespace:namespace -> unit -> create_namespace_response

val make_create_namespace_request :
  ?redshift_idc_application_arn:redshift_idc_application_arn ->
  ?admin_password_secret_kms_key_id:kms_key_id ->
  ?manage_admin_password:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  ?log_exports:log_export_list ->
  ?iam_roles:iam_role_arn_list ->
  ?default_iam_role_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?db_name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?admin_user_password:db_password ->
  ?admin_username:db_user ->
  namespace_name:namespace_name ->
  unit ->
  create_namespace_request

val make_create_endpoint_access_response :
  ?endpoint:endpoint_access -> unit -> create_endpoint_access_response

val make_create_endpoint_access_request :
  ?owner_account:owner_account ->
  ?vpc_security_group_ids:vpc_security_group_id_list ->
  workgroup_name:Smaws_Lib.Smithy_api.Types.string_ ->
  subnet_ids:subnet_id_list ->
  endpoint_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_endpoint_access_request

val make_convert_recovery_point_to_snapshot_response :
  ?snapshot:snapshot -> unit -> convert_recovery_point_to_snapshot_response

val make_convert_recovery_point_to_snapshot_request :
  ?tags:tag_list ->
  ?retention_period:Smaws_Lib.Smithy_api.Types.integer ->
  snapshot_name:Smaws_Lib.Smithy_api.Types.string_ ->
  recovery_point_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  convert_recovery_point_to_snapshot_request
(** {1:operations Operations} *)

module ConvertRecoveryPointToSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    convert_recovery_point_to_snapshot_request ->
    ( convert_recovery_point_to_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    convert_recovery_point_to_snapshot_request ->
    ( convert_recovery_point_to_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Converts a recovery point to a snapshot. For more information about recovery points and \
   snapshots, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery-points.html}Working \
   with snapshots and recovery points}.\n"]

module CreateEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_request ->
    ( create_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_request ->
    ( create_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Amazon Redshift Serverless managed VPC endpoint.\n"]

module CreateNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_namespace_request ->
    ( create_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_namespace_request ->
    ( create_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a namespace in Amazon Redshift Serverless.\n"]

module CreateReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_reservation_request ->
    ( create_reservation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_reservation_request ->
    ( create_reservation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Redshift Serverless reservation, which gives you the option to commit to a \
   specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless \
   on-demand (OD) rates.\n"]

module CreateScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_request ->
    ( create_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_request ->
    ( create_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API \
   action. For example, you can create a schedule of when to run the [CreateSnapshot] API \
   operation.\n"]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of all databases in a namespace. For more information about snapshots, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery-points.html} \
   Working with snapshots and recovery points}.\n"]

module CreateSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_configuration_request ->
    ( create_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_configuration_request ->
    ( create_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot copy configuration that lets you copy snapshots to another Amazon Web \
   Services Region.\n"]

module CreateUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_request ->
    ( create_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_request ->
    ( create_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a usage limit for a specified Amazon Redshift Serverless usage type. The usage limit is \
   identified by the returned usage limit identifier. \n"]

module CreateWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerException of internal_server_exception
    | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workgroup_request ->
    ( create_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workgroup_request ->
    ( create_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an workgroup in Amazon Redshift Serverless.\n\n\
  \ VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a workgroup is in an account with VPC BPA turned on, the \
   following capabilities are blocked: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creating a public access workgroup\n\
  \            \n\
  \             }\n\
  \        {-  Modifying a private workgroup to public\n\
  \            \n\
  \             }\n\
  \        {-  Adding a subnet with VPC BPA turned on to the workgroup when the workgroup is public\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module DeleteEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_request ->
    ( delete_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_request ->
    ( delete_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon Redshift Serverless managed VPC endpoint.\n"]

module DeleteNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a namespace from Amazon Redshift Serverless. Before you delete the namespace, you can \
   create a final snapshot that has all of the data within the namespace.\n"]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a scheduled action.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot from Amazon Redshift Serverless.\n"]

module DeleteSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_configuration_request ->
    ( delete_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_configuration_request ->
    ( delete_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot copy configuration\n"]

module DeleteUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_request ->
    ( delete_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_request ->
    ( delete_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a usage limit from Amazon Redshift Serverless.\n"]

module DeleteWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workgroup_request ->
    ( delete_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workgroup_request ->
    ( delete_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a workgroup.\n"]

module GetEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_access_request ->
    ( get_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_access_request ->
    ( get_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information, such as the name, about a VPC endpoint.\n"]

module GetNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_request ->
    ( get_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_request ->
    ( get_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a namespace in Amazon Redshift Serverless.\n"]

module GetRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recovery_point_request ->
    ( get_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recovery_point_request ->
    ( get_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a recovery point.\n"]

module GetReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_request ->
    ( get_reservation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_request ->
    ( get_reservation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets an Amazon Redshift Serverless reservation. A reservation gives you the option to commit to \
   a specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless \
   on-demand (OD) rates.\n"]

module GetReservationOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_offering_request ->
    ( get_reservation_offering_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_offering_request ->
    ( get_reservation_offering_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the reservation offering. The offering determines the payment schedule for the \
   reservation.\n"]

module GetScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_action_request ->
    ( get_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_action_request ->
    ( get_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a scheduled action.\n"]

module GetSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_request ->
    ( get_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_request ->
    ( get_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specific snapshot.\n"]

module GetTableRestoreStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_restore_status_request ->
    ( get_table_restore_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_restore_status_request ->
    ( get_table_restore_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a [TableRestoreStatus] object.\n"]

module GetUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_limit_request ->
    ( get_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_limit_request ->
    ( get_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a usage limit.\n"]

module GetWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workgroup_request ->
    ( get_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workgroup_request ->
    ( get_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specific workgroup.\n"]

module ListEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_access_request ->
    ( list_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_access_request ->
    ( list_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of [EndpointAccess] objects and relevant information.\n"]

module ListManagedWorkgroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_managed_workgroups_request ->
    ( list_managed_workgroups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_managed_workgroups_request ->
    ( list_managed_workgroups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified managed workgroups in your account.\n"]

module ListNamespaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_namespaces_request ->
    ( list_namespaces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_namespaces_request ->
    ( list_namespaces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified namespaces.\n"]

module ListRecoveryPoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recovery_points_request ->
    ( list_recovery_points_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recovery_points_request ->
    ( list_recovery_points_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of recovery points.\n"]

module ListReservationOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reservation_offerings_request ->
    ( list_reservation_offerings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reservation_offerings_request ->
    ( list_reservation_offerings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the current reservation offerings in your account.\n"]

module ListReservations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reservations_request ->
    ( list_reservations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reservations_request ->
    ( list_reservations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of Reservation objects.\n"]

module ListScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_actions_request ->
    ( list_scheduled_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_actions_request ->
    ( list_scheduled_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of scheduled actions. You can use the flags to filter the list of returned \
   scheduled actions.\n"]

module ListSnapshotCopyConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_snapshot_copy_configurations_request ->
    ( list_snapshot_copy_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_snapshot_copy_configurations_request ->
    ( list_snapshot_copy_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of snapshot copy configurations.\n"]

module ListSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_snapshots_request ->
    ( list_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_snapshots_request ->
    ( list_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of snapshots.\n"]

module ListTableRestoreStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_table_restore_status_request ->
    ( list_table_restore_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_table_restore_status_request ->
    ( list_table_restore_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about an array of [TableRestoreStatus] objects.\n"]

module ListUsageLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_limits_request ->
    ( list_usage_limits_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_limits_request ->
    ( list_usage_limits_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all usage limits within Amazon Redshift Serverless.\n"]

module ListWorkgroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workgroups_request ->
    ( list_workgroups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workgroups_request ->
    ( list_workgroups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified workgroups.\n"]

module CreateCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_request ->
    ( create_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_request ->
    ( create_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a custom domain association for Amazon Redshift Serverless.\n"]

module DeleteCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_request ->
    ( delete_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_request ->
    ( delete_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom domain association for Amazon Redshift Serverless.\n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified resource policy.\n"]

module GetCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_credentials_request ->
    ( get_credentials_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_credentials_request ->
    ( get_credentials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a database user name and temporary password with temporary authorization to log in to \
   Amazon Redshift Serverless.\n\n\
  \ By default, the temporary credentials expire in 900 seconds. You can optionally specify a \
   duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes).\n\
  \ \n\
  \  The Identity and Access Management (IAM) user or role that runs GetCredentials must have an \
   IAM policy attached that allows access to all necessary actions and resources.\n\
  \  \n\
  \   If the [DbName] parameter is specified, the IAM policy must allow access to the resource \
   dbname for the specified database name.\n\
  \   "]

module GetCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_custom_domain_association_request ->
    ( get_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_custom_domain_association_request ->
    ( get_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a specific custom domain association.\n"]

module GetIdentityCenterAuthToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an Identity Center authentication token for accessing Amazon Redshift Serverless \
   workgroups.\n\n\
  \ The token provides secure access to data within the specified workgroups using Identity Center \
   identity propagation. The token expires after a specified duration and must be refreshed for \
   continued access.\n\
  \ \n\
  \  The Identity and Access Management (IAM) user or role that runs GetIdentityCenterAuthToken \
   must have appropriate permissions to access the specified workgroups and Identity Center \
   integration must be configured for the workgroups.\n\
  \  "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a resource policy.\n"]

module GetTrack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_track_request ->
    ( get_track_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_track_request ->
    ( get_track_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the Redshift Serverless version for a specified track.\n"]

module ListCustomDomainAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_domain_associations_request ->
    ( list_custom_domain_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_domain_associations_request ->
    ( list_custom_domain_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists custom domain associations for Amazon Redshift Serverless.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags assigned to a resource.\n"]

module ListTracks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tracks_request ->
    ( list_tracks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tracks_request ->
    ( list_tracks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the Amazon Redshift Serverless versions.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a resource policy. Currently, you can use policies to share snapshots across \
   Amazon Web Services accounts.\n"]

module RestoreFromRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_recovery_point_request ->
    ( restore_from_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_recovery_point_request ->
    ( restore_from_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restore the data from a recovery point.\n"]

module RestoreFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restores a namespace from a snapshot.\n"]

module RestoreTableFromRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_recovery_point_request ->
    ( restore_table_from_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_recovery_point_request ->
    ( restore_table_from_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a table from a recovery point to your Amazon Redshift Serverless instance. You can't \
   use this operation to restore tables with interleaved sort keys.\n"]

module RestoreTableFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_snapshot_request ->
    ( restore_table_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_snapshot_request ->
    ( restore_table_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a table from a snapshot to your Amazon Redshift Serverless instance. You can't use \
   this operation to restore tables with \
   {{:https://docs.aws.amazon.com/redshift/latest/dg/t_Sorting_data.html#t_Sorting_data-interleaved}interleaved \
   sort keys}.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Assigns one or more tags to a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a tag or set of tags from a resource.\n"]

module UpdateCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_domain_association_request ->
    ( update_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_domain_association_request ->
    ( update_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Redshift Serverless certificate associated with a custom domain.\n"]

module UpdateEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_access_request ->
    ( update_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_access_request ->
    ( update_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Redshift Serverless managed endpoint.\n"]

module UpdateLakehouseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_lakehouse_configuration_request ->
    ( update_lakehouse_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_lakehouse_configuration_request ->
    ( update_lakehouse_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the lakehouse configuration for a namespace. This operation allows you to manage \
   Amazon Redshift federated permissions and Amazon Web Services IAM Identity Center trusted \
   identity propagation.\n"]

module UpdateNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_namespace_request ->
    ( update_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_namespace_request ->
    ( update_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a namespace with the specified settings. Unless required, you can't update multiple \
   parameters in one request. For example, you must specify both [adminUsername] and \
   [adminUserPassword] to update either field, but you can't update both [kmsKeyId] and \
   [logExports] in a single request.\n"]

module UpdateScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_action_request ->
    ( update_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_action_request ->
    ( update_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a scheduled action.\n"]

module UpdateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a snapshot.\n"]

module UpdateSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_copy_configuration_request ->
    ( update_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_copy_configuration_request ->
    ( update_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a snapshot copy configuration.\n"]

module UpdateUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_usage_limit_request ->
    ( update_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_usage_limit_request ->
    ( update_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a usage limit in Amazon Redshift Serverless. You can't update the usage type or period \
   of a usage limit.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerException of internal_server_exception
    | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workgroup_request ->
    ( update_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workgroup_request ->
    ( update_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a workgroup with the specified configuration settings. You can't update multiple \
   parameters in one request. For example, you can update [baseCapacity] or [port] in a single \
   request, but you can't update both in the same request.\n\n\
  \ VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a workgroup is in an account with VPC BPA turned on, the \
   following capabilities are blocked: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creating a public access workgroup\n\
  \            \n\
  \             }\n\
  \        {-  Modifying a private workgroup to public\n\
  \            \n\
  \             }\n\
  \        {-  Adding a subnet with VPC BPA turned on to the workgroup when the workgroup is public\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
