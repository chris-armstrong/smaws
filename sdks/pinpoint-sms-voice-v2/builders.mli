open Types

val make_account_attribute :
  name:account_attribute_name ->
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  account_attribute

val make_account_limit :
  name:account_limit_name ->
  used:Smaws_Lib.Smithy_api.Types.primitive_long ->
  max:Smaws_Lib.Smithy_api.Types.primitive_long ->
  unit ->
  account_limit

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_associate_origination_identity_request :
  ?iso_country_code:iso_country_code ->
  ?client_token:client_token ->
  pool_id:pool_id_or_arn ->
  origination_identity:phone_or_sender_id_or_arn ->
  unit ->
  associate_origination_identity_request

val make_associate_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  associate_protect_configuration_request

val make_carrier_lookup_request :
  phone_number:carrier_lookup_input_phone_number_type -> unit -> carrier_lookup_request

val make_carrier_status_information :
  carrier_name:Smaws_Lib.Smithy_api.Types.string_ ->
  status:carrier_status ->
  unit ->
  carrier_status_information

val make_cloud_watch_logs_destination :
  iam_role_arn:iam_role_arn -> log_group_arn:log_group_arn -> unit -> cloud_watch_logs_destination

val make_configuration_set_filter :
  name:configuration_set_filter_name -> values:filter_value_list -> unit -> configuration_set_filter

val make_sns_destination : topic_arn:sns_topic_arn -> unit -> sns_destination

val make_kinesis_firehose_destination :
  iam_role_arn:iam_role_arn ->
  delivery_stream_arn:delivery_stream_arn ->
  unit ->
  kinesis_firehose_destination

val make_event_destination :
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?sns_destination:sns_destination ->
  event_destination_name:event_destination_name ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  matching_event_types:event_type_list ->
  unit ->
  event_destination

val make_configuration_set_information :
  ?default_message_type:message_type ->
  ?default_sender_id:sender_id ->
  ?default_message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  configuration_set_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  configuration_set_name:configuration_set_name ->
  event_destinations:event_destination_list ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  configuration_set_information

val make_country_launch_status_filter :
  name:country_launch_status_filter_name ->
  values:filter_value_list ->
  unit ->
  country_launch_status_filter

val make_country_launch_status_information :
  ?rcs_platform_id:Smaws_Lib.Smithy_api.Types.string_ ->
  iso_country_code:iso_country_code ->
  status:country_launch_status ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  carrier_status:carrier_status_information_list ->
  unit ->
  country_launch_status_information

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_configuration_set_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  configuration_set_name:configuration_set_name ->
  unit ->
  create_configuration_set_request

val make_create_event_destination_request :
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?sns_destination:sns_destination ->
  ?client_token:client_token ->
  configuration_set_name:configuration_set_name_or_arn ->
  event_destination_name:event_destination_name ->
  matching_event_types:event_type_list ->
  unit ->
  create_event_destination_request

val make_create_notify_configuration_request :
  ?default_template_id:notify_template_id ->
  ?pool_id:pool_id_or_arn ->
  ?enabled_countries:iso_country_code_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  display_name:notify_configuration_display_name ->
  use_case:notify_configuration_use_case ->
  enabled_channels:notify_enabled_channels_list ->
  unit ->
  create_notify_configuration_request

val make_create_opt_out_list_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  opt_out_list_name:opt_out_list_name ->
  unit ->
  create_opt_out_list_request

val make_create_pool_request :
  ?iso_country_code:iso_country_code ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  origination_identity:phone_or_sender_id_or_arn ->
  message_type:message_type ->
  unit ->
  create_pool_request

val make_create_protect_configuration_request :
  ?client_token:client_token ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  unit ->
  create_protect_configuration_request

val make_create_rcs_agent_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  unit ->
  create_rcs_agent_request

val make_create_registration_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  registration_type:registration_type ->
  unit ->
  create_registration_request

val make_create_registration_association_request :
  registration_id:registration_id_or_arn ->
  resource_id:resource_id_or_arn ->
  unit ->
  create_registration_association_request

val make_create_registration_attachment_request :
  ?attachment_body:attachment_body ->
  ?attachment_url:attachment_url ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  unit ->
  create_registration_attachment_request

val make_registration_version_status_history :
  ?submitted_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?aws_reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?requires_authentication_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?approved_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?discarded_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?denied_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?archived_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  draft_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  registration_version_status_history

val make_create_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> create_registration_version_request

val make_create_verified_destination_number_request :
  ?rcs_agent_id:rcs_agent_id_or_arn ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  destination_phone_number:phone_number ->
  unit ->
  create_verified_destination_number_request

val make_delete_account_default_protect_configuration_request : unit -> unit

val make_delete_configuration_set_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_configuration_set_request

val make_delete_default_message_type_request :
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  delete_default_message_type_request

val make_delete_default_sender_id_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_default_sender_id_request

val make_delete_event_destination_request :
  configuration_set_name:configuration_set_name_or_arn ->
  event_destination_name:event_destination_name ->
  unit ->
  delete_event_destination_request

val make_delete_keyword_request :
  origination_identity:phone_or_pool_id_or_arn -> keyword:keyword -> unit -> delete_keyword_request

val make_delete_media_message_spend_limit_override_request : unit -> unit

val make_delete_notify_configuration_request :
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  delete_notify_configuration_request

val make_delete_notify_message_spend_limit_override_request : unit -> unit

val make_delete_opt_out_list_request :
  opt_out_list_name:opt_out_list_name_or_arn -> unit -> delete_opt_out_list_request

val make_delete_opted_out_number_request :
  opt_out_list_name:opt_out_list_name_or_arn ->
  opted_out_number:phone_number ->
  unit ->
  delete_opted_out_number_request

val make_delete_pool_request : pool_id:pool_id_or_arn -> unit -> delete_pool_request

val make_delete_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  delete_protect_configuration_request

val make_delete_protect_configuration_rule_set_number_override_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  destination_phone_number:phone_number ->
  unit ->
  delete_protect_configuration_rule_set_number_override_request

val make_delete_rcs_agent_request :
  rcs_agent_id:rcs_agent_id_or_arn -> unit -> delete_rcs_agent_request

val make_delete_rcs_message_spend_limit_override_request : unit -> unit

val make_delete_registration_request :
  registration_id:registration_id_or_arn -> unit -> delete_registration_request

val make_delete_registration_attachment_request :
  registration_attachment_id:registration_attachment_id_or_arn ->
  unit ->
  delete_registration_attachment_request

val make_delete_registration_field_value_request :
  registration_id:registration_id_or_arn ->
  field_path:field_path ->
  unit ->
  delete_registration_field_value_request

val make_delete_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> delete_resource_policy_request

val make_delete_text_message_spend_limit_override_request : unit -> unit

val make_delete_verified_destination_number_request :
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  delete_verified_destination_number_request

val make_delete_voice_message_spend_limit_override_request : unit -> unit

val make_describe_account_attributes_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> describe_account_attributes_request

val make_describe_account_limits_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> describe_account_limits_request

val make_describe_configuration_sets_request :
  ?configuration_set_names:configuration_set_name_list ->
  ?filters:configuration_set_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_configuration_sets_request

val make_keyword_information :
  keyword:keyword ->
  keyword_message:keyword_message ->
  keyword_action:keyword_action ->
  unit ->
  keyword_information

val make_keyword_filter :
  name:keyword_filter_name -> values:filter_value_list -> unit -> keyword_filter

val make_describe_keywords_request :
  ?keywords:keyword_list ->
  ?filters:keyword_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  origination_identity:phone_or_pool_id_or_arn ->
  unit ->
  describe_keywords_request

val make_notify_configuration_information :
  ?default_template_id:notify_template_id ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?enabled_countries:iso_country_code_list ->
  ?rejection_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  notify_configuration_arn:notify_configuration_arn ->
  notify_configuration_id:notify_configuration_id ->
  display_name:notify_configuration_display_name ->
  use_case:notify_configuration_use_case ->
  enabled_channels:notify_enabled_channels_list ->
  tier:notify_configuration_tier ->
  tier_upgrade_status:tier_upgrade_status ->
  status:notify_configuration_status ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  notify_configuration_information

val make_notify_configuration_filter :
  name:notify_configuration_filter_name ->
  values:filter_value_list ->
  unit ->
  notify_configuration_filter

val make_describe_notify_configurations_request :
  ?notify_configuration_ids:notify_configuration_id_list ->
  ?filters:notify_configuration_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_notify_configurations_request

val make_template_variable_metadata :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_length:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?default_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sample:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source:template_variable_source ->
  type_:template_variable_type ->
  required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  template_variable_metadata

val make_notify_template_information :
  ?tier_access:notify_configuration_tier_list ->
  ?status:notify_template_status ->
  ?supported_countries:iso_country_code_list ->
  ?language_code:notify_language_code ->
  ?content:template_content ->
  ?variables:template_variables_map ->
  ?supported_voice_ids:voice_id_list ->
  template_id:notify_template_id ->
  version:notify_template_version ->
  template_type:notify_template_type ->
  channels:number_capability_list ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  notify_template_information

val make_notify_template_filter :
  name:notify_template_filter_name -> values:filter_value_list -> unit -> notify_template_filter

val make_describe_notify_templates_request :
  ?template_ids:notify_template_id_list ->
  ?filters:notify_template_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_notify_templates_request

val make_opt_out_list_information :
  opt_out_list_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  opt_out_list_name:opt_out_list_name ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  opt_out_list_information

val make_describe_opt_out_lists_request :
  ?opt_out_list_names:opt_out_list_name_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?owner:owner ->
  unit ->
  describe_opt_out_lists_request

val make_opted_out_number_information :
  opted_out_number:phone_number ->
  opted_out_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  end_user_opted_out:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  opted_out_number_information

val make_opted_out_filter :
  name:opted_out_filter_name -> values:filter_value_list -> unit -> opted_out_filter

val make_describe_opted_out_numbers_request :
  ?opted_out_numbers:opted_out_number_list ->
  ?filters:opted_out_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  describe_opted_out_numbers_request

val make_phone_number_information :
  ?phone_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  phone_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  phone_number:phone_number ->
  status:number_status ->
  iso_country_code:iso_country_code ->
  message_type:message_type ->
  number_capabilities:number_capability_list ->
  number_type:number_type ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  phone_number_information

val make_phone_number_filter :
  name:phone_number_filter_name -> values:filter_value_list -> unit -> phone_number_filter

val make_describe_phone_numbers_request :
  ?phone_number_ids:phone_number_id_list ->
  ?filters:phone_number_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?owner:owner ->
  unit ->
  describe_phone_numbers_request

val make_pool_information :
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  pool_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:pool_status ->
  message_type:message_type ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  shared_routes_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  pool_information

val make_pool_filter : name:pool_filter_name -> values:filter_value_list -> unit -> pool_filter

val make_describe_pools_request :
  ?pool_ids:pool_id_list ->
  ?filters:pool_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?owner:owner ->
  unit ->
  describe_pools_request

val make_protect_configuration_information :
  protect_configuration_arn:protect_configuration_arn ->
  protect_configuration_id:protect_configuration_id ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  account_default:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  protect_configuration_information

val make_protect_configuration_filter :
  name:protect_configuration_filter_name ->
  values:filter_value_list ->
  unit ->
  protect_configuration_filter

val make_describe_protect_configurations_request :
  ?protect_configuration_ids:protect_configuration_id_list ->
  ?filters:protect_configuration_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_protect_configurations_request

val make_describe_rcs_agent_country_launch_status_request :
  ?iso_country_codes:iso_country_code_list ->
  ?filters:country_launch_status_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  describe_rcs_agent_country_launch_status_request

val make_testing_agent_information :
  ?testing_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:testing_agent_status ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  testing_agent_information

val make_rcs_agent_information :
  ?opt_out_list_name:opt_out_list_name ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_role:iam_role_arn ->
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  ?testing_agent:testing_agent_information ->
  rcs_agent_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:rcs_agent_status ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  rcs_agent_information

val make_rcs_agent_filter :
  name:rcs_agent_filter_name -> values:filter_value_list -> unit -> rcs_agent_filter

val make_describe_rcs_agents_request :
  ?rcs_agent_ids:rcs_agent_id_list ->
  ?owner:owner ->
  ?filters:rcs_agent_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_rcs_agents_request

val make_registration_attachments_information :
  ?attachment_upload_error_reason:attachment_upload_error_reason ->
  ?attachment_url:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_attachment_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_attachment_id:Smaws_Lib.Smithy_api.Types.string_ ->
  attachment_status:attachment_status ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  registration_attachments_information

val make_registration_attachment_filter :
  name:registration_attachment_filter_name ->
  values:filter_value_list ->
  unit ->
  registration_attachment_filter

val make_describe_registration_attachments_request :
  ?registration_attachment_ids:registration_attachment_id_list ->
  ?filters:registration_attachment_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_registration_attachments_request

val make_select_option_description :
  ?title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  option_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  select_option_description

val make_registration_field_display_hints :
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?select_option_descriptions:select_option_descriptions_list ->
  ?text_validation_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?example_text_value:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_field_display_hints

val make_text_validation :
  min_length:Smaws_Lib.Smithy_api.Types.integer ->
  max_length:Smaws_Lib.Smithy_api.Types.integer ->
  pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  text_validation

val make_select_validation :
  min_choices:Smaws_Lib.Smithy_api.Types.integer ->
  max_choices:Smaws_Lib.Smithy_api.Types.integer ->
  options:string_list ->
  unit ->
  select_validation

val make_registration_field_definition :
  ?select_validation:select_validation ->
  ?text_validation:text_validation ->
  section_path:section_path ->
  field_path:field_path ->
  field_type:field_type ->
  field_requirement:field_requirement ->
  display_hints:registration_field_display_hints ->
  unit ->
  registration_field_definition

val make_describe_registration_field_definitions_request :
  ?section_path:section_path ->
  ?field_paths:field_path_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  registration_type:registration_type ->
  unit ->
  describe_registration_field_definitions_request

val make_registration_field_value_information :
  ?select_choices:select_choice_list ->
  ?text_value:text_value ->
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  ?denied_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  field_path:field_path ->
  unit ->
  registration_field_value_information

val make_describe_registration_field_values_request :
  ?version_number:registration_version_number ->
  ?section_path:section_path ->
  ?field_paths:field_path_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_field_values_request

val make_registration_section_display_hints :
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_section_display_hints

val make_registration_section_definition :
  section_path:section_path ->
  display_hints:registration_section_display_hints ->
  unit ->
  registration_section_definition

val make_describe_registration_section_definitions_request :
  ?section_paths:section_path_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  registration_type:registration_type ->
  unit ->
  describe_registration_section_definitions_request

val make_registration_type_display_hints :
  ?short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_type_display_hints

val make_supported_association :
  ?iso_country_code:iso_country_code ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  association_behavior:registration_association_behavior ->
  disassociation_behavior:registration_disassociation_behavior ->
  unit ->
  supported_association

val make_registration_type_definition :
  ?supported_associations:supported_association_list ->
  registration_type:registration_type ->
  display_hints:registration_type_display_hints ->
  unit ->
  registration_type_definition

val make_registration_type_filter :
  name:registration_type_filter_name -> values:filter_value_list -> unit -> registration_type_filter

val make_describe_registration_type_definitions_request :
  ?registration_types:registration_type_list ->
  ?filters:registration_type_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_registration_type_definitions_request

val make_registration_denied_reason_information :
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_denied_reason_information

val make_registration_version_information :
  ?denied_reasons:registration_denied_reason_information_list ->
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  version_number:registration_version_number ->
  registration_version_status:registration_version_status ->
  registration_version_status_history:registration_version_status_history ->
  unit ->
  registration_version_information

val make_registration_version_filter :
  name:registration_version_filter_name ->
  values:filter_value_list ->
  unit ->
  registration_version_filter

val make_describe_registration_versions_request :
  ?version_numbers:registration_version_number_list ->
  ?filters:registration_version_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_versions_request

val make_registration_information :
  ?approved_version_number:registration_version_number ->
  ?latest_denied_version_number:registration_version_number ->
  ?additional_attributes:string_map ->
  registration_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_type:registration_type ->
  registration_status:registration_status ->
  current_version_number:registration_version_number ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  registration_information

val make_registration_filter :
  name:registration_filter_name -> values:filter_value_list -> unit -> registration_filter

val make_describe_registrations_request :
  ?registration_ids:registration_id_list ->
  ?filters:registration_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_registrations_request

val make_sender_id_information :
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  sender_id_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  sender_id:sender_id ->
  iso_country_code:iso_country_code ->
  message_types:message_type_list ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  registered:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  sender_id_information

val make_sender_id_filter :
  name:sender_id_filter_name -> values:filter_value_list -> unit -> sender_id_filter

val make_sender_id_and_country :
  sender_id:sender_id_or_arn -> iso_country_code:iso_country_code -> unit -> sender_id_and_country

val make_describe_sender_ids_request :
  ?sender_ids:sender_id_list ->
  ?filters:sender_id_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?owner:owner ->
  unit ->
  describe_sender_ids_request

val make_spend_limit :
  name:spend_limit_name ->
  enforced_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  max_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  overridden:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  spend_limit

val make_describe_spend_limits_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> describe_spend_limits_request

val make_verified_destination_number_information :
  ?rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  verified_destination_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  verified_destination_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  destination_phone_number:phone_number ->
  status:verification_status ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  verified_destination_number_information

val make_verified_destination_number_filter :
  name:verified_destination_number_filter_name ->
  values:filter_value_list ->
  unit ->
  verified_destination_number_filter

val make_describe_verified_destination_numbers_request :
  ?verified_destination_number_ids:verified_destination_number_id_list ->
  ?destination_phone_numbers:destination_phone_number_list ->
  ?filters:verified_destination_number_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_verified_destination_numbers_request

val make_disassociate_origination_identity_request :
  ?iso_country_code:iso_country_code ->
  ?client_token:client_token ->
  pool_id:pool_id_or_arn ->
  origination_identity:phone_or_sender_id_or_arn ->
  unit ->
  disassociate_origination_identity_request

val make_disassociate_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  disassociate_protect_configuration_request

val make_discard_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> discard_registration_version_request

val make_protect_configuration_country_rule_set_information :
  protect_status:protect_status -> unit -> protect_configuration_country_rule_set_information

val make_get_protect_configuration_country_rule_set_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  number_capability:number_capability ->
  unit ->
  get_protect_configuration_country_rule_set_request

val make_get_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> get_resource_policy_request

val make_notify_country_information :
  iso_country_code:iso_country_code ->
  country_name:Smaws_Lib.Smithy_api.Types.string_ ->
  supported_channels:notify_enabled_channels_list ->
  supported_use_cases:notify_use_case_list ->
  supported_tiers:notify_tier_list ->
  customer_owned_identity_required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  unit ->
  notify_country_information

val make_list_notify_countries_request :
  ?channels:notify_enabled_channels_list ->
  ?use_cases:notify_use_case_list ->
  ?tier:notify_configuration_tier ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_notify_countries_request

val make_origination_identity_metadata :
  ?phone_number:phone_number ->
  origination_identity_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  origination_identity:Smaws_Lib.Smithy_api.Types.string_ ->
  iso_country_code:iso_country_code ->
  number_capabilities:number_capability_list ->
  unit ->
  origination_identity_metadata

val make_pool_origination_identities_filter :
  name:pool_origination_identities_filter_name ->
  values:filter_value_list ->
  unit ->
  pool_origination_identities_filter

val make_list_pool_origination_identities_request :
  ?filters:pool_origination_identities_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  pool_id:pool_id_or_arn ->
  unit ->
  list_pool_origination_identities_request

val make_protect_configuration_rule_set_number_override_filter_item :
  name:protect_configuration_rule_set_number_override_filter_name ->
  values:filter_value_list ->
  unit ->
  protect_configuration_rule_set_number_override_filter_item

val make_protect_configuration_rule_set_number_override :
  ?iso_country_code:iso_country_code ->
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  destination_phone_number:phone_number ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  action:protect_configuration_rule_override_action ->
  unit ->
  protect_configuration_rule_set_number_override

val make_list_protect_configuration_rule_set_number_overrides_request :
  ?filters:list_protect_configuration_rule_set_number_override_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  list_protect_configuration_rule_set_number_overrides_request

val make_registration_association_metadata :
  ?iso_country_code:iso_country_code ->
  ?phone_number:phone_number ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_association_metadata

val make_registration_association_filter :
  name:registration_association_filter_name ->
  values:filter_value_list ->
  unit ->
  registration_association_filter

val make_list_registration_associations_request :
  ?filters:registration_association_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  registration_id:registration_id_or_arn ->
  unit ->
  list_registration_associations_request

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_verify_destination_number_request :
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  verification_code:verification_code ->
  unit ->
  verify_destination_number_request

val make_update_sender_id_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  sender_id:sender_id_or_arn ->
  iso_country_code:iso_country_code ->
  unit ->
  update_sender_id_request

val make_update_rcs_agent_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name_or_unset ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_role:iam_role_arn_or_unset ->
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  update_rcs_agent_request

val make_update_protect_configuration_country_rule_set_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  number_capability:number_capability ->
  country_rule_set_updates:protect_configuration_country_rule_set ->
  unit ->
  update_protect_configuration_country_rule_set_request

val make_update_protect_configuration_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  update_protect_configuration_request

val make_update_pool_request :
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?shared_routes_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  pool_id:pool_id_or_arn ->
  unit ->
  update_pool_request

val make_update_phone_number_request :
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_channel_role:iam_role_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  phone_number_id:phone_number_id_or_arn ->
  unit ->
  update_phone_number_request

val make_update_notify_configuration_request :
  ?default_template_id:notify_template_id ->
  ?pool_id:notify_pool_id_or_unset ->
  ?enabled_countries:iso_country_code_list ->
  ?enabled_channels:notify_enabled_channels_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  update_notify_configuration_request

val make_update_event_destination_request :
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?matching_event_types:event_type_list ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?sns_destination:sns_destination ->
  configuration_set_name:configuration_set_name_or_arn ->
  event_destination_name:event_destination_name ->
  unit ->
  update_event_destination_request

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:non_empty_tag_list -> unit -> tag_resource_request

val make_submit_registration_version_request :
  ?aws_review:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  registration_id:registration_id_or_arn ->
  unit ->
  submit_registration_version_request

val make_set_voice_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_voice_message_spend_limit_override_request

val make_set_text_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_text_message_spend_limit_override_request

val make_set_rcs_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_rcs_message_spend_limit_override_request

val make_set_notify_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_notify_message_spend_limit_override_request

val make_set_media_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_media_message_spend_limit_override_request

val make_set_default_sender_id_request :
  configuration_set_name:configuration_set_name_or_arn ->
  sender_id:sender_id ->
  unit ->
  set_default_sender_id_request

val make_set_default_message_type_request :
  configuration_set_name:configuration_set_name_or_arn ->
  message_type:message_type ->
  unit ->
  set_default_message_type_request

val make_set_default_message_feedback_enabled_request :
  configuration_set_name:configuration_set_name_or_arn ->
  message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  set_default_message_feedback_enabled_request

val make_set_account_default_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  set_account_default_protect_configuration_request

val make_send_voice_message_request :
  ?message_body:voice_message_body ->
  ?message_body_text_type:voice_message_body_text_type ->
  ?voice_id:voice_id ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?max_price_per_minute:max_price ->
  ?time_to_live:time_to_live ->
  ?context:context_map ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  destination_phone_number:phone_number ->
  origination_identity:voice_message_origination_identity ->
  unit ->
  send_voice_message_request

val make_send_text_message_request :
  ?origination_identity:text_message_origination_identity ->
  ?message_body:text_message_body ->
  ?message_type:message_type ->
  ?keyword:keyword ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?max_price:max_price ->
  ?time_to_live:time_to_live ->
  ?context:context_map ->
  ?destination_country_parameters:destination_country_parameters ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  destination_phone_number:phone_number ->
  unit ->
  send_text_message_request

val make_rcs_fallback_configuration :
  ?message_body:rcs_fallback_message_body ->
  ?media_urls:media_url_list ->
  ?origination_identity:rcs_fallback_origination_identity ->
  channel:rcs_fallback_channel ->
  unit ->
  rcs_fallback_configuration

val make_rcs_create_calendar_event_action :
  ?description:rcs_calendar_event_description ->
  text:rcs_suggested_action_text ->
  postback_data:rcs_postback_data ->
  title:rcs_calendar_event_title ->
  start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  rcs_create_calendar_event_action

val make_rcs_request_location_action :
  text:rcs_suggested_action_text ->
  postback_data:rcs_postback_data ->
  unit ->
  rcs_request_location_action

val make_rcs_show_location_action :
  ?label:rcs_location_label ->
  text:rcs_suggested_action_text ->
  postback_data:rcs_postback_data ->
  latitude:Smaws_Lib.Smithy_api.Types.double ->
  longitude:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  rcs_show_location_action

val make_rcs_dial_phone_action :
  text:rcs_suggested_action_text ->
  postback_data:rcs_postback_data ->
  phone_number:phone_number ->
  unit ->
  rcs_dial_phone_action

val make_rcs_open_url_action :
  ?application:Smaws_Lib.Smithy_api.Types.string_ ->
  ?webview_view_mode:Smaws_Lib.Smithy_api.Types.string_ ->
  text:rcs_suggested_action_text ->
  postback_data:rcs_postback_data ->
  url:rcs_open_url_value ->
  unit ->
  rcs_open_url_action

val make_rcs_reply_action :
  text:rcs_suggested_action_text -> postback_data:rcs_postback_data -> unit -> rcs_reply_action

val make_rcs_carousel_card_media :
  ?thumbnail_url:rcs_media_url ->
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  file_url:rcs_media_url ->
  unit ->
  rcs_carousel_card_media

val make_rcs_carousel_card_content :
  ?title:rcs_card_title ->
  ?description:rcs_card_description ->
  ?media:rcs_carousel_card_media ->
  ?suggestions:rcs_card_suggested_action_list ->
  unit ->
  rcs_carousel_card_content

val make_rcs_carousel :
  card_width:Smaws_Lib.Smithy_api.Types.string_ ->
  card_contents:rcs_carousel_card_content_list ->
  unit ->
  rcs_carousel

val make_rcs_card_media :
  ?thumbnail_url:rcs_media_url ->
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  file_url:rcs_media_url ->
  unit ->
  rcs_card_media

val make_rcs_card_content :
  ?title:rcs_card_title ->
  ?description:rcs_card_description ->
  ?media:rcs_card_media ->
  ?suggestions:rcs_card_suggested_action_list ->
  unit ->
  rcs_card_content

val make_rcs_standalone_card :
  ?thumbnail_image_alignment:Smaws_Lib.Smithy_api.Types.string_ ->
  card_orientation:Smaws_Lib.Smithy_api.Types.string_ ->
  card_content:rcs_card_content ->
  unit ->
  rcs_standalone_card

val make_rcs_file_message :
  ?thumbnail_url:rcs_media_url -> file_url:rcs_media_url -> unit -> rcs_file_message

val make_rcs_text_message : body:rcs_text_body -> unit -> rcs_text_message

val make_rcs_message_content :
  ?suggestions:rcs_suggested_action_list -> content:rcs_content -> unit -> rcs_message_content

val make_send_rcs_message_request :
  ?rcs_message_content:rcs_message_content ->
  ?time_to_live:rcs_time_to_live ->
  ?message_traffic_type:rcs_message_traffic_type ->
  ?fallback_configuration:rcs_fallback_configuration ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?max_price:max_price ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?context:context_map ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  destination_phone_number:phone_number ->
  origination_identity:rcs_message_origination_identity ->
  unit ->
  send_rcs_message_request

val make_send_notify_voice_message_request :
  ?template_id:notify_template_id ->
  ?voice_id:voice_id ->
  ?time_to_live:time_to_live ->
  ?context:context_map ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  destination_phone_number:phone_number ->
  template_variables:template_variable_substitution_map ->
  unit ->
  send_notify_voice_message_request

val make_send_notify_text_message_request :
  ?template_id:notify_template_id ->
  ?time_to_live:time_to_live ->
  ?context:context_map ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  destination_phone_number:phone_number ->
  template_variables:template_variable_substitution_map ->
  unit ->
  send_notify_text_message_request

val make_send_media_message_request :
  ?message_body:text_message_body ->
  ?media_urls:media_url_list ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?max_price:max_price ->
  ?time_to_live:time_to_live ->
  ?context:context_map ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  destination_phone_number:phone_number ->
  origination_identity:media_message_origination_identity ->
  unit ->
  send_media_message_request

val make_send_destination_number_verification_code_request :
  ?language_code:language_code ->
  ?origination_identity:verification_message_origination_identity ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?context:context_map ->
  ?destination_country_parameters:destination_country_parameters ->
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  verification_channel:verification_channel ->
  unit ->
  send_destination_number_verification_code_request

val make_request_sender_id_request :
  ?message_types:message_type_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  sender_id:sender_id ->
  iso_country_code:iso_country_code ->
  unit ->
  request_sender_id_request

val make_request_phone_number_request :
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?pool_id:pool_id_or_arn ->
  ?registration_id:registration_id_or_arn ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  iso_country_code:iso_country_code ->
  message_type:message_type ->
  number_capabilities:number_capability_list ->
  number_type:requestable_number_type ->
  unit ->
  request_phone_number_request

val make_release_sender_id_request :
  sender_id:sender_id_or_arn ->
  iso_country_code:iso_country_code ->
  unit ->
  release_sender_id_request

val make_release_phone_number_request :
  phone_number_id:phone_number_id_or_arn -> unit -> release_phone_number_request

val make_put_resource_policy_request :
  resource_arn:amazon_resource_name -> policy:resource_policy -> unit -> put_resource_policy_request

val make_put_registration_field_value_request :
  ?select_choices:select_choice_list ->
  ?text_value:text_value ->
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  registration_id:registration_id_or_arn ->
  field_path:field_path ->
  unit ->
  put_registration_field_value_request

val make_put_protect_configuration_rule_set_number_override_request :
  ?client_token:client_token ->
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  destination_phone_number:phone_number ->
  action:protect_configuration_rule_override_action ->
  unit ->
  put_protect_configuration_rule_set_number_override_request

val make_put_opted_out_number_request :
  opt_out_list_name:opt_out_list_name_or_arn ->
  opted_out_number:phone_number ->
  unit ->
  put_opted_out_number_request

val make_put_message_feedback_request :
  message_id:message_id ->
  message_feedback_status:message_feedback_status ->
  unit ->
  put_message_feedback_request

val make_put_keyword_request :
  ?keyword_action:keyword_action ->
  origination_identity:phone_or_pool_id_or_arn ->
  keyword:keyword ->
  keyword_message:keyword_message ->
  unit ->
  put_keyword_request
