open Types

let make_action_identifier ~action_type:(action_type_ : action_type)
    ~action_id:(action_id_ : action_id) () =
  ({ action_type = action_type_; action_id = action_id_ } : action_identifier)

let make_entity_identifier ~entity_type:(entity_type_ : entity_type)
    ~entity_id:(entity_id_ : entity_id) () =
  ({ entity_type = entity_type_; entity_id = entity_id_ } : entity_identifier)

let make_batch_get_policy_error_item ~code:(code_ : batch_get_policy_error_code)
    ~policy_store_id:(policy_store_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~policy_id:(policy_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ code = code_; policy_store_id = policy_store_id_; policy_id = policy_id_; message = message_ }
    : batch_get_policy_error_item)

let make_template_linked_policy_definition_detail ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ policy_template_id = policy_template_id_; principal = principal_; resource = resource_ }
    : template_linked_policy_definition_detail)

let make_static_policy_definition_detail
    ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ description = description_; statement = statement_ } : static_policy_definition_detail)

let make_batch_get_policy_output_item ?name:(name_ : policy_name option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~policy_id:(policy_id_ : policy_id)
    ~policy_type:(policy_type_ : policy_type) ~definition:(definition_ : policy_definition_detail)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     policy_type = policy_type_;
     definition = definition_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     name = name_;
   }
    : batch_get_policy_output_item)

let make_batch_get_policy_output ~results:(results_ : batch_get_policy_output_list)
    ~errors:(errors_ : batch_get_policy_error_list) () =
  ({ results = results_; errors = errors_ } : batch_get_policy_output)

let make_batch_get_policy_input_item ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_store_id = policy_store_id_; policy_id = policy_id_ } : batch_get_policy_input_item)

let make_batch_get_policy_input ~requests:(requests_ : batch_get_policy_input_list) () =
  ({ requests = requests_ } : batch_get_policy_input)

let make_evaluation_error_item
    ~error_description:(error_description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ error_description = error_description_ } : evaluation_error_item)

let make_determining_policy_item ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_id = policy_id_ } : determining_policy_item)

let make_batch_is_authorized_input_item ?principal:(principal_ : entity_identifier option)
    ?action:(action_ : action_identifier option) ?resource:(resource_ : entity_identifier option)
    ?context:(context_ : context_definition option) () =
  ({ principal = principal_; action = action_; resource = resource_; context = context_ }
    : batch_is_authorized_input_item)

let make_batch_is_authorized_output_item ~request:(request_ : batch_is_authorized_input_item)
    ~decision:(decision_ : decision)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~errors:(errors_ : evaluation_error_list) () =
  ({
     request = request_;
     decision = decision_;
     determining_policies = determining_policies_;
     errors = errors_;
   }
    : batch_is_authorized_output_item)

let make_batch_is_authorized_output ~results:(results_ : batch_is_authorized_output_list) () =
  ({ results = results_ } : batch_is_authorized_output)

let make_entity_item ?attributes:(attributes_ : entity_attributes option)
    ?parents:(parents_ : parent_list option) ?tags:(tags_ : entity_cedar_tags option)
    ~identifier:(identifier_ : entity_identifier) () =
  ({ identifier = identifier_; attributes = attributes_; parents = parents_; tags = tags_ }
    : entity_item)

let make_batch_is_authorized_input ?entities:(entities_ : entities_definition option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~requests:(requests_ : batch_is_authorized_input_list) () =
  ({ policy_store_id = policy_store_id_; entities = entities_; requests = requests_ }
    : batch_is_authorized_input)

let make_batch_is_authorized_with_token_input_item ?action:(action_ : action_identifier option)
    ?resource:(resource_ : entity_identifier option) ?context:(context_ : context_definition option)
    () =
  ({ action = action_; resource = resource_; context = context_ }
    : batch_is_authorized_with_token_input_item)

let make_batch_is_authorized_with_token_output_item
    ~request:(request_ : batch_is_authorized_with_token_input_item) ~decision:(decision_ : decision)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~errors:(errors_ : evaluation_error_list) () =
  ({
     request = request_;
     decision = decision_;
     determining_policies = determining_policies_;
     errors = errors_;
   }
    : batch_is_authorized_with_token_output_item)

let make_batch_is_authorized_with_token_output ?principal:(principal_ : entity_identifier option)
    ~results:(results_ : batch_is_authorized_with_token_output_list) () =
  ({ principal = principal_; results = results_ } : batch_is_authorized_with_token_output)

let make_batch_is_authorized_with_token_input ?identity_token:(identity_token_ : token option)
    ?access_token:(access_token_ : token option) ?entities:(entities_ : entities_definition option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~requests:(requests_ : batch_is_authorized_with_token_input_list) () =
  ({
     policy_store_id = policy_store_id_;
     identity_token = identity_token_;
     access_token = access_token_;
     entities = entities_;
     requests = requests_;
   }
    : batch_is_authorized_with_token_input)

let make_cognito_group_configuration ~group_entity_type:(group_entity_type_ : group_entity_type) ()
    =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration)

let make_cognito_group_configuration_detail
    ?group_entity_type:(group_entity_type_ : group_entity_type option) () =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration_detail)

let make_cognito_group_configuration_item
    ?group_entity_type:(group_entity_type_ : group_entity_type option) () =
  ({ group_entity_type = group_entity_type_ } : cognito_group_configuration_item)

let make_cognito_user_pool_configuration ?client_ids:(client_ids_ : client_ids option)
    ?group_configuration:(group_configuration_ : cognito_group_configuration option)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) () =
  ({
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
     group_configuration = group_configuration_;
   }
    : cognito_user_pool_configuration)

let make_cognito_user_pool_configuration_detail
    ?group_configuration:(group_configuration_ : cognito_group_configuration_detail option)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) ~client_ids:(client_ids_ : client_ids)
    ~issuer:(issuer_ : issuer) () =
  ({
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
     issuer = issuer_;
     group_configuration = group_configuration_;
   }
    : cognito_user_pool_configuration_detail)

let make_cognito_user_pool_configuration_item
    ?group_configuration:(group_configuration_ : cognito_group_configuration_item option)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) ~client_ids:(client_ids_ : client_ids)
    ~issuer:(issuer_ : issuer) () =
  ({
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
     issuer = issuer_;
     group_configuration = group_configuration_;
   }
    : cognito_user_pool_configuration_item)

let make_open_id_connect_identity_token_configuration
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({ principal_id_claim = principal_id_claim_; client_ids = client_ids_ }
    : open_id_connect_identity_token_configuration)

let make_open_id_connect_access_token_configuration
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?audiences:(audiences_ : audiences option) () =
  ({ principal_id_claim = principal_id_claim_; audiences = audiences_ }
    : open_id_connect_access_token_configuration)

let make_open_id_connect_group_configuration ~group_claim:(group_claim_ : claim)
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_claim = group_claim_; group_entity_type = group_entity_type_ }
    : open_id_connect_group_configuration)

let make_open_id_connect_configuration
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration option)
    ~issuer:(issuer_ : issuer) ~token_selection:(token_selection_ : open_id_connect_token_selection)
    () =
  ({
     issuer = issuer_;
     entity_id_prefix = entity_id_prefix_;
     group_configuration = group_configuration_;
     token_selection = token_selection_;
   }
    : open_id_connect_configuration)

let make_open_id_connect_identity_token_configuration_detail
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({ principal_id_claim = principal_id_claim_; client_ids = client_ids_ }
    : open_id_connect_identity_token_configuration_detail)

let make_open_id_connect_access_token_configuration_detail
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?audiences:(audiences_ : audiences option) () =
  ({ principal_id_claim = principal_id_claim_; audiences = audiences_ }
    : open_id_connect_access_token_configuration_detail)

let make_open_id_connect_group_configuration_detail ~group_claim:(group_claim_ : claim)
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_claim = group_claim_; group_entity_type = group_entity_type_ }
    : open_id_connect_group_configuration_detail)

let make_open_id_connect_configuration_detail
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration_detail option)
    ~issuer:(issuer_ : issuer)
    ~token_selection:(token_selection_ : open_id_connect_token_selection_detail) () =
  ({
     issuer = issuer_;
     entity_id_prefix = entity_id_prefix_;
     group_configuration = group_configuration_;
     token_selection = token_selection_;
   }
    : open_id_connect_configuration_detail)

let make_open_id_connect_identity_token_configuration_item
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({ principal_id_claim = principal_id_claim_; client_ids = client_ids_ }
    : open_id_connect_identity_token_configuration_item)

let make_open_id_connect_access_token_configuration_item
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?audiences:(audiences_ : audiences option) () =
  ({ principal_id_claim = principal_id_claim_; audiences = audiences_ }
    : open_id_connect_access_token_configuration_item)

let make_open_id_connect_group_configuration_item ~group_claim:(group_claim_ : claim)
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_claim = group_claim_; group_entity_type = group_entity_type_ }
    : open_id_connect_group_configuration_item)

let make_open_id_connect_configuration_item
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ?group_configuration:(group_configuration_ : open_id_connect_group_configuration_item option)
    ~issuer:(issuer_ : issuer)
    ~token_selection:(token_selection_ : open_id_connect_token_selection_item) () =
  ({
     issuer = issuer_;
     entity_id_prefix = entity_id_prefix_;
     group_configuration = group_configuration_;
     token_selection = token_selection_;
   }
    : open_id_connect_configuration_item)

let make_resource_conflict ~resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_type:(resource_type_ : resource_type) () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : resource_conflict)

let make_create_identity_source_output ~created_date:(created_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     created_date = created_date_;
     identity_source_id = identity_source_id_;
     last_updated_date = last_updated_date_;
     policy_store_id = policy_store_id_;
   }
    : create_identity_source_output)

let make_create_identity_source_input ?client_token:(client_token_ : idempotency_token option)
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~configuration:(configuration_ : configuration) () =
  ({
     client_token = client_token_;
     policy_store_id = policy_store_id_;
     configuration = configuration_;
     principal_entity_type = principal_entity_type_;
   }
    : create_identity_source_input)

let make_create_policy_output ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ?actions:(actions_ : action_identifier_list option) ?effect_:(effect__ : policy_effect option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~policy_id:(policy_id_ : policy_id)
    ~policy_type:(policy_type_ : policy_type) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     policy_type = policy_type_;
     principal = principal_;
     resource = resource_;
     actions = actions_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     effect_ = effect__;
   }
    : create_policy_output)

let make_template_linked_policy_definition ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ policy_template_id = policy_template_id_; principal = principal_; resource = resource_ }
    : template_linked_policy_definition)

let make_static_policy_definition ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ description = description_; statement = statement_ } : static_policy_definition)

let make_create_policy_input ?client_token:(client_token_ : idempotency_token option)
    ?name:(name_ : policy_name option) ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~definition:(definition_ : policy_definition) () =
  ({
     client_token = client_token_;
     policy_store_id = policy_store_id_;
     definition = definition_;
     name = name_;
   }
    : create_policy_input)

let make_create_policy_store_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~arn:(arn_ : resource_arn) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     arn = arn_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
   }
    : create_policy_store_output)

let make_kms_encryption_settings
    ?encryption_context:(encryption_context_ : encryption_context option) ~key:(key_ : kms_key) () =
  ({ key = key_; encryption_context = encryption_context_ } : kms_encryption_settings)

let make_validation_settings ~mode:(mode_ : validation_mode) () =
  ({ mode = mode_ } : validation_settings)

let make_create_policy_store_input ?client_token:(client_token_ : idempotency_token option)
    ?description:(description_ : policy_store_description option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?encryption_settings:(encryption_settings_ : encryption_settings option)
    ?tags:(tags_ : tag_map option) ~validation_settings:(validation_settings_ : validation_settings)
    () =
  ({
     client_token = client_token_;
     validation_settings = validation_settings_;
     description = description_;
     deletion_protection = deletion_protection_;
     encryption_settings = encryption_settings_;
     tags = tags_;
   }
    : create_policy_store_input)

let make_create_policy_store_alias_output ~alias_name:(alias_name_ : alias)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~alias_arn:(alias_arn_ : resource_arn)
    ~created_at:(created_at_ : timestamp_format) () =
  ({
     alias_name = alias_name_;
     policy_store_id = policy_store_id_;
     alias_arn = alias_arn_;
     created_at = created_at_;
   }
    : create_policy_store_alias_output)

let make_create_policy_store_alias_input ~alias_name:(alias_name_ : alias)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ alias_name = alias_name_; policy_store_id = policy_store_id_ }
    : create_policy_store_alias_input)

let make_create_policy_template_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_template_id = policy_template_id_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
   }
    : create_policy_template_output)

let make_create_policy_template_input ?client_token:(client_token_ : idempotency_token option)
    ?description:(description_ : policy_template_description option)
    ?name:(name_ : policy_template_name option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~statement:(statement_ : policy_statement)
    () =
  ({
     client_token = client_token_;
     policy_store_id = policy_store_id_;
     description = description_;
     statement = statement_;
     name = name_;
   }
    : create_policy_template_input)

let make_delete_identity_source_output () = (() : unit)

let make_delete_identity_source_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~identity_source_id:(identity_source_id_ : identity_source_id) () =
  ({ policy_store_id = policy_store_id_; identity_source_id = identity_source_id_ }
    : delete_identity_source_input)

let make_delete_policy_output () = (() : unit)

let make_delete_policy_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_store_id = policy_store_id_; policy_id = policy_id_ } : delete_policy_input)

let make_delete_policy_store_output () = (() : unit)

let make_delete_policy_store_input ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_ } : delete_policy_store_input)

let make_delete_policy_store_alias_output () = (() : unit)

let make_delete_policy_store_alias_input ?deletion_mode:(deletion_mode_ : deletion_mode option)
    ~alias_name:(alias_name_ : alias) () =
  ({ alias_name = alias_name_; deletion_mode = deletion_mode_ } : delete_policy_store_alias_input)

let make_delete_policy_template_output () = (() : unit)

let make_delete_policy_template_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ policy_store_id = policy_store_id_; policy_template_id = policy_template_id_ }
    : delete_policy_template_input)

let make_kms_encryption_state ~key:(key_ : kms_key)
    ~encryption_context:(encryption_context_ : encryption_context) () =
  ({ key = key_; encryption_context = encryption_context_ } : kms_encryption_state)

let make_identity_source_details ?client_ids:(client_ids_ : client_ids option)
    ?user_pool_arn:(user_pool_arn_ : user_pool_arn option)
    ?discovery_url:(discovery_url_ : discovery_url option)
    ?open_id_issuer:(open_id_issuer_ : open_id_issuer option) () =
  ({
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
     discovery_url = discovery_url_;
     open_id_issuer = open_id_issuer_;
   }
    : identity_source_details)

let make_get_identity_source_output ?details:(details_ : identity_source_details option)
    ?configuration:(configuration_ : configuration_detail option)
    ~created_date:(created_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~principal_entity_type:(principal_entity_type_ : principal_entity_type) () =
  ({
     created_date = created_date_;
     details = details_;
     identity_source_id = identity_source_id_;
     last_updated_date = last_updated_date_;
     policy_store_id = policy_store_id_;
     principal_entity_type = principal_entity_type_;
     configuration = configuration_;
   }
    : get_identity_source_output)

let make_get_identity_source_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~identity_source_id:(identity_source_id_ : identity_source_id) () =
  ({ policy_store_id = policy_store_id_; identity_source_id = identity_source_id_ }
    : get_identity_source_input)

let make_get_policy_output ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ?actions:(actions_ : action_identifier_list option) ?effect_:(effect__ : policy_effect option)
    ?name:(name_ : policy_name option) ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) ~policy_type:(policy_type_ : policy_type)
    ~definition:(definition_ : policy_definition_detail)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     policy_type = policy_type_;
     principal = principal_;
     resource = resource_;
     actions = actions_;
     definition = definition_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     effect_ = effect__;
     name = name_;
   }
    : get_policy_output)

let make_get_policy_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({ policy_store_id = policy_store_id_; policy_id = policy_id_ } : get_policy_input)

let make_get_policy_store_output ?description:(description_ : policy_store_description option)
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?encryption_state:(encryption_state_ : encryption_state option)
    ?cedar_version:(cedar_version_ : cedar_version option) ?tags:(tags_ : tag_map option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~arn:(arn_ : resource_arn)
    ~validation_settings:(validation_settings_ : validation_settings)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     arn = arn_;
     validation_settings = validation_settings_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     description = description_;
     deletion_protection = deletion_protection_;
     encryption_state = encryption_state_;
     cedar_version = cedar_version_;
     tags = tags_;
   }
    : get_policy_store_output)

let make_get_policy_store_input ?tags:(tags_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_; tags = tags_ } : get_policy_store_input)

let make_get_policy_store_alias_output ~alias_name:(alias_name_ : alias)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~alias_arn:(alias_arn_ : resource_arn)
    ~created_at:(created_at_ : timestamp_format) ~state:(state_ : alias_state) () =
  ({
     alias_name = alias_name_;
     policy_store_id = policy_store_id_;
     alias_arn = alias_arn_;
     created_at = created_at_;
     state = state_;
   }
    : get_policy_store_alias_output)

let make_get_policy_store_alias_input ~alias_name:(alias_name_ : alias) () =
  ({ alias_name = alias_name_ } : get_policy_store_alias_input)

let make_get_policy_template_output ?description:(description_ : policy_template_description option)
    ?name:(name_ : policy_template_name option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~statement:(statement_ : policy_statement) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_template_id = policy_template_id_;
     description = description_;
     statement = statement_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     name = name_;
   }
    : get_policy_template_output)

let make_get_policy_template_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ policy_store_id = policy_store_id_; policy_template_id = policy_template_id_ }
    : get_policy_template_input)

let make_get_schema_output ?namespaces:(namespaces_ : namespace_list option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~schema:(schema_ : schema_json)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     schema = schema_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     namespaces = namespaces_;
   }
    : get_schema_output)

let make_get_schema_input ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_ } : get_schema_input)

let make_identity_source_filter
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option) () =
  ({ principal_entity_type = principal_entity_type_ } : identity_source_filter)

let make_identity_source_item_details ?client_ids:(client_ids_ : client_ids option)
    ?user_pool_arn:(user_pool_arn_ : user_pool_arn option)
    ?discovery_url:(discovery_url_ : discovery_url option)
    ?open_id_issuer:(open_id_issuer_ : open_id_issuer option) () =
  ({
     client_ids = client_ids_;
     user_pool_arn = user_pool_arn_;
     discovery_url = discovery_url_;
     open_id_issuer = open_id_issuer_;
   }
    : identity_source_item_details)

let make_identity_source_item ?details:(details_ : identity_source_item_details option)
    ?configuration:(configuration_ : configuration_item option)
    ~created_date:(created_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~principal_entity_type:(principal_entity_type_ : principal_entity_type) () =
  ({
     created_date = created_date_;
     details = details_;
     identity_source_id = identity_source_id_;
     last_updated_date = last_updated_date_;
     policy_store_id = policy_store_id_;
     principal_entity_type = principal_entity_type_;
     configuration = configuration_;
   }
    : identity_source_item)

let make_is_authorized_output ~decision:(decision_ : decision)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~errors:(errors_ : evaluation_error_list) () =
  ({ decision = decision_; determining_policies = determining_policies_; errors = errors_ }
    : is_authorized_output)

let make_is_authorized_input ?principal:(principal_ : entity_identifier option)
    ?action:(action_ : action_identifier option) ?resource:(resource_ : entity_identifier option)
    ?context:(context_ : context_definition option)
    ?entities:(entities_ : entities_definition option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     policy_store_id = policy_store_id_;
     principal = principal_;
     action = action_;
     resource = resource_;
     context = context_;
     entities = entities_;
   }
    : is_authorized_input)

let make_is_authorized_with_token_output ?principal:(principal_ : entity_identifier option)
    ~decision:(decision_ : decision)
    ~determining_policies:(determining_policies_ : determining_policy_list)
    ~errors:(errors_ : evaluation_error_list) () =
  ({
     decision = decision_;
     determining_policies = determining_policies_;
     errors = errors_;
     principal = principal_;
   }
    : is_authorized_with_token_output)

let make_is_authorized_with_token_input ?identity_token:(identity_token_ : token option)
    ?access_token:(access_token_ : token option) ?action:(action_ : action_identifier option)
    ?resource:(resource_ : entity_identifier option) ?context:(context_ : context_definition option)
    ?entities:(entities_ : entities_definition option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     policy_store_id = policy_store_id_;
     identity_token = identity_token_;
     access_token = access_token_;
     action = action_;
     resource = resource_;
     context = context_;
     entities = entities_;
   }
    : is_authorized_with_token_input)

let make_list_identity_sources_output ?next_token:(next_token_ : next_token option)
    ~identity_sources:(identity_sources_ : identity_sources) () =
  ({ next_token = next_token_; identity_sources = identity_sources_ }
    : list_identity_sources_output)

let make_list_identity_sources_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_identity_sources_max_results option)
    ?filters:(filters_ : identity_source_filters option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     policy_store_id = policy_store_id_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
   }
    : list_identity_sources_input)

let make_template_linked_policy_definition_item ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ~policy_template_id:(policy_template_id_ : policy_template_id) () =
  ({ policy_template_id = policy_template_id_; principal = principal_; resource = resource_ }
    : template_linked_policy_definition_item)

let make_static_policy_definition_item
    ?description:(description_ : static_policy_description option) () =
  ({ description = description_ } : static_policy_definition_item)

let make_policy_item ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ?actions:(actions_ : action_identifier_list option) ?effect_:(effect__ : policy_effect option)
    ?name:(name_ : policy_name option) ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) ~policy_type:(policy_type_ : policy_type)
    ~definition:(definition_ : policy_definition_item)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     policy_type = policy_type_;
     principal = principal_;
     resource = resource_;
     actions = actions_;
     definition = definition_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     effect_ = effect__;
     name = name_;
   }
    : policy_item)

let make_list_policies_output ?next_token:(next_token_ : next_token option)
    ~policies:(policies_ : policy_list) () =
  ({ next_token = next_token_; policies = policies_ } : list_policies_output)

let make_policy_filter ?principal:(principal_ : entity_reference option)
    ?resource:(resource_ : entity_reference option) ?policy_type:(policy_type_ : policy_type option)
    ?policy_template_id:(policy_template_id_ : policy_template_id option) () =
  ({
     principal = principal_;
     resource = resource_;
     policy_type = policy_type_;
     policy_template_id = policy_template_id_;
   }
    : policy_filter)

let make_list_policies_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filter:(filter_ : policy_filter option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     policy_store_id = policy_store_id_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
   }
    : list_policies_input)

let make_policy_store_alias_item ~alias_name:(alias_name_ : alias)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~alias_arn:(alias_arn_ : resource_arn)
    ~created_at:(created_at_ : timestamp_format) ~state:(state_ : alias_state) () =
  ({
     alias_name = alias_name_;
     policy_store_id = policy_store_id_;
     alias_arn = alias_arn_;
     created_at = created_at_;
     state = state_;
   }
    : policy_store_alias_item)

let make_list_policy_store_aliases_output ?next_token:(next_token_ : next_token option)
    ~policy_store_aliases:(policy_store_aliases_ : policy_store_alias_list) () =
  ({ next_token = next_token_; policy_store_aliases = policy_store_aliases_ }
    : list_policy_store_aliases_output)

let make_policy_store_alias_filter ?policy_store_id:(policy_store_id_ : policy_store_id option) () =
  ({ policy_store_id = policy_store_id_ } : policy_store_alias_filter)

let make_list_policy_store_aliases_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : policy_store_alias_filter option) () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_ }
    : list_policy_store_aliases_input)

let make_policy_store_item ?last_updated_date:(last_updated_date_ : timestamp_format option)
    ?description:(description_ : policy_store_description option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~arn:(arn_ : resource_arn)
    ~created_date:(created_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     arn = arn_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     description = description_;
   }
    : policy_store_item)

let make_list_policy_stores_output ?next_token:(next_token_ : next_token option)
    ~policy_stores:(policy_stores_ : policy_store_list) () =
  ({ next_token = next_token_; policy_stores = policy_stores_ } : list_policy_stores_output)

let make_list_policy_stores_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_policy_stores_input)

let make_policy_template_item ?description:(description_ : policy_template_description option)
    ?name:(name_ : policy_template_name option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_template_id = policy_template_id_;
     description = description_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     name = name_;
   }
    : policy_template_item)

let make_list_policy_templates_output ?next_token:(next_token_ : next_token option)
    ~policy_templates:(policy_templates_ : policy_templates_list) () =
  ({ next_token = next_token_; policy_templates = policy_templates_ }
    : list_policy_templates_output)

let make_list_policy_templates_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({ policy_store_id = policy_store_id_; next_token = next_token_; max_results = max_results_ }
    : list_policy_templates_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_put_schema_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~namespaces:(namespaces_ : namespace_list) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     namespaces = namespaces_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
   }
    : put_schema_output)

let make_put_schema_input ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~definition:(definition_ : schema_definition) () =
  ({ policy_store_id = policy_store_id_; definition = definition_ } : put_schema_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_map) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_update_cognito_group_configuration
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_entity_type = group_entity_type_ } : update_cognito_group_configuration)

let make_update_cognito_user_pool_configuration ?client_ids:(client_ids_ : client_ids option)
    ?group_configuration:(group_configuration_ : update_cognito_group_configuration option)
    ~user_pool_arn:(user_pool_arn_ : user_pool_arn) () =
  ({
     user_pool_arn = user_pool_arn_;
     client_ids = client_ids_;
     group_configuration = group_configuration_;
   }
    : update_cognito_user_pool_configuration)

let make_update_open_id_connect_identity_token_configuration
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?client_ids:(client_ids_ : client_ids option) () =
  ({ principal_id_claim = principal_id_claim_; client_ids = client_ids_ }
    : update_open_id_connect_identity_token_configuration)

let make_update_open_id_connect_access_token_configuration
    ?principal_id_claim:(principal_id_claim_ : claim option)
    ?audiences:(audiences_ : audiences option) () =
  ({ principal_id_claim = principal_id_claim_; audiences = audiences_ }
    : update_open_id_connect_access_token_configuration)

let make_update_open_id_connect_group_configuration ~group_claim:(group_claim_ : claim)
    ~group_entity_type:(group_entity_type_ : group_entity_type) () =
  ({ group_claim = group_claim_; group_entity_type = group_entity_type_ }
    : update_open_id_connect_group_configuration)

let make_update_open_id_connect_configuration
    ?entity_id_prefix:(entity_id_prefix_ : entity_id_prefix option)
    ?group_configuration:(group_configuration_ : update_open_id_connect_group_configuration option)
    ~issuer:(issuer_ : issuer)
    ~token_selection:(token_selection_ : update_open_id_connect_token_selection) () =
  ({
     issuer = issuer_;
     entity_id_prefix = entity_id_prefix_;
     group_configuration = group_configuration_;
     token_selection = token_selection_;
   }
    : update_open_id_connect_configuration)

let make_update_identity_source_output ~created_date:(created_date_ : timestamp_format)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~last_updated_date:(last_updated_date_ : timestamp_format)
    ~policy_store_id:(policy_store_id_ : policy_store_id) () =
  ({
     created_date = created_date_;
     identity_source_id = identity_source_id_;
     last_updated_date = last_updated_date_;
     policy_store_id = policy_store_id_;
   }
    : update_identity_source_output)

let make_update_identity_source_input
    ?principal_entity_type:(principal_entity_type_ : principal_entity_type option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~identity_source_id:(identity_source_id_ : identity_source_id)
    ~update_configuration:(update_configuration_ : update_configuration) () =
  ({
     policy_store_id = policy_store_id_;
     identity_source_id = identity_source_id_;
     update_configuration = update_configuration_;
     principal_entity_type = principal_entity_type_;
   }
    : update_identity_source_input)

let make_update_policy_output ?principal:(principal_ : entity_identifier option)
    ?resource:(resource_ : entity_identifier option)
    ?actions:(actions_ : action_identifier_list option) ?effect_:(effect__ : policy_effect option)
    ~policy_store_id:(policy_store_id_ : policy_store_id) ~policy_id:(policy_id_ : policy_id)
    ~policy_type:(policy_type_ : policy_type) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     policy_type = policy_type_;
     principal = principal_;
     resource = resource_;
     actions = actions_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
     effect_ = effect__;
   }
    : update_policy_output)

let make_update_static_policy_definition
    ?description:(description_ : static_policy_description option)
    ~statement:(statement_ : policy_statement) () =
  ({ description = description_; statement = statement_ } : update_static_policy_definition)

let make_update_policy_input ?definition:(definition_ : update_policy_definition option)
    ?name:(name_ : policy_name option) ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_id:(policy_id_ : policy_id) () =
  ({
     policy_store_id = policy_store_id_;
     policy_id = policy_id_;
     definition = definition_;
     name = name_;
   }
    : update_policy_input)

let make_update_policy_store_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~arn:(arn_ : resource_arn) ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     arn = arn_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
   }
    : update_policy_store_output)

let make_update_policy_store_input
    ?deletion_protection:(deletion_protection_ : deletion_protection option)
    ?description:(description_ : policy_store_description option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~validation_settings:(validation_settings_ : validation_settings) () =
  ({
     policy_store_id = policy_store_id_;
     validation_settings = validation_settings_;
     deletion_protection = deletion_protection_;
     description = description_;
   }
    : update_policy_store_input)

let make_update_policy_template_output ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~created_date:(created_date_ : timestamp_format)
    ~last_updated_date:(last_updated_date_ : timestamp_format) () =
  ({
     policy_store_id = policy_store_id_;
     policy_template_id = policy_template_id_;
     created_date = created_date_;
     last_updated_date = last_updated_date_;
   }
    : update_policy_template_output)

let make_update_policy_template_input
    ?description:(description_ : policy_template_description option)
    ?name:(name_ : policy_template_name option)
    ~policy_store_id:(policy_store_id_ : policy_store_id)
    ~policy_template_id:(policy_template_id_ : policy_template_id)
    ~statement:(statement_ : policy_statement) () =
  ({
     policy_store_id = policy_store_id_;
     policy_template_id = policy_template_id_;
     description = description_;
     statement = statement_;
     name = name_;
   }
    : update_policy_template_input)

let make_validation_exception_field ~path:(path_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ path = path_; message = message_ } : validation_exception_field)
