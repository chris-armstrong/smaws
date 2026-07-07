open Types

let make_verify_sms_sandbox_phone_number_input ~one_time_password:(one_time_password_ : otp_code)
    ~phone_number:(phone_number_ : phone_number_string) () =
  ({ one_time_password = one_time_password_; phone_number = phone_number_ }
    : verify_sms_sandbox_phone_number_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_unsubscribe_input ~subscription_arn:(subscription_arn_ : subscription_ar_n) () =
  ({ subscription_arn = subscription_arn_ } : unsubscribe_input)

let make_topic ?topic_arn:(topic_arn_ : topic_ar_n option) () = ({ topic_arn = topic_arn_ } : topic)
let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_subscription ?topic_arn:(topic_arn_ : topic_ar_n option)
    ?endpoint:(endpoint_ : endpoint2 option) ?protocol:(protocol_ : protocol option)
    ?owner:(owner_ : account option)
    ?subscription_arn:(subscription_arn_ : subscription_ar_n option) () =
  ({
     topic_arn = topic_arn_;
     endpoint = endpoint_;
     protocol = protocol_;
     owner = owner_;
     subscription_arn = subscription_arn_;
   }
    : subscription)

let make_subscribe_response ?subscription_arn:(subscription_arn_ : subscription_ar_n option) () =
  ({ subscription_arn = subscription_arn_ } : subscribe_response)

let make_subscribe_input ?return_subscription_arn:(return_subscription_arn_ : boolean_ option)
    ?attributes:(attributes_ : subscription_attributes_map option)
    ?endpoint:(endpoint_ : endpoint2 option) ~protocol:(protocol_ : protocol)
    ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({
     return_subscription_arn = return_subscription_arn_;
     attributes = attributes_;
     endpoint = endpoint_;
     protocol = protocol_;
     topic_arn = topic_arn_;
   }
    : subscribe_input)

let make_set_topic_attributes_input ?attribute_value:(attribute_value_ : attribute_value option)
    ~attribute_name:(attribute_name_ : attribute_name) ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ attribute_value = attribute_value_; attribute_name = attribute_name_; topic_arn = topic_arn_ }
    : set_topic_attributes_input)

let make_set_subscription_attributes_input
    ?attribute_value:(attribute_value_ : attribute_value option)
    ~attribute_name:(attribute_name_ : attribute_name)
    ~subscription_arn:(subscription_arn_ : subscription_ar_n) () =
  ({
     attribute_value = attribute_value_;
     attribute_name = attribute_name_;
     subscription_arn = subscription_arn_;
   }
    : set_subscription_attributes_input)

let make_set_sms_attributes_response () = (() : unit)

let make_set_sms_attributes_input ~attributes:(attributes_ : map_string_to_string) () =
  ({ attributes = attributes_ } : set_sms_attributes_input)

let make_set_platform_application_attributes_input ~attributes:(attributes_ : map_string_to_string)
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({ attributes = attributes_; platform_application_arn = platform_application_arn_ }
    : set_platform_application_attributes_input)

let make_set_endpoint_attributes_input ~attributes:(attributes_ : map_string_to_string)
    ~endpoint_arn:(endpoint_arn_ : string_) () =
  ({ attributes = attributes_; endpoint_arn = endpoint_arn_ } : set_endpoint_attributes_input)

let make_sms_sandbox_phone_number
    ?status:(status_ : sms_sandbox_phone_number_verification_status option)
    ?phone_number:(phone_number_ : phone_number_string option) () =
  ({ status = status_; phone_number = phone_number_ } : sms_sandbox_phone_number)

let make_remove_permission_input ~label:(label_ : label) ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ label = label_; topic_arn = topic_arn_ } : remove_permission_input)

let make_put_data_protection_policy_input
    ~data_protection_policy:(data_protection_policy_ : attribute_value)
    ~resource_arn:(resource_arn_ : topic_ar_n) () =
  ({ data_protection_policy = data_protection_policy_; resource_arn = resource_arn_ }
    : put_data_protection_policy_input)

let make_publish_response ?sequence_number:(sequence_number_ : string_ option)
    ?message_id:(message_id_ : message_id option) () =
  ({ sequence_number = sequence_number_; message_id = message_id_ } : publish_response)

let make_message_attribute_value ?binary_value:(binary_value_ : binary option)
    ?string_value:(string_value_ : string_ option) ~data_type:(data_type_ : string_) () =
  ({ binary_value = binary_value_; string_value = string_value_; data_type = data_type_ }
    : message_attribute_value)

let make_publish_input ?message_group_id:(message_group_id_ : string_ option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_attributes:(message_attributes_ : message_attribute_map option)
    ?message_structure:(message_structure_ : message_structure option)
    ?subject:(subject_ : subject option) ?phone_number:(phone_number_ : phone_number option)
    ?target_arn:(target_arn_ : string_ option) ?topic_arn:(topic_arn_ : topic_ar_n option)
    ~message:(message_ : message) () =
  ({
     message_group_id = message_group_id_;
     message_deduplication_id = message_deduplication_id_;
     message_attributes = message_attributes_;
     message_structure = message_structure_;
     subject = subject_;
     message = message_;
     phone_number = phone_number_;
     target_arn = target_arn_;
     topic_arn = topic_arn_;
   }
    : publish_input)

let make_publish_batch_result_entry ?sequence_number:(sequence_number_ : string_ option)
    ?message_id:(message_id_ : message_id option) ?id:(id_ : string_ option) () =
  ({ sequence_number = sequence_number_; message_id = message_id_; id = id_ }
    : publish_batch_result_entry)

let make_batch_result_error_entry ?message:(message_ : string_ option)
    ~sender_fault:(sender_fault_ : boolean_) ~code:(code_ : string_) ~id:(id_ : string_) () =
  ({ sender_fault = sender_fault_; message = message_; code = code_; id = id_ }
    : batch_result_error_entry)

let make_publish_batch_response ?failed:(failed_ : batch_result_error_entry_list option)
    ?successful:(successful_ : publish_batch_result_entry_list option) () =
  ({ failed = failed_; successful = successful_ } : publish_batch_response)

let make_publish_batch_request_entry ?message_group_id:(message_group_id_ : string_ option)
    ?message_deduplication_id:(message_deduplication_id_ : string_ option)
    ?message_attributes:(message_attributes_ : message_attribute_map option)
    ?message_structure:(message_structure_ : message_structure option)
    ?subject:(subject_ : subject option) ~message:(message_ : message) ~id:(id_ : string_) () =
  ({
     message_group_id = message_group_id_;
     message_deduplication_id = message_deduplication_id_;
     message_attributes = message_attributes_;
     message_structure = message_structure_;
     subject = subject_;
     message = message_;
     id = id_;
   }
    : publish_batch_request_entry)

let make_publish_batch_input
    ~publish_batch_request_entries:
      (publish_batch_request_entries_ : publish_batch_request_entry_list)
    ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ publish_batch_request_entries = publish_batch_request_entries_; topic_arn = topic_arn_ }
    : publish_batch_input)

let make_platform_application ?attributes:(attributes_ : map_string_to_string option)
    ?platform_application_arn:(platform_application_arn_ : string_ option) () =
  ({ attributes = attributes_; platform_application_arn = platform_application_arn_ }
    : platform_application)

let make_phone_number_information
    ?number_capabilities:(number_capabilities_ : number_capability_list option)
    ?route_type:(route_type_ : route_type option)
    ?iso2_country_code:(iso2_country_code_ : iso2_country_code option)
    ?status:(status_ : string_ option) ?phone_number:(phone_number_ : phone_number option)
    ?created_at:(created_at_ : timestamp option) () =
  ({
     number_capabilities = number_capabilities_;
     route_type = route_type_;
     iso2_country_code = iso2_country_code_;
     status = status_;
     phone_number = phone_number_;
     created_at = created_at_;
   }
    : phone_number_information)

let make_opt_in_phone_number_response () = (() : unit)

let make_opt_in_phone_number_input ~phone_number:(phone_number_ : phone_number) () =
  ({ phone_number = phone_number_ } : opt_in_phone_number_input)

let make_list_topics_response ?next_token:(next_token_ : next_token option)
    ?topics:(topics_ : topics_list option) () =
  ({ next_token = next_token_; topics = topics_ } : list_topics_response)

let make_list_topics_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_topics_input)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_subscriptions_response ?next_token:(next_token_ : next_token option)
    ?subscriptions:(subscriptions_ : subscriptions_list option) () =
  ({ next_token = next_token_; subscriptions = subscriptions_ } : list_subscriptions_response)

let make_list_subscriptions_input ?next_token:(next_token_ : next_token option) () =
  ({ next_token = next_token_ } : list_subscriptions_input)

let make_list_subscriptions_by_topic_response ?next_token:(next_token_ : next_token option)
    ?subscriptions:(subscriptions_ : subscriptions_list option) () =
  ({ next_token = next_token_; subscriptions = subscriptions_ }
    : list_subscriptions_by_topic_response)

let make_list_subscriptions_by_topic_input ?next_token:(next_token_ : next_token option)
    ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({ next_token = next_token_; topic_arn = topic_arn_ } : list_subscriptions_by_topic_input)

let make_list_sms_sandbox_phone_numbers_input ?max_results:(max_results_ : max_items option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_sms_sandbox_phone_numbers_input)

let make_list_platform_applications_response ?next_token:(next_token_ : string_ option)
    ?platform_applications:(platform_applications_ : list_of_platform_applications option) () =
  ({ next_token = next_token_; platform_applications = platform_applications_ }
    : list_platform_applications_response)

let make_list_platform_applications_input ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_platform_applications_input)

let make_list_phone_numbers_opted_out_response ?next_token:(next_token_ : string_ option)
    ?phone_numbers:(phone_numbers_ : phone_number_list option) () =
  ({ next_token = next_token_; phone_numbers = phone_numbers_ }
    : list_phone_numbers_opted_out_response)

let make_list_phone_numbers_opted_out_input ?next_token:(next_token_ : string_ option) () =
  ({ next_token = next_token_ } : list_phone_numbers_opted_out_input)

let make_list_origination_numbers_request
    ?max_results:(max_results_ : max_items_list_origination_numbers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_origination_numbers_request)

let make_endpoint ?attributes:(attributes_ : map_string_to_string option)
    ?endpoint_arn:(endpoint_arn_ : string_ option) () =
  ({ attributes = attributes_; endpoint_arn = endpoint_arn_ } : endpoint)

let make_list_endpoints_by_platform_application_response ?next_token:(next_token_ : string_ option)
    ?endpoints:(endpoints_ : list_of_endpoints option) () =
  ({ next_token = next_token_; endpoints = endpoints_ }
    : list_endpoints_by_platform_application_response)

let make_list_endpoints_by_platform_application_input ?next_token:(next_token_ : string_ option)
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({ next_token = next_token_; platform_application_arn = platform_application_arn_ }
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

let make_create_topic_input
    ?data_protection_policy:(data_protection_policy_ : attribute_value option)
    ?tags:(tags_ : tag_list option) ?attributes:(attributes_ : topic_attributes_map option)
    ~name:(name_ : topic_name) () =
  ({
     data_protection_policy = data_protection_policy_;
     tags = tags_;
     attributes = attributes_;
     name = name_;
   }
    : create_topic_input)

let make_create_sms_sandbox_phone_number_input
    ?language_code:(language_code_ : language_code_string option)
    ~phone_number:(phone_number_ : phone_number_string) () =
  ({ language_code = language_code_; phone_number = phone_number_ }
    : create_sms_sandbox_phone_number_input)

let make_create_platform_endpoint_input ?attributes:(attributes_ : map_string_to_string option)
    ?custom_user_data:(custom_user_data_ : string_ option) ~token:(token_ : string_)
    ~platform_application_arn:(platform_application_arn_ : string_) () =
  ({
     attributes = attributes_;
     custom_user_data = custom_user_data_;
     token = token_;
     platform_application_arn = platform_application_arn_;
   }
    : create_platform_endpoint_input)

let make_create_endpoint_response ?endpoint_arn:(endpoint_arn_ : string_ option) () =
  ({ endpoint_arn = endpoint_arn_ } : create_endpoint_response)

let make_create_platform_application_response
    ?platform_application_arn:(platform_application_arn_ : string_ option) () =
  ({ platform_application_arn = platform_application_arn_ } : create_platform_application_response)

let make_create_platform_application_input ~attributes:(attributes_ : map_string_to_string)
    ~platform:(platform_ : string_) ~name:(name_ : string_) () =
  ({ attributes = attributes_; platform = platform_; name = name_ }
    : create_platform_application_input)

let make_confirm_subscription_response
    ?subscription_arn:(subscription_arn_ : subscription_ar_n option) () =
  ({ subscription_arn = subscription_arn_ } : confirm_subscription_response)

let make_confirm_subscription_input
    ?authenticate_on_unsubscribe:(authenticate_on_unsubscribe_ : authenticate_on_unsubscribe option)
    ~token:(token_ : token) ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({
     authenticate_on_unsubscribe = authenticate_on_unsubscribe_;
     token = token_;
     topic_arn = topic_arn_;
   }
    : confirm_subscription_input)

let make_check_if_phone_number_is_opted_out_response ?is_opted_out:(is_opted_out_ : boolean_ option)
    () =
  ({ is_opted_out = is_opted_out_ } : check_if_phone_number_is_opted_out_response)

let make_check_if_phone_number_is_opted_out_input ~phone_number:(phone_number_ : phone_number) () =
  ({ phone_number = phone_number_ } : check_if_phone_number_is_opted_out_input)

let make_add_permission_input ~action_name:(action_name_ : actions_list)
    ~aws_account_id:(aws_account_id_ : delegates_list) ~label:(label_ : label)
    ~topic_arn:(topic_arn_ : topic_ar_n) () =
  ({
     action_name = action_name_;
     aws_account_id = aws_account_id_;
     label = label_;
     topic_arn = topic_arn_;
   }
    : add_permission_input)
