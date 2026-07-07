type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec account_plan_type = PAID [@ocaml.doc ""] | FREE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec account_plan_status =
  | EXPIRED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec upgrade_account_plan_response = {
  account_plan_status : account_plan_status;
      [@ocaml.doc " This indicates the latest state of the account plan within its lifecycle. \n"]
  account_plan_type : account_plan_type; [@ocaml.doc " The type of plan for the account. \n"]
  account_id : account_id; [@ocaml.doc " A unique identifier that identifies the account. \n"]
}
[@@ocaml.doc ""]

type nonrec upgrade_account_plan_request = {
  account_plan_type : account_plan_type;
      [@ocaml.doc
        " The target account plan type. This makes it explicit about the change and latest value \
         of the [accountPlanType]. \n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc " This exception is thrown when the requested resource cannot be found. \n"]

type nonrec internal_server_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc "An unexpected error occurred during the processing of your request.\n"]

type nonrec access_denied_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc " You don't have sufficient access to perform this action. \n"]

type nonrec next_page_token = string [@@ocaml.doc ""]

type nonrec generic_double = float [@@ocaml.doc ""]

type nonrec currency_code = USD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec monetary_amount = {
  unit_ : currency_code; [@ocaml.doc " The unit that the monetary amount is given in. \n"]
  amount : generic_double; [@ocaml.doc " The aggregated monetary amount of credits earned. \n"]
}
[@@ocaml.doc " The monetary amount of the credit. \n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec match_option =
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_options = match_option list [@@ocaml.doc ""]

type nonrec activity_id = string [@@ocaml.doc ""]

type nonrec activity_reward =
  | Credit of monetary_amount [@ocaml.doc " The credits gained by activity rewards. \n"]
[@@ocaml.doc " The summary of the rewards granted as a result of activities completed. \n"]

type nonrec activity_status =
  | EXPIRING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec activity_summary = {
  status : activity_status; [@ocaml.doc " The current status of the activity. \n"]
  reward : activity_reward; [@ocaml.doc " The reward for the activity. \n"]
  title : generic_string; [@ocaml.doc " The title of the activity. \n"]
  activity_id : activity_id; [@ocaml.doc " A unique identifier that identifies the activity. \n"]
}
[@@ocaml.doc " The summary of activities. \n"]

type nonrec activities = activity_summary list [@@ocaml.doc ""]

type nonrec list_account_activities_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        " The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return. \n"]
  activities : activities; [@ocaml.doc " A brief information about the activities. \n"]
}
[@@ocaml.doc ""]

type nonrec filter_activity_statuses = activity_status list [@@ocaml.doc ""]

type nonrec language_code =
  | TR_TR [@ocaml.doc ""]
  | ZH_TW [@ocaml.doc ""]
  | ZH_CN [@ocaml.doc ""]
  | KO_KR [@ocaml.doc ""]
  | PT_PT [@ocaml.doc ""]
  | IT_IT [@ocaml.doc ""]
  | JA_JP [@ocaml.doc ""]
  | FR_FR [@ocaml.doc ""]
  | ES_ES [@ocaml.doc ""]
  | DE_DE [@ocaml.doc ""]
  | ID_ID [@ocaml.doc ""]
  | EN_GB [@ocaml.doc ""]
  | EN_US [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_account_activities_request = {
  language_code : language_code option;
      [@ocaml.doc " The language code used to return translated titles. \n"]
  max_results : max_results option;
      [@ocaml.doc
        " The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output. \n"]
  next_token : next_page_token option;
      [@ocaml.doc
        " A token from a previous paginated response. If this is specified, the response includes \
         records beginning from this token (inclusive), up to the number specified by \
         [maxResults]. \n"]
  filter_activity_statuses : filter_activity_statuses option;
      [@ocaml.doc
        " The activity status filter. This field can be used to filter the response by activities \
         status. \n"]
}
[@@ocaml.doc ""]

type nonrec free_tier_usage = {
  free_tier_type : generic_string option;
      [@ocaml.doc
        "Describes the type of the Free Tier offer. For example, the offer can be [\"12 Months \
         Free\"], [\"Always Free\"], and [\"Free Trial\"].\n"]
  description : generic_string option; [@ocaml.doc "The description of the Free Tier offer.\n"]
  unit_ : generic_string option;
      [@ocaml.doc "Describes the unit of the [usageType], such as [Hrs].\n"]
  limit : generic_double option; [@ocaml.doc "Describes the maximum usage allowed in Free Tier.\n"]
  forecasted_usage_amount : generic_double option;
      [@ocaml.doc "Describes the forecasted usage by the month that you're expected to use.\n"]
  actual_usage_amount : generic_double option;
      [@ocaml.doc
        "Describes the actual usage accrued month-to-day (MTD) that you've used so far.\n"]
  region : generic_string option;
      [@ocaml.doc "Describes the Amazon Web Services Region for which this offer is applicable\n"]
  usage_type : generic_string option;
      [@ocaml.doc
        "Describes the usage details of the offer. For example, this might be \
         [Global-BoxUsage:freetrial].\n"]
  operation : generic_string option;
      [@ocaml.doc
        "Describes [usageType] more granularly with the specific Amazon Web Services service API \
         operation. For example, this can be the [RunInstances] API operation for Amazon Elastic \
         Compute Cloud.\n"]
  service : generic_string option;
      [@ocaml.doc
        "The name of the Amazon Web Services service providing the Free Tier offer. For example, \
         this can be Amazon Elastic Compute Cloud.\n"]
}
[@@ocaml.doc
  "Consists of a Amazon Web Services Free Tier offer\226\128\153s metadata and your data usage for \
   the offer.\n"]

type nonrec free_tier_usages = free_tier_usage list [@@ocaml.doc ""]

type nonrec get_free_tier_usage_response = {
  next_token : next_page_token option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  free_tier_usages : free_tier_usages;
      [@ocaml.doc "The list of Free Tier usage objects that meet your filter expression.\n"]
}
[@@ocaml.doc ""]

type nonrec dimension =
  | USAGE_PERCENTAGE [@ocaml.doc ""]
  | DESCRIPTION [@ocaml.doc ""]
  | FREE_TIER_TYPE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dimension_values = {
  match_options : match_options;
      [@ocaml.doc
        "The match options that you can use to filter your results. You can specify only one of \
         these values in the array.\n"]
  values : values;
      [@ocaml.doc
        "The metadata values you can specify to filter upon, so that the results all match at \
         least one of the specified values.\n"]
  key : dimension; [@ocaml.doc "The name of the dimension that you want to filter on.\n"]
}
[@@ocaml.doc "Contains the specifications for the filters to use for your request.\n"]

type expression = {
  dimensions : dimension_values option;
      [@ocaml.doc "The specific dimension, values, and match type to filter objects with.\n"]
  not : expression option;
      [@ocaml.doc
        "Return results that don\226\128\153t match the [Expression] that you specified.\n"]
  and_ : expressions option;
      [@ocaml.doc "Return results that match all [Expressions] that you specified in the array.\n"]
  \#or : expressions option;
      [@ocaml.doc
        "Return results that match any of the [Expressions] that you specified. in the array.\n"]
}
[@@ocaml.doc
  "Use [Expression] to filter in the [GetFreeTierUsage] API operation.\n\n\
  \ You can use the following patterns:\n\
  \ \n\
  \  {ul\n\
  \        {-  Simple dimension values ([Dimensions] root operator)\n\
  \            \n\
  \             }\n\
  \        {-  Complex expressions with logical operators ([AND], [NOT], and [OR] root operators).\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For {i simple dimension values}, you can set the dimension name, values, and match type for \
   the filters that you plan to use.\n\
  \   \n\
  \     {b Example for simple dimension values} \n\
  \    \n\
  \     You can filter to match exactly for [REGION==us-east-1 OR REGION==us-west-1].\n\
  \     \n\
  \      The corresponding [Expression] appears like the following: [{ \"Dimensions\": { \"Key\": \
   \"REGION\", \"Values\": \\[ \"us-east-1\", \"us-west-1\" \\], \"MatchOptions\": \
   \\[\"EQUALS\"\\] } }] \n\
  \      \n\
  \       As shown in the previous example, lists of dimension values are combined with [OR] when \
   you apply the filter.\n\
  \       \n\
  \        For {i complex expressions with logical operators}, you can have nested expressions to \
   use the logical operators and specify advanced filtering.\n\
  \        \n\
  \          {b Example for complex expressions with logical operators} \n\
  \         \n\
  \          You can filter by [((REGION == us-east-1 OR REGION == us-west-1) OR (SERVICE CONTAINS \
   AWSLambda)) AND (USAGE_TYPE !CONTAINS DataTransfer)].\n\
  \          \n\
  \           The corresponding [Expression] appears like the following: [{ \"And\": \\[ {\"Or\": \
   \\[ {\"Dimensions\": { \"Key\": \"REGION\", \"Values\": \\[ \"us-east-1\", \"us-west-1\" \\], \
   \"MatchOptions\": \\[\"EQUALS\"\\] }}, {\"Dimensions\": { \"Key\": \"SERVICE\", \"Values\": \
   \\[\"AWSLambda\"\\], \"MatchOptions\": \\[\"CONTAINS\"\\] } } \\]}, {\"Not\": {\"Dimensions\": \
   { \"Key\": \"USAGE_TYPE\", \"Values\": \\[\"DataTransfer\"\\], \"MatchOptions\": \
   \\[\"CONTAINS\"\\] }}} \\] }] \n\
  \           \n\
  \            In the following {b Contents}, you must specify exactly one of the following root \
   operators.\n\
  \            "]

and expressions = expression list [@@ocaml.doc ""]

type nonrec get_free_tier_usage_request = {
  next_token : next_page_token option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return in the response. [MaxResults] means that there \
         can be up to the specified number of values, but there might be fewer results based on \
         your filters.\n"]
  filter : expression option;
      [@ocaml.doc
        "An expression that specifies the conditions that you want each [FreeTierUsage] object to \
         meet.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_plan_state_response = {
  account_plan_expiration_date : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp for when the current account plan expires. \n"]
  account_plan_remaining_credits : monetary_amount option;
      [@ocaml.doc " The amount of credits remaining for the account. \n"]
  account_plan_status : account_plan_status;
      [@ocaml.doc " The current status for the account plan. \n"]
  account_plan_type : account_plan_type; [@ocaml.doc " The plan type for the account. \n"]
  account_id : account_id; [@ocaml.doc " A unique identifier that identifies the account. \n"]
}
[@@ocaml.doc ""]

type nonrec get_account_plan_state_request = unit [@@ocaml.doc ""]

type nonrec get_account_activity_response = {
  completed_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        " The timestamp when the activity is completed. This field appears only for activities in \
         the [COMPLETED] state. \n"]
  started_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        " The timestamp when the activity started. This field appears only for activities in the \
         [IN_PROGRESS] or [COMPLETED] states. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The time by which the activity must be completed to receive a reward. \n"]
  estimated_time_to_complete_in_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " The estimated time to complete the activity. This is the duration in minutes. \n"]
  reward : activity_reward; [@ocaml.doc " A reward granted upon activity completion. \n"]
  instructions_url : generic_string;
      [@ocaml.doc
        " The URL resource that provides guidance on activity requirements and completion. \n"]
  status : activity_status; [@ocaml.doc " The current activity status. \n"]
  description : generic_string;
      [@ocaml.doc " Provides detailed information about the activity and its expected outcomes. \n"]
  title : generic_string; [@ocaml.doc " A short activity title. \n"]
  activity_id : activity_id; [@ocaml.doc " A unique identifier that identifies the activity. \n"]
}
[@@ocaml.doc ""]

type nonrec get_account_activity_request = {
  language_code : language_code option;
      [@ocaml.doc " The language code used to return translated title and description fields. \n"]
  activity_id : activity_id; [@ocaml.doc " A unique identifier that identifies the activity. \n"]
}
[@@ocaml.doc ""]
