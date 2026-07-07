open Types

let make_transfer_participant ?management_account_email:(management_account_email_ : email option)
    ?management_account_id:(management_account_id_ : account_id option) () =
  ({
     management_account_email = management_account_email_;
     management_account_id = management_account_id_;
   }
    : transfer_participant)

let make_responsibility_transfer ?active_handshake_id:(active_handshake_id_ : handshake_id option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?start_timestamp:(start_timestamp_ : timestamp option)
    ?target:(target_ : transfer_participant option) ?source:(source_ : transfer_participant option)
    ?status:(status_ : responsibility_transfer_status option)
    ?type_:(type__ : responsibility_transfer_type option)
    ?id:(id_ : responsibility_transfer_id option)
    ?name:(name_ : responsibility_transfer_name option)
    ?arn:(arn_ : responsibility_transfer_arn option) () =
  ({
     active_handshake_id = active_handshake_id_;
     end_timestamp = end_timestamp_;
     start_timestamp = start_timestamp_;
     target = target_;
     source = source_;
     status = status_;
     type_ = type__;
     id = id_;
     name = name_;
     arn = arn_;
   }
    : responsibility_transfer)

let make_update_responsibility_transfer_response
    ?responsibility_transfer:(responsibility_transfer_ : responsibility_transfer option) () =
  ({ responsibility_transfer = responsibility_transfer_ } : update_responsibility_transfer_response)

let make_update_responsibility_transfer_request ~name:(name_ : responsibility_transfer_name)
    ~id:(id_ : responsibility_transfer_id) () =
  ({ name = name_; id = id_ } : update_responsibility_transfer_request)

let make_policy_summary ?aws_managed:(aws_managed_ : aws_managed_policy option)
    ?type_:(type__ : policy_type option) ?description:(description_ : policy_description option)
    ?name:(name_ : policy_name option) ?arn:(arn_ : policy_arn option) ?id:(id_ : policy_id option)
    () =
  ({
     aws_managed = aws_managed_;
     type_ = type__;
     description = description_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : policy_summary)

let make_policy ?content:(content_ : policy_content option)
    ?policy_summary:(policy_summary_ : policy_summary option) () =
  ({ content = content_; policy_summary = policy_summary_ } : policy)

let make_update_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : update_policy_response)

let make_update_policy_request ?content:(content_ : policy_content option)
    ?description:(description_ : policy_description option) ?name:(name_ : policy_name option)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ content = content_; description = description_; name = name_; policy_id = policy_id_ }
    : update_policy_request)

let make_organizational_unit ?path:(path_ : path option)
    ?name:(name_ : organizational_unit_name option) ?arn:(arn_ : organizational_unit_arn option)
    ?id:(id_ : organizational_unit_id option) () =
  ({ path = path_; name = name_; arn = arn_; id = id_ } : organizational_unit)

let make_update_organizational_unit_response
    ?organizational_unit:(organizational_unit_ : organizational_unit option) () =
  ({ organizational_unit = organizational_unit_ } : update_organizational_unit_response)

let make_update_organizational_unit_request ?name:(name_ : organizational_unit_name option)
    ~organizational_unit_id:(organizational_unit_id_ : organizational_unit_id) () =
  ({ name = name_; organizational_unit_id = organizational_unit_id_ }
    : update_organizational_unit_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_id:(resource_id_ : taggable_resource_id) () =
  ({ tag_keys = tag_keys_; resource_id = resource_id_ } : untag_resource_request)

let make_terminate_responsibility_transfer_response
    ?responsibility_transfer:(responsibility_transfer_ : responsibility_transfer option) () =
  ({ responsibility_transfer = responsibility_transfer_ }
    : terminate_responsibility_transfer_response)

let make_terminate_responsibility_transfer_request
    ?end_timestamp:(end_timestamp_ : timestamp option) ~id:(id_ : responsibility_transfer_id) () =
  ({ end_timestamp = end_timestamp_; id = id_ } : terminate_responsibility_transfer_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tags)
    ~resource_id:(resource_id_ : taggable_resource_id) () =
  ({ tags = tags_; resource_id = resource_id_ } : tag_resource_request)

let make_policy_type_summary ?status:(status_ : policy_type_status option)
    ?type_:(type__ : policy_type option) () =
  ({ status = status_; type_ = type__ } : policy_type_summary)

let make_root ?policy_types:(policy_types_ : policy_types option) ?name:(name_ : root_name option)
    ?arn:(arn_ : root_arn option) ?id:(id_ : root_id option) () =
  ({ policy_types = policy_types_; name = name_; arn = arn_; id = id_ } : root)

let make_resource_policy_summary ?arn:(arn_ : resource_policy_arn option)
    ?id:(id_ : resource_policy_id option) () =
  ({ arn = arn_; id = id_ } : resource_policy_summary)

let make_resource_policy ?content:(content_ : resource_policy_content option)
    ?resource_policy_summary:(resource_policy_summary_ : resource_policy_summary option) () =
  ({ content = content_; resource_policy_summary = resource_policy_summary_ } : resource_policy)

let make_remove_account_from_organization_request ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_ } : remove_account_from_organization_request)

let make_register_delegated_administrator_request
    ~service_principal:(service_principal_ : service_principal)
    ~account_id:(account_id_ : account_id) () =
  ({ service_principal = service_principal_; account_id = account_id_ }
    : register_delegated_administrator_request)

let make_put_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : put_resource_policy_response)

let make_put_resource_policy_request ?tags:(tags_ : tags option)
    ~content:(content_ : resource_policy_content) () =
  ({ tags = tags_; content = content_ } : put_resource_policy_request)

let make_policy_target_summary ?type_:(type__ : target_type option)
    ?name:(name_ : target_name option) ?arn:(arn_ : generic_arn option)
    ?target_id:(target_id_ : policy_target_id option) () =
  ({ type_ = type__; name = name_; arn = arn_; target_id = target_id_ } : policy_target_summary)

let make_parent ?type_:(type__ : parent_type option) ?id:(id_ : parent_id option) () =
  ({ type_ = type__; id = id_ } : parent)

let make_organization ?available_policy_types:(available_policy_types_ : policy_types option)
    ?master_account_email:(master_account_email_ : email option)
    ?master_account_id:(master_account_id_ : account_id option)
    ?master_account_arn:(master_account_arn_ : account_arn option)
    ?feature_set:(feature_set_ : organization_feature_set option)
    ?arn:(arn_ : organization_arn option) ?id:(id_ : organization_id option) () =
  ({
     available_policy_types = available_policy_types_;
     master_account_email = master_account_email_;
     master_account_id = master_account_id_;
     master_account_arn = master_account_arn_;
     feature_set = feature_set_;
     arn = arn_;
     id = id_;
   }
    : organization)

let make_move_account_request ~destination_parent_id:(destination_parent_id_ : parent_id)
    ~source_parent_id:(source_parent_id_ : parent_id) ~account_id:(account_id_ : account_id) () =
  ({
     destination_parent_id = destination_parent_id_;
     source_parent_id = source_parent_id_;
     account_id = account_id_;
   }
    : move_account_request)

let make_list_targets_for_policy_response ?next_token:(next_token_ : next_token option)
    ?targets:(targets_ : policy_targets option) () =
  ({ next_token = next_token_; targets = targets_ } : list_targets_for_policy_response)

let make_list_targets_for_policy_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~policy_id:(policy_id_ : policy_id) () =
  ({ max_results = max_results_; next_token = next_token_; policy_id = policy_id_ }
    : list_targets_for_policy_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tags option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ~resource_id:(resource_id_ : taggable_resource_id) () =
  ({ next_token = next_token_; resource_id = resource_id_ } : list_tags_for_resource_request)

let make_list_roots_response ?next_token:(next_token_ : next_token option)
    ?roots:(roots_ : roots option) () =
  ({ next_token = next_token_; roots = roots_ } : list_roots_response)

let make_list_roots_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_roots_request)

let make_list_policies_response ?next_token:(next_token_ : next_token option)
    ?policies:(policies_ : policies option) () =
  ({ next_token = next_token_; policies = policies_ } : list_policies_response)

let make_list_policies_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~filter:(filter_ : policy_type) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_policies_request)

let make_list_policies_for_target_response ?next_token:(next_token_ : next_token option)
    ?policies:(policies_ : policies option) () =
  ({ next_token = next_token_; policies = policies_ } : list_policies_for_target_response)

let make_list_policies_for_target_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~filter:(filter_ : policy_type)
    ~target_id:(target_id_ : policy_target_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     target_id = target_id_;
   }
    : list_policies_for_target_request)

let make_list_parents_response ?next_token:(next_token_ : next_token option)
    ?parents:(parents_ : parents option) () =
  ({ next_token = next_token_; parents = parents_ } : list_parents_response)

let make_list_parents_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~child_id:(child_id_ : child_id) () =
  ({ max_results = max_results_; next_token = next_token_; child_id = child_id_ }
    : list_parents_request)

let make_list_outbound_responsibility_transfers_response
    ?next_token:(next_token_ : next_token option)
    ?responsibility_transfers:(responsibility_transfers_ : responsibility_transfers option) () =
  ({ next_token = next_token_; responsibility_transfers = responsibility_transfers_ }
    : list_outbound_responsibility_transfers_response)

let make_list_outbound_responsibility_transfers_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~type_:(type__ : responsibility_transfer_type) () =
  ({ max_results = max_results_; next_token = next_token_; type_ = type__ }
    : list_outbound_responsibility_transfers_request)

let make_list_organizational_units_for_parent_response ?next_token:(next_token_ : next_token option)
    ?organizational_units:(organizational_units_ : organizational_units option) () =
  ({ next_token = next_token_; organizational_units = organizational_units_ }
    : list_organizational_units_for_parent_response)

let make_list_organizational_units_for_parent_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~parent_id:(parent_id_ : parent_id) () =
  ({ max_results = max_results_; next_token = next_token_; parent_id = parent_id_ }
    : list_organizational_units_for_parent_request)

let make_list_inbound_responsibility_transfers_response
    ?next_token:(next_token_ : next_token option)
    ?responsibility_transfers:(responsibility_transfers_ : responsibility_transfers option) () =
  ({ next_token = next_token_; responsibility_transfers = responsibility_transfers_ }
    : list_inbound_responsibility_transfers_response)

let make_list_inbound_responsibility_transfers_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?id:(id_ : responsibility_transfer_id option) ~type_:(type__ : responsibility_transfer_type) ()
    =
  ({ max_results = max_results_; next_token = next_token_; id = id_; type_ = type__ }
    : list_inbound_responsibility_transfers_request)

let make_handshake_party ~type_:(type__ : handshake_party_type) ~id:(id_ : handshake_party_id) () =
  ({ type_ = type__; id = id_ } : handshake_party)

let make_handshake_resource ?resources:(resources_ : handshake_resources option)
    ?type_:(type__ : handshake_resource_type option)
    ?value:(value_ : handshake_resource_value option) () =
  ({ resources = resources_; type_ = type__; value = value_ } : handshake_resource)

let make_handshake ?resources:(resources_ : handshake_resources option)
    ?action:(action_ : action_type option)
    ?expiration_timestamp:(expiration_timestamp_ : timestamp option)
    ?requested_timestamp:(requested_timestamp_ : timestamp option)
    ?state:(state_ : handshake_state option) ?parties:(parties_ : handshake_parties option)
    ?arn:(arn_ : handshake_arn option) ?id:(id_ : handshake_id option) () =
  ({
     resources = resources_;
     action = action_;
     expiration_timestamp = expiration_timestamp_;
     requested_timestamp = requested_timestamp_;
     state = state_;
     parties = parties_;
     arn = arn_;
     id = id_;
   }
    : handshake)

let make_list_handshakes_for_organization_response ?next_token:(next_token_ : next_token option)
    ?handshakes:(handshakes_ : handshakes option) () =
  ({ next_token = next_token_; handshakes = handshakes_ }
    : list_handshakes_for_organization_response)

let make_handshake_filter ?parent_handshake_id:(parent_handshake_id_ : handshake_id option)
    ?action_type:(action_type_ : action_type option) () =
  ({ parent_handshake_id = parent_handshake_id_; action_type = action_type_ } : handshake_filter)

let make_list_handshakes_for_organization_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filter:(filter_ : handshake_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_handshakes_for_organization_request)

let make_list_handshakes_for_account_response ?next_token:(next_token_ : next_token option)
    ?handshakes:(handshakes_ : handshakes option) () =
  ({ next_token = next_token_; handshakes = handshakes_ } : list_handshakes_for_account_response)

let make_list_handshakes_for_account_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filter:(filter_ : handshake_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_handshakes_for_account_request)

let make_effective_policy_validation_error
    ?contributing_policies:(contributing_policies_ : policy_ids option)
    ?path_to_error:(path_to_error_ : path_to_error option)
    ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) () =
  ({
     contributing_policies = contributing_policies_;
     path_to_error = path_to_error_;
     error_message = error_message_;
     error_code = error_code_;
   }
    : effective_policy_validation_error)

let make_list_effective_policy_validation_errors_response
    ?effective_policy_validation_errors:
      (effective_policy_validation_errors_ : effective_policy_validation_errors option)
    ?next_token:(next_token_ : next_token option)
    ?evaluation_timestamp:(evaluation_timestamp_ : timestamp option) ?path:(path_ : path option)
    ?policy_type:(policy_type_ : effective_policy_type option)
    ?account_id:(account_id_ : account_id option) () =
  ({
     effective_policy_validation_errors = effective_policy_validation_errors_;
     next_token = next_token_;
     evaluation_timestamp = evaluation_timestamp_;
     path = path_;
     policy_type = policy_type_;
     account_id = account_id_;
   }
    : list_effective_policy_validation_errors_response)

let make_list_effective_policy_validation_errors_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~policy_type:(policy_type_ : effective_policy_type) ~account_id:(account_id_ : account_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     policy_type = policy_type_;
     account_id = account_id_;
   }
    : list_effective_policy_validation_errors_request)

let make_delegated_service ?delegation_enabled_date:(delegation_enabled_date_ : timestamp option)
    ?service_principal:(service_principal_ : service_principal option) () =
  ({ delegation_enabled_date = delegation_enabled_date_; service_principal = service_principal_ }
    : delegated_service)

let make_list_delegated_services_for_account_response ?next_token:(next_token_ : next_token option)
    ?delegated_services:(delegated_services_ : delegated_services option) () =
  ({ next_token = next_token_; delegated_services = delegated_services_ }
    : list_delegated_services_for_account_response)

let make_list_delegated_services_for_account_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~account_id:(account_id_ : account_id) () =
  ({ max_results = max_results_; next_token = next_token_; account_id = account_id_ }
    : list_delegated_services_for_account_request)

let make_delegated_administrator
    ?delegation_enabled_date:(delegation_enabled_date_ : timestamp option)
    ?joined_timestamp:(joined_timestamp_ : timestamp option)
    ?joined_method:(joined_method_ : account_joined_method option)
    ?state:(state_ : account_state option) ?status:(status_ : account_status option)
    ?name:(name_ : account_name option) ?email:(email_ : email option)
    ?arn:(arn_ : account_arn option) ?id:(id_ : account_id option) () =
  ({
     delegation_enabled_date = delegation_enabled_date_;
     joined_timestamp = joined_timestamp_;
     joined_method = joined_method_;
     state = state_;
     status = status_;
     name = name_;
     email = email_;
     arn = arn_;
     id = id_;
   }
    : delegated_administrator)

let make_list_delegated_administrators_response ?next_token:(next_token_ : next_token option)
    ?delegated_administrators:(delegated_administrators_ : delegated_administrators option) () =
  ({ next_token = next_token_; delegated_administrators = delegated_administrators_ }
    : list_delegated_administrators_response)

let make_list_delegated_administrators_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?service_principal:(service_principal_ : service_principal option) () =
  ({ max_results = max_results_; next_token = next_token_; service_principal = service_principal_ }
    : list_delegated_administrators_request)

let make_create_account_status
    ?failure_reason:(failure_reason_ : create_account_failure_reason option)
    ?gov_cloud_account_id:(gov_cloud_account_id_ : account_id option)
    ?account_id:(account_id_ : account_id option)
    ?completed_timestamp:(completed_timestamp_ : timestamp option)
    ?requested_timestamp:(requested_timestamp_ : timestamp option)
    ?state:(state_ : create_account_state option)
    ?account_name:(account_name_ : create_account_name option)
    ?id:(id_ : create_account_request_id option) () =
  ({
     failure_reason = failure_reason_;
     gov_cloud_account_id = gov_cloud_account_id_;
     account_id = account_id_;
     completed_timestamp = completed_timestamp_;
     requested_timestamp = requested_timestamp_;
     state = state_;
     account_name = account_name_;
     id = id_;
   }
    : create_account_status)

let make_list_create_account_status_response ?next_token:(next_token_ : next_token option)
    ?create_account_statuses:(create_account_statuses_ : create_account_statuses option) () =
  ({ next_token = next_token_; create_account_statuses = create_account_statuses_ }
    : list_create_account_status_response)

let make_list_create_account_status_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?states:(states_ : create_account_states option)
    () =
  ({ max_results = max_results_; next_token = next_token_; states = states_ }
    : list_create_account_status_request)

let make_child ?type_:(type__ : child_type option) ?id:(id_ : child_id option) () =
  ({ type_ = type__; id = id_ } : child)

let make_list_children_response ?next_token:(next_token_ : next_token option)
    ?children:(children_ : children option) () =
  ({ next_token = next_token_; children = children_ } : list_children_response)

let make_list_children_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~child_type:(child_type_ : child_type)
    ~parent_id:(parent_id_ : parent_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     child_type = child_type_;
     parent_id = parent_id_;
   }
    : list_children_request)

let make_account ?joined_timestamp:(joined_timestamp_ : timestamp option)
    ?joined_method:(joined_method_ : account_joined_method option) ?paths:(paths_ : paths option)
    ?state:(state_ : account_state option) ?status:(status_ : account_status option)
    ?name:(name_ : account_name option) ?email:(email_ : email option)
    ?arn:(arn_ : account_arn option) ?id:(id_ : account_id option) () =
  ({
     joined_timestamp = joined_timestamp_;
     joined_method = joined_method_;
     paths = paths_;
     state = state_;
     status = status_;
     name = name_;
     email = email_;
     arn = arn_;
     id = id_;
   }
    : account)

let make_list_accounts_with_invalid_effective_policy_response
    ?next_token:(next_token_ : next_token option)
    ?policy_type:(policy_type_ : effective_policy_type option)
    ?accounts:(accounts_ : accounts option) () =
  ({ next_token = next_token_; policy_type = policy_type_; accounts = accounts_ }
    : list_accounts_with_invalid_effective_policy_response)

let make_list_accounts_with_invalid_effective_policy_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~policy_type:(policy_type_ : effective_policy_type) () =
  ({ max_results = max_results_; next_token = next_token_; policy_type = policy_type_ }
    : list_accounts_with_invalid_effective_policy_request)

let make_list_accounts_response ?next_token:(next_token_ : next_token option)
    ?accounts:(accounts_ : accounts option) () =
  ({ next_token = next_token_; accounts = accounts_ } : list_accounts_response)

let make_list_accounts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_accounts_request)

let make_list_accounts_for_parent_response ?next_token:(next_token_ : next_token option)
    ?accounts:(accounts_ : accounts option) () =
  ({ next_token = next_token_; accounts = accounts_ } : list_accounts_for_parent_response)

let make_list_accounts_for_parent_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~parent_id:(parent_id_ : parent_id) () =
  ({ max_results = max_results_; next_token = next_token_; parent_id = parent_id_ }
    : list_accounts_for_parent_request)

let make_enabled_service_principal ?date_enabled:(date_enabled_ : timestamp option)
    ?service_principal:(service_principal_ : service_principal option) () =
  ({ date_enabled = date_enabled_; service_principal = service_principal_ }
    : enabled_service_principal)

let make_list_aws_service_access_for_organization_response
    ?next_token:(next_token_ : next_token option)
    ?enabled_service_principals:(enabled_service_principals_ : enabled_service_principals option) ()
    =
  ({ next_token = next_token_; enabled_service_principals = enabled_service_principals_ }
    : list_aws_service_access_for_organization_response)

let make_list_aws_service_access_for_organization_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_aws_service_access_for_organization_request)

let make_invite_organization_to_transfer_responsibility_response
    ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : invite_organization_to_transfer_responsibility_response)

let make_invite_organization_to_transfer_responsibility_request ?tags:(tags_ : tags option)
    ?notes:(notes_ : handshake_notes option)
    ~source_name:(source_name_ : responsibility_transfer_name)
    ~start_timestamp:(start_timestamp_ : timestamp) ~target:(target_ : handshake_party)
    ~type_:(type__ : responsibility_transfer_type) () =
  ({
     tags = tags_;
     source_name = source_name_;
     start_timestamp = start_timestamp_;
     notes = notes_;
     target = target_;
     type_ = type__;
   }
    : invite_organization_to_transfer_responsibility_request)

let make_invite_account_to_organization_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : invite_account_to_organization_response)

let make_invite_account_to_organization_request ?tags:(tags_ : tags option)
    ?notes:(notes_ : handshake_notes option) ~target:(target_ : handshake_party) () =
  ({ tags = tags_; notes = notes_; target = target_ } : invite_account_to_organization_request)

let make_enable_policy_type_response ?root:(root_ : root option) () =
  ({ root = root_ } : enable_policy_type_response)

let make_enable_policy_type_request ~policy_type:(policy_type_ : policy_type)
    ~root_id:(root_id_ : root_id) () =
  ({ policy_type = policy_type_; root_id = root_id_ } : enable_policy_type_request)

let make_enable_all_features_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : enable_all_features_response)

let make_enable_all_features_request () = (() : unit)

let make_enable_aws_service_access_request
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_ } : enable_aws_service_access_request)

let make_effective_policy ?policy_type:(policy_type_ : effective_policy_type option)
    ?target_id:(target_id_ : policy_target_id option)
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option)
    ?policy_content:(policy_content_ : policy_content option) () =
  ({
     policy_type = policy_type_;
     target_id = target_id_;
     last_updated_timestamp = last_updated_timestamp_;
     policy_content = policy_content_;
   }
    : effective_policy)

let make_disable_policy_type_response ?root:(root_ : root option) () =
  ({ root = root_ } : disable_policy_type_response)

let make_disable_policy_type_request ~policy_type:(policy_type_ : policy_type)
    ~root_id:(root_id_ : root_id) () =
  ({ policy_type = policy_type_; root_id = root_id_ } : disable_policy_type_request)

let make_disable_aws_service_access_request
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_ } : disable_aws_service_access_request)

let make_detach_policy_request ~target_id:(target_id_ : policy_target_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ target_id = target_id_; policy_id = policy_id_ } : detach_policy_request)

let make_describe_responsibility_transfer_response
    ?responsibility_transfer:(responsibility_transfer_ : responsibility_transfer option) () =
  ({ responsibility_transfer = responsibility_transfer_ }
    : describe_responsibility_transfer_response)

let make_describe_responsibility_transfer_request ~id:(id_ : responsibility_transfer_id) () =
  ({ id = id_ } : describe_responsibility_transfer_request)

let make_describe_resource_policy_response
    ?resource_policy:(resource_policy_ : resource_policy option) () =
  ({ resource_policy = resource_policy_ } : describe_resource_policy_response)

let make_describe_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : describe_policy_response)

let make_describe_policy_request ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : describe_policy_request)

let make_describe_organizational_unit_response
    ?organizational_unit:(organizational_unit_ : organizational_unit option) () =
  ({ organizational_unit = organizational_unit_ } : describe_organizational_unit_response)

let make_describe_organizational_unit_request
    ~organizational_unit_id:(organizational_unit_id_ : organizational_unit_id) () =
  ({ organizational_unit_id = organizational_unit_id_ } : describe_organizational_unit_request)

let make_describe_organization_response ?organization:(organization_ : organization option) () =
  ({ organization = organization_ } : describe_organization_response)

let make_describe_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : describe_handshake_response)

let make_describe_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : describe_handshake_request)

let make_describe_effective_policy_response
    ?effective_policy:(effective_policy_ : effective_policy option) () =
  ({ effective_policy = effective_policy_ } : describe_effective_policy_response)

let make_describe_effective_policy_request ?target_id:(target_id_ : policy_target_id option)
    ~policy_type:(policy_type_ : effective_policy_type) () =
  ({ target_id = target_id_; policy_type = policy_type_ } : describe_effective_policy_request)

let make_describe_create_account_status_response
    ?create_account_status:(create_account_status_ : create_account_status option) () =
  ({ create_account_status = create_account_status_ } : describe_create_account_status_response)

let make_describe_create_account_status_request
    ~create_account_request_id:(create_account_request_id_ : create_account_request_id) () =
  ({ create_account_request_id = create_account_request_id_ }
    : describe_create_account_status_request)

let make_describe_account_response ?account:(account_ : account option) () =
  ({ account = account_ } : describe_account_response)

let make_describe_account_request ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_ } : describe_account_request)

let make_deregister_delegated_administrator_request
    ~service_principal:(service_principal_ : service_principal)
    ~account_id:(account_id_ : account_id) () =
  ({ service_principal = service_principal_; account_id = account_id_ }
    : deregister_delegated_administrator_request)

let make_delete_policy_request ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : delete_policy_request)

let make_delete_organizational_unit_request
    ~organizational_unit_id:(organizational_unit_id_ : organizational_unit_id) () =
  ({ organizational_unit_id = organizational_unit_id_ } : delete_organizational_unit_request)

let make_decline_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : decline_handshake_response)

let make_decline_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : decline_handshake_request)

let make_create_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : create_policy_response)

let make_create_policy_request ?tags:(tags_ : tags option) ~type_:(type__ : policy_type)
    ~name:(name_ : policy_name) ~description:(description_ : policy_description)
    ~content:(content_ : policy_content) () =
  ({ tags = tags_; type_ = type__; name = name_; description = description_; content = content_ }
    : create_policy_request)

let make_create_organizational_unit_response
    ?organizational_unit:(organizational_unit_ : organizational_unit option) () =
  ({ organizational_unit = organizational_unit_ } : create_organizational_unit_response)

let make_create_organizational_unit_request ?tags:(tags_ : tags option)
    ~name:(name_ : organizational_unit_name) ~parent_id:(parent_id_ : parent_id) () =
  ({ tags = tags_; name = name_; parent_id = parent_id_ } : create_organizational_unit_request)

let make_create_organization_response ?organization:(organization_ : organization option) () =
  ({ organization = organization_ } : create_organization_response)

let make_create_organization_request ?feature_set:(feature_set_ : organization_feature_set option)
    () =
  ({ feature_set = feature_set_ } : create_organization_request)

let make_create_gov_cloud_account_response
    ?create_account_status:(create_account_status_ : create_account_status option) () =
  ({ create_account_status = create_account_status_ } : create_gov_cloud_account_response)

let make_create_gov_cloud_account_request ?tags:(tags_ : tags option)
    ?iam_user_access_to_billing:(iam_user_access_to_billing_ : iam_user_access_to_billing option)
    ?role_name:(role_name_ : role_name option) ~account_name:(account_name_ : create_account_name)
    ~email:(email_ : email) () =
  ({
     tags = tags_;
     iam_user_access_to_billing = iam_user_access_to_billing_;
     role_name = role_name_;
     account_name = account_name_;
     email = email_;
   }
    : create_gov_cloud_account_request)

let make_create_account_response
    ?create_account_status:(create_account_status_ : create_account_status option) () =
  ({ create_account_status = create_account_status_ } : create_account_response)

let make_create_account_request ?tags:(tags_ : tags option)
    ?iam_user_access_to_billing:(iam_user_access_to_billing_ : iam_user_access_to_billing option)
    ?role_name:(role_name_ : role_name option) ~account_name:(account_name_ : create_account_name)
    ~email:(email_ : email) () =
  ({
     tags = tags_;
     iam_user_access_to_billing = iam_user_access_to_billing_;
     role_name = role_name_;
     account_name = account_name_;
     email = email_;
   }
    : create_account_request)

let make_close_account_request ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_ } : close_account_request)

let make_cancel_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : cancel_handshake_response)

let make_cancel_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : cancel_handshake_request)

let make_attach_policy_request ~target_id:(target_id_ : policy_target_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ target_id = target_id_; policy_id = policy_id_ } : attach_policy_request)

let make_accept_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : accept_handshake_response)

let make_accept_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : accept_handshake_request)
