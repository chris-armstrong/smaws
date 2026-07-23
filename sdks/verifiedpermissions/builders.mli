open Types

val make_action_identifier :
  action_type:action_type -> action_id:action_id -> unit -> action_identifier

val make_entity_identifier :
  entity_type:entity_type -> entity_id:entity_id -> unit -> entity_identifier

val make_batch_get_policy_error_item :
  code:batch_get_policy_error_code ->
  policy_store_id:Smaws_Lib.Smithy_api.Types.string_ ->
  policy_id:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  batch_get_policy_error_item

val make_template_linked_policy_definition_detail :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition_detail

val make_static_policy_definition_detail :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  static_policy_definition_detail

val make_batch_get_policy_output_item :
  ?name:policy_name ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  policy_type:policy_type ->
  definition:policy_definition_detail ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  batch_get_policy_output_item

val make_batch_get_policy_output :
  results:batch_get_policy_output_list ->
  errors:batch_get_policy_error_list ->
  unit ->
  batch_get_policy_output

val make_batch_get_policy_input_item :
  policy_store_id:policy_store_id -> policy_id:policy_id -> unit -> batch_get_policy_input_item

val make_batch_get_policy_input :
  requests:batch_get_policy_input_list -> unit -> batch_get_policy_input

val make_evaluation_error_item :
  error_description:Smaws_Lib.Smithy_api.Types.string_ -> unit -> evaluation_error_item

val make_determining_policy_item : policy_id:policy_id -> unit -> determining_policy_item

val make_batch_is_authorized_input_item :
  ?principal:entity_identifier ->
  ?action:action_identifier ->
  ?resource:entity_identifier ->
  ?context:context_definition ->
  unit ->
  batch_is_authorized_input_item

val make_batch_is_authorized_output_item :
  request:batch_is_authorized_input_item ->
  decision:decision ->
  determining_policies:determining_policy_list ->
  errors:evaluation_error_list ->
  unit ->
  batch_is_authorized_output_item

val make_batch_is_authorized_output :
  results:batch_is_authorized_output_list -> unit -> batch_is_authorized_output

val make_entity_item :
  ?attributes:entity_attributes ->
  ?parents:parent_list ->
  ?tags:entity_cedar_tags ->
  identifier:entity_identifier ->
  unit ->
  entity_item

val make_batch_is_authorized_input :
  ?entities:entities_definition ->
  policy_store_id:policy_store_id ->
  requests:batch_is_authorized_input_list ->
  unit ->
  batch_is_authorized_input

val make_batch_is_authorized_with_token_input_item :
  ?action:action_identifier ->
  ?resource:entity_identifier ->
  ?context:context_definition ->
  unit ->
  batch_is_authorized_with_token_input_item

val make_batch_is_authorized_with_token_output_item :
  request:batch_is_authorized_with_token_input_item ->
  decision:decision ->
  determining_policies:determining_policy_list ->
  errors:evaluation_error_list ->
  unit ->
  batch_is_authorized_with_token_output_item

val make_batch_is_authorized_with_token_output :
  ?principal:entity_identifier ->
  results:batch_is_authorized_with_token_output_list ->
  unit ->
  batch_is_authorized_with_token_output

val make_batch_is_authorized_with_token_input :
  ?identity_token:token ->
  ?access_token:token ->
  ?entities:entities_definition ->
  policy_store_id:policy_store_id ->
  requests:batch_is_authorized_with_token_input_list ->
  unit ->
  batch_is_authorized_with_token_input

val make_cognito_group_configuration :
  group_entity_type:group_entity_type -> unit -> cognito_group_configuration

val make_cognito_group_configuration_detail :
  ?group_entity_type:group_entity_type -> unit -> cognito_group_configuration_detail

val make_cognito_group_configuration_item :
  ?group_entity_type:group_entity_type -> unit -> cognito_group_configuration_item

val make_cognito_user_pool_configuration :
  ?client_ids:client_ids ->
  ?group_configuration:cognito_group_configuration ->
  user_pool_arn:user_pool_arn ->
  unit ->
  cognito_user_pool_configuration

val make_cognito_user_pool_configuration_detail :
  ?group_configuration:cognito_group_configuration_detail ->
  user_pool_arn:user_pool_arn ->
  client_ids:client_ids ->
  issuer:issuer ->
  unit ->
  cognito_user_pool_configuration_detail

val make_cognito_user_pool_configuration_item :
  ?group_configuration:cognito_group_configuration_item ->
  user_pool_arn:user_pool_arn ->
  client_ids:client_ids ->
  issuer:issuer ->
  unit ->
  cognito_user_pool_configuration_item

val make_open_id_connect_identity_token_configuration :
  ?principal_id_claim:claim ->
  ?client_ids:client_ids ->
  unit ->
  open_id_connect_identity_token_configuration

val make_open_id_connect_access_token_configuration :
  ?principal_id_claim:claim ->
  ?audiences:audiences ->
  unit ->
  open_id_connect_access_token_configuration

val make_open_id_connect_group_configuration :
  group_claim:claim ->
  group_entity_type:group_entity_type ->
  unit ->
  open_id_connect_group_configuration

val make_open_id_connect_configuration :
  ?entity_id_prefix:entity_id_prefix ->
  ?group_configuration:open_id_connect_group_configuration ->
  issuer:issuer ->
  token_selection:open_id_connect_token_selection ->
  unit ->
  open_id_connect_configuration

val make_open_id_connect_identity_token_configuration_detail :
  ?principal_id_claim:claim ->
  ?client_ids:client_ids ->
  unit ->
  open_id_connect_identity_token_configuration_detail

val make_open_id_connect_access_token_configuration_detail :
  ?principal_id_claim:claim ->
  ?audiences:audiences ->
  unit ->
  open_id_connect_access_token_configuration_detail

val make_open_id_connect_group_configuration_detail :
  group_claim:claim ->
  group_entity_type:group_entity_type ->
  unit ->
  open_id_connect_group_configuration_detail

val make_open_id_connect_configuration_detail :
  ?entity_id_prefix:entity_id_prefix ->
  ?group_configuration:open_id_connect_group_configuration_detail ->
  issuer:issuer ->
  token_selection:open_id_connect_token_selection_detail ->
  unit ->
  open_id_connect_configuration_detail

val make_open_id_connect_identity_token_configuration_item :
  ?principal_id_claim:claim ->
  ?client_ids:client_ids ->
  unit ->
  open_id_connect_identity_token_configuration_item

val make_open_id_connect_access_token_configuration_item :
  ?principal_id_claim:claim ->
  ?audiences:audiences ->
  unit ->
  open_id_connect_access_token_configuration_item

val make_open_id_connect_group_configuration_item :
  group_claim:claim ->
  group_entity_type:group_entity_type ->
  unit ->
  open_id_connect_group_configuration_item

val make_open_id_connect_configuration_item :
  ?entity_id_prefix:entity_id_prefix ->
  ?group_configuration:open_id_connect_group_configuration_item ->
  issuer:issuer ->
  token_selection:open_id_connect_token_selection_item ->
  unit ->
  open_id_connect_configuration_item

val make_resource_conflict :
  resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_type:resource_type ->
  unit ->
  resource_conflict

val make_create_identity_source_output :
  created_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  last_updated_date:timestamp_format ->
  policy_store_id:policy_store_id ->
  unit ->
  create_identity_source_output

val make_create_identity_source_input :
  ?client_token:idempotency_token ->
  ?principal_entity_type:principal_entity_type ->
  policy_store_id:policy_store_id ->
  configuration:configuration ->
  unit ->
  create_identity_source_input

val make_create_policy_output :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  ?actions:action_identifier_list ->
  ?effect_:policy_effect ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  policy_type:policy_type ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  create_policy_output

val make_template_linked_policy_definition :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition

val make_static_policy_definition :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  static_policy_definition

val make_create_policy_input :
  ?client_token:idempotency_token ->
  ?name:policy_name ->
  policy_store_id:policy_store_id ->
  definition:policy_definition ->
  unit ->
  create_policy_input

val make_create_policy_store_output :
  policy_store_id:policy_store_id ->
  arn:resource_arn ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  create_policy_store_output

val make_kms_encryption_settings :
  ?encryption_context:encryption_context -> key:kms_key -> unit -> kms_encryption_settings

val make_validation_settings : mode:validation_mode -> unit -> validation_settings

val make_create_policy_store_input :
  ?client_token:idempotency_token ->
  ?description:policy_store_description ->
  ?deletion_protection:deletion_protection ->
  ?encryption_settings:encryption_settings ->
  ?tags:tag_map ->
  validation_settings:validation_settings ->
  unit ->
  create_policy_store_input

val make_create_policy_store_alias_output :
  alias_name:alias ->
  policy_store_id:policy_store_id ->
  alias_arn:resource_arn ->
  created_at:timestamp_format ->
  unit ->
  create_policy_store_alias_output

val make_create_policy_store_alias_input :
  alias_name:alias -> policy_store_id:policy_store_id -> unit -> create_policy_store_alias_input

val make_create_policy_template_output :
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  create_policy_template_output

val make_create_policy_template_input :
  ?client_token:idempotency_token ->
  ?description:policy_template_description ->
  ?name:policy_template_name ->
  policy_store_id:policy_store_id ->
  statement:policy_statement ->
  unit ->
  create_policy_template_input

val make_delete_identity_source_output : unit -> unit

val make_delete_identity_source_input :
  policy_store_id:policy_store_id ->
  identity_source_id:identity_source_id ->
  unit ->
  delete_identity_source_input

val make_delete_policy_output : unit -> unit

val make_delete_policy_input :
  policy_store_id:policy_store_id -> policy_id:policy_id -> unit -> delete_policy_input

val make_delete_policy_store_output : unit -> unit

val make_delete_policy_store_input :
  policy_store_id:policy_store_id -> unit -> delete_policy_store_input

val make_delete_policy_store_alias_output : unit -> unit

val make_delete_policy_store_alias_input :
  ?deletion_mode:deletion_mode -> alias_name:alias -> unit -> delete_policy_store_alias_input

val make_delete_policy_template_output : unit -> unit

val make_delete_policy_template_input :
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  unit ->
  delete_policy_template_input

val make_kms_encryption_state :
  key:kms_key -> encryption_context:encryption_context -> unit -> kms_encryption_state

val make_identity_source_details :
  ?client_ids:client_ids ->
  ?user_pool_arn:user_pool_arn ->
  ?discovery_url:discovery_url ->
  ?open_id_issuer:open_id_issuer ->
  unit ->
  identity_source_details

val make_get_identity_source_output :
  ?details:identity_source_details ->
  ?configuration:configuration_detail ->
  created_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  last_updated_date:timestamp_format ->
  policy_store_id:policy_store_id ->
  principal_entity_type:principal_entity_type ->
  unit ->
  get_identity_source_output

val make_get_identity_source_input :
  policy_store_id:policy_store_id ->
  identity_source_id:identity_source_id ->
  unit ->
  get_identity_source_input

val make_get_policy_output :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  ?actions:action_identifier_list ->
  ?effect_:policy_effect ->
  ?name:policy_name ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  policy_type:policy_type ->
  definition:policy_definition_detail ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  get_policy_output

val make_get_policy_input :
  policy_store_id:policy_store_id -> policy_id:policy_id -> unit -> get_policy_input

val make_get_policy_store_output :
  ?description:policy_store_description ->
  ?deletion_protection:deletion_protection ->
  ?encryption_state:encryption_state ->
  ?cedar_version:cedar_version ->
  ?tags:tag_map ->
  policy_store_id:policy_store_id ->
  arn:resource_arn ->
  validation_settings:validation_settings ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  get_policy_store_output

val make_get_policy_store_input :
  ?tags:Smaws_Lib.Smithy_api.Types.boolean_ ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_store_input

val make_get_policy_store_alias_output :
  alias_name:alias ->
  policy_store_id:policy_store_id ->
  alias_arn:resource_arn ->
  created_at:timestamp_format ->
  state:alias_state ->
  unit ->
  get_policy_store_alias_output

val make_get_policy_store_alias_input : alias_name:alias -> unit -> get_policy_store_alias_input

val make_get_policy_template_output :
  ?description:policy_template_description ->
  ?name:policy_template_name ->
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  statement:policy_statement ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  get_policy_template_output

val make_get_policy_template_input :
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  unit ->
  get_policy_template_input

val make_get_schema_output :
  ?namespaces:namespace_list ->
  policy_store_id:policy_store_id ->
  schema:schema_json ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  get_schema_output

val make_get_schema_input : policy_store_id:policy_store_id -> unit -> get_schema_input

val make_identity_source_filter :
  ?principal_entity_type:principal_entity_type -> unit -> identity_source_filter

val make_identity_source_item_details :
  ?client_ids:client_ids ->
  ?user_pool_arn:user_pool_arn ->
  ?discovery_url:discovery_url ->
  ?open_id_issuer:open_id_issuer ->
  unit ->
  identity_source_item_details

val make_identity_source_item :
  ?details:identity_source_item_details ->
  ?configuration:configuration_item ->
  created_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  last_updated_date:timestamp_format ->
  policy_store_id:policy_store_id ->
  principal_entity_type:principal_entity_type ->
  unit ->
  identity_source_item

val make_is_authorized_output :
  decision:decision ->
  determining_policies:determining_policy_list ->
  errors:evaluation_error_list ->
  unit ->
  is_authorized_output

val make_is_authorized_input :
  ?principal:entity_identifier ->
  ?action:action_identifier ->
  ?resource:entity_identifier ->
  ?context:context_definition ->
  ?entities:entities_definition ->
  policy_store_id:policy_store_id ->
  unit ->
  is_authorized_input

val make_is_authorized_with_token_output :
  ?principal:entity_identifier ->
  decision:decision ->
  determining_policies:determining_policy_list ->
  errors:evaluation_error_list ->
  unit ->
  is_authorized_with_token_output

val make_is_authorized_with_token_input :
  ?identity_token:token ->
  ?access_token:token ->
  ?action:action_identifier ->
  ?resource:entity_identifier ->
  ?context:context_definition ->
  ?entities:entities_definition ->
  policy_store_id:policy_store_id ->
  unit ->
  is_authorized_with_token_input

val make_list_identity_sources_output :
  ?next_token:next_token ->
  identity_sources:identity_sources ->
  unit ->
  list_identity_sources_output

val make_list_identity_sources_input :
  ?next_token:next_token ->
  ?max_results:list_identity_sources_max_results ->
  ?filters:identity_source_filters ->
  policy_store_id:policy_store_id ->
  unit ->
  list_identity_sources_input

val make_template_linked_policy_definition_item :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition_item

val make_static_policy_definition_item :
  ?description:static_policy_description -> unit -> static_policy_definition_item

val make_policy_item :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  ?actions:action_identifier_list ->
  ?effect_:policy_effect ->
  ?name:policy_name ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  policy_type:policy_type ->
  definition:policy_definition_item ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  policy_item

val make_list_policies_output :
  ?next_token:next_token -> policies:policy_list -> unit -> list_policies_output

val make_policy_filter :
  ?principal:entity_reference ->
  ?resource:entity_reference ->
  ?policy_type:policy_type ->
  ?policy_template_id:policy_template_id ->
  unit ->
  policy_filter

val make_list_policies_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:policy_filter ->
  policy_store_id:policy_store_id ->
  unit ->
  list_policies_input

val make_policy_store_alias_item :
  alias_name:alias ->
  policy_store_id:policy_store_id ->
  alias_arn:resource_arn ->
  created_at:timestamp_format ->
  state:alias_state ->
  unit ->
  policy_store_alias_item

val make_list_policy_store_aliases_output :
  ?next_token:next_token ->
  policy_store_aliases:policy_store_alias_list ->
  unit ->
  list_policy_store_aliases_output

val make_policy_store_alias_filter :
  ?policy_store_id:policy_store_id -> unit -> policy_store_alias_filter

val make_list_policy_store_aliases_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:policy_store_alias_filter ->
  unit ->
  list_policy_store_aliases_input

val make_policy_store_item :
  ?last_updated_date:timestamp_format ->
  ?description:policy_store_description ->
  policy_store_id:policy_store_id ->
  arn:resource_arn ->
  created_date:timestamp_format ->
  unit ->
  policy_store_item

val make_list_policy_stores_output :
  ?next_token:next_token -> policy_stores:policy_store_list -> unit -> list_policy_stores_output

val make_list_policy_stores_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_policy_stores_input

val make_policy_template_item :
  ?description:policy_template_description ->
  ?name:policy_template_name ->
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  policy_template_item

val make_list_policy_templates_output :
  ?next_token:next_token ->
  policy_templates:policy_templates_list ->
  unit ->
  list_policy_templates_output

val make_list_policy_templates_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  policy_store_id:policy_store_id ->
  unit ->
  list_policy_templates_input

val make_list_tags_for_resource_output : ?tags:tag_map -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_put_schema_output :
  policy_store_id:policy_store_id ->
  namespaces:namespace_list ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  put_schema_output

val make_put_schema_input :
  policy_store_id:policy_store_id -> definition:schema_definition -> unit -> put_schema_input

val make_tag_resource_output : unit -> unit

val make_tag_resource_input :
  resource_arn:amazon_resource_name -> tags:tag_map -> unit -> tag_resource_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_update_cognito_group_configuration :
  group_entity_type:group_entity_type -> unit -> update_cognito_group_configuration

val make_update_cognito_user_pool_configuration :
  ?client_ids:client_ids ->
  ?group_configuration:update_cognito_group_configuration ->
  user_pool_arn:user_pool_arn ->
  unit ->
  update_cognito_user_pool_configuration

val make_update_open_id_connect_identity_token_configuration :
  ?principal_id_claim:claim ->
  ?client_ids:client_ids ->
  unit ->
  update_open_id_connect_identity_token_configuration

val make_update_open_id_connect_access_token_configuration :
  ?principal_id_claim:claim ->
  ?audiences:audiences ->
  unit ->
  update_open_id_connect_access_token_configuration

val make_update_open_id_connect_group_configuration :
  group_claim:claim ->
  group_entity_type:group_entity_type ->
  unit ->
  update_open_id_connect_group_configuration

val make_update_open_id_connect_configuration :
  ?entity_id_prefix:entity_id_prefix ->
  ?group_configuration:update_open_id_connect_group_configuration ->
  issuer:issuer ->
  token_selection:update_open_id_connect_token_selection ->
  unit ->
  update_open_id_connect_configuration

val make_update_identity_source_output :
  created_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  last_updated_date:timestamp_format ->
  policy_store_id:policy_store_id ->
  unit ->
  update_identity_source_output

val make_update_identity_source_input :
  ?principal_entity_type:principal_entity_type ->
  policy_store_id:policy_store_id ->
  identity_source_id:identity_source_id ->
  update_configuration:update_configuration ->
  unit ->
  update_identity_source_input

val make_update_policy_output :
  ?principal:entity_identifier ->
  ?resource:entity_identifier ->
  ?actions:action_identifier_list ->
  ?effect_:policy_effect ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  policy_type:policy_type ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  update_policy_output

val make_update_static_policy_definition :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  update_static_policy_definition

val make_update_policy_input :
  ?definition:update_policy_definition ->
  ?name:policy_name ->
  policy_store_id:policy_store_id ->
  policy_id:policy_id ->
  unit ->
  update_policy_input

val make_update_policy_store_output :
  policy_store_id:policy_store_id ->
  arn:resource_arn ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  update_policy_store_output

val make_update_policy_store_input :
  ?deletion_protection:deletion_protection ->
  ?description:policy_store_description ->
  policy_store_id:policy_store_id ->
  validation_settings:validation_settings ->
  unit ->
  update_policy_store_input

val make_update_policy_template_output :
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  created_date:timestamp_format ->
  last_updated_date:timestamp_format ->
  unit ->
  update_policy_template_output

val make_update_policy_template_input :
  ?description:policy_template_description ->
  ?name:policy_template_name ->
  policy_store_id:policy_store_id ->
  policy_template_id:policy_template_id ->
  statement:policy_statement ->
  unit ->
  update_policy_template_input

val make_validation_exception_field :
  path:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field
