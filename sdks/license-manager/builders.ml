open Types

let make_update_service_settings_response () = (() : unit)

let make_organization_configuration ~enable_integration:(enable_integration_ : boolean_) () =
  ({ enable_integration = enable_integration_ } : organization_configuration)

let make_update_service_settings_request ?s3_bucket_arn:(s3_bucket_arn_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?enable_cross_accounts_discovery:(enable_cross_accounts_discovery_ : box_boolean option)
    ?enabled_discovery_source_regions:(enabled_discovery_source_regions_ : string_list option) () =
  ({
     s3_bucket_arn = s3_bucket_arn_;
     sns_topic_arn = sns_topic_arn_;
     organization_configuration = organization_configuration_;
     enable_cross_accounts_discovery = enable_cross_accounts_discovery_;
     enabled_discovery_source_regions = enabled_discovery_source_regions_;
   }
    : update_service_settings_request)

let make_update_license_specifications_for_resource_response () = (() : unit)

let make_license_specification ?ami_association_scope:(ami_association_scope_ : string_ option)
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({
     license_configuration_arn = license_configuration_arn_;
     ami_association_scope = ami_association_scope_;
   }
    : license_specification)

let make_update_license_specifications_for_resource_request
    ?add_license_specifications:(add_license_specifications_ : license_specifications option)
    ?remove_license_specifications:(remove_license_specifications_ : license_specifications option)
    ~resource_arn:(resource_arn_ : string_) () =
  ({
     resource_arn = resource_arn_;
     add_license_specifications = add_license_specifications_;
     remove_license_specifications = remove_license_specifications_;
   }
    : update_license_specifications_for_resource_request)

let make_update_license_manager_report_generator_response () = (() : unit)

let make_report_frequency ?value:(value_ : integer option)
    ?period:(period_ : report_frequency_type option) () =
  ({ value = value_; period = period_ } : report_frequency)

let make_report_context ?license_configuration_arns:(license_configuration_arns_ : arn_list option)
    ?license_asset_group_arns:(license_asset_group_arns_ : arn_list option)
    ?report_start_date:(report_start_date_ : date_time option)
    ?report_end_date:(report_end_date_ : date_time option) () =
  ({
     license_configuration_arns = license_configuration_arns_;
     license_asset_group_arns = license_asset_group_arns_;
     report_start_date = report_start_date_;
     report_end_date = report_end_date_;
   }
    : report_context)

let make_update_license_manager_report_generator_request
    ?description:(description_ : string_ option)
    ~license_manager_report_generator_arn:(license_manager_report_generator_arn_ : string_)
    ~report_generator_name:(report_generator_name_ : report_generator_name)
    ~type_:(type__ : report_type_list) ~report_context:(report_context_ : report_context)
    ~report_frequency:(report_frequency_ : report_frequency)
    ~client_token:(client_token_ : client_request_token) () =
  ({
     license_manager_report_generator_arn = license_manager_report_generator_arn_;
     report_generator_name = report_generator_name_;
     type_ = type__;
     report_context = report_context_;
     report_frequency = report_frequency_;
     client_token = client_token_;
     description = description_;
   }
    : update_license_manager_report_generator_request)

let make_update_license_configuration_response () = (() : unit)

let make_product_information_filter
    ?product_information_filter_value:(product_information_filter_value_ : string_list option)
    ~product_information_filter_name:(product_information_filter_name_ : string_)
    ~product_information_filter_comparator:(product_information_filter_comparator_ : string_) () =
  ({
     product_information_filter_name = product_information_filter_name_;
     product_information_filter_value = product_information_filter_value_;
     product_information_filter_comparator = product_information_filter_comparator_;
   }
    : product_information_filter)

let make_product_information ~resource_type:(resource_type_ : string_)
    ~product_information_filter_list:
      (product_information_filter_list_ : product_information_filter_list) () =
  ({
     resource_type = resource_type_;
     product_information_filter_list = product_information_filter_list_;
   }
    : product_information)

let make_update_license_configuration_request
    ?license_configuration_status:
      (license_configuration_status_ : license_configuration_status option)
    ?license_rules:(license_rules_ : string_list option)
    ?license_count:(license_count_ : box_long option)
    ?license_count_hard_limit:(license_count_hard_limit_ : box_boolean option)
    ?name:(name_ : string_ option) ?description:(description_ : string_ option)
    ?product_information_list:(product_information_list_ : product_information_list option)
    ?disassociate_when_not_found:(disassociate_when_not_found_ : box_boolean option)
    ?license_expiry:(license_expiry_ : box_long option)
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({
     license_configuration_arn = license_configuration_arn_;
     license_configuration_status = license_configuration_status_;
     license_rules = license_rules_;
     license_count = license_count_;
     license_count_hard_limit = license_count_hard_limit_;
     name = name_;
     description = description_;
     product_information_list = product_information_list_;
     disassociate_when_not_found = disassociate_when_not_found_;
     license_expiry = license_expiry_;
   }
    : update_license_configuration_request)

let make_update_license_asset_ruleset_response
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : string_) () =
  ({ license_asset_ruleset_arn = license_asset_ruleset_arn_ }
    : update_license_asset_ruleset_response)

let make_script_rule_statement ~key_to_match:(key_to_match_ : string_) ~script:(script_ : string_)
    () =
  ({ key_to_match = key_to_match_; script = script_ } : script_rule_statement)

let make_matching_rule_statement ~key_to_match:(key_to_match_ : string_)
    ~constraint_:(constraint__ : string_) ~value_to_match:(value_to_match_ : string_list) () =
  ({ key_to_match = key_to_match_; constraint_ = constraint__; value_to_match = value_to_match_ }
    : matching_rule_statement)

let make_or_rule_statement
    ?matching_rule_statements:(matching_rule_statements_ : matching_rule_statement_list option)
    ?script_rule_statements:(script_rule_statements_ : script_rule_statement_list option) () =
  ({
     matching_rule_statements = matching_rule_statements_;
     script_rule_statements = script_rule_statements_;
   }
    : or_rule_statement)

let make_and_rule_statement
    ?matching_rule_statements:(matching_rule_statements_ : matching_rule_statement_list option)
    ?script_rule_statements:(script_rule_statements_ : script_rule_statement_list option) () =
  ({
     matching_rule_statements = matching_rule_statements_;
     script_rule_statements = script_rule_statements_;
   }
    : and_rule_statement)

let make_instance_rule_statement
    ?and_rule_statement:(and_rule_statement_ : and_rule_statement option)
    ?or_rule_statement:(or_rule_statement_ : or_rule_statement option)
    ?matching_rule_statement:(matching_rule_statement_ : matching_rule_statement option)
    ?script_rule_statement:(script_rule_statement_ : script_rule_statement option) () =
  ({
     and_rule_statement = and_rule_statement_;
     or_rule_statement = or_rule_statement_;
     matching_rule_statement = matching_rule_statement_;
     script_rule_statement = script_rule_statement_;
   }
    : instance_rule_statement)

let make_license_rule_statement
    ?and_rule_statement:(and_rule_statement_ : and_rule_statement option)
    ?or_rule_statement:(or_rule_statement_ : or_rule_statement option)
    ?matching_rule_statement:(matching_rule_statement_ : matching_rule_statement option) () =
  ({
     and_rule_statement = and_rule_statement_;
     or_rule_statement = or_rule_statement_;
     matching_rule_statement = matching_rule_statement_;
   }
    : license_rule_statement)

let make_license_configuration_rule_statement
    ?and_rule_statement:(and_rule_statement_ : and_rule_statement option)
    ?or_rule_statement:(or_rule_statement_ : or_rule_statement option)
    ?matching_rule_statement:(matching_rule_statement_ : matching_rule_statement option) () =
  ({
     and_rule_statement = and_rule_statement_;
     or_rule_statement = or_rule_statement_;
     matching_rule_statement = matching_rule_statement_;
   }
    : license_configuration_rule_statement)

let make_rule_statement
    ?license_configuration_rule_statement:
      (license_configuration_rule_statement_ : license_configuration_rule_statement option)
    ?license_rule_statement:(license_rule_statement_ : license_rule_statement option)
    ?instance_rule_statement:(instance_rule_statement_ : instance_rule_statement option) () =
  ({
     license_configuration_rule_statement = license_configuration_rule_statement_;
     license_rule_statement = license_rule_statement_;
     instance_rule_statement = instance_rule_statement_;
   }
    : rule_statement)

let make_license_asset_rule ~rule_statement:(rule_statement_ : rule_statement) () =
  ({ rule_statement = rule_statement_ } : license_asset_rule)

let make_update_license_asset_ruleset_request ?name:(name_ : license_asset_resource_name option)
    ?description:(description_ : license_asset_resource_description option)
    ~rules:(rules_ : license_asset_rule_list)
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : arn)
    ~client_token:(client_token_ : string_) () =
  ({
     name = name_;
     description = description_;
     rules = rules_;
     license_asset_ruleset_arn = license_asset_ruleset_arn_;
     client_token = client_token_;
   }
    : update_license_asset_ruleset_request)

let make_update_license_asset_group_response
    ~license_asset_group_arn:(license_asset_group_arn_ : string_) ~status:(status_ : string_) () =
  ({ license_asset_group_arn = license_asset_group_arn_; status = status_ }
    : update_license_asset_group_response)

let make_license_asset_group_property ~key:(key_ : string_) ~value:(value_ : string_) () =
  ({ key = key_; value = value_ } : license_asset_group_property)

let make_license_asset_group_configuration ?usage_dimension:(usage_dimension_ : string_ option) () =
  ({ usage_dimension = usage_dimension_ } : license_asset_group_configuration)

let make_update_license_asset_group_request ?name:(name_ : license_asset_resource_name option)
    ?description:(description_ : license_asset_resource_description option)
    ?license_asset_group_configurations:
      (license_asset_group_configurations_ : license_asset_group_configuration_list option)
    ?properties:(properties_ : license_asset_group_property_list option)
    ?status:(status_ : license_asset_group_status option)
    ~associated_license_asset_ruleset_ar_ns:
      (associated_license_asset_ruleset_ar_ns_ : license_asset_ruleset_arn_list)
    ~license_asset_group_arn:(license_asset_group_arn_ : arn)
    ~client_token:(client_token_ : string_) () =
  ({
     name = name_;
     description = description_;
     license_asset_group_configurations = license_asset_group_configurations_;
     associated_license_asset_ruleset_ar_ns = associated_license_asset_ruleset_ar_ns_;
     properties = properties_;
     license_asset_group_arn = license_asset_group_arn_;
     status = status_;
     client_token = client_token_;
   }
    : update_license_asset_group_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : string_)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : string_) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_reject_grant_response ?grant_arn:(grant_arn_ : arn option)
    ?status:(status_ : grant_status option) ?version:(version_ : string_ option) () =
  ({ grant_arn = grant_arn_; status = status_; version = version_ } : reject_grant_response)

let make_reject_grant_request ~grant_arn:(grant_arn_ : arn) () =
  ({ grant_arn = grant_arn_ } : reject_grant_request)

let make_license_configuration_usage ?resource_arn:(resource_arn_ : string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_status:(resource_status_ : string_ option)
    ?resource_owner_id:(resource_owner_id_ : string_ option)
    ?association_time:(association_time_ : date_time option)
    ?consumed_licenses:(consumed_licenses_ : box_long option) () =
  ({
     resource_arn = resource_arn_;
     resource_type = resource_type_;
     resource_status = resource_status_;
     resource_owner_id = resource_owner_id_;
     association_time = association_time_;
     consumed_licenses = consumed_licenses_;
   }
    : license_configuration_usage)

let make_list_usage_for_license_configuration_response
    ?license_configuration_usage_list:
      (license_configuration_usage_list_ : license_configuration_usage_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     license_configuration_usage_list = license_configuration_usage_list_;
     next_token = next_token_;
   }
    : list_usage_for_license_configuration_response)

let make_filter ?name:(name_ : filter_name option) ?values:(values_ : filter_values option) () =
  ({ name = name_; values = values_ } : filter)

let make_list_usage_for_license_configuration_request
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ?filters:(filters_ : filters option)
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({
     license_configuration_arn = license_configuration_arn_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_usage_for_license_configuration_request)

let make_token_data ?token_id:(token_id_ : string_ option)
    ?token_type:(token_type_ : string_ option) ?license_arn:(license_arn_ : string_ option)
    ?expiration_time:(expiration_time_ : iso8601_date_time option)
    ?token_properties:(token_properties_ : max_size3_string_list option)
    ?role_arns:(role_arns_ : arn_list option) ?status:(status_ : string_ option) () =
  ({
     token_id = token_id_;
     token_type = token_type_;
     license_arn = license_arn_;
     expiration_time = expiration_time_;
     token_properties = token_properties_;
     role_arns = role_arns_;
     status = status_;
   }
    : token_data)

let make_list_tokens_response ?tokens:(tokens_ : token_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ tokens = tokens_; next_token = next_token_ } : list_tokens_response)

let make_list_tokens_request ?token_ids:(token_ids_ : string_list option)
    ?filters:(filters_ : filter_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) () =
  ({
     token_ids = token_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_tokens_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_resource_inventory ?resource_id:(resource_id_ : string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_arn:(resource_arn_ : string_ option) ?platform:(platform_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?resource_owning_account_id:(resource_owning_account_id_ : string_ option)
    ?marketplace_product_codes:(marketplace_product_codes_ : string_list option)
    ?usage_operation:(usage_operation_ : string_ option) ?ami_id:(ami_id_ : string_ option)
    ?host_id:(host_id_ : string_ option) ?region:(region_ : string_ option)
    ?instance_type:(instance_type_ : string_ option) () =
  ({
     resource_id = resource_id_;
     resource_type = resource_type_;
     resource_arn = resource_arn_;
     platform = platform_;
     platform_version = platform_version_;
     resource_owning_account_id = resource_owning_account_id_;
     marketplace_product_codes = marketplace_product_codes_;
     usage_operation = usage_operation_;
     ami_id = ami_id_;
     host_id = host_id_;
     region = region_;
     instance_type = instance_type_;
   }
    : resource_inventory)

let make_list_resource_inventory_response
    ?resource_inventory_list:(resource_inventory_list_ : resource_inventory_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ resource_inventory_list = resource_inventory_list_; next_token = next_token_ }
    : list_resource_inventory_response)

let make_inventory_filter ?value:(value_ : string_ option) ~name:(name_ : string_)
    ~condition:(condition_ : inventory_filter_condition) () =
  ({ name = name_; condition = condition_; value = value_ } : inventory_filter)

let make_list_resource_inventory_request ?max_results:(max_results_ : box_integer option)
    ?next_token:(next_token_ : string_ option) ?filters:(filters_ : inventory_filter_list option) ()
    =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_resource_inventory_request)

let make_received_metadata ?received_status:(received_status_ : received_status option)
    ?received_status_reason:(received_status_reason_ : status_reason_message option)
    ?allowed_operations:(allowed_operations_ : allowed_operation_list option) () =
  ({
     received_status = received_status_;
     received_status_reason = received_status_reason_;
     allowed_operations = allowed_operations_;
   }
    : received_metadata)

let make_metadata ?name:(name_ : string_ option) ?value:(value_ : string_ option) () =
  ({ name = name_; value = value_ } : metadata)

let make_borrow_configuration ~allow_early_check_in:(allow_early_check_in_ : box_boolean)
    ~max_time_to_live_in_minutes:(max_time_to_live_in_minutes_ : box_integer) () =
  ({
     allow_early_check_in = allow_early_check_in_;
     max_time_to_live_in_minutes = max_time_to_live_in_minutes_;
   }
    : borrow_configuration)

let make_provisional_configuration
    ~max_time_to_live_in_minutes:(max_time_to_live_in_minutes_ : box_integer) () =
  ({ max_time_to_live_in_minutes = max_time_to_live_in_minutes_ } : provisional_configuration)

let make_consumption_configuration ?renew_type:(renew_type_ : renew_type option)
    ?provisional_configuration:(provisional_configuration_ : provisional_configuration option)
    ?borrow_configuration:(borrow_configuration_ : borrow_configuration option) () =
  ({
     renew_type = renew_type_;
     provisional_configuration = provisional_configuration_;
     borrow_configuration = borrow_configuration_;
   }
    : consumption_configuration)

let make_entitlement ?value:(value_ : string_ option) ?max_count:(max_count_ : long option)
    ?overage:(overage_ : box_boolean option) ?allow_check_in:(allow_check_in_ : box_boolean option)
    ~name:(name_ : string_) ~unit_:(unit__ : entitlement_unit) () =
  ({
     name = name_;
     value = value_;
     max_count = max_count_;
     overage = overage_;
     unit_ = unit__;
     allow_check_in = allow_check_in_;
   }
    : entitlement)

let make_datetime_range ?end_:(end__ : iso8601_date_time option)
    ~\#begin:(begin_ : iso8601_date_time) () =
  ({ \#begin = begin_; end_ = end__ } : datetime_range)

let make_issuer_details ?name:(name_ : string_ option) ?sign_key:(sign_key_ : string_ option)
    ?key_fingerprint:(key_fingerprint_ : string_ option) () =
  ({ name = name_; sign_key = sign_key_; key_fingerprint = key_fingerprint_ } : issuer_details)

let make_granted_license ?license_arn:(license_arn_ : arn option)
    ?license_name:(license_name_ : string_ option) ?product_name:(product_name_ : string_ option)
    ?product_sk_u:(product_sk_u_ : string_ option) ?issuer:(issuer_ : issuer_details option)
    ?home_region:(home_region_ : string_ option) ?status:(status_ : license_status option)
    ?validity:(validity_ : datetime_range option) ?beneficiary:(beneficiary_ : string_ option)
    ?entitlements:(entitlements_ : entitlement_list option)
    ?consumption_configuration:(consumption_configuration_ : consumption_configuration option)
    ?license_metadata:(license_metadata_ : metadata_list option)
    ?create_time:(create_time_ : iso8601_date_time option) ?version:(version_ : string_ option)
    ?received_metadata:(received_metadata_ : received_metadata option) () =
  ({
     license_arn = license_arn_;
     license_name = license_name_;
     product_name = product_name_;
     product_sk_u = product_sk_u_;
     issuer = issuer_;
     home_region = home_region_;
     status = status_;
     validity = validity_;
     beneficiary = beneficiary_;
     entitlements = entitlements_;
     consumption_configuration = consumption_configuration_;
     license_metadata = license_metadata_;
     create_time = create_time_;
     version = version_;
     received_metadata = received_metadata_;
   }
    : granted_license)

let make_list_received_licenses_for_organization_response
    ?licenses:(licenses_ : granted_license_list option) ?next_token:(next_token_ : string_ option)
    () =
  ({ licenses = licenses_; next_token = next_token_ }
    : list_received_licenses_for_organization_response)

let make_list_received_licenses_for_organization_request ?filters:(filters_ : filter_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : max_size100 option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_received_licenses_for_organization_request)

let make_list_received_licenses_response ?licenses:(licenses_ : granted_license_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ licenses = licenses_; next_token = next_token_ } : list_received_licenses_response)

let make_list_received_licenses_request ?license_arns:(license_arns_ : arn_list option)
    ?filters:(filters_ : filter_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) () =
  ({
     license_arns = license_arns_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_received_licenses_request)

let make_options
    ?activation_override_behavior:
      (activation_override_behavior_ : activation_override_behavior option) () =
  ({ activation_override_behavior = activation_override_behavior_ } : options)

let make_grant ?status_reason:(status_reason_ : status_reason_message option)
    ?options:(options_ : options option) ~grant_arn:(grant_arn_ : arn)
    ~grant_name:(grant_name_ : string_) ~parent_arn:(parent_arn_ : arn)
    ~license_arn:(license_arn_ : arn) ~grantee_principal_arn:(grantee_principal_arn_ : arn)
    ~home_region:(home_region_ : string_) ~grant_status:(grant_status_ : grant_status)
    ~version:(version_ : string_) ~granted_operations:(granted_operations_ : allowed_operation_list)
    () =
  ({
     grant_arn = grant_arn_;
     grant_name = grant_name_;
     parent_arn = parent_arn_;
     license_arn = license_arn_;
     grantee_principal_arn = grantee_principal_arn_;
     home_region = home_region_;
     grant_status = grant_status_;
     status_reason = status_reason_;
     version = version_;
     granted_operations = granted_operations_;
     options = options_;
   }
    : grant)

let make_list_received_grants_for_organization_response ?grants:(grants_ : grant_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ grants = grants_; next_token = next_token_ } : list_received_grants_for_organization_response)

let make_list_received_grants_for_organization_request ?filters:(filters_ : filter_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : max_size100 option)
    ~license_arn:(license_arn_ : arn) () =
  ({
     license_arn = license_arn_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_received_grants_for_organization_request)

let make_list_received_grants_response ?grants:(grants_ : grant_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ grants = grants_; next_token = next_token_ } : list_received_grants_response)

let make_list_received_grants_request ?grant_arns:(grant_arns_ : arn_list option)
    ?filters:(filters_ : filter_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) () =
  ({
     grant_arns = grant_arns_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_received_grants_request)

let make_license ?license_arn:(license_arn_ : arn option)
    ?license_name:(license_name_ : string_ option) ?product_name:(product_name_ : string_ option)
    ?product_sk_u:(product_sk_u_ : string_ option) ?issuer:(issuer_ : issuer_details option)
    ?home_region:(home_region_ : string_ option) ?status:(status_ : license_status option)
    ?validity:(validity_ : datetime_range option) ?beneficiary:(beneficiary_ : string_ option)
    ?entitlements:(entitlements_ : entitlement_list option)
    ?consumption_configuration:(consumption_configuration_ : consumption_configuration option)
    ?license_metadata:(license_metadata_ : metadata_list option)
    ?create_time:(create_time_ : iso8601_date_time option) ?version:(version_ : string_ option) () =
  ({
     license_arn = license_arn_;
     license_name = license_name_;
     product_name = product_name_;
     product_sk_u = product_sk_u_;
     issuer = issuer_;
     home_region = home_region_;
     status = status_;
     validity = validity_;
     beneficiary = beneficiary_;
     entitlements = entitlements_;
     consumption_configuration = consumption_configuration_;
     license_metadata = license_metadata_;
     create_time = create_time_;
     version = version_;
   }
    : license)

let make_list_license_versions_response ?licenses:(licenses_ : license_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ licenses = licenses_; next_token = next_token_ } : list_license_versions_response)

let make_list_license_versions_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) ~license_arn:(license_arn_ : arn) () =
  ({ license_arn = license_arn_; next_token = next_token_; max_results = max_results_ }
    : list_license_versions_request)

let make_list_license_specifications_for_resource_response
    ?license_specifications:(license_specifications_ : license_specifications option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_specifications = license_specifications_; next_token = next_token_ }
    : list_license_specifications_for_resource_response)

let make_list_license_specifications_for_resource_request
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_; max_results = max_results_; next_token = next_token_ }
    : list_license_specifications_for_resource_request)

let make_list_licenses_response ?licenses:(licenses_ : license_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ licenses = licenses_; next_token = next_token_ } : list_licenses_response)

let make_list_licenses_request ?license_arns:(license_arns_ : arn_list option)
    ?filters:(filters_ : filter_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) () =
  ({
     license_arns = license_arns_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_licenses_request)

let make_s3_location ?bucket:(bucket_ : string_ option) ?key_prefix:(key_prefix_ : string_ option)
    () =
  ({ bucket = bucket_; key_prefix = key_prefix_ } : s3_location)

let make_report_generator ?report_generator_name:(report_generator_name_ : string_ option)
    ?report_type:(report_type_ : report_type_list option)
    ?report_context:(report_context_ : report_context option)
    ?report_frequency:(report_frequency_ : report_frequency option)
    ?license_manager_report_generator_arn:(license_manager_report_generator_arn_ : string_ option)
    ?last_run_status:(last_run_status_ : string_ option)
    ?last_run_failure_reason:(last_run_failure_reason_ : string_ option)
    ?last_report_generation_time:(last_report_generation_time_ : string_ option)
    ?report_creator_account:(report_creator_account_ : string_ option)
    ?description:(description_ : string_ option) ?s3_location:(s3_location_ : s3_location option)
    ?create_time:(create_time_ : string_ option) ?tags:(tags_ : tag_list option) () =
  ({
     report_generator_name = report_generator_name_;
     report_type = report_type_;
     report_context = report_context_;
     report_frequency = report_frequency_;
     license_manager_report_generator_arn = license_manager_report_generator_arn_;
     last_run_status = last_run_status_;
     last_run_failure_reason = last_run_failure_reason_;
     last_report_generation_time = last_report_generation_time_;
     report_creator_account = report_creator_account_;
     description = description_;
     s3_location = s3_location_;
     create_time = create_time_;
     tags = tags_;
   }
    : report_generator)

let make_list_license_manager_report_generators_response
    ?report_generators:(report_generators_ : report_generator_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ report_generators = report_generators_; next_token = next_token_ }
    : list_license_manager_report_generators_response)

let make_list_license_manager_report_generators_request ?filters:(filters_ : filter_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : max_size100 option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_license_manager_report_generators_request)

let make_product_code_list_item ~product_code_id:(product_code_id_ : product_code_id)
    ~product_code_type:(product_code_type_ : product_code_type) () =
  ({ product_code_id = product_code_id_; product_code_type = product_code_type_ }
    : product_code_list_item)

let make_license_conversion_context ?usage_operation:(usage_operation_ : usage_operation option)
    ?product_codes:(product_codes_ : product_code_list option) () =
  ({ usage_operation = usage_operation_; product_codes = product_codes_ }
    : license_conversion_context)

let make_license_conversion_task
    ?license_conversion_task_id:(license_conversion_task_id_ : license_conversion_task_id option)
    ?resource_arn:(resource_arn_ : string_ option)
    ?source_license_context:(source_license_context_ : license_conversion_context option)
    ?destination_license_context:(destination_license_context_ : license_conversion_context option)
    ?status:(status_ : license_conversion_task_status option)
    ?status_message:(status_message_ : string_ option) ?start_time:(start_time_ : date_time option)
    ?license_conversion_time:(license_conversion_time_ : date_time option)
    ?end_time:(end_time_ : date_time option) () =
  ({
     license_conversion_task_id = license_conversion_task_id_;
     resource_arn = resource_arn_;
     source_license_context = source_license_context_;
     destination_license_context = destination_license_context_;
     status = status_;
     status_message = status_message_;
     start_time = start_time_;
     license_conversion_time = license_conversion_time_;
     end_time = end_time_;
   }
    : license_conversion_task)

let make_list_license_conversion_tasks_response
    ?license_conversion_tasks:(license_conversion_tasks_ : license_conversion_tasks option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_conversion_tasks = license_conversion_tasks_; next_token = next_token_ }
    : list_license_conversion_tasks_response)

let make_list_license_conversion_tasks_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : box_integer option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_license_conversion_tasks_request)

let make_automated_discovery_information ?last_run_time:(last_run_time_ : date_time option) () =
  ({ last_run_time = last_run_time_ } : automated_discovery_information)

let make_managed_resource_summary ?resource_type:(resource_type_ : resource_type option)
    ?association_count:(association_count_ : box_long option) () =
  ({ resource_type = resource_type_; association_count = association_count_ }
    : managed_resource_summary)

let make_consumed_license_summary ?resource_type:(resource_type_ : resource_type option)
    ?consumed_licenses:(consumed_licenses_ : box_long option) () =
  ({ resource_type = resource_type_; consumed_licenses = consumed_licenses_ }
    : consumed_license_summary)

let make_license_configuration
    ?license_configuration_id:(license_configuration_id_ : string_ option)
    ?license_configuration_arn:(license_configuration_arn_ : string_ option)
    ?name:(name_ : string_ option) ?description:(description_ : string_ option)
    ?license_counting_type:(license_counting_type_ : license_counting_type option)
    ?license_rules:(license_rules_ : string_list option)
    ?license_count:(license_count_ : box_long option)
    ?license_count_hard_limit:(license_count_hard_limit_ : box_boolean option)
    ?disassociate_when_not_found:(disassociate_when_not_found_ : box_boolean option)
    ?consumed_licenses:(consumed_licenses_ : box_long option) ?status:(status_ : string_ option)
    ?owner_account_id:(owner_account_id_ : string_ option)
    ?consumed_license_summary_list:
      (consumed_license_summary_list_ : consumed_license_summary_list option)
    ?managed_resource_summary_list:
      (managed_resource_summary_list_ : managed_resource_summary_list option)
    ?product_information_list:(product_information_list_ : product_information_list option)
    ?automated_discovery_information:
      (automated_discovery_information_ : automated_discovery_information option)
    ?license_expiry:(license_expiry_ : box_long option) () =
  ({
     license_configuration_id = license_configuration_id_;
     license_configuration_arn = license_configuration_arn_;
     name = name_;
     description = description_;
     license_counting_type = license_counting_type_;
     license_rules = license_rules_;
     license_count = license_count_;
     license_count_hard_limit = license_count_hard_limit_;
     disassociate_when_not_found = disassociate_when_not_found_;
     consumed_licenses = consumed_licenses_;
     status = status_;
     owner_account_id = owner_account_id_;
     consumed_license_summary_list = consumed_license_summary_list_;
     managed_resource_summary_list = managed_resource_summary_list_;
     product_information_list = product_information_list_;
     automated_discovery_information = automated_discovery_information_;
     license_expiry = license_expiry_;
   }
    : license_configuration)

let make_list_license_configurations_for_organization_response
    ?license_configurations:(license_configurations_ : license_configurations option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_configurations = license_configurations_; next_token = next_token_ }
    : list_license_configurations_for_organization_response)

let make_list_license_configurations_for_organization_request
    ?license_configuration_arns:(license_configuration_arns_ : string_list option)
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ?filters:(filters_ : filters option) () =
  ({
     license_configuration_arns = license_configuration_arns_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_license_configurations_for_organization_request)

let make_list_license_configurations_response
    ?license_configurations:(license_configurations_ : license_configurations option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_configurations = license_configurations_; next_token = next_token_ }
    : list_license_configurations_response)

let make_list_license_configurations_request
    ?license_configuration_arns:(license_configuration_arns_ : string_list option)
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ?filters:(filters_ : filters option) () =
  ({
     license_configuration_arns = license_configuration_arns_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
   }
    : list_license_configurations_request)

let make_license_asset_ruleset ?description:(description_ : string_ option) ~name:(name_ : string_)
    ~rules:(rules_ : license_asset_rule_list)
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : arn) () =
  ({
     name = name_;
     description = description_;
     rules = rules_;
     license_asset_ruleset_arn = license_asset_ruleset_arn_;
   }
    : license_asset_ruleset)

let make_list_license_asset_rulesets_response
    ?license_asset_rulesets:(license_asset_rulesets_ : license_asset_ruleset_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_asset_rulesets = license_asset_rulesets_; next_token = next_token_ }
    : list_license_asset_rulesets_response)

let make_list_license_asset_rulesets_request ?filters:(filters_ : filters option)
    ?show_aws_managed_license_asset_rulesets:
      (show_aws_managed_license_asset_rulesets_ : boolean_ option)
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option) () =
  ({
     filters = filters_;
     show_aws_managed_license_asset_rulesets = show_aws_managed_license_asset_rulesets_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_license_asset_rulesets_request)

let make_license_asset_group ?description:(description_ : string_ option)
    ?license_asset_group_configurations:
      (license_asset_group_configurations_ : license_asset_group_configuration_list option)
    ?properties:(properties_ : license_asset_group_property_list option)
    ?status_message:(status_message_ : string_ option)
    ?latest_usage_analysis_time:(latest_usage_analysis_time_ : date_time option)
    ?latest_resource_discovery_time:(latest_resource_discovery_time_ : date_time option)
    ~name:(name_ : string_)
    ~associated_license_asset_ruleset_ar_ns:
      (associated_license_asset_ruleset_ar_ns_ : license_asset_ruleset_arn_list)
    ~license_asset_group_arn:(license_asset_group_arn_ : arn)
    ~status:(status_ : license_asset_group_status) () =
  ({
     name = name_;
     description = description_;
     license_asset_group_configurations = license_asset_group_configurations_;
     associated_license_asset_ruleset_ar_ns = associated_license_asset_ruleset_ar_ns_;
     properties = properties_;
     license_asset_group_arn = license_asset_group_arn_;
     status = status_;
     status_message = status_message_;
     latest_usage_analysis_time = latest_usage_analysis_time_;
     latest_resource_discovery_time = latest_resource_discovery_time_;
   }
    : license_asset_group)

let make_list_license_asset_groups_response
    ?license_asset_groups:(license_asset_groups_ : license_asset_group_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_asset_groups = license_asset_groups_; next_token = next_token_ }
    : list_license_asset_groups_response)

let make_list_license_asset_groups_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_license_asset_groups_request)

let make_license_operation_failure ?resource_arn:(resource_arn_ : string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?error_message:(error_message_ : string_ option)
    ?failure_time:(failure_time_ : date_time option)
    ?operation_name:(operation_name_ : string_ option)
    ?resource_owner_id:(resource_owner_id_ : string_ option)
    ?operation_requested_by:(operation_requested_by_ : string_ option)
    ?metadata_list:(metadata_list_ : metadata_list option) () =
  ({
     resource_arn = resource_arn_;
     resource_type = resource_type_;
     error_message = error_message_;
     failure_time = failure_time_;
     operation_name = operation_name_;
     resource_owner_id = resource_owner_id_;
     operation_requested_by = operation_requested_by_;
     metadata_list = metadata_list_;
   }
    : license_operation_failure)

let make_list_failures_for_license_configuration_operations_response
    ?license_operation_failure_list:
      (license_operation_failure_list_ : license_operation_failure_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ license_operation_failure_list = license_operation_failure_list_; next_token = next_token_ }
    : list_failures_for_license_configuration_operations_response)

let make_list_failures_for_license_configuration_operations_request
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({
     license_configuration_arn = license_configuration_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_failures_for_license_configuration_operations_request)

let make_list_distributed_grants_response ?grants:(grants_ : grant_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ grants = grants_; next_token = next_token_ } : list_distributed_grants_response)

let make_list_distributed_grants_request ?grant_arns:(grant_arns_ : arn_list option)
    ?filters:(filters_ : filter_list option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_size100 option) () =
  ({
     grant_arns = grant_arns_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_distributed_grants_request)

let make_license_configuration_association ?resource_arn:(resource_arn_ : string_ option)
    ?resource_type:(resource_type_ : resource_type option)
    ?resource_owner_id:(resource_owner_id_ : string_ option)
    ?association_time:(association_time_ : date_time option)
    ?ami_association_scope:(ami_association_scope_ : string_ option) () =
  ({
     resource_arn = resource_arn_;
     resource_type = resource_type_;
     resource_owner_id = resource_owner_id_;
     association_time = association_time_;
     ami_association_scope = ami_association_scope_;
   }
    : license_configuration_association)

let make_list_associations_for_license_configuration_response
    ?license_configuration_associations:
      (license_configuration_associations_ : license_configuration_associations option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     license_configuration_associations = license_configuration_associations_;
     next_token = next_token_;
   }
    : list_associations_for_license_configuration_response)

let make_list_associations_for_license_configuration_request
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({
     license_configuration_arn = license_configuration_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_associations_for_license_configuration_request)

let make_asset ?asset_arn:(asset_arn_ : string_ option)
    ?latest_asset_discovery_time:(latest_asset_discovery_time_ : date_time option) () =
  ({ asset_arn = asset_arn_; latest_asset_discovery_time = latest_asset_discovery_time_ } : asset)

let make_list_assets_for_license_asset_group_response ?assets:(assets_ : asset_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ assets = assets_; next_token = next_token_ } : list_assets_for_license_asset_group_response)

let make_list_assets_for_license_asset_group_request
    ?max_results:(max_results_ : box_integer option) ?next_token:(next_token_ : string_ option)
    ~license_asset_group_arn:(license_asset_group_arn_ : string_)
    ~asset_type:(asset_type_ : string_) () =
  ({
     license_asset_group_arn = license_asset_group_arn_;
     asset_type = asset_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_assets_for_license_asset_group_request)

let make_region_status ?status:(status_ : string_ option) () =
  ({ status = status_ } : region_status)

let make_cross_region_discovery_status ?message:(message_ : region_status_map option) () =
  ({ message = message_ } : cross_region_discovery_status)

let make_cross_account_discovery_service_status ?message:(message_ : string_ option) () =
  ({ message = message_ } : cross_account_discovery_service_status)

let make_service_status
    ?cross_account_discovery:
      (cross_account_discovery_ : cross_account_discovery_service_status option)
    ?cross_region_discovery:(cross_region_discovery_ : cross_region_discovery_status option) () =
  ({
     cross_account_discovery = cross_account_discovery_;
     cross_region_discovery = cross_region_discovery_;
   }
    : service_status)

let make_get_service_settings_response ?s3_bucket_arn:(s3_bucket_arn_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?organization_configuration:(organization_configuration_ : organization_configuration option)
    ?enable_cross_accounts_discovery:(enable_cross_accounts_discovery_ : box_boolean option)
    ?license_manager_resource_share_arn:(license_manager_resource_share_arn_ : string_ option)
    ?cross_region_discovery_home_region:(cross_region_discovery_home_region_ : string_ option)
    ?cross_region_discovery_source_regions:
      (cross_region_discovery_source_regions_ : string_list option)
    ?service_status:(service_status_ : service_status option) () =
  ({
     s3_bucket_arn = s3_bucket_arn_;
     sns_topic_arn = sns_topic_arn_;
     organization_configuration = organization_configuration_;
     enable_cross_accounts_discovery = enable_cross_accounts_discovery_;
     license_manager_resource_share_arn = license_manager_resource_share_arn_;
     cross_region_discovery_home_region = cross_region_discovery_home_region_;
     cross_region_discovery_source_regions = cross_region_discovery_source_regions_;
     service_status = service_status_;
   }
    : get_service_settings_response)

let make_get_service_settings_request () = (() : unit)

let make_entitlement_usage ?max_count:(max_count_ : string_ option) ~name:(name_ : string_)
    ~consumed_value:(consumed_value_ : string_) ~unit_:(unit__ : entitlement_data_unit) () =
  ({ name = name_; consumed_value = consumed_value_; max_count = max_count_; unit_ = unit__ }
    : entitlement_usage)

let make_license_usage ?entitlement_usages:(entitlement_usages_ : entitlement_usage_list option) ()
    =
  ({ entitlement_usages = entitlement_usages_ } : license_usage)

let make_get_license_usage_response ?license_usage:(license_usage_ : license_usage option) () =
  ({ license_usage = license_usage_ } : get_license_usage_response)

let make_get_license_usage_request ~license_arn:(license_arn_ : arn) () =
  ({ license_arn = license_arn_ } : get_license_usage_request)

let make_get_license_manager_report_generator_response
    ?report_generator:(report_generator_ : report_generator option) () =
  ({ report_generator = report_generator_ } : get_license_manager_report_generator_response)

let make_get_license_manager_report_generator_request
    ~license_manager_report_generator_arn:(license_manager_report_generator_arn_ : string_) () =
  ({ license_manager_report_generator_arn = license_manager_report_generator_arn_ }
    : get_license_manager_report_generator_request)

let make_get_license_conversion_task_response
    ?license_conversion_task_id:(license_conversion_task_id_ : license_conversion_task_id option)
    ?resource_arn:(resource_arn_ : string_ option)
    ?source_license_context:(source_license_context_ : license_conversion_context option)
    ?destination_license_context:(destination_license_context_ : license_conversion_context option)
    ?status_message:(status_message_ : string_ option)
    ?status:(status_ : license_conversion_task_status option)
    ?start_time:(start_time_ : date_time option)
    ?license_conversion_time:(license_conversion_time_ : date_time option)
    ?end_time:(end_time_ : date_time option) () =
  ({
     license_conversion_task_id = license_conversion_task_id_;
     resource_arn = resource_arn_;
     source_license_context = source_license_context_;
     destination_license_context = destination_license_context_;
     status_message = status_message_;
     status = status_;
     start_time = start_time_;
     license_conversion_time = license_conversion_time_;
     end_time = end_time_;
   }
    : get_license_conversion_task_response)

let make_get_license_conversion_task_request
    ~license_conversion_task_id:(license_conversion_task_id_ : license_conversion_task_id) () =
  ({ license_conversion_task_id = license_conversion_task_id_ }
    : get_license_conversion_task_request)

let make_get_license_configuration_response
    ?license_configuration_id:(license_configuration_id_ : string_ option)
    ?license_configuration_arn:(license_configuration_arn_ : string_ option)
    ?name:(name_ : string_ option) ?description:(description_ : string_ option)
    ?license_counting_type:(license_counting_type_ : license_counting_type option)
    ?license_rules:(license_rules_ : string_list option)
    ?license_count:(license_count_ : box_long option)
    ?license_count_hard_limit:(license_count_hard_limit_ : box_boolean option)
    ?consumed_licenses:(consumed_licenses_ : box_long option) ?status:(status_ : string_ option)
    ?owner_account_id:(owner_account_id_ : string_ option)
    ?consumed_license_summary_list:
      (consumed_license_summary_list_ : consumed_license_summary_list option)
    ?managed_resource_summary_list:
      (managed_resource_summary_list_ : managed_resource_summary_list option)
    ?tags:(tags_ : tag_list option)
    ?product_information_list:(product_information_list_ : product_information_list option)
    ?automated_discovery_information:
      (automated_discovery_information_ : automated_discovery_information option)
    ?disassociate_when_not_found:(disassociate_when_not_found_ : box_boolean option)
    ?license_expiry:(license_expiry_ : box_long option) () =
  ({
     license_configuration_id = license_configuration_id_;
     license_configuration_arn = license_configuration_arn_;
     name = name_;
     description = description_;
     license_counting_type = license_counting_type_;
     license_rules = license_rules_;
     license_count = license_count_;
     license_count_hard_limit = license_count_hard_limit_;
     consumed_licenses = consumed_licenses_;
     status = status_;
     owner_account_id = owner_account_id_;
     consumed_license_summary_list = consumed_license_summary_list_;
     managed_resource_summary_list = managed_resource_summary_list_;
     tags = tags_;
     product_information_list = product_information_list_;
     automated_discovery_information = automated_discovery_information_;
     disassociate_when_not_found = disassociate_when_not_found_;
     license_expiry = license_expiry_;
   }
    : get_license_configuration_response)

let make_get_license_configuration_request
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({ license_configuration_arn = license_configuration_arn_ } : get_license_configuration_request)

let make_get_license_asset_ruleset_response
    ~license_asset_ruleset:(license_asset_ruleset_ : license_asset_ruleset) () =
  ({ license_asset_ruleset = license_asset_ruleset_ } : get_license_asset_ruleset_response)

let make_get_license_asset_ruleset_request
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : arn) () =
  ({ license_asset_ruleset_arn = license_asset_ruleset_arn_ } : get_license_asset_ruleset_request)

let make_get_license_asset_group_response
    ~license_asset_group:(license_asset_group_ : license_asset_group) () =
  ({ license_asset_group = license_asset_group_ } : get_license_asset_group_response)

let make_get_license_asset_group_request ~license_asset_group_arn:(license_asset_group_arn_ : arn)
    () =
  ({ license_asset_group_arn = license_asset_group_arn_ } : get_license_asset_group_request)

let make_get_license_response ?license:(license_ : license option) () =
  ({ license = license_ } : get_license_response)

let make_get_license_request ?version:(version_ : string_ option) ~license_arn:(license_arn_ : arn)
    () =
  ({ license_arn = license_arn_; version = version_ } : get_license_request)

let make_get_grant_response ?grant:(grant_ : grant option) () =
  ({ grant = grant_ } : get_grant_response)

let make_get_grant_request ?version:(version_ : string_ option) ~grant_arn:(grant_arn_ : arn) () =
  ({ grant_arn = grant_arn_; version = version_ } : get_grant_request)

let make_get_access_token_response ?access_token:(access_token_ : token_string option) () =
  ({ access_token = access_token_ } : get_access_token_response)

let make_get_access_token_request
    ?token_properties:(token_properties_ : max_size3_string_list option)
    ~token:(token_ : token_string) () =
  ({ token = token_; token_properties = token_properties_ } : get_access_token_request)

let make_extend_license_consumption_response
    ?license_consumption_token:(license_consumption_token_ : string_ option)
    ?expiration:(expiration_ : iso8601_date_time option) () =
  ({ license_consumption_token = license_consumption_token_; expiration = expiration_ }
    : extend_license_consumption_response)

let make_extend_license_consumption_request ?dry_run:(dry_run_ : boolean_ option)
    ~license_consumption_token:(license_consumption_token_ : string_) () =
  ({ license_consumption_token = license_consumption_token_; dry_run = dry_run_ }
    : extend_license_consumption_request)

let make_delete_token_response () = (() : unit)

let make_delete_token_request ~token_id:(token_id_ : string_) () =
  ({ token_id = token_id_ } : delete_token_request)

let make_delete_license_manager_report_generator_response () = (() : unit)

let make_delete_license_manager_report_generator_request
    ~license_manager_report_generator_arn:(license_manager_report_generator_arn_ : string_) () =
  ({ license_manager_report_generator_arn = license_manager_report_generator_arn_ }
    : delete_license_manager_report_generator_request)

let make_delete_license_configuration_response () = (() : unit)

let make_delete_license_configuration_request
    ~license_configuration_arn:(license_configuration_arn_ : string_) () =
  ({ license_configuration_arn = license_configuration_arn_ }
    : delete_license_configuration_request)

let make_delete_license_asset_ruleset_response () = (() : unit)

let make_delete_license_asset_ruleset_request
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : arn) () =
  ({ license_asset_ruleset_arn = license_asset_ruleset_arn_ }
    : delete_license_asset_ruleset_request)

let make_delete_license_asset_group_response ~status:(status_ : license_asset_group_status) () =
  ({ status = status_ } : delete_license_asset_group_response)

let make_delete_license_asset_group_request
    ~license_asset_group_arn:(license_asset_group_arn_ : arn) () =
  ({ license_asset_group_arn = license_asset_group_arn_ } : delete_license_asset_group_request)

let make_delete_license_response ?status:(status_ : license_deletion_status option)
    ?deletion_date:(deletion_date_ : iso8601_date_time option) () =
  ({ status = status_; deletion_date = deletion_date_ } : delete_license_response)

let make_delete_license_request ~license_arn:(license_arn_ : arn)
    ~source_version:(source_version_ : string_) () =
  ({ license_arn = license_arn_; source_version = source_version_ } : delete_license_request)

let make_delete_grant_response ?grant_arn:(grant_arn_ : arn option)
    ?status:(status_ : grant_status option) ?version:(version_ : string_ option) () =
  ({ grant_arn = grant_arn_; status = status_; version = version_ } : delete_grant_response)

let make_delete_grant_request ?status_reason:(status_reason_ : status_reason_message option)
    ~grant_arn:(grant_arn_ : arn) ~version:(version_ : string_) () =
  ({ grant_arn = grant_arn_; status_reason = status_reason_; version = version_ }
    : delete_grant_request)

let make_create_token_response ?token_id:(token_id_ : string_ option)
    ?token_type:(token_type_ : token_type option) ?token:(token_ : token_string option) () =
  ({ token_id = token_id_; token_type = token_type_; token = token_ } : create_token_response)

let make_create_token_request ?role_arns:(role_arns_ : arn_list option)
    ?expiration_in_days:(expiration_in_days_ : integer option)
    ?token_properties:(token_properties_ : max_size3_string_list option)
    ~license_arn:(license_arn_ : arn) ~client_token:(client_token_ : client_token) () =
  ({
     license_arn = license_arn_;
     role_arns = role_arns_;
     expiration_in_days = expiration_in_days_;
     token_properties = token_properties_;
     client_token = client_token_;
   }
    : create_token_request)

let make_create_license_version_response ?license_arn:(license_arn_ : arn option)
    ?version:(version_ : string_ option) ?status:(status_ : license_status option) () =
  ({ license_arn = license_arn_; version = version_; status = status_ }
    : create_license_version_response)

let make_issuer ?sign_key:(sign_key_ : string_ option) ~name:(name_ : string_) () =
  ({ name = name_; sign_key = sign_key_ } : issuer)

let make_create_license_version_request ?license_metadata:(license_metadata_ : metadata_list option)
    ?source_version:(source_version_ : string_ option) ~license_arn:(license_arn_ : arn)
    ~license_name:(license_name_ : string_) ~product_name:(product_name_ : string_)
    ~issuer:(issuer_ : issuer) ~home_region:(home_region_ : string_)
    ~validity:(validity_ : datetime_range) ~entitlements:(entitlements_ : entitlement_list)
    ~consumption_configuration:(consumption_configuration_ : consumption_configuration)
    ~status:(status_ : license_status) ~client_token:(client_token_ : client_token) () =
  ({
     license_arn = license_arn_;
     license_name = license_name_;
     product_name = product_name_;
     issuer = issuer_;
     home_region = home_region_;
     validity = validity_;
     license_metadata = license_metadata_;
     entitlements = entitlements_;
     consumption_configuration = consumption_configuration_;
     status = status_;
     client_token = client_token_;
     source_version = source_version_;
   }
    : create_license_version_request)

let make_create_license_manager_report_generator_response
    ?license_manager_report_generator_arn:(license_manager_report_generator_arn_ : string_ option)
    () =
  ({ license_manager_report_generator_arn = license_manager_report_generator_arn_ }
    : create_license_manager_report_generator_response)

let make_create_license_manager_report_generator_request
    ?description:(description_ : string_ option) ?tags:(tags_ : tag_list option)
    ~report_generator_name:(report_generator_name_ : report_generator_name)
    ~type_:(type__ : report_type_list) ~report_context:(report_context_ : report_context)
    ~report_frequency:(report_frequency_ : report_frequency)
    ~client_token:(client_token_ : client_request_token) () =
  ({
     report_generator_name = report_generator_name_;
     type_ = type__;
     report_context = report_context_;
     report_frequency = report_frequency_;
     client_token = client_token_;
     description = description_;
     tags = tags_;
   }
    : create_license_manager_report_generator_request)

let make_create_license_conversion_task_for_resource_response
    ?license_conversion_task_id:(license_conversion_task_id_ : license_conversion_task_id option) ()
    =
  ({ license_conversion_task_id = license_conversion_task_id_ }
    : create_license_conversion_task_for_resource_response)

let make_create_license_conversion_task_for_resource_request ~resource_arn:(resource_arn_ : arn)
    ~source_license_context:(source_license_context_ : license_conversion_context)
    ~destination_license_context:(destination_license_context_ : license_conversion_context) () =
  ({
     resource_arn = resource_arn_;
     source_license_context = source_license_context_;
     destination_license_context = destination_license_context_;
   }
    : create_license_conversion_task_for_resource_request)

let make_create_license_configuration_response
    ?license_configuration_arn:(license_configuration_arn_ : string_ option) () =
  ({ license_configuration_arn = license_configuration_arn_ }
    : create_license_configuration_response)

let make_create_license_configuration_request ?description:(description_ : string_ option)
    ?license_count:(license_count_ : box_long option)
    ?license_count_hard_limit:(license_count_hard_limit_ : box_boolean option)
    ?license_rules:(license_rules_ : string_list option) ?tags:(tags_ : tag_list option)
    ?disassociate_when_not_found:(disassociate_when_not_found_ : box_boolean option)
    ?product_information_list:(product_information_list_ : product_information_list option)
    ?license_expiry:(license_expiry_ : box_long option) ~name:(name_ : string_)
    ~license_counting_type:(license_counting_type_ : license_counting_type) () =
  ({
     name = name_;
     description = description_;
     license_counting_type = license_counting_type_;
     license_count = license_count_;
     license_count_hard_limit = license_count_hard_limit_;
     license_rules = license_rules_;
     tags = tags_;
     disassociate_when_not_found = disassociate_when_not_found_;
     product_information_list = product_information_list_;
     license_expiry = license_expiry_;
   }
    : create_license_configuration_request)

let make_create_license_asset_ruleset_response
    ~license_asset_ruleset_arn:(license_asset_ruleset_arn_ : string_) () =
  ({ license_asset_ruleset_arn = license_asset_ruleset_arn_ }
    : create_license_asset_ruleset_response)

let make_create_license_asset_ruleset_request
    ?description:(description_ : license_asset_resource_description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : license_asset_resource_name)
    ~rules:(rules_ : license_asset_rule_list) ~client_token:(client_token_ : string_) () =
  ({
     name = name_;
     description = description_;
     rules = rules_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_license_asset_ruleset_request)

let make_create_license_asset_group_response
    ~license_asset_group_arn:(license_asset_group_arn_ : string_) ~status:(status_ : string_) () =
  ({ license_asset_group_arn = license_asset_group_arn_; status = status_ }
    : create_license_asset_group_response)

let make_create_license_asset_group_request
    ?description:(description_ : license_asset_resource_description option)
    ?properties:(properties_ : license_asset_group_property_list option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : license_asset_resource_name)
    ~license_asset_group_configurations:
      (license_asset_group_configurations_ : license_asset_group_configuration_list)
    ~associated_license_asset_ruleset_ar_ns:
      (associated_license_asset_ruleset_ar_ns_ : license_asset_ruleset_arn_list)
    ~client_token:(client_token_ : string_) () =
  ({
     name = name_;
     description = description_;
     license_asset_group_configurations = license_asset_group_configurations_;
     associated_license_asset_ruleset_ar_ns = associated_license_asset_ruleset_ar_ns_;
     properties = properties_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_license_asset_group_request)

let make_create_license_response ?license_arn:(license_arn_ : arn option)
    ?status:(status_ : license_status option) ?version:(version_ : string_ option) () =
  ({ license_arn = license_arn_; status = status_; version = version_ } : create_license_response)

let make_create_license_request ?license_metadata:(license_metadata_ : metadata_list option)
    ?tags:(tags_ : tag_list option) ~license_name:(license_name_ : string_)
    ~product_name:(product_name_ : string_) ~product_sk_u:(product_sk_u_ : string_)
    ~issuer:(issuer_ : issuer) ~home_region:(home_region_ : string_)
    ~validity:(validity_ : datetime_range) ~entitlements:(entitlements_ : entitlement_list)
    ~beneficiary:(beneficiary_ : string_)
    ~consumption_configuration:(consumption_configuration_ : consumption_configuration)
    ~client_token:(client_token_ : client_token) () =
  ({
     license_name = license_name_;
     product_name = product_name_;
     product_sk_u = product_sk_u_;
     issuer = issuer_;
     home_region = home_region_;
     validity = validity_;
     entitlements = entitlements_;
     beneficiary = beneficiary_;
     consumption_configuration = consumption_configuration_;
     license_metadata = license_metadata_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_license_request)

let make_create_grant_version_response ?grant_arn:(grant_arn_ : arn option)
    ?status:(status_ : grant_status option) ?version:(version_ : string_ option) () =
  ({ grant_arn = grant_arn_; status = status_; version = version_ } : create_grant_version_response)

let make_create_grant_version_request ?grant_name:(grant_name_ : string_ option)
    ?allowed_operations:(allowed_operations_ : allowed_operation_list option)
    ?status:(status_ : grant_status option)
    ?status_reason:(status_reason_ : status_reason_message option)
    ?source_version:(source_version_ : string_ option) ?options:(options_ : options option)
    ~client_token:(client_token_ : client_token) ~grant_arn:(grant_arn_ : arn) () =
  ({
     client_token = client_token_;
     grant_arn = grant_arn_;
     grant_name = grant_name_;
     allowed_operations = allowed_operations_;
     status = status_;
     status_reason = status_reason_;
     source_version = source_version_;
     options = options_;
   }
    : create_grant_version_request)

let make_create_grant_response ?grant_arn:(grant_arn_ : arn option)
    ?status:(status_ : grant_status option) ?version:(version_ : string_ option) () =
  ({ grant_arn = grant_arn_; status = status_; version = version_ } : create_grant_response)

let make_create_grant_request ?tags:(tags_ : tag_list option)
    ~client_token:(client_token_ : client_token) ~grant_name:(grant_name_ : string_)
    ~license_arn:(license_arn_ : arn) ~principals:(principals_ : principal_arn_list)
    ~home_region:(home_region_ : string_)
    ~allowed_operations:(allowed_operations_ : allowed_operation_list) () =
  ({
     client_token = client_token_;
     grant_name = grant_name_;
     license_arn = license_arn_;
     principals = principals_;
     home_region = home_region_;
     allowed_operations = allowed_operations_;
     tags = tags_;
   }
    : create_grant_request)

let make_entitlement_data ?value:(value_ : string_ option) ~name:(name_ : string_)
    ~unit_:(unit__ : entitlement_data_unit) () =
  ({ name = name_; value = value_; unit_ = unit__ } : entitlement_data)

let make_checkout_license_response ?checkout_type:(checkout_type_ : checkout_type option)
    ?license_consumption_token:(license_consumption_token_ : string_ option)
    ?entitlements_allowed:(entitlements_allowed_ : entitlement_data_list option)
    ?signed_token:(signed_token_ : signed_token option) ?node_id:(node_id_ : string_ option)
    ?issued_at:(issued_at_ : iso8601_date_time option)
    ?expiration:(expiration_ : iso8601_date_time option)
    ?license_arn:(license_arn_ : string_ option) () =
  ({
     checkout_type = checkout_type_;
     license_consumption_token = license_consumption_token_;
     entitlements_allowed = entitlements_allowed_;
     signed_token = signed_token_;
     node_id = node_id_;
     issued_at = issued_at_;
     expiration = expiration_;
     license_arn = license_arn_;
   }
    : checkout_license_response)

let make_checkout_license_request ?beneficiary:(beneficiary_ : string_ option)
    ?node_id:(node_id_ : string_ option) ~product_sk_u:(product_sk_u_ : string_)
    ~checkout_type:(checkout_type_ : checkout_type) ~key_fingerprint:(key_fingerprint_ : string_)
    ~entitlements:(entitlements_ : entitlement_data_list)
    ~client_token:(client_token_ : client_token) () =
  ({
     product_sk_u = product_sk_u_;
     checkout_type = checkout_type_;
     key_fingerprint = key_fingerprint_;
     entitlements = entitlements_;
     client_token = client_token_;
     beneficiary = beneficiary_;
     node_id = node_id_;
   }
    : checkout_license_request)

let make_checkout_borrow_license_response ?license_arn:(license_arn_ : arn option)
    ?license_consumption_token:(license_consumption_token_ : string_ option)
    ?entitlements_allowed:(entitlements_allowed_ : entitlement_data_list option)
    ?node_id:(node_id_ : string_ option) ?signed_token:(signed_token_ : signed_token option)
    ?issued_at:(issued_at_ : iso8601_date_time option)
    ?expiration:(expiration_ : iso8601_date_time option)
    ?checkout_metadata:(checkout_metadata_ : metadata_list option) () =
  ({
     license_arn = license_arn_;
     license_consumption_token = license_consumption_token_;
     entitlements_allowed = entitlements_allowed_;
     node_id = node_id_;
     signed_token = signed_token_;
     issued_at = issued_at_;
     expiration = expiration_;
     checkout_metadata = checkout_metadata_;
   }
    : checkout_borrow_license_response)

let make_checkout_borrow_license_request ?node_id:(node_id_ : string_ option)
    ?checkout_metadata:(checkout_metadata_ : metadata_list option) ~license_arn:(license_arn_ : arn)
    ~entitlements:(entitlements_ : entitlement_data_list)
    ~digital_signature_method:(digital_signature_method_ : digital_signature_method)
    ~client_token:(client_token_ : client_token) () =
  ({
     license_arn = license_arn_;
     entitlements = entitlements_;
     digital_signature_method = digital_signature_method_;
     node_id = node_id_;
     checkout_metadata = checkout_metadata_;
     client_token = client_token_;
   }
    : checkout_borrow_license_request)

let make_check_in_license_response () = (() : unit)

let make_check_in_license_request ?beneficiary:(beneficiary_ : string_ option)
    ~license_consumption_token:(license_consumption_token_ : string_) () =
  ({ license_consumption_token = license_consumption_token_; beneficiary = beneficiary_ }
    : check_in_license_request)

let make_accept_grant_response ?grant_arn:(grant_arn_ : arn option)
    ?status:(status_ : grant_status option) ?version:(version_ : string_ option) () =
  ({ grant_arn = grant_arn_; status = status_; version = version_ } : accept_grant_response)

let make_accept_grant_request ~grant_arn:(grant_arn_ : arn) () =
  ({ grant_arn = grant_arn_ } : accept_grant_request)
