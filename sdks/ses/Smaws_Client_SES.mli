(** SES client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_add_header_action :
  header_name:header_name -> header_value:header_value -> unit -> add_header_action

val make_content : ?charset:charset -> data:message_data -> unit -> content
val make_body : ?text:content -> ?html:content -> unit -> body

val make_bounce_action :
  ?topic_arn:amazon_resource_name ->
  ?status_code:bounce_status_code ->
  smtp_reply_code:bounce_smtp_reply_code ->
  message:bounce_message ->
  sender:address ->
  unit ->
  bounce_action

val make_extension_field :
  name:extension_field_name -> value:extension_field_value -> unit -> extension_field

val make_recipient_dsn_fields :
  ?final_recipient:address ->
  ?remote_mta:remote_mta ->
  ?diagnostic_code:diagnostic_code ->
  ?last_attempt_date:last_attempt_date ->
  ?extension_fields:extension_field_list ->
  action:dsn_action ->
  status:dsn_status ->
  unit ->
  recipient_dsn_fields

val make_bounced_recipient_info :
  ?recipient_arn:amazon_resource_name ->
  ?bounce_type:bounce_type ->
  ?recipient_dsn_fields:recipient_dsn_fields ->
  recipient:address ->
  unit ->
  bounced_recipient_info

val make_message_tag : name:message_tag_name -> value:message_tag_value -> unit -> message_tag

val make_destination :
  ?to_addresses:address_list ->
  ?cc_addresses:address_list ->
  ?bcc_addresses:address_list ->
  unit ->
  destination

val make_bulk_email_destination :
  ?replacement_tags:message_tag_list ->
  ?replacement_template_data:template_data ->
  destination:destination ->
  unit ->
  bulk_email_destination

val make_bulk_email_destination_status :
  ?status:bulk_email_status ->
  ?error:error ->
  ?message_id:message_id ->
  unit ->
  bulk_email_destination_status

val make_clone_receipt_rule_set_response : unit -> unit

val make_clone_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name ->
  original_rule_set_name:receipt_rule_set_name ->
  unit ->
  clone_receipt_rule_set_request

val make_cloud_watch_dimension_configuration :
  dimension_name:dimension_name ->
  dimension_value_source:dimension_value_source ->
  default_dimension_value:default_dimension_value ->
  unit ->
  cloud_watch_dimension_configuration

val make_cloud_watch_destination :
  dimension_configurations:cloud_watch_dimension_configurations -> unit -> cloud_watch_destination

val make_configuration_set : name:configuration_set_name -> unit -> configuration_set

val make_connect_action :
  instance_ar_n:connect_instance_arn -> iam_role_ar_n:iam_role_ar_n -> unit -> connect_action

val make_create_configuration_set_response : unit -> unit

val make_create_configuration_set_request :
  configuration_set:configuration_set -> unit -> create_configuration_set_request

val make_create_configuration_set_event_destination_response : unit -> unit
val make_sns_destination : topic_ar_n:amazon_resource_name -> unit -> sns_destination

val make_kinesis_firehose_destination :
  iam_role_ar_n:amazon_resource_name ->
  delivery_stream_ar_n:amazon_resource_name ->
  unit ->
  kinesis_firehose_destination

val make_event_destination :
  ?enabled:enabled ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_destination:cloud_watch_destination ->
  ?sns_destination:sns_destination ->
  name:event_destination_name ->
  matching_event_types:event_types ->
  unit ->
  event_destination

val make_create_configuration_set_event_destination_request :
  configuration_set_name:configuration_set_name ->
  event_destination:event_destination ->
  unit ->
  create_configuration_set_event_destination_request

val make_create_configuration_set_tracking_options_response : unit -> unit

val make_tracking_options :
  ?custom_redirect_domain:custom_redirect_domain -> unit -> tracking_options

val make_create_configuration_set_tracking_options_request :
  configuration_set_name:configuration_set_name ->
  tracking_options:tracking_options ->
  unit ->
  create_configuration_set_tracking_options_request

val make_create_custom_verification_email_template_request :
  template_name:template_name ->
  from_email_address:from_address ->
  template_subject:subject ->
  template_content:template_content ->
  success_redirection_ur_l:success_redirection_ur_l ->
  failure_redirection_ur_l:failure_redirection_ur_l ->
  unit ->
  create_custom_verification_email_template_request

val make_create_receipt_filter_response : unit -> unit
val make_receipt_ip_filter : policy:receipt_filter_policy -> cidr:cidr -> unit -> receipt_ip_filter

val make_receipt_filter :
  name:receipt_filter_name -> ip_filter:receipt_ip_filter -> unit -> receipt_filter

val make_create_receipt_filter_request :
  filter:receipt_filter -> unit -> create_receipt_filter_request

val make_create_receipt_rule_response : unit -> unit

val make_sns_action :
  ?encoding:sns_action_encoding -> topic_arn:amazon_resource_name -> unit -> sns_action

val make_stop_action : ?topic_arn:amazon_resource_name -> scope:stop_scope -> unit -> stop_action

val make_lambda_action :
  ?topic_arn:amazon_resource_name ->
  ?invocation_type:invocation_type ->
  function_arn:amazon_resource_name ->
  unit ->
  lambda_action

val make_workmail_action :
  ?topic_arn:amazon_resource_name ->
  organization_arn:amazon_resource_name ->
  unit ->
  workmail_action

val make_s3_action :
  ?topic_arn:amazon_resource_name ->
  ?object_key_prefix:s3_key_prefix ->
  ?kms_key_arn:amazon_resource_name ->
  ?iam_role_arn:iam_role_ar_n ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_action

val make_receipt_action :
  ?s3_action:s3_action ->
  ?bounce_action:bounce_action ->
  ?workmail_action:workmail_action ->
  ?lambda_action:lambda_action ->
  ?stop_action:stop_action ->
  ?add_header_action:add_header_action ->
  ?sns_action:sns_action ->
  ?connect_action:connect_action ->
  unit ->
  receipt_action

val make_receipt_rule :
  ?enabled:enabled ->
  ?tls_policy:tls_policy ->
  ?recipients:recipients_list ->
  ?actions:receipt_actions_list ->
  ?scan_enabled:enabled ->
  name:receipt_rule_name ->
  unit ->
  receipt_rule

val make_create_receipt_rule_request :
  ?after:receipt_rule_name ->
  rule_set_name:receipt_rule_set_name ->
  rule:receipt_rule ->
  unit ->
  create_receipt_rule_request

val make_create_receipt_rule_set_response : unit -> unit

val make_create_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> create_receipt_rule_set_request

val make_create_template_response : unit -> unit

val make_template :
  ?subject_part:subject_part ->
  ?text_part:text_part ->
  ?html_part:html_part ->
  template_name:template_name ->
  unit ->
  template

val make_create_template_request : template:template -> unit -> create_template_request

val make_custom_verification_email_template :
  ?template_name:template_name ->
  ?from_email_address:from_address ->
  ?template_subject:subject ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  unit ->
  custom_verification_email_template

val make_delete_configuration_set_response : unit -> unit

val make_delete_configuration_set_request :
  configuration_set_name:configuration_set_name -> unit -> delete_configuration_set_request

val make_delete_configuration_set_event_destination_response : unit -> unit

val make_delete_configuration_set_event_destination_request :
  configuration_set_name:configuration_set_name ->
  event_destination_name:event_destination_name ->
  unit ->
  delete_configuration_set_event_destination_request

val make_delete_configuration_set_tracking_options_response : unit -> unit

val make_delete_configuration_set_tracking_options_request :
  configuration_set_name:configuration_set_name ->
  unit ->
  delete_configuration_set_tracking_options_request

val make_delete_custom_verification_email_template_request :
  template_name:template_name -> unit -> delete_custom_verification_email_template_request

val make_delete_identity_response : unit -> unit
val make_delete_identity_request : identity:identity -> unit -> delete_identity_request
val make_delete_identity_policy_response : unit -> unit

val make_delete_identity_policy_request :
  identity:identity -> policy_name:policy_name -> unit -> delete_identity_policy_request

val make_delete_receipt_filter_response : unit -> unit

val make_delete_receipt_filter_request :
  filter_name:receipt_filter_name -> unit -> delete_receipt_filter_request

val make_delete_receipt_rule_response : unit -> unit

val make_delete_receipt_rule_request :
  rule_set_name:receipt_rule_set_name ->
  rule_name:receipt_rule_name ->
  unit ->
  delete_receipt_rule_request

val make_delete_receipt_rule_set_response : unit -> unit

val make_delete_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> delete_receipt_rule_set_request

val make_delete_template_response : unit -> unit
val make_delete_template_request : template_name:template_name -> unit -> delete_template_request

val make_delete_verified_email_address_request :
  email_address:address -> unit -> delete_verified_email_address_request

val make_delivery_options : ?tls_policy:tls_policy -> unit -> delivery_options

val make_receipt_rule_set_metadata :
  ?name:receipt_rule_set_name -> ?created_timestamp:timestamp -> unit -> receipt_rule_set_metadata

val make_describe_active_receipt_rule_set_response :
  ?metadata:receipt_rule_set_metadata ->
  ?rules:receipt_rules_list ->
  unit ->
  describe_active_receipt_rule_set_response

val make_describe_active_receipt_rule_set_request : unit -> unit

val make_reputation_options :
  ?sending_enabled:enabled ->
  ?reputation_metrics_enabled:enabled ->
  ?last_fresh_start:last_fresh_start ->
  unit ->
  reputation_options

val make_describe_configuration_set_response :
  ?configuration_set:configuration_set ->
  ?event_destinations:event_destinations ->
  ?tracking_options:tracking_options ->
  ?delivery_options:delivery_options ->
  ?reputation_options:reputation_options ->
  unit ->
  describe_configuration_set_response

val make_describe_configuration_set_request :
  ?configuration_set_attribute_names:configuration_set_attribute_list ->
  configuration_set_name:configuration_set_name ->
  unit ->
  describe_configuration_set_request

val make_describe_receipt_rule_response :
  ?rule:receipt_rule -> unit -> describe_receipt_rule_response

val make_describe_receipt_rule_request :
  rule_set_name:receipt_rule_set_name ->
  rule_name:receipt_rule_name ->
  unit ->
  describe_receipt_rule_request

val make_describe_receipt_rule_set_response :
  ?metadata:receipt_rule_set_metadata ->
  ?rules:receipt_rules_list ->
  unit ->
  describe_receipt_rule_set_response

val make_describe_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name -> unit -> describe_receipt_rule_set_request

val make_identity_dkim_attributes :
  ?dkim_tokens:verification_token_list ->
  dkim_enabled:enabled ->
  dkim_verification_status:verification_status ->
  unit ->
  identity_dkim_attributes

val make_get_account_sending_enabled_response :
  ?enabled:enabled -> unit -> get_account_sending_enabled_response

val make_get_custom_verification_email_template_response :
  ?template_name:template_name ->
  ?from_email_address:from_address ->
  ?template_subject:subject ->
  ?template_content:template_content ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  unit ->
  get_custom_verification_email_template_response

val make_get_custom_verification_email_template_request :
  template_name:template_name -> unit -> get_custom_verification_email_template_request

val make_get_identity_dkim_attributes_response :
  dkim_attributes:dkim_attributes -> unit -> get_identity_dkim_attributes_response

val make_get_identity_dkim_attributes_request :
  identities:identity_list -> unit -> get_identity_dkim_attributes_request

val make_identity_mail_from_domain_attributes :
  mail_from_domain:mail_from_domain_name ->
  mail_from_domain_status:custom_mail_from_status ->
  behavior_on_mx_failure:behavior_on_mx_failure ->
  unit ->
  identity_mail_from_domain_attributes

val make_get_identity_mail_from_domain_attributes_response :
  mail_from_domain_attributes:mail_from_domain_attributes ->
  unit ->
  get_identity_mail_from_domain_attributes_response

val make_get_identity_mail_from_domain_attributes_request :
  identities:identity_list -> unit -> get_identity_mail_from_domain_attributes_request

val make_identity_notification_attributes :
  ?headers_in_bounce_notifications_enabled:enabled ->
  ?headers_in_complaint_notifications_enabled:enabled ->
  ?headers_in_delivery_notifications_enabled:enabled ->
  bounce_topic:notification_topic ->
  complaint_topic:notification_topic ->
  delivery_topic:notification_topic ->
  forwarding_enabled:enabled ->
  unit ->
  identity_notification_attributes

val make_get_identity_notification_attributes_response :
  notification_attributes:notification_attributes ->
  unit ->
  get_identity_notification_attributes_response

val make_get_identity_notification_attributes_request :
  identities:identity_list -> unit -> get_identity_notification_attributes_request

val make_get_identity_policies_response :
  policies:policy_map -> unit -> get_identity_policies_response

val make_get_identity_policies_request :
  identity:identity -> policy_names:policy_name_list -> unit -> get_identity_policies_request

val make_identity_verification_attributes :
  ?verification_token:verification_token ->
  verification_status:verification_status ->
  unit ->
  identity_verification_attributes

val make_get_identity_verification_attributes_response :
  verification_attributes:verification_attributes ->
  unit ->
  get_identity_verification_attributes_response

val make_get_identity_verification_attributes_request :
  identities:identity_list -> unit -> get_identity_verification_attributes_request

val make_get_send_quota_response :
  ?max24_hour_send:max24_hour_send ->
  ?max_send_rate:max_send_rate ->
  ?sent_last24_hours:sent_last24_hours ->
  unit ->
  get_send_quota_response

val make_send_data_point :
  ?timestamp:timestamp ->
  ?delivery_attempts:counter ->
  ?bounces:counter ->
  ?complaints:counter ->
  ?rejects:counter ->
  unit ->
  send_data_point

val make_get_send_statistics_response :
  ?send_data_points:send_data_point_list -> unit -> get_send_statistics_response

val make_get_template_response : ?template:template -> unit -> get_template_response
val make_get_template_request : template_name:template_name -> unit -> get_template_request

val make_list_configuration_sets_response :
  ?configuration_sets:configuration_sets ->
  ?next_token:next_token ->
  unit ->
  list_configuration_sets_response

val make_list_configuration_sets_request :
  ?next_token:next_token -> ?max_items:max_items -> unit -> list_configuration_sets_request

val make_list_custom_verification_email_templates_response :
  ?custom_verification_email_templates:custom_verification_email_templates ->
  ?next_token:next_token ->
  unit ->
  list_custom_verification_email_templates_response

val make_list_custom_verification_email_templates_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_custom_verification_email_templates_request

val make_list_identities_response :
  ?next_token:next_token -> identities:identity_list -> unit -> list_identities_response

val make_list_identities_request :
  ?identity_type:identity_type ->
  ?next_token:next_token ->
  ?max_items:max_items ->
  unit ->
  list_identities_request

val make_list_identity_policies_response :
  policy_names:policy_name_list -> unit -> list_identity_policies_response

val make_list_identity_policies_request :
  identity:identity -> unit -> list_identity_policies_request

val make_list_receipt_filters_response :
  ?filters:receipt_filter_list -> unit -> list_receipt_filters_response

val make_list_receipt_filters_request : unit -> unit

val make_list_receipt_rule_sets_response :
  ?rule_sets:receipt_rule_sets_lists ->
  ?next_token:next_token ->
  unit ->
  list_receipt_rule_sets_response

val make_list_receipt_rule_sets_request :
  ?next_token:next_token -> unit -> list_receipt_rule_sets_request

val make_template_metadata :
  ?name:template_name -> ?created_timestamp:timestamp -> unit -> template_metadata

val make_list_templates_response :
  ?templates_metadata:template_metadata_list ->
  ?next_token:next_token ->
  unit ->
  list_templates_response

val make_list_templates_request :
  ?next_token:next_token -> ?max_items:max_items -> unit -> list_templates_request

val make_list_verified_email_addresses_response :
  ?verified_email_addresses:address_list -> unit -> list_verified_email_addresses_response

val make_message : subject:content -> body:body -> unit -> message

val make_message_dsn :
  ?arrival_date:arrival_date ->
  ?extension_fields:extension_field_list ->
  reporting_mta:reporting_mta ->
  unit ->
  message_dsn

val make_put_configuration_set_delivery_options_response : unit -> unit

val make_put_configuration_set_delivery_options_request :
  ?delivery_options:delivery_options ->
  configuration_set_name:configuration_set_name ->
  unit ->
  put_configuration_set_delivery_options_request

val make_put_identity_policy_response : unit -> unit

val make_put_identity_policy_request :
  identity:identity ->
  policy_name:policy_name ->
  policy:policy ->
  unit ->
  put_identity_policy_request

val make_raw_message : data:raw_message_data -> unit -> raw_message
val make_reorder_receipt_rule_set_response : unit -> unit

val make_reorder_receipt_rule_set_request :
  rule_set_name:receipt_rule_set_name ->
  rule_names:receipt_rule_names_list ->
  unit ->
  reorder_receipt_rule_set_request

val make_send_bounce_response : ?message_id:message_id -> unit -> send_bounce_response

val make_send_bounce_request :
  ?explanation:explanation ->
  ?message_dsn:message_dsn ->
  ?bounce_sender_arn:amazon_resource_name ->
  original_message_id:message_id ->
  bounce_sender:address ->
  bounced_recipient_info_list:bounced_recipient_info_list ->
  unit ->
  send_bounce_request

val make_send_bulk_templated_email_response :
  status:bulk_email_destination_status_list -> unit -> send_bulk_templated_email_response

val make_send_bulk_templated_email_request :
  ?source_arn:amazon_resource_name ->
  ?reply_to_addresses:address_list ->
  ?return_path:address ->
  ?return_path_arn:amazon_resource_name ->
  ?configuration_set_name:configuration_set_name ->
  ?default_tags:message_tag_list ->
  ?template_arn:amazon_resource_name ->
  source:address ->
  template:template_name ->
  default_template_data:template_data ->
  destinations:bulk_email_destination_list ->
  unit ->
  send_bulk_templated_email_request

val make_send_custom_verification_email_response :
  ?message_id:message_id -> unit -> send_custom_verification_email_response

val make_send_custom_verification_email_request :
  ?configuration_set_name:configuration_set_name ->
  email_address:address ->
  template_name:template_name ->
  unit ->
  send_custom_verification_email_request

val make_send_email_response : message_id:message_id -> unit -> send_email_response

val make_send_email_request :
  ?reply_to_addresses:address_list ->
  ?return_path:address ->
  ?source_arn:amazon_resource_name ->
  ?return_path_arn:amazon_resource_name ->
  ?tags:message_tag_list ->
  ?configuration_set_name:configuration_set_name ->
  source:address ->
  destination:destination ->
  message:message ->
  unit ->
  send_email_request

val make_send_raw_email_response : message_id:message_id -> unit -> send_raw_email_response

val make_send_raw_email_request :
  ?source:address ->
  ?destinations:address_list ->
  ?from_arn:amazon_resource_name ->
  ?source_arn:amazon_resource_name ->
  ?return_path_arn:amazon_resource_name ->
  ?tags:message_tag_list ->
  ?configuration_set_name:configuration_set_name ->
  raw_message:raw_message ->
  unit ->
  send_raw_email_request

val make_send_templated_email_response :
  message_id:message_id -> unit -> send_templated_email_response

val make_send_templated_email_request :
  ?reply_to_addresses:address_list ->
  ?return_path:address ->
  ?source_arn:amazon_resource_name ->
  ?return_path_arn:amazon_resource_name ->
  ?tags:message_tag_list ->
  ?configuration_set_name:configuration_set_name ->
  ?template_arn:amazon_resource_name ->
  source:address ->
  destination:destination ->
  template:template_name ->
  template_data:template_data ->
  unit ->
  send_templated_email_request

val make_set_active_receipt_rule_set_response : unit -> unit

val make_set_active_receipt_rule_set_request :
  ?rule_set_name:receipt_rule_set_name -> unit -> set_active_receipt_rule_set_request

val make_set_identity_dkim_enabled_response : unit -> unit

val make_set_identity_dkim_enabled_request :
  identity:identity -> dkim_enabled:enabled -> unit -> set_identity_dkim_enabled_request

val make_set_identity_feedback_forwarding_enabled_response : unit -> unit

val make_set_identity_feedback_forwarding_enabled_request :
  identity:identity ->
  forwarding_enabled:enabled ->
  unit ->
  set_identity_feedback_forwarding_enabled_request

val make_set_identity_headers_in_notifications_enabled_response : unit -> unit

val make_set_identity_headers_in_notifications_enabled_request :
  identity:identity ->
  notification_type:notification_type ->
  enabled:enabled ->
  unit ->
  set_identity_headers_in_notifications_enabled_request

val make_set_identity_mail_from_domain_response : unit -> unit

val make_set_identity_mail_from_domain_request :
  ?mail_from_domain:mail_from_domain_name ->
  ?behavior_on_mx_failure:behavior_on_mx_failure ->
  identity:identity ->
  unit ->
  set_identity_mail_from_domain_request

val make_set_identity_notification_topic_response : unit -> unit

val make_set_identity_notification_topic_request :
  ?sns_topic:notification_topic ->
  identity:identity ->
  notification_type:notification_type ->
  unit ->
  set_identity_notification_topic_request

val make_set_receipt_rule_position_response : unit -> unit

val make_set_receipt_rule_position_request :
  ?after:receipt_rule_name ->
  rule_set_name:receipt_rule_set_name ->
  rule_name:receipt_rule_name ->
  unit ->
  set_receipt_rule_position_request

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
val make_update_template_response : unit -> unit
val make_update_template_request : template:template -> unit -> update_template_request
val make_update_receipt_rule_response : unit -> unit

val make_update_receipt_rule_request :
  rule_set_name:receipt_rule_set_name -> rule:receipt_rule -> unit -> update_receipt_rule_request

val make_update_custom_verification_email_template_request :
  ?from_email_address:from_address ->
  ?template_subject:subject ->
  ?template_content:template_content ->
  ?success_redirection_ur_l:success_redirection_ur_l ->
  ?failure_redirection_ur_l:failure_redirection_ur_l ->
  template_name:template_name ->
  unit ->
  update_custom_verification_email_template_request

val make_update_configuration_set_tracking_options_response : unit -> unit

val make_update_configuration_set_tracking_options_request :
  configuration_set_name:configuration_set_name ->
  tracking_options:tracking_options ->
  unit ->
  update_configuration_set_tracking_options_request

val make_update_configuration_set_sending_enabled_request :
  configuration_set_name:configuration_set_name ->
  enabled:enabled ->
  unit ->
  update_configuration_set_sending_enabled_request

val make_update_configuration_set_reputation_metrics_enabled_request :
  configuration_set_name:configuration_set_name ->
  enabled:enabled ->
  unit ->
  update_configuration_set_reputation_metrics_enabled_request

val make_update_configuration_set_event_destination_response : unit -> unit

val make_update_configuration_set_event_destination_request :
  configuration_set_name:configuration_set_name ->
  event_destination:event_destination ->
  unit ->
  update_configuration_set_event_destination_request

val make_update_account_sending_enabled_request :
  ?enabled:enabled -> unit -> update_account_sending_enabled_request

val make_test_render_template_response :
  ?rendered_template:rendered_template -> unit -> test_render_template_response

val make_test_render_template_request :
  template_name:template_name -> template_data:template_data -> unit -> test_render_template_request
(** {1:operations Operations} *)

module TestRenderTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidRenderingParameterException of invalid_rendering_parameter_exception
    | `MissingRenderingAttributeException of missing_rendering_attribute_exception
    | `TemplateDoesNotExistException of template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_render_template_request ->
    ( test_render_template_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRenderingParameterException of invalid_rendering_parameter_exception
      | `MissingRenderingAttributeException of missing_rendering_attribute_exception
      | `TemplateDoesNotExistException of template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_render_template_request ->
    ( test_render_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRenderingParameterException of invalid_rendering_parameter_exception
      | `MissingRenderingAttributeException of missing_rendering_attribute_exception
      | `TemplateDoesNotExistException of template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a preview of the MIME content of an email when provided with a template and a set of \
   replacement data.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module UpdateAccountSendingEnabled : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_account_sending_enabled_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_account_sending_enabled_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables email sending across your entire Amazon SES account in the current Amazon \
   Web Services Region. You can use this operation in conjunction with Amazon CloudWatch alarms to \
   temporarily pause email sending across your Amazon SES account in a given Amazon Web Services \
   Region when reputation metrics (such as your bounce or complaint rates) reach certain \
   thresholds.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module UpdateConfigurationSetEventDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception
    | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
    | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
    | `InvalidSNSDestinationException of invalid_sns_destination_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_event_destination_request ->
    ( update_configuration_set_event_destination_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception
      | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
      | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
      | `InvalidSNSDestinationException of invalid_sns_destination_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_event_destination_request ->
    ( update_configuration_set_event_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception
      | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
      | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
      | `InvalidSNSDestinationException of invalid_sns_destination_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the event destination of a configuration set. Event destinations are associated with \
   configuration sets, which enable you to publish email sending events to Amazon CloudWatch, \
   Amazon Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information \
   about using configuration sets, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Monitoring Your \
   Amazon SES Sending Activity} in the {i Amazon SES Developer Guide.} \n\n\
  \  When you create or update an event destination, you must provide one, and only one, \
   destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon \
   Simple Notification Service (Amazon SNS).\n\
  \  \n\
  \    You can execute this operation no more than once per second.\n\
  \    "]

module UpdateConfigurationSetReputationMetricsEnabled : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_reputation_metrics_enabled_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_reputation_metrics_enabled_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables the publishing of reputation metrics for emails sent using a specific \
   configuration set in a given Amazon Web Services Region. Reputation metrics include bounce and \
   complaint rates. These metrics are published to Amazon CloudWatch. By using CloudWatch, you can \
   create alarms when bounce or complaint rates exceed certain thresholds.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module UpdateConfigurationSetSendingEnabled : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_sending_enabled_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_sending_enabled_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables email sending for messages sent using a specific configuration set in a \
   given Amazon Web Services Region. You can use this operation in conjunction with Amazon \
   CloudWatch alarms to temporarily pause email sending for a configuration set when the \
   reputation metrics for that configuration set (such as your bounce on complaint rate) exceed \
   certain thresholds.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module UpdateConfigurationSetTrackingOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `InvalidTrackingOptionsException of invalid_tracking_options_exception
    | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_tracking_options_request ->
    ( update_configuration_set_tracking_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidTrackingOptionsException of invalid_tracking_options_exception
      | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_set_tracking_options_request ->
    ( update_configuration_set_tracking_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidTrackingOptionsException of invalid_tracking_options_exception
      | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an association between a configuration set and a custom domain for open and click \
   event tracking. \n\n\
  \ By default, images and links used for tracking open and click events are hosted on domains \
   operated by Amazon SES. You can configure a subdomain of your own to handle these events. For \
   information about using custom domains, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

module UpdateCustomVerificationEmailTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomVerificationEmailInvalidContentException of
      custom_verification_email_invalid_content_exception
    | `CustomVerificationEmailTemplateDoesNotExistException of
      custom_verification_email_template_does_not_exist_exception
    | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_verification_email_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailInvalidContentException of
        custom_verification_email_invalid_content_exception
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_verification_email_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailInvalidContentException of
        custom_verification_email_invalid_content_exception
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing custom verification email template.\n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module UpdateReceiptRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidLambdaFunctionException of invalid_lambda_function_exception
    | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
    | `InvalidSnsTopicException of invalid_sns_topic_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RuleDoesNotExistException of rule_does_not_exist_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_receipt_rule_request ->
    ( update_receipt_rule_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidLambdaFunctionException of invalid_lambda_function_exception
      | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
      | `InvalidSnsTopicException of invalid_sns_topic_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_receipt_rule_request ->
    ( update_receipt_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidLambdaFunctionException of invalid_lambda_function_exception
      | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
      | `InvalidSnsTopicException of invalid_sns_topic_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a receipt rule.\n\n\
  \ For information about managing receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module UpdateTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTemplateException of invalid_template_exception
    | `TemplateDoesNotExistException of template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_template_request ->
    ( update_template_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTemplateException of invalid_template_exception
      | `TemplateDoesNotExistException of template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_template_request ->
    ( update_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTemplateException of invalid_template_exception
      | `TemplateDoesNotExistException of template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an email template. Email templates enable you to send personalized email to one or more \
   destinations in a single operation. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module VerifyDomainDkim : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_domain_dkim_request ->
    (verify_domain_dkim_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_domain_dkim_request ->
    ( verify_domain_dkim_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a set of DKIM tokens for a domain identity.\n\n\
  \  When you execute the [VerifyDomainDkim] operation, the domain that you specify is added to \
   the list of identities that are associated with your account. This is true even if you haven't \
   already associated the domain with your account by using the [VerifyDomainIdentity] operation. \
   However, you can't send email from the domain until you either successfully \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#verify-domain-procedure}verify \
   it} or you successfully \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}set up \
   DKIM for it}.\n\
  \  \n\
  \    You use the tokens that are generated by this operation to create CNAME records. When \
   Amazon SES detects that you've added these records to the DNS configuration for a domain, you \
   can start sending email from that domain. You can start sending email even if you haven't added \
   the TXT record provided by the VerifyDomainIdentity operation to the DNS configuration for your \
   domain. All email that you send from the domain is authenticated using DKIM.\n\
  \    \n\
  \     To create the CNAME records for DKIM authentication, use the following values:\n\
  \     \n\
  \      {ul\n\
  \            {-   {b Name}: {i token}._domainkey.{i example.com} \n\
  \                \n\
  \                 }\n\
  \            {-   {b Type}: CNAME\n\
  \                \n\
  \                 }\n\
  \            {-   {b Value}: {i token}.dkim.amazonses.com\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   In the preceding example, replace {i token} with one of the tokens that are generated when \
   you execute this operation. Replace {i example.com} with your domain. Repeat this process for \
   each token that's generated by this operation.\n\
  \   \n\
  \    You can execute this operation no more than once per second.\n\
  \    "]

module VerifyDomainIdentity : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_domain_identity_request ->
    (verify_domain_identity_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_domain_identity_request ->
    ( verify_domain_identity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a domain to the list of identities for your Amazon SES account in the current Amazon Web \
   Services Region and attempts to verify it. For more information about verifying domains, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html}Verifying Email \
   Addresses and Domains} in the {i Amazon SES Developer Guide.} \n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module VerifyEmailAddress : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_email_address_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_email_address_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deprecated. Use the [VerifyEmailIdentity] operation to verify a new email address.\n"]

module VerifyEmailIdentity : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_email_identity_request ->
    (verify_email_identity_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_email_identity_request ->
    ( verify_email_identity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an email address to the list of identities for your Amazon SES account in the current \
   Amazon Web Services Region and attempts to verify it. As a result of executing this operation, \
   a verification email is sent to the specified address.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module SetReceiptRulePosition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleDoesNotExistException of rule_does_not_exist_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_receipt_rule_position_request ->
    ( set_receipt_rule_position_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_receipt_rule_position_request ->
    ( set_receipt_rule_position_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the position of the specified receipt rule in the receipt rule set.\n\n\
  \ For information about managing receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module SetIdentityNotificationTopic : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_identity_notification_topic_request ->
    (set_identity_notification_topic_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_identity_notification_topic_request ->
    ( set_identity_notification_topic_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering \
   notifications. When you use this operation, you specify a verified identity, such as an email \
   address or domain. When you send an email that uses the chosen identity in the Source field, \
   Amazon SES sends notifications to the topic you specified. You can send bounce, complaint, or \
   delivery notifications (or any combination of the three) to the Amazon SNS topic that you \
   specify.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ \n\
  \  For more information about feedback notification, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html}Amazon \
   SES Developer Guide}.\n\
  \  "]

module SetIdentityMailFromDomain : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_identity_mail_from_domain_request ->
    (set_identity_mail_from_domain_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_identity_mail_from_domain_request ->
    ( set_identity_mail_from_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address \
   or a domain).\n\n\
  \  To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL \
   FROM domain's DNS settings. To ensure that your emails pass Sender Policy Framework (SPF) \
   checks, you must also add or update an SPF record. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/mail-from.html}Amazon SES Developer Guide}.\n\
  \  \n\
  \    You can execute this operation no more than once per second.\n\
  \    "]

module SetIdentityHeadersInNotificationsEnabled : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_identity_headers_in_notifications_enabled_request ->
    ( set_identity_headers_in_notifications_enabled_response,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_identity_headers_in_notifications_enabled_request ->
    ( set_identity_headers_in_notifications_enabled_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given an identity (an email address or a domain), sets whether Amazon SES includes the original \
   email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a \
   specified type.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ \n\
  \  For more information about using notifications with Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html}Amazon \
   SES Developer Guide}.\n\
  \  "]

module SetIdentityFeedbackForwardingEnabled : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_identity_feedback_forwarding_enabled_request ->
    ( set_identity_feedback_forwarding_enabled_response,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_identity_feedback_forwarding_enabled_request ->
    ( set_identity_feedback_forwarding_enabled_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given an identity (an email address or a domain), enables or disables whether Amazon SES \
   forwards bounce and complaint notifications as email. Feedback forwarding can only be disabled \
   when Amazon Simple Notification Service (Amazon SNS) topics are specified for both bounces and \
   complaints.\n\n\
  \  Feedback forwarding does not apply to delivery notifications. Delivery notifications are only \
   available through Amazon SNS.\n\
  \  \n\
  \    You can execute this operation no more than once per second.\n\
  \    \n\
  \     For more information about using notifications with Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html}Amazon \
   SES Developer Guide}.\n\
  \     "]

module SetIdentityDkimEnabled : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_identity_dkim_enabled_request ->
    (set_identity_dkim_enabled_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_identity_dkim_enabled_request ->
    ( set_identity_dkim_enabled_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables or disables Easy DKIM signing of email sent from an identity. If Easy DKIM signing is \
   enabled for a domain, then Amazon SES uses DKIM to sign all email that it sends from addresses \
   on that domain. If Easy DKIM signing is enabled for an email address, then Amazon SES uses DKIM \
   to sign all email it sends from that address.\n\n\
  \  For email addresses (for example, [user@example.com]), you can only enable DKIM signing if \
   the corresponding domain (in this case, [example.com]) has been set up to use Easy DKIM.\n\
  \  \n\
  \    You can enable DKIM signing for an identity at any time after you start the verification \
   process for the identity, even if the verification process isn't complete. \n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     \n\
  \      For more information about Easy DKIM signing, go to the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy.html}Amazon \
   SES Developer Guide}.\n\
  \      "]

module SetActiveReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_active_receipt_rule_set_request ->
    ( set_active_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_active_receipt_rule_set_request ->
    ( set_active_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the specified receipt rule set as the active receipt rule set.\n\n\
  \  To disable your email-receiving through Amazon SES completely, you can call this operation \
   with [RuleSetName] set to null.\n\
  \  \n\
  \    For information about managing receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module SendTemplatedEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountSendingPausedException of account_sending_paused_exception
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
    | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
    | `MessageRejected of message_rejected
    | `TemplateDoesNotExistException of template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_templated_email_request ->
    ( send_templated_email_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected
      | `TemplateDoesNotExistException of template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_templated_email_request ->
    ( send_templated_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected
      | `TemplateDoesNotExistException of template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Composes an email message using an email template and immediately queues it for sending.\n\n\
  \ To send email using this operation, your call must meet the following requirements:\n\
  \ \n\
  \  {ul\n\
  \        {-  The call must refer to an existing email template. You can create email templates \
   using the [CreateTemplate] operation.\n\
  \            \n\
  \             }\n\
  \        {-  The message must be sent from a verified email address or domain.\n\
  \            \n\
  \             }\n\
  \        {-  If your account is still in the Amazon SES sandbox, you may only send to verified \
   addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. \
   For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html}Verifying Email \
   Addresses and Domains} in the {i Amazon SES Developer Guide.} \n\
  \            \n\
  \             }\n\
  \        {-  The maximum message size is 10 MB.\n\
  \            \n\
  \             }\n\
  \        {-  Calls to the [SendTemplatedEmail] operation may only include one [Destination] \
   parameter. A destination is a set of recipients that receives the same version of the email. \
   The [Destination] parameter can include up to 50 recipients, across the To:, CC: and BCC: \
   fields.\n\
  \            \n\
  \             }\n\
  \        {-  The [Destination] parameter must include at least one recipient email address. The \
   recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email \
   address is invalid (that is, it is not in the format {i \
   UserName\\@\\[SubDomain.\\]Domain.TopLevelDomain}), the entire message is rejected, even if the \
   message contains other recipients that are valid.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    If your call to the [SendTemplatedEmail] operation includes all of the required parameters, \
   Amazon SES accepts it and returns a Message ID. However, if Amazon SES can't render the email \
   because the template contains errors, it doesn't send the email. Additionally, because it \
   already accepted the message, Amazon SES doesn't return a message stating that it was unable to \
   send the email.\n\
  \    \n\
  \     For these reasons, we highly recommend that you set up Amazon SES to send you \
   notifications when Rendering Failure events occur. For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Sending \
   Personalized Email Using the Amazon SES API} in the {i Amazon Simple Email Service Developer \
   Guide}.\n\
  \     \n\
  \      "]

module SendRawEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountSendingPausedException of account_sending_paused_exception
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
    | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
    | `MessageRejected of message_rejected ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_raw_email_request ->
    ( send_raw_email_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_raw_email_request ->
    ( send_raw_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Composes an email message and immediately queues it for sending.\n\n\
  \ This operation is more flexible than the [SendEmail] operation. When you use the \
   [SendRawEmail] operation, you can specify the headers of the message as well as its content. \
   This flexibility is useful, for example, when you need to send a multipart MIME email (such a \
   message that contains both a text and an HTML version). You can also use this operation to send \
   messages that include attachments.\n\
  \ \n\
  \  The [SendRawEmail] operation has the following requirements:\n\
  \  \n\
  \   {ul\n\
  \         {-  You can only send email from \
   {{:https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html}verified email \
   addresses or domains}. If you try to send email from an address that isn't verified, the \
   operation results in an \"Email address not verified\" error.\n\
  \             \n\
  \              }\n\
  \         {-  If your account is still in the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/request-production-access.html}Amazon SES \
   sandbox}, you can only send email to other verified addresses in your account, or to addresses \
   that are associated with the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-an-email-from-console.html}Amazon SES mailbox \
   simulator}.\n\
  \             \n\
  \              }\n\
  \         {-  The maximum message size, including attachments, is 10 MB.\n\
  \             \n\
  \              }\n\
  \         {-  Each message has to include at least one recipient address. A recipient address \
   includes any address on the To:, CC:, or BCC: lines.\n\
  \             \n\
  \              }\n\
  \         {-  If you send a single message to more than one recipient address, and one of the \
   recipient addresses isn't in a valid format (that is, it's not in the format {i \
   UserName\\@\\[SubDomain.\\]Domain.TopLevelDomain}), Amazon SES rejects the entire message, even \
   if the other addresses are valid.\n\
  \             \n\
  \              }\n\
  \         {-  Each message can include up to 50 recipient addresses across the To:, CC:, or BCC: \
   lines. If you need to send a single message to more than 50 recipients, you have to split the \
   list of recipient addresses into groups of less than 50 recipients, and send separate messages \
   to each group.\n\
  \             \n\
  \              }\n\
  \         {-  Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME message \
   parts. However, if Amazon SES has to modify the contents of your message (for example, if you \
   use open and click tracking), 8-bit content isn't preserved. For this reason, we highly \
   recommend that you encode all content that isn't 7-bit ASCII. For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-raw.html#send-email-mime-encoding}MIME \
   Encoding} in the {i Amazon SES Developer Guide}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Additionally, keep the following considerations in mind when using the [SendRawEmail] \
   operation:\n\
  \   \n\
  \    {ul\n\
  \          {-  Although you can customize the message headers when using the [SendRawEmail] \
   operation, Amazon SES automatically applies its own [Message-ID] and [Date] headers; if you \
   passed these headers when creating the message, they are overwritten by the values that Amazon \
   SES provides.\n\
  \              \n\
  \               }\n\
  \          {-  If you are using sending authorization to send on behalf of another user, \
   [SendRawEmail] enables you to specify the cross-account identity for the email's Source, From, \
   and Return-Path parameters in one of two ways: you can pass optional parameters [SourceArn], \
   [FromArn], and/or [ReturnPathArn], or you can include the following X-headers in the header of \
   your raw email:\n\
  \              \n\
  \               {ul\n\
  \                     {-   [X-SES-SOURCE-ARN] \n\
  \                         \n\
  \                          }\n\
  \                     {-   [X-SES-FROM-ARN] \n\
  \                         \n\
  \                          }\n\
  \                     {-   [X-SES-RETURN-PATH-ARN] \n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \             Don't include these X-headers in the DKIM signature. Amazon SES removes these \
   before it sends the email.\n\
  \             \n\
  \               If you only specify the [SourceIdentityArn] parameter, Amazon SES sets the From \
   and Return-Path addresses to the same identity that you specified.\n\
  \               \n\
  \                For more information about sending authorization, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Using Sending \
   Authorization with Amazon SES} in the {i Amazon SES Developer Guide.} \n\
  \                \n\
  \                 }\n\
  \          {-  For every message that you send, the total number of recipients (including each \
   recipient in the To:, CC: and BCC: fields) is counted against the maximum number of emails you \
   can send in a 24-hour period (your {i sending quota}). For more information about sending \
   quotas in Amazon SES, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/manage-sending-quotas.html}Managing Your Amazon \
   SES Sending Limits} in the {i Amazon SES Developer Guide.} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module SendEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountSendingPausedException of account_sending_paused_exception
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
    | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
    | `MessageRejected of message_rejected ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_email_request ->
    ( send_email_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_email_request ->
    ( send_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Composes an email message and immediately queues it for sending. To send email using this \
   operation, your message must meet the following requirements:\n\n\
  \ {ul\n\
  \       {-  The message must be sent from a verified email address or domain. If you attempt to \
   send email using a non-verified address or domain, the operation results in an \"Email address \
   not verified\" error. \n\
  \           \n\
  \            }\n\
  \       {-  If your account is still in the Amazon SES sandbox, you may only send to verified \
   addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. \
   For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html}Verifying Email \
   Addresses and Domains} in the {i Amazon SES Developer Guide.} \n\
  \           \n\
  \            }\n\
  \       {-  The maximum message size is 10 MB.\n\
  \           \n\
  \            }\n\
  \       {-  The message must include at least one recipient email address. The recipient address \
   can be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid \
   (that is, it is not in the format {i UserName\\@\\[SubDomain.\\]Domain.TopLevelDomain}), the \
   entire message is rejected, even if the message contains other recipients that are valid.\n\
  \           \n\
  \            }\n\
  \       {-  The message may not include more than 50 recipients, across the To:, CC: and BCC: \
   fields. If you need to send an email message to a larger audience, you can divide your \
   recipient list into groups of 50 or fewer, and then call the [SendEmail] operation several \
   times to send the message to each group.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    For every message that you send, the total number of recipients (including each recipient \
   in the To:, CC: and BCC: fields) is counted against the maximum number of emails you can send \
   in a 24-hour period (your {i sending quota}). For more information about sending quotas in \
   Amazon SES, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/manage-sending-quotas.html}Managing Your Amazon \
   SES Sending Limits} in the {i Amazon SES Developer Guide.} \n\
  \    \n\
  \     "]

module SendCustomVerificationEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `CustomVerificationEmailTemplateDoesNotExistException of
      custom_verification_email_template_does_not_exist_exception
    | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
    | `MessageRejected of message_rejected
    | `ProductionAccessNotGrantedException of production_access_not_granted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_custom_verification_email_request ->
    ( send_custom_verification_email_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
      | `MessageRejected of message_rejected
      | `ProductionAccessNotGrantedException of production_access_not_granted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_custom_verification_email_request ->
    ( send_custom_verification_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
      | `MessageRejected of message_rejected
      | `ProductionAccessNotGrantedException of production_access_not_granted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an email address to the list of identities for your Amazon SES account in the current \
   Amazon Web Services Region and attempts to verify it. As a result of executing this operation, \
   a customized verification email is sent to the specified address.\n\n\
  \ To use this operation, you must first create a custom verification email template. For more \
   information about creating and using custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module SendBulkTemplatedEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccountSendingPausedException of account_sending_paused_exception
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
    | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
    | `MessageRejected of message_rejected
    | `TemplateDoesNotExistException of template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_bulk_templated_email_request ->
    ( send_bulk_templated_email_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected
      | `TemplateDoesNotExistException of template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_bulk_templated_email_request ->
    ( send_bulk_templated_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccountSendingPausedException of account_sending_paused_exception
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `ConfigurationSetSendingPausedException of configuration_set_sending_paused_exception
      | `MailFromDomainNotVerifiedException of mail_from_domain_not_verified_exception
      | `MessageRejected of message_rejected
      | `TemplateDoesNotExistException of template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Composes an email message to multiple destinations. The message body is created using an email \
   template.\n\n\
  \ To send email using this operation, your call must meet the following requirements:\n\
  \ \n\
  \  {ul\n\
  \        {-  The call must refer to an existing email template. You can create email templates \
   using [CreateTemplate].\n\
  \            \n\
  \             }\n\
  \        {-  The message must be sent from a verified email address or domain.\n\
  \            \n\
  \             }\n\
  \        {-  If your account is still in the Amazon SES sandbox, you may send only to verified \
   addresses or domains, or to email addresses associated with the Amazon SES Mailbox Simulator. \
   For more information, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/verify-addresses-and-domains.html}Verifying Email \
   Addresses and Domains} in the {i Amazon SES Developer Guide.} \n\
  \            \n\
  \             }\n\
  \        {-  The maximum message size is 10 MB.\n\
  \            \n\
  \             }\n\
  \        {-  Each [Destination] parameter must include at least one recipient email address. The \
   recipient address can be a To: address, a CC: address, or a BCC: address. If a recipient email \
   address is invalid (that is, it is not in the format {i \
   UserName\\@\\[SubDomain.\\]Domain.TopLevelDomain}), the entire message is rejected, even if the \
   message contains other recipients that are valid.\n\
  \            \n\
  \             }\n\
  \        {-  The message may not include more than 50 recipients, across the To:, CC: and BCC: \
   fields. If you need to send an email message to a larger audience, you can divide your \
   recipient list into groups of 50 or fewer, and then call the [SendBulkTemplatedEmail] operation \
   several times to send the message to each group.\n\
  \            \n\
  \             }\n\
  \        {-  The number of destinations you can contact in a single call can be limited by your \
   account's maximum sending rate.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module SendBounce : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `MessageRejected of message_rejected ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_bounce_request ->
    ( send_bounce_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `MessageRejected of message_rejected ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_bounce_request ->
    ( send_bounce_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `MessageRejected of message_rejected ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates and sends a bounce message to the sender of an email you received through Amazon SES. \
   You can only use this operation on an email up to 24 hours after you receive it.\n\n\
  \  You cannot use this operation to send generic bounces for mail that was not received by \
   Amazon SES.\n\
  \  \n\
  \    For information about receiving email through Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email.html}Amazon SES Developer Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module ReorderReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleDoesNotExistException of rule_does_not_exist_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reorder_receipt_rule_set_request ->
    ( reorder_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reorder_receipt_rule_set_request ->
    ( reorder_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reorders the receipt rules within a receipt rule set.\n\n\
  \  All of the rules in the rule set must be represented in this request. That is, it is error if \
   the reorder request doesn't explicitly position all of the rules.\n\
  \  \n\
  \    For information about managing receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module PutIdentityPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `InvalidPolicyException of invalid_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_identity_policy_request ->
    ( put_identity_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidPolicyException of invalid_policy_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_identity_policy_request ->
    ( put_identity_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `InvalidPolicyException of invalid_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates a sending authorization policy for the specified identity (an email address or \
   a domain).\n\n\
  \  This operation is for the identity owner only. If you have not verified the identity, it \
   returns an error.\n\
  \  \n\
  \    Sending authorization is a feature that enables an identity owner to authorize other \
   senders to use its identities. For information about using sending authorization, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module PutConfigurationSetDeliveryOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `InvalidDeliveryOptionsException of invalid_delivery_options_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_configuration_set_delivery_options_request ->
    ( put_configuration_set_delivery_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidDeliveryOptionsException of invalid_delivery_options_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_configuration_set_delivery_options_request ->
    ( put_configuration_set_delivery_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidDeliveryOptionsException of invalid_delivery_options_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates the delivery options for a configuration set.\n"]

module ListVerifiedEmailAddresses : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (list_verified_email_addresses_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( list_verified_email_addresses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deprecated. Use the [ListIdentities] operation to list the email addresses and domains \
   associated with your account.\n"]

module ListTemplates : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_templates_request ->
    (list_templates_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_templates_request ->
    ( list_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the email templates present in your Amazon SES account in the current Amazon Web Services \
   Region.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module ListReceiptRuleSets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_receipt_rule_sets_request ->
    (list_receipt_rule_sets_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_receipt_rule_sets_request ->
    ( list_receipt_rule_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the receipt rule sets that exist under your Amazon Web Services account in the current \
   Amazon Web Services Region. If there are additional receipt rule sets to be retrieved, you \
   receive a [NextToken] that you can provide to the next call to [ListReceiptRuleSets] to \
   retrieve the additional entries.\n\n\
  \ For information about managing receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module ListReceiptFilters : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_receipt_filters_request ->
    (list_receipt_filters_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_receipt_filters_request ->
    ( list_receipt_filters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the IP address filters associated with your Amazon Web Services account in the current \
   Amazon Web Services Region.\n\n\
  \ For information about managing IP address filters, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module ListIdentityPolicies : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_identity_policies_request ->
    (list_identity_policies_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_identity_policies_request ->
    ( list_identity_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of sending authorization policies that are attached to the given identity (an \
   email address or a domain). This operation returns only a list. To get the actual policy \
   content, use [GetIdentityPolicies].\n\n\
  \  This operation is for the identity owner only. If you have not verified the identity, it \
   returns an error.\n\
  \  \n\
  \    Sending authorization is a feature that enables an identity owner to authorize other \
   senders to use its identities. For information about using sending authorization, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module ListIdentities : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_identities_request ->
    (list_identities_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_identities_request ->
    ( list_identities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list containing all of the identities (email addresses and domains) for your Amazon \
   Web Services account in the current Amazon Web Services Region, regardless of verification \
   status.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ \n\
  \   It's recommended that for successive pagination calls of this API, you continue to the use \
   the same parameter/value pairs as used in the original call, e.g., if you used \
   [IdentityType=Domain] in the the original call and received a [NextToken] in the response, you \
   should continue providing the [IdentityType=Domain] parameter for further [NextToken] calls; \
   however, if you didn't provide the [IdentityType] parameter in the original call, then continue \
   to not provide it for successive pagination calls. Using this protocol will ensure consistent \
   results.\n\
  \   \n\
  \    "]

module ListCustomVerificationEmailTemplates : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_verification_email_templates_request ->
    ( list_custom_verification_email_templates_response,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_verification_email_templates_request ->
    ( list_custom_verification_email_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the existing custom verification email templates for your account in the current Amazon \
   Web Services Region.\n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module ListConfigurationSets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_configuration_sets_request ->
    (list_configuration_sets_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_configuration_sets_request ->
    ( list_configuration_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of the configuration sets associated with your Amazon SES account in the \
   current Amazon Web Services Region. For information about using configuration sets, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Monitoring Your \
   Amazon SES Sending Activity} in the {i Amazon SES Developer Guide.} \n\n\
  \ You can execute this operation no more than once per second. This operation returns up to \
   1,000 configuration sets each time it is run. If your Amazon SES account has more than 1,000 \
   configuration sets, this operation also returns [NextToken]. You can then execute the \
   [ListConfigurationSets] operation again, passing the [NextToken] parameter and the value of the \
   NextToken element to retrieve additional results.\n\
  \ "]

module GetTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TemplateDoesNotExistException of template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_template_request ->
    ( get_template_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TemplateDoesNotExistException of template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_template_request ->
    ( get_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TemplateDoesNotExistException of template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays the template object (which includes the Subject line, HTML part and text part) for the \
   template you specify.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module GetSendStatistics : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (get_send_statistics_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_send_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides sending statistics for the current Amazon Web Services Region. The result is a list of \
   data points, representing the last two weeks of sending activity. Each data point in the list \
   contains statistics for a 15-minute period of time.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module GetSendQuota : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (get_send_quota_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_send_quota_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the sending limits for the Amazon SES account. \n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module GetIdentityVerificationAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_verification_attributes_request ->
    (get_identity_verification_attributes_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_verification_attributes_request ->
    ( get_identity_verification_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a list of identities (email addresses and/or domains), returns the verification status \
   and (for domain identities) the verification token for each identity.\n\n\
  \ The verification status of an email address is \"Pending\" until the email address owner \
   clicks the link within the verification email that Amazon SES sent to that address. If the \
   email address owner clicks the link within 24 hours, the verification status of the email \
   address changes to \"Success\". If the link is not clicked within 24 hours, the verification \
   status changes to \"Failed.\" In that case, to verify the email address, you must restart the \
   verification process from the beginning.\n\
  \ \n\
  \  For domain identities, the domain's verification status is \"Pending\" as Amazon SES searches \
   for the required TXT record in the DNS settings of the domain. When Amazon SES detects the \
   record, the domain's verification status changes to \"Success\". If Amazon SES is unable to \
   detect the record within 72 hours, the domain's verification status changes to \"Failed.\" In \
   that case, to verify the domain, you must restart the verification process from the beginning.\n\
  \  \n\
  \   This operation is throttled at one request per second and can only get verification \
   attributes for up to 100 identities at a time.\n\
  \   "]

module GetIdentityPolicies : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_policies_request ->
    (get_identity_policies_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_policies_request ->
    ( get_identity_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the requested sending authorization policies for the given identity (an email address \
   or a domain). The policies are returned as a map of policy names to policy contents. You can \
   retrieve a maximum of 20 policies at a time.\n\n\
  \  This operation is for the identity owner only. If you have not verified the identity, it \
   returns an error.\n\
  \  \n\
  \    Sending authorization is a feature that enables an identity owner to authorize other \
   senders to use its identities. For information about using sending authorization, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module GetIdentityNotificationAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_notification_attributes_request ->
    (get_identity_notification_attributes_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_notification_attributes_request ->
    ( get_identity_notification_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a list of verified identities (email addresses and/or domains), returns a structure \
   describing identity notification attributes.\n\n\
  \ This operation is throttled at one request per second and can only get notification attributes \
   for up to 100 identities at a time.\n\
  \ \n\
  \  For more information about using notifications with Amazon SES, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity-using-notifications.html}Amazon \
   SES Developer Guide}.\n\
  \  "]

module GetIdentityMailFromDomainAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_mail_from_domain_attributes_request ->
    ( get_identity_mail_from_domain_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_mail_from_domain_attributes_request ->
    ( get_identity_mail_from_domain_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the custom MAIL FROM attributes for a list of identities (email addresses : domains).\n\n\
  \ This operation is throttled at one request per second and can only get custom MAIL FROM \
   attributes for up to 100 identities at a time.\n\
  \ "]

module GetIdentityDkimAttributes : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_dkim_attributes_request ->
    (get_identity_dkim_attributes_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_dkim_attributes_request ->
    ( get_identity_dkim_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the current status of Easy DKIM signing for an entity. For domain name identities, this \
   operation also returns the DKIM tokens that are required for Easy DKIM signing, and whether \
   Amazon SES has successfully verified that these tokens have been published.\n\n\
  \ This operation takes a list of identities as input and returns the following information for \
   each:\n\
  \ \n\
  \  {ul\n\
  \        {-  Whether Easy DKIM signing is enabled or disabled.\n\
  \            \n\
  \             }\n\
  \        {-  A set of DKIM tokens that represent the identity. If the identity is an email \
   address, the tokens represent the domain of that address.\n\
  \            \n\
  \             }\n\
  \        {-  Whether Amazon SES has successfully verified the DKIM tokens published in the \
   domain's DNS. This information is only returned for domain name identities, not for email \
   addresses.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is throttled at one request per second and can only get DKIM attributes for \
   up to 100 identities at a time.\n\
  \   \n\
  \    For more information about creating DNS records using DKIM tokens, go to the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-email-authentication-dkim-easy-managing.html}Amazon \
   SES Developer Guide}.\n\
  \    "]

module GetCustomVerificationEmailTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomVerificationEmailTemplateDoesNotExistException of
      custom_verification_email_template_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_custom_verification_email_template_request ->
    ( get_custom_verification_email_template_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_custom_verification_email_template_request ->
    ( get_custom_verification_email_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailTemplateDoesNotExistException of
        custom_verification_email_template_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the custom email verification template for the template name you specify.\n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module GetAccountSendingEnabled : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (get_account_sending_enabled_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( get_account_sending_enabled_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the email sending status of the Amazon SES account for the current Region.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module DescribeReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_receipt_rule_set_request ->
    ( describe_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_receipt_rule_set_request ->
    ( describe_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of the specified receipt rule set.\n\n\
  \ For information about managing receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DescribeReceiptRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleDoesNotExistException of rule_does_not_exist_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_receipt_rule_request ->
    ( describe_receipt_rule_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_receipt_rule_request ->
    ( describe_receipt_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of the specified receipt rule.\n\n\
  \ For information about setting up receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DescribeConfigurationSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_set_request ->
    ( describe_configuration_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_set_request ->
    ( describe_configuration_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of the specified configuration set. For information about using \
   configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module DescribeActiveReceiptRuleSet : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_active_receipt_rule_set_request ->
    (describe_active_receipt_rule_set_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_active_receipt_rule_set_request ->
    ( describe_active_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the metadata and receipt rules for the receipt rule set that is currently active.\n\n\
  \ For information about setting up receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DeleteVerifiedEmailAddress : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_verified_email_address_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_verified_email_address_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deprecated. Use the [DeleteIdentity] operation to delete email addresses and domains.\n"]

module DeleteTemplate : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_template_request ->
    (delete_template_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_template_request ->
    ( delete_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an email template.\n\n You can execute this operation no more than once per second.\n "]

module DeleteReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CannotDeleteException of cannot_delete_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_rule_set_request ->
    ( delete_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CannotDeleteException of cannot_delete_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_rule_set_request ->
    ( delete_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CannotDeleteException of cannot_delete_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified receipt rule set and all of the receipt rules it contains.\n\n\
  \  The currently active rule set cannot be deleted.\n\
  \  \n\
  \    For information about managing receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module DeleteReceiptRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_rule_request ->
    ( delete_receipt_rule_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_rule_request ->
    ( delete_receipt_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified receipt rule.\n\n\
  \ For information about managing receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DeleteReceiptFilter : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_filter_request ->
    (delete_receipt_filter_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_receipt_filter_request ->
    ( delete_receipt_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified IP address filter.\n\n\
  \ For information about managing IP address filters, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DeleteIdentityPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_policy_request ->
    (delete_identity_policy_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_policy_request ->
    ( delete_identity_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified sending authorization policy for the given identity (an email address or \
   a domain). This operation returns successfully even if a policy with the specified name does \
   not exist.\n\n\
  \  This operation is for the identity owner only. If you have not verified the identity, it \
   returns an error.\n\
  \  \n\
  \    Sending authorization is a feature that enables an identity owner to authorize other \
   senders to use its identities. For information about using sending authorization, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/sending-authorization.html}Amazon SES Developer \
   Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module DeleteIdentity : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_request ->
    (delete_identity_response, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_identity_request ->
    ( delete_identity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified identity (an email address or a domain) from the list of verified \
   identities.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module DeleteCustomVerificationEmailTemplate : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_verification_email_template_request ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_verification_email_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an existing custom verification email template. \n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module DeleteConfigurationSetTrackingOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_tracking_options_request ->
    ( delete_configuration_set_tracking_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_tracking_options_request ->
    ( delete_configuration_set_tracking_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `TrackingOptionsDoesNotExistException of tracking_options_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an association between a configuration set and a custom domain for open and click event \
   tracking.\n\n\
  \ By default, images and links used for tracking open and click events are hosted on domains \
   operated by Amazon SES. You can configure a subdomain of your own to handle these events. For \
   information about using custom domains, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \   Deleting this kind of association results in emails sent using the specified configuration \
   set to capture open and click events using the standard, Amazon SES-operated domains.\n\
  \   \n\
  \    "]

module DeleteConfigurationSetEventDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_event_destination_request ->
    ( delete_configuration_set_event_destination_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_event_destination_request ->
    ( delete_configuration_set_event_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationDoesNotExistException of event_destination_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a configuration set event destination. Configuration set event destinations are \
   associated with configuration sets, which enable you to publish email sending events. For \
   information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module DeleteConfigurationSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_request ->
    ( delete_configuration_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_set_request ->
    ( delete_configuration_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a configuration set. Configuration sets enable you to publish email sending events. For \
   information about using configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module CreateTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidTemplateException of invalid_template_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_template_request ->
    ( create_template_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidTemplateException of invalid_template_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_template_request ->
    ( create_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidTemplateException of invalid_template_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an email template. Email templates enable you to send personalized email to one or more \
   destinations in a single operation. For more information, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/send-personalized-email-api.html}Amazon SES \
   Developer Guide}.\n\n\
  \ You can execute this operation no more than once per second.\n\
  \ "]

module CreateReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_rule_set_request ->
    ( create_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_rule_set_request ->
    ( create_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty receipt rule set.\n\n\
  \ For information about setting up receipt rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module CreateReceiptRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidLambdaFunctionException of invalid_lambda_function_exception
    | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
    | `InvalidSnsTopicException of invalid_sns_topic_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RuleDoesNotExistException of rule_does_not_exist_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_rule_request ->
    ( create_receipt_rule_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidLambdaFunctionException of invalid_lambda_function_exception
      | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
      | `InvalidSnsTopicException of invalid_sns_topic_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_rule_request ->
    ( create_receipt_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidLambdaFunctionException of invalid_lambda_function_exception
      | `InvalidS3ConfigurationException of invalid_s3_configuration_exception
      | `InvalidSnsTopicException of invalid_sns_topic_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleDoesNotExistException of rule_does_not_exist_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a receipt rule.\n\n\
  \ For information about setting up receipt rules, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-receipt-rules-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module CreateReceiptFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_filter_request ->
    ( create_receipt_filter_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_receipt_filter_request ->
    ( create_receipt_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new IP address filter.\n\n\
  \ For information about setting up IP address filters, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-ip-filtering-console-walkthrough.html}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module CreateCustomVerificationEmailTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CustomVerificationEmailInvalidContentException of
      custom_verification_email_invalid_content_exception
    | `CustomVerificationEmailTemplateAlreadyExistsException of
      custom_verification_email_template_already_exists_exception
    | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_verification_email_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailInvalidContentException of
        custom_verification_email_invalid_content_exception
      | `CustomVerificationEmailTemplateAlreadyExistsException of
        custom_verification_email_template_already_exists_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_verification_email_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CustomVerificationEmailInvalidContentException of
        custom_verification_email_invalid_content_exception
      | `CustomVerificationEmailTemplateAlreadyExistsException of
        custom_verification_email_template_already_exists_exception
      | `FromEmailAddressNotVerifiedException of from_email_address_not_verified_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom verification email template.\n\n\
  \ For more information about custom verification email templates, see \
   {{:https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html#send-email-verify-address-custom}Using \
   Custom Verification Email Templates} in the {i Amazon SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module CreateConfigurationSetTrackingOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `InvalidTrackingOptionsException of invalid_tracking_options_exception
    | `TrackingOptionsAlreadyExistsException of tracking_options_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_tracking_options_request ->
    ( create_configuration_set_tracking_options_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidTrackingOptionsException of invalid_tracking_options_exception
      | `TrackingOptionsAlreadyExistsException of tracking_options_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_tracking_options_request ->
    ( create_configuration_set_tracking_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `InvalidTrackingOptionsException of invalid_tracking_options_exception
      | `TrackingOptionsAlreadyExistsException of tracking_options_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an association between a configuration set and a custom domain for open and click event \
   tracking. \n\n\
  \ By default, images and links used for tracking open and click events are hosted on domains \
   operated by Amazon SES. You can configure a subdomain of your own to handle these events. For \
   information about using custom domains, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/configure-custom-open-click-domains.html}Amazon \
   SES Developer Guide}.\n\
  \ "]

module CreateConfigurationSetEventDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
    | `EventDestinationAlreadyExistsException of event_destination_already_exists_exception
    | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
    | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
    | `InvalidSNSDestinationException of invalid_sns_destination_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_event_destination_request ->
    ( create_configuration_set_event_destination_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationAlreadyExistsException of event_destination_already_exists_exception
      | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
      | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
      | `InvalidSNSDestinationException of invalid_sns_destination_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_event_destination_request ->
    ( create_configuration_set_event_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetDoesNotExistException of configuration_set_does_not_exist_exception
      | `EventDestinationAlreadyExistsException of event_destination_already_exists_exception
      | `InvalidCloudWatchDestinationException of invalid_cloud_watch_destination_exception
      | `InvalidFirehoseDestinationException of invalid_firehose_destination_exception
      | `InvalidSNSDestinationException of invalid_sns_destination_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration set event destination.\n\n\
  \  When you create or update an event destination, you must provide one, and only one, \
   destination. The destination can be CloudWatch, Amazon Kinesis Firehose, or Amazon Simple \
   Notification Service (Amazon SNS).\n\
  \  \n\
  \    An event destination is the Amazon Web Services service to which Amazon SES publishes the \
   email sending events associated with a configuration set. For information about using \
   configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \    \n\
  \     You can execute this operation no more than once per second.\n\
  \     "]

module CreateConfigurationSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConfigurationSetAlreadyExistsException of configuration_set_already_exists_exception
    | `InvalidConfigurationSetException of invalid_configuration_set_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_request ->
    ( create_configuration_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetAlreadyExistsException of configuration_set_already_exists_exception
      | `InvalidConfigurationSetException of invalid_configuration_set_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_set_request ->
    ( create_configuration_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConfigurationSetAlreadyExistsException of configuration_set_already_exists_exception
      | `InvalidConfigurationSetException of invalid_configuration_set_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a configuration set.\n\n\
  \ Configuration sets enable you to publish email sending events. For information about using \
   configuration sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/monitor-sending-activity.html}Amazon SES Developer \
   Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module CloneReceiptRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    clone_receipt_rule_set_request ->
    ( clone_receipt_rule_set_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    clone_receipt_rule_set_request ->
    ( clone_receipt_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RuleSetDoesNotExistException of rule_set_does_not_exist_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are \
   copied to the new receipt rule set and are completely independent of the source rule set.\n\n\
  \ For information about setting up rule sets, see the \
   {{:https://docs.aws.amazon.com/ses/latest/dg/receiving-email-concepts.html#receiving-email-concepts-rules}Amazon \
   SES Developer Guide}.\n\
  \ \n\
  \  You can execute this operation no more than once per second.\n\
  \  "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
