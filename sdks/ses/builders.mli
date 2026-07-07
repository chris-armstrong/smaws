open Types

val make_workmail_action :
  ?topic_arn:amazon_resource_name ->
  organization_arn:amazon_resource_name ->
  unit ->
  workmail_action

val make_verify_email_identity_response : unit -> unit

val make_verify_email_identity_request :
  email_address:address -> unit -> verify_email_identity_request

val make_verify_email_address_request :
  email_address:address -> unit -> verify_email_address_request

val make_verify_domain_identity_response :
  verification_token:verification_token -> unit -> verify_domain_identity_response

val make_verify_domain_identity_request : domain:domain -> unit -> verify_domain_identity_request

val make_verify_domain_dkim_response :
  dkim_tokens:verification_token_list -> unit -> verify_domain_dkim_response

val make_verify_domain_dkim_request : domain:domain -> unit -> verify_domain_dkim_request

val make_identity_verification_attributes :
  ?verification_token:verification_token ->
  verification_status:verification_status ->
  unit ->
  identity_verification_attributes

val make_update_template_response : unit -> unit

val make_template :
  ?html_part:html_part ->
  ?text_part:text_part ->
  ?subject_part:subject_part ->
  template_name:template_name ->
  unit ->
  template

val make_update_template_request : template:template -> unit -> update_template_request
val make_update_receipt_rule_response : unit -> unit

val make_s3_action :
  ?iam_role_arn:iam_role_ar_n ->
  ?kms_key_arn:amazon_resource_name ->
  ?object_key_prefix:s3_key_prefix ->
  ?topic_arn:amazon_resource_name ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_action

val make_bounce_action :
  ?status_code:bounce_status_code ->
  ?topic_arn:amazon_resource_name ->
  sender:address ->
  message:bounce_message ->
  smtp_reply_code:bounce_smtp_reply_code ->
  unit ->
  bounce_action

val make_lambda_action :
  ?invocation_type:invocation_type ->
  ?topic_arn:amazon_resource_name ->
  function_arn:amazon_resource_name ->
  unit ->
  lambda_action

val make_stop_action : ?topic_arn:amazon_resource_name -> scope:stop_scope -> unit -> stop_action

val make_add_header_action :
  header_value:header_value -> header_name:header_name -> unit -> add_header_action

val make_sns_action :
  ?encoding:sns_action_encoding -> topic_arn:amazon_resource_name -> unit -> sns_action

val make_connect_action :
  iam_role_ar_n:iam_role_ar_n -> instance_ar_n:connect_instance_arn -> unit -> connect_action

val make_receipt_action :
  ?connect_action:connect_action ->
  ?sns_action:sns_action ->
  ?add_header_action:add_header_action ->
  ?stop_action:stop_action ->
  ?lambda_action:lambda_action ->
  ?workmail_action:workmail_action ->
  ?bounce_action:bounce_action ->
  ?s3_action:s3_action ->
  unit ->
  receipt_action

val make_receipt_rule :
  ?scan_enabled:enabled ->
  ?actions:receipt_actions_list ->
  ?recipients:recipients_list ->
  ?tls_policy:tls_policy ->
  ?enabled:enabled ->
  name:receipt_rule_name ->
  unit ->
  receipt_rule

val make_update_receipt_rule_request :
  rule:receipt_rule -> rule_set_name:receipt_rule_set_name -> unit -> update_receipt_rule_request

val make_update_custom_verification_email_template_request :
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?template_content:template_content ->
  ?template_subject:subject ->
  ?from_email_address:from_address ->
  template_name:template_name ->
  unit ->
  update_custom_verification_email_template_request

val make_update_configuration_set_tracking_options_response : unit -> unit

val make_tracking_options :
  ?custom_redirect_domain:custom_redirect_domain -> unit -> tracking_options

val make_update_configuration_set_tracking_options_request :
  tracking_options:tracking_options ->
  configuration_set_name:configuration_set_name ->
  unit ->
  update_configuration_set_tracking_options_request

val make_update_configuration_set_sending_enabled_request :
  enabled:enabled ->
  configuration_set_name:configuration_set_name ->
  unit ->
  update_configuration_set_sending_enabled_request

val make_update_configuration_set_reputation_metrics_enabled_request :
  enabled:enabled ->
  configuration_set_name:configuration_set_name ->
  unit ->
  update_configuration_set_reputation_metrics_enabled_request

val make_update_configuration_set_event_destination_response : unit -> unit

val make_kinesis_firehose_destination :
  delivery_stream_ar_n:amazon_resource_name ->
  iam_role_ar_n:amazon_resource_name ->
  unit ->
  kinesis_firehose_destination

val make_cloud_watch_dimension_configuration :
  default_dimension_value:default_dimension_value ->
  dimension_value_source:dimension_value_source ->
  dimension_name:dimension_name ->
  unit ->
  cloud_watch_dimension_configuration

val make_cloud_watch_destination :
  dimension_configurations:cloud_watch_dimension_configurations -> unit -> cloud_watch_destination

val make_sns_destination : topic_ar_n:amazon_resource_name -> unit -> sns_destination

val make_event_destination :
  ?sns_destination:sns_destination ->
  ?cloud_watch_destination:cloud_watch_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?enabled:enabled ->
  matching_event_types:event_types ->
  name:event_destination_name ->
  unit ->
  event_destination

val make_update_configuration_set_event_destination_request :
  event_destination:event_destination ->
  configuration_set_name:configuration_set_name ->
  unit ->
  update_configuration_set_event_destination_request

val make_update_account_sending_enabled_request :
  ?enabled:enabled -> unit -> update_account_sending_enabled_request

val make_test_render_template_response :
  ?rendered_template:rendered_template -> unit -> test_render_template_response

val make_test_render_template_request :
  template_data:template_data -> template_name:template_name -> unit -> test_render_template_request

val make_template_metadata :
  ?created_timestamp:timestamp -> ?name:template_name -> unit -> template_metadata

val make_set_receipt_rule_position_response : unit -> unit

val make_set_receipt_rule_position_request :
  ?after:receipt_rule_name ->
  rule_name:receipt_rule_name ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  set_receipt_rule_position_request

val make_set_identity_notification_topic_response : unit -> unit

val make_set_identity_notification_topic_request :
  ?sns_topic:notification_topic ->
  notification_type:notification_type ->
  identity:identity ->
  unit ->
  set_identity_notification_topic_request

val make_set_identity_mail_from_domain_response : unit -> unit

val make_set_identity_mail_from_domain_request :
  ?behavior_on_mx_failure:behavior_on_mx_failure ->
  ?mail_from_domain:mail_from_domain_name ->
  identity:identity ->
  unit ->
  set_identity_mail_from_domain_request

val make_set_identity_headers_in_notifications_enabled_response : unit -> unit

val make_set_identity_headers_in_notifications_enabled_request :
  enabled:enabled ->
  notification_type:notification_type ->
  identity:identity ->
  unit ->
  set_identity_headers_in_notifications_enabled_request

val make_set_identity_feedback_forwarding_enabled_response : unit -> unit

val make_set_identity_feedback_forwarding_enabled_request :
  forwarding_enabled:enabled ->
  identity:identity ->
  unit ->
  set_identity_feedback_forwarding_enabled_request

val make_set_identity_dkim_enabled_response : unit -> unit

val make_set_identity_dkim_enabled_request :
  dkim_enabled:enabled -> identity:identity -> unit -> set_identity_dkim_enabled_request

val make_set_active_receipt_rule_set_response : unit -> unit

val make_set_active_receipt_rule_set_request :
  ?rule_set_name:receipt_rule_set_name -> unit -> set_active_receipt_rule_set_request

val make_send_templated_email_response :
  message_id:message_id -> unit -> send_templated_email_response

val make_destination :
  ?bcc_addresses:address_list ->
  ?cc_addresses:address_list ->
  ?to_addresses:address_list ->
  unit ->
  destination

val make_message_tag : value:message_tag_value -> name:message_tag_name -> unit -> message_tag

val make_send_templated_email_request :
  ?template_arn:amazon_resource_name ->
  ?configuration_set_name:configuration_set_name ->
  ?tags:message_tag_list ->
  ?return_path_arn:amazon_resource_name ->
  ?source_arn:amazon_resource_name ->
  ?return_path:address ->
  ?reply_to_addresses:address_list ->
  template_data:template_data ->
  template:template_name ->
  destination:destination ->
  source:address ->
  unit ->
  send_templated_email_request

val make_send_raw_email_response : message_id:message_id -> unit -> send_raw_email_response
val make_raw_message : data:raw_message_data -> unit -> raw_message

val make_send_raw_email_request :
  ?configuration_set_name:configuration_set_name ->
  ?tags:message_tag_list ->
  ?return_path_arn:amazon_resource_name ->
  ?source_arn:amazon_resource_name ->
  ?from_arn:amazon_resource_name ->
  ?destinations:address_list ->
  ?source:address ->
  raw_message:raw_message ->
  unit ->
  send_raw_email_request

val make_send_email_response : message_id:message_id -> unit -> send_email_response
val make_content : ?charset:charset -> data:message_data -> unit -> content
val make_body : ?html:content -> ?text:content -> unit -> body
val make_message : body:body -> subject:content -> unit -> message

val make_send_email_request :
  ?configuration_set_name:configuration_set_name ->
  ?tags:message_tag_list ->
  ?return_path_arn:amazon_resource_name ->
  ?source_arn:amazon_resource_name ->
  ?return_path:address ->
  ?reply_to_addresses:address_list ->
  message:message ->
  destination:destination ->
  source:address ->
  unit ->
  send_email_request

val make_send_custom_verification_email_response :
  ?message_id:message_id -> unit -> send_custom_verification_email_response

val make_send_custom_verification_email_request :
  ?configuration_set_name:configuration_set_name ->
  template_name:template_name ->
  email_address:address ->
  unit ->
  send_custom_verification_email_request

val make_bulk_email_destination_status :
  ?message_id:message_id ->
  ?error:error ->
  ?status:bulk_email_status ->
  unit ->
  bulk_email_destination_status

val make_send_bulk_templated_email_response :
  status:bulk_email_destination_status_list -> unit -> send_bulk_templated_email_response

val make_bulk_email_destination :
  ?replacement_template_data:template_data ->
  ?replacement_tags:message_tag_list ->
  destination:destination ->
  unit ->
  bulk_email_destination

val make_send_bulk_templated_email_request :
  ?template_arn:amazon_resource_name ->
  ?default_tags:message_tag_list ->
  ?configuration_set_name:configuration_set_name ->
  ?return_path_arn:amazon_resource_name ->
  ?return_path:address ->
  ?reply_to_addresses:address_list ->
  ?source_arn:amazon_resource_name ->
  destinations:bulk_email_destination_list ->
  default_template_data:template_data ->
  template:template_name ->
  source:address ->
  unit ->
  send_bulk_templated_email_request

val make_send_bounce_response : ?message_id:message_id -> unit -> send_bounce_response

val make_extension_field :
  value:extension_field_value -> name:extension_field_name -> unit -> extension_field

val make_message_dsn :
  ?extension_fields:extension_field_list ->
  ?arrival_date:arrival_date ->
  reporting_mta:reporting_mta ->
  unit ->
  message_dsn

val make_recipient_dsn_fields :
  ?extension_fields:extension_field_list ->
  ?last_attempt_date:last_attempt_date ->
  ?diagnostic_code:diagnostic_code ->
  ?remote_mta:remote_mta ->
  ?final_recipient:address ->
  status:dsn_status ->
  action:dsn_action ->
  unit ->
  recipient_dsn_fields

val make_bounced_recipient_info :
  ?recipient_dsn_fields:recipient_dsn_fields ->
  ?bounce_type:bounce_type ->
  ?recipient_arn:amazon_resource_name ->
  recipient:address ->
  unit ->
  bounced_recipient_info

val make_send_bounce_request :
  ?bounce_sender_arn:amazon_resource_name ->
  ?message_dsn:message_dsn ->
  ?explanation:explanation ->
  bounced_recipient_info_list:bounced_recipient_info_list ->
  bounce_sender:address ->
  original_message_id:message_id ->
  unit ->
  send_bounce_request

val make_reorder_receipt_rule_set_response : unit -> unit

val make_reorder_receipt_rule_set_request :
  rule_names:receipt_rule_names_list ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  reorder_receipt_rule_set_request

val make_put_identity_policy_response : unit -> unit

val make_put_identity_policy_request :
  policy:policy ->
  policy_name:policy_name ->
  identity:identity ->
  unit ->
  put_identity_policy_request

val make_put_configuration_set_delivery_options_response : unit -> unit
val make_delivery_options : ?tls_policy:tls_policy -> unit -> delivery_options

val make_put_configuration_set_delivery_options_request :
  ?delivery_options:delivery_options ->
  configuration_set_name:configuration_set_name ->
  unit ->
  put_configuration_set_delivery_options_request

val make_list_verified_email_addresses_response :
  ?verified_email_addresses:address_list -> unit -> list_verified_email_addresses_response

val make_list_templates_response :
  ?next_token:next_token ->
  ?templates_metadata:template_metadata_list ->
  unit ->
  list_templates_response

val make_list_templates_request :
  ?max_items:max_items -> ?next_token:next_token -> unit -> list_templates_request

val make_receipt_rule_set_metadata :
  ?created_timestamp:timestamp -> ?name:receipt_rule_set_name -> unit -> receipt_rule_set_metadata

val make_list_receipt_rule_sets_response :
  ?next_token:next_token ->
  ?rule_sets:receipt_rule_sets_lists ->
  unit ->
  list_receipt_rule_sets_response

val make_list_receipt_rule_sets_request :
  ?next_token:next_token -> unit -> list_receipt_rule_sets_request

val make_receipt_ip_filter : cidr:cidr -> policy:receipt_filter_policy -> unit -> receipt_ip_filter

val make_receipt_filter :
  ip_filter:receipt_ip_filter -> name:receipt_filter_name -> unit -> receipt_filter

val make_list_receipt_filters_response :
  ?filters:receipt_filter_list -> unit -> list_receipt_filters_response

val make_list_receipt_filters_request : unit -> unit

val make_list_identity_policies_response :
  policy_names:policy_name_list -> unit -> list_identity_policies_response

val make_list_identity_policies_request :
  identity:identity -> unit -> list_identity_policies_request

val make_list_identities_response :
  ?next_token:next_token -> identities:identity_list -> unit -> list_identities_response

val make_list_identities_request :
  ?max_items:max_items ->
  ?next_token:next_token ->
  ?identity_type:identity_type ->
  unit ->
  list_identities_request

val make_custom_verification_email_template :
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?template_subject:subject ->
  ?from_email_address:from_address ->
  ?template_name:template_name ->
  unit ->
  custom_verification_email_template

val make_list_custom_verification_email_templates_response :
  ?next_token:next_token ->
  ?custom_verification_email_templates:custom_verification_email_templates ->
  unit ->
  list_custom_verification_email_templates_response

val make_list_custom_verification_email_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_custom_verification_email_templates_request

val make_configuration_set : name:configuration_set_name -> unit -> configuration_set

val make_list_configuration_sets_response :
  ?next_token:next_token ->
  ?configuration_sets:configuration_sets ->
  unit ->
  list_configuration_sets_response

val make_list_configuration_sets_request :
  ?max_items:max_items -> ?next_token:next_token -> unit -> list_configuration_sets_request

val make_get_template_response : ?template:template -> unit -> get_template_response
val make_get_template_request : template_name:template_name -> unit -> get_template_request

val make_send_data_point :
  ?rejects:counter ->
  ?complaints:counter ->
  ?bounces:counter ->
  ?delivery_attempts:counter ->
  ?timestamp:timestamp ->
  unit ->
  send_data_point

val make_get_send_statistics_response :
  ?send_data_points:send_data_point_list -> unit -> get_send_statistics_response

val make_get_send_quota_response :
  ?sent_last24_hours:sent_last24_hours ->
  ?max_send_rate:max_send_rate ->
  ?max24_hour_send:max24_hour_send ->
  unit ->
  get_send_quota_response

val make_get_identity_verification_attributes_response :
  verification_attributes:verification_attributes ->
  unit ->
  get_identity_verification_attributes_response

val make_get_identity_verification_attributes_request :
  identities:identity_list -> unit -> get_identity_verification_attributes_request

val make_get_identity_policies_response :
  policies:policy_map -> unit -> get_identity_policies_response

val make_get_identity_policies_request :
  policy_names:policy_name_list -> identity:identity -> unit -> get_identity_policies_request

val make_identity_notification_attributes :
  ?headers_in_delivery_notifications_enabled:enabled ->
  ?headers_in_complaint_notifications_enabled:enabled ->
  ?headers_in_bounce_notifications_enabled:enabled ->
  forwarding_enabled:enabled ->
  delivery_topic:notification_topic ->
  complaint_topic:notification_topic ->
  bounce_topic:notification_topic ->
  unit ->
  identity_notification_attributes

val make_get_identity_notification_attributes_response :
  notification_attributes:notification_attributes ->
  unit ->
  get_identity_notification_attributes_response

val make_get_identity_notification_attributes_request :
  identities:identity_list -> unit -> get_identity_notification_attributes_request

val make_identity_mail_from_domain_attributes :
  behavior_on_mx_failure:behavior_on_mx_failure ->
  mail_from_domain_status:custom_mail_from_status ->
  mail_from_domain:mail_from_domain_name ->
  unit ->
  identity_mail_from_domain_attributes

val make_get_identity_mail_from_domain_attributes_response :
  mail_from_domain_attributes:mail_from_domain_attributes ->
  unit ->
  get_identity_mail_from_domain_attributes_response

val make_get_identity_mail_from_domain_attributes_request :
  identities:identity_list -> unit -> get_identity_mail_from_domain_attributes_request

val make_identity_dkim_attributes :
  ?dkim_tokens:verification_token_list ->
  dkim_verification_status:verification_status ->
  dkim_enabled:enabled ->
  unit ->
  identity_dkim_attributes

val make_get_identity_dkim_attributes_response :
  dkim_attributes:dkim_attributes -> unit -> get_identity_dkim_attributes_response

val make_get_identity_dkim_attributes_request :
  identities:identity_list -> unit -> get_identity_dkim_attributes_request

val make_get_custom_verification_email_template_response :
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?template_content:template_content ->
  ?template_subject:subject ->
  ?from_email_address:from_address ->
  ?template_name:template_name ->
  unit ->
  get_custom_verification_email_template_response

val make_get_custom_verification_email_template_request :
  template_name:template_name -> unit -> get_custom_verification_email_template_request

val make_get_account_sending_enabled_response :
  ?enabled:enabled -> unit -> get_account_sending_enabled_response

val make_describe_receipt_rule_set_response :
  ?rules:receipt_rules_list ->
  ?metadata:receipt_rule_set_metadata ->
  unit ->
  describe_receipt_rule_set_response

val make_describe_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> describe_receipt_rule_set_request

val make_describe_receipt_rule_response :
  ?rule:receipt_rule -> unit -> describe_receipt_rule_response

val make_describe_receipt_rule_request :
  rule_name:receipt_rule_name ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  describe_receipt_rule_request

val make_reputation_options :
  ?last_fresh_start:last_fresh_start ->
  ?reputation_metrics_enabled:enabled ->
  ?sending_enabled:enabled ->
  unit ->
  reputation_options

val make_describe_configuration_set_response :
  ?reputation_options:reputation_options ->
  ?delivery_options:delivery_options ->
  ?tracking_options:tracking_options ->
  ?event_destinations:event_destinations ->
  ?configuration_set:configuration_set ->
  unit ->
  describe_configuration_set_response

val make_describe_configuration_set_request :
  ?configuration_set_attribute_names:configuration_set_attribute_list ->
  configuration_set_name:configuration_set_name ->
  unit ->
  describe_configuration_set_request

val make_describe_active_receipt_rule_set_response :
  ?rules:receipt_rules_list ->
  ?metadata:receipt_rule_set_metadata ->
  unit ->
  describe_active_receipt_rule_set_response

val make_describe_active_receipt_rule_set_request : unit -> unit

val make_delete_verified_email_address_request :
  email_address:address -> unit -> delete_verified_email_address_request

val make_delete_template_response : unit -> unit
val make_delete_template_request : template_name:template_name -> unit -> delete_template_request
val make_delete_receipt_rule_set_response : unit -> unit

val make_delete_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> delete_receipt_rule_set_request

val make_delete_receipt_rule_response : unit -> unit

val make_delete_receipt_rule_request :
  rule_name:receipt_rule_name ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  delete_receipt_rule_request

val make_delete_receipt_filter_response : unit -> unit

val make_delete_receipt_filter_request :
  filter_name:receipt_filter_name -> unit -> delete_receipt_filter_request

val make_delete_identity_policy_response : unit -> unit

val make_delete_identity_policy_request :
  policy_name:policy_name -> identity:identity -> unit -> delete_identity_policy_request

val make_delete_identity_response : unit -> unit
val make_delete_identity_request : identity:identity -> unit -> delete_identity_request

val make_delete_custom_verification_email_template_request :
  template_name:template_name -> unit -> delete_custom_verification_email_template_request

val make_delete_configuration_set_tracking_options_response : unit -> unit

val make_delete_configuration_set_tracking_options_request :
  configuration_set_name:configuration_set_name ->
  unit ->
  delete_configuration_set_tracking_options_request

val make_delete_configuration_set_event_destination_response : unit -> unit

val make_delete_configuration_set_event_destination_request :
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name ->
  unit ->
  delete_configuration_set_event_destination_request

val make_delete_configuration_set_response : unit -> unit

val make_delete_configuration_set_request :
  configuration_set_name:configuration_set_name -> unit -> delete_configuration_set_request

val make_create_template_response : unit -> unit
val make_create_template_request : template:template -> unit -> create_template_request
val make_create_receipt_rule_set_response : unit -> unit

val make_create_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> create_receipt_rule_set_request

val make_create_receipt_rule_response : unit -> unit

val make_create_receipt_rule_request :
  ?after:receipt_rule_name ->
  rule:receipt_rule ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  create_receipt_rule_request

val make_create_receipt_filter_response : unit -> unit

val make_create_receipt_filter_request :
  filter:receipt_filter -> unit -> create_receipt_filter_request

val make_create_custom_verification_email_template_request :
  failure_redirection_ur_l:failure_redirection_ur_l ->
  success_redirection_ur_l:success_redirection_ur_l ->
  template_content:template_content ->
  template_subject:subject ->
  from_email_address:from_address ->
  template_name:template_name ->
  unit ->
  create_custom_verification_email_template_request

val make_create_configuration_set_tracking_options_response : unit -> unit

val make_create_configuration_set_tracking_options_request :
  tracking_options:tracking_options ->
  configuration_set_name:configuration_set_name ->
  unit ->
  create_configuration_set_tracking_options_request

val make_create_configuration_set_event_destination_response : unit -> unit

val make_create_configuration_set_event_destination_request :
  event_destination:event_destination ->
  configuration_set_name:configuration_set_name ->
  unit ->
  create_configuration_set_event_destination_request

val make_create_configuration_set_response : unit -> unit

val make_create_configuration_set_request :
  configuration_set:configuration_set -> unit -> create_configuration_set_request

val make_clone_receipt_rule_set_response : unit -> unit

val make_clone_receipt_rule_set_request :
  original_rule_set_name:receipt_rule_set_name ->
  rule_set_name:receipt_rule_set_name ->
  unit ->
  clone_receipt_rule_set_request
