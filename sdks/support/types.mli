type nonrec validated_service_code = string [@@ocaml.doc ""]

type nonrec validated_language_availability = string [@@ocaml.doc ""]

type nonrec validated_issue_type_string = string [@@ocaml.doc ""]

type nonrec validated_date_time = string [@@ocaml.doc ""]

type nonrec validated_communication_body = string [@@ocaml.doc ""]

type nonrec validated_category_code = string [@@ocaml.doc ""]

type nonrec type_ = string [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec trusted_advisor_resources_summary = {
  resources_suppressed : long;
      [@ocaml.doc
        "The number of Amazon Web Services resources ignored by Trusted Advisor because they were \
         marked as suppressed by the user.\n"]
  resources_ignored : long;
      [@ocaml.doc
        "The number of Amazon Web Services resources ignored by Trusted Advisor because \
         information was unavailable.\n"]
  resources_flagged : long;
      [@ocaml.doc
        "The number of Amazon Web Services resources that were flagged (listed) by the Trusted \
         Advisor check.\n"]
  resources_processed : long;
      [@ocaml.doc
        "The number of Amazon Web Services resources that were analyzed by the Trusted Advisor \
         check.\n"]
}
[@@ocaml.doc
  "Details about Amazon Web Services resources that were analyzed in a call to Trusted Advisor \
   [DescribeTrustedAdvisorCheckSummaries].\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec string_list = string_ Smaws_Lib.CoreTypes.Nullable.t list [@@ocaml.doc ""]

type nonrec trusted_advisor_resource_detail = {
  metadata : string_list;
      [@ocaml.doc
        "Additional information about the identified resource. The exact metadata and its order \
         can be obtained by inspecting the [TrustedAdvisorCheckDescription] object returned by the \
         call to [DescribeTrustedAdvisorChecks]. {b Metadata} contains all the data that is shown \
         in the Excel download, even in those cases where the UI shows just summary data.\n"]
  is_suppressed : boolean_ option;
      [@ocaml.doc
        "Specifies whether the Amazon Web Services resource was ignored by Trusted Advisor because \
         it was marked as suppressed by the user.\n"]
  resource_id : string_; [@ocaml.doc "The unique identifier for the identified resource.\n"]
  region : string_ option;
      [@ocaml.doc "The Amazon Web Services Region in which the identified resource is located.\n"]
  status : string_;
      [@ocaml.doc "The status code for the resource identified in the Trusted Advisor check.\n"]
}
[@@ocaml.doc "Contains information about a resource identified by a Trusted Advisor check.\n"]

type nonrec trusted_advisor_resource_detail_list = trusted_advisor_resource_detail list
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec trusted_advisor_cost_optimizing_summary = {
  estimated_percent_monthly_savings : double;
      [@ocaml.doc
        "The estimated percentage of savings that might be realized if the recommended operations \
         are taken.\n"]
  estimated_monthly_savings : double;
      [@ocaml.doc
        "The estimated monthly savings that might be realized if the recommended operations are \
         taken.\n"]
}
[@@ocaml.doc
  "The estimated cost savings that might be realized if the recommended operations are taken.\n"]

type nonrec trusted_advisor_category_specific_summary = {
  cost_optimizing : trusted_advisor_cost_optimizing_summary option;
      [@ocaml.doc
        "The summary information about cost savings for a Trusted Advisor check that is in the \
         Cost Optimizing category.\n"]
}
[@@ocaml.doc
  "The container for summary information that relates to the category of the Trusted Advisor check.\n"]

type nonrec trusted_advisor_check_summary = {
  category_specific_summary : trusted_advisor_category_specific_summary;
      [@ocaml.doc
        "Summary information that relates to the category of the check. Cost Optimizing is the \
         only category that is currently supported.\n"]
  resources_summary : trusted_advisor_resources_summary; [@ocaml.doc ""]
  has_flagged_resources : boolean_ option;
      [@ocaml.doc "Specifies whether the Trusted Advisor check has flagged resources.\n"]
  status : string_;
      [@ocaml.doc
        "The alert status of the check: \"ok\" (green), \"warning\" (yellow), \"error\" (red), or \
         \"not_available\".\n"]
  timestamp : string_; [@ocaml.doc "The time of the last refresh of the check.\n"]
  check_id : string_; [@ocaml.doc "The unique identifier for the Trusted Advisor check.\n"]
}
[@@ocaml.doc
  "A summary of a Trusted Advisor check result, including the alert status, last refresh, and \
   number of resources examined.\n"]

type nonrec trusted_advisor_check_summary_list = trusted_advisor_check_summary list [@@ocaml.doc ""]

type nonrec trusted_advisor_check_result = {
  flagged_resources : trusted_advisor_resource_detail_list;
      [@ocaml.doc "The details about each resource listed in the check result.\n"]
  category_specific_summary : trusted_advisor_category_specific_summary;
      [@ocaml.doc
        "Summary information that relates to the category of the check. Cost Optimizing is the \
         only category that is currently supported.\n"]
  resources_summary : trusted_advisor_resources_summary; [@ocaml.doc ""]
  status : string_;
      [@ocaml.doc
        "The alert status of the check: \"ok\" (green), \"warning\" (yellow), \"error\" (red), or \
         \"not_available\".\n"]
  timestamp : string_; [@ocaml.doc "The time of the last refresh of the check.\n"]
  check_id : string_; [@ocaml.doc "The unique identifier for the Trusted Advisor check.\n"]
}
[@@ocaml.doc
  "The results of a Trusted Advisor check returned by [DescribeTrustedAdvisorCheckResult].\n"]

type nonrec trusted_advisor_check_refresh_status = {
  millis_until_next_refreshable : long;
      [@ocaml.doc
        "The amount of time, in milliseconds, until the Trusted Advisor check is eligible for \
         refresh.\n"]
  status : string_;
      [@ocaml.doc
        "The status of the Trusted Advisor check for which a refresh has been requested: \n\n\
        \ {ul\n\
        \       {-   [none] - The check is not refreshed or the non-success status exceeds the \
         timeout\n\
        \           \n\
        \            }\n\
        \       {-   [enqueued] - The check refresh requests has entered the refresh queue\n\
        \           \n\
        \            }\n\
        \       {-   [processing] - The check refresh request is picked up by the rule processing \
         engine\n\
        \           \n\
        \            }\n\
        \       {-   [success] - The check is successfully refreshed\n\
        \           \n\
        \            }\n\
        \       {-   [abandoned] - The check refresh has failed\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  check_id : string_; [@ocaml.doc "The unique identifier for the Trusted Advisor check.\n"]
}
[@@ocaml.doc "The refresh status of a Trusted Advisor check.\n"]

type nonrec trusted_advisor_check_refresh_status_list = trusted_advisor_check_refresh_status list
[@@ocaml.doc ""]

type nonrec trusted_advisor_check_description = {
  metadata : string_list;
      [@ocaml.doc
        "The column headings for the data returned by the Trusted Advisor check. The order of the \
         headings corresponds to the order of the data in the {b Metadata} element of the \
         [TrustedAdvisorResourceDetail] for the check. {b Metadata} contains all the data that is \
         shown in the Excel download, even in those cases where the UI shows just summary data. \n"]
  category : string_; [@ocaml.doc "The category of the Trusted Advisor check.\n"]
  description : string_;
      [@ocaml.doc
        "The description of the Trusted Advisor check, which includes the alert criteria and \
         recommended operations (contains HTML markup).\n"]
  name : string_; [@ocaml.doc "The display name for the Trusted Advisor check.\n"]
  id : string_; [@ocaml.doc "The unique identifier for the Trusted Advisor check.\n"]
}
[@@ocaml.doc "The description and metadata for a Trusted Advisor check.\n"]

type nonrec trusted_advisor_check_list = trusted_advisor_check_description list [@@ocaml.doc ""]

type nonrec time_created = string [@@ocaml.doc ""]

type nonrec availability_error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : availability_error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " You have exceeded the maximum allowed TPS (Transactions Per Second) for the operations. \n"]

type nonrec code = string [@@ocaml.doc ""]

type nonrec language = string [@@ocaml.doc ""]

type nonrec display = string [@@ocaml.doc ""]

type nonrec supported_language = {
  display : display option; [@ocaml.doc " Language display value e.g. [ENGLISH] \n"]
  language : language option; [@ocaml.doc " Full language description e.g. [ENGLISH] \n"]
  code : code option; [@ocaml.doc " 2 digit ISO 639-1 code. e.g. [en] \n"]
}
[@@ocaml.doc
  " A JSON-formatted object that contains the available ISO 639-1 language [code], [language] name \
   and langauge [display] value. The language code is what should be used in the [CreateCase] \
   call. \n"]

type nonrec supported_languages_list = supported_language list [@@ocaml.doc ""]

type nonrec start_time = string [@@ocaml.doc ""]

type nonrec end_time = string [@@ocaml.doc ""]

type nonrec supported_hour = {
  end_time : end_time option; [@ocaml.doc " End Time. RFC 3339 format ['HH:mm:ss.SSS']. \n"]
  start_time : start_time option; [@ocaml.doc " Start Time. RFC 3339 format ['HH:mm:ss.SSS']. \n"]
}
[@@ocaml.doc
  "Time range object with [startTime] and [endTime] range in RFC 3339 format. ['HH:mm:ss.SSS'].\n"]

type nonrec supported_hours_list = supported_hour list [@@ocaml.doc ""]

type nonrec submitted_by = string [@@ocaml.doc ""]

type nonrec subject = string [@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec severity_level_code = string [@@ocaml.doc ""]

type nonrec severity_level_name = string [@@ocaml.doc ""]

type nonrec severity_level = {
  name : severity_level_name option;
      [@ocaml.doc
        "The name of the severity level that corresponds to the severity level code.\n\n\
        \  The values returned by the API are different from the values that appear in the Amazon \
         Web Services Support Center. For example, the API uses the code [low], but the name \
         appears as General guidance in Support Center. \n\
        \  \n\
        \   The following are the API code names and how they appear in the console:\n\
        \   \n\
        \    {ul\n\
        \          {-   [low] - General guidance\n\
        \              \n\
        \               }\n\
        \          {-   [normal] - System impaired\n\
        \              \n\
        \               }\n\
        \          {-   [high] - Production system impaired\n\
        \              \n\
        \               }\n\
        \          {-   [urgent] - Production system down\n\
        \              \n\
        \               }\n\
        \          {-   [critical] - Business-critical system down\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity}Choosing \
         a severity} in the {i Amazon Web Services Support User Guide}.\n\
        \    "]
  code : severity_level_code option;
      [@ocaml.doc
        "The code for case severity level.\n\n\
        \ Valid values: [low] | [normal] | [high] | [urgent] | [critical] \n\
        \ "]
}
[@@ocaml.doc
  "A code and name pair that represents the severity level of a support case. The available values \
   depend on the support plan for the account. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/case-management.html#choosing-severity}Choosing \
   a severity} in the {i Amazon Web Services Support User Guide}.\n"]

type nonrec severity_levels_list = severity_level list [@@ocaml.doc ""]

type nonrec severity_code = string [@@ocaml.doc ""]

type nonrec service_name = string [@@ocaml.doc ""]

type nonrec service_code = string [@@ocaml.doc ""]

type nonrec category_code = string [@@ocaml.doc ""]

type nonrec category_name = string [@@ocaml.doc ""]

type nonrec category = {
  name : category_name option; [@ocaml.doc "The category name for the support case.\n"]
  code : category_code option; [@ocaml.doc "The category code for the support case.\n"]
}
[@@ocaml.doc
  "A JSON-formatted name/value pair that represents the category name and category code of the \
   problem, selected from the [DescribeServices] response for each Amazon Web Services service.\n"]

type nonrec category_list = category list [@@ocaml.doc ""]

type nonrec service = {
  categories : category_list option;
      [@ocaml.doc
        "A list of categories that describe the type of support issue a case describes. Categories \
         consist of a category name and a category code. Category names and codes are passed to \
         Amazon Web Services Support when you call [CreateCase].\n"]
  name : service_name option;
      [@ocaml.doc
        "The friendly name for an Amazon Web Services service. The [code] element contains the \
         corresponding code.\n"]
  code : service_code option;
      [@ocaml.doc
        "The code for an Amazon Web Services service returned by the [DescribeServices] response. \
         The [name] element contains the corresponding friendly name.\n"]
}
[@@ocaml.doc
  "Information about an Amazon Web Services service returned by the [DescribeServices] operation.\n"]

type nonrec service_list = service list [@@ocaml.doc ""]

type nonrec service_code2 = string [@@ocaml.doc ""]

type nonrec service_code_list = service_code2 list [@@ocaml.doc ""]

type nonrec result_ = bool [@@ocaml.doc ""]

type nonrec case_status = string [@@ocaml.doc ""]

type nonrec resolve_case_response = {
  final_case_status : case_status option;
      [@ocaml.doc "The status of the case after the [ResolveCase] request was processed.\n"]
  initial_case_status : case_status option;
      [@ocaml.doc "The status of the case when the [ResolveCase] request was sent.\n"]
}
[@@ocaml.doc "The status of the case returned by the [ResolveCase] operation.\n"]

type nonrec case_id = string [@@ocaml.doc ""]

type nonrec resolve_case_request = {
  case_id : case_id option;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string formatted as shown in this example: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec internal_server_error = {
  message : error_message option; [@ocaml.doc "An internal server error occurred.\n"]
}
[@@ocaml.doc "An internal server error occurred.\n"]

type nonrec case_id_not_found = {
  message : error_message option; [@ocaml.doc "The requested [CaseId] could not be located.\n"]
}
[@@ocaml.doc "The requested [caseId] couldn't be located.\n"]

type nonrec refresh_trusted_advisor_check_response = {
  status : trusted_advisor_check_refresh_status;
      [@ocaml.doc
        "The current refresh status for a check, including the amount of time until the check is \
         eligible for refresh.\n"]
}
[@@ocaml.doc "The current refresh status of a Trusted Advisor check.\n"]

type nonrec refresh_trusted_advisor_check_request = {
  check_id : string_;
      [@ocaml.doc
        "The unique identifier for the Trusted Advisor check to refresh.\n\n\
        \  Specifying the check ID of a check that is automatically refreshed causes an \
         [InvalidParameterValue] error.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "\n"]

type nonrec attachment_id = string [@@ocaml.doc ""]

type nonrec file_name = string [@@ocaml.doc ""]

type nonrec attachment_details = {
  file_name : file_name option; [@ocaml.doc "The file name of the attachment.\n"]
  attachment_id : attachment_id option; [@ocaml.doc "The ID of the attachment.\n"]
}
[@@ocaml.doc
  "The file name and ID of an attachment to a case communication. You can use the ID to retrieve \
   the attachment with the [DescribeAttachment] operation.\n"]

type nonrec attachment_set = attachment_details list [@@ocaml.doc ""]

type nonrec communication = {
  attachment_set : attachment_set option;
      [@ocaml.doc "Information about the attachments to the case communication.\n"]
  time_created : time_created option; [@ocaml.doc "The time the communication was created.\n"]
  submitted_by : submitted_by option;
      [@ocaml.doc
        "The identity of the account that submitted, or responded to, the support case. Customer \
         entries include the IAM role as well as the email address (for example, \"AdminRole \
         (Role) ). Entries from the Amazon Web Services Support team display \"Amazon Web \
         Services,\" and don't show an email address. \n"]
  body : validated_communication_body option;
      [@ocaml.doc
        "The text of the communication between the customer and Amazon Web Services Support.\n"]
  case_id : case_id option;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string formatted as shown in this example: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc
  "A communication associated with a support case. The communication consists of the case ID, the \
   message body, attachment information, the submitter of the communication, and the date and time \
   of the communication.\n"]

type nonrec communication_list = communication list [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec recent_case_communications = {
  next_token : next_token option; [@ocaml.doc "A resumption point for pagination.\n"]
  communications : communication_list option;
      [@ocaml.doc "The five most recent communications associated with the case.\n"]
}
[@@ocaml.doc "The five most recent communications associated with the case.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec issue_type = string [@@ocaml.doc ""]

type nonrec include_resolved_cases = bool [@@ocaml.doc ""]

type nonrec include_communications = bool [@@ocaml.doc ""]

type nonrec expiry_time = string [@@ocaml.doc ""]

type nonrec display_id = string [@@ocaml.doc ""]

type nonrec describe_trusted_advisor_checks_response = {
  checks : trusted_advisor_check_list;
      [@ocaml.doc "Information about all available Trusted Advisor checks.\n"]
}
[@@ocaml.doc
  "Information about the Trusted Advisor checks returned by the [DescribeTrustedAdvisorChecks] \
   operation.\n"]

type nonrec describe_trusted_advisor_checks_request = {
  language : string_;
      [@ocaml.doc
        "The ISO 639-1 code for the language that you want your checks to appear in.\n\n\
        \ The Amazon Web Services Support API currently supports the following languages for \
         Trusted Advisor:\n\
        \ \n\
        \  {ul\n\
        \        {-  Chinese, Simplified - [zh] \n\
        \            \n\
        \             }\n\
        \        {-  Chinese, Traditional - [zh_TW] \n\
        \            \n\
        \             }\n\
        \        {-  English - [en] \n\
        \            \n\
        \             }\n\
        \        {-  French - [fr] \n\
        \            \n\
        \             }\n\
        \        {-  German - [de] \n\
        \            \n\
        \             }\n\
        \        {-  Indonesian - [id] \n\
        \            \n\
        \             }\n\
        \        {-  Italian - [it] \n\
        \            \n\
        \             }\n\
        \        {-  Japanese - [ja] \n\
        \            \n\
        \             }\n\
        \        {-  Korean - [ko] \n\
        \            \n\
        \             }\n\
        \        {-  Portuguese, Brazilian - [pt_BR] \n\
        \            \n\
        \             }\n\
        \        {-  Spanish - [es] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_trusted_advisor_check_summaries_response = {
  summaries : trusted_advisor_check_summary_list;
      [@ocaml.doc "The summary information for the requested Trusted Advisor checks.\n"]
}
[@@ocaml.doc
  "The summaries of the Trusted Advisor checks returned by the \
   [DescribeTrustedAdvisorCheckSummaries] operation.\n"]

type nonrec describe_trusted_advisor_check_summaries_request = {
  check_ids : string_list; [@ocaml.doc "The IDs of the Trusted Advisor checks.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trusted_advisor_check_result_response = {
  result_ : trusted_advisor_check_result option;
      [@ocaml.doc "The detailed results of the Trusted Advisor check.\n"]
}
[@@ocaml.doc
  "The result of the Trusted Advisor check returned by the [DescribeTrustedAdvisorCheckResult] \
   operation.\n"]

type nonrec describe_trusted_advisor_check_result_request = {
  language : string_ option;
      [@ocaml.doc
        "The ISO 639-1 code for the language that you want your check results to appear in.\n\n\
        \ The Amazon Web Services Support API currently supports the following languages for \
         Trusted Advisor:\n\
        \ \n\
        \  {ul\n\
        \        {-  Chinese, Simplified - [zh] \n\
        \            \n\
        \             }\n\
        \        {-  Chinese, Traditional - [zh_TW] \n\
        \            \n\
        \             }\n\
        \        {-  English - [en] \n\
        \            \n\
        \             }\n\
        \        {-  French - [fr] \n\
        \            \n\
        \             }\n\
        \        {-  German - [de] \n\
        \            \n\
        \             }\n\
        \        {-  Indonesian - [id] \n\
        \            \n\
        \             }\n\
        \        {-  Italian - [it] \n\
        \            \n\
        \             }\n\
        \        {-  Japanese - [ja] \n\
        \            \n\
        \             }\n\
        \        {-  Korean - [ko] \n\
        \            \n\
        \             }\n\
        \        {-  Portuguese, Brazilian - [pt_BR] \n\
        \            \n\
        \             }\n\
        \        {-  Spanish - [es] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  check_id : string_; [@ocaml.doc "The unique identifier for the Trusted Advisor check.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_trusted_advisor_check_refresh_statuses_response = {
  statuses : trusted_advisor_check_refresh_status_list;
      [@ocaml.doc "The refresh status of the specified Trusted Advisor checks.\n"]
}
[@@ocaml.doc
  "The statuses of the Trusted Advisor checks returned by the \
   [DescribeTrustedAdvisorCheckRefreshStatuses] operation.\n"]

type nonrec describe_trusted_advisor_check_refresh_statuses_request = {
  check_ids : string_list;
      [@ocaml.doc
        "The IDs of the Trusted Advisor checks to get the status.\n\n\
        \  If you specify the check ID of a check that is automatically refreshed, you might see \
         an [InvalidParameterValue] error.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec describe_supported_languages_response = {
  supported_languages : supported_languages_list option;
      [@ocaml.doc
        " A JSON-formatted array that contains the available ISO 639-1 language codes. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_supported_languages_request = {
  category_code : validated_category_code;
      [@ocaml.doc
        "The category of problem for the support case. You also use the [DescribeServices] \
         operation to get the category code for a service. Each Amazon Web Services service \
         defines its own set of category codes.\n"]
  service_code : validated_service_code;
      [@ocaml.doc
        "The code for the Amazon Web Services service. You can use the [DescribeServices] \
         operation to get the possible [serviceCode] values.\n"]
  issue_type : validated_issue_type_string;
      [@ocaml.doc
        "The type of issue for the case. You can specify [customer-service] or [technical].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_severity_levels_response = {
  severity_levels : severity_levels_list option;
      [@ocaml.doc
        "The available severity levels for the support case. Available severity levels are defined \
         by your service level agreement with Amazon Web Services.\n"]
}
[@@ocaml.doc "The list of severity levels returned by the [DescribeSeverityLevels] operation.\n"]

type nonrec describe_severity_levels_request = {
  language : language option;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_services_response = {
  services : service_list option;
      [@ocaml.doc "A JSON-formatted list of Amazon Web Services services.\n"]
}
[@@ocaml.doc
  "The list of Amazon Web Services services returned by the [DescribeServices] operation.\n"]

type nonrec describe_services_request = {
  language : language option;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
  service_code_list : service_code_list option;
      [@ocaml.doc
        "A JSON-formatted list of service codes available for Amazon Web Services services.\n"]
}
[@@ocaml.doc ""]

type nonrec date_interval = {
  end_date_time : validated_date_time option;
      [@ocaml.doc " End Date Time (UTC). RFC 3339 format : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'. \n"]
  start_date_time : validated_date_time option;
      [@ocaml.doc
        " A JSON object containing start and date time (UTC). Date and time format is RFC 3339 : \
         'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'. \n"]
}
[@@ocaml.doc "Date and time (UTC) format in RFC 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.\n"]

type nonrec dates_without_support_list = date_interval list [@@ocaml.doc ""]

type nonrec communication_type_options = {
  dates_without_support : dates_without_support_list option;
      [@ocaml.doc
        " A JSON-formatted list containing date and time ranges for periods without support \n"]
  supported_hours : supported_hours_list option;
      [@ocaml.doc " A JSON-formatted list containing time ranges when support is available. \n"]
  type_ : type_ option;
      [@ocaml.doc
        " A string value indicating the communication type. At the moment the type value can \
         assume one of 3 values at the moment chat, web and call. \n"]
}
[@@ocaml.doc
  "A JSON-formatted object that contains the CommunicationTypeOptions for creating a case for a \
   certain communication channel. It is contained in the response from a \
   [DescribeCreateCaseOptions] request. {b CommunicationTypeOptions} contains the following \
   fields:\n\n\
  \ {ul\n\
  \       {-   {b datesWithoutSupport} - A JSON-formatted list containing date and time ranges for \
   periods without support in UTC time. Date and time format is RFC 3339 : \
   'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'. \n\
  \           \n\
  \            }\n\
  \       {-   {b supportedHours} - A JSON-formatted list containing time ranges when support are \
   available. Time format is RFC 3339 : 'HH:mm:ss.SSS'. \n\
  \           \n\
  \            }\n\
  \       {-   {b type} - A string value indicating the communication type that the aforementioned \
   rules apply to. At the moment the type value can assume one of 3 values at the moment [chat], \
   [web] and [call]. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec communication_type_options_list = communication_type_options list [@@ocaml.doc ""]

type nonrec describe_create_case_options_response = {
  communication_types : communication_type_options_list option;
      [@ocaml.doc
        " A JSON-formatted array that contains the available communication type options, along \
         with the available support timeframes for the given inputs. \n"]
  language_availability : validated_language_availability option;
      [@ocaml.doc
        "Language availability can be any of the following:\n\n\
        \ {ul\n\
        \       {-   available \n\
        \           \n\
        \            }\n\
        \       {-   best_effort \n\
        \           \n\
        \            }\n\
        \       {-   unavailable \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_create_case_options_request = {
  category_code : category_code;
      [@ocaml.doc
        "The category of problem for the support case. You also use the [DescribeServices] \
         operation to get the category code for a service. Each Amazon Web Services service \
         defines its own set of category codes.\n"]
  language : language;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
  service_code : service_code2;
      [@ocaml.doc
        "The code for the Amazon Web Services service. You can use the [DescribeServices] \
         operation to get the possible [serviceCode] values.\n"]
  issue_type : issue_type;
      [@ocaml.doc
        "The type of issue for the case. You can specify [customer-service] or [technical]. If you \
         don't specify a value, the default is [technical].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_communications_response = {
  next_token : next_token option; [@ocaml.doc "A resumption point for pagination.\n"]
  communications : communication_list option; [@ocaml.doc "The communications for the case.\n"]
}
[@@ocaml.doc "The communications returned by the [DescribeCommunications] operation.\n"]

type nonrec before_time = string [@@ocaml.doc ""]

type nonrec after_time = string [@@ocaml.doc ""]

type nonrec describe_communications_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return before paginating.\n"]
  next_token : next_token option; [@ocaml.doc "A resumption point for pagination.\n"]
  after_time : after_time option;
      [@ocaml.doc
        "The start date for a filtered date search on support case communications. Case \
         communications are available for 12 months after creation.\n"]
  before_time : before_time option;
      [@ocaml.doc
        "The end date for a filtered date search on support case communications. Case \
         communications are available for 12 months after creation.\n"]
  case_id : case_id;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string formatted as shown in this example: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc ""]

type nonrec cc_email_address = string [@@ocaml.doc ""]

type nonrec cc_email_address_list = cc_email_address list [@@ocaml.doc ""]

type nonrec case_details = {
  language : language option;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
  cc_email_addresses : cc_email_address_list option;
      [@ocaml.doc "The email addresses that receive copies of communication about the case.\n"]
  recent_communications : recent_case_communications option;
      [@ocaml.doc
        "The five most recent communications between you and Amazon Web Services Support Center, \
         including the IDs of any attachments to the communications. Also includes a [nextToken] \
         that you can use to retrieve earlier communications.\n"]
  time_created : time_created option;
      [@ocaml.doc "The time that the case was created in the Amazon Web Services Support Center.\n"]
  submitted_by : submitted_by option;
      [@ocaml.doc "The email address of the account that submitted the case.\n"]
  severity_code : severity_code option;
      [@ocaml.doc
        "The code for the severity level returned by the call to [DescribeSeverityLevels].\n"]
  category_code : category_code option;
      [@ocaml.doc "The category of problem for the support case.\n"]
  service_code : service_code option;
      [@ocaml.doc
        "The code for the Amazon Web Services service. You can get a list of codes and the \
         corresponding service names by calling [DescribeServices].\n"]
  status : status option;
      [@ocaml.doc
        "The status of the case.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [all-open] \n\
        \            \n\
        \             }\n\
        \        {-   [customer-action-completed] \n\
        \            \n\
        \             }\n\
        \        {-   [opened] \n\
        \            \n\
        \             }\n\
        \        {-   [pending-customer-action] \n\
        \            \n\
        \             }\n\
        \        {-   [reopened] \n\
        \            \n\
        \             }\n\
        \        {-   [resolved] \n\
        \            \n\
        \             }\n\
        \        {-   [unassigned] \n\
        \            \n\
        \             }\n\
        \        {-   [work-in-progress] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  subject : subject option;
      [@ocaml.doc "The subject line for the case in the Amazon Web Services Support Center.\n"]
  display_id : display_id option;
      [@ocaml.doc
        "The ID displayed for the case in the Amazon Web Services Support Center. This is a \
         numeric string.\n"]
  case_id : case_id option;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string formatted as shown in this example: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc
  "A JSON-formatted object that contains the metadata for a support case. It is contained in the \
   response from a [DescribeCases] request. {b CaseDetails} contains the following fields:\n\n\
  \ {ul\n\
  \       {-   {b caseId} - The support case ID requested or returned in the call. The case ID is \
   an alphanumeric string formatted as shown in this example: case-{i \
   12345678910-2013-c4c1d2bf33c5cf47}.\n\
  \           \n\
  \            }\n\
  \       {-   {b categoryCode} - The category of problem for the support case. Corresponds to the \
   [CategoryCode] values returned by a call to [DescribeServices].\n\
  \           \n\
  \            }\n\
  \       {-   {b displayId} - The identifier for the case on pages in the Amazon Web Services \
   Support Center.\n\
  \           \n\
  \            }\n\
  \       {-   {b language} - The language in which Amazon Web Services Support handles the case. \
   Amazon Web Services Support currently supports Chinese (\226\128\156zh\226\128\157), English \
   (\"en\"), Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO \
   639-1 code for the [language] parameter if you want support in that language.\n\
  \           \n\
  \            }\n\
  \       {-   {b nextToken} - A resumption point for pagination.\n\
  \           \n\
  \            }\n\
  \       {-   {b recentCommunications} - One or more [Communication] objects. Fields of these \
   objects are [attachments], [body], [caseId], [submittedBy], and [timeCreated].\n\
  \           \n\
  \            }\n\
  \       {-   {b serviceCode} - The identifier for the Amazon Web Services service that \
   corresponds to the service code defined in the call to [DescribeServices].\n\
  \           \n\
  \            }\n\
  \       {-   {b severityCode} - The severity code assigned to the case. Contains one of the \
   values returned by the call to [DescribeSeverityLevels]. The possible values are: [low], \
   [normal], [high], [urgent], and [critical].\n\
  \           \n\
  \            }\n\
  \       {-   {b status} - The status of the case in the Amazon Web Services Support Center. \
   Valid values:\n\
  \           \n\
  \            {ul\n\
  \                  {-   [all-open] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [customer-action-completed] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [opened] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [pending-customer-action] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [reopened] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [resolved] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [unassigned] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [work-in-progress] \n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       {-   {b subject} - The subject line of the case.\n\
  \           \n\
  \            }\n\
  \       {-   {b submittedBy} - The email address of the account that submitted the case.\n\
  \           \n\
  \            }\n\
  \       {-   {b timeCreated} - The time the case was created, in ISO-8601 format.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec case_list = case_details list [@@ocaml.doc ""]

type nonrec describe_cases_response = {
  next_token : next_token option; [@ocaml.doc "A resumption point for pagination.\n"]
  cases : case_list option; [@ocaml.doc "The details for the cases that match the request.\n"]
}
[@@ocaml.doc
  "Returns an array of \
   {{:https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html}CaseDetails} \
   objects and a [nextToken] that defines a point for pagination in the result set.\n"]

type nonrec case_id_list = case_id list [@@ocaml.doc ""]

type nonrec describe_cases_request = {
  include_communications : include_communications option;
      [@ocaml.doc
        "Specifies whether to include communications in the [DescribeCases] response. By default, \
         communications are included.\n"]
  language : language option;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return before paginating.\n"]
  next_token : next_token option; [@ocaml.doc "A resumption point for pagination.\n"]
  include_resolved_cases : include_resolved_cases option;
      [@ocaml.doc
        "Specifies whether to include resolved support cases in the [DescribeCases] response. By \
         default, resolved cases aren't included.\n"]
  before_time : before_time option;
      [@ocaml.doc
        "The end date for a filtered date search on support case communications. Case \
         communications are available for 12 months after creation.\n"]
  after_time : after_time option;
      [@ocaml.doc
        "The start date for a filtered date search on support case communications. Case \
         communications are available for 12 months after creation.\n"]
  display_id : display_id option;
      [@ocaml.doc
        "The ID displayed for a case in the Amazon Web Services Support Center user interface.\n"]
  case_id_list : case_id_list option;
      [@ocaml.doc
        "A list of ID numbers of the support cases you want returned. The maximum number of cases \
         is 100.\n"]
}
[@@ocaml.doc ""]

type nonrec data = bytes [@@ocaml.doc ""]

type nonrec attachment = {
  data : data option; [@ocaml.doc "The content of the attachment file.\n"]
  file_name : file_name option; [@ocaml.doc "The name of the attachment file.\n"]
}
[@@ocaml.doc
  "An attachment to a case communication. The attachment consists of the file name and the content \
   of the file. Each attachment file size should not exceed 5 MB. File types that are supported \
   include the following: pdf, jpeg,.doc, .log, .text \n"]

type nonrec describe_attachment_response = {
  attachment : attachment option;
      [@ocaml.doc
        "This object includes the attachment content and file name.\n\n\
        \ In the previous response syntax, the value for the [data] parameter appears as [blob], \
         which is represented as a base64-encoded string. The value for [fileName] is the name of \
         the attachment, such as [troubleshoot-screenshot.png].\n\
        \ "]
}
[@@ocaml.doc
  "The content and file name of the attachment returned by the [DescribeAttachment] operation.\n"]

type nonrec describe_attachment_request = {
  attachment_id : attachment_id;
      [@ocaml.doc
        "The ID of the attachment to return. Attachment IDs are returned by the \
         [DescribeCommunications] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_attachment_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc
        "The limit for the number of [DescribeAttachment] requests in a short period of time has \
         been exceeded.\n"]
}
[@@ocaml.doc
  "The limit for the number of [DescribeAttachment] requests in a short period of time has been \
   exceeded.\n"]

type nonrec attachment_id_not_found = {
  message : error_message option;
      [@ocaml.doc "An attachment with the specified ID could not be found.\n"]
}
[@@ocaml.doc "An attachment with the specified ID could not be found.\n"]

type nonrec create_case_response = {
  case_id : case_id option;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string in the following format: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc
  "The support case ID returned by a successful completion of the [CreateCase] operation.\n"]

type nonrec communication_body = string [@@ocaml.doc ""]

type nonrec attachment_set_id = string [@@ocaml.doc ""]

type nonrec create_case_request = {
  attachment_set_id : attachment_set_id option;
      [@ocaml.doc
        "The ID of a set of one or more attachments for the case. Create the set by using the \
         [AddAttachmentsToSet] operation.\n"]
  issue_type : issue_type option;
      [@ocaml.doc
        "The type of issue for the case. You can specify [customer-service] or [technical]. If you \
         don't specify a value, the default is [technical].\n"]
  language : language option;
      [@ocaml.doc
        "The language in which Amazon Web Services Support handles the case. Amazon Web Services \
         Support currently supports Chinese (\226\128\156zh\226\128\157), English (\"en\"), \
         Japanese (\"ja\") and Korean (\226\128\156ko\226\128\157). You must specify the ISO 639-1 \
         code for the [language] parameter if you want support in that language.\n"]
  cc_email_addresses : cc_email_address_list option;
      [@ocaml.doc
        "A list of email addresses that Amazon Web Services Support copies on case correspondence. \
         Amazon Web Services Support identifies the account that creates the case when you specify \
         your Amazon Web Services credentials in an HTTP POST method or use the \
         {{:http://aws.amazon.com/tools/}Amazon Web Services SDKs}. \n"]
  communication_body : communication_body;
      [@ocaml.doc
        "The communication body text that describes the issue. This text appears in the {b \
         Description} field on the Amazon Web Services Support Center \
         {{:https://console.aws.amazon.com/support/home#/case/create}Create Case} page.\n"]
  category_code : category_code option;
      [@ocaml.doc
        "The category of problem for the support case. You also use the [DescribeServices] \
         operation to get the category code for a service. Each Amazon Web Services service \
         defines its own set of category codes.\n"]
  severity_code : severity_code option;
      [@ocaml.doc
        "A value that indicates the urgency of the case. This value determines the response time \
         according to your service level agreement with Amazon Web Services Support. You can use \
         the [DescribeSeverityLevels] operation to get the possible values for [severityCode]. \n\n\
        \ For more information, see [SeverityLevel] and \
         {{:https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity}Choosing \
         a Severity} in the {i Amazon Web Services Support User Guide}.\n\
        \ \n\
        \   The availability of severity levels depends on the support plan for the Amazon Web \
         Services account.\n\
        \   \n\
        \    "]
  service_code : service_code2 option;
      [@ocaml.doc
        "The code for the Amazon Web Services service. You can use the [DescribeServices] \
         operation to get the possible [serviceCode] values.\n"]
  subject : subject;
      [@ocaml.doc
        "The title of the support case. The title appears in the {b Subject} field on the Amazon \
         Web Services Support Center \
         {{:https://console.aws.amazon.com/support/home#/case/create}Create Case} page.\n"]
}
[@@ocaml.doc ""]

type nonrec case_creation_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc
        "An error message that indicates that you have exceeded the number of cases you can have \
         open.\n"]
}
[@@ocaml.doc "The case creation limit for the account has been exceeded.\n"]

type nonrec attachment_set_id_not_found = {
  message : error_message option;
      [@ocaml.doc "An attachment set with the specified ID could not be found.\n"]
}
[@@ocaml.doc "An attachment set with the specified ID could not be found.\n"]

type nonrec attachment_set_expired = {
  message : error_message option;
      [@ocaml.doc
        "The expiration time of the attachment set has passed. The set expires one hour after it \
         is created.\n"]
}
[@@ocaml.doc
  "The expiration time of the attachment set has passed. The set expires 1 hour after it is created.\n"]

type nonrec attachments = attachment list [@@ocaml.doc ""]

type nonrec attachment_set_size_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc
        "A limit for the size of an attachment set has been exceeded. The limits are three \
         attachments and 5 MB per attachment.\n"]
}
[@@ocaml.doc
  "A limit for the size of an attachment set has been exceeded. The limits are three attachments \
   and 5 MB per attachment.\n"]

type nonrec attachment_limit_exceeded = {
  message : error_message option;
      [@ocaml.doc
        "The limit for the number of attachment sets created in a short period of time has been \
         exceeded.\n"]
}
[@@ocaml.doc
  "The limit for the number of attachment sets created in a short period of time has been exceeded.\n"]

type nonrec add_communication_to_case_response = {
  result_ : result_ option;
      [@ocaml.doc "True if [AddCommunicationToCase] succeeds. Otherwise, returns an error.\n"]
}
[@@ocaml.doc "The result of the [AddCommunicationToCase] operation.\n"]

type nonrec add_communication_to_case_request = {
  attachment_set_id : attachment_set_id option;
      [@ocaml.doc
        "The ID of a set of one or more attachments for the communication to add to the case. \
         Create the set by calling [AddAttachmentsToSet] \n"]
  cc_email_addresses : cc_email_address_list option;
      [@ocaml.doc
        "The email addresses in the CC line of an email to be added to the support case.\n"]
  communication_body : communication_body;
      [@ocaml.doc "The body of an email communication to add to the support case.\n"]
  case_id : case_id option;
      [@ocaml.doc
        "The support case ID requested or returned in the call. The case ID is an alphanumeric \
         string formatted as shown in this example: case-{i 12345678910-2013-c4c1d2bf33c5cf47} \n"]
}
[@@ocaml.doc ""]

type nonrec add_attachments_to_set_response = {
  expiry_time : expiry_time option;
      [@ocaml.doc "The time and date when the attachment set expires.\n"]
  attachment_set_id : attachment_set_id option;
      [@ocaml.doc
        "The ID of the attachment set. If an [attachmentSetId] was not specified, a new attachment \
         set is created, and the ID of the set is returned in the response. If an \
         [attachmentSetId] was specified, the attachments are added to the specified set, if it \
         exists.\n"]
}
[@@ocaml.doc
  "The ID and expiry time of the attachment set returned by the [AddAttachmentsToSet] operation.\n"]

type nonrec add_attachments_to_set_request = {
  attachments : attachments;
      [@ocaml.doc
        "One or more attachments to add to the set. You can add up to three attachments per set. \
         The size limit is 5 MB per attachment.\n\n\
        \ In the [Attachment] object, use the [data] parameter to specify the contents of the \
         attachment file. In the previous request syntax, the value for [data] appear as [blob], \
         which is represented as a base64-encoded string. The value for [fileName] is the name of \
         the attachment, such as [troubleshoot-screenshot.png].\n\
        \ "]
  attachment_set_id : attachment_set_id option;
      [@ocaml.doc
        "The ID of the attachment set. If an [attachmentSetId] is not specified, a new attachment \
         set is created, and the ID of the set is returned in the response. If an \
         [attachmentSetId] is specified, the attachments are added to the specified set, if it \
         exists.\n"]
}
[@@ocaml.doc ""]
