open Types

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit

val make_tag_resource_input :
  tags:tag_map -> resource_arn:amazon_resource_name -> unit -> tag_resource_input

val make_list_tags_for_resource_output : ?tags:tag_map -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_input

val make_validation_settings : mode:validation_mode -> unit -> validation_settings

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  path:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_static_policy_definition :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  update_static_policy_definition

val make_update_policy_template_output :
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_template_output

val make_update_policy_template_input :
  ?name:policy_template_name ->
  ?description:policy_template_description ->
  statement:policy_statement ->
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_template_input

val make_resource_conflict :
  resource_type:resource_type ->
  resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  resource_conflict

val make_update_policy_store_output :
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  arn:resource_arn ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_store_output

val make_update_policy_store_input :
  ?description:policy_store_description ->
  ?deletion_protection:deletion_protection ->
  validation_settings:validation_settings ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_store_input

val make_entity_identifier :
  entity_id:entity_id -> entity_type:entity_type -> unit -> entity_identifier

val make_action_identifier :
  action_id:action_id -> action_type:action_type -> unit -> action_identifier

val make_update_policy_output :
  ?effect_:policy_effect ->
  ?actions:action_identifier_list ->
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  policy_type:policy_type ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_output

val make_update_policy_input :
  ?name:policy_name ->
  ?definition:update_policy_definition ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  update_policy_input

val make_update_open_id_connect_access_token_configuration :
  ?audiences:audiences ->
  ?principal_id_claim:claim ->
  unit ->
  update_open_id_connect_access_token_configuration

val make_update_open_id_connect_identity_token_configuration :
  ?client_ids:client_ids ->
  ?principal_id_claim:claim ->
  unit ->
  update_open_id_connect_identity_token_configuration

val make_update_open_id_connect_group_configuration :
  group_entity_type:group_entity_type ->
  group_claim:claim ->
  unit ->
  update_open_id_connect_group_configuration

val make_update_open_id_connect_configuration :
  ?group_configuration:update_open_id_connect_group_configuration ->
  ?entity_id_prefix:entity_id_prefix ->
  token_selection:update_open_id_connect_token_selection ->
  issuer:issuer ->
  unit ->
  update_open_id_connect_configuration

val make_update_identity_source_output :
  policy_store_id:policy_store_id ->
  last_updated_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  created_date:timestamp_format ->
  unit ->
  update_identity_source_output

val make_update_cognito_group_configuration :
  group_entity_type:group_entity_type -> unit -> update_cognito_group_configuration

val make_update_cognito_user_pool_configuration :
  ?group_configuration:update_cognito_group_configuration ->
  ?client_ids:client_ids ->
  user_pool_arn:user_pool_arn ->
  unit ->
  update_cognito_user_pool_configuration

val make_update_identity_source_input :
  ?principal_entity_type:principal_entity_type ->
  update_configuration:update_configuration ->
  identity_source_id:identity_source_id ->
  policy_store_id:policy_store_id ->
  unit ->
  update_identity_source_input

val make_template_linked_policy_definition_item :
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition_item

val make_template_linked_policy_definition_detail :
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition_detail

val make_template_linked_policy_definition :
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  policy_template_id:policy_template_id ->
  unit ->
  template_linked_policy_definition

val make_static_policy_definition_item :
  ?description:static_policy_description -> unit -> static_policy_definition_item

val make_static_policy_definition_detail :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  static_policy_definition_detail

val make_static_policy_definition :
  ?description:static_policy_description ->
  statement:policy_statement ->
  unit ->
  static_policy_definition

val make_put_schema_output :
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  namespaces:namespace_list ->
  policy_store_id:policy_store_id ->
  unit ->
  put_schema_output

val make_put_schema_input :
  definition:schema_definition -> policy_store_id:policy_store_id -> unit -> put_schema_input

val make_policy_template_item :
  ?name:policy_template_name ->
  ?description:policy_template_description ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  policy_template_item

val make_policy_store_item :
  ?description:policy_store_description ->
  ?last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  arn:resource_arn ->
  policy_store_id:policy_store_id ->
  unit ->
  policy_store_item

val make_policy_store_alias_item :
  state:alias_state ->
  created_at:timestamp_format ->
  alias_arn:resource_arn ->
  policy_store_id:policy_store_id ->
  alias_name:alias ->
  unit ->
  policy_store_alias_item

val make_policy_store_alias_filter :
  ?policy_store_id:policy_store_id -> unit -> policy_store_alias_filter

val make_policy_item :
  ?name:policy_name ->
  ?effect_:policy_effect ->
  ?actions:action_identifier_list ->
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  definition:policy_definition_item ->
  policy_type:policy_type ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  policy_item

val make_policy_filter :
  ?policy_template_id:policy_template_id ->
  ?policy_type:policy_type ->
  ?resource:entity_reference ->
  ?principal:entity_reference ->
  unit ->
  policy_filter

val make_open_id_connect_access_token_configuration_item :
  ?audiences:audiences ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_access_token_configuration_item

val make_open_id_connect_identity_token_configuration_item :
  ?client_ids:client_ids ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_identity_token_configuration_item

val make_open_id_connect_access_token_configuration_detail :
  ?audiences:audiences ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_access_token_configuration_detail

val make_open_id_connect_identity_token_configuration_detail :
  ?client_ids:client_ids ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_identity_token_configuration_detail

val make_open_id_connect_access_token_configuration :
  ?audiences:audiences ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_access_token_configuration

val make_open_id_connect_identity_token_configuration :
  ?client_ids:client_ids ->
  ?principal_id_claim:claim ->
  unit ->
  open_id_connect_identity_token_configuration

val make_open_id_connect_group_configuration_item :
  group_entity_type:group_entity_type ->
  group_claim:claim ->
  unit ->
  open_id_connect_group_configuration_item

val make_open_id_connect_group_configuration_detail :
  group_entity_type:group_entity_type ->
  group_claim:claim ->
  unit ->
  open_id_connect_group_configuration_detail

val make_open_id_connect_group_configuration :
  group_entity_type:group_entity_type ->
  group_claim:claim ->
  unit ->
  open_id_connect_group_configuration

val make_open_id_connect_configuration_item :
  ?group_configuration:open_id_connect_group_configuration_item ->
  ?entity_id_prefix:entity_id_prefix ->
  token_selection:open_id_connect_token_selection_item ->
  issuer:issuer ->
  unit ->
  open_id_connect_configuration_item

val make_open_id_connect_configuration_detail :
  ?group_configuration:open_id_connect_group_configuration_detail ->
  ?entity_id_prefix:entity_id_prefix ->
  token_selection:open_id_connect_token_selection_detail ->
  issuer:issuer ->
  unit ->
  open_id_connect_configuration_detail

val make_open_id_connect_configuration :
  ?group_configuration:open_id_connect_group_configuration ->
  ?entity_id_prefix:entity_id_prefix ->
  token_selection:open_id_connect_token_selection ->
  issuer:issuer ->
  unit ->
  open_id_connect_configuration

val make_list_policy_templates_output :
  ?next_token:next_token ->
  policy_templates:policy_templates_list ->
  unit ->
  list_policy_templates_output

val make_list_policy_templates_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  policy_store_id:policy_store_id ->
  unit ->
  list_policy_templates_input

val make_list_policy_stores_output :
  ?next_token:next_token -> policy_stores:policy_store_list -> unit -> list_policy_stores_output

val make_list_policy_stores_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_policy_stores_input

val make_list_policy_store_aliases_output :
  ?next_token:next_token ->
  policy_store_aliases:policy_store_alias_list ->
  unit ->
  list_policy_store_aliases_output

val make_list_policy_store_aliases_input :
  ?filter:policy_store_alias_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_policy_store_aliases_input

val make_list_policies_output :
  ?next_token:next_token -> policies:policy_list -> unit -> list_policies_output

val make_list_policies_input :
  ?filter:policy_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  policy_store_id:policy_store_id ->
  unit ->
  list_policies_input

val make_identity_source_item_details :
  ?open_id_issuer:open_id_issuer ->
  ?discovery_url:discovery_url ->
  ?user_pool_arn:user_pool_arn ->
  ?client_ids:client_ids ->
  unit ->
  identity_source_item_details

val make_cognito_group_configuration_item :
  ?group_entity_type:group_entity_type -> unit -> cognito_group_configuration_item

val make_cognito_user_pool_configuration_item :
  ?group_configuration:cognito_group_configuration_item ->
  issuer:issuer ->
  client_ids:client_ids ->
  user_pool_arn:user_pool_arn ->
  unit ->
  cognito_user_pool_configuration_item

val make_identity_source_item :
  ?configuration:configuration_item ->
  ?details:identity_source_item_details ->
  principal_entity_type:principal_entity_type ->
  policy_store_id:policy_store_id ->
  last_updated_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  created_date:timestamp_format ->
  unit ->
  identity_source_item

val make_list_identity_sources_output :
  ?next_token:next_token ->
  identity_sources:identity_sources ->
  unit ->
  list_identity_sources_output

val make_identity_source_filter :
  ?principal_entity_type:principal_entity_type -> unit -> identity_source_filter

val make_list_identity_sources_input :
  ?filters:identity_source_filters ->
  ?max_results:list_identity_sources_max_results ->
  ?next_token:next_token ->
  policy_store_id:policy_store_id ->
  unit ->
  list_identity_sources_input

val make_kms_encryption_state :
  encryption_context:encryption_context -> key:kms_key -> unit -> kms_encryption_state

val make_kms_encryption_settings :
  ?encryption_context:encryption_context -> key:kms_key -> unit -> kms_encryption_settings

val make_determining_policy_item : policy_id:policy_id -> unit -> determining_policy_item

val make_evaluation_error_item :
  error_description:Smaws_Lib.Smithy_api.Types.string_ -> unit -> evaluation_error_item

val make_is_authorized_with_token_output :
  ?principal:entity_identifier ->
  errors:evaluation_error_list ->
  determining_policies:determining_policy_list ->
  decision:decision ->
  unit ->
  is_authorized_with_token_output

val make_entity_item :
  ?tags:entity_cedar_tags ->
  ?parents:parent_list ->
  ?attributes:entity_attributes ->
  identifier:entity_identifier ->
  unit ->
  entity_item

val make_is_authorized_with_token_input :
  ?entities:entities_definition ->
  ?context:context_definition ->
  ?resource:entity_identifier ->
  ?action:action_identifier ->
  ?access_token:token ->
  ?identity_token:token ->
  policy_store_id:policy_store_id ->
  unit ->
  is_authorized_with_token_input

val make_is_authorized_output :
  errors:evaluation_error_list ->
  determining_policies:determining_policy_list ->
  decision:decision ->
  unit ->
  is_authorized_output

val make_is_authorized_input :
  ?entities:entities_definition ->
  ?context:context_definition ->
  ?resource:entity_identifier ->
  ?action:action_identifier ->
  ?principal:entity_identifier ->
  policy_store_id:policy_store_id ->
  unit ->
  is_authorized_input

val make_identity_source_details :
  ?open_id_issuer:open_id_issuer ->
  ?discovery_url:discovery_url ->
  ?user_pool_arn:user_pool_arn ->
  ?client_ids:client_ids ->
  unit ->
  identity_source_details

val make_get_schema_output :
  ?namespaces:namespace_list ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  schema:schema_json ->
  policy_store_id:policy_store_id ->
  unit ->
  get_schema_output

val make_get_schema_input : policy_store_id:policy_store_id -> unit -> get_schema_input

val make_get_policy_template_output :
  ?name:policy_template_name ->
  ?description:policy_template_description ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  statement:policy_statement ->
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_template_output

val make_get_policy_template_input :
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_template_input

val make_get_policy_store_output :
  ?tags:tag_map ->
  ?cedar_version:cedar_version ->
  ?encryption_state:encryption_state ->
  ?deletion_protection:deletion_protection ->
  ?description:policy_store_description ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  validation_settings:validation_settings ->
  arn:resource_arn ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_store_output

val make_get_policy_store_input :
  ?tags:Smaws_Lib.Smithy_api.Types.boolean_ ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_store_input

val make_get_policy_store_alias_output :
  state:alias_state ->
  created_at:timestamp_format ->
  alias_arn:resource_arn ->
  policy_store_id:policy_store_id ->
  alias_name:alias ->
  unit ->
  get_policy_store_alias_output

val make_get_policy_store_alias_input : alias_name:alias -> unit -> get_policy_store_alias_input

val make_get_policy_output :
  ?name:policy_name ->
  ?effect_:policy_effect ->
  ?actions:action_identifier_list ->
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  definition:policy_definition_detail ->
  policy_type:policy_type ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  get_policy_output

val make_get_policy_input :
  policy_id:policy_id -> policy_store_id:policy_store_id -> unit -> get_policy_input

val make_cognito_group_configuration_detail :
  ?group_entity_type:group_entity_type -> unit -> cognito_group_configuration_detail

val make_cognito_user_pool_configuration_detail :
  ?group_configuration:cognito_group_configuration_detail ->
  issuer:issuer ->
  client_ids:client_ids ->
  user_pool_arn:user_pool_arn ->
  unit ->
  cognito_user_pool_configuration_detail

val make_get_identity_source_output :
  ?configuration:configuration_detail ->
  ?details:identity_source_details ->
  principal_entity_type:principal_entity_type ->
  policy_store_id:policy_store_id ->
  last_updated_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  created_date:timestamp_format ->
  unit ->
  get_identity_source_output

val make_get_identity_source_input :
  identity_source_id:identity_source_id ->
  policy_store_id:policy_store_id ->
  unit ->
  get_identity_source_input

val make_delete_policy_template_output : unit -> unit

val make_delete_policy_template_input :
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  delete_policy_template_input

val make_delete_policy_store_output : unit -> unit

val make_delete_policy_store_input :
  policy_store_id:policy_store_id -> unit -> delete_policy_store_input

val make_delete_policy_store_alias_output : unit -> unit

val make_delete_policy_store_alias_input :
  ?deletion_mode:deletion_mode -> alias_name:alias -> unit -> delete_policy_store_alias_input

val make_delete_policy_output : unit -> unit

val make_delete_policy_input :
  policy_id:policy_id -> policy_store_id:policy_store_id -> unit -> delete_policy_input

val make_delete_identity_source_output : unit -> unit

val make_delete_identity_source_input :
  identity_source_id:identity_source_id ->
  policy_store_id:policy_store_id ->
  unit ->
  delete_identity_source_input

val make_create_policy_template_output :
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  policy_template_id:policy_template_id ->
  policy_store_id:policy_store_id ->
  unit ->
  create_policy_template_output

val make_create_policy_template_input :
  ?name:policy_template_name ->
  ?description:policy_template_description ->
  ?client_token:idempotency_token ->
  statement:policy_statement ->
  policy_store_id:policy_store_id ->
  unit ->
  create_policy_template_input

val make_create_policy_store_output :
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  arn:resource_arn ->
  policy_store_id:policy_store_id ->
  unit ->
  create_policy_store_output

val make_create_policy_store_input :
  ?tags:tag_map ->
  ?encryption_settings:encryption_settings ->
  ?deletion_protection:deletion_protection ->
  ?description:policy_store_description ->
  ?client_token:idempotency_token ->
  validation_settings:validation_settings ->
  unit ->
  create_policy_store_input

val make_create_policy_store_alias_output :
  created_at:timestamp_format ->
  alias_arn:resource_arn ->
  policy_store_id:policy_store_id ->
  alias_name:alias ->
  unit ->
  create_policy_store_alias_output

val make_create_policy_store_alias_input :
  policy_store_id:policy_store_id -> alias_name:alias -> unit -> create_policy_store_alias_input

val make_create_policy_output :
  ?effect_:policy_effect ->
  ?actions:action_identifier_list ->
  ?resource:entity_identifier ->
  ?principal:entity_identifier ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  policy_type:policy_type ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  create_policy_output

val make_create_policy_input :
  ?name:policy_name ->
  ?client_token:idempotency_token ->
  definition:policy_definition ->
  policy_store_id:policy_store_id ->
  unit ->
  create_policy_input

val make_create_identity_source_output :
  policy_store_id:policy_store_id ->
  last_updated_date:timestamp_format ->
  identity_source_id:identity_source_id ->
  created_date:timestamp_format ->
  unit ->
  create_identity_source_output

val make_cognito_group_configuration :
  group_entity_type:group_entity_type -> unit -> cognito_group_configuration

val make_cognito_user_pool_configuration :
  ?group_configuration:cognito_group_configuration ->
  ?client_ids:client_ids ->
  user_pool_arn:user_pool_arn ->
  unit ->
  cognito_user_pool_configuration

val make_create_identity_source_input :
  ?principal_entity_type:principal_entity_type ->
  ?client_token:idempotency_token ->
  configuration:configuration ->
  policy_store_id:policy_store_id ->
  unit ->
  create_identity_source_input

val make_batch_is_authorized_with_token_input_item :
  ?context:context_definition ->
  ?resource:entity_identifier ->
  ?action:action_identifier ->
  unit ->
  batch_is_authorized_with_token_input_item

val make_batch_is_authorized_with_token_output_item :
  errors:evaluation_error_list ->
  determining_policies:determining_policy_list ->
  decision:decision ->
  request:batch_is_authorized_with_token_input_item ->
  unit ->
  batch_is_authorized_with_token_output_item

val make_batch_is_authorized_with_token_output :
  ?principal:entity_identifier ->
  results:batch_is_authorized_with_token_output_list ->
  unit ->
  batch_is_authorized_with_token_output

val make_batch_is_authorized_with_token_input :
  ?entities:entities_definition ->
  ?access_token:token ->
  ?identity_token:token ->
  requests:batch_is_authorized_with_token_input_list ->
  policy_store_id:policy_store_id ->
  unit ->
  batch_is_authorized_with_token_input

val make_batch_is_authorized_input_item :
  ?context:context_definition ->
  ?resource:entity_identifier ->
  ?action:action_identifier ->
  ?principal:entity_identifier ->
  unit ->
  batch_is_authorized_input_item

val make_batch_is_authorized_output_item :
  errors:evaluation_error_list ->
  determining_policies:determining_policy_list ->
  decision:decision ->
  request:batch_is_authorized_input_item ->
  unit ->
  batch_is_authorized_output_item

val make_batch_is_authorized_output :
  results:batch_is_authorized_output_list -> unit -> batch_is_authorized_output

val make_batch_is_authorized_input :
  ?entities:entities_definition ->
  requests:batch_is_authorized_input_list ->
  policy_store_id:policy_store_id ->
  unit ->
  batch_is_authorized_input

val make_batch_get_policy_output_item :
  ?name:policy_name ->
  last_updated_date:timestamp_format ->
  created_date:timestamp_format ->
  definition:policy_definition_detail ->
  policy_type:policy_type ->
  policy_id:policy_id ->
  policy_store_id:policy_store_id ->
  unit ->
  batch_get_policy_output_item

val make_batch_get_policy_error_item :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  policy_id:Smaws_Lib.Smithy_api.Types.string_ ->
  policy_store_id:Smaws_Lib.Smithy_api.Types.string_ ->
  code:batch_get_policy_error_code ->
  unit ->
  batch_get_policy_error_item

val make_batch_get_policy_output :
  errors:batch_get_policy_error_list ->
  results:batch_get_policy_output_list ->
  unit ->
  batch_get_policy_output

val make_batch_get_policy_input_item :
  policy_id:policy_id -> policy_store_id:policy_store_id -> unit -> batch_get_policy_input_item

val make_batch_get_policy_input :
  requests:batch_get_policy_input_list -> unit -> batch_get_policy_input
