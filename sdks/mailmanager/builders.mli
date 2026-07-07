open Types

val make_update_traffic_policy_response : unit -> unit

val make_ingress_analysis :
  result_field:result_field -> analyzer:analyzer_arn -> unit -> ingress_analysis

val make_ingress_string_expression :
  values:string_list ->
  operator:ingress_string_operator ->
  evaluate:ingress_string_to_evaluate ->
  unit ->
  ingress_string_expression

val make_ingress_ipv4_expression :
  values:ipv4_cidrs ->
  operator:ingress_ip_operator ->
  evaluate:ingress_ip_to_evaluate ->
  unit ->
  ingress_ipv4_expression

val make_ingress_ipv6_expression :
  values:ipv6_cidrs ->
  operator:ingress_ip_operator ->
  evaluate:ingress_ipv6_to_evaluate ->
  unit ->
  ingress_ipv6_expression

val make_ingress_tls_protocol_expression :
  value:ingress_tls_protocol_attribute ->
  operator:ingress_tls_protocol_operator ->
  evaluate:ingress_tls_protocol_to_evaluate ->
  unit ->
  ingress_tls_protocol_expression

val make_ingress_is_in_address_list :
  address_lists:ingress_address_list_arn_list ->
  attribute:ingress_address_list_email_attribute ->
  unit ->
  ingress_is_in_address_list

val make_ingress_boolean_expression :
  operator:ingress_boolean_operator ->
  evaluate:ingress_boolean_to_evaluate ->
  unit ->
  ingress_boolean_expression

val make_policy_statement :
  action:accept_action -> conditions:policy_conditions -> unit -> policy_statement

val make_update_traffic_policy_request :
  ?max_message_size_bytes:max_message_size_bytes ->
  ?default_action:accept_action ->
  ?policy_statements:policy_statement_list ->
  ?traffic_policy_name:traffic_policy_name ->
  traffic_policy_id:traffic_policy_id ->
  unit ->
  update_traffic_policy_request

val make_update_rule_set_response : unit -> unit
val make_analysis : result_field:result_field -> analyzer:analyzer_arn -> unit -> analysis

val make_rule_is_in_address_list :
  address_lists:rule_address_list_arn_list ->
  attribute:rule_address_list_email_attribute ->
  unit ->
  rule_is_in_address_list

val make_rule_boolean_expression :
  operator:rule_boolean_operator ->
  evaluate:rule_boolean_to_evaluate ->
  unit ->
  rule_boolean_expression

val make_rule_string_expression :
  values:rule_string_list ->
  operator:rule_string_operator ->
  evaluate:rule_string_to_evaluate ->
  unit ->
  rule_string_expression

val make_rule_number_expression :
  value:Smaws_Lib.Smithy_api.Types.double ->
  operator:rule_number_operator ->
  evaluate:rule_number_to_evaluate ->
  unit ->
  rule_number_expression

val make_rule_ip_expression :
  values:rule_ip_value_list ->
  operator:rule_ip_operator ->
  evaluate:rule_ip_to_evaluate ->
  unit ->
  rule_ip_expression

val make_rule_verdict_expression :
  values:rule_verdict_value_list ->
  operator:rule_verdict_operator ->
  evaluate:rule_verdict_to_evaluate ->
  unit ->
  rule_verdict_expression

val make_rule_dmarc_expression :
  values:rule_dmarc_value_list -> operator:rule_dmarc_operator -> unit -> rule_dmarc_expression

val make_drop_action : unit -> unit

val make_relay_action :
  ?mail_from:mail_from ->
  ?action_failure_policy:action_failure_policy ->
  relay:id_or_arn ->
  unit ->
  relay_action

val make_archive_action :
  ?action_failure_policy:action_failure_policy ->
  target_archive:name_or_arn ->
  unit ->
  archive_action

val make_s3_action :
  ?s3_sse_kms_key_id:kms_key_id ->
  ?s3_prefix:s3_prefix ->
  ?action_failure_policy:action_failure_policy ->
  s3_bucket:s3_bucket ->
  role_arn:iam_role_arn ->
  unit ->
  s3_action

val make_send_action :
  ?action_failure_policy:action_failure_policy -> role_arn:iam_role_arn -> unit -> send_action

val make_add_header_action :
  header_value:header_value -> header_name:header_name -> unit -> add_header_action

val make_replace_recipient_action : ?replace_with:recipients -> unit -> replace_recipient_action

val make_deliver_to_mailbox_action :
  ?action_failure_policy:action_failure_policy ->
  role_arn:iam_role_arn ->
  mailbox_arn:name_or_arn ->
  unit ->
  deliver_to_mailbox_action

val make_deliver_to_q_business_action :
  ?action_failure_policy:action_failure_policy ->
  role_arn:iam_role_arn ->
  index_id:q_business_index_id ->
  application_id:q_business_application_id ->
  unit ->
  deliver_to_q_business_action

val make_sns_action :
  ?payload_type:sns_notification_payload_type ->
  ?encoding:sns_notification_encoding ->
  ?action_failure_policy:action_failure_policy ->
  role_arn:iam_role_arn ->
  topic_arn:sns_topic_arn ->
  unit ->
  sns_action

val make_bounce_action :
  ?message:bounce_message ->
  ?action_failure_policy:action_failure_policy ->
  diagnostic_message:diagnostic_message ->
  smtp_reply_code:smtp_reply_code ->
  status_code:status_code ->
  sender:email_address ->
  role_arn:iam_role_arn ->
  unit ->
  bounce_action

val make_invoke_lambda_action :
  ?retry_time_minutes:lambda_retry_time_minutes ->
  ?action_failure_policy:action_failure_policy ->
  role_arn:iam_role_arn ->
  invocation_type:lambda_invocation_type ->
  function_arn:lambda_function_arn ->
  unit ->
  invoke_lambda_action

val make_rule :
  ?unless:rule_conditions ->
  ?conditions:rule_conditions ->
  ?name:rule_name ->
  actions:rule_actions ->
  unit ->
  rule

val make_update_rule_set_request :
  ?rules:rules ->
  ?rule_set_name:rule_set_name ->
  rule_set_id:rule_set_id ->
  unit ->
  update_rule_set_request

val make_update_relay_response : unit -> unit
val make_no_authentication : unit -> unit

val make_update_relay_request :
  ?authentication:relay_authentication ->
  ?server_port:relay_server_port ->
  ?server_name:relay_server_name ->
  ?relay_name:relay_name ->
  relay_id:relay_id ->
  unit ->
  update_relay_request

val make_update_ingress_point_response : unit -> unit

val make_trust_store :
  ?kms_key_arn:kms_key_arn ->
  ?crl_content:crl_content ->
  ca_content:ca_content ->
  unit ->
  trust_store

val make_tls_auth_configuration : ?trust_store:trust_store -> unit -> tls_auth_configuration

val make_update_ingress_point_request :
  ?tls_policy:tls_policy ->
  ?ingress_point_configuration:ingress_point_configuration ->
  ?traffic_policy_id:traffic_policy_id ->
  ?rule_set_id:rule_set_id ->
  ?status_to_update:ingress_point_status_to_update ->
  ?ingress_point_name:ingress_point_name ->
  ingress_point_id:ingress_point_id ->
  unit ->
  update_ingress_point_request

val make_update_archive_response : unit -> unit

val make_update_archive_request :
  ?retention:archive_retention ->
  ?archive_name:archive_name_string ->
  archive_id:archive_id_string ->
  unit ->
  update_archive_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:taggable_resource_arn -> unit -> untag_resource_request

val make_traffic_policy :
  default_action:accept_action ->
  traffic_policy_id:traffic_policy_id ->
  traffic_policy_name:traffic_policy_name ->
  unit ->
  traffic_policy

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:taggable_resource_arn -> unit -> tag_resource_request

val make_stop_archive_search_response : unit -> unit
val make_stop_archive_search_request : search_id:search_id -> unit -> stop_archive_search_request
val make_stop_archive_export_response : unit -> unit
val make_stop_archive_export_request : export_id:export_id -> unit -> stop_archive_export_request
val make_stop_address_list_import_job_response : unit -> unit

val make_stop_address_list_import_job_request :
  job_id:job_id -> unit -> stop_address_list_import_job_request

val make_start_archive_search_response :
  ?search_id:search_id -> unit -> start_archive_search_response

val make_archive_string_expression :
  values:string_value_list ->
  operator:archive_string_operator ->
  evaluate:archive_string_to_evaluate ->
  unit ->
  archive_string_expression

val make_archive_boolean_expression :
  operator:archive_boolean_operator ->
  evaluate:archive_boolean_to_evaluate ->
  unit ->
  archive_boolean_expression

val make_archive_filters :
  ?unless:archive_filter_conditions ->
  ?include_:archive_filter_conditions ->
  unit ->
  archive_filters

val make_start_archive_search_request :
  ?filters:archive_filters ->
  max_results:search_max_results ->
  to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  archive_id:archive_id ->
  unit ->
  start_archive_search_request

val make_start_archive_export_response :
  ?export_id:export_id -> unit -> start_archive_export_response

val make_s3_export_destination_configuration :
  ?s3_location:s3_location -> unit -> s3_export_destination_configuration

val make_start_archive_export_request :
  ?include_metadata:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?max_results:export_max_results ->
  ?filters:archive_filters ->
  export_destination_configuration:export_destination_configuration ->
  to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  archive_id:archive_id ->
  unit ->
  start_archive_export_request

val make_start_address_list_import_job_response : unit -> unit

val make_start_address_list_import_job_request :
  job_id:job_id -> unit -> start_address_list_import_job_request

val make_search_status :
  ?error_message:error_message ->
  ?state:search_state ->
  ?completion_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?submission_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  search_status

val make_search_summary : ?status:search_status -> ?search_id:search_id -> unit -> search_summary

val make_saved_address :
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp -> address:address -> unit -> saved_address

val make_rule_set :
  ?last_modification_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rule_set_name:rule_set_name ->
  ?rule_set_id:rule_set_id ->
  unit ->
  rule_set

val make_envelope :
  ?to_:string_list ->
  ?from_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?helo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  envelope

val make_row :
  ?source_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?envelope:envelope ->
  ?sender_ip_address:sender_ip_address ->
  ?sender_hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?ingress_point_id:ingress_point_id ->
  ?x_priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?x_original_mailer:Smaws_Lib.Smithy_api.Types.string_ ->
  ?x_mailer:Smaws_Lib.Smithy_api.Types.string_ ->
  ?in_reply_to:Smaws_Lib.Smithy_api.Types.string_ ->
  ?received_headers:email_received_headers_list ->
  ?has_attachments:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?message_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?subject:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cc:Smaws_Lib.Smithy_api.Types.string_ ->
  ?from_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?to_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?date:Smaws_Lib.Smithy_api.Types.string_ ->
  ?received_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?archived_message_id:archived_message_id ->
  unit ->
  row

val make_relay :
  ?last_modified_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?relay_name:relay_name ->
  ?relay_id:relay_id ->
  unit ->
  relay

val make_register_member_to_address_list_response : unit -> unit

val make_register_member_to_address_list_request :
  address:address ->
  address_list_id:address_list_id ->
  unit ->
  register_member_to_address_list_request

val make_public_network_configuration : ip_type:ip_type -> unit -> public_network_configuration

val make_private_network_configuration :
  vpc_endpoint_id:vpc_endpoint_id -> unit -> private_network_configuration

val make_metadata :
  ?source_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?configuration_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sending_pool:Smaws_Lib.Smithy_api.Types.string_ ->
  ?source_identity:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sending_method:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tls_protocol:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tls_cipher_suite:Smaws_Lib.Smithy_api.Types.string_ ->
  ?sender_ip_address:sender_ip_address ->
  ?sender_hostname:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_set_id:rule_set_id ->
  ?traffic_policy_id:traffic_policy_id ->
  ?ingress_point_id:ingress_point_id ->
  ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  metadata

val make_message_body :
  ?message_malformed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?html:Smaws_Lib.Smithy_api.Types.string_ ->
  ?text:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  message_body

val make_list_tags_for_resource_response : tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_list_members_of_address_list_response :
  ?next_token:pagination_token ->
  addresses:saved_addresses ->
  unit ->
  list_members_of_address_list_response

val make_address_filter : ?address_prefix:address_prefix -> unit -> address_filter

val make_list_members_of_address_list_request :
  ?page_size:address_page_size ->
  ?next_token:pagination_token ->
  ?filter:address_filter ->
  address_list_id:address_list_id ->
  unit ->
  list_members_of_address_list_request

val make_list_archive_searches_response :
  ?next_token:pagination_token ->
  ?searches:search_summary_list ->
  unit ->
  list_archive_searches_response

val make_list_archive_searches_request :
  ?page_size:page_size ->
  ?next_token:pagination_token ->
  archive_id:archive_id ->
  unit ->
  list_archive_searches_request

val make_export_status :
  ?error_message:error_message ->
  ?state:export_state ->
  ?completion_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?submission_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  export_status

val make_export_summary : ?status:export_status -> ?export_id:export_id -> unit -> export_summary

val make_list_archive_exports_response :
  ?next_token:pagination_token ->
  ?exports:export_summary_list ->
  unit ->
  list_archive_exports_response

val make_list_archive_exports_request :
  ?page_size:page_size ->
  ?next_token:pagination_token ->
  archive_id:archive_id ->
  unit ->
  list_archive_exports_request

val make_import_data_format : import_data_type:import_data_type -> unit -> import_data_format

val make_import_job :
  ?error:error_message ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failed_items_count:job_items_count ->
  ?imported_items_count:job_items_count ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  address_list_id:address_list_id ->
  import_data_format:import_data_format ->
  pre_signed_url:pre_signed_url ->
  status:import_job_status ->
  name:job_name ->
  job_id:job_id ->
  unit ->
  import_job

val make_list_address_list_import_jobs_response :
  ?next_token:pagination_token ->
  import_jobs:import_jobs ->
  unit ->
  list_address_list_import_jobs_response

val make_list_address_list_import_jobs_request :
  ?page_size:page_size ->
  ?next_token:pagination_token ->
  address_list_id:address_list_id ->
  unit ->
  list_address_list_import_jobs_request

val make_get_member_of_address_list_response :
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  address:address ->
  unit ->
  get_member_of_address_list_response

val make_get_member_of_address_list_request :
  address:address -> address_list_id:address_list_id -> unit -> get_member_of_address_list_request

val make_get_archive_search_results_response :
  ?rows:rows_list -> unit -> get_archive_search_results_response

val make_get_archive_search_results_request :
  search_id:search_id -> unit -> get_archive_search_results_request

val make_get_archive_search_response :
  ?status:search_status ->
  ?max_results:search_max_results ->
  ?to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?filters:archive_filters ->
  ?archive_id:archive_id ->
  unit ->
  get_archive_search_response

val make_get_archive_search_request : search_id:search_id -> unit -> get_archive_search_request

val make_get_archive_message_content_response :
  ?body:message_body -> unit -> get_archive_message_content_response

val make_get_archive_message_content_request :
  archived_message_id:archived_message_id -> unit -> get_archive_message_content_request

val make_get_archive_message_response :
  ?envelope:envelope ->
  ?metadata:metadata ->
  ?message_download_link:s3_presigned_ur_l ->
  unit ->
  get_archive_message_response

val make_get_archive_message_request :
  archived_message_id:archived_message_id -> unit -> get_archive_message_request

val make_get_archive_export_response :
  ?status:export_status ->
  ?export_destination_configuration:export_destination_configuration ->
  ?max_results:export_max_results ->
  ?to_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?from_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?filters:archive_filters ->
  ?archive_id:archive_id ->
  unit ->
  get_archive_export_response

val make_get_archive_export_request : export_id:export_id -> unit -> get_archive_export_request

val make_get_address_list_import_job_response :
  ?error:error_message ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failed_items_count:job_items_count ->
  ?imported_items_count:job_items_count ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  address_list_id:address_list_id ->
  import_data_format:import_data_format ->
  pre_signed_url:pre_signed_url ->
  status:import_job_status ->
  name:job_name ->
  job_id:job_id ->
  unit ->
  get_address_list_import_job_response

val make_get_address_list_import_job_request :
  job_id:job_id -> unit -> get_address_list_import_job_request

val make_deregister_member_from_address_list_response : unit -> unit

val make_deregister_member_from_address_list_request :
  address:address ->
  address_list_id:address_list_id ->
  unit ->
  deregister_member_from_address_list_request

val make_create_address_list_import_job_response :
  pre_signed_url:pre_signed_url -> job_id:job_id -> unit -> create_address_list_import_job_response

val make_create_address_list_import_job_request :
  ?client_token:idempotency_token ->
  import_data_format:import_data_format ->
  name:job_name ->
  address_list_id:address_list_id ->
  unit ->
  create_address_list_import_job_request

val make_list_traffic_policies_response :
  ?next_token:pagination_token ->
  ?traffic_policies:traffic_policy_list ->
  unit ->
  list_traffic_policies_response

val make_list_traffic_policies_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_traffic_policies_request

val make_list_rule_sets_response :
  ?next_token:pagination_token -> rule_sets:rule_sets -> unit -> list_rule_sets_response

val make_list_rule_sets_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_rule_sets_request

val make_list_relays_response :
  ?next_token:pagination_token -> relays:relays -> unit -> list_relays_response

val make_list_relays_request :
  ?next_token:pagination_token ->
  ?page_size:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_relays_request

val make_ingress_point :
  ?a_record:ingress_point_a_record ->
  type_:ingress_point_type ->
  status:ingress_point_status ->
  ingress_point_id:ingress_point_id ->
  ingress_point_name:ingress_point_name ->
  unit ->
  ingress_point

val make_list_ingress_points_response :
  ?next_token:pagination_token ->
  ?ingress_points:ingress_points_list ->
  unit ->
  list_ingress_points_response

val make_list_ingress_points_request :
  ?next_token:pagination_token -> ?page_size:page_size -> unit -> list_ingress_points_request

val make_archive :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?archive_state:archive_state ->
  ?archive_name:archive_name_string ->
  archive_id:archive_id_string ->
  unit ->
  archive

val make_list_archives_response :
  ?next_token:pagination_token -> archives:archives_list -> unit -> list_archives_response

val make_list_archives_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_archives_request

val make_address_list :
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  address_list_name:address_list_name ->
  address_list_arn:address_list_arn ->
  address_list_id:address_list_id ->
  unit ->
  address_list

val make_list_address_lists_response :
  ?next_token:pagination_token -> address_lists:address_lists -> unit -> list_address_lists_response

val make_list_address_lists_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_address_lists_request

val make_addon_subscription :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?addon_subscription_arn:addon_subscription_arn ->
  ?addon_name:addon_name ->
  ?addon_subscription_id:addon_subscription_id ->
  unit ->
  addon_subscription

val make_list_addon_subscriptions_response :
  ?next_token:pagination_token ->
  ?addon_subscriptions:addon_subscriptions ->
  unit ->
  list_addon_subscriptions_response

val make_list_addon_subscriptions_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_addon_subscriptions_request

val make_addon_instance :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?addon_instance_arn:addon_instance_arn ->
  ?addon_name:addon_name ->
  ?addon_subscription_id:addon_subscription_id ->
  ?addon_instance_id:addon_instance_id ->
  unit ->
  addon_instance

val make_list_addon_instances_response :
  ?next_token:pagination_token ->
  ?addon_instances:addon_instances ->
  unit ->
  list_addon_instances_response

val make_list_addon_instances_request :
  ?page_size:page_size -> ?next_token:pagination_token -> unit -> list_addon_instances_request

val make_ingress_point_password_configuration :
  ?previous_smtp_password_expiry_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?previous_smtp_password_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?smtp_password_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ingress_point_password_configuration

val make_ingress_point_auth_configuration :
  ?tls_auth_configuration:tls_auth_configuration ->
  ?secret_arn:secret_arn ->
  ?ingress_point_password_configuration:ingress_point_password_configuration ->
  unit ->
  ingress_point_auth_configuration

val make_get_traffic_policy_response :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?default_action:accept_action ->
  ?max_message_size_bytes:max_message_size_bytes ->
  ?policy_statements:policy_statement_list ->
  ?traffic_policy_arn:traffic_policy_arn ->
  traffic_policy_id:traffic_policy_id ->
  traffic_policy_name:traffic_policy_name ->
  unit ->
  get_traffic_policy_response

val make_get_traffic_policy_request :
  traffic_policy_id:traffic_policy_id -> unit -> get_traffic_policy_request

val make_get_rule_set_response :
  rules:rules ->
  last_modification_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  rule_set_name:rule_set_name ->
  rule_set_arn:rule_set_arn ->
  rule_set_id:rule_set_id ->
  unit ->
  get_rule_set_response

val make_get_rule_set_request : rule_set_id:rule_set_id -> unit -> get_rule_set_request

val make_get_relay_response :
  ?last_modified_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?authentication:relay_authentication ->
  ?server_port:relay_server_port ->
  ?server_name:relay_server_name ->
  ?relay_name:relay_name ->
  ?relay_arn:relay_arn ->
  relay_id:relay_id ->
  unit ->
  get_relay_response

val make_get_relay_request : relay_id:relay_id -> unit -> get_relay_request

val make_get_ingress_point_response :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?tls_policy:tls_policy ->
  ?network_configuration:network_configuration ->
  ?ingress_point_auth_configuration:ingress_point_auth_configuration ->
  ?traffic_policy_id:traffic_policy_id ->
  ?rule_set_id:rule_set_id ->
  ?a_record:ingress_point_a_record ->
  ?type_:ingress_point_type ->
  ?status:ingress_point_status ->
  ?ingress_point_arn:ingress_point_arn ->
  ingress_point_name:ingress_point_name ->
  ingress_point_id:ingress_point_id ->
  unit ->
  get_ingress_point_response

val make_get_ingress_point_request :
  ?include_trust_store_contents:trust_store_response_option ->
  ingress_point_id:ingress_point_id ->
  unit ->
  get_ingress_point_request

val make_get_archive_response :
  ?kms_key_arn:kms_key_arn ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  retention:archive_retention ->
  archive_state:archive_state ->
  archive_arn:archive_arn ->
  archive_name:archive_name_string ->
  archive_id:archive_id_string ->
  unit ->
  get_archive_response

val make_get_archive_request : archive_id:archive_id_string -> unit -> get_archive_request

val make_get_address_list_response :
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  address_list_name:address_list_name ->
  address_list_arn:address_list_arn ->
  address_list_id:address_list_id ->
  unit ->
  get_address_list_response

val make_get_address_list_request :
  address_list_id:address_list_id -> unit -> get_address_list_request

val make_get_addon_subscription_response :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?addon_subscription_arn:addon_subscription_arn ->
  ?addon_name:addon_name ->
  unit ->
  get_addon_subscription_response

val make_get_addon_subscription_request :
  addon_subscription_id:addon_subscription_id -> unit -> get_addon_subscription_request

val make_get_addon_instance_response :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?addon_instance_arn:addon_instance_arn ->
  ?addon_name:addon_name ->
  ?addon_subscription_id:addon_subscription_id ->
  unit ->
  get_addon_instance_response

val make_get_addon_instance_request :
  addon_instance_id:addon_instance_id -> unit -> get_addon_instance_request

val make_delete_traffic_policy_response : unit -> unit

val make_delete_traffic_policy_request :
  traffic_policy_id:traffic_policy_id -> unit -> delete_traffic_policy_request

val make_delete_rule_set_response : unit -> unit
val make_delete_rule_set_request : rule_set_id:rule_set_id -> unit -> delete_rule_set_request
val make_delete_relay_response : unit -> unit
val make_delete_relay_request : relay_id:relay_id -> unit -> delete_relay_request
val make_delete_ingress_point_response : unit -> unit

val make_delete_ingress_point_request :
  ingress_point_id:ingress_point_id -> unit -> delete_ingress_point_request

val make_delete_archive_response : unit -> unit
val make_delete_archive_request : archive_id:archive_id_string -> unit -> delete_archive_request
val make_delete_address_list_response : unit -> unit

val make_delete_address_list_request :
  address_list_id:address_list_id -> unit -> delete_address_list_request

val make_delete_addon_subscription_response : unit -> unit

val make_delete_addon_subscription_request :
  addon_subscription_id:addon_subscription_id -> unit -> delete_addon_subscription_request

val make_delete_addon_instance_response : unit -> unit

val make_delete_addon_instance_request :
  addon_instance_id:addon_instance_id -> unit -> delete_addon_instance_request

val make_create_traffic_policy_response :
  traffic_policy_id:traffic_policy_id -> unit -> create_traffic_policy_response

val make_create_traffic_policy_request :
  ?tags:tag_list ->
  ?max_message_size_bytes:max_message_size_bytes ->
  ?client_token:idempotency_token ->
  default_action:accept_action ->
  policy_statements:policy_statement_list ->
  traffic_policy_name:traffic_policy_name ->
  unit ->
  create_traffic_policy_request

val make_create_rule_set_response : rule_set_id:rule_set_id -> unit -> create_rule_set_response

val make_create_rule_set_request :
  ?tags:tag_list ->
  ?client_token:idempotency_token ->
  rules:rules ->
  rule_set_name:rule_set_name ->
  unit ->
  create_rule_set_request

val make_create_relay_response : relay_id:relay_id -> unit -> create_relay_response

val make_create_relay_request :
  ?tags:tag_list ->
  ?client_token:idempotency_token ->
  authentication:relay_authentication ->
  server_port:relay_server_port ->
  server_name:relay_server_name ->
  relay_name:relay_name ->
  unit ->
  create_relay_request

val make_create_ingress_point_response :
  ingress_point_id:ingress_point_id -> unit -> create_ingress_point_response

val make_create_ingress_point_request :
  ?tags:tag_list ->
  ?tls_policy:tls_policy ->
  ?network_configuration:network_configuration ->
  ?ingress_point_configuration:ingress_point_configuration ->
  ?client_token:idempotency_token ->
  traffic_policy_id:traffic_policy_id ->
  rule_set_id:rule_set_id ->
  type_:ingress_point_type ->
  ingress_point_name:ingress_point_name ->
  unit ->
  create_ingress_point_request

val make_create_archive_response : archive_id:archive_id_string -> unit -> create_archive_response

val make_create_archive_request :
  ?tags:tag_list ->
  ?kms_key_arn:kms_key_arn ->
  ?retention:archive_retention ->
  ?client_token:idempotency_token ->
  archive_name:archive_name_string ->
  unit ->
  create_archive_request

val make_create_address_list_response :
  address_list_id:address_list_id -> unit -> create_address_list_response

val make_create_address_list_request :
  ?tags:tag_list ->
  ?client_token:idempotency_token ->
  address_list_name:address_list_name ->
  unit ->
  create_address_list_request

val make_create_addon_subscription_response :
  addon_subscription_id:addon_subscription_id -> unit -> create_addon_subscription_response

val make_create_addon_subscription_request :
  ?tags:tag_list ->
  ?client_token:idempotency_token ->
  addon_name:addon_name ->
  unit ->
  create_addon_subscription_request

val make_create_addon_instance_response :
  addon_instance_id:addon_instance_id -> unit -> create_addon_instance_response

val make_create_addon_instance_request :
  ?tags:tag_list ->
  ?client_token:idempotency_token ->
  addon_subscription_id:addon_subscription_id ->
  unit ->
  create_addon_instance_request
