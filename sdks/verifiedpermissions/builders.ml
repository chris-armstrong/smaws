open Types

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~tags:(tags_ : tag_map)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_validation_settings ~mode:(mode_ : validation_mode) () =
  ({ mode = mode_ } : validation_settings)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~path:(path_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; path = path_ } : validation_exception_field)

let make_update_static_policy_definition
    ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ statement = statement_; description = description_ } : update_static_policy_definition)

let make_update_policy_template_output ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     policy_template_id = policy_template_id_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_template_output)

let make_update_policy_template_input ?name:(name_ : policy_template_name option)
    ?description:(description_ : policy_template_description option)
    ~statement:(statement_ : policy_statement)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     statement = statement_;
     description = description_;
     policy_template_id = policy_template_id_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_template_input)

let make_resource_conflict ~resource_type:(resource_type_ : resource_type)
    ~resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : resource_conflict)

let make_update_policy_store_output ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~arn:(arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     arn = arn_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_store_output)

let make_update_policy_store_input ?description:(description_ : policy_store_description option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ~validation_settings:(validation_settings_ : validation_settings)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     description = description_;
     deletion_protection = deletion_protection_;
     validation_settings = validation_settings_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_store_input)

let make_entity_identifier ~entity_id:(entity_id_ : entity_id)
    ~entity_type:(entity_type_ : entity_type) () =
  ({ entity_id = entity_id_; entity_type = entity_type_ } : entity_identifier)

let make_action_identifier ~action_id:(action_id_ : action_id)
    ~action_type:(action_type_ : action_type) () =
  ({ action_id = action_id_; action_type = action_type_ } : action_identifier)

let make_update_policy_output ?effect_:(effect__ : policy_effect option)
    ?actions:(actions_ : action_identifier_list option)
    ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~policy_type:(policy_type_ : policy_type)
    ~policy_id:(policy_id_ : policy_id) ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     effect_ = effect__;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     actions = actions_;
     resource = resource_;
     principal = principal_;
     policy_type = policy_type_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_output)

let make_update_policy_input ?name:(name_ : policy_name option)
    ?definition:(definition_ : update_policy_definition option) ~policy_id:(policy_id_ : policy_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     definition = definition_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : update_policy_input)

let make_update_open_id_connect_access_token_configuration
    ?audiences:(audiences_ : audiences option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ audiences = audiences_; principal_id_claim = principal_id_claim_ }
    : update_open_id_connect_access_token_configuration)

let make_update_open_id_connect_identity_token_configuration
    ?client_ids:(client_ids_ : client_ids option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ client_ids = client_ids_; principal_id_claim = principal_id_claim_ }
    : update_open_id_connect_identity_token_configuration)

let make_update_open_id_connect_group_configuration
    ~group_entity_type:(group_entity_type_ : group_entity_type) ~group_claim:(group_claim_ : claim)
    () =
  ({ group_entity_type = group_entity_type_; group_claim = group_claim_ }
    : update_open_id_connect_group_configuration)

let make_update_open_id_connect_configuration
    ?group_configuration:(group_configuration_ : update_open_id_connect_group_configuration option)
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ~token_selection:(token_selection_ : update_open_id_connect_token_selection)
    ~issuer:(issuer_ : issuer) () =
  ({
     token_selection = token_selection_;
     group_configuration = group_configuration_;
     entity_id_prefix = entity_id_prefix_;
     issuer = issuer_;
   }
    : update_open_id_connect_configuration)

let make_update_identity_source_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~created_date:(created_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     last_updated_date = last_updated_date_;
     identity_source_id = identity_source_id_;
     created_date = created_date_;
   }
    : update_identity_source_output)

let make_update_cognito_group_configuration
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_entity_type = group_entity_type_ } : update_cognito_group_configuration)

let make_update_cognito_user_pool_configuration
    ?group_configuration:(group_configuration_ : update_cognito_group_configuration option)
    ?client_ids:(client_ids_ : client_ids option) ~user_pool_arn:(user_pool_arn_ : user_pool_arn) ()
    =
  ({
     group_configuration = group_configuration_;
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
   }
    : update_cognito_user_pool_configuration)

let make_update_identity_source_input
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option)
    ~update_configuration:(update_configuration_ : update_configuration)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     principal_entity_type = principal_entity_type_;
     update_configuration = update_configuration_;
     identity_source_id = identity_source_id_;
     policy_store_id = policy_store_id_;
   }
    : update_identity_source_input)

let make_template_linked_policy_definition_item ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ resource = resource_; principal = principal_; policy_template_id = policy_template_id_ }
    : template_linked_policy_definition_item)

let make_template_linked_policy_definition_detail ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ resource = resource_; principal = principal_; policy_template_id = policy_template_id_ }
    : template_linked_policy_definition_detail)

let make_template_linked_policy_definition ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ resource = resource_; principal = principal_; policy_template_id = policy_template_id_ }
    : template_linked_policy_definition)

let make_static_policy_definition_item
    ?description:(description_ : static_policy_description option) () =
  ({ description = description_ } : static_policy_definition_item)

let make_static_policy_definition_detail
    ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ statement = statement_; description = description_ } : static_policy_definition_detail)

let make_static_policy_definition ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ statement = statement_; description = description_ } : static_policy_definition)

let make_put_schema_output ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~namespaces:(namespaces_ : namespace_list)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     namespaces = namespaces_;
     policy_store_id = policy_store_id_;
   }
    : put_schema_output)

let make_put_schema_input ~definition:(definition_ : schema_definition)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ definition = definition_; policy_store_id = policy_store_id_ } : put_schema_input)

let make_policy_template_item ?name:(name_ : policy_template_name option)
    ?description:(description_ : policy_template_description option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     description = description_;
     policy_template_id = policy_template_id_;
     policy_store_id = policy_store_id_;
   }
    : policy_template_item)

let make_policy_store_item ?description:(description_ : policy_store_description option)
    ?last_updated_date:(last_updated_date_ : timestamp_format option)
    ~created_date:(created_date_ : timestamp_format) ~arn:(arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     description = description_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     arn = arn_;
     policy_store_id = policy_store_id_;
   }
    : policy_store_item)

let make_policy_store_alias_item ~state:(state_ : alias_state)
    ~created_at:(created_at_ : timestamp_format) ~alias_arn:(alias_arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~alias_name:(alias_name_ : alias) () =
  ({
     state = state_;
     created_at = created_at_;
     alias_arn = alias_arn_;
     policy_store_id = policy_store_id_;
     alias_name = alias_name_;
   }
    : policy_store_alias_item)

let make_policy_store_alias_filter ?policy_store_id:(policy_store_id_ : policy_store_id option) () =
  ({ policy_store_id = policy_store_id_ } : policy_store_alias_filter)

let make_policy_item ?name:(name_ : policy_name option) ?effect_:(effect__ : policy_effect option)
    ?actions:(actions_ : action_identifier_list option)
    ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~definition:(definition_ : policy_definition_item) ~policy_type:(policy_type_ : policy_type)
    ~policy_id:(policy_id_ : policy_id) ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     effect_ = effect__;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     definition = definition_;
     actions = actions_;
     resource = resource_;
     principal = principal_;
     policy_type = policy_type_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : policy_item)

let make_policy_filter ?policy_template_id:(policy_template_id_ : policy_template_id option)
    ?policy_type:(policy_type_ : policy_type option) ?resource:(resource_ : entity_reference option)
    ?principal:(principal_ : entity_reference option) () =
  ({
     policy_template_id = policy_template_id_;
     policy_type = policy_type_;
     resource = resource_;
     principal = principal_;
   }
    : policy_filter)

let make_open_id_connect_access_token_configuration_item ?audiences:(audiences_ : audiences option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ audiences = audiences_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_access_token_configuration_item)

let make_open_id_connect_identity_token_configuration_item
    ?client_ids:(client_ids_ : client_ids option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ client_ids = client_ids_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_identity_token_configuration_item)

let make_open_id_connect_access_token_configuration_detail
    ?audiences:(audiences_ : audiences option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ audiences = audiences_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_access_token_configuration_detail)

let make_open_id_connect_identity_token_configuration_detail
    ?client_ids:(client_ids_ : client_ids option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ client_ids = client_ids_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_identity_token_configuration_detail)

let make_open_id_connect_access_token_configuration ?audiences:(audiences_ : audiences option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ audiences = audiences_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_access_token_configuration)

let make_open_id_connect_identity_token_configuration ?client_ids:(client_ids_ : client_ids option)
    ?principal_id_claim:(principal_id_claim_ : claim option) () =
  ({ client_ids = client_ids_; principal_id_claim = principal_id_claim_ }
    : open_id_connect_identity_token_configuration)

let make_open_id_connect_group_configuration_item
    ~group_entity_type:(group_entity_type_ : group_entity_type) ~group_claim:(group_claim_ : claim)
    () =
  ({ group_entity_type = group_entity_type_; group_claim = group_claim_ }
    : open_id_connect_group_configuration_item)

let make_open_id_connect_group_configuration_detail
    ~group_entity_type:(group_entity_type_ : group_entity_type) ~group_claim:(group_claim_ : claim)
    () =
  ({ group_entity_type = group_entity_type_; group_claim = group_claim_ }
    : open_id_connect_group_configuration_detail)

let make_open_id_connect_group_configuration
    ~group_entity_type:(group_entity_type_ : group_entity_type) ~group_claim:(group_claim_ : claim)
    () =
  ({ group_entity_type = group_entity_type_; group_claim = group_claim_ }
    : open_id_connect_group_configuration)

let make_open_id_connect_configuration_item
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration_item option)
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ~token_selection:(token_selection_ : open_id_connect_token_selection_item)
    ~issuer:(issuer_ : issuer) () =
  ({
     token_selection = token_selection_;
     group_configuration = group_configuration_;
     entity_id_prefix = entity_id_prefix_;
     issuer = issuer_;
   }
    : open_id_connect_configuration_item)

let make_open_id_connect_configuration_detail
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration_detail option)
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ~token_selection:(token_selection_ : open_id_connect_token_selection_detail)
    ~issuer:(issuer_ : issuer) () =
  ({
     token_selection = token_selection_;
     group_configuration = group_configuration_;
     entity_id_prefix = entity_id_prefix_;
     issuer = issuer_;
   }
    : open_id_connect_configuration_detail)

let make_open_id_connect_configuration
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration option)
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ~token_selection:(token_selection_ : open_id_connect_token_selection) ~issuer:(issuer_ : issuer)
    () =
  ({
     token_selection = token_selection_;
     group_configuration = group_configuration_;
     entity_id_prefix = entity_id_prefix_;
     issuer = issuer_;
   }
    : open_id_connect_configuration)

let make_list_policy_templates_output ?next_token:(next_token_ : next_token option)
    ~policy_templates:(policy_templates_ : policy_templates_list) () =
  ({ policy_templates = policy_templates_; next_token = next_token_ }
    : list_policy_templates_output)

let make_list_policy_templates_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ max_results = max_results_; next_token = next_token_; policy_store_id = policy_store_id_ }
    : list_policy_templates_input)

let make_list_policy_stores_output ?next_token:(next_token_ : next_token option)
    ~policy_stores:(policy_stores_ : policy_store_list) () =
  ({ policy_stores = policy_stores_; next_token = next_token_ } : list_policy_stores_output)

let make_list_policy_stores_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_policy_stores_input)

let make_list_policy_store_aliases_output ?next_token:(next_token_ : next_token option)
    ~policy_store_aliases:(policy_store_aliases_ : policy_store_alias_list) () =
  ({ policy_store_aliases = policy_store_aliases_; next_token = next_token_ }
    : list_policy_store_aliases_output)

let make_list_policy_store_aliases_input ?filter:(filter_ : policy_store_alias_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filter = filter_; max_results = max_results_; next_token = next_token_ }
    : list_policy_store_aliases_input)

let make_list_policies_output ?next_token:(next_token_ : next_token option)
    ~policies:(policies_ : policy_list) () =
  ({ policies = policies_; next_token = next_token_ } : list_policies_output)

let make_list_policies_input ?filter:(filter_ : policy_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     policy_store_id = policy_store_id_;
   }
    : list_policies_input)

let make_identity_source_item_details ?open_id_issuer:(open_id_issuer_ : open_id_issuer option)
    ?discovery_url:(discovery_url_ : discovery_url option)
    ?user_pool_arn:(user_pool_arn_ : user_pool_arn option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({
     open_id_issuer = open_id_issuer_;
     discovery_url = discovery_url_;
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
   }
    : identity_source_item_details)

let make_cognito_group_configuration_item
    ?group_entity_type:(group_entity_type_ : group_entity_type option) () =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration_item)

let make_cognito_user_pool_configuration_item
    ?group_configuration:(group_configuration_ : cognito_group_configuration_item option)
    ~issuer:(issuer_ : issuer) ~client_ids:(client_ids_ : client_ids)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) () =
  ({
     group_configuration = group_configuration_;
     issuer = issuer_;
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
   }
    : cognito_user_pool_configuration_item)

let make_identity_source_item ?configuration:(configuration_ : configuration_item option)
    ?details:(details_ : identity_source_item_details option)
    ~principal_entity_type:(principal_entity_type_ : principal_entity_type)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~created_date:(created_date_ : timestamp_format) () =
  ({
     configuration = configuration_;
     principal_entity_type = principal_entity_type_;
     policy_store_id = policy_store_id_;
     last_updated_date = last_updated_date_;
     identity_source_id = identity_source_id_;
     details = details_;
     created_date = created_date_;
   }
    : identity_source_item)

let make_list_identity_sources_output ?next_token:(next_token_ : next_token option)
    ~identity_sources:(identity_sources_ : identity_sources) () =
  ({ identity_sources = identity_sources_; next_token = next_token_ }
    : list_identity_sources_output)

let make_identity_source_filter
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option) () =
  ({ principal_entity_type = principal_entity_type_ } : identity_source_filter)

let make_list_identity_sources_input ?filters:(filters_ : identity_source_filters option)
    ?max_results:(max_results_ : list_identity_sources_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     policy_store_id = policy_store_id_;
   }
    : list_identity_sources_input)

let make_kms_encryption_state ~encryption_context:(encryption_context_ : encryption_context)
    ~key:(key_ : kms_key) () =
  ({ encryption_context = encryption_context_; key = key_ } : kms_encryption_state)

let make_kms_encryption_settings
    ?encryption_context:(encryption_context_ : encryption_context option) ~key:(key_ : kms_key) () =
  ({ encryption_context = encryption_context_; key = key_ } : kms_encryption_settings)

let make_determining_policy_item ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : determining_policy_item)

let make_evaluation_error_item
    ~error_description:(error_description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ error_description = error_description_ } : evaluation_error_item)

let make_is_authorized_with_token_output ?principal:(principal_ : entity_identifier option)
    ~errors:(errors_ : evaluation_error_list)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~decision:(decision_ : decision) () =
  ({
     principal = principal_;
     errors = errors_;
     determining_policies = determining_policies_;
     decision = decision_;
   }
    : is_authorized_with_token_output)

let make_entity_item ?tags:(tags_ : entity_cedar_tags option)
    ?parents:(parents_ : parent_list option) ?attributes:(attributes_ : entity_attributes option)
    ~identifier:(identifier_ : entity_identifier) () =
  ({ tags = tags_; parents = parents_; attributes = attributes_; identifier = identifier_ }
    : entity_item)

let make_is_authorized_with_token_input ?entities:(entities_ : entities_definition option)
    ?context:(context_ : context_definition option) ?resource:(resource_ : entity_identifier option)
    ?action:(action_ : action_identifier option) ?access_token:(access_token_ : token option)
    ?identity_token:(identity_token_ : token option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     entities = entities_;
     context = context_;
     resource = resource_;
     action = action_;
     access_token = access_token_;
     identity_token = identity_token_;
     policy_store_id = policy_store_id_;
   }
    : is_authorized_with_token_input)

let make_is_authorized_output ~errors:(errors_ : evaluation_error_list)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~decision:(decision_ : decision) () =
  ({ errors = errors_; determining_policies = determining_policies_; decision = decision_ }
    : is_authorized_output)

let make_is_authorized_input ?entities:(entities_ : entities_definition option)
    ?context:(context_ : context_definition option) ?resource:(resource_ : entity_identifier option)
    ?action:(action_ : action_identifier option) ?principal:(principal_ : entity_identifier option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     entities = entities_;
     context = context_;
     resource = resource_;
     action = action_;
     principal = principal_;
     policy_store_id = policy_store_id_;
   }
    : is_authorized_input)

let make_identity_source_details ?open_id_issuer:(open_id_issuer_ : open_id_issuer option)
    ?discovery_url:(discovery_url_ : discovery_url option)
    ?user_pool_arn:(user_pool_arn_ : user_pool_arn option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({
     open_id_issuer = open_id_issuer_;
     discovery_url = discovery_url_;
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
   }
    : identity_source_details)

let make_get_schema_output ?namespaces:(namespaces_ : namespace_list option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~schema:(schema_ : schema_json)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     namespaces = namespaces_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     schema = schema_;
     policy_store_id = policy_store_id_;
   }
    : get_schema_output)

let make_get_schema_input ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_ } : get_schema_input)

let make_get_policy_template_output ?name:(name_ : policy_template_name option)
    ?description:(description_ : policy_template_description option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~statement:(statement_ : policy_statement)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     statement = statement_;
     description = description_;
     policy_template_id = policy_template_id_;
     policy_store_id = policy_store_id_;
   }
    : get_policy_template_output)

let make_get_policy_template_input ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_template_id = policy_template_id_; policy_store_id = policy_store_id_ }
    : get_policy_template_input)

let make_get_policy_store_output ?tags:(tags_ : tag_map option)
    ?cedar_version:(cedar_version_ : cedar_version option)
    ?encryption_state:(encryption_state_ : encryption_state option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?description:(description_ : policy_store_description option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~validation_settings:(validation_settings_ : validation_settings) ~arn:(arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     tags = tags_;
     cedar_version = cedar_version_;
     encryption_state = encryption_state_;
     deletion_protection = deletion_protection_;
     description = description_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     validation_settings = validation_settings_;
     arn = arn_;
     policy_store_id = policy_store_id_;
   }
    : get_policy_store_output)

let make_get_policy_store_input ?tags:(tags_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ tags = tags_; policy_store_id = policy_store_id_ } : get_policy_store_input)

let make_get_policy_store_alias_output ~state:(state_ : alias_state)
    ~created_at:(created_at_ : timestamp_format) ~alias_arn:(alias_arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~alias_name:(alias_name_ : alias) () =
  ({
     state = state_;
     created_at = created_at_;
     alias_arn = alias_arn_;
     policy_store_id = policy_store_id_;
     alias_name = alias_name_;
   }
    : get_policy_store_alias_output)

let make_get_policy_store_alias_input ~alias_name:(alias_name_ : alias) () =
  ({ alias_name = alias_name_ } : get_policy_store_alias_input)

let make_get_policy_output ?name:(name_ : policy_name option)
    ?effect_:(effect__ : policy_effect option) ?actions:(actions_ : action_identifier_list option)
    ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~definition:(definition_ : policy_definition_detail) ~policy_type:(policy_type_ : policy_type)
    ~policy_id:(policy_id_ : policy_id) ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     effect_ = effect__;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     definition = definition_;
     actions = actions_;
     resource = resource_;
     principal = principal_;
     policy_type = policy_type_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : get_policy_output)

let make_get_policy_input ~policy_id:(policy_id_ : policy_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_id = policy_id_; policy_store_id = policy_store_id_ } : get_policy_input)

let make_cognito_group_configuration_detail
    ?group_entity_type:(group_entity_type_ : group_entity_type option) () =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration_detail)

let make_cognito_user_pool_configuration_detail
    ?group_configuration:(group_configuration_ : cognito_group_configuration_detail option)
    ~issuer:(issuer_ : issuer) ~client_ids:(client_ids_ : client_ids)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) () =
  ({
     group_configuration = group_configuration_;
     issuer = issuer_;
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
   }
    : cognito_user_pool_configuration_detail)

let make_get_identity_source_output ?configuration:(configuration_ : configuration_detail option)
    ?details:(details_ : identity_source_details option)
    ~principal_entity_type:(principal_entity_type_ : principal_entity_type)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~created_date:(created_date_ : timestamp_format) () =
  ({
     configuration = configuration_;
     principal_entity_type = principal_entity_type_;
     policy_store_id = policy_store_id_;
     last_updated_date = last_updated_date_;
     identity_source_id = identity_source_id_;
     details = details_;
     created_date = created_date_;
   }
    : get_identity_source_output)

let make_get_identity_source_input ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ identity_source_id = identity_source_id_; policy_store_id = policy_store_id_ }
    : get_identity_source_input)

let make_delete_policy_template_output () = (() : unit)

let make_delete_policy_template_input ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_template_id = policy_template_id_; policy_store_id = policy_store_id_ }
    : delete_policy_template_input)

let make_delete_policy_store_output () = (() : unit)

let make_delete_policy_store_input ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_ } : delete_policy_store_input)

let make_delete_policy_store_alias_output () = (() : unit)

let make_delete_policy_store_alias_input ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ~alias_name:(alias_name_ : alias) () =
  ({ deletion_mode = deletion_mode_; alias_name = alias_name_ } : delete_policy_store_alias_input)

let make_delete_policy_output () = (() : unit)

let make_delete_policy_input ~policy_id:(policy_id_ : policy_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_id = policy_id_; policy_store_id = policy_store_id_ } : delete_policy_input)

let make_delete_identity_source_output () = (() : unit)

let make_delete_identity_source_input ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ identity_source_id = identity_source_id_; policy_store_id = policy_store_id_ }
    : delete_identity_source_input)

let make_create_policy_template_output ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     policy_template_id = policy_template_id_;
     policy_store_id = policy_store_id_;
   }
    : create_policy_template_output)

let make_create_policy_template_input ?name:(name_ : policy_template_name option)
    ?description:(description_ : policy_template_description option)
    ?client_token:(client_token_ : idempotency_token option)
    ~statement:(statement_ : policy_statement) ~policy_store_id:(policy_store_id_ : policy_store_id)
    () =
  ({
     name = name_;
     statement = statement_;
     description = description_;
     policy_store_id = policy_store_id_;
     client_token = client_token_;
   }
    : create_policy_template_input)

let make_create_policy_store_output ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~arn:(arn_ : resource_arn)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     arn = arn_;
     policy_store_id = policy_store_id_;
   }
    : create_policy_store_output)

let make_create_policy_store_input ?tags:(tags_ : tag_map option)
    ?encryption_settings:(encryption_settings_ : encryption_settings option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?description:(description_ : policy_store_description option)
    ?client_token:(client_token_ : idempotency_token option)
    ~validation_settings:(validation_settings_ : validation_settings) () =
  ({
     tags = tags_;
     encryption_settings = encryption_settings_;
     deletion_protection = deletion_protection_;
     description = description_;
     validation_settings = validation_settings_;
     client_token = client_token_;
   }
    : create_policy_store_input)

let make_create_policy_store_alias_output ~created_at:(created_at_ : timestamp_format)
    ~alias_arn:(alias_arn_ : resource_arn) ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~alias_name:(alias_name_ : alias) () =
  ({
     created_at = created_at_;
     alias_arn = alias_arn_;
     policy_store_id = policy_store_id_;
     alias_name = alias_name_;
   }
    : create_policy_store_alias_output)

let make_create_policy_store_alias_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~alias_name:(alias_name_ : alias) () =
  ({ policy_store_id = policy_store_id_; alias_name = alias_name_ }
    : create_policy_store_alias_input)

let make_create_policy_output ?effect_:(effect__ : policy_effect option)
    ?actions:(actions_ : action_identifier_list option)
    ?resource:(resource_ : entity_identifier option)
    ?principal:(principal_ : entity_identifier option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format) ~policy_type:(policy_type_ : policy_type)
    ~policy_id:(policy_id_ : policy_id) ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     effect_ = effect__;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     actions = actions_;
     resource = resource_;
     principal = principal_;
     policy_type = policy_type_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : create_policy_output)

let make_create_policy_input ?name:(name_ : policy_name option)
    ?client_token:(client_token_ : idempotency_token option)
    ~definition:(definition_ : policy_definition)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     definition = definition_;
     policy_store_id = policy_store_id_;
     client_token = client_token_;
   }
    : create_policy_input)

let make_create_identity_source_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~created_date:(created_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     last_updated_date = last_updated_date_;
     identity_source_id = identity_source_id_;
     created_date = created_date_;
   }
    : create_identity_source_output)

let make_cognito_group_configuration ~group_entity_type:(group_entity_type_ : group_entity_type) ()
    =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration)

let make_cognito_user_pool_configuration
    ?group_configuration:(group_configuration_ : cognito_group_configuration option)
    ?client_ids:(client_ids_ : client_ids option) ~user_pool_arn:(user_pool_arn_ : user_pool_arn) ()
    =
  ({
     group_configuration = group_configuration_;
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
   }
    : cognito_user_pool_configuration)

let make_create_identity_source_input
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option)
    ?client_token:(client_token_ : idempotency_token option)
    ~configuration:(configuration_ : configuration)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     principal_entity_type = principal_entity_type_;
     configuration = configuration_;
     policy_store_id = policy_store_id_;
     client_token = client_token_;
   }
    : create_identity_source_input)

let make_batch_is_authorized_with_token_input_item ?context:(context_ : context_definition option)
    ?resource:(resource_ : entity_identifier option) ?action:(action_ : action_identifier option) ()
    =
  ({ context = context_; resource = resource_; action = action_ }
    : batch_is_authorized_with_token_input_item)

let make_batch_is_authorized_with_token_output_item ~errors:(errors_ : evaluation_error_list)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~decision:(decision_ : decision) ~request:(request_ : batch_is_authorized_with_token_input_item)
    () =
  ({
     errors = errors_;
     determining_policies = determining_policies_;
     decision = decision_;
     request = request_;
   }
    : batch_is_authorized_with_token_output_item)

let make_batch_is_authorized_with_token_output ?principal:(principal_ : entity_identifier option)
    ~results:(results_ : batch_is_authorized_with_token_output_list) () =
  ({ results = results_; principal = principal_ } : batch_is_authorized_with_token_output)

let make_batch_is_authorized_with_token_input ?entities:(entities_ : entities_definition option)
    ?access_token:(access_token_ : token option) ?identity_token:(identity_token_ : token option)
    ~requests:(requests_ : batch_is_authorized_with_token_input_list)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     requests = requests_;
     entities = entities_;
     access_token = access_token_;
     identity_token = identity_token_;
     policy_store_id = policy_store_id_;
   }
    : batch_is_authorized_with_token_input)

let make_batch_is_authorized_input_item ?context:(context_ : context_definition option)
    ?resource:(resource_ : entity_identifier option) ?action:(action_ : action_identifier option)
    ?principal:(principal_ : entity_identifier option) () =
  ({ context = context_; resource = resource_; action = action_; principal = principal_ }
    : batch_is_authorized_input_item)

let make_batch_is_authorized_output_item ~errors:(errors_ : evaluation_error_list)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~decision:(decision_ : decision) ~request:(request_ : batch_is_authorized_input_item) () =
  ({
     errors = errors_;
     determining_policies = determining_policies_;
     decision = decision_;
     request = request_;
   }
    : batch_is_authorized_output_item)

let make_batch_is_authorized_output ~results:(results_ : batch_is_authorized_output_list) () =
  ({ results = results_ } : batch_is_authorized_output)

let make_batch_is_authorized_input ?entities:(entities_ : entities_definition option)
    ~requests:(requests_ : batch_is_authorized_input_list)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ requests = requests_; entities = entities_; policy_store_id = policy_store_id_ }
    : batch_is_authorized_input)

let make_batch_get_policy_output_item ?name:(name_ : policy_name option)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~created_date:(created_date_ : timestamp_format)
    ~definition:(definition_ : policy_definition_detail) ~policy_type:(policy_type_ : policy_type)
    ~policy_id:(policy_id_ : policy_id) ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     name = name_;
     last_updated_date = last_updated_date_;
     created_date = created_date_;
     definition = definition_;
     policy_type = policy_type_;
     policy_id = policy_id_;
     policy_store_id = policy_store_id_;
   }
    : batch_get_policy_output_item)

let make_batch_get_policy_error_item ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~policy_id:(policy_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~policy_store_id:(policy_store_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~code:(code_ : batch_get_policy_error_code) () =
  ({ message = message_; policy_id = policy_id_; policy_store_id = policy_store_id_; code = code_ }
    : batch_get_policy_error_item)

let make_batch_get_policy_output ~errors:(errors_ : batch_get_policy_error_list)
    ~results:(results_ : batch_get_policy_output_list) () =
  ({ errors = errors_; results = results_ } : batch_get_policy_output)

let make_batch_get_policy_input_item ~policy_id:(policy_id_ : policy_id)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_id = policy_id_; policy_store_id = policy_store_id_ } : batch_get_policy_input_item)

let make_batch_get_policy_input ~requests:(requests_ : batch_get_policy_input_list) () =
  ({ requests = requests_ } : batch_get_policy_input)
