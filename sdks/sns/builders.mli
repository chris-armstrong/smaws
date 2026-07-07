open Types

val make_verify_sms_sandbox_phone_number_input :
  one_time_password:otp_code ->
  phone_number:phone_number_string ->
  unit ->
  verify_sms_sandbox_phone_number_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_unsubscribe_input : subscription_arn:subscription_ar_n -> unit -> unsubscribe_input
val make_topic : ?topic_arn:topic_ar_n -> unit -> topic
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_subscription :
  ?topic_arn:topic_ar_n ->
  ?endpoint:endpoint2 ->
  ?protocol:protocol ->
  ?owner:account ->
  ?subscription_arn:subscription_ar_n ->
  unit ->
  subscription

val make_subscribe_response : ?subscription_arn:subscription_ar_n -> unit -> subscribe_response

val make_subscribe_input :
  ?return_subscription_arn:boolean_ ->
  ?attributes:subscription_attributes_map ->
  ?endpoint:endpoint2 ->
  protocol:protocol ->
  topic_arn:topic_ar_n ->
  unit ->
  subscribe_input

val make_set_topic_attributes_input :
  ?attribute_value:attribute_value ->
  attribute_name:attribute_name ->
  topic_arn:topic_ar_n ->
  unit ->
  set_topic_attributes_input

val make_set_subscription_attributes_input :
  ?attribute_value:attribute_value ->
  attribute_name:attribute_name ->
  subscription_arn:subscription_ar_n ->
  unit ->
  set_subscription_attributes_input

val make_set_sms_attributes_response : unit -> unit

val make_set_sms_attributes_input :
  attributes:map_string_to_string -> unit -> set_sms_attributes_input

val make_set_platform_application_attributes_input :
  attributes:map_string_to_string ->
  platform_application_arn:string_ ->
  unit ->
  set_platform_application_attributes_input

val make_set_endpoint_attributes_input :
  attributes:map_string_to_string -> endpoint_arn:string_ -> unit -> set_endpoint_attributes_input

val make_sms_sandbox_phone_number :
  ?status:sms_sandbox_phone_number_verification_status ->
  ?phone_number:phone_number_string ->
  unit ->
  sms_sandbox_phone_number

val make_remove_permission_input :
  label:label -> topic_arn:topic_ar_n -> unit -> remove_permission_input

val make_put_data_protection_policy_input :
  data_protection_policy:attribute_value ->
  resource_arn:topic_ar_n ->
  unit ->
  put_data_protection_policy_input

val make_publish_response :
  ?sequence_number:string_ -> ?message_id:message_id -> unit -> publish_response

val make_message_attribute_value :
  ?binary_value:binary ->
  ?string_value:string_ ->
  data_type:string_ ->
  unit ->
  message_attribute_value

val make_publish_input :
  ?message_group_id:string_ ->
  ?message_deduplication_id:string_ ->
  ?message_attributes:message_attribute_map ->
  ?message_structure:message_structure ->
  ?subject:subject ->
  ?phone_number:phone_number ->
  ?target_arn:string_ ->
  ?topic_arn:topic_ar_n ->
  message:message ->
  unit ->
  publish_input

val make_publish_batch_result_entry :
  ?sequence_number:string_ ->
  ?message_id:message_id ->
  ?id:string_ ->
  unit ->
  publish_batch_result_entry

val make_batch_result_error_entry :
  ?message:string_ ->
  sender_fault:boolean_ ->
  code:string_ ->
  id:string_ ->
  unit ->
  batch_result_error_entry

val make_publish_batch_response :
  ?failed:batch_result_error_entry_list ->
  ?successful:publish_batch_result_entry_list ->
  unit ->
  publish_batch_response

val make_publish_batch_request_entry :
  ?message_group_id:string_ ->
  ?message_deduplication_id:string_ ->
  ?message_attributes:message_attribute_map ->
  ?message_structure:message_structure ->
  ?subject:subject ->
  message:message ->
  id:string_ ->
  unit ->
  publish_batch_request_entry

val make_publish_batch_input :
  publish_batch_request_entries:publish_batch_request_entry_list ->
  topic_arn:topic_ar_n ->
  unit ->
  publish_batch_input

val make_platform_application :
  ?attributes:map_string_to_string ->
  ?platform_application_arn:string_ ->
  unit ->
  platform_application

val make_phone_number_information :
  ?number_capabilities:number_capability_list ->
  ?route_type:route_type ->
  ?iso2_country_code:iso2_country_code ->
  ?status:string_ ->
  ?phone_number:phone_number ->
  ?created_at:timestamp ->
  unit ->
  phone_number_information

val make_opt_in_phone_number_response : unit -> unit
val make_opt_in_phone_number_input : phone_number:phone_number -> unit -> opt_in_phone_number_input

val make_list_topics_response :
  ?next_token:next_token -> ?topics:topics_list -> unit -> list_topics_response

val make_list_topics_input : ?next_token:next_token -> unit -> list_topics_input
val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_subscriptions_response :
  ?next_token:next_token -> ?subscriptions:subscriptions_list -> unit -> list_subscriptions_response

val make_list_subscriptions_input : ?next_token:next_token -> unit -> list_subscriptions_input

val make_list_subscriptions_by_topic_response :
  ?next_token:next_token ->
  ?subscriptions:subscriptions_list ->
  unit ->
  list_subscriptions_by_topic_response

val make_list_subscriptions_by_topic_input :
  ?next_token:next_token -> topic_arn:topic_ar_n -> unit -> list_subscriptions_by_topic_input

val make_list_sms_sandbox_phone_numbers_input :
  ?max_results:max_items -> ?next_token:next_token -> unit -> list_sms_sandbox_phone_numbers_input

val make_list_platform_applications_response :
  ?next_token:string_ ->
  ?platform_applications:list_of_platform_applications ->
  unit ->
  list_platform_applications_response

val make_list_platform_applications_input :
  ?next_token:string_ -> unit -> list_platform_applications_input

val make_list_phone_numbers_opted_out_response :
  ?next_token:string_ ->
  ?phone_numbers:phone_number_list ->
  unit ->
  list_phone_numbers_opted_out_response

val make_list_phone_numbers_opted_out_input :
  ?next_token:string_ -> unit -> list_phone_numbers_opted_out_input

val make_list_origination_numbers_request :
  ?max_results:max_items_list_origination_numbers ->
  ?next_token:next_token ->
  unit ->
  list_origination_numbers_request

val make_endpoint : ?attributes:map_string_to_string -> ?endpoint_arn:string_ -> unit -> endpoint

val make_list_endpoints_by_platform_application_response :
  ?next_token:string_ ->
  ?endpoints:list_of_endpoints ->
  unit ->
  list_endpoints_by_platform_application_response

val make_list_endpoints_by_platform_application_input :
  ?next_token:string_ ->
  platform_application_arn:string_ ->
  unit ->
  list_endpoints_by_platform_application_input

val make_get_topic_attributes_response :
  ?attributes:topic_attributes_map -> unit -> get_topic_attributes_response

val make_get_topic_attributes_input : topic_arn:topic_ar_n -> unit -> get_topic_attributes_input

val make_get_subscription_attributes_response :
  ?attributes:subscription_attributes_map -> unit -> get_subscription_attributes_response

val make_get_subscription_attributes_input :
  subscription_arn:subscription_ar_n -> unit -> get_subscription_attributes_input

val make_get_sms_sandbox_account_status_input : unit -> unit

val make_get_sms_attributes_response :
  ?attributes:map_string_to_string -> unit -> get_sms_attributes_response

val make_get_sms_attributes_input : ?attributes:list_string -> unit -> get_sms_attributes_input

val make_get_platform_application_attributes_response :
  ?attributes:map_string_to_string -> unit -> get_platform_application_attributes_response

val make_get_platform_application_attributes_input :
  platform_application_arn:string_ -> unit -> get_platform_application_attributes_input

val make_get_endpoint_attributes_response :
  ?attributes:map_string_to_string -> unit -> get_endpoint_attributes_response

val make_get_endpoint_attributes_input :
  endpoint_arn:string_ -> unit -> get_endpoint_attributes_input

val make_get_data_protection_policy_response :
  ?data_protection_policy:attribute_value -> unit -> get_data_protection_policy_response

val make_get_data_protection_policy_input :
  resource_arn:topic_ar_n -> unit -> get_data_protection_policy_input

val make_delete_topic_input : topic_arn:topic_ar_n -> unit -> delete_topic_input

val make_delete_sms_sandbox_phone_number_input :
  phone_number:phone_number_string -> unit -> delete_sms_sandbox_phone_number_input

val make_delete_platform_application_input :
  platform_application_arn:string_ -> unit -> delete_platform_application_input

val make_delete_endpoint_input : endpoint_arn:string_ -> unit -> delete_endpoint_input
val make_create_topic_response : ?topic_arn:topic_ar_n -> unit -> create_topic_response

val make_create_topic_input :
  ?data_protection_policy:attribute_value ->
  ?tags:tag_list ->
  ?attributes:topic_attributes_map ->
  name:topic_name ->
  unit ->
  create_topic_input

val make_create_sms_sandbox_phone_number_input :
  ?language_code:language_code_string ->
  phone_number:phone_number_string ->
  unit ->
  create_sms_sandbox_phone_number_input

val make_create_platform_endpoint_input :
  ?attributes:map_string_to_string ->
  ?custom_user_data:string_ ->
  token:string_ ->
  platform_application_arn:string_ ->
  unit ->
  create_platform_endpoint_input

val make_create_endpoint_response : ?endpoint_arn:string_ -> unit -> create_endpoint_response

val make_create_platform_application_response :
  ?platform_application_arn:string_ -> unit -> create_platform_application_response

val make_create_platform_application_input :
  attributes:map_string_to_string ->
  platform:string_ ->
  name:string_ ->
  unit ->
  create_platform_application_input

val make_confirm_subscription_response :
  ?subscription_arn:subscription_ar_n -> unit -> confirm_subscription_response

val make_confirm_subscription_input :
  ?authenticate_on_unsubscribe:authenticate_on_unsubscribe ->
  token:token ->
  topic_arn:topic_ar_n ->
  unit ->
  confirm_subscription_input

val make_check_if_phone_number_is_opted_out_response :
  ?is_opted_out:boolean_ -> unit -> check_if_phone_number_is_opted_out_response

val make_check_if_phone_number_is_opted_out_input :
  phone_number:phone_number -> unit -> check_if_phone_number_is_opted_out_input

val make_add_permission_input :
  action_name:actions_list ->
  aws_account_id:delegates_list ->
  label:label ->
  topic_arn:topic_ar_n ->
  unit ->
  add_permission_input
