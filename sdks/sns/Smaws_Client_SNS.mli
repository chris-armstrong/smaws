(** SNS client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CheckIfPhoneNumberIsOptedOut : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_if_phone_number_is_opted_out_input ->
    ( check_if_phone_number_is_opted_out_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_if_phone_number_is_opted_out_input ->
    ( check_if_phone_number_is_opted_out_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS \
   messages from your Amazon Web Services account. You cannot send SMS messages to a number that \
   is opted out.\n\n\
  \ To resume sending messages, you can opt in the number by using the [OptInPhoneNumber] action.\n\
  \ "]

module ConfirmSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ReplayLimitExceededException of replay_limit_exceeded_exception
    | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    confirm_subscription_input ->
    ( confirm_subscription_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception
      | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    confirm_subscription_input ->
    ( confirm_subscription_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception
      | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Verifies an endpoint owner's intent to receive messages by validating the token sent to the \
   endpoint by an earlier [Subscribe] action. If the token is valid, the action creates a new \
   subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature \
   only when the [AuthenticateOnUnsubscribe] flag is set to \"true\".\n"]

module CreatePlatformApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_platform_application_input ->
    ( create_platform_application_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_platform_application_input ->
    ( create_platform_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a platform application object for one of the supported push notification services, such \
   as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You \
   must specify [PlatformPrincipal] and [PlatformCredential] attributes when using the \
   [CreatePlatformApplication] action.\n\n\
  \  [PlatformPrincipal] and [PlatformCredential] are received from the notification service.\n\
  \ \n\
  \  {ul\n\
  \        {-  For ADM, [PlatformPrincipal] is [client id] and [PlatformCredential] is [client \
   secret].\n\
  \            \n\
  \             }\n\
  \        {-  For APNS and [APNS_SANDBOX] using certificate credentials, [PlatformPrincipal] is \
   [SSL certificate] and [PlatformCredential] is [private key].\n\
  \            \n\
  \             }\n\
  \        {-  For APNS and [APNS_SANDBOX] using token credentials, [PlatformPrincipal] is \
   [signing key ID] and [PlatformCredential] is [signing key].\n\
  \            \n\
  \             }\n\
  \        {-  For Baidu, [PlatformPrincipal] is [API key] and [PlatformCredential] is [secret key].\n\
  \            \n\
  \             }\n\
  \        {-  For GCM (Firebase Cloud Messaging) using key credentials, there is no \
   [PlatformPrincipal]. The [PlatformCredential] is [API key].\n\
  \            \n\
  \             }\n\
  \        {-  For GCM (Firebase Cloud Messaging) using token credentials, there is no \
   [PlatformPrincipal]. The [PlatformCredential] is a JSON formatted private key file. When using \
   the Amazon Web Services CLI or Amazon Web Services SDKs, the file must be in string format and \
   special characters must be ignored. To format the file correctly, Amazon SNS recommends using \
   the following command: [SERVICE_JSON=$(jq @json < service.json)].\n\
  \            \n\
  \             }\n\
  \        {-  For MPNS, [PlatformPrincipal] is [TLS certificate] and [PlatformCredential] is \
   [private key].\n\
  \            \n\
  \             }\n\
  \        {-  For WNS, [PlatformPrincipal] is [Package Security\n\
  \                        Identifier] and [PlatformCredential] is [secret\n\
  \                        key].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can use the returned [PlatformApplicationArn] as an attribute for the \
   [CreatePlatformEndpoint] action.\n\
  \   "]

module CreatePlatformEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_platform_endpoint_input ->
    ( create_endpoint_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_platform_endpoint_input ->
    ( create_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an endpoint for a device and mobile app on one of the supported push notification \
   services, such as GCM (Firebase Cloud Messaging) and APNS. [CreatePlatformEndpoint] requires \
   the [PlatformApplicationArn] that is returned from [CreatePlatformApplication]. You can use the \
   returned [EndpointArn] to send a message to a mobile app or by the [Subscribe] action for \
   subscription to a topic. The [CreatePlatformEndpoint] action is idempotent, so if the requester \
   already owns an endpoint with the same device token and attributes, that endpoint's ARN is \
   returned without creating a new endpoint. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. \n\n\
  \ When using [CreatePlatformEndpoint] with Baidu, two attributes must be provided: ChannelId and \
   UserId. The token field must also contain the ChannelId. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html}Creating an Amazon \
   SNS Endpoint for Baidu}. \n\
  \ "]

module CreateSMSSandboxPhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `OptedOutException of opted_out_exception
    | `ThrottledException of throttled_exception
    | `UserErrorException of user_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_sms_sandbox_phone_number_input ->
    ( create_sms_sandbox_phone_number_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OptedOutException of opted_out_exception
      | `ThrottledException of throttled_exception
      | `UserErrorException of user_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_sms_sandbox_phone_number_input ->
    ( create_sms_sandbox_phone_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `OptedOutException of opted_out_exception
      | `ThrottledException of throttled_exception
      | `UserErrorException of user_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a destination phone number to an Amazon Web Services account in the SMS sandbox and sends \
   a one-time password (OTP) to that phone number.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

module CreateTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `StaleTagException of stale_tag_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception
    | `TagPolicyException of tag_policy_exception
    | `TopicLimitExceededException of topic_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_topic_input ->
    ( create_topic_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TopicLimitExceededException of topic_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_topic_input ->
    ( create_topic_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception
      | `TopicLimitExceededException of topic_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a topic to which notifications can be published. Users can create at most 100,000 \
   standard topics (at most 1,000 FIFO topics). For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html}Creating an Amazon SNS \
   topic} in the {i Amazon SNS Developer Guide}. This action is idempotent, so if the requester \
   already owns a topic with the specified name, that topic's ARN is returned without creating a \
   new topic.\n"]

module DeleteEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. \
   For more information, see {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using \
   Amazon SNS Mobile Push Notifications}. \n\n\
  \ When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe \
   the endpoint from the topic.\n\
  \ "]

module DeletePlatformApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_platform_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_platform_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a platform application object for one of the supported push notification services, such \
   as APNS and GCM (Firebase Cloud Messaging). For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. \n"]

module DeleteSMSSandboxPhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottledException of throttled_exception
    | `UserErrorException of user_error_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_sms_sandbox_phone_number_input ->
    ( delete_sms_sandbox_phone_number_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception
      | `UserErrorException of user_error_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_sms_sandbox_phone_number_input ->
    ( delete_sms_sandbox_phone_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception
      | `UserErrorException of user_error_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Web Services account's verified or pending phone number from the SMS sandbox.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

module DeleteTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidStateException of invalid_state_exception
    | `NotFoundException of not_found_exception
    | `StaleTagException of stale_tag_exception
    | `TagPolicyException of tag_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_topic_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidStateException of invalid_state_exception
      | `NotFoundException of not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagPolicyException of tag_policy_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_topic_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidStateException of invalid_state_exception
      | `NotFoundException of not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagPolicyException of tag_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages \
   previously sent to the topic from being delivered to subscribers. This action is idempotent, so \
   deleting a topic that does not exist does not result in an error.\n"]

module GetDataProtectionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_protection_policy_input ->
    ( get_data_protection_policy_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_protection_policy_input ->
    ( get_data_protection_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified inline [DataProtectionPolicy] document that is stored in the specified \
   Amazon SNS topic. \n"]

module GetEndpointAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_attributes_input ->
    ( get_endpoint_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_attributes_input ->
    ( get_endpoint_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the endpoint attributes for a device on one of the supported push notification \
   services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. \n"]

module GetPlatformApplicationAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_platform_application_attributes_input ->
    ( get_platform_application_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_platform_application_attributes_input ->
    ( get_platform_application_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the attributes of the platform application object for the supported push notification \
   services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. \n"]

module GetSMSAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sms_attributes_input ->
    ( get_sms_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sms_attributes_input ->
    ( get_sms_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the settings for sending SMS messages from your Amazon Web Services account.\n\n\
  \ These settings are set with the [SetSMSAttributes] action.\n\
  \ "]

module GetSMSSandboxAccountStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_sms_sandbox_account_status_input ->
    ( get_sms_sandbox_account_status_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_sms_sandbox_account_status_input ->
    ( get_sms_sandbox_account_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the SMS sandbox status for the calling Amazon Web Services account in the target \
   Amazon Web Services Region.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

module GetSubscriptionAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_subscription_attributes_input ->
    ( get_subscription_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_subscription_attributes_input ->
    ( get_subscription_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns all of the properties of a subscription.\n"]

module GetTopicAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_topic_attributes_input ->
    ( get_topic_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_topic_attributes_input ->
    ( get_topic_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all of the properties of a topic. Topic properties returned might differ based on the \
   authorization of the user.\n"]

module ListEndpointsByPlatformApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_by_platform_application_input ->
    ( list_endpoints_by_platform_application_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_by_platform_application_input ->
    ( list_endpoints_by_platform_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the endpoints and endpoint attributes for devices in a supported push notification \
   service, such as GCM (Firebase Cloud Messaging) and APNS. The results for \
   [ListEndpointsByPlatformApplication] are paginated and return a limited list of endpoints, up \
   to 100. If additional records are available after the first page results, then a NextToken \
   string will be returned. To receive the next page, you call \
   [ListEndpointsByPlatformApplication] again using the NextToken string received from the \
   previous call. When there are no more records to return, NextToken will be null. For more \
   information, see {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon \
   SNS Mobile Push Notifications}. \n\n\
  \ This action is throttled at 30 transactions per second (TPS).\n\
  \ "]

module ListOriginationNumbers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_origination_numbers_request ->
    ( list_origination_numbers_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_origination_numbers_request ->
    ( list_origination_numbers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the calling Amazon Web Services account's dedicated origination numbers and their \
   metadata. For more information about origination numbers, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html}Origination \
   numbers} in the {i Amazon SNS Developer Guide}.\n"]

module ListPhoneNumbersOptedOut : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_phone_numbers_opted_out_input ->
    ( list_phone_numbers_opted_out_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_phone_numbers_opted_out_input ->
    ( list_phone_numbers_opted_out_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to \
   them.\n\n\
  \ The results for [ListPhoneNumbersOptedOut] are paginated, and each page returns up to 100 \
   phone numbers. If additional phone numbers are available after the first page of results, then \
   a [NextToken] string will be returned. To receive the next page, you call \
   [ListPhoneNumbersOptedOut] again using the [NextToken] string received from the previous call. \
   When there are no more records to return, [NextToken] will be null.\n\
  \ "]

module ListPlatformApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_platform_applications_input ->
    ( list_platform_applications_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_platform_applications_input ->
    ( list_platform_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the platform application objects for the supported push notification services, such as \
   APNS and GCM (Firebase Cloud Messaging). The results for [ListPlatformApplications] are \
   paginated and return a limited list of applications, up to 100. If additional records are \
   available after the first page results, then a NextToken string will be returned. To receive \
   the next page, you call [ListPlatformApplications] using the NextToken string received from the \
   previous call. When there are no more records to return, [NextToken] will be null. For more \
   information, see {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon \
   SNS Mobile Push Notifications}. \n\n\
  \ This action is throttled at 15 transactions per second (TPS).\n\
  \ "]

module ListSMSSandboxPhoneNumbers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sms_sandbox_phone_numbers_input ->
    ( list_sms_sandbox_phone_numbers_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sms_sandbox_phone_numbers_input ->
    ( list_sms_sandbox_phone_numbers_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the calling Amazon Web Services account's current verified and pending destination phone \
   numbers in the SMS sandbox.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

module ListSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_subscriptions_input ->
    ( list_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_subscriptions_input ->
    ( list_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the requester's subscriptions. Each call returns a limited list of \
   subscriptions, up to 100. If there are more subscriptions, a [NextToken] is also returned. Use \
   the [NextToken] parameter in a new [ListSubscriptions] call to get further results.\n\n\
  \ This action is throttled at 30 transactions per second (TPS).\n\
  \ "]

module ListSubscriptionsByTopic : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_subscriptions_by_topic_input ->
    ( list_subscriptions_by_topic_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_subscriptions_by_topic_input ->
    ( list_subscriptions_by_topic_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the subscriptions to a specific topic. Each call returns a limited list of \
   subscriptions, up to 100. If there are more subscriptions, a [NextToken] is also returned. Use \
   the [NextToken] parameter in a new [ListSubscriptionsByTopic] call to get further results.\n\n\
  \ This action is throttled at 30 transactions per second (TPS).\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagPolicyException of tag_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagPolicyException of tag_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all tags added to the specified Amazon SNS topic. For an overview, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html}Amazon SNS Tags} in the {i Amazon \
   Simple Notification Service Developer Guide}.\n"]

module ListTopics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_topics_input ->
    ( list_topics_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_topics_input ->
    ( list_topics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the requester's topics. Each call returns a limited list of topics, up to \
   100. If there are more topics, a [NextToken] is also returned. Use the [NextToken] parameter in \
   a new [ListTopics] call to get further results.\n\n\
  \ This action is throttled at 30 transactions per second (TPS).\n\
  \ "]

module OptInPhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    opt_in_phone_number_input ->
    ( opt_in_phone_number_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    opt_in_phone_number_input ->
    ( opt_in_phone_number_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this request to opt in a phone number that is opted out, which enables you to resume \
   sending SMS messages to the number.\n\n\
  \ You can opt in a phone number only once every 30 days.\n\
  \ "]

module Publish : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `EndpointDisabledException of endpoint_disabled_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSecurityException of invalid_security_exception
    | `KMSAccessDeniedException of kms_access_denied_exception
    | `KMSDisabledException of kms_disabled_exception
    | `KMSInvalidStateException of kms_invalid_state_exception
    | `KMSNotFoundException of kms_not_found_exception
    | `KMSOptInRequired of kms_opt_in_required
    | `KMSThrottlingException of kms_throttling_exception
    | `NotFoundException of not_found_exception
    | `PlatformApplicationDisabledException of platform_application_disabled_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    publish_input ->
    ( publish_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `EndpointDisabledException of endpoint_disabled_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSecurityException of invalid_security_exception
      | `KMSAccessDeniedException of kms_access_denied_exception
      | `KMSDisabledException of kms_disabled_exception
      | `KMSInvalidStateException of kms_invalid_state_exception
      | `KMSNotFoundException of kms_not_found_exception
      | `KMSOptInRequired of kms_opt_in_required
      | `KMSThrottlingException of kms_throttling_exception
      | `NotFoundException of not_found_exception
      | `PlatformApplicationDisabledException of platform_application_disabled_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    publish_input ->
    ( publish_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `EndpointDisabledException of endpoint_disabled_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSecurityException of invalid_security_exception
      | `KMSAccessDeniedException of kms_access_denied_exception
      | `KMSDisabledException of kms_disabled_exception
      | `KMSInvalidStateException of kms_invalid_state_exception
      | `KMSNotFoundException of kms_not_found_exception
      | `KMSOptInRequired of kms_opt_in_required
      | `KMSThrottlingException of kms_throttling_exception
      | `NotFoundException of not_found_exception
      | `PlatformApplicationDisabledException of platform_application_disabled_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone \
   number, or a message to a mobile platform endpoint (when you specify the [TargetArn]).\n\n\
  \ If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is \
   subscribed to the topic. The format of the message depends on the notification protocol for \
   each subscribed endpoint.\n\
  \ \n\
  \  When a [messageId] is returned, the message is saved and Amazon SNS immediately delivers it \
   to subscribers.\n\
  \  \n\
  \   To use the [Publish] action for publishing a message to a mobile endpoint, such as an app on \
   a Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. \
   The EndpointArn is returned when making a call with the [CreatePlatformEndpoint] action. \n\
  \   \n\
  \    For more information about formatting messages, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html}Send Custom \
   Platform-Specific Payloads in Messages to Mobile Devices}. \n\
  \    \n\
  \      You can publish messages only to topics and endpoints in the same Amazon Web Services \
   Region.\n\
  \      \n\
  \       "]

module PublishBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `BatchEntryIdsNotDistinctException of batch_entry_ids_not_distinct_exception
    | `BatchRequestTooLongException of batch_request_too_long_exception
    | `EmptyBatchRequestException of empty_batch_request_exception
    | `EndpointDisabledException of endpoint_disabled_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidBatchEntryIdException of invalid_batch_entry_id_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidSecurityException of invalid_security_exception
    | `KMSAccessDeniedException of kms_access_denied_exception
    | `KMSDisabledException of kms_disabled_exception
    | `KMSInvalidStateException of kms_invalid_state_exception
    | `KMSNotFoundException of kms_not_found_exception
    | `KMSOptInRequired of kms_opt_in_required
    | `KMSThrottlingException of kms_throttling_exception
    | `NotFoundException of not_found_exception
    | `PlatformApplicationDisabledException of platform_application_disabled_exception
    | `TooManyEntriesInBatchRequestException of too_many_entries_in_batch_request_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    publish_batch_input ->
    ( publish_batch_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `BatchEntryIdsNotDistinctException of batch_entry_ids_not_distinct_exception
      | `BatchRequestTooLongException of batch_request_too_long_exception
      | `EmptyBatchRequestException of empty_batch_request_exception
      | `EndpointDisabledException of endpoint_disabled_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidBatchEntryIdException of invalid_batch_entry_id_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSecurityException of invalid_security_exception
      | `KMSAccessDeniedException of kms_access_denied_exception
      | `KMSDisabledException of kms_disabled_exception
      | `KMSInvalidStateException of kms_invalid_state_exception
      | `KMSNotFoundException of kms_not_found_exception
      | `KMSOptInRequired of kms_opt_in_required
      | `KMSThrottlingException of kms_throttling_exception
      | `NotFoundException of not_found_exception
      | `PlatformApplicationDisabledException of platform_application_disabled_exception
      | `TooManyEntriesInBatchRequestException of too_many_entries_in_batch_request_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    publish_batch_input ->
    ( publish_batch_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `BatchEntryIdsNotDistinctException of batch_entry_ids_not_distinct_exception
      | `BatchRequestTooLongException of batch_request_too_long_exception
      | `EmptyBatchRequestException of empty_batch_request_exception
      | `EndpointDisabledException of endpoint_disabled_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidBatchEntryIdException of invalid_batch_entry_id_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidSecurityException of invalid_security_exception
      | `KMSAccessDeniedException of kms_access_denied_exception
      | `KMSDisabledException of kms_disabled_exception
      | `KMSInvalidStateException of kms_invalid_state_exception
      | `KMSNotFoundException of kms_not_found_exception
      | `KMSOptInRequired of kms_opt_in_required
      | `KMSThrottlingException of kms_throttling_exception
      | `NotFoundException of not_found_exception
      | `PlatformApplicationDisabledException of platform_application_disabled_exception
      | `TooManyEntriesInBatchRequestException of too_many_entries_in_batch_request_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Publishes up to 10 messages to the specified topic in a single batch. This is a batch version \
   of the [Publish] API. If you try to send more than 10 messages in a single batch request, you \
   will receive a [TooManyEntriesInBatchRequest] exception.\n\n\
  \ For FIFO topics, multiple messages within a single batch are published in the order they are \
   sent, and messages are deduplicated within the batch and across batches for five minutes.\n\
  \ \n\
  \  The result of publishing each message is reported individually in the response. Because the \
   batch request can result in a combination of successful and unsuccessful actions, you should \
   check for batch errors even when the call returns an HTTP status code of 200.\n\
  \  \n\
  \   The maximum allowed individual message size and the maximum total payload size (the sum of \
   the individual lengths of all of the batched messages) are both 256 KB (262,144 bytes).\n\
  \   \n\
  \     The [PublishBatch] API can send up to 10 messages at a time. If you attempt to send more \
   than 10 messages in one request, you will encounter a [TooManyEntriesInBatchRequest] exception. \
   In such cases, split your messages into multiple requests, each containing no more than 10 \
   messages.\n\
  \     \n\
  \       Some actions take lists of parameters. These lists are specified using the [param.n] \
   notation. Values of [n] are integers starting from {b 1}. For example, a parameter list with \
   two elements looks like this:\n\
  \       \n\
  \         [&AttributeName.1=first] \n\
  \        \n\
  \          [&AttributeName.2=second] \n\
  \         \n\
  \          If you send a batch message to a topic, Amazon SNS publishes the batch message to \
   each endpoint that is subscribed to the topic. The format of the batch message depends on the \
   notification protocol for each subscribed endpoint.\n\
  \          \n\
  \           When a [messageId] is returned, the batch message is saved, and Amazon SNS \
   immediately delivers the message to subscribers.\n\
  \           "]

module PutDataProtectionPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_protection_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_protection_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates an inline policy document that is stored in the specified Amazon SNS topic.\n"]

module RemovePermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_permission_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_permission_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a statement from a topic's access control policy.\n\n\
  \  To remove the ability to change topic permissions, you must deny permissions to the \
   [AddPermission], [RemovePermission], and [SetTopicAttributes] actions in your IAM policy.\n\
  \  \n\
  \   "]

module SetEndpointAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_endpoint_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_endpoint_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the attributes for an endpoint for a device on one of the supported push notification \
   services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. \n"]

module SetPlatformApplicationAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_platform_application_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_platform_application_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the attributes of the platform application object for the supported push notification \
   services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html}Using Amazon SNS Mobile Push \
   Notifications}. For information on configuring attributes for message delivery status, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html}Using Amazon SNS Application \
   Attributes for Message Delivery Status}. \n"]

module SetSMSAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottledException of throttled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_sms_attributes_input ->
    ( set_sms_attributes_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_sms_attributes_input ->
    ( set_sms_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Use this request to set the default settings for sending SMS messages and receiving daily SMS \
   usage reports.\n\n\
  \ You can override some of these settings for a single message when you use the [Publish] action \
   with the [MessageAttributes.entry.N] parameter. For more information, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html}Publishing to a mobile \
   phone} in the {i Amazon SNS Developer Guide}.\n\
  \ \n\
  \   To use this operation, you must grant the Amazon SNS service principal ([sns.amazonaws.com]) \
   permission to perform the [s3:ListBucket] action. \n\
  \   \n\
  \    "]

module SetSubscriptionAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ReplayLimitExceededException of replay_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_subscription_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_subscription_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows a subscription owner to set an attribute of the subscription to a new value.\n"]

module SetTopicAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_topic_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_topic_attributes_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows a topic owner to set an attribute of the topic to a new value.\n\n\
  \  To remove the ability to change topic permissions, you must deny permissions to the \
   [AddPermission], [RemovePermission], and [SetTopicAttributes] actions in your IAM policy.\n\
  \  \n\
  \   "]

module Subscribe : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception
    | `ReplayLimitExceededException of replay_limit_exceeded_exception
    | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    subscribe_input ->
    ( subscribe_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception
      | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    subscribe_input ->
    ( subscribe_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `FilterPolicyLimitExceededException of filter_policy_limit_exceeded_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception
      | `ReplayLimitExceededException of replay_limit_exceeded_exception
      | `SubscriptionLimitExceededException of subscription_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if \
   the endpoint and the topic are not in the same Amazon Web Services account, the endpoint owner \
   must run the [ConfirmSubscription] action to confirm the subscription.\n\n\
  \ You call the [ConfirmSubscription] action with the token from the subscription response. \
   Confirmation tokens are valid for two days.\n\
  \ \n\
  \  This action is throttled at 100 transactions per second (TPS).\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `StaleTagException of stale_tag_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception
    | `TagPolicyException of tag_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Add tags to the specified Amazon SNS topic. For an overview, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html}Amazon SNS Tags} in the {i Amazon \
   SNS Developer Guide}.\n\n\
  \ When you use topic tags, keep the following guidelines in mind:\n\
  \ \n\
  \  {ul\n\
  \        {-  Adding more than 50 tags to a topic isn't recommended.\n\
  \            \n\
  \             }\n\
  \        {-  Tags don't have any semantic meaning. Amazon SNS interprets tags as character \
   strings.\n\
  \            \n\
  \             }\n\
  \        {-  Tags are case-sensitive.\n\
  \            \n\
  \             }\n\
  \        {-  A new tag with a key identical to that of an existing tag overwrites the existing \
   tag.\n\
  \            \n\
  \             }\n\
  \        {-  Tagging actions are limited to 10 TPS per Amazon Web Services account, per Amazon \
   Web Services Region. If your application requires a higher throughput, file a \
   {{:https://console.aws.amazon.com/support/home#/case/create?issueType=technical}technical \
   support request}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module Unsubscribe : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidSecurityException of invalid_security_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidSecurityException of invalid_security_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a subscription. If the subscription requires authentication for deletion, only the \
   owner of the subscription or the topic's owner can unsubscribe, and an Amazon Web Services \
   signature is required. If the [Unsubscribe] call does not require authentication and the \
   requester is not the subscription owner, a final cancellation message is delivered to the \
   endpoint, so that the endpoint owner can easily resubscribe to the topic if the [Unsubscribe] \
   request was unintended.\n\n\
  \ This action is throttled at 100 transactions per second (TPS).\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `StaleTagException of stale_tag_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception
    | `TagPolicyException of tag_policy_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `StaleTagException of stale_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagPolicyException of tag_policy_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove tags from the specified Amazon SNS topic. For an overview, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html}Amazon SNS Tags} in the {i Amazon \
   SNS Developer Guide}.\n"]

module VerifySMSSandboxPhoneNumber : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottledException of throttled_exception
    | `VerificationException of verification_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    verify_sms_sandbox_phone_number_input ->
    ( verify_sms_sandbox_phone_number_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception
      | `VerificationException of verification_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    verify_sms_sandbox_phone_number_input ->
    ( verify_sms_sandbox_phone_number_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottledException of throttled_exception
      | `VerificationException of verification_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Verifies a destination phone number with a one-time password (OTP) for the calling Amazon Web \
   Services account.\n\n\
  \ When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in \
   the {i SMS sandbox}. The SMS sandbox provides a safe environment for you to try Amazon SNS \
   features without risking your reputation as an SMS sender. While your Amazon Web Services \
   account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can \
   send SMS messages only to verified destination phone numbers. For more information, including \
   how to move out of the sandbox to send messages without restrictions, see \
   {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html}SMS sandbox} in the {i Amazon \
   SNS Developer Guide}.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module AddPermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AuthorizationErrorException of authorization_error_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_permission_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_permission_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AuthorizationErrorException of authorization_error_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a statement to a topic's access control policy, granting access for the specified Amazon \
   Web Services accounts to the specified actions.\n\n\
  \  To remove the ability to change topic permissions, you must deny permissions to the \
   [AddPermission], [RemovePermission], and [SetTopicAttributes] actions in your IAM policy.\n\
  \  \n\
  \   "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
