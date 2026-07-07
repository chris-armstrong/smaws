(** SSO Admin client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module DeleteApplicationAccessScope : sig
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
    delete_application_access_scope_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_application_access_scope_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes an IAM Identity Center access scope from an application.\n"]

module DeleteApplicationAuthenticationMethod : sig
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
    delete_application_authentication_method_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_application_authentication_method_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes an authentication method from an application.\n"]

module DeleteApplicationGrant : sig
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
    delete_application_grant_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    delete_application_grant_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes a grant from an application.\n"]

module GetApplicationAccessScope : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_access_scope_request ->
    ( get_application_access_scope_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_access_scope_request ->
    ( get_application_access_scope_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the authorized targets for an IAM Identity Center access scope for an application.\n"]

module GetApplicationAuthenticationMethod : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_authentication_method_request ->
    ( get_application_authentication_method_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_authentication_method_request ->
    ( get_application_authentication_method_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about an authentication method used by an application.\n"]

module GetApplicationGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_grant_request ->
    ( get_application_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_grant_request ->
    ( get_application_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about an application grant.\n"]

module ListApplicationAccessScopes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_access_scopes_request ->
    ( list_application_access_scopes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_access_scopes_request ->
    ( list_application_access_scopes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the access scopes and authorized targets associated with an application.\n"]

module ListApplicationAuthenticationMethods : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_authentication_methods_request ->
    ( list_application_authentication_methods_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_authentication_methods_request ->
    ( list_application_authentication_methods_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all of the authentication methods supported by the specified application.\n"]

module ListApplicationGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_grants_request ->
    ( list_application_grants_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_grants_request ->
    ( list_application_grants_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the grants associated with an application.\n"]

module PutApplicationAccessScope : sig
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
    put_application_access_scope_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    put_application_access_scope_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Adds or updates the list of authorized targets for an IAM Identity Center access scope for an \
   application.\n"]

module PutApplicationAuthenticationMethod : sig
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
    put_application_authentication_method_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    put_application_authentication_method_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc "Adds or updates an authentication method for an application.\n"]

module PutApplicationGrant : sig
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
    put_application_grant_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
    put_application_grant_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Creates a configuration for an application to use grants. Conceptually grants are authorization \
   to request actions related to tokens. This configuration will be used when parties are \
   requesting and receiving tokens during the trusted identity propagation process. For more \
   information on the IAM Identity Center supported grant workflows, see \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/customermanagedapps-saml2-oauth2.html}SAML \
   2.0 and OAuth 2.0}.\n\n\
  \ A grant is created between your applications and Identity Center instance which enables an \
   application to use specified mechanisms to obtain tokens. These tokens are used by your \
   applications to gain access to Amazon Web Services resources on behalf of users. The following \
   elements are within these exchanges:\n\
  \ \n\
  \  {ul\n\
  \        {-   {b Requester} - The application requesting access to Amazon Web Services resources.\n\
  \            \n\
  \             }\n\
  \        {-   {b Subject} - Typically the user that is requesting access to Amazon Web Services \
   resources.\n\
  \            \n\
  \             }\n\
  \        {-   {b Grant} - Conceptually, a grant is authorization to access Amazon Web Services \
   resources. These grants authorize token generation for authenticating access to the requester \
   and for the request to make requests on behalf of the subjects. There are four types of grants:\n\
  \            \n\
  \             {ul\n\
  \                   {-   {b AuthorizationCode} - Allows an application to request authorization \
   through a series of user-agent redirects.\n\
  \                       \n\
  \                        }\n\
  \                   {-   {b JWT bearer } - Authorizes an application to exchange a JSON Web \
   Token that came from an external identity provider. To learn more, see \
   {{:https://datatracker.ietf.org/doc/html/rfc6749}RFC 6479}.\n\
  \                       \n\
  \                        }\n\
  \                   {-   {b Refresh token} - Enables application to request new access tokens to \
   replace expiring or expired access tokens.\n\
  \                       \n\
  \                        }\n\
  \                   {-   {b Exchange token} - A grant that requests tokens from the \
   authorization server by providing a \226\128\152subject\226\128\153 token with access scope \
   authorizing trusted identity propagation to this application. To learn more, see \
   {{:https://datatracker.ietf.org/doc/html/rfc8693}RFC 8693}.\n\
  \                       \n\
  \                        }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        {-   {b Authorization server} - IAM Identity Center requests tokens.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   User credentials are never shared directly within these exchanges. Instead, applications use \
   grants to request access tokens from IAM Identity Center. For more information, see \
   {{:https://datatracker.ietf.org/doc/html/rfc6749}RFC 6479}.\n\
  \   \n\
  \     {b Use cases} \n\
  \    \n\
  \     {ul\n\
  \           {-  Connecting to custom applications.\n\
  \               \n\
  \                }\n\
  \           {-  Configuring an Amazon Web Services service to make calls to another Amazon Web \
   Services services using JWT tokens.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module AddRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_region_request ->
    ( add_region_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a Region to an IAM Identity Center instance. This operation initiates an asynchronous \
   workflow to replicate the IAM Identity Center instance to the target Region. The Region status \
   is set to ADDING at first and changes to ACTIVE when the workflow completes.\n\n\
  \ To use this operation, your IAM Identity Center instance and the target Region must meet the \
   requirements described in the \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/multi-region-iam-identity-center.html#multi-region-prerequisites}IAM \
   Identity Center User Guide}. \n\
  \ \n\
  \  The following actions are related to [AddRegion]:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_RemoveRegion.html}RemoveRegion} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_DescribeRegion.html}DescribeRegion} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListRegions.html}ListRegions} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module AttachCustomerManagedPolicyReferenceToPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_customer_managed_policy_reference_to_permission_set_request ->
    ( attach_customer_managed_policy_reference_to_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_customer_managed_policy_reference_to_permission_set_request ->
    ( attach_customer_managed_policy_reference_to_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Attaches the specified customer managed policy to the specified [PermissionSet].\n"]

module AttachManagedPolicyToPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_managed_policy_to_permission_set_request ->
    ( attach_managed_policy_to_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_managed_policy_to_permission_set_request ->
    ( attach_managed_policy_to_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches an Amazon Web Services managed policy ARN to a permission set.\n\n\
  \  If the permission set is already referenced by one or more account assignments, you will need \
   to call \n\
  \  {[\n\
  \   [ProvisionPermissionSet] \n\
  \  ]}\n\
  \   after this operation. Calling [ProvisionPermissionSet] applies the corresponding IAM policy \
   updates to all assigned accounts.\n\
  \  \n\
  \   "]

module CreateAccountAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_account_assignment_request ->
    ( create_account_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_account_assignment_request ->
    ( create_account_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns access to a principal for a specified Amazon Web Services account using a specified \
   permission set.\n\n\
  \  The term {i principal} here refers to a user or group that is defined in IAM Identity Center.\n\
  \  \n\
  \     As part of a successful [CreateAccountAssignment] call, the specified permission set will \
   automatically be provisioned to the account in the form of an IAM policy. That policy is \
   attached to the IAM role created in IAM Identity Center. If the permission set is subsequently \
   updated, the corresponding IAM policies attached to roles in your accounts will not be updated \
   automatically. In this case, you must call \n\
  \     {[\n\
  \      [ProvisionPermissionSet] \n\
  \     ]}\n\
  \      to make these updates.\n\
  \     \n\
  \         After a successful response, call [DescribeAccountAssignmentCreationStatus] to \
   describe the status of an assignment creation request. \n\
  \        \n\
  \         "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an OAuth 2.0 customer managed application in IAM Identity Center for the given \
   application provider.\n\n\
  \  This API does not support creating SAML 2.0 customer managed applications or Amazon Web \
   Services managed applications. To learn how to create an Amazon Web Services managed \
   application, see the application user guide. You can create a SAML 2.0 customer managed \
   application in the Amazon Web Services Management Console only. See \
   {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/customermanagedapps-saml2-setup.html}Setting \
   up customer managed SAML 2.0 applications}. For more information on these application types, \
   see {{:https://docs.aws.amazon.com/singlesignon/latest/userguide/awsapps.html}Amazon Web \
   Services managed applications}.\n\
  \  \n\
  \   "]

module CreateApplicationAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_assignment_request ->
    ( create_application_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_assignment_request ->
    ( create_application_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Grant application access to a user or group.\n"]

module CreateInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_instance_request ->
    ( create_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_instance_request ->
    ( create_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an instance of IAM Identity Center for a standalone Amazon Web Services account that is \
   not managed by Organizations or a member Amazon Web Services account in an organization. You \
   can create only one instance per account and across all Amazon Web Services Regions.\n\n\
  \ The CreateInstance request is rejected if the following apply: \n\
  \ \n\
  \  {ul\n\
  \        {-  The instance is created within the organization management account.\n\
  \            \n\
  \             }\n\
  \        {-  An instance already exists in the same account.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateInstanceAccessControlAttributeConfiguration : sig
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
    create_instance_access_control_attribute_configuration_request ->
    ( create_instance_access_control_attribute_configuration_response,
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
    create_instance_access_control_attribute_configuration_request ->
    ( create_instance_access_control_attribute_configuration_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Enables the attributes-based access control (ABAC) feature for the specified IAM Identity \
   Center instance. You can also specify new attributes to add to your ABAC configuration during \
   the enabling process. For more information about ABAC, see \
   {{:/singlesignon/latest/userguide/abac.html}Attribute-Based Access Control} in the {i IAM \
   Identity Center User Guide}.\n\n\
  \  After a successful response, call [DescribeInstanceAccessControlAttributeConfiguration] to \
   validate that [InstanceAccessControlAttributeConfiguration] was created.\n\
  \  \n\
  \   "]

module CreatePermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_permission_set_request ->
    ( create_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_permission_set_request ->
    ( create_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a permission set within a specified IAM Identity Center instance.\n\n\
  \  To grant users and groups access to Amazon Web Services account resources, use \n\
  \  {[\n\
  \   [CreateAccountAssignment] \n\
  \  ]}\n\
  \  .\n\
  \  \n\
  \   "]

module CreateTrustedTokenIssuer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trusted_token_issuer_request ->
    ( create_trusted_token_issuer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trusted_token_issuer_request ->
    ( create_trusted_token_issuer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection to a trusted token issuer in an instance of IAM Identity Center. A trusted \
   token issuer enables trusted identity propagation to be used with applications that \
   authenticate outside of Amazon Web Services.\n\n\
  \ This trusted token issuer describes an external identity provider (IdP) that can generate \
   claims or assertions in the form of access tokens for a user. Applications enabled for IAM \
   Identity Center can use these tokens for authentication. \n\
  \ "]

module DeleteAccountAssignment : sig
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
    delete_account_assignment_request ->
    ( delete_account_assignment_response,
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
    delete_account_assignment_request ->
    ( delete_account_assignment_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Deletes a principal's access from a specified Amazon Web Services account using a specified \
   permission set.\n\n\
  \  After a successful response, call [DescribeAccountAssignmentDeletionStatus] to describe the \
   status of an assignment deletion request.\n\
  \  \n\
  \   "]

module DeleteApplication : sig
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
    delete_application_request ->
    ( delete_application_response,
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
    delete_application_request ->
    ( delete_application_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Deletes the association with the application. The connected service resource still exists.\n"]

module DeleteApplicationAssignment : sig
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
    delete_application_assignment_request ->
    ( delete_application_assignment_response,
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
    delete_application_assignment_request ->
    ( delete_application_assignment_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Revoke application access to an application by deleting application assignments for a user or \
   group.\n"]

module DeleteInlinePolicyFromPermissionSet : sig
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
    delete_inline_policy_from_permission_set_request ->
    ( delete_inline_policy_from_permission_set_response,
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
    delete_inline_policy_from_permission_set_request ->
    ( delete_inline_policy_from_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes the inline policy from a specified permission set.\n"]

module DeleteInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_request ->
    ( delete_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_instance_request ->
    ( delete_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the instance of IAM Identity Center. Only the account that owns the instance can call \
   this API. Neither the delegated administrator nor member account can delete the organization \
   instance, but those roles can delete their own instance.\n"]

module DeleteInstanceAccessControlAttributeConfiguration : sig
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
    delete_instance_access_control_attribute_configuration_request ->
    ( delete_instance_access_control_attribute_configuration_response,
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
    delete_instance_access_control_attribute_configuration_request ->
    ( delete_instance_access_control_attribute_configuration_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Disables the attributes-based access control (ABAC) feature for the specified IAM Identity \
   Center instance and deletes all of the attribute mappings that have been configured. Once \
   deleted, any attributes that are received from an identity source and any custom attributes you \
   have previously configured will not be passed. For more information about ABAC, see \
   {{:/singlesignon/latest/userguide/abac.html}Attribute-Based Access Control} in the {i IAM \
   Identity Center User Guide}.\n"]

module DeletePermissionsBoundaryFromPermissionSet : sig
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
    delete_permissions_boundary_from_permission_set_request ->
    ( delete_permissions_boundary_from_permission_set_response,
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
    delete_permissions_boundary_from_permission_set_request ->
    ( delete_permissions_boundary_from_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes the permissions boundary from a specified [PermissionSet].\n"]

module DeletePermissionSet : sig
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
    delete_permission_set_request ->
    ( delete_permission_set_response,
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
    delete_permission_set_request ->
    ( delete_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Deletes the specified permission set.\n"]

module DeleteTrustedTokenIssuer : sig
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
    delete_trusted_token_issuer_request ->
    ( delete_trusted_token_issuer_response,
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
    delete_trusted_token_issuer_request ->
    ( delete_trusted_token_issuer_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Deletes a trusted token issuer configuration from an instance of IAM Identity Center.\n\n\
  \  Deleting this trusted token issuer configuration will cause users to lose access to any \
   applications that are configured to use the trusted token issuer.\n\
  \  \n\
  \   "]

module DescribeAccountAssignmentCreationStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_assignment_creation_status_request ->
    ( describe_account_assignment_creation_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_assignment_creation_status_request ->
    ( describe_account_assignment_creation_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the status of the assignment creation request.\n"]

module DescribeAccountAssignmentDeletionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_assignment_deletion_status_request ->
    ( describe_account_assignment_deletion_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_assignment_deletion_status_request ->
    ( describe_account_assignment_deletion_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the status of the assignment deletion request.\n"]

module DescribeApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details of an application associated with an instance of IAM Identity Center.\n"]

module DescribeApplicationAssignment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_assignment_request ->
    ( describe_application_assignment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_assignment_request ->
    ( describe_application_assignment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a direct assignment of a user or group to an application. If the user \
   doesn\226\128\153t have a direct assignment to the application, the user may still have access \
   to the application through a group. Therefore, don\226\128\153t use this API to test access to \
   an application for a user. Instead use [ListApplicationAssignmentsForPrincipal].\n"]

module DescribeApplicationProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_provider_request ->
    ( describe_application_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_provider_request ->
    ( describe_application_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details about a provider that can be used to connect an Amazon Web Services managed \
   application or customer managed application to IAM Identity Center.\n"]

module DescribeInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_request ->
    ( describe_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_request ->
    ( describe_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of an instance of IAM Identity Center. The status can be one of the \
   following:\n\n\
  \ {ul\n\
  \       {-   [CREATE_IN_PROGRESS] - The instance is in the process of being created. When the \
   instance is ready for use, DescribeInstance returns the status of [ACTIVE]. While the instance \
   is in the [CREATE_IN_PROGRESS] state, you can call only DescribeInstance and DeleteInstance \
   operations.\n\
  \           \n\
  \            }\n\
  \       {-   [DELETE_IN_PROGRESS] - The instance is being deleted. Returns \
   [AccessDeniedException] after the delete operation completes. \n\
  \           \n\
  \            }\n\
  \       {-   [ACTIVE] - The instance is active.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeInstanceAccessControlAttributeConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_access_control_attribute_configuration_request ->
    ( describe_instance_access_control_attribute_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_access_control_attribute_configuration_request ->
    ( describe_instance_access_control_attribute_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of IAM Identity Center identity store attributes that have been configured to \
   work with attributes-based access control (ABAC) for the specified IAM Identity Center \
   instance. This will not return attributes configured and sent by an external identity provider. \
   For more information about ABAC, see \
   {{:/singlesignon/latest/userguide/abac.html}Attribute-Based Access Control} in the {i IAM \
   Identity Center User Guide}.\n"]

module DescribePermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_permission_set_request ->
    ( describe_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_permission_set_request ->
    ( describe_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the details of the permission set.\n"]

module DescribePermissionSetProvisioningStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_permission_set_provisioning_status_request ->
    ( describe_permission_set_provisioning_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_permission_set_provisioning_status_request ->
    ( describe_permission_set_provisioning_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the status for the given permission set provisioning request.\n"]

module DescribeRegion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_region_request ->
    ( describe_region_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_region_request ->
    ( describe_region_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details about a specific Region enabled in an IAM Identity Center instance. Details \
   include the Region name, current status (ACTIVE, ADDING, or REMOVING), the date when the Region \
   was added, and whether it is the primary Region. The request must be made from one of the \
   enabled Regions of the IAM Identity Center instance.\n\n\
  \ The following actions are related to [DescribeRegion]:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_AddRegion.html} AddRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_RemoveRegion.html}RemoveRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListRegions.html}ListRegions} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeTrustedTokenIssuer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_token_issuer_request ->
    ( describe_trusted_token_issuer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_token_issuer_request ->
    ( describe_trusted_token_issuer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details about a trusted token issuer configuration stored in an instance of IAM \
   Identity Center. Details include the name of the trusted token issuer, the issuer URL, and the \
   path of the source attribute and the destination attribute for a trusted token issuer \
   configuration. \n"]

module DetachCustomerManagedPolicyReferenceFromPermissionSet : sig
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
    detach_customer_managed_policy_reference_from_permission_set_request ->
    ( detach_customer_managed_policy_reference_from_permission_set_response,
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
    detach_customer_managed_policy_reference_from_permission_set_request ->
    ( detach_customer_managed_policy_reference_from_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Detaches the specified customer managed policy from the specified [PermissionSet].\n"]

module DetachManagedPolicyFromPermissionSet : sig
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
    detach_managed_policy_from_permission_set_request ->
    ( detach_managed_policy_from_permission_set_response,
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
    detach_managed_policy_from_permission_set_request ->
    ( detach_managed_policy_from_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Detaches the attached Amazon Web Services managed policy ARN from the specified permission set.\n"]

module GetApplicationAssignmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_assignment_configuration_request ->
    ( get_application_assignment_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_assignment_configuration_request ->
    ( get_application_assignment_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the configuration of [PutApplicationAssignmentConfiguration].\n"]

module GetApplicationSessionConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_session_configuration_request ->
    ( get_application_session_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_session_configuration_request ->
    ( get_application_session_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the session configuration for an application in IAM Identity Center.\n\n\
  \ The session configuration determines how users can access an application. This includes \
   whether user background sessions are enabled. User background sessions allow users to start a \
   job on a supported Amazon Web Services managed application without having to remain signed in \
   to an active session while the job runs.\n\
  \ "]

module GetInlinePolicyForPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_inline_policy_for_permission_set_request ->
    ( get_inline_policy_for_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_inline_policy_for_permission_set_request ->
    ( get_inline_policy_for_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Obtains the inline policy assigned to the permission set.\n"]

module GetPermissionsBoundaryForPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_permissions_boundary_for_permission_set_request ->
    ( get_permissions_boundary_for_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_permissions_boundary_for_permission_set_request ->
    ( get_permissions_boundary_for_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Obtains the permissions boundary for a specified [PermissionSet].\n"]

module ListAccountAssignmentCreationStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignment_creation_status_request ->
    ( list_account_assignment_creation_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignment_creation_status_request ->
    ( list_account_assignment_creation_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the status of the Amazon Web Services account assignment creation requests for a \
   specified IAM Identity Center instance.\n"]

module ListAccountAssignmentDeletionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignment_deletion_status_request ->
    ( list_account_assignment_deletion_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignment_deletion_status_request ->
    ( list_account_assignment_deletion_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the status of the Amazon Web Services account assignment deletion requests for a \
   specified IAM Identity Center instance.\n"]

module ListAccountAssignments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignments_request ->
    ( list_account_assignments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignments_request ->
    ( list_account_assignments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the assignee of the specified Amazon Web Services account with the specified permission \
   set.\n"]

module ListAccountAssignmentsForPrincipal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignments_for_principal_request ->
    ( list_account_assignments_for_principal_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_assignments_for_principal_request ->
    ( list_account_assignments_for_principal_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the IAM Identity Center associated Amazon Web Services accounts that the \
   principal has access to. This action must be called from the management account containing your \
   organization instance of IAM Identity Center. This action is not valid for account instances of \
   IAM Identity Center.\n"]

module ListAccountsForProvisionedPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_for_provisioned_permission_set_request ->
    ( list_accounts_for_provisioned_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_for_provisioned_permission_set_request ->
    ( list_accounts_for_provisioned_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the Amazon Web Services accounts where the specified permission set is provisioned.\n"]

module ListApplicationAssignments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_assignments_request ->
    ( list_application_assignments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_assignments_request ->
    ( list_application_assignments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists Amazon Web Services account users that are assigned to an application.\n"]

module ListApplicationAssignmentsForPrincipal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_assignments_for_principal_request ->
    ( list_application_assignments_for_principal_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_assignments_for_principal_request ->
    ( list_application_assignments_for_principal_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the applications to which a specified principal is assigned. You must provide a filter \
   when calling this action from a member account against your organization instance of IAM \
   Identity Center. A filter is not required when called from the management account against an \
   organization instance of IAM Identity Center, or from a member account against an account \
   instance of IAM Identity Center in the same account.\n"]

module ListApplicationProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_providers_request ->
    ( list_application_providers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_providers_request ->
    ( list_application_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the application providers configured in the IAM Identity Center identity store.\n"]

module ListApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all applications associated with the instance of IAM Identity Center. When listing \
   applications for an organization instance in the management account, member accounts must use \
   the [applicationAccount] parameter to filter the list to only applications created from that \
   account. When listing applications for an account instance in the same member account, a filter \
   is not required.\n"]

module ListCustomerManagedPolicyReferencesInPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_customer_managed_policy_references_in_permission_set_request ->
    ( list_customer_managed_policy_references_in_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_customer_managed_policy_references_in_permission_set_request ->
    ( list_customer_managed_policy_references_in_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all customer managed policies attached to a specified [PermissionSet].\n"]

module ListInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instances_request ->
    ( list_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instances_request ->
    ( list_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the details of the organization and account instances of IAM Identity Center that were \
   created in or visible to the account calling this API. \n"]

module ListManagedPoliciesInPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_managed_policies_in_permission_set_request ->
    ( list_managed_policies_in_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_managed_policies_in_permission_set_request ->
    ( list_managed_policies_in_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Amazon Web Services managed policy that is attached to a specified permission set.\n"]

module ListPermissionSetProvisioningStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_permission_set_provisioning_status_request ->
    ( list_permission_set_provisioning_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_permission_set_provisioning_status_request ->
    ( list_permission_set_provisioning_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the status of the permission set provisioning requests for a specified IAM Identity \
   Center instance.\n"]

module ListPermissionSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_permission_sets_request ->
    ( list_permission_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_permission_sets_request ->
    ( list_permission_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the [PermissionSet]s in an IAM Identity Center instance.\n"]

module ListPermissionSetsProvisionedToAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_permission_sets_provisioned_to_account_request ->
    ( list_permission_sets_provisioned_to_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_permission_sets_provisioned_to_account_request ->
    ( list_permission_sets_provisioned_to_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the permission sets that are provisioned to a specified Amazon Web Services account.\n"]

module ListRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_regions_request ->
    ( list_regions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_regions_request ->
    ( list_regions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all enabled Regions of an IAM Identity Center instance, including those that are being \
   added or removed. This operation returns Regions with ACTIVE, ADDING, or REMOVING status.\n\n\
  \ The following actions are related to [ListRegions]:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_AddRegion.html} AddRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_RemoveRegion.html}RemoveRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_DescribeRegion.html}DescribeRegion} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
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
      | `AccessDeniedException of access_denied_exception
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
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags that are attached to a specified resource.\n"]

module ListTrustedTokenIssuers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_trusted_token_issuers_request ->
    ( list_trusted_token_issuers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_trusted_token_issuers_request ->
    ( list_trusted_token_issuers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the trusted token issuers configured in an instance of IAM Identity Center.\n"]

module ProvisionPermissionSet : sig
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
    provision_permission_set_request ->
    ( provision_permission_set_response,
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
    provision_permission_set_request ->
    ( provision_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "The process by which a specified permission set is provisioned to the specified target.\n"]

module PutApplicationAssignmentConfiguration : sig
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
    put_application_assignment_configuration_request ->
    ( put_application_assignment_configuration_response,
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
    put_application_assignment_configuration_request ->
    ( put_application_assignment_configuration_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Configure how users gain access to an application. If [AssignmentsRequired] is [true] (default \
   value), users don\226\128\153t have access to the application unless an assignment is created \
   using the \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html}CreateApplicationAssignment \
   API}. If [false], all users have access to the application. If an assignment is created using \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_CreateApplicationAssignment.html}CreateApplicationAssignment}., \
   the user retains access if [AssignmentsRequired] is set to [true]. \n"]

module PutApplicationSessionConfiguration : sig
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
    put_application_session_configuration_request ->
    ( put_application_session_configuration_response,
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
    put_application_session_configuration_request ->
    ( put_application_session_configuration_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Updates the session configuration for an application in IAM Identity Center.\n\n\
  \ The session configuration determines how users can access an application. This includes \
   whether user background sessions are enabled. User background sessions allow users to start a \
   job on a supported Amazon Web Services managed application without having to remain signed in \
   to an active session while the job runs.\n\
  \ "]

module PutInlinePolicyToPermissionSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_inline_policy_to_permission_set_request ->
    ( put_inline_policy_to_permission_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_inline_policy_to_permission_set_request ->
    ( put_inline_policy_to_permission_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches an inline policy to a permission set.\n\n\
  \  If the permission set is already referenced by one or more account assignments, you will need \
   to call \n\
  \  {[\n\
  \   [ProvisionPermissionSet] \n\
  \  ]}\n\
  \   after this action to apply the corresponding IAM policy updates to all assigned accounts.\n\
  \  \n\
  \   "]

module PutPermissionsBoundaryToPermissionSet : sig
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
    put_permissions_boundary_to_permission_set_request ->
    ( put_permissions_boundary_to_permission_set_response,
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
    put_permissions_boundary_to_permission_set_request ->
    ( put_permissions_boundary_to_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Attaches an Amazon Web Services managed or customer managed policy to the specified \
   [PermissionSet] as a permissions boundary.\n"]

module RemoveRegion : sig
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
    remove_region_request ->
    ( remove_region_response,
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
    remove_region_request ->
    ( remove_region_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Removes an additional Region from an IAM Identity Center instance. This operation initiates an \
   asynchronous workflow to clean up IAM Identity Center resources in the specified additional \
   Region. The Region status is set to REMOVING and the Region record is deleted when the workflow \
   completes. The request must be made from the primary Region. The target Region cannot be the \
   primary Region, and no other add or remove Region workflows can be in progress.\n\n\
  \ The following actions are related to [RemoveRegion]:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_AddRegion.html} AddRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_DescribeRegion.html}DescribeRegion} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/singlesignon/latest/APIReference/API_ListRegions.html}ListRegions} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates a set of tags with a specified resource.\n"]

module UntagResource : sig
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
    untag_resource_request ->
    ( untag_resource_response,
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
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Disassociates a set of tags from a specified resource.\n"]

module UpdateApplication : sig
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
    update_application_request ->
    ( update_application_response,
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
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Updates application properties. \n"]

module UpdateInstance : sig
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
    update_instance_request ->
    ( update_instance_response,
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
    update_instance_request ->
    ( update_instance_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Update the details for the instance of IAM Identity Center that is owned by the Amazon Web \
   Services account.\n"]

module UpdateInstanceAccessControlAttributeConfiguration : sig
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
    update_instance_access_control_attribute_configuration_request ->
    ( update_instance_access_control_attribute_configuration_response,
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
    update_instance_access_control_attribute_configuration_request ->
    ( update_instance_access_control_attribute_configuration_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Updates the IAM Identity Center identity store attributes that you can use with the IAM \
   Identity Center instance for attributes-based access control (ABAC). When using an external \
   identity provider as an identity source, you can pass attributes through the SAML assertion as \
   an alternative to configuring attributes from the IAM Identity Center identity store. If a SAML \
   assertion passes any of these attributes, IAM Identity Center replaces the attribute value with \
   the value from the IAM Identity Center identity store. For more information about ABAC, see \
   {{:/singlesignon/latest/userguide/abac.html}Attribute-Based Access Control} in the {i IAM \
   Identity Center User Guide}.\n"]

module UpdatePermissionSet : sig
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
    update_permission_set_request ->
    ( update_permission_set_response,
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
    update_permission_set_request ->
    ( update_permission_set_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Updates an existing permission set.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateTrustedTokenIssuer : sig
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
    update_trusted_token_issuer_request ->
    ( update_trusted_token_issuer_response,
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
    update_trusted_token_issuer_request ->
    ( update_trusted_token_issuer_response Smaws_Lib.Response.t,
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
[@@ocaml.doc
  "Updates the name of the trusted token issuer, or the path of a source attribute or destination \
   attribute for a trusted token issuer configuration.\n\n\
  \  Updating this trusted token issuer configuration might cause users to lose access to any \
   applications that are configured to use the trusted token issuer.\n\
  \  \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
