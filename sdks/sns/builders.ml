open Types

let make_add_permission_input ~topic_arn:(topic_arn_ : topic_ar_n) ~label:(label_ : label)
    ~aws_account_id:(aws_account_id_ : delegates_list) ~action_name:(action_name_ : actions_list) ()
    =
  ({
     topic_arn = topic_arn_;
     label = label_;
     aws_account_id = aws_account_id_;
     action_name = action_name_;
   }
    : add_permission_input)

let make_verify_sms_sandbox_phone_number_input ~phone_number:(phone_number_ : phone_number_string)
    ~one_time_password:(one_time_password_ : otp_code) () =
  ({ phone_number = phone_number_; one_time_password = one_time_password_ }
    : verify_sms_sandbox_phone_number_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_unsubscribe_input ~subscription_arn:(subscription_arn_ : subscription_ar_n) () =
  ({ subscription_arn = subscription_arn_ } : unsubscribe_input)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_subscribe_response ?subscription_arn:(subscription_arn_ : subscription_ar_n option) () =
  ({ subscription_arn = subscription_arn_ } : subscribe_response)

let make_subscribe_input ?endpoint:(endpoint_ : endpoint2 option)
    ?attributes:(attributes_ : subscription_attributes_map option)
    ?return_subscription_arn:(return_subscription_arn_ : boolean_ option)
    ~topic_arn:(topic_arn_ : topic_ar_n) ~protocol:(protocol_ : protocol) () =
  ({
     topic_arn = topic_arn_;
     protocol = protocol_;
     endpoint = endpoint_;
     attributes = attributes_;
     return_subscription_arn = return_subscription_arn_;
   }
    : subscribe_input)

let make_set_topic_attributes_input ?attribute_value:(attribute_value_ : attribute_value option)
    ~topic_arn:(topic_arn_ : topic_ar_n) ~attribute_name:(attribute_name_ : attribute_name) () =
  ({ topic_arn = topic_arn_; attribute_name = attribute_name_; attribute_value = attribute_value_ }
    : set_topic_attributes_input)

let make_set_subscription_attributes_input
    ?attribute_value:(attribute_value_ : attribute_value option)
    ~subscription_arn:(subscription_arn_ : subscription_ar_n)
    ~attribute_name:(attribute_name_ : attribute_name) () =
  ({
     subscription_arn = subscription_arn_;
     attribute_name = attribute_name_;
     attribute_value = attribute_value_;
   }
    : set_subscription_attributes_input)

let make_set_sms_attributes_response () = (() : unit)

let make_set_sms_attributes_input ~attributes:(attributes_ : map_string_to_string) () =
  ({ attributes = attributes_ } : set_sms_attributes_input)

let make_set_platform_application_attributes_input
    ~platform_application_arn:(platform_application_arn_ : string_)
    ~attributes:(attributes_ : map_string_to_string) () =
  ({ platform_application_arn = platform_application_arn_; attributes = attributes_ }
    : set_platform_application_attributes_input)

let make_set_endpoint_attributes_input ~endpoint_arn:(endpoint_arn_ : string_)
    ~attributes:(attributes_ : map_string_to_string) () =
  ({ endpoint_arn = endpoint_arn_; attributes = attributes_ } : set_endpoint_attributes_input)

let make_remove_permission_input ~topic_arn:(topic_arn_ : topic_ar_n) ~label:(label_ : label) () =
  ({ topic_arn = topic_arn_; label = label_ } : remove_permission_input)

let make_put_data_protection_policy_input ~resource_arn:(resource_arn_ : topic_ar_n)
    ~data_protection_policy:(data_protection_policy_ : attribute_value) () =
  ({ resource_arn = resource_arn_; data_protection_policy = data_protection_policy_ }
    : put_data_protection_policy_input)

let make_batch_result_error_entry ?message:(message_ : string_ option) ~id:(id_ : string_)
    ~code:(code_ : string_) ~sender_fault:(sender_fault_ : boolean_) () =
  ({ id = id_; code = code_; message = message_; sender_fault = sender_fault_ }
    : batch_result_error_entry)

let make_publish_batch_result_entry ?id:(id_ : string_ option)
    ?message_id:(message_id_ : message_id option)
    ?sequence_number:(sequence_number_ : string_ option) () =
  ({ id = id_; message_id = message_id_; sequence_number = sequence_number_ }
    : publish_batch_result_entry)

let make_publish_batch_response ?successful:(successful_ : publish_batch_result_entry_list option)
    ?failed:(failed_ : batch_result_error_entry_list option) () =
  ({ successful = successful_; failed = failed_ } : publish_batch_response)

let make_message_attribute_value ?string_value:(string_value_ : string_ option)
    ?binary_value:(binary_value_ : binary option) ~data_type:(data_type_ : string_) () =
  ({ data_type = data_type_; string_value = string_value_; binary_value = binary_value_ }
    : message_attribute_value)

let make_publish_batch_request_entry ?subject:(subject_ : subject option)
    ?message_structure:(message_structure_ : message_structure option)
    ?message_attributes:(message_attributes_ : message_attribute_map option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_group_id:(message_group_id_ : string_ option) ~id:(id_ : string_)
    ~message:(message_ : message) () =
  ({
     id = id_;
     message = message_;
     subject = subject_;
     message_structure = message_structure_;
     message_attributes = message_attributes_;
     message_deduplication_id = message_deduplication_id_;
     message_group_id = message_group_id_;
   }
    : publish_batch_request_entry)

let make_publish_batch_input ~topic_arn:(topic_arn_ : topic_ar_n)
    ~publish_batch_request_entries:
      (publish_batch_request_entries_ : publish_batch_request_entry_list) () =
  ({ topic_arn = topic_arn_; publish_batch_request_entries = publish_batch_request_entries_ }
    : publish_batch_input)

let make_publish_response ?message_id:(message_id_ : message_id option)
    ?sequence_number:(sequence_number_ : string_ option) () =
  ({ message_id = message_id_; sequence_number = sequence_number_ } : publish_response)

let make_publish_input ?topic_arn:(topic_arn_ : topic_ar_n option)
    ?target_arn:(target_arn_ : string_ option) ?phone_number:(phone_number_ : phone_number option)
    ?subject:(subject_ : subject option)
    ?message_structure:(message_structure_ : message_structure option)
    ?message_attributes:(message_attributes_ : message_attribute_map option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_group_id:(message_group_id_ : string_ option) ~message:(message_ : message) () =
  ({
     topic_arn = topic_arn_;
     target_arn = target_arn_;
     phone_number = phone_number_;
     message = message_;
     subject = subject_;
     message_structure = message_structure_;
     message_attributes = message_attributes_;
     message_deduplication_id = message_deduplication_id_;
     message_group_id = message_group_id_;
   }
    : publish_input)

let make_opt_in_phone_number_response () = (() : unit)

let make_opt_in_phone_number_input ~phone_number:(phone_number_ : phone_number) () =
  ({ phone_number = phone_number_ } : opt_in_phone_number_input)

let make_topic ?topic_arn:(topic_arn_ : topic_ar_n option) () = ({ topic_arn = topic_arn_ } : topic)

let make_list_topics_response ?topics:(topics_ : topics_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ topics = topics_; next_token = next_token_ } : list_topics_response)

let make_list_topics_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_topics_input)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_subscription ?subscription_arn:(subscription_arn_ : subscription_ar_n option)
    ?owner:(owner_ : account option) ?protocol:(protocol_ : protocol option)
    ?endpoint:(endpoint_ : endpoint2 option) ?topic_arn:(topic_arn_ : topic_ar_n option) () =
  ({
     subscription_arn = subscription_arn_;
     owner = owner_;
     protocol = protocol_;
     endpoint = endpoint_;
     topic_arn = topic_arn_;
   }
    : subscription)

let make_list_subscriptions_by_topic_response
    ?subscriptions:(subscriptions_ : subscriptions_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ subscriptions = subscriptions_; next_token = next_token_ }
    : list_subscriptions_by_topic_response)

let make_list_subscriptions_by_topic_input ?next_token:(next_token_ : next_token option)
    ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ topic_arn = topic_arn_; next_token = next_token_ } : list_subscriptions_by_topic_input)

let make_list_subscriptions_response ?subscriptions:(subscriptions_ : subscriptions_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ subscriptions = subscriptions_; next_token = next_token_ } : list_subscriptions_response)

let make_list_subscriptions_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_subscriptions_input)

let make_sms_sandbox_phone_number ?phone_number:(phone_number_ : phone_number_string option)
    ?status:(status_ : sms_sandbox_phone_number_verification_status option) () =
  ({ phone_number = phone_number_; status = status_ } : sms_sandbox_phone_number)

let make_list_sms_sandbox_phone_numbers_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_items option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_sms_sandbox_phone_numbers_input)

let make_platform_application ?platform_application_arn:(platform_application_arn_ : string_ option)
    ?attributes:(attributes_ : map_string_to_string option) () =
  ({ platform_application_arn = platform_application_arn_; attributes = attributes_ }
    : platform_application)

let make_list_platform_applications_response
    ?platform_applications:(platform_applications_ : list_of_platform_applications option)
    ?next_token:(next_token_ : string_ option) () =
  ({ platform_applications = platform_applications_; next_token = next_token_ }
    : list_platform_applications_response)

let make_list_platform_applications_input ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_platform_applications_input)

let make_list_phone_numbers_opted_out_response
    ?phone_numbers:(phone_numbers_ : phone_number_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ phone_numbers = phone_numbers_; next_token = next_token_ }
    : list_phone_numbers_opted_out_response)

let make_list_phone_numbers_opted_out_input ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_phone_numbers_opted_out_input)

let make_phone_number_information ?created_at:(created_at_ : timestamp option)
    ?phone_number:(phone_number_ : phone_number option) ?status:(status_ : string_ option)
    ?iso2_country_code:(iso2_country_code_ : iso2_country_code option)
    ?route_type:(route_type_ : route_type option)
    ?number_capabilities:(number_capabilities_ : number_capability_list option) () =
  ({
     created_at = created_at_;
     phone_number = phone_number_;
     status = status_;
     iso2_country_code = iso2_country_code_;
     route_type = route_type_;
     number_capabilities = number_capabilities_;
   }
    : phone_number_information)

let make_list_origination_numbers_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_items_list_origination_numbers option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_origination_numbers_request)

let make_endpoint ?endpoint_arn:(endpoint_arn_ : string_ option)
    ?attributes:(attributes_ : map_string_to_string option) () =
  ({ endpoint_arn = endpoint_arn_; attributes = attributes_ } : endpoint)

let make_list_endpoints_by_platform_application_response
    ?endpoints:(endpoints_ : list_of_endpoints option) ?next_token:(next_token_ : string_ option) ()
    =
  ({ endpoints = endpoints_; next_token = next_token_ }
    : list_endpoints_by_platform_application_response)

let make_list_endpoints_by_platform_application_input ?next_token:(next_token_ : string_ option)
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({ platform_application_arn = platform_application_arn_; next_token = next_token_ }
    : list_endpoints_by_platform_application_input)

let make_get_topic_attributes_response ?attributes:(attributes_ : topic_attributes_map option) () =
  ({ attributes = attributes_ } : get_topic_attributes_response)

let make_get_topic_attributes_input ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ topic_arn = topic_arn_ } : get_topic_attributes_input)

let make_get_subscription_attributes_response
    ?attributes:(attributes_ : subscription_attributes_map option) () =
  ({ attributes = attributes_ } : get_subscription_attributes_response)

let make_get_subscription_attributes_input ~subscription_arn:(subscription_arn_ : subscription_ar_n)
    () =
  ({ subscription_arn = subscription_arn_ } : get_subscription_attributes_input)

let make_get_sms_sandbox_account_status_input () = (() : unit)

let make_get_sms_attributes_response ?attributes:(attributes_ : map_string_to_string option) () =
  ({ attributes = attributes_ } : get_sms_attributes_response)

let make_get_sms_attributes_input ?attributes:(attributes_ : list_string option) () =
  ({ attributes = attributes_ } : get_sms_attributes_input)

let make_get_platform_application_attributes_response
    ?attributes:(attributes_ : map_string_to_string option) () =
  ({ attributes = attributes_ } : get_platform_application_attributes_response)

let make_get_platform_application_attributes_input
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({ platform_application_arn = platform_application_arn_ }
    : get_platform_application_attributes_input)

let make_get_endpoint_attributes_response ?attributes:(attributes_ : map_string_to_string option) ()
    =
  ({ attributes = attributes_ } : get_endpoint_attributes_response)

let make_get_endpoint_attributes_input ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_ } : get_endpoint_attributes_input)

let make_get_data_protection_policy_response
    ?data_protection_policy:(data_protection_policy_ : attribute_value option) () =
  ({ data_protection_policy = data_protection_policy_ } : get_data_protection_policy_response)

let make_get_data_protection_policy_input ~resource_arn:(resource_arn_ : topic_ar_n) () =
  ({ resource_arn = resource_arn_ } : get_data_protection_policy_input)

let make_delete_topic_input ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ topic_arn = topic_arn_ } : delete_topic_input)

let make_delete_sms_sandbox_phone_number_input ~phone_number:(phone_number_ : phone_number_string)
    () =
  ({ phone_number = phone_number_ } : delete_sms_sandbox_phone_number_input)

let make_delete_platform_application_input
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({ platform_application_arn = platform_application_arn_ } : delete_platform_application_input)

let make_delete_endpoint_input ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ endpoint_arn = endpoint_arn_ } : delete_endpoint_input)

let make_create_topic_response ?topic_arn:(topic_arn_ : topic_ar_n option) () =
  ({ topic_arn = topic_arn_ } : create_topic_response)

let make_create_topic_input ?attributes:(attributes_ : topic_attributes_map option)
    ?tags:(tags_ : tag_list option)
    ?data_protection_policy:(data_protection_policy_ : attribute_value option)
    ~name:(name_ : topic_name) () =
  ({
     name = name_;
     attributes = attributes_;
     tags = tags_;
     data_protection_policy = data_protection_policy_;
   }
    : create_topic_input)

let make_create_sms_sandbox_phone_number_input
    ?language_code:(language_code_ : language_code_string option)
    ~phone_number:(phone_number_ : phone_number_string) () =
  ({ phone_number = phone_number_; language_code = language_code_ }
    : create_sms_sandbox_phone_number_input)

let make_create_endpoint_response ?endpoint_arn:(endpoint_arn_ : string_ option) () =
  ({ endpoint_arn = endpoint_arn_ } : create_endpoint_response)

let make_create_platform_endpoint_input ?custom_user_data:(custom_user_data_ : string_ option)
    ?attributes:(attributes_ : map_string_to_string option)
    ~platform_application_arn:(platform_application_arn_ : string_) ~token:(token_ : string_) () =
  ({
     platform_application_arn = platform_application_arn_;
     token = token_;
     custom_user_data = custom_user_data_;
     attributes = attributes_;
   }
    : create_platform_endpoint_input)

let make_create_platform_application_response
    ?platform_application_arn:(platform_application_arn_ : string_ option) () =
  ({ platform_application_arn = platform_application_arn_ } : create_platform_application_response)

let make_create_platform_application_input ~name:(name_ : string_) ~platform:(platform_ : string_)
    ~attributes:(attributes_ : map_string_to_string) () =
  ({ name = name_; platform = platform_; attributes = attributes_ }
    : create_platform_application_input)

let make_confirm_subscription_response
    ?subscription_arn:(subscription_arn_ : subscription_ar_n option) () =
  ({ subscription_arn = subscription_arn_ } : confirm_subscription_response)

let make_confirm_subscription_input
    ?authenticate_on_unsubscribe:(authenticate_on_unsubscribe_ : authenticate_on_unsubscribe option)
    ~topic_arn:(topic_arn_ : topic_ar_n) ~token:(token_ : token) () =
  ({
     topic_arn = topic_arn_;
     token = token_;
     authenticate_on_unsubscribe = authenticate_on_unsubscribe_;
   }
    : confirm_subscription_input)

let make_check_if_phone_number_is_opted_out_response ?is_opted_out:(is_opted_out_ : boolean_ option)
    () =
  ({ is_opted_out = is_opted_out_ } : check_if_phone_number_is_opted_out_response)

let make_check_if_phone_number_is_opted_out_input ~phone_number:(phone_number_ : phone_number) () =
  ({ phone_number = phone_number_ } : check_if_phone_number_is_opted_out_input)
