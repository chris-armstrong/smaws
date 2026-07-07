open Types

val make_transfer_participant :
  ?management_account_email:email ->
  ?management_account_id:account_id ->
  unit ->
  transfer_participant

val make_responsibility_transfer :
  ?active_handshake_id:handshake_id ->
  ?end_timestamp:timestamp ->
  ?start_timestamp:timestamp ->
  ?target:transfer_participant ->
  ?source:transfer_participant ->
  ?status:responsibility_transfer_status ->
  ?type_:responsibility_transfer_type ->
  ?id:responsibility_transfer_id ->
  ?name:responsibility_transfer_name ->
  ?arn:responsibility_transfer_arn ->
  unit ->
  responsibility_transfer

val make_update_responsibility_transfer_response :
  ?responsibility_transfer:responsibility_transfer ->
  unit ->
  update_responsibility_transfer_response

val make_update_responsibility_transfer_request :
  name:responsibility_transfer_name ->
  id:responsibility_transfer_id ->
  unit ->
  update_responsibility_transfer_request

val make_policy_summary :
  ?aws_managed:aws_managed_policy ->
  ?type_:policy_type ->
  ?description:policy_description ->
  ?name:policy_name ->
  ?arn:policy_arn ->
  ?id:policy_id ->
  unit ->
  policy_summary

val make_policy : ?content:policy_content -> ?policy_summary:policy_summary -> unit -> policy
val make_update_policy_response : ?policy:policy -> unit -> update_policy_response

val make_update_policy_request :
  ?content:policy_content ->
  ?description:policy_description ->
  ?name:policy_name ->
  policy_id:policy_id ->
  unit ->
  update_policy_request

val make_organizational_unit :
  ?path:path ->
  ?name:organizational_unit_name ->
  ?arn:organizational_unit_arn ->
  ?id:organizational_unit_id ->
  unit ->
  organizational_unit

val make_update_organizational_unit_response :
  ?organizational_unit:organizational_unit -> unit -> update_organizational_unit_response

val make_update_organizational_unit_request :
  ?name:organizational_unit_name ->
  organizational_unit_id:organizational_unit_id ->
  unit ->
  update_organizational_unit_request

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_id:taggable_resource_id -> unit -> untag_resource_request

val make_terminate_responsibility_transfer_response :
  ?responsibility_transfer:responsibility_transfer ->
  unit ->
  terminate_responsibility_transfer_response

val make_terminate_responsibility_transfer_request :
  ?end_timestamp:timestamp ->
  id:responsibility_transfer_id ->
  unit ->
  terminate_responsibility_transfer_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tags -> resource_id:taggable_resource_id -> unit -> tag_resource_request

val make_policy_type_summary :
  ?status:policy_type_status -> ?type_:policy_type -> unit -> policy_type_summary

val make_root :
  ?policy_types:policy_types -> ?name:root_name -> ?arn:root_arn -> ?id:root_id -> unit -> root

val make_resource_policy_summary :
  ?arn:resource_policy_arn -> ?id:resource_policy_id -> unit -> resource_policy_summary

val make_resource_policy :
  ?content:resource_policy_content ->
  ?resource_policy_summary:resource_policy_summary ->
  unit ->
  resource_policy

val make_remove_account_from_organization_request :
  account_id:account_id -> unit -> remove_account_from_organization_request

val make_register_delegated_administrator_request :
  service_principal:service_principal ->
  account_id:account_id ->
  unit ->
  register_delegated_administrator_request

val make_put_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?tags:tags -> content:resource_policy_content -> unit -> put_resource_policy_request

val make_policy_target_summary :
  ?type_:target_type ->
  ?name:target_name ->
  ?arn:generic_arn ->
  ?target_id:policy_target_id ->
  unit ->
  policy_target_summary

val make_parent : ?type_:parent_type -> ?id:parent_id -> unit -> parent

val make_organization :
  ?available_policy_types:policy_types ->
  ?master_account_email:email ->
  ?master_account_id:account_id ->
  ?master_account_arn:account_arn ->
  ?feature_set:organization_feature_set ->
  ?arn:organization_arn ->
  ?id:organization_id ->
  unit ->
  organization

val make_move_account_request :
  destination_parent_id:parent_id ->
  source_parent_id:parent_id ->
  account_id:account_id ->
  unit ->
  move_account_request

val make_list_targets_for_policy_response :
  ?next_token:next_token -> ?targets:policy_targets -> unit -> list_targets_for_policy_response

val make_list_targets_for_policy_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  policy_id:policy_id ->
  unit ->
  list_targets_for_policy_request

val make_list_tags_for_resource_response :
  ?next_token:next_token -> ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  resource_id:taggable_resource_id ->
  unit ->
  list_tags_for_resource_request

val make_list_roots_response : ?next_token:next_token -> ?roots:roots -> unit -> list_roots_response

val make_list_roots_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_roots_request

val make_list_policies_response :
  ?next_token:next_token -> ?policies:policies -> unit -> list_policies_response

val make_list_policies_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  filter:policy_type ->
  unit ->
  list_policies_request

val make_list_policies_for_target_response :
  ?next_token:next_token -> ?policies:policies -> unit -> list_policies_for_target_response

val make_list_policies_for_target_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  filter:policy_type ->
  target_id:policy_target_id ->
  unit ->
  list_policies_for_target_request

val make_list_parents_response :
  ?next_token:next_token -> ?parents:parents -> unit -> list_parents_response

val make_list_parents_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  child_id:child_id ->
  unit ->
  list_parents_request

val make_list_outbound_responsibility_transfers_response :
  ?next_token:next_token ->
  ?responsibility_transfers:responsibility_transfers ->
  unit ->
  list_outbound_responsibility_transfers_response

val make_list_outbound_responsibility_transfers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  type_:responsibility_transfer_type ->
  unit ->
  list_outbound_responsibility_transfers_request

val make_list_organizational_units_for_parent_response :
  ?next_token:next_token ->
  ?organizational_units:organizational_units ->
  unit ->
  list_organizational_units_for_parent_response

val make_list_organizational_units_for_parent_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  parent_id:parent_id ->
  unit ->
  list_organizational_units_for_parent_request

val make_list_inbound_responsibility_transfers_response :
  ?next_token:next_token ->
  ?responsibility_transfers:responsibility_transfers ->
  unit ->
  list_inbound_responsibility_transfers_response

val make_list_inbound_responsibility_transfers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?id:responsibility_transfer_id ->
  type_:responsibility_transfer_type ->
  unit ->
  list_inbound_responsibility_transfers_request

val make_handshake_party :
  type_:handshake_party_type -> id:handshake_party_id -> unit -> handshake_party

val make_handshake_resource :
  ?resources:handshake_resources ->
  ?type_:handshake_resource_type ->
  ?value:handshake_resource_value ->
  unit ->
  handshake_resource

val make_handshake :
  ?resources:handshake_resources ->
  ?action:action_type ->
  ?expiration_timestamp:timestamp ->
  ?requested_timestamp:timestamp ->
  ?state:handshake_state ->
  ?parties:handshake_parties ->
  ?arn:handshake_arn ->
  ?id:handshake_id ->
  unit ->
  handshake

val make_list_handshakes_for_organization_response :
  ?next_token:next_token ->
  ?handshakes:handshakes ->
  unit ->
  list_handshakes_for_organization_response

val make_handshake_filter :
  ?parent_handshake_id:handshake_id -> ?action_type:action_type -> unit -> handshake_filter

val make_list_handshakes_for_organization_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filter:handshake_filter ->
  unit ->
  list_handshakes_for_organization_request

val make_list_handshakes_for_account_response :
  ?next_token:next_token -> ?handshakes:handshakes -> unit -> list_handshakes_for_account_response

val make_list_handshakes_for_account_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filter:handshake_filter ->
  unit ->
  list_handshakes_for_account_request

val make_effective_policy_validation_error :
  ?contributing_policies:policy_ids ->
  ?path_to_error:path_to_error ->
  ?error_message:error_message ->
  ?error_code:error_code ->
  unit ->
  effective_policy_validation_error

val make_list_effective_policy_validation_errors_response :
  ?effective_policy_validation_errors:effective_policy_validation_errors ->
  ?next_token:next_token ->
  ?evaluation_timestamp:timestamp ->
  ?path:path ->
  ?policy_type:effective_policy_type ->
  ?account_id:account_id ->
  unit ->
  list_effective_policy_validation_errors_response

val make_list_effective_policy_validation_errors_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  policy_type:effective_policy_type ->
  account_id:account_id ->
  unit ->
  list_effective_policy_validation_errors_request

val make_delegated_service :
  ?delegation_enabled_date:timestamp ->
  ?service_principal:service_principal ->
  unit ->
  delegated_service

val make_list_delegated_services_for_account_response :
  ?next_token:next_token ->
  ?delegated_services:delegated_services ->
  unit ->
  list_delegated_services_for_account_response

val make_list_delegated_services_for_account_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  account_id:account_id ->
  unit ->
  list_delegated_services_for_account_request

val make_delegated_administrator :
  ?delegation_enabled_date:timestamp ->
  ?joined_timestamp:timestamp ->
  ?joined_method:account_joined_method ->
  ?state:account_state ->
  ?status:account_status ->
  ?name:account_name ->
  ?email:email ->
  ?arn:account_arn ->
  ?id:account_id ->
  unit ->
  delegated_administrator

val make_list_delegated_administrators_response :
  ?next_token:next_token ->
  ?delegated_administrators:delegated_administrators ->
  unit ->
  list_delegated_administrators_response

val make_list_delegated_administrators_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?service_principal:service_principal ->
  unit ->
  list_delegated_administrators_request

val make_create_account_status :
  ?failure_reason:create_account_failure_reason ->
  ?gov_cloud_account_id:account_id ->
  ?account_id:account_id ->
  ?completed_timestamp:timestamp ->
  ?requested_timestamp:timestamp ->
  ?state:create_account_state ->
  ?account_name:create_account_name ->
  ?id:create_account_request_id ->
  unit ->
  create_account_status

val make_list_create_account_status_response :
  ?next_token:next_token ->
  ?create_account_statuses:create_account_statuses ->
  unit ->
  list_create_account_status_response

val make_list_create_account_status_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?states:create_account_states ->
  unit ->
  list_create_account_status_request

val make_child : ?type_:child_type -> ?id:child_id -> unit -> child

val make_list_children_response :
  ?next_token:next_token -> ?children:children -> unit -> list_children_response

val make_list_children_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  child_type:child_type ->
  parent_id:parent_id ->
  unit ->
  list_children_request

val make_account :
  ?joined_timestamp:timestamp ->
  ?joined_method:account_joined_method ->
  ?paths:paths ->
  ?state:account_state ->
  ?status:account_status ->
  ?name:account_name ->
  ?email:email ->
  ?arn:account_arn ->
  ?id:account_id ->
  unit ->
  account

val make_list_accounts_with_invalid_effective_policy_response :
  ?next_token:next_token ->
  ?policy_type:effective_policy_type ->
  ?accounts:accounts ->
  unit ->
  list_accounts_with_invalid_effective_policy_response

val make_list_accounts_with_invalid_effective_policy_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  policy_type:effective_policy_type ->
  unit ->
  list_accounts_with_invalid_effective_policy_request

val make_list_accounts_response :
  ?next_token:next_token -> ?accounts:accounts -> unit -> list_accounts_response

val make_list_accounts_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_accounts_request

val make_list_accounts_for_parent_response :
  ?next_token:next_token -> ?accounts:accounts -> unit -> list_accounts_for_parent_response

val make_list_accounts_for_parent_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  parent_id:parent_id ->
  unit ->
  list_accounts_for_parent_request

val make_enabled_service_principal :
  ?date_enabled:timestamp ->
  ?service_principal:service_principal ->
  unit ->
  enabled_service_principal

val make_list_aws_service_access_for_organization_response :
  ?next_token:next_token ->
  ?enabled_service_principals:enabled_service_principals ->
  unit ->
  list_aws_service_access_for_organization_response

val make_list_aws_service_access_for_organization_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_aws_service_access_for_organization_request

val make_invite_organization_to_transfer_responsibility_response :
  ?handshake:handshake -> unit -> invite_organization_to_transfer_responsibility_response

val make_invite_organization_to_transfer_responsibility_request :
  ?tags:tags ->
  ?notes:handshake_notes ->
  source_name:responsibility_transfer_name ->
  start_timestamp:timestamp ->
  target:handshake_party ->
  type_:responsibility_transfer_type ->
  unit ->
  invite_organization_to_transfer_responsibility_request

val make_invite_account_to_organization_response :
  ?handshake:handshake -> unit -> invite_account_to_organization_response

val make_invite_account_to_organization_request :
  ?tags:tags ->
  ?notes:handshake_notes ->
  target:handshake_party ->
  unit ->
  invite_account_to_organization_request

val make_enable_policy_type_response : ?root:root -> unit -> enable_policy_type_response

val make_enable_policy_type_request :
  policy_type:policy_type -> root_id:root_id -> unit -> enable_policy_type_request

val make_enable_all_features_response : ?handshake:handshake -> unit -> enable_all_features_response
val make_enable_all_features_request : unit -> unit

val make_enable_aws_service_access_request :
  service_principal:service_principal -> unit -> enable_aws_service_access_request

val make_effective_policy :
  ?policy_type:effective_policy_type ->
  ?target_id:policy_target_id ->
  ?last_updated_timestamp:timestamp ->
  ?policy_content:policy_content ->
  unit ->
  effective_policy

val make_disable_policy_type_response : ?root:root -> unit -> disable_policy_type_response

val make_disable_policy_type_request :
  policy_type:policy_type -> root_id:root_id -> unit -> disable_policy_type_request

val make_disable_aws_service_access_request :
  service_principal:service_principal -> unit -> disable_aws_service_access_request

val make_detach_policy_request :
  target_id:policy_target_id -> policy_id:policy_id -> unit -> detach_policy_request

val make_describe_responsibility_transfer_response :
  ?responsibility_transfer:responsibility_transfer ->
  unit ->
  describe_responsibility_transfer_response

val make_describe_responsibility_transfer_request :
  id:responsibility_transfer_id -> unit -> describe_responsibility_transfer_request

val make_describe_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> describe_resource_policy_response

val make_describe_policy_response : ?policy:policy -> unit -> describe_policy_response
val make_describe_policy_request : policy_id:policy_id -> unit -> describe_policy_request

val make_describe_organizational_unit_response :
  ?organizational_unit:organizational_unit -> unit -> describe_organizational_unit_response

val make_describe_organizational_unit_request :
  organizational_unit_id:organizational_unit_id -> unit -> describe_organizational_unit_request

val make_describe_organization_response :
  ?organization:organization -> unit -> describe_organization_response

val make_describe_handshake_response : ?handshake:handshake -> unit -> describe_handshake_response

val make_describe_handshake_request :
  handshake_id:handshake_id -> unit -> describe_handshake_request

val make_describe_effective_policy_response :
  ?effective_policy:effective_policy -> unit -> describe_effective_policy_response

val make_describe_effective_policy_request :
  ?target_id:policy_target_id ->
  policy_type:effective_policy_type ->
  unit ->
  describe_effective_policy_request

val make_describe_create_account_status_response :
  ?create_account_status:create_account_status -> unit -> describe_create_account_status_response

val make_describe_create_account_status_request :
  create_account_request_id:create_account_request_id ->
  unit ->
  describe_create_account_status_request

val make_describe_account_response : ?account:account -> unit -> describe_account_response
val make_describe_account_request : account_id:account_id -> unit -> describe_account_request

val make_deregister_delegated_administrator_request :
  service_principal:service_principal ->
  account_id:account_id ->
  unit ->
  deregister_delegated_administrator_request

val make_delete_policy_request : policy_id:policy_id -> unit -> delete_policy_request

val make_delete_organizational_unit_request :
  organizational_unit_id:organizational_unit_id -> unit -> delete_organizational_unit_request

val make_decline_handshake_response : ?handshake:handshake -> unit -> decline_handshake_response
val make_decline_handshake_request : handshake_id:handshake_id -> unit -> decline_handshake_request
val make_create_policy_response : ?policy:policy -> unit -> create_policy_response

val make_create_policy_request :
  ?tags:tags ->
  type_:policy_type ->
  name:policy_name ->
  description:policy_description ->
  content:policy_content ->
  unit ->
  create_policy_request

val make_create_organizational_unit_response :
  ?organizational_unit:organizational_unit -> unit -> create_organizational_unit_response

val make_create_organizational_unit_request :
  ?tags:tags ->
  name:organizational_unit_name ->
  parent_id:parent_id ->
  unit ->
  create_organizational_unit_request

val make_create_organization_response :
  ?organization:organization -> unit -> create_organization_response

val make_create_organization_request :
  ?feature_set:organization_feature_set -> unit -> create_organization_request

val make_create_gov_cloud_account_response :
  ?create_account_status:create_account_status -> unit -> create_gov_cloud_account_response

val make_create_gov_cloud_account_request :
  ?tags:tags ->
  ?iam_user_access_to_billing:iam_user_access_to_billing ->
  ?role_name:role_name ->
  account_name:create_account_name ->
  email:email ->
  unit ->
  create_gov_cloud_account_request

val make_create_account_response :
  ?create_account_status:create_account_status -> unit -> create_account_response

val make_create_account_request :
  ?tags:tags ->
  ?iam_user_access_to_billing:iam_user_access_to_billing ->
  ?role_name:role_name ->
  account_name:create_account_name ->
  email:email ->
  unit ->
  create_account_request

val make_close_account_request : account_id:account_id -> unit -> close_account_request
val make_cancel_handshake_response : ?handshake:handshake -> unit -> cancel_handshake_response
val make_cancel_handshake_request : handshake_id:handshake_id -> unit -> cancel_handshake_request

val make_attach_policy_request :
  target_id:policy_target_id -> policy_id:policy_id -> unit -> attach_policy_request

val make_accept_handshake_response : ?handshake:handshake -> unit -> accept_handshake_response
val make_accept_handshake_request : handshake_id:handshake_id -> unit -> accept_handshake_request
