open Types

let unit_of_xml _ = ()
let topic_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let topic_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subscription_ar_n_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let subject_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let protocol_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let next_token_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_structure_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let message_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let label_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let delegate_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let boolean__of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let authenticate_on_unsubscribe_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let action_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let account_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let verify_sms_sandbox_phone_number_result_of_xml i = ()
let phone_number_string_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let otp_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let verify_sms_sandbox_phone_number_input_of_xml i =
  let r_one_time_password = ref None in
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "OneTimePassword"; "PhoneNumber" ] (fun tag _ ->
      match tag with
      | "OneTimePassword" ->
          r_one_time_password :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OneTimePassword"
                 (fun i _ -> otp_code_of_xml i)
                 ())
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     one_time_password =
       Smaws_Lib.Xml.Parse.required "OneTimePassword" (( ! ) r_one_time_password) i;
     phone_number = Smaws_Lib.Xml.Parse.required "PhoneNumber" (( ! ) r_phone_number) i;
   }
    : verify_sms_sandbox_phone_number_input)

let string__of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let verification_exception_of_xml i =
  let r_status = ref None in
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "Message" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     status = Smaws_Lib.Xml.Parse.required "Status" (( ! ) r_status) i;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
   }
    : verification_exception)

let throttled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : throttled_exception)

let resource_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : resource_not_found_exception)

let invalid_parameter_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_exception)

let internal_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : internal_error_exception)

let authorization_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : authorization_error_exception)

let validation_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i } : validation_exception)

let user_error_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : user_error_exception)

let untag_resource_response_of_xml i = ()
let amazon_resource_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ()

let untag_resource_request_of_xml i =
  let r_tag_keys = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagKeys"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "TagKeys" ->
          r_tag_keys :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagKeys"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_of_xml i) ())
                 ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tag_keys = Smaws_Lib.Xml.Parse.required "TagKeys" (( ! ) r_tag_keys) i;
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
   }
    : untag_resource_request)

let tag_policy_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : tag_policy_exception)

let tag_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : tag_limit_exceeded_exception)

let stale_tag_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : stale_tag_exception)

let concurrent_access_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : concurrent_access_exception)

let unsubscribe_input_of_xml i =
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_arn = Smaws_Lib.Xml.Parse.required "SubscriptionArn" (( ! ) r_subscription_arn) i;
   }
    : unsubscribe_input)

let not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : not_found_exception)

let invalid_security_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_security_exception)

let topic_of_xml i =
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = ( ! ) r_topic_arn } : topic)

let topics_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> topic_of_xml i) ()

let topic_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : topic_limit_exceeded_exception)

let topic_attributes_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> attribute_name_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> attribute_value_of_xml i) ()
      in
      (k, v))
    ()

let too_many_entries_in_batch_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_entries_in_batch_request_exception)

let timestamp_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_resource_response_of_xml i = ()

let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     value = Smaws_Lib.Xml.Parse.required "Value" (( ! ) r_value) i;
     key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i;
   }
    : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let tag_resource_request_of_xml i =
  let r_tags = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "ResourceArn" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
   }
    : tag_resource_request)

let endpoint2_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let subscription_of_xml i =
  let r_topic_arn = ref None in
  let r_endpoint = ref None in
  let r_protocol = ref None in
  let r_owner = ref None in
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "TopicArn"; "Endpoint"; "Protocol"; "Owner"; "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint2_of_xml i) ())
      | "Protocol" ->
          r_protocol :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol" (fun i _ -> protocol_of_xml i) ())
      | "Owner" ->
          r_owner :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Owner" (fun i _ -> account_of_xml i) ())
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     topic_arn = ( ! ) r_topic_arn;
     endpoint = ( ! ) r_endpoint;
     protocol = ( ! ) r_protocol;
     owner = ( ! ) r_owner;
     subscription_arn = ( ! ) r_subscription_arn;
   }
    : subscription)

let subscriptions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subscription_of_xml i) ()

let subscription_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subscription_limit_exceeded_exception)

let subscription_attributes_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> attribute_name_of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> attribute_value_of_xml i) ()
      in
      (k, v))
    ()

let subscribe_response_of_xml i =
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ subscription_arn = ( ! ) r_subscription_arn } : subscribe_response)

let subscribe_input_of_xml i =
  let r_return_subscription_arn = ref None in
  let r_attributes = ref None in
  let r_endpoint = ref None in
  let r_protocol = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "ReturnSubscriptionArn"; "Attributes"; "Endpoint"; "Protocol"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "ReturnSubscriptionArn" ->
          r_return_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReturnSubscriptionArn"
                 (fun i _ -> boolean__of_xml i)
                 ())
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "Endpoint" ->
          r_endpoint :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoint" (fun i _ -> endpoint2_of_xml i) ())
      | "Protocol" ->
          r_protocol :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol" (fun i _ -> protocol_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     return_subscription_arn = ( ! ) r_return_subscription_arn;
     attributes = ( ! ) r_attributes;
     endpoint = ( ! ) r_endpoint;
     protocol = Smaws_Lib.Xml.Parse.required "Protocol" (( ! ) r_protocol) i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : subscribe_input)

let replay_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : replay_limit_exceeded_exception)

let filter_policy_limit_exceeded_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : filter_policy_limit_exceeded_exception)

let set_topic_attributes_input_of_xml i =
  let r_attribute_value = ref None in
  let r_attribute_name = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValue"; "AttributeName"; "TopicArn" ]
    (fun tag _ ->
      match tag with
      | "AttributeValue" ->
          r_attribute_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValue"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName"
                 (fun i _ -> attribute_name_of_xml i)
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute_value = ( ! ) r_attribute_value;
     attribute_name = Smaws_Lib.Xml.Parse.required "AttributeName" (( ! ) r_attribute_name) i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : set_topic_attributes_input)

let set_subscription_attributes_input_of_xml i =
  let r_attribute_value = ref None in
  let r_attribute_name = ref None in
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "AttributeValue"; "AttributeName"; "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "AttributeValue" ->
          r_attribute_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValue"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName"
                 (fun i _ -> attribute_name_of_xml i)
                 ())
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attribute_value = ( ! ) r_attribute_value;
     attribute_name = Smaws_Lib.Xml.Parse.required "AttributeName" (( ! ) r_attribute_name) i;
     subscription_arn = Smaws_Lib.Xml.Parse.required "SubscriptionArn" (( ! ) r_subscription_arn) i;
   }
    : set_subscription_attributes_input)

let set_sms_attributes_response_of_xml i = ()

let map_string_to_string_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) () in
      let v = Smaws_Lib.Xml.Parse.Read.sequence i "value" (fun i _ -> string__of_xml i) () in
      (k, v))
    ()

let set_sms_attributes_input_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "attributes" ] (fun tag _ ->
      match tag with
      | "attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = Smaws_Lib.Xml.Parse.required "attributes" (( ! ) r_attributes) i }
    : set_sms_attributes_input)

let set_platform_application_attributes_input_of_xml i =
  let r_attributes = ref None in
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "PlatformApplicationArn" ]
    (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     platform_application_arn =
       Smaws_Lib.Xml.Parse.required "PlatformApplicationArn" (( ! ) r_platform_application_arn) i;
   }
    : set_platform_application_attributes_input)

let set_endpoint_attributes_input_of_xml i =
  let r_attributes = ref None in
  let r_endpoint_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "EndpointArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "EndpointArn" ->
          r_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     endpoint_arn = Smaws_Lib.Xml.Parse.required "EndpointArn" (( ! ) r_endpoint_arn) i;
   }
    : set_endpoint_attributes_input)

let sms_sandbox_phone_number_verification_status_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "Verified" -> Verified | "Pending" -> Pending | _ -> failwith "unknown enum value"
    : sms_sandbox_phone_number_verification_status)

let sms_sandbox_phone_number_of_xml i =
  let r_status = ref None in
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status"; "PhoneNumber" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Status"
                 (fun i _ -> sms_sandbox_phone_number_verification_status_of_xml i)
                 ())
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status; phone_number = ( ! ) r_phone_number } : sms_sandbox_phone_number)

let sms_sandbox_phone_number_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> sms_sandbox_phone_number_of_xml i) ()

let route_type_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "Premium" -> Premium
   | "Promotional" -> Promotional
   | "Transactional" -> Transactional
   | _ -> failwith "unknown enum value"
    : route_type)

let remove_permission_input_of_xml i =
  let r_label = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Label"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> label_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     label = Smaws_Lib.Xml.Parse.required "Label" (( ! ) r_label) i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : remove_permission_input)

let put_data_protection_policy_input_of_xml i =
  let r_data_protection_policy = ref None in
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataProtectionPolicy"; "ResourceArn" ]
    (fun tag _ ->
      match tag with
      | "DataProtectionPolicy" ->
          r_data_protection_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataProtectionPolicy"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> topic_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_protection_policy =
       Smaws_Lib.Xml.Parse.required "DataProtectionPolicy" (( ! ) r_data_protection_policy) i;
     resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i;
   }
    : put_data_protection_policy_input)

let publish_response_of_xml i =
  let r_sequence_number = ref None in
  let r_message_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SequenceNumber"; "MessageId" ] (fun tag _ ->
      match tag with
      | "SequenceNumber" ->
          r_sequence_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SequenceNumber"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ sequence_number = ( ! ) r_sequence_number; message_id = ( ! ) r_message_id }
    : publish_response)

let phone_number_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let binary_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.blob_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let message_attribute_value_of_xml i =
  let r_binary_value = ref None in
  let r_string_value = ref None in
  let r_data_type = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "BinaryValue"; "StringValue"; "DataType" ]
    (fun tag _ ->
      match tag with
      | "BinaryValue" ->
          r_binary_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "BinaryValue" (fun i _ -> binary_of_xml i) ())
      | "StringValue" ->
          r_string_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "StringValue" (fun i _ -> string__of_xml i) ())
      | "DataType" ->
          r_data_type :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DataType" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     binary_value = ( ! ) r_binary_value;
     string_value = ( ! ) r_string_value;
     data_type = Smaws_Lib.Xml.Parse.required "DataType" (( ! ) r_data_type) i;
   }
    : message_attribute_value)

let message_attribute_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> message_attribute_value_of_xml i) ()
      in
      (k, v))
    ()

let publish_input_of_xml i =
  let r_message_group_id = ref None in
  let r_message_deduplication_id = ref None in
  let r_message_attributes = ref None in
  let r_message_structure = ref None in
  let r_subject = ref None in
  let r_message = ref None in
  let r_phone_number = ref None in
  let r_target_arn = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MessageGroupId";
      "MessageDeduplicationId";
      "MessageAttributes";
      "MessageStructure";
      "Subject";
      "Message";
      "PhoneNumber";
      "TargetArn";
      "TopicArn";
    ] (fun tag _ ->
      match tag with
      | "MessageGroupId" ->
          r_message_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageDeduplicationId" ->
          r_message_deduplication_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageDeduplicationId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageAttributes" ->
          r_message_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                           (fun i _ -> message_attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "MessageStructure" ->
          r_message_structure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageStructure"
                 (fun i _ -> message_structure_of_xml i)
                 ())
      | "Subject" ->
          r_subject :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Subject" (fun i _ -> subject_of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_of_xml i)
                 ())
      | "TargetArn" ->
          r_target_arn :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "TargetArn" (fun i _ -> string__of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message_group_id = ( ! ) r_message_group_id;
     message_deduplication_id = ( ! ) r_message_deduplication_id;
     message_attributes = ( ! ) r_message_attributes;
     message_structure = ( ! ) r_message_structure;
     subject = ( ! ) r_subject;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     phone_number = ( ! ) r_phone_number;
     target_arn = ( ! ) r_target_arn;
     topic_arn = ( ! ) r_topic_arn;
   }
    : publish_input)

let publish_batch_result_entry_of_xml i =
  let r_sequence_number = ref None in
  let r_message_id = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SequenceNumber"; "MessageId"; "Id" ] (fun tag _ ->
      match tag with
      | "SequenceNumber" ->
          r_sequence_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SequenceNumber"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageId" ->
          r_message_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageId" (fun i _ -> message_id_of_xml i) ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ sequence_number = ( ! ) r_sequence_number; message_id = ( ! ) r_message_id; id = ( ! ) r_id }
    : publish_batch_result_entry)

let publish_batch_result_entry_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> publish_batch_result_entry_of_xml i) ()

let batch_result_error_entry_of_xml i =
  let r_sender_fault = ref None in
  let r_message = ref None in
  let r_code = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SenderFault"; "Message"; "Code"; "Id" ]
    (fun tag _ ->
      match tag with
      | "SenderFault" ->
          r_sender_fault :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SenderFault" (fun i _ -> boolean__of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> string__of_xml i) ())
      | "Code" ->
          r_code :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Code" (fun i _ -> string__of_xml i) ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     sender_fault = Smaws_Lib.Xml.Parse.required "SenderFault" (( ! ) r_sender_fault) i;
     message = ( ! ) r_message;
     code = Smaws_Lib.Xml.Parse.required "Code" (( ! ) r_code) i;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : batch_result_error_entry)

let batch_result_error_entry_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> batch_result_error_entry_of_xml i) ()

let publish_batch_response_of_xml i =
  let r_failed = ref None in
  let r_successful = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Failed"; "Successful" ] (fun tag _ ->
      match tag with
      | "Failed" ->
          r_failed :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Failed"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> batch_result_error_entry_of_xml i)
                     ())
                 ())
      | "Successful" ->
          r_successful :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Successful"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> publish_batch_result_entry_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ failed = ( ! ) r_failed; successful = ( ! ) r_successful } : publish_batch_response)

let publish_batch_request_entry_of_xml i =
  let r_message_group_id = ref None in
  let r_message_deduplication_id = ref None in
  let r_message_attributes = ref None in
  let r_message_structure = ref None in
  let r_subject = ref None in
  let r_message = ref None in
  let r_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "MessageGroupId";
      "MessageDeduplicationId";
      "MessageAttributes";
      "MessageStructure";
      "Subject";
      "Message";
      "Id";
    ] (fun tag _ ->
      match tag with
      | "MessageGroupId" ->
          r_message_group_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageGroupId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageDeduplicationId" ->
          r_message_deduplication_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageDeduplicationId"
                 (fun i _ -> string__of_xml i)
                 ())
      | "MessageAttributes" ->
          r_message_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                           (fun i _ -> message_attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "MessageStructure" ->
          r_message_structure :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MessageStructure"
                 (fun i _ -> message_structure_of_xml i)
                 ())
      | "Subject" ->
          r_subject :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Subject" (fun i _ -> subject_of_xml i) ())
      | "Message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Message" (fun i _ -> message_of_xml i) ())
      | "Id" ->
          r_id := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Id" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     message_group_id = ( ! ) r_message_group_id;
     message_deduplication_id = ( ! ) r_message_deduplication_id;
     message_attributes = ( ! ) r_message_attributes;
     message_structure = ( ! ) r_message_structure;
     subject = ( ! ) r_subject;
     message = Smaws_Lib.Xml.Parse.required "Message" (( ! ) r_message) i;
     id = Smaws_Lib.Xml.Parse.required "Id" (( ! ) r_id) i;
   }
    : publish_batch_request_entry)

let publish_batch_request_entry_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> publish_batch_request_entry_of_xml i) ()

let publish_batch_input_of_xml i =
  let r_publish_batch_request_entries = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PublishBatchRequestEntries"; "TopicArn" ]
    (fun tag _ ->
      match tag with
      | "PublishBatchRequestEntries" ->
          r_publish_batch_request_entries :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PublishBatchRequestEntries"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> publish_batch_request_entry_of_xml i)
                     ())
                 ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     publish_batch_request_entries =
       Smaws_Lib.Xml.Parse.required "PublishBatchRequestEntries"
         (( ! ) r_publish_batch_request_entries)
         i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : publish_batch_input)

let platform_application_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : platform_application_disabled_exception)

let kms_throttling_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_throttling_exception)

let kms_opt_in_required_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_opt_in_required)

let kms_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_not_found_exception)

let kms_invalid_state_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_invalid_state_exception)

let kms_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_disabled_exception)

let kms_access_denied_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : kms_access_denied_exception)

let invalid_parameter_value_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_parameter_value_exception)

let invalid_batch_entry_id_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_batch_entry_id_exception)

let endpoint_disabled_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : endpoint_disabled_exception)

let empty_batch_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : empty_batch_request_exception)

let batch_request_too_long_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : batch_request_too_long_exception)

let batch_entry_ids_not_distinct_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : batch_entry_ids_not_distinct_exception)

let platform_application_of_xml i =
  let r_attributes = ref None in
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "PlatformApplicationArn" ]
    (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes; platform_application_arn = ( ! ) r_platform_application_arn }
    : platform_application)

let phone_number_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> phone_number_of_xml i) ()

let iso2_country_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let number_capability_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "VOICE" -> VOICE
   | "MMS" -> MMS
   | "SMS" -> SMS
   | _ -> failwith "unknown enum value"
    : number_capability)

let number_capability_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> number_capability_of_xml i) ()

let phone_number_information_of_xml i =
  let r_number_capabilities = ref None in
  let r_route_type = ref None in
  let r_iso2_country_code = ref None in
  let r_status = ref None in
  let r_phone_number = ref None in
  let r_created_at = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "NumberCapabilities"; "RouteType"; "Iso2CountryCode"; "Status"; "PhoneNumber"; "CreatedAt" ]
    (fun tag _ ->
      match tag with
      | "NumberCapabilities" ->
          r_number_capabilities :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NumberCapabilities"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> number_capability_of_xml i)
                     ())
                 ())
      | "RouteType" ->
          r_route_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "RouteType" (fun i _ -> route_type_of_xml i) ())
      | "Iso2CountryCode" ->
          r_iso2_country_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Iso2CountryCode"
                 (fun i _ -> iso2_country_code_of_xml i)
                 ())
      | "Status" ->
          r_status :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Status" (fun i _ -> string__of_xml i) ())
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_of_xml i)
                 ())
      | "CreatedAt" ->
          r_created_at :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedAt" (fun i _ -> timestamp_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     number_capabilities = ( ! ) r_number_capabilities;
     route_type = ( ! ) r_route_type;
     iso2_country_code = ( ! ) r_iso2_country_code;
     status = ( ! ) r_status;
     phone_number = ( ! ) r_phone_number;
     created_at = ( ! ) r_created_at;
   }
    : phone_number_information)

let phone_number_information_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> phone_number_information_of_xml i) ()

let opted_out_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : opted_out_exception)

let opt_in_phone_number_response_of_xml i = ()

let opt_in_phone_number_input_of_xml i =
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "phoneNumber" ] (fun tag _ ->
      match tag with
      | "phoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "phoneNumber"
                 (fun i _ -> phone_number_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ phone_number = Smaws_Lib.Xml.Parse.required "phoneNumber" (( ! ) r_phone_number) i }
    : opt_in_phone_number_input)

let max_items_list_origination_numbers_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let max_items_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let list_topics_response_of_xml i =
  let r_next_token = ref None in
  let r_topics = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Topics" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Topics" ->
          r_topics :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Topics"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> topic_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; topics = ( ! ) r_topics } : list_topics_response)

let list_topics_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_topics_input)

let list_tags_for_resource_response_of_xml i =
  let r_tags = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags } : list_tags_for_resource_response)

let list_tags_for_resource_request_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> amazon_resource_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i }
    : list_tags_for_resource_request)

let list_subscriptions_response_of_xml i =
  let r_next_token = ref None in
  let r_subscriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Subscriptions" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Subscriptions" ->
          r_subscriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subscriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> subscription_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; subscriptions = ( ! ) r_subscriptions }
    : list_subscriptions_response)

let list_subscriptions_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_subscriptions_input)

let list_subscriptions_by_topic_response_of_xml i =
  let r_next_token = ref None in
  let r_subscriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Subscriptions" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "Subscriptions" ->
          r_subscriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subscriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> subscription_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; subscriptions = ( ! ) r_subscriptions }
    : list_subscriptions_by_topic_response)

let list_subscriptions_by_topic_input_of_xml i =
  let r_next_token = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "TopicArn" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : list_subscriptions_by_topic_input)

let list_string_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ()

let list_sms_sandbox_phone_numbers_result_of_xml i =
  let r_next_token = ref None in
  let r_phone_numbers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "PhoneNumbers" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "PhoneNumbers" ->
          r_phone_numbers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumbers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> sms_sandbox_phone_number_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     phone_numbers = Smaws_Lib.Xml.Parse.required "PhoneNumbers" (( ! ) r_phone_numbers) i;
   }
    : list_sms_sandbox_phone_numbers_result)

let list_sms_sandbox_phone_numbers_input_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults" (fun i _ -> max_items_of_xml i) ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : list_sms_sandbox_phone_numbers_input)

let list_of_platform_applications_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> platform_application_of_xml i) ()

let list_platform_applications_response_of_xml i =
  let r_next_token = ref None in
  let r_platform_applications = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "PlatformApplications" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "PlatformApplications" ->
          r_platform_applications :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplications"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> platform_application_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; platform_applications = ( ! ) r_platform_applications }
    : list_platform_applications_response)

let list_platform_applications_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_platform_applications_input)

let list_phone_numbers_opted_out_response_of_xml i =
  let r_next_token = ref None in
  let r_phone_numbers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nextToken"; "phoneNumbers" ] (fun tag _ ->
      match tag with
      | "nextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "nextToken" (fun i _ -> string__of_xml i) ())
      | "phoneNumbers" ->
          r_phone_numbers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "phoneNumbers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> phone_number_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; phone_numbers = ( ! ) r_phone_numbers }
    : list_phone_numbers_opted_out_response)

let list_phone_numbers_opted_out_input_of_xml i =
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nextToken" ] (fun tag _ ->
      match tag with
      | "nextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "nextToken" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token } : list_phone_numbers_opted_out_input)

let list_origination_numbers_result_of_xml i =
  let r_phone_numbers = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PhoneNumbers"; "NextToken" ] (fun tag _ ->
      match tag with
      | "PhoneNumbers" ->
          r_phone_numbers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumbers"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> phone_number_information_of_xml i)
                     ())
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ phone_numbers = ( ! ) r_phone_numbers; next_token = ( ! ) r_next_token }
    : list_origination_numbers_result)

let list_origination_numbers_request_of_xml i =
  let r_max_results = ref None in
  let r_next_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "MaxResults"; "NextToken" ] (fun tag _ ->
      match tag with
      | "MaxResults" ->
          r_max_results :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "MaxResults"
                 (fun i _ -> max_items_list_origination_numbers_of_xml i)
                 ())
      | "NextToken" ->
          r_next_token :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> next_token_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max_results = ( ! ) r_max_results; next_token = ( ! ) r_next_token }
    : list_origination_numbers_request)

let endpoint_of_xml i =
  let r_attributes = ref None in
  let r_endpoint_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "EndpointArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "EndpointArn" ->
          r_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes; endpoint_arn = ( ! ) r_endpoint_arn } : endpoint)

let list_of_endpoints_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_of_xml i) ()

let list_endpoints_by_platform_application_response_of_xml i =
  let r_next_token = ref None in
  let r_endpoints = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "Endpoints" ] (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "Endpoints" ->
          r_endpoints :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Endpoints"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> endpoint_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_token = ( ! ) r_next_token; endpoints = ( ! ) r_endpoints }
    : list_endpoints_by_platform_application_response)

let list_endpoints_by_platform_application_input_of_xml i =
  let r_next_token = ref None in
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextToken"; "PlatformApplicationArn" ]
    (fun tag _ ->
      match tag with
      | "NextToken" ->
          r_next_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextToken" (fun i _ -> string__of_xml i) ())
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_token = ( ! ) r_next_token;
     platform_application_arn =
       Smaws_Lib.Xml.Parse.required "PlatformApplicationArn" (( ! ) r_platform_application_arn) i;
   }
    : list_endpoints_by_platform_application_input)

let language_code_string_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with
   | "zh-TW" -> Zh_TW
   | "zh-CN" -> Zh_CN
   | "kr-KR" -> Kr_KR
   | "pt-BR" -> Pt_BR
   | "ja-JP" -> Jp_JP
   | "it-IT" -> It_IT
   | "fr-FR" -> Fr_FR
   | "fr-CA" -> Fr_CA
   | "de-DE" -> De_DE
   | "es-ES" -> Es_ES
   | "es-419" -> Es_419
   | "en-GB" -> En_GB
   | "en-US" -> En_US
   | _ -> failwith "unknown enum value"
    : language_code_string)

let invalid_state_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "message" ] (fun tag _ ->
      match tag with
      | "message" ->
          r_message :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "message" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_state_exception)

let get_topic_attributes_response_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_topic_attributes_response)

let get_topic_attributes_input_of_xml i =
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i }
    : get_topic_attributes_input)

let get_subscription_attributes_response_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_subscription_attributes_response)

let get_subscription_attributes_input_of_xml i =
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subscription_arn = Smaws_Lib.Xml.Parse.required "SubscriptionArn" (( ! ) r_subscription_arn) i;
   }
    : get_subscription_attributes_input)

let get_sms_sandbox_account_status_result_of_xml i =
  let r_is_in_sandbox = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IsInSandbox" ] (fun tag _ ->
      match tag with
      | "IsInSandbox" ->
          r_is_in_sandbox :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IsInSandbox" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ is_in_sandbox = Smaws_Lib.Xml.Parse.required "IsInSandbox" (( ! ) r_is_in_sandbox) i }
    : get_sms_sandbox_account_status_result)

let get_sms_sandbox_account_status_input_of_xml i = ()

let get_sms_attributes_response_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "attributes" ] (fun tag _ ->
      match tag with
      | "attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_sms_attributes_response)

let get_sms_attributes_input_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "attributes" ] (fun tag _ ->
      match tag with
      | "attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> string__of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_sms_attributes_input)

let get_platform_application_attributes_response_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_platform_application_attributes_response)

let get_platform_application_attributes_input_of_xml i =
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformApplicationArn" ] (fun tag _ ->
      match tag with
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_application_arn =
       Smaws_Lib.Xml.Parse.required "PlatformApplicationArn" (( ! ) r_platform_application_arn) i;
   }
    : get_platform_application_attributes_input)

let get_endpoint_attributes_response_of_xml i =
  let r_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attributes = ( ! ) r_attributes } : get_endpoint_attributes_response)

let get_endpoint_attributes_input_of_xml i =
  let r_endpoint_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointArn" ] (fun tag _ ->
      match tag with
      | "EndpointArn" ->
          r_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_arn = Smaws_Lib.Xml.Parse.required "EndpointArn" (( ! ) r_endpoint_arn) i }
    : get_endpoint_attributes_input)

let get_data_protection_policy_response_of_xml i =
  let r_data_protection_policy = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DataProtectionPolicy" ] (fun tag _ ->
      match tag with
      | "DataProtectionPolicy" ->
          r_data_protection_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataProtectionPolicy"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data_protection_policy = ( ! ) r_data_protection_policy }
    : get_data_protection_policy_response)

let get_data_protection_policy_input_of_xml i =
  let r_resource_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ResourceArn" ] (fun tag _ ->
      match tag with
      | "ResourceArn" ->
          r_resource_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ResourceArn"
                 (fun i _ -> topic_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ resource_arn = Smaws_Lib.Xml.Parse.required "ResourceArn" (( ! ) r_resource_arn) i }
    : get_data_protection_policy_input)

let delete_topic_input_of_xml i =
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i }
    : delete_topic_input)

let delete_sms_sandbox_phone_number_result_of_xml i = ()

let delete_sms_sandbox_phone_number_input_of_xml i =
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PhoneNumber" ] (fun tag _ ->
      match tag with
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ phone_number = Smaws_Lib.Xml.Parse.required "PhoneNumber" (( ! ) r_phone_number) i }
    : delete_sms_sandbox_phone_number_input)

let delete_platform_application_input_of_xml i =
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformApplicationArn" ] (fun tag _ ->
      match tag with
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     platform_application_arn =
       Smaws_Lib.Xml.Parse.required "PlatformApplicationArn" (( ! ) r_platform_application_arn) i;
   }
    : delete_platform_application_input)

let delete_endpoint_input_of_xml i =
  let r_endpoint_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointArn" ] (fun tag _ ->
      match tag with
      | "EndpointArn" ->
          r_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_arn = Smaws_Lib.Xml.Parse.required "EndpointArn" (( ! ) r_endpoint_arn) i }
    : delete_endpoint_input)

let delegates_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> delegate_of_xml i) ()

let create_topic_response_of_xml i =
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TopicArn" ] (fun tag _ ->
      match tag with
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ topic_arn = ( ! ) r_topic_arn } : create_topic_response)

let create_topic_input_of_xml i =
  let r_data_protection_policy = ref None in
  let r_tags = ref None in
  let r_attributes = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "DataProtectionPolicy"; "Tags"; "Attributes"; "Name" ] (fun tag _ ->
      match tag with
      | "DataProtectionPolicy" ->
          r_data_protection_policy :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DataProtectionPolicy"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key"
                           (fun i _ -> attribute_name_of_xml i)
                           ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> attribute_value_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> topic_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     data_protection_policy = ( ! ) r_data_protection_policy;
     tags = ( ! ) r_tags;
     attributes = ( ! ) r_attributes;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : create_topic_input)

let create_sms_sandbox_phone_number_result_of_xml i = ()

let create_sms_sandbox_phone_number_input_of_xml i =
  let r_language_code = ref None in
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LanguageCode"; "PhoneNumber" ] (fun tag _ ->
      match tag with
      | "LanguageCode" ->
          r_language_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LanguageCode"
                 (fun i _ -> language_code_string_of_xml i)
                 ())
      | "PhoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PhoneNumber"
                 (fun i _ -> phone_number_string_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     language_code = ( ! ) r_language_code;
     phone_number = Smaws_Lib.Xml.Parse.required "PhoneNumber" (( ! ) r_phone_number) i;
   }
    : create_sms_sandbox_phone_number_input)

let create_platform_endpoint_input_of_xml i =
  let r_attributes = ref None in
  let r_custom_user_data = ref None in
  let r_token = ref None in
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Attributes"; "CustomUserData"; "Token"; "PlatformApplicationArn" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "CustomUserData" ->
          r_custom_user_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CustomUserData"
                 (fun i _ -> string__of_xml i)
                 ())
      | "Token" ->
          r_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Token" (fun i _ -> string__of_xml i) ())
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = ( ! ) r_attributes;
     custom_user_data = ( ! ) r_custom_user_data;
     token = Smaws_Lib.Xml.Parse.required "Token" (( ! ) r_token) i;
     platform_application_arn =
       Smaws_Lib.Xml.Parse.required "PlatformApplicationArn" (( ! ) r_platform_application_arn) i;
   }
    : create_platform_endpoint_input)

let create_endpoint_response_of_xml i =
  let r_endpoint_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "EndpointArn" ] (fun tag _ ->
      match tag with
      | "EndpointArn" ->
          r_endpoint_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EndpointArn" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ endpoint_arn = ( ! ) r_endpoint_arn } : create_endpoint_response)

let create_platform_application_response_of_xml i =
  let r_platform_application_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PlatformApplicationArn" ] (fun tag _ ->
      match tag with
      | "PlatformApplicationArn" ->
          r_platform_application_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PlatformApplicationArn"
                 (fun i _ -> string__of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ platform_application_arn = ( ! ) r_platform_application_arn }
    : create_platform_application_response)

let create_platform_application_input_of_xml i =
  let r_attributes = ref None in
  let r_platform = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Attributes"; "Platform"; "Name" ] (fun tag _ ->
      match tag with
      | "Attributes" ->
          r_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Attributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k =
                         Smaws_Lib.Xml.Parse.Read.sequence i "key" (fun i _ -> string__of_xml i) ()
                       in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> string__of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "Platform" ->
          r_platform :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Platform" (fun i _ -> string__of_xml i) ())
      | "Name" ->
          r_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> string__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     attributes = Smaws_Lib.Xml.Parse.required "Attributes" (( ! ) r_attributes) i;
     platform = Smaws_Lib.Xml.Parse.required "Platform" (( ! ) r_platform) i;
     name = Smaws_Lib.Xml.Parse.required "Name" (( ! ) r_name) i;
   }
    : create_platform_application_input)

let confirm_subscription_response_of_xml i =
  let r_subscription_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SubscriptionArn" ] (fun tag _ ->
      match tag with
      | "SubscriptionArn" ->
          r_subscription_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SubscriptionArn"
                 (fun i _ -> subscription_ar_n_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ subscription_arn = ( ! ) r_subscription_arn } : confirm_subscription_response)

let confirm_subscription_input_of_xml i =
  let r_authenticate_on_unsubscribe = ref None in
  let r_token = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AuthenticateOnUnsubscribe"; "Token"; "TopicArn" ]
    (fun tag _ ->
      match tag with
      | "AuthenticateOnUnsubscribe" ->
          r_authenticate_on_unsubscribe :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AuthenticateOnUnsubscribe"
                 (fun i _ -> authenticate_on_unsubscribe_of_xml i)
                 ())
      | "Token" ->
          r_token :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Token" (fun i _ -> token_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     authenticate_on_unsubscribe = ( ! ) r_authenticate_on_unsubscribe;
     token = Smaws_Lib.Xml.Parse.required "Token" (( ! ) r_token) i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : confirm_subscription_input)

let check_if_phone_number_is_opted_out_response_of_xml i =
  let r_is_opted_out = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "isOptedOut" ] (fun tag _ ->
      match tag with
      | "isOptedOut" ->
          r_is_opted_out :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "isOptedOut" (fun i _ -> boolean__of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ is_opted_out = ( ! ) r_is_opted_out } : check_if_phone_number_is_opted_out_response)

let check_if_phone_number_is_opted_out_input_of_xml i =
  let r_phone_number = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "phoneNumber" ] (fun tag _ ->
      match tag with
      | "phoneNumber" ->
          r_phone_number :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "phoneNumber"
                 (fun i _ -> phone_number_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ phone_number = Smaws_Lib.Xml.Parse.required "phoneNumber" (( ! ) r_phone_number) i }
    : check_if_phone_number_is_opted_out_input)

let actions_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ()

let add_permission_input_of_xml i =
  let r_action_name = ref None in
  let r_aws_account_id = ref None in
  let r_label = ref None in
  let r_topic_arn = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "ActionName"; "AWSAccountId"; "Label"; "TopicArn" ]
    (fun tag _ ->
      match tag with
      | "ActionName" ->
          r_action_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ActionName"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> action_of_xml i) ())
                 ())
      | "AWSAccountId" ->
          r_aws_account_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AWSAccountId"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> delegate_of_xml i) ())
                 ())
      | "Label" ->
          r_label :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Label" (fun i _ -> label_of_xml i) ())
      | "TopicArn" ->
          r_topic_arn :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TopicArn" (fun i _ -> topic_ar_n_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     action_name = Smaws_Lib.Xml.Parse.required "ActionName" (( ! ) r_action_name) i;
     aws_account_id = Smaws_Lib.Xml.Parse.required "AWSAccountId" (( ! ) r_aws_account_id) i;
     label = Smaws_Lib.Xml.Parse.required "Label" (( ! ) r_label) i;
     topic_arn = Smaws_Lib.Xml.Parse.required "TopicArn" (( ! ) r_topic_arn) i;
   }
    : add_permission_input)
