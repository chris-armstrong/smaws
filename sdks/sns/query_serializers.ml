open Types

let topic_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let topic_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subscription_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let protocol_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_structure_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let label_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let delegate_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let authenticate_on_unsubscribe_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let attribute_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let action_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let account_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let verify_sms_sandbox_phone_number_result_to_query path _x = []
let phone_number_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let otp_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verify_sms_sandbox_phone_number_input_to_query path (x : verify_sms_sandbox_phone_number_input)
    =
  List.concat
    [
      otp_code_to_query (List.append path [ "OneTimePassword" ]) x.one_time_password;
      phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number;
    ]

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verification_exception_to_query path (x : verification_exception) =
  List.concat
    [
      string__to_query (List.append path [ "Status" ]) x.status;
      string__to_query (List.append path [ "Message" ]) x.message;
    ]

let throttled_exception_to_query path (x : throttled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let resource_not_found_exception_to_query path (x : resource_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let invalid_parameter_exception_to_query path (x : invalid_parameter_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let internal_error_exception_to_query path (x : internal_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let authorization_error_exception_to_query path (x : authorization_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let validation_exception_to_query path (x : validation_exception) =
  List.concat [ string__to_query (List.append path [ "Message" ]) x.message ]

let user_error_exception_to_query path (x : user_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let untag_resource_response_to_query path _x = []

let amazon_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let untag_resource_request_to_query path (x : untag_resource_request) =
  List.concat
    [
      tag_key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
      amazon_resource_name_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let tag_policy_exception_to_query path (x : tag_policy_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let tag_limit_exceeded_exception_to_query path (x : tag_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let stale_tag_exception_to_query path (x : stale_tag_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let concurrent_access_exception_to_query path (x : concurrent_access_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let unsubscribe_input_to_query path (x : unsubscribe_input) =
  List.concat
    [ subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) x.subscription_arn ]

let not_found_exception_to_query path (x : not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let invalid_security_exception_to_query path (x : invalid_security_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let topic_to_query path (x : topic) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let topics_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" topic_to_query path xs

let topic_limit_exceeded_exception_to_query path (x : topic_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let topic_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" attribute_name_to_query
    attribute_value_to_query path pairs

let too_many_entries_in_batch_request_exception_to_query path
    (x : too_many_entries_in_batch_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_resource_response_to_query path _x = []

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_value_to_query (List.append path [ "Value" ]) x.value;
      tag_key_to_query (List.append path [ "Key" ]) x.key;
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let tag_resource_request_to_query path (x : tag_resource_request) =
  List.concat
    [
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
      amazon_resource_name_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let endpoint2_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let subscription_to_query path (x : subscription) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint2_to_query (List.append path [ "Endpoint" ]) v);
      (match x.protocol with
      | None -> []
      | Some v -> protocol_to_query (List.append path [ "Protocol" ]) v);
      (match x.owner with
      | None -> []
      | Some v -> account_to_query (List.append path [ "Owner" ]) v);
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
    ]

let subscriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" subscription_to_query path xs

let subscription_limit_exceeded_exception_to_query path (x : subscription_limit_exceeded_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let subscription_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" attribute_name_to_query
    attribute_value_to_query path pairs

let subscribe_response_to_query path (x : subscribe_response) =
  List.concat
    [
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
    ]

let subscribe_input_to_query path (x : subscribe_input) =
  List.concat
    [
      (match x.return_subscription_arn with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnSubscriptionArn" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> subscription_attributes_map_to_query (List.append path [ "Attributes" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint2_to_query (List.append path [ "Endpoint" ]) v);
      protocol_to_query (List.append path [ "Protocol" ]) x.protocol;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let replay_limit_exceeded_exception_to_query path (x : replay_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let filter_policy_limit_exceeded_exception_to_query path
    (x : filter_policy_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let set_topic_attributes_input_to_query path (x : set_topic_attributes_input) =
  List.concat
    [
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
      attribute_name_to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let set_subscription_attributes_input_to_query path (x : set_subscription_attributes_input) =
  List.concat
    [
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
      attribute_name_to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) x.subscription_arn;
    ]

let set_sms_attributes_response_to_query path _x = []

let map_string_to_string_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" string__to_query
    string__to_query path pairs

let set_sms_attributes_input_to_query path (x : set_sms_attributes_input) =
  List.concat [ map_string_to_string_to_query (List.append path [ "attributes" ]) x.attributes ]

let set_platform_application_attributes_input_to_query path
    (x : set_platform_application_attributes_input) =
  List.concat
    [
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
    ]

let set_endpoint_attributes_input_to_query path (x : set_endpoint_attributes_input) =
  List.concat
    [
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
      string__to_query (List.append path [ "EndpointArn" ]) x.endpoint_arn;
    ]

let sms_sandbox_phone_number_verification_status_to_query path
    (x : sms_sandbox_phone_number_verification_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Verified -> "Verified" | Pending -> "Pending")

let sms_sandbox_phone_number_to_query path (x : sms_sandbox_phone_number) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v ->
          sms_sandbox_phone_number_verification_status_to_query (List.append path [ "Status" ]) v);
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_string_to_query (List.append path [ "PhoneNumber" ]) v);
    ]

let sms_sandbox_phone_number_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" sms_sandbox_phone_number_to_query
    path xs

let route_type_to_query path (x : route_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Premium -> "Premium"
    | Promotional -> "Promotional"
    | Transactional -> "Transactional")

let remove_permission_input_to_query path (x : remove_permission_input) =
  List.concat
    [
      label_to_query (List.append path [ "Label" ]) x.label;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let put_data_protection_policy_input_to_query path (x : put_data_protection_policy_input) =
  List.concat
    [
      attribute_value_to_query
        (List.append path [ "DataProtectionPolicy" ])
        x.data_protection_policy;
      topic_ar_n_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
    ]

let publish_response_to_query path (x : publish_response) =
  List.concat
    [
      (match x.sequence_number with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SequenceNumber" ]) v);
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
    ]

let phone_number_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let binary_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let message_attribute_value_to_query path (x : message_attribute_value) =
  List.concat
    [
      (match x.binary_value with
      | None -> []
      | Some v -> binary_to_query (List.append path [ "BinaryValue" ]) v);
      (match x.string_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StringValue" ]) v);
      string__to_query (List.append path [ "DataType" ]) x.data_type;
    ]

let message_attribute_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "Name" "Value" string__to_query
    message_attribute_value_to_query path pairs

let publish_input_to_query path (x : publish_input) =
  List.concat
    [
      (match x.message_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageGroupId" ]) v);
      (match x.message_deduplication_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageDeduplicationId" ]) v);
      (match x.message_attributes with
      | None -> []
      | Some v -> message_attribute_map_to_query (List.append path [ "MessageAttributes" ]) v);
      (match x.message_structure with
      | None -> []
      | Some v -> message_structure_to_query (List.append path [ "MessageStructure" ]) v);
      (match x.subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "Subject" ]) v);
      message_to_query (List.append path [ "Message" ]) x.message;
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_to_query (List.append path [ "PhoneNumber" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetArn" ]) v);
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let publish_batch_result_entry_to_query path (x : publish_batch_result_entry) =
  List.concat
    [
      (match x.sequence_number with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SequenceNumber" ]) v);
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
      (match x.id with None -> [] | Some v -> string__to_query (List.append path [ "Id" ]) v);
    ]

let publish_batch_result_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" publish_batch_result_entry_to_query
    path xs

let batch_result_error_entry_to_query path (x : batch_result_error_entry) =
  List.concat
    [
      boolean__to_query (List.append path [ "SenderFault" ]) x.sender_fault;
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      string__to_query (List.append path [ "Code" ]) x.code;
      string__to_query (List.append path [ "Id" ]) x.id;
    ]

let batch_result_error_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" batch_result_error_entry_to_query
    path xs

let publish_batch_response_to_query path (x : publish_batch_response) =
  List.concat
    [
      (match x.failed with
      | None -> []
      | Some v -> batch_result_error_entry_list_to_query (List.append path [ "Failed" ]) v);
      (match x.successful with
      | None -> []
      | Some v -> publish_batch_result_entry_list_to_query (List.append path [ "Successful" ]) v);
    ]

let publish_batch_request_entry_to_query path (x : publish_batch_request_entry) =
  List.concat
    [
      (match x.message_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageGroupId" ]) v);
      (match x.message_deduplication_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageDeduplicationId" ]) v);
      (match x.message_attributes with
      | None -> []
      | Some v -> message_attribute_map_to_query (List.append path [ "MessageAttributes" ]) v);
      (match x.message_structure with
      | None -> []
      | Some v -> message_structure_to_query (List.append path [ "MessageStructure" ]) v);
      (match x.subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "Subject" ]) v);
      message_to_query (List.append path [ "Message" ]) x.message;
      string__to_query (List.append path [ "Id" ]) x.id;
    ]

let publish_batch_request_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" publish_batch_request_entry_to_query
    path xs

let publish_batch_input_to_query path (x : publish_batch_input) =
  List.concat
    [
      publish_batch_request_entry_list_to_query
        (List.append path [ "PublishBatchRequestEntries" ])
        x.publish_batch_request_entries;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let platform_application_disabled_exception_to_query path
    (x : platform_application_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_throttling_exception_to_query path (x : kms_throttling_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_opt_in_required_to_query path (x : kms_opt_in_required) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_not_found_exception_to_query path (x : kms_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_invalid_state_exception_to_query path (x : kms_invalid_state_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_disabled_exception_to_query path (x : kms_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let kms_access_denied_exception_to_query path (x : kms_access_denied_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let invalid_parameter_value_exception_to_query path (x : invalid_parameter_value_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let invalid_batch_entry_id_exception_to_query path (x : invalid_batch_entry_id_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let endpoint_disabled_exception_to_query path (x : endpoint_disabled_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let empty_batch_request_exception_to_query path (x : empty_batch_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let batch_request_too_long_exception_to_query path (x : batch_request_too_long_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let batch_entry_ids_not_distinct_exception_to_query path
    (x : batch_entry_ids_not_distinct_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let platform_application_to_query path (x : platform_application) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
      (match x.platform_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PlatformApplicationArn" ]) v);
    ]

let phone_number_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" phone_number_to_query path xs

let iso2_country_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let number_capability_to_query path (x : number_capability) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with VOICE -> "VOICE" | MMS -> "MMS" | SMS -> "SMS")

let number_capability_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" number_capability_to_query path xs

let phone_number_information_to_query path (x : phone_number_information) =
  List.concat
    [
      (match x.number_capabilities with
      | None -> []
      | Some v -> number_capability_list_to_query (List.append path [ "NumberCapabilities" ]) v);
      (match x.route_type with
      | None -> []
      | Some v -> route_type_to_query (List.append path [ "RouteType" ]) v);
      (match x.iso2_country_code with
      | None -> []
      | Some v -> iso2_country_code_to_query (List.append path [ "Iso2CountryCode" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_to_query (List.append path [ "PhoneNumber" ]) v);
      (match x.created_at with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreatedAt" ]) v);
    ]

let phone_number_information_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" phone_number_information_to_query
    path xs

let opted_out_exception_to_query path (x : opted_out_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let opt_in_phone_number_response_to_query path _x = []

let opt_in_phone_number_input_to_query path (x : opt_in_phone_number_input) =
  List.concat [ phone_number_to_query (List.append path [ "phoneNumber" ]) x.phone_number ]

let max_items_list_origination_numbers_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let max_items_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_topics_response_to_query path (x : list_topics_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.topics with
      | None -> []
      | Some v -> topics_list_to_query (List.append path [ "Topics" ]) v);
    ]

let list_topics_input_to_query path (x : list_topics_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_tags_for_resource_response_to_query path (x : list_tags_for_resource_response) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
    ]

let list_tags_for_resource_request_to_query path (x : list_tags_for_resource_request) =
  List.concat [ amazon_resource_name_to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let list_subscriptions_response_to_query path (x : list_subscriptions_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.subscriptions with
      | None -> []
      | Some v -> subscriptions_list_to_query (List.append path [ "Subscriptions" ]) v);
    ]

let list_subscriptions_input_to_query path (x : list_subscriptions_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_subscriptions_by_topic_response_to_query path (x : list_subscriptions_by_topic_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.subscriptions with
      | None -> []
      | Some v -> subscriptions_list_to_query (List.append path [ "Subscriptions" ]) v);
    ]

let list_subscriptions_by_topic_input_to_query path (x : list_subscriptions_by_topic_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let list_string_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

let list_sms_sandbox_phone_numbers_result_to_query path (x : list_sms_sandbox_phone_numbers_result)
    =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      sms_sandbox_phone_number_list_to_query (List.append path [ "PhoneNumbers" ]) x.phone_numbers;
    ]

let list_sms_sandbox_phone_numbers_input_to_query path (x : list_sms_sandbox_phone_numbers_input) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_items_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_of_platform_applications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_application_to_query path
    xs

let list_platform_applications_response_to_query path (x : list_platform_applications_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      (match x.platform_applications with
      | None -> []
      | Some v ->
          list_of_platform_applications_to_query (List.append path [ "PlatformApplications" ]) v);
    ]

let list_platform_applications_input_to_query path (x : list_platform_applications_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let list_phone_numbers_opted_out_response_to_query path (x : list_phone_numbers_opted_out_response)
    =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "nextToken" ]) v);
      (match x.phone_numbers with
      | None -> []
      | Some v -> phone_number_list_to_query (List.append path [ "phoneNumbers" ]) v);
    ]

let list_phone_numbers_opted_out_input_to_query path (x : list_phone_numbers_opted_out_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "nextToken" ]) v);
    ]

let list_origination_numbers_result_to_query path (x : list_origination_numbers_result) =
  List.concat
    [
      (match x.phone_numbers with
      | None -> []
      | Some v -> phone_number_information_list_to_query (List.append path [ "PhoneNumbers" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_origination_numbers_request_to_query path (x : list_origination_numbers_request) =
  List.concat
    [
      (match x.max_results with
      | None -> []
      | Some v -> max_items_list_origination_numbers_to_query (List.append path [ "MaxResults" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
      (match x.endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointArn" ]) v);
    ]

let list_of_endpoints_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" endpoint_to_query path xs

let list_endpoints_by_platform_application_response_to_query path
    (x : list_endpoints_by_platform_application_response) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      (match x.endpoints with
      | None -> []
      | Some v -> list_of_endpoints_to_query (List.append path [ "Endpoints" ]) v);
    ]

let list_endpoints_by_platform_application_input_to_query path
    (x : list_endpoints_by_platform_application_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
    ]

let language_code_string_to_query path (x : language_code_string) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Zh_TW -> "zh-TW"
    | Zh_CN -> "zh-CN"
    | Kr_KR -> "kr-KR"
    | Pt_BR -> "pt-BR"
    | Jp_JP -> "ja-JP"
    | It_IT -> "it-IT"
    | Fr_FR -> "fr-FR"
    | Fr_CA -> "fr-CA"
    | De_DE -> "de-DE"
    | Es_ES -> "es-ES"
    | Es_419 -> "es-419"
    | En_GB -> "en-GB"
    | En_US -> "en-US")

let invalid_state_exception_to_query path (x : invalid_state_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let get_topic_attributes_response_to_query path (x : get_topic_attributes_response) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> topic_attributes_map_to_query (List.append path [ "Attributes" ]) v);
    ]

let get_topic_attributes_input_to_query path (x : get_topic_attributes_input) =
  List.concat [ topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn ]

let get_subscription_attributes_response_to_query path (x : get_subscription_attributes_response) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> subscription_attributes_map_to_query (List.append path [ "Attributes" ]) v);
    ]

let get_subscription_attributes_input_to_query path (x : get_subscription_attributes_input) =
  List.concat
    [ subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) x.subscription_arn ]

let get_sms_sandbox_account_status_result_to_query path (x : get_sms_sandbox_account_status_result)
    =
  List.concat [ boolean__to_query (List.append path [ "IsInSandbox" ]) x.is_in_sandbox ]

let get_sms_sandbox_account_status_input_to_query path _x = []

let get_sms_attributes_response_to_query path (x : get_sms_attributes_response) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "attributes" ]) v);
    ]

let get_sms_attributes_input_to_query path (x : get_sms_attributes_input) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> list_string_to_query (List.append path [ "attributes" ]) v);
    ]

let get_platform_application_attributes_response_to_query path
    (x : get_platform_application_attributes_response) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
    ]

let get_platform_application_attributes_input_to_query path
    (x : get_platform_application_attributes_input) =
  List.concat
    [ string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn ]

let get_endpoint_attributes_response_to_query path (x : get_endpoint_attributes_response) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
    ]

let get_endpoint_attributes_input_to_query path (x : get_endpoint_attributes_input) =
  List.concat [ string__to_query (List.append path [ "EndpointArn" ]) x.endpoint_arn ]

let get_data_protection_policy_response_to_query path (x : get_data_protection_policy_response) =
  List.concat
    [
      (match x.data_protection_policy with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "DataProtectionPolicy" ]) v);
    ]

let get_data_protection_policy_input_to_query path (x : get_data_protection_policy_input) =
  List.concat [ topic_ar_n_to_query (List.append path [ "ResourceArn" ]) x.resource_arn ]

let delete_topic_input_to_query path (x : delete_topic_input) =
  List.concat [ topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn ]

let delete_sms_sandbox_phone_number_result_to_query path _x = []

let delete_sms_sandbox_phone_number_input_to_query path (x : delete_sms_sandbox_phone_number_input)
    =
  List.concat [ phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number ]

let delete_platform_application_input_to_query path (x : delete_platform_application_input) =
  List.concat
    [ string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn ]

let delete_endpoint_input_to_query path (x : delete_endpoint_input) =
  List.concat [ string__to_query (List.append path [ "EndpointArn" ]) x.endpoint_arn ]

let delegates_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" delegate_to_query path xs

let create_topic_response_to_query path (x : create_topic_response) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let create_topic_input_to_query path (x : create_topic_input) =
  List.concat
    [
      (match x.data_protection_policy with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "DataProtectionPolicy" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> topic_attributes_map_to_query (List.append path [ "Attributes" ]) v);
      topic_name_to_query (List.append path [ "Name" ]) x.name;
    ]

let create_sms_sandbox_phone_number_result_to_query path _x = []

let create_sms_sandbox_phone_number_input_to_query path (x : create_sms_sandbox_phone_number_input)
    =
  List.concat
    [
      (match x.language_code with
      | None -> []
      | Some v -> language_code_string_to_query (List.append path [ "LanguageCode" ]) v);
      phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number;
    ]

let create_platform_endpoint_input_to_query path (x : create_platform_endpoint_input) =
  List.concat
    [
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
      (match x.custom_user_data with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomUserData" ]) v);
      string__to_query (List.append path [ "Token" ]) x.token;
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
    ]

let create_endpoint_response_to_query path (x : create_endpoint_response) =
  List.concat
    [
      (match x.endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointArn" ]) v);
    ]

let create_platform_application_response_to_query path (x : create_platform_application_response) =
  List.concat
    [
      (match x.platform_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PlatformApplicationArn" ]) v);
    ]

let create_platform_application_input_to_query path (x : create_platform_application_input) =
  List.concat
    [
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
      string__to_query (List.append path [ "Platform" ]) x.platform;
      string__to_query (List.append path [ "Name" ]) x.name;
    ]

let confirm_subscription_response_to_query path (x : confirm_subscription_response) =
  List.concat
    [
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
    ]

let confirm_subscription_input_to_query path (x : confirm_subscription_input) =
  List.concat
    [
      (match x.authenticate_on_unsubscribe with
      | None -> []
      | Some v ->
          authenticate_on_unsubscribe_to_query (List.append path [ "AuthenticateOnUnsubscribe" ]) v);
      token_to_query (List.append path [ "Token" ]) x.token;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]

let check_if_phone_number_is_opted_out_response_to_query path
    (x : check_if_phone_number_is_opted_out_response) =
  List.concat
    [
      (match x.is_opted_out with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "isOptedOut" ]) v);
    ]

let check_if_phone_number_is_opted_out_input_to_query path
    (x : check_if_phone_number_is_opted_out_input) =
  List.concat [ phone_number_to_query (List.append path [ "phoneNumber" ]) x.phone_number ]

let actions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" action_to_query path xs

let add_permission_input_to_query path (x : add_permission_input) =
  List.concat
    [
      actions_list_to_query (List.append path [ "ActionName" ]) x.action_name;
      delegates_list_to_query (List.append path [ "AWSAccountId" ]) x.aws_account_id;
      label_to_query (List.append path [ "Label" ]) x.label;
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
    ]
