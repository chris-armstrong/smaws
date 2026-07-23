open Types

val make_mpa_status :
  ?status_message:mpa_status_message ->
  mpa_session_arn:mpa_session_arn ->
  status:session_status ->
  initiation_date:timestamp ->
  unit ->
  mpa_status

val make_replication_status_type :
  ?status_message:Smaws_Lib.Smithy_api.Types.string_ ->
  status:key_replication_state ->
  unit ->
  replication_status_type

val make_key_modes_of_use :
  ?encrypt:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?decrypt:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?wrap:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?unwrap:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?generate:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?sign:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?verify:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?derive_key:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?no_restrictions:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  key_modes_of_use

val make_key_attributes :
  key_usage:key_usage ->
  key_class:key_class ->
  key_algorithm:key_algorithm ->
  key_modes_of_use:key_modes_of_use ->
  unit ->
  key_attributes

val make_key :
  ?usage_start_timestamp:timestamp ->
  ?usage_stop_timestamp:timestamp ->
  ?delete_pending_timestamp:timestamp ->
  ?delete_timestamp:timestamp ->
  ?derive_key_usage:derive_key_usage ->
  ?multi_region_key_type:multi_region_key_type ->
  ?primary_region:region ->
  ?replication_status:replication_status ->
  ?using_default_replication_regions:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?mpa_status:mpa_status ->
  key_arn:key_arn ->
  key_attributes:key_attributes ->
  key_check_value:key_check_value ->
  key_check_value_algorithm:key_check_value_algorithm ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_state:key_state ->
  key_origin:key_origin ->
  create_timestamp:timestamp ->
  unit ->
  key

val make_add_key_replication_regions_output : key:key -> unit -> add_key_replication_regions_output

val make_add_key_replication_regions_input :
  key_identifier:key_arn_or_key_alias_type ->
  replication_regions:regions ->
  unit ->
  add_key_replication_regions_input

val make_alias : ?key_arn:key_arn -> alias_name:alias_name -> unit -> alias

val make_mpa_team_association :
  ?mpa_status:mpa_status ->
  action:mpa_operation ->
  mpa_team_arn:mpa_team_arn ->
  association_state:association_state ->
  unit ->
  mpa_team_association

val make_associate_mpa_team_output :
  mpa_team_association:mpa_team_association -> unit -> associate_mpa_team_output

val make_associate_mpa_team_input :
  ?requester_comment:mpa_requester_comment ->
  action:mpa_operation ->
  mpa_team_arn:mpa_team_arn ->
  unit ->
  associate_mpa_team_input

val make_certificate_subject_type :
  ?organization_unit:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization:Smaws_Lib.Smithy_api.Types.string_ ->
  ?city:Smaws_Lib.Smithy_api.Types.string_ ->
  ?country:Smaws_Lib.Smithy_api.Types.string_ ->
  ?state_or_province:Smaws_Lib.Smithy_api.Types.string_ ->
  ?email_address:Smaws_Lib.Smithy_api.Types.string_ ->
  common_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  certificate_subject_type

val make_create_alias_output : alias:alias -> unit -> create_alias_output

val make_create_alias_input :
  ?key_arn:key_arn -> alias_name:alias_name -> unit -> create_alias_input

val make_create_key_output : key:key -> unit -> create_key_output
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_key_input :
  ?key_check_value_algorithm:key_check_value_algorithm ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tags ->
  ?derive_key_usage:derive_key_usage ->
  ?replication_regions:regions ->
  key_attributes:key_attributes ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  create_key_input

val make_delete_alias_output : unit -> unit
val make_delete_alias_input : alias_name:alias_name -> unit -> delete_alias_input
val make_delete_key_output : key:key -> unit -> delete_key_output

val make_delete_key_input :
  ?delete_key_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  key_identifier:key_arn_or_key_alias_type ->
  unit ->
  delete_key_input

val make_delete_resource_policy_output : unit -> unit

val make_delete_resource_policy_input :
  resource_arn:resource_arn -> unit -> delete_resource_policy_input

val make_disable_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> disable_default_key_replication_regions_output

val make_disable_default_key_replication_regions_input :
  replication_regions:regions -> unit -> disable_default_key_replication_regions_input

val make_disassociate_mpa_team_output :
  mpa_team_association:mpa_team_association -> unit -> disassociate_mpa_team_output

val make_disassociate_mpa_team_input :
  ?requester_comment:mpa_requester_comment ->
  action:mpa_operation ->
  unit ->
  disassociate_mpa_team_input

val make_enable_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> enable_default_key_replication_regions_output

val make_enable_default_key_replication_regions_input :
  replication_regions:regions -> unit -> enable_default_key_replication_regions_input

val make_export_as2805_key_cryptogram :
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  as2805_key_variant:as2805_key_variant ->
  unit ->
  export_as2805_key_cryptogram

val make_export_dukpt_initial_key :
  key_serial_number:hex_length20_or24 -> unit -> export_dukpt_initial_key

val make_export_attributes :
  ?export_dukpt_initial_key:export_dukpt_initial_key ->
  ?key_check_value_algorithm:key_check_value_algorithm ->
  unit ->
  export_attributes

val make_key_block_headers :
  ?key_modes_of_use:key_modes_of_use ->
  ?key_exportability:key_exportability ->
  ?key_version:key_version ->
  ?optional_blocks:optional_blocks ->
  unit ->
  key_block_headers

val make_export_diffie_hellman_tr31_key_block :
  ?key_block_headers:key_block_headers ->
  private_key_identifier:key_arn_or_key_alias_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  public_key_certificate:certificate_type ->
  derive_key_algorithm:symmetric_key_algorithm ->
  key_derivation_function:key_derivation_function ->
  key_derivation_hash_algorithm:key_derivation_hash_algorithm ->
  derivation_data:diffie_hellman_derivation_data ->
  unit ->
  export_diffie_hellman_tr31_key_block

val make_wrapped_key :
  ?key_check_value:key_check_value ->
  ?key_check_value_algorithm:key_check_value_algorithm ->
  wrapping_key_arn:key_arn ->
  wrapped_key_material_format:wrapped_key_material_format ->
  key_material:key_material ->
  unit ->
  wrapped_key

val make_export_key_output : ?wrapped_key:wrapped_key -> unit -> export_key_output

val make_export_key_cryptogram :
  ?wrapping_spec:wrapping_key_spec ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  wrapping_key_certificate:certificate_type ->
  unit ->
  export_key_cryptogram

val make_export_tr34_key_block :
  ?export_token:export_token_id ->
  ?signing_key_identifier:key_arn_or_key_alias_type ->
  ?signing_key_certificate:certificate_type ->
  ?random_nonce:even_hex_length_between16_and32 ->
  ?key_block_headers:key_block_headers ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  wrapping_key_certificate:certificate_type ->
  key_block_format:tr34_key_block_format ->
  unit ->
  export_tr34_key_block

val make_export_tr31_key_block :
  ?key_block_headers:key_block_headers ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_tr31_key_block

val make_export_key_input :
  ?export_attributes:export_attributes ->
  key_material:export_key_material ->
  export_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  export_key_input

val make_get_alias_output : alias:alias -> unit -> get_alias_output
val make_get_alias_input : alias_name:alias_name -> unit -> get_alias_input

val make_get_certificate_signing_request_output :
  certificate_signing_request:certificate_signing_request_type ->
  unit ->
  get_certificate_signing_request_output

val make_get_certificate_signing_request_input :
  key_identifier:key_arn_or_key_alias_type ->
  signing_algorithm:signing_algorithm_type ->
  certificate_subject:certificate_subject_type ->
  unit ->
  get_certificate_signing_request_input

val make_get_default_key_replication_regions_output :
  enabled_replication_regions:regions -> unit -> get_default_key_replication_regions_output

val make_get_default_key_replication_regions_input : unit -> unit
val make_get_key_output : key:key -> unit -> get_key_output
val make_get_key_input : key_identifier:key_arn_or_key_alias_type -> unit -> get_key_input

val make_get_mpa_team_association_output :
  mpa_team_association:mpa_team_association -> unit -> get_mpa_team_association_output

val make_get_mpa_team_association_input :
  action:mpa_operation -> unit -> get_mpa_team_association_input

val make_get_parameters_for_export_output :
  signing_key_certificate:certificate_type ->
  signing_key_certificate_chain:certificate_type ->
  signing_key_algorithm:key_algorithm ->
  export_token:export_token_id ->
  parameters_valid_until_timestamp:timestamp ->
  unit ->
  get_parameters_for_export_output

val make_get_parameters_for_export_input :
  ?reuse_last_generated_token:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_material_type:key_material_type ->
  signing_key_algorithm:key_algorithm ->
  unit ->
  get_parameters_for_export_input

val make_get_parameters_for_import_output :
  wrapping_key_certificate:certificate_type ->
  wrapping_key_certificate_chain:certificate_type ->
  wrapping_key_algorithm:key_algorithm ->
  import_token:import_token_id ->
  parameters_valid_until_timestamp:timestamp ->
  unit ->
  get_parameters_for_import_output

val make_get_parameters_for_import_input :
  ?reuse_last_generated_token:Smaws_Lib.Smithy_api.Types.boolean_ ->
  key_material_type:key_material_type ->
  wrapping_key_algorithm:key_algorithm ->
  unit ->
  get_parameters_for_import_input

val make_get_public_key_certificate_output :
  key_certificate:certificate_type ->
  key_certificate_chain:certificate_type ->
  unit ->
  get_public_key_certificate_output

val make_get_public_key_certificate_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> get_public_key_certificate_input

val make_get_resource_policy_output :
  resource_arn:resource_arn -> policy:resource_policy -> unit -> get_resource_policy_output

val make_get_resource_policy_input : resource_arn:resource_arn -> unit -> get_resource_policy_input

val make_import_as2805_key_cryptogram :
  as2805_key_variant:as2805_key_variant ->
  key_modes_of_use:key_modes_of_use ->
  key_algorithm:key_algorithm ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  wrapped_key_cryptogram:wrapped_key_cryptogram ->
  unit ->
  import_as2805_key_cryptogram

val make_import_diffie_hellman_tr31_key_block :
  private_key_identifier:key_arn_or_key_alias_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  public_key_certificate:certificate_type ->
  derive_key_algorithm:symmetric_key_algorithm ->
  key_derivation_function:key_derivation_function ->
  key_derivation_hash_algorithm:key_derivation_hash_algorithm ->
  derivation_data:diffie_hellman_derivation_data ->
  wrapped_key_block:tr31_wrapped_key_block ->
  unit ->
  import_diffie_hellman_tr31_key_block

val make_import_key_output : key:key -> unit -> import_key_output

val make_import_key_cryptogram :
  ?wrapping_spec:wrapping_key_spec ->
  key_attributes:key_attributes ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  wrapped_key_cryptogram:wrapped_key_cryptogram ->
  import_token:import_token_id ->
  unit ->
  import_key_cryptogram

val make_import_tr34_key_block :
  ?import_token:import_token_id ->
  ?wrapping_key_identifier:key_arn_or_key_alias_type ->
  ?wrapping_key_certificate:certificate_type ->
  ?random_nonce:even_hex_length_between16_and32 ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  signing_key_certificate:certificate_type ->
  wrapped_key_block:tr34_wrapped_key_block ->
  key_block_format:tr34_key_block_format ->
  unit ->
  import_tr34_key_block

val make_import_tr31_key_block :
  wrapping_key_identifier:key_arn_or_key_alias_type ->
  wrapped_key_block:tr31_wrapped_key_block ->
  unit ->
  import_tr31_key_block

val make_trusted_certificate_public_key :
  key_attributes:key_attributes ->
  public_key_certificate:certificate_type ->
  certificate_authority_public_key_identifier:key_arn_or_key_alias_type ->
  unit ->
  trusted_certificate_public_key

val make_root_certificate_public_key :
  key_attributes:key_attributes ->
  public_key_certificate:certificate_type ->
  unit ->
  root_certificate_public_key

val make_import_key_input :
  ?key_check_value_algorithm:key_check_value_algorithm ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tags ->
  ?replication_regions:regions ->
  ?requester_comment:mpa_requester_comment ->
  key_material:import_key_material ->
  unit ->
  import_key_input

val make_key_summary :
  ?multi_region_key_type:multi_region_key_type ->
  ?primary_region:region ->
  key_arn:key_arn ->
  key_state:key_state ->
  key_attributes:key_attributes ->
  key_check_value:key_check_value ->
  exportable:Smaws_Lib.Smithy_api.Types.boolean_ ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  key_summary

val make_list_aliases_output :
  ?next_token:next_token -> aliases:aliases -> unit -> list_aliases_output

val make_list_aliases_input :
  ?key_arn:key_arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_aliases_input

val make_list_keys_output :
  ?next_token:next_token -> keys:key_summary_list -> unit -> list_keys_output

val make_list_keys_input :
  ?key_state:key_state ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_keys_input

val make_list_tags_for_resource_output :
  ?next_token:next_token -> tags:tags -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:resource_arn -> tag_keys:tag_keys -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag_resource_input : resource_arn:resource_arn -> tags:tags -> unit -> tag_resource_input

val make_put_resource_policy_output :
  resource_arn:resource_arn -> policy:resource_policy -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  resource_arn:resource_arn -> policy:resource_policy -> unit -> put_resource_policy_input

val make_remove_key_replication_regions_output :
  key:key -> unit -> remove_key_replication_regions_output

val make_remove_key_replication_regions_input :
  key_identifier:key_arn_or_key_alias_type ->
  replication_regions:regions ->
  unit ->
  remove_key_replication_regions_input

val make_restore_key_output : key:key -> unit -> restore_key_output
val make_restore_key_input : key_identifier:key_arn_or_key_alias_type -> unit -> restore_key_input
val make_start_key_usage_output : key:key -> unit -> start_key_usage_output

val make_start_key_usage_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> start_key_usage_input

val make_stop_key_usage_output : key:key -> unit -> stop_key_usage_output

val make_stop_key_usage_input :
  key_identifier:key_arn_or_key_alias_type -> unit -> stop_key_usage_input

val make_update_alias_output : alias:alias -> unit -> update_alias_output

val make_update_alias_input :
  ?key_arn:key_arn -> alias_name:alias_name -> unit -> update_alias_input
