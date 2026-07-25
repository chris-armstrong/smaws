open Types

val make_add_permission_input :
  topic_arn:topic_ar_n ->
  label:label ->
  aws_account_id:delegates_list ->
  action_name:actions_list ->
  unit ->
  add_permission_input

val make_verify_sms_sandbox_phone_number_input :
  phone_number:phone_number_string ->
  one_time_password:otp_code ->
  unit ->
  verify_sms_sandbox_phone_number_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_unsubscribe_input : subscription_arn:subscription_ar_n -> unit -> unsubscribe_input
val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_subscribe_response : ?subscription_arn:subscription_ar_n -> unit -> subscribe_response

val make_subscribe_input :
  ?endpoint:endpoint2 ->
  ?attributes:subscription_attributes_map ->
  ?return_subscription_arn:boolean_ ->
  topic_arn:topic_ar_n ->
  protocol:protocol ->
  unit ->
  subscribe_input

val make_set_topic_attributes_input :
  ?attribute_value:attribute_value ->
  topic_arn:topic_ar_n ->
  attribute_name:attribute_name ->
  unit ->
  set_topic_attributes_input

val make_set_subscription_attributes_input :
  ?attribute_value:attribute_value ->
  subscription_arn:subscription_ar_n ->
  attribute_name:attribute_name ->
  unit ->
  set_subscription_attributes_input

val make_set_sms_attributes_response : unit -> unit

val make_set_sms_attributes_input :
  attributes:map_string_to_string -> unit -> set_sms_attributes_input

val make_set_platform_application_attributes_input :
  platform_application_arn:string_ ->
  attributes:map_string_to_string ->
  unit ->
  set_platform_application_attributes_input

val make_set_endpoint_attributes_input :
  endpoint_arn:string_ -> attributes:map_string_to_string -> unit -> set_endpoint_attributes_input

val make_remove_permission_input :
  topic_arn:topic_ar_n -> label:label -> unit -> remove_permission_input

val make_put_data_protection_policy_input :
  resource_arn:topic_ar_n ->
  data_protection_policy:attribute_value ->
  unit ->
  put_data_protection_policy_input

val make_batch_result_error_entry :
  ?message:string_ ->
  id:string_ ->
  code:string_ ->
  sender_fault:boolean_ ->
  unit ->
  batch_result_error_entry

val make_publish_batch_result_entry :
  ?id:string_ ->
  ?message_id:message_id ->
  ?sequence_number:string_ ->
  unit ->
  publish_batch_result_entry

val make_publish_batch_response :
  ?successful:publish_batch_result_entry_list ->
  ?failed:batch_result_error_entry_list ->
  unit ->
  publish_batch_response

val make_message_attribute_value :
  ?string_value:string_ ->
  ?binary_value:binary ->
  data_type:string_ ->
  unit ->
  message_attribute_value

val make_publish_batch_request_entry :
  ?subject:subject ->
  ?message_structure:message_structure ->
  ?message_attributes:message_attribute_map ->
  ?message_deduplication_id:string_ ->
  ?message_group_id:string_ ->
  id:string_ ->
  message:message ->
  unit ->
  publish_batch_request_entry

val make_publish_batch_input :
  topic_arn:topic_ar_n ->
  publish_batch_request_entries:publish_batch_request_entry_list ->
  unit ->
  publish_batch_input

val make_publish_response :
  ?message_id:message_id -> ?sequence_number:string_ -> unit -> publish_response

val make_publish_input :
  ?topic_arn:topic_ar_n ->
  ?target_arn:string_ ->
  ?phone_number:phone_number ->
  ?subject:subject ->
  ?message_structure:message_structure ->
  ?message_attributes:message_attribute_map ->
  ?message_deduplication_id:string_ ->
  ?message_group_id:string_ ->
  message:message ->
  unit ->
  publish_input

val make_opt_in_phone_number_response : unit -> unit
val make_opt_in_phone_number_input : phone_number:phone_number -> unit -> opt_in_phone_number_input
val make_topic : ?topic_arn:topic_ar_n -> unit -> topic

val make_list_topics_response :
  ?topics:topics_list -> ?next_token:next_token -> unit -> list_topics_response

val make_list_topics_input : ?next_token:next_token -> unit -> list_topics_input
val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_subscription :
  ?subscription_arn:subscription_ar_n ->
  ?owner:account ->
  ?protocol:protocol ->
  ?endpoint:endpoint2 ->
  ?topic_arn:topic_ar_n ->
  unit ->
  subscription

val make_list_subscriptions_by_topic_response :
  ?subscriptions:subscriptions_list ->
  ?next_token:next_token ->
  unit ->
  list_subscriptions_by_topic_response

val make_list_subscriptions_by_topic_input :
  ?next_token:next_token -> topic_arn:topic_ar_n -> unit -> list_subscriptions_by_topic_input

val make_list_subscriptions_response :
  ?subscriptions:subscriptions_list -> ?next_token:next_token -> unit -> list_subscriptions_response

val make_list_subscriptions_input : ?next_token:next_token -> unit -> list_subscriptions_input

val make_sms_sandbox_phone_number :
  ?phone_number:phone_number_string ->
  ?status:sms_sandbox_phone_number_verification_status ->
  unit ->
  sms_sandbox_phone_number

val make_list_sms_sandbox_phone_numbers_input :
  ?next_token:next_token -> ?max_results:max_items -> unit -> list_sms_sandbox_phone_numbers_input

val make_platform_application :
  ?platform_application_arn:string_ ->
  ?attributes:map_string_to_string ->
  unit ->
  platform_application

val make_list_platform_applications_response :
  ?platform_applications:list_of_platform_applications ->
  ?next_token:string_ ->
  unit ->
  list_platform_applications_response

val make_list_platform_applications_input :
  ?next_token:string_ -> unit -> list_platform_applications_input

val make_list_phone_numbers_opted_out_response :
  ?phone_numbers:phone_number_list ->
  ?next_token:string_ ->
  unit ->
  list_phone_numbers_opted_out_response

val make_list_phone_numbers_opted_out_input :
  ?next_token:string_ -> unit -> list_phone_numbers_opted_out_input

val make_phone_number_information :
  ?created_at:timestamp ->
  ?phone_number:phone_number ->
  ?status:string_ ->
  ?iso2_country_code:iso2_country_code ->
  ?route_type:route_type ->
  ?number_capabilities:number_capability_list ->
  unit ->
  phone_number_information

val make_list_origination_numbers_request :
  ?next_token:next_token ->
  ?max_results:max_items_list_origination_numbers ->
  unit ->
  list_origination_numbers_request

val make_endpoint : ?endpoint_arn:string_ -> ?attributes:map_string_to_string -> unit -> endpoint

val make_list_endpoints_by_platform_application_response :
  ?endpoints:list_of_endpoints ->
  ?next_token:string_ ->
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
  ?attributes:topic_attributes_map ->
  ?tags:tag_list ->
  ?data_protection_policy:attribute_value ->
  name:topic_name ->
  unit ->
  create_topic_input

val make_create_sms_sandbox_phone_number_input :
  ?language_code:language_code_string ->
  phone_number:phone_number_string ->
  unit ->
  create_sms_sandbox_phone_number_input

val make_create_endpoint_response : ?endpoint_arn:string_ -> unit -> create_endpoint_response

val make_create_platform_endpoint_input :
  ?custom_user_data:string_ ->
  ?attributes:map_string_to_string ->
  platform_application_arn:string_ ->
  token:string_ ->
  unit ->
  create_platform_endpoint_input

val make_create_platform_application_response :
  ?platform_application_arn:string_ -> unit -> create_platform_application_response

val make_create_platform_application_input :
  name:string_ ->
  platform:string_ ->
  attributes:map_string_to_string ->
  unit ->
  create_platform_application_input

val make_confirm_subscription_response :
  ?subscription_arn:subscription_ar_n -> unit -> confirm_subscription_response

val make_confirm_subscription_input :
  ?authenticate_on_unsubscribe:authenticate_on_unsubscribe ->
  topic_arn:topic_ar_n ->
  token:token ->
  unit ->
  confirm_subscription_input

val make_check_if_phone_number_is_opted_out_response :
  ?is_opted_out:boolean_ -> unit -> check_if_phone_number_is_opted_out_response

val make_check_if_phone_number_is_opted_out_input :
  phone_number:phone_number -> unit -> check_if_phone_number_is_opted_out_input
