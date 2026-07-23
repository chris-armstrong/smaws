open Types

let action_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let actions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" action_to_query path xs

let string__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let not_found_exception_to_query path (x : not_found_exception) =
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

let delegate_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let delegates_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" delegate_to_query path xs

let label_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let topic_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let add_permission_input_to_query path (x : add_permission_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      label_to_query (List.append path [ "Label" ]) x.label;
      delegates_list_to_query (List.append path [ "AWSAccountId" ]) x.aws_account_id;
      actions_list_to_query (List.append path [ "ActionName" ]) x.action_name;
    ]

let amazon_resource_name_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verification_exception_to_query path (x : verification_exception) =
  List.concat
    [
      string__to_query (List.append path [ "Message" ]) x.message;
      string__to_query (List.append path [ "Status" ]) x.status;
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

let verify_sms_sandbox_phone_number_result_to_query path _x = []
let otp_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let phone_number_string_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let verify_sms_sandbox_phone_number_input_to_query path (x : verify_sms_sandbox_phone_number_input)
    =
  List.concat
    [
      phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number;
      otp_code_to_query (List.append path [ "OneTimePassword" ]) x.one_time_password;
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

let untag_resource_response_to_query path _x = []
let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_to_query path xs

let untag_resource_request_to_query path (x : untag_resource_request) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
      tag_key_list_to_query (List.append path [ "TagKeys" ]) x.tag_keys;
    ]

let invalid_security_exception_to_query path (x : invalid_security_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let subscription_ar_n_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let unsubscribe_input_to_query path (x : unsubscribe_input) =
  List.concat
    [ subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) x.subscription_arn ]

let tag_resource_response_to_query path _x = []
let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      tag_key_to_query (List.append path [ "Key" ]) x.key;
      tag_value_to_query (List.append path [ "Value" ]) x.value;
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let tag_resource_request_to_query path (x : tag_resource_request) =
  List.concat
    [
      amazon_resource_name_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
    ]

let subscription_limit_exceeded_exception_to_query path (x : subscription_limit_exceeded_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
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

let subscribe_response_to_query path (x : subscribe_response) =
  List.concat
    [
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
    ]

let boolean__to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let attribute_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let subscription_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" attribute_name_to_query
    attribute_value_to_query path pairs

let endpoint2_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let protocol_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let subscribe_input_to_query path (x : subscribe_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      protocol_to_query (List.append path [ "Protocol" ]) x.protocol;
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint2_to_query (List.append path [ "Endpoint" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> subscription_attributes_map_to_query (List.append path [ "Attributes" ]) v);
      (match x.return_subscription_arn with
      | None -> []
      | Some v -> boolean__to_query (List.append path [ "ReturnSubscriptionArn" ]) v);
    ]

let set_topic_attributes_input_to_query path (x : set_topic_attributes_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      attribute_name_to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
    ]

let set_subscription_attributes_input_to_query path (x : set_subscription_attributes_input) =
  List.concat
    [
      subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) x.subscription_arn;
      attribute_name_to_query (List.append path [ "AttributeName" ]) x.attribute_name;
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
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
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let set_endpoint_attributes_input_to_query path (x : set_endpoint_attributes_input) =
  List.concat
    [
      string__to_query (List.append path [ "EndpointArn" ]) x.endpoint_arn;
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let remove_permission_input_to_query path (x : remove_permission_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      label_to_query (List.append path [ "Label" ]) x.label;
    ]

let put_data_protection_policy_input_to_query path (x : put_data_protection_policy_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "ResourceArn" ]) x.resource_arn;
      attribute_value_to_query
        (List.append path [ "DataProtectionPolicy" ])
        x.data_protection_policy;
    ]

let validation_exception_to_query path (x : validation_exception) =
  List.concat [ string__to_query (List.append path [ "Message" ]) x.message ]

let too_many_entries_in_batch_request_exception_to_query path
    (x : too_many_entries_in_batch_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
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

let batch_result_error_entry_to_query path (x : batch_result_error_entry) =
  List.concat
    [
      string__to_query (List.append path [ "Id" ]) x.id;
      string__to_query (List.append path [ "Code" ]) x.code;
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Message" ]) v);
      boolean__to_query (List.append path [ "SenderFault" ]) x.sender_fault;
    ]

let batch_result_error_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" batch_result_error_entry_to_query
    path xs

let message_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let publish_batch_result_entry_to_query path (x : publish_batch_result_entry) =
  List.concat
    [
      (match x.id with None -> [] | Some v -> string__to_query (List.append path [ "Id" ]) v);
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
      (match x.sequence_number with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SequenceNumber" ]) v);
    ]

let publish_batch_result_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" publish_batch_result_entry_to_query
    path xs

let publish_batch_response_to_query path (x : publish_batch_response) =
  List.concat
    [
      (match x.successful with
      | None -> []
      | Some v -> publish_batch_result_entry_list_to_query (List.append path [ "Successful" ]) v);
      (match x.failed with
      | None -> []
      | Some v -> batch_result_error_entry_list_to_query (List.append path [ "Failed" ]) v);
    ]

let binary_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field path v

let message_attribute_value_to_query path (x : message_attribute_value) =
  List.concat
    [
      string__to_query (List.append path [ "DataType" ]) x.data_type;
      (match x.string_value with
      | None -> []
      | Some v -> string__to_query (List.append path [ "StringValue" ]) v);
      (match x.binary_value with
      | None -> []
      | Some v -> binary_to_query (List.append path [ "BinaryValue" ]) v);
    ]

let message_attribute_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "Name" "Value" string__to_query
    message_attribute_value_to_query path pairs

let message_structure_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let subject_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let message_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let publish_batch_request_entry_to_query path (x : publish_batch_request_entry) =
  List.concat
    [
      string__to_query (List.append path [ "Id" ]) x.id;
      message_to_query (List.append path [ "Message" ]) x.message;
      (match x.subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "Subject" ]) v);
      (match x.message_structure with
      | None -> []
      | Some v -> message_structure_to_query (List.append path [ "MessageStructure" ]) v);
      (match x.message_attributes with
      | None -> []
      | Some v -> message_attribute_map_to_query (List.append path [ "MessageAttributes" ]) v);
      (match x.message_deduplication_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageDeduplicationId" ]) v);
      (match x.message_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageGroupId" ]) v);
    ]

let publish_batch_request_entry_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" publish_batch_request_entry_to_query
    path xs

let publish_batch_input_to_query path (x : publish_batch_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      publish_batch_request_entry_list_to_query
        (List.append path [ "PublishBatchRequestEntries" ])
        x.publish_batch_request_entries;
    ]

let publish_response_to_query path (x : publish_response) =
  List.concat
    [
      (match x.message_id with
      | None -> []
      | Some v -> message_id_to_query (List.append path [ "MessageId" ]) v);
      (match x.sequence_number with
      | None -> []
      | Some v -> string__to_query (List.append path [ "SequenceNumber" ]) v);
    ]

let phone_number_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let publish_input_to_query path (x : publish_input) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
      (match x.target_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "TargetArn" ]) v);
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_to_query (List.append path [ "PhoneNumber" ]) v);
      message_to_query (List.append path [ "Message" ]) x.message;
      (match x.subject with
      | None -> []
      | Some v -> subject_to_query (List.append path [ "Subject" ]) v);
      (match x.message_structure with
      | None -> []
      | Some v -> message_structure_to_query (List.append path [ "MessageStructure" ]) v);
      (match x.message_attributes with
      | None -> []
      | Some v -> message_attribute_map_to_query (List.append path [ "MessageAttributes" ]) v);
      (match x.message_deduplication_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageDeduplicationId" ]) v);
      (match x.message_group_id with
      | None -> []
      | Some v -> string__to_query (List.append path [ "MessageGroupId" ]) v);
    ]

let opt_in_phone_number_response_to_query path _x = []

let opt_in_phone_number_input_to_query path (x : opt_in_phone_number_input) =
  List.concat [ phone_number_to_query (List.append path [ "phoneNumber" ]) x.phone_number ]

let next_token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let topic_to_query path (x : topic) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let topics_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" topic_to_query path xs

let list_topics_response_to_query path (x : list_topics_response) =
  List.concat
    [
      (match x.topics with
      | None -> []
      | Some v -> topics_list_to_query (List.append path [ "Topics" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
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

let account_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let subscription_to_query path (x : subscription) =
  List.concat
    [
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
      (match x.owner with
      | None -> []
      | Some v -> account_to_query (List.append path [ "Owner" ]) v);
      (match x.protocol with
      | None -> []
      | Some v -> protocol_to_query (List.append path [ "Protocol" ]) v);
      (match x.endpoint with
      | None -> []
      | Some v -> endpoint2_to_query (List.append path [ "Endpoint" ]) v);
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let subscriptions_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" subscription_to_query path xs

let list_subscriptions_by_topic_response_to_query path (x : list_subscriptions_by_topic_response) =
  List.concat
    [
      (match x.subscriptions with
      | None -> []
      | Some v -> subscriptions_list_to_query (List.append path [ "Subscriptions" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_subscriptions_by_topic_input_to_query path (x : list_subscriptions_by_topic_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_subscriptions_response_to_query path (x : list_subscriptions_response) =
  List.concat
    [
      (match x.subscriptions with
      | None -> []
      | Some v -> subscriptions_list_to_query (List.append path [ "Subscriptions" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let list_subscriptions_input_to_query path (x : list_subscriptions_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
    ]

let sms_sandbox_phone_number_verification_status_to_query path
    (x : sms_sandbox_phone_number_verification_status) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with Pending -> "Pending" | Verified -> "Verified")

let sms_sandbox_phone_number_to_query path (x : sms_sandbox_phone_number) =
  List.concat
    [
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_string_to_query (List.append path [ "PhoneNumber" ]) v);
      (match x.status with
      | None -> []
      | Some v ->
          sms_sandbox_phone_number_verification_status_to_query (List.append path [ "Status" ]) v);
    ]

let sms_sandbox_phone_number_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" sms_sandbox_phone_number_to_query
    path xs

let list_sms_sandbox_phone_numbers_result_to_query path (x : list_sms_sandbox_phone_numbers_result)
    =
  List.concat
    [
      sms_sandbox_phone_number_list_to_query (List.append path [ "PhoneNumbers" ]) x.phone_numbers;
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let max_items_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_sms_sandbox_phone_numbers_input_to_query path (x : list_sms_sandbox_phone_numbers_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_items_to_query (List.append path [ "MaxResults" ]) v);
    ]

let platform_application_to_query path (x : platform_application) =
  List.concat
    [
      (match x.platform_application_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "PlatformApplicationArn" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
    ]

let list_of_platform_applications_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" platform_application_to_query path
    xs

let list_platform_applications_response_to_query path (x : list_platform_applications_response) =
  List.concat
    [
      (match x.platform_applications with
      | None -> []
      | Some v ->
          list_of_platform_applications_to_query (List.append path [ "PlatformApplications" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let list_platform_applications_input_to_query path (x : list_platform_applications_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let phone_number_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" phone_number_to_query path xs

let list_phone_numbers_opted_out_response_to_query path (x : list_phone_numbers_opted_out_response)
    =
  List.concat
    [
      (match x.phone_numbers with
      | None -> []
      | Some v -> phone_number_list_to_query (List.append path [ "phoneNumbers" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "nextToken" ]) v);
    ]

let list_phone_numbers_opted_out_input_to_query path (x : list_phone_numbers_opted_out_input) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "nextToken" ]) v);
    ]

let number_capability_to_query path (x : number_capability) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with SMS -> "SMS" | MMS -> "MMS" | VOICE -> "VOICE")

let number_capability_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" number_capability_to_query path xs

let route_type_to_query path (x : route_type) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | Transactional -> "Transactional"
    | Promotional -> "Promotional"
    | Premium -> "Premium")

let iso2_country_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let timestamp_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let phone_number_information_to_query path (x : phone_number_information) =
  List.concat
    [
      (match x.created_at with
      | None -> []
      | Some v -> timestamp_to_query (List.append path [ "CreatedAt" ]) v);
      (match x.phone_number with
      | None -> []
      | Some v -> phone_number_to_query (List.append path [ "PhoneNumber" ]) v);
      (match x.status with
      | None -> []
      | Some v -> string__to_query (List.append path [ "Status" ]) v);
      (match x.iso2_country_code with
      | None -> []
      | Some v -> iso2_country_code_to_query (List.append path [ "Iso2CountryCode" ]) v);
      (match x.route_type with
      | None -> []
      | Some v -> route_type_to_query (List.append path [ "RouteType" ]) v);
      (match x.number_capabilities with
      | None -> []
      | Some v -> number_capability_list_to_query (List.append path [ "NumberCapabilities" ]) v);
    ]

let phone_number_information_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" phone_number_information_to_query
    path xs

let list_origination_numbers_result_to_query path (x : list_origination_numbers_result) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.phone_numbers with
      | None -> []
      | Some v -> phone_number_information_list_to_query (List.append path [ "PhoneNumbers" ]) v);
    ]

let max_items_list_origination_numbers_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let list_origination_numbers_request_to_query path (x : list_origination_numbers_request) =
  List.concat
    [
      (match x.next_token with
      | None -> []
      | Some v -> next_token_to_query (List.append path [ "NextToken" ]) v);
      (match x.max_results with
      | None -> []
      | Some v -> max_items_list_origination_numbers_to_query (List.append path [ "MaxResults" ]) v);
    ]

let endpoint_to_query path (x : endpoint) =
  List.concat
    [
      (match x.endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointArn" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
    ]

let list_of_endpoints_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" endpoint_to_query path xs

let list_endpoints_by_platform_application_response_to_query path
    (x : list_endpoints_by_platform_application_response) =
  List.concat
    [
      (match x.endpoints with
      | None -> []
      | Some v -> list_of_endpoints_to_query (List.append path [ "Endpoints" ]) v);
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let list_endpoints_by_platform_application_input_to_query path
    (x : list_endpoints_by_platform_application_input) =
  List.concat
    [
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
      (match x.next_token with
      | None -> []
      | Some v -> string__to_query (List.append path [ "NextToken" ]) v);
    ]

let topic_attributes_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value" attribute_name_to_query
    attribute_value_to_query path pairs

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

let list_string_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" string__to_query path xs

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

let invalid_state_exception_to_query path (x : invalid_state_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let delete_topic_input_to_query path (x : delete_topic_input) =
  List.concat [ topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn ]

let user_error_exception_to_query path (x : user_error_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let delete_sms_sandbox_phone_number_result_to_query path _x = []

let delete_sms_sandbox_phone_number_input_to_query path (x : delete_sms_sandbox_phone_number_input)
    =
  List.concat [ phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number ]

let delete_platform_application_input_to_query path (x : delete_platform_application_input) =
  List.concat
    [ string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn ]

let delete_endpoint_input_to_query path (x : delete_endpoint_input) =
  List.concat [ string__to_query (List.append path [ "EndpointArn" ]) x.endpoint_arn ]

let topic_limit_exceeded_exception_to_query path (x : topic_limit_exceeded_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let create_topic_response_to_query path (x : create_topic_response) =
  List.concat
    [
      (match x.topic_arn with
      | None -> []
      | Some v -> topic_ar_n_to_query (List.append path [ "TopicArn" ]) v);
    ]

let topic_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let create_topic_input_to_query path (x : create_topic_input) =
  List.concat
    [
      topic_name_to_query (List.append path [ "Name" ]) x.name;
      (match x.attributes with
      | None -> []
      | Some v -> topic_attributes_map_to_query (List.append path [ "Attributes" ]) v);
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.data_protection_policy with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "DataProtectionPolicy" ]) v);
    ]

let opted_out_exception_to_query path (x : opted_out_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> string__to_query (List.append path [ "message" ]) v);
    ]

let create_sms_sandbox_phone_number_result_to_query path _x = []

let language_code_string_to_query path (x : language_code_string) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path
    (match x with
    | En_US -> "en-US"
    | En_GB -> "en-GB"
    | Es_419 -> "es-419"
    | Es_ES -> "es-ES"
    | De_DE -> "de-DE"
    | Fr_CA -> "fr-CA"
    | Fr_FR -> "fr-FR"
    | It_IT -> "it-IT"
    | Jp_JP -> "ja-JP"
    | Pt_BR -> "pt-BR"
    | Kr_KR -> "kr-KR"
    | Zh_CN -> "zh-CN"
    | Zh_TW -> "zh-TW")

let create_sms_sandbox_phone_number_input_to_query path (x : create_sms_sandbox_phone_number_input)
    =
  List.concat
    [
      phone_number_string_to_query (List.append path [ "PhoneNumber" ]) x.phone_number;
      (match x.language_code with
      | None -> []
      | Some v -> language_code_string_to_query (List.append path [ "LanguageCode" ]) v);
    ]

let create_endpoint_response_to_query path (x : create_endpoint_response) =
  List.concat
    [
      (match x.endpoint_arn with
      | None -> []
      | Some v -> string__to_query (List.append path [ "EndpointArn" ]) v);
    ]

let create_platform_endpoint_input_to_query path (x : create_platform_endpoint_input) =
  List.concat
    [
      string__to_query (List.append path [ "PlatformApplicationArn" ]) x.platform_application_arn;
      string__to_query (List.append path [ "Token" ]) x.token;
      (match x.custom_user_data with
      | None -> []
      | Some v -> string__to_query (List.append path [ "CustomUserData" ]) v);
      (match x.attributes with
      | None -> []
      | Some v -> map_string_to_string_to_query (List.append path [ "Attributes" ]) v);
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
      string__to_query (List.append path [ "Name" ]) x.name;
      string__to_query (List.append path [ "Platform" ]) x.platform;
      map_string_to_string_to_query (List.append path [ "Attributes" ]) x.attributes;
    ]

let confirm_subscription_response_to_query path (x : confirm_subscription_response) =
  List.concat
    [
      (match x.subscription_arn with
      | None -> []
      | Some v -> subscription_ar_n_to_query (List.append path [ "SubscriptionArn" ]) v);
    ]

let authenticate_on_unsubscribe_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let token_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let confirm_subscription_input_to_query path (x : confirm_subscription_input) =
  List.concat
    [
      topic_ar_n_to_query (List.append path [ "TopicArn" ]) x.topic_arn;
      token_to_query (List.append path [ "Token" ]) x.token;
      (match x.authenticate_on_unsubscribe with
      | None -> []
      | Some v ->
          authenticate_on_unsubscribe_to_query (List.append path [ "AuthenticateOnUnsubscribe" ]) v);
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
