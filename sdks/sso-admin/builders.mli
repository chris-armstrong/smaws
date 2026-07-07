open Types

val make_update_trusted_token_issuer_response : unit -> unit

val make_oidc_jwt_update_configuration :
  ?jwks_retrieval_option:jwks_retrieval_option ->
  ?identity_store_attribute_path:jmes_path ->
  ?claim_attribute_path:claim_attribute_path ->
  unit ->
  oidc_jwt_update_configuration

val make_update_trusted_token_issuer_request :
  ?trusted_token_issuer_configuration:trusted_token_issuer_update_configuration ->
  ?name:trusted_token_issuer_name ->
  trusted_token_issuer_arn:trusted_token_issuer_arn ->
  unit ->
  update_trusted_token_issuer_request

val make_update_permission_set_response : unit -> unit

val make_update_permission_set_request :
  ?relay_state:relay_state ->
  ?session_duration:duration ->
  ?description:permission_set_description ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  update_permission_set_request

val make_update_instance_response : unit -> unit

val make_encryption_configuration :
  ?kms_key_arn:kms_key_arn -> key_type:kms_key_type -> unit -> encryption_configuration

val make_update_instance_request :
  ?encryption_configuration:encryption_configuration ->
  ?name:name_type ->
  instance_arn:instance_arn ->
  unit ->
  update_instance_request

val make_update_instance_access_control_attribute_configuration_response : unit -> unit

val make_access_control_attribute_value :
  source:access_control_attribute_value_source_list -> unit -> access_control_attribute_value

val make_access_control_attribute :
  value:access_control_attribute_value ->
  key:access_control_attribute_key ->
  unit ->
  access_control_attribute

val make_instance_access_control_attribute_configuration :
  access_control_attributes:access_control_attribute_list ->
  unit ->
  instance_access_control_attribute_configuration

val make_update_instance_access_control_attribute_configuration_request :
  instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  instance_arn:instance_arn ->
  unit ->
  update_instance_access_control_attribute_configuration_request

val make_update_application_response : unit -> unit

val make_sign_in_options :
  ?application_url:application_url -> origin:sign_in_origin -> unit -> sign_in_options

val make_update_application_portal_options :
  ?sign_in_options:sign_in_options -> unit -> update_application_portal_options

val make_update_application_request :
  ?portal_options:update_application_portal_options ->
  ?status:application_status ->
  ?description:description ->
  ?name:application_name_type ->
  application_arn:application_arn ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  ?instance_arn:instance_arn ->
  tag_keys:tag_key_list ->
  resource_arn:taggable_resource_arn ->
  unit ->
  untag_resource_request

val make_trusted_token_issuer_metadata :
  ?trusted_token_issuer_type:trusted_token_issuer_type ->
  ?name:trusted_token_issuer_name ->
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  unit ->
  trusted_token_issuer_metadata

val make_oidc_jwt_configuration :
  jwks_retrieval_option:jwks_retrieval_option ->
  identity_store_attribute_path:jmes_path ->
  claim_attribute_path:claim_attribute_path ->
  issuer_url:trusted_token_issuer_url ->
  unit ->
  oidc_jwt_configuration

val make_token_exchange_grant : unit -> unit
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  ?instance_arn:instance_arn ->
  tags:tag_list ->
  resource_arn:taggable_resource_arn ->
  unit ->
  tag_resource_request

val make_scope_details : ?authorized_targets:scope_targets -> scope:scope -> unit -> scope_details
val make_remove_region_response : ?status:region_status -> unit -> remove_region_response

val make_remove_region_request :
  region_name:region_name -> instance_arn:instance_arn -> unit -> remove_region_request

val make_put_permissions_boundary_to_permission_set_response : unit -> unit

val make_customer_managed_policy_reference :
  ?path:managed_policy_path -> name:managed_policy_name -> unit -> customer_managed_policy_reference

val make_permissions_boundary :
  ?managed_policy_arn:managed_policy_arn ->
  ?customer_managed_policy_reference:customer_managed_policy_reference ->
  unit ->
  permissions_boundary

val make_put_permissions_boundary_to_permission_set_request :
  permissions_boundary:permissions_boundary ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  put_permissions_boundary_to_permission_set_request

val make_put_inline_policy_to_permission_set_response : unit -> unit

val make_put_inline_policy_to_permission_set_request :
  inline_policy:permission_set_policy_document ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  put_inline_policy_to_permission_set_request

val make_put_application_session_configuration_response : unit -> unit

val make_put_application_session_configuration_request :
  ?user_background_session_application_status:user_background_session_application_status ->
  application_arn:application_arn ->
  unit ->
  put_application_session_configuration_request

val make_put_application_assignment_configuration_response : unit -> unit

val make_put_application_assignment_configuration_request :
  assignment_required:assignment_required ->
  application_arn:application_arn ->
  unit ->
  put_application_assignment_configuration_request

val make_permission_set_provisioning_status :
  ?created_date:date ->
  ?failure_reason:reason ->
  ?permission_set_arn:permission_set_arn ->
  ?account_id:account_id ->
  ?request_id:uu_id ->
  ?status:status_values ->
  unit ->
  permission_set_provisioning_status

val make_provision_permission_set_response :
  ?permission_set_provisioning_status:permission_set_provisioning_status ->
  unit ->
  provision_permission_set_response

val make_provision_permission_set_request :
  ?target_id:target_id ->
  target_type:provision_target_type ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  provision_permission_set_request

val make_list_trusted_token_issuers_response :
  ?next_token:token ->
  ?trusted_token_issuers:trusted_token_issuer_list ->
  unit ->
  list_trusted_token_issuers_response

val make_list_trusted_token_issuers_request :
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_trusted_token_issuers_request

val make_list_tags_for_resource_response :
  ?next_token:token -> ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:token ->
  ?instance_arn:instance_arn ->
  resource_arn:taggable_resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_region_metadata :
  ?is_primary_region:is_primary_region ->
  ?added_date:date ->
  ?status:region_status ->
  ?region_name:region_name ->
  unit ->
  region_metadata

val make_list_regions_response :
  ?next_token:token -> ?regions:region_metadata_list -> unit -> list_regions_response

val make_list_regions_request :
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_regions_request

val make_list_permission_sets_provisioned_to_account_response :
  ?permission_sets:permission_set_list ->
  ?next_token:token ->
  unit ->
  list_permission_sets_provisioned_to_account_response

val make_list_permission_sets_provisioned_to_account_request :
  ?next_token:token ->
  ?max_results:max_results ->
  ?provisioning_status:provisioning_status ->
  account_id:account_id ->
  instance_arn:instance_arn ->
  unit ->
  list_permission_sets_provisioned_to_account_request

val make_list_permission_sets_response :
  ?next_token:token -> ?permission_sets:permission_set_list -> unit -> list_permission_sets_response

val make_list_permission_sets_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  unit ->
  list_permission_sets_request

val make_permission_set_provisioning_status_metadata :
  ?created_date:date ->
  ?request_id:uu_id ->
  ?status:status_values ->
  unit ->
  permission_set_provisioning_status_metadata

val make_list_permission_set_provisioning_status_response :
  ?next_token:token ->
  ?permission_sets_provisioning_status:permission_set_provisioning_status_list ->
  unit ->
  list_permission_set_provisioning_status_response

val make_operation_status_filter : ?status:status_values -> unit -> operation_status_filter

val make_list_permission_set_provisioning_status_request :
  ?filter:operation_status_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_permission_set_provisioning_status_request

val make_attached_managed_policy :
  ?arn:managed_policy_arn -> ?name:name -> unit -> attached_managed_policy

val make_list_managed_policies_in_permission_set_response :
  ?next_token:token ->
  ?attached_managed_policies:attached_managed_policy_list ->
  unit ->
  list_managed_policies_in_permission_set_response

val make_list_managed_policies_in_permission_set_request :
  ?next_token:token ->
  ?max_results:max_results ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  list_managed_policies_in_permission_set_request

val make_instance_metadata :
  ?regions:region_metadata_list ->
  ?primary_region:region_name ->
  ?status_reason:reason ->
  ?status:instance_status ->
  ?created_date:date ->
  ?name:name_type ->
  ?owner_account_id:account_id ->
  ?identity_store_id:id ->
  ?instance_arn:instance_arn ->
  unit ->
  instance_metadata

val make_list_instances_response :
  ?next_token:token -> ?instances:instance_list -> unit -> list_instances_response

val make_list_instances_request :
  ?next_token:token -> ?max_results:max_results -> unit -> list_instances_request

val make_list_customer_managed_policy_references_in_permission_set_response :
  ?next_token:token ->
  ?customer_managed_policy_references:customer_managed_policy_reference_list ->
  unit ->
  list_customer_managed_policy_references_in_permission_set_response

val make_list_customer_managed_policy_references_in_permission_set_request :
  ?next_token:token ->
  ?max_results:max_results ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  list_customer_managed_policy_references_in_permission_set_request

val make_portal_options :
  ?visibility:application_visibility -> ?sign_in_options:sign_in_options -> unit -> portal_options

val make_application :
  ?created_from:region_name ->
  ?created_date:date ->
  ?description:description ->
  ?portal_options:portal_options ->
  ?status:application_status ->
  ?identity_store_arn:identity_store_arn ->
  ?instance_arn:instance_arn ->
  ?application_account:account_id ->
  ?name:application_name_type ->
  ?application_provider_arn:application_provider_arn ->
  ?application_arn:application_arn ->
  unit ->
  application

val make_list_applications_response :
  ?next_token:token -> ?applications:application_list -> unit -> list_applications_response

val make_list_applications_filter :
  ?application_provider:application_provider_arn ->
  ?application_account:account_id ->
  unit ->
  list_applications_filter

val make_list_applications_request :
  ?filter:list_applications_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_applications_request

val make_display_data :
  ?description:description -> ?icon_url:icon_url -> ?display_name:name -> unit -> display_data

val make_resource_server_scope_details :
  ?detailed_title:description ->
  ?long_description:description ->
  unit ->
  resource_server_scope_details

val make_resource_server_config : ?scopes:resource_server_scopes -> unit -> resource_server_config

val make_application_provider :
  ?resource_server_config:resource_server_config ->
  ?display_data:display_data ->
  ?federation_protocol:federation_protocol ->
  application_provider_arn:application_provider_arn ->
  unit ->
  application_provider

val make_list_application_providers_response :
  ?next_token:token ->
  ?application_providers:application_provider_list ->
  unit ->
  list_application_providers_response

val make_list_application_providers_request :
  ?next_token:token -> ?max_results:max_results -> unit -> list_application_providers_request

val make_application_assignment_for_principal :
  ?principal_type:principal_type ->
  ?principal_id:principal_id ->
  ?application_arn:application_arn ->
  unit ->
  application_assignment_for_principal

val make_list_application_assignments_for_principal_response :
  ?next_token:token ->
  ?application_assignments:application_assignment_list_for_principal ->
  unit ->
  list_application_assignments_for_principal_response

val make_list_application_assignments_filter :
  ?application_arn:application_arn -> unit -> list_application_assignments_filter

val make_list_application_assignments_for_principal_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:list_application_assignments_filter ->
  principal_type:principal_type ->
  principal_id:principal_id ->
  instance_arn:instance_arn ->
  unit ->
  list_application_assignments_for_principal_request

val make_application_assignment :
  principal_type:principal_type ->
  principal_id:principal_id ->
  application_arn:application_arn ->
  unit ->
  application_assignment

val make_list_application_assignments_response :
  ?next_token:token ->
  ?application_assignments:application_assignments_list ->
  unit ->
  list_application_assignments_response

val make_list_application_assignments_request :
  ?next_token:token ->
  ?max_results:max_results ->
  application_arn:application_arn ->
  unit ->
  list_application_assignments_request

val make_list_accounts_for_provisioned_permission_set_response :
  ?next_token:token ->
  ?account_ids:account_list ->
  unit ->
  list_accounts_for_provisioned_permission_set_response

val make_list_accounts_for_provisioned_permission_set_request :
  ?next_token:token ->
  ?max_results:max_results ->
  ?provisioning_status:provisioning_status ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  list_accounts_for_provisioned_permission_set_request

val make_account_assignment_for_principal :
  ?principal_type:principal_type ->
  ?principal_id:principal_id ->
  ?permission_set_arn:permission_set_arn ->
  ?account_id:account_id ->
  unit ->
  account_assignment_for_principal

val make_list_account_assignments_for_principal_response :
  ?next_token:token ->
  ?account_assignments:account_assignment_list_for_principal ->
  unit ->
  list_account_assignments_for_principal_response

val make_list_account_assignments_filter :
  ?account_id:account_id -> unit -> list_account_assignments_filter

val make_list_account_assignments_for_principal_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:list_account_assignments_filter ->
  principal_type:principal_type ->
  principal_id:principal_id ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignments_for_principal_request

val make_account_assignment :
  ?principal_id:principal_id ->
  ?principal_type:principal_type ->
  ?permission_set_arn:permission_set_arn ->
  ?account_id:account_id ->
  unit ->
  account_assignment

val make_list_account_assignments_response :
  ?next_token:token ->
  ?account_assignments:account_assignment_list ->
  unit ->
  list_account_assignments_response

val make_list_account_assignments_request :
  ?next_token:token ->
  ?max_results:max_results ->
  permission_set_arn:permission_set_arn ->
  account_id:target_id ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignments_request

val make_account_assignment_operation_status_metadata :
  ?created_date:date ->
  ?request_id:uu_id ->
  ?status:status_values ->
  unit ->
  account_assignment_operation_status_metadata

val make_list_account_assignment_deletion_status_response :
  ?next_token:token ->
  ?account_assignments_deletion_status:account_assignment_operation_status_list ->
  unit ->
  list_account_assignment_deletion_status_response

val make_list_account_assignment_deletion_status_request :
  ?filter:operation_status_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignment_deletion_status_request

val make_list_account_assignment_creation_status_response :
  ?next_token:token ->
  ?account_assignments_creation_status:account_assignment_operation_status_list ->
  unit ->
  list_account_assignment_creation_status_response

val make_list_account_assignment_creation_status_request :
  ?filter:operation_status_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignment_creation_status_request

val make_get_permissions_boundary_for_permission_set_response :
  ?permissions_boundary:permissions_boundary ->
  unit ->
  get_permissions_boundary_for_permission_set_response

val make_get_permissions_boundary_for_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  get_permissions_boundary_for_permission_set_request

val make_get_inline_policy_for_permission_set_response :
  ?inline_policy:permission_set_policy_document ->
  unit ->
  get_inline_policy_for_permission_set_response

val make_get_inline_policy_for_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  get_inline_policy_for_permission_set_request

val make_get_application_session_configuration_response :
  ?user_background_session_application_status:user_background_session_application_status ->
  unit ->
  get_application_session_configuration_response

val make_get_application_session_configuration_request :
  application_arn:application_arn -> unit -> get_application_session_configuration_request

val make_get_application_assignment_configuration_response :
  assignment_required:assignment_required ->
  unit ->
  get_application_assignment_configuration_response

val make_get_application_assignment_configuration_request :
  application_arn:application_arn -> unit -> get_application_assignment_configuration_request

val make_detach_managed_policy_from_permission_set_response : unit -> unit

val make_detach_managed_policy_from_permission_set_request :
  managed_policy_arn:managed_policy_arn ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  detach_managed_policy_from_permission_set_request

val make_detach_customer_managed_policy_reference_from_permission_set_response : unit -> unit

val make_detach_customer_managed_policy_reference_from_permission_set_request :
  customer_managed_policy_reference:customer_managed_policy_reference ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  detach_customer_managed_policy_reference_from_permission_set_request

val make_describe_trusted_token_issuer_response :
  ?trusted_token_issuer_configuration:trusted_token_issuer_configuration ->
  ?trusted_token_issuer_type:trusted_token_issuer_type ->
  ?name:trusted_token_issuer_name ->
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  unit ->
  describe_trusted_token_issuer_response

val make_describe_trusted_token_issuer_request :
  trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> describe_trusted_token_issuer_request

val make_describe_region_response :
  ?is_primary_region:is_primary_region ->
  ?added_date:date ->
  ?status:region_status ->
  ?region_name:region_name ->
  unit ->
  describe_region_response

val make_describe_region_request :
  region_name:region_name -> instance_arn:instance_arn -> unit -> describe_region_request

val make_describe_permission_set_provisioning_status_response :
  ?permission_set_provisioning_status:permission_set_provisioning_status ->
  unit ->
  describe_permission_set_provisioning_status_response

val make_describe_permission_set_provisioning_status_request :
  provision_permission_set_request_id:uu_id ->
  instance_arn:instance_arn ->
  unit ->
  describe_permission_set_provisioning_status_request

val make_permission_set :
  ?relay_state:relay_state ->
  ?session_duration:duration ->
  ?created_date:date ->
  ?description:permission_set_description ->
  ?permission_set_arn:permission_set_arn ->
  ?name:permission_set_name ->
  unit ->
  permission_set

val make_describe_permission_set_response :
  ?permission_set:permission_set -> unit -> describe_permission_set_response

val make_describe_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  describe_permission_set_request

val make_describe_instance_access_control_attribute_configuration_response :
  ?instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  ?status_reason:instance_access_control_attribute_configuration_status_reason ->
  ?status:instance_access_control_attribute_configuration_status ->
  unit ->
  describe_instance_access_control_attribute_configuration_response

val make_describe_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  unit ->
  describe_instance_access_control_attribute_configuration_request

val make_encryption_configuration_details :
  ?encryption_status_reason:reason ->
  ?encryption_status:kms_key_status ->
  ?kms_key_arn:kms_key_arn ->
  ?key_type:kms_key_type ->
  unit ->
  encryption_configuration_details

val make_describe_instance_response :
  ?encryption_configuration_details:encryption_configuration_details ->
  ?status_reason:reason ->
  ?status:instance_status ->
  ?created_date:date ->
  ?name:name_type ->
  ?owner_account_id:account_id ->
  ?identity_store_id:id ->
  ?instance_arn:instance_arn ->
  unit ->
  describe_instance_response

val make_describe_instance_request : instance_arn:instance_arn -> unit -> describe_instance_request

val make_describe_application_provider_response :
  ?resource_server_config:resource_server_config ->
  ?display_data:display_data ->
  ?federation_protocol:federation_protocol ->
  application_provider_arn:application_provider_arn ->
  unit ->
  describe_application_provider_response

val make_describe_application_provider_request :
  application_provider_arn:application_provider_arn -> unit -> describe_application_provider_request

val make_describe_application_assignment_response :
  ?application_arn:application_arn ->
  ?principal_id:principal_id ->
  ?principal_type:principal_type ->
  unit ->
  describe_application_assignment_response

val make_describe_application_assignment_request :
  principal_type:principal_type ->
  principal_id:principal_id ->
  application_arn:application_arn ->
  unit ->
  describe_application_assignment_request

val make_describe_application_response :
  ?created_from:region_name ->
  ?created_date:date ->
  ?description:description ->
  ?portal_options:portal_options ->
  ?status:application_status ->
  ?identity_store_arn:identity_store_arn ->
  ?instance_arn:instance_arn ->
  ?application_account:account_id ->
  ?name:application_name_type ->
  ?application_provider_arn:application_provider_arn ->
  ?application_arn:application_arn ->
  unit ->
  describe_application_response

val make_describe_application_request :
  application_arn:application_arn -> unit -> describe_application_request

val make_account_assignment_operation_status :
  ?created_date:date ->
  ?principal_id:principal_id ->
  ?principal_type:principal_type ->
  ?permission_set_arn:permission_set_arn ->
  ?target_type:target_type ->
  ?target_id:target_id ->
  ?failure_reason:reason ->
  ?request_id:uu_id ->
  ?status:status_values ->
  unit ->
  account_assignment_operation_status

val make_describe_account_assignment_deletion_status_response :
  ?account_assignment_deletion_status:account_assignment_operation_status ->
  unit ->
  describe_account_assignment_deletion_status_response

val make_describe_account_assignment_deletion_status_request :
  account_assignment_deletion_request_id:uu_id ->
  instance_arn:instance_arn ->
  unit ->
  describe_account_assignment_deletion_status_request

val make_describe_account_assignment_creation_status_response :
  ?account_assignment_creation_status:account_assignment_operation_status ->
  unit ->
  describe_account_assignment_creation_status_response

val make_describe_account_assignment_creation_status_request :
  account_assignment_creation_request_id:uu_id ->
  instance_arn:instance_arn ->
  unit ->
  describe_account_assignment_creation_status_request

val make_delete_trusted_token_issuer_response : unit -> unit

val make_delete_trusted_token_issuer_request :
  trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> delete_trusted_token_issuer_request

val make_delete_permission_set_response : unit -> unit

val make_delete_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  delete_permission_set_request

val make_delete_permissions_boundary_from_permission_set_response : unit -> unit

val make_delete_permissions_boundary_from_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  delete_permissions_boundary_from_permission_set_request

val make_delete_instance_access_control_attribute_configuration_response : unit -> unit

val make_delete_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  unit ->
  delete_instance_access_control_attribute_configuration_request

val make_delete_instance_response : unit -> unit
val make_delete_instance_request : instance_arn:instance_arn -> unit -> delete_instance_request
val make_delete_inline_policy_from_permission_set_response : unit -> unit

val make_delete_inline_policy_from_permission_set_request :
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  delete_inline_policy_from_permission_set_request

val make_delete_application_assignment_response : unit -> unit

val make_delete_application_assignment_request :
  principal_type:principal_type ->
  principal_id:principal_id ->
  application_arn:application_arn ->
  unit ->
  delete_application_assignment_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  application_arn:application_arn -> unit -> delete_application_request

val make_delete_account_assignment_response :
  ?account_assignment_deletion_status:account_assignment_operation_status ->
  unit ->
  delete_account_assignment_response

val make_delete_account_assignment_request :
  principal_id:principal_id ->
  principal_type:principal_type ->
  permission_set_arn:permission_set_arn ->
  target_type:target_type ->
  target_id:target_id ->
  instance_arn:instance_arn ->
  unit ->
  delete_account_assignment_request

val make_create_trusted_token_issuer_response :
  ?trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> create_trusted_token_issuer_response

val make_create_trusted_token_issuer_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  trusted_token_issuer_configuration:trusted_token_issuer_configuration ->
  trusted_token_issuer_type:trusted_token_issuer_type ->
  name:trusted_token_issuer_name ->
  instance_arn:instance_arn ->
  unit ->
  create_trusted_token_issuer_request

val make_create_permission_set_response :
  ?permission_set:permission_set -> unit -> create_permission_set_response

val make_create_permission_set_request :
  ?tags:tag_list ->
  ?relay_state:relay_state ->
  ?session_duration:duration ->
  ?description:permission_set_description ->
  instance_arn:instance_arn ->
  name:permission_set_name ->
  unit ->
  create_permission_set_request

val make_create_instance_access_control_attribute_configuration_response : unit -> unit

val make_create_instance_access_control_attribute_configuration_request :
  instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  instance_arn:instance_arn ->
  unit ->
  create_instance_access_control_attribute_configuration_request

val make_create_instance_response : ?instance_arn:instance_arn -> unit -> create_instance_response

val make_create_instance_request :
  ?tags:tag_list -> ?client_token:client_token -> ?name:name_type -> unit -> create_instance_request

val make_create_application_assignment_response : unit -> unit

val make_create_application_assignment_request :
  principal_type:principal_type ->
  principal_id:principal_id ->
  application_arn:application_arn ->
  unit ->
  create_application_assignment_request

val make_create_application_response :
  ?identity_store_arn:identity_store_arn ->
  ?instance_arn:instance_arn ->
  ?application_arn:application_arn ->
  unit ->
  create_application_response

val make_create_application_request :
  ?client_token:client_token ->
  ?status:application_status ->
  ?tags:tag_list ->
  ?portal_options:portal_options ->
  ?description:description ->
  name:application_name_type ->
  application_provider_arn:application_provider_arn ->
  instance_arn:instance_arn ->
  unit ->
  create_application_request

val make_create_account_assignment_response :
  ?account_assignment_creation_status:account_assignment_operation_status ->
  unit ->
  create_account_assignment_response

val make_create_account_assignment_request :
  principal_id:principal_id ->
  principal_type:principal_type ->
  permission_set_arn:permission_set_arn ->
  target_type:target_type ->
  target_id:target_id ->
  instance_arn:instance_arn ->
  unit ->
  create_account_assignment_request

val make_attach_managed_policy_to_permission_set_response : unit -> unit

val make_attach_managed_policy_to_permission_set_request :
  managed_policy_arn:managed_policy_arn ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  attach_managed_policy_to_permission_set_request

val make_attach_customer_managed_policy_reference_to_permission_set_response : unit -> unit

val make_attach_customer_managed_policy_reference_to_permission_set_request :
  customer_managed_policy_reference:customer_managed_policy_reference ->
  permission_set_arn:permission_set_arn ->
  instance_arn:instance_arn ->
  unit ->
  attach_customer_managed_policy_reference_to_permission_set_request

val make_add_region_response : ?status:region_status -> unit -> add_region_response

val make_add_region_request :
  region_name:region_name -> instance_arn:instance_arn -> unit -> add_region_request

val make_refresh_token_grant : unit -> unit
val make_authorization_code_grant : ?redirect_uris:redirect_uris -> unit -> authorization_code_grant

val make_authorized_token_issuer :
  ?authorized_audiences:token_issuer_audiences ->
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  unit ->
  authorized_token_issuer

val make_jwt_bearer_grant :
  ?authorized_token_issuers:authorized_token_issuers -> unit -> jwt_bearer_grant

val make_put_application_grant_request :
  grant:grant ->
  grant_type:grant_type ->
  application_arn:application_arn ->
  unit ->
  put_application_grant_request

val make_iam_authentication_method :
  actor_policy:actor_policy_document -> unit -> iam_authentication_method

val make_put_application_authentication_method_request :
  authentication_method:authentication_method ->
  authentication_method_type:authentication_method_type ->
  application_arn:application_arn ->
  unit ->
  put_application_authentication_method_request

val make_put_application_access_scope_request :
  ?authorized_targets:scope_targets ->
  application_arn:application_arn ->
  scope:scope ->
  unit ->
  put_application_access_scope_request

val make_grant_item : grant:grant -> grant_type:grant_type -> unit -> grant_item

val make_list_application_grants_response :
  ?next_token:token -> grants:grants -> unit -> list_application_grants_response

val make_list_application_grants_request :
  ?next_token:token -> application_arn:application_arn -> unit -> list_application_grants_request

val make_authentication_method_item :
  ?authentication_method:authentication_method ->
  ?authentication_method_type:authentication_method_type ->
  unit ->
  authentication_method_item

val make_list_application_authentication_methods_response :
  ?next_token:token ->
  ?authentication_methods:authentication_methods ->
  unit ->
  list_application_authentication_methods_response

val make_list_application_authentication_methods_request :
  ?next_token:token ->
  application_arn:application_arn ->
  unit ->
  list_application_authentication_methods_request

val make_list_application_access_scopes_response :
  ?next_token:token -> scopes:scopes -> unit -> list_application_access_scopes_response

val make_list_application_access_scopes_request :
  ?next_token:token ->
  ?max_results:max_results ->
  application_arn:application_arn ->
  unit ->
  list_application_access_scopes_request

val make_get_application_grant_response : grant:grant -> unit -> get_application_grant_response

val make_get_application_grant_request :
  grant_type:grant_type -> application_arn:application_arn -> unit -> get_application_grant_request

val make_get_application_authentication_method_response :
  ?authentication_method:authentication_method ->
  unit ->
  get_application_authentication_method_response

val make_get_application_authentication_method_request :
  authentication_method_type:authentication_method_type ->
  application_arn:application_arn ->
  unit ->
  get_application_authentication_method_request

val make_get_application_access_scope_response :
  ?authorized_targets:scope_targets -> scope:scope -> unit -> get_application_access_scope_response

val make_get_application_access_scope_request :
  scope:scope -> application_arn:application_arn -> unit -> get_application_access_scope_request

val make_delete_application_grant_request :
  grant_type:grant_type ->
  application_arn:application_arn ->
  unit ->
  delete_application_grant_request

val make_delete_application_authentication_method_request :
  authentication_method_type:authentication_method_type ->
  application_arn:application_arn ->
  unit ->
  delete_application_authentication_method_request

val make_delete_application_access_scope_request :
  scope:scope -> application_arn:application_arn -> unit -> delete_application_access_scope_request
