open Types

val make_transfer_participant :
  ?management_account_id:account_id ->
  ?management_account_email:email ->
  unit ->
  transfer_participant

val make_responsibility_transfer :
  ?arn:responsibility_transfer_arn ->
  ?name:responsibility_transfer_name ->
  ?id:responsibility_transfer_id ->
  ?type_:responsibility_transfer_type ->
  ?status:responsibility_transfer_status ->
  ?source:transfer_participant ->
  ?target:transfer_participant ->
  ?start_timestamp:timestamp ->
  ?end_timestamp:timestamp ->
  ?active_handshake_id:handshake_id ->
  unit ->
  responsibility_transfer

val make_update_responsibility_transfer_response :
  ?responsibility_transfer:responsibility_transfer ->
  unit ->
  update_responsibility_transfer_response

val make_update_responsibility_transfer_request :
  id:responsibility_transfer_id ->
  name:responsibility_transfer_name ->
  unit ->
  update_responsibility_transfer_request

val make_policy_summary :
  ?id:policy_id ->
  ?arn:policy_arn ->
  ?name:policy_name ->
  ?description:policy_description ->
  ?type_:policy_type ->
  ?aws_managed:aws_managed_policy ->
  unit ->
  policy_summary

val make_policy : ?policy_summary:policy_summary -> ?content:policy_content -> unit -> policy
val make_update_policy_response : ?policy:policy -> unit -> update_policy_response

val make_update_policy_request :
  ?name:policy_name ->
  ?description:policy_description ->
  ?content:policy_content ->
  policy_id:policy_id ->
  unit ->
  update_policy_request

val make_organizational_unit :
  ?id:organizational_unit_id ->
  ?arn:organizational_unit_arn ->
  ?name:organizational_unit_name ->
  ?path:path ->
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
  resource_id:taggable_resource_id -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_terminate_responsibility_transfer_response :
  ?responsibility_transfer:responsibility_transfer ->
  unit ->
  terminate_responsibility_transfer_response

val make_terminate_responsibility_transfer_request :
  ?end_timestamp:timestamp ->
  id:responsibility_transfer_id ->
  unit ->
  terminate_responsibility_transfer_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_id:taggable_resource_id -> tags:tags -> unit -> tag_resource_request

val make_remove_account_from_organization_request :
  account_id:account_id -> unit -> remove_account_from_organization_request

val make_register_delegated_administrator_request :
  account_id:account_id ->
  service_principal:service_principal ->
  unit ->
  register_delegated_administrator_request

val make_resource_policy_summary :
  ?id:resource_policy_id -> ?arn:resource_policy_arn -> unit -> resource_policy_summary

val make_resource_policy :
  ?resource_policy_summary:resource_policy_summary ->
  ?content:resource_policy_content ->
  unit ->
  resource_policy

val make_put_resource_policy_response :
  ?resource_policy:resource_policy -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?tags:tags -> content:resource_policy_content -> unit -> put_resource_policy_request

val make_move_account_request :
  account_id:account_id ->
  source_parent_id:parent_id ->
  destination_parent_id:parent_id ->
  unit ->
  move_account_request

val make_policy_target_summary :
  ?target_id:policy_target_id ->
  ?arn:generic_arn ->
  ?name:target_name ->
  ?type_:target_type ->
  unit ->
  policy_target_summary

val make_list_targets_for_policy_response :
  ?targets:policy_targets -> ?next_token:next_token -> unit -> list_targets_for_policy_response

val make_list_targets_for_policy_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  policy_id:policy_id ->
  unit ->
  list_targets_for_policy_request

val make_list_tags_for_resource_response :
  ?tags:tags -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  resource_id:taggable_resource_id ->
  unit ->
  list_tags_for_resource_request

val make_policy_type_summary :
  ?type_:policy_type -> ?status:policy_type_status -> unit -> policy_type_summary

val make_root :
  ?id:root_id -> ?arn:root_arn -> ?name:root_name -> ?policy_types:policy_types -> unit -> root

val make_list_roots_response : ?roots:roots -> ?next_token:next_token -> unit -> list_roots_response

val make_list_roots_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_roots_request

val make_list_policies_for_target_response :
  ?policies:policies -> ?next_token:next_token -> unit -> list_policies_for_target_response

val make_list_policies_for_target_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  target_id:policy_target_id ->
  filter:policy_type ->
  unit ->
  list_policies_for_target_request

val make_list_policies_response :
  ?policies:policies -> ?next_token:next_token -> unit -> list_policies_response

val make_list_policies_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  filter:policy_type ->
  unit ->
  list_policies_request

val make_parent : ?id:parent_id -> ?type_:parent_type -> unit -> parent

val make_list_parents_response :
  ?parents:parents -> ?next_token:next_token -> unit -> list_parents_response

val make_list_parents_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  child_id:child_id ->
  unit ->
  list_parents_request

val make_list_outbound_responsibility_transfers_response :
  ?responsibility_transfers:responsibility_transfers ->
  ?next_token:next_token ->
  unit ->
  list_outbound_responsibility_transfers_response

val make_list_outbound_responsibility_transfers_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  type_:responsibility_transfer_type ->
  unit ->
  list_outbound_responsibility_transfers_request

val make_list_organizational_units_for_parent_response :
  ?organizational_units:organizational_units ->
  ?next_token:next_token ->
  unit ->
  list_organizational_units_for_parent_response

val make_list_organizational_units_for_parent_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  parent_id:parent_id ->
  unit ->
  list_organizational_units_for_parent_request

val make_list_inbound_responsibility_transfers_response :
  ?responsibility_transfers:responsibility_transfers ->
  ?next_token:next_token ->
  unit ->
  list_inbound_responsibility_transfers_response

val make_list_inbound_responsibility_transfers_request :
  ?id:responsibility_transfer_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  type_:responsibility_transfer_type ->
  unit ->
  list_inbound_responsibility_transfers_request

val make_handshake_resource :
  ?value:handshake_resource_value ->
  ?type_:handshake_resource_type ->
  ?resources:handshake_resources ->
  unit ->
  handshake_resource

val make_handshake_party :
  id:handshake_party_id -> type_:handshake_party_type -> unit -> handshake_party

val make_handshake :
  ?id:handshake_id ->
  ?arn:handshake_arn ->
  ?parties:handshake_parties ->
  ?state:handshake_state ->
  ?requested_timestamp:timestamp ->
  ?expiration_timestamp:timestamp ->
  ?action:action_type ->
  ?resources:handshake_resources ->
  unit ->
  handshake

val make_list_handshakes_for_organization_response :
  ?handshakes:handshakes ->
  ?next_token:next_token ->
  unit ->
  list_handshakes_for_organization_response

val make_handshake_filter :
  ?action_type:action_type -> ?parent_handshake_id:handshake_id -> unit -> handshake_filter

val make_list_handshakes_for_organization_request :
  ?filter:handshake_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_handshakes_for_organization_request

val make_list_handshakes_for_account_response :
  ?handshakes:handshakes -> ?next_token:next_token -> unit -> list_handshakes_for_account_response

val make_list_handshakes_for_account_request :
  ?filter:handshake_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_handshakes_for_account_request

val make_effective_policy_validation_error :
  ?error_code:error_code ->
  ?error_message:error_message ->
  ?path_to_error:path_to_error ->
  ?contributing_policies:policy_ids ->
  unit ->
  effective_policy_validation_error

val make_list_effective_policy_validation_errors_response :
  ?account_id:account_id ->
  ?policy_type:effective_policy_type ->
  ?path:path ->
  ?evaluation_timestamp:timestamp ->
  ?next_token:next_token ->
  ?effective_policy_validation_errors:effective_policy_validation_errors ->
  unit ->
  list_effective_policy_validation_errors_response

val make_list_effective_policy_validation_errors_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  account_id:account_id ->
  policy_type:effective_policy_type ->
  unit ->
  list_effective_policy_validation_errors_request

val make_delegated_service :
  ?service_principal:service_principal ->
  ?delegation_enabled_date:timestamp ->
  unit ->
  delegated_service

val make_list_delegated_services_for_account_response :
  ?delegated_services:delegated_services ->
  ?next_token:next_token ->
  unit ->
  list_delegated_services_for_account_response

val make_list_delegated_services_for_account_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  account_id:account_id ->
  unit ->
  list_delegated_services_for_account_request

val make_delegated_administrator :
  ?id:account_id ->
  ?arn:account_arn ->
  ?email:email ->
  ?name:account_name ->
  ?status:account_status ->
  ?state:account_state ->
  ?joined_method:account_joined_method ->
  ?joined_timestamp:timestamp ->
  ?delegation_enabled_date:timestamp ->
  unit ->
  delegated_administrator

val make_list_delegated_administrators_response :
  ?delegated_administrators:delegated_administrators ->
  ?next_token:next_token ->
  unit ->
  list_delegated_administrators_response

val make_list_delegated_administrators_request :
  ?service_principal:service_principal ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_delegated_administrators_request

val make_create_account_status :
  ?id:create_account_request_id ->
  ?account_name:create_account_name ->
  ?state:create_account_state ->
  ?requested_timestamp:timestamp ->
  ?completed_timestamp:timestamp ->
  ?account_id:account_id ->
  ?gov_cloud_account_id:account_id ->
  ?failure_reason:create_account_failure_reason ->
  unit ->
  create_account_status

val make_list_create_account_status_response :
  ?create_account_statuses:create_account_statuses ->
  ?next_token:next_token ->
  unit ->
  list_create_account_status_response

val make_list_create_account_status_request :
  ?states:create_account_states ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_create_account_status_request

val make_child : ?id:child_id -> ?type_:child_type -> unit -> child

val make_list_children_response :
  ?children:children -> ?next_token:next_token -> unit -> list_children_response

val make_list_children_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  parent_id:parent_id ->
  child_type:child_type ->
  unit ->
  list_children_request

val make_enabled_service_principal :
  ?service_principal:service_principal ->
  ?date_enabled:timestamp ->
  unit ->
  enabled_service_principal

val make_list_aws_service_access_for_organization_response :
  ?enabled_service_principals:enabled_service_principals ->
  ?next_token:next_token ->
  unit ->
  list_aws_service_access_for_organization_response

val make_list_aws_service_access_for_organization_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_aws_service_access_for_organization_request

val make_account :
  ?id:account_id ->
  ?arn:account_arn ->
  ?email:email ->
  ?name:account_name ->
  ?status:account_status ->
  ?state:account_state ->
  ?paths:paths ->
  ?joined_method:account_joined_method ->
  ?joined_timestamp:timestamp ->
  unit ->
  account

val make_list_accounts_with_invalid_effective_policy_response :
  ?accounts:accounts ->
  ?policy_type:effective_policy_type ->
  ?next_token:next_token ->
  unit ->
  list_accounts_with_invalid_effective_policy_response

val make_list_accounts_with_invalid_effective_policy_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  policy_type:effective_policy_type ->
  unit ->
  list_accounts_with_invalid_effective_policy_request

val make_list_accounts_for_parent_response :
  ?accounts:accounts -> ?next_token:next_token -> unit -> list_accounts_for_parent_response

val make_list_accounts_for_parent_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  parent_id:parent_id ->
  unit ->
  list_accounts_for_parent_request

val make_list_accounts_response :
  ?accounts:accounts -> ?next_token:next_token -> unit -> list_accounts_response

val make_list_accounts_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_accounts_request

val make_invite_organization_to_transfer_responsibility_response :
  ?handshake:handshake -> unit -> invite_organization_to_transfer_responsibility_response

val make_invite_organization_to_transfer_responsibility_request :
  ?notes:handshake_notes ->
  ?tags:tags ->
  type_:responsibility_transfer_type ->
  target:handshake_party ->
  start_timestamp:timestamp ->
  source_name:responsibility_transfer_name ->
  unit ->
  invite_organization_to_transfer_responsibility_request

val make_invite_account_to_organization_response :
  ?handshake:handshake -> unit -> invite_account_to_organization_response

val make_invite_account_to_organization_request :
  ?notes:handshake_notes ->
  ?tags:tags ->
  target:handshake_party ->
  unit ->
  invite_account_to_organization_request

val make_enable_policy_type_response : ?root:root -> unit -> enable_policy_type_response

val make_enable_policy_type_request :
  root_id:root_id -> policy_type:policy_type -> unit -> enable_policy_type_request

val make_enable_aws_service_access_request :
  service_principal:service_principal -> unit -> enable_aws_service_access_request

val make_enable_all_features_response : ?handshake:handshake -> unit -> enable_all_features_response
val make_enable_all_features_request : unit -> unit
val make_disable_policy_type_response : ?root:root -> unit -> disable_policy_type_response

val make_disable_policy_type_request :
  root_id:root_id -> policy_type:policy_type -> unit -> disable_policy_type_request

val make_disable_aws_service_access_request :
  service_principal:service_principal -> unit -> disable_aws_service_access_request

val make_detach_policy_request :
  policy_id:policy_id -> target_id:policy_target_id -> unit -> detach_policy_request

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

val make_organization :
  ?id:organization_id ->
  ?arn:organization_arn ->
  ?feature_set:organization_feature_set ->
  ?master_account_arn:account_arn ->
  ?master_account_id:account_id ->
  ?master_account_email:email ->
  ?available_policy_types:policy_types ->
  unit ->
  organization

val make_describe_organization_response :
  ?organization:organization -> unit -> describe_organization_response

val make_describe_handshake_response : ?handshake:handshake -> unit -> describe_handshake_response

val make_describe_handshake_request :
  handshake_id:handshake_id -> unit -> describe_handshake_request

val make_effective_policy :
  ?policy_content:policy_content ->
  ?last_updated_timestamp:timestamp ->
  ?target_id:policy_target_id ->
  ?policy_type:effective_policy_type ->
  unit ->
  effective_policy

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
  account_id:account_id ->
  service_principal:service_principal ->
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
  content:policy_content ->
  description:policy_description ->
  name:policy_name ->
  type_:policy_type ->
  unit ->
  create_policy_request

val make_create_organizational_unit_response :
  ?organizational_unit:organizational_unit -> unit -> create_organizational_unit_response

val make_create_organizational_unit_request :
  ?tags:tags ->
  parent_id:parent_id ->
  name:organizational_unit_name ->
  unit ->
  create_organizational_unit_request

val make_create_organization_response :
  ?organization:organization -> unit -> create_organization_response

val make_create_organization_request :
  ?feature_set:organization_feature_set -> unit -> create_organization_request

val make_create_gov_cloud_account_response :
  ?create_account_status:create_account_status -> unit -> create_gov_cloud_account_response

val make_create_gov_cloud_account_request :
  ?role_name:role_name ->
  ?iam_user_access_to_billing:iam_user_access_to_billing ->
  ?tags:tags ->
  email:email ->
  account_name:create_account_name ->
  unit ->
  create_gov_cloud_account_request

val make_create_account_response :
  ?create_account_status:create_account_status -> unit -> create_account_response

val make_create_account_request :
  ?role_name:role_name ->
  ?iam_user_access_to_billing:iam_user_access_to_billing ->
  ?tags:tags ->
  email:email ->
  account_name:create_account_name ->
  unit ->
  create_account_request

val make_close_account_request : account_id:account_id -> unit -> close_account_request
val make_cancel_handshake_response : ?handshake:handshake -> unit -> cancel_handshake_response
val make_cancel_handshake_request : handshake_id:handshake_id -> unit -> cancel_handshake_request

val make_attach_policy_request :
  policy_id:policy_id -> target_id:policy_target_id -> unit -> attach_policy_request

val make_accept_handshake_response : ?handshake:handshake -> unit -> accept_handshake_response
val make_accept_handshake_request : handshake_id:handshake_id -> unit -> accept_handshake_request
