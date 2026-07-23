(** Payment Cryptography client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UpdateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_alias_input ->
    ( update_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_alias_input ->
    ( update_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates an existing Amazon Web Services Payment Cryptography alias with a different key. \
   Each alias is associated with only one Amazon Web Services Payment Cryptography key at a time, \
   although a key can have multiple aliases. The alias and the Amazon Web Services Payment \
   Cryptography key must be in the same Amazon Web Services account and Amazon Web Services \
   Region\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html}CreateAlias} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html}GetAlias} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html}ListAliases} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module StopKeyUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_key_usage_input ->
    ( stop_key_usage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_key_usage_input ->
    ( stop_key_usage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables an Amazon Web Services Payment Cryptography key, which makes it inactive within Amazon \
   Web Services Payment Cryptography.\n\n\
  \ You can use this operation instead of \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \
   to deactivate a key. You can enable the key in the future by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html}StartKeyUsage}.\n\
  \ \n\
  \   {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html}StartKeyUsage} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module StartKeyUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_key_usage_input ->
    ( start_key_usage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_key_usage_input ->
    ( start_key_usage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables an Amazon Web Services Payment Cryptography key, which makes it active for \
   cryptographic operations within Amazon Web Services Payment Cryptography\n\n\
  \  {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html}StopKeyUsage} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module RestoreKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_key_input ->
    ( restore_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_key_input ->
    ( restore_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a scheduled key deletion during the waiting period. Use this operation to restore a \
   [Key] that is scheduled for deletion.\n\n\
  \ During the waiting period, the [KeyState] is [DELETE_PENDING] and [deletePendingTimestamp] \
   contains the date and time after which the [Key] will be deleted. After [Key] is restored, the \
   [KeyState] is [CREATE_COMPLETE], and the value for [deletePendingTimestamp] is removed.\n\
  \ \n\
  \   {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html}StartKeyUsage} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html}StopKeyUsage} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module RemoveKeyReplicationRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_key_replication_regions_input ->
    ( remove_key_replication_regions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_key_replication_regions_input ->
    ( remove_key_replication_regions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes Replication Regions from an existing Amazon Web Services Payment Cryptography key, \
   disabling the key's availability for cryptographic operations in the specified Amazon Web \
   Services Regions.\n\n\
  \ When you remove Replication Regions, the key material is securely deleted from those regions \
   and can no longer be used for cryptographic operations there. This operation is irreversible \
   for the specified Amazon Web Services Regions. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication}.\n\
  \ \n\
  \   Ensure that no active cryptographic operations or applications depend on the key in the \
   regions you're removing before performing this operation.\n\
  \   \n\
  \      {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \     \n\
  \       {b Related operations:} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AddKeyReplicationRegions.html}AddKeyReplicationRegions} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html}DisableDefaultKeyReplicationRegions} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `PublicPolicyException of public_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_input ->
    ( put_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `PublicPolicyException of public_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_input ->
    ( put_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `PublicPolicyException of public_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches or replaces a resource-based policy on an Amazon Web Services Payment Cryptography \
   key. A resource-based policy can grant cross-account access to your key.\n\n\
  \ If the policy would grant public access, the request fails with a [PublicPolicyException].\n\
  \ \n\
  \  To remove a resource-based policy from a key, use \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html}DeleteResourcePolicy}.\n\
  \  \n\
  \    {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetResourcePolicy.html}GetResourcePolicy} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html}DeleteResourcePolicy} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or edits tags on an Amazon Web Services Payment Cryptography key.\n\n\
  \  Tagging or untagging an Amazon Web Services Payment Cryptography key can allow or deny \
   permission to the key.\n\
  \  \n\
  \    Each tag consists of a tag key and a tag value, both of which are case-sensitive strings. \
   The tag value can be an empty (null) string. To add a tag, specify a new tag key and a tag \
   value. To edit a tag, specify an existing tag key and a new tag value. You can also add tags to \
   an Amazon Web Services Payment Cryptography key when you create it with \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html}CreateKey}.\n\
  \    \n\
  \      {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \     \n\
  \       {b Related operations:} \n\
  \      \n\
  \       {ul\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource} \n\
  \                 \n\
  \                  }\n\
  \             {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UntagResource.html}UntagResource} \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a tag from an Amazon Web Services Payment Cryptography key.\n\n\
  \  Tagging or untagging an Amazon Web Services Payment Cryptography key can allow or deny \
   permission to the key.\n\
  \  \n\
  \     {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \    \n\
  \      {b Related operations:} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html}ListTagsForResource} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html}TagResource} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags for an Amazon Web Services resource.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the tags. When the response contains only a subset of tags, it includes a [NextToken] \
   value. Use this value in a subsequent [ListTagsForResource] request to get more tags. When you \
   receive a response with no NextToken (or an empty or null value), that means there are no more \
   tags to get.\n\
  \ \n\
  \   {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html}TagResource} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UntagResource.html}UntagResource} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ListKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_keys_input ->
    ( list_keys_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_keys_input ->
    ( list_keys_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the keys in the caller's Amazon Web Services account and Amazon Web Services Region. You \
   can filter the list of keys.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the keys. When the response contains only a subset of keys, it includes a [NextToken] \
   value. Use this value in a subsequent [ListKeys] request to get more keys. When you receive a \
   response with no NextToken (or an empty or null value), that means there are no more keys to \
   get.\n\
  \ \n\
  \   {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html}CreateKey} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetKey.html}GetKey} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ListAliases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_input ->
    ( list_aliases_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aliases_input ->
    ( list_aliases_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the aliases for all keys in the caller's Amazon Web Services account and Amazon Web \
   Services Region. You can filter the aliases by [keyARN]. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-managealias.html}Using \
   aliases} in the {i Amazon Web Services Payment Cryptography User Guide}.\n\n\
  \ This is a paginated operation, which means that each response might contain only a subset of \
   all the aliases. When the response contains only a subset of aliases, it includes a [NextToken] \
   value. Use this value in a subsequent [ListAliases] request to get more aliases. When you \
   receive a response with no NextToken (or an empty or null value), that means there are no more \
   aliases to get.\n\
  \ \n\
  \   {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html}CreateAlias} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html}GetAlias} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ImportKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_key_input ->
    ( import_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_key_input ->
    ( import_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports symmetric keys and public key certificates in PEM format (base64 encoded) into Amazon \
   Web Services Payment Cryptography.\n\n\
  \ Amazon Web Services Payment Cryptography simplifies key exchange by replacing the existing \
   paper-based approach with a modern electronic approach. With [ImportKey] you can import \
   symmetric keys using either symmetric and asymmetric key exchange mechanisms.\n\
  \ \n\
  \  For symmetric key exchange, Amazon Web Services Payment Cryptography uses the ANSI X9 TR-31 \
   norm in accordance with PCI PIN guidelines. And for asymmetric key exchange, Amazon Web \
   Services Payment Cryptography supports ANSI X9 TR-34 norm, RSA unwrap, and ECDH (Elliptic Curve \
   Diffie-Hellman) key exchange mechanisms. Asymmetric key exchange methods are typically used to \
   establish bi-directional trust between the two parties exhanging keys and are used for initial \
   key exchange such as Key Encryption Key (KEK) or Zone Master Key (ZMK). After which you can \
   import working keys using symmetric method to perform various cryptographic operations within \
   Amazon Web Services Payment Cryptography.\n\
  \  \n\
  \   PCI requires specific minimum key strength of wrapping keys used to protect the keys being \
   exchanged electronically. These requirements can change when PCI standards are revised. The \
   rules specify that wrapping keys used for transport must be at least as strong as the key being \
   protected. For more information on recommended key strength of wrapping keys and key exchange \
   mechanism, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-importexport.html}Importing \
   and exporting keys} in the {i Amazon Web Services Payment Cryptography User Guide}.\n\
  \   \n\
  \    You can also import a {i root public key certificate}, used to sign other public key \
   certificates, or a {i trusted public key certificate} under an already established root public \
   key certificate.\n\
  \    \n\
  \      {b To import a public root key certificate} \n\
  \     \n\
  \      Using this operation, you can import the public component (in PEM cerificate format) of \
   your private root key. You can use the imported public root key certificate for digital \
   signatures, for example signing wrapping key or signing key in TR-34, within your Amazon Web \
   Services Payment Cryptography account.\n\
  \      \n\
  \       Set the following parameters:\n\
  \       \n\
  \        {ul\n\
  \              {-   [KeyMaterial]: [RootCertificatePublicKey] \n\
  \                  \n\
  \                   }\n\
  \              {-   [KeyClass]: [PUBLIC_KEY] \n\
  \                  \n\
  \                   }\n\
  \              {-   [KeyModesOfUse]: [Verify] \n\
  \                  \n\
  \                   }\n\
  \              {-   [KeyUsage]: [TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE] \n\
  \                  \n\
  \                   }\n\
  \              {-   [PublicKeyCertificate]: The public key certificate in PEM format (base64 \
   encoded) of the private root key under import.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \    {b To import a trusted public key certificate} \n\
  \   \n\
  \    The root public key certificate must be in place and operational before you import a \
   trusted public key certificate. Set the following parameters:\n\
  \    \n\
  \     {ul\n\
  \           {-   [KeyMaterial]: [TrustedCertificatePublicKey] \n\
  \               \n\
  \                }\n\
  \           {-   [CertificateAuthorityPublicKeyIdentifier]: [KeyArn] of the \
   [RootCertificatePublicKey].\n\
  \               \n\
  \                }\n\
  \           {-   [KeyModesOfUse] and [KeyUsage]: Corresponding to the cryptographic operations \
   such as wrap, sign, or encrypt that you will allow the trusted public key certificate to \
   perform.\n\
  \               \n\
  \                }\n\
  \           {-   [PublicKeyCertificate]: The trusted public key certificate in PEM format \
   (base64 encoded) under import.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \    {b To import initial keys (KEK or ZMK or similar) using TR-34} \n\
  \   \n\
  \    Using this operation, you can import initial key using TR-34 asymmetric key exchange. In \
   TR-34 terminology, the sending party of the key is called Key Distribution Host (KDH) and the \
   receiving party of the key is called Key Receiving Device (KRD). During the key import process, \
   KDH is the user who initiates the key import and KRD is Amazon Web Services Payment \
   Cryptography who receives the key.\n\
  \    \n\
  \     To initiate TR-34 key import, the KDH must obtain an import token by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport}. \
   This operation generates an encryption keypair for the purpose of key import, signs the key and \
   returns back the wrapping key certificate (also known as KRD wrapping certificate) and the root \
   certificate chain. The KDH must trust and install the KRD wrapping certificate on its HSM and \
   use it to encrypt (wrap) the KDH key during TR-34 WrappedKeyBlock generation. The import token \
   and associated KRD wrapping certificate expires after 30 days.\n\
  \     \n\
  \      Next the KDH generates a key pair for the purpose of signing the encrypted KDH key and \
   provides the public certificate of the signing key to Amazon Web Services Payment Cryptography. \
   The KDH will also need to import the root certificate chain of the KDH signing certificate by \
   calling [ImportKey] for [RootCertificatePublicKey]. For more information on TR-34 key import, \
   see section \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-import.html}Importing \
   symmetric keys} in the {i Amazon Web Services Payment Cryptography User Guide}.\n\
  \      \n\
  \       Set the following parameters:\n\
  \       \n\
  \        {ul\n\
  \              {-   [KeyMaterial]: Use [Tr34KeyBlock] parameters.\n\
  \                  \n\
  \                   }\n\
  \              {-   [CertificateAuthorityPublicKeyIdentifier]: The [KeyARN] of the certificate \
   chain that signed the KDH signing key certificate.\n\
  \                  \n\
  \                   }\n\
  \              {-   [ImportToken]: Obtained from KRD by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport}.\n\
  \                  \n\
  \                   }\n\
  \              {-   [WrappedKeyBlock]: The TR-34 wrapped key material from KDH. It contains the \
   KDH key under import, wrapped with KRD wrapping certificate and signed by KDH signing private \
   key. This TR-34 key block is typically generated by the KDH Hardware Security Module (HSM) \
   outside of Amazon Web Services Payment Cryptography.\n\
  \                  \n\
  \                   }\n\
  \              {-   [SigningKeyCertificate]: The public key certificate in PEM format (base64 \
   encoded) of the KDH signing key generated under the root certificate \
   (CertificateAuthorityPublicKeyIdentifier) imported in Amazon Web Services Payment Cryptography.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \    {b To import initial keys (KEK or ZMK or similar) using RSA Wrap and Unwrap} \n\
  \   \n\
  \    Using this operation, you can import initial key using asymmetric RSA wrap and unwrap key \
   exchange method. To initiate import, call \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport} \
   with [KeyMaterial] set to [KEY_CRYPTOGRAM] to generate an import token. This operation also \
   generates an encryption keypair for the purpose of key import, signs the key and returns back \
   the wrapping key certificate in PEM format (base64 encoded) and its root certificate chain. The \
   import token and associated KRD wrapping certificate expires after 30 days. \n\
  \    \n\
  \     You must trust and install the wrapping certificate and its certificate chain on the \
   sending HSM and use it to wrap the key under export for WrappedKeyCryptogram generation. Next \
   call [ImportKey] with [KeyMaterial] set to [KEY_CRYPTOGRAM] and provide the [ImportToken] and \
   [KeyAttributes] for the key under import.\n\
  \     \n\
  \       {b To import working keys using TR-31} \n\
  \      \n\
  \       Amazon Web Services Payment Cryptography uses TR-31 symmetric key exchange norm to \
   import working keys. A KEK must be established within Amazon Web Services Payment Cryptography \
   by using TR-34 key import or by using \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html}CreateKey}. \
   To initiate a TR-31 key import, set the following parameters:\n\
  \       \n\
  \        {ul\n\
  \              {-   [KeyMaterial]: Use [Tr31KeyBlock] parameters.\n\
  \                  \n\
  \                   }\n\
  \              {-   [WrappedKeyBlock]: The TR-31 wrapped key material. It contains the key under \
   import, encrypted using KEK. The TR-31 key block is typically generated by a HSM outside of \
   Amazon Web Services Payment Cryptography. \n\
  \                  \n\
  \                   }\n\
  \              {-   [WrappingKeyIdentifier]: The [KeyArn] of the KEK that Amazon Web Services \
   Payment Cryptography uses to decrypt or unwrap the key under import.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \    {b To import working keys using ECDH} \n\
  \   \n\
  \    You can also use ECDH key agreement to import working keys as a TR-31 keyblock, where the \
   wrapping key is an ECDH derived key.\n\
  \    \n\
  \     To initiate a TR-31 key import using ECDH, both sides must create an ECC key pair with key \
   usage K3 and exchange public key certificates. In Amazon Web Services Payment Cryptography, you \
   can do this by calling [CreateKey] and then [GetPublicKeyCertificate] to retrieve its public \
   key certificate. Next, you can then generate a TR-31 WrappedKeyBlock using your own ECC key \
   pair, the public certificate of the service's ECC key pair, and the key derivation parameters \
   including key derivation function, hash algorithm, derivation data, and key algorithm. If you \
   have not already done so, you must import the CA chain that issued the receiving public key \
   certificate by calling [ImportKey] with input [RootCertificatePublicKey] for root CA or \
   [TrustedPublicKey] for intermediate CA. To complete the TR-31 key import, you can use the \
   following parameters. It is important that the ECDH key derivation parameters you use should \
   match those used during import to derive the same shared wrapping key within Amazon Web \
   Services Payment Cryptography.\n\
  \     \n\
  \      {ul\n\
  \            {-   [KeyMaterial]: Use [DiffieHellmanTr31KeyBlock] parameters.\n\
  \                \n\
  \                 }\n\
  \            {-   [PrivateKeyIdentifier]: The [KeyArn] of the ECC key pair created within Amazon \
   Web Services Payment Cryptography to derive a shared KEK.\n\
  \                \n\
  \                 }\n\
  \            {-   [PublicKeyCertificate]: The public key certificate of the receiving ECC key \
   pair in PEM format (base64 encoded) to derive a shared KEK.\n\
  \                \n\
  \                 }\n\
  \            {-   [CertificateAuthorityPublicKeyIdentifier]: The [keyARN] of the CA that signed \
   the public key certificate of the receiving ECC key pair.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \    {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html}ExportKey} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the resource-based policy attached to an Amazon Web Services Payment Cryptography key.\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_PutResourcePolicy.html}PutResourcePolicy} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html}DeleteResourcePolicy} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetPublicKeyCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_public_key_certificate_input ->
    ( get_public_key_certificate_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_public_key_certificate_input ->
    ( get_public_key_certificate_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the public key certificate of the asymmetric key pair that exists within Amazon Web \
   Services Payment Cryptography.\n\n\
  \ Unlike the private key of an asymmetric key, which never leaves Amazon Web Services Payment \
   Cryptography unencrypted, callers with [GetPublicKeyCertificate] permission can download the \
   public key certificate of the asymmetric key. You can share the public key certificate to allow \
   others to encrypt messages and verify signatures outside of Amazon Web Services Payment \
   Cryptography\n\
  \ \n\
  \   {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \  "]

module GetParametersForImport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_for_import_input ->
    ( get_parameters_for_import_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_for_import_input ->
    ( get_parameters_for_import_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the import token and the wrapping key certificate in PEM format (base64 encoded) to \
   initiate a TR-34 WrappedKeyBlock or a RSA WrappedKeyCryptogram import into Amazon Web Services \
   Payment Cryptography.\n\n\
  \ The wrapping key certificate wraps the key under import. The import token and wrapping key \
   certificate must be in place and operational before calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey}. \
   The import token expires in 30 days. You can use the same import token to import multiple keys \
   into your service account.\n\
  \ \n\
  \  To return a previously generated import token and wrapping key certificate instead of \
   generating new ones, set [ReuseLastGeneratedToken] to [true].\n\
  \  \n\
  \    {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html}GetParametersForExport} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module GetParametersForExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_for_export_input ->
    ( get_parameters_for_export_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_for_export_input ->
    ( get_parameters_for_export_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the export token and the signing key certificate to initiate a TR-34 key export from \
   Amazon Web Services Payment Cryptography.\n\n\
  \ The signing key certificate signs the wrapped key under export within the TR-34 key payload. \
   The export token and signing key certificate must be in place and operational before calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html}ExportKey}. \
   The export token expires in 30 days. You can use the same export token to export multiple keys \
   from your service account.\n\
  \ \n\
  \  To return a previously generated export token and signing key certificate instead of \
   generating new ones, set [ReuseLastGeneratedToken] to [true].\n\
  \  \n\
  \    {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html}ExportKey} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module GetMpaTeamAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_mpa_team_association_input ->
    ( get_mpa_team_association_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_mpa_team_association_input ->
    ( get_mpa_team_association_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Multi-Party Approval (MPA) team association for a protected operation.\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AssociateMpaTeam.html}AssociateMpaTeam} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisassociateMpaTeam.html}DisassociateMpaTeam} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_key_input ->
    ( get_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_key_input ->
    ( get_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the key metadata for an Amazon Web Services Payment Cryptography key, including the \
   immutable and mutable attributes specified when the key was created. Returns key metadata \
   including attributes, state, and timestamps, but does not return the actual cryptographic key \
   material.\n\n\
  \  {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html}CreateKey} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListKeys.html}ListKeys} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetDefaultKeyReplicationRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_default_key_replication_regions_input ->
    ( get_default_key_replication_regions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_default_key_replication_regions_input ->
    ( get_default_key_replication_regions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the list of Amazon Web Services Regions where \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication} is currently enabled for your Amazon Web Services account.\n\n\
  \ This operation returns the current Multi-Region key replication configuration. New keys \
   created in your account will be automatically replicated to these regions unless explicitly \
   overridden during key creation.\n\
  \ \n\
  \   {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html}EnableDefaultKeyReplicationRegions} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html}DisableDefaultKeyReplicationRegions} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module GetCertificateSigningRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_signing_request_input ->
    ( get_certificate_signing_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_certificate_signing_request_input ->
    ( get_certificate_signing_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a certificate signing request (CSR) from a key pair.\n"]

module GetAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_alias_input ->
    ( get_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_alias_input ->
    ( get_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the Amazon Web Services Payment Cryptography key associated with the alias.\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html}CreateAlias} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html}ListAliases} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module ExportKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_key_input ->
    ( export_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_key_input ->
    ( export_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports a key from Amazon Web Services Payment Cryptography.\n\n\
  \ Amazon Web Services Payment Cryptography simplifies key exchange by replacing the existing \
   paper-based approach with a modern electronic approach. With [ExportKey] you can export \
   symmetric keys using either symmetric and asymmetric key exchange mechanisms. Using this \
   operation, you can share your Amazon Web Services Payment Cryptography generated keys with \
   other service partners to perform cryptographic operations outside of Amazon Web Services \
   Payment Cryptography \n\
  \ \n\
  \  For symmetric key exchange, Amazon Web Services Payment Cryptography uses the ANSI X9 TR-31 \
   norm in accordance with PCI PIN guidelines. And for asymmetric key exchange, Amazon Web \
   Services Payment Cryptography supports ANSI X9 TR-34 norm, RSA unwrap, and ECDH (Elliptic Curve \
   Diffie-Hellman) key exchange mechanisms. Asymmetric key exchange methods are typically used to \
   establish bi-directional trust between the two parties exhanging keys and are used for initial \
   key exchange such as Key Encryption Key (KEK). After which you can export working keys using \
   symmetric method to perform various cryptographic operations within Amazon Web Services Payment \
   Cryptography.\n\
  \  \n\
  \   PCI requires specific minimum key strength of wrapping keys used to protect the keys being \
   exchanged electronically. These requirements can change when PCI standards are revised. The \
   rules specify that wrapping keys used for transport must be at least as strong as the key being \
   protected. For more information on recommended key strength of wrapping keys and key exchange \
   mechanism, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-importexport.html}Importing \
   and exporting keys} in the {i Amazon Web Services Payment Cryptography User Guide}.\n\
  \   \n\
  \    You can also use [ExportKey] functionality to generate and export an IPEK (Initial Pin \
   Encryption Key) from Amazon Web Services Payment Cryptography using either TR-31 or TR-34 \
   export key exchange. IPEK is generated from BDK (Base Derivation Key) and \
   [ExportDukptInitialKey] attribute KSN ([KeySerialNumber]). The generated IPEK does not persist \
   within Amazon Web Services Payment Cryptography and has to be re-generated each time during \
   export.\n\
  \    \n\
  \     For key exchange using TR-31 or TR-34 key blocks, you can also export optional blocks \
   within the key block header which contain additional attribute information about the key. The \
   [KeyVersion] within [KeyBlockHeaders] indicates the version of the key within the key block. \
   Furthermore, [KeyExportability] within [KeyBlockHeaders] can be used to further restrict \
   exportability of the key after export from Amazon Web Services Payment Cryptography.\n\
  \     \n\
  \      The [OptionalBlocks] contain the additional data related to the key. For information on \
   data type that can be included within optional blocks, refer to \
   {{:https://webstore.ansi.org/standards/ascx9/ansix91432022}ASC X9.143-2022}.\n\
  \      \n\
  \        Data included in key block headers is signed but transmitted in clear text. Sensitive \
   or confidential information should not be included in optional blocks. Refer to ASC X9.143-2022 \
   standard for information on allowed data type.\n\
  \        \n\
  \           {b To export initial keys (KEK) or IPEK using TR-34} \n\
  \          \n\
  \           Using this operation, you can export initial key using TR-34 asymmetric key \
   exchange. You can only export KEK generated within Amazon Web Services Payment Cryptography. In \
   TR-34 terminology, the sending party of the key is called Key Distribution Host (KDH) and the \
   receiving party of the key is called Key Receiving Device (KRD). During key export process, KDH \
   is Amazon Web Services Payment Cryptography which initiates key export and KRD is the user \
   receiving the key.\n\
  \           \n\
  \            To initiate TR-34 key export, the KRD must obtain an export token by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html}GetParametersForExport}. \
   This operation also generates a key pair for the purpose of key export, signs the key and \
   returns back the signing public key certificate (also known as KDH signing certificate) and \
   root certificate chain. The KDH uses the private key to sign the the export payload and the \
   signing public key certificate is provided to KRD to verify the signature. The KRD can import \
   the root certificate into its Hardware Security Module (HSM), as required. The export token and \
   the associated KDH signing certificate expires after 30 days. \n\
  \            \n\
  \             Next the KRD generates a key pair for the the purpose of encrypting the KDH key \
   and provides the public key cerificate (also known as KRD wrapping certificate) back to KDH. \
   The KRD will also import the root cerificate chain into Amazon Web Services Payment \
   Cryptography by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey} \
   for [RootCertificatePublicKey]. The KDH, Amazon Web Services Payment Cryptography, will use the \
   KRD wrapping cerificate to encrypt (wrap) the key under export and signs it with signing \
   private key to generate a TR-34 WrappedKeyBlock. For more information on TR-34 key export, see \
   section \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-export.html}Exporting \
   symmetric keys} in the {i Amazon Web Services Payment Cryptography User Guide}. \n\
  \             \n\
  \              Set the following parameters:\n\
  \              \n\
  \               {ul\n\
  \                     {-   [ExportAttributes]: Specify export attributes in case of IPEK export. \
   This parameter is optional for KEK export.\n\
  \                         \n\
  \                          }\n\
  \                     {-   [ExportKeyIdentifier]: The [KeyARN] of the KEK or BDK (in case of \
   IPEK) under export.\n\
  \                         \n\
  \                          }\n\
  \                     {-   [KeyMaterial]: Use [Tr34KeyBlock] parameters.\n\
  \                         \n\
  \                          }\n\
  \                     {-   [CertificateAuthorityPublicKeyIdentifier]: The [KeyARN] of the \
   certificate chain that signed the KRD wrapping key certificate.\n\
  \                         \n\
  \                          }\n\
  \                     {-   [ExportToken]: Obtained from KDH by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html}GetParametersForImport}.\n\
  \                         \n\
  \                          }\n\
  \                     {-   [WrappingKeyCertificate]: The public key certificate in PEM format \
   (base64 encoded) of the KRD wrapping key Amazon Web Services Payment Cryptography uses for \
   encryption of the TR-34 export payload. This certificate must be signed by the root certificate \
   (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web Services Payment \
   Cryptography.\n\
  \                         \n\
  \                          }\n\
  \                     }\n\
  \   When this operation is successful, Amazon Web Services Payment Cryptography returns the KEK \
   or IPEK as a TR-34 WrappedKeyBlock. \n\
  \   \n\
  \     {b To export initial keys (KEK) or IPEK using RSA Wrap and Unwrap} \n\
  \    \n\
  \     Using this operation, you can export initial key using asymmetric RSA wrap and unwrap key \
   exchange method. To initiate export, generate an asymmetric key pair on the receiving HSM and \
   obtain the public key certificate in PEM format (base64 encoded) for the purpose of wrapping \
   and the root certifiate chain. Import the root certificate into Amazon Web Services Payment \
   Cryptography by calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey} \
   for [RootCertificatePublicKey].\n\
  \     \n\
  \      Next call [ExportKey] and set the following parameters:\n\
  \      \n\
  \       {ul\n\
  \             {-   [CertificateAuthorityPublicKeyIdentifier]: The [KeyARN] of the certificate \
   chain that signed wrapping key certificate.\n\
  \                 \n\
  \                  }\n\
  \             {-   [KeyMaterial]: Set to [KeyCryptogram].\n\
  \                 \n\
  \                  }\n\
  \             {-   [WrappingKeyCertificate]: The public key certificate in PEM format (base64 \
   encoded) obtained by the receiving HSM and signed by the root certificate \
   (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web Services Payment \
   Cryptography. The receiving HSM uses its private key component to unwrap the \
   WrappedKeyCryptogram.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   When this operation is successful, Amazon Web Services Payment Cryptography returns the \
   WrappedKeyCryptogram. \n\
  \   \n\
  \     {b To export working keys or IPEK using TR-31} \n\
  \    \n\
  \     Using this operation, you can export working keys or IPEK using TR-31 symmetric key \
   exchange. In TR-31, you must use an initial key such as KEK to encrypt or wrap the key under \
   export. To establish a KEK, you can use \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html}CreateKey} \
   or \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey}. \n\
  \     \n\
  \      Set the following parameters:\n\
  \      \n\
  \       {ul\n\
  \             {-   [ExportAttributes]: Specify export attributes in case of IPEK export. This \
   parameter is optional for KEK export.\n\
  \                 \n\
  \                  }\n\
  \             {-   [ExportKeyIdentifier]: The [KeyARN] of the KEK or BDK (in case of IPEK) under \
   export.\n\
  \                 \n\
  \                  }\n\
  \             {-   [KeyMaterial]: Use [Tr31KeyBlock] parameters.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \    {b To export working keys using ECDH} \n\
  \   \n\
  \    You can also use ECDH key agreement to export working keys in a TR-31 keyblock, where the \
   wrapping key is an ECDH derived key.\n\
  \    \n\
  \     To initiate a TR-31 key export using ECDH, both sides must create an ECC key pair with key \
   usage K3 and exchange public key certificates. In Amazon Web Services Payment Cryptography, you \
   can do this by calling [CreateKey]. If you have not already done so, you must import the CA \
   chain that issued the receiving public key certificate by calling [ImportKey] with input \
   [RootCertificatePublicKey] for root CA or [TrustedPublicKey] for intermediate CA. You can then \
   complete a TR-31 key export by deriving a shared wrapping key using the service ECC key pair, \
   public certificate of your ECC key pair outside of Amazon Web Services Payment Cryptography, \
   and the key derivation parameters including key derivation function, hash algorithm, derivation \
   data, key algorithm.\n\
  \     \n\
  \      {ul\n\
  \            {-   [KeyMaterial]: Use [DiffieHellmanTr31KeyBlock] parameters.\n\
  \                \n\
  \                 }\n\
  \            {-   [PrivateKeyIdentifier]: The [KeyArn] of the ECC key pair created within Amazon \
   Web Services Payment Cryptography to derive a shared KEK.\n\
  \                \n\
  \                 }\n\
  \            {-   [PublicKeyCertificate]: The public key certificate of the receiving ECC key \
   pair in PEM format (base64 encoded) to derive a shared KEK.\n\
  \                \n\
  \                 }\n\
  \            {-   [CertificateAuthorityPublicKeyIdentifier]: The [keyARN] of the CA that signed \
   the public key certificate of the receiving ECC key pair.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   When this operation is successful, Amazon Web Services Payment Cryptography returns the \
   working key as a TR-31 WrappedKeyBlock, where the wrapping key is the ECDH derived key.\n\
  \   \n\
  \     {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \    \n\
  \      {b Related operations:} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html}GetParametersForExport} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html}ImportKey} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module EnableDefaultKeyReplicationRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_default_key_replication_regions_input ->
    ( enable_default_key_replication_regions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_default_key_replication_regions_input ->
    ( enable_default_key_replication_regions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication} settings for your Amazon Web Services account, causing new keys to be \
   automatically replicated to the specified Amazon Web Services Regions when created.\n\n\
  \ When Multi-Region key replication are enabled, any new keys created in your account will \
   automatically be replicated to these regions unless you explicitly override this behavior \
   during key creation. This simplifies key management for applications that operate across \
   multiple regions.\n\
  \ \n\
  \  Existing keys are not affected by this operation - only keys created after enabling default \
   replication will be automatically replicated.\n\
  \  \n\
  \    {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html}DisableDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html}GetDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DisassociateMpaTeam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mpa_team_input ->
    ( disassociate_mpa_team_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_mpa_team_input ->
    ( disassociate_mpa_team_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association between a Multi-Party Approval (MPA) team and a protected operation.\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AssociateMpaTeam.html}AssociateMpaTeam} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetMpaTeamAssociation.html}GetMpaTeamAssociation} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DisableDefaultKeyReplicationRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_default_key_replication_regions_input ->
    ( disable_default_key_replication_regions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_default_key_replication_regions_input ->
    ( disable_default_key_replication_regions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication} settings for the specified Amazon Web Services Regions in your Amazon Web \
   Services account, preventing new keys from being automatically replicated to those regions.\n\n\
  \ After disabling Multi-Region key replication for specific regions, new keys created in your \
   account will not be automatically replicated to those regions. You can still manually add \
   replication to those regions for individual keys using the \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AddKeyReplicationRegions.html}AddKeyReplicationRegions} \
   operation.\n\
  \ \n\
  \  This operation does not affect existing keys or their current replication configuration.\n\
  \  \n\
  \    {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html}EnableDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html}GetDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_input ->
    ( delete_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_input ->
    ( delete_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the resource-based policy attached to an Amazon Web Services Payment Cryptography key.\n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_PutResourcePolicy.html}PutResourcePolicy} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetResourcePolicy.html}GetResourcePolicy} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DeleteKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_key_input ->
    ( delete_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_key_input ->
    ( delete_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the key material and metadata associated with Amazon Web Services Payment Cryptography \
   key.\n\n\
  \ Key deletion is irreversible. After a key is deleted, you can't perform cryptographic \
   operations using the key. For example, you can't decrypt data that was encrypted by a deleted \
   Amazon Web Services Payment Cryptography key, and the data may become unrecoverable. Because \
   key deletion is destructive, Amazon Web Services Payment Cryptography has a safety mechanism to \
   prevent accidental deletion of a key. When you call this operation, Amazon Web Services Payment \
   Cryptography disables the specified key but doesn't delete it until after a waiting period set \
   using [DeleteKeyInDays]. The default waiting period is 7 days. During the waiting period, the \
   [KeyState] is [DELETE_PENDING]. After the key is deleted, the [KeyState] is [DELETE_COMPLETE].\n\
  \ \n\
  \  You should delete a key only when you are sure that you don't need to use it anymore and no \
   other parties are utilizing this key. If you aren't sure, consider deactivating it instead by \
   calling \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html}StopKeyUsage}.\n\
  \  \n\
  \    {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_RestoreKey.html}RestoreKey} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html}StartKeyUsage} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html}StopKeyUsage} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DeleteAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_alias_input ->
    ( delete_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_alias_input ->
    ( delete_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the alias, but doesn't affect the underlying key.\n\n\
  \ Each key can have multiple aliases. To get the aliases of all keys, use the \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias} \
   operation. To change the alias of a key, first use \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias} \
   to delete the current alias and then use \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html}CreateAlias} \
   to create a new alias. To associate an existing alias with a different key, call \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias}.\n\
  \ \n\
  \   {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \  \n\
  \    {b Related operations:} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html}CreateAlias} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html}GetAlias} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html}ListAliases} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_key_input ->
    ( create_key_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_key_input ->
    ( create_key_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Web Services Payment Cryptography key, a logical representation of a \
   cryptographic key, that is unique in your account and Amazon Web Services Region. You use keys \
   for cryptographic functions such as encryption and decryption. \n\n\
  \ In addition to the key material used in cryptographic operations, an Amazon Web Services \
   Payment Cryptography key includes metadata such as the key ARN, key usage, key origin, creation \
   date, description, and key state.\n\
  \ \n\
  \  When you create a key, you specify both immutable and mutable data about the key. The \
   immutable data contains key attributes that define the scope and cryptographic operations that \
   you can perform using the key, for example key class (example: [SYMMETRIC_KEY]), key algorithm \
   (example: [TDES_2KEY]), key usage (example: [TR31_P0_PIN_ENCRYPTION_KEY]) and key modes of use \
   (example: [Encrypt]). Amazon Web Services Payment Cryptography binds key attributes to keys \
   using key blocks when you store or export them. Amazon Web Services Payment Cryptography stores \
   the key contents wrapped and never stores or transmits them in the clear.\n\
  \  \n\
  \   For information about valid combinations of key attributes, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html}Understanding \
   key attributes} in the {i Amazon Web Services Payment Cryptography User Guide}. The mutable \
   data contained within a key includes usage timestamp and key deletion timestamp and can be \
   modified after creation.\n\
  \   \n\
  \    You can use the [CreateKey] operation to generate an ECC (Elliptic Curve Cryptography) key \
   pair used for establishing an ECDH (Elliptic Curve Diffie-Hellman) key agreement between two \
   parties. In the ECDH key agreement process, both parties generate their own ECC key pair with \
   key usage K3 and exchange the public keys. Each party then use their private key, the received \
   public key from the other party, and the key derivation parameters including key derivation \
   function, hash algorithm, derivation data, and key algorithm to derive a shared key.\n\
  \    \n\
  \     To maintain the single-use principle of cryptographic keys in payments, ECDH derived keys \
   should not be used for multiple purposes, such as a [TR31_P0_PIN_ENCRYPTION_KEY] and \
   [TR31_K1_KEY_BLOCK_PROTECTION_KEY]. When creating ECC key pairs in Amazon Web Services Payment \
   Cryptography you can optionally set the [DeriveKeyUsage] parameter, which defines the key usage \
   bound to the symmetric key that will be derived using the ECC key pair.\n\
  \     \n\
  \       {b Cross-account use}: This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \      \n\
  \        {b Related operations:} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html}DeleteKey} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetKey.html}GetKey} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListKeys.html}ListKeys} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateAlias : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_alias_input ->
    ( create_alias_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_alias_input ->
    ( create_alias_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an {i alias}, or a friendly name, for an Amazon Web Services Payment Cryptography key. \
   You can use an alias to identify a key in the console and when you call cryptographic \
   operations such as \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_EncryptData.html}EncryptData} \
   or \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_DecryptData.html}DecryptData}.\n\n\
  \ You can associate the alias with any key in the same Amazon Web Services Region. Each alias is \
   associated with only one key at a time, but a key can have multiple aliases. You can't create \
   an alias without a key. The alias must be unique in the account and Amazon Web Services Region, \
   but you can create another alias with the same name in a different Amazon Web Services Region.\n\
  \ \n\
  \  To change the key that's associated with the alias, call \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias}. \
   To delete the alias, call \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias}. \
   These operations don't affect the underlying key. To get the alias that you created, call \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html}ListAliases}.\n\
  \  \n\
  \    {b Cross-account use}: This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html}DeleteAlias} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html}GetAlias} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html}ListAliases} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html}UpdateAlias} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module AssociateMpaTeam : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_mpa_team_input ->
    ( associate_mpa_team_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_mpa_team_input ->
    ( associate_mpa_team_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a Multi-Party Approval (MPA) team with a protected operation. For more information, \
   see {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/mpa.html}Multi-Party \
   Approval} in the {i Amazon Web Services Payment Cryptography User Guide.} \n\n\
  \  {b Cross-account use:} This operation can't be used across different Amazon Web Services \
   accounts.\n\
  \ \n\
  \   {b Related operations:} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisassociateMpaTeam.html}DisassociateMpaTeam} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetMpaTeamAssociation.html}GetMpaTeamAssociation} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module AddKeyReplicationRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_key_replication_regions_input ->
    ( add_key_replication_regions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_key_replication_regions_input ->
    ( add_key_replication_regions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds replication Amazon Web Services Regions to an existing Amazon Web Services Payment \
   Cryptography key, enabling the key to be used for cryptographic operations in additional Amazon \
   Web Services Regions.\n\n\
  \  \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html}Multi-Region \
   key replication} allow you to use the same key material across multiple Amazon Web Services \
   Regions, providing lower latency for applications distributed across regions. When you add \
   Replication Regions, Amazon Web Services Payment Cryptography securely replicates the key \
   material to the specified Amazon Web Services Regions.\n\
  \ \n\
  \  The key must be in an active state to add Replication Regions. You can add multiple regions \
   in a single operation, and the key will be available for use in those regions once replication \
   is complete.\n\
  \  \n\
  \    {b Cross-account use:} This operation supports cross-account use when the key has a \
   resource-based policy that grants access. For more information, see \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html}Resource-based \
   policies}.\n\
  \   \n\
  \     {b Related operations:} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_RemoveKeyReplicationRegions.html}RemoveKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html}EnableDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html}GetDefaultKeyReplicationRegions} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
