open Types

let make_mpa_status ?status_message:(status_message_ : mpa_status_message option)
    ~mpa_session_arn:(mpa_session_arn_ : mpa_session_arn) ~status:(status_ : session_status)
    ~initiation_date:(initiation_date_ : timestamp) () =
  ({
     mpa_session_arn = mpa_session_arn_;
     status = status_;
     initiation_date = initiation_date_;
     status_message = status_message_;
   }
    : mpa_status)

let make_replication_status_type
    ?status_message:(status_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : key_replication_state) () =
  ({ status = status_; status_message = status_message_ } : replication_status_type)

let make_key_modes_of_use ?encrypt:(encrypt_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?decrypt:(decrypt_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?wrap:(wrap_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?unwrap:(unwrap_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?generate:(generate_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?sign:(sign_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?verify:(verify_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?derive_key:(derive_key_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?no_restrictions:(no_restrictions_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option) () =
  ({
     encrypt = encrypt_;
     decrypt = decrypt_;
     wrap = wrap_;
     unwrap = unwrap_;
     generate = generate_;
     sign = sign_;
     verify = verify_;
     derive_key = derive_key_;
     no_restrictions = no_restrictions_;
   }
    : key_modes_of_use)

let make_key_attributes ~key_usage:(key_usage_ : key_usage) ~key_class:(key_class_ : key_class)
    ~key_algorithm:(key_algorithm_ : key_algorithm)
    ~key_modes_of_use:(key_modes_of_use_ : key_modes_of_use) () =
  ({
     key_usage = key_usage_;
     key_class = key_class_;
     key_algorithm = key_algorithm_;
     key_modes_of_use = key_modes_of_use_;
   }
    : key_attributes)

let make_key ?usage_start_timestamp:(usage_start_timestamp_ : timestamp option)
    ?usage_stop_timestamp:(usage_stop_timestamp_ : timestamp option)
    ?delete_pending_timestamp:(delete_pending_timestamp_ : timestamp option)
    ?delete_timestamp:(delete_timestamp_ : timestamp option)
    ?derive_key_usage:(derive_key_usage_ : derive_key_usage option)
    ?multi_region_key_type:(multi_region_key_type_ : multi_region_key_type option)
    ?primary_region:(primary_region_ : region option)
    ?replication_status:(replication_status_ : replication_status option)
    ?using_default_replication_regions:
      (using_default_replication_regions_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?mpa_status:(mpa_status_ : mpa_status option) ~key_arn:(key_arn_ : key_arn)
    ~key_attributes:(key_attributes_ : key_attributes)
    ~key_check_value:(key_check_value_ : key_check_value)
    ~key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_state:(key_state_ : key_state) ~key_origin:(key_origin_ : key_origin)
    ~create_timestamp:(create_timestamp_ : timestamp) () =
  ({
     key_arn = key_arn_;
     key_attributes = key_attributes_;
     key_check_value = key_check_value_;
     key_check_value_algorithm = key_check_value_algorithm_;
     enabled = enabled_;
     exportable = exportable_;
     key_state = key_state_;
     key_origin = key_origin_;
     create_timestamp = create_timestamp_;
     usage_start_timestamp = usage_start_timestamp_;
     usage_stop_timestamp = usage_stop_timestamp_;
     delete_pending_timestamp = delete_pending_timestamp_;
     delete_timestamp = delete_timestamp_;
     derive_key_usage = derive_key_usage_;
     multi_region_key_type = multi_region_key_type_;
     primary_region = primary_region_;
     replication_status = replication_status_;
     using_default_replication_regions = using_default_replication_regions_;
     mpa_status = mpa_status_;
   }
    : key)

let make_add_key_replication_regions_output ~key:(key_ : key) () =
  ({ key = key_ } : add_key_replication_regions_output)

let make_add_key_replication_regions_input
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type)
    ~replication_regions:(replication_regions_ : regions) () =
  ({ key_identifier = key_identifier_; replication_regions = replication_regions_ }
    : add_key_replication_regions_input)

let make_alias ?key_arn:(key_arn_ : key_arn option) ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_; key_arn = key_arn_ } : alias)

let make_mpa_team_association ?mpa_status:(mpa_status_ : mpa_status option)
    ~action:(action_ : mpa_operation) ~mpa_team_arn:(mpa_team_arn_ : mpa_team_arn)
    ~association_state:(association_state_ : association_state) () =
  ({
     action = action_;
     mpa_team_arn = mpa_team_arn_;
     association_state = association_state_;
     mpa_status = mpa_status_;
   }
    : mpa_team_association)

let make_associate_mpa_team_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : associate_mpa_team_output)

let make_associate_mpa_team_input
    ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ~action:(action_ : mpa_operation) ~mpa_team_arn:(mpa_team_arn_ : mpa_team_arn) () =
  ({ action = action_; mpa_team_arn = mpa_team_arn_; requester_comment = requester_comment_ }
    : associate_mpa_team_input)

let make_certificate_subject_type
    ?organization_unit:(organization_unit_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization:(organization_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?city:(city_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?country:(country_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?state_or_province:(state_or_province_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?email_address:(email_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~common_name:(common_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     common_name = common_name_;
     organization_unit = organization_unit_;
     organization = organization_;
     city = city_;
     country = country_;
     state_or_province = state_or_province_;
     email_address = email_address_;
   }
    : certificate_subject_type)

let make_create_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : create_alias_output)

let make_create_alias_input ?key_arn:(key_arn_ : key_arn option)
    ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_; key_arn = key_arn_ } : create_alias_input)

let make_create_key_output ~key:(key_ : key) () = ({ key = key_ } : create_key_output)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_key_input
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ?tags:(tags_ : tags option)
    ?derive_key_usage:(derive_key_usage_ : derive_key_usage option)
    ?replication_regions:(replication_regions_ : regions option)
    ~key_attributes:(key_attributes_ : key_attributes)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({
     key_attributes = key_attributes_;
     key_check_value_algorithm = key_check_value_algorithm_;
     exportable = exportable_;
     enabled = enabled_;
     tags = tags_;
     derive_key_usage = derive_key_usage_;
     replication_regions = replication_regions_;
   }
    : create_key_input)

let make_delete_alias_output () = (() : unit)

let make_delete_alias_input ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_ } : delete_alias_input)

let make_delete_key_output ~key:(key_ : key) () = ({ key = key_ } : delete_key_output)

let make_delete_key_input
    ?delete_key_in_days:(delete_key_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_; delete_key_in_days = delete_key_in_days_ }
    : delete_key_input)

let make_delete_resource_policy_output () = (() : unit)

let make_delete_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_input)

let make_disable_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : disable_default_key_replication_regions_output)

let make_disable_default_key_replication_regions_input
    ~replication_regions:(replication_regions_ : regions) () =
  ({ replication_regions = replication_regions_ } : disable_default_key_replication_regions_input)

let make_disassociate_mpa_team_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : disassociate_mpa_team_output)

let make_disassociate_mpa_team_input
    ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ~action:(action_ : mpa_operation) () =
  ({ action = action_; requester_comment = requester_comment_ } : disassociate_mpa_team_input)

let make_enable_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : enable_default_key_replication_regions_output)

let make_enable_default_key_replication_regions_input
    ~replication_regions:(replication_regions_ : regions) () =
  ({ replication_regions = replication_regions_ } : enable_default_key_replication_regions_input)

let make_export_as2805_key_cryptogram
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type)
    ~as2805_key_variant:(as2805_key_variant_ : as2805_key_variant) () =
  ({ wrapping_key_identifier = wrapping_key_identifier_; as2805_key_variant = as2805_key_variant_ }
    : export_as2805_key_cryptogram)

let make_export_dukpt_initial_key ~key_serial_number:(key_serial_number_ : hex_length20_or24) () =
  ({ key_serial_number = key_serial_number_ } : export_dukpt_initial_key)

let make_export_attributes
    ?export_dukpt_initial_key:(export_dukpt_initial_key_ : export_dukpt_initial_key option)
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option) () =
  ({
     export_dukpt_initial_key = export_dukpt_initial_key_;
     key_check_value_algorithm = key_check_value_algorithm_;
   }
    : export_attributes)

let make_key_block_headers ?key_modes_of_use:(key_modes_of_use_ : key_modes_of_use option)
    ?key_exportability:(key_exportability_ : key_exportability option)
    ?key_version:(key_version_ : key_version option)
    ?optional_blocks:(optional_blocks_ : optional_blocks option) () =
  ({
     key_modes_of_use = key_modes_of_use_;
     key_exportability = key_exportability_;
     key_version = key_version_;
     optional_blocks = optional_blocks_;
   }
    : key_block_headers)

let make_export_diffie_hellman_tr31_key_block
    ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ~private_key_identifier:(private_key_identifier_ : key_arn_or_key_alias_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~derive_key_algorithm:(derive_key_algorithm_ : symmetric_key_algorithm)
    ~key_derivation_function:(key_derivation_function_ : key_derivation_function)
    ~key_derivation_hash_algorithm:(key_derivation_hash_algorithm_ : key_derivation_hash_algorithm)
    ~derivation_data:(derivation_data_ : diffie_hellman_derivation_data) () =
  ({
     private_key_identifier = private_key_identifier_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     public_key_certificate = public_key_certificate_;
     derive_key_algorithm = derive_key_algorithm_;
     key_derivation_function = key_derivation_function_;
     key_derivation_hash_algorithm = key_derivation_hash_algorithm_;
     derivation_data = derivation_data_;
     key_block_headers = key_block_headers_;
   }
    : export_diffie_hellman_tr31_key_block)

let make_wrapped_key ?key_check_value:(key_check_value_ : key_check_value option)
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ~wrapping_key_arn:(wrapping_key_arn_ : key_arn)
    ~wrapped_key_material_format:(wrapped_key_material_format_ : wrapped_key_material_format)
    ~key_material:(key_material_ : key_material) () =
  ({
     wrapping_key_arn = wrapping_key_arn_;
     wrapped_key_material_format = wrapped_key_material_format_;
     key_material = key_material_;
     key_check_value = key_check_value_;
     key_check_value_algorithm = key_check_value_algorithm_;
   }
    : wrapped_key)

let make_export_key_output ?wrapped_key:(wrapped_key_ : wrapped_key option) () =
  ({ wrapped_key = wrapped_key_ } : export_key_output)

let make_export_key_cryptogram ?wrapping_spec:(wrapping_spec_ : wrapping_key_spec option)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type) () =
  ({
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     wrapping_key_certificate = wrapping_key_certificate_;
     wrapping_spec = wrapping_spec_;
   }
    : export_key_cryptogram)

let make_export_tr34_key_block ?export_token:(export_token_ : export_token_id option)
    ?signing_key_identifier:(signing_key_identifier_ : key_arn_or_key_alias_type option)
    ?signing_key_certificate:(signing_key_certificate_ : certificate_type option)
    ?random_nonce:(random_nonce_ : even_hex_length_between16_and32 option)
    ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type)
    ~key_block_format:(key_block_format_ : tr34_key_block_format) () =
  ({
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     wrapping_key_certificate = wrapping_key_certificate_;
     export_token = export_token_;
     signing_key_identifier = signing_key_identifier_;
     signing_key_certificate = signing_key_certificate_;
     key_block_format = key_block_format_;
     random_nonce = random_nonce_;
     key_block_headers = key_block_headers_;
   }
    : export_tr34_key_block)

let make_export_tr31_key_block ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type) () =
  ({ wrapping_key_identifier = wrapping_key_identifier_; key_block_headers = key_block_headers_ }
    : export_tr31_key_block)

let make_export_key_input ?export_attributes:(export_attributes_ : export_attributes option)
    ~key_material:(key_material_ : export_key_material)
    ~export_key_identifier:(export_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     key_material = key_material_;
     export_key_identifier = export_key_identifier_;
     export_attributes = export_attributes_;
   }
    : export_key_input)

let make_get_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : get_alias_output)

let make_get_alias_input ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_ } : get_alias_input)

let make_get_certificate_signing_request_output
    ~certificate_signing_request:(certificate_signing_request_ : certificate_signing_request_type)
    () =
  ({ certificate_signing_request = certificate_signing_request_ }
    : get_certificate_signing_request_output)

let make_get_certificate_signing_request_input
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm_type)
    ~certificate_subject:(certificate_subject_ : certificate_subject_type) () =
  ({
     key_identifier = key_identifier_;
     signing_algorithm = signing_algorithm_;
     certificate_subject = certificate_subject_;
   }
    : get_certificate_signing_request_input)

let make_get_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : get_default_key_replication_regions_output)

let make_get_default_key_replication_regions_input () = (() : unit)
let make_get_key_output ~key:(key_ : key) () = ({ key = key_ } : get_key_output)

let make_get_key_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : get_key_input)

let make_get_mpa_team_association_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : get_mpa_team_association_output)

let make_get_mpa_team_association_input ~action:(action_ : mpa_operation) () =
  ({ action = action_ } : get_mpa_team_association_input)

let make_get_parameters_for_export_output
    ~signing_key_certificate:(signing_key_certificate_ : certificate_type)
    ~signing_key_certificate_chain:(signing_key_certificate_chain_ : certificate_type)
    ~signing_key_algorithm:(signing_key_algorithm_ : key_algorithm)
    ~export_token:(export_token_ : export_token_id)
    ~parameters_valid_until_timestamp:(parameters_valid_until_timestamp_ : timestamp) () =
  ({
     signing_key_certificate = signing_key_certificate_;
     signing_key_certificate_chain = signing_key_certificate_chain_;
     signing_key_algorithm = signing_key_algorithm_;
     export_token = export_token_;
     parameters_valid_until_timestamp = parameters_valid_until_timestamp_;
   }
    : get_parameters_for_export_output)

let make_get_parameters_for_export_input
    ?reuse_last_generated_token:
      (reuse_last_generated_token_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~key_material_type:(key_material_type_ : key_material_type)
    ~signing_key_algorithm:(signing_key_algorithm_ : key_algorithm) () =
  ({
     key_material_type = key_material_type_;
     signing_key_algorithm = signing_key_algorithm_;
     reuse_last_generated_token = reuse_last_generated_token_;
   }
    : get_parameters_for_export_input)

let make_get_parameters_for_import_output
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type)
    ~wrapping_key_certificate_chain:(wrapping_key_certificate_chain_ : certificate_type)
    ~wrapping_key_algorithm:(wrapping_key_algorithm_ : key_algorithm)
    ~import_token:(import_token_ : import_token_id)
    ~parameters_valid_until_timestamp:(parameters_valid_until_timestamp_ : timestamp) () =
  ({
     wrapping_key_certificate = wrapping_key_certificate_;
     wrapping_key_certificate_chain = wrapping_key_certificate_chain_;
     wrapping_key_algorithm = wrapping_key_algorithm_;
     import_token = import_token_;
     parameters_valid_until_timestamp = parameters_valid_until_timestamp_;
   }
    : get_parameters_for_import_output)

let make_get_parameters_for_import_input
    ?reuse_last_generated_token:
      (reuse_last_generated_token_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~key_material_type:(key_material_type_ : key_material_type)
    ~wrapping_key_algorithm:(wrapping_key_algorithm_ : key_algorithm) () =
  ({
     key_material_type = key_material_type_;
     wrapping_key_algorithm = wrapping_key_algorithm_;
     reuse_last_generated_token = reuse_last_generated_token_;
   }
    : get_parameters_for_import_input)

let make_get_public_key_certificate_output ~key_certificate:(key_certificate_ : certificate_type)
    ~key_certificate_chain:(key_certificate_chain_ : certificate_type) () =
  ({ key_certificate = key_certificate_; key_certificate_chain = key_certificate_chain_ }
    : get_public_key_certificate_output)

let make_get_public_key_certificate_input
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : get_public_key_certificate_input)

let make_get_resource_policy_output ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : resource_policy) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_import_as2805_key_cryptogram ~as2805_key_variant:(as2805_key_variant_ : as2805_key_variant)
    ~key_modes_of_use:(key_modes_of_use_ : key_modes_of_use)
    ~key_algorithm:(key_algorithm_ : key_algorithm)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type)
    ~wrapped_key_cryptogram:(wrapped_key_cryptogram_ : wrapped_key_cryptogram) () =
  ({
     as2805_key_variant = as2805_key_variant_;
     key_modes_of_use = key_modes_of_use_;
     key_algorithm = key_algorithm_;
     exportable = exportable_;
     wrapping_key_identifier = wrapping_key_identifier_;
     wrapped_key_cryptogram = wrapped_key_cryptogram_;
   }
    : import_as2805_key_cryptogram)

let make_import_diffie_hellman_tr31_key_block
    ~private_key_identifier:(private_key_identifier_ : key_arn_or_key_alias_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~derive_key_algorithm:(derive_key_algorithm_ : symmetric_key_algorithm)
    ~key_derivation_function:(key_derivation_function_ : key_derivation_function)
    ~key_derivation_hash_algorithm:(key_derivation_hash_algorithm_ : key_derivation_hash_algorithm)
    ~derivation_data:(derivation_data_ : diffie_hellman_derivation_data)
    ~wrapped_key_block:(wrapped_key_block_ : tr31_wrapped_key_block) () =
  ({
     private_key_identifier = private_key_identifier_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     public_key_certificate = public_key_certificate_;
     derive_key_algorithm = derive_key_algorithm_;
     key_derivation_function = key_derivation_function_;
     key_derivation_hash_algorithm = key_derivation_hash_algorithm_;
     derivation_data = derivation_data_;
     wrapped_key_block = wrapped_key_block_;
   }
    : import_diffie_hellman_tr31_key_block)

let make_import_key_output ~key:(key_ : key) () = ({ key = key_ } : import_key_output)

let make_import_key_cryptogram ?wrapping_spec:(wrapping_spec_ : wrapping_key_spec option)
    ~key_attributes:(key_attributes_ : key_attributes)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~wrapped_key_cryptogram:(wrapped_key_cryptogram_ : wrapped_key_cryptogram)
    ~import_token:(import_token_ : import_token_id) () =
  ({
     key_attributes = key_attributes_;
     exportable = exportable_;
     wrapped_key_cryptogram = wrapped_key_cryptogram_;
     import_token = import_token_;
     wrapping_spec = wrapping_spec_;
   }
    : import_key_cryptogram)

let make_import_tr34_key_block ?import_token:(import_token_ : import_token_id option)
    ?wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type option)
    ?wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type option)
    ?random_nonce:(random_nonce_ : even_hex_length_between16_and32 option)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~signing_key_certificate:(signing_key_certificate_ : certificate_type)
    ~wrapped_key_block:(wrapped_key_block_ : tr34_wrapped_key_block)
    ~key_block_format:(key_block_format_ : tr34_key_block_format) () =
  ({
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     signing_key_certificate = signing_key_certificate_;
     import_token = import_token_;
     wrapping_key_identifier = wrapping_key_identifier_;
     wrapping_key_certificate = wrapping_key_certificate_;
     wrapped_key_block = wrapped_key_block_;
     key_block_format = key_block_format_;
     random_nonce = random_nonce_;
   }
    : import_tr34_key_block)

let make_import_tr31_key_block
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type)
    ~wrapped_key_block:(wrapped_key_block_ : tr31_wrapped_key_block) () =
  ({ wrapping_key_identifier = wrapping_key_identifier_; wrapped_key_block = wrapped_key_block_ }
    : import_tr31_key_block)

let make_trusted_certificate_public_key ~key_attributes:(key_attributes_ : key_attributes)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     key_attributes = key_attributes_;
     public_key_certificate = public_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
   }
    : trusted_certificate_public_key)

let make_root_certificate_public_key ~key_attributes:(key_attributes_ : key_attributes)
    ~public_key_certificate:(public_key_certificate_ : certificate_type) () =
  ({ key_attributes = key_attributes_; public_key_certificate = public_key_certificate_ }
    : root_certificate_public_key)

let make_import_key_input
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) ?tags:(tags_ : tags option)
    ?replication_regions:(replication_regions_ : regions option)
    ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ~key_material:(key_material_ : import_key_material) () =
  ({
     key_material = key_material_;
     key_check_value_algorithm = key_check_value_algorithm_;
     enabled = enabled_;
     tags = tags_;
     replication_regions = replication_regions_;
     requester_comment = requester_comment_;
   }
    : import_key_input)

let make_key_summary ?multi_region_key_type:(multi_region_key_type_ : multi_region_key_type option)
    ?primary_region:(primary_region_ : region option) ~key_arn:(key_arn_ : key_arn)
    ~key_state:(key_state_ : key_state) ~key_attributes:(key_attributes_ : key_attributes)
    ~key_check_value:(key_check_value_ : key_check_value)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({
     key_arn = key_arn_;
     key_state = key_state_;
     key_attributes = key_attributes_;
     key_check_value = key_check_value_;
     exportable = exportable_;
     enabled = enabled_;
     multi_region_key_type = multi_region_key_type_;
     primary_region = primary_region_;
   }
    : key_summary)

let make_list_aliases_output ?next_token:(next_token_ : next_token option)
    ~aliases:(aliases_ : aliases) () =
  ({ aliases = aliases_; next_token = next_token_ } : list_aliases_output)

let make_list_aliases_input ?key_arn:(key_arn_ : key_arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ key_arn = key_arn_; next_token = next_token_; max_results = max_results_ }
    : list_aliases_input)

let make_list_keys_output ?next_token:(next_token_ : next_token option)
    ~keys:(keys_ : key_summary_list) () =
  ({ keys = keys_; next_token = next_token_ } : list_keys_output)

let make_list_keys_input ?key_state:(key_state_ : key_state option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ key_state = key_state_; next_token = next_token_; max_results = max_results_ }
    : list_keys_input)

let make_list_tags_for_resource_output ?next_token:(next_token_ : next_token option)
    ~tags:(tags_ : tags) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_arn:(resource_arn_ : resource_arn) ()
    =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_put_resource_policy_output ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : resource_policy) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_output)

let make_put_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn)
    ~policy:(policy_ : resource_policy) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_input)

let make_remove_key_replication_regions_output ~key:(key_ : key) () =
  ({ key = key_ } : remove_key_replication_regions_output)

let make_remove_key_replication_regions_input
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type)
    ~replication_regions:(replication_regions_ : regions) () =
  ({ key_identifier = key_identifier_; replication_regions = replication_regions_ }
    : remove_key_replication_regions_input)

let make_restore_key_output ~key:(key_ : key) () = ({ key = key_ } : restore_key_output)

let make_restore_key_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : restore_key_input)

let make_start_key_usage_output ~key:(key_ : key) () = ({ key = key_ } : start_key_usage_output)

let make_start_key_usage_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : start_key_usage_input)

let make_stop_key_usage_output ~key:(key_ : key) () = ({ key = key_ } : stop_key_usage_output)

let make_stop_key_usage_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : stop_key_usage_input)

let make_update_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : update_alias_output)

let make_update_alias_input ?key_arn:(key_arn_ : key_arn option)
    ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_; key_arn = key_arn_ } : update_alias_input)
