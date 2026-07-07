open Types

let make_update_traffic_policy_response () = (() : unit)

let make_ingress_analysis ~result_field:(result_field_ : result_field)
    ~analyzer:(analyzer_ : analyzer_arn) () =
  ({ result_field = result_field_; analyzer = analyzer_ } : ingress_analysis)

let make_ingress_string_expression ~values:(values_ : string_list)
    ~operator:(operator_ : ingress_string_operator)
    ~evaluate:(evaluate_ : ingress_string_to_evaluate) () =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : ingress_string_expression)

let make_ingress_ipv4_expression ~values:(values_ : ipv4_cidrs)
    ~operator:(operator_ : ingress_ip_operator) ~evaluate:(evaluate_ : ingress_ip_to_evaluate) () =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : ingress_ipv4_expression)

let make_ingress_ipv6_expression ~values:(values_ : ipv6_cidrs)
    ~operator:(operator_ : ingress_ip_operator) ~evaluate:(evaluate_ : ingress_ipv6_to_evaluate) ()
    =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : ingress_ipv6_expression)

let make_ingress_tls_protocol_expression ~value:(value_ : ingress_tls_protocol_attribute)
    ~operator:(operator_ : ingress_tls_protocol_operator)
    ~evaluate:(evaluate_ : ingress_tls_protocol_to_evaluate) () =
  ({ value = value_; operator = operator_; evaluate = evaluate_ } : ingress_tls_protocol_expression)

let make_ingress_is_in_address_list ~address_lists:(address_lists_ : ingress_address_list_arn_list)
    ~attribute:(attribute_ : ingress_address_list_email_attribute) () =
  ({ address_lists = address_lists_; attribute = attribute_ } : ingress_is_in_address_list)

let make_ingress_boolean_expression ~operator:(operator_ : ingress_boolean_operator)
    ~evaluate:(evaluate_ : ingress_boolean_to_evaluate) () =
  ({ operator = operator_; evaluate = evaluate_ } : ingress_boolean_expression)

let make_policy_statement ~action:(action_ : accept_action)
    ~conditions:(conditions_ : policy_conditions) () =
  ({ action = action_; conditions = conditions_ } : policy_statement)

let make_update_traffic_policy_request
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ?default_action:(default_action_ : accept_action option)
    ?policy_statements:(policy_statements_ : policy_statement_list option)
    ?traffic_policy_name:(traffic_policy_name_ : traffic_policy_name option)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({
     max_message_size_bytes = max_message_size_bytes_;
     default_action = default_action_;
     policy_statements = policy_statements_;
     traffic_policy_name = traffic_policy_name_;
     traffic_policy_id = traffic_policy_id_;
   }
    : update_traffic_policy_request)

let make_update_rule_set_response () = (() : unit)

let make_analysis ~result_field:(result_field_ : result_field) ~analyzer:(analyzer_ : analyzer_arn)
    () =
  ({ result_field = result_field_; analyzer = analyzer_ } : analysis)

let make_rule_is_in_address_list ~address_lists:(address_lists_ : rule_address_list_arn_list)
    ~attribute:(attribute_ : rule_address_list_email_attribute) () =
  ({ address_lists = address_lists_; attribute = attribute_ } : rule_is_in_address_list)

let make_rule_boolean_expression ~operator:(operator_ : rule_boolean_operator)
    ~evaluate:(evaluate_ : rule_boolean_to_evaluate) () =
  ({ operator = operator_; evaluate = evaluate_ } : rule_boolean_expression)

let make_rule_string_expression ~values:(values_ : rule_string_list)
    ~operator:(operator_ : rule_string_operator) ~evaluate:(evaluate_ : rule_string_to_evaluate) ()
    =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : rule_string_expression)

let make_rule_number_expression ~value:(value_ : Smaws_Lib.Smithy_api.Types.double)
    ~operator:(operator_ : rule_number_operator) ~evaluate:(evaluate_ : rule_number_to_evaluate) ()
    =
  ({ value = value_; operator = operator_; evaluate = evaluate_ } : rule_number_expression)

let make_rule_ip_expression ~values:(values_ : rule_ip_value_list)
    ~operator:(operator_ : rule_ip_operator) ~evaluate:(evaluate_ : rule_ip_to_evaluate) () =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : rule_ip_expression)

let make_rule_verdict_expression ~values:(values_ : rule_verdict_value_list)
    ~operator:(operator_ : rule_verdict_operator) ~evaluate:(evaluate_ : rule_verdict_to_evaluate)
    () =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : rule_verdict_expression)

let make_rule_dmarc_expression ~values:(values_ : rule_dmarc_value_list)
    ~operator:(operator_ : rule_dmarc_operator) () =
  ({ values = values_; operator = operator_ } : rule_dmarc_expression)

let make_drop_action () = (() : unit)

let make_relay_action ?mail_from:(mail_from_ : mail_from option)
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~relay:(relay_ : id_or_arn) () =
  ({ mail_from = mail_from_; relay = relay_; action_failure_policy = action_failure_policy_ }
    : relay_action)

let make_archive_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~target_archive:(target_archive_ : name_or_arn) () =
  ({ target_archive = target_archive_; action_failure_policy = action_failure_policy_ }
    : archive_action)

let make_s3_action ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : kms_key_id option)
    ?s3_prefix:(s3_prefix_ : s3_prefix option)
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
     s3_prefix = s3_prefix_;
     s3_bucket = s3_bucket_;
     role_arn = role_arn_;
     action_failure_policy = action_failure_policy_;
   }
    : s3_action)

let make_send_action ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({ role_arn = role_arn_; action_failure_policy = action_failure_policy_ } : send_action)

let make_add_header_action ~header_value:(header_value_ : header_value)
    ~header_name:(header_name_ : header_name) () =
  ({ header_value = header_value_; header_name = header_name_ } : add_header_action)

let make_replace_recipient_action ?replace_with:(replace_with_ : recipients option) () =
  ({ replace_with = replace_with_ } : replace_recipient_action)

let make_deliver_to_mailbox_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn) ~mailbox_arn:(mailbox_arn_ : name_or_arn) () =
  ({
     role_arn = role_arn_;
     mailbox_arn = mailbox_arn_;
     action_failure_policy = action_failure_policy_;
   }
    : deliver_to_mailbox_action)

let make_deliver_to_q_business_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn) ~index_id:(index_id_ : q_business_index_id)
    ~application_id:(application_id_ : q_business_application_id) () =
  ({
     role_arn = role_arn_;
     index_id = index_id_;
     application_id = application_id_;
     action_failure_policy = action_failure_policy_;
   }
    : deliver_to_q_business_action)

let make_sns_action ?payload_type:(payload_type_ : sns_notification_payload_type option)
    ?encoding:(encoding_ : sns_notification_encoding option)
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn) ~topic_arn:(topic_arn_ : sns_topic_arn) () =
  ({
     payload_type = payload_type_;
     encoding = encoding_;
     role_arn = role_arn_;
     topic_arn = topic_arn_;
     action_failure_policy = action_failure_policy_;
   }
    : sns_action)

let make_bounce_action ?message:(message_ : bounce_message option)
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~diagnostic_message:(diagnostic_message_ : diagnostic_message)
    ~smtp_reply_code:(smtp_reply_code_ : smtp_reply_code) ~status_code:(status_code_ : status_code)
    ~sender:(sender_ : email_address) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     message = message_;
     diagnostic_message = diagnostic_message_;
     smtp_reply_code = smtp_reply_code_;
     status_code = status_code_;
     sender = sender_;
     role_arn = role_arn_;
     action_failure_policy = action_failure_policy_;
   }
    : bounce_action)

let make_invoke_lambda_action
    ?retry_time_minutes:(retry_time_minutes_ : lambda_retry_time_minutes option)
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn)
    ~invocation_type:(invocation_type_ : lambda_invocation_type)
    ~function_arn:(function_arn_ : lambda_function_arn) () =
  ({
     retry_time_minutes = retry_time_minutes_;
     role_arn = role_arn_;
     invocation_type = invocation_type_;
     function_arn = function_arn_;
     action_failure_policy = action_failure_policy_;
   }
    : invoke_lambda_action)

let make_rule ?unless:(unless_ : rule_conditions option)
    ?conditions:(conditions_ : rule_conditions option) ?name:(name_ : rule_name option)
    ~actions:(actions_ : rule_actions) () =
  ({ actions = actions_; unless = unless_; conditions = conditions_; name = name_ } : rule)

let make_update_rule_set_request ?rules:(rules_ : rules option)
    ?rule_set_name:(rule_set_name_ : rule_set_name option) ~rule_set_id:(rule_set_id_ : rule_set_id)
    () =
  ({ rules = rules_; rule_set_name = rule_set_name_; rule_set_id = rule_set_id_ }
    : update_rule_set_request)

let make_update_relay_response () = (() : unit)
let make_no_authentication () = (() : unit)

let make_update_relay_request ?authentication:(authentication_ : relay_authentication option)
    ?server_port:(server_port_ : relay_server_port option)
    ?server_name:(server_name_ : relay_server_name option)
    ?relay_name:(relay_name_ : relay_name option) ~relay_id:(relay_id_ : relay_id) () =
  ({
     authentication = authentication_;
     server_port = server_port_;
     server_name = server_name_;
     relay_name = relay_name_;
     relay_id = relay_id_;
   }
    : update_relay_request)

let make_update_ingress_point_response () = (() : unit)

let make_trust_store ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?crl_content:(crl_content_ : crl_content option) ~ca_content:(ca_content_ : ca_content) () =
  ({ kms_key_arn = kms_key_arn_; crl_content = crl_content_; ca_content = ca_content_ }
    : trust_store)

let make_tls_auth_configuration ?trust_store:(trust_store_ : trust_store option) () =
  ({ trust_store = trust_store_ } : tls_auth_configuration)

let make_update_ingress_point_request ?tls_policy:(tls_policy_ : tls_policy option)
    ?ingress_point_configuration:(ingress_point_configuration_ : ingress_point_configuration option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?status_to_update:(status_to_update_ : ingress_point_status_to_update option)
    ?ingress_point_name:(ingress_point_name_ : ingress_point_name option)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({
     tls_policy = tls_policy_;
     ingress_point_configuration = ingress_point_configuration_;
     traffic_policy_id = traffic_policy_id_;
     rule_set_id = rule_set_id_;
     status_to_update = status_to_update_;
     ingress_point_name = ingress_point_name_;
     ingress_point_id = ingress_point_id_;
   }
    : update_ingress_point_request)

let make_update_archive_response () = (() : unit)

let make_update_archive_request ?retention:(retention_ : archive_retention option)
    ?archive_name:(archive_name_ : archive_name_string option)
    ~archive_id:(archive_id_ : archive_id_string) () =
  ({ retention = retention_; archive_name = archive_name_; archive_id = archive_id_ }
    : update_archive_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_traffic_policy ~default_action:(default_action_ : accept_action)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name) () =
  ({
     default_action = default_action_;
     traffic_policy_id = traffic_policy_id_;
     traffic_policy_name = traffic_policy_name_;
   }
    : traffic_policy)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_archive_search_response () = (() : unit)

let make_stop_archive_search_request ~search_id:(search_id_ : search_id) () =
  ({ search_id = search_id_ } : stop_archive_search_request)

let make_stop_archive_export_response () = (() : unit)

let make_stop_archive_export_request ~export_id:(export_id_ : export_id) () =
  ({ export_id = export_id_ } : stop_archive_export_request)

let make_stop_address_list_import_job_response () = (() : unit)

let make_stop_address_list_import_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_address_list_import_job_request)

let make_start_archive_search_response ?search_id:(search_id_ : search_id option) () =
  ({ search_id = search_id_ } : start_archive_search_response)

let make_archive_string_expression ~values:(values_ : string_value_list)
    ~operator:(operator_ : archive_string_operator)
    ~evaluate:(evaluate_ : archive_string_to_evaluate) () =
  ({ values = values_; operator = operator_; evaluate = evaluate_ } : archive_string_expression)

let make_archive_boolean_expression ~operator:(operator_ : archive_boolean_operator)
    ~evaluate:(evaluate_ : archive_boolean_to_evaluate) () =
  ({ operator = operator_; evaluate = evaluate_ } : archive_boolean_expression)

let make_archive_filters ?unless:(unless_ : archive_filter_conditions option)
    ?include_:(include__ : archive_filter_conditions option) () =
  ({ unless = unless_; include_ = include__ } : archive_filters)

let make_start_archive_search_request ?filters:(filters_ : archive_filters option)
    ~max_results:(max_results_ : search_max_results)
    ~to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~archive_id:(archive_id_ : archive_id) () =
  ({
     max_results = max_results_;
     to_timestamp = to_timestamp_;
     from_timestamp = from_timestamp_;
     filters = filters_;
     archive_id = archive_id_;
   }
    : start_archive_search_request)

let make_start_archive_export_response ?export_id:(export_id_ : export_id option) () =
  ({ export_id = export_id_ } : start_archive_export_response)

let make_s3_export_destination_configuration ?s3_location:(s3_location_ : s3_location option) () =
  ({ s3_location = s3_location_ } : s3_export_destination_configuration)

let make_start_archive_export_request
    ?include_metadata:(include_metadata_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?max_results:(max_results_ : export_max_results option)
    ?filters:(filters_ : archive_filters option)
    ~export_destination_configuration:
      (export_destination_configuration_ : export_destination_configuration)
    ~to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~archive_id:(archive_id_ : archive_id) () =
  ({
     include_metadata = include_metadata_;
     export_destination_configuration = export_destination_configuration_;
     max_results = max_results_;
     to_timestamp = to_timestamp_;
     from_timestamp = from_timestamp_;
     filters = filters_;
     archive_id = archive_id_;
   }
    : start_archive_export_request)

let make_start_address_list_import_job_response () = (() : unit)

let make_start_address_list_import_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : start_address_list_import_job_request)

let make_search_status ?error_message:(error_message_ : error_message option)
    ?state:(state_ : search_state option)
    ?completion_timestamp:(completion_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?submission_timestamp:(submission_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     error_message = error_message_;
     state = state_;
     completion_timestamp = completion_timestamp_;
     submission_timestamp = submission_timestamp_;
   }
    : search_status)

let make_search_summary ?status:(status_ : search_status option)
    ?search_id:(search_id_ : search_id option) () =
  ({ status = status_; search_id = search_id_ } : search_summary)

let make_saved_address
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address:(address_ : address) () =
  ({ created_timestamp = created_timestamp_; address = address_ } : saved_address)

let make_rule_set
    ?last_modification_date:(last_modification_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rule_set_name:(rule_set_name_ : rule_set_name option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option) () =
  ({
     last_modification_date = last_modification_date_;
     rule_set_name = rule_set_name_;
     rule_set_id = rule_set_id_;
   }
    : rule_set)

let make_envelope ?to_:(to__ : string_list option)
    ?from_:(from__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?helo:(helo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ to_ = to__; from_ = from__; helo = helo_ } : envelope)

let make_row ?source_arn:(source_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?envelope:(envelope_ : envelope option)
    ?sender_ip_address:(sender_ip_address_ : sender_ip_address option)
    ?sender_hostname:(sender_hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ingress_point_id:(ingress_point_id_ : ingress_point_id option)
    ?x_priority:(x_priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?x_original_mailer:(x_original_mailer_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?x_mailer:(x_mailer_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?in_reply_to:(in_reply_to_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?received_headers:(received_headers_ : email_received_headers_list option)
    ?has_attachments:(has_attachments_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?message_id:(message_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subject:(subject_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cc:(cc_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?from_:(from__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?to_:(to__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?date:(date_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?received_timestamp:(received_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?archived_message_id:(archived_message_id_ : archived_message_id option) () =
  ({
     source_arn = source_arn_;
     envelope = envelope_;
     sender_ip_address = sender_ip_address_;
     sender_hostname = sender_hostname_;
     ingress_point_id = ingress_point_id_;
     x_priority = x_priority_;
     x_original_mailer = x_original_mailer_;
     x_mailer = x_mailer_;
     in_reply_to = in_reply_to_;
     received_headers = received_headers_;
     has_attachments = has_attachments_;
     message_id = message_id_;
     subject = subject_;
     cc = cc_;
     from_ = from__;
     to_ = to__;
     date = date_;
     received_timestamp = received_timestamp_;
     archived_message_id = archived_message_id_;
   }
    : row)

let make_relay
    ?last_modified_timestamp:
      (last_modified_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?relay_name:(relay_name_ : relay_name option) ?relay_id:(relay_id_ : relay_id option) () =
  ({
     last_modified_timestamp = last_modified_timestamp_;
     relay_name = relay_name_;
     relay_id = relay_id_;
   }
    : relay)

let make_register_member_to_address_list_response () = (() : unit)

let make_register_member_to_address_list_request ~address:(address_ : address)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address = address_; address_list_id = address_list_id_ }
    : register_member_to_address_list_request)

let make_public_network_configuration ~ip_type:(ip_type_ : ip_type) () =
  ({ ip_type = ip_type_ } : public_network_configuration)

let make_private_network_configuration ~vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_ } : private_network_configuration)

let make_metadata ?source_arn:(source_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?configuration_set:(configuration_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sending_pool:(sending_pool_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_identity:(source_identity_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sending_method:(sending_method_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tls_protocol:(tls_protocol_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tls_cipher_suite:(tls_cipher_suite_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sender_ip_address:(sender_ip_address_ : sender_ip_address option)
    ?sender_hostname:(sender_hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?ingress_point_id:(ingress_point_id_ : ingress_point_id option)
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     source_arn = source_arn_;
     configuration_set = configuration_set_;
     sending_pool = sending_pool_;
     source_identity = source_identity_;
     sending_method = sending_method_;
     tls_protocol = tls_protocol_;
     tls_cipher_suite = tls_cipher_suite_;
     sender_ip_address = sender_ip_address_;
     sender_hostname = sender_hostname_;
     rule_set_id = rule_set_id_;
     traffic_policy_id = traffic_policy_id_;
     ingress_point_id = ingress_point_id_;
     timestamp = timestamp_;
   }
    : metadata)

let make_message_body
    ?message_malformed:(message_malformed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?html:(html_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?text:(text_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ message_malformed = message_malformed_; html = html_; text = text_ } : message_body)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_members_of_address_list_response ?next_token:(next_token_ : pagination_token option)
    ~addresses:(addresses_ : saved_addresses) () =
  ({ next_token = next_token_; addresses = addresses_ } : list_members_of_address_list_response)

let make_address_filter ?address_prefix:(address_prefix_ : address_prefix option) () =
  ({ address_prefix = address_prefix_ } : address_filter)

let make_list_members_of_address_list_request ?page_size:(page_size_ : address_page_size option)
    ?next_token:(next_token_ : pagination_token option) ?filter:(filter_ : address_filter option)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({
     page_size = page_size_;
     next_token = next_token_;
     filter = filter_;
     address_list_id = address_list_id_;
   }
    : list_members_of_address_list_request)

let make_list_archive_searches_response ?next_token:(next_token_ : pagination_token option)
    ?searches:(searches_ : search_summary_list option) () =
  ({ next_token = next_token_; searches = searches_ } : list_archive_searches_response)

let make_list_archive_searches_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) ~archive_id:(archive_id_ : archive_id) () =
  ({ page_size = page_size_; next_token = next_token_; archive_id = archive_id_ }
    : list_archive_searches_request)

let make_export_status ?error_message:(error_message_ : error_message option)
    ?state:(state_ : export_state option)
    ?completion_timestamp:(completion_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?submission_timestamp:(submission_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     error_message = error_message_;
     state = state_;
     completion_timestamp = completion_timestamp_;
     submission_timestamp = submission_timestamp_;
   }
    : export_status)

let make_export_summary ?status:(status_ : export_status option)
    ?export_id:(export_id_ : export_id option) () =
  ({ status = status_; export_id = export_id_ } : export_summary)

let make_list_archive_exports_response ?next_token:(next_token_ : pagination_token option)
    ?exports:(exports_ : export_summary_list option) () =
  ({ next_token = next_token_; exports = exports_ } : list_archive_exports_response)

let make_list_archive_exports_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) ~archive_id:(archive_id_ : archive_id) () =
  ({ page_size = page_size_; next_token = next_token_; archive_id = archive_id_ }
    : list_archive_exports_request)

let make_import_data_format ~import_data_type:(import_data_type_ : import_data_type) () =
  ({ import_data_type = import_data_type_ } : import_data_format)

let make_import_job ?error:(error_ : error_message option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failed_items_count:(failed_items_count_ : job_items_count option)
    ?imported_items_count:(imported_items_count_ : job_items_count option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address_list_id:(address_list_id_ : address_list_id)
    ~import_data_format:(import_data_format_ : import_data_format)
    ~pre_signed_url:(pre_signed_url_ : pre_signed_url) ~status:(status_ : import_job_status)
    ~name:(name_ : job_name) ~job_id:(job_id_ : job_id) () =
  ({
     error = error_;
     completed_timestamp = completed_timestamp_;
     start_timestamp = start_timestamp_;
     created_timestamp = created_timestamp_;
     address_list_id = address_list_id_;
     import_data_format = import_data_format_;
     failed_items_count = failed_items_count_;
     imported_items_count = imported_items_count_;
     pre_signed_url = pre_signed_url_;
     status = status_;
     name = name_;
     job_id = job_id_;
   }
    : import_job)

let make_list_address_list_import_jobs_response ?next_token:(next_token_ : pagination_token option)
    ~import_jobs:(import_jobs_ : import_jobs) () =
  ({ next_token = next_token_; import_jobs = import_jobs_ }
    : list_address_list_import_jobs_response)

let make_list_address_list_import_jobs_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ page_size = page_size_; next_token = next_token_; address_list_id = address_list_id_ }
    : list_address_list_import_jobs_request)

let make_get_member_of_address_list_response
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address:(address_ : address) () =
  ({ created_timestamp = created_timestamp_; address = address_ }
    : get_member_of_address_list_response)

let make_get_member_of_address_list_request ~address:(address_ : address)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address = address_; address_list_id = address_list_id_ } : get_member_of_address_list_request)

let make_get_archive_search_results_response ?rows:(rows_ : rows_list option) () =
  ({ rows = rows_ } : get_archive_search_results_response)

let make_get_archive_search_results_request ~search_id:(search_id_ : search_id) () =
  ({ search_id = search_id_ } : get_archive_search_results_request)

let make_get_archive_search_response ?status:(status_ : search_status option)
    ?max_results:(max_results_ : search_max_results option)
    ?to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?filters:(filters_ : archive_filters option) ?archive_id:(archive_id_ : archive_id option) () =
  ({
     status = status_;
     max_results = max_results_;
     to_timestamp = to_timestamp_;
     from_timestamp = from_timestamp_;
     filters = filters_;
     archive_id = archive_id_;
   }
    : get_archive_search_response)

let make_get_archive_search_request ~search_id:(search_id_ : search_id) () =
  ({ search_id = search_id_ } : get_archive_search_request)

let make_get_archive_message_content_response ?body:(body_ : message_body option) () =
  ({ body = body_ } : get_archive_message_content_response)

let make_get_archive_message_content_request
    ~archived_message_id:(archived_message_id_ : archived_message_id) () =
  ({ archived_message_id = archived_message_id_ } : get_archive_message_content_request)

let make_get_archive_message_response ?envelope:(envelope_ : envelope option)
    ?metadata:(metadata_ : metadata option)
    ?message_download_link:(message_download_link_ : s3_presigned_ur_l option) () =
  ({ envelope = envelope_; metadata = metadata_; message_download_link = message_download_link_ }
    : get_archive_message_response)

let make_get_archive_message_request
    ~archived_message_id:(archived_message_id_ : archived_message_id) () =
  ({ archived_message_id = archived_message_id_ } : get_archive_message_request)

let make_get_archive_export_response ?status:(status_ : export_status option)
    ?export_destination_configuration:
      (export_destination_configuration_ : export_destination_configuration option)
    ?max_results:(max_results_ : export_max_results option)
    ?to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?filters:(filters_ : archive_filters option) ?archive_id:(archive_id_ : archive_id option) () =
  ({
     status = status_;
     export_destination_configuration = export_destination_configuration_;
     max_results = max_results_;
     to_timestamp = to_timestamp_;
     from_timestamp = from_timestamp_;
     filters = filters_;
     archive_id = archive_id_;
   }
    : get_archive_export_response)

let make_get_archive_export_request ~export_id:(export_id_ : export_id) () =
  ({ export_id = export_id_ } : get_archive_export_request)

let make_get_address_list_import_job_response ?error:(error_ : error_message option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?failed_items_count:(failed_items_count_ : job_items_count option)
    ?imported_items_count:(imported_items_count_ : job_items_count option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address_list_id:(address_list_id_ : address_list_id)
    ~import_data_format:(import_data_format_ : import_data_format)
    ~pre_signed_url:(pre_signed_url_ : pre_signed_url) ~status:(status_ : import_job_status)
    ~name:(name_ : job_name) ~job_id:(job_id_ : job_id) () =
  ({
     error = error_;
     completed_timestamp = completed_timestamp_;
     start_timestamp = start_timestamp_;
     created_timestamp = created_timestamp_;
     address_list_id = address_list_id_;
     import_data_format = import_data_format_;
     failed_items_count = failed_items_count_;
     imported_items_count = imported_items_count_;
     pre_signed_url = pre_signed_url_;
     status = status_;
     name = name_;
     job_id = job_id_;
   }
    : get_address_list_import_job_response)

let make_get_address_list_import_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_address_list_import_job_request)

let make_deregister_member_from_address_list_response () = (() : unit)

let make_deregister_member_from_address_list_request ~address:(address_ : address)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address = address_; address_list_id = address_list_id_ }
    : deregister_member_from_address_list_request)

let make_create_address_list_import_job_response ~pre_signed_url:(pre_signed_url_ : pre_signed_url)
    ~job_id:(job_id_ : job_id) () =
  ({ pre_signed_url = pre_signed_url_; job_id = job_id_ } : create_address_list_import_job_response)

let make_create_address_list_import_job_request
    ?client_token:(client_token_ : idempotency_token option)
    ~import_data_format:(import_data_format_ : import_data_format) ~name:(name_ : job_name)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({
     import_data_format = import_data_format_;
     name = name_;
     address_list_id = address_list_id_;
     client_token = client_token_;
   }
    : create_address_list_import_job_request)

let make_list_traffic_policies_response ?next_token:(next_token_ : pagination_token option)
    ?traffic_policies:(traffic_policies_ : traffic_policy_list option) () =
  ({ next_token = next_token_; traffic_policies = traffic_policies_ }
    : list_traffic_policies_response)

let make_list_traffic_policies_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_traffic_policies_request)

let make_list_rule_sets_response ?next_token:(next_token_ : pagination_token option)
    ~rule_sets:(rule_sets_ : rule_sets) () =
  ({ next_token = next_token_; rule_sets = rule_sets_ } : list_rule_sets_response)

let make_list_rule_sets_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_rule_sets_request)

let make_list_relays_response ?next_token:(next_token_ : pagination_token option)
    ~relays:(relays_ : relays) () =
  ({ next_token = next_token_; relays = relays_ } : list_relays_response)

let make_list_relays_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_relays_request)

let make_ingress_point ?a_record:(a_record_ : ingress_point_a_record option)
    ~type_:(type__ : ingress_point_type) ~status:(status_ : ingress_point_status)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name) () =
  ({
     a_record = a_record_;
     type_ = type__;
     status = status_;
     ingress_point_id = ingress_point_id_;
     ingress_point_name = ingress_point_name_;
   }
    : ingress_point)

let make_list_ingress_points_response ?next_token:(next_token_ : pagination_token option)
    ?ingress_points:(ingress_points_ : ingress_points_list option) () =
  ({ next_token = next_token_; ingress_points = ingress_points_ } : list_ingress_points_response)

let make_list_ingress_points_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_ingress_points_request)

let make_archive
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?archive_state:(archive_state_ : archive_state option)
    ?archive_name:(archive_name_ : archive_name_string option)
    ~archive_id:(archive_id_ : archive_id_string) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     archive_state = archive_state_;
     archive_name = archive_name_;
     archive_id = archive_id_;
   }
    : archive)

let make_list_archives_response ?next_token:(next_token_ : pagination_token option)
    ~archives:(archives_ : archives_list) () =
  ({ next_token = next_token_; archives = archives_ } : list_archives_response)

let make_list_archives_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_archives_request)

let make_address_list
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address_list_name:(address_list_name_ : address_list_name)
    ~address_list_arn:(address_list_arn_ : address_list_arn)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     address_list_name = address_list_name_;
     address_list_arn = address_list_arn_;
     address_list_id = address_list_id_;
   }
    : address_list)

let make_list_address_lists_response ?next_token:(next_token_ : pagination_token option)
    ~address_lists:(address_lists_ : address_lists) () =
  ({ next_token = next_token_; address_lists = address_lists_ } : list_address_lists_response)

let make_list_address_lists_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_address_lists_request)

let make_addon_subscription
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?addon_subscription_arn:(addon_subscription_arn_ : addon_subscription_arn option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option) () =
  ({
     created_timestamp = created_timestamp_;
     addon_subscription_arn = addon_subscription_arn_;
     addon_name = addon_name_;
     addon_subscription_id = addon_subscription_id_;
   }
    : addon_subscription)

let make_list_addon_subscriptions_response ?next_token:(next_token_ : pagination_token option)
    ?addon_subscriptions:(addon_subscriptions_ : addon_subscriptions option) () =
  ({ next_token = next_token_; addon_subscriptions = addon_subscriptions_ }
    : list_addon_subscriptions_response)

let make_list_addon_subscriptions_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_addon_subscriptions_request)

let make_addon_instance
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?addon_instance_arn:(addon_instance_arn_ : addon_instance_arn option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option)
    ?addon_instance_id:(addon_instance_id_ : addon_instance_id option) () =
  ({
     created_timestamp = created_timestamp_;
     addon_instance_arn = addon_instance_arn_;
     addon_name = addon_name_;
     addon_subscription_id = addon_subscription_id_;
     addon_instance_id = addon_instance_id_;
   }
    : addon_instance)

let make_list_addon_instances_response ?next_token:(next_token_ : pagination_token option)
    ?addon_instances:(addon_instances_ : addon_instances option) () =
  ({ next_token = next_token_; addon_instances = addon_instances_ } : list_addon_instances_response)

let make_list_addon_instances_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_addon_instances_request)

let make_ingress_point_password_configuration
    ?previous_smtp_password_expiry_timestamp:
      (previous_smtp_password_expiry_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?previous_smtp_password_version:
      (previous_smtp_password_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?smtp_password_version:(smtp_password_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     previous_smtp_password_expiry_timestamp = previous_smtp_password_expiry_timestamp_;
     previous_smtp_password_version = previous_smtp_password_version_;
     smtp_password_version = smtp_password_version_;
   }
    : ingress_point_password_configuration)

let make_ingress_point_auth_configuration
    ?tls_auth_configuration:(tls_auth_configuration_ : tls_auth_configuration option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?ingress_point_password_configuration:
      (ingress_point_password_configuration_ : ingress_point_password_configuration option) () =
  ({
     tls_auth_configuration = tls_auth_configuration_;
     secret_arn = secret_arn_;
     ingress_point_password_configuration = ingress_point_password_configuration_;
   }
    : ingress_point_auth_configuration)

let make_get_traffic_policy_response
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?default_action:(default_action_ : accept_action option)
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ?policy_statements:(policy_statements_ : policy_statement_list option)
    ?traffic_policy_arn:(traffic_policy_arn_ : traffic_policy_arn option)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     default_action = default_action_;
     max_message_size_bytes = max_message_size_bytes_;
     policy_statements = policy_statements_;
     traffic_policy_arn = traffic_policy_arn_;
     traffic_policy_id = traffic_policy_id_;
     traffic_policy_name = traffic_policy_name_;
   }
    : get_traffic_policy_response)

let make_get_traffic_policy_request ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({ traffic_policy_id = traffic_policy_id_ } : get_traffic_policy_request)

let make_get_rule_set_response ~rules:(rules_ : rules)
    ~last_modification_date:(last_modification_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~rule_set_name:(rule_set_name_ : rule_set_name) ~rule_set_arn:(rule_set_arn_ : rule_set_arn)
    ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({
     rules = rules_;
     last_modification_date = last_modification_date_;
     created_date = created_date_;
     rule_set_name = rule_set_name_;
     rule_set_arn = rule_set_arn_;
     rule_set_id = rule_set_id_;
   }
    : get_rule_set_response)

let make_get_rule_set_request ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : get_rule_set_request)

let make_get_relay_response
    ?last_modified_timestamp:
      (last_modified_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?authentication:(authentication_ : relay_authentication option)
    ?server_port:(server_port_ : relay_server_port option)
    ?server_name:(server_name_ : relay_server_name option)
    ?relay_name:(relay_name_ : relay_name option) ?relay_arn:(relay_arn_ : relay_arn option)
    ~relay_id:(relay_id_ : relay_id) () =
  ({
     last_modified_timestamp = last_modified_timestamp_;
     created_timestamp = created_timestamp_;
     authentication = authentication_;
     server_port = server_port_;
     server_name = server_name_;
     relay_name = relay_name_;
     relay_arn = relay_arn_;
     relay_id = relay_id_;
   }
    : get_relay_response)

let make_get_relay_request ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : get_relay_request)

let make_get_ingress_point_response
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?tls_policy:(tls_policy_ : tls_policy option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?ingress_point_auth_configuration:
      (ingress_point_auth_configuration_ : ingress_point_auth_configuration option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?a_record:(a_record_ : ingress_point_a_record option)
    ?type_:(type__ : ingress_point_type option) ?status:(status_ : ingress_point_status option)
    ?ingress_point_arn:(ingress_point_arn_ : ingress_point_arn option)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     tls_policy = tls_policy_;
     network_configuration = network_configuration_;
     ingress_point_auth_configuration = ingress_point_auth_configuration_;
     traffic_policy_id = traffic_policy_id_;
     rule_set_id = rule_set_id_;
     a_record = a_record_;
     type_ = type__;
     status = status_;
     ingress_point_arn = ingress_point_arn_;
     ingress_point_name = ingress_point_name_;
     ingress_point_id = ingress_point_id_;
   }
    : get_ingress_point_response)

let make_get_ingress_point_request
    ?include_trust_store_contents:
      (include_trust_store_contents_ : trust_store_response_option option)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({
     include_trust_store_contents = include_trust_store_contents_;
     ingress_point_id = ingress_point_id_;
   }
    : get_ingress_point_request)

let make_get_archive_response ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~retention:(retention_ : archive_retention) ~archive_state:(archive_state_ : archive_state)
    ~archive_arn:(archive_arn_ : archive_arn) ~archive_name:(archive_name_ : archive_name_string)
    ~archive_id:(archive_id_ : archive_id_string) () =
  ({
     kms_key_arn = kms_key_arn_;
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     retention = retention_;
     archive_state = archive_state_;
     archive_arn = archive_arn_;
     archive_name = archive_name_;
     archive_id = archive_id_;
   }
    : get_archive_response)

let make_get_archive_request ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : get_archive_request)

let make_get_address_list_response
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~address_list_name:(address_list_name_ : address_list_name)
    ~address_list_arn:(address_list_arn_ : address_list_arn)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
     address_list_name = address_list_name_;
     address_list_arn = address_list_arn_;
     address_list_id = address_list_id_;
   }
    : get_address_list_response)

let make_get_address_list_request ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : get_address_list_request)

let make_get_addon_subscription_response
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?addon_subscription_arn:(addon_subscription_arn_ : addon_subscription_arn option)
    ?addon_name:(addon_name_ : addon_name option) () =
  ({
     created_timestamp = created_timestamp_;
     addon_subscription_arn = addon_subscription_arn_;
     addon_name = addon_name_;
   }
    : get_addon_subscription_response)

let make_get_addon_subscription_request
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : get_addon_subscription_request)

let make_get_addon_instance_response
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?addon_instance_arn:(addon_instance_arn_ : addon_instance_arn option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option) () =
  ({
     created_timestamp = created_timestamp_;
     addon_instance_arn = addon_instance_arn_;
     addon_name = addon_name_;
     addon_subscription_id = addon_subscription_id_;
   }
    : get_addon_instance_response)

let make_get_addon_instance_request ~addon_instance_id:(addon_instance_id_ : addon_instance_id) () =
  ({ addon_instance_id = addon_instance_id_ } : get_addon_instance_request)

let make_delete_traffic_policy_response () = (() : unit)

let make_delete_traffic_policy_request ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    () =
  ({ traffic_policy_id = traffic_policy_id_ } : delete_traffic_policy_request)

let make_delete_rule_set_response () = (() : unit)

let make_delete_rule_set_request ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : delete_rule_set_request)

let make_delete_relay_response () = (() : unit)

let make_delete_relay_request ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : delete_relay_request)

let make_delete_ingress_point_response () = (() : unit)

let make_delete_ingress_point_request ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({ ingress_point_id = ingress_point_id_ } : delete_ingress_point_request)

let make_delete_archive_response () = (() : unit)

let make_delete_archive_request ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : delete_archive_request)

let make_delete_address_list_response () = (() : unit)

let make_delete_address_list_request ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : delete_address_list_request)

let make_delete_addon_subscription_response () = (() : unit)

let make_delete_addon_subscription_request
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : delete_addon_subscription_request)

let make_delete_addon_instance_response () = (() : unit)

let make_delete_addon_instance_request ~addon_instance_id:(addon_instance_id_ : addon_instance_id)
    () =
  ({ addon_instance_id = addon_instance_id_ } : delete_addon_instance_request)

let make_create_traffic_policy_response ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    () =
  ({ traffic_policy_id = traffic_policy_id_ } : create_traffic_policy_response)

let make_create_traffic_policy_request ?tags:(tags_ : tag_list option)
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ?client_token:(client_token_ : idempotency_token option)
    ~default_action:(default_action_ : accept_action)
    ~policy_statements:(policy_statements_ : policy_statement_list)
    ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name) () =
  ({
     tags = tags_;
     max_message_size_bytes = max_message_size_bytes_;
     default_action = default_action_;
     policy_statements = policy_statements_;
     traffic_policy_name = traffic_policy_name_;
     client_token = client_token_;
   }
    : create_traffic_policy_request)

let make_create_rule_set_response ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : create_rule_set_response)

let make_create_rule_set_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : idempotency_token option) ~rules:(rules_ : rules)
    ~rule_set_name:(rule_set_name_ : rule_set_name) () =
  ({ tags = tags_; rules = rules_; rule_set_name = rule_set_name_; client_token = client_token_ }
    : create_rule_set_request)

let make_create_relay_response ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : create_relay_response)

let make_create_relay_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : idempotency_token option)
    ~authentication:(authentication_ : relay_authentication)
    ~server_port:(server_port_ : relay_server_port) ~server_name:(server_name_ : relay_server_name)
    ~relay_name:(relay_name_ : relay_name) () =
  ({
     tags = tags_;
     authentication = authentication_;
     server_port = server_port_;
     server_name = server_name_;
     relay_name = relay_name_;
     client_token = client_token_;
   }
    : create_relay_request)

let make_create_ingress_point_response ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({ ingress_point_id = ingress_point_id_ } : create_ingress_point_response)

let make_create_ingress_point_request ?tags:(tags_ : tag_list option)
    ?tls_policy:(tls_policy_ : tls_policy option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?ingress_point_configuration:(ingress_point_configuration_ : ingress_point_configuration option)
    ?client_token:(client_token_ : idempotency_token option)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    ~rule_set_id:(rule_set_id_ : rule_set_id) ~type_:(type__ : ingress_point_type)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name) () =
  ({
     tags = tags_;
     tls_policy = tls_policy_;
     network_configuration = network_configuration_;
     ingress_point_configuration = ingress_point_configuration_;
     traffic_policy_id = traffic_policy_id_;
     rule_set_id = rule_set_id_;
     type_ = type__;
     ingress_point_name = ingress_point_name_;
     client_token = client_token_;
   }
    : create_ingress_point_request)

let make_create_archive_response ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : create_archive_response)

let make_create_archive_request ?tags:(tags_ : tag_list option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?retention:(retention_ : archive_retention option)
    ?client_token:(client_token_ : idempotency_token option)
    ~archive_name:(archive_name_ : archive_name_string) () =
  ({
     tags = tags_;
     kms_key_arn = kms_key_arn_;
     retention = retention_;
     archive_name = archive_name_;
     client_token = client_token_;
   }
    : create_archive_request)

let make_create_address_list_response ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : create_address_list_response)

let make_create_address_list_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : idempotency_token option)
    ~address_list_name:(address_list_name_ : address_list_name) () =
  ({ tags = tags_; address_list_name = address_list_name_; client_token = client_token_ }
    : create_address_list_request)

let make_create_addon_subscription_response
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : create_addon_subscription_response)

let make_create_addon_subscription_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : idempotency_token option) ~addon_name:(addon_name_ : addon_name)
    () =
  ({ tags = tags_; addon_name = addon_name_; client_token = client_token_ }
    : create_addon_subscription_request)

let make_create_addon_instance_response ~addon_instance_id:(addon_instance_id_ : addon_instance_id)
    () =
  ({ addon_instance_id = addon_instance_id_ } : create_addon_instance_response)

let make_create_addon_instance_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : idempotency_token option)
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ tags = tags_; addon_subscription_id = addon_subscription_id_; client_token = client_token_ }
    : create_addon_instance_request)
