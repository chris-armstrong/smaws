(** MailManager client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_add_header_action :
  header_name:header_name -> header_value:header_value -> unit -> add_header_action

val make_addon_instance :
  ?addon_instance_id:addon_instance_id ->
  ?addon_subscription_id:addon_subscription_id ->
  ?addon_name:addon_name ->
  ?addon_instance_arn:addon_instance_arn ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  addon_instance

val make_addon_subscription :
  ?addon_subscription_id:addon_subscription_id ->
  ?addon_name:addon_name ->
  ?addon_subscription_arn:addon_subscription_arn ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  addon_subscription

val make_address_filter : ?address_prefix:address_prefix -> unit -> address_filter

val make_address_list :
  address_list_id:address_list_id ->
  address_list_arn:address_list_arn ->
  address_list_name:address_list_name ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  address_list

val make_analysis : analyzer:analyzer_arn -> result_field:result_field -> unit -> analysis

val make_archive :
  ?archive_name:archive_name_string ->
  ?archive_state:archive_state ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  archive_id:archive_id_string ->
  unit ->
  archive

val make_archive_action :
  ?action_failure_policy:action_failure_policy ->
  target_archive:name_or_arn ->
  unit ->
  archive_action

val make_archive_boolean_expression :
  evaluate:archive_boolean_to_evaluate ->
  operator:archive_boolean_operator ->
  unit ->
  archive_boolean_expression

val make_archive_string_expression :
  evaluate:archive_string_to_evaluate ->
  operator:archive_string_operator ->
  values:string_value_list ->
  unit ->
  archive_string_expression

val make_archive_filters :
  ?include_:archive_filter_conditions ->
  ?unless:archive_filter_conditions ->
  unit ->
  archive_filters

val make_bounce_action :
  ?action_failure_policy:action_failure_policy ->
  ?message:bounce_message ->
  role_arn:iam_role_arn ->
  sender:email_address ->
  status_code:status_code ->
  smtp_reply_code:smtp_reply_code ->
  diagnostic_message:diagnostic_message ->
  unit ->
  bounce_action

val make_create_addon_instance_response :
  addon_instance_id:addon_instance_id -> unit -> create_addon_instance_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_addon_instance_request :
  ?client_token:idempotency_token ->
  ?tags:tag_list ->
  addon_subscription_id:addon_subscription_id ->
  unit ->
  create_addon_instance_request

val make_create_addon_subscription_response :
  addon_subscription_id:addon_subscription_id -> unit -> create_addon_subscription_response

val make_create_addon_subscription_request :
  ?client_token:idempotency_token ->
  ?tags:tag_list ->
  addon_name:addon_name ->
  unit ->
  create_addon_subscription_request

val make_create_address_list_response :
  address_list_id:address_list_id -> unit -> create_address_list_response

val make_create_address_list_request :
  ?client_token:idempotency_token ->
  ?tags:tag_list ->
  address_list_name:address_list_name ->
  unit ->
  create_address_list_request

val make_create_address_list_import_job_response :
  job_id:job_id -> pre_signed_url:pre_signed_url -> unit -> create_address_list_import_job_response

val make_import_data_format : import_data_type:import_data_type -> unit -> import_data_format

val make_create_address_list_import_job_request :
  ?client_token:idempotency_token ->
  address_list_id:address_list_id ->
  name:job_name ->
  import_data_format:import_data_format ->
  unit ->
  create_address_list_import_job_request

val make_create_archive_response : archive_id:archive_id_string -> unit -> create_archive_response

val make_create_archive_request :
  ?client_token:idempotency_token ->
  ?retention:archive_retention ->
  ?kms_key_arn:kms_key_arn ->
  ?tags:tag_list ->
  archive_name:archive_name_string ->
  unit ->
  create_archive_request

val make_create_ingress_point_response :
  ingress_point_id:ingress_point_id -> unit -> create_ingress_point_response

val make_private_network_configuration :
  vpc_endpoint_id:vpc_endpoint_id -> unit -> private_network_configuration

val make_public_network_configuration : ip_type:ip_type -> unit -> public_network_configuration

val make_trust_store :
  ?crl_content:crl_content ->
  ?kms_key_arn:kms_key_arn ->
  ca_content:ca_content ->
  unit ->
  trust_store

val make_tls_auth_configuration : ?trust_store:trust_store -> unit -> tls_auth_configuration

val make_create_ingress_point_request :
  ?client_token:idempotency_token ->
  ?ingress_point_configuration:ingress_point_configuration ->
  ?network_configuration:network_configuration ->
  ?tls_policy:tls_policy ->
  ?tags:tag_list ->
  ingress_point_name:ingress_point_name ->
  type_:ingress_point_type ->
  rule_set_id:rule_set_id ->
  traffic_policy_id:traffic_policy_id ->
  unit ->
  create_ingress_point_request

val make_create_relay_response : relay_id:relay_id -> unit -> create_relay_response
val make_no_authentication : unit -> unit

val make_create_relay_request :
  ?client_token:idempotency_token ->
  ?tags:tag_list ->
  relay_name:relay_name ->
  server_name:relay_server_name ->
  server_port:relay_server_port ->
  authentication:relay_authentication ->
  unit ->
  create_relay_request

val make_create_rule_set_response : rule_set_id:rule_set_id -> unit -> create_rule_set_response

val make_invoke_lambda_action :
  ?action_failure_policy:action_failure_policy ->
  ?retry_time_minutes:lambda_retry_time_minutes ->
  function_arn:lambda_function_arn ->
  invocation_type:lambda_invocation_type ->
  role_arn:iam_role_arn ->
  unit ->
  invoke_lambda_action

val make_sns_action :
  ?action_failure_policy:action_failure_policy ->
  ?encoding:sns_notification_encoding ->
  ?payload_type:sns_notification_payload_type ->
  topic_arn:sns_topic_arn ->
  role_arn:iam_role_arn ->
  unit ->
  sns_action

val make_deliver_to_q_business_action :
  ?action_failure_policy:action_failure_policy ->
  application_id:q_business_application_id ->
  index_id:q_business_index_id ->
  role_arn:iam_role_arn ->
  unit ->
  deliver_to_q_business_action

val make_deliver_to_mailbox_action :
  ?action_failure_policy:action_failure_policy ->
  mailbox_arn:name_or_arn ->
  role_arn:iam_role_arn ->
  unit ->
  deliver_to_mailbox_action

val make_replace_recipient_action : ?replace_with:recipients -> unit -> replace_recipient_action

val make_send_action :
  ?action_failure_policy:action_failure_policy -> role_arn:iam_role_arn -> unit -> send_action

val make_s3_action :
  ?action_failure_policy:action_failure_policy ->
  ?s3_prefix:s3_prefix ->
  ?s3_sse_kms_key_id:kms_key_id ->
  role_arn:iam_role_arn ->
  s3_bucket:s3_bucket ->
  unit ->
  s3_action

val make_relay_action :
  ?action_failure_policy:action_failure_policy ->
  ?mail_from:mail_from ->
  relay:id_or_arn ->
  unit ->
  relay_action

val make_drop_action : unit -> unit

val make_rule_dmarc_expression :
  operator:rule_dmarc_operator -> values:rule_dmarc_value_list -> unit -> rule_dmarc_expression

val make_rule_verdict_expression :
  evaluate:rule_verdict_to_evaluate ->
  operator:rule_verdict_operator ->
  values:rule_verdict_value_list ->
  unit ->
  rule_verdict_expression

val make_rule_ip_expression :
  evaluate:rule_ip_to_evaluate ->
  operator:rule_ip_operator ->
  values:rule_ip_value_list ->
  unit ->
  rule_ip_expression

val make_rule_number_expression :
  evaluate:rule_number_to_evaluate ->
  operator:rule_number_operator ->
  value:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  rule_number_expression

val make_rule_string_expression :
  evaluate:rule_string_to_evaluate ->
  operator:rule_string_operator ->
  values:rule_string_list ->
  unit ->
  rule_string_expression

val make_rule_is_in_address_list :
  attribute:rule_address_list_email_attribute ->
  address_lists:rule_address_list_arn_list ->
  unit ->
  rule_is_in_address_list

val make_rule_boolean_expression :
  evaluate:rule_boolean_to_evaluate ->
  operator:rule_boolean_operator ->
  unit ->
  rule_boolean_expression

val make_rule :
  ?name:rule_name ->
  ?conditions:rule_conditions ->
  ?unless:rule_conditions ->
  actions:rule_actions ->
  unit ->
  rule

val make_create_rule_set_request :
  ?client_token:idempotency_token ->
  ?tags:tag_list ->
  rule_set_name:rule_set_name ->
  rules:rules ->
  unit ->
  create_rule_set_request

val make_create_traffic_policy_response :
  traffic_policy_id:traffic_policy_id -> unit -> create_traffic_policy_response

val make_ingress_is_in_address_list :
  attribute:ingress_address_list_email_attribute ->
  address_lists:ingress_address_list_arn_list ->
  unit ->
  ingress_is_in_address_list

val make_ingress_analysis :
  analyzer:analyzer_arn -> result_field:result_field -> unit -> ingress_analysis

val make_ingress_boolean_expression :
  evaluate:ingress_boolean_to_evaluate ->
  operator:ingress_boolean_operator ->
  unit ->
  ingress_boolean_expression

val make_ingress_tls_protocol_expression :
  evaluate:ingress_tls_protocol_to_evaluate ->
  operator:ingress_tls_protocol_operator ->
  value:ingress_tls_protocol_attribute ->
  unit ->
  ingress_tls_protocol_expression

val make_ingress_ipv6_expression :
  evaluate:ingress_ipv6_to_evaluate ->
  operator:ingress_ip_operator ->
  values:ipv6_cidrs ->
  unit ->
  ingress_ipv6_expression

val make_ingress_ipv4_expression :
  evaluate:ingress_ip_to_evaluate ->
  operator:ingress_ip_operator ->
  values:ipv4_cidrs ->
  unit ->
  ingress_ipv4_expression

val make_ingress_string_expression :
  evaluate:ingress_string_to_evaluate ->
  operator:ingress_string_operator ->
  values:string_list ->
  unit ->
  ingress_string_expression

val make_policy_statement :
  conditions:policy_conditions -> action:accept_action -> unit -> policy_statement

val make_create_traffic_policy_request :
  ?client_token:idempotency_token ->
  ?max_message_size_bytes:max_message_size_bytes ->
  ?tags:tag_list ->
  traffic_policy_name:traffic_policy_name ->
  policy_statements:policy_statement_list ->
  default_action:accept_action ->
  unit ->
  create_traffic_policy_request

val make_delete_addon_instance_response : unit -> unit

val make_delete_addon_instance_request :
  addon_instance_id:addon_instance_id -> unit -> delete_addon_instance_request

val make_delete_addon_subscription_response : unit -> unit

val make_delete_addon_subscription_request :
  addon_subscription_id:addon_subscription_id -> unit -> delete_addon_subscription_request

val make_delete_address_list_response : unit -> unit

val make_delete_address_list_request :
  address_list_id:address_list_id -> unit -> delete_address_list_request

val make_delete_archive_response : unit -> unit
val make_delete_archive_request : archive_id:archive_id_string -> unit -> delete_archive_request
val make_delete_ingress_point_response : unit -> unit

val make_delete_ingress_point_request :
  ingress_point_id:ingress_point_id -> unit -> delete_ingress_point_request

val make_delete_relay_response : unit -> unit
val make_delete_relay_request : relay_id:relay_id -> unit -> delete_relay_request
val make_delete_rule_set_response : unit -> unit
val make_delete_rule_set_request : rule_set_id:rule_set_id -> unit -> delete_rule_set_request
val make_delete_traffic_policy_response : unit -> unit

val make_delete_traffic_policy_request :
  traffic_policy_id:traffic_policy_id -> unit -> delete_traffic_policy_request

val make_deregister_member_from_address_list_response : unit -> unit

val make_deregister_member_from_address_list_request :
  address_list_id:address_list_id ->
  address:address ->
  unit ->
  deregister_member_from_address_list_request

val make_envelope :
  ?helo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?from_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?to_:string_list ->
  unit ->
  envelope

val make_s3_export_destination_configuration :
  ?s3_location:s3_location -> unit -> s3_export_destination_configuration

val make_export_status :
  ?submission_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completion_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?state:export_state ->
  ?error_message:error_message ->
  unit ->
  export_status

val make_export_summary : ?export_id:export_id -> ?status:export_status -> unit -> export_summary

val make_get_addon_instance_response :
  ?addon_subscription_id:addon_subscription_id ->
  ?addon_name:addon_name ->
  ?addon_instance_arn:addon_instance_arn ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_addon_instance_response

val make_get_addon_instance_request :
  addon_instance_id:addon_instance_id -> unit -> get_addon_instance_request

val make_get_addon_subscription_response :
  ?addon_name:addon_name ->
  ?addon_subscription_arn:addon_subscription_arn ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_addon_subscription_response

val make_get_addon_subscription_request :
  addon_subscription_id:addon_subscription_id -> unit -> get_addon_subscription_request

val make_get_address_list_response :
  address_list_id:address_list_id ->
  address_list_arn:address_list_arn ->
  address_list_name:address_list_name ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_address_list_response

val make_get_address_list_request :
  address_list_id:address_list_id -> unit -> get_address_list_request

val make_get_address_list_import_job_response :
  ?imported_items_count:job_items_count ->
  ?failed_items_count:job_items_count ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?error:error_message ->
  job_id:job_id ->
  name:job_name ->
  status:import_job_status ->
  pre_signed_url:pre_signed_url ->
  import_data_format:import_data_format ->
  address_list_id:address_list_id ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_address_list_import_job_response

val make_get_address_list_import_job_request :
  job_id:job_id -> unit -> get_address_list_import_job_request

val make_get_archive_response :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?kms_key_arn:kms_key_arn ->
  archive_id:archive_id_string ->
  archive_name:archive_name_string ->
  archive_arn:archive_arn ->
  archive_state:archive_state ->
  retention:archive_retention ->
  unit ->
  get_archive_response

val make_get_archive_request : archive_id:archive_id_string -> unit -> get_archive_request

val make_get_archive_export_response :
  ?archive_id:archive_id ->
  ?filters:archive_filters ->
  ?from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?max_results:export_max_results ->
  ?export_destination_configuration:export_destination_configuration ->
  ?status:export_status ->
  unit ->
  get_archive_export_response

val make_get_archive_export_request : export_id:export_id -> unit -> get_archive_export_request

val make_metadata :
  ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?ingress_point_id:ingress_point_id ->
  ?traffic_policy_id:traffic_policy_id ->
  ?rule_set_id:rule_set_id ->
  ?sender_hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sender_ip_address:sender_ip_address ->
  ?tls_cipher_suite:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tls_protocol:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sending_method:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_identity:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sending_pool:Smaws_Lib.Smithy_api.Types.string_ ->
  ?configuration_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  metadata

val make_get_archive_message_response :
  ?message_download_link:s3_presigned_ur_l ->
  ?metadata:metadata ->
  ?envelope:envelope ->
  unit ->
  get_archive_message_response

val make_get_archive_message_request :
  archived_message_id:archived_message_id -> unit -> get_archive_message_request

val make_message_body :
  ?text:Smaws_Lib.Smithy_api.Types.string_ ->
  ?html:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message_malformed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  message_body

val make_get_archive_message_content_response :
  ?body:message_body -> unit -> get_archive_message_content_response

val make_get_archive_message_content_request :
  archived_message_id:archived_message_id -> unit -> get_archive_message_content_request

val make_search_status :
  ?submission_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completion_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?state:search_state ->
  ?error_message:error_message ->
  unit ->
  search_status

val make_get_archive_search_response :
  ?archive_id:archive_id ->
  ?filters:archive_filters ->
  ?from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?max_results:search_max_results ->
  ?status:search_status ->
  unit ->
  get_archive_search_response

val make_get_archive_search_request : search_id:search_id -> unit -> get_archive_search_request

val make_row :
  ?archived_message_id:archived_message_id ->
  ?received_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?date:Smaws_Lib.Smithy_api.Types.string_ ->
  ?to_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?from_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cc:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subject:Smaws_Lib.Smithy_api.Types.string_ ->
  ?message_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?has_attachments:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?received_headers:email_received_headers_list ->
  ?in_reply_to:Smaws_Lib.Smithy_api.Types.string_ ->
  ?x_mailer:Smaws_Lib.Smithy_api.Types.string_ ->
  ?x_original_mailer:Smaws_Lib.Smithy_api.Types.string_ ->
  ?x_priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ingress_point_id:ingress_point_id ->
  ?sender_hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sender_ip_address:sender_ip_address ->
  ?envelope:envelope ->
  ?source_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  row

val make_get_archive_search_results_response :
  ?rows:rows_list -> unit -> get_archive_search_results_response

val make_get_archive_search_results_request :
  search_id:search_id -> unit -> get_archive_search_results_request

val make_ingress_point_password_configuration :
  ?smtp_password_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?previous_smtp_password_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?previous_smtp_password_expiry_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  ingress_point_password_configuration

val make_ingress_point_auth_configuration :
  ?ingress_point_password_configuration:ingress_point_password_configuration ->
  ?secret_arn:secret_arn ->
  ?tls_auth_configuration:tls_auth_configuration ->
  unit ->
  ingress_point_auth_configuration

val make_get_ingress_point_response :
  ?ingress_point_arn:ingress_point_arn ->
  ?status:ingress_point_status ->
  ?type_:ingress_point_type ->
  ?a_record:ingress_point_a_record ->
  ?rule_set_id:rule_set_id ->
  ?traffic_policy_id:traffic_policy_id ->
  ?ingress_point_auth_configuration:ingress_point_auth_configuration ->
  ?network_configuration:network_configuration ->
  ?tls_policy:tls_policy ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ingress_point_id:ingress_point_id ->
  ingress_point_name:ingress_point_name ->
  unit ->
  get_ingress_point_response

val make_get_ingress_point_request :
  ?include_trust_store_contents:trust_store_response_option ->
  ingress_point_id:ingress_point_id ->
  unit ->
  get_ingress_point_request

val make_get_member_of_address_list_response :
  address:address ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_member_of_address_list_response

val make_get_member_of_address_list_request :
  address_list_id:address_list_id -> address:address -> unit -> get_member_of_address_list_request

val make_get_relay_response :
  ?relay_arn:relay_arn ->
  ?relay_name:relay_name ->
  ?server_name:relay_server_name ->
  ?server_port:relay_server_port ->
  ?authentication:relay_authentication ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_modified_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  relay_id:relay_id ->
  unit ->
  get_relay_response

val make_get_relay_request : relay_id:relay_id -> unit -> get_relay_request

val make_get_rule_set_response :
  rule_set_id:rule_set_id ->
  rule_set_arn:rule_set_arn ->
  rule_set_name:rule_set_name ->
  created_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  last_modification_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  rules:rules ->
  unit ->
  get_rule_set_response

val make_get_rule_set_request : rule_set_id:rule_set_id -> unit -> get_rule_set_request

val make_get_traffic_policy_response :
  ?traffic_policy_arn:traffic_policy_arn ->
  ?policy_statements:policy_statement_list ->
  ?max_message_size_bytes:max_message_size_bytes ->
  ?default_action:accept_action ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  traffic_policy_name:traffic_policy_name ->
  traffic_policy_id:traffic_policy_id ->
  unit ->
  get_traffic_policy_response

val make_get_traffic_policy_request :
  traffic_policy_id:traffic_policy_id -> unit -> get_traffic_policy_request

val make_import_job :
  ?imported_items_count:job_items_count ->
  ?failed_items_count:job_items_count ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?error:error_message ->
  job_id:job_id ->
  name:job_name ->
  status:import_job_status ->
  pre_signed_url:pre_signed_url ->
  import_data_format:import_data_format ->
  address_list_id:address_list_id ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  import_job

val make_ingress_point :
  ?a_record:ingress_point_a_record ->
  ingress_point_name:ingress_point_name ->
  ingress_point_id:ingress_point_id ->
  status:ingress_point_status ->
  type_:ingress_point_type ->
  unit ->
  ingress_point

val make_list_addon_instances_response :
  ?addon_instances:addon_instances ->
  ?next_token:pagination_token ->
  unit ->
  list_addon_instances_response

val make_list_addon_instances_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_addon_instances_request

val make_list_addon_subscriptions_response :
  ?addon_subscriptions:addon_subscriptions ->
  ?next_token:pagination_token ->
  unit ->
  list_addon_subscriptions_response

val make_list_addon_subscriptions_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_addon_subscriptions_request

val make_list_address_list_import_jobs_response :
  ?next_token:pagination_token ->
  import_jobs:import_jobs ->
  unit ->
  list_address_list_import_jobs_response

val make_list_address_list_import_jobs_request :
  ?next_token:pagination_token ->
  ?page_size:page_size ->
  address_list_id:address_list_id ->
  unit ->
  list_address_list_import_jobs_request

val make_list_address_lists_response :
  ?next_token:pagination_token -> address_lists:address_lists -> unit -> list_address_lists_response

val make_list_address_lists_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_address_lists_request

val make_list_archive_exports_response :
  ?exports:export_summary_list ->
  ?next_token:pagination_token ->
  unit ->
  list_archive_exports_response

val make_list_archive_exports_request :
  ?next_token:pagination_token ->
  ?page_size:page_size ->
  archive_id:archive_id ->
  unit ->
  list_archive_exports_request

val make_search_summary : ?search_id:search_id -> ?status:search_status -> unit -> search_summary

val make_list_archive_searches_response :
  ?searches:search_summary_list ->
  ?next_token:pagination_token ->
  unit ->
  list_archive_searches_response

val make_list_archive_searches_request :
  ?next_token:pagination_token ->
  ?page_size:page_size ->
  archive_id:archive_id ->
  unit ->
  list_archive_searches_request

val make_list_archives_response :
  ?next_token:pagination_token -> archives:archives_list -> unit -> list_archives_response

val make_list_archives_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_archives_request

val make_list_ingress_points_response :
  ?ingress_points:ingress_points_list ->
  ?next_token:pagination_token ->
  unit ->
  list_ingress_points_response

val make_list_ingress_points_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_ingress_points_request

val make_saved_address :
  address:address -> created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp -> unit -> saved_address

val make_list_members_of_address_list_response :
  ?next_token:pagination_token ->
  addresses:saved_addresses ->
  unit ->
  list_members_of_address_list_response

val make_list_members_of_address_list_request :
  ?filter:address_filter ->
  ?next_token:pagination_token ->
  ?page_size:address_page_size ->
  address_list_id:address_list_id ->
  unit ->
  list_members_of_address_list_request

val make_relay :
  ?relay_id:relay_id ->
  ?relay_name:relay_name ->
  ?last_modified_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  relay

val make_list_relays_response :
  ?next_token:pagination_token -> relays:relays -> unit -> list_relays_response

val make_list_relays_request :
  ?page_size:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:pagination_token ->
  unit ->
  list_relays_request

val make_rule_set :
  ?rule_set_id:rule_set_id ->
  ?rule_set_name:rule_set_name ->
  ?last_modification_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  rule_set

val make_list_rule_sets_response :
  ?next_token:pagination_token -> rule_sets:rule_sets -> unit -> list_rule_sets_response

val make_list_rule_sets_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_rule_sets_request

val make_list_tags_for_resource_response : tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_traffic_policy :
  traffic_policy_name:traffic_policy_name ->
  traffic_policy_id:traffic_policy_id ->
  default_action:accept_action ->
  unit ->
  traffic_policy

val make_list_traffic_policies_response :
  ?traffic_policies:traffic_policy_list ->
  ?next_token:pagination_token ->
  unit ->
  list_traffic_policies_response

val make_list_traffic_policies_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_traffic_policies_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:taggable_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:taggable_resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_stop_archive_search_response : unit -> unit
val make_stop_archive_search_request : search_id:search_id -> unit -> stop_archive_search_request
val make_stop_archive_export_response : unit -> unit
val make_stop_archive_export_request : export_id:export_id -> unit -> stop_archive_export_request
val make_stop_address_list_import_job_response : unit -> unit

val make_stop_address_list_import_job_request :
  job_id:job_id -> unit -> stop_address_list_import_job_request

val make_start_archive_search_response :
  ?search_id:search_id -> unit -> start_archive_search_response

val make_start_archive_search_request :
  ?filters:archive_filters ->
  archive_id:archive_id ->
  from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  max_results:search_max_results ->
  unit ->
  start_archive_search_request

val make_start_archive_export_response :
  ?export_id:export_id -> unit -> start_archive_export_response

val make_start_archive_export_request :
  ?filters:archive_filters ->
  ?max_results:export_max_results ->
  ?include_metadata:Smaws_Lib.Smithy_api.Types.boolean_ ->
  archive_id:archive_id ->
  from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  export_destination_configuration:export_destination_configuration ->
  unit ->
  start_archive_export_request

val make_start_address_list_import_job_response : unit -> unit

val make_start_address_list_import_job_request :
  job_id:job_id -> unit -> start_address_list_import_job_request

val make_register_member_to_address_list_response : unit -> unit

val make_register_member_to_address_list_request :
  address_list_id:address_list_id ->
  address:address ->
  unit ->
  register_member_to_address_list_request

val make_update_archive_response : unit -> unit

val make_update_archive_request :
  ?archive_name:archive_name_string ->
  ?retention:archive_retention ->
  archive_id:archive_id_string ->
  unit ->
  update_archive_request

val make_update_ingress_point_response : unit -> unit

val make_update_ingress_point_request :
  ?ingress_point_name:ingress_point_name ->
  ?status_to_update:ingress_point_status_to_update ->
  ?rule_set_id:rule_set_id ->
  ?traffic_policy_id:traffic_policy_id ->
  ?ingress_point_configuration:ingress_point_configuration ->
  ?tls_policy:tls_policy ->
  ingress_point_id:ingress_point_id ->
  unit ->
  update_ingress_point_request

val make_update_relay_response : unit -> unit

val make_update_relay_request :
  ?relay_name:relay_name ->
  ?server_name:relay_server_name ->
  ?server_port:relay_server_port ->
  ?authentication:relay_authentication ->
  relay_id:relay_id ->
  unit ->
  update_relay_request

val make_update_rule_set_response : unit -> unit

val make_update_rule_set_request :
  ?rule_set_name:rule_set_name ->
  ?rules:rules ->
  rule_set_id:rule_set_id ->
  unit ->
  update_rule_set_request

val make_update_traffic_policy_response : unit -> unit

val make_update_traffic_policy_request :
  ?traffic_policy_name:traffic_policy_name ->
  ?policy_statements:policy_statement_list ->
  ?default_action:accept_action ->
  ?max_message_size_bytes:max_message_size_bytes ->
  traffic_policy_id:traffic_policy_id ->
  unit ->
  update_traffic_policy_request
(** {1:operations Operations} *)

module UpdateTrafficPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_traffic_policy_request ->
    ( update_traffic_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_traffic_policy_request ->
    ( update_traffic_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update attributes of an already provisioned traffic policy resource.\n"]

module UpdateRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_rule_set_request ->
    ( update_rule_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_rule_set_request ->
    ( update_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update attributes of an already provisioned rule set.\n"]

module UpdateRelay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_relay_request ->
    ( update_relay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_relay_request ->
    ( update_relay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the attributes of an existing relay resource.\n"]

module UpdateIngressPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ingress_point_request ->
    ( update_ingress_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ingress_point_request ->
    ( update_ingress_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update attributes of a provisioned ingress endpoint resource.\n"]

module UpdateArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_archive_request ->
    ( update_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_archive_request ->
    ( update_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the attributes of an existing email archive.\n"]

module RegisterMemberToAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_member_to_address_list_request ->
    ( register_member_to_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_member_to_address_list_request ->
    ( register_member_to_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a member to an address list.\n"]

module StartAddressListImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_address_list_import_job_request ->
    ( start_address_list_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_address_list_import_job_request ->
    ( start_address_list_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts an import job for an address list.\n"]

module StartArchiveExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_archive_export_request ->
    ( start_archive_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_archive_export_request ->
    ( start_archive_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initiates an export of emails from the specified archive.\n"]

module StartArchiveSearch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_archive_search_request ->
    ( start_archive_search_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_archive_search_request ->
    ( start_archive_search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initiates a search across emails in the specified archive.\n"]

module StopAddressListImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_address_list_import_job_request ->
    ( stop_address_list_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_address_list_import_job_request ->
    ( stop_address_list_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an ongoing import job for an address list.\n"]

module StopArchiveExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_archive_export_request ->
    ( stop_archive_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_archive_export_request ->
    ( stop_archive_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an in-progress export of emails from an archive.\n"]

module StopArchiveSearch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_archive_search_request ->
    ( stop_archive_search_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_archive_search_request ->
    ( stop_archive_search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an in-progress archive search job.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Adds one or more tags (keys and values) to a specified resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Remove one or more tags (keys and values) from a specified resource. \n"]

module ListTrafficPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_traffic_policies_request ->
    ( list_traffic_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_traffic_policies_request ->
    ( list_traffic_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List traffic policy resources.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves the list of tags (keys and values) assigned to the resource. \n"]

module ListRuleSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_sets_request ->
    ( list_rule_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_sets_request ->
    ( list_rule_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List rule sets for this account.\n"]

module ListRelays : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_relays_request ->
    ( list_relays_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_relays_request ->
    ( list_relays_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the existing relay resources.\n"]

module ListMembersOfAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_members_of_address_list_request ->
    ( list_members_of_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_members_of_address_list_request ->
    ( list_members_of_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists members of an address list.\n"]

module ListIngressPoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ingress_points_request ->
    ( list_ingress_points_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ingress_points_request ->
    ( list_ingress_points_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all ingress endpoint resources.\n"]

module ListArchives : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_archives_request ->
    ( list_archives_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_archives_request ->
    ( list_archives_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all email archives in your account.\n"]

module ListArchiveSearches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_archive_searches_request ->
    ( list_archive_searches_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_archive_searches_request ->
    ( list_archive_searches_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of email archive search jobs.\n"]

module ListArchiveExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_archive_exports_request ->
    ( list_archive_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_archive_exports_request ->
    ( list_archive_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of email archive export jobs.\n"]

module ListAddressLists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_address_lists_request ->
    ( list_address_lists_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_address_lists_request ->
    ( list_address_lists_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists address lists for this account.\n"]

module ListAddressListImportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_address_list_import_jobs_request ->
    ( list_address_list_import_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_address_list_import_jobs_request ->
    ( list_address_list_import_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists jobs for an address list.\n"]

module ListAddonSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_addon_subscriptions_request ->
    ( list_addon_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_addon_subscriptions_request ->
    ( list_addon_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all Add On subscriptions in your account.\n"]

module ListAddonInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_addon_instances_request ->
    ( list_addon_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_addon_instances_request ->
    ( list_addon_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all Add On instances in your account.\n"]

module GetTrafficPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_traffic_policy_request ->
    ( get_traffic_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_traffic_policy_request ->
    ( get_traffic_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch attributes of a traffic policy resource.\n"]

module GetRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rule_set_request ->
    ( get_rule_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rule_set_request ->
    ( get_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch attributes of a rule set.\n"]

module GetRelay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_relay_request ->
    ( get_relay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_relay_request ->
    ( get_relay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch the relay resource and it's attributes.\n"]

module GetMemberOfAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_member_of_address_list_request ->
    ( get_member_of_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_member_of_address_list_request ->
    ( get_member_of_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch attributes of a member in an address list.\n"]

module GetIngressPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ingress_point_request ->
    ( get_ingress_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ingress_point_request ->
    ( get_ingress_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch ingress endpoint resource attributes.\n"]

module GetArchiveSearchResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_search_results_request ->
    ( get_archive_search_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_search_results_request ->
    ( get_archive_search_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the results of a completed email archive search job.\n"]

module GetArchiveSearch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_search_request ->
    ( get_archive_search_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_search_request ->
    ( get_archive_search_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details and current status of a specific email archive search job.\n"]

module GetArchiveMessageContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_message_content_request ->
    ( get_archive_message_content_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_message_content_request ->
    ( get_archive_message_content_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the textual content of a specific email message stored in the archive. Attachments are \
   not included. \n"]

module GetArchiveMessage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_message_request ->
    ( get_archive_message_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_message_request ->
    ( get_archive_message_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a pre-signed URL that provides temporary download access to the specific email message \
   stored in the archive. \n"]

module GetArchiveExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_export_request ->
    ( get_archive_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_export_request ->
    ( get_archive_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details and current status of a specific email archive export job.\n"]

module GetArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_archive_request ->
    ( get_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_archive_request ->
    ( get_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the full details and current state of a specified email archive.\n"]

module GetAddressListImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_address_list_import_job_request ->
    ( get_address_list_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_address_list_import_job_request ->
    ( get_address_list_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch attributes of an import job.\n"]

module GetAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_address_list_request ->
    ( get_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_address_list_request ->
    ( get_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetch attributes of an address list.\n"]

module GetAddonSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_addon_subscription_request ->
    ( get_addon_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_addon_subscription_request ->
    ( get_addon_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about an Add On subscription.\n"]

module GetAddonInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_addon_instance_request ->
    ( get_addon_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_addon_instance_request ->
    ( get_addon_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about an Add On instance.\n"]

module DeregisterMemberFromAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_member_from_address_list_request ->
    ( deregister_member_from_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_member_from_address_list_request ->
    ( deregister_member_from_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a member from an address list.\n"]

module DeleteTrafficPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_traffic_policy_request ->
    ( delete_traffic_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_traffic_policy_request ->
    ( delete_traffic_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a traffic policy resource.\n"]

module DeleteRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_set_request ->
    ( delete_rule_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_set_request ->
    ( delete_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete a rule set.\n"]

module DeleteRelay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_relay_request ->
    ( delete_relay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_relay_request ->
    ( delete_relay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing relay resource.\n"]

module DeleteIngressPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ingress_point_request ->
    ( delete_ingress_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ingress_point_request ->
    ( delete_ingress_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete an ingress endpoint resource.\n"]

module DeleteArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_archive_request ->
    ( delete_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_archive_request ->
    ( delete_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates deletion of an email archive. This changes the archive state to pending deletion. In \
   this state, no new emails can be added, and existing archived emails become inaccessible \
   (search, export, download). The archive and all of its contents will be permanently deleted 30 \
   days after entering the pending deletion state, regardless of the configured retention period. \n"]

module DeleteAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_address_list_request ->
    ( delete_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_address_list_request ->
    ( delete_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an address list.\n"]

module DeleteAddonSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_addon_subscription_request ->
    ( delete_addon_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_addon_subscription_request ->
    ( delete_addon_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Add On subscription.\n"]

module DeleteAddonInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_addon_instance_request ->
    ( delete_addon_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_addon_instance_request ->
    ( delete_addon_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Add On instance.\n"]

module CreateTrafficPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_traffic_policy_request ->
    ( create_traffic_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_traffic_policy_request ->
    ( create_traffic_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provision a new traffic policy resource.\n"]

module CreateRuleSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_set_request ->
    ( create_rule_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_set_request ->
    ( create_rule_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provision a new rule set.\n"]

module CreateRelay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_relay_request ->
    ( create_relay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_relay_request ->
    ( create_relay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a relay resource which can be used in rules to relay incoming emails to defined relay \
   destinations. \n"]

module CreateIngressPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ingress_point_request ->
    ( create_ingress_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ingress_point_request ->
    ( create_ingress_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provision a new ingress endpoint resource.\n"]

module CreateArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_archive_request ->
    ( create_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_archive_request ->
    ( create_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new email archive resource for storing and retaining emails.\n"]

module CreateAddressListImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_address_list_import_job_request ->
    ( create_address_list_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_address_list_import_job_request ->
    ( create_address_list_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an import job for an address list.\n"]

module CreateAddressList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_address_list_request ->
    ( create_address_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_address_list_request ->
    ( create_address_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new address list.\n"]

module CreateAddonSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_addon_subscription_request ->
    ( create_addon_subscription_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_addon_subscription_request ->
    ( create_addon_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a subscription for an Add On representing the acceptance of its terms of use and \
   additional pricing. The subscription can then be used to create an instance for use in rule \
   sets or traffic policies.\n"]

(** {1:Serialization and Deserialization} *)
module CreateAddonInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_addon_instance_request ->
    ( create_addon_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_addon_instance_request ->
    ( create_addon_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Add On instance for the subscription indicated in the request. The resulting Amazon \
   Resource Name (ARN) can be used in a conditional statement for a rule set or traffic policy. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
