(** Pinpoint SMS Voice V2 client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_verify_destination_number_request :
  verification_code:verification_code ->
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  verify_destination_number_request

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_verified_destination_number_information :
  ?rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:verification_status ->
  destination_phone_number:phone_number ->
  verified_destination_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  verified_destination_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  verified_destination_number_information

val make_verified_destination_number_filter :
  values:filter_value_list ->
  name:verified_destination_number_filter_name ->
  unit ->
  verified_destination_number_filter

val make_update_sender_id_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id_or_arn ->
  unit ->
  update_sender_id_request

val make_update_rcs_agent_request :
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  ?two_way_media_s3_role:iam_role_arn_or_unset ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name_or_unset ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  update_rcs_agent_request

val make_update_protect_configuration_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  update_protect_configuration_request

val make_protect_configuration_country_rule_set_information :
  protect_status:protect_status -> unit -> protect_configuration_country_rule_set_information

val make_update_protect_configuration_country_rule_set_request :
  country_rule_set_updates:protect_configuration_country_rule_set ->
  number_capability:number_capability ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  update_protect_configuration_country_rule_set_request

val make_update_pool_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?shared_routes_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  pool_id:pool_id_or_arn ->
  unit ->
  update_pool_request

val make_update_phone_number_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  phone_number_id:phone_number_id_or_arn ->
  unit ->
  update_phone_number_request

val make_update_notify_configuration_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enabled_channels:notify_enabled_channels_list ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:notify_pool_id_or_unset ->
  ?default_template_id:notify_template_id ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  update_notify_configuration_request

val make_cloud_watch_logs_destination :
  log_group_arn:log_group_arn -> iam_role_arn:iam_role_arn -> unit -> cloud_watch_logs_destination

val make_kinesis_firehose_destination :
  delivery_stream_arn:delivery_stream_arn ->
  iam_role_arn:iam_role_arn ->
  unit ->
  kinesis_firehose_destination

val make_sns_destination : topic_arn:sns_topic_arn -> unit -> sns_destination

val make_event_destination :
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  matching_event_types:event_type_list ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  event_destination_name:event_destination_name ->
  unit ->
  event_destination

val make_update_event_destination_request :
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  ?matching_event_types:event_type_list ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  update_event_destination_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_text_validation :
  pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  max_length:Smaws_Lib.Smithy_api.Types.integer ->
  min_length:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  text_validation

val make_testing_agent_information :
  ?testing_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:testing_agent_status ->
  unit ->
  testing_agent_information

val make_template_variable_metadata :
  ?source:template_variable_source ->
  ?sample:Smaws_Lib.Smithy_api.Types.string_ ->
  ?pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_length:Smaws_Lib.Smithy_api.Types.integer ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  type_:template_variable_type ->
  unit ->
  template_variable_metadata

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:non_empty_tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_supported_association :
  ?iso_country_code:iso_country_code ->
  disassociation_behavior:registration_disassociation_behavior ->
  association_behavior:registration_association_behavior ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  supported_association

val make_registration_version_status_history :
  ?archived_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?denied_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?discarded_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?approved_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?requires_authentication_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?aws_reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?submitted_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  draft_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  registration_version_status_history

val make_submit_registration_version_request :
  ?aws_review:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  registration_id:registration_id_or_arn ->
  unit ->
  submit_registration_version_request

val make_spend_limit :
  overridden:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  max_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  enforced_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  name:spend_limit_name ->
  unit ->
  spend_limit

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
  sender_id:sender_id ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_sender_id_request

val make_set_default_message_type_request :
  message_type:message_type ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_message_type_request

val make_set_default_message_feedback_enabled_request :
  message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_message_feedback_enabled_request

val make_set_account_default_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  set_account_default_protect_configuration_request

val make_sender_id_and_country :
  iso_country_code:iso_country_code -> sender_id:sender_id_or_arn -> unit -> sender_id_and_country

val make_sender_id_information :
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registered:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  message_types:message_type_list ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id ->
  sender_id_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sender_id_information

val make_sender_id_filter :
  values:filter_value_list -> name:sender_id_filter_name -> unit -> sender_id_filter

val make_send_voice_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price_per_minute:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?voice_id:voice_id ->
  ?message_body_text_type:voice_message_body_text_type ->
  ?message_body:voice_message_body ->
  origination_identity:voice_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_voice_message_request

val make_send_text_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?destination_country_parameters:destination_country_parameters ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?keyword:keyword ->
  ?message_type:message_type ->
  ?message_body:text_message_body ->
  ?origination_identity:text_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_text_message_request

val make_rcs_text_message : body:rcs_text_body -> unit -> rcs_text_message

val make_rcs_file_message :
  ?thumbnail_url:rcs_media_url -> file_url:rcs_media_url -> unit -> rcs_file_message

val make_rcs_card_media :
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  ?thumbnail_url:rcs_media_url ->
  file_url:rcs_media_url ->
  unit ->
  rcs_card_media

val make_rcs_reply_action :
  postback_data:rcs_postback_data -> text:rcs_suggested_action_text -> unit -> rcs_reply_action

val make_rcs_open_url_action :
  ?webview_view_mode:Smaws_Lib.Smithy_api.Types.string_ ->
  ?application:Smaws_Lib.Smithy_api.Types.string_ ->
  url:rcs_open_url_value ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_open_url_action

val make_rcs_dial_phone_action :
  phone_number:phone_number ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_dial_phone_action

val make_rcs_show_location_action :
  ?label:rcs_location_label ->
  longitude:Smaws_Lib.Smithy_api.Types.double ->
  latitude:Smaws_Lib.Smithy_api.Types.double ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_show_location_action

val make_rcs_request_location_action :
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_request_location_action

val make_rcs_create_calendar_event_action :
  ?description:rcs_calendar_event_description ->
  end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  title:rcs_calendar_event_title ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_create_calendar_event_action

val make_rcs_card_content :
  ?suggestions:rcs_card_suggested_action_list ->
  ?media:rcs_card_media ->
  ?description:rcs_card_description ->
  ?title:rcs_card_title ->
  unit ->
  rcs_card_content

val make_rcs_standalone_card :
  ?thumbnail_image_alignment:Smaws_Lib.Smithy_api.Types.string_ ->
  card_content:rcs_card_content ->
  card_orientation:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_standalone_card

val make_rcs_carousel_card_media :
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  ?thumbnail_url:rcs_media_url ->
  file_url:rcs_media_url ->
  unit ->
  rcs_carousel_card_media

val make_rcs_carousel_card_content :
  ?suggestions:rcs_card_suggested_action_list ->
  ?media:rcs_carousel_card_media ->
  ?description:rcs_card_description ->
  ?title:rcs_card_title ->
  unit ->
  rcs_carousel_card_content

val make_rcs_carousel :
  card_contents:rcs_carousel_card_content_list ->
  card_width:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_carousel

val make_rcs_message_content :
  ?suggestions:rcs_suggested_action_list -> content:rcs_content -> unit -> rcs_message_content

val make_rcs_fallback_configuration :
  ?origination_identity:rcs_fallback_origination_identity ->
  ?media_urls:media_url_list ->
  ?message_body:rcs_fallback_message_body ->
  channel:rcs_fallback_channel ->
  unit ->
  rcs_fallback_configuration

val make_send_rcs_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?context:context_map ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?fallback_configuration:rcs_fallback_configuration ->
  ?message_traffic_type:rcs_message_traffic_type ->
  ?time_to_live:rcs_time_to_live ->
  ?rcs_message_content:rcs_message_content ->
  origination_identity:rcs_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_rcs_message_request

val make_send_notify_voice_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?voice_id:voice_id ->
  ?template_id:notify_template_id ->
  template_variables:template_variable_substitution_map ->
  destination_phone_number:phone_number ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  send_notify_voice_message_request

val make_send_notify_text_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?template_id:notify_template_id ->
  template_variables:template_variable_substitution_map ->
  destination_phone_number:phone_number ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  send_notify_text_message_request

val make_send_media_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?media_urls:media_url_list ->
  ?message_body:text_message_body ->
  origination_identity:media_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_media_message_request

val make_send_destination_number_verification_code_request :
  ?destination_country_parameters:destination_country_parameters ->
  ?context:context_map ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?origination_identity:verification_message_origination_identity ->
  ?language_code:language_code ->
  verification_channel:verification_channel ->
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  send_destination_number_verification_code_request

val make_select_validation :
  options:string_list ->
  max_choices:Smaws_Lib.Smithy_api.Types.integer ->
  min_choices:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  select_validation

val make_select_option_description :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?title:Smaws_Lib.Smithy_api.Types.string_ ->
  option_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  select_option_description

val make_request_sender_id_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?message_types:message_type_list ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id ->
  unit ->
  request_sender_id_request

val make_request_phone_number_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?registration_id:registration_id_or_arn ->
  ?pool_id:pool_id_or_arn ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  number_type:requestable_number_type ->
  number_capabilities:number_capability_list ->
  message_type:message_type ->
  iso_country_code:iso_country_code ->
  unit ->
  request_phone_number_request

val make_release_sender_id_request :
  iso_country_code:iso_country_code ->
  sender_id:sender_id_or_arn ->
  unit ->
  release_sender_id_request

val make_release_phone_number_request :
  phone_number_id:phone_number_id_or_arn -> unit -> release_phone_number_request

val make_registration_denied_reason_information :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_denied_reason_information

val make_registration_version_information :
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  ?denied_reasons:registration_denied_reason_information_list ->
  registration_version_status_history:registration_version_status_history ->
  registration_version_status:registration_version_status ->
  version_number:registration_version_number ->
  unit ->
  registration_version_information

val make_registration_version_filter :
  values:filter_value_list ->
  name:registration_version_filter_name ->
  unit ->
  registration_version_filter

val make_registration_type_filter :
  values:filter_value_list -> name:registration_type_filter_name -> unit -> registration_type_filter

val make_registration_type_display_hints :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_type_display_hints

val make_registration_type_definition :
  ?supported_associations:supported_association_list ->
  display_hints:registration_type_display_hints ->
  registration_type:registration_type ->
  unit ->
  registration_type_definition

val make_registration_section_display_hints :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_section_display_hints

val make_registration_section_definition :
  display_hints:registration_section_display_hints ->
  section_path:section_path ->
  unit ->
  registration_section_definition

val make_registration_information :
  ?additional_attributes:string_map ->
  ?latest_denied_version_number:registration_version_number ->
  ?approved_version_number:registration_version_number ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  current_version_number:registration_version_number ->
  registration_status:registration_status ->
  registration_type:registration_type ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_information

val make_registration_filter :
  values:filter_value_list -> name:registration_filter_name -> unit -> registration_filter

val make_registration_field_value_information :
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  ?denied_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  ?text_value:text_value ->
  ?select_choices:select_choice_list ->
  field_path:field_path ->
  unit ->
  registration_field_value_information

val make_registration_field_display_hints :
  ?example_text_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?text_validation_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?select_option_descriptions:select_option_descriptions_list ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_field_display_hints

val make_registration_field_definition :
  ?text_validation:text_validation ->
  ?select_validation:select_validation ->
  display_hints:registration_field_display_hints ->
  field_requirement:field_requirement ->
  field_type:field_type ->
  field_path:field_path ->
  section_path:section_path ->
  unit ->
  registration_field_definition

val make_registration_attachments_information :
  ?attachment_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?attachment_upload_error_reason:attachment_upload_error_reason ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  attachment_status:attachment_status ->
  registration_attachment_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_attachment_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_attachments_information

val make_registration_attachment_filter :
  values:filter_value_list ->
  name:registration_attachment_filter_name ->
  unit ->
  registration_attachment_filter

val make_registration_association_metadata :
  ?phone_number:phone_number ->
  ?iso_country_code:iso_country_code ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_association_metadata

val make_registration_association_filter :
  values:filter_value_list ->
  name:registration_association_filter_name ->
  unit ->
  registration_association_filter

val make_rcs_agent_information :
  ?testing_agent:testing_agent_information ->
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  ?two_way_media_s3_role:iam_role_arn ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?opt_out_list_name:opt_out_list_name ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:rcs_agent_status ->
  rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  rcs_agent_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_agent_information

val make_rcs_agent_filter :
  values:filter_value_list -> name:rcs_agent_filter_name -> unit -> rcs_agent_filter

val make_put_resource_policy_request :
  policy:resource_policy -> resource_arn:amazon_resource_name -> unit -> put_resource_policy_request

val make_put_registration_field_value_request :
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  ?text_value:text_value ->
  ?select_choices:select_choice_list ->
  field_path:field_path ->
  registration_id:registration_id_or_arn ->
  unit ->
  put_registration_field_value_request

val make_put_protect_configuration_rule_set_number_override_request :
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?client_token:client_token ->
  action:protect_configuration_rule_override_action ->
  destination_phone_number:phone_number ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  put_protect_configuration_rule_set_number_override_request

val make_put_opted_out_number_request :
  opted_out_number:phone_number ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  put_opted_out_number_request

val make_put_message_feedback_request :
  message_feedback_status:message_feedback_status ->
  message_id:message_id ->
  unit ->
  put_message_feedback_request

val make_put_keyword_request :
  ?keyword_action:keyword_action ->
  keyword_message:keyword_message ->
  keyword:keyword ->
  origination_identity:phone_or_pool_id_or_arn ->
  unit ->
  put_keyword_request

val make_protect_configuration_rule_set_number_override :
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?iso_country_code:iso_country_code ->
  action:protect_configuration_rule_override_action ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  destination_phone_number:phone_number ->
  unit ->
  protect_configuration_rule_set_number_override

val make_protect_configuration_rule_set_number_override_filter_item :
  values:filter_value_list ->
  name:protect_configuration_rule_set_number_override_filter_name ->
  unit ->
  protect_configuration_rule_set_number_override_filter_item

val make_protect_configuration_information :
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  account_default:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  protect_configuration_id:protect_configuration_id ->
  protect_configuration_arn:protect_configuration_arn ->
  unit ->
  protect_configuration_information

val make_protect_configuration_filter :
  values:filter_value_list ->
  name:protect_configuration_filter_name ->
  unit ->
  protect_configuration_filter

val make_pool_origination_identities_filter :
  values:filter_value_list ->
  name:pool_origination_identities_filter_name ->
  unit ->
  pool_origination_identities_filter

val make_pool_information :
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  shared_routes_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  message_type:message_type ->
  status:pool_status ->
  pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  pool_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  pool_information

val make_pool_filter : values:filter_value_list -> name:pool_filter_name -> unit -> pool_filter

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_registration_associations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_association_filter_list ->
  registration_id:registration_id_or_arn ->
  unit ->
  list_registration_associations_request

val make_list_protect_configuration_rule_set_number_overrides_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:list_protect_configuration_rule_set_number_override_filter ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  list_protect_configuration_rule_set_number_overrides_request

val make_origination_identity_metadata :
  ?phone_number:phone_number ->
  number_capabilities:number_capability_list ->
  iso_country_code:iso_country_code ->
  origination_identity:Smaws_Lib.Smithy_api.Types.string_ ->
  origination_identity_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  origination_identity_metadata

val make_list_pool_origination_identities_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:pool_origination_identities_filter_list ->
  pool_id:pool_id_or_arn ->
  unit ->
  list_pool_origination_identities_request

val make_notify_country_information :
  customer_owned_identity_required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  supported_tiers:notify_tier_list ->
  supported_use_cases:notify_use_case_list ->
  supported_channels:notify_enabled_channels_list ->
  country_name:Smaws_Lib.Smithy_api.Types.string_ ->
  iso_country_code:iso_country_code ->
  unit ->
  notify_country_information

val make_list_notify_countries_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?tier:notify_configuration_tier ->
  ?use_cases:notify_use_case_list ->
  ?channels:notify_enabled_channels_list ->
  unit ->
  list_notify_countries_request

val make_get_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> get_resource_policy_request

val make_get_protect_configuration_country_rule_set_request :
  number_capability:number_capability ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  get_protect_configuration_country_rule_set_request

val make_discard_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> discard_registration_version_request

val make_disassociate_protect_configuration_request :
  configuration_set_name:configuration_set_name_or_arn ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  disassociate_protect_configuration_request

val make_disassociate_origination_identity_request :
  ?client_token:client_token ->
  ?iso_country_code:iso_country_code ->
  origination_identity:phone_or_sender_id_or_arn ->
  pool_id:pool_id_or_arn ->
  unit ->
  disassociate_origination_identity_request

val make_describe_verified_destination_numbers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:verified_destination_number_filter_list ->
  ?destination_phone_numbers:destination_phone_number_list ->
  ?verified_destination_number_ids:verified_destination_number_id_list ->
  unit ->
  describe_verified_destination_numbers_request

val make_describe_spend_limits_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_spend_limits_request

val make_describe_sender_ids_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:sender_id_filter_list ->
  ?sender_ids:sender_id_list ->
  unit ->
  describe_sender_ids_request

val make_describe_registration_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_version_filter_list ->
  ?version_numbers:registration_version_number_list ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_versions_request

val make_describe_registration_type_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_type_filter_list ->
  ?registration_types:registration_type_list ->
  unit ->
  describe_registration_type_definitions_request

val make_describe_registration_section_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?section_paths:section_path_list ->
  registration_type:registration_type ->
  unit ->
  describe_registration_section_definitions_request

val make_describe_registrations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_filter_list ->
  ?registration_ids:registration_id_list ->
  unit ->
  describe_registrations_request

val make_describe_registration_field_values_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?field_paths:field_path_list ->
  ?section_path:section_path ->
  ?version_number:registration_version_number ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_field_values_request

val make_describe_registration_field_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?field_paths:field_path_list ->
  ?section_path:section_path ->
  registration_type:registration_type ->
  unit ->
  describe_registration_field_definitions_request

val make_describe_registration_attachments_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_attachment_filter_list ->
  ?registration_attachment_ids:registration_attachment_id_list ->
  unit ->
  describe_registration_attachments_request

val make_describe_rcs_agents_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:rcs_agent_filter_list ->
  ?owner:owner ->
  ?rcs_agent_ids:rcs_agent_id_list ->
  unit ->
  describe_rcs_agents_request

val make_carrier_status_information :
  status:carrier_status ->
  carrier_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  carrier_status_information

val make_country_launch_status_information :
  ?rcs_platform_id:Smaws_Lib.Smithy_api.Types.string_ ->
  carrier_status:carrier_status_information_list ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:country_launch_status ->
  iso_country_code:iso_country_code ->
  unit ->
  country_launch_status_information

val make_country_launch_status_filter :
  values:filter_value_list ->
  name:country_launch_status_filter_name ->
  unit ->
  country_launch_status_filter

val make_describe_rcs_agent_country_launch_status_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:country_launch_status_filter_list ->
  ?iso_country_codes:iso_country_code_list ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  describe_rcs_agent_country_launch_status_request

val make_describe_protect_configurations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:protect_configuration_filter_list ->
  ?protect_configuration_ids:protect_configuration_id_list ->
  unit ->
  describe_protect_configurations_request

val make_describe_pools_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:pool_filter_list ->
  ?pool_ids:pool_id_list ->
  unit ->
  describe_pools_request

val make_phone_number_information :
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?phone_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  number_type:number_type ->
  number_capabilities:number_capability_list ->
  message_type:message_type ->
  iso_country_code:iso_country_code ->
  status:number_status ->
  phone_number:phone_number ->
  phone_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  phone_number_information

val make_phone_number_filter :
  values:filter_value_list -> name:phone_number_filter_name -> unit -> phone_number_filter

val make_describe_phone_numbers_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:phone_number_filter_list ->
  ?phone_number_ids:phone_number_id_list ->
  unit ->
  describe_phone_numbers_request

val make_opt_out_list_information :
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  opt_out_list_name:opt_out_list_name ->
  opt_out_list_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  opt_out_list_information

val make_describe_opt_out_lists_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?opt_out_list_names:opt_out_list_name_list ->
  unit ->
  describe_opt_out_lists_request

val make_opted_out_number_information :
  end_user_opted_out:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opted_out_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  opted_out_number:phone_number ->
  unit ->
  opted_out_number_information

val make_opted_out_filter :
  values:filter_value_list -> name:opted_out_filter_name -> unit -> opted_out_filter

val make_describe_opted_out_numbers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:opted_out_filter_list ->
  ?opted_out_numbers:opted_out_number_list ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  describe_opted_out_numbers_request

val make_notify_template_information :
  ?supported_voice_ids:voice_id_list ->
  ?variables:template_variables_map ->
  ?content:template_content ->
  ?language_code:notify_language_code ->
  ?supported_countries:iso_country_code_list ->
  ?status:notify_template_status ->
  ?tier_access:notify_configuration_tier_list ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  channels:number_capability_list ->
  template_type:notify_template_type ->
  version:notify_template_version ->
  template_id:notify_template_id ->
  unit ->
  notify_template_information

val make_notify_template_filter :
  values:filter_value_list -> name:notify_template_filter_name -> unit -> notify_template_filter

val make_describe_notify_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:notify_template_filter_list ->
  ?template_ids:notify_template_id_list ->
  unit ->
  describe_notify_templates_request

val make_notify_configuration_information :
  ?rejection_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_template_id:notify_template_id ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  status:notify_configuration_status ->
  tier_upgrade_status:tier_upgrade_status ->
  tier:notify_configuration_tier ->
  enabled_channels:notify_enabled_channels_list ->
  use_case:notify_configuration_use_case ->
  display_name:notify_configuration_display_name ->
  notify_configuration_id:notify_configuration_id ->
  notify_configuration_arn:notify_configuration_arn ->
  unit ->
  notify_configuration_information

val make_notify_configuration_filter :
  values:filter_value_list ->
  name:notify_configuration_filter_name ->
  unit ->
  notify_configuration_filter

val make_describe_notify_configurations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:notify_configuration_filter_list ->
  ?notify_configuration_ids:notify_configuration_id_list ->
  unit ->
  describe_notify_configurations_request

val make_keyword_information :
  keyword_action:keyword_action ->
  keyword_message:keyword_message ->
  keyword:keyword ->
  unit ->
  keyword_information

val make_keyword_filter :
  values:filter_value_list -> name:keyword_filter_name -> unit -> keyword_filter

val make_describe_keywords_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:keyword_filter_list ->
  ?keywords:keyword_list ->
  origination_identity:phone_or_pool_id_or_arn ->
  unit ->
  describe_keywords_request

val make_configuration_set_information :
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?default_message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?default_sender_id:sender_id ->
  ?default_message_type:message_type ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  event_destinations:event_destination_list ->
  configuration_set_name:configuration_set_name ->
  configuration_set_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  configuration_set_information

val make_configuration_set_filter :
  values:filter_value_list -> name:configuration_set_filter_name -> unit -> configuration_set_filter

val make_describe_configuration_sets_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:configuration_set_filter_list ->
  ?configuration_set_names:configuration_set_name_list ->
  unit ->
  describe_configuration_sets_request

val make_account_limit :
  max:Smaws_Lib.Smithy_api.Types.primitive_long ->
  used:Smaws_Lib.Smithy_api.Types.primitive_long ->
  name:account_limit_name ->
  unit ->
  account_limit

val make_describe_account_limits_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_account_limits_request

val make_account_attribute :
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  name:account_attribute_name ->
  unit ->
  account_attribute

val make_describe_account_attributes_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_account_attributes_request

val make_delete_voice_message_spend_limit_override_request : unit -> unit

val make_delete_verified_destination_number_request :
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  delete_verified_destination_number_request

val make_delete_text_message_spend_limit_override_request : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> delete_resource_policy_request

val make_delete_registration_field_value_request :
  field_path:field_path ->
  registration_id:registration_id_or_arn ->
  unit ->
  delete_registration_field_value_request

val make_delete_registration_attachment_request :
  registration_attachment_id:registration_attachment_id_or_arn ->
  unit ->
  delete_registration_attachment_request

val make_delete_registration_request :
  registration_id:registration_id_or_arn -> unit -> delete_registration_request

val make_delete_rcs_message_spend_limit_override_request : unit -> unit

val make_delete_rcs_agent_request :
  rcs_agent_id:rcs_agent_id_or_arn -> unit -> delete_rcs_agent_request

val make_delete_protect_configuration_rule_set_number_override_request :
  destination_phone_number:phone_number ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  delete_protect_configuration_rule_set_number_override_request

val make_delete_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  delete_protect_configuration_request

val make_delete_pool_request : pool_id:pool_id_or_arn -> unit -> delete_pool_request

val make_delete_opt_out_list_request :
  opt_out_list_name:opt_out_list_name_or_arn -> unit -> delete_opt_out_list_request

val make_delete_opted_out_number_request :
  opted_out_number:phone_number ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  delete_opted_out_number_request

val make_delete_notify_message_spend_limit_override_request : unit -> unit

val make_delete_notify_configuration_request :
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  delete_notify_configuration_request

val make_delete_media_message_spend_limit_override_request : unit -> unit

val make_delete_keyword_request :
  keyword:keyword -> origination_identity:phone_or_pool_id_or_arn -> unit -> delete_keyword_request

val make_delete_event_destination_request :
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  delete_event_destination_request

val make_delete_default_sender_id_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_default_sender_id_request

val make_delete_default_message_type_request :
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  delete_default_message_type_request

val make_delete_configuration_set_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_configuration_set_request

val make_delete_account_default_protect_configuration_request : unit -> unit

val make_create_verified_destination_number_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?rcs_agent_id:rcs_agent_id_or_arn ->
  destination_phone_number:phone_number ->
  unit ->
  create_verified_destination_number_request

val make_create_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> create_registration_version_request

val make_create_registration_attachment_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?attachment_url:attachment_url ->
  ?attachment_body:attachment_body ->
  unit ->
  create_registration_attachment_request

val make_create_registration_association_request :
  resource_id:resource_id_or_arn ->
  registration_id:registration_id_or_arn ->
  unit ->
  create_registration_association_request

val make_create_registration_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  registration_type:registration_type ->
  unit ->
  create_registration_request

val make_create_rcs_agent_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  create_rcs_agent_request

val make_create_protect_configuration_request :
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  unit ->
  create_protect_configuration_request

val make_create_pool_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?iso_country_code:iso_country_code ->
  message_type:message_type ->
  origination_identity:phone_or_sender_id_or_arn ->
  unit ->
  create_pool_request

val make_create_opt_out_list_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  opt_out_list_name:opt_out_list_name ->
  unit ->
  create_opt_out_list_request

val make_create_notify_configuration_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:pool_id_or_arn ->
  ?default_template_id:notify_template_id ->
  enabled_channels:notify_enabled_channels_list ->
  use_case:notify_configuration_use_case ->
  display_name:notify_configuration_display_name ->
  unit ->
  create_notify_configuration_request

val make_create_event_destination_request :
  ?client_token:client_token ->
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  matching_event_types:event_type_list ->
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  create_event_destination_request

val make_create_configuration_set_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  configuration_set_name:configuration_set_name ->
  unit ->
  create_configuration_set_request

val make_carrier_lookup_request :
  phone_number:carrier_lookup_input_phone_number_type -> unit -> carrier_lookup_request

val make_associate_protect_configuration_request :
  configuration_set_name:configuration_set_name_or_arn ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  associate_protect_configuration_request

val make_associate_origination_identity_request :
  ?client_token:client_token ->
  ?iso_country_code:iso_country_code ->
  origination_identity:phone_or_sender_id_or_arn ->
  pool_id:pool_id_or_arn ->
  unit ->
  associate_origination_identity_request
(** {1:operations Operations} *)

module AssociateOriginationIdentity : sig
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
    associate_origination_identity_request ->
    ( associate_origination_identity_result,
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
    associate_origination_identity_request ->
    ( associate_origination_identity_result Smaws_Lib.Response.t,
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
  "Associates the specified origination identity with a pool.\n\n\
  \ If the origination identity is a phone number and is already associated with another pool, an \
   error is returned. A sender ID can be associated with multiple pools.\n\
  \ \n\
  \  If the origination identity configuration doesn't match the pool's configuration, an error is \
   returned.\n\
  \  "]

module AssociateProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_protect_configuration_request ->
    ( associate_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_protect_configuration_request ->
    ( associate_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associate a protect configuration with a configuration set. This replaces the configuration \
   sets current protect configuration. A configuration set can only be associated with one protect \
   configuration at a time. A protect configuration can be associated with multiple configuration \
   sets.\n"]

module CarrierLookup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    carrier_lookup_request ->
    ( carrier_lookup_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    carrier_lookup_request ->
    ( carrier_lookup_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a destination phone number, including whether the number type and \
   whether it is valid, the carrier, and more.\n"]

module CreateConfigurationSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_request ->
    ( create_configuration_set_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_request ->
    ( create_configuration_set_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new configuration set. After you create the configuration set, you can add one or \
   more event destinations to it.\n\n\
  \ A configuration set is a set of rules that you apply to the SMS and voice messages that you \
   send.\n\
  \ \n\
  \  When you send a message, you can optionally specify a single configuration set.\n\
  \  "]

module CreateEventDestination : sig
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
    create_event_destination_request ->
    ( create_event_destination_result,
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
    create_event_destination_request ->
    ( create_event_destination_result Smaws_Lib.Response.t,
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
  "Creates a new event destination in a configuration set.\n\n\
  \ An event destination is a location where you send message events. The event options are Amazon \
   CloudWatch, Amazon Data Firehose, or Amazon SNS. For example, when a message is delivered \
   successfully, you can send information about that event to an event destination, or send \
   notifications to endpoints that are subscribed to an Amazon SNS topic. \n\
  \ \n\
  \  You can only create one event destination at a time. You must provide a value for a single \
   event destination using either [CloudWatchLogsDestination], [KinesisFirehoseDestination] or \
   [SnsDestination]. If an event destination isn't provided then an exception is returned.\n\
  \  \n\
  \   Each configuration set can contain between 0 and 5 event destinations. Each event \
   destination can contain a reference to a single destination, such as a CloudWatch or Firehose \
   destination.\n\
  \   "]

module CreateNotifyConfiguration : sig
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
    create_notify_configuration_request ->
    ( create_notify_configuration_result,
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
    create_notify_configuration_request ->
    ( create_notify_configuration_result Smaws_Lib.Response.t,
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
  "Creates a new notify configuration for managed messaging. A notify configuration defines the \
   settings for sending templated messages, including the display name, use case, enabled \
   channels, and enabled countries.\n"]

module CreateOptOutList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_opt_out_list_request ->
    ( create_opt_out_list_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_opt_out_list_request ->
    ( create_opt_out_list_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new opt-out list.\n\n\
  \ If the opt-out list name already exists, an error is returned.\n\
  \ \n\
  \  An opt-out list is a list of phone numbers that are opted out, meaning you can't send SMS or \
   voice messages to them. If end user replies with the keyword \"STOP,\" an entry for the phone \
   number is added to the opt-out list. In addition to STOP, your recipients can use any supported \
   opt-out keyword, such as CANCEL or OPTOUT. For a list of supported opt-out keywords, see \
   {{:https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-manage.html#channels-sms-manage-optout} \
   SMS opt out } in the End User Messaging SMS User Guide.\n\
  \  "]

module CreatePool : sig
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
    create_pool_request ->
    ( create_pool_result,
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
    create_pool_request ->
    ( create_pool_result Smaws_Lib.Response.t,
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
  "Creates a new pool and associates the specified origination identity to the pool. A pool can \
   include one or more phone numbers and SenderIds that are associated with your Amazon Web \
   Services account.\n\n\
  \ The new pool inherits its configuration from the specified origination identity. This includes \
   keywords, message type, opt-out list, two-way configuration, and self-managed opt-out \
   configuration. Deletion protection isn't inherited from the origination identity and defaults \
   to false.\n\
  \ \n\
  \  If the origination identity is a phone number and is already associated with another pool, an \
   error is returned. A sender ID can be associated with multiple pools.\n\
  \  "]

module CreateProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_protect_configuration_request ->
    ( create_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_protect_configuration_request ->
    ( create_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a new protect configuration. By default all country rule sets for each capability are \
   set to [ALLOW]. Update the country rule sets using [UpdateProtectConfigurationCountryRuleSet]. \
   A protect configurations name is stored as a Tag with the key set to [Name] and value as the \
   name of the protect configuration.\n"]

module CreateRcsAgent : sig
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
    create_rcs_agent_request ->
    ( create_rcs_agent_result,
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
    create_rcs_agent_request ->
    ( create_rcs_agent_result Smaws_Lib.Response.t,
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
  "Creates a new RCS agent for sending rich messages through the RCS channel. The RCS agent serves \
   as an origination identity for sending RCS messages to your recipients.\n"]

module CreateRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_registration_request ->
    ( create_registration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_registration_request ->
    ( create_registration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new registration based on the {b RegistrationType} field. \n"]

module CreateRegistrationAssociation : sig
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
    create_registration_association_request ->
    ( create_registration_association_result,
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
    create_registration_association_request ->
    ( create_registration_association_result Smaws_Lib.Response.t,
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
  "Associate the registration with an origination identity such as a phone number or sender ID.\n"]

module CreateRegistrationAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_registration_attachment_request ->
    ( create_registration_attachment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_registration_attachment_request ->
    ( create_registration_attachment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a new registration attachment to use for uploading a file or a URL to a file. The \
   maximum file size is 500KB and valid file extensions are PDF, JPEG and PNG. For example, many \
   sender ID registrations require a signed \226\128\156letter of authorization\226\128\157 (LOA) \
   to be submitted.\n\n\
  \ Use either [AttachmentUrl] or [AttachmentBody] to upload your attachment. If both are \
   specified then an exception is returned.\n\
  \ "]

module CreateRegistrationVersion : sig
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
    create_registration_version_request ->
    ( create_registration_version_result,
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
    create_registration_version_request ->
    ( create_registration_version_result Smaws_Lib.Response.t,
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
  "Create a new version of the registration and increase the {b VersionNumber}. The previous \
   version of the registration becomes read-only.\n"]

module CreateVerifiedDestinationNumber : sig
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
    create_verified_destination_number_request ->
    ( create_verified_destination_number_result,
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
    create_verified_destination_number_request ->
    ( create_verified_destination_number_result Smaws_Lib.Response.t,
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
  "You can only send messages to verified destination numbers when your account is in the sandbox. \
   You can add up to 10 verified destination numbers.\n"]

module DeleteAccountDefaultProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_account_default_protect_configuration_request ->
    ( delete_account_default_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_account_default_protect_configuration_request ->
    ( delete_account_default_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the current account default protect configuration.\n"]

module DeleteConfigurationSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_request ->
    ( delete_configuration_set_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_request ->
    ( delete_configuration_set_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing configuration set.\n\n\
  \ A configuration set is a set of rules that you apply to voice and SMS messages that you send. \
   In a configuration set, you can specify a destination for specific types of events related to \
   voice and SMS messages. \n\
  \ "]

module DeleteDefaultMessageType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_default_message_type_request ->
    ( delete_default_message_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_default_message_type_request ->
    ( delete_default_message_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing default message type on a configuration set.\n\n\
  \  A message type is a type of messages that you plan to send. If you send account-related \
   messages or time-sensitive messages such as one-time passcodes, choose {b Transactional}. If \
   you plan to send messages that contain marketing material or other promotional content, choose \
   {b Promotional}. This setting applies to your entire Amazon Web Services account. \n\
  \ "]

module DeleteDefaultSenderId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_default_sender_id_request ->
    ( delete_default_sender_id_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_default_sender_id_request ->
    ( delete_default_sender_id_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing default sender ID on a configuration set.\n\n\
  \ A default sender ID is the identity that appears on recipients' devices when they receive SMS \
   messages. Support for sender ID capabilities varies by country or region.\n\
  \ "]

module DeleteEventDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_destination_request ->
    ( delete_event_destination_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_destination_request ->
    ( delete_event_destination_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing event destination.\n\n\
  \ An event destination is a location where you send response information about the messages that \
   you send. For example, when a message is delivered successfully, you can send information about \
   that event to an Amazon CloudWatch destination, or send notifications to endpoints that are \
   subscribed to an Amazon SNS topic.\n\
  \ "]

module DeleteKeyword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_keyword_request ->
    ( delete_keyword_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_keyword_request ->
    ( delete_keyword_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing keyword from an origination phone number or pool.\n\n\
  \ A keyword is a word that you can search for on a particular phone number or pool. It is also a \
   specific word or phrase that an end user can send to your number to elicit a response, such as \
   an informational message or a special offer. When your number receives a message that begins \
   with a keyword, End User Messaging SMS responds with a customizable message.\n\
  \ \n\
  \  Keywords \"HELP\" and \"STOP\" can't be deleted or modified.\n\
  \  "]

module DeleteMediaMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_media_message_spend_limit_override_request ->
    ( delete_media_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_media_message_spend_limit_override_request ->
    ( delete_media_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an account-level monthly spending limit override for sending multimedia messages (MMS). \
   Deleting a spend limit override will set the [EnforcedLimit] to equal the [MaxLimit], which is \
   controlled by Amazon Web Services. For more information on spend limits (quotas) see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html}Quotas for Server \
   Migration Service} in the {i Server Migration Service User Guide}.\n"]

module DeleteNotifyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notify_configuration_request ->
    ( delete_notify_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notify_configuration_request ->
    ( delete_notify_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing notify configuration.\n\n\
  \ If deletion protection is enabled, an error is returned.\n\
  \ "]

module DeleteNotifyMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notify_message_spend_limit_override_request ->
    ( delete_notify_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notify_message_spend_limit_override_request ->
    ( delete_notify_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an account-level monthly spending limit override for sending notify messages. Deleting \
   a spend limit override will set the [EnforcedLimit] to equal the [MaxLimit], which is \
   controlled by Amazon Web Services. For more information on spend limits (quotas) see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html}Quotas } in the {i End \
   User Messaging SMS User Guide}.\n"]

module DeleteOptedOutNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_opted_out_number_request ->
    ( delete_opted_out_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_opted_out_number_request ->
    ( delete_opted_out_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing opted out destination phone number from the specified opt-out list.\n\n\
  \ Each destination phone number can only be deleted once every 30 days.\n\
  \ \n\
  \  If the specified destination phone number doesn't exist or if the opt-out list doesn't exist, \
   an error is returned.\n\
  \  "]

module DeleteOptOutList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_opt_out_list_request ->
    ( delete_opt_out_list_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_opt_out_list_request ->
    ( delete_opt_out_list_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing opt-out list. All opted out phone numbers in the opt-out list are deleted.\n\n\
  \ If the specified opt-out list name doesn't exist or is in-use by an origination phone number \
   or pool, an error is returned.\n\
  \ "]

module DeletePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pool_request ->
    ( delete_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pool_request ->
    ( delete_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing pool. Deleting a pool disassociates all origination identities from that \
   pool.\n\n\
  \ If the pool status isn't active or if deletion protection is enabled, an error is returned.\n\
  \ \n\
  \  A pool is a collection of phone numbers and SenderIds. A pool can include one or more phone \
   numbers and SenderIds that are associated with your Amazon Web Services account.\n\
  \  "]

module DeleteProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_protect_configuration_request ->
    ( delete_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_protect_configuration_request ->
    ( delete_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Permanently delete the protect configuration. The protect configuration must have deletion \
   protection disabled and must not be associated as the account default protect configuration or \
   associated with a configuration set.\n"]

module DeleteProtectConfigurationRuleSetNumberOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_protect_configuration_rule_set_number_override_request ->
    ( delete_protect_configuration_rule_set_number_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_protect_configuration_rule_set_number_override_request ->
    ( delete_protect_configuration_rule_set_number_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Permanently delete the protect configuration rule set number override.\n"]

module DeleteRcsAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rcs_agent_request ->
    ( delete_rcs_agent_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rcs_agent_request ->
    ( delete_rcs_agent_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing RCS agent. If deletion protection is enabled, an error is returned.\n"]

module DeleteRcsMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rcs_message_spend_limit_override_request ->
    ( delete_rcs_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rcs_message_spend_limit_override_request ->
    ( delete_rcs_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an account-level monthly spending limit override for sending RCS messages. Deleting a \
   spend limit override sets the [EnforcedLimit] to equal the [MaxLimit], which is set by Amazon \
   Web Services.\n"]

module DeleteRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_request ->
    ( delete_registration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_request ->
    ( delete_registration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Permanently delete an existing registration from your account.\n"]

module DeleteRegistrationAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_attachment_request ->
    ( delete_registration_attachment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_attachment_request ->
    ( delete_registration_attachment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Permanently delete the specified registration attachment.\n"]

module DeleteRegistrationFieldValue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_field_value_request ->
    ( delete_registration_field_value_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registration_field_value_request ->
    ( delete_registration_field_value_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete the value in a registration form field.\n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the resource-based policy document attached to the End User Messaging SMS resource. A \
   shared resource can be a Pool, Opt-out list, Sender Id, or Phone number.\n"]

module DeleteTextMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_text_message_spend_limit_override_request ->
    ( delete_text_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_text_message_spend_limit_override_request ->
    ( delete_text_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an account-level monthly spending limit override for sending text messages. Deleting a \
   spend limit override will set the [EnforcedLimit] to equal the [MaxLimit], which is controlled \
   by Amazon Web Services. For more information on spend limits (quotas) see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html}Quotas } in the {i End \
   User Messaging SMS User Guide}.\n"]

module DeleteVerifiedDestinationNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_verified_destination_number_request ->
    ( delete_verified_destination_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_verified_destination_number_request ->
    ( delete_verified_destination_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a verified destination phone number.\n"]

module DeleteVoiceMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_voice_message_spend_limit_override_request ->
    ( delete_voice_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_voice_message_spend_limit_override_request ->
    ( delete_voice_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an account level monthly spend limit override for sending voice messages. Deleting a \
   spend limit override sets the [EnforcedLimit] equal to the [MaxLimit], which is controlled by \
   Amazon Web Services. For more information on spending limits (quotas) see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html}Quotas } in the {i End \
   User Messaging SMS User Guide}.\n"]

module DescribeAccountAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_request ->
    ( describe_account_attributes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_attributes_request ->
    ( describe_account_attributes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes attributes of your Amazon Web Services account. The supported account attributes \
   include account tier, which indicates whether your account is in the sandbox or production \
   environment. When you're ready to move your account out of the sandbox, create an Amazon Web \
   Services Support case for a service limit increase request.\n\n\
  \ New accounts are placed into an SMS or voice sandbox. The sandbox protects both Amazon Web \
   Services end recipients and SMS or voice recipients from fraud and abuse. \n\
  \ "]

module DescribeAccountLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_request ->
    ( describe_account_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_request ->
    ( describe_account_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current End User Messaging SMS SMS Voice V2 resource quotas for your account. The \
   description for a quota includes the quota name, current usage toward that quota, and the \
   quota's maximum value.\n\n\
  \ When you establish an Amazon Web Services account, the account has initial quotas on the \
   maximum number of configuration sets, opt-out lists, phone numbers, and pools that you can \
   create in a given Region. For more information see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html}Quotas } in the {i End \
   User Messaging SMS User Guide}.\n\
  \ "]

module DescribeConfigurationSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_sets_request ->
    ( describe_configuration_sets_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_sets_request ->
    ( describe_configuration_sets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified configuration sets or all in your account.\n\n\
  \ If you specify configuration set names, the output includes information for only the specified \
   configuration sets. If you specify filters, the output includes information for only those \
   configuration sets that meet the filter criteria. If you don't specify configuration set names \
   or filters, the output includes information for all configuration sets.\n\
  \ \n\
  \  If you specify a configuration set name that isn't valid, an error is returned.\n\
  \  "]

module DescribeKeywords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_keywords_request ->
    ( describe_keywords_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_keywords_request ->
    ( describe_keywords_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified keywords or all keywords on your origination phone number or pool.\n\n\
  \ A keyword is a word that you can search for on a particular phone number or pool. It is also a \
   specific word or phrase that an end user can send to your number to elicit a response, such as \
   an informational message or a special offer. When your number receives a message that begins \
   with a keyword, End User Messaging SMS responds with a customizable message.\n\
  \ \n\
  \  If you specify a keyword that isn't valid, an error is returned.\n\
  \  "]

module DescribeNotifyConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notify_configurations_request ->
    ( describe_notify_configurations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notify_configurations_request ->
    ( describe_notify_configurations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified notify configurations or all notify configurations in your account.\n\n\
  \ If you specify notify configuration IDs, the output includes information for only the \
   specified notify configurations. If you specify filters, the output includes information for \
   only those notify configurations that meet the filter criteria. If you don't specify notify \
   configuration IDs or filters, the output includes information for all notify configurations.\n\
  \ \n\
  \  If you specify a notify configuration ID that isn't valid, an error is returned.\n\
  \  "]

module DescribeNotifyTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notify_templates_request ->
    ( describe_notify_templates_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notify_templates_request ->
    ( describe_notify_templates_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified notify templates or all notify templates in your account.\n\n\
  \ If you specify template IDs, the output includes information for only the specified notify \
   templates. If you specify filters, the output includes information for only those notify \
   templates that meet the filter criteria. If you don't specify template IDs or filters, the \
   output includes information for all notify templates.\n\
  \ \n\
  \  If you specify a template ID that isn't valid, an error is returned.\n\
  \  "]

module DescribeOptedOutNumbers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_opted_out_numbers_request ->
    ( describe_opted_out_numbers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_opted_out_numbers_request ->
    ( describe_opted_out_numbers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified opted out destination numbers or all opted out destination numbers in \
   an opt-out list.\n\n\
  \ If you specify opted out numbers, the output includes information for only the specified opted \
   out numbers. If you specify filters, the output includes information for only those opted out \
   numbers that meet the filter criteria. If you don't specify opted out numbers or filters, the \
   output includes information for all opted out destination numbers in your opt-out list.\n\
  \ \n\
  \  If you specify an opted out number that isn't valid, an exception is returned.\n\
  \  "]

module DescribeOptOutLists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_opt_out_lists_request ->
    ( describe_opt_out_lists_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_opt_out_lists_request ->
    ( describe_opt_out_lists_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified opt-out list or all opt-out lists in your account.\n\n\
  \ If you specify opt-out list names, the output includes information for only the specified \
   opt-out lists. Opt-out lists include only those that meet the filter criteria. If you don't \
   specify opt-out list names or filters, the output includes information for all opt-out lists.\n\
  \ \n\
  \  If you specify an opt-out list name that isn't valid, an error is returned.\n\
  \  "]

module DescribePhoneNumbers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_phone_numbers_request ->
    ( describe_phone_numbers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_phone_numbers_request ->
    ( describe_phone_numbers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified origination phone number, or all the phone numbers in your account.\n\n\
  \ If you specify phone number IDs, the output includes information for only the specified phone \
   numbers. If you specify filters, the output includes information for only those phone numbers \
   that meet the filter criteria. If you don't specify phone number IDs or filters, the output \
   includes information for all phone numbers.\n\
  \ \n\
  \  If you specify a phone number ID that isn't valid, an error is returned.\n\
  \  "]

module DescribePools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pools_request ->
    ( describe_pools_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pools_request ->
    ( describe_pools_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified pools or all pools associated with your Amazon Web Services account.\n\n\
  \ If you specify pool IDs, the output includes information for only the specified pools. If you \
   specify filters, the output includes information for only those pools that meet the filter \
   criteria. If you don't specify pool IDs or filters, the output includes information for all \
   pools.\n\
  \ \n\
  \  If you specify a pool ID that isn't valid, an error is returned.\n\
  \  \n\
  \   A pool is a collection of phone numbers and SenderIds. A pool can include one or more phone \
   numbers and SenderIds that are associated with your Amazon Web Services account.\n\
  \   "]

module DescribeProtectConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_protect_configurations_request ->
    ( describe_protect_configurations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_protect_configurations_request ->
    ( describe_protect_configurations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the protect configurations that match any of filters. If a filter isn\226\128\153t \
   provided then all protect configurations are returned.\n"]

module DescribeRcsAgentCountryLaunchStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rcs_agent_country_launch_status_request ->
    ( describe_rcs_agent_country_launch_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rcs_agent_country_launch_status_request ->
    ( describe_rcs_agent_country_launch_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the per-country launch status of an RCS agent, including carrier-level details for \
   each country.\n"]

module DescribeRcsAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rcs_agents_request ->
    ( describe_rcs_agents_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rcs_agents_request ->
    ( describe_rcs_agents_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified RCS agents or all RCS agents associated with your Amazon Web Services \
   account.\n\n\
  \ If you specify RCS agent IDs, the output includes information for only the specified RCS \
   agents. If you specify filters, the output includes information for only those RCS agents that \
   meet the filter criteria. If you don't specify RCS agent IDs or filters, the output includes \
   information for all RCS agents.\n\
  \ "]

module DescribeRegistrationAttachments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_attachments_request ->
    ( describe_registration_attachments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_attachments_request ->
    ( describe_registration_attachments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified registration attachments or all registration attachments associated \
   with your Amazon Web Services account.\n"]

module DescribeRegistrationFieldDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_field_definitions_request ->
    ( describe_registration_field_definitions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_field_definitions_request ->
    ( describe_registration_field_definitions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified registration type field definitions. You can use \
   DescribeRegistrationFieldDefinitions to view the requirements for creating, filling out, and \
   submitting each registration type.\n"]

module DescribeRegistrationFieldValues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_field_values_request ->
    ( describe_registration_field_values_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_field_values_request ->
    ( describe_registration_field_values_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified registration field values.\n"]

module DescribeRegistrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registrations_request ->
    ( describe_registrations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registrations_request ->
    ( describe_registrations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified registrations.\n"]

module DescribeRegistrationSectionDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_section_definitions_request ->
    ( describe_registration_section_definitions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_section_definitions_request ->
    ( describe_registration_section_definitions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified registration section definitions. You can use \
   DescribeRegistrationSectionDefinitions to view the requirements for creating, filling out, and \
   submitting each registration type.\n"]

module DescribeRegistrationTypeDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_type_definitions_request ->
    ( describe_registration_type_definitions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_type_definitions_request ->
    ( describe_registration_type_definitions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified registration type definitions. You can use \
   DescribeRegistrationTypeDefinitions to view the requirements for creating, filling out, and \
   submitting each registration type.\n"]

module DescribeRegistrationVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_versions_request ->
    ( describe_registration_versions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registration_versions_request ->
    ( describe_registration_versions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified registration version.\n"]

module DescribeSenderIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_sender_ids_request ->
    ( describe_sender_ids_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_sender_ids_request ->
    ( describe_sender_ids_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified SenderIds or all SenderIds associated with your Amazon Web Services \
   account.\n\n\
  \ If you specify SenderIds, the output includes information for only the specified SenderIds. If \
   you specify filters, the output includes information for only those SenderIds that meet the \
   filter criteria. If you don't specify SenderIds or filters, the output includes information for \
   all SenderIds.\n\
  \ \n\
  \  f you specify a sender ID that isn't valid, an error is returned.\n\
  \  "]

module DescribeSpendLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_spend_limits_request ->
    ( describe_spend_limits_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_spend_limits_request ->
    ( describe_spend_limits_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current monthly spend limits for sending voice and text messages.\n\n\
  \ When you establish an Amazon Web Services account, the account has initial monthly spend limit \
   in a given Region. For more information on increasing your monthly spend limit, see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/awssupport-spend-threshold.html} \
   Requesting increases to your monthly SMS, MMS, or Voice spending quota } in the {i End User \
   Messaging SMS User Guide}.\n\
  \ "]

module DescribeVerifiedDestinationNumbers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_verified_destination_numbers_request ->
    ( describe_verified_destination_numbers_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_verified_destination_numbers_request ->
    ( describe_verified_destination_numbers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the specified verified destination numbers.\n"]

module DisassociateOriginationIdentity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_origination_identity_request ->
    ( disassociate_origination_identity_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_origination_identity_request ->
    ( disassociate_origination_identity_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified origination identity from an existing pool.\n\n\
  \ If the origination identity isn't associated with the specified pool, an error is returned.\n\
  \ "]

module DisassociateProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_protect_configuration_request ->
    ( disassociate_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_protect_configuration_request ->
    ( disassociate_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociate a protect configuration from a configuration set.\n"]

module DiscardRegistrationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    discard_registration_version_request ->
    ( discard_registration_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    discard_registration_version_request ->
    ( discard_registration_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Discard the current version of the registration.\n"]

module GetProtectConfigurationCountryRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_protect_configuration_country_rule_set_request ->
    ( get_protect_configuration_country_rule_set_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_protect_configuration_country_rule_set_request ->
    ( get_protect_configuration_country_rule_set_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the CountryRuleSet for the specified NumberCapability from a protect configuration.\n"]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the JSON text of the resource-based policy document attached to the End User \
   Messaging SMS resource. A shared resource can be a Pool, Opt-out list, Sender Id, or Phone \
   number.\n"]

module ListNotifyCountries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notify_countries_request ->
    ( list_notify_countries_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notify_countries_request ->
    ( list_notify_countries_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists countries that support notify messaging. You can optionally filter by channel, use case, \
   or tier.\n"]

module ListPoolOriginationIdentities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pool_origination_identities_request ->
    ( list_pool_origination_identities_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pool_origination_identities_request ->
    ( list_pool_origination_identities_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all associated origination identities in your pool.\n\n\
  \ If you specify filters, the output includes information for only those origination identities \
   that meet the filter criteria.\n\
  \ "]

module ListProtectConfigurationRuleSetNumberOverrides : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_protect_configuration_rule_set_number_overrides_request ->
    ( list_protect_configuration_rule_set_number_overrides_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_protect_configuration_rule_set_number_overrides_request ->
    ( list_protect_configuration_rule_set_number_overrides_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve all of the protect configuration rule set number overrides that match the filters.\n"]

module ListRegistrationAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_registration_associations_request ->
    ( list_registration_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_registration_associations_request ->
    ( list_registration_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve all of the origination identities that are associated with a registration.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all tags associated with a resource.\n"]

module PutKeyword : sig
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
    put_keyword_request ->
    ( put_keyword_result,
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
    put_keyword_request ->
    ( put_keyword_result Smaws_Lib.Response.t,
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
  "Creates or updates a keyword configuration on an origination phone number or pool.\n\n\
  \  A keyword is a word that you can search for on a particular phone number or pool. It is also \
   a specific word or phrase that an end user can send to your number to elicit a response, such \
   as an informational message or a special offer. When your number receives a message that begins \
   with a keyword, End User Messaging SMS responds with a customizable message.\n\
  \ \n\
  \  If you specify a keyword that isn't valid, an error is returned.\n\
  \  "]

module PutMessageFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_message_feedback_request ->
    ( put_message_feedback_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_message_feedback_request ->
    ( put_message_feedback_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Set the MessageFeedbackStatus as [RECEIVED] or [FAILED] for the passed in MessageId. \n\n\
  \ If you use message feedback then you must update message feedback record. When you receive a \
   signal that a user has received the message you must use [PutMessageFeedback] to set the \
   message feedback record as [RECEIVED]; Otherwise, an hour after the message feedback record is \
   set to [FAILED].\n\
  \ "]

module PutOptedOutNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_opted_out_number_request ->
    ( put_opted_out_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_opted_out_number_request ->
    ( put_opted_out_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an opted out destination phone number in the opt-out list.\n\n\
  \ If the destination phone number isn't valid or if the specified opt-out list doesn't exist, an \
   error is returned.\n\
  \ "]

module PutProtectConfigurationRuleSetNumberOverride : sig
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
    put_protect_configuration_rule_set_number_override_request ->
    ( put_protect_configuration_rule_set_number_override_result,
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
    put_protect_configuration_rule_set_number_override_request ->
    ( put_protect_configuration_rule_set_number_override_result Smaws_Lib.Response.t,
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
  "Create or update a phone number rule override and associate it with a protect configuration.\n"]

module PutRegistrationFieldValue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_registration_field_value_request ->
    ( put_registration_field_value_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_registration_field_value_request ->
    ( put_registration_field_value_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates a field value for a registration.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a resource-based policy to a End User Messaging SMS resource(phone number, sender Id, \
   phone poll, or opt-out list) that is used for sharing the resource. A shared resource can be a \
   Pool, Opt-out list, Sender Id, or Phone number. For more information about resource-based \
   policies, see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/shared-resources.html}Working with \
   shared resources} in the {i End User Messaging SMS User Guide}. \n"]

module ReleasePhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    release_phone_number_request ->
    ( release_phone_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    release_phone_number_request ->
    ( release_phone_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Releases an existing origination phone number in your account. Once released, a phone number is \
   no longer available for sending messages.\n\n\
  \ If the origination phone number has deletion protection enabled or is associated with a pool, \
   an error is returned.\n\
  \ "]

module ReleaseSenderId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    release_sender_id_request ->
    ( release_sender_id_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    release_sender_id_request ->
    ( release_sender_id_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Releases an existing sender ID in your account.\n"]

module RequestPhoneNumber : sig
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
    request_phone_number_request ->
    ( request_phone_number_result,
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
    request_phone_number_request ->
    ( request_phone_number_result Smaws_Lib.Response.t,
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
  "Request an origination phone number for use in your account. For more information on phone \
   number request see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-request.html}Request a \
   phone number} in the {i End User Messaging SMS User Guide}.\n"]

module RequestSenderId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_sender_id_request ->
    ( request_sender_id_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    request_sender_id_request ->
    ( request_sender_id_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Request a new sender ID that doesn't require registration. \n"]

module SendDestinationNumberVerificationCode : sig
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
    send_destination_number_verification_code_request ->
    ( send_destination_number_verification_code_result,
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
    send_destination_number_verification_code_request ->
    ( send_destination_number_verification_code_result Smaws_Lib.Response.t,
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
  "Before you can send test messages to a verified destination phone number you need to opt-in the \
   verified destination phone number. Creates a new text message with a verification code and send \
   it to a verified destination phone number. Once you have the verification code use \
   [VerifyDestinationNumber] to opt-in the verified destination phone number to receive messages.\n"]

module SendMediaMessage : sig
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
    send_media_message_request ->
    ( send_media_message_result,
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
    send_media_message_request ->
    ( send_media_message_result Smaws_Lib.Response.t,
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
  "Creates a new multimedia message (MMS) and sends it to a recipient's phone number. \n"]

module SendNotifyTextMessage : sig
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
    send_notify_text_message_request ->
    ( send_notify_text_message_result,
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
    send_notify_text_message_request ->
    ( send_notify_text_message_result Smaws_Lib.Response.t,
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
  "Sends a templated text message through a notify configuration to a recipient's phone number.\n"]

module SendNotifyVoiceMessage : sig
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
    send_notify_voice_message_request ->
    ( send_notify_voice_message_result,
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
    send_notify_voice_message_request ->
    ( send_notify_voice_message_result Smaws_Lib.Response.t,
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
  "Sends a templated voice message through a notify configuration to a recipient's phone number.\n"]

module SendRcsMessage : sig
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
    send_rcs_message_request ->
    ( send_rcs_message_result,
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
    send_rcs_message_request ->
    ( send_rcs_message_result Smaws_Lib.Response.t,
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
  "Creates a new RCS message and sends it to a recipient's phone number. RCS messages support rich \
   content including text, files, rich cards, and carousels with interactive suggested actions.\n"]

module SendTextMessage : sig
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
    send_text_message_request ->
    ( send_text_message_result,
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
    send_text_message_request ->
    ( send_text_message_result Smaws_Lib.Response.t,
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
  "Creates a new text message and sends it to a recipient's phone number. SendTextMessage only \
   sends an SMS message to one recipient each time it is invoked.\n\n\
  \ SMS throughput limits are measured in Message Parts per Second (MPS). Your MPS limit depends \
   on the destination country of your messages, as well as the type of phone number (origination \
   number) that you use to send the message. For more information about MPS, see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/sms-limitations-mps.html}Message \
   Parts per Second (MPS) limits} in the {i End User Messaging SMS User Guide}.\n\
  \ "]

module SendVoiceMessage : sig
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
    send_voice_message_request ->
    ( send_voice_message_result,
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
    send_voice_message_request ->
    ( send_voice_message_result Smaws_Lib.Response.t,
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
  "Allows you to send a request that sends a voice message. This operation uses \
   {{:http://aws.amazon.com/polly/}Amazon Polly} to convert a text script into a voice message.\n"]

module SetAccountDefaultProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_account_default_protect_configuration_request ->
    ( set_account_default_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_account_default_protect_configuration_request ->
    ( set_account_default_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Set a protect configuration as your account default. You can only have one account default \
   protect configuration at a time. The current account default protect configuration is replaced \
   with the provided protect configuration.\n"]

module SetDefaultMessageFeedbackEnabled : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_default_message_feedback_enabled_request ->
    ( set_default_message_feedback_enabled_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_default_message_feedback_enabled_request ->
    ( set_default_message_feedback_enabled_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets a configuration set's default for message feedback. \n"]

module SetDefaultMessageType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_default_message_type_request ->
    ( set_default_message_type_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_default_message_type_request ->
    ( set_default_message_type_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the default message type on a configuration set.\n\n\
  \ Choose the category of SMS messages that you plan to send from this account. If you send \
   account-related messages or time-sensitive messages such as one-time passcodes, choose {b \
   Transactional}. If you plan to send messages that contain marketing material or other \
   promotional content, choose {b Promotional}. This setting applies to your entire Amazon Web \
   Services account.\n\
  \ "]

module SetDefaultSenderId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_default_sender_id_request ->
    ( set_default_sender_id_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_default_sender_id_request ->
    ( set_default_sender_id_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets default sender ID on a configuration set.\n\n\
  \ When sending a text message to a destination country that supports sender IDs, the default \
   sender ID on the configuration set specified will be used if no dedicated origination phone \
   numbers or registered sender IDs are available in your account.\n\
  \ "]

module SetMediaMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_media_message_spend_limit_override_request ->
    ( set_media_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_media_message_spend_limit_override_request ->
    ( set_media_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an account level monthly spend limit override for sending MMS messages. The requested \
   spend limit must be less than or equal to the [MaxLimit], which is set by Amazon Web Services. \n"]

module SetNotifyMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_notify_message_spend_limit_override_request ->
    ( set_notify_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_notify_message_spend_limit_override_request ->
    ( set_notify_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an account level monthly spend limit override for sending notify messages. The requested \
   spend limit must be less than or equal to the [MaxLimit], which is set by Amazon Web Services. \n"]

module SetRcsMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_rcs_message_spend_limit_override_request ->
    ( set_rcs_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_rcs_message_spend_limit_override_request ->
    ( set_rcs_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an account level monthly spend limit override for sending RCS messages. The requested \
   spend limit must be less than or equal to the [MaxLimit], which is set by Amazon Web Services.\n"]

module SetTextMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_text_message_spend_limit_override_request ->
    ( set_text_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_text_message_spend_limit_override_request ->
    ( set_text_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an account level monthly spend limit override for sending text messages. The requested \
   spend limit must be less than or equal to the [MaxLimit], which is set by Amazon Web Services. \n"]

module SetVoiceMessageSpendLimitOverride : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_voice_message_spend_limit_override_request ->
    ( set_voice_message_spend_limit_override_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_voice_message_spend_limit_override_request ->
    ( set_voice_message_spend_limit_override_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an account level monthly spend limit override for sending voice messages. The requested \
   spend limit must be less than or equal to the [MaxLimit], which is set by Amazon Web Services. \n"]

module SubmitRegistrationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_registration_version_request ->
    ( submit_registration_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_registration_version_request ->
    ( submit_registration_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Submit the specified registration for review and approval.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites only the specified tags for the specified resource. When you specify an \
   existing tag key, the value is overwritten with the new value. Each tag consists of a key and \
   an optional value. Tag keys must be unique per resource. For more information about tags, see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-tags.html}Tags } in the \
   {i End User Messaging SMS User Guide}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association of the specified tags from a resource. For more information on tags see \
   {{:https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-tags.html}Tags } in the \
   {i End User Messaging SMS User Guide}.\n"]

module UpdateEventDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_event_destination_request ->
    ( update_event_destination_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_event_destination_request ->
    ( update_event_destination_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing event destination in a configuration set. You can update the IAM role ARN \
   for CloudWatch Logs and Firehose. You can also enable or disable the event destination.\n\n\
  \ You may want to update an event destination to change its matching event types or updating the \
   destination resource ARN. You can't change an event destination's type between CloudWatch Logs, \
   Firehose, and Amazon SNS.\n\
  \ "]

module UpdateNotifyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_notify_configuration_request ->
    ( update_notify_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_notify_configuration_request ->
    ( update_notify_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing notify configuration. You can update the default template, pool \
   association, enabled channels, enabled countries, and deletion protection settings.\n"]

module UpdatePhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_phone_number_request ->
    ( update_phone_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_phone_number_request ->
    ( update_phone_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing origination phone number. You can update the opt-out \
   list, enable or disable two-way messaging, change the TwoWayChannelArn, enable or disable \
   self-managed opt-outs, and enable or disable deletion protection.\n\n\
  \ If the origination phone number is associated with a pool, an error is returned.\n\
  \ "]

module UpdatePool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pool_request ->
    ( update_pool_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pool_request ->
    ( update_pool_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing pool. You can update the opt-out list, enable or \
   disable two-way messaging, change the [TwoWayChannelArn], enable or disable self-managed \
   opt-outs, enable or disable deletion protection, and enable or disable shared routes.\n"]

module UpdateProtectConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_protect_configuration_request ->
    ( update_protect_configuration_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_protect_configuration_request ->
    ( update_protect_configuration_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the setting for an existing protect configuration.\n"]

module UpdateProtectConfigurationCountryRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_protect_configuration_country_rule_set_request ->
    ( update_protect_configuration_country_rule_set_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_protect_configuration_country_rule_set_request ->
    ( update_protect_configuration_country_rule_set_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a country rule set to [ALLOW], [BLOCK], [MONITOR], or [FILTER] messages to be sent to \
   the specified destination counties. You can update one or multiple countries at a time. The \
   updates are only applied to the specified NumberCapability type.\n"]

module UpdateRcsAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rcs_agent_request ->
    ( update_rcs_agent_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rcs_agent_request ->
    ( update_rcs_agent_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the configuration of an existing RCS agent. You can update the opt-out list, deletion \
   protection, two-way messaging settings, and self-managed opt-outs configuration.\n"]

module UpdateSenderId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_sender_id_request ->
    ( update_sender_id_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_sender_id_request ->
    ( update_sender_id_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the configuration of an existing sender ID.\n"]

(** {1:Serialization and Deserialization} *)
module VerifyDestinationNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_destination_number_request ->
    ( verify_destination_number_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_destination_number_request ->
    ( verify_destination_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use the verification code that was received by the verified destination phone number to opt-in \
   the verified destination phone number to receive more messages.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
