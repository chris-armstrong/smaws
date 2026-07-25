open Types

let make_transfer_participant ?management_account_id:(management_account_id_ : account_id option)
    ?management_account_email:(management_account_email_ : email option) () =
  ({
     management_account_id = management_account_id_;
     management_account_email = management_account_email_;
   }
    : transfer_participant)

let make_responsibility_transfer ?arn:(arn_ : responsibility_transfer_arn option)
    ?name:(name_ : responsibility_transfer_name option)
    ?id:(id_ : responsibility_transfer_id option)
    ?type_:(type__ : responsibility_transfer_type option)
    ?status:(status_ : responsibility_transfer_status option)
    ?source:(source_ : transfer_participant option) ?target:(target_ : transfer_participant option)
    ?start_timestamp:(start_timestamp_ : timestamp option)
    ?end_timestamp:(end_timestamp_ : timestamp option)
    ?active_handshake_id:(active_handshake_id_ : handshake_id option) () =
  ({
     arn = arn_;
     name = name_;
     id = id_;
     type_ = type__;
     status = status_;
     source = source_;
     target = target_;
     start_timestamp = start_timestamp_;
     end_timestamp = end_timestamp_;
     active_handshake_id = active_handshake_id_;
   }
    : responsibility_transfer)

let make_update_responsibility_transfer_response
    ?responsibility_transfer:(responsibility_transfer_ : responsibility_transfer option) () =
  ({ responsibility_transfer = responsibility_transfer_ } : update_responsibility_transfer_response)

let make_update_responsibility_transfer_request ~id:(id_ : responsibility_transfer_id)
    ~name:(name_ : responsibility_transfer_name) () =
  ({ id = id_; name = name_ } : update_responsibility_transfer_request)

let make_policy_summary ?id:(id_ : policy_id option) ?arn:(arn_ : policy_arn option)
    ?name:(name_ : policy_name option) ?description:(description_ : policy_description option)
    ?type_:(type__ : policy_type option) ?aws_managed:(aws_managed_ : aws_managed_policy option) ()
    =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     description = description_;
     type_ = type__;
     aws_managed = aws_managed_;
   }
    : policy_summary)

let make_policy ?policy_summary:(policy_summary_ : policy_summary option)
    ?content:(content_ : policy_content option) () =
  ({ policy_summary = policy_summary_; content = content_ } : policy)

let make_update_policy_response ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : update_policy_response)

let make_update_policy_request ?name:(name_ : policy_name option)
    ?description:(description_ : policy_description option)
    ?content:(content_ : policy_content option) ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_; name = name_; description = description_; content = content_ }
    : update_policy_request)

let make_organizational_unit ?id:(id_ : organizational_unit_id option)
    ?arn:(arn_ : organizational_unit_arn option) ?name:(name_ : organizational_unit_name option)
    ?path:(path_ : path option) () =
  ({ id = id_; arn = arn_; name = name_; path = path_ } : organizational_unit)

let make_update_organizational_unit_response
    ?organizational_unit:(organizational_unit_ : organizational_unit option) () =
  ({ organizational_unit = organizational_unit_ } : update_organizational_unit_response)

let make_update_organizational_unit_request ?name:(name_ : organizational_unit_name option)
    ~organizational_unit_id:(organizational_unit_id_ : organizational_unit_id) () =
  ({ organizational_unit_id = organizational_unit_id_; name = name_ }
    : update_organizational_unit_request)

let make_untag_resource_request ~resource_id:(resource_id_ : taggable_resource_id)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_id = resource_id_; tag_keys = tag_keys_ } : untag_resource_request)

let make_terminate_responsibility_transfer_response
    ?responsibility_transfer:(responsibility_transfer_ : responsibility_transfer option) () =
  ({ responsibility_transfer = responsibility_transfer_ }
    : terminate_responsibility_transfer_response)

let make_terminate_responsibility_transfer_request
    ?end_timestamp:(end_timestamp_ : timestamp option) ~id:(id_ : responsibility_transfer_id) () =
  ({ id = id_; end_timestamp = end_timestamp_ } : terminate_responsibility_transfer_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_id:(resource_id_ : taggable_resource_id)
    ~tags:(tags_ : tags) () =
  ({ resource_id = resource_id_; tags = tags_ } : tag_resource_request)

let make_remove_account_from_organization_request ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_ } : remove_account_from_organization_request)

let make_register_delegated_administrator_request ~account_id:(account_id_ : account_id)
    ~service_principal:(service_principal_ : service_principal) () =
  ({ account_id = account_id_; service_principal = service_principal_ }
    : register_delegated_administrator_request)

let make_resource_policy_summary ?id:(id_ : resource_policy_id option)
    ?arn:(arn_ : resource_policy_arn option) () =
  ({ id = id_; arn = arn_ } : resource_policy_summary)

let make_resource_policy
    ?resource_policy_summary:(resource_policy_summary_ : resource_policy_summary option)
    ?content:(content_ : resource_policy_content option) () =
  ({ resource_policy_summary = resource_policy_summary_; content = content_ } : resource_policy)

let make_put_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : put_resource_policy_response)

let make_put_resource_policy_request ?tags:(tags_ : tags option)
    ~content:(content_ : resource_policy_content) () =
  ({ content = content_; tags = tags_ } : put_resource_policy_request)

let make_move_account_request ~account_id:(account_id_ : account_id)
    ~source_parent_id:(source_parent_id_ : parent_id)
    ~destination_parent_id:(destination_parent_id_ : parent_id) () =
  ({
     account_id = account_id_;
     source_parent_id = source_parent_id_;
     destination_parent_id = destination_parent_id_;
   }
    : move_account_request)

let make_policy_target_summary ?target_id:(target_id_ : policy_target_id option)
    ?arn:(arn_ : generic_arn option) ?name:(name_ : target_name option)
    ?type_:(type__ : target_type option) () =
  ({ target_id = target_id_; arn = arn_; name = name_; type_ = type__ } : policy_target_summary)

let make_list_targets_for_policy_response ?targets:(targets_ : policy_targets option)
    ?next_token:(next_token_ : next_token option) () =
  ({ targets = targets_; next_token = next_token_ } : list_targets_for_policy_response)

let make_list_targets_for_policy_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_; next_token = next_token_; max_results = max_results_ }
    : list_targets_for_policy_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ~resource_id:(resource_id_ : taggable_resource_id) () =
  ({ resource_id = resource_id_; next_token = next_token_ } : list_tags_for_resource_request)

let make_policy_type_summary ?type_:(type__ : policy_type option)
    ?status:(status_ : policy_type_status option) () =
  ({ type_ = type__; status = status_ } : policy_type_summary)

let make_root ?id:(id_ : root_id option) ?arn:(arn_ : root_arn option)
    ?name:(name_ : root_name option) ?policy_types:(policy_types_ : policy_types option) () =
  ({ id = id_; arn = arn_; name = name_; policy_types = policy_types_ } : root)

let make_list_roots_response ?roots:(roots_ : roots option)
    ?next_token:(next_token_ : next_token option) () =
  ({ roots = roots_; next_token = next_token_ } : list_roots_response)

let make_list_roots_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_roots_request)

let make_list_policies_for_target_response ?policies:(policies_ : policies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ policies = policies_; next_token = next_token_ } : list_policies_for_target_response)

let make_list_policies_for_target_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~target_id:(target_id_ : policy_target_id)
    ~filter:(filter_ : policy_type) () =
  ({
     target_id = target_id_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_policies_for_target_request)

let make_list_policies_response ?policies:(policies_ : policies option)
    ?next_token:(next_token_ : next_token option) () =
  ({ policies = policies_; next_token = next_token_ } : list_policies_response)

let make_list_policies_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~filter:(filter_ : policy_type) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_policies_request)

let make_parent ?id:(id_ : parent_id option) ?type_:(type__ : parent_type option) () =
  ({ id = id_; type_ = type__ } : parent)

let make_list_parents_response ?parents:(parents_ : parents option)
    ?next_token:(next_token_ : next_token option) () =
  ({ parents = parents_; next_token = next_token_ } : list_parents_response)

let make_list_parents_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~child_id:(child_id_ : child_id) () =
  ({ child_id = child_id_; next_token = next_token_; max_results = max_results_ }
    : list_parents_request)

let make_list_outbound_responsibility_transfers_response
    ?responsibility_transfers:(responsibility_transfers_ : responsibility_transfers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ responsibility_transfers = responsibility_transfers_; next_token = next_token_ }
    : list_outbound_responsibility_transfers_response)

let make_list_outbound_responsibility_transfers_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~type_:(type__ : responsibility_transfer_type) () =
  ({ type_ = type__; next_token = next_token_; max_results = max_results_ }
    : list_outbound_responsibility_transfers_request)

let make_list_organizational_units_for_parent_response
    ?organizational_units:(organizational_units_ : organizational_units option)
    ?next_token:(next_token_ : next_token option) () =
  ({ organizational_units = organizational_units_; next_token = next_token_ }
    : list_organizational_units_for_parent_response)

let make_list_organizational_units_for_parent_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~parent_id:(parent_id_ : parent_id) () =
  ({ parent_id = parent_id_; next_token = next_token_; max_results = max_results_ }
    : list_organizational_units_for_parent_request)

let make_list_inbound_responsibility_transfers_response
    ?responsibility_transfers:(responsibility_transfers_ : responsibility_transfers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ responsibility_transfers = responsibility_transfers_; next_token = next_token_ }
    : list_inbound_responsibility_transfers_response)

let make_list_inbound_responsibility_transfers_request ?id:(id_ : responsibility_transfer_id option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~type_:(type__ : responsibility_transfer_type) () =
  ({ type_ = type__; id = id_; next_token = next_token_; max_results = max_results_ }
    : list_inbound_responsibility_transfers_request)

let make_handshake_resource ?value:(value_ : handshake_resource_value option)
    ?type_:(type__ : handshake_resource_type option)
    ?resources:(resources_ : handshake_resources option) () =
  ({ value = value_; type_ = type__; resources = resources_ } : handshake_resource)

let make_handshake_party ~id:(id_ : handshake_party_id) ~type_:(type__ : handshake_party_type) () =
  ({ id = id_; type_ = type__ } : handshake_party)

let make_handshake ?id:(id_ : handshake_id option) ?arn:(arn_ : handshake_arn option)
    ?parties:(parties_ : handshake_parties option) ?state:(state_ : handshake_state option)
    ?requested_timestamp:(requested_timestamp_ : timestamp option)
    ?expiration_timestamp:(expiration_timestamp_ : timestamp option)
    ?action:(action_ : action_type option) ?resources:(resources_ : handshake_resources option) () =
  ({
     id = id_;
     arn = arn_;
     parties = parties_;
     state = state_;
     requested_timestamp = requested_timestamp_;
     expiration_timestamp = expiration_timestamp_;
     action = action_;
     resources = resources_;
   }
    : handshake)

let make_list_handshakes_for_organization_response ?handshakes:(handshakes_ : handshakes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ handshakes = handshakes_; next_token = next_token_ }
    : list_handshakes_for_organization_response)

let make_handshake_filter ?action_type:(action_type_ : action_type option)
    ?parent_handshake_id:(parent_handshake_id_ : handshake_id option) () =
  ({ action_type = action_type_; parent_handshake_id = parent_handshake_id_ } : handshake_filter)

let make_list_handshakes_for_organization_request ?filter:(filter_ : handshake_filter option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_handshakes_for_organization_request)

let make_list_handshakes_for_account_response ?handshakes:(handshakes_ : handshakes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ handshakes = handshakes_; next_token = next_token_ } : list_handshakes_for_account_response)

let make_list_handshakes_for_account_request ?filter:(filter_ : handshake_filter option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_handshakes_for_account_request)

let make_effective_policy_validation_error ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option)
    ?path_to_error:(path_to_error_ : path_to_error option)
    ?contributing_policies:(contributing_policies_ : policy_ids option) () =
  ({
     error_code = error_code_;
     error_message = error_message_;
     path_to_error = path_to_error_;
     contributing_policies = contributing_policies_;
   }
    : effective_policy_validation_error)

let make_list_effective_policy_validation_errors_response
    ?account_id:(account_id_ : account_id option)
    ?policy_type:(policy_type_ : effective_policy_type option) ?path:(path_ : path option)
    ?evaluation_timestamp:(evaluation_timestamp_ : timestamp option)
    ?next_token:(next_token_ : next_token option)
    ?effective_policy_validation_errors:
      (effective_policy_validation_errors_ : effective_policy_validation_errors option) () =
  ({
     account_id = account_id_;
     policy_type = policy_type_;
     path = path_;
     evaluation_timestamp = evaluation_timestamp_;
     next_token = next_token_;
     effective_policy_validation_errors = effective_policy_validation_errors_;
   }
    : list_effective_policy_validation_errors_response)

let make_list_effective_policy_validation_errors_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~account_id:(account_id_ : account_id) ~policy_type:(policy_type_ : effective_policy_type) () =
  ({
     account_id = account_id_;
     policy_type = policy_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_effective_policy_validation_errors_request)

let make_delegated_service ?service_principal:(service_principal_ : service_principal option)
    ?delegation_enabled_date:(delegation_enabled_date_ : timestamp option) () =
  ({ service_principal = service_principal_; delegation_enabled_date = delegation_enabled_date_ }
    : delegated_service)

let make_list_delegated_services_for_account_response
    ?delegated_services:(delegated_services_ : delegated_services option)
    ?next_token:(next_token_ : next_token option) () =
  ({ delegated_services = delegated_services_; next_token = next_token_ }
    : list_delegated_services_for_account_response)

let make_list_delegated_services_for_account_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_; next_token = next_token_; max_results = max_results_ }
    : list_delegated_services_for_account_request)

let make_delegated_administrator ?id:(id_ : account_id option) ?arn:(arn_ : account_arn option)
    ?email:(email_ : email option) ?name:(name_ : account_name option)
    ?status:(status_ : account_status option) ?state:(state_ : account_state option)
    ?joined_method:(joined_method_ : account_joined_method option)
    ?joined_timestamp:(joined_timestamp_ : timestamp option)
    ?delegation_enabled_date:(delegation_enabled_date_ : timestamp option) () =
  ({
     id = id_;
     arn = arn_;
     email = email_;
     name = name_;
     status = status_;
     state = state_;
     joined_method = joined_method_;
     joined_timestamp = joined_timestamp_;
     delegation_enabled_date = delegation_enabled_date_;
   }
    : delegated_administrator)

let make_list_delegated_administrators_response
    ?delegated_administrators:(delegated_administrators_ : delegated_administrators option)
    ?next_token:(next_token_ : next_token option) () =
  ({ delegated_administrators = delegated_administrators_; next_token = next_token_ }
    : list_delegated_administrators_response)

let make_list_delegated_administrators_request
    ?service_principal:(service_principal_ : service_principal option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ service_principal = service_principal_; next_token = next_token_; max_results = max_results_ }
    : list_delegated_administrators_request)

let make_create_account_status ?id:(id_ : create_account_request_id option)
    ?account_name:(account_name_ : create_account_name option)
    ?state:(state_ : create_account_state option)
    ?requested_timestamp:(requested_timestamp_ : timestamp option)
    ?completed_timestamp:(completed_timestamp_ : timestamp option)
    ?account_id:(account_id_ : account_id option)
    ?gov_cloud_account_id:(gov_cloud_account_id_ : account_id option)
    ?failure_reason:(failure_reason_ : create_account_failure_reason option) () =
  ({
     id = id_;
     account_name = account_name_;
     state = state_;
     requested_timestamp = requested_timestamp_;
     completed_timestamp = completed_timestamp_;
     account_id = account_id_;
     gov_cloud_account_id = gov_cloud_account_id_;
     failure_reason = failure_reason_;
   }
    : create_account_status)

let make_list_create_account_status_response
    ?create_account_statuses:(create_account_statuses_ : create_account_statuses option)
    ?next_token:(next_token_ : next_token option) () =
  ({ create_account_statuses = create_account_statuses_; next_token = next_token_ }
    : list_create_account_status_response)

let make_list_create_account_status_request ?states:(states_ : create_account_states option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ states = states_; next_token = next_token_; max_results = max_results_ }
    : list_create_account_status_request)

let make_child ?id:(id_ : child_id option) ?type_:(type__ : child_type option) () =
  ({ id = id_; type_ = type__ } : child)

let make_list_children_response ?children:(children_ : children option)
    ?next_token:(next_token_ : next_token option) () =
  ({ children = children_; next_token = next_token_ } : list_children_response)

let make_list_children_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~parent_id:(parent_id_ : parent_id)
    ~child_type:(child_type_ : child_type) () =
  ({
     parent_id = parent_id_;
     child_type = child_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_children_request)

let make_enabled_service_principal
    ?service_principal:(service_principal_ : service_principal option)
    ?date_enabled:(date_enabled_ : timestamp option) () =
  ({ service_principal = service_principal_; date_enabled = date_enabled_ }
    : enabled_service_principal)

let make_list_aws_service_access_for_organization_response
    ?enabled_service_principals:(enabled_service_principals_ : enabled_service_principals option)
    ?next_token:(next_token_ : next_token option) () =
  ({ enabled_service_principals = enabled_service_principals_; next_token = next_token_ }
    : list_aws_service_access_for_organization_response)

let make_list_aws_service_access_for_organization_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_aws_service_access_for_organization_request)

let make_account ?id:(id_ : account_id option) ?arn:(arn_ : account_arn option)
    ?email:(email_ : email option) ?name:(name_ : account_name option)
    ?status:(status_ : account_status option) ?state:(state_ : account_state option)
    ?paths:(paths_ : paths option) ?joined_method:(joined_method_ : account_joined_method option)
    ?joined_timestamp:(joined_timestamp_ : timestamp option) () =
  ({
     id = id_;
     arn = arn_;
     email = email_;
     name = name_;
     status = status_;
     state = state_;
     paths = paths_;
     joined_method = joined_method_;
     joined_timestamp = joined_timestamp_;
   }
    : account)

let make_list_accounts_with_invalid_effective_policy_response
    ?accounts:(accounts_ : accounts option)
    ?policy_type:(policy_type_ : effective_policy_type option)
    ?next_token:(next_token_ : next_token option) () =
  ({ accounts = accounts_; policy_type = policy_type_; next_token = next_token_ }
    : list_accounts_with_invalid_effective_policy_response)

let make_list_accounts_with_invalid_effective_policy_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~policy_type:(policy_type_ : effective_policy_type) () =
  ({ policy_type = policy_type_; next_token = next_token_; max_results = max_results_ }
    : list_accounts_with_invalid_effective_policy_request)

let make_list_accounts_for_parent_response ?accounts:(accounts_ : accounts option)
    ?next_token:(next_token_ : next_token option) () =
  ({ accounts = accounts_; next_token = next_token_ } : list_accounts_for_parent_response)

let make_list_accounts_for_parent_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~parent_id:(parent_id_ : parent_id) () =
  ({ parent_id = parent_id_; next_token = next_token_; max_results = max_results_ }
    : list_accounts_for_parent_request)

let make_list_accounts_response ?accounts:(accounts_ : accounts option)
    ?next_token:(next_token_ : next_token option) () =
  ({ accounts = accounts_; next_token = next_token_ } : list_accounts_response)

let make_list_accounts_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_accounts_request)

let make_invite_organization_to_transfer_responsibility_response
    ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : invite_organization_to_transfer_responsibility_response)

let make_invite_organization_to_transfer_responsibility_request
    ?notes:(notes_ : handshake_notes option) ?tags:(tags_ : tags option)
    ~type_:(type__ : responsibility_transfer_type) ~target:(target_ : handshake_party)
    ~start_timestamp:(start_timestamp_ : timestamp)
    ~source_name:(source_name_ : responsibility_transfer_name) () =
  ({
     type_ = type__;
     target = target_;
     notes = notes_;
     start_timestamp = start_timestamp_;
     source_name = source_name_;
     tags = tags_;
   }
    : invite_organization_to_transfer_responsibility_request)

let make_invite_account_to_organization_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : invite_account_to_organization_response)

let make_invite_account_to_organization_request ?notes:(notes_ : handshake_notes option)
    ?tags:(tags_ : tags option) ~target:(target_ : handshake_party) () =
  ({ target = target_; notes = notes_; tags = tags_ } : invite_account_to_organization_request)

let make_enable_policy_type_response ?root:(root_ : root option) () =
  ({ root = root_ } : enable_policy_type_response)

let make_enable_policy_type_request ~root_id:(root_id_ : root_id)
    ~policy_type:(policy_type_ : policy_type) () =
  ({ root_id = root_id_; policy_type = policy_type_ } : enable_policy_type_request)

let make_enable_aws_service_access_request
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_ } : enable_aws_service_access_request)

let make_enable_all_features_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : enable_all_features_response)

let make_enable_all_features_request () = (() : unit)

let make_disable_policy_type_response ?root:(root_ : root option) () =
  ({ root = root_ } : disable_policy_type_response)

let make_disable_policy_type_request ~root_id:(root_id_ : root_id)
    ~policy_type:(policy_type_ : policy_type) () =
  ({ root_id = root_id_; policy_type = policy_type_ } : disable_policy_type_request)

let make_disable_aws_service_access_request
    ~service_principal:(service_principal_ : service_principal) () =
  ({ service_principal = service_principal_ } : disable_aws_service_access_request)

let make_detach_policy_request ~policy_id:(policy_id_ : policy_id)
    ~target_id:(target_id_ : policy_target_id) () =
  ({ policy_id = policy_id_; target_id = target_id_ } : detach_policy_request)

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

let make_organization ?id:(id_ : organization_id option) ?arn:(arn_ : organization_arn option)
    ?feature_set:(feature_set_ : organization_feature_set option)
    ?master_account_arn:(master_account_arn_ : account_arn option)
    ?master_account_id:(master_account_id_ : account_id option)
    ?master_account_email:(master_account_email_ : email option)
    ?available_policy_types:(available_policy_types_ : policy_types option) () =
  ({
     id = id_;
     arn = arn_;
     feature_set = feature_set_;
     master_account_arn = master_account_arn_;
     master_account_id = master_account_id_;
     master_account_email = master_account_email_;
     available_policy_types = available_policy_types_;
   }
    : organization)

let make_describe_organization_response ?organization:(organization_ : organization option) () =
  ({ organization = organization_ } : describe_organization_response)

let make_describe_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : describe_handshake_response)

let make_describe_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : describe_handshake_request)

let make_effective_policy ?policy_content:(policy_content_ : policy_content option)
    ?last_updated_timestamp:(last_updated_timestamp_ : timestamp option)
    ?target_id:(target_id_ : policy_target_id option)
    ?policy_type:(policy_type_ : effective_policy_type option) () =
  ({
     policy_content = policy_content_;
     last_updated_timestamp = last_updated_timestamp_;
     target_id = target_id_;
     policy_type = policy_type_;
   }
    : effective_policy)

let make_describe_effective_policy_response
    ?effective_policy:(effective_policy_ : effective_policy option) () =
  ({ effective_policy = effective_policy_ } : describe_effective_policy_response)

let make_describe_effective_policy_request ?target_id:(target_id_ : policy_target_id option)
    ~policy_type:(policy_type_ : effective_policy_type) () =
  ({ policy_type = policy_type_; target_id = target_id_ } : describe_effective_policy_request)

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

let make_deregister_delegated_administrator_request ~account_id:(account_id_ : account_id)
    ~service_principal:(service_principal_ : service_principal) () =
  ({ account_id = account_id_; service_principal = service_principal_ }
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

let make_create_policy_request ?tags:(tags_ : tags option) ~content:(content_ : policy_content)
    ~description:(description_ : policy_description) ~name:(name_ : policy_name)
    ~type_:(type__ : policy_type) () =
  ({ content = content_; description = description_; name = name_; type_ = type__; tags = tags_ }
    : create_policy_request)

let make_create_organizational_unit_response
    ?organizational_unit:(organizational_unit_ : organizational_unit option) () =
  ({ organizational_unit = organizational_unit_ } : create_organizational_unit_response)

let make_create_organizational_unit_request ?tags:(tags_ : tags option)
    ~parent_id:(parent_id_ : parent_id) ~name:(name_ : organizational_unit_name) () =
  ({ parent_id = parent_id_; name = name_; tags = tags_ } : create_organizational_unit_request)

let make_create_organization_response ?organization:(organization_ : organization option) () =
  ({ organization = organization_ } : create_organization_response)

let make_create_organization_request ?feature_set:(feature_set_ : organization_feature_set option)
    () =
  ({ feature_set = feature_set_ } : create_organization_request)

let make_create_gov_cloud_account_response
    ?create_account_status:(create_account_status_ : create_account_status option) () =
  ({ create_account_status = create_account_status_ } : create_gov_cloud_account_response)

let make_create_gov_cloud_account_request ?role_name:(role_name_ : role_name option)
    ?iam_user_access_to_billing:(iam_user_access_to_billing_ : iam_user_access_to_billing option)
    ?tags:(tags_ : tags option) ~email:(email_ : email)
    ~account_name:(account_name_ : create_account_name) () =
  ({
     email = email_;
     account_name = account_name_;
     role_name = role_name_;
     iam_user_access_to_billing = iam_user_access_to_billing_;
     tags = tags_;
   }
    : create_gov_cloud_account_request)

let make_create_account_response
    ?create_account_status:(create_account_status_ : create_account_status option) () =
  ({ create_account_status = create_account_status_ } : create_account_response)

let make_create_account_request ?role_name:(role_name_ : role_name option)
    ?iam_user_access_to_billing:(iam_user_access_to_billing_ : iam_user_access_to_billing option)
    ?tags:(tags_ : tags option) ~email:(email_ : email)
    ~account_name:(account_name_ : create_account_name) () =
  ({
     email = email_;
     account_name = account_name_;
     role_name = role_name_;
     iam_user_access_to_billing = iam_user_access_to_billing_;
     tags = tags_;
   }
    : create_account_request)

let make_close_account_request ~account_id:(account_id_ : account_id) () =
  ({ account_id = account_id_ } : close_account_request)

let make_cancel_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : cancel_handshake_response)

let make_cancel_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : cancel_handshake_request)

let make_attach_policy_request ~policy_id:(policy_id_ : policy_id)
    ~target_id:(target_id_ : policy_target_id) () =
  ({ policy_id = policy_id_; target_id = target_id_ } : attach_policy_request)

let make_accept_handshake_response ?handshake:(handshake_ : handshake option) () =
  ({ handshake = handshake_ } : accept_handshake_response)

let make_accept_handshake_request ~handshake_id:(handshake_id_ : handshake_id) () =
  ({ handshake_id = handshake_id_ } : accept_handshake_request)
