open Types

let make_add_header_action ~header_name:(header_name_ : header_name)
    ~header_value:(header_value_ : header_value) () =
  ({ header_name = header_name_; header_value = header_value_ } : add_header_action)

let make_addon_instance ?addon_instance_id:(addon_instance_id_ : addon_instance_id option)
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_instance_arn:(addon_instance_arn_ : addon_instance_arn option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     addon_instance_id = addon_instance_id_;
     addon_subscription_id = addon_subscription_id_;
     addon_name = addon_name_;
     addon_instance_arn = addon_instance_arn_;
     created_timestamp = created_timestamp_;
   }
    : addon_instance)

let make_addon_subscription
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_subscription_arn:(addon_subscription_arn_ : addon_subscription_arn option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     addon_subscription_id = addon_subscription_id_;
     addon_name = addon_name_;
     addon_subscription_arn = addon_subscription_arn_;
     created_timestamp = created_timestamp_;
   }
    : addon_subscription)

let make_address_filter ?address_prefix:(address_prefix_ : address_prefix option) () =
  ({ address_prefix = address_prefix_ } : address_filter)

let make_address_list ~address_list_id:(address_list_id_ : address_list_id)
    ~address_list_arn:(address_list_arn_ : address_list_arn)
    ~address_list_name:(address_list_name_ : address_list_name)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     address_list_id = address_list_id_;
     address_list_arn = address_list_arn_;
     address_list_name = address_list_name_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : address_list)

let make_analysis ~analyzer:(analyzer_ : analyzer_arn) ~result_field:(result_field_ : result_field)
    () =
  ({ analyzer = analyzer_; result_field = result_field_ } : analysis)

let make_archive ?archive_name:(archive_name_ : archive_name_string option)
    ?archive_state:(archive_state_ : archive_state option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~archive_id:(archive_id_ : archive_id_string) () =
  ({
     archive_id = archive_id_;
     archive_name = archive_name_;
     archive_state = archive_state_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : archive)

let make_archive_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~target_archive:(target_archive_ : name_or_arn) () =
  ({ action_failure_policy = action_failure_policy_; target_archive = target_archive_ }
    : archive_action)

let make_archive_boolean_expression ~evaluate:(evaluate_ : archive_boolean_to_evaluate)
    ~operator:(operator_ : archive_boolean_operator) () =
  ({ evaluate = evaluate_; operator = operator_ } : archive_boolean_expression)

let make_archive_string_expression ~evaluate:(evaluate_ : archive_string_to_evaluate)
    ~operator:(operator_ : archive_string_operator) ~values:(values_ : string_value_list) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : archive_string_expression)

let make_archive_filters ?include_:(include__ : archive_filter_conditions option)
    ?unless:(unless_ : archive_filter_conditions option) () =
  ({ include_ = include__; unless = unless_ } : archive_filters)

let make_bounce_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ?message:(message_ : bounce_message option) ~role_arn:(role_arn_ : iam_role_arn)
    ~sender:(sender_ : email_address) ~status_code:(status_code_ : status_code)
    ~smtp_reply_code:(smtp_reply_code_ : smtp_reply_code)
    ~diagnostic_message:(diagnostic_message_ : diagnostic_message) () =
  ({
     action_failure_policy = action_failure_policy_;
     role_arn = role_arn_;
     sender = sender_;
     status_code = status_code_;
     smtp_reply_code = smtp_reply_code_;
     diagnostic_message = diagnostic_message_;
     message = message_;
   }
    : bounce_action)

let make_create_addon_instance_response ~addon_instance_id:(addon_instance_id_ : addon_instance_id)
    () =
  ({ addon_instance_id = addon_instance_id_ } : create_addon_instance_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_addon_instance_request ?client_token:(client_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option)
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ client_token = client_token_; addon_subscription_id = addon_subscription_id_; tags = tags_ }
    : create_addon_instance_request)

let make_create_addon_subscription_response
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : create_addon_subscription_response)

let make_create_addon_subscription_request ?client_token:(client_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option) ~addon_name:(addon_name_ : addon_name) () =
  ({ client_token = client_token_; addon_name = addon_name_; tags = tags_ }
    : create_addon_subscription_request)

let make_create_address_list_response ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : create_address_list_response)

let make_create_address_list_request ?client_token:(client_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option) ~address_list_name:(address_list_name_ : address_list_name) () =
  ({ client_token = client_token_; address_list_name = address_list_name_; tags = tags_ }
    : create_address_list_request)

let make_create_address_list_import_job_response ~job_id:(job_id_ : job_id)
    ~pre_signed_url:(pre_signed_url_ : pre_signed_url) () =
  ({ job_id = job_id_; pre_signed_url = pre_signed_url_ } : create_address_list_import_job_response)

let make_import_data_format ~import_data_type:(import_data_type_ : import_data_type) () =
  ({ import_data_type = import_data_type_ } : import_data_format)

let make_create_address_list_import_job_request
    ?client_token:(client_token_ : idempotency_token option)
    ~address_list_id:(address_list_id_ : address_list_id) ~name:(name_ : job_name)
    ~import_data_format:(import_data_format_ : import_data_format) () =
  ({
     client_token = client_token_;
     address_list_id = address_list_id_;
     name = name_;
     import_data_format = import_data_format_;
   }
    : create_address_list_import_job_request)

let make_create_archive_response ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : create_archive_response)

let make_create_archive_request ?client_token:(client_token_ : idempotency_token option)
    ?retention:(retention_ : archive_retention option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?tags:(tags_ : tag_list option)
    ~archive_name:(archive_name_ : archive_name_string) () =
  ({
     client_token = client_token_;
     archive_name = archive_name_;
     retention = retention_;
     kms_key_arn = kms_key_arn_;
     tags = tags_;
   }
    : create_archive_request)

let make_create_ingress_point_response ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({ ingress_point_id = ingress_point_id_ } : create_ingress_point_response)

let make_private_network_configuration ~vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_ } : private_network_configuration)

let make_public_network_configuration ~ip_type:(ip_type_ : ip_type) () =
  ({ ip_type = ip_type_ } : public_network_configuration)

let make_trust_store ?crl_content:(crl_content_ : crl_content option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~ca_content:(ca_content_ : ca_content) () =
  ({ ca_content = ca_content_; crl_content = crl_content_; kms_key_arn = kms_key_arn_ }
    : trust_store)

let make_tls_auth_configuration ?trust_store:(trust_store_ : trust_store option) () =
  ({ trust_store = trust_store_ } : tls_auth_configuration)

let make_create_ingress_point_request ?client_token:(client_token_ : idempotency_token option)
    ?ingress_point_configuration:(ingress_point_configuration_ : ingress_point_configuration option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?tls_policy:(tls_policy_ : tls_policy option) ?tags:(tags_ : tag_list option)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name)
    ~type_:(type__ : ingress_point_type) ~rule_set_id:(rule_set_id_ : rule_set_id)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({
     client_token = client_token_;
     ingress_point_name = ingress_point_name_;
     type_ = type__;
     rule_set_id = rule_set_id_;
     traffic_policy_id = traffic_policy_id_;
     ingress_point_configuration = ingress_point_configuration_;
     network_configuration = network_configuration_;
     tls_policy = tls_policy_;
     tags = tags_;
   }
    : create_ingress_point_request)

let make_create_relay_response ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : create_relay_response)

let make_no_authentication () = (() : unit)

let make_create_relay_request ?client_token:(client_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option) ~relay_name:(relay_name_ : relay_name)
    ~server_name:(server_name_ : relay_server_name) ~server_port:(server_port_ : relay_server_port)
    ~authentication:(authentication_ : relay_authentication) () =
  ({
     client_token = client_token_;
     relay_name = relay_name_;
     server_name = server_name_;
     server_port = server_port_;
     authentication = authentication_;
     tags = tags_;
   }
    : create_relay_request)

let make_create_rule_set_response ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : create_rule_set_response)

let make_invoke_lambda_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ?retry_time_minutes:(retry_time_minutes_ : lambda_retry_time_minutes option)
    ~function_arn:(function_arn_ : lambda_function_arn)
    ~invocation_type:(invocation_type_ : lambda_invocation_type)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     action_failure_policy = action_failure_policy_;
     function_arn = function_arn_;
     invocation_type = invocation_type_;
     role_arn = role_arn_;
     retry_time_minutes = retry_time_minutes_;
   }
    : invoke_lambda_action)

let make_sns_action ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ?encoding:(encoding_ : sns_notification_encoding option)
    ?payload_type:(payload_type_ : sns_notification_payload_type option)
    ~topic_arn:(topic_arn_ : sns_topic_arn) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     action_failure_policy = action_failure_policy_;
     topic_arn = topic_arn_;
     role_arn = role_arn_;
     encoding = encoding_;
     payload_type = payload_type_;
   }
    : sns_action)

let make_deliver_to_q_business_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~application_id:(application_id_ : q_business_application_id)
    ~index_id:(index_id_ : q_business_index_id) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     action_failure_policy = action_failure_policy_;
     application_id = application_id_;
     index_id = index_id_;
     role_arn = role_arn_;
   }
    : deliver_to_q_business_action)

let make_deliver_to_mailbox_action
    ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~mailbox_arn:(mailbox_arn_ : name_or_arn) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     action_failure_policy = action_failure_policy_;
     mailbox_arn = mailbox_arn_;
     role_arn = role_arn_;
   }
    : deliver_to_mailbox_action)

let make_replace_recipient_action ?replace_with:(replace_with_ : recipients option) () =
  ({ replace_with = replace_with_ } : replace_recipient_action)

let make_send_action ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({ action_failure_policy = action_failure_policy_; role_arn = role_arn_ } : send_action)

let make_s3_action ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ?s3_prefix:(s3_prefix_ : s3_prefix option)
    ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : kms_key_id option) ~role_arn:(role_arn_ : iam_role_arn)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({
     action_failure_policy = action_failure_policy_;
     role_arn = role_arn_;
     s3_bucket = s3_bucket_;
     s3_prefix = s3_prefix_;
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
   }
    : s3_action)

let make_relay_action ?action_failure_policy:(action_failure_policy_ : action_failure_policy option)
    ?mail_from:(mail_from_ : mail_from option) ~relay:(relay_ : id_or_arn) () =
  ({ action_failure_policy = action_failure_policy_; relay = relay_; mail_from = mail_from_ }
    : relay_action)

let make_drop_action () = (() : unit)

let make_rule_dmarc_expression ~operator:(operator_ : rule_dmarc_operator)
    ~values:(values_ : rule_dmarc_value_list) () =
  ({ operator = operator_; values = values_ } : rule_dmarc_expression)

let make_rule_verdict_expression ~evaluate:(evaluate_ : rule_verdict_to_evaluate)
    ~operator:(operator_ : rule_verdict_operator) ~values:(values_ : rule_verdict_value_list) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : rule_verdict_expression)

let make_rule_ip_expression ~evaluate:(evaluate_ : rule_ip_to_evaluate)
    ~operator:(operator_ : rule_ip_operator) ~values:(values_ : rule_ip_value_list) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : rule_ip_expression)

let make_rule_number_expression ~evaluate:(evaluate_ : rule_number_to_evaluate)
    ~operator:(operator_ : rule_number_operator) ~value:(value_ : Smaws_Lib.Smithy_api.Types.double)
    () =
  ({ evaluate = evaluate_; operator = operator_; value = value_ } : rule_number_expression)

let make_rule_string_expression ~evaluate:(evaluate_ : rule_string_to_evaluate)
    ~operator:(operator_ : rule_string_operator) ~values:(values_ : rule_string_list) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : rule_string_expression)

let make_rule_is_in_address_list ~attribute:(attribute_ : rule_address_list_email_attribute)
    ~address_lists:(address_lists_ : rule_address_list_arn_list) () =
  ({ attribute = attribute_; address_lists = address_lists_ } : rule_is_in_address_list)

let make_rule_boolean_expression ~evaluate:(evaluate_ : rule_boolean_to_evaluate)
    ~operator:(operator_ : rule_boolean_operator) () =
  ({ evaluate = evaluate_; operator = operator_ } : rule_boolean_expression)

let make_rule ?name:(name_ : rule_name option) ?conditions:(conditions_ : rule_conditions option)
    ?unless:(unless_ : rule_conditions option) ~actions:(actions_ : rule_actions) () =
  ({ name = name_; conditions = conditions_; unless = unless_; actions = actions_ } : rule)

let make_create_rule_set_request ?client_token:(client_token_ : idempotency_token option)
    ?tags:(tags_ : tag_list option) ~rule_set_name:(rule_set_name_ : rule_set_name)
    ~rules:(rules_ : rules) () =
  ({ client_token = client_token_; rule_set_name = rule_set_name_; rules = rules_; tags = tags_ }
    : create_rule_set_request)

let make_create_traffic_policy_response ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    () =
  ({ traffic_policy_id = traffic_policy_id_ } : create_traffic_policy_response)

let make_ingress_is_in_address_list ~attribute:(attribute_ : ingress_address_list_email_attribute)
    ~address_lists:(address_lists_ : ingress_address_list_arn_list) () =
  ({ attribute = attribute_; address_lists = address_lists_ } : ingress_is_in_address_list)

let make_ingress_analysis ~analyzer:(analyzer_ : analyzer_arn)
    ~result_field:(result_field_ : result_field) () =
  ({ analyzer = analyzer_; result_field = result_field_ } : ingress_analysis)

let make_ingress_boolean_expression ~evaluate:(evaluate_ : ingress_boolean_to_evaluate)
    ~operator:(operator_ : ingress_boolean_operator) () =
  ({ evaluate = evaluate_; operator = operator_ } : ingress_boolean_expression)

let make_ingress_tls_protocol_expression ~evaluate:(evaluate_ : ingress_tls_protocol_to_evaluate)
    ~operator:(operator_ : ingress_tls_protocol_operator)
    ~value:(value_ : ingress_tls_protocol_attribute) () =
  ({ evaluate = evaluate_; operator = operator_; value = value_ } : ingress_tls_protocol_expression)

let make_ingress_ipv6_expression ~evaluate:(evaluate_ : ingress_ipv6_to_evaluate)
    ~operator:(operator_ : ingress_ip_operator) ~values:(values_ : ipv6_cidrs) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : ingress_ipv6_expression)

let make_ingress_ipv4_expression ~evaluate:(evaluate_ : ingress_ip_to_evaluate)
    ~operator:(operator_ : ingress_ip_operator) ~values:(values_ : ipv4_cidrs) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : ingress_ipv4_expression)

let make_ingress_string_expression ~evaluate:(evaluate_ : ingress_string_to_evaluate)
    ~operator:(operator_ : ingress_string_operator) ~values:(values_ : string_list) () =
  ({ evaluate = evaluate_; operator = operator_; values = values_ } : ingress_string_expression)

let make_policy_statement ~conditions:(conditions_ : policy_conditions)
    ~action:(action_ : accept_action) () =
  ({ conditions = conditions_; action = action_ } : policy_statement)

let make_create_traffic_policy_request ?client_token:(client_token_ : idempotency_token option)
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ?tags:(tags_ : tag_list option)
    ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name)
    ~policy_statements:(policy_statements_ : policy_statement_list)
    ~default_action:(default_action_ : accept_action) () =
  ({
     client_token = client_token_;
     traffic_policy_name = traffic_policy_name_;
     policy_statements = policy_statements_;
     default_action = default_action_;
     max_message_size_bytes = max_message_size_bytes_;
     tags = tags_;
   }
    : create_traffic_policy_request)

let make_delete_addon_instance_response () = (() : unit)

let make_delete_addon_instance_request ~addon_instance_id:(addon_instance_id_ : addon_instance_id)
    () =
  ({ addon_instance_id = addon_instance_id_ } : delete_addon_instance_request)

let make_delete_addon_subscription_response () = (() : unit)

let make_delete_addon_subscription_request
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : delete_addon_subscription_request)

let make_delete_address_list_response () = (() : unit)

let make_delete_address_list_request ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : delete_address_list_request)

let make_delete_archive_response () = (() : unit)

let make_delete_archive_request ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : delete_archive_request)

let make_delete_ingress_point_response () = (() : unit)

let make_delete_ingress_point_request ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({ ingress_point_id = ingress_point_id_ } : delete_ingress_point_request)

let make_delete_relay_response () = (() : unit)

let make_delete_relay_request ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : delete_relay_request)

let make_delete_rule_set_response () = (() : unit)

let make_delete_rule_set_request ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : delete_rule_set_request)

let make_delete_traffic_policy_response () = (() : unit)

let make_delete_traffic_policy_request ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    () =
  ({ traffic_policy_id = traffic_policy_id_ } : delete_traffic_policy_request)

let make_deregister_member_from_address_list_response () = (() : unit)

let make_deregister_member_from_address_list_request
    ~address_list_id:(address_list_id_ : address_list_id) ~address:(address_ : address) () =
  ({ address_list_id = address_list_id_; address = address_ }
    : deregister_member_from_address_list_request)

let make_envelope ?helo:(helo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?from_:(from__ : Smaws_Lib.Smithy_api.Types.string_ option) ?to_:(to__ : string_list option) ()
    =
  ({ helo = helo_; from_ = from__; to_ = to__ } : envelope)

let make_s3_export_destination_configuration ?s3_location:(s3_location_ : s3_location option) () =
  ({ s3_location = s3_location_ } : s3_export_destination_configuration)

let make_export_status
    ?submission_timestamp:(submission_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completion_timestamp:(completion_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?state:(state_ : export_state option) ?error_message:(error_message_ : error_message option) ()
    =
  ({
     submission_timestamp = submission_timestamp_;
     completion_timestamp = completion_timestamp_;
     state = state_;
     error_message = error_message_;
   }
    : export_status)

let make_export_summary ?export_id:(export_id_ : export_id option)
    ?status:(status_ : export_status option) () =
  ({ export_id = export_id_; status = status_ } : export_summary)

let make_get_addon_instance_response
    ?addon_subscription_id:(addon_subscription_id_ : addon_subscription_id option)
    ?addon_name:(addon_name_ : addon_name option)
    ?addon_instance_arn:(addon_instance_arn_ : addon_instance_arn option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     addon_subscription_id = addon_subscription_id_;
     addon_name = addon_name_;
     addon_instance_arn = addon_instance_arn_;
     created_timestamp = created_timestamp_;
   }
    : get_addon_instance_response)

let make_get_addon_instance_request ~addon_instance_id:(addon_instance_id_ : addon_instance_id) () =
  ({ addon_instance_id = addon_instance_id_ } : get_addon_instance_request)

let make_get_addon_subscription_response ?addon_name:(addon_name_ : addon_name option)
    ?addon_subscription_arn:(addon_subscription_arn_ : addon_subscription_arn option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     addon_name = addon_name_;
     addon_subscription_arn = addon_subscription_arn_;
     created_timestamp = created_timestamp_;
   }
    : get_addon_subscription_response)

let make_get_addon_subscription_request
    ~addon_subscription_id:(addon_subscription_id_ : addon_subscription_id) () =
  ({ addon_subscription_id = addon_subscription_id_ } : get_addon_subscription_request)

let make_get_address_list_response ~address_list_id:(address_list_id_ : address_list_id)
    ~address_list_arn:(address_list_arn_ : address_list_arn)
    ~address_list_name:(address_list_name_ : address_list_name)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     address_list_id = address_list_id_;
     address_list_arn = address_list_arn_;
     address_list_name = address_list_name_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : get_address_list_response)

let make_get_address_list_request ~address_list_id:(address_list_id_ : address_list_id) () =
  ({ address_list_id = address_list_id_ } : get_address_list_request)

let make_get_address_list_import_job_response
    ?imported_items_count:(imported_items_count_ : job_items_count option)
    ?failed_items_count:(failed_items_count_ : job_items_count option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?error:(error_ : error_message option) ~job_id:(job_id_ : job_id) ~name:(name_ : job_name)
    ~status:(status_ : import_job_status) ~pre_signed_url:(pre_signed_url_ : pre_signed_url)
    ~import_data_format:(import_data_format_ : import_data_format)
    ~address_list_id:(address_list_id_ : address_list_id)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     job_id = job_id_;
     name = name_;
     status = status_;
     pre_signed_url = pre_signed_url_;
     imported_items_count = imported_items_count_;
     failed_items_count = failed_items_count_;
     import_data_format = import_data_format_;
     address_list_id = address_list_id_;
     created_timestamp = created_timestamp_;
     start_timestamp = start_timestamp_;
     completed_timestamp = completed_timestamp_;
     error = error_;
   }
    : get_address_list_import_job_response)

let make_get_address_list_import_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_address_list_import_job_request)

let make_get_archive_response
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~archive_id:(archive_id_ : archive_id_string)
    ~archive_name:(archive_name_ : archive_name_string) ~archive_arn:(archive_arn_ : archive_arn)
    ~archive_state:(archive_state_ : archive_state) ~retention:(retention_ : archive_retention) () =
  ({
     archive_id = archive_id_;
     archive_name = archive_name_;
     archive_arn = archive_arn_;
     archive_state = archive_state_;
     retention = retention_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     kms_key_arn = kms_key_arn_;
   }
    : get_archive_response)

let make_get_archive_request ~archive_id:(archive_id_ : archive_id_string) () =
  ({ archive_id = archive_id_ } : get_archive_request)

let make_get_archive_export_response ?archive_id:(archive_id_ : archive_id option)
    ?filters:(filters_ : archive_filters option)
    ?from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?max_results:(max_results_ : export_max_results option)
    ?export_destination_configuration:
      (export_destination_configuration_ : export_destination_configuration option)
    ?status:(status_ : export_status option) () =
  ({
     archive_id = archive_id_;
     filters = filters_;
     from_timestamp = from_timestamp_;
     to_timestamp = to_timestamp_;
     max_results = max_results_;
     export_destination_configuration = export_destination_configuration_;
     status = status_;
   }
    : get_archive_export_response)

let make_get_archive_export_request ~export_id:(export_id_ : export_id) () =
  ({ export_id = export_id_ } : get_archive_export_request)

let make_metadata ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?ingress_point_id:(ingress_point_id_ : ingress_point_id option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?sender_hostname:(sender_hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sender_ip_address:(sender_ip_address_ : sender_ip_address option)
    ?tls_cipher_suite:(tls_cipher_suite_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tls_protocol:(tls_protocol_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sending_method:(sending_method_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_identity:(source_identity_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sending_pool:(sending_pool_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?configuration_set:(configuration_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_arn:(source_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     timestamp = timestamp_;
     ingress_point_id = ingress_point_id_;
     traffic_policy_id = traffic_policy_id_;
     rule_set_id = rule_set_id_;
     sender_hostname = sender_hostname_;
     sender_ip_address = sender_ip_address_;
     tls_cipher_suite = tls_cipher_suite_;
     tls_protocol = tls_protocol_;
     sending_method = sending_method_;
     source_identity = source_identity_;
     sending_pool = sending_pool_;
     configuration_set = configuration_set_;
     source_arn = source_arn_;
   }
    : metadata)

let make_get_archive_message_response
    ?message_download_link:(message_download_link_ : s3_presigned_ur_l option)
    ?metadata:(metadata_ : metadata option) ?envelope:(envelope_ : envelope option) () =
  ({ message_download_link = message_download_link_; metadata = metadata_; envelope = envelope_ }
    : get_archive_message_response)

let make_get_archive_message_request
    ~archived_message_id:(archived_message_id_ : archived_message_id) () =
  ({ archived_message_id = archived_message_id_ } : get_archive_message_request)

let make_message_body ?text:(text_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?html:(html_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message_malformed:(message_malformed_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({ text = text_; html = html_; message_malformed = message_malformed_ } : message_body)

let make_get_archive_message_content_response ?body:(body_ : message_body option) () =
  ({ body = body_ } : get_archive_message_content_response)

let make_get_archive_message_content_request
    ~archived_message_id:(archived_message_id_ : archived_message_id) () =
  ({ archived_message_id = archived_message_id_ } : get_archive_message_content_request)

let make_search_status
    ?submission_timestamp:(submission_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completion_timestamp:(completion_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?state:(state_ : search_state option) ?error_message:(error_message_ : error_message option) ()
    =
  ({
     submission_timestamp = submission_timestamp_;
     completion_timestamp = completion_timestamp_;
     state = state_;
     error_message = error_message_;
   }
    : search_status)

let make_get_archive_search_response ?archive_id:(archive_id_ : archive_id option)
    ?filters:(filters_ : archive_filters option)
    ?from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?max_results:(max_results_ : search_max_results option) ?status:(status_ : search_status option)
    () =
  ({
     archive_id = archive_id_;
     filters = filters_;
     from_timestamp = from_timestamp_;
     to_timestamp = to_timestamp_;
     max_results = max_results_;
     status = status_;
   }
    : get_archive_search_response)

let make_get_archive_search_request ~search_id:(search_id_ : search_id) () =
  ({ search_id = search_id_ } : get_archive_search_request)

let make_row ?archived_message_id:(archived_message_id_ : archived_message_id option)
    ?received_timestamp:(received_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date:(date_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?to_:(to__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?from_:(from__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cc:(cc_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subject:(subject_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message_id:(message_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?has_attachments:(has_attachments_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?received_headers:(received_headers_ : email_received_headers_list option)
    ?in_reply_to:(in_reply_to_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?x_mailer:(x_mailer_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?x_original_mailer:(x_original_mailer_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?x_priority:(x_priority_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ingress_point_id:(ingress_point_id_ : ingress_point_id option)
    ?sender_hostname:(sender_hostname_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sender_ip_address:(sender_ip_address_ : sender_ip_address option)
    ?envelope:(envelope_ : envelope option)
    ?source_arn:(source_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     archived_message_id = archived_message_id_;
     received_timestamp = received_timestamp_;
     date = date_;
     to_ = to__;
     from_ = from__;
     cc = cc_;
     subject = subject_;
     message_id = message_id_;
     has_attachments = has_attachments_;
     received_headers = received_headers_;
     in_reply_to = in_reply_to_;
     x_mailer = x_mailer_;
     x_original_mailer = x_original_mailer_;
     x_priority = x_priority_;
     ingress_point_id = ingress_point_id_;
     sender_hostname = sender_hostname_;
     sender_ip_address = sender_ip_address_;
     envelope = envelope_;
     source_arn = source_arn_;
   }
    : row)

let make_get_archive_search_results_response ?rows:(rows_ : rows_list option) () =
  ({ rows = rows_ } : get_archive_search_results_response)

let make_get_archive_search_results_request ~search_id:(search_id_ : search_id) () =
  ({ search_id = search_id_ } : get_archive_search_results_request)

let make_ingress_point_password_configuration
    ?smtp_password_version:(smtp_password_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?previous_smtp_password_version:
      (previous_smtp_password_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?previous_smtp_password_expiry_timestamp:
      (previous_smtp_password_expiry_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     smtp_password_version = smtp_password_version_;
     previous_smtp_password_version = previous_smtp_password_version_;
     previous_smtp_password_expiry_timestamp = previous_smtp_password_expiry_timestamp_;
   }
    : ingress_point_password_configuration)

let make_ingress_point_auth_configuration
    ?ingress_point_password_configuration:
      (ingress_point_password_configuration_ : ingress_point_password_configuration option)
    ?secret_arn:(secret_arn_ : secret_arn option)
    ?tls_auth_configuration:(tls_auth_configuration_ : tls_auth_configuration option) () =
  ({
     ingress_point_password_configuration = ingress_point_password_configuration_;
     secret_arn = secret_arn_;
     tls_auth_configuration = tls_auth_configuration_;
   }
    : ingress_point_auth_configuration)

let make_get_ingress_point_response
    ?ingress_point_arn:(ingress_point_arn_ : ingress_point_arn option)
    ?status:(status_ : ingress_point_status option) ?type_:(type__ : ingress_point_type option)
    ?a_record:(a_record_ : ingress_point_a_record option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?ingress_point_auth_configuration:
      (ingress_point_auth_configuration_ : ingress_point_auth_configuration option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?tls_policy:(tls_policy_ : tls_policy option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name) () =
  ({
     ingress_point_id = ingress_point_id_;
     ingress_point_name = ingress_point_name_;
     ingress_point_arn = ingress_point_arn_;
     status = status_;
     type_ = type__;
     a_record = a_record_;
     rule_set_id = rule_set_id_;
     traffic_policy_id = traffic_policy_id_;
     ingress_point_auth_configuration = ingress_point_auth_configuration_;
     network_configuration = network_configuration_;
     tls_policy = tls_policy_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : get_ingress_point_response)

let make_get_ingress_point_request
    ?include_trust_store_contents:
      (include_trust_store_contents_ : trust_store_response_option option)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({
     ingress_point_id = ingress_point_id_;
     include_trust_store_contents = include_trust_store_contents_;
   }
    : get_ingress_point_request)

let make_get_member_of_address_list_response ~address:(address_ : address)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ address = address_; created_timestamp = created_timestamp_ }
    : get_member_of_address_list_response)

let make_get_member_of_address_list_request ~address_list_id:(address_list_id_ : address_list_id)
    ~address:(address_ : address) () =
  ({ address_list_id = address_list_id_; address = address_ } : get_member_of_address_list_request)

let make_get_relay_response ?relay_arn:(relay_arn_ : relay_arn option)
    ?relay_name:(relay_name_ : relay_name option)
    ?server_name:(server_name_ : relay_server_name option)
    ?server_port:(server_port_ : relay_server_port option)
    ?authentication:(authentication_ : relay_authentication option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_modified_timestamp:
      (last_modified_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~relay_id:(relay_id_ : relay_id) () =
  ({
     relay_id = relay_id_;
     relay_arn = relay_arn_;
     relay_name = relay_name_;
     server_name = server_name_;
     server_port = server_port_;
     authentication = authentication_;
     created_timestamp = created_timestamp_;
     last_modified_timestamp = last_modified_timestamp_;
   }
    : get_relay_response)

let make_get_relay_request ~relay_id:(relay_id_ : relay_id) () =
  ({ relay_id = relay_id_ } : get_relay_request)

let make_get_rule_set_response ~rule_set_id:(rule_set_id_ : rule_set_id)
    ~rule_set_arn:(rule_set_arn_ : rule_set_arn) ~rule_set_name:(rule_set_name_ : rule_set_name)
    ~created_date:(created_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modification_date:(last_modification_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~rules:(rules_ : rules) () =
  ({
     rule_set_id = rule_set_id_;
     rule_set_arn = rule_set_arn_;
     rule_set_name = rule_set_name_;
     created_date = created_date_;
     last_modification_date = last_modification_date_;
     rules = rules_;
   }
    : get_rule_set_response)

let make_get_rule_set_request ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_ } : get_rule_set_request)

let make_get_traffic_policy_response
    ?traffic_policy_arn:(traffic_policy_arn_ : traffic_policy_arn option)
    ?policy_statements:(policy_statements_ : policy_statement_list option)
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ?default_action:(default_action_ : accept_action option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({
     traffic_policy_name = traffic_policy_name_;
     traffic_policy_id = traffic_policy_id_;
     traffic_policy_arn = traffic_policy_arn_;
     policy_statements = policy_statements_;
     max_message_size_bytes = max_message_size_bytes_;
     default_action = default_action_;
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
   }
    : get_traffic_policy_response)

let make_get_traffic_policy_request ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({ traffic_policy_id = traffic_policy_id_ } : get_traffic_policy_request)

let make_import_job ?imported_items_count:(imported_items_count_ : job_items_count option)
    ?failed_items_count:(failed_items_count_ : job_items_count option)
    ?start_timestamp:(start_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?completed_timestamp:(completed_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?error:(error_ : error_message option) ~job_id:(job_id_ : job_id) ~name:(name_ : job_name)
    ~status:(status_ : import_job_status) ~pre_signed_url:(pre_signed_url_ : pre_signed_url)
    ~import_data_format:(import_data_format_ : import_data_format)
    ~address_list_id:(address_list_id_ : address_list_id)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     job_id = job_id_;
     name = name_;
     status = status_;
     pre_signed_url = pre_signed_url_;
     imported_items_count = imported_items_count_;
     failed_items_count = failed_items_count_;
     import_data_format = import_data_format_;
     address_list_id = address_list_id_;
     created_timestamp = created_timestamp_;
     start_timestamp = start_timestamp_;
     completed_timestamp = completed_timestamp_;
     error = error_;
   }
    : import_job)

let make_ingress_point ?a_record:(a_record_ : ingress_point_a_record option)
    ~ingress_point_name:(ingress_point_name_ : ingress_point_name)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id)
    ~status:(status_ : ingress_point_status) ~type_:(type__ : ingress_point_type) () =
  ({
     ingress_point_name = ingress_point_name_;
     ingress_point_id = ingress_point_id_;
     status = status_;
     type_ = type__;
     a_record = a_record_;
   }
    : ingress_point)

let make_list_addon_instances_response ?addon_instances:(addon_instances_ : addon_instances option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ addon_instances = addon_instances_; next_token = next_token_ } : list_addon_instances_response)

let make_list_addon_instances_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_addon_instances_request)

let make_list_addon_subscriptions_response
    ?addon_subscriptions:(addon_subscriptions_ : addon_subscriptions option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ addon_subscriptions = addon_subscriptions_; next_token = next_token_ }
    : list_addon_subscriptions_response)

let make_list_addon_subscriptions_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_addon_subscriptions_request)

let make_list_address_list_import_jobs_response ?next_token:(next_token_ : pagination_token option)
    ~import_jobs:(import_jobs_ : import_jobs) () =
  ({ import_jobs = import_jobs_; next_token = next_token_ }
    : list_address_list_import_jobs_response)

let make_list_address_list_import_jobs_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) ~address_list_id:(address_list_id_ : address_list_id)
    () =
  ({ address_list_id = address_list_id_; next_token = next_token_; page_size = page_size_ }
    : list_address_list_import_jobs_request)

let make_list_address_lists_response ?next_token:(next_token_ : pagination_token option)
    ~address_lists:(address_lists_ : address_lists) () =
  ({ address_lists = address_lists_; next_token = next_token_ } : list_address_lists_response)

let make_list_address_lists_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_address_lists_request)

let make_list_archive_exports_response ?exports:(exports_ : export_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ exports = exports_; next_token = next_token_ } : list_archive_exports_response)

let make_list_archive_exports_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) ~archive_id:(archive_id_ : archive_id) () =
  ({ archive_id = archive_id_; next_token = next_token_; page_size = page_size_ }
    : list_archive_exports_request)

let make_search_summary ?search_id:(search_id_ : search_id option)
    ?status:(status_ : search_status option) () =
  ({ search_id = search_id_; status = status_ } : search_summary)

let make_list_archive_searches_response ?searches:(searches_ : search_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ searches = searches_; next_token = next_token_ } : list_archive_searches_response)

let make_list_archive_searches_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) ~archive_id:(archive_id_ : archive_id) () =
  ({ archive_id = archive_id_; next_token = next_token_; page_size = page_size_ }
    : list_archive_searches_request)

let make_list_archives_response ?next_token:(next_token_ : pagination_token option)
    ~archives:(archives_ : archives_list) () =
  ({ archives = archives_; next_token = next_token_ } : list_archives_response)

let make_list_archives_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_archives_request)

let make_list_ingress_points_response ?ingress_points:(ingress_points_ : ingress_points_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ ingress_points = ingress_points_; next_token = next_token_ } : list_ingress_points_response)

let make_list_ingress_points_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_ingress_points_request)

let make_saved_address ~address:(address_ : address)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ address = address_; created_timestamp = created_timestamp_ } : saved_address)

let make_list_members_of_address_list_response ?next_token:(next_token_ : pagination_token option)
    ~addresses:(addresses_ : saved_addresses) () =
  ({ addresses = addresses_; next_token = next_token_ } : list_members_of_address_list_response)

let make_list_members_of_address_list_request ?filter:(filter_ : address_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : address_page_size option)
    ~address_list_id:(address_list_id_ : address_list_id) () =
  ({
     address_list_id = address_list_id_;
     filter = filter_;
     next_token = next_token_;
     page_size = page_size_;
   }
    : list_members_of_address_list_request)

let make_relay ?relay_id:(relay_id_ : relay_id option) ?relay_name:(relay_name_ : relay_name option)
    ?last_modified_timestamp:
      (last_modified_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     relay_id = relay_id_;
     relay_name = relay_name_;
     last_modified_timestamp = last_modified_timestamp_;
   }
    : relay)

let make_list_relays_response ?next_token:(next_token_ : pagination_token option)
    ~relays:(relays_ : relays) () =
  ({ relays = relays_; next_token = next_token_ } : list_relays_response)

let make_list_relays_request ?page_size:(page_size_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_relays_request)

let make_rule_set ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?rule_set_name:(rule_set_name_ : rule_set_name option)
    ?last_modification_date:(last_modification_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    () =
  ({
     rule_set_id = rule_set_id_;
     rule_set_name = rule_set_name_;
     last_modification_date = last_modification_date_;
   }
    : rule_set)

let make_list_rule_sets_response ?next_token:(next_token_ : pagination_token option)
    ~rule_sets:(rule_sets_ : rule_sets) () =
  ({ rule_sets = rule_sets_; next_token = next_token_ } : list_rule_sets_response)

let make_list_rule_sets_request ?next_token:(next_token_ : pagination_token option)
    ?page_size:(page_size_ : page_size option) () =
  ({ next_token = next_token_; page_size = page_size_ } : list_rule_sets_request)

let make_list_tags_for_resource_response ~tags:(tags_ : tag_list) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_traffic_policy ~traffic_policy_name:(traffic_policy_name_ : traffic_policy_name)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id)
    ~default_action:(default_action_ : accept_action) () =
  ({
     traffic_policy_name = traffic_policy_name_;
     traffic_policy_id = traffic_policy_id_;
     default_action = default_action_;
   }
    : traffic_policy)

let make_list_traffic_policies_response
    ?traffic_policies:(traffic_policies_ : traffic_policy_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ traffic_policies = traffic_policies_; next_token = next_token_ }
    : list_traffic_policies_response)

let make_list_traffic_policies_request ?page_size:(page_size_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ page_size = page_size_; next_token = next_token_ } : list_traffic_policies_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

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

let make_start_archive_search_request ?filters:(filters_ : archive_filters option)
    ~archive_id:(archive_id_ : archive_id)
    ~from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~max_results:(max_results_ : search_max_results) () =
  ({
     archive_id = archive_id_;
     filters = filters_;
     from_timestamp = from_timestamp_;
     to_timestamp = to_timestamp_;
     max_results = max_results_;
   }
    : start_archive_search_request)

let make_start_archive_export_response ?export_id:(export_id_ : export_id option) () =
  ({ export_id = export_id_ } : start_archive_export_response)

let make_start_archive_export_request ?filters:(filters_ : archive_filters option)
    ?max_results:(max_results_ : export_max_results option)
    ?include_metadata:(include_metadata_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~archive_id:(archive_id_ : archive_id)
    ~from_timestamp:(from_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~to_timestamp:(to_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~export_destination_configuration:
      (export_destination_configuration_ : export_destination_configuration) () =
  ({
     archive_id = archive_id_;
     filters = filters_;
     from_timestamp = from_timestamp_;
     to_timestamp = to_timestamp_;
     max_results = max_results_;
     export_destination_configuration = export_destination_configuration_;
     include_metadata = include_metadata_;
   }
    : start_archive_export_request)

let make_start_address_list_import_job_response () = (() : unit)

let make_start_address_list_import_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : start_address_list_import_job_request)

let make_register_member_to_address_list_response () = (() : unit)

let make_register_member_to_address_list_request
    ~address_list_id:(address_list_id_ : address_list_id) ~address:(address_ : address) () =
  ({ address_list_id = address_list_id_; address = address_ }
    : register_member_to_address_list_request)

let make_update_archive_response () = (() : unit)

let make_update_archive_request ?archive_name:(archive_name_ : archive_name_string option)
    ?retention:(retention_ : archive_retention option) ~archive_id:(archive_id_ : archive_id_string)
    () =
  ({ archive_id = archive_id_; archive_name = archive_name_; retention = retention_ }
    : update_archive_request)

let make_update_ingress_point_response () = (() : unit)

let make_update_ingress_point_request
    ?ingress_point_name:(ingress_point_name_ : ingress_point_name option)
    ?status_to_update:(status_to_update_ : ingress_point_status_to_update option)
    ?rule_set_id:(rule_set_id_ : rule_set_id option)
    ?traffic_policy_id:(traffic_policy_id_ : traffic_policy_id option)
    ?ingress_point_configuration:(ingress_point_configuration_ : ingress_point_configuration option)
    ?tls_policy:(tls_policy_ : tls_policy option)
    ~ingress_point_id:(ingress_point_id_ : ingress_point_id) () =
  ({
     ingress_point_id = ingress_point_id_;
     ingress_point_name = ingress_point_name_;
     status_to_update = status_to_update_;
     rule_set_id = rule_set_id_;
     traffic_policy_id = traffic_policy_id_;
     ingress_point_configuration = ingress_point_configuration_;
     tls_policy = tls_policy_;
   }
    : update_ingress_point_request)

let make_update_relay_response () = (() : unit)

let make_update_relay_request ?relay_name:(relay_name_ : relay_name option)
    ?server_name:(server_name_ : relay_server_name option)
    ?server_port:(server_port_ : relay_server_port option)
    ?authentication:(authentication_ : relay_authentication option) ~relay_id:(relay_id_ : relay_id)
    () =
  ({
     relay_id = relay_id_;
     relay_name = relay_name_;
     server_name = server_name_;
     server_port = server_port_;
     authentication = authentication_;
   }
    : update_relay_request)

let make_update_rule_set_response () = (() : unit)

let make_update_rule_set_request ?rule_set_name:(rule_set_name_ : rule_set_name option)
    ?rules:(rules_ : rules option) ~rule_set_id:(rule_set_id_ : rule_set_id) () =
  ({ rule_set_id = rule_set_id_; rule_set_name = rule_set_name_; rules = rules_ }
    : update_rule_set_request)

let make_update_traffic_policy_response () = (() : unit)

let make_update_traffic_policy_request
    ?traffic_policy_name:(traffic_policy_name_ : traffic_policy_name option)
    ?policy_statements:(policy_statements_ : policy_statement_list option)
    ?default_action:(default_action_ : accept_action option)
    ?max_message_size_bytes:(max_message_size_bytes_ : max_message_size_bytes option)
    ~traffic_policy_id:(traffic_policy_id_ : traffic_policy_id) () =
  ({
     traffic_policy_id = traffic_policy_id_;
     traffic_policy_name = traffic_policy_name_;
     policy_statements = policy_statements_;
     default_action = default_action_;
     max_message_size_bytes = max_message_size_bytes_;
   }
    : update_traffic_policy_request)
