open Types

let make_workmail_action ?topic_arn:(topic_arn_ : amazon_resource_name option)
    ~organization_arn:(organization_arn_ : amazon_resource_name) () =
  ({ organization_arn = organization_arn_; topic_arn = topic_arn_ } : workmail_action)

let make_verify_email_identity_response () = (() : unit)

let make_verify_email_identity_request ~email_address:(email_address_ : address) () =
  ({ email_address = email_address_ } : verify_email_identity_request)

let make_verify_email_address_request ~email_address:(email_address_ : address) () =
  ({ email_address = email_address_ } : verify_email_address_request)

let make_verify_domain_identity_response
    ~verification_token:(verification_token_ : verification_token) () =
  ({ verification_token = verification_token_ } : verify_domain_identity_response)

let make_verify_domain_identity_request ~domain:(domain_ : domain) () =
  ({ domain = domain_ } : verify_domain_identity_request)

let make_verify_domain_dkim_response ~dkim_tokens:(dkim_tokens_ : verification_token_list) () =
  ({ dkim_tokens = dkim_tokens_ } : verify_domain_dkim_response)

let make_verify_domain_dkim_request ~domain:(domain_ : domain) () =
  ({ domain = domain_ } : verify_domain_dkim_request)

let make_identity_verification_attributes
    ?verification_token:(verification_token_ : verification_token option)
    ~verification_status:(verification_status_ : verification_status) () =
  ({ verification_token = verification_token_; verification_status = verification_status_ }
    : identity_verification_attributes)

let make_update_template_response () = (() : unit)

let make_template ?html_part:(html_part_ : html_part option)
    ?text_part:(text_part_ : text_part option) ?subject_part:(subject_part_ : subject_part option)
    ~template_name:(template_name_ : template_name) () =
  ({
     html_part = html_part_;
     text_part = text_part_;
     subject_part = subject_part_;
     template_name = template_name_;
   }
    : template)

let make_update_template_request ~template:(template_ : template) () =
  ({ template = template_ } : update_template_request)

let make_update_receipt_rule_response () = (() : unit)

let make_s3_action ?iam_role_arn:(iam_role_arn_ : iam_role_ar_n option)
    ?kms_key_arn:(kms_key_arn_ : amazon_resource_name option)
    ?object_key_prefix:(object_key_prefix_ : s3_key_prefix option)
    ?topic_arn:(topic_arn_ : amazon_resource_name option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({
     iam_role_arn = iam_role_arn_;
     kms_key_arn = kms_key_arn_;
     object_key_prefix = object_key_prefix_;
     bucket_name = bucket_name_;
     topic_arn = topic_arn_;
   }
    : s3_action)

let make_bounce_action ?status_code:(status_code_ : bounce_status_code option)
    ?topic_arn:(topic_arn_ : amazon_resource_name option) ~sender:(sender_ : address)
    ~message:(message_ : bounce_message)
    ~smtp_reply_code:(smtp_reply_code_ : bounce_smtp_reply_code) () =
  ({
     sender = sender_;
     message = message_;
     status_code = status_code_;
     smtp_reply_code = smtp_reply_code_;
     topic_arn = topic_arn_;
   }
    : bounce_action)

let make_lambda_action ?invocation_type:(invocation_type_ : invocation_type option)
    ?topic_arn:(topic_arn_ : amazon_resource_name option)
    ~function_arn:(function_arn_ : amazon_resource_name) () =
  ({ invocation_type = invocation_type_; function_arn = function_arn_; topic_arn = topic_arn_ }
    : lambda_action)

let make_stop_action ?topic_arn:(topic_arn_ : amazon_resource_name option)
    ~scope:(scope_ : stop_scope) () =
  ({ topic_arn = topic_arn_; scope = scope_ } : stop_action)

let make_add_header_action ~header_value:(header_value_ : header_value)
    ~header_name:(header_name_ : header_name) () =
  ({ header_value = header_value_; header_name = header_name_ } : add_header_action)

let make_sns_action ?encoding:(encoding_ : sns_action_encoding option)
    ~topic_arn:(topic_arn_ : amazon_resource_name) () =
  ({ encoding = encoding_; topic_arn = topic_arn_ } : sns_action)

let make_connect_action ~iam_role_ar_n:(iam_role_ar_n_ : iam_role_ar_n)
    ~instance_ar_n:(instance_ar_n_ : connect_instance_arn) () =
  ({ iam_role_ar_n = iam_role_ar_n_; instance_ar_n = instance_ar_n_ } : connect_action)

let make_receipt_action ?connect_action:(connect_action_ : connect_action option)
    ?sns_action:(sns_action_ : sns_action option)
    ?add_header_action:(add_header_action_ : add_header_action option)
    ?stop_action:(stop_action_ : stop_action option)
    ?lambda_action:(lambda_action_ : lambda_action option)
    ?workmail_action:(workmail_action_ : workmail_action option)
    ?bounce_action:(bounce_action_ : bounce_action option)
    ?s3_action:(s3_action_ : s3_action option) () =
  ({
     connect_action = connect_action_;
     sns_action = sns_action_;
     add_header_action = add_header_action_;
     stop_action = stop_action_;
     lambda_action = lambda_action_;
     workmail_action = workmail_action_;
     bounce_action = bounce_action_;
     s3_action = s3_action_;
   }
    : receipt_action)

let make_receipt_rule ?scan_enabled:(scan_enabled_ : enabled option)
    ?actions:(actions_ : receipt_actions_list option)
    ?recipients:(recipients_ : recipients_list option) ?tls_policy:(tls_policy_ : tls_policy option)
    ?enabled:(enabled_ : enabled option) ~name:(name_ : receipt_rule_name) () =
  ({
     scan_enabled = scan_enabled_;
     actions = actions_;
     recipients = recipients_;
     tls_policy = tls_policy_;
     enabled = enabled_;
     name = name_;
   }
    : receipt_rule)

let make_update_receipt_rule_request ~rule:(rule_ : receipt_rule)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ rule = rule_; rule_set_name = rule_set_name_ } : update_receipt_rule_request)

let make_update_custom_verification_email_template_request
    ?failure_redirection_ur_l:(failure_redirection_ur_l_ : failure_redirection_ur_l option)
    ?success_redirection_ur_l:(success_redirection_ur_l_ : success_redirection_ur_l option)
    ?template_content:(template_content_ : template_content option)
    ?template_subject:(template_subject_ : subject option)
    ?from_email_address:(from_email_address_ : from_address option)
    ~template_name:(template_name_ : template_name) () =
  ({
     failure_redirection_ur_l = failure_redirection_ur_l_;
     success_redirection_ur_l = success_redirection_ur_l_;
     template_content = template_content_;
     template_subject = template_subject_;
     from_email_address = from_email_address_;
     template_name = template_name_;
   }
    : update_custom_verification_email_template_request)

let make_update_configuration_set_tracking_options_response () = (() : unit)

let make_tracking_options
    ?custom_redirect_domain:(custom_redirect_domain_ : custom_redirect_domain option) () =
  ({ custom_redirect_domain = custom_redirect_domain_ } : tracking_options)

let make_update_configuration_set_tracking_options_request
    ~tracking_options:(tracking_options_ : tracking_options)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ tracking_options = tracking_options_; configuration_set_name = configuration_set_name_ }
    : update_configuration_set_tracking_options_request)

let make_update_configuration_set_sending_enabled_request ~enabled:(enabled_ : enabled)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ enabled = enabled_; configuration_set_name = configuration_set_name_ }
    : update_configuration_set_sending_enabled_request)

let make_update_configuration_set_reputation_metrics_enabled_request ~enabled:(enabled_ : enabled)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ enabled = enabled_; configuration_set_name = configuration_set_name_ }
    : update_configuration_set_reputation_metrics_enabled_request)

let make_update_configuration_set_event_destination_response () = (() : unit)

let make_kinesis_firehose_destination
    ~delivery_stream_ar_n:(delivery_stream_ar_n_ : amazon_resource_name)
    ~iam_role_ar_n:(iam_role_ar_n_ : amazon_resource_name) () =
  ({ delivery_stream_ar_n = delivery_stream_ar_n_; iam_role_ar_n = iam_role_ar_n_ }
    : kinesis_firehose_destination)

let make_cloud_watch_dimension_configuration
    ~default_dimension_value:(default_dimension_value_ : default_dimension_value)
    ~dimension_value_source:(dimension_value_source_ : dimension_value_source)
    ~dimension_name:(dimension_name_ : dimension_name) () =
  ({
     default_dimension_value = default_dimension_value_;
     dimension_value_source = dimension_value_source_;
     dimension_name = dimension_name_;
   }
    : cloud_watch_dimension_configuration)

let make_cloud_watch_destination
    ~dimension_configurations:(dimension_configurations_ : cloud_watch_dimension_configurations) ()
    =
  ({ dimension_configurations = dimension_configurations_ } : cloud_watch_destination)

let make_sns_destination ~topic_ar_n:(topic_ar_n_ : amazon_resource_name) () =
  ({ topic_ar_n = topic_ar_n_ } : sns_destination)

let make_event_destination ?sns_destination:(sns_destination_ : sns_destination option)
    ?cloud_watch_destination:(cloud_watch_destination_ : cloud_watch_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?enabled:(enabled_ : enabled option) ~matching_event_types:(matching_event_types_ : event_types)
    ~name:(name_ : event_destination_name) () =
  ({
     sns_destination = sns_destination_;
     cloud_watch_destination = cloud_watch_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     matching_event_types = matching_event_types_;
     enabled = enabled_;
     name = name_;
   }
    : event_destination)

let make_update_configuration_set_event_destination_request
    ~event_destination:(event_destination_ : event_destination)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ event_destination = event_destination_; configuration_set_name = configuration_set_name_ }
    : update_configuration_set_event_destination_request)

let make_update_account_sending_enabled_request ?enabled:(enabled_ : enabled option) () =
  ({ enabled = enabled_ } : update_account_sending_enabled_request)

let make_test_render_template_response
    ?rendered_template:(rendered_template_ : rendered_template option) () =
  ({ rendered_template = rendered_template_ } : test_render_template_response)

let make_test_render_template_request ~template_data:(template_data_ : template_data)
    ~template_name:(template_name_ : template_name) () =
  ({ template_data = template_data_; template_name = template_name_ }
    : test_render_template_request)

let make_template_metadata ?created_timestamp:(created_timestamp_ : timestamp option)
    ?name:(name_ : template_name option) () =
  ({ created_timestamp = created_timestamp_; name = name_ } : template_metadata)

let make_set_receipt_rule_position_response () = (() : unit)

let make_set_receipt_rule_position_request ?after:(after_ : receipt_rule_name option)
    ~rule_name:(rule_name_ : receipt_rule_name)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ after = after_; rule_name = rule_name_; rule_set_name = rule_set_name_ }
    : set_receipt_rule_position_request)

let make_set_identity_notification_topic_response () = (() : unit)

let make_set_identity_notification_topic_request ?sns_topic:(sns_topic_ : notification_topic option)
    ~notification_type:(notification_type_ : notification_type) ~identity:(identity_ : identity) ()
    =
  ({ sns_topic = sns_topic_; notification_type = notification_type_; identity = identity_ }
    : set_identity_notification_topic_request)

let make_set_identity_mail_from_domain_response () = (() : unit)

let make_set_identity_mail_from_domain_request
    ?behavior_on_mx_failure:(behavior_on_mx_failure_ : behavior_on_mx_failure option)
    ?mail_from_domain:(mail_from_domain_ : mail_from_domain_name option)
    ~identity:(identity_ : identity) () =
  ({
     behavior_on_mx_failure = behavior_on_mx_failure_;
     mail_from_domain = mail_from_domain_;
     identity = identity_;
   }
    : set_identity_mail_from_domain_request)

let make_set_identity_headers_in_notifications_enabled_response () = (() : unit)

let make_set_identity_headers_in_notifications_enabled_request ~enabled:(enabled_ : enabled)
    ~notification_type:(notification_type_ : notification_type) ~identity:(identity_ : identity) ()
    =
  ({ enabled = enabled_; notification_type = notification_type_; identity = identity_ }
    : set_identity_headers_in_notifications_enabled_request)

let make_set_identity_feedback_forwarding_enabled_response () = (() : unit)

let make_set_identity_feedback_forwarding_enabled_request
    ~forwarding_enabled:(forwarding_enabled_ : enabled) ~identity:(identity_ : identity) () =
  ({ forwarding_enabled = forwarding_enabled_; identity = identity_ }
    : set_identity_feedback_forwarding_enabled_request)

let make_set_identity_dkim_enabled_response () = (() : unit)

let make_set_identity_dkim_enabled_request ~dkim_enabled:(dkim_enabled_ : enabled)
    ~identity:(identity_ : identity) () =
  ({ dkim_enabled = dkim_enabled_; identity = identity_ } : set_identity_dkim_enabled_request)

let make_set_active_receipt_rule_set_response () = (() : unit)

let make_set_active_receipt_rule_set_request
    ?rule_set_name:(rule_set_name_ : receipt_rule_set_name option) () =
  ({ rule_set_name = rule_set_name_ } : set_active_receipt_rule_set_request)

let make_send_templated_email_response ~message_id:(message_id_ : message_id) () =
  ({ message_id = message_id_ } : send_templated_email_response)

let make_destination ?bcc_addresses:(bcc_addresses_ : address_list option)
    ?cc_addresses:(cc_addresses_ : address_list option)
    ?to_addresses:(to_addresses_ : address_list option) () =
  ({ bcc_addresses = bcc_addresses_; cc_addresses = cc_addresses_; to_addresses = to_addresses_ }
    : destination)

let make_message_tag ~value:(value_ : message_tag_value) ~name:(name_ : message_tag_name) () =
  ({ value = value_; name = name_ } : message_tag)

let make_send_templated_email_request ?template_arn:(template_arn_ : amazon_resource_name option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name option)
    ?tags:(tags_ : message_tag_list option)
    ?return_path_arn:(return_path_arn_ : amazon_resource_name option)
    ?source_arn:(source_arn_ : amazon_resource_name option)
    ?return_path:(return_path_ : address option)
    ?reply_to_addresses:(reply_to_addresses_ : address_list option)
    ~template_data:(template_data_ : template_data) ~template:(template_ : template_name)
    ~destination:(destination_ : destination) ~source:(source_ : address) () =
  ({
     template_data = template_data_;
     template_arn = template_arn_;
     template = template_;
     configuration_set_name = configuration_set_name_;
     tags = tags_;
     return_path_arn = return_path_arn_;
     source_arn = source_arn_;
     return_path = return_path_;
     reply_to_addresses = reply_to_addresses_;
     destination = destination_;
     source = source_;
   }
    : send_templated_email_request)

let make_send_raw_email_response ~message_id:(message_id_ : message_id) () =
  ({ message_id = message_id_ } : send_raw_email_response)

let make_raw_message ~data:(data_ : raw_message_data) () = ({ data = data_ } : raw_message)

let make_send_raw_email_request
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name option)
    ?tags:(tags_ : message_tag_list option)
    ?return_path_arn:(return_path_arn_ : amazon_resource_name option)
    ?source_arn:(source_arn_ : amazon_resource_name option)
    ?from_arn:(from_arn_ : amazon_resource_name option)
    ?destinations:(destinations_ : address_list option) ?source:(source_ : address option)
    ~raw_message:(raw_message_ : raw_message) () =
  ({
     configuration_set_name = configuration_set_name_;
     tags = tags_;
     return_path_arn = return_path_arn_;
     source_arn = source_arn_;
     from_arn = from_arn_;
     raw_message = raw_message_;
     destinations = destinations_;
     source = source_;
   }
    : send_raw_email_request)

let make_send_email_response ~message_id:(message_id_ : message_id) () =
  ({ message_id = message_id_ } : send_email_response)

let make_content ?charset:(charset_ : charset option) ~data:(data_ : message_data) () =
  ({ charset = charset_; data = data_ } : content)

let make_body ?html:(html_ : content option) ?text:(text_ : content option) () =
  ({ html = html_; text = text_ } : body)

let make_message ~body:(body_ : body) ~subject:(subject_ : content) () =
  ({ body = body_; subject = subject_ } : message)

let make_send_email_request
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name option)
    ?tags:(tags_ : message_tag_list option)
    ?return_path_arn:(return_path_arn_ : amazon_resource_name option)
    ?source_arn:(source_arn_ : amazon_resource_name option)
    ?return_path:(return_path_ : address option)
    ?reply_to_addresses:(reply_to_addresses_ : address_list option) ~message:(message_ : message)
    ~destination:(destination_ : destination) ~source:(source_ : address) () =
  ({
     configuration_set_name = configuration_set_name_;
     tags = tags_;
     return_path_arn = return_path_arn_;
     source_arn = source_arn_;
     return_path = return_path_;
     reply_to_addresses = reply_to_addresses_;
     message = message_;
     destination = destination_;
     source = source_;
   }
    : send_email_request)

let make_send_custom_verification_email_response ?message_id:(message_id_ : message_id option) () =
  ({ message_id = message_id_ } : send_custom_verification_email_response)

let make_send_custom_verification_email_request
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name option)
    ~template_name:(template_name_ : template_name) ~email_address:(email_address_ : address) () =
  ({
     configuration_set_name = configuration_set_name_;
     template_name = template_name_;
     email_address = email_address_;
   }
    : send_custom_verification_email_request)

let make_bulk_email_destination_status ?message_id:(message_id_ : message_id option)
    ?error:(error_ : error option) ?status:(status_ : bulk_email_status option) () =
  ({ message_id = message_id_; error = error_; status = status_ } : bulk_email_destination_status)

let make_send_bulk_templated_email_response ~status:(status_ : bulk_email_destination_status_list)
    () =
  ({ status = status_ } : send_bulk_templated_email_response)

let make_bulk_email_destination
    ?replacement_template_data:(replacement_template_data_ : template_data option)
    ?replacement_tags:(replacement_tags_ : message_tag_list option)
    ~destination:(destination_ : destination) () =
  ({
     replacement_template_data = replacement_template_data_;
     replacement_tags = replacement_tags_;
     destination = destination_;
   }
    : bulk_email_destination)

let make_send_bulk_templated_email_request
    ?template_arn:(template_arn_ : amazon_resource_name option)
    ?default_tags:(default_tags_ : message_tag_list option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name option)
    ?return_path_arn:(return_path_arn_ : amazon_resource_name option)
    ?return_path:(return_path_ : address option)
    ?reply_to_addresses:(reply_to_addresses_ : address_list option)
    ?source_arn:(source_arn_ : amazon_resource_name option)
    ~destinations:(destinations_ : bulk_email_destination_list)
    ~default_template_data:(default_template_data_ : template_data)
    ~template:(template_ : template_name) ~source:(source_ : address) () =
  ({
     destinations = destinations_;
     default_template_data = default_template_data_;
     template_arn = template_arn_;
     template = template_;
     default_tags = default_tags_;
     configuration_set_name = configuration_set_name_;
     return_path_arn = return_path_arn_;
     return_path = return_path_;
     reply_to_addresses = reply_to_addresses_;
     source_arn = source_arn_;
     source = source_;
   }
    : send_bulk_templated_email_request)

let make_send_bounce_response ?message_id:(message_id_ : message_id option) () =
  ({ message_id = message_id_ } : send_bounce_response)

let make_extension_field ~value:(value_ : extension_field_value)
    ~name:(name_ : extension_field_name) () =
  ({ value = value_; name = name_ } : extension_field)

let make_message_dsn ?extension_fields:(extension_fields_ : extension_field_list option)
    ?arrival_date:(arrival_date_ : arrival_date option)
    ~reporting_mta:(reporting_mta_ : reporting_mta) () =
  ({
     extension_fields = extension_fields_;
     arrival_date = arrival_date_;
     reporting_mta = reporting_mta_;
   }
    : message_dsn)

let make_recipient_dsn_fields ?extension_fields:(extension_fields_ : extension_field_list option)
    ?last_attempt_date:(last_attempt_date_ : last_attempt_date option)
    ?diagnostic_code:(diagnostic_code_ : diagnostic_code option)
    ?remote_mta:(remote_mta_ : remote_mta option)
    ?final_recipient:(final_recipient_ : address option) ~status:(status_ : dsn_status)
    ~action:(action_ : dsn_action) () =
  ({
     extension_fields = extension_fields_;
     last_attempt_date = last_attempt_date_;
     diagnostic_code = diagnostic_code_;
     status = status_;
     remote_mta = remote_mta_;
     action = action_;
     final_recipient = final_recipient_;
   }
    : recipient_dsn_fields)

let make_bounced_recipient_info
    ?recipient_dsn_fields:(recipient_dsn_fields_ : recipient_dsn_fields option)
    ?bounce_type:(bounce_type_ : bounce_type option)
    ?recipient_arn:(recipient_arn_ : amazon_resource_name option) ~recipient:(recipient_ : address)
    () =
  ({
     recipient_dsn_fields = recipient_dsn_fields_;
     bounce_type = bounce_type_;
     recipient_arn = recipient_arn_;
     recipient = recipient_;
   }
    : bounced_recipient_info)

let make_send_bounce_request ?bounce_sender_arn:(bounce_sender_arn_ : amazon_resource_name option)
    ?message_dsn:(message_dsn_ : message_dsn option)
    ?explanation:(explanation_ : explanation option)
    ~bounced_recipient_info_list:(bounced_recipient_info_list_ : bounced_recipient_info_list)
    ~bounce_sender:(bounce_sender_ : address)
    ~original_message_id:(original_message_id_ : message_id) () =
  ({
     bounce_sender_arn = bounce_sender_arn_;
     bounced_recipient_info_list = bounced_recipient_info_list_;
     message_dsn = message_dsn_;
     explanation = explanation_;
     bounce_sender = bounce_sender_;
     original_message_id = original_message_id_;
   }
    : send_bounce_request)

let make_reorder_receipt_rule_set_response () = (() : unit)

let make_reorder_receipt_rule_set_request ~rule_names:(rule_names_ : receipt_rule_names_list)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ rule_names = rule_names_; rule_set_name = rule_set_name_ } : reorder_receipt_rule_set_request)

let make_put_identity_policy_response () = (() : unit)

let make_put_identity_policy_request ~policy:(policy_ : policy)
    ~policy_name:(policy_name_ : policy_name) ~identity:(identity_ : identity) () =
  ({ policy = policy_; policy_name = policy_name_; identity = identity_ }
    : put_identity_policy_request)

let make_put_configuration_set_delivery_options_response () = (() : unit)

let make_delivery_options ?tls_policy:(tls_policy_ : tls_policy option) () =
  ({ tls_policy = tls_policy_ } : delivery_options)

let make_put_configuration_set_delivery_options_request
    ?delivery_options:(delivery_options_ : delivery_options option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ delivery_options = delivery_options_; configuration_set_name = configuration_set_name_ }
    : put_configuration_set_delivery_options_request)

let make_list_verified_email_addresses_response
    ?verified_email_addresses:(verified_email_addresses_ : address_list option) () =
  ({ verified_email_addresses = verified_email_addresses_ }
    : list_verified_email_addresses_response)

let make_list_templates_response ?next_token:(next_token_ : next_token option)
    ?templates_metadata:(templates_metadata_ : template_metadata_list option) () =
  ({ next_token = next_token_; templates_metadata = templates_metadata_ } : list_templates_response)

let make_list_templates_request ?max_items:(max_items_ : max_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_items = max_items_; next_token = next_token_ } : list_templates_request)

let make_receipt_rule_set_metadata ?created_timestamp:(created_timestamp_ : timestamp option)
    ?name:(name_ : receipt_rule_set_name option) () =
  ({ created_timestamp = created_timestamp_; name = name_ } : receipt_rule_set_metadata)

let make_list_receipt_rule_sets_response ?next_token:(next_token_ : next_token option)
    ?rule_sets:(rule_sets_ : receipt_rule_sets_lists option) () =
  ({ next_token = next_token_; rule_sets = rule_sets_ } : list_receipt_rule_sets_response)

let make_list_receipt_rule_sets_request ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_receipt_rule_sets_request)

let make_receipt_ip_filter ~cidr:(cidr_ : cidr) ~policy:(policy_ : receipt_filter_policy) () =
  ({ cidr = cidr_; policy = policy_ } : receipt_ip_filter)

let make_receipt_filter ~ip_filter:(ip_filter_ : receipt_ip_filter)
    ~name:(name_ : receipt_filter_name) () =
  ({ ip_filter = ip_filter_; name = name_ } : receipt_filter)

let make_list_receipt_filters_response ?filters:(filters_ : receipt_filter_list option) () =
  ({ filters = filters_ } : list_receipt_filters_response)

let make_list_receipt_filters_request () = (() : unit)

let make_list_identity_policies_response ~policy_names:(policy_names_ : policy_name_list) () =
  ({ policy_names = policy_names_ } : list_identity_policies_response)

let make_list_identity_policies_request ~identity:(identity_ : identity) () =
  ({ identity = identity_ } : list_identity_policies_request)

let make_list_identities_response ?next_token:(next_token_ : next_token option)
    ~identities:(identities_ : identity_list) () =
  ({ next_token = next_token_; identities = identities_ } : list_identities_response)

let make_list_identities_request ?max_items:(max_items_ : max_items option)
    ?next_token:(next_token_ : next_token option)
    ?identity_type:(identity_type_ : identity_type option) () =
  ({ max_items = max_items_; next_token = next_token_; identity_type = identity_type_ }
    : list_identities_request)

let make_custom_verification_email_template
    ?failure_redirection_ur_l:(failure_redirection_ur_l_ : failure_redirection_ur_l option)
    ?success_redirection_ur_l:(success_redirection_ur_l_ : success_redirection_ur_l option)
    ?template_subject:(template_subject_ : subject option)
    ?from_email_address:(from_email_address_ : from_address option)
    ?template_name:(template_name_ : template_name option) () =
  ({
     failure_redirection_ur_l = failure_redirection_ur_l_;
     success_redirection_ur_l = success_redirection_ur_l_;
     template_subject = template_subject_;
     from_email_address = from_email_address_;
     template_name = template_name_;
   }
    : custom_verification_email_template)

let make_list_custom_verification_email_templates_response
    ?next_token:(next_token_ : next_token option)
    ?custom_verification_email_templates:
      (custom_verification_email_templates_ : custom_verification_email_templates option) () =
  ({
     next_token = next_token_;
     custom_verification_email_templates = custom_verification_email_templates_;
   }
    : list_custom_verification_email_templates_response)

let make_list_custom_verification_email_templates_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_custom_verification_email_templates_request)

let make_configuration_set ~name:(name_ : configuration_set_name) () =
  ({ name = name_ } : configuration_set)

let make_list_configuration_sets_response ?next_token:(next_token_ : next_token option)
    ?configuration_sets:(configuration_sets_ : configuration_sets option) () =
  ({ next_token = next_token_; configuration_sets = configuration_sets_ }
    : list_configuration_sets_response)

let make_list_configuration_sets_request ?max_items:(max_items_ : max_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_items = max_items_; next_token = next_token_ } : list_configuration_sets_request)

let make_get_template_response ?template:(template_ : template option) () =
  ({ template = template_ } : get_template_response)

let make_get_template_request ~template_name:(template_name_ : template_name) () =
  ({ template_name = template_name_ } : get_template_request)

let make_send_data_point ?rejects:(rejects_ : counter option)
    ?complaints:(complaints_ : counter option) ?bounces:(bounces_ : counter option)
    ?delivery_attempts:(delivery_attempts_ : counter option)
    ?timestamp:(timestamp_ : timestamp option) () =
  ({
     rejects = rejects_;
     complaints = complaints_;
     bounces = bounces_;
     delivery_attempts = delivery_attempts_;
     timestamp = timestamp_;
   }
    : send_data_point)

let make_get_send_statistics_response
    ?send_data_points:(send_data_points_ : send_data_point_list option) () =
  ({ send_data_points = send_data_points_ } : get_send_statistics_response)

let make_get_send_quota_response ?sent_last24_hours:(sent_last24_hours_ : sent_last24_hours option)
    ?max_send_rate:(max_send_rate_ : max_send_rate option)
    ?max24_hour_send:(max24_hour_send_ : max24_hour_send option) () =
  ({
     sent_last24_hours = sent_last24_hours_;
     max_send_rate = max_send_rate_;
     max24_hour_send = max24_hour_send_;
   }
    : get_send_quota_response)

let make_get_identity_verification_attributes_response
    ~verification_attributes:(verification_attributes_ : verification_attributes) () =
  ({ verification_attributes = verification_attributes_ }
    : get_identity_verification_attributes_response)

let make_get_identity_verification_attributes_request ~identities:(identities_ : identity_list) () =
  ({ identities = identities_ } : get_identity_verification_attributes_request)

let make_get_identity_policies_response ~policies:(policies_ : policy_map) () =
  ({ policies = policies_ } : get_identity_policies_response)

let make_get_identity_policies_request ~policy_names:(policy_names_ : policy_name_list)
    ~identity:(identity_ : identity) () =
  ({ policy_names = policy_names_; identity = identity_ } : get_identity_policies_request)

let make_identity_notification_attributes
    ?headers_in_delivery_notifications_enabled:
      (headers_in_delivery_notifications_enabled_ : enabled option)
    ?headers_in_complaint_notifications_enabled:
      (headers_in_complaint_notifications_enabled_ : enabled option)
    ?headers_in_bounce_notifications_enabled:
      (headers_in_bounce_notifications_enabled_ : enabled option)
    ~forwarding_enabled:(forwarding_enabled_ : enabled)
    ~delivery_topic:(delivery_topic_ : notification_topic)
    ~complaint_topic:(complaint_topic_ : notification_topic)
    ~bounce_topic:(bounce_topic_ : notification_topic) () =
  ({
     headers_in_delivery_notifications_enabled = headers_in_delivery_notifications_enabled_;
     headers_in_complaint_notifications_enabled = headers_in_complaint_notifications_enabled_;
     headers_in_bounce_notifications_enabled = headers_in_bounce_notifications_enabled_;
     forwarding_enabled = forwarding_enabled_;
     delivery_topic = delivery_topic_;
     complaint_topic = complaint_topic_;
     bounce_topic = bounce_topic_;
   }
    : identity_notification_attributes)

let make_get_identity_notification_attributes_response
    ~notification_attributes:(notification_attributes_ : notification_attributes) () =
  ({ notification_attributes = notification_attributes_ }
    : get_identity_notification_attributes_response)

let make_get_identity_notification_attributes_request ~identities:(identities_ : identity_list) () =
  ({ identities = identities_ } : get_identity_notification_attributes_request)

let make_identity_mail_from_domain_attributes
    ~behavior_on_mx_failure:(behavior_on_mx_failure_ : behavior_on_mx_failure)
    ~mail_from_domain_status:(mail_from_domain_status_ : custom_mail_from_status)
    ~mail_from_domain:(mail_from_domain_ : mail_from_domain_name) () =
  ({
     behavior_on_mx_failure = behavior_on_mx_failure_;
     mail_from_domain_status = mail_from_domain_status_;
     mail_from_domain = mail_from_domain_;
   }
    : identity_mail_from_domain_attributes)

let make_get_identity_mail_from_domain_attributes_response
    ~mail_from_domain_attributes:(mail_from_domain_attributes_ : mail_from_domain_attributes) () =
  ({ mail_from_domain_attributes = mail_from_domain_attributes_ }
    : get_identity_mail_from_domain_attributes_response)

let make_get_identity_mail_from_domain_attributes_request ~identities:(identities_ : identity_list)
    () =
  ({ identities = identities_ } : get_identity_mail_from_domain_attributes_request)

let make_identity_dkim_attributes ?dkim_tokens:(dkim_tokens_ : verification_token_list option)
    ~dkim_verification_status:(dkim_verification_status_ : verification_status)
    ~dkim_enabled:(dkim_enabled_ : enabled) () =
  ({
     dkim_tokens = dkim_tokens_;
     dkim_verification_status = dkim_verification_status_;
     dkim_enabled = dkim_enabled_;
   }
    : identity_dkim_attributes)

let make_get_identity_dkim_attributes_response ~dkim_attributes:(dkim_attributes_ : dkim_attributes)
    () =
  ({ dkim_attributes = dkim_attributes_ } : get_identity_dkim_attributes_response)

let make_get_identity_dkim_attributes_request ~identities:(identities_ : identity_list) () =
  ({ identities = identities_ } : get_identity_dkim_attributes_request)

let make_get_custom_verification_email_template_response
    ?failure_redirection_ur_l:(failure_redirection_ur_l_ : failure_redirection_ur_l option)
    ?success_redirection_ur_l:(success_redirection_ur_l_ : success_redirection_ur_l option)
    ?template_content:(template_content_ : template_content option)
    ?template_subject:(template_subject_ : subject option)
    ?from_email_address:(from_email_address_ : from_address option)
    ?template_name:(template_name_ : template_name option) () =
  ({
     failure_redirection_ur_l = failure_redirection_ur_l_;
     success_redirection_ur_l = success_redirection_ur_l_;
     template_content = template_content_;
     template_subject = template_subject_;
     from_email_address = from_email_address_;
     template_name = template_name_;
   }
    : get_custom_verification_email_template_response)

let make_get_custom_verification_email_template_request
    ~template_name:(template_name_ : template_name) () =
  ({ template_name = template_name_ } : get_custom_verification_email_template_request)

let make_get_account_sending_enabled_response ?enabled:(enabled_ : enabled option) () =
  ({ enabled = enabled_ } : get_account_sending_enabled_response)

let make_describe_receipt_rule_set_response ?rules:(rules_ : receipt_rules_list option)
    ?metadata:(metadata_ : receipt_rule_set_metadata option) () =
  ({ rules = rules_; metadata = metadata_ } : describe_receipt_rule_set_response)

let make_describe_receipt_rule_set_request ~rule_set_name:(rule_set_name_ : receipt_rule_set_name)
    () =
  ({ rule_set_name = rule_set_name_ } : describe_receipt_rule_set_request)

let make_describe_receipt_rule_response ?rule:(rule_ : receipt_rule option) () =
  ({ rule = rule_ } : describe_receipt_rule_response)

let make_describe_receipt_rule_request ~rule_name:(rule_name_ : receipt_rule_name)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ rule_name = rule_name_; rule_set_name = rule_set_name_ } : describe_receipt_rule_request)

let make_reputation_options ?last_fresh_start:(last_fresh_start_ : last_fresh_start option)
    ?reputation_metrics_enabled:(reputation_metrics_enabled_ : enabled option)
    ?sending_enabled:(sending_enabled_ : enabled option) () =
  ({
     last_fresh_start = last_fresh_start_;
     reputation_metrics_enabled = reputation_metrics_enabled_;
     sending_enabled = sending_enabled_;
   }
    : reputation_options)

let make_describe_configuration_set_response
    ?reputation_options:(reputation_options_ : reputation_options option)
    ?delivery_options:(delivery_options_ : delivery_options option)
    ?tracking_options:(tracking_options_ : tracking_options option)
    ?event_destinations:(event_destinations_ : event_destinations option)
    ?configuration_set:(configuration_set_ : configuration_set option) () =
  ({
     reputation_options = reputation_options_;
     delivery_options = delivery_options_;
     tracking_options = tracking_options_;
     event_destinations = event_destinations_;
     configuration_set = configuration_set_;
   }
    : describe_configuration_set_response)

let make_describe_configuration_set_request
    ?configuration_set_attribute_names:
      (configuration_set_attribute_names_ : configuration_set_attribute_list option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({
     configuration_set_attribute_names = configuration_set_attribute_names_;
     configuration_set_name = configuration_set_name_;
   }
    : describe_configuration_set_request)

let make_describe_active_receipt_rule_set_response ?rules:(rules_ : receipt_rules_list option)
    ?metadata:(metadata_ : receipt_rule_set_metadata option) () =
  ({ rules = rules_; metadata = metadata_ } : describe_active_receipt_rule_set_response)

let make_describe_active_receipt_rule_set_request () = (() : unit)

let make_delete_verified_email_address_request ~email_address:(email_address_ : address) () =
  ({ email_address = email_address_ } : delete_verified_email_address_request)

let make_delete_template_response () = (() : unit)

let make_delete_template_request ~template_name:(template_name_ : template_name) () =
  ({ template_name = template_name_ } : delete_template_request)

let make_delete_receipt_rule_set_response () = (() : unit)

let make_delete_receipt_rule_set_request ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) ()
    =
  ({ rule_set_name = rule_set_name_ } : delete_receipt_rule_set_request)

let make_delete_receipt_rule_response () = (() : unit)

let make_delete_receipt_rule_request ~rule_name:(rule_name_ : receipt_rule_name)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ rule_name = rule_name_; rule_set_name = rule_set_name_ } : delete_receipt_rule_request)

let make_delete_receipt_filter_response () = (() : unit)

let make_delete_receipt_filter_request ~filter_name:(filter_name_ : receipt_filter_name) () =
  ({ filter_name = filter_name_ } : delete_receipt_filter_request)

let make_delete_identity_policy_response () = (() : unit)

let make_delete_identity_policy_request ~policy_name:(policy_name_ : policy_name)
    ~identity:(identity_ : identity) () =
  ({ policy_name = policy_name_; identity = identity_ } : delete_identity_policy_request)

let make_delete_identity_response () = (() : unit)

let make_delete_identity_request ~identity:(identity_ : identity) () =
  ({ identity = identity_ } : delete_identity_request)

let make_delete_custom_verification_email_template_request
    ~template_name:(template_name_ : template_name) () =
  ({ template_name = template_name_ } : delete_custom_verification_email_template_request)

let make_delete_configuration_set_tracking_options_response () = (() : unit)

let make_delete_configuration_set_tracking_options_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ configuration_set_name = configuration_set_name_ }
    : delete_configuration_set_tracking_options_request)

let make_delete_configuration_set_event_destination_response () = (() : unit)

let make_delete_configuration_set_event_destination_request
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({
     event_destination_name = event_destination_name_;
     configuration_set_name = configuration_set_name_;
   }
    : delete_configuration_set_event_destination_request)

let make_delete_configuration_set_response () = (() : unit)

let make_delete_configuration_set_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_configuration_set_request)

let make_create_template_response () = (() : unit)

let make_create_template_request ~template:(template_ : template) () =
  ({ template = template_ } : create_template_request)

let make_create_receipt_rule_set_response () = (() : unit)

let make_create_receipt_rule_set_request ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) ()
    =
  ({ rule_set_name = rule_set_name_ } : create_receipt_rule_set_request)

let make_create_receipt_rule_response () = (() : unit)

let make_create_receipt_rule_request ?after:(after_ : receipt_rule_name option)
    ~rule:(rule_ : receipt_rule) ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ rule = rule_; after = after_; rule_set_name = rule_set_name_ } : create_receipt_rule_request)

let make_create_receipt_filter_response () = (() : unit)

let make_create_receipt_filter_request ~filter:(filter_ : receipt_filter) () =
  ({ filter = filter_ } : create_receipt_filter_request)

let make_create_custom_verification_email_template_request
    ~failure_redirection_ur_l:(failure_redirection_ur_l_ : failure_redirection_ur_l)
    ~success_redirection_ur_l:(success_redirection_ur_l_ : success_redirection_ur_l)
    ~template_content:(template_content_ : template_content)
    ~template_subject:(template_subject_ : subject)
    ~from_email_address:(from_email_address_ : from_address)
    ~template_name:(template_name_ : template_name) () =
  ({
     failure_redirection_ur_l = failure_redirection_ur_l_;
     success_redirection_ur_l = success_redirection_ur_l_;
     template_content = template_content_;
     template_subject = template_subject_;
     from_email_address = from_email_address_;
     template_name = template_name_;
   }
    : create_custom_verification_email_template_request)

let make_create_configuration_set_tracking_options_response () = (() : unit)

let make_create_configuration_set_tracking_options_request
    ~tracking_options:(tracking_options_ : tracking_options)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ tracking_options = tracking_options_; configuration_set_name = configuration_set_name_ }
    : create_configuration_set_tracking_options_request)

let make_create_configuration_set_event_destination_response () = (() : unit)

let make_create_configuration_set_event_destination_request
    ~event_destination:(event_destination_ : event_destination)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ event_destination = event_destination_; configuration_set_name = configuration_set_name_ }
    : create_configuration_set_event_destination_request)

let make_create_configuration_set_response () = (() : unit)

let make_create_configuration_set_request
    ~configuration_set:(configuration_set_ : configuration_set) () =
  ({ configuration_set = configuration_set_ } : create_configuration_set_request)

let make_clone_receipt_rule_set_response () = (() : unit)

let make_clone_receipt_rule_set_request
    ~original_rule_set_name:(original_rule_set_name_ : receipt_rule_set_name)
    ~rule_set_name:(rule_set_name_ : receipt_rule_set_name) () =
  ({ original_rule_set_name = original_rule_set_name_; rule_set_name = rule_set_name_ }
    : clone_receipt_rule_set_request)
