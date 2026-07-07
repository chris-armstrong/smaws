open Types

module AddAttachmentsToSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AttachmentLimitExceeded of attachment_limit_exceeded
    | `AttachmentSetExpired of attachment_set_expired
    | `AttachmentSetIdNotFound of attachment_set_id_not_found
    | `AttachmentSetSizeLimitExceeded of attachment_set_size_limit_exceeded
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_attachments_to_set_request ->
    ( add_attachments_to_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentLimitExceeded of attachment_limit_exceeded
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `AttachmentSetSizeLimitExceeded of attachment_set_size_limit_exceeded
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_attachments_to_set_request ->
    ( add_attachments_to_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentLimitExceeded of attachment_limit_exceeded
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `AttachmentSetSizeLimitExceeded of attachment_set_size_limit_exceeded
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more attachments to an attachment set. \n\n\
  \ An attachment set is a temporary container for attachments that you add to a case or case \
   communication. The set is available for 1 hour after it's created. The [expiryTime] returned in \
   the response is when the set expires. \n\
  \ \n\
  \   {ul\n\
  \         {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \             \n\
  \              }\n\
  \         {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module AddCommunicationToCase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AttachmentSetExpired of attachment_set_expired
    | `AttachmentSetIdNotFound of attachment_set_id_not_found
    | `CaseIdNotFound of case_id_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_communication_to_case_request ->
    ( add_communication_to_case_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_communication_to_case_request ->
    ( add_communication_to_case_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds additional customer communication to an Amazon Web Services Support case. Use the [caseId] \
   parameter to identify the case to which to add communication. You can list a set of email \
   addresses to copy on the communication by using the [ccEmailAddresses] parameter. The \
   [communicationBody] value contains the text of the communication.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module CreateCase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AttachmentSetExpired of attachment_set_expired
    | `AttachmentSetIdNotFound of attachment_set_id_not_found
    | `CaseCreationLimitExceeded of case_creation_limit_exceeded
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_case_request ->
    ( create_case_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `CaseCreationLimitExceeded of case_creation_limit_exceeded
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_case_request ->
    ( create_case_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentSetExpired of attachment_set_expired
      | `AttachmentSetIdNotFound of attachment_set_id_not_found
      | `CaseCreationLimitExceeded of case_creation_limit_exceeded
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a case in the Amazon Web Services Support Center. This operation is similar to how you \
   create a case in the Amazon Web Services Support Center \
   {{:https://console.aws.amazon.com/support/home#/case/create}Create Case} page.\n\n\
  \ The Amazon Web Services Support API doesn't support requesting service limit increases. You \
   can submit a service limit increase in the following ways: \n\
  \ \n\
  \  {ul\n\
  \        {-  Submit a request from the Amazon Web Services Support Center \
   {{:https://console.aws.amazon.com/support/home#/case/create}Create Case} page.\n\
  \            \n\
  \             }\n\
  \        {-  Use the Service Quotas \
   {{:https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_RequestServiceQuotaIncrease.html}RequestServiceQuotaIncrease} \
   operation.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   A successful [CreateCase] request returns an Amazon Web Services Support case number. You \
   can use the [DescribeCases] operation and specify the case number to get existing Amazon Web \
   Services Support cases. After you create a case, use the [AddCommunicationToCase] operation to \
   add additional communication or attachments to an existing case.\n\
  \   \n\
  \    The [caseId] is separate from the [displayId] that appears in the \
   {{:https://console.aws.amazon.com/support}Amazon Web Services Support Center}. Use the \
   [DescribeCases] operation to get the [displayId].\n\
  \    \n\
  \      {ul\n\
  \            {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \                \n\
  \                 }\n\
  \            {-  If you call the Amazon Web Services Support API from an account that doesn't \
   have a Business, Enterprise On-Ramp, or Enterprise Support plan, the \
   [SubscriptionRequiredException] error message appears. For information about changing your \
   support plan, see {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   "]

module DescribeAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AttachmentIdNotFound of attachment_id_not_found
    | `DescribeAttachmentLimitExceeded of describe_attachment_limit_exceeded
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_attachment_request ->
    ( describe_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentIdNotFound of attachment_id_not_found
      | `DescribeAttachmentLimitExceeded of describe_attachment_limit_exceeded
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_attachment_request ->
    ( describe_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AttachmentIdNotFound of attachment_id_not_found
      | `DescribeAttachmentLimitExceeded of describe_attachment_limit_exceeded
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the attachment that has the specified ID. Attachments can include screenshots, error \
   logs, or other files that describe your issue. Attachment IDs are generated by the case \
   management system when you add an attachment to a case or case communication. Attachment IDs \
   are returned in the [AttachmentDetails] objects that are returned by the \
   [DescribeCommunications] operation.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module DescribeCases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CaseIdNotFound of case_id_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cases_request ->
    ( describe_cases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cases_request ->
    ( describe_cases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of cases that you specify by passing one or more case IDs. You can use the \
   [afterTime] and [beforeTime] parameters to filter the cases by date. You can set values for the \
   [includeResolvedCases] and [includeCommunications] parameters to specify how much information \
   to return.\n\n\
  \ The response returns the following in JSON format:\n\
  \ \n\
  \  {ul\n\
  \        {-  One or more \
   {{:https://docs.aws.amazon.com/awssupport/latest/APIReference/API_CaseDetails.html}CaseDetails} \
   data types.\n\
  \            \n\
  \             }\n\
  \        {-  One or more [nextToken] values, which specify where to paginate the returned \
   records represented by the [CaseDetails] objects.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Case data is available for 12 months after creation. If a case was created more than 12 \
   months ago, a request might return an error.\n\
  \   \n\
  \     {ul\n\
  \           {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \               \n\
  \                }\n\
  \           {-  If you call the Amazon Web Services Support API from an account that doesn't \
   have a Business, Enterprise On-Ramp, or Enterprise Support plan, the \
   [SubscriptionRequiredException] error message appears. For information about changing your \
   support plan, see {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module DescribeCommunications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CaseIdNotFound of case_id_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_communications_request ->
    ( describe_communications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_communications_request ->
    ( describe_communications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns communications and attachments for one or more support cases. Use the [afterTime] and \
   [beforeTime] parameters to filter by date. You can use the [caseId] parameter to restrict the \
   results to a specific case.\n\n\
  \ Case data is available for 12 months after creation. If a case was created more than 12 months \
   ago, a request for data might cause an error.\n\
  \ \n\
  \  You can use the [maxResults] and [nextToken] parameters to control the pagination of the \
   results. Set [maxResults] to the number of cases that you want to display on each page, and use \
   [nextToken] to specify the resumption of pagination.\n\
  \  \n\
  \    {ul\n\
  \          {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \              \n\
  \               }\n\
  \          {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DescribeCreateCaseOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_create_case_options_request ->
    ( describe_create_case_options_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_create_case_options_request ->
    ( describe_create_case_options_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of CreateCaseOption types along with the corresponding supported hours and \
   language availability. You can specify the [language] [categoryCode], [issueType] and \
   [serviceCode] used to retrieve the CreateCaseOptions.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module DescribeServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the current list of Amazon Web Services services and a list of service categories for \
   each service. You then use service names and categories in your [CreateCase] requests. Each \
   Amazon Web Services service has its own set of categories.\n\n\
  \ The service codes and category codes correspond to the values that appear in the {b Service} \
   and {b Category} lists on the Amazon Web Services Support Center \
   {{:https://console.aws.amazon.com/support/home#/case/create}Create Case} page. The values in \
   those fields don't necessarily match the service codes and categories returned by the \
   [DescribeServices] operation. Always use the service codes and categories that the \
   [DescribeServices] operation returns, so that you have the most recent set of service and \
   category codes.\n\
  \ \n\
  \   {ul\n\
  \         {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \             \n\
  \              }\n\
  \         {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DescribeSeverityLevels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_severity_levels_request ->
    ( describe_severity_levels_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_severity_levels_request ->
    ( describe_severity_levels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of severity levels that you can assign to a support case. The severity level \
   for a case is also a field in the [CaseDetails] data type that you include for a [CreateCase] \
   request.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module DescribeSupportedLanguages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_supported_languages_request ->
    ( describe_supported_languages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_supported_languages_request ->
    ( describe_supported_languages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of supported languages for a specified [categoryCode], [issueType] and \
   [serviceCode]. The returned supported languages will include a ISO 639-1 code for the \
   [language], and the language display name.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module DescribeTrustedAdvisorCheckRefreshStatuses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_refresh_statuses_request ->
    ( describe_trusted_advisor_check_refresh_statuses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_refresh_statuses_request ->
    ( describe_trusted_advisor_check_refresh_statuses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. You \
   can get the check IDs by calling the [DescribeTrustedAdvisorChecks] operation.\n\n\
  \ Some checks are refreshed automatically, and you can't return their refresh statuses by using \
   the [DescribeTrustedAdvisorCheckRefreshStatuses] operation. If you call this operation for \
   these checks, you might see an [InvalidParameterValue] error.\n\
  \ \n\
  \   {ul\n\
  \         {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \             \n\
  \              }\n\
  \         {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use \
   the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) \
   endpoints don't support the Trusted Advisor operations. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint}About the \
   Amazon Web Services Support API} in the {i Amazon Web Services Support User Guide}.\n\
  \    "]

module DescribeTrustedAdvisorCheckResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_result_request ->
    ( describe_trusted_advisor_check_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_result_request ->
    ( describe_trusted_advisor_check_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the results of the Trusted Advisor check that has the specified check ID. You can get \
   the check IDs by calling the [DescribeTrustedAdvisorChecks] operation.\n\n\
  \ The response contains a [TrustedAdvisorCheckResult] object, which contains these three objects:\n\
  \ \n\
  \  {ul\n\
  \        {-   [TrustedAdvisorCategorySpecificSummary] \n\
  \            \n\
  \             }\n\
  \        {-   [TrustedAdvisorResourceDetail] \n\
  \            \n\
  \             }\n\
  \        {-   [TrustedAdvisorResourcesSummary] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   In addition, the response contains these fields:\n\
  \   \n\
  \    {ul\n\
  \          {-   {b status} - The alert status of the check can be [ok] (green), [warning] \
   (yellow), [error] (red), or [not_available].\n\
  \              \n\
  \               }\n\
  \          {-   {b timestamp} - The time of the last refresh of the check.\n\
  \              \n\
  \               }\n\
  \          {-   {b checkId} - The unique identifier for the check.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {ul\n\
  \          {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \              \n\
  \               }\n\
  \          {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use \
   the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) \
   endpoints don't support the Trusted Advisor operations. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint}About the \
   Amazon Web Services Support API} in the {i Amazon Web Services Support User Guide}.\n\
  \    "]

module DescribeTrustedAdvisorCheckSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_summaries_request ->
    ( describe_trusted_advisor_check_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_check_summaries_request ->
    ( describe_trusted_advisor_check_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the results for the Trusted Advisor check summaries for the check IDs that you \
   specified. You can get the check IDs by calling the [DescribeTrustedAdvisorChecks] operation.\n\n\
  \ The response contains an array of [TrustedAdvisorCheckSummary] objects.\n\
  \ \n\
  \   {ul\n\
  \         {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \             \n\
  \              }\n\
  \         {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use \
   the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) \
   endpoints don't support the Trusted Advisor operations. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint}About the \
   Amazon Web Services Support API} in the {i Amazon Web Services Support User Guide}.\n\
  \    "]

module DescribeTrustedAdvisorChecks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_checks_request ->
    ( describe_trusted_advisor_checks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trusted_advisor_checks_request ->
    ( describe_trusted_advisor_checks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all available Trusted Advisor checks, including the name, ID, \
   category, description, and metadata. You must specify a language code.\n\n\
  \ The response contains a [TrustedAdvisorCheckDescription] object for each check. You must set \
   the Amazon Web Services Region to us-east-1.\n\
  \ \n\
  \   {ul\n\
  \         {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \             \n\
  \              }\n\
  \         {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \             \n\
  \              }\n\
  \         {-  The names and descriptions for Trusted Advisor checks are subject to change. We \
   recommend that you specify the check ID in your code to uniquely identify a check.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use \
   the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) \
   endpoints don't support the Trusted Advisor operations. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint}About the \
   Amazon Web Services Support API} in the {i Amazon Web Services Support User Guide}.\n\
  \    "]

module RefreshTrustedAdvisorCheck : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    refresh_trusted_advisor_check_request ->
    ( refresh_trusted_advisor_check_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    refresh_trusted_advisor_check_request ->
    ( refresh_trusted_advisor_check_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Refreshes the Trusted Advisor check that you specify using the check ID. You can get the check \
   IDs by calling the [DescribeTrustedAdvisorChecks] operation.\n\n\
  \ Some checks are refreshed automatically. If you call the [RefreshTrustedAdvisorCheck] \
   operation to refresh them, you might see the [InvalidParameterValue] error.\n\
  \ \n\
  \  The response contains a [TrustedAdvisorCheckRefreshStatus] object.\n\
  \  \n\
  \    {ul\n\
  \          {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use \
   the Amazon Web Services Support API. \n\
  \              \n\
  \               }\n\
  \          {-  If you call the Amazon Web Services Support API from an account that doesn't have \
   a Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use \
   the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) \
   endpoints don't support the Trusted Advisor operations. For more information, see \
   {{:https://docs.aws.amazon.com/awssupport/latest/user/about-support-api.html#endpoint}About the \
   Amazon Web Services Support API} in the {i Amazon Web Services Support User Guide}.\n\
  \    "]

module ResolveCase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CaseIdNotFound of case_id_not_found
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resolve_case_request ->
    ( resolve_case_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resolve_case_request ->
    ( resolve_case_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CaseIdNotFound of case_id_not_found
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resolves a support case. This operation takes a [caseId] and returns the initial and final \
   state of the case.\n\n\
  \  {ul\n\
  \        {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the \
   Amazon Web Services Support API. \n\
  \            \n\
  \             }\n\
  \        {-  If you call the Amazon Web Services Support API from an account that doesn't have a \
   Business, Enterprise On-Ramp, or Enterprise Support plan, the [SubscriptionRequiredException] \
   error message appears. For information about changing your support plan, see \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]
