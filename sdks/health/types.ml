type nonrec string_ = string [@@ocaml.doc ""]

type nonrec concurrent_modification_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html}EnableHealthServiceAccessForOrganization} \
   is already in progress. Wait for the action to complete before trying again. To get the current \
   status, use the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeHealthServiceStatusForOrganization.html}DescribeHealthServiceStatusForOrganization} \
   operation.\n"]

type nonrec health_service_access_status_for_organization = string [@@ocaml.doc ""]

type nonrec describe_health_service_status_for_organization_response = {
  health_service_access_status_for_organization :
    health_service_access_status_for_organization option;
      [@ocaml.doc
        "Information about the status of enabling or disabling the Health organizational view \
         feature in your organization.\n\n\
        \ Valid values are [ENABLED | DISABLED | PENDING]. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec unsupported_locale = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The specified locale is not supported.\n"]

type nonrec invalid_pagination_token = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The specified pagination token ([nextToken]) is not valid.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec event_type_persona =
  | OPERATIONS [@ocaml.doc ""]
  | SECURITY [@ocaml.doc ""]
  | BILLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type_persona_list = event_type_persona list [@@ocaml.doc ""]

type nonrec event_type_actionability =
  | ACTION_REQUIRED [@ocaml.doc ""]
  | ACTION_MAY_BE_REQUIRED [@ocaml.doc ""]
  | INFORMATIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type_category =
  | ISSUE [@ocaml.doc ""]
  | ACCOUNT_NOTIFICATION [@ocaml.doc ""]
  | SCHEDULED_CHANGE [@ocaml.doc ""]
  | INVESTIGATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type_code = string [@@ocaml.doc ""]

type nonrec service = string [@@ocaml.doc ""]

type nonrec event_type = {
  service : service option;
      [@ocaml.doc
        "The Amazon Web Services service that is affected by the event. For example, [EC2], [RDS].\n"]
  code : event_type_code option;
      [@ocaml.doc
        "The unique identifier for the event type. The format is \n\
         {[\n\
         AWS_{i SERVICE}_{i DESCRIPTION} \n\
         ]}\n\
         ; for example, [AWS_EC2_SYSTEM_MAINTENANCE_EVENT].\n"]
  category : event_type_category option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  actionability : event_type_actionability option;
      [@ocaml.doc
        "The actionability classification of the event. Possible values are [ACTION_REQUIRED], \
         [ACTION_MAY_BE_REQUIRED] and [INFORMATIONAL]. Events with [ACTION_REQUIRED] actionability \
         require customer action to resolve or mitigate the event. Events with \
         [ACTION_MAY_BE_REQUIRED] actionability indicates that the current status is unknown or \
         conditional and inspection is needed to determine if action is required. Events with \
         [INFORMATIONAL] actionability are provided for awareness and do not require immediate \
         action.\n"]
  personas : event_type_persona_list option;
      [@ocaml.doc
        "A list of persona classifications that indicate the target audience for the event. \
         Possible values are [OPERATIONS], [SECURITY], and [BILLING]. Events can be associated \
         with multiple personas to indicate relevance to different teams or roles within an \
         organization.\n"]
}
[@@ocaml.doc
  "Contains the metadata about a type of event that is reported by Health. The [EventType] shows \
   the category, service, and the event type code of the event. For example, an [issue] might be \
   the category, [EC2] the service, and [AWS_EC2_SYSTEM_MAINTENANCE_EVENT] the event type code.\n\n\
  \ You can use the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventTypes.html}DescribeEventTypes} \
   API operation to return this information about an event.\n\
  \ \n\
  \  You can also use the Amazon CloudWatch Events console to create a rule so that you can get \
   notified or take action when Health delivers a specific event to your Amazon Web Services \
   account. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/cloudwatch-events-health.html}Monitor for \
   Health events with Amazon CloudWatch Events} in the {i Health User Guide}.\n\
  \  "]

type nonrec event_type_list = event_type list [@@ocaml.doc ""]

type nonrec describe_event_types_response = {
  event_types : event_type_list option;
      [@ocaml.doc
        "A list of event types that match the filter criteria. Event types have a category \
         ([issue], [accountNotification], or [scheduledChange]), a service (for example, [EC2], \
         [RDS], [DATAPIPELINE], [BILLING]), and a code (in the format \n\
         {[\n\
         AWS_{i SERVICE}_{i DESCRIPTION} \n\
         ]}\n\
         ; for example, [AWS_EC2_SYSTEM_MAINTENANCE_EVENT]).\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec locale = string [@@ocaml.doc ""]

type nonrec event_type_actionability_list = event_type_actionability list [@@ocaml.doc ""]

type nonrec event_type_category_list = event_type_category list [@@ocaml.doc ""]

type nonrec service_list = service list [@@ocaml.doc ""]

type nonrec event_type_code_list = event_type_code list [@@ocaml.doc ""]

type nonrec event_type_filter = {
  event_type_codes : event_type_code_list option; [@ocaml.doc "A list of event type codes.\n"]
  services : service_list option;
      [@ocaml.doc
        "The Amazon Web Services services associated with the event. For example, [EC2], [RDS].\n"]
  event_type_categories : event_type_category_list option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  actionabilities : event_type_actionability_list option;
      [@ocaml.doc
        "A list of actionability values to filter event types. Possible values are \
         [ACTION_REQUIRED], [ACTION_MAY_BE_REQUIRED] and [INFORMATIONAL].\n"]
  personas : event_type_persona_list option;
      [@ocaml.doc
        "A list of persona classifications to filter event types. Possible values are \
         [OPERATIONS], [SECURITY], and [BILLING].\n"]
}
[@@ocaml.doc
  "The values to use to filter results from the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventTypes.html}DescribeEventTypes} \
   operation.\n"]

type nonrec describe_event_types_request = {
  filter : event_type_filter option; [@ocaml.doc "Values to narrow the results returned.\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 10 and 100, inclusive.\n\n\
        \  If you don't specify the [maxResults] parameter, this operation returns a maximum of 30 \
         items by default.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec event_persona =
  | OPERATIONS [@ocaml.doc ""]
  | SECURITY [@ocaml.doc ""]
  | BILLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_persona_list = event_persona list [@@ocaml.doc ""]

type nonrec event_actionability =
  | ACTION_REQUIRED [@ocaml.doc ""]
  | ACTION_MAY_BE_REQUIRED [@ocaml.doc ""]
  | INFORMATIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_status_code =
  | OPEN [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
  | UPCOMING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec event_scope_code =
  | PUBLIC [@ocaml.doc ""]
  | ACCOUNT_SPECIFIC [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_arn = string [@@ocaml.doc ""]

type nonrec organization_event = {
  arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  service : service option;
      [@ocaml.doc
        "The Amazon Web Services service that is affected by the event, such as EC2 and RDS.\n"]
  event_type_code : event_type_code option;
      [@ocaml.doc
        "The unique identifier for the event type. The format is [AWS_SERVICE_DESCRIPTION]. For \
         example, [AWS_EC2_SYSTEM_MAINTENANCE_EVENT].\n"]
  event_type_category : event_type_category option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  event_scope_code : event_scope_code option;
      [@ocaml.doc
        "This parameter specifies if the Health event is a public Amazon Web Services service \
         event or an account-specific event.\n\n\
        \ {ul\n\
        \       {-  If the [eventScopeCode] value is [PUBLIC], then the [affectedAccounts] value \
         is always empty.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [ACCOUNT_SPECIFIC], then the \
         [affectedAccounts] value lists the affected Amazon Web Services accounts in your \
         organization. For example, if an event affects a service such as Amazon Elastic Compute \
         Cloud and you have Amazon Web Services accounts that use that service, those account IDs \
         appear in the response.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [NONE], then the [eventArn] that you \
         specified in the request is invalid or doesn't exist.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  region : region option; [@ocaml.doc "The Amazon Web Services Region name of the event.\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time that the event began.\n"]
  end_time : timestamp option; [@ocaml.doc "The date and time that the event ended.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The most recent date and time that the event was updated.\n"]
  status_code : event_status_code option;
      [@ocaml.doc
        "The most recent status of the event. Possible values are [open], [closed], and [upcoming].\n"]
  actionability : event_actionability option;
      [@ocaml.doc
        "The actionability classification of the event. Possible values are [ACTION_REQUIRED], \
         [ACTION_MAY_BE_REQUIRED] and [INFORMATIONAL]. Events with [ACTION_REQUIRED] actionability \
         require customer action to resolve or mitigate the event. Events with \
         [ACTION_MAY_BE_REQUIRED] actionability indicates that the current status is unknown or \
         conditional and inspection is needed to determine if action is required. Events with \
         [INFORMATIONAL] actionability are provided for awareness and do not require immediate \
         action.\n"]
  personas : event_persona_list option;
      [@ocaml.doc
        "A list of persona classifications that indicate the target audience for the event. \
         Possible values are [OPERATIONS], [SECURITY], and [BILLING]. Events can be associated \
         with multiple personas to indicate relevance to different teams or roles within an \
         organization.\n"]
}
[@@ocaml.doc
  "Summary information about an event, returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventsForOrganization.html}DescribeEventsForOrganization} \
   operation.\n"]

type nonrec organization_event_list = organization_event list [@@ocaml.doc ""]

type nonrec describe_events_for_organization_response = {
  events : organization_event_list option;
      [@ocaml.doc "The events that match the specified filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_lower_range = int [@@ocaml.doc ""]

type nonrec event_status_code_list = event_status_code list [@@ocaml.doc ""]

type nonrec event_type_category_list2 = event_type_category list [@@ocaml.doc ""]

type nonrec entity_value = string [@@ocaml.doc ""]

type nonrec entity_value_list = entity_value list [@@ocaml.doc ""]

type nonrec entity_arn = string [@@ocaml.doc ""]

type nonrec entity_arn_list = entity_arn list [@@ocaml.doc ""]

type nonrec date_time_range = {
  from_ : timestamp option; [@ocaml.doc "The starting date and time of a time range.\n"]
  to_ : timestamp option; [@ocaml.doc "The ending date and time of a time range.\n"]
}
[@@ocaml.doc
  "A range of dates and times that is used by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EventFilter.html}EventFilter} and \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EntityFilter.html}EntityFilter} \
   objects. If [from] is set and [to] is set: match items where the timestamp ([startTime], \
   [endTime], or [lastUpdatedTime]) is between [from] and [to] inclusive. If [from] is set and \
   [to] is not set: match items where the timestamp value is equal to or after [from]. If [from] \
   is not set and [to] is set: match items where the timestamp value is equal to or before [to].\n"]

type nonrec region_list = region list [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec aws_account_ids_list = account_id list [@@ocaml.doc ""]

type nonrec event_type2 = string [@@ocaml.doc ""]

type nonrec event_type_list2 = event_type2 list [@@ocaml.doc ""]

type nonrec event_actionability_list = event_actionability list [@@ocaml.doc ""]

type nonrec organization_event_filter = {
  actionabilities : event_actionability_list option;
      [@ocaml.doc
        "A list of actionability values to filter events. Use this to filter events based on \
         whether they require action ([ACTION_REQUIRED]), may require action \
         ([ACTION_MAY_BE_REQUIRED]) or are informational ([INFORMATIONAL]).\n"]
  event_type_codes : event_type_list2 option;
      [@ocaml.doc
        "A list of unique identifiers for event types. For example, \
         [\"AWS_EC2_SYSTEM_MAINTENANCE_EVENT\",\"AWS_RDS_MAINTENANCE_SCHEDULED\".] \n"]
  aws_account_ids : aws_account_ids_list option;
      [@ocaml.doc
        "A list of 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
  services : service_list option;
      [@ocaml.doc
        "The Amazon Web Services services associated with the event. For example, [EC2], [RDS].\n"]
  regions : region_list option; [@ocaml.doc "A list of Amazon Web Services Regions.\n"]
  start_time : date_time_range option; [@ocaml.doc ""]
  end_time : date_time_range option; [@ocaml.doc ""]
  last_updated_time : date_time_range option; [@ocaml.doc ""]
  entity_arns : entity_arn_list option; [@ocaml.doc "A list of entity ARNs (unique identifiers).\n"]
  entity_values : entity_value_list option;
      [@ocaml.doc
        "A list of entity identifiers, such as EC2 instance IDs (i-34ab692e) or EBS volumes \
         (vol-426ab23e).\n"]
  event_type_categories : event_type_category_list2 option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  event_status_codes : event_status_code_list option; [@ocaml.doc "A list of event status codes.\n"]
  personas : event_persona_list option;
      [@ocaml.doc
        "A list of persona values to filter events. Use this to filter events based on their \
         target audience: [OPERATIONS], [SECURITY], or [BILLING].\n"]
}
[@@ocaml.doc
  "The values to filter results from the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventsForOrganization.html}DescribeEventsForOrganization} \
   operation.\n"]

type nonrec describe_events_for_organization_request = {
  filter : organization_event_filter option; [@ocaml.doc "Values to narrow the results returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results_lower_range option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 1 and 100, inclusive.\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
}
[@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec event = {
  arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  service : service option;
      [@ocaml.doc
        "The Amazon Web Services service that is affected by the event. For example, [EC2], [RDS].\n"]
  event_type_code : event_type_code option;
      [@ocaml.doc
        "The unique identifier for the event type. The format is \n\
         {[\n\
         AWS_{i SERVICE}_{i DESCRIPTION} \n\
         ]}\n\
         ; for example, [AWS_EC2_SYSTEM_MAINTENANCE_EVENT].\n"]
  event_type_category : event_type_category option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  region : region option; [@ocaml.doc "The Amazon Web Services Region name of the event.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone of the event. For example, us-east-1a.\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time that the event began.\n"]
  end_time : timestamp option; [@ocaml.doc "The date and time that the event ended.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The most recent date and time that the event was updated.\n"]
  status_code : event_status_code option;
      [@ocaml.doc
        "The most recent status of the event. Possible values are [open], [closed], and [upcoming].\n"]
  event_scope_code : event_scope_code option;
      [@ocaml.doc
        "This parameter specifies if the Health event is a public Amazon Web Services service \
         event or an account-specific event.\n\n\
        \ {ul\n\
        \       {-  If the [eventScopeCode] value is [PUBLIC], then the [affectedAccounts] value \
         is always empty.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [ACCOUNT_SPECIFIC], then the \
         [affectedAccounts] value lists the affected Amazon Web Services accounts in your \
         organization. For example, if an event affects a service such as Amazon Elastic Compute \
         Cloud and you have Amazon Web Services accounts that use that service, those account IDs \
         appear in the response.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [NONE], then the [eventArn] that you \
         specified in the request is invalid or doesn't exist.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  actionability : event_actionability option;
      [@ocaml.doc
        "The actionability classification of the event. Possible values are [ACTION_REQUIRED], \
         [ACTION_MAY_BE_REQUIRED] and [INFORMATIONAL]. Events with [ACTION_REQUIRED] actionability \
         require customer action to resolve or mitigate the event. Events with \
         [ACTION_MAY_BE_REQUIRED] actionability indicates that the current status is unknown or \
         conditional and inspection is needed to determine if action is required. Events with \
         [INFORMATIONAL] actionability are provided for awareness and do not require immediate \
         action.\n"]
  personas : event_persona_list option;
      [@ocaml.doc
        "A list of persona classifications that indicate the target audience for the event. \
         Possible values are [OPERATIONS], [SECURITY], and [BILLING]. Events can be associated \
         with multiple personas to indicate relevance to different teams or roles within an \
         organization.\n"]
}
[@@ocaml.doc
  "Summary information about an Health event.\n\n\
  \ Health events can be public or account-specific:\n\
  \ \n\
  \  {ul\n\
  \        {-   {i Public events} might be service events that are not specific to an Amazon Web \
   Services account. For example, if there is an issue with an Amazon Web Services Region, Health \
   provides information about the event, even if you don't use services or resources in that \
   Region.\n\
  \            \n\
  \             }\n\
  \        {-   {i Account-specific} events are specific to either your Amazon Web Services \
   account or an account in your organization. For example, if there's an issue with Amazon \
   Elastic Compute Cloud in a Region that you use, Health provides information about the event and \
   the affected resources in the account.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can determine if an event is public or account-specific by using the [eventScopeCode] \
   parameter. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html#AWSHealth-Type-Event-eventScopeCode}eventScopeCode}.\n\
  \   "]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec describe_events_response = {
  events : event_list option; [@ocaml.doc "The events that match the specified filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_set = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_filter = tag_set list [@@ocaml.doc ""]

type nonrec date_time_range_list = date_time_range list [@@ocaml.doc ""]

type nonrec availability_zones = availability_zone list [@@ocaml.doc ""]

type nonrec event_arn_list = event_arn list [@@ocaml.doc ""]

type nonrec event_filter = {
  actionabilities : event_actionability_list option;
      [@ocaml.doc
        "A list of actionability values to filter events. Use this to filter events based on \
         whether they require action ([ACTION_REQUIRED]), may require action \
         ([ACTION_MAY_BE_REQUIRED]) or are informational ([INFORMATIONAL]).\n"]
  event_arns : event_arn_list option;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
  event_type_codes : event_type_list2 option;
      [@ocaml.doc
        "A list of unique identifiers for event types. For example, \
         [\"AWS_EC2_SYSTEM_MAINTENANCE_EVENT\",\"AWS_RDS_MAINTENANCE_SCHEDULED\".] \n"]
  services : service_list option;
      [@ocaml.doc
        "The Amazon Web Services services associated with the event. For example, [EC2], [RDS].\n"]
  regions : region_list option; [@ocaml.doc "A list of Amazon Web Services Regions.\n"]
  availability_zones : availability_zones option;
      [@ocaml.doc "A list of Amazon Web Services Availability Zones.\n"]
  start_times : date_time_range_list option;
      [@ocaml.doc "A list of dates and times that the event began.\n"]
  end_times : date_time_range_list option;
      [@ocaml.doc "A list of dates and times that the event ended.\n"]
  last_updated_times : date_time_range_list option;
      [@ocaml.doc "A list of dates and times that the event was last updated.\n"]
  entity_arns : entity_arn_list option; [@ocaml.doc "A list of entity ARNs (unique identifiers).\n"]
  entity_values : entity_value_list option;
      [@ocaml.doc
        "A list of entity identifiers, such as EC2 instance IDs ([i-34ab692e]) or EBS volumes \
         ([vol-426ab23e]).\n"]
  event_type_categories : event_type_category_list2 option;
      [@ocaml.doc
        "A list of event type category codes. Possible values are [issue], [accountNotification], \
         or [scheduledChange]. Currently, the [investigation] value isn't supported at this time.\n"]
  tags : tag_filter option;
      [@ocaml.doc
        "A map of entity tags attached to the affected entity.\n\n\
        \  Currently, the [tags] property isn't supported.\n\
        \  \n\
        \   "]
  event_status_codes : event_status_code_list option; [@ocaml.doc "A list of event status codes.\n"]
  personas : event_persona_list option;
      [@ocaml.doc
        "A list of persona values to filter events. Use this to filter events based on their \
         target audience: [OPERATIONS], [SECURITY], or [BILLING].\n"]
}
[@@ocaml.doc
  "The values to use to filter results from the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEvents.html}DescribeEvents} \
   and \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventAggregates.html}DescribeEventAggregates} \
   operations.\n"]

type nonrec describe_events_request = {
  filter : event_filter option; [@ocaml.doc "Values to narrow the results returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results_lower_range option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 1 and 100, inclusive.\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
}
[@@ocaml.doc ""]

type nonrec organization_event_details_error_item = {
  aws_account_id : account_id option;
      [@ocaml.doc
        "Error information returned when a \
         {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html}DescribeEventDetailsForOrganization} \
         operation can't find a specified event.\n"]
  event_arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  error_name : string_ option; [@ocaml.doc "The name of the error.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "A message that describes the error.\n\n\
        \ If you call the [DescribeEventDetailsForOrganization] operation and receive one of the \
         following errors, follow the recommendations in the message:\n\
        \ \n\
        \  {ul\n\
        \        {-  We couldn't find a public event that matches your request. To find an event \
         that is account specific, you must enter an Amazon Web Services account ID in the request.\n\
        \            \n\
        \             }\n\
        \        {-  We couldn't find an account specific event for the specified Amazon Web \
         Services account. To find an event that is public, you must enter a null value for the \
         Amazon Web Services account ID in the request.\n\
        \            \n\
        \             }\n\
        \        {-  Your Amazon Web Services account doesn't include the Amazon Web Services \
         Support plan required to use the Health API. You must have either a Business, Enterprise \
         On-Ramp, or Enterprise Support plan.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Error information returned when a \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html}DescribeEventDetailsForOrganization} \
   operation can't find a specified event.\n"]

type nonrec describe_event_details_for_organization_failed_set =
  organization_event_details_error_item list
[@@ocaml.doc ""]

type nonrec metadata_value = string [@@ocaml.doc ""]

type nonrec metadata_key = string [@@ocaml.doc ""]

type nonrec event_metadata = (metadata_key * metadata_value) list [@@ocaml.doc ""]

type nonrec event_description2 = string [@@ocaml.doc ""]

type nonrec event_description = {
  latest_description : event_description2 option;
      [@ocaml.doc "The most recent description of the event.\n"]
}
[@@ocaml.doc
  "The detailed description of the event. Included in the information returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html}DescribeEventDetails} \
   operation.\n"]

type nonrec organization_event_details = {
  aws_account_id : account_id option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
  event : event option; [@ocaml.doc ""]
  event_description : event_description option; [@ocaml.doc ""]
  event_metadata : event_metadata option; [@ocaml.doc "Additional metadata about the event.\n"]
}
[@@ocaml.doc
  "Detailed information about an event. A combination of an \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event} object, an \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EventDescription.html}EventDescription} \
   object, and additional metadata about the event. Returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html}DescribeEventDetailsForOrganization} \
   operation.\n"]

type nonrec describe_event_details_for_organization_successful_set = organization_event_details list
[@@ocaml.doc ""]

type nonrec describe_event_details_for_organization_response = {
  successful_set : describe_event_details_for_organization_successful_set option;
      [@ocaml.doc "Information about the events that could be retrieved.\n"]
  failed_set : describe_event_details_for_organization_failed_set option;
      [@ocaml.doc "Error messages for any events that could not be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec event_account_filter = {
  event_arn : event_arn;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  aws_account_id : account_id option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
}
[@@ocaml.doc
  "The values used to filter results from the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html}DescribeEventDetailsForOrganization} \
   and \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html}DescribeAffectedEntitiesForOrganization} \
   operations.\n"]

type nonrec organization_event_detail_filters_list = event_account_filter list [@@ocaml.doc ""]

type nonrec describe_event_details_for_organization_request = {
  organization_event_detail_filters : organization_event_detail_filters_list;
      [@ocaml.doc "A set of JSON elements that includes the [awsAccountId] and the [eventArn].\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
}
[@@ocaml.doc ""]

type nonrec event_details_error_item = {
  event_arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  error_name : string_ option; [@ocaml.doc "The name of the error.\n"]
  error_message : string_ option; [@ocaml.doc "A message that describes the error.\n"]
}
[@@ocaml.doc
  "Error information returned when a \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html}DescribeEventDetails} \
   operation can't find a specified event.\n"]

type nonrec describe_event_details_failed_set = event_details_error_item list [@@ocaml.doc ""]

type nonrec event_details = {
  event : event option; [@ocaml.doc "Summary information about the event.\n"]
  event_description : event_description option;
      [@ocaml.doc "The most recent description of the event.\n"]
  event_metadata : event_metadata option; [@ocaml.doc "Additional metadata about the event.\n"]
}
[@@ocaml.doc
  "Detailed information about an event. A combination of an \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event} object, an \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EventDescription.html}EventDescription} \
   object, and additional metadata about the event. Returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html}DescribeEventDetails} \
   operation.\n"]

type nonrec describe_event_details_successful_set = event_details list [@@ocaml.doc ""]

type nonrec describe_event_details_response = {
  successful_set : describe_event_details_successful_set option;
      [@ocaml.doc "Information about the events that could be retrieved.\n"]
  failed_set : describe_event_details_failed_set option;
      [@ocaml.doc "Error messages for any events that could not be retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_event_details_request = {
  event_arns : event_arn_list;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
}
[@@ocaml.doc ""]

type nonrec count = int [@@ocaml.doc ""]

type nonrec aggregate_value = string [@@ocaml.doc ""]

type nonrec event_aggregate = {
  aggregate_value : aggregate_value option;
      [@ocaml.doc "The issue type for the associated count.\n"]
  count : count option; [@ocaml.doc "The number of events of the associated issue type.\n"]
}
[@@ocaml.doc
  "The number of events of each issue type. Returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventAggregates.html}DescribeEventAggregates} \
   operation.\n"]

type nonrec event_aggregate_list = event_aggregate list [@@ocaml.doc ""]

type nonrec describe_event_aggregates_response = {
  event_aggregates : event_aggregate_list option;
      [@ocaml.doc "The number of events in each category that meet the optional filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec event_aggregate_field = EventTypeCategory [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec describe_event_aggregates_request = {
  filter : event_filter option; [@ocaml.doc "Values to narrow the results returned.\n"]
  aggregate_field : event_aggregate_field;
      [@ocaml.doc "The only currently supported value is [eventTypeCategory].\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 10 and 100, inclusive.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_status_code =
  | IMPAIRED [@ocaml.doc ""]
  | UNIMPAIRED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | RESOLVED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_statuses = (entity_status_code * count) list [@@ocaml.doc ""]

type nonrec account_entity_aggregate = {
  account_id : event_arn option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
  count : count option;
      [@ocaml.doc
        "The number of entities that match the filter criteria for the specified events.\n"]
  statuses : entity_statuses option;
      [@ocaml.doc "The number of affected entities aggregated by the entity status codes.\n"]
}
[@@ocaml.doc
  "The number of entities in an account that are impacted by a specific event aggregated by the \
   entity status codes.\n"]

type nonrec account_entity_aggregates_list = account_entity_aggregate list [@@ocaml.doc ""]

type nonrec organization_entity_aggregate = {
  event_arn : event_arn option;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
  count : count option;
      [@ocaml.doc
        "The number of entities for the organization that match the filter criteria for the \
         specified events.\n"]
  statuses : entity_statuses option;
      [@ocaml.doc "The number of affected entities aggregated by the entitiy status codes.\n"]
  accounts : account_entity_aggregates_list option;
      [@ocaml.doc
        "A list of entity aggregates for each of the specified accounts in your organization that \
         are affected by a specific event. If there are no [awsAccountIds] provided in the \
         request, this field will be empty in the response.\n"]
}
[@@ocaml.doc
  "The aggregate results of entities affected by the specified event in your organization. The \
   results are aggregated by the entity status codes for the specified set of accountsIDs.\n"]

type nonrec organization_entity_aggregates_list = organization_entity_aggregate list
[@@ocaml.doc ""]

type nonrec describe_entity_aggregates_for_organization_response = {
  organization_entity_aggregates : organization_entity_aggregates_list option;
      [@ocaml.doc
        "The list of entity aggregates for each of the specified accounts that are affected by \
         each of the specified events.\n"]
}
[@@ocaml.doc ""]

type nonrec organization_account_ids_list = account_id list [@@ocaml.doc ""]

type nonrec organization_event_arns_list = event_arn list [@@ocaml.doc ""]

type nonrec describe_entity_aggregates_for_organization_request = {
  event_arns : organization_event_arns_list;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
  aws_account_ids : organization_account_ids_list option;
      [@ocaml.doc
        "A list of 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_aggregate = {
  event_arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  count : count option;
      [@ocaml.doc "The number of entities that match the criteria for the specified events.\n"]
  statuses : entity_statuses option;
      [@ocaml.doc "The number of affected entities aggregated by the entity status codes.\n"]
}
[@@ocaml.doc
  "The number of entities that are affected by one or more events. Returned by the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEntityAggregates.html}DescribeEntityAggregates} \
   operation.\n"]

type nonrec entity_aggregate_list = entity_aggregate list [@@ocaml.doc ""]

type nonrec describe_entity_aggregates_response = {
  entity_aggregates : entity_aggregate_list option;
      [@ocaml.doc "The number of entities that are affected by each of the specified events.\n"]
}
[@@ocaml.doc ""]

type nonrec event_arns_list = event_arn list [@@ocaml.doc ""]

type nonrec describe_entity_aggregates_request = {
  event_arns : event_arns_list option;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
}
[@@ocaml.doc ""]

type nonrec organization_affected_entities_error_item = {
  aws_account_id : account_id option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
  event_arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  error_name : string_ option; [@ocaml.doc "The name of the error.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "A message that describes the error. Follow the error message and retry your request.\n\n\
        \ For example, the [InvalidAccountInputError] error message appears if you call the \
         [DescribeAffectedEntitiesForOrganization] operation and specify the [AccountSpecific] \
         value for the [EventScopeCode] parameter, but don't specify an Amazon Web Services \
         account.\n\
        \ "]
}
[@@ocaml.doc
  "Error information returned when a \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html}DescribeAffectedEntitiesForOrganization} \
   operation can't find or process a specific entity.\n"]

type nonrec describe_affected_entities_for_organization_failed_set =
  organization_affected_entities_error_item list
[@@ocaml.doc ""]

type nonrec entity_metadata_value = string [@@ocaml.doc ""]

type nonrec entity_metadata_key = string [@@ocaml.doc ""]

type nonrec entity_metadata = (entity_metadata_key * entity_metadata_value) list [@@ocaml.doc ""]

type nonrec entity_url = string [@@ocaml.doc ""]

type nonrec affected_entity = {
  entity_arn : entity_arn option;
      [@ocaml.doc
        "The unique identifier for the entity. Format: \n\
         {[\n\
         arn:aws:health:{i entity-region}:{i aws-account}:entity/{i entity-id} \n\
         ]}\n\
         . Example: [arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K] \n"]
  event_arn : event_arn option;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  entity_value : entity_value option; [@ocaml.doc "The ID of the affected entity.\n"]
  entity_url : entity_url option; [@ocaml.doc "The URL of the affected entity.\n"]
  aws_account_id : account_id option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account number that contains the affected entity.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The most recent time that the entity was updated.\n"]
  status_code : entity_status_code option;
      [@ocaml.doc
        "The most recent status of the entity affected by the event. The possible values are \
         [IMPAIRED], [UNIMPAIRED], [UNKNOWN], [PENDING], and [RESOLVED].\n"]
  tags : tag_set option;
      [@ocaml.doc
        "A map of entity tags attached to the affected entity.\n\n\
        \  Currently, the [tags] property isn't supported.\n\
        \  \n\
        \   "]
  entity_metadata : entity_metadata option;
      [@ocaml.doc "Additional metadata about the affected entity.\n"]
}
[@@ocaml.doc "Information about an entity that is affected by a Health event.\n"]

type nonrec entity_list = affected_entity list [@@ocaml.doc ""]

type nonrec describe_affected_entities_for_organization_response = {
  entities : entity_list option;
      [@ocaml.doc
        "A JSON set of elements including the [awsAccountId] and its [entityArn], [entityValue] \
         and its [entityArn], [lastUpdatedTime], and [statusCode].\n"]
  failed_set : describe_affected_entities_for_organization_failed_set option;
      [@ocaml.doc
        "A JSON set of elements of the failed response, including the [awsAccountId], \
         [errorMessage], [errorName], and [eventArn].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_status_code_list = entity_status_code list [@@ocaml.doc ""]

type nonrec entity_account_filter = {
  event_arn : event_arn;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  aws_account_id : account_id option;
      [@ocaml.doc
        "The 12-digit Amazon Web Services account numbers that contains the affected entities.\n"]
  status_codes : entity_status_code_list option; [@ocaml.doc "A list of entity status codes.\n"]
}
[@@ocaml.doc
  "A JSON set of elements including the [awsAccountId], [eventArn] and a set of [statusCodes].\n"]

type nonrec organization_entity_account_filters_list = entity_account_filter list [@@ocaml.doc ""]

type nonrec organization_entity_filters_list = event_account_filter list [@@ocaml.doc ""]

type nonrec describe_affected_entities_for_organization_request = {
  organization_entity_filters : organization_entity_filters_list option;
      [@ocaml.doc "A JSON set of elements including the [awsAccountId] and the [eventArn].\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results_lower_range option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 1 and 100, inclusive.\n"]
  organization_entity_account_filters : organization_entity_account_filters_list option;
      [@ocaml.doc
        "A JSON set of elements including the [awsAccountId], [eventArn] and a set of [statusCodes].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_affected_entities_response = {
  entities : entity_list option; [@ocaml.doc "The entities that match the filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_filter = {
  event_arns : event_arn_list;
      [@ocaml.doc
        "A list of event ARNs (unique identifiers). For example: \
         [\"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456\", \
         \"arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101\"] \n"]
  entity_arns : entity_arn_list option; [@ocaml.doc "A list of entity ARNs (unique identifiers).\n"]
  entity_values : entity_value_list option; [@ocaml.doc "A list of IDs for affected entities.\n"]
  last_updated_times : date_time_range_list option;
      [@ocaml.doc "A list of the most recent dates and times that the entity was updated.\n"]
  tags : tag_filter option;
      [@ocaml.doc
        "A map of entity tags attached to the affected entity.\n\n\
        \  Currently, the [tags] property isn't supported.\n\
        \  \n\
        \   "]
  status_codes : entity_status_code_list option;
      [@ocaml.doc "A list of entity status codes ([IMPAIRED], [UNIMPAIRED], or [UNKNOWN]).\n"]
}
[@@ocaml.doc
  "The values to use to filter results from the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html}DescribeAffectedEntities} \
   operation.\n"]

type nonrec describe_affected_entities_request = {
  filter : entity_filter;
      [@ocaml.doc "Values to narrow the results returned. At least one event ARN is required.\n"]
  locale : locale option;
      [@ocaml.doc
        "The locale (language) to return information in. English (en) is the default and the only \
         supported value at this time.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results_lower_range option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec affected_accounts_list = account_id list [@@ocaml.doc ""]

type nonrec describe_affected_accounts_for_organization_response = {
  affected_accounts : affected_accounts_list option;
      [@ocaml.doc "A JSON set of elements of the affected accounts.\n"]
  event_scope_code : event_scope_code option;
      [@ocaml.doc
        "This parameter specifies if the Health event is a public Amazon Web Services service \
         event or an account-specific event.\n\n\
        \ {ul\n\
        \       {-  If the [eventScopeCode] value is [PUBLIC], then the [affectedAccounts] value \
         is always empty.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [ACCOUNT_SPECIFIC], then the \
         [affectedAccounts] value lists the affected Amazon Web Services accounts in your \
         organization. For example, if an event affects a service such as Amazon Elastic Compute \
         Cloud and you have Amazon Web Services accounts that use that service, those account IDs \
         appear in the response.\n\
        \           \n\
        \            }\n\
        \       {-  If the [eventScopeCode] value is [NONE], then the [eventArn] that you \
         specified in the request is invalid or doesn't exist.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_affected_accounts_for_organization_request = {
  event_arn : event_arn;
      [@ocaml.doc
        "The unique identifier for the event. The event ARN has the \n\
         {[\n\
         arn:aws:health:{i event-region}::event/{i SERVICE}/{i EVENT_TYPE_CODE}/{i \
         EVENT_TYPE_PLUS_ID} \n\
         ]}\n\
        \ format.\n\n\
        \ For example, an event ARN might look like the following:\n\
        \ \n\
        \   \
         [arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456] \n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next batch of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in one batch, between 10 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]
