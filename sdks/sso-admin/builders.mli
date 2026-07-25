open Types

val make_access_control_attribute_value :
  source:access_control_attribute_value_source_list -> unit -> access_control_attribute_value

val make_access_control_attribute :
  key:access_control_attribute_key ->
  value:access_control_attribute_value ->
  unit ->
  access_control_attribute

val make_account_assignment :
  ?account_id:account_id ->
  ?permission_set_arn:permission_set_arn ->
  ?principal_type:principal_type ->
  ?principal_id:principal_id ->
  unit ->
  account_assignment

val make_account_assignment_for_principal :
  ?account_id:account_id ->
  ?permission_set_arn:permission_set_arn ->
  ?principal_id:principal_id ->
  ?principal_type:principal_type ->
  unit ->
  account_assignment_for_principal

val make_account_assignment_operation_status :
  ?status:status_values ->
  ?request_id:uu_id ->
  ?failure_reason:reason ->
  ?target_id:target_id ->
  ?target_type:target_type ->
  ?permission_set_arn:permission_set_arn ->
  ?principal_type:principal_type ->
  ?principal_id:principal_id ->
  ?created_date:date ->
  unit ->
  account_assignment_operation_status

val make_account_assignment_operation_status_metadata :
  ?status:status_values ->
  ?request_id:uu_id ->
  ?created_date:date ->
  unit ->
  account_assignment_operation_status_metadata

val make_add_region_response : ?status:region_status -> unit -> add_region_response

val make_add_region_request :
  instance_arn:instance_arn -> region_name:region_name -> unit -> add_region_request

val make_sign_in_options :
  ?application_url:application_url -> origin:sign_in_origin -> unit -> sign_in_options

val make_portal_options :
  ?sign_in_options:sign_in_options -> ?visibility:application_visibility -> unit -> portal_options

val make_application :
  ?application_arn:application_arn ->
  ?application_provider_arn:application_provider_arn ->
  ?name:application_name_type ->
  ?application_account:account_id ->
  ?instance_arn:instance_arn ->
  ?identity_store_arn:identity_store_arn ->
  ?status:application_status ->
  ?portal_options:portal_options ->
  ?description:description ->
  ?created_date:date ->
  ?created_from:region_name ->
  unit ->
  application

val make_application_assignment :
  application_arn:application_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  application_assignment

val make_application_assignment_for_principal :
  ?application_arn:application_arn ->
  ?principal_id:principal_id ->
  ?principal_type:principal_type ->
  unit ->
  application_assignment_for_principal

val make_resource_server_scope_details :
  ?long_description:description ->
  ?detailed_title:description ->
  unit ->
  resource_server_scope_details

val make_resource_server_config : ?scopes:resource_server_scopes -> unit -> resource_server_config

val make_display_data :
  ?display_name:name -> ?icon_url:icon_url -> ?description:description -> unit -> display_data

val make_application_provider :
  ?federation_protocol:federation_protocol ->
  ?display_data:display_data ->
  ?resource_server_config:resource_server_config ->
  application_provider_arn:application_provider_arn ->
  unit ->
  application_provider

val make_attach_customer_managed_policy_reference_to_permission_set_response : unit -> unit

val make_customer_managed_policy_reference :
  ?path:managed_policy_path -> name:managed_policy_name -> unit -> customer_managed_policy_reference

val make_attach_customer_managed_policy_reference_to_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  customer_managed_policy_reference:customer_managed_policy_reference ->
  unit ->
  attach_customer_managed_policy_reference_to_permission_set_request

val make_attach_managed_policy_to_permission_set_response : unit -> unit

val make_attach_managed_policy_to_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  managed_policy_arn:managed_policy_arn ->
  unit ->
  attach_managed_policy_to_permission_set_request

val make_attached_managed_policy :
  ?name:name -> ?arn:managed_policy_arn -> unit -> attached_managed_policy

val make_iam_authentication_method :
  actor_policy:actor_policy_document -> unit -> iam_authentication_method

val make_authentication_method_item :
  ?authentication_method_type:authentication_method_type ->
  ?authentication_method:authentication_method ->
  unit ->
  authentication_method_item

val make_authorization_code_grant : ?redirect_uris:redirect_uris -> unit -> authorization_code_grant

val make_authorized_token_issuer :
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  ?authorized_audiences:token_issuer_audiences ->
  unit ->
  authorized_token_issuer

val make_create_account_assignment_response :
  ?account_assignment_creation_status:account_assignment_operation_status ->
  unit ->
  create_account_assignment_response

val make_create_account_assignment_request :
  instance_arn:instance_arn ->
  target_id:target_id ->
  target_type:target_type ->
  permission_set_arn:permission_set_arn ->
  principal_type:principal_type ->
  principal_id:principal_id ->
  unit ->
  create_account_assignment_request

val make_create_application_response :
  ?application_arn:application_arn ->
  ?instance_arn:instance_arn ->
  ?identity_store_arn:identity_store_arn ->
  unit ->
  create_application_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_application_request :
  ?description:description ->
  ?portal_options:portal_options ->
  ?tags:tag_list ->
  ?status:application_status ->
  ?client_token:client_token ->
  instance_arn:instance_arn ->
  application_provider_arn:application_provider_arn ->
  name:application_name_type ->
  unit ->
  create_application_request

val make_create_application_assignment_response : unit -> unit

val make_create_application_assignment_request :
  application_arn:application_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  create_application_assignment_request

val make_create_instance_response : ?instance_arn:instance_arn -> unit -> create_instance_response

val make_create_instance_request :
  ?name:name_type -> ?client_token:client_token -> ?tags:tag_list -> unit -> create_instance_request

val make_create_instance_access_control_attribute_configuration_response : unit -> unit

val make_instance_access_control_attribute_configuration :
  access_control_attributes:access_control_attribute_list ->
  unit ->
  instance_access_control_attribute_configuration

val make_create_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  unit ->
  create_instance_access_control_attribute_configuration_request

val make_permission_set :
  ?name:permission_set_name ->
  ?permission_set_arn:permission_set_arn ->
  ?description:permission_set_description ->
  ?created_date:date ->
  ?session_duration:duration ->
  ?relay_state:relay_state ->
  unit ->
  permission_set

val make_create_permission_set_response :
  ?permission_set:permission_set -> unit -> create_permission_set_response

val make_create_permission_set_request :
  ?description:permission_set_description ->
  ?session_duration:duration ->
  ?relay_state:relay_state ->
  ?tags:tag_list ->
  name:permission_set_name ->
  instance_arn:instance_arn ->
  unit ->
  create_permission_set_request

val make_create_trusted_token_issuer_response :
  ?trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> create_trusted_token_issuer_response

val make_oidc_jwt_configuration :
  issuer_url:trusted_token_issuer_url ->
  claim_attribute_path:claim_attribute_path ->
  identity_store_attribute_path:jmes_path ->
  jwks_retrieval_option:jwks_retrieval_option ->
  unit ->
  oidc_jwt_configuration

val make_create_trusted_token_issuer_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  instance_arn:instance_arn ->
  name:trusted_token_issuer_name ->
  trusted_token_issuer_type:trusted_token_issuer_type ->
  trusted_token_issuer_configuration:trusted_token_issuer_configuration ->
  unit ->
  create_trusted_token_issuer_request

val make_delete_account_assignment_response :
  ?account_assignment_deletion_status:account_assignment_operation_status ->
  unit ->
  delete_account_assignment_response

val make_delete_account_assignment_request :
  instance_arn:instance_arn ->
  target_id:target_id ->
  target_type:target_type ->
  permission_set_arn:permission_set_arn ->
  principal_type:principal_type ->
  principal_id:principal_id ->
  unit ->
  delete_account_assignment_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  application_arn:application_arn -> unit -> delete_application_request

val make_delete_application_access_scope_request :
  application_arn:application_arn -> scope:scope -> unit -> delete_application_access_scope_request

val make_delete_application_assignment_response : unit -> unit

val make_delete_application_assignment_request :
  application_arn:application_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  delete_application_assignment_request

val make_delete_application_authentication_method_request :
  application_arn:application_arn ->
  authentication_method_type:authentication_method_type ->
  unit ->
  delete_application_authentication_method_request

val make_delete_application_grant_request :
  application_arn:application_arn ->
  grant_type:grant_type ->
  unit ->
  delete_application_grant_request

val make_delete_inline_policy_from_permission_set_response : unit -> unit

val make_delete_inline_policy_from_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  delete_inline_policy_from_permission_set_request

val make_delete_instance_response : unit -> unit
val make_delete_instance_request : instance_arn:instance_arn -> unit -> delete_instance_request
val make_delete_instance_access_control_attribute_configuration_response : unit -> unit

val make_delete_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  unit ->
  delete_instance_access_control_attribute_configuration_request

val make_delete_permission_set_response : unit -> unit

val make_delete_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  delete_permission_set_request

val make_delete_permissions_boundary_from_permission_set_response : unit -> unit

val make_delete_permissions_boundary_from_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  delete_permissions_boundary_from_permission_set_request

val make_delete_trusted_token_issuer_response : unit -> unit

val make_delete_trusted_token_issuer_request :
  trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> delete_trusted_token_issuer_request

val make_describe_account_assignment_creation_status_response :
  ?account_assignment_creation_status:account_assignment_operation_status ->
  unit ->
  describe_account_assignment_creation_status_response

val make_describe_account_assignment_creation_status_request :
  instance_arn:instance_arn ->
  account_assignment_creation_request_id:uu_id ->
  unit ->
  describe_account_assignment_creation_status_request

val make_describe_account_assignment_deletion_status_response :
  ?account_assignment_deletion_status:account_assignment_operation_status ->
  unit ->
  describe_account_assignment_deletion_status_response

val make_describe_account_assignment_deletion_status_request :
  instance_arn:instance_arn ->
  account_assignment_deletion_request_id:uu_id ->
  unit ->
  describe_account_assignment_deletion_status_request

val make_describe_application_response :
  ?application_arn:application_arn ->
  ?application_provider_arn:application_provider_arn ->
  ?name:application_name_type ->
  ?application_account:account_id ->
  ?instance_arn:instance_arn ->
  ?identity_store_arn:identity_store_arn ->
  ?status:application_status ->
  ?portal_options:portal_options ->
  ?description:description ->
  ?created_date:date ->
  ?created_from:region_name ->
  unit ->
  describe_application_response

val make_describe_application_request :
  application_arn:application_arn -> unit -> describe_application_request

val make_describe_application_assignment_response :
  ?principal_type:principal_type ->
  ?principal_id:principal_id ->
  ?application_arn:application_arn ->
  unit ->
  describe_application_assignment_response

val make_describe_application_assignment_request :
  application_arn:application_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  describe_application_assignment_request

val make_describe_application_provider_response :
  ?federation_protocol:federation_protocol ->
  ?display_data:display_data ->
  ?resource_server_config:resource_server_config ->
  application_provider_arn:application_provider_arn ->
  unit ->
  describe_application_provider_response

val make_describe_application_provider_request :
  application_provider_arn:application_provider_arn -> unit -> describe_application_provider_request

val make_encryption_configuration_details :
  ?key_type:kms_key_type ->
  ?kms_key_arn:kms_key_arn ->
  ?encryption_status:kms_key_status ->
  ?encryption_status_reason:reason ->
  unit ->
  encryption_configuration_details

val make_describe_instance_response :
  ?instance_arn:instance_arn ->
  ?identity_store_id:id ->
  ?owner_account_id:account_id ->
  ?name:name_type ->
  ?created_date:date ->
  ?status:instance_status ->
  ?status_reason:reason ->
  ?encryption_configuration_details:encryption_configuration_details ->
  unit ->
  describe_instance_response

val make_describe_instance_request : instance_arn:instance_arn -> unit -> describe_instance_request

val make_describe_instance_access_control_attribute_configuration_response :
  ?status:instance_access_control_attribute_configuration_status ->
  ?status_reason:instance_access_control_attribute_configuration_status_reason ->
  ?instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  unit ->
  describe_instance_access_control_attribute_configuration_response

val make_describe_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  unit ->
  describe_instance_access_control_attribute_configuration_request

val make_describe_permission_set_response :
  ?permission_set:permission_set -> unit -> describe_permission_set_response

val make_describe_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  describe_permission_set_request

val make_permission_set_provisioning_status :
  ?status:status_values ->
  ?request_id:uu_id ->
  ?account_id:account_id ->
  ?permission_set_arn:permission_set_arn ->
  ?failure_reason:reason ->
  ?created_date:date ->
  unit ->
  permission_set_provisioning_status

val make_describe_permission_set_provisioning_status_response :
  ?permission_set_provisioning_status:permission_set_provisioning_status ->
  unit ->
  describe_permission_set_provisioning_status_response

val make_describe_permission_set_provisioning_status_request :
  instance_arn:instance_arn ->
  provision_permission_set_request_id:uu_id ->
  unit ->
  describe_permission_set_provisioning_status_request

val make_describe_region_response :
  ?region_name:region_name ->
  ?status:region_status ->
  ?added_date:date ->
  ?is_primary_region:is_primary_region ->
  unit ->
  describe_region_response

val make_describe_region_request :
  instance_arn:instance_arn -> region_name:region_name -> unit -> describe_region_request

val make_describe_trusted_token_issuer_response :
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  ?name:trusted_token_issuer_name ->
  ?trusted_token_issuer_type:trusted_token_issuer_type ->
  ?trusted_token_issuer_configuration:trusted_token_issuer_configuration ->
  unit ->
  describe_trusted_token_issuer_response

val make_describe_trusted_token_issuer_request :
  trusted_token_issuer_arn:trusted_token_issuer_arn -> unit -> describe_trusted_token_issuer_request

val make_detach_customer_managed_policy_reference_from_permission_set_response : unit -> unit

val make_detach_customer_managed_policy_reference_from_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  customer_managed_policy_reference:customer_managed_policy_reference ->
  unit ->
  detach_customer_managed_policy_reference_from_permission_set_request

val make_detach_managed_policy_from_permission_set_response : unit -> unit

val make_detach_managed_policy_from_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  managed_policy_arn:managed_policy_arn ->
  unit ->
  detach_managed_policy_from_permission_set_request

val make_encryption_configuration :
  ?kms_key_arn:kms_key_arn -> key_type:kms_key_type -> unit -> encryption_configuration

val make_get_application_access_scope_response :
  ?authorized_targets:scope_targets -> scope:scope -> unit -> get_application_access_scope_response

val make_get_application_access_scope_request :
  application_arn:application_arn -> scope:scope -> unit -> get_application_access_scope_request

val make_get_application_assignment_configuration_response :
  assignment_required:assignment_required ->
  unit ->
  get_application_assignment_configuration_response

val make_get_application_assignment_configuration_request :
  application_arn:application_arn -> unit -> get_application_assignment_configuration_request

val make_get_application_authentication_method_response :
  ?authentication_method:authentication_method ->
  unit ->
  get_application_authentication_method_response

val make_get_application_authentication_method_request :
  application_arn:application_arn ->
  authentication_method_type:authentication_method_type ->
  unit ->
  get_application_authentication_method_request

val make_token_exchange_grant : unit -> unit
val make_refresh_token_grant : unit -> unit

val make_jwt_bearer_grant :
  ?authorized_token_issuers:authorized_token_issuers -> unit -> jwt_bearer_grant

val make_get_application_grant_response : grant:grant -> unit -> get_application_grant_response

val make_get_application_grant_request :
  application_arn:application_arn -> grant_type:grant_type -> unit -> get_application_grant_request

val make_get_application_session_configuration_response :
  ?user_background_session_application_status:user_background_session_application_status ->
  unit ->
  get_application_session_configuration_response

val make_get_application_session_configuration_request :
  application_arn:application_arn -> unit -> get_application_session_configuration_request

val make_get_inline_policy_for_permission_set_response :
  ?inline_policy:permission_set_policy_document ->
  unit ->
  get_inline_policy_for_permission_set_response

val make_get_inline_policy_for_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  get_inline_policy_for_permission_set_request

val make_permissions_boundary :
  ?customer_managed_policy_reference:customer_managed_policy_reference ->
  ?managed_policy_arn:managed_policy_arn ->
  unit ->
  permissions_boundary

val make_get_permissions_boundary_for_permission_set_response :
  ?permissions_boundary:permissions_boundary ->
  unit ->
  get_permissions_boundary_for_permission_set_response

val make_get_permissions_boundary_for_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  get_permissions_boundary_for_permission_set_request

val make_grant_item : grant_type:grant_type -> grant:grant -> unit -> grant_item

val make_region_metadata :
  ?region_name:region_name ->
  ?status:region_status ->
  ?added_date:date ->
  ?is_primary_region:is_primary_region ->
  unit ->
  region_metadata

val make_instance_metadata :
  ?instance_arn:instance_arn ->
  ?identity_store_id:id ->
  ?owner_account_id:account_id ->
  ?name:name_type ->
  ?created_date:date ->
  ?status:instance_status ->
  ?status_reason:reason ->
  ?primary_region:region_name ->
  ?regions:region_metadata_list ->
  unit ->
  instance_metadata

val make_list_account_assignment_creation_status_response :
  ?account_assignments_creation_status:account_assignment_operation_status_list ->
  ?next_token:token ->
  unit ->
  list_account_assignment_creation_status_response

val make_operation_status_filter : ?status:status_values -> unit -> operation_status_filter

val make_list_account_assignment_creation_status_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:operation_status_filter ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignment_creation_status_request

val make_list_account_assignment_deletion_status_response :
  ?account_assignments_deletion_status:account_assignment_operation_status_list ->
  ?next_token:token ->
  unit ->
  list_account_assignment_deletion_status_response

val make_list_account_assignment_deletion_status_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:operation_status_filter ->
  instance_arn:instance_arn ->
  unit ->
  list_account_assignment_deletion_status_request

val make_list_account_assignments_response :
  ?account_assignments:account_assignment_list ->
  ?next_token:token ->
  unit ->
  list_account_assignments_response

val make_list_account_assignments_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  account_id:target_id ->
  permission_set_arn:permission_set_arn ->
  unit ->
  list_account_assignments_request

val make_list_account_assignments_filter :
  ?account_id:account_id -> unit -> list_account_assignments_filter

val make_list_account_assignments_for_principal_response :
  ?account_assignments:account_assignment_list_for_principal ->
  ?next_token:token ->
  unit ->
  list_account_assignments_for_principal_response

val make_list_account_assignments_for_principal_request :
  ?filter:list_account_assignments_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  list_account_assignments_for_principal_request

val make_list_accounts_for_provisioned_permission_set_response :
  ?account_ids:account_list ->
  ?next_token:token ->
  unit ->
  list_accounts_for_provisioned_permission_set_response

val make_list_accounts_for_provisioned_permission_set_request :
  ?provisioning_status:provisioning_status ->
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  list_accounts_for_provisioned_permission_set_request

val make_scope_details : ?authorized_targets:scope_targets -> scope:scope -> unit -> scope_details

val make_list_application_access_scopes_response :
  ?next_token:token -> scopes:scopes -> unit -> list_application_access_scopes_response

val make_list_application_access_scopes_request :
  ?max_results:max_results ->
  ?next_token:token ->
  application_arn:application_arn ->
  unit ->
  list_application_access_scopes_request

val make_list_application_assignments_response :
  ?application_assignments:application_assignments_list ->
  ?next_token:token ->
  unit ->
  list_application_assignments_response

val make_list_application_assignments_request :
  ?max_results:max_results ->
  ?next_token:token ->
  application_arn:application_arn ->
  unit ->
  list_application_assignments_request

val make_list_application_assignments_filter :
  ?application_arn:application_arn -> unit -> list_application_assignments_filter

val make_list_application_assignments_for_principal_response :
  ?application_assignments:application_assignment_list_for_principal ->
  ?next_token:token ->
  unit ->
  list_application_assignments_for_principal_response

val make_list_application_assignments_for_principal_request :
  ?filter:list_application_assignments_filter ->
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  principal_id:principal_id ->
  principal_type:principal_type ->
  unit ->
  list_application_assignments_for_principal_request

val make_list_application_authentication_methods_response :
  ?authentication_methods:authentication_methods ->
  ?next_token:token ->
  unit ->
  list_application_authentication_methods_response

val make_list_application_authentication_methods_request :
  ?next_token:token ->
  application_arn:application_arn ->
  unit ->
  list_application_authentication_methods_request

val make_list_application_grants_response :
  ?next_token:token -> grants:grants -> unit -> list_application_grants_response

val make_list_application_grants_request :
  ?next_token:token -> application_arn:application_arn -> unit -> list_application_grants_request

val make_list_application_providers_response :
  ?application_providers:application_provider_list ->
  ?next_token:token ->
  unit ->
  list_application_providers_response

val make_list_application_providers_request :
  ?max_results:max_results -> ?next_token:token -> unit -> list_application_providers_request

val make_list_applications_response :
  ?applications:application_list -> ?next_token:token -> unit -> list_applications_response

val make_list_applications_filter :
  ?application_account:account_id ->
  ?application_provider:application_provider_arn ->
  unit ->
  list_applications_filter

val make_list_applications_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:list_applications_filter ->
  instance_arn:instance_arn ->
  unit ->
  list_applications_request

val make_list_customer_managed_policy_references_in_permission_set_response :
  ?customer_managed_policy_references:customer_managed_policy_reference_list ->
  ?next_token:token ->
  unit ->
  list_customer_managed_policy_references_in_permission_set_response

val make_list_customer_managed_policy_references_in_permission_set_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  list_customer_managed_policy_references_in_permission_set_request

val make_list_instances_response :
  ?instances:instance_list -> ?next_token:token -> unit -> list_instances_response

val make_list_instances_request :
  ?max_results:max_results -> ?next_token:token -> unit -> list_instances_request

val make_list_managed_policies_in_permission_set_response :
  ?attached_managed_policies:attached_managed_policy_list ->
  ?next_token:token ->
  unit ->
  list_managed_policies_in_permission_set_response

val make_list_managed_policies_in_permission_set_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  list_managed_policies_in_permission_set_request

val make_permission_set_provisioning_status_metadata :
  ?status:status_values ->
  ?request_id:uu_id ->
  ?created_date:date ->
  unit ->
  permission_set_provisioning_status_metadata

val make_list_permission_set_provisioning_status_response :
  ?permission_sets_provisioning_status:permission_set_provisioning_status_list ->
  ?next_token:token ->
  unit ->
  list_permission_set_provisioning_status_response

val make_list_permission_set_provisioning_status_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?filter:operation_status_filter ->
  instance_arn:instance_arn ->
  unit ->
  list_permission_set_provisioning_status_request

val make_list_permission_sets_response :
  ?permission_sets:permission_set_list -> ?next_token:token -> unit -> list_permission_sets_response

val make_list_permission_sets_request :
  ?next_token:token ->
  ?max_results:max_results ->
  instance_arn:instance_arn ->
  unit ->
  list_permission_sets_request

val make_list_permission_sets_provisioned_to_account_response :
  ?next_token:token ->
  ?permission_sets:permission_set_list ->
  unit ->
  list_permission_sets_provisioned_to_account_response

val make_list_permission_sets_provisioned_to_account_request :
  ?provisioning_status:provisioning_status ->
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  account_id:account_id ->
  unit ->
  list_permission_sets_provisioned_to_account_request

val make_list_regions_response :
  ?regions:region_metadata_list -> ?next_token:token -> unit -> list_regions_response

val make_list_regions_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  unit ->
  list_regions_request

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?instance_arn:instance_arn ->
  ?next_token:token ->
  resource_arn:taggable_resource_arn ->
  unit ->
  list_tags_for_resource_request

val make_trusted_token_issuer_metadata :
  ?trusted_token_issuer_arn:trusted_token_issuer_arn ->
  ?name:trusted_token_issuer_name ->
  ?trusted_token_issuer_type:trusted_token_issuer_type ->
  unit ->
  trusted_token_issuer_metadata

val make_list_trusted_token_issuers_response :
  ?trusted_token_issuers:trusted_token_issuer_list ->
  ?next_token:token ->
  unit ->
  list_trusted_token_issuers_response

val make_list_trusted_token_issuers_request :
  ?max_results:max_results ->
  ?next_token:token ->
  instance_arn:instance_arn ->
  unit ->
  list_trusted_token_issuers_request

val make_oidc_jwt_update_configuration :
  ?claim_attribute_path:claim_attribute_path ->
  ?identity_store_attribute_path:jmes_path ->
  ?jwks_retrieval_option:jwks_retrieval_option ->
  unit ->
  oidc_jwt_update_configuration

val make_provision_permission_set_response :
  ?permission_set_provisioning_status:permission_set_provisioning_status ->
  unit ->
  provision_permission_set_response

val make_provision_permission_set_request :
  ?target_id:target_id ->
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  target_type:provision_target_type ->
  unit ->
  provision_permission_set_request

val make_put_application_access_scope_request :
  ?authorized_targets:scope_targets ->
  scope:scope ->
  application_arn:application_arn ->
  unit ->
  put_application_access_scope_request

val make_put_application_assignment_configuration_response : unit -> unit

val make_put_application_assignment_configuration_request :
  application_arn:application_arn ->
  assignment_required:assignment_required ->
  unit ->
  put_application_assignment_configuration_request

val make_put_application_authentication_method_request :
  application_arn:application_arn ->
  authentication_method_type:authentication_method_type ->
  authentication_method:authentication_method ->
  unit ->
  put_application_authentication_method_request

val make_put_application_grant_request :
  application_arn:application_arn ->
  grant_type:grant_type ->
  grant:grant ->
  unit ->
  put_application_grant_request

val make_put_application_session_configuration_response : unit -> unit

val make_put_application_session_configuration_request :
  ?user_background_session_application_status:user_background_session_application_status ->
  application_arn:application_arn ->
  unit ->
  put_application_session_configuration_request

val make_put_inline_policy_to_permission_set_response : unit -> unit

val make_put_inline_policy_to_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  inline_policy:permission_set_policy_document ->
  unit ->
  put_inline_policy_to_permission_set_request

val make_put_permissions_boundary_to_permission_set_response : unit -> unit

val make_put_permissions_boundary_to_permission_set_request :
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  permissions_boundary:permissions_boundary ->
  unit ->
  put_permissions_boundary_to_permission_set_request

val make_remove_region_response : ?status:region_status -> unit -> remove_region_response

val make_remove_region_request :
  instance_arn:instance_arn -> region_name:region_name -> unit -> remove_region_request

val make_update_trusted_token_issuer_response : unit -> unit

val make_update_trusted_token_issuer_request :
  ?name:trusted_token_issuer_name ->
  ?trusted_token_issuer_configuration:trusted_token_issuer_update_configuration ->
  trusted_token_issuer_arn:trusted_token_issuer_arn ->
  unit ->
  update_trusted_token_issuer_request

val make_update_permission_set_response : unit -> unit

val make_update_permission_set_request :
  ?description:permission_set_description ->
  ?session_duration:duration ->
  ?relay_state:relay_state ->
  instance_arn:instance_arn ->
  permission_set_arn:permission_set_arn ->
  unit ->
  update_permission_set_request

val make_update_instance_access_control_attribute_configuration_response : unit -> unit

val make_update_instance_access_control_attribute_configuration_request :
  instance_arn:instance_arn ->
  instance_access_control_attribute_configuration:instance_access_control_attribute_configuration ->
  unit ->
  update_instance_access_control_attribute_configuration_request

val make_update_instance_response : unit -> unit

val make_update_instance_request :
  ?name:name_type ->
  ?encryption_configuration:encryption_configuration ->
  instance_arn:instance_arn ->
  unit ->
  update_instance_request

val make_update_application_response : unit -> unit

val make_update_application_portal_options :
  ?sign_in_options:sign_in_options -> unit -> update_application_portal_options

val make_update_application_request :
  ?name:application_name_type ->
  ?description:description ->
  ?status:application_status ->
  ?portal_options:update_application_portal_options ->
  application_arn:application_arn ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  ?instance_arn:instance_arn ->
  resource_arn:taggable_resource_arn ->
  tag_keys:tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  ?instance_arn:instance_arn ->
  resource_arn:taggable_resource_arn ->
  tags:tag_list ->
  unit ->
  tag_resource_request
