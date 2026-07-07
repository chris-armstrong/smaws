open Types

val make_wrapped_key :
  ?key_check_value_algorithm:key_check_value_algorithm ->
  ?key_check_value:key_check_value ->
  key_material:key_material ->
  wrapped_key_material_format:wrapped_key_material_format ->
  wrapping_key_arn:key_arn ->
  unit ->
  wrapped_key

val make_alias : ?key_arn:key_arn -> alias_name:alias_name -> unit -> alias
val make_update_alias_output : alias:alias -> unit -> update_alias_output

val make_update_alias_input :
  ?key_arn:key_arn -> alias_name:alias_name -> unit -> update_alias_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_keys -> resource_arn:resource_arn -> unit -> untag_resource_input

val make_key_modes_of_use :
  ?no_restrictions:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?derive_key:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?verify:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?sign:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?generate:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?unwrap:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?wrap:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?decrypt:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?encrypt:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  key_modes_of_use

val make_key_attributes :
  key_modes_of_use:key_modes_of_use ->
  key_algorithm:key_algorithm ->
  key_class:key_class ->
  key_usage:key_usage ->
  unit ->
  key_attributes

val make_trusted_certificate_public_key :
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  public_key_certificate:certificate_type ->
  key_attributes:key_attributes ->
  unit ->
  trusted_certificate_public_key

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_output : unit -> unit
val make_tag_resource_input : tags:tags -> resource_arn:resource_arn -> unit -> tag_resource_input

val make_replication_status_type :
  ?status_message:Smaws_Lib.Smithy_api.Types.string_ ->
  status:key_replication_state ->
  unit ->
  replication_status_type

val make_mpa_status :
  ?status_message:mpa_status_message ->
  initiation_date:timestamp ->
  status:session_status ->
  mpa_session_arn:mpa_session_arn ->
  unit ->
  mpa_status

val make_key :
  ?mpa_status:mpa_status ->
  ?using_default_replication_regions:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?replication_status:replication_status ->
  ?primary_region:region ->
  ?multi_region_key_type:multi_region_key_type ->
  ?derive_key_usage:derive_key_usage ->
  ?delete_timestamp:timestamp ->
  ?delete_pending_timestamp:timestamp ->
  ?usage_stop_timestamp:timestamp ->
  ?usage_start_timestamp:timestamp ->
  create_timestamp:timestamp ->
  key_origin:key_origin ->
  key_state:key_state ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_check_value_algorithm:key_check_value_algorithm ->
  key_check_value:key_check_value ->
  key_attributes:key_attributes ->
  key_arn:key_arn ->
  unit ->
  key

val make_stop_key_usage_output : key:key -> unit -> stop_key_usage_output

val make_stop_key_usage_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> stop_key_usage_input

val make_start_key_usage_output : key:key -> unit -> start_key_usage_output

val make_start_key_usage_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> start_key_usage_input

val make_root_certificate_public_key :
  public_key_certificate:certificate_type ->
  key_attributes:key_attributes ->
  unit ->
  root_certificate_public_key

val make_restore_key_output : key:key -> unit -> restore_key_output
val make_restore_key_input : key_identifier:key_arn_or_key_alias_type -> unit -> restore_key_input

val make_remove_key_replication_regions_output :
  key:key -> unit -> remove_key_replication_regions_output

val make_remove_key_replication_regions_input :
  replication_regions:regions ->
  key_identifier:key_arn_or_key_alias_type ->
  unit ->
  remove_key_replication_regions_input

val make_put_resource_policy_output :
  policy:resource_policy -> resource_arn:resource_arn -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  policy:resource_policy -> resource_arn:resource_arn -> unit -> put_resource_policy_input

val make_list_tags_for_resource_output :
  ?next_token:next_token -> tags:tags -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_input

val make_import_key_output : key:key -> unit -> import_key_output

val make_import_tr31_key_block :
  wrapped_key_block:tr31_wrapped_key_block ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  import_tr31_key_block

val make_import_tr34_key_block :
  ?random_nonce:even_hex_length_between16_and32 ->
  ?wrapping_key_certificate:certificate_type ->
  ?wrapping_key_identifier:key_arn_or_key_alias_type ->
  ?import_token:import_token_id ->
  key_block_format:tr34_key_block_format ->
  wrapped_key_block:tr34_wrapped_key_block ->
  signing_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  import_tr34_key_block

val make_import_key_cryptogram :
  ?wrapping_spec:wrapping_key_spec ->
  import_token:import_token_id ->
  wrapped_key_cryptogram:wrapped_key_cryptogram ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_attributes:key_attributes ->
  unit ->
  import_key_cryptogram

val make_import_diffie_hellman_tr31_key_block :
  wrapped_key_block:tr31_wrapped_key_block ->
  derivation_data:diffie_hellman_derivation_data ->
  key_derivation_hash_algorithm:key_derivation_hash_algorithm ->
  key_derivation_function:key_derivation_function ->
  derive_key_algorithm:symmetric_key_algorithm ->
  public_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  private_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  import_diffie_hellman_tr31_key_block

val make_import_as2805_key_cryptogram :
  wrapped_key_cryptogram:wrapped_key_cryptogram ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_algorithm:key_algorithm ->
  key_modes_of_use:key_modes_of_use ->
  as2805_key_variant:as2805_key_variant ->
  unit ->
  import_as2805_key_cryptogram

val make_import_key_input :
  ?requester_comment:mpa_requester_comment ->
  ?replication_regions:regions ->
  ?tags:tags ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?key_check_value_algorithm:key_check_value_algorithm ->
  key_material:import_key_material ->
  unit ->
  import_key_input

val make_get_resource_policy_output :
  policy:resource_policy -> resource_arn:resource_arn -> unit -> get_resource_policy_output

val make_get_resource_policy_input : resource_arn:resource_arn -> unit -> get_resource_policy_input

val make_get_public_key_certificate_output :
  key_certificate_chain:certificate_type ->
  key_certificate:certificate_type ->
  unit ->
  get_public_key_certificate_output

val make_get_public_key_certificate_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> get_public_key_certificate_input

val make_get_parameters_for_import_output :
  parameters_valid_until_timestamp:timestamp ->
  import_token:import_token_id ->
  wrapping_key_algorithm:key_algorithm ->
  wrapping_key_certificate_chain:certificate_type ->
  wrapping_key_certificate:certificate_type ->
  unit ->
  get_parameters_for_import_output

val make_get_parameters_for_import_input :
  ?reuse_last_generated_token:Smaws_Lib.Smithy_api.Types.boolean_ ->
  wrapping_key_algorithm:key_algorithm ->
  key_material_type:key_material_type ->
  unit ->
  get_parameters_for_import_input

val make_get_parameters_for_export_output :
  parameters_valid_until_timestamp:timestamp ->
  export_token:export_token_id ->
  signing_key_algorithm:key_algorithm ->
  signing_key_certificate_chain:certificate_type ->
  signing_key_certificate:certificate_type ->
  unit ->
  get_parameters_for_export_output

val make_get_parameters_for_export_input :
  ?reuse_last_generated_token:Smaws_Lib.Smithy_api.Types.boolean_ ->
  signing_key_algorithm:key_algorithm ->
  key_material_type:key_material_type ->
  unit ->
  get_parameters_for_export_input

val make_mpa_team_association :
  ?mpa_status:mpa_status ->
  association_state:association_state ->
  mpa_team_arn:mpa_team_arn ->
  action:mpa_operation ->
  unit ->
  mpa_team_association

val make_get_mpa_team_association_output :
  mpa_team_association:mpa_team_association -> unit -> get_mpa_team_association_output

val make_get_mpa_team_association_input :
  action:mpa_operation -> unit -> get_mpa_team_association_input

val make_get_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> get_default_key_replication_regions_output

val make_get_default_key_replication_regions_input : unit -> unit

val make_get_certificate_signing_request_output :
  certificate_signing_request:certificate_signing_request_type ->
  unit ->
  get_certificate_signing_request_output

val make_certificate_subject_type :
  ?email_address:Smaws_Lib.Smithy_api.Types.string_ ->
  ?state_or_province:Smaws_Lib.Smithy_api.Types.string_ ->
  ?country:Smaws_Lib.Smithy_api.Types.string_ ->
  ?city:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_unit:Smaws_Lib.Smithy_api.Types.string_ ->
  common_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  certificate_subject_type

val make_get_certificate_signing_request_input :
  certificate_subject:certificate_subject_type ->
  signing_algorithm:signing_algorithm_type ->
  key_identifier:key_arn_or_key_alias_type ->
  unit ->
  get_certificate_signing_request_input

val make_export_key_output : ?wrapped_key:wrapped_key -> unit -> export_key_output

val make_key_block_headers :
  ?optional_blocks:optional_blocks ->
  ?key_version:key_version ->
  ?key_exportability:key_exportability ->
  ?key_modes_of_use:key_modes_of_use ->
  unit ->
  key_block_headers

val make_export_tr31_key_block :
  ?key_block_headers:key_block_headers ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_tr31_key_block

val make_export_tr34_key_block :
  ?key_block_headers:key_block_headers ->
  ?random_nonce:even_hex_length_between16_and32 ->
  ?signing_key_certificate:certificate_type ->
  ?signing_key_identifier:key_arn_or_key_alias_type ->
  ?export_token:export_token_id ->
  key_block_format:tr34_key_block_format ->
  wrapping_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_tr34_key_block

val make_export_key_cryptogram :
  ?wrapping_spec:wrapping_key_spec ->
  wrapping_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_key_cryptogram

val make_export_diffie_hellman_tr31_key_block :
  ?key_block_headers:key_block_headers ->
  derivation_data:diffie_hellman_derivation_data ->
  key_derivation_hash_algorithm:key_derivation_hash_algorithm ->
  key_derivation_function:key_derivation_function ->
  derive_key_algorithm:symmetric_key_algorithm ->
  public_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  private_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_diffie_hellman_tr31_key_block

val make_export_as2805_key_cryptogram :
  as2805_key_variant:as2805_key_variant ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_as2805_key_cryptogram

val make_export_dukpt_initial_key :
  key_serial_number:hex_length20_or24 -> unit -> export_dukpt_initial_key

val make_export_attributes :
  ?key_check_value_algorithm:key_check_value_algorithm ->
  ?export_dukpt_initial_key:export_dukpt_initial_key ->
  unit ->
  export_attributes

val make_export_key_input :
  ?export_attributes:export_attributes ->
  export_key_identifier:key_arn_or_key_alias_type ->
  key_material:export_key_material ->
  unit ->
  export_key_input

val make_enable_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> enable_default_key_replication_regions_output

val make_enable_default_key_replication_regions_input :
  replication_regions:regions -> unit -> enable_default_key_replication_regions_input

val make_disassociate_mpa_team_output :
  mpa_team_association:mpa_team_association -> unit -> disassociate_mpa_team_output

val make_disassociate_mpa_team_input :
  ?requester_comment:mpa_requester_comment ->
  action:mpa_operation ->
  unit ->
  disassociate_mpa_team_input

val make_disable_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> disable_default_key_replication_regions_output

val make_disable_default_key_replication_regions_input :
  replication_regions:regions -> unit -> disable_default_key_replication_regions_input

val make_delete_resource_policy_output : unit -> unit

val make_delete_resource_policy_input :
  resource_arn:resource_arn -> unit -> delete_resource_policy_input

val make_associate_mpa_team_output :
  mpa_team_association:mpa_team_association -> unit -> associate_mpa_team_output

val make_associate_mpa_team_input :
  ?requester_comment:mpa_requester_comment ->
  mpa_team_arn:mpa_team_arn ->
  action:mpa_operation ->
  unit ->
  associate_mpa_team_input

val make_key_summary :
  ?primary_region:region ->
  ?multi_region_key_type:multi_region_key_type ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_check_value:key_check_value ->
  key_attributes:key_attributes ->
  key_state:key_state ->
  key_arn:key_arn ->
  unit ->
  key_summary

val make_list_keys_output :
  ?next_token:next_token -> keys:key_summary_list -> unit -> list_keys_output

val make_list_keys_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?key_state:key_state ->
  unit ->
  list_keys_input

val make_list_aliases_output :
  ?next_token:next_token -> aliases:aliases -> unit -> list_aliases_output

val make_list_aliases_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?key_arn:key_arn ->
  unit ->
  list_aliases_input

val make_get_key_output : key:key -> unit -> get_key_output
val make_get_key_input : key_identifier:key_arn_or_key_alias_type -> unit -> get_key_input
val make_get_alias_output : alias:alias -> unit -> get_alias_output
val make_get_alias_input : alias_name:alias_name -> unit -> get_alias_input
val make_delete_key_output : key:key -> unit -> delete_key_output

val make_delete_key_input :
  ?delete_key_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  key_identifier:key_arn_or_key_alias_type ->
  unit ->
  delete_key_input

val make_delete_alias_output : unit -> unit
val make_delete_alias_input : alias_name:alias_name -> unit -> delete_alias_input
val make_create_key_output : key:key -> unit -> create_key_output

val make_create_key_input :
  ?replication_regions:regions ->
  ?derive_key_usage:derive_key_usage ->
  ?tags:tags ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?key_check_value_algorithm:key_check_value_algorithm ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_attributes:key_attributes ->
  unit ->
  create_key_input

val make_create_alias_output : alias:alias -> unit -> create_alias_output

val make_create_alias_input :
  ?key_arn:key_arn -> alias_name:alias_name -> unit -> create_alias_input

val make_add_key_replication_regions_output : key:key -> unit -> add_key_replication_regions_output

val make_add_key_replication_regions_input :
  replication_regions:regions ->
  key_identifier:key_arn_or_key_alias_type ->
  unit ->
  add_key_replication_regions_input
