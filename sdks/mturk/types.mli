type nonrec customer_id = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec worker_block = {
  reason : string_ option;
      [@ocaml.doc " A message explaining the reason the Worker was blocked. \n"]
  worker_id : customer_id option; [@ocaml.doc " The ID of the Worker who accepted the HIT.\n"]
}
[@@ocaml.doc
  " The WorkerBlock data structure represents a Worker who has been blocked. It has two elements: \
   the WorkerId and the Reason for the block. \n"]

type nonrec worker_block_list = worker_block list [@@ocaml.doc ""]

type nonrec entity_id = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec qualification_type_status = Inactive [@ocaml.doc ""] | Active [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec qualification_type = {
  auto_granted_value : integer option;
      [@ocaml.doc
        " The Qualification integer value to use for automatically granted Qualifications, if \
         AutoGranted is true. This is 1 by default. \n"]
  auto_granted : boolean_ option;
      [@ocaml.doc
        "Specifies that requests for the Qualification type are granted immediately, without \
         prompting the Worker with a Qualification test. Valid values are True | False.\n"]
  is_requestable : boolean_ option;
      [@ocaml.doc
        " Specifies whether the Qualification type is one that a user can request through the \
         Amazon Mechanical Turk web site, such as by taking a Qualification test. This value is \
         False for Qualifications assigned automatically by the system. Valid values are True | \
         False. \n"]
  retry_delay_in_seconds : long option;
      [@ocaml.doc
        " The amount of time, in seconds, Workers must wait after taking the Qualification test \
         before they can take it again. Workers can take a Qualification test multiple times if \
         they were not granted the Qualification from a previous attempt, or if the test offers a \
         gradient score and they want a better score. If not specified, retries are disabled and \
         Workers can request a Qualification only once. \n"]
  answer_key : string_ option;
      [@ocaml.doc "The answers to the Qualification test specified in the Test parameter.\n"]
  test_duration_in_seconds : long option;
      [@ocaml.doc
        " The amount of time, in seconds, given to a Worker to complete the Qualification test, \
         beginning from the time the Worker requests the Qualification. \n"]
  test : string_ option;
      [@ocaml.doc
        " The questions for a Qualification test associated with this Qualification type that a \
         user can take to obtain a Qualification of this type. This parameter must be specified if \
         AnswerKey is present. A Qualification type cannot have both a specified Test parameter \
         and an AutoGranted value of true. \n"]
  qualification_type_status : qualification_type_status option;
      [@ocaml.doc
        " The status of the Qualification type. A Qualification type's status determines if users \
         can apply to receive a Qualification of this type, and if HITs can be created with \
         requirements based on this type. Valid values are Active | Inactive. \n"]
  keywords : string_ option;
      [@ocaml.doc
        " One or more words or phrases that describe theQualification type, separated by commas. \
         The Keywords make the type easier to find using a search. \n"]
  description : string_ option; [@ocaml.doc " A long description for the Qualification type. \n"]
  name : string_ option;
      [@ocaml.doc
        " The name of the Qualification type. The type name is used to identify the type, and to \
         find the type using a Qualification type search. \n"]
  creation_time : timestamp option;
      [@ocaml.doc " The date and time the Qualification type was created. \n"]
  qualification_type_id : entity_id option;
      [@ocaml.doc
        " A unique identifier for the Qualification type. A Qualification type is given a \
         Qualification type ID when you call the CreateQualificationType operation. \n"]
}
[@@ocaml.doc
  " The QualificationType data structure represents a Qualification type, a description of a \
   property of a Worker that must match the requirements of a HIT for the Worker to be able to \
   accept the HIT. The type also describes how a Worker can obtain a Qualification of that type, \
   such as through a Qualification test. \n"]

type nonrec update_qualification_type_response = {
  qualification_type : qualification_type option;
      [@ocaml.doc " Contains a QualificationType data structure.\n"]
}
[@@ocaml.doc ""]

type nonrec update_qualification_type_request = {
  auto_granted_value : integer option;
      [@ocaml.doc
        "The Qualification value to use for automatically granted Qualifications. This parameter \
         is used only if the AutoGranted parameter is true.\n"]
  auto_granted : boolean_ option;
      [@ocaml.doc
        "Specifies whether requests for the Qualification type are granted immediately, without \
         prompting the Worker with a Qualification test.\n\n\
        \ Constraints: If the Test parameter is specified, this parameter cannot be true.\n\
        \ "]
  retry_delay_in_seconds : long option;
      [@ocaml.doc
        "The amount of time, in seconds, that Workers must wait after requesting a Qualification \
         of the specified Qualification type before they can retry the Qualification request. It \
         is not possible to disable retries for a Qualification type after it has been created \
         with retries enabled. If you want to disable retries, you must dispose of the existing \
         retry-enabled Qualification type using DisposeQualificationType and then create a new \
         Qualification type with retries disabled using CreateQualificationType.\n"]
  test_duration_in_seconds : long option;
      [@ocaml.doc
        "The number of seconds the Worker has to complete the Qualification test, starting from \
         the time the Worker requests the Qualification.\n"]
  answer_key : string_ option;
      [@ocaml.doc
        "The answers to the Qualification test specified in the Test parameter, in the form of an \
         AnswerKey data structure.\n"]
  test : string_ option;
      [@ocaml.doc
        "The questions for the Qualification test a Worker must answer correctly to obtain a \
         Qualification of this type. If this parameter is specified, [TestDurationInSeconds] must \
         also be specified.\n\n\
        \ Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm data structure. \
         This parameter cannot be specified if AutoGranted is true.\n\
        \ \n\
        \  Constraints: None. If not specified, the Worker may request the Qualification without \
         answering any questions.\n\
        \  "]
  qualification_type_status : qualification_type_status option;
      [@ocaml.doc "The new status of the Qualification type - Active | Inactive\n"]
  description : string_ option; [@ocaml.doc "The new description of the Qualification type.\n"]
  qualification_type_id : entity_id; [@ocaml.doc "The ID of the Qualification type to update.\n"]
}
[@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec turk_error_code = string [@@ocaml.doc ""]

type nonrec service_fault = {
  turk_error_code : turk_error_code option; [@ocaml.doc ""]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Amazon Mechanical Turk is temporarily unable to process your request. Try your call again.\n"]

type nonrec request_error = {
  turk_error_code : turk_error_code option; [@ocaml.doc ""]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Your request is invalid.\n"]

type nonrec update_notification_settings_response = unit [@@ocaml.doc ""]

type nonrec notification_transport =
  | SNS [@ocaml.doc ""]
  | SQS [@ocaml.doc ""]
  | Email [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type =
  | Ping [@ocaml.doc ""]
  | HITDisposed [@ocaml.doc ""]
  | HITExtended [@ocaml.doc ""]
  | HITReviewable [@ocaml.doc ""]
  | HITExpired [@ocaml.doc ""]
  | HITCreated [@ocaml.doc ""]
  | AssignmentApproved [@ocaml.doc ""]
  | AssignmentRejected [@ocaml.doc ""]
  | AssignmentSubmitted [@ocaml.doc ""]
  | AssignmentReturned [@ocaml.doc ""]
  | AssignmentAbandoned [@ocaml.doc ""]
  | AssignmentAccepted [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type_list = event_type list [@@ocaml.doc ""]

type nonrec notification_specification = {
  event_types : event_type_list;
      [@ocaml.doc
        " The list of events that should cause notifications to be sent. Valid Values: \
         AssignmentAccepted | AssignmentAbandoned | AssignmentReturned | AssignmentSubmitted | \
         AssignmentRejected | AssignmentApproved | HITCreated | HITExtended | HITDisposed | \
         HITReviewable | HITExpired | Ping. The Ping event is only valid for the \
         SendTestEventNotification operation. \n"]
  version : string_;
      [@ocaml.doc "The version of the Notification API to use. Valid value is 2006-05-05.\n"]
  transport : notification_transport;
      [@ocaml.doc
        " The method Amazon Mechanical Turk uses to send the notification. Valid Values: Email | \
         SQS | SNS. \n"]
  destination : string_;
      [@ocaml.doc
        " The target for notification messages. The Destination\226\128\153s format is determined \
         by the specified Transport: \n\n\
        \ {ul\n\
        \       {-  When Transport is Email, the Destination is your email address.\n\
        \           \n\
        \            }\n\
        \       {-  When Transport is SQS, the Destination is your queue URL.\n\
        \           \n\
        \            }\n\
        \       {-  When Transport is SNS, the Destination is the ARN of your topic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The NotificationSpecification data structure describes a HIT event notification for a HIT type.\n"]

type nonrec update_notification_settings_request = {
  active : boolean_ option;
      [@ocaml.doc
        " Specifies whether notifications are sent for HITs of this HIT type, according to the \
         notification specification. You must specify either the Notification parameter or the \
         Active parameter for the call to UpdateNotificationSettings to succeed. \n"]
  notification : notification_specification option;
      [@ocaml.doc " The notification specification for the HIT type. \n"]
  hit_type_id : entity_id;
      [@ocaml.doc " The ID of the HIT type whose notification specification is being updated. \n"]
}
[@@ocaml.doc ""]

type nonrec update_hit_type_of_hit_response = unit [@@ocaml.doc ""]

type nonrec update_hit_type_of_hit_request = {
  hit_type_id : entity_id; [@ocaml.doc "The ID of the new HIT type.\n"]
  hit_id : entity_id; [@ocaml.doc "The HIT to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_hit_review_status_response = unit [@@ocaml.doc ""]

type nonrec update_hit_review_status_request = {
  revert : boolean_ option;
      [@ocaml.doc
        " Specifies how to update the HIT status. Default is [False]. \n\n\
        \ {ul\n\
        \       {-   Setting this to false will only transition a HIT from [Reviewable] to \
         [Reviewing] \n\
        \           \n\
        \            }\n\
        \       {-   Setting this to true will only transition a HIT from [Reviewing] to \
         [Reviewable] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  hit_id : entity_id; [@ocaml.doc " The ID of the HIT to update. \n"]
}
[@@ocaml.doc ""]

type nonrec update_expiration_for_hit_response = unit [@@ocaml.doc ""]

type nonrec update_expiration_for_hit_request = {
  expire_at : timestamp; [@ocaml.doc " The date and time at which you want the HIT to expire \n"]
  hit_id : entity_id; [@ocaml.doc " The HIT to update. \n"]
}
[@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec send_test_event_notification_response = unit [@@ocaml.doc ""]

type nonrec send_test_event_notification_request = {
  test_event_type : event_type;
      [@ocaml.doc
        " The event to simulate to test the notification specification. This event is included in \
         the test message even if the notification specification does not include the event type. \
         The notification specification does not filter out the test event. \n"]
  notification : notification_specification;
      [@ocaml.doc
        " The notification specification to test. This value is identical to the value you would \
         provide to the UpdateNotificationSettings operation when you establish the notification \
         specification for a HIT type. \n"]
}
[@@ocaml.doc ""]

type nonrec send_bonus_response = unit [@@ocaml.doc ""]

type nonrec currency_amount = string [@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec send_bonus_request = {
  unique_request_token : idempotency_token option;
      [@ocaml.doc
        "A unique identifier for this request, which allows you to retry the call on error without \
         granting multiple bonuses. This is useful in cases such as network timeouts where it is \
         unclear whether or not the call succeeded on the server. If the bonus already exists in \
         the system from a previous call using the same UniqueRequestToken, subsequent calls will \
         return an error with a message containing the request ID.\n"]
  reason : string_;
      [@ocaml.doc
        "A message that explains the reason for the bonus payment. The Worker receiving the bonus \
         can see this message.\n"]
  assignment_id : entity_id; [@ocaml.doc "The ID of the assignment for which this bonus is paid.\n"]
  bonus_amount : currency_amount;
      [@ocaml.doc
        " The Bonus amount is a US Dollar amount specified using a string (for example, \"5\" \
         represents $5.00 USD and \"101.42\" represents $101.42 USD). Do not include currency \
         symbols or currency codes. \n"]
  worker_id : customer_id; [@ocaml.doc "The ID of the Worker being paid the bonus.\n"]
}
[@@ocaml.doc ""]

type nonrec reviewable_hit_status = Reviewing [@ocaml.doc ""] | Reviewable [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec review_result_detail = {
  value : string_ option;
      [@ocaml.doc " The values of Key provided by the review policies you have selected. \n"]
  key : string_ option;
      [@ocaml.doc " Key identifies the particular piece of reviewed information. \n"]
  question_id : entity_id option;
      [@ocaml.doc
        " Specifies the QuestionId the result is describing. Depending on whether the TargetType \
         is a HIT or Assignment this results could specify multiple values. If TargetType is HIT \
         and QuestionId is absent, then the result describes results of the HIT, including the HIT \
         agreement score. If ObjectType is Assignment and QuestionId is absent, then the result \
         describes the Worker's performance on the HIT. \n"]
  subject_type : string_ option; [@ocaml.doc " The type of the object from the SubjectId field.\n"]
  subject_id : entity_id option;
      [@ocaml.doc
        "The HITID or AssignmentId about which this result was taken. Note that HIT-level Review \
         Policies will often emit results about both the HIT itself and its Assignments, while \
         Assignment-level review policies generally only emit results about the Assignment itself. \n"]
  action_id : entity_id option; [@ocaml.doc " A unique identifier of the Review action result. \n"]
}
[@@ocaml.doc
  " This data structure is returned multiple times for each result specified in the Review Policy. \n"]

type nonrec review_result_detail_list = review_result_detail list [@@ocaml.doc ""]

type nonrec review_action_status =
  | Cancelled [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Intended [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec review_action_detail = {
  error_code : string_ option; [@ocaml.doc " Present only when the Results have a FAILED Status.\n"]
  result_ : string_ option; [@ocaml.doc " A description of the outcome of the review.\n"]
  complete_time : timestamp option; [@ocaml.doc " The date when the action was completed.\n"]
  status : review_action_status option;
      [@ocaml.doc
        " The current disposition of the action: INTENDED, SUCCEEDED, FAILED, or CANCELLED. \n"]
  target_type : string_ option; [@ocaml.doc " The type of object in TargetId.\n"]
  target_id : entity_id option;
      [@ocaml.doc " The specific HITId or AssignmentID targeted by the action.\n"]
  action_name : string_ option;
      [@ocaml.doc
        " The nature of the action itself. The Review Policy is responsible for examining the HIT \
         and Assignments, emitting results, and deciding which other actions will be necessary. \n"]
  action_id : entity_id option; [@ocaml.doc "The unique identifier for the action.\n"]
}
[@@ocaml.doc
  " Both the AssignmentReviewReport and the HITReviewReport elements contains the \
   ReviewActionDetail data structure. This structure is returned multiple times for each action \
   specified in the Review Policy. \n"]

type nonrec review_action_detail_list = review_action_detail list [@@ocaml.doc ""]

type nonrec review_report = {
  review_actions : review_action_detail_list option;
      [@ocaml.doc
        " A list of ReviewAction objects for each action specified in the Review Policy. \n"]
  review_results : review_result_detail_list option;
      [@ocaml.doc
        " A list of ReviewResults objects for each action specified in the Review Policy. \n"]
}
[@@ocaml.doc " Contains both ReviewResult and ReviewAction elements for a particular HIT. \n"]

type nonrec review_policy_level = HIT [@ocaml.doc ""] | Assignment [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec review_policy_level_list = review_policy_level list [@@ocaml.doc ""]

type nonrec parameter_map_entry = {
  values : string_list option;
      [@ocaml.doc
        " The list of answers to the question specified in the MapEntry Key element. The Worker \
         must match all values in order for the answer to be scored correctly. \n"]
  key : string_ option;
      [@ocaml.doc
        " The QuestionID from the HIT that is used to identify which question requires Mechanical \
         Turk to score as part of the ScoreMyKnownAnswers/2011-09-01 Review Policy. \n"]
}
[@@ocaml.doc
  " This data structure is the data type for the AnswerKey parameter of the \
   ScoreMyKnownAnswers/2011-09-01 Review Policy. \n"]

type nonrec parameter_map_entry_list = parameter_map_entry list [@@ocaml.doc ""]

type nonrec policy_parameter = {
  map_entries : parameter_map_entry_list option;
      [@ocaml.doc " List of ParameterMapEntry objects. \n"]
  values : string_list option; [@ocaml.doc " The list of values of the Parameter\n"]
  key : string_ option; [@ocaml.doc " Name of the parameter from the list of Review Polices. \n"]
}
[@@ocaml.doc " Name of the parameter from the Review policy. \n"]

type nonrec policy_parameter_list = policy_parameter list [@@ocaml.doc ""]

type nonrec review_policy = {
  parameters : policy_parameter_list option;
      [@ocaml.doc "Name of the parameter from the Review policy.\n"]
  policy_name : string_;
      [@ocaml.doc
        " Name of a Review Policy: SimplePlurality/2011-09-01 or ScoreMyKnownAnswers/2011-09-01 \n"]
}
[@@ocaml.doc
  " HIT Review Policy data structures represent HIT review policies, which you specify when you \
   create a HIT. \n"]

type nonrec result_size = int [@@ocaml.doc ""]

type nonrec reject_qualification_request_response = unit [@@ocaml.doc ""]

type nonrec reject_qualification_request_request = {
  reason : string_ option;
      [@ocaml.doc
        "A text message explaining why the request was rejected, to be shown to the Worker who \
         made the request.\n"]
  qualification_request_id : string_;
      [@ocaml.doc
        " The ID of the Qualification request, as returned by the [ListQualificationRequests] \
         operation. \n"]
}
[@@ocaml.doc ""]

type nonrec reject_assignment_response = unit [@@ocaml.doc ""]

type nonrec reject_assignment_request = {
  requester_feedback : string_;
      [@ocaml.doc
        " A message for the Worker, which the Worker can see in the Status section of the web site. \n"]
  assignment_id : entity_id;
      [@ocaml.doc
        " The ID of the assignment. The assignment must correspond to a HIT created by the \
         Requester. \n"]
}
[@@ocaml.doc ""]

type nonrec qualification_type_list = qualification_type list [@@ocaml.doc ""]

type nonrec qualification_status = Revoked [@ocaml.doc ""] | Granted [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec comparator =
  | NotIn [@ocaml.doc ""]
  | In [@ocaml.doc ""]
  | DoesNotExist [@ocaml.doc ""]
  | Exists [@ocaml.doc ""]
  | NotEqualTo [@ocaml.doc ""]
  | EqualTo [@ocaml.doc ""]
  | GreaterThanOrEqualTo [@ocaml.doc ""]
  | GreaterThan [@ocaml.doc ""]
  | LessThanOrEqualTo [@ocaml.doc ""]
  | LessThan [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer_list = integer list [@@ocaml.doc ""]

type nonrec country_parameters = string [@@ocaml.doc ""]

type nonrec locale = {
  subdivision : country_parameters option;
      [@ocaml.doc
        "The state or subdivision of the locale. A valid ISO 3166-2 subdivision code. For example, \
         the code WA refers to the state of Washington.\n"]
  country : country_parameters;
      [@ocaml.doc
        " The country of the locale. Must be a valid ISO 3166 country code. For example, the code \
         US refers to the United States of America. \n"]
}
[@@ocaml.doc "The Locale data structure represents a geographical region or location.\n"]

type nonrec locale_list = locale list [@@ocaml.doc ""]

type nonrec hit_access_actions =
  | DiscoverPreviewAndAccept [@ocaml.doc ""]
  | PreviewAndAccept [@ocaml.doc ""]
  | Accept [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec qualification_requirement = {
  actions_guarded : hit_access_actions option;
      [@ocaml.doc
        " Setting this attribute prevents Workers whose Qualifications do not meet this \
         QualificationRequirement from taking the specified action. Valid arguments include \
         \"Accept\" (Worker cannot accept the HIT, but can preview the HIT and see it in their \
         search results), \"PreviewAndAccept\" (Worker cannot accept or preview the HIT, but can \
         see the HIT in their search results), and \"DiscoverPreviewAndAccept\" (Worker cannot \
         accept, preview, or see the HIT in their search results). It's possible for you to create \
         a HIT with multiple QualificationRequirements (which can have different values for the \
         ActionGuarded attribute). In this case, the Worker is only permitted to perform an action \
         when they have met all QualificationRequirements guarding the action. The actions in the \
         order of least restrictive to most restrictive are Discover, Preview and Accept. For \
         example, if a Worker meets all QualificationRequirements that are set to \
         DiscoverPreviewAndAccept, but do not meet all requirements that are set with \
         PreviewAndAccept, then the Worker will be able to Discover, i.e. see the HIT in their \
         search result, but will not be able to Preview or Accept the HIT. ActionsGuarded should \
         not be used in combination with the [RequiredToPreview] field. \n"]
  required_to_preview : boolean_ option;
      [@ocaml.doc
        " DEPRECATED: Use the [ActionsGuarded] field instead. If RequiredToPreview is true, the \
         question data for the HIT will not be shown when a Worker whose Qualifications do not \
         meet this requirement tries to preview the HIT. That is, a Worker's Qualifications must \
         meet all of the requirements for which RequiredToPreview is true in order to preview the \
         HIT. If a Worker meets all of the requirements where RequiredToPreview is true (or if \
         there are no such requirements), but does not meet all of the requirements for the HIT, \
         the Worker will be allowed to preview the HIT's question data, but will not be allowed to \
         accept and complete the HIT. The default is false. This should not be used in combination \
         with the [ActionsGuarded] field. \n"]
  locale_values : locale_list option;
      [@ocaml.doc
        " The locale value to compare against the Qualification's value. The local value must be a \
         valid ISO 3166 country code or supports ISO 3166-2 subdivisions. LocaleValue can only be \
         used with a Worker_Locale QualificationType ID. LocaleValue can only be used with the \
         EqualTo, NotEqualTo, In, and NotIn comparators. You must only use a single LocaleValue \
         element when using the EqualTo or NotEqualTo comparators. When performing a set \
         comparison by using the In or the NotIn comparator, you can use up to 30 LocaleValue \
         elements in a QualificationRequirement data structure. \n"]
  integer_values : integer_list option;
      [@ocaml.doc
        " The integer value to compare against the Qualification's value. IntegerValue must not be \
         present if Comparator is Exists or DoesNotExist. IntegerValue can only be used if the \
         Qualification type has an integer value; it cannot be used with the Worker_Locale \
         QualificationType ID. When performing a set comparison by using the In or the NotIn \
         comparator, you can use up to 15 IntegerValue elements in a QualificationRequirement data \
         structure. \n"]
  comparator : comparator;
      [@ocaml.doc
        "The kind of comparison to make against a Qualification's value. You can compare a \
         Qualification's value to an IntegerValue to see if it is LessThan, LessThanOrEqualTo, \
         GreaterThan, GreaterThanOrEqualTo, EqualTo, or NotEqualTo the IntegerValue. You can \
         compare it to a LocaleValue to see if it is EqualTo, or NotEqualTo the LocaleValue. You \
         can check to see if the value is In or NotIn a set of IntegerValue or LocaleValue values. \
         Lastly, a Qualification requirement can also test if a Qualification Exists or \
         DoesNotExist in the user's profile, regardless of its value. \n"]
  qualification_type_id : string_;
      [@ocaml.doc " The ID of the Qualification type for the requirement.\n"]
}
[@@ocaml.doc
  " The QualificationRequirement data structure describes a Qualification that a Worker must have \
   before the Worker is allowed to accept a HIT. A requirement may optionally state that a Worker \
   must have the Qualification in order to preview the HIT, or see the HIT in search results. \n"]

type nonrec qualification_requirement_list = qualification_requirement list [@@ocaml.doc ""]

type nonrec qualification_request = {
  submit_time : timestamp option;
      [@ocaml.doc
        "The date and time the Qualification request had a status of Submitted. This is either the \
         time the Worker submitted answers for a Qualification test, or the time the Worker \
         requested the Qualification if the Qualification type does not have a test. \n"]
  answer : string_ option;
      [@ocaml.doc
        " The Worker's answers for the Qualification type's test contained in a \
         QuestionFormAnswers document, if the type has a test and the Worker has submitted \
         answers. If the Worker does not provide any answers, Answer may be empty. \n"]
  test : string_ option;
      [@ocaml.doc
        " The contents of the Qualification test that was presented to the Worker, if the type has \
         a test and the Worker has submitted answers. This value is identical to the QuestionForm \
         associated with the Qualification type at the time the Worker requests the Qualification.\n"]
  worker_id : customer_id option;
      [@ocaml.doc " The ID of the Worker requesting the Qualification.\n"]
  qualification_type_id : entity_id option;
      [@ocaml.doc
        " The ID of the Qualification type the Worker is requesting, as returned by the \
         CreateQualificationType operation. \n"]
  qualification_request_id : string_ option;
      [@ocaml.doc
        "The ID of the Qualification request, a unique identifier generated when the request was \
         submitted. \n"]
}
[@@ocaml.doc
  " The QualificationRequest data structure represents a request a Worker has made for a \
   Qualification. \n"]

type nonrec qualification_request_list = qualification_request list [@@ocaml.doc ""]

type nonrec qualification = {
  status : qualification_status option;
      [@ocaml.doc " The status of the Qualification. Valid values are Granted | Revoked.\n"]
  locale_value : locale option; [@ocaml.doc ""]
  integer_value : integer option;
      [@ocaml.doc
        " The value (score) of the Qualification, if the Qualification has an integer value.\n"]
  grant_time : timestamp option;
      [@ocaml.doc
        " The date and time the Qualification was granted to the Worker. If the Worker's \
         Qualification was revoked, and then re-granted based on a new Qualification request, \
         GrantTime is the date and time of the last call to the AcceptQualificationRequest \
         operation.\n"]
  worker_id : customer_id option;
      [@ocaml.doc " The ID of the Worker who possesses the Qualification. \n"]
  qualification_type_id : entity_id option;
      [@ocaml.doc " The ID of the Qualification type for the Qualification.\n"]
}
[@@ocaml.doc
  "The Qualification data structure represents a Qualification assigned to a user, including the \
   Qualification type and the value (score).\n"]

type nonrec qualification_list = qualification list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec notify_workers_failure_code =
  | HardFailure [@ocaml.doc ""]
  | SoftFailure [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec notify_workers_failure_status = {
  worker_id : customer_id option; [@ocaml.doc " The ID of the Worker.\n"]
  notify_workers_failure_message : string_ option;
      [@ocaml.doc " A message detailing the reason the Worker could not be notified. \n"]
  notify_workers_failure_code : notify_workers_failure_code option;
      [@ocaml.doc " Encoded value for the failure type. \n"]
}
[@@ocaml.doc
  " When MTurk encounters an issue with notifying the Workers you specified, it returns back this \
   object with failure details. \n"]

type nonrec notify_workers_failure_status_list = notify_workers_failure_status list [@@ocaml.doc ""]

type nonrec notify_workers_response = {
  notify_workers_failure_statuses : notify_workers_failure_status_list option;
      [@ocaml.doc
        " When MTurk sends notifications to the list of Workers, it returns back any failures it \
         encounters in this list of NotifyWorkersFailureStatus objects. \n"]
}
[@@ocaml.doc ""]

type nonrec customer_id_list = customer_id list [@@ocaml.doc ""]

type nonrec notify_workers_request = {
  worker_ids : customer_id_list;
      [@ocaml.doc
        "A list of Worker IDs you wish to notify. You can notify upto 100 Workers at a time.\n"]
  message_text : string_;
      [@ocaml.doc "The text of the email message to send. Can include up to 4,096 characters\n"]
  subject : string_;
      [@ocaml.doc
        "The subject line of the email message to send. Can include up to 200 characters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_workers_with_qualification_type_response = {
  qualifications : qualification_list option;
      [@ocaml.doc " The list of Qualification elements returned by this call. \n"]
  num_results : integer option;
      [@ocaml.doc
        " The number of Qualifications on this page in the filtered results list, equivalent to \
         the number of Qualifications being returned by this call.\n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_workers_with_qualification_type_request = {
  max_results : result_size option; [@ocaml.doc " Limit the number of results returned. \n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination Token\n"]
  status : qualification_status option;
      [@ocaml.doc " The status of the Qualifications to return. Can be [Granted | Revoked]. \n"]
  qualification_type_id : entity_id;
      [@ocaml.doc "The ID of the Qualification type of the Qualifications to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_worker_blocks_response = {
  worker_blocks : worker_block_list option;
      [@ocaml.doc
        " The list of WorkerBlocks, containing the collection of Worker IDs and reasons for \
         blocking.\n"]
  num_results : integer option;
      [@ocaml.doc
        " The number of assignments on the page in the filtered results list, equivalent to the \
         number of assignments returned by this call.\n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_worker_blocks_request = {
  max_results : result_size option; [@ocaml.doc ""]
  next_token : pagination_token option; [@ocaml.doc "Pagination token\n"]
}
[@@ocaml.doc ""]

type nonrec list_review_policy_results_for_hit_response = {
  next_token : pagination_token option; [@ocaml.doc ""]
  hit_review_report : review_report option;
      [@ocaml.doc "Contains both ReviewResult and ReviewAction elements for a particular HIT. \n"]
  assignment_review_report : review_report option;
      [@ocaml.doc " Contains both ReviewResult and ReviewAction elements for an Assignment. \n"]
  hit_review_policy : review_policy option;
      [@ocaml.doc
        "The name of the HIT-level Review Policy. This contains only the PolicyName element.\n"]
  assignment_review_policy : review_policy option;
      [@ocaml.doc
        " The name of the Assignment-level Review Policy. This contains only the PolicyName \
         element. \n"]
  hit_id : entity_id option;
      [@ocaml.doc "The HITId of the HIT for which results have been returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_review_policy_results_for_hit_request = {
  max_results : result_size option; [@ocaml.doc "Limit the number of results returned.\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token\n"]
  retrieve_results : boolean_ option;
      [@ocaml.doc
        " Specify if the operation should retrieve a list of the results computed by the Review \
         Policies. \n"]
  retrieve_actions : boolean_ option;
      [@ocaml.doc
        " Specify if the operation should retrieve a list of the actions taken executing the \
         Review Policies and their outcomes. \n"]
  policy_levels : review_policy_level_list option;
      [@ocaml.doc
        " The Policy Level(s) to retrieve review results for - HIT or Assignment. If omitted, the \
         default behavior is to retrieve all data for both policy levels. For a list of all the \
         described policies, see Review Policies. \n"]
  hit_id : entity_id;
      [@ocaml.doc "The unique identifier of the HIT to retrieve review results for.\n"]
}
[@@ocaml.doc ""]

type nonrec hit_status =
  | Disposed [@ocaml.doc ""]
  | Reviewing [@ocaml.doc ""]
  | Reviewable [@ocaml.doc ""]
  | Unassignable [@ocaml.doc ""]
  | Assignable [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hit_review_status =
  | ReviewedInappropriate [@ocaml.doc ""]
  | ReviewedAppropriate [@ocaml.doc ""]
  | MarkedForReview [@ocaml.doc ""]
  | NotReviewed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hi_t = {
  number_of_assignments_completed : integer option;
      [@ocaml.doc " The number of assignments for this HIT that have been approved or rejected.\n"]
  number_of_assignments_available : integer option;
      [@ocaml.doc
        " The number of assignments for this HIT that are available for Workers to accept.\n"]
  number_of_assignments_pending : integer option;
      [@ocaml.doc
        " The number of assignments for this HIT that are being previewed or have been accepted by \
         Workers, but have not yet been submitted, returned, or abandoned.\n"]
  hit_review_status : hit_review_status option;
      [@ocaml.doc
        " Indicates the review status of the HIT. Valid Values are NotReviewed | MarkedForReview | \
         ReviewedAppropriate | ReviewedInappropriate.\n"]
  qualification_requirements : qualification_requirement_list option;
      [@ocaml.doc
        " Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT \
         can have between zero and ten Qualification requirements. All requirements must be met in \
         order for a Worker to accept the HIT. Additionally, other actions can be restricted using \
         the [ActionsGuarded] field on each [QualificationRequirement] structure. \n"]
  requester_annotation : string_ option;
      [@ocaml.doc
        " An arbitrary data field the Requester who created the HIT can use. This field is visible \
         only to the creator of the HIT.\n"]
  assignment_duration_in_seconds : long option;
      [@ocaml.doc
        " The length of time, in seconds, that a Worker has to complete the HIT after accepting it.\n"]
  expiration : timestamp option; [@ocaml.doc "The date and time the HIT expires.\n"]
  auto_approval_delay_in_seconds : long option;
      [@ocaml.doc
        "The amount of time, in seconds, after the Worker submits an assignment for the HIT that \
         the results are automatically approved by Amazon Mechanical Turk. This is the amount of \
         time the Requester has to reject an assignment submitted by a Worker before the \
         assignment is auto-approved and the Worker is paid. \n"]
  reward : currency_amount option; [@ocaml.doc ""]
  max_assignments : integer option;
      [@ocaml.doc
        "The number of times the HIT can be accepted and completed before the HIT becomes \
         unavailable. \n"]
  hit_status : hit_status option;
      [@ocaml.doc
        "The status of the HIT and its assignments. Valid Values are Assignable | Unassignable | \
         Reviewable | Reviewing | Disposed. \n"]
  keywords : string_ option;
      [@ocaml.doc
        " One or more words or phrases that describe the HIT, separated by commas. Search terms \
         similar to the keywords of a HIT are more likely to have the HIT in the search results.\n"]
  question : string_ option;
      [@ocaml.doc
        " The data the Worker completing the HIT uses produce the results. This is either either a \
         QuestionForm, HTMLQuestion or an ExternalQuestion data structure.\n"]
  description : string_ option; [@ocaml.doc " A general description of the HIT.\n"]
  title : string_ option; [@ocaml.doc " The title of the HIT.\n"]
  creation_time : timestamp option; [@ocaml.doc " The date and time the HIT was created.\n"]
  hit_layout_id : entity_id option; [@ocaml.doc " The ID of the HIT Layout of this HIT.\n"]
  hit_group_id : entity_id option; [@ocaml.doc " The ID of the HIT Group of this HIT.\n"]
  hit_type_id : entity_id option; [@ocaml.doc "The ID of the HIT type of this HIT\n"]
  hit_id : entity_id option; [@ocaml.doc " A unique identifier for the HIT.\n"]
}
[@@ocaml.doc
  " The HIT data structure represents a single HIT, including all the information necessary for a \
   Worker to accept and complete the HIT.\n"]

type nonrec hit_list = hi_t list [@@ocaml.doc ""]

type nonrec list_reviewable_hi_ts_response = {
  hi_ts : hit_list option; [@ocaml.doc " The list of HIT elements returned by the query.\n"]
  num_results : integer option;
      [@ocaml.doc
        " The number of HITs on this page in the filtered results list, equivalent to the number \
         of HITs being returned by this call. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_reviewable_hi_ts_request = {
  max_results : result_size option; [@ocaml.doc " Limit the number of results returned. \n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination Token\n"]
  status : reviewable_hit_status option;
      [@ocaml.doc " Can be either [Reviewable] or [Reviewing]. Reviewable is the default value. \n"]
  hit_type_id : entity_id option;
      [@ocaml.doc
        " The ID of the HIT type of the HITs to consider for the query. If not specified, all HITs \
         for the Reviewer are considered \n"]
}
[@@ocaml.doc ""]

type nonrec list_qualification_types_response = {
  qualification_types : qualification_type_list option;
      [@ocaml.doc " The list of QualificationType elements returned by the query. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
  num_results : integer option;
      [@ocaml.doc
        " The number of Qualification types on this page in the filtered results list, equivalent \
         to the number of types this operation returns. \n"]
}
[@@ocaml.doc ""]

type nonrec list_qualification_types_request = {
  max_results : result_size option;
      [@ocaml.doc " The maximum number of results to return in a single call. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
  must_be_owned_by_caller : boolean_ option;
      [@ocaml.doc
        " Specifies that only Qualification types that the Requester created are returned. If \
         false, the operation returns all Qualification types. \n"]
  must_be_requestable : boolean_;
      [@ocaml.doc
        "Specifies that only Qualification types that a user can request through the Amazon \
         Mechanical Turk web site, such as by taking a Qualification test, are returned as results \
         of the search. Some Qualification types, such as those assigned automatically by the \
         system, cannot be requested directly by users. If false, all Qualification types, \
         including those managed by the system, are considered. Valid values are True | False. \n"]
  query : string_ option;
      [@ocaml.doc
        " A text query against all of the searchable attributes of Qualification types. \n"]
}
[@@ocaml.doc ""]

type nonrec list_qualification_requests_response = {
  qualification_requests : qualification_request_list option;
      [@ocaml.doc
        "The Qualification request. The response includes one QualificationRequest element for \
         each Qualification request returned by the query.\n"]
  next_token : pagination_token option; [@ocaml.doc ""]
  num_results : integer option;
      [@ocaml.doc
        "The number of Qualification requests on this page in the filtered results list, \
         equivalent to the number of Qualification requests being returned by this call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_qualification_requests_request = {
  max_results : result_size option;
      [@ocaml.doc " The maximum number of results to return in a single call. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
  qualification_type_id : entity_id option; [@ocaml.doc "The ID of the QualificationType.\n"]
}
[@@ocaml.doc ""]

type nonrec list_hi_ts_for_qualification_type_response = {
  hi_ts : hit_list option; [@ocaml.doc " The list of HIT elements returned by the query.\n"]
  num_results : integer option;
      [@ocaml.doc
        " The number of HITs on this page in the filtered results list, equivalent to the number \
         of HITs being returned by this call. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_hi_ts_for_qualification_type_request = {
  max_results : result_size option; [@ocaml.doc " Limit the number of results returned. \n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination Token\n"]
  qualification_type_id : entity_id;
      [@ocaml.doc " The ID of the Qualification type to use when querying HITs. \n"]
}
[@@ocaml.doc ""]

type nonrec list_hi_ts_response = {
  hi_ts : hit_list option; [@ocaml.doc " The list of HIT elements returned by the query.\n"]
  num_results : integer option;
      [@ocaml.doc
        "The number of HITs on this page in the filtered results list, equivalent to the number of \
         HITs being returned by this call.\n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_hi_ts_request = {
  max_results : result_size option; [@ocaml.doc ""]
  next_token : pagination_token option; [@ocaml.doc "Pagination token\n"]
}
[@@ocaml.doc ""]

type nonrec bonus_payment = {
  grant_time : timestamp option; [@ocaml.doc "The date and time of when the bonus was granted.\n"]
  reason : string_ option;
      [@ocaml.doc "The Reason text given when the bonus was granted, if any.\n"]
  assignment_id : entity_id option;
      [@ocaml.doc "The ID of the assignment associated with this bonus payment.\n"]
  bonus_amount : currency_amount option; [@ocaml.doc ""]
  worker_id : customer_id option; [@ocaml.doc "The ID of the Worker to whom the bonus was paid.\n"]
}
[@@ocaml.doc "An object representing a Bonus payment paid to a Worker.\n"]

type nonrec bonus_payment_list = bonus_payment list [@@ocaml.doc ""]

type nonrec list_bonus_payments_response = {
  bonus_payments : bonus_payment_list option;
      [@ocaml.doc
        "A successful request to the ListBonusPayments operation returns a list of BonusPayment \
         objects. \n"]
  next_token : pagination_token option; [@ocaml.doc ""]
  num_results : integer option;
      [@ocaml.doc
        "The number of bonus payments on this page in the filtered results list, equivalent to the \
         number of bonus payments being returned by this call. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bonus_payments_request = {
  max_results : result_size option; [@ocaml.doc ""]
  next_token : pagination_token option; [@ocaml.doc "Pagination token\n"]
  assignment_id : entity_id option;
      [@ocaml.doc
        "The ID of the assignment associated with the bonus payments to retrieve. If specified, \
         only bonus payments for the given assignment are returned. Either the HITId parameter or \
         the AssignmentId parameter must be specified\n"]
  hit_id : entity_id option;
      [@ocaml.doc
        "The ID of the HIT associated with the bonus payments to retrieve. If not specified, all \
         bonus payments for all assignments for the given HIT are returned. Either the HITId \
         parameter or the AssignmentId parameter must be specified\n"]
}
[@@ocaml.doc ""]

type nonrec assignment_status =
  | Rejected [@ocaml.doc ""]
  | Approved [@ocaml.doc ""]
  | Submitted [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec assignment = {
  requester_feedback : string_ option;
      [@ocaml.doc
        " The feedback string included with the call to the ApproveAssignment operation or the \
         RejectAssignment operation, if the Requester approved or rejected the assignment and \
         specified feedback.\n"]
  answer : string_ option;
      [@ocaml.doc
        " The Worker's answers submitted for the HIT contained in a QuestionFormAnswers document, \
         if the Worker provides an answer. If the Worker does not provide any answers, Answer may \
         contain a QuestionFormAnswers document, or Answer may be empty.\n"]
  deadline : timestamp option;
      [@ocaml.doc
        " The date and time of the deadline for the assignment. This value is derived from the \
         deadline specification for the HIT and the date and time the Worker accepted the HIT.\n"]
  rejection_time : timestamp option;
      [@ocaml.doc
        " If the Worker has submitted results and the Requester has rejected the results, \
         RejectionTime is the date and time the Requester rejected the results.\n"]
  approval_time : timestamp option;
      [@ocaml.doc
        " If the Worker has submitted results and the Requester has approved the results, \
         ApprovalTime is the date and time the Requester approved the results. This value is \
         omitted from the assignment if the Requester has not yet approved the results.\n"]
  submit_time : timestamp option;
      [@ocaml.doc
        " If the Worker has submitted results, SubmitTime is the date and time the assignment was \
         submitted. This value is omitted from the assignment if the Worker has not yet submitted \
         results.\n"]
  accept_time : timestamp option;
      [@ocaml.doc " The date and time the Worker accepted the assignment.\n"]
  auto_approval_time : timestamp option;
      [@ocaml.doc
        " If results have been submitted, AutoApprovalTime is the date and time the results of the \
         assignment results are considered Approved automatically if they have not already been \
         explicitly approved or rejected by the Requester. This value is derived from the \
         auto-approval delay specified by the Requester in the HIT. This value is omitted from the \
         assignment if the Worker has not yet submitted results.\n"]
  assignment_status : assignment_status option; [@ocaml.doc " The status of the assignment.\n"]
  hit_id : entity_id option; [@ocaml.doc " The ID of the HIT.\n"]
  worker_id : customer_id option; [@ocaml.doc " The ID of the Worker who accepted the HIT.\n"]
  assignment_id : entity_id option; [@ocaml.doc " A unique identifier for the assignment.\n"]
}
[@@ocaml.doc
  " The Assignment data structure represents a single assignment of a HIT to a Worker. The \
   assignment tracks the Worker's efforts to complete the HIT, and contains the results for later \
   retrieval. \n"]

type nonrec assignment_list = assignment list [@@ocaml.doc ""]

type nonrec list_assignments_for_hit_response = {
  assignments : assignment_list option;
      [@ocaml.doc " The collection of Assignment data structures returned by this call.\n"]
  num_results : integer option;
      [@ocaml.doc
        " The number of assignments on the page in the filtered results list, equivalent to the \
         number of assignments returned by this call.\n"]
  next_token : pagination_token option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec assignment_status_list = assignment_status list [@@ocaml.doc ""]

type nonrec list_assignments_for_hit_request = {
  assignment_statuses : assignment_status_list option;
      [@ocaml.doc "The status of the assignments to return: Submitted | Approved | Rejected\n"]
  max_results : result_size option; [@ocaml.doc ""]
  next_token : pagination_token option; [@ocaml.doc "Pagination token\n"]
  hit_id : entity_id; [@ocaml.doc "The ID of the HIT.\n"]
}
[@@ocaml.doc ""]

type nonrec get_qualification_type_response = {
  qualification_type : qualification_type option; [@ocaml.doc " The returned Qualification Type\n"]
}
[@@ocaml.doc ""]

type nonrec get_qualification_type_request = {
  qualification_type_id : entity_id; [@ocaml.doc "The ID of the QualificationType.\n"]
}
[@@ocaml.doc ""]

type nonrec get_qualification_score_response = {
  qualification : qualification option;
      [@ocaml.doc
        " The Qualification data structure of the Qualification assigned to a user, including the \
         Qualification type and the value (score). \n"]
}
[@@ocaml.doc ""]

type nonrec get_qualification_score_request = {
  worker_id : customer_id;
      [@ocaml.doc "The ID of the Worker whose Qualification is being updated.\n"]
  qualification_type_id : entity_id; [@ocaml.doc "The ID of the QualificationType.\n"]
}
[@@ocaml.doc ""]

type nonrec get_hit_response = {
  hi_t : hi_t option; [@ocaml.doc " Contains the requested HIT data.\n"]
}
[@@ocaml.doc ""]

type nonrec get_hit_request = {
  hit_id : entity_id; [@ocaml.doc "The ID of the HIT to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_file_upload_url_response = {
  file_upload_ur_l : string_ option;
      [@ocaml.doc " A temporary URL for the file that the Worker uploaded for the answer. \n"]
}
[@@ocaml.doc ""]

type nonrec get_file_upload_url_request = {
  question_identifier : string_;
      [@ocaml.doc
        "The identifier of the question with a FileUploadAnswer, as specified in the QuestionForm \
         of the HIT.\n"]
  assignment_id : entity_id;
      [@ocaml.doc "The ID of the assignment that contains the question with a FileUploadAnswer.\n"]
}
[@@ocaml.doc ""]

type nonrec get_assignment_response = {
  hi_t : hi_t option;
      [@ocaml.doc
        " The HIT associated with this assignment. The response includes one HIT element.\n"]
  assignment : assignment option;
      [@ocaml.doc " The assignment. The response includes one Assignment element. \n"]
}
[@@ocaml.doc ""]

type nonrec get_assignment_request = {
  assignment_id : entity_id; [@ocaml.doc "The ID of the Assignment to be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_balance_response = {
  on_hold_balance : currency_amount option; [@ocaml.doc ""]
  available_balance : currency_amount option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_account_balance_request = unit [@@ocaml.doc ""]

type nonrec disassociate_qualification_from_worker_response = unit [@@ocaml.doc ""]

type nonrec disassociate_qualification_from_worker_request = {
  reason : string_ option;
      [@ocaml.doc
        "A text message that explains why the Qualification was revoked. The user who had the \
         Qualification sees this message.\n"]
  qualification_type_id : entity_id;
      [@ocaml.doc "The ID of the Qualification type of the Qualification to be revoked.\n"]
  worker_id : customer_id;
      [@ocaml.doc "The ID of the Worker who possesses the Qualification to be revoked.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_worker_block_response = unit [@@ocaml.doc ""]

type nonrec delete_worker_block_request = {
  reason : string_ option;
      [@ocaml.doc
        "A message that explains the reason for unblocking the Worker. The Worker does not see \
         this message.\n"]
  worker_id : customer_id; [@ocaml.doc "The ID of the Worker to unblock.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_qualification_type_response = unit [@@ocaml.doc ""]

type nonrec delete_qualification_type_request = {
  qualification_type_id : entity_id; [@ocaml.doc "The ID of the QualificationType to dispose.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_hit_response = unit [@@ocaml.doc ""]

type nonrec delete_hit_request = {
  hit_id : entity_id; [@ocaml.doc "The ID of the HIT to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec create_worker_block_response = unit [@@ocaml.doc ""]

type nonrec create_worker_block_request = {
  reason : string_;
      [@ocaml.doc
        "A message explaining the reason for blocking the Worker. This parameter enables you to \
         keep track of your Workers. The Worker does not see this message.\n"]
  worker_id : customer_id; [@ocaml.doc "The ID of the Worker to block.\n"]
}
[@@ocaml.doc ""]

type nonrec create_qualification_type_response = {
  qualification_type : qualification_type option;
      [@ocaml.doc
        "The created Qualification type, returned as a QualificationType data structure.\n"]
}
[@@ocaml.doc ""]

type nonrec create_qualification_type_request = {
  auto_granted_value : integer option;
      [@ocaml.doc
        "The Qualification value to use for automatically granted Qualifications. This parameter \
         is used only if the AutoGranted parameter is true.\n"]
  auto_granted : boolean_ option;
      [@ocaml.doc
        "Specifies whether requests for the Qualification type are granted immediately, without \
         prompting the Worker with a Qualification test.\n\n\
        \ Constraints: If the Test parameter is specified, this parameter cannot be true.\n\
        \ "]
  test_duration_in_seconds : long option;
      [@ocaml.doc
        "The number of seconds the Worker has to complete the Qualification test, starting from \
         the time the Worker requests the Qualification.\n"]
  answer_key : string_ option;
      [@ocaml.doc
        "The answers to the Qualification test specified in the Test parameter, in the form of an \
         AnswerKey data structure.\n\n\
        \ Constraints: Must not be longer than 65535 bytes.\n\
        \ \n\
        \  Constraints: None. If not specified, you must process Qualification requests manually.\n\
        \  "]
  test : string_ option;
      [@ocaml.doc
        " The questions for the Qualification test a Worker must answer correctly to obtain a \
         Qualification of this type. If this parameter is specified, [TestDurationInSeconds] must \
         also be specified. \n\n\
        \ Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm data structure. \
         This parameter cannot be specified if AutoGranted is true.\n\
        \ \n\
        \  Constraints: None. If not specified, the Worker may request the Qualification without \
         answering any questions.\n\
        \  "]
  retry_delay_in_seconds : long option;
      [@ocaml.doc
        "The number of seconds that a Worker must wait after requesting a Qualification of the \
         Qualification type before the worker can retry the Qualification request.\n\n\
        \ Constraints: None. If not specified, retries are disabled and Workers can request a \
         Qualification of this type only once, even if the Worker has not been granted the \
         Qualification. It is not possible to disable retries for a Qualification type after it \
         has been created with retries enabled. If you want to disable retries, you must delete \
         existing retry-enabled Qualification type and then create a new Qualification type with \
         retries disabled.\n\
        \ "]
  qualification_type_status : qualification_type_status;
      [@ocaml.doc
        "The initial status of the Qualification type.\n\n\
        \ Constraints: Valid values are: Active | Inactive\n\
        \ "]
  description : string_;
      [@ocaml.doc
        "A long description for the Qualification type. On the Amazon Mechanical Turk website, the \
         long description is displayed when a Worker examines a Qualification type.\n"]
  keywords : string_ option;
      [@ocaml.doc
        "One or more words or phrases that describe the Qualification type, separated by commas. \
         The keywords of a type make the type easier to find during a search.\n"]
  name : string_;
      [@ocaml.doc
        " The name you give to the Qualification type. The type name is used to represent the \
         Qualification to Workers, and to find the type using a Qualification type search. It must \
         be unique across all of your Qualification types.\n"]
}
[@@ocaml.doc ""]

type nonrec create_hit_with_hit_type_response = {
  hi_t : hi_t option;
      [@ocaml.doc
        " Contains the newly created HIT data. For a description of the HIT data structure as it \
         appears in responses, see the HIT Data Structure documentation. \n"]
}
[@@ocaml.doc ""]

type nonrec hit_layout_parameter = {
  value : string_;
      [@ocaml.doc "The value substituted for the parameter referenced in the HITLayout. \n"]
  name : string_; [@ocaml.doc " The name of the parameter in the HITLayout. \n"]
}
[@@ocaml.doc
  " The HITLayoutParameter data structure defines parameter values used with a HITLayout. A \
   HITLayout is a reusable Amazon Mechanical Turk project template used to provide Human \
   Intelligence Task (HIT) question data for CreateHIT. \n"]

type nonrec hit_layout_parameter_list = hit_layout_parameter list [@@ocaml.doc ""]

type nonrec create_hit_with_hit_type_request = {
  hit_layout_parameters : hit_layout_parameter_list option;
      [@ocaml.doc
        " If the HITLayoutId is provided, any placeholder values must be filled in with values \
         using the HITLayoutParameter structure. For more information, see HITLayout. \n"]
  hit_layout_id : entity_id option;
      [@ocaml.doc
        " The HITLayoutId allows you to use a pre-existing HIT design with placeholder values and \
         create an additional HIT by providing those values as HITLayoutParameters. \n\n\
        \  Constraints: Either a Question parameter or a HITLayoutId parameter must be provided. \n\
        \ "]
  hit_review_policy : review_policy option;
      [@ocaml.doc
        " The HIT-level Review Policy applies to the HIT. You can specify for Mechanical Turk to \
         take various actions based on the policy. \n"]
  assignment_review_policy : review_policy option;
      [@ocaml.doc
        " The Assignment-level Review Policy applies to the assignments under the HIT. You can \
         specify for Mechanical Turk to take various actions based on the policy. \n"]
  unique_request_token : idempotency_token option;
      [@ocaml.doc
        " A unique identifier for this request which allows you to retry the call on error without \
         creating duplicate HITs. This is useful in cases such as network timeouts where it is \
         unclear whether or not the call succeeded on the server. If the HIT already exists in the \
         system from a previous call using the same UniqueRequestToken, subsequent calls will \
         return a AWS.MechanicalTurk.HitAlreadyExists error with a message containing the HITId. \n\n\
        \   Note: It is your responsibility to ensure uniqueness of the token. The unique token \
         expires after 24 hours. Subsequent calls using the same UniqueRequestToken made after the \
         24 hour limit could create duplicate HITs. \n\
        \  \n\
        \   "]
  requester_annotation : string_ option;
      [@ocaml.doc
        " An arbitrary data field. The RequesterAnnotation parameter lets your application attach \
         arbitrary data to the HIT for tracking purposes. For example, this parameter could be an \
         identifier internal to the Requester's application that corresponds with the HIT. \n\n\
        \  The RequesterAnnotation parameter for a HIT is only visible to the Requester who \
         created the HIT. It is not shown to the Worker, or any other Requester. \n\
        \ \n\
        \   The RequesterAnnotation parameter may be different for each HIT you submit. It does \
         not affect how your HITs are grouped. \n\
        \  "]
  question : string_ option;
      [@ocaml.doc
        " The data the person completing the HIT uses to produce the results. \n\n\
        \  Constraints: Must be a QuestionForm data structure, an ExternalQuestion data structure, \
         or an HTMLQuestion data structure. The XML question data must not be larger than 64 \
         kilobytes (65,535 bytes) in size, including whitespace. \n\
        \ \n\
        \  Either a Question parameter or a HITLayoutId parameter must be provided.\n\
        \  "]
  lifetime_in_seconds : long;
      [@ocaml.doc
        " An amount of time, in seconds, after which the HIT is no longer available for users to \
         accept. After the lifetime of the HIT elapses, the HIT no longer appears in HIT searches, \
         even if not all of the assignments for the HIT have been accepted. \n"]
  max_assignments : integer option;
      [@ocaml.doc
        " The number of times the HIT can be accepted and completed before the HIT becomes \
         unavailable. \n"]
  hit_type_id : entity_id; [@ocaml.doc "The HIT type ID you want to create this HIT with.\n"]
}
[@@ocaml.doc ""]

type nonrec create_hit_type_response = {
  hit_type_id : entity_id option; [@ocaml.doc " The ID of the newly registered HIT type.\n"]
}
[@@ocaml.doc ""]

type nonrec create_hit_type_request = {
  qualification_requirements : qualification_requirement_list option;
      [@ocaml.doc
        " Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT \
         can have between zero and ten Qualification requirements. All requirements must be met in \
         order for a Worker to accept the HIT. Additionally, other actions can be restricted using \
         the [ActionsGuarded] field on each [QualificationRequirement] structure. \n"]
  description : string_;
      [@ocaml.doc
        " A general description of the HIT. A description includes detailed information about the \
         kind of task the HIT contains. On the Amazon Mechanical Turk web site, the HIT \
         description appears in the expanded view of search results, and in the HIT and assignment \
         screens. A good description gives the user enough information to evaluate the HIT before \
         accepting it. \n"]
  keywords : string_ option;
      [@ocaml.doc
        " One or more words or phrases that describe the HIT, separated by commas. These words are \
         used in searches to find HITs. \n"]
  title : string_;
      [@ocaml.doc
        " The title of the HIT. A title should be short and descriptive about the kind of task the \
         HIT contains. On the Amazon Mechanical Turk web site, the HIT title appears in search \
         results, and everywhere the HIT is mentioned. \n"]
  reward : currency_amount;
      [@ocaml.doc
        " The amount of money the Requester will pay a Worker for successfully completing the HIT. \n"]
  assignment_duration_in_seconds : long;
      [@ocaml.doc
        " The amount of time, in seconds, that a Worker has to complete the HIT after accepting \
         it. If a Worker does not complete the assignment within the specified duration, the \
         assignment is considered abandoned. If the HIT is still active (that is, its lifetime has \
         not elapsed), the assignment becomes available for other users to find and accept. \n"]
  auto_approval_delay_in_seconds : long option;
      [@ocaml.doc
        " The number of seconds after an assignment for the HIT has been submitted, after which \
         the assignment is considered Approved automatically unless the Requester explicitly \
         rejects it. \n"]
}
[@@ocaml.doc ""]

type nonrec create_hit_response = {
  hi_t : hi_t option;
      [@ocaml.doc
        " Contains the newly created HIT data. For a description of the HIT data structure as it \
         appears in responses, see the HIT Data Structure documentation. \n"]
}
[@@ocaml.doc ""]

type nonrec create_hit_request = {
  hit_layout_parameters : hit_layout_parameter_list option;
      [@ocaml.doc
        " If the HITLayoutId is provided, any placeholder values must be filled in with values \
         using the HITLayoutParameter structure. For more information, see HITLayout. \n"]
  hit_layout_id : entity_id option;
      [@ocaml.doc
        " The HITLayoutId allows you to use a pre-existing HIT design with placeholder values and \
         create an additional HIT by providing those values as HITLayoutParameters. \n\n\
        \  Constraints: Either a Question parameter or a HITLayoutId parameter must be provided. \n\
        \ "]
  hit_review_policy : review_policy option;
      [@ocaml.doc
        " The HIT-level Review Policy applies to the HIT. You can specify for Mechanical Turk to \
         take various actions based on the policy. \n"]
  assignment_review_policy : review_policy option;
      [@ocaml.doc
        " The Assignment-level Review Policy applies to the assignments under the HIT. You can \
         specify for Mechanical Turk to take various actions based on the policy. \n"]
  unique_request_token : idempotency_token option;
      [@ocaml.doc
        " A unique identifier for this request which allows you to retry the call on error without \
         creating duplicate HITs. This is useful in cases such as network timeouts where it is \
         unclear whether or not the call succeeded on the server. If the HIT already exists in the \
         system from a previous call using the same UniqueRequestToken, subsequent calls will \
         return a AWS.MechanicalTurk.HitAlreadyExists error with a message containing the HITId. \n\n\
        \   Note: It is your responsibility to ensure uniqueness of the token. The unique token \
         expires after 24 hours. Subsequent calls using the same UniqueRequestToken made after the \
         24 hour limit could create duplicate HITs. \n\
        \  \n\
        \   "]
  qualification_requirements : qualification_requirement_list option;
      [@ocaml.doc
        " Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT \
         can have between zero and ten Qualification requirements. All requirements must be met in \
         order for a Worker to accept the HIT. Additionally, other actions can be restricted using \
         the [ActionsGuarded] field on each [QualificationRequirement] structure. \n"]
  requester_annotation : string_ option;
      [@ocaml.doc
        " An arbitrary data field. The RequesterAnnotation parameter lets your application attach \
         arbitrary data to the HIT for tracking purposes. For example, this parameter could be an \
         identifier internal to the Requester's application that corresponds with the HIT. \n\n\
        \  The RequesterAnnotation parameter for a HIT is only visible to the Requester who \
         created the HIT. It is not shown to the Worker, or any other Requester. \n\
        \ \n\
        \   The RequesterAnnotation parameter may be different for each HIT you submit. It does \
         not affect how your HITs are grouped. \n\
        \  "]
  question : string_ option;
      [@ocaml.doc
        " The data the person completing the HIT uses to produce the results. \n\n\
        \  Constraints: Must be a QuestionForm data structure, an ExternalQuestion data structure, \
         or an HTMLQuestion data structure. The XML question data must not be larger than 64 \
         kilobytes (65,535 bytes) in size, including whitespace. \n\
        \ \n\
        \  Either a Question parameter or a HITLayoutId parameter must be provided.\n\
        \  "]
  description : string_;
      [@ocaml.doc
        " A general description of the HIT. A description includes detailed information about the \
         kind of task the HIT contains. On the Amazon Mechanical Turk web site, the HIT \
         description appears in the expanded view of search results, and in the HIT and assignment \
         screens. A good description gives the user enough information to evaluate the HIT before \
         accepting it. \n"]
  keywords : string_ option;
      [@ocaml.doc
        " One or more words or phrases that describe the HIT, separated by commas. These words are \
         used in searches to find HITs. \n"]
  title : string_;
      [@ocaml.doc
        " The title of the HIT. A title should be short and descriptive about the kind of task the \
         HIT contains. On the Amazon Mechanical Turk web site, the HIT title appears in search \
         results, and everywhere the HIT is mentioned. \n"]
  reward : currency_amount;
      [@ocaml.doc
        " The amount of money the Requester will pay a Worker for successfully completing the HIT. \n"]
  assignment_duration_in_seconds : long;
      [@ocaml.doc
        " The amount of time, in seconds, that a Worker has to complete the HIT after accepting \
         it. If a Worker does not complete the assignment within the specified duration, the \
         assignment is considered abandoned. If the HIT is still active (that is, its lifetime has \
         not elapsed), the assignment becomes available for other users to find and accept. \n"]
  lifetime_in_seconds : long;
      [@ocaml.doc
        " An amount of time, in seconds, after which the HIT is no longer available for users to \
         accept. After the lifetime of the HIT elapses, the HIT no longer appears in HIT searches, \
         even if not all of the assignments for the HIT have been accepted. \n"]
  auto_approval_delay_in_seconds : long option;
      [@ocaml.doc
        " The number of seconds after an assignment for the HIT has been submitted, after which \
         the assignment is considered Approved automatically unless the Requester explicitly \
         rejects it. \n"]
  max_assignments : integer option;
      [@ocaml.doc
        " The number of times the HIT can be accepted and completed before the HIT becomes \
         unavailable. \n"]
}
[@@ocaml.doc ""]

type nonrec create_additional_assignments_for_hit_response = unit [@@ocaml.doc ""]

type nonrec create_additional_assignments_for_hit_request = {
  unique_request_token : idempotency_token option;
      [@ocaml.doc
        " A unique identifier for this request, which allows you to retry the call on error \
         without extending the HIT multiple times. This is useful in cases such as network \
         timeouts where it is unclear whether or not the call succeeded on the server. If the \
         extend HIT already exists in the system from a previous call using the same \
         [UniqueRequestToken], subsequent calls will return an error with a message containing the \
         request ID. \n"]
  number_of_additional_assignments : integer;
      [@ocaml.doc "The number of additional assignments to request for this HIT.\n"]
  hit_id : entity_id; [@ocaml.doc "The ID of the HIT to extend.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_qualification_with_worker_response = unit [@@ocaml.doc ""]

type nonrec associate_qualification_with_worker_request = {
  send_notification : boolean_ option;
      [@ocaml.doc
        " Specifies whether to send a notification email message to the Worker saying that the \
         qualification was assigned to the Worker. Note: this is true by default. \n"]
  integer_value : integer option; [@ocaml.doc "The value of the Qualification to assign.\n"]
  worker_id : customer_id;
      [@ocaml.doc
        " The ID of the Worker to whom the Qualification is being assigned. Worker IDs are \
         included with submitted HIT assignments and Qualification requests. \n"]
  qualification_type_id : entity_id;
      [@ocaml.doc "The ID of the Qualification type to use for the assigned Qualification.\n"]
}
[@@ocaml.doc ""]

type nonrec approve_assignment_response = unit [@@ocaml.doc ""]

type nonrec approve_assignment_request = {
  override_rejection : boolean_ option;
      [@ocaml.doc
        " A flag indicating that an assignment should be approved even if it was previously \
         rejected. Defaults to [False]. \n"]
  requester_feedback : string_ option;
      [@ocaml.doc
        " A message for the Worker, which the Worker can see in the Status section of the web site. \n"]
  assignment_id : entity_id;
      [@ocaml.doc
        " The ID of the assignment. The assignment must correspond to a HIT created by the \
         Requester. \n"]
}
[@@ocaml.doc ""]

type nonrec accept_qualification_request_response = unit [@@ocaml.doc ""]

type nonrec accept_qualification_request_request = {
  integer_value : integer option;
      [@ocaml.doc
        " The value of the Qualification. You can omit this value if you are using the presence or \
         absence of the Qualification as the basis for a HIT requirement. \n"]
  qualification_request_id : string_;
      [@ocaml.doc
        "The ID of the Qualification request, as returned by the [GetQualificationRequests] \
         operation.\n"]
}
[@@ocaml.doc ""]
