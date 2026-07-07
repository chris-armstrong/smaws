open Types

let make_wrapped_key
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ?key_check_value:(key_check_value_ : key_check_value option)
    ~key_material:(key_material_ : key_material)
    ~wrapped_key_material_format:(wrapped_key_material_format_ : wrapped_key_material_format)
    ~wrapping_key_arn:(wrapping_key_arn_ : key_arn) () =
  ({
     key_check_value_algorithm = key_check_value_algorithm_;
     key_check_value = key_check_value_;
     key_material = key_material_;
     wrapped_key_material_format = wrapped_key_material_format_;
     wrapping_key_arn = wrapping_key_arn_;
   }
    : wrapped_key)

let make_alias ?key_arn:(key_arn_ : key_arn option) ~alias_name:(alias_name_ : alias_name) () =
  ({ key_arn = key_arn_; alias_name = alias_name_ } : alias)

let make_update_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : update_alias_output)

let make_update_alias_input ?key_arn:(key_arn_ : key_arn option)
    ~alias_name:(alias_name_ : alias_name) () =
  ({ key_arn = key_arn_; alias_name = alias_name_ } : update_alias_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_key_modes_of_use
    ?no_restrictions:(no_restrictions_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?derive_key:(derive_key_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?verify:(verify_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?sign:(sign_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?generate:(generate_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?unwrap:(unwrap_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?wrap:(wrap_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?decrypt:(decrypt_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?encrypt:(encrypt_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option) () =
  ({
     no_restrictions = no_restrictions_;
     derive_key = derive_key_;
     verify = verify_;
     sign = sign_;
     generate = generate_;
     unwrap = unwrap_;
     wrap = wrap_;
     decrypt = decrypt_;
     encrypt = encrypt_;
   }
    : key_modes_of_use)

let make_key_attributes ~key_modes_of_use:(key_modes_of_use_ : key_modes_of_use)
    ~key_algorithm:(key_algorithm_ : key_algorithm) ~key_class:(key_class_ : key_class)
    ~key_usage:(key_usage_ : key_usage) () =
  ({
     key_modes_of_use = key_modes_of_use_;
     key_algorithm = key_algorithm_;
     key_class = key_class_;
     key_usage = key_usage_;
   }
    : key_attributes)

let make_trusted_certificate_public_key
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~key_attributes:(key_attributes_ : key_attributes) () =
  ({
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     public_key_certificate = public_key_certificate_;
     key_attributes = key_attributes_;
   }
    : trusted_certificate_public_key)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_replication_status_type
    ?status_message:(status_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : key_replication_state) () =
  ({ status_message = status_message_; status = status_ } : replication_status_type)

let make_mpa_status ?status_message:(status_message_ : mpa_status_message option)
    ~initiation_date:(initiation_date_ : timestamp) ~status:(status_ : session_status)
    ~mpa_session_arn:(mpa_session_arn_ : mpa_session_arn) () =
  ({
     status_message = status_message_;
     initiation_date = initiation_date_;
     status = status_;
     mpa_session_arn = mpa_session_arn_;
   }
    : mpa_status)

let make_key ?mpa_status:(mpa_status_ : mpa_status option)
    ?using_default_replication_regions:
      (using_default_replication_regions_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?replication_status:(replication_status_ : replication_status option)
    ?primary_region:(primary_region_ : region option)
    ?multi_region_key_type:(multi_region_key_type_ : multi_region_key_type option)
    ?derive_key_usage:(derive_key_usage_ : derive_key_usage option)
    ?delete_timestamp:(delete_timestamp_ : timestamp option)
    ?delete_pending_timestamp:(delete_pending_timestamp_ : timestamp option)
    ?usage_stop_timestamp:(usage_stop_timestamp_ : timestamp option)
    ?usage_start_timestamp:(usage_start_timestamp_ : timestamp option)
    ~create_timestamp:(create_timestamp_ : timestamp) ~key_origin:(key_origin_ : key_origin)
    ~key_state:(key_state_ : key_state)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm)
    ~key_check_value:(key_check_value_ : key_check_value)
    ~key_attributes:(key_attributes_ : key_attributes) ~key_arn:(key_arn_ : key_arn) () =
  ({
     mpa_status = mpa_status_;
     using_default_replication_regions = using_default_replication_regions_;
     replication_status = replication_status_;
     primary_region = primary_region_;
     multi_region_key_type = multi_region_key_type_;
     derive_key_usage = derive_key_usage_;
     delete_timestamp = delete_timestamp_;
     delete_pending_timestamp = delete_pending_timestamp_;
     usage_stop_timestamp = usage_stop_timestamp_;
     usage_start_timestamp = usage_start_timestamp_;
     create_timestamp = create_timestamp_;
     key_origin = key_origin_;
     key_state = key_state_;
     exportable = exportable_;
     enabled = enabled_;
     key_check_value_algorithm = key_check_value_algorithm_;
     key_check_value = key_check_value_;
     key_attributes = key_attributes_;
     key_arn = key_arn_;
   }
    : key)

let make_stop_key_usage_output ~key:(key_ : key) () = ({ key = key_ } : stop_key_usage_output)

let make_stop_key_usage_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : stop_key_usage_input)

let make_start_key_usage_output ~key:(key_ : key) () = ({ key = key_ } : start_key_usage_output)

let make_start_key_usage_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : start_key_usage_input)

let make_root_certificate_public_key
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~key_attributes:(key_attributes_ : key_attributes) () =
  ({ public_key_certificate = public_key_certificate_; key_attributes = key_attributes_ }
    : root_certificate_public_key)

let make_restore_key_output ~key:(key_ : key) () = ({ key = key_ } : restore_key_output)

let make_restore_key_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : restore_key_input)

let make_remove_key_replication_regions_output ~key:(key_ : key) () =
  ({ key = key_ } : remove_key_replication_regions_output)

let make_remove_key_replication_regions_input ~replication_regions:(replication_regions_ : regions)
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ replication_regions = replication_regions_; key_identifier = key_identifier_ }
    : remove_key_replication_regions_input)

let make_put_resource_policy_output ~policy:(policy_ : resource_policy)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_output)

let make_put_resource_policy_input ~policy:(policy_ : resource_policy)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_input)

let make_list_tags_for_resource_output ?next_token:(next_token_ : next_token option)
    ~tags:(tags_ : tags) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ max_results = max_results_; next_token = next_token_; resource_arn = resource_arn_ }
    : list_tags_for_resource_input)

let make_import_key_output ~key:(key_ : key) () = ({ key = key_ } : import_key_output)

let make_import_tr31_key_block ~wrapped_key_block:(wrapped_key_block_ : tr31_wrapped_key_block)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type) () =
  ({ wrapped_key_block = wrapped_key_block_; wrapping_key_identifier = wrapping_key_identifier_ }
    : import_tr31_key_block)

let make_import_tr34_key_block
    ?random_nonce:(random_nonce_ : even_hex_length_between16_and32 option)
    ?wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type option)
    ?wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type option)
    ?import_token:(import_token_ : import_token_id option)
    ~key_block_format:(key_block_format_ : tr34_key_block_format)
    ~wrapped_key_block:(wrapped_key_block_ : tr34_wrapped_key_block)
    ~signing_key_certificate:(signing_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     random_nonce = random_nonce_;
     key_block_format = key_block_format_;
     wrapped_key_block = wrapped_key_block_;
     wrapping_key_certificate = wrapping_key_certificate_;
     wrapping_key_identifier = wrapping_key_identifier_;
     import_token = import_token_;
     signing_key_certificate = signing_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
   }
    : import_tr34_key_block)

let make_import_key_cryptogram ?wrapping_spec:(wrapping_spec_ : wrapping_key_spec option)
    ~import_token:(import_token_ : import_token_id)
    ~wrapped_key_cryptogram:(wrapped_key_cryptogram_ : wrapped_key_cryptogram)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_attributes:(key_attributes_ : key_attributes) () =
  ({
     wrapping_spec = wrapping_spec_;
     import_token = import_token_;
     wrapped_key_cryptogram = wrapped_key_cryptogram_;
     exportable = exportable_;
     key_attributes = key_attributes_;
   }
    : import_key_cryptogram)

let make_import_diffie_hellman_tr31_key_block
    ~wrapped_key_block:(wrapped_key_block_ : tr31_wrapped_key_block)
    ~derivation_data:(derivation_data_ : diffie_hellman_derivation_data)
    ~key_derivation_hash_algorithm:(key_derivation_hash_algorithm_ : key_derivation_hash_algorithm)
    ~key_derivation_function:(key_derivation_function_ : key_derivation_function)
    ~derive_key_algorithm:(derive_key_algorithm_ : symmetric_key_algorithm)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~private_key_identifier:(private_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     wrapped_key_block = wrapped_key_block_;
     derivation_data = derivation_data_;
     key_derivation_hash_algorithm = key_derivation_hash_algorithm_;
     key_derivation_function = key_derivation_function_;
     derive_key_algorithm = derive_key_algorithm_;
     public_key_certificate = public_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     private_key_identifier = private_key_identifier_;
   }
    : import_diffie_hellman_tr31_key_block)

let make_import_as2805_key_cryptogram
    ~wrapped_key_cryptogram:(wrapped_key_cryptogram_ : wrapped_key_cryptogram)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_algorithm:(key_algorithm_ : key_algorithm)
    ~key_modes_of_use:(key_modes_of_use_ : key_modes_of_use)
    ~as2805_key_variant:(as2805_key_variant_ : as2805_key_variant) () =
  ({
     wrapped_key_cryptogram = wrapped_key_cryptogram_;
     wrapping_key_identifier = wrapping_key_identifier_;
     exportable = exportable_;
     key_algorithm = key_algorithm_;
     key_modes_of_use = key_modes_of_use_;
     as2805_key_variant = as2805_key_variant_;
   }
    : import_as2805_key_cryptogram)

let make_import_key_input ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ?replication_regions:(replication_regions_ : regions option) ?tags:(tags_ : tags option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ~key_material:(key_material_ : import_key_material) () =
  ({
     requester_comment = requester_comment_;
     replication_regions = replication_regions_;
     tags = tags_;
     enabled = enabled_;
     key_check_value_algorithm = key_check_value_algorithm_;
     key_material = key_material_;
   }
    : import_key_input)

let make_get_resource_policy_output ~policy:(policy_ : resource_policy)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_get_public_key_certificate_output
    ~key_certificate_chain:(key_certificate_chain_ : certificate_type)
    ~key_certificate:(key_certificate_ : certificate_type) () =
  ({ key_certificate_chain = key_certificate_chain_; key_certificate = key_certificate_ }
    : get_public_key_certificate_output)

let make_get_public_key_certificate_input
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : get_public_key_certificate_input)

let make_get_parameters_for_import_output
    ~parameters_valid_until_timestamp:(parameters_valid_until_timestamp_ : timestamp)
    ~import_token:(import_token_ : import_token_id)
    ~wrapping_key_algorithm:(wrapping_key_algorithm_ : key_algorithm)
    ~wrapping_key_certificate_chain:(wrapping_key_certificate_chain_ : certificate_type)
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type) () =
  ({
     parameters_valid_until_timestamp = parameters_valid_until_timestamp_;
     import_token = import_token_;
     wrapping_key_algorithm = wrapping_key_algorithm_;
     wrapping_key_certificate_chain = wrapping_key_certificate_chain_;
     wrapping_key_certificate = wrapping_key_certificate_;
   }
    : get_parameters_for_import_output)

let make_get_parameters_for_import_input
    ?reuse_last_generated_token:
      (reuse_last_generated_token_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~wrapping_key_algorithm:(wrapping_key_algorithm_ : key_algorithm)
    ~key_material_type:(key_material_type_ : key_material_type) () =
  ({
     reuse_last_generated_token = reuse_last_generated_token_;
     wrapping_key_algorithm = wrapping_key_algorithm_;
     key_material_type = key_material_type_;
   }
    : get_parameters_for_import_input)

let make_get_parameters_for_export_output
    ~parameters_valid_until_timestamp:(parameters_valid_until_timestamp_ : timestamp)
    ~export_token:(export_token_ : export_token_id)
    ~signing_key_algorithm:(signing_key_algorithm_ : key_algorithm)
    ~signing_key_certificate_chain:(signing_key_certificate_chain_ : certificate_type)
    ~signing_key_certificate:(signing_key_certificate_ : certificate_type) () =
  ({
     parameters_valid_until_timestamp = parameters_valid_until_timestamp_;
     export_token = export_token_;
     signing_key_algorithm = signing_key_algorithm_;
     signing_key_certificate_chain = signing_key_certificate_chain_;
     signing_key_certificate = signing_key_certificate_;
   }
    : get_parameters_for_export_output)

let make_get_parameters_for_export_input
    ?reuse_last_generated_token:
      (reuse_last_generated_token_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~signing_key_algorithm:(signing_key_algorithm_ : key_algorithm)
    ~key_material_type:(key_material_type_ : key_material_type) () =
  ({
     reuse_last_generated_token = reuse_last_generated_token_;
     signing_key_algorithm = signing_key_algorithm_;
     key_material_type = key_material_type_;
   }
    : get_parameters_for_export_input)

let make_mpa_team_association ?mpa_status:(mpa_status_ : mpa_status option)
    ~association_state:(association_state_ : association_state)
    ~mpa_team_arn:(mpa_team_arn_ : mpa_team_arn) ~action:(action_ : mpa_operation) () =
  ({
     mpa_status = mpa_status_;
     association_state = association_state_;
     mpa_team_arn = mpa_team_arn_;
     action = action_;
   }
    : mpa_team_association)

let make_get_mpa_team_association_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : get_mpa_team_association_output)

let make_get_mpa_team_association_input ~action:(action_ : mpa_operation) () =
  ({ action = action_ } : get_mpa_team_association_input)

let make_get_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : get_default_key_replication_regions_output)

let make_get_default_key_replication_regions_input () = (() : unit)

let make_get_certificate_signing_request_output
    ~certificate_signing_request:(certificate_signing_request_ : certificate_signing_request_type)
    () =
  ({ certificate_signing_request = certificate_signing_request_ }
    : get_certificate_signing_request_output)

let make_certificate_subject_type
    ?email_address:(email_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?state_or_province:(state_or_province_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?country:(country_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?city:(city_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization:(organization_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?organization_unit:(organization_unit_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~common_name:(common_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     email_address = email_address_;
     state_or_province = state_or_province_;
     country = country_;
     city = city_;
     organization = organization_;
     organization_unit = organization_unit_;
     common_name = common_name_;
   }
    : certificate_subject_type)

let make_get_certificate_signing_request_input
    ~certificate_subject:(certificate_subject_ : certificate_subject_type)
    ~signing_algorithm:(signing_algorithm_ : signing_algorithm_type)
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     certificate_subject = certificate_subject_;
     signing_algorithm = signing_algorithm_;
     key_identifier = key_identifier_;
   }
    : get_certificate_signing_request_input)

let make_export_key_output ?wrapped_key:(wrapped_key_ : wrapped_key option) () =
  ({ wrapped_key = wrapped_key_ } : export_key_output)

let make_key_block_headers ?optional_blocks:(optional_blocks_ : optional_blocks option)
    ?key_version:(key_version_ : key_version option)
    ?key_exportability:(key_exportability_ : key_exportability option)
    ?key_modes_of_use:(key_modes_of_use_ : key_modes_of_use option) () =
  ({
     optional_blocks = optional_blocks_;
     key_version = key_version_;
     key_exportability = key_exportability_;
     key_modes_of_use = key_modes_of_use_;
   }
    : key_block_headers)

let make_export_tr31_key_block ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_block_headers = key_block_headers_; wrapping_key_identifier = wrapping_key_identifier_ }
    : export_tr31_key_block)

let make_export_tr34_key_block ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ?random_nonce:(random_nonce_ : even_hex_length_between16_and32 option)
    ?signing_key_certificate:(signing_key_certificate_ : certificate_type option)
    ?signing_key_identifier:(signing_key_identifier_ : key_arn_or_key_alias_type option)
    ?export_token:(export_token_ : export_token_id option)
    ~key_block_format:(key_block_format_ : tr34_key_block_format)
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     key_block_headers = key_block_headers_;
     random_nonce = random_nonce_;
     key_block_format = key_block_format_;
     signing_key_certificate = signing_key_certificate_;
     signing_key_identifier = signing_key_identifier_;
     export_token = export_token_;
     wrapping_key_certificate = wrapping_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
   }
    : export_tr34_key_block)

let make_export_key_cryptogram ?wrapping_spec:(wrapping_spec_ : wrapping_key_spec option)
    ~wrapping_key_certificate:(wrapping_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     wrapping_spec = wrapping_spec_;
     wrapping_key_certificate = wrapping_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
   }
    : export_key_cryptogram)

let make_export_diffie_hellman_tr31_key_block
    ?key_block_headers:(key_block_headers_ : key_block_headers option)
    ~derivation_data:(derivation_data_ : diffie_hellman_derivation_data)
    ~key_derivation_hash_algorithm:(key_derivation_hash_algorithm_ : key_derivation_hash_algorithm)
    ~key_derivation_function:(key_derivation_function_ : key_derivation_function)
    ~derive_key_algorithm:(derive_key_algorithm_ : symmetric_key_algorithm)
    ~public_key_certificate:(public_key_certificate_ : certificate_type)
    ~certificate_authority_public_key_identifier:
      (certificate_authority_public_key_identifier_ : key_arn_or_key_alias_type)
    ~private_key_identifier:(private_key_identifier_ : key_arn_or_key_alias_type) () =
  ({
     key_block_headers = key_block_headers_;
     derivation_data = derivation_data_;
     key_derivation_hash_algorithm = key_derivation_hash_algorithm_;
     key_derivation_function = key_derivation_function_;
     derive_key_algorithm = derive_key_algorithm_;
     public_key_certificate = public_key_certificate_;
     certificate_authority_public_key_identifier = certificate_authority_public_key_identifier_;
     private_key_identifier = private_key_identifier_;
   }
    : export_diffie_hellman_tr31_key_block)

let make_export_as2805_key_cryptogram ~as2805_key_variant:(as2805_key_variant_ : as2805_key_variant)
    ~wrapping_key_identifier:(wrapping_key_identifier_ : key_arn_or_key_alias_type) () =
  ({ as2805_key_variant = as2805_key_variant_; wrapping_key_identifier = wrapping_key_identifier_ }
    : export_as2805_key_cryptogram)

let make_export_dukpt_initial_key ~key_serial_number:(key_serial_number_ : hex_length20_or24) () =
  ({ key_serial_number = key_serial_number_ } : export_dukpt_initial_key)

let make_export_attributes
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ?export_dukpt_initial_key:(export_dukpt_initial_key_ : export_dukpt_initial_key option) () =
  ({
     key_check_value_algorithm = key_check_value_algorithm_;
     export_dukpt_initial_key = export_dukpt_initial_key_;
   }
    : export_attributes)

let make_export_key_input ?export_attributes:(export_attributes_ : export_attributes option)
    ~export_key_identifier:(export_key_identifier_ : key_arn_or_key_alias_type)
    ~key_material:(key_material_ : export_key_material) () =
  ({
     export_attributes = export_attributes_;
     export_key_identifier = export_key_identifier_;
     key_material = key_material_;
   }
    : export_key_input)

let make_enable_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : enable_default_key_replication_regions_output)

let make_enable_default_key_replication_regions_input
    ~replication_regions:(replication_regions_ : regions) () =
  ({ replication_regions = replication_regions_ } : enable_default_key_replication_regions_input)

let make_disassociate_mpa_team_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : disassociate_mpa_team_output)

let make_disassociate_mpa_team_input
    ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ~action:(action_ : mpa_operation) () =
  ({ requester_comment = requester_comment_; action = action_ } : disassociate_mpa_team_input)

let make_disable_default_key_replication_regions_output
    ~enabled_replication_regions:(enabled_replication_regions_ : regions) () =
  ({ enabled_replication_regions = enabled_replication_regions_ }
    : disable_default_key_replication_regions_output)

let make_disable_default_key_replication_regions_input
    ~replication_regions:(replication_regions_ : regions) () =
  ({ replication_regions = replication_regions_ } : disable_default_key_replication_regions_input)

let make_delete_resource_policy_output () = (() : unit)

let make_delete_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_input)

let make_associate_mpa_team_output
    ~mpa_team_association:(mpa_team_association_ : mpa_team_association) () =
  ({ mpa_team_association = mpa_team_association_ } : associate_mpa_team_output)

let make_associate_mpa_team_input
    ?requester_comment:(requester_comment_ : mpa_requester_comment option)
    ~mpa_team_arn:(mpa_team_arn_ : mpa_team_arn) ~action:(action_ : mpa_operation) () =
  ({ requester_comment = requester_comment_; mpa_team_arn = mpa_team_arn_; action = action_ }
    : associate_mpa_team_input)

let make_key_summary ?primary_region:(primary_region_ : region option)
    ?multi_region_key_type:(multi_region_key_type_ : multi_region_key_type option)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_check_value:(key_check_value_ : key_check_value)
    ~key_attributes:(key_attributes_ : key_attributes) ~key_state:(key_state_ : key_state)
    ~key_arn:(key_arn_ : key_arn) () =
  ({
     primary_region = primary_region_;
     multi_region_key_type = multi_region_key_type_;
     enabled = enabled_;
     exportable = exportable_;
     key_check_value = key_check_value_;
     key_attributes = key_attributes_;
     key_state = key_state_;
     key_arn = key_arn_;
   }
    : key_summary)

let make_list_keys_output ?next_token:(next_token_ : next_token option)
    ~keys:(keys_ : key_summary_list) () =
  ({ next_token = next_token_; keys = keys_ } : list_keys_output)

let make_list_keys_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?key_state:(key_state_ : key_state option) () =
  ({ max_results = max_results_; next_token = next_token_; key_state = key_state_ }
    : list_keys_input)

let make_list_aliases_output ?next_token:(next_token_ : next_token option)
    ~aliases:(aliases_ : aliases) () =
  ({ next_token = next_token_; aliases = aliases_ } : list_aliases_output)

let make_list_aliases_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?key_arn:(key_arn_ : key_arn option) () =
  ({ max_results = max_results_; next_token = next_token_; key_arn = key_arn_ }
    : list_aliases_input)

let make_get_key_output ~key:(key_ : key) () = ({ key = key_ } : get_key_output)

let make_get_key_input ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ key_identifier = key_identifier_ } : get_key_input)

let make_get_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : get_alias_output)

let make_get_alias_input ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_ } : get_alias_input)

let make_delete_key_output ~key:(key_ : key) () = ({ key = key_ } : delete_key_output)

let make_delete_key_input
    ?delete_key_in_days:(delete_key_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ delete_key_in_days = delete_key_in_days_; key_identifier = key_identifier_ }
    : delete_key_input)

let make_delete_alias_output () = (() : unit)

let make_delete_alias_input ~alias_name:(alias_name_ : alias_name) () =
  ({ alias_name = alias_name_ } : delete_alias_input)

let make_create_key_output ~key:(key_ : key) () = ({ key = key_ } : create_key_output)

let make_create_key_input ?replication_regions:(replication_regions_ : regions option)
    ?derive_key_usage:(derive_key_usage_ : derive_key_usage option) ?tags:(tags_ : tags option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?key_check_value_algorithm:(key_check_value_algorithm_ : key_check_value_algorithm option)
    ~exportable:(exportable_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~key_attributes:(key_attributes_ : key_attributes) () =
  ({
     replication_regions = replication_regions_;
     derive_key_usage = derive_key_usage_;
     tags = tags_;
     enabled = enabled_;
     exportable = exportable_;
     key_check_value_algorithm = key_check_value_algorithm_;
     key_attributes = key_attributes_;
   }
    : create_key_input)

let make_create_alias_output ~alias:(alias_ : alias) () = ({ alias = alias_ } : create_alias_output)

let make_create_alias_input ?key_arn:(key_arn_ : key_arn option)
    ~alias_name:(alias_name_ : alias_name) () =
  ({ key_arn = key_arn_; alias_name = alias_name_ } : create_alias_input)

let make_add_key_replication_regions_output ~key:(key_ : key) () =
  ({ key = key_ } : add_key_replication_regions_output)

let make_add_key_replication_regions_input ~replication_regions:(replication_regions_ : regions)
    ~key_identifier:(key_identifier_ : key_arn_or_key_alias_type) () =
  ({ replication_regions = replication_regions_; key_identifier = key_identifier_ }
    : add_key_replication_regions_input)
