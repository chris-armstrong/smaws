type nonrec double = float [@@ocaml.doc ""]

type nonrec operation =
  | ADD [@ocaml.doc ""]
  | SUBTRACT [@ocaml.doc ""]
  | MULTIPLY [@ocaml.doc ""]
  | DIVIDE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec action = {
  attribute_name : name;
      [@ocaml.doc
        "The related time series that you are modifying. This value is case insensitive.\n"]
  operation : operation;
      [@ocaml.doc
        "The operation that is applied to the provided attribute. Operations include:\n\n\
        \ {ul\n\
        \       {-   [ADD] - adds [Value] to all rows of [AttributeName].\n\
        \           \n\
        \            }\n\
        \       {-   [SUBTRACT] - subtracts [Value] from all rows of [AttributeName].\n\
        \           \n\
        \            }\n\
        \       {-   [MULTIPLY] - multiplies all rows of [AttributeName] by [Value].\n\
        \           \n\
        \            }\n\
        \       {-   [DIVIDE] - divides all rows of [AttributeName] by [Value].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  value : double; [@ocaml.doc "The value that is applied for the chosen [Operation].\n"]
}
[@@ocaml.doc
  "Defines the modifications that you are making to an attribute for a what-if forecast. For \
   example, you can use this operation to create a what-if forecast that investigates a 10% off \
   sale on all shoes. To do this, you specify [\"AttributeName\": \"shoes\"], [\"Operation\": \
   \"MULTIPLY\"], and [\"Value\": \"0.90\"]. Pair this operation with the [TimeSeriesCondition] \
   operation within the [CreateWhatIfForecastRequest$TimeSeriesTransformations] operation to \
   define a subset of attribute items that are modified.\n"]

type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec configuration = (name * values) list [@@ocaml.doc ""]

type nonrec additional_dataset = {
  name : name;
      [@ocaml.doc
        "The name of the additional dataset. Valid names: [\"holiday\"] and [\"weather\"].\n"]
  configuration : configuration option;
      [@ocaml.doc
        " {b Weather Index} \n\n\
        \ To enable the Weather Index, do not specify a value for [Configuration].\n\
        \ \n\
        \   {b Holidays} \n\
        \  \n\
        \    {b Holidays} \n\
        \   \n\
        \    To enable Holidays, set [CountryCode] to one of the following two-letter country codes:\n\
        \    \n\
        \     {ul\n\
        \           {-  \"AL\" - ALBANIA\n\
        \               \n\
        \                }\n\
        \           {-  \"AR\" - ARGENTINA\n\
        \               \n\
        \                }\n\
        \           {-  \"AT\" - AUSTRIA\n\
        \               \n\
        \                }\n\
        \           {-  \"AU\" - AUSTRALIA\n\
        \               \n\
        \                }\n\
        \           {-  \"BA\" - BOSNIA HERZEGOVINA\n\
        \               \n\
        \                }\n\
        \           {-  \"BE\" - BELGIUM\n\
        \               \n\
        \                }\n\
        \           {-  \"BG\" - BULGARIA\n\
        \               \n\
        \                }\n\
        \           {-  \"BO\" - BOLIVIA\n\
        \               \n\
        \                }\n\
        \           {-  \"BR\" - BRAZIL\n\
        \               \n\
        \                }\n\
        \           {-  \"BY\" - BELARUS\n\
        \               \n\
        \                }\n\
        \           {-  \"CA\" - CANADA\n\
        \               \n\
        \                }\n\
        \           {-  \"CL\" - CHILE\n\
        \               \n\
        \                }\n\
        \           {-  \"CO\" - COLOMBIA\n\
        \               \n\
        \                }\n\
        \           {-  \"CR\" - COSTA RICA\n\
        \               \n\
        \                }\n\
        \           {-  \"HR\" - CROATIA\n\
        \               \n\
        \                }\n\
        \           {-  \"CZ\" - CZECH REPUBLIC\n\
        \               \n\
        \                }\n\
        \           {-  \"DK\" - DENMARK\n\
        \               \n\
        \                }\n\
        \           {-  \"EC\" - ECUADOR\n\
        \               \n\
        \                }\n\
        \           {-  \"EE\" - ESTONIA\n\
        \               \n\
        \                }\n\
        \           {-  \"ET\" - ETHIOPIA\n\
        \               \n\
        \                }\n\
        \           {-  \"FI\" - FINLAND\n\
        \               \n\
        \                }\n\
        \           {-  \"FR\" - FRANCE\n\
        \               \n\
        \                }\n\
        \           {-  \"DE\" - GERMANY\n\
        \               \n\
        \                }\n\
        \           {-  \"GR\" - GREECE\n\
        \               \n\
        \                }\n\
        \           {-  \"HU\" - HUNGARY\n\
        \               \n\
        \                }\n\
        \           {-  \"IS\" - ICELAND\n\
        \               \n\
        \                }\n\
        \           {-  \"IN\" - INDIA\n\
        \               \n\
        \                }\n\
        \           {-  \"IE\" - IRELAND\n\
        \               \n\
        \                }\n\
        \           {-  \"IT\" - ITALY\n\
        \               \n\
        \                }\n\
        \           {-  \"JP\" - JAPAN\n\
        \               \n\
        \                }\n\
        \           {-  \"KZ\" - KAZAKHSTAN\n\
        \               \n\
        \                }\n\
        \           {-  \"KR\" - KOREA\n\
        \               \n\
        \                }\n\
        \           {-  \"LV\" - LATVIA\n\
        \               \n\
        \                }\n\
        \           {-  \"LI\" - LIECHTENSTEIN\n\
        \               \n\
        \                }\n\
        \           {-  \"LT\" - LITHUANIA\n\
        \               \n\
        \                }\n\
        \           {-  \"LU\" - LUXEMBOURG\n\
        \               \n\
        \                }\n\
        \           {-  \"MK\" - MACEDONIA\n\
        \               \n\
        \                }\n\
        \           {-  \"MT\" - MALTA\n\
        \               \n\
        \                }\n\
        \           {-  \"MX\" - MEXICO\n\
        \               \n\
        \                }\n\
        \           {-  \"MD\" - MOLDOVA\n\
        \               \n\
        \                }\n\
        \           {-  \"ME\" - MONTENEGRO\n\
        \               \n\
        \                }\n\
        \           {-  \"NL\" - NETHERLANDS\n\
        \               \n\
        \                }\n\
        \           {-  \"NZ\" - NEW ZEALAND\n\
        \               \n\
        \                }\n\
        \           {-  \"NI\" - NICARAGUA\n\
        \               \n\
        \                }\n\
        \           {-  \"NG\" - NIGERIA\n\
        \               \n\
        \                }\n\
        \           {-  \"NO\" - NORWAY\n\
        \               \n\
        \                }\n\
        \           {-  \"PA\" - PANAMA\n\
        \               \n\
        \                }\n\
        \           {-  \"PY\" - PARAGUAY\n\
        \               \n\
        \                }\n\
        \           {-  \"PE\" - PERU\n\
        \               \n\
        \                }\n\
        \           {-  \"PL\" - POLAND\n\
        \               \n\
        \                }\n\
        \           {-  \"PT\" - PORTUGAL\n\
        \               \n\
        \                }\n\
        \           {-  \"RO\" - ROMANIA\n\
        \               \n\
        \                }\n\
        \           {-  \"RU\" - RUSSIA\n\
        \               \n\
        \                }\n\
        \           {-  \"RS\" - SERBIA\n\
        \               \n\
        \                }\n\
        \           {-  \"SK\" - SLOVAKIA\n\
        \               \n\
        \                }\n\
        \           {-  \"SI\" - SLOVENIA\n\
        \               \n\
        \                }\n\
        \           {-  \"ZA\" - SOUTH AFRICA\n\
        \               \n\
        \                }\n\
        \           {-  \"ES\" - SPAIN\n\
        \               \n\
        \                }\n\
        \           {-  \"SE\" - SWEDEN\n\
        \               \n\
        \                }\n\
        \           {-  \"CH\" - SWITZERLAND\n\
        \               \n\
        \                }\n\
        \           {-  \"UA\" - UKRAINE\n\
        \               \n\
        \                }\n\
        \           {-  \"AE\" - UNITED ARAB EMIRATES\n\
        \               \n\
        \                }\n\
        \           {-  \"US\" - UNITED STATES\n\
        \               \n\
        \                }\n\
        \           {-  \"UK\" - UNITED KINGDOM\n\
        \               \n\
        \                }\n\
        \           {-  \"UY\" - URUGUAY\n\
        \               \n\
        \                }\n\
        \           {-  \"VE\" - VENEZUELA\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc
  "Describes an additional dataset. This object is part of the [DataConfig] object. Forecast \
   supports the Weather Index and Holidays additional datasets.\n\n\
  \  {b Weather Index} \n\
  \ \n\
  \  The Amazon Forecast Weather Index is a built-in dataset that incorporates historical and \
   projected weather information into your model. The Weather Index supplements your datasets with \
   over two years of historical weather data and up to 14 days of projected weather data. For more \
   information, see {{:https://docs.aws.amazon.com/forecast/latest/dg/weather.html}Amazon Forecast \
   Weather Index}.\n\
  \  \n\
  \    {b Holidays} \n\
  \   \n\
  \    Holidays is a built-in dataset that incorporates national holiday information into your \
   model. It provides native support for the holiday calendars of 66 countries. To view the \
   holiday calendars, refer to the {{:http://jollyday.sourceforge.net/data.html}Jollyday} library. \
   For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/holidays.html}Holidays Featurization}.\n\
  \    "]

type nonrec additional_datasets = additional_dataset list [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "We can't find a resource with that Amazon Resource Name (ARN). Check the ARN and try again.\n"]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource is in use.\n"]

type nonrec invalid_input_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "We can't process the request because it includes an invalid value or a value that exceeds the \
   valid range.\n"]

type nonrec update_dataset_group_response = unit [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec arn_list = arn list [@@ocaml.doc ""]

type nonrec update_dataset_group_request = {
  dataset_group_arn : arn; [@ocaml.doc "The ARN of the dataset group.\n"]
  dataset_arns : arn_list;
      [@ocaml.doc
        "An array of the Amazon Resource Names (ARNs) of the datasets to add to the dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. \n"]
  tag_keys : tag_keys; [@ocaml.doc "The keys of the tags to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The limit on the number of resources per account has been exceeded.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that makes up a tag. A [key] is a general label that acts \
         like a category for more specific tag values.\n"]
  value : tag_value;
      [@ocaml.doc
        "The optional part of a key-value pair that makes up a tag. A [value] acts as a descriptor \
         within a tag category (key).\n"]
}
[@@ocaml.doc
  "The optional metadata that you apply to a resource to help you categorize and organize them. \
   Each tag consists of a key and an optional value, both of which you define.\n\n\
  \ The following basic restrictions apply to tags:\n\
  \ \n\
  \  {ul\n\
  \        {-  Maximum number of tags per resource - 50.\n\
  \            \n\
  \             }\n\
  \        {-  For each resource, each tag key must be unique, and each tag key can have only one \
   value.\n\
  \            \n\
  \             }\n\
  \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
  \            \n\
  \             }\n\
  \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
  \            \n\
  \             }\n\
  \        {-  If your tagging schema is used across multiple services and resources, remember \
   that other services may have restrictions on allowed characters. Generally allowed characters \
   are: letters, numbers, and spaces representable in UTF-8, and the following characters: + - = . \
   _ : / \\@.\n\
  \            \n\
  \             }\n\
  \        {-  Tag keys and values are case sensitive.\n\
  \            \n\
  \             }\n\
  \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
   prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete tag \
   keys with this prefix. Values can have this prefix. If a tag value has [aws] as its prefix but \
   the key does not, then Forecast considers it to be a user tag and will count against the limit \
   of 50 tags. Tags with only the key prefix of [aws] do not count against your tags per resource \
   limit.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. \n"]
  tags : tags;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec stop_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource to stop. The supported ARNs \
         are [DatasetImportJobArn], [PredictorArn], [PredictorBacktestExportJobArn], \
         [ForecastArn], [ForecastExportJobArn], [ExplainabilityArn], and \
         [ExplainabilityExportArn]. \n"]
}
[@@ocaml.doc ""]

type nonrec resume_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource to resume.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The token is not valid. Tokens expire after 24 hours.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec long_arn = string [@@ocaml.doc ""]

type nonrec what_if_forecast_summary = {
  what_if_forecast_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast.\n"]
  what_if_forecast_name : name option; [@ocaml.doc "The name of the what-if forecast.\n"]
  what_if_analysis_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if analysis that contains this what-if forecast.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the what-if forecast. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if analysis must be [ACTIVE] before you can access the \
         analysis.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the what-if forecast was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the what-if forecast properties used in the [ListWhatIfForecasts] \
   operation. To get the complete set of properties, call the [DescribeWhatIfForecast] operation, \
   and provide the [WhatIfForecastArn] that is listed in the summary.\n"]

type nonrec what_if_forecasts = what_if_forecast_summary list [@@ocaml.doc ""]

type nonrec list_what_if_forecasts_response = {
  what_if_forecasts : what_if_forecasts option;
      [@ocaml.doc "An array of [WhatIfForecasts] objects that describe the matched forecasts.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next\226\128\168 request. \
         Tokens expire after 24 hours.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_condition_string = IS [@ocaml.doc ""] | IS_NOT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec filter = {
  key : string_; [@ocaml.doc "The name of the parameter to filter on.\n"]
  value : arn; [@ocaml.doc "The value to match.\n"]
  condition : filter_condition_string;
      [@ocaml.doc
        "The condition to apply. To include the objects that match the statement, specify [IS]. To \
         exclude matching objects, specify [IS_NOT].\n"]
}
[@@ocaml.doc
  "Describes a filter for choosing a subset of objects. Each filter consists of a condition and a \
   match statement. The condition is either [IS] or [IS_NOT], which specifies whether to include \
   or exclude the objects that match the statement, respectively. The match statement consists of \
   a key and a value.\n"]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_what_if_forecasts_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next\226\128\168 request. \
         Tokens expire after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         what-if forecast export jobs that match the statement from the list, respectively. The \
         match statement consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the forecast export jobs that match the statement, specify [IS]. To exclude \
         matching forecast export jobs, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [WhatIfForecastArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all jobs that export a forecast named {i \
         electricityWhatIfForecast}, specify the following filter:\n\
        \   \n\
        \     \n\
        \    {[\n\
        \    \"Filters\": \\[ \\{ \"Condition\": \"IS\", \"Key\": \"WhatIfForecastArn\", \
         \"Value\": \"arn:aws:forecast:us-west-2::forecast/electricityWhatIfForecast\" \\} \\]\n\
        \    ]}\n\
        \     \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec s3_path = string [@@ocaml.doc ""]

type nonrec s3_config = {
  path : s3_path;
      [@ocaml.doc
        "The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s) in an Amazon \
         S3 bucket.\n"]
  role_arn : arn;
      [@ocaml.doc
        "The ARN of the Identity and Access Management (IAM) role that Amazon Forecast can assume \
         to access the Amazon S3 bucket or files. If you provide a value for the [KMSKeyArn] key, \
         the role must allow access to the key.\n\n\
        \ Passing a role across Amazon Web Services accounts is not allowed. If you pass a role \
         that isn't in your account, you get an [InvalidInputException] error.\n\
        \ "]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of an Key Management Service (KMS) key.\n"]
}
[@@ocaml.doc
  "The path to the file(s) in an Amazon Simple Storage Service (Amazon S3) bucket, and an Identity \
   and Access Management (IAM) role that Amazon Forecast can assume to access the file(s). \
   Optionally, includes an Key Management Service (KMS) key. This object is part of the \
   [DataSource] object that is submitted in the [CreateDatasetImportJob] request, and part of the \
   [DataDestination] object.\n"]

type nonrec data_destination = {
  s3_config : s3_config;
      [@ocaml.doc
        "The path to an Amazon Simple Storage Service (Amazon S3) bucket along with the \
         credentials to access the bucket.\n"]
}
[@@ocaml.doc
  "The destination for an export job. Provide an S3 path, an Identity and Access Management (IAM) \
   role that allows Amazon Forecast to access the location, and an Key Management Service (KMS) \
   key (optional). \n"]

type nonrec what_if_forecast_arn_list_for_export = long_arn list [@@ocaml.doc ""]

type nonrec what_if_forecast_export_summary = {
  what_if_forecast_export_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast export.\n"]
  what_if_forecast_arns : what_if_forecast_arn_list_for_export option;
      [@ocaml.doc
        "An array of Amazon Resource Names (ARNs) that define the what-if forecasts included in \
         the export.\n"]
  what_if_forecast_export_name : name option; [@ocaml.doc "The what-if forecast export name.\n"]
  destination : data_destination option;
      [@ocaml.doc
        "The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is \
         exported.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the what-if forecast export. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if analysis must be [ACTIVE] before you can access the \
         analysis.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the what-if forecast export was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the what-if forecast export properties used in the \
   [ListWhatIfForecastExports] operation. To get the complete set of properties, call the \
   [DescribeWhatIfForecastExport] operation, and provide the [WhatIfForecastExportArn] that is \
   listed in the summary.\n"]

type nonrec what_if_forecast_exports = what_if_forecast_export_summary list [@@ocaml.doc ""]

type nonrec list_what_if_forecast_exports_response = {
  what_if_forecast_exports : what_if_forecast_exports option;
      [@ocaml.doc
        "An array of [WhatIfForecastExports] objects that describe the matched forecast exports.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Forecast returns this token. To retrieve the next set of \
         results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_what_if_forecast_exports_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next\226\128\168 request. \
         Tokens expire after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         what-if forecast export jobs that match the statement from the list, respectively. The \
         match statement consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the forecast export jobs that match the statement, specify [IS]. To exclude \
         matching forecast export jobs, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [WhatIfForecastExportArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all jobs that export a forecast named {i electricityWIFExport}, \
         specify the following filter:\n\
        \   \n\
        \     \n\
        \    {[\n\
        \    \"Filters\": \\[ \\{ \"Condition\": \"IS\", \"Key\": \"WhatIfForecastExportArn\", \
         \"Value\": \"arn:aws:forecast:us-west-2::forecast/electricityWIFExport\" \\} \\]\n\
        \    ]}\n\
        \     \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec what_if_analysis_summary = {
  what_if_analysis_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if analysis.\n"]
  what_if_analysis_name : name option; [@ocaml.doc "The name of the what-if analysis.\n"]
  forecast_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the baseline forecast that is being used in this \
         what-if analysis.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the what-if analysis. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if analysis must be [ACTIVE] before you can access the \
         analysis.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the what-if analysis was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the what-if analysis properties used in the [ListWhatIfAnalyses] \
   operation. To get the complete set of properties, call the [DescribeWhatIfAnalysis] operation, \
   and provide the [WhatIfAnalysisArn] that is listed in the summary.\n"]

type nonrec what_if_analyses = what_if_analysis_summary list [@@ocaml.doc ""]

type nonrec list_what_if_analyses_response = {
  what_if_analyses : what_if_analyses option;
      [@ocaml.doc
        "An array of [WhatIfAnalysisSummary] objects that describe the matched analyses.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Forecast returns this token. To retrieve the next set of \
         results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_what_if_analyses_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         what-if analysis jobs that match the statement from the list, respectively. The match \
         statement consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the what-if analysis jobs that match the statement, specify [IS]. To exclude \
         matching what-if analysis jobs, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [WhatIfAnalysisArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all jobs that export a forecast named {i electricityWhatIf}, \
         specify the following filter:\n\
        \   \n\
        \     \n\
        \    {[\n\
        \    \"Filters\": \\[ \\{ \"Condition\": \"IS\", \"Key\": \"WhatIfAnalysisArn\", \
         \"Value\": \"arn:aws:forecast:us-west-2::forecast/electricityWhatIf\" \\} \\]\n\
        \    ]}\n\
        \     \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. \n"]
}
[@@ocaml.doc ""]

type nonrec state = Active [@ocaml.doc ""] | Deleted [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec reference_predictor_summary = {
  arn : arn option; [@ocaml.doc "The ARN of the reference predictor.\n"]
  state : state option; [@ocaml.doc "Whether the reference predictor is [Active] or [Deleted].\n"]
}
[@@ocaml.doc
  "Provides a summary of the reference predictor used when retraining or upgrading a predictor.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec predictor_summary = {
  predictor_arn : arn option; [@ocaml.doc "The ARN of the predictor.\n"]
  predictor_name : name option; [@ocaml.doc "The name of the predictor.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that contains the data used to train \
         the predictor.\n"]
  is_auto_predictor : boolean_ option;
      [@ocaml.doc "Whether AutoPredictor was used to create the predictor.\n"]
  reference_predictor_summary : reference_predictor_summary option;
      [@ocaml.doc
        "A summary of the reference predictor used if the predictor was retrained or upgraded.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the predictor. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the predictor must be [ACTIVE] before you can use the predictor to \
         create a forecast.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the model training task was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the predictor properties that are used in the [ListPredictors] operation. \
   To get the complete set of properties, call the [DescribePredictor] operation, and provide the \
   listed [PredictorArn].\n"]

type nonrec predictors = predictor_summary list [@@ocaml.doc ""]

type nonrec list_predictors_response = {
  predictors : predictors option;
      [@ocaml.doc "An array of objects that summarize each predictor's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_predictors_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         predictors that match the statement from the list, respectively. The match statement \
         consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the predictors that match the statement, specify [IS]. To exclude matching \
         predictors, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [DatasetGroupArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all predictors whose status is ACTIVE, you would specify:\n\
        \   \n\
        \     [\"Filters\": \\[ { \"Condition\": \"IS\", \"Key\": \"Status\", \"Value\": \
         \"ACTIVE\" }\n\
        \      \\]] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec predictor_backtest_export_job_summary = {
  predictor_backtest_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor backtest export job.\n"]
  predictor_backtest_export_job_name : name option;
      [@ocaml.doc "The name of the predictor backtest export job.\n"]
  destination : data_destination option; [@ocaml.doc ""]
  status : status option;
      [@ocaml.doc
        "The status of the predictor backtest export job. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : error_message option;
      [@ocaml.doc
        "Information about any errors that may have occurred during the backtest export.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "When the predictor backtest export job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the predictor backtest export job properties used in the \
   [ListPredictorBacktestExportJobs] operation. To get a complete set of properties, call the \
   [DescribePredictorBacktestExportJob] operation, and provide the listed \
   [PredictorBacktestExportJobArn].\n"]

type nonrec predictor_backtest_export_jobs = predictor_backtest_export_job_summary list
[@@ocaml.doc ""]

type nonrec list_predictor_backtest_export_jobs_response = {
  predictor_backtest_export_jobs : predictor_backtest_export_jobs option;
      [@ocaml.doc
        "An array of objects that summarize the properties of each predictor backtest export job.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Returns this token if the response is truncated. To retrieve the next set of results, use \
         the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_predictor_backtest_export_jobs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a NextToken. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         predictor backtest export jobs that match the statement from the list. The match \
         statement consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the predictor backtest export jobs that match the statement, specify [IS]. To \
         exclude matching predictor backtest export jobs, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [PredictorArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec monitor_summary = {
  monitor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource.\n"]
  monitor_name : name option; [@ocaml.doc "The name of the monitor resource.\n"]
  resource_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor being monitored.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the monitor. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE_STOPPING], [ACTIVE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_IN_PROGRESS] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : timestamp option; [@ocaml.doc "When the monitor resource was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the monitor resource was modified. The timestamp depends on the status of \
         the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] - When the resource stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the monitor creation finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the monitor properties used in the [ListMonitors] operation. To get a \
   complete set of properties, call the [DescribeMonitor] operation, and provide the listed \
   [MonitorArn].\n"]

type nonrec monitors = monitor_summary list [@@ocaml.doc ""]

type nonrec list_monitors_response = {
  monitors : monitors option;
      [@ocaml.doc "An array of objects that summarize each monitor's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_monitors_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of monitors to include in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         resources that match the statement from the list. The match statement consists of a key \
         and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. The only valid value is \
         [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all monitors who's status is ACTIVE, you would specify:\n\
        \   \n\
        \     [\"Filters\": \\[ { \"Condition\": \"IS\", \"Key\": \"Status\", \"Value\": \
         \"ACTIVE\" } \\]] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_result = {
  metric_name : metric_name option; [@ocaml.doc "The name of the metric.\n"]
  metric_value : double option; [@ocaml.doc "The value for the metric.\n"]
}
[@@ocaml.doc
  "An individual metric Forecast calculated when monitoring predictor usage. You can compare the \
   value for this metric to the metric's value in the [Baseline] to see how your predictor's \
   performance is changing.\n\n\
  \ For more information about metrics generated by Forecast see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/metrics.html}Evaluating Predictor Accuracy} \n\
  \ "]

type nonrec metric_results = metric_result list [@@ocaml.doc ""]

type nonrec monitor_data_source = {
  dataset_import_job_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset import job used to import the data that \
         initiated the monitor evaluation.\n"]
  forecast_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the forecast the monitor used during the evaluation.\n"]
  predictor_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor resource you are monitoring.\n"]
}
[@@ocaml.doc "The source of the data the monitor used during the evaluation.\n"]

type nonrec detail = string [@@ocaml.doc ""]

type nonrec predictor_event = {
  detail : detail option;
      [@ocaml.doc
        "The type of event. For example, [Retrain]. A retraining event denotes the timepoint when \
         a predictor was retrained. Any monitor results from before the [Datetime] are from the \
         previous predictor. Any new metrics are for the newly retrained predictor.\n"]
  datetime : timestamp option; [@ocaml.doc "The timestamp for when the event occurred.\n"]
}
[@@ocaml.doc "Provides details about a predictor event, such as a retraining.\n"]

type nonrec evaluation_state = string [@@ocaml.doc ""]

type nonrec predictor_monitor_evaluation = {
  resource_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to monitor.\n"]
  monitor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource.\n"]
  evaluation_time : timestamp option;
      [@ocaml.doc "The timestamp that indicates when the monitor evaluation was started. \n"]
  evaluation_state : evaluation_state option;
      [@ocaml.doc
        "The status of the monitor evaluation. The state can be [SUCCESS] or [FAILURE].\n"]
  window_start_datetime : timestamp option;
      [@ocaml.doc
        "The timestamp that indicates the start of the window that is used for monitor evaluation.\n"]
  window_end_datetime : timestamp option;
      [@ocaml.doc
        "The timestamp that indicates the end of the window that is used for monitor evaluation.\n"]
  predictor_event : predictor_event option;
      [@ocaml.doc "Provides details about a predictor event, such as a retraining.\n"]
  monitor_data_source : monitor_data_source option;
      [@ocaml.doc "The source of the data the monitor resource used during the evaluation.\n"]
  metric_results : metric_results option;
      [@ocaml.doc
        "A list of metrics Forecast calculated when monitoring a predictor. You can compare the \
         value for each metric in the list to the metric's value in the [Baseline] to see how your \
         predictor's performance is changing.\n"]
  num_items_evaluated : long option;
      [@ocaml.doc "The number of items considered during the evaluation.\n"]
  message : message option;
      [@ocaml.doc
        "Information about any errors that may have occurred during the monitor evaluation.\n"]
}
[@@ocaml.doc "Describes the results of a monitor evaluation.\n"]

type nonrec predictor_monitor_evaluations = predictor_monitor_evaluation list [@@ocaml.doc ""]

type nonrec list_monitor_evaluations_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request. Tokens expire after 24 hours.\n"]
  predictor_monitor_evaluations : predictor_monitor_evaluations option;
      [@ocaml.doc
        "The monitoring results and predictor events collected by the monitor resource during \
         different windows of time.\n\n\
        \ For information about monitoring see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html}Viewing \
         Monitoring Results}. For more information about retrieving monitoring results see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html}Viewing \
         Monitoring Results}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_monitor_evaluations_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of monitoring results to return.\n"]
  monitor_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource to get results from.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         resources that match the statement from the list. The match statement consists of a key \
         and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. The only valid value is \
         [EvaluationState].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match. Valid values are only [SUCCESS] or [FAILURE].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list only successful monitor evaluations, you would specify:\n\
        \   \n\
        \     [\"Filters\": \\[ { \"Condition\": \"IS\", \"Key\": \"EvaluationState\", \"Value\": \
         \"SUCCESS\" } \\]] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec forecast_summary = {
  forecast_arn : arn option; [@ocaml.doc "The ARN of the forecast.\n"]
  forecast_name : name option; [@ocaml.doc "The name of the forecast.\n"]
  predictor_arn : string_ option;
      [@ocaml.doc "The ARN of the predictor used to generate the forecast.\n"]
  created_using_auto_predictor : boolean_ option;
      [@ocaml.doc "Whether the Forecast was created from an AutoPredictor.\n"]
  dataset_group_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset group that provided the data used to train \
         the predictor.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the forecast. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the forecast must be [ACTIVE] before you can query or export the \
         forecast.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the forecast creation task was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the forecast properties used in the [ListForecasts] operation. To get the \
   complete set of properties, call the [DescribeForecast] operation, and provide the \
   [ForecastArn] that is listed in the summary.\n"]

type nonrec forecasts = forecast_summary list [@@ocaml.doc ""]

type nonrec list_forecasts_response = {
  forecasts : forecasts option;
      [@ocaml.doc "An array of objects that summarize each forecast's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_forecasts_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         forecasts that match the statement from the list, respectively. The match statement \
         consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the forecasts that match the statement, specify [IS]. To exclude matching \
         forecasts, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [DatasetGroupArn], [PredictorArn], and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all forecasts whose status is not ACTIVE, you would specify:\n\
        \   \n\
        \     [\"Filters\": \\[ { \"Condition\": \"IS_NOT\", \"Key\": \"Status\", \"Value\": \
         \"ACTIVE\" }\n\
        \      \\]] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec forecast_export_job_summary = {
  forecast_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast export job.\n"]
  forecast_export_job_name : name option; [@ocaml.doc "The name of the forecast export job.\n"]
  destination : data_destination option;
      [@ocaml.doc
        "The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is \
         exported.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the forecast export job. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the forecast export job must be [ACTIVE] before you can access the \
         forecast in your S3 bucket.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the forecast export job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the forecast export job properties used in the [ListForecastExportJobs] \
   operation. To get the complete set of properties, call the [DescribeForecastExportJob] \
   operation, and provide the listed [ForecastExportJobArn].\n"]

type nonrec forecast_export_jobs = forecast_export_job_summary list [@@ocaml.doc ""]

type nonrec list_forecast_export_jobs_response = {
  forecast_export_jobs : forecast_export_jobs option;
      [@ocaml.doc "An array of objects that summarize each export job's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_forecast_export_jobs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         forecast export jobs that match the statement from the list, respectively. The match \
         statement consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the forecast export jobs that match the statement, specify [IS]. To exclude \
         matching forecast export jobs, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [ForecastArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all jobs that export a forecast named {i electricityforecast}, \
         specify the following filter:\n\
        \   \n\
        \     \n\
        \    {[\n\
        \    \"Filters\": \\[ \\{ \"Condition\": \"IS\", \"Key\": \"ForecastArn\", \"Value\": \
         \"arn:aws:forecast:us-west-2::forecast/electricityforecast\" \\} \\]\n\
        \    ]}\n\
        \     \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec explainability_export_summary = {
  explainability_export_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability export.\n"]
  explainability_export_name : name option; [@ocaml.doc "The name of the Explainability export\n"]
  destination : data_destination option; [@ocaml.doc ""]
  status : status option;
      [@ocaml.doc
        "The status of the Explainability export. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : error_message option;
      [@ocaml.doc
        "Information about any errors that may have occurred during the Explainability export.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the Explainability was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the Explainability export properties used in the \
   [ListExplainabilityExports] operation. To get a complete set of properties, call the \
   [DescribeExplainabilityExport] operation, and provide the [ExplainabilityExportArn].\n"]

type nonrec explainability_exports = explainability_export_summary list [@@ocaml.doc ""]

type nonrec list_explainability_exports_response = {
  explainability_exports : explainability_exports option;
      [@ocaml.doc
        "An array of objects that summarize the properties of each Explainability export.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Returns this token if the response is truncated. To retrieve the next set of results, use \
         the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_explainability_exports_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a NextToken. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude \
         resources that match the statement from the list. The match statement consists of a key \
         and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [ResourceArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec time_point_granularity = ALL [@ocaml.doc ""] | SPECIFIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec time_series_granularity = ALL [@ocaml.doc ""] | SPECIFIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec explainability_config = {
  time_series_granularity : time_series_granularity;
      [@ocaml.doc
        "To create an Explainability for all time series in your datasets, use [ALL]. To create an \
         Explainability for specific time series in your datasets, use [SPECIFIC].\n\n\
        \ Specify time series by uploading a CSV or Parquet file to an Amazon S3 bucket and set \
         the location within the [DataDestination] data type.\n\
        \ "]
  time_point_granularity : time_point_granularity;
      [@ocaml.doc
        "To create an Explainability for all time points in your forecast horizon, use [ALL]. To \
         create an Explainability for specific time points in your forecast horizon, use \
         [SPECIFIC].\n\n\
        \ Specify time points with the [StartDateTime] and [EndDateTime] parameters within the \
         [CreateExplainability] operation.\n\
        \ "]
}
[@@ocaml.doc
  "The ExplainabilityConfig data type defines the number of time series and time points included \
   in [CreateExplainability].\n\n\
  \ If you provide a predictor ARN for [ResourceArn], you must set both [TimePointGranularity] and \
   [TimeSeriesGranularity] to \226\128\156ALL\226\128\157. When creating Predictor Explainability, \
   Amazon Forecast considers all time series and time points.\n\
  \ \n\
  \  If you provide a forecast ARN for [ResourceArn], you can set [TimePointGranularity] and \
   [TimeSeriesGranularity] to either \226\128\156ALL\226\128\157 or \
   \226\128\156Specific\226\128\157.\n\
  \  "]

type nonrec explainability_summary = {
  explainability_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability.\n"]
  explainability_name : name option; [@ocaml.doc "The name of the Explainability.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the \
         Explainability.\n"]
  explainability_config : explainability_config option;
      [@ocaml.doc
        "The configuration settings that define the granularity of time series and time points for \
         the Explainability.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the Explainability. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : message option;
      [@ocaml.doc
        "Information about any errors that may have occurred during the Explainability creation \
         process.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the Explainability was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides a summary of the Explainability properties used in the [ListExplainabilities] \
   operation. To get a complete set of properties, call the [DescribeExplainability] operation, \
   and provide the listed [ExplainabilityArn].\n"]

type nonrec explainabilities = explainability_summary list [@@ocaml.doc ""]

type nonrec list_explainabilities_response = {
  explainabilities : explainabilities option;
      [@ocaml.doc
        "An array of objects that summarize the properties of each Explainability resource.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Returns this token if the response is truncated. To retrieve the next set of results, use \
         the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_explainabilities_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a NextToken. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items returned in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         resources that match the statement from the list. The match statement consists of a key \
         and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [ResourceArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec domain =
  | RETAIL [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | INVENTORY_PLANNING [@ocaml.doc ""]
  | EC2_CAPACITY [@ocaml.doc ""]
  | WORK_FORCE [@ocaml.doc ""]
  | WEB_TRAFFIC [@ocaml.doc ""]
  | METRICS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_type =
  | TARGET_TIME_SERIES [@ocaml.doc ""]
  | RELATED_TIME_SERIES [@ocaml.doc ""]
  | ITEM_METADATA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_summary = {
  dataset_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset.\n"]
  dataset_name : name option; [@ocaml.doc "The name of the dataset.\n"]
  dataset_type : dataset_type option; [@ocaml.doc "The dataset type.\n"]
  domain : domain option; [@ocaml.doc "The domain associated with the dataset.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the dataset was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "When you create a dataset, [LastModificationTime] is the same as [CreationTime]. While \
         data is being imported to the dataset, [LastModificationTime] is the current time of the \
         [ListDatasets] call. After a \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
         operation has finished, [LastModificationTime] is when the import job completed or failed.\n"]
}
[@@ocaml.doc
  "Provides a summary of the dataset properties used in the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasets.html}ListDatasets} \
   operation. To get the complete set of properties, call the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html}DescribeDataset} \
   operation, and provide the [DatasetArn].\n"]

type nonrec datasets = dataset_summary list [@@ocaml.doc ""]

type nonrec list_datasets_response = {
  datasets : datasets option;
      [@ocaml.doc "An array of objects that summarize each dataset's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_datasets_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec import_mode = FULL [@ocaml.doc ""] | INCREMENTAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec data_source = {
  s3_config : s3_config;
      [@ocaml.doc
        "The path to the data stored in an Amazon Simple Storage Service (Amazon S3) bucket along \
         with the credentials to access the data.\n"]
}
[@@ocaml.doc
  "The source of your data, an Identity and Access Management (IAM) role that allows Amazon \
   Forecast to access the data and, optionally, an Key Management Service (KMS) key.\n"]

type nonrec dataset_import_job_summary = {
  dataset_import_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job.\n"]
  dataset_import_job_name : name option; [@ocaml.doc "The name of the dataset import job.\n"]
  data_source : data_source option;
      [@ocaml.doc
        "The location of the training data to import and an Identity and Access Management (IAM) \
         role that Amazon Forecast can assume to access the data. The training data must be stored \
         in an Amazon S3 bucket.\n\n\
        \ If encryption is used, [DataSource] includes an Key Management Service (KMS) key.\n\
        \ "]
  status : status option;
      [@ocaml.doc
        "The status of the dataset import job. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the dataset import job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  import_mode : import_mode option;
      [@ocaml.doc "The import mode of the dataset import job, FULL or INCREMENTAL.\n"]
}
[@@ocaml.doc
  "Provides a summary of the dataset import job properties used in the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetImportJobs.html}ListDatasetImportJobs} \
   operation. To get the complete set of properties, call the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \
   operation, and provide the [DatasetImportJobArn].\n"]

type nonrec dataset_import_jobs = dataset_import_job_summary list [@@ocaml.doc ""]

type nonrec list_dataset_import_jobs_response = {
  dataset_import_jobs : dataset_import_jobs option;
      [@ocaml.doc "An array of objects that summarize each dataset import job's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_import_jobs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of filters. For each filter, you provide a condition and a match statement. The \
         condition is either [IS] or [IS_NOT], which specifies whether to include or exclude the \
         datasets that match the statement from the list, respectively. The match statement \
         consists of a key and a value.\n\n\
        \  {b Filter properties} \n\
        \ \n\
        \  {ul\n\
        \        {-   [Condition] - The condition to apply. Valid values are [IS] and [IS_NOT]. To \
         include the datasets that match the statement, specify [IS]. To exclude matching \
         datasets, specify [IS_NOT].\n\
        \            \n\
        \             }\n\
        \        {-   [Key] - The name of the parameter to filter on. Valid values are \
         [DatasetArn] and [Status].\n\
        \            \n\
        \             }\n\
        \        {-   [Value] - The value to match.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For example, to list all dataset import jobs whose status is ACTIVE, you specify the \
         following filter:\n\
        \   \n\
        \     [\"Filters\": \\[ { \"Condition\": \"IS\", \"Key\": \"Status\", \"Value\": \
         \"ACTIVE\" } \\]] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec dataset_group_summary = {
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
  dataset_group_name : name option; [@ocaml.doc "The name of the dataset group.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the dataset group was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "When the dataset group was created or last updated from a call to the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html}UpdateDatasetGroup} \
         operation. While the dataset group is being updated, [LastModificationTime] is the \
         current time of the [ListDatasetGroups] call.\n"]
}
[@@ocaml.doc
  "Provides a summary of the dataset group properties used in the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetGroups.html}ListDatasetGroups} \
   operation. To get the complete set of properties, call the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   operation, and provide the [DatasetGroupArn].\n"]

type nonrec dataset_groups = dataset_group_summary list [@@ocaml.doc ""]

type nonrec list_dataset_groups_response = {
  dataset_groups : dataset_groups option;
      [@ocaml.doc "An array of objects that summarize each dataset group's properties.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Forecast returns this token. To retrieve the next \
         set of results, use the token in the next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_dataset_groups_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the result of the previous request was truncated, the response includes a [NextToken]. \
         To retrieve the next set of results, use the token in the next request. Tokens expire \
         after 24 hours.\n"]
  max_results : max_results option; [@ocaml.doc "The number of items to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec optimization_metric =
  | WAPE [@ocaml.doc ""]
  | RMSE [@ocaml.doc ""]
  | AverageWeightedQuantileLoss [@ocaml.doc ""]
  | MASE [@ocaml.doc ""]
  | MAPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_ml_override_strategy =
  | LatencyOptimized [@ocaml.doc ""]
  | AccuracyOptimized [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec forecast_type = string [@@ocaml.doc ""]

type nonrec error_metric = {
  forecast_type : forecast_type option;
      [@ocaml.doc " The Forecast type used to compute WAPE, MAPE, MASE, and RMSE. \n"]
  wap_e : double option; [@ocaml.doc " The weighted absolute percentage error (WAPE). \n"]
  rms_e : double option; [@ocaml.doc " The root-mean-square error (RMSE). \n"]
  mas_e : double option; [@ocaml.doc "The Mean Absolute Scaled Error (MASE)\n"]
  map_e : double option; [@ocaml.doc "The Mean Absolute Percentage Error (MAPE)\n"]
}
[@@ocaml.doc
  " Provides detailed error metrics to evaluate the performance of a predictor. This object is \
   part of the [Metrics] object. \n"]

type nonrec error_metrics = error_metric list [@@ocaml.doc ""]

type nonrec weighted_quantile_loss = {
  quantile : double option;
      [@ocaml.doc
        "The quantile. Quantiles divide a probability distribution into regions of equal \
         probability. For example, if the distribution was divided into 5 regions of equal \
         probability, the quantiles would be 0.2, 0.4, 0.6, and 0.8.\n"]
  loss_value : double option;
      [@ocaml.doc
        "The difference between the predicted value and the actual value over the quantile, \
         weighted (normalized) by dividing by the sum over all quantiles.\n"]
}
[@@ocaml.doc
  "The weighted loss value for a quantile. This object is part of the [Metrics] object.\n"]

type nonrec weighted_quantile_losses = weighted_quantile_loss list [@@ocaml.doc ""]

type nonrec metrics = {
  rms_e : double option; [@ocaml.doc "The root-mean-square error (RMSE).\n"]
  weighted_quantile_losses : weighted_quantile_losses option;
      [@ocaml.doc
        "An array of weighted quantile losses. Quantiles divide a probability distribution into \
         regions of equal probability. The distribution in this case is the loss function.\n"]
  error_metrics : error_metrics option;
      [@ocaml.doc
        " Provides detailed error metrics for each forecast type. Metrics include root-mean \
         square-error (RMSE), mean absolute percentage error (MAPE), mean absolute scaled error \
         (MASE), and weighted average percentage error (WAPE). \n"]
  average_weighted_quantile_loss : double option;
      [@ocaml.doc "The average value of all weighted quantile losses.\n"]
}
[@@ocaml.doc
  "Provides metrics that are used to evaluate the performance of a predictor. This object is part \
   of the [WindowSummary] object.\n"]

type nonrec evaluation_type = SUMMARY [@ocaml.doc ""] | COMPUTED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec window_summary = {
  test_window_start : timestamp option;
      [@ocaml.doc "The timestamp that defines the start of the window.\n"]
  test_window_end : timestamp option;
      [@ocaml.doc "The timestamp that defines the end of the window.\n"]
  item_count : integer option; [@ocaml.doc "The number of data points within the window.\n"]
  evaluation_type : evaluation_type option;
      [@ocaml.doc
        "The type of evaluation.\n\n\
        \ {ul\n\
        \       {-   [SUMMARY] - The average metrics across all windows.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPUTED] - The metrics for the specified window.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  metrics : metrics option;
      [@ocaml.doc "Provides metrics used to evaluate the performance of a predictor.\n"]
}
[@@ocaml.doc
  "The metrics for a time range within the evaluation portion of a dataset. This object is part of \
   the [EvaluationResult] object.\n\n\
  \ The [TestWindowStart] and [TestWindowEnd] parameters are determined by the \
   [BackTestWindowOffset] parameter of the [EvaluationParameters] object.\n\
  \ "]

type nonrec test_windows = window_summary list [@@ocaml.doc ""]

type nonrec evaluation_result = {
  algorithm_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the algorithm that was evaluated.\n"]
  test_windows : test_windows option;
      [@ocaml.doc
        "The array of test windows used for evaluating the algorithm. The \
         [NumberOfBacktestWindows] from the [EvaluationParameters] object determines the number of \
         windows in the array.\n"]
}
[@@ocaml.doc
  "The results of evaluating an algorithm. Returned as part of the [GetAccuracyMetrics] response.\n"]

type nonrec predictor_evaluation_results = evaluation_result list [@@ocaml.doc ""]

type nonrec get_accuracy_metrics_response = {
  predictor_evaluation_results : predictor_evaluation_results option;
      [@ocaml.doc "An array of results from evaluating the predictor.\n"]
  is_auto_predictor : boolean_ option;
      [@ocaml.doc "Whether the predictor was created with [CreateAutoPredictor].\n"]
  auto_ml_override_strategy : auto_ml_override_strategy option;
      [@ocaml.doc
        "  The [LatencyOptimized] AutoML override strategy is only available in private beta. \
         Contact Amazon Web Services Support or your account manager to learn more about access \
         privileges. \n\
        \ \n\
        \   The AutoML strategy used to train the predictor. Unless [LatencyOptimized] is \
         specified, the AutoML strategy optimizes predictor accuracy.\n\
        \   \n\
        \    This parameter is only valid for predictors trained using AutoML.\n\
        \    "]
  optimization_metric : optimization_metric option;
      [@ocaml.doc "The accuracy metric used to optimize the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec get_accuracy_metrics_request = {
  predictor_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor to get metrics for.\n"]
}
[@@ocaml.doc ""]

type nonrec format = string [@@ocaml.doc ""]

type nonrec long_arn_list = long_arn list [@@ocaml.doc ""]

type nonrec describe_what_if_forecast_export_response = {
  what_if_forecast_export_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast export.\n"]
  what_if_forecast_export_name : name option;
      [@ocaml.doc "The name of the what-if forecast export.\n"]
  what_if_forecast_arns : long_arn_list option;
      [@ocaml.doc
        "An array of Amazon Resource Names (ARNs) that represent all of the what-if forecasts \
         exported in this resource.\n"]
  destination : data_destination option; [@ocaml.doc ""]
  message : message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the what-if forecast. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if forecast export must be [ACTIVE] before you can access \
         the forecast export.\n\
        \    \n\
        \     "]
  creation_time : timestamp option; [@ocaml.doc "When the what-if forecast export was created.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The approximate time remaining to complete the what-if forecast export, in minutes.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_what_if_forecast_export_request = {
  what_if_forecast_export_arn : long_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if forecast export that you are interested in.\n"]
}
[@@ocaml.doc ""]

type nonrec forecast_types = forecast_type list [@@ocaml.doc ""]

type nonrec timestamp_format = string [@@ocaml.doc ""]

type nonrec attribute_type =
  | STRING [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | TIMESTAMP [@ocaml.doc ""]
  | GEOLOCATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec schema_attribute = {
  attribute_name : name option; [@ocaml.doc "The name of the dataset field.\n"]
  attribute_type : attribute_type option;
      [@ocaml.doc
        "The data type of the field.\n\n\
        \ For a related time series dataset, other than date, item_id, and forecast dimensions \
         attributes, all attributes should be of numerical type (integer/float).\n\
        \ "]
}
[@@ocaml.doc
  "An attribute of a schema, which defines a dataset field. A schema attribute is required for \
   every field in a dataset. The \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_Schema.html}Schema} object contains an \
   array of [SchemaAttribute] objects.\n"]

type nonrec schema_attributes = schema_attribute list [@@ocaml.doc ""]

type nonrec schema = {
  attributes : schema_attributes option;
      [@ocaml.doc
        "An array of attributes specifying the name and type of each field in a dataset.\n"]
}
[@@ocaml.doc "Defines the fields of a dataset.\n"]

type nonrec time_series_replacements_data_source = {
  s3_config : s3_config; [@ocaml.doc ""]
  schema : schema; [@ocaml.doc ""]
  format : format option; [@ocaml.doc "The format of the replacement data, CSV or PARQUET.\n"]
  timestamp_format : timestamp_format option;
      [@ocaml.doc "The timestamp format of the replacement data.\n"]
}
[@@ocaml.doc
  "A replacement dataset is a modified version of the baseline related time series that contains \
   only the values that you want to include in a what-if forecast. The replacement dataset must \
   contain the forecast dimensions and item identifiers in the baseline related time series as \
   well as at least 1 changed time series. This dataset is merged with the baseline related time \
   series to create a transformed dataset that is used for the what-if forecast.\n"]

type nonrec condition =
  | EQUALS [@ocaml.doc ""]
  | NOT_EQUALS [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec time_series_condition = {
  attribute_name : name;
      [@ocaml.doc "The item_id, dimension name, IM name, or timestamp that you are modifying.\n"]
  attribute_value : attribute_value;
      [@ocaml.doc "The value that is applied for the chosen [Condition].\n"]
  condition : condition;
      [@ocaml.doc
        "The condition to apply. Valid values are [EQUALS], [NOT_EQUALS], [LESS_THAN] and \
         [GREATER_THAN].\n"]
}
[@@ocaml.doc
  "Creates a subset of items within an attribute that are modified. For example, you can use this \
   operation to create a subset of items that cost $5 or less. To do this, you specify \
   [\"AttributeName\": \"price\"], [\"AttributeValue\": \"5\"], and [\"Condition\": \
   \"LESS_THAN\"]. Pair this operation with the [Action] operation within the \
   [CreateWhatIfForecastRequest$TimeSeriesTransformations] operation to define how the attribute \
   is modified.\n"]

type nonrec time_series_conditions = time_series_condition list [@@ocaml.doc ""]

type nonrec time_series_transformation = {
  action : action option;
      [@ocaml.doc
        "An array of actions that define a time series and how it is transformed. These \
         transformations create a new time series that is used for the what-if analysis.\n"]
  time_series_conditions : time_series_conditions option;
      [@ocaml.doc
        "An array of conditions that define which members of the related time series are \
         transformed.\n"]
}
[@@ocaml.doc
  "A transformation function is a pair of operations that select and modify the rows in a related \
   time series. You select the rows that you want with a condition operation and you modify the \
   rows with a transformation operation. All conditions are joined with an AND operation, meaning \
   that all conditions must be true for the transformation to be applied. Transformations are \
   applied in the order that they are listed.\n"]

type nonrec time_series_transformations = time_series_transformation list [@@ocaml.doc ""]

type nonrec describe_what_if_forecast_response = {
  what_if_forecast_name : name option; [@ocaml.doc "The name of the what-if forecast.\n"]
  what_if_forecast_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast.\n"]
  what_if_analysis_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if analysis that contains this forecast.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc "The approximate time remaining to complete the what-if forecast, in minutes.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the what-if forecast. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if forecast must be [ACTIVE] before you can access the \
         forecast.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the what-if forecast was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  time_series_transformations : time_series_transformations option;
      [@ocaml.doc
        "An array of [Action] and [TimeSeriesConditions] elements that describe what \
         transformations were applied to which time series.\n"]
  time_series_replacements_data_source : time_series_replacements_data_source option;
      [@ocaml.doc
        "An array of [S3Config], [Schema], and [Format] elements that describe the replacement \
         time series.\n"]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "The quantiles at which probabilistic forecasts are generated. You can specify up to five \
         quantiles per what-if forecast in the [CreateWhatIfForecast] operation. If you didn't \
         specify quantiles, the default values are [\\[\"0.1\", \"0.5\", \"0.9\"\\]]. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_what_if_forecast_request = {
  what_if_forecast_arn : long_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if forecast that you are interested in.\n"]
}
[@@ocaml.doc ""]

type nonrec time_series_identifiers = {
  data_source : data_source option; [@ocaml.doc ""]
  schema : schema option; [@ocaml.doc ""]
  format : format option; [@ocaml.doc "The format of the data, either CSV or PARQUET.\n"]
}
[@@ocaml.doc
  "Details about the import file that contains the time series for which you want to create \
   forecasts.\n"]

type nonrec time_series_selector = {
  time_series_identifiers : time_series_identifiers option;
      [@ocaml.doc
        "Details about the import file that contains the time series for which you want to create \
         forecasts.\n"]
}
[@@ocaml.doc
  "Defines the set of time series that are used to create the forecasts in a \
   [TimeSeriesIdentifiers] object.\n\n\
  \ The [TimeSeriesIdentifiers] object needs the following information:\n\
  \ \n\
  \  {ul\n\
  \        {-   [DataSource] \n\
  \            \n\
  \             }\n\
  \        {-   [Format] \n\
  \            \n\
  \             }\n\
  \        {-   [Schema] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec describe_what_if_analysis_response = {
  what_if_analysis_name : name option; [@ocaml.doc "The name of the what-if analysis.\n"]
  what_if_analysis_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if analysis.\n"]
  forecast_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc "The approximate time remaining to complete the what-if analysis, in minutes.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the what-if analysis. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the what-if analysis must be [ACTIVE] before you can access the \
         analysis.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the what-if analysis was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  time_series_selector : time_series_selector option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_what_if_analysis_request = {
  what_if_analysis_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if analysis that you are interested in.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_predictor_backtest_export_job_response = {
  predictor_backtest_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor backtest export job.\n"]
  predictor_backtest_export_job_name : name option;
      [@ocaml.doc "The name of the predictor backtest export job.\n"]
  predictor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor.\n"]
  destination : data_destination option; [@ocaml.doc ""]
  message : message option;
      [@ocaml.doc
        "Information about any errors that may have occurred during the backtest export.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the predictor backtest export job. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : timestamp option;
      [@ocaml.doc "When the predictor backtest export job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_predictor_backtest_export_job_request = {
  predictor_backtest_export_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor backtest export job.\n"]
}
[@@ocaml.doc ""]

type nonrec test_window_summary = {
  test_window_start : timestamp option; [@ocaml.doc "The time at which the test began.\n"]
  test_window_end : timestamp option; [@ocaml.doc "The time at which the test ended.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the test. Possible status values are:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : error_message option; [@ocaml.doc "If the test failed, the reason why it failed.\n"]
}
[@@ocaml.doc
  "The status, start time, and end time of a backtest, as well as a failure reason if applicable.\n"]

type nonrec test_window_details = test_window_summary list [@@ocaml.doc ""]

type nonrec predictor_execution = {
  algorithm_arn : arn option; [@ocaml.doc "The ARN of the algorithm used to test the predictor.\n"]
  test_windows : test_window_details option;
      [@ocaml.doc
        "An array of test windows used to evaluate the algorithm. The [NumberOfBacktestWindows] \
         from the object determines the number of windows in the array.\n"]
}
[@@ocaml.doc "The algorithm used to perform a backtest and the status of those tests.\n"]

type nonrec predictor_executions = predictor_execution list [@@ocaml.doc ""]

type nonrec predictor_execution_details = {
  predictor_executions : predictor_executions option;
      [@ocaml.doc
        "An array of the backtests performed to evaluate the accuracy of the predictor against a \
         particular algorithm. The [NumberOfBacktestWindows] from the object determines the number \
         of windows in the array.\n"]
}
[@@ocaml.doc
  "Contains details on the backtests performed to evaluate the accuracy of the predictor. The \
   tests are returned in descending order of accuracy, with the most accurate backtest appearing \
   first. You specify the number of backtests to perform when you call the operation.\n"]

type nonrec encryption_config = {
  role_arn : arn;
      [@ocaml.doc
        "The ARN of the IAM role that Amazon Forecast can assume to access the KMS key.\n\n\
        \ Passing a role across Amazon Web Services accounts is not allowed. If you pass a role \
         that isn't in your account, you get an [InvalidInputException] error.\n\
        \ "]
  kms_key_arn : kms_key_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the KMS key.\n"]
}
[@@ocaml.doc
  "An Key Management Service (KMS) key and an Identity and Access Management (IAM) role that \
   Amazon Forecast can assume to access the key. You can specify this optional object in the \
   [CreateDataset] and [CreatePredictor] requests.\n"]

type nonrec parameter_value = string [@@ocaml.doc ""]

type nonrec parameter_key = string [@@ocaml.doc ""]

type nonrec featurization_method_parameters = (parameter_key * parameter_value) list
[@@ocaml.doc ""]

type nonrec featurization_method_name = Filling [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec featurization_method = {
  featurization_method_name : featurization_method_name;
      [@ocaml.doc "The name of the method. The \"filling\" method is the only supported method.\n"]
  featurization_method_parameters : featurization_method_parameters option;
      [@ocaml.doc
        "The method parameters (key-value pairs), which are a map of override parameters. Specify \
         these parameters to override the default values. Related Time Series attributes do not \
         accept aggregation parameters.\n\n\
        \ The following list shows the parameters and their valid values for the \"filling\" \
         featurization method for a {b Target Time Series} dataset. Bold signifies the default \
         value.\n\
        \ \n\
        \  {ul\n\
        \        {-   [aggregation]: {b sum}, [avg], [first], [min], [max] \n\
        \            \n\
        \             }\n\
        \        {-   [frontfill]: {b none} \n\
        \            \n\
        \             }\n\
        \        {-   [middlefill]: {b zero}, [nan] (not a number), [value], [median], [mean], \
         [min], [max] \n\
        \            \n\
        \             }\n\
        \        {-   [backfill]: {b zero}, [nan], [value], [median], [mean], [min], [max] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following list shows the parameters and their valid values for a {b Related Time \
         Series} featurization method (there are no defaults):\n\
        \   \n\
        \    {ul\n\
        \          {-   [middlefill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          {-   [backfill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          {-   [futurefill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To set a filling method to a specific value, set the fill parameter to [value] and \
         define the value in a corresponding [_value] parameter. For example, to set backfilling \
         to a value of 2, include the following: [\"backfill\": \"value\"] and \
         [\"backfill_value\":\"2\"]. \n\
        \   "]
}
[@@ocaml.doc
  "Provides information about the method that featurizes (transforms) a dataset field. The method \
   is part of the [FeaturizationPipeline] of the [Featurization] object. \n\n\
  \ The following is an example of how you specify a [FeaturizationMethod] object.\n\
  \ \n\
  \   [{] \n\
  \  \n\
  \    [\"FeaturizationMethodName\": \"filling\",] \n\
  \   \n\
  \     [\"FeaturizationMethodParameters\": {\"aggregation\": \"sum\", \"middlefill\": \"zero\",\n\
  \        \"backfill\": \"zero\"}] \n\
  \    \n\
  \      [}] \n\
  \     "]

type nonrec featurization_pipeline = featurization_method list [@@ocaml.doc ""]

type nonrec featurization = {
  attribute_name : name;
      [@ocaml.doc
        "The name of the schema attribute that specifies the data field to be featurized. Amazon \
         Forecast supports the target field of the [TARGET_TIME_SERIES] and the \
         [RELATED_TIME_SERIES] datasets. For example, for the [RETAIL] domain, the target is \
         [demand], and for the [CUSTOM] domain, the target is [target_value]. For more \
         information, see [howitworks-missing-values].\n"]
  featurization_pipeline : featurization_pipeline option;
      [@ocaml.doc
        "An array of one [FeaturizationMethod] object that specifies the feature transformation \
         method.\n"]
}
[@@ocaml.doc
  " This object belongs to the [CreatePredictor] operation. If you created your predictor with \
   [CreateAutoPredictor], see [AttributeConfig].\n\
  \ \n\
  \   Provides featurization (transformation) information for a dataset field. This object is part \
   of the [FeaturizationConfig] object.\n\
  \   \n\
  \    For example:\n\
  \    \n\
  \      [{] \n\
  \     \n\
  \       [\"AttributeName\": \"demand\",] \n\
  \      \n\
  \        [FeaturizationPipeline \\[ {] \n\
  \       \n\
  \         [\"FeaturizationMethodName\": \"filling\",] \n\
  \        \n\
  \          [\"FeaturizationMethodParameters\": {\"aggregation\": \"avg\", \"backfill\":\n\
  \      \"nan\"}] \n\
  \         \n\
  \           [} \\]] \n\
  \          \n\
  \            [}] \n\
  \           "]

type nonrec featurizations = featurization list [@@ocaml.doc ""]

type nonrec forecast_dimensions = name list [@@ocaml.doc ""]

type nonrec frequency = string [@@ocaml.doc ""]

type nonrec featurization_config = {
  forecast_frequency : frequency;
      [@ocaml.doc
        "The frequency of predictions in a forecast.\n\n\
        \ Valid intervals are an integer followed by Y (Year), M (Month), W (Week), D (Day), H \
         (Hour), and min (Minute). For example, \"1D\" indicates every day and \"15min\" indicates \
         every 15 minutes. You cannot specify a value that would overlap with the next larger \
         frequency. That means, for example, you cannot specify a frequency of 60 minutes, because \
         that is equivalent to 1 hour. The valid values for each frequency are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Minute - 1-59\n\
        \            \n\
        \             }\n\
        \        {-  Hour - 1-23\n\
        \            \n\
        \             }\n\
        \        {-  Day - 1-6\n\
        \            \n\
        \             }\n\
        \        {-  Week - 1-4\n\
        \            \n\
        \             }\n\
        \        {-  Month - 1-11\n\
        \            \n\
        \             }\n\
        \        {-  Year - 1\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Thus, if you want every other week forecasts, specify \"2W\". Or, if you want \
         quarterly forecasts, you specify \"3M\".\n\
        \   \n\
        \    The frequency must be greater than or equal to the TARGET_TIME_SERIES dataset \
         frequency.\n\
        \    \n\
        \     When a RELATED_TIME_SERIES dataset is provided, the frequency must be equal to the \
         TARGET_TIME_SERIES dataset frequency.\n\
        \     "]
  forecast_dimensions : forecast_dimensions option;
      [@ocaml.doc
        "An array of dimension (field) names that specify how to group the generated forecast.\n\n\
        \ For example, suppose that you are generating a forecast for item sales across all of \
         your stores, and your dataset contains a [store_id] field. If you want the sales forecast \
         for each item by store, you would specify [store_id] as the dimension.\n\
        \ \n\
        \  All forecast dimensions specified in the [TARGET_TIME_SERIES] dataset don't need to be \
         specified in the [CreatePredictor] request. All forecast dimensions specified in the \
         [RELATED_TIME_SERIES] dataset must be specified in the [CreatePredictor] request.\n\
        \  "]
  featurizations : featurizations option;
      [@ocaml.doc
        "An array of featurization (transformation) information for the fields of a dataset.\n"]
}
[@@ocaml.doc
  " This object belongs to the [CreatePredictor] operation. If you created your predictor with \
   [CreateAutoPredictor], see [AttributeConfig].\n\
  \ \n\
  \   In a [CreatePredictor] operation, the specified algorithm trains a model using the specified \
   dataset group. You can optionally tell the operation to modify data fields prior to training a \
   model. These modifications are referred to as {i featurization}.\n\
  \   \n\
  \    You define featurization using the [FeaturizationConfig] object. You specify an array of \
   transformations, one for each field that you want to featurize. You then include the \
   [FeaturizationConfig] object in your [CreatePredictor] request. Amazon Forecast applies the \
   featurization to the [TARGET_TIME_SERIES] and [RELATED_TIME_SERIES] datasets before model \
   training.\n\
  \    \n\
  \     You can create multiple featurization configurations. For example, you might call the \
   [CreatePredictor] operation twice by specifying different featurization configurations.\n\
  \     "]

type nonrec supplementary_feature = {
  name : name;
      [@ocaml.doc "The name of the feature. Valid values: [\"holiday\"] and [\"weather\"].\n"]
  value : value;
      [@ocaml.doc
        " {b Weather Index} \n\n\
        \ To enable the Weather Index, set the value to [\"true\"] \n\
        \ \n\
        \   {b Holidays} \n\
        \  \n\
        \   To enable Holidays, specify a country with one of the following two-letter country \
         codes:\n\
        \   \n\
        \    {ul\n\
        \          {-  \"AL\" - ALBANIA\n\
        \              \n\
        \               }\n\
        \          {-  \"AR\" - ARGENTINA\n\
        \              \n\
        \               }\n\
        \          {-  \"AT\" - AUSTRIA\n\
        \              \n\
        \               }\n\
        \          {-  \"AU\" - AUSTRALIA\n\
        \              \n\
        \               }\n\
        \          {-  \"BA\" - BOSNIA HERZEGOVINA\n\
        \              \n\
        \               }\n\
        \          {-  \"BE\" - BELGIUM\n\
        \              \n\
        \               }\n\
        \          {-  \"BG\" - BULGARIA\n\
        \              \n\
        \               }\n\
        \          {-  \"BO\" - BOLIVIA\n\
        \              \n\
        \               }\n\
        \          {-  \"BR\" - BRAZIL\n\
        \              \n\
        \               }\n\
        \          {-  \"BY\" - BELARUS\n\
        \              \n\
        \               }\n\
        \          {-  \"CA\" - CANADA\n\
        \              \n\
        \               }\n\
        \          {-  \"CL\" - CHILE\n\
        \              \n\
        \               }\n\
        \          {-  \"CO\" - COLOMBIA\n\
        \              \n\
        \               }\n\
        \          {-  \"CR\" - COSTA RICA\n\
        \              \n\
        \               }\n\
        \          {-  \"HR\" - CROATIA\n\
        \              \n\
        \               }\n\
        \          {-  \"CZ\" - CZECH REPUBLIC\n\
        \              \n\
        \               }\n\
        \          {-  \"DK\" - DENMARK\n\
        \              \n\
        \               }\n\
        \          {-  \"EC\" - ECUADOR\n\
        \              \n\
        \               }\n\
        \          {-  \"EE\" - ESTONIA\n\
        \              \n\
        \               }\n\
        \          {-  \"ET\" - ETHIOPIA\n\
        \              \n\
        \               }\n\
        \          {-  \"FI\" - FINLAND\n\
        \              \n\
        \               }\n\
        \          {-  \"FR\" - FRANCE\n\
        \              \n\
        \               }\n\
        \          {-  \"DE\" - GERMANY\n\
        \              \n\
        \               }\n\
        \          {-  \"GR\" - GREECE\n\
        \              \n\
        \               }\n\
        \          {-  \"HU\" - HUNGARY\n\
        \              \n\
        \               }\n\
        \          {-  \"IS\" - ICELAND\n\
        \              \n\
        \               }\n\
        \          {-  \"IN\" - INDIA\n\
        \              \n\
        \               }\n\
        \          {-  \"IE\" - IRELAND\n\
        \              \n\
        \               }\n\
        \          {-  \"IT\" - ITALY\n\
        \              \n\
        \               }\n\
        \          {-  \"JP\" - JAPAN\n\
        \              \n\
        \               }\n\
        \          {-  \"KZ\" - KAZAKHSTAN\n\
        \              \n\
        \               }\n\
        \          {-  \"KR\" - KOREA\n\
        \              \n\
        \               }\n\
        \          {-  \"LV\" - LATVIA\n\
        \              \n\
        \               }\n\
        \          {-  \"LI\" - LIECHTENSTEIN\n\
        \              \n\
        \               }\n\
        \          {-  \"LT\" - LITHUANIA\n\
        \              \n\
        \               }\n\
        \          {-  \"LU\" - LUXEMBOURG\n\
        \              \n\
        \               }\n\
        \          {-  \"MK\" - MACEDONIA\n\
        \              \n\
        \               }\n\
        \          {-  \"MT\" - MALTA\n\
        \              \n\
        \               }\n\
        \          {-  \"MX\" - MEXICO\n\
        \              \n\
        \               }\n\
        \          {-  \"MD\" - MOLDOVA\n\
        \              \n\
        \               }\n\
        \          {-  \"ME\" - MONTENEGRO\n\
        \              \n\
        \               }\n\
        \          {-  \"NL\" - NETHERLANDS\n\
        \              \n\
        \               }\n\
        \          {-  \"NZ\" - NEW ZEALAND\n\
        \              \n\
        \               }\n\
        \          {-  \"NI\" - NICARAGUA\n\
        \              \n\
        \               }\n\
        \          {-  \"NG\" - NIGERIA\n\
        \              \n\
        \               }\n\
        \          {-  \"NO\" - NORWAY\n\
        \              \n\
        \               }\n\
        \          {-  \"PA\" - PANAMA\n\
        \              \n\
        \               }\n\
        \          {-  \"PY\" - PARAGUAY\n\
        \              \n\
        \               }\n\
        \          {-  \"PE\" - PERU\n\
        \              \n\
        \               }\n\
        \          {-  \"PL\" - POLAND\n\
        \              \n\
        \               }\n\
        \          {-  \"PT\" - PORTUGAL\n\
        \              \n\
        \               }\n\
        \          {-  \"RO\" - ROMANIA\n\
        \              \n\
        \               }\n\
        \          {-  \"RU\" - RUSSIA\n\
        \              \n\
        \               }\n\
        \          {-  \"RS\" - SERBIA\n\
        \              \n\
        \               }\n\
        \          {-  \"SK\" - SLOVAKIA\n\
        \              \n\
        \               }\n\
        \          {-  \"SI\" - SLOVENIA\n\
        \              \n\
        \               }\n\
        \          {-  \"ZA\" - SOUTH AFRICA\n\
        \              \n\
        \               }\n\
        \          {-  \"ES\" - SPAIN\n\
        \              \n\
        \               }\n\
        \          {-  \"SE\" - SWEDEN\n\
        \              \n\
        \               }\n\
        \          {-  \"CH\" - SWITZERLAND\n\
        \              \n\
        \               }\n\
        \          {-  \"UA\" - UKRAINE\n\
        \              \n\
        \               }\n\
        \          {-  \"AE\" - UNITED ARAB EMIRATES\n\
        \              \n\
        \               }\n\
        \          {-  \"US\" - UNITED STATES\n\
        \              \n\
        \               }\n\
        \          {-  \"UK\" - UNITED KINGDOM\n\
        \              \n\
        \               }\n\
        \          {-  \"UY\" - URUGUAY\n\
        \              \n\
        \               }\n\
        \          {-  \"VE\" - VENEZUELA\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  " This object belongs to the [CreatePredictor] operation. If you created your predictor with \
   [CreateAutoPredictor], see [AdditionalDataset].\n\
  \ \n\
  \   Describes a supplementary feature of a dataset group. This object is part of the \
   [InputDataConfig] object. Forecast supports the Weather Index and Holidays built-in \
   featurizations.\n\
  \   \n\
  \     {b Weather Index} \n\
  \    \n\
  \     The Amazon Forecast Weather Index is a built-in featurization that incorporates historical \
   and projected weather information into your model. The Weather Index supplements your datasets \
   with over two years of historical weather data and up to 14 days of projected weather data. For \
   more information, see {{:https://docs.aws.amazon.com/forecast/latest/dg/weather.html}Amazon \
   Forecast Weather Index}.\n\
  \     \n\
  \       {b Holidays} \n\
  \      \n\
  \       Holidays is a built-in featurization that incorporates a feature-engineered dataset of \
   national holiday information into your model. It provides native support for the holiday \
   calendars of 66 countries. To view the holiday calendars, refer to the \
   {{:http://jollyday.sourceforge.net/data.html}Jollyday} library. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/holidays.html}Holidays Featurization}.\n\
  \       "]

type nonrec supplementary_features = supplementary_feature list [@@ocaml.doc ""]

type nonrec input_data_config = {
  dataset_group_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
  supplementary_features : supplementary_features option;
      [@ocaml.doc
        "An array of supplementary features. The only supported feature is a holiday calendar.\n"]
}
[@@ocaml.doc
  " This object belongs to the [CreatePredictor] operation. If you created your predictor with \
   [CreateAutoPredictor], see [DataConfig].\n\
  \ \n\
  \   The data used to train a predictor. The data includes a dataset group and any supplementary \
   features. You specify this object in the [CreatePredictor] request.\n\
  \   "]

type nonrec scaling_type =
  | Auto [@ocaml.doc ""]
  | Linear [@ocaml.doc ""]
  | Logarithmic [@ocaml.doc ""]
  | ReverseLogarithmic [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer_parameter_range = {
  name : name; [@ocaml.doc "The name of the hyperparameter to tune.\n"]
  max_value : integer; [@ocaml.doc "The maximum tunable value of the hyperparameter.\n"]
  min_value : integer; [@ocaml.doc "The minimum tunable value of the hyperparameter.\n"]
  scaling_type : scaling_type option;
      [@ocaml.doc
        "The scale that hyperparameter tuning uses to search the hyperparameter range. Valid \
         values:\n\n\
        \  Auto  Amazon Forecast hyperparameter tuning chooses the best scale for the \
         hyperparameter.\n\
        \        \n\
        \          Linear  Hyperparameter tuning searches the values in the hyperparameter range \
         by using a linear scale.\n\
        \                  \n\
        \                    Logarithmic  Hyperparameter tuning searches the values in the \
         hyperparameter range by using a logarithmic scale.\n\
        \                                 \n\
        \                                  Logarithmic scaling works only for ranges that have \
         values greater than 0.\n\
        \                                  \n\
        \                                    ReverseLogarithmic  Not supported for \
         [IntegerParameterRange].\n\
        \                                                        \n\
        \                                                         Reverse logarithmic scaling \
         works only for ranges that are entirely within the range 0 <= x < 1.0.\n\
        \                                                         \n\
        \                                                            For information about \
         choosing a hyperparameter scale, see \
         {{:http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type}Hyperparameter \
         Scaling}. One of the following values:\n\
        \                                                            "]
}
[@@ocaml.doc
  "Specifies an integer hyperparameter and it's range of tunable values. This object is part of \
   the [ParameterRanges] object.\n"]

type nonrec integer_parameter_ranges = integer_parameter_range list [@@ocaml.doc ""]

type nonrec continuous_parameter_range = {
  name : name; [@ocaml.doc "The name of the hyperparameter to tune.\n"]
  max_value : double; [@ocaml.doc "The maximum tunable value of the hyperparameter.\n"]
  min_value : double; [@ocaml.doc "The minimum tunable value of the hyperparameter.\n"]
  scaling_type : scaling_type option;
      [@ocaml.doc
        "The scale that hyperparameter tuning uses to search the hyperparameter range. Valid \
         values:\n\n\
        \  Auto  Amazon Forecast hyperparameter tuning chooses the best scale for the \
         hyperparameter.\n\
        \        \n\
        \          Linear  Hyperparameter tuning searches the values in the hyperparameter range \
         by using a linear scale.\n\
        \                  \n\
        \                    Logarithmic  Hyperparameter tuning searches the values in the \
         hyperparameter range by using a logarithmic scale.\n\
        \                                 \n\
        \                                  Logarithmic scaling works only for ranges that have \
         values greater than 0.\n\
        \                                  \n\
        \                                    ReverseLogarithmic  hyperparameter tuning searches \
         the values in the hyperparameter range by using a reverse logarithmic scale.\n\
        \                                                        \n\
        \                                                         Reverse logarithmic scaling \
         works only for ranges that are entirely within the range 0 <= x < 1.0.\n\
        \                                                         \n\
        \                                                            For information about \
         choosing a hyperparameter scale, see \
         {{:http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type}Hyperparameter \
         Scaling}. One of the following values:\n\
        \                                                            "]
}
[@@ocaml.doc
  "Specifies a continuous hyperparameter and it's range of tunable values. This object is part of \
   the [ParameterRanges] object.\n"]

type nonrec continuous_parameter_ranges = continuous_parameter_range list [@@ocaml.doc ""]

type nonrec categorical_parameter_range = {
  name : name; [@ocaml.doc "The name of the categorical hyperparameter to tune.\n"]
  values : values; [@ocaml.doc "A list of the tunable categories for the hyperparameter.\n"]
}
[@@ocaml.doc
  "Specifies a categorical hyperparameter and it's range of tunable values. This object is part of \
   the [ParameterRanges] object.\n"]

type nonrec categorical_parameter_ranges = categorical_parameter_range list [@@ocaml.doc ""]

type nonrec parameter_ranges = {
  categorical_parameter_ranges : categorical_parameter_ranges option;
      [@ocaml.doc "Specifies the tunable range for each categorical hyperparameter.\n"]
  continuous_parameter_ranges : continuous_parameter_ranges option;
      [@ocaml.doc "Specifies the tunable range for each continuous hyperparameter.\n"]
  integer_parameter_ranges : integer_parameter_ranges option;
      [@ocaml.doc "Specifies the tunable range for each integer hyperparameter.\n"]
}
[@@ocaml.doc
  "Specifies the categorical, continuous, and integer hyperparameters, and their ranges of tunable \
   values. The range of tunable values determines which values that a hyperparameter tuning job \
   can choose for the specified hyperparameter. This object is part of the \
   [HyperParameterTuningJobConfig] object.\n"]

type nonrec hyper_parameter_tuning_job_config = {
  parameter_ranges : parameter_ranges option;
      [@ocaml.doc "Specifies the ranges of valid values for the hyperparameters.\n"]
}
[@@ocaml.doc
  "Configuration information for a hyperparameter tuning job. You specify this object in the \
   [CreatePredictor] request.\n\n\
  \ A {i hyperparameter} is a parameter that governs the model training process. You set \
   hyperparameters before training starts, unlike model parameters, which are determined during \
   training. The values of the hyperparameters effect which values are chosen for the model \
   parameters.\n\
  \ \n\
  \  In a {i hyperparameter tuning job}, Amazon Forecast chooses the set of hyperparameter values \
   that optimize a specified metric. Forecast accomplishes this by running many training jobs over \
   a range of hyperparameter values. The optimum set of values depends on the algorithm, the \
   training data, and the specified metric objective.\n\
  \  "]

type nonrec evaluation_parameters = {
  number_of_backtest_windows : integer option;
      [@ocaml.doc
        "The number of times to split the input data. The default is 1. Valid values are 1 through \
         5.\n"]
  back_test_window_offset : integer option;
      [@ocaml.doc
        "The point from the end of the dataset where you want to split the data for model training \
         and testing (evaluation). Specify the value as the number of data points. The default is \
         the value of the forecast horizon. [BackTestWindowOffset] can be used to mimic a past \
         virtual forecast start date. This value must be greater than or equal to the forecast \
         horizon and less than half of the TARGET_TIME_SERIES dataset length.\n\n\
        \  [ForecastHorizon] <= [BackTestWindowOffset] < 1/2 * TARGET_TIME_SERIES dataset length\n\
        \ "]
}
[@@ocaml.doc
  "Parameters that define how to split a dataset into training data and testing data, and the \
   number of iterations to perform. These parameters are specified in the predefined algorithms \
   but you can override them in the [CreatePredictor] request.\n"]

type nonrec training_parameters = (parameter_key * parameter_value) list [@@ocaml.doc ""]

type nonrec describe_predictor_response = {
  predictor_arn : name option; [@ocaml.doc "The ARN of the predictor.\n"]
  predictor_name : name option; [@ocaml.doc "The name of the predictor.\n"]
  algorithm_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the algorithm used for model training.\n"]
  auto_ml_algorithm_arns : arn_list option;
      [@ocaml.doc "When [PerformAutoML] is specified, the ARN of the chosen algorithm.\n"]
  forecast_horizon : integer option;
      [@ocaml.doc
        "The number of time-steps of the forecast. The forecast horizon is also called the \
         prediction length.\n"]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "The forecast types used during predictor training. Default value is \
         [\\[\"0.1\",\"0.5\",\"0.9\"\\]] \n"]
  perform_auto_m_l : boolean_ option;
      [@ocaml.doc "Whether the predictor is set to perform AutoML.\n"]
  auto_ml_override_strategy : auto_ml_override_strategy option;
      [@ocaml.doc
        "  The [LatencyOptimized] AutoML override strategy is only available in private beta. \
         Contact Amazon Web Services Support or your account manager to learn more about access \
         privileges. \n\
        \ \n\
        \   The AutoML strategy used to train the predictor. Unless [LatencyOptimized] is \
         specified, the AutoML strategy optimizes predictor accuracy.\n\
        \   \n\
        \    This parameter is only valid for predictors trained using AutoML.\n\
        \    "]
  perform_hp_o : boolean_ option;
      [@ocaml.doc "Whether the predictor is set to perform hyperparameter optimization (HPO).\n"]
  training_parameters : training_parameters option;
      [@ocaml.doc
        "The default training parameters or overrides selected during model training. When running \
         AutoML or choosing HPO with CNN-QR or DeepAR+, the optimized values for the chosen \
         hyperparameters are returned. For more information, see [aws-forecast-choosing-recipes].\n"]
  evaluation_parameters : evaluation_parameters option;
      [@ocaml.doc
        "Used to override the default evaluation parameters of the specified algorithm. Amazon \
         Forecast evaluates a predictor by splitting a dataset into training data and testing \
         data. The evaluation parameters define how to perform the split and the number of \
         iterations.\n"]
  hpo_config : hyper_parameter_tuning_job_config option;
      [@ocaml.doc "The hyperparameter override values for the algorithm.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "Describes the dataset group that contains the data to use to train the predictor.\n"]
  featurization_config : featurization_config option;
      [@ocaml.doc "The featurization configuration.\n"]
  encryption_config : encryption_config option;
      [@ocaml.doc
        "An Key Management Service (KMS) key and the Identity and Access Management (IAM) role \
         that Amazon Forecast can assume to access the key.\n"]
  predictor_execution_details : predictor_execution_details option;
      [@ocaml.doc
        "Details on the the status and results of the backtests performed to evaluate the accuracy \
         of the predictor. You specify the number of backtests to perform when you call the \
         operation.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The estimated time remaining in minutes for the predictor training job to complete.\n"]
  is_auto_predictor : boolean_ option;
      [@ocaml.doc "Whether the predictor was created with [CreateAutoPredictor].\n"]
  dataset_import_job_arns : arn_list option;
      [@ocaml.doc
        "An array of the ARNs of the dataset import jobs used to import training data for the \
         predictor.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the predictor. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the predictor must be [ACTIVE] before you can use the predictor to \
         create a forecast.\n\
        \    \n\
        \     "]
  message : message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the model training task was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  optimization_metric : optimization_metric option;
      [@ocaml.doc "The accuracy metric used to optimize the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_predictor_request = {
  predictor_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the predictor that you want information about.\n"]
}
[@@ocaml.doc ""]

type nonrec baseline_metric = {
  name : name option; [@ocaml.doc "The name of the metric.\n"]
  value : double option; [@ocaml.doc "The value for the metric.\n"]
}
[@@ocaml.doc
  "An individual metric that you can use for comparison as you evaluate your monitoring results.\n"]

type nonrec baseline_metrics = baseline_metric list [@@ocaml.doc ""]

type nonrec predictor_baseline = {
  baseline_metrics : baseline_metrics option;
      [@ocaml.doc
        "The initial {{:https://docs.aws.amazon.com/forecast/latest/dg/metrics.html}accuracy \
         metrics} for the predictor. Use these metrics as a baseline for comparison purposes as \
         you use your predictor and the metrics change.\n"]
}
[@@ocaml.doc
  "Metrics you can use as a baseline for comparison purposes. Use these metrics when you interpret \
   monitoring results for an auto predictor.\n"]

type nonrec baseline = {
  predictor_baseline : predictor_baseline option;
      [@ocaml.doc
        "The initial {{:https://docs.aws.amazon.com/forecast/latest/dg/metrics.html}accuracy \
         metrics} for the predictor you are monitoring. Use these metrics as a baseline for \
         comparison purposes as you use your predictor and the metrics change.\n"]
}
[@@ocaml.doc
  "Metrics you can use as a baseline for comparison purposes. Use these metrics when you interpret \
   monitoring results for an auto predictor.\n"]

type nonrec describe_monitor_response = {
  monitor_name : name option; [@ocaml.doc "The name of the monitor.\n"]
  monitor_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource described.\n"]
  resource_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the auto predictor being monitored.\n"]
  status : status option; [@ocaml.doc "The status of the monitor resource.\n"]
  last_evaluation_time : timestamp option;
      [@ocaml.doc "The timestamp of the latest evaluation completed by the monitor.\n"]
  last_evaluation_state : evaluation_state option;
      [@ocaml.doc "The state of the monitor's latest evaluation.\n"]
  baseline : baseline option;
      [@ocaml.doc
        "Metrics you can use as a baseline for comparison purposes. Use these values you interpret \
         monitoring results for an auto predictor.\n"]
  message : message option; [@ocaml.doc "An error message, if any, for the monitor.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp for when the monitor resource was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc "The timestamp of the latest modification to the monitor.\n"]
  estimated_evaluation_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The estimated number of minutes remaining before the monitor resource finishes its \
         current evaluation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_monitor_request = {
  monitor_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_forecast_export_job_response = {
  forecast_export_job_arn : arn option; [@ocaml.doc "The ARN of the forecast export job.\n"]
  forecast_export_job_name : name option; [@ocaml.doc "The name of the forecast export job.\n"]
  forecast_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the exported forecast.\n"]
  destination : data_destination option;
      [@ocaml.doc
        "The path to the Amazon Simple Storage Service (Amazon S3) bucket where the forecast is \
         exported.\n"]
  message : message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the forecast export job. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the forecast export job must be [ACTIVE] before you can access the \
         forecast in your S3 bucket.\n\
        \    \n\
        \     "]
  creation_time : timestamp option; [@ocaml.doc "When the forecast export job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_forecast_export_job_request = {
  forecast_export_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast export job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_forecast_response = {
  forecast_arn : arn option; [@ocaml.doc "The forecast ARN as specified in the request.\n"]
  forecast_name : name option; [@ocaml.doc "The name of the forecast.\n"]
  forecast_types : forecast_types option;
      [@ocaml.doc "The quantiles at which probabilistic forecasts were generated.\n"]
  predictor_arn : arn option;
      [@ocaml.doc "The ARN of the predictor used to generate the forecast.\n"]
  dataset_group_arn : arn option;
      [@ocaml.doc
        "The ARN of the dataset group that provided the data used to train the predictor.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc "The estimated time remaining in minutes for the forecast job to complete.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the forecast. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The [Status] of the forecast must be [ACTIVE] before you can query or export the \
         forecast.\n\
        \    \n\
        \     "]
  message : error_message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the forecast creation task was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  time_series_selector : time_series_selector option;
      [@ocaml.doc "The time series to include in the forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_forecast_request = {
  forecast_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_explainability_export_response = {
  explainability_export_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability export.\n"]
  explainability_export_name : name option; [@ocaml.doc "The name of the Explainability export.\n"]
  explainability_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability export.\n"]
  destination : data_destination option; [@ocaml.doc ""]
  message : message option;
      [@ocaml.doc "Information about any errors that occurred during the export.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the Explainability export. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : timestamp option; [@ocaml.doc "When the Explainability export was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_explainability_export_request = {
  explainability_export_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability export.\n"]
}
[@@ocaml.doc ""]

type nonrec local_date_time = string [@@ocaml.doc ""]

type nonrec describe_explainability_response = {
  explainability_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability.\n"]
  explainability_name : name option; [@ocaml.doc "The name of the Explainability.\n"]
  resource_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the \
         Explainability resource.\n"]
  explainability_config : explainability_config option;
      [@ocaml.doc
        "The configuration settings that define the granularity of time series and time points for \
         the Explainability.\n"]
  enable_visualization : boolean_ option;
      [@ocaml.doc "Whether the visualization was enabled for the Explainability resource.\n"]
  data_source : data_source option; [@ocaml.doc ""]
  schema : schema option; [@ocaml.doc ""]
  start_date_time : local_date_time option;
      [@ocaml.doc
        "If [TimePointGranularity] is set to [SPECIFIC], the first time point in the Explainability.\n"]
  end_date_time : local_date_time option;
      [@ocaml.doc
        "If [TimePointGranularity] is set to [SPECIFIC], the last time point in the Explainability.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The estimated time remaining in minutes for the [CreateExplainability] job to complete.\n"]
  message : message option; [@ocaml.doc "If an error occurred, a message about the error.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the Explainability resource. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : timestamp option; [@ocaml.doc "When the Explainability resource was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_explainability_request = {
  explainability_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explaianability to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec statistics = {
  count : integer option;
      [@ocaml.doc
        "The number of values in the field. If the response value is -1, refer to [CountLong].\n"]
  count_distinct : integer option;
      [@ocaml.doc
        "The number of distinct values in the field. If the response value is -1, refer to \
         [CountDistinctLong].\n"]
  count_null : integer option;
      [@ocaml.doc
        "The number of null values in the field. If the response value is -1, refer to \
         [CountNullLong].\n"]
  count_nan : integer option;
      [@ocaml.doc
        "The number of NAN (not a number) values in the field. If the response value is -1, refer \
         to [CountNanLong].\n"]
  min : string_ option; [@ocaml.doc "For a numeric field, the minimum value in the field.\n"]
  max : string_ option; [@ocaml.doc "For a numeric field, the maximum value in the field.\n"]
  avg : double option; [@ocaml.doc "For a numeric field, the average value in the field.\n"]
  stddev : double option; [@ocaml.doc "For a numeric field, the standard deviation.\n"]
  count_long : long option;
      [@ocaml.doc
        "The number of values in the field. [CountLong] is used instead of [Count] if the value is \
         greater than 2,147,483,647.\n"]
  count_distinct_long : long option;
      [@ocaml.doc
        "The number of distinct values in the field. [CountDistinctLong] is used instead of \
         [CountDistinct] if the value is greater than 2,147,483,647.\n"]
  count_null_long : long option;
      [@ocaml.doc
        "The number of null values in the field. [CountNullLong] is used instead of [CountNull] if \
         the value is greater than 2,147,483,647.\n"]
  count_nan_long : long option;
      [@ocaml.doc
        "The number of NAN (not a number) values in the field. [CountNanLong] is used instead of \
         [CountNan] if the value is greater than 2,147,483,647.\n"]
}
[@@ocaml.doc
  "Provides statistics for each data field imported into to an Amazon Forecast dataset with the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   operation.\n"]

type nonrec field_statistics = (string_ * statistics) list [@@ocaml.doc ""]

type nonrec geolocation_format = string [@@ocaml.doc ""]

type nonrec use_geolocation_for_time_zone = bool [@@ocaml.doc ""]

type nonrec time_zone = string [@@ocaml.doc ""]

type nonrec describe_dataset_import_job_response = {
  dataset_import_job_name : name option; [@ocaml.doc "The name of the dataset import job.\n"]
  dataset_import_job_arn : arn option; [@ocaml.doc "The ARN of the dataset import job.\n"]
  dataset_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset that the training data was imported to.\n"]
  timestamp_format : timestamp_format option;
      [@ocaml.doc
        "The format of timestamps in the dataset. The format that you specify depends on the \
         [DataFrequency] specified when the dataset was created. The following formats are \
         supported\n\n\
        \ {ul\n\
        \       {-  \"yyyy-MM-dd\"\n\
        \           \n\
        \            For the following data frequencies: Y, M, W, and D\n\
        \            \n\
        \             }\n\
        \       {-  \"yyyy-MM-dd HH:mm:ss\"\n\
        \           \n\
        \            For the following data frequencies: H, 30min, 15min, and 1min; and \
         optionally, for: Y, M, W, and D\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  time_zone : time_zone option;
      [@ocaml.doc "The single time zone applied to every item in the dataset\n"]
  use_geolocation_for_time_zone : use_geolocation_for_time_zone option;
      [@ocaml.doc "Whether [TimeZone] is automatically derived from the geolocation attribute.\n"]
  geolocation_format : geolocation_format option;
      [@ocaml.doc
        "The format of the geolocation attribute. Valid Values:[\"LAT_LONG\"] and \
         [\"CC_POSTALCODE\"].\n"]
  data_source : data_source option;
      [@ocaml.doc
        "The location of the training data to import and an Identity and Access Management (IAM) \
         role that Amazon Forecast can assume to access the data.\n\n\
        \ If encryption is used, [DataSource] includes an Key Management Service (KMS) key.\n\
        \ "]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The estimated time remaining in minutes for the dataset import job to complete.\n"]
  field_statistics : field_statistics option;
      [@ocaml.doc "Statistical information about each field in the input data.\n"]
  data_size : double option;
      [@ocaml.doc "The size of the dataset in gigabytes (GB) after the import job has finished.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset import job. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : message option;
      [@ocaml.doc "If an error occurred, an informational message about the error.\n"]
  creation_time : timestamp option; [@ocaml.doc "When the dataset import job was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the imported data, CSV or PARQUET.\n"]
  import_mode : import_mode option;
      [@ocaml.doc "The import mode of the dataset import job, FULL or INCREMENTAL.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_import_job_request = {
  dataset_import_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_group_response = {
  dataset_group_name : name option; [@ocaml.doc "The name of the dataset group.\n"]
  dataset_group_arn : arn option; [@ocaml.doc "The ARN of the dataset group.\n"]
  dataset_arns : arn_list option;
      [@ocaml.doc
        "An array of Amazon Resource Names (ARNs) of the datasets contained in the dataset group.\n"]
  domain : domain option; [@ocaml.doc "The domain associated with the dataset group.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset group. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_PENDING], [UPDATE_IN_PROGRESS], [UPDATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The [UPDATE] states apply when you call the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html}UpdateDatasetGroup} \
         operation.\n\
        \   \n\
        \     The [Status] of the dataset group must be [ACTIVE] before you can use the dataset \
         group to create a predictor.\n\
        \     \n\
        \      "]
  creation_time : timestamp option; [@ocaml.doc "When the dataset group was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "When the dataset group was created or last updated from a call to the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html}UpdateDatasetGroup} \
         operation. While the dataset group is being updated, [LastModificationTime] is the \
         current time of the [DescribeDatasetGroup] call.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_group_request = {
  dataset_group_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_response = {
  dataset_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset.\n"]
  dataset_name : name option; [@ocaml.doc "The name of the dataset.\n"]
  domain : domain option; [@ocaml.doc "The domain associated with the dataset.\n"]
  dataset_type : dataset_type option; [@ocaml.doc "The dataset type.\n"]
  data_frequency : frequency option;
      [@ocaml.doc
        "The frequency of data collection.\n\n\
        \ Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min (30 \
         minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and 1min (1 minute). \
         For example, \"M\" indicates every month and \"30min\" indicates every 30 minutes.\n\
        \ "]
  schema : schema option;
      [@ocaml.doc
        "An array of [SchemaAttribute] objects that specify the dataset fields. Each \
         [SchemaAttribute] specifies the name and data type of a field.\n"]
  encryption_config : encryption_config option;
      [@ocaml.doc
        "The Key Management Service (KMS) key and the Identity and Access Management (IAM) role \
         that Amazon Forecast can assume to access the key.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the dataset. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_PENDING], [UPDATE_IN_PROGRESS], [UPDATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The [UPDATE] states apply while data is imported to the dataset from a call to the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
         operation and reflect the status of the dataset import job. For example, when the import \
         job status is [CREATE_IN_PROGRESS], the status of the dataset is [UPDATE_IN_PROGRESS].\n\
        \   \n\
        \     The [Status] of the dataset must be [ACTIVE] before you can import training data.\n\
        \     \n\
        \      "]
  creation_time : timestamp option; [@ocaml.doc "When the dataset was created.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "When you create a dataset, [LastModificationTime] is the same as [CreationTime]. While \
         data is being imported to the dataset, [LastModificationTime] is the current time of the \
         [DescribeDataset] call. After a \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
         operation has finished, [LastModificationTime] is when the import job completed or failed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_request = {
  dataset_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec hour = int [@@ocaml.doc ""]

type nonrec day_of_week =
  | MONDAY [@ocaml.doc ""]
  | TUESDAY [@ocaml.doc ""]
  | WEDNESDAY [@ocaml.doc ""]
  | THURSDAY [@ocaml.doc ""]
  | FRIDAY [@ocaml.doc ""]
  | SATURDAY [@ocaml.doc ""]
  | SUNDAY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec day_of_month = int [@@ocaml.doc ""]

type nonrec month =
  | JANUARY [@ocaml.doc ""]
  | FEBRUARY [@ocaml.doc ""]
  | MARCH [@ocaml.doc ""]
  | APRIL [@ocaml.doc ""]
  | MAY [@ocaml.doc ""]
  | JUNE [@ocaml.doc ""]
  | JULY [@ocaml.doc ""]
  | AUGUST [@ocaml.doc ""]
  | SEPTEMBER [@ocaml.doc ""]
  | OCTOBER [@ocaml.doc ""]
  | NOVEMBER [@ocaml.doc ""]
  | DECEMBER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec time_alignment_boundary = {
  month : month option;
      [@ocaml.doc
        "The month to use for time alignment during aggregation. The month must be in uppercase.\n"]
  day_of_month : day_of_month option;
      [@ocaml.doc "The day of the month to use for time alignment during aggregation.\n"]
  day_of_week : day_of_week option;
      [@ocaml.doc
        "The day of week to use for time alignment during aggregation. The day must be in uppercase.\n"]
  hour : hour option; [@ocaml.doc "The hour of day to use for time alignment during aggregation.\n"]
}
[@@ocaml.doc
  "The time boundary Forecast uses to align and aggregate your data to match your forecast \
   frequency. Provide the unit of time and the time boundary as a key value pair. If you don't \
   provide a time boundary, Forecast uses a set of \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#default-time-boundaries}Default \
   Time Boundaries}. \n\n\
  \ For more information about aggregation, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html}Data Aggregation for \
   Different Forecast Frequencies}. For more information setting a custom time boundary, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#specifying-time-boundary}Specifying \
   a Time Boundary}. \n\
  \ "]

type nonrec monitor_info = {
  monitor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the monitor. States include:\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE_STOPPING], [ACTIVE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE_IN_PROGRESS] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Provides information about the monitor resource.\n"]

type nonrec explainability_info = {
  explainability_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the Explainability. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Provides information about the Explainability resource.\n"]

type nonrec transformations = (name * value) list [@@ocaml.doc ""]

type nonrec attribute_config = {
  attribute_name : name;
      [@ocaml.doc
        "The name of the attribute as specified in the schema. Amazon Forecast supports the target \
         field of the target time series and the related time series datasets. For example, for \
         the RETAIL domain, the target is [demand].\n"]
  transformations : transformations;
      [@ocaml.doc
        "The method parameters (key-value pairs), which are a map of override parameters. Specify \
         these parameters to override the default values. Related Time Series attributes do not \
         accept aggregation parameters.\n\n\
        \ The following list shows the parameters and their valid values for the \"filling\" \
         featurization method for a {b Target Time Series} dataset. Default values are bolded.\n\
        \ \n\
        \  {ul\n\
        \        {-   [aggregation]: {b sum}, [avg], [first], [min], [max] \n\
        \            \n\
        \             }\n\
        \        {-   [frontfill]: {b none} \n\
        \            \n\
        \             }\n\
        \        {-   [middlefill]: {b zero}, [nan] (not a number), [value], [median], [mean], \
         [min], [max] \n\
        \            \n\
        \             }\n\
        \        {-   [backfill]: {b zero}, [nan], [value], [median], [mean], [min], [max] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following list shows the parameters and their valid values for a {b Related Time \
         Series} featurization method (there are no defaults):\n\
        \   \n\
        \    {ul\n\
        \          {-   [middlefill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          {-   [backfill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          {-   [futurefill]: [zero], [value], [median], [mean], [min], [max] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To set a filling method to a specific value, set the fill parameter to [value] and \
         define the value in a corresponding [_value] parameter. For example, to set backfilling \
         to a value of 2, include the following: [\"backfill\": \"value\"] and \
         [\"backfill_value\":\"2\"]. \n\
        \   "]
}
[@@ocaml.doc
  "Provides information about the method used to transform attributes.\n\n\
  \ The following is an example using the RETAIL domain:\n\
  \ \n\
  \   [{] \n\
  \  \n\
  \    [\"AttributeName\": \"demand\",] \n\
  \   \n\
  \     [\"Transformations\": {\"aggregation\": \"sum\", \"middlefill\": \"zero\", \"backfill\":\n\
  \                \"zero\"}] \n\
  \    \n\
  \      [}] \n\
  \     "]

type nonrec attribute_configs = attribute_config list [@@ocaml.doc ""]

type nonrec data_config = {
  dataset_group_arn : arn;
      [@ocaml.doc "The ARN of the dataset group used to train the predictor.\n"]
  attribute_configs : attribute_configs option;
      [@ocaml.doc "Aggregation and filling options for attributes in your dataset group.\n"]
  additional_datasets : additional_datasets option;
      [@ocaml.doc "Additional built-in datasets like Holidays and the Weather Index.\n"]
}
[@@ocaml.doc "The data configuration for your dataset group and any additional datasets.\n"]

type nonrec describe_auto_predictor_response = {
  predictor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor\n"]
  predictor_name : name option; [@ocaml.doc "The name of the predictor.\n"]
  forecast_horizon : integer option;
      [@ocaml.doc
        "The number of time-steps that the model predicts. The forecast horizon is also called the \
         prediction length.\n"]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "The forecast types used during predictor training. Default value is \
         \\[\"0.1\",\"0.5\",\"0.9\"\\].\n"]
  forecast_frequency : frequency option;
      [@ocaml.doc
        "The frequency of predictions in a forecast.\n\n\
        \ Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min (30 \
         minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and 1min (1 minute). \
         For example, \"Y\" indicates every year and \"5min\" indicates every five minutes.\n\
        \ "]
  forecast_dimensions : forecast_dimensions option;
      [@ocaml.doc
        "An array of dimension (field) names that specify the attributes used to group your time \
         series.\n"]
  dataset_import_job_arns : arn_list option;
      [@ocaml.doc
        "An array of the ARNs of the dataset import jobs used to import training data for the \
         predictor.\n"]
  data_config : data_config option;
      [@ocaml.doc "The data configuration for your dataset group and any additional datasets.\n"]
  encryption_config : encryption_config option; [@ocaml.doc ""]
  reference_predictor_summary : reference_predictor_summary option;
      [@ocaml.doc
        "The ARN and state of the reference predictor. This parameter is only valid for retrained \
         or upgraded predictors.\n"]
  estimated_time_remaining_in_minutes : long option;
      [@ocaml.doc
        "The estimated time remaining in minutes for the predictor training job to complete.\n"]
  status : status option;
      [@ocaml.doc
        "The status of the predictor. States include: \n\n\
        \ {ul\n\
        \       {-   [ACTIVE] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_PENDING], [CREATE_IN_PROGRESS], [CREATE_FAILED] \n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING], [CREATE_STOPPED] \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_PENDING], [DELETE_IN_PROGRESS], [DELETE_FAILED] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : message option;
      [@ocaml.doc "In the event of an error, a message detailing the cause of the error.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The timestamp of the CreateAutoPredictor request.\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The last time the resource was modified. The timestamp depends on the status of the job:\n\n\
        \ {ul\n\
        \       {-   [CREATE_PENDING] - The [CreationTime].\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_IN_PROGRESS] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPING] - The current timestamp.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_STOPPED] - When the job stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] or [CREATE_FAILED] - When the job finished or failed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  optimization_metric : optimization_metric option;
      [@ocaml.doc "The accuracy metric used to optimize the predictor.\n"]
  explainability_info : explainability_info option;
      [@ocaml.doc "Provides the status and ARN of the Predictor Explainability.\n"]
  monitor_info : monitor_info option;
      [@ocaml.doc
        "A object with the Amazon Resource Name (ARN) and status of the monitor resource.\n"]
  time_alignment_boundary : time_alignment_boundary option;
      [@ocaml.doc "The time boundary Forecast uses when aggregating data.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_auto_predictor_request = {
  predictor_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_what_if_forecast_export_request = {
  what_if_forecast_export_arn : long_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if forecast export that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_what_if_forecast_request = {
  what_if_forecast_arn : long_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if forecast that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_what_if_analysis_request = {
  what_if_analysis_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the what-if analysis that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_tree_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the parent resource to delete. All child resources of \
         the parent resource will also be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_predictor_backtest_export_job_request = {
  predictor_backtest_export_job_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the predictor backtest export job to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_predictor_request = {
  predictor_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_monitor_request = {
  monitor_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_forecast_export_job_request = {
  forecast_export_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast export job to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_forecast_request = {
  forecast_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_explainability_export_request = {
  explainability_export_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability export to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_explainability_request = {
  explainability_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability resource to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_import_job_request = {
  dataset_import_job_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_group_request = {
  dataset_group_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_request = {
  dataset_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "There is already a resource with this name. Try again with a different name.\n"]

type nonrec create_what_if_forecast_export_response = {
  what_if_forecast_export_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec create_what_if_forecast_export_request = {
  what_if_forecast_export_name : name; [@ocaml.doc "The name of the what-if forecast to export.\n"]
  what_if_forecast_arns : what_if_forecast_arn_list_for_export;
      [@ocaml.doc "The list of what-if forecast Amazon Resource Names (ARNs) to export.\n"]
  destination : data_destination;
      [@ocaml.doc
        "The location where you want to save the forecast and an Identity and Access Management \
         (IAM) role that Amazon Forecast can assume to access the location. The forecast must be \
         exported to an Amazon S3 bucket.\n\n\
        \ If encryption is used, [Destination] must include an Key Management Service (KMS) key. \
         The IAM role must allow Amazon Forecast permission to access the key.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html}tags} \
         to apply to the what if forecast.\n"]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec create_what_if_forecast_response = {
  what_if_forecast_arn : long_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec create_what_if_forecast_request = {
  what_if_forecast_name : name;
      [@ocaml.doc
        "The name of the what-if forecast. Names must be unique within each what-if analysis.\n"]
  what_if_analysis_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if analysis.\n"]
  time_series_transformations : time_series_transformations option;
      [@ocaml.doc
        "The transformations that are applied to the baseline time series. Each transformation \
         contains an action and a set of conditions. An action is applied only when all conditions \
         are met. If no conditions are provided, the action is applied to all items.\n"]
  time_series_replacements_data_source : time_series_replacements_data_source option;
      [@ocaml.doc
        "The replacement time series dataset, which contains the rows that you want to change in \
         the related time series dataset. A replacement time series does not need to contain all \
         rows that are in the baseline related time series. Include only the rows \
         (measure-dimension combinations) that you want to include in the what-if forecast.\n\n\
        \ This dataset is merged with the original time series to create a transformed dataset \
         that is used for the what-if analysis.\n\
        \ \n\
        \  This dataset should contain the items to modify (such as item_id or workforce_type), \
         any relevant dimensions, the timestamp column, and at least one of the related time \
         series columns. This file should not contain duplicate timestamps for the same time \
         series.\n\
        \  \n\
        \   Timestamps and item_ids not included in this dataset are not included in the what-if \
         analysis. \n\
        \   "]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html}tags} \
         to apply to the what if forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec create_what_if_analysis_response = {
  what_if_analysis_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the what-if analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec create_what_if_analysis_request = {
  what_if_analysis_name : name;
      [@ocaml.doc "The name of the what-if analysis. Each name must be unique.\n"]
  forecast_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the baseline forecast.\n"]
  time_series_selector : time_series_selector option;
      [@ocaml.doc
        "Defines the set of time series that are used in the what-if analysis with a \
         [TimeSeriesIdentifiers] object. What-if analyses are performed only for the time series \
         in this object.\n\n\
        \ The [TimeSeriesIdentifiers] object needs the following information:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DataSource] \n\
        \            \n\
        \             }\n\
        \        {-   [Format] \n\
        \            \n\
        \             }\n\
        \        {-   [Schema] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html}tags} \
         to apply to the what if forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec create_predictor_backtest_export_job_response = {
  predictor_backtest_export_job_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the predictor backtest export job that you want to \
         export.\n"]
}
[@@ocaml.doc ""]

type nonrec create_predictor_backtest_export_job_request = {
  predictor_backtest_export_job_name : name; [@ocaml.doc "The name for the backtest export job.\n"]
  predictor_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor that you want to export.\n"]
  destination : data_destination; [@ocaml.doc ""]
  tags : tags option;
      [@ocaml.doc
        "Optional metadata to help you categorize and organize your backtests. Each tag consists \
         of a key and an optional value, both of which you define. Tag keys and values are case \
         sensitive.\n\n\
        \ The following restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  For each resource, each tag key must be unique and each tag key must have one \
         value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum number of tags per resource: 50.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length: 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length: 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Accepted characters: all letters and numbers, spaces representable in UTF-8, \
         and + - = . _ : / \\@. If your tagging schema is used across other services and \
         resources, the character restrictions of those services also apply. \n\
        \            \n\
        \             }\n\
        \        {-  Key prefixes cannot include any upper or lowercase combination of [aws:] or \
         [AWS:]. Values can have this prefix. If a tag value has [aws] as its prefix but the key \
         does not, Forecast considers it to be a user tag and will count against the limit of 50 \
         tags. Tags with only the key prefix of [aws] do not count against your tags per resource \
         limit. You cannot edit or delete tag keys with this prefix.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  format : format option;
      [@ocaml.doc "The format of the exported data, CSV or PARQUET. The default value is CSV.\n"]
}
[@@ocaml.doc ""]

type nonrec create_predictor_response = {
  predictor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec create_predictor_request = {
  predictor_name : name; [@ocaml.doc "A name for the predictor.\n"]
  algorithm_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the algorithm to use for model training. Required if \
         [PerformAutoML] is not set to [true].\n\n\
        \  {b Supported algorithms:} \n\
        \ \n\
        \  {ul\n\
        \        {-   [arn:aws:forecast:::algorithm/ARIMA] \n\
        \            \n\
        \             }\n\
        \        {-   [arn:aws:forecast:::algorithm/CNN-QR] \n\
        \            \n\
        \             }\n\
        \        {-   [arn:aws:forecast:::algorithm/Deep_AR_Plus] \n\
        \            \n\
        \             }\n\
        \        {-   [arn:aws:forecast:::algorithm/ETS] \n\
        \            \n\
        \             }\n\
        \        {-   [arn:aws:forecast:::algorithm/NPTS] \n\
        \            \n\
        \             }\n\
        \        {-   [arn:aws:forecast:::algorithm/Prophet] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  forecast_horizon : integer;
      [@ocaml.doc
        "Specifies the number of time-steps that the model is trained to predict. The forecast \
         horizon is also called the prediction length.\n\n\
        \ For example, if you configure a dataset for daily data collection (using the \
         [DataFrequency] parameter of the [CreateDataset] operation) and set the forecast horizon \
         to 10, the model returns predictions for 10 days.\n\
        \ \n\
        \  The maximum forecast horizon is the lesser of 500 time-steps or 1/3 of the \
         TARGET_TIME_SERIES dataset length.\n\
        \  "]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "Specifies the forecast types used to train a predictor. You can specify up to five \
         forecast types. Forecast types can be quantiles from 0.01 to 0.99, by increments of 0.01 \
         or higher. You can also specify the mean forecast with [mean]. \n\n\
        \ The default value is [\\[\"0.10\", \"0.50\", \"0.9\"\\]].\n\
        \ "]
  perform_auto_m_l : boolean_ option;
      [@ocaml.doc
        "Whether to perform AutoML. When Amazon Forecast performs AutoML, it evaluates the \
         algorithms it provides and chooses the best algorithm and configuration for your training \
         dataset.\n\n\
        \ The default value is [false]. In this case, you are required to specify an algorithm.\n\
        \ \n\
        \  Set [PerformAutoML] to [true] to have Amazon Forecast perform AutoML. This is a good \
         option if you aren't sure which algorithm is suitable for your training data. In this \
         case, [PerformHPO] must be false.\n\
        \  "]
  auto_ml_override_strategy : auto_ml_override_strategy option;
      [@ocaml.doc
        "  The [LatencyOptimized] AutoML override strategy is only available in private beta. \
         Contact Amazon Web Services Support or your account manager to learn more about access \
         privileges. \n\
        \ \n\
        \   Used to overide the default AutoML strategy, which is to optimize predictor accuracy. \
         To apply an AutoML strategy that minimizes training time, use [LatencyOptimized].\n\
        \   \n\
        \    This parameter is only valid for predictors trained using AutoML.\n\
        \    "]
  perform_hp_o : boolean_ option;
      [@ocaml.doc
        "Whether to perform hyperparameter optimization (HPO). HPO finds optimal hyperparameter \
         values for your training data. The process of performing HPO is known as running a \
         hyperparameter tuning job.\n\n\
        \ The default value is [false]. In this case, Amazon Forecast uses default hyperparameter \
         values from the chosen algorithm.\n\
        \ \n\
        \  To override the default values, set [PerformHPO] to [true] and, optionally, supply the \
         [HyperParameterTuningJobConfig] object. The tuning job specifies a metric to optimize, \
         which hyperparameters participate in tuning, and the valid range for each tunable \
         hyperparameter. In this case, you are required to specify an algorithm and \
         [PerformAutoML] must be false.\n\
        \  \n\
        \   The following algorithms support HPO:\n\
        \   \n\
        \    {ul\n\
        \          {-  DeepAR+\n\
        \              \n\
        \               }\n\
        \          {-  CNN-QR\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  training_parameters : training_parameters option;
      [@ocaml.doc
        "The hyperparameters to override for model training. The hyperparameters that you can \
         override are listed in the individual algorithms. For the list of supported algorithms, \
         see [aws-forecast-choosing-recipes].\n"]
  evaluation_parameters : evaluation_parameters option;
      [@ocaml.doc
        "Used to override the default evaluation parameters of the specified algorithm. Amazon \
         Forecast evaluates a predictor by splitting a dataset into training data and testing \
         data. The evaluation parameters define how to perform the split and the number of \
         iterations.\n"]
  hpo_config : hyper_parameter_tuning_job_config option;
      [@ocaml.doc
        "Provides hyperparameter override values for the algorithm. If you don't provide this \
         parameter, Amazon Forecast uses default values. The individual algorithms specify which \
         hyperparameters support hyperparameter optimization (HPO). For more information, see \
         [aws-forecast-choosing-recipes].\n\n\
        \ If you included the [HPOConfig] object, you must set [PerformHPO] to true.\n\
        \ "]
  input_data_config : input_data_config;
      [@ocaml.doc
        "Describes the dataset group that contains the data to use to train the predictor.\n"]
  featurization_config : featurization_config; [@ocaml.doc "The featurization configuration.\n"]
  encryption_config : encryption_config option;
      [@ocaml.doc
        "An Key Management Service (KMS) key and the Identity and Access Management (IAM) role \
         that Amazon Forecast can assume to access the key.\n"]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the predictor to help you categorize and organize \
         them. Each tag consists of a key and an optional value, both of which you define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  optimization_metric : optimization_metric option;
      [@ocaml.doc "The accuracy metric used to optimize the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec create_monitor_response = {
  monitor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the monitor resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_monitor_request = {
  monitor_name : name; [@ocaml.doc "The name of the monitor resource.\n"]
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor to monitor.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/tagging-forecast-resources.html}tags} \
         to apply to the monitor resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_forecast_export_job_response = {
  forecast_export_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the export job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_forecast_export_job_request = {
  forecast_export_job_name : name; [@ocaml.doc "The name for the forecast export job.\n"]
  forecast_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast that you want to export.\n"]
  destination : data_destination;
      [@ocaml.doc
        "The location where you want to save the forecast and an Identity and Access Management \
         (IAM) role that Amazon Forecast can assume to access the location. The forecast must be \
         exported to an Amazon S3 bucket.\n\n\
        \ If encryption is used, [Destination] must include an Key Management Service (KMS) key. \
         The IAM role must allow Amazon Forecast permission to access the key.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the forecast export job to help you categorize \
         and organize them. Each tag consists of a key and an optional value, both of which you \
         define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  format : format option;
      [@ocaml.doc "The format of the exported data, CSV or PARQUET. The default value is CSV.\n"]
}
[@@ocaml.doc ""]

type nonrec create_forecast_response = {
  forecast_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the forecast.\n"]
}
[@@ocaml.doc ""]

type nonrec create_forecast_request = {
  forecast_name : name; [@ocaml.doc "A name for the forecast.\n"]
  predictor_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the predictor to use to generate the forecast.\n"]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "The quantiles at which probabilistic forecasts are generated. {b You can currently \
         specify up to 5 quantiles per forecast}. Accepted values include [0.01 to 0.99] \
         (increments of .01 only) and [mean]. The mean forecast is different from the median \
         (0.50) when the distribution is not symmetric (for example, Beta and Negative Binomial). \
         \n\n\
        \ The default quantiles are the quantiles you specified during predictor creation. If you \
         didn't specify quantiles, the default values are [\\[\"0.1\", \"0.5\", \"0.9\"\\]]. \n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the forecast to help you categorize and organize \
         them. Each tag consists of a key and an optional value, both of which you define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  time_series_selector : time_series_selector option;
      [@ocaml.doc
        "Defines the set of time series that are used to create the forecasts in a \
         [TimeSeriesIdentifiers] object.\n\n\
        \ The [TimeSeriesIdentifiers] object needs the following information:\n\
        \ \n\
        \  {ul\n\
        \        {-   [DataSource] \n\
        \            \n\
        \             }\n\
        \        {-   [Format] \n\
        \            \n\
        \             }\n\
        \        {-   [Schema] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_explainability_export_response = {
  explainability_export_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the export.\n"]
}
[@@ocaml.doc ""]

type nonrec create_explainability_export_request = {
  explainability_export_name : name; [@ocaml.doc "A unique name for the Explainability export.\n"]
  explainability_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability to export.\n"]
  destination : data_destination; [@ocaml.doc ""]
  tags : tags option;
      [@ocaml.doc
        "Optional metadata to help you categorize and organize your resources. Each tag consists \
         of a key and an optional value, both of which you define. Tag keys and values are case \
         sensitive.\n\n\
        \ The following restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  For each resource, each tag key must be unique and each tag key must have one \
         value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum number of tags per resource: 50.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length: 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length: 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Accepted characters: all letters and numbers, spaces representable in UTF-8, \
         and + - = . _ : / \\@. If your tagging schema is used across other services and \
         resources, the character restrictions of those services also apply. \n\
        \            \n\
        \             }\n\
        \        {-  Key prefixes cannot include any upper or lowercase combination of [aws:] or \
         [AWS:]. Values can have this prefix. If a tag value has [aws] as its prefix but the key \
         does not, Forecast considers it to be a user tag and will count against the limit of 50 \
         tags. Tags with only the key prefix of [aws] do not count against your tags per resource \
         limit. You cannot edit or delete tag keys with this prefix.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  format : format option; [@ocaml.doc "The format of the exported data, CSV or PARQUET.\n"]
}
[@@ocaml.doc ""]

type nonrec create_explainability_response = {
  explainability_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Explainability.\n"]
}
[@@ocaml.doc ""]

type nonrec create_explainability_request = {
  explainability_name : name; [@ocaml.doc "A unique name for the Explainability.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Predictor or Forecast used to create the \
         Explainability.\n"]
  explainability_config : explainability_config;
      [@ocaml.doc
        "The configuration settings that define the granularity of time series and time points for \
         the Explainability.\n"]
  data_source : data_source option; [@ocaml.doc ""]
  schema : schema option; [@ocaml.doc ""]
  enable_visualization : boolean_ option;
      [@ocaml.doc
        "Create an Explainability visualization that is viewable within the Amazon Web Services \
         console.\n"]
  start_date_time : local_date_time option;
      [@ocaml.doc
        "If [TimePointGranularity] is set to [SPECIFIC], define the first point for the \
         Explainability.\n\n\
        \ Use the following timestamp format: yyyy-MM-ddTHH:mm:ss (example: 2015-01-01T20:00:00)\n\
        \ "]
  end_date_time : local_date_time option;
      [@ocaml.doc
        "If [TimePointGranularity] is set to [SPECIFIC], define the last time point for the \
         Explainability.\n\n\
        \ Use the following timestamp format: yyyy-MM-ddTHH:mm:ss (example: 2015-01-01T20:00:00)\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "Optional metadata to help you categorize and organize your resources. Each tag consists \
         of a key and an optional value, both of which you define. Tag keys and values are case \
         sensitive.\n\n\
        \ The following restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  For each resource, each tag key must be unique and each tag key must have one \
         value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum number of tags per resource: 50.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length: 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length: 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Accepted characters: all letters and numbers, spaces representable in UTF-8, \
         and + - = . _ : / \\@. If your tagging schema is used across other services and \
         resources, the character restrictions of those services also apply. \n\
        \            \n\
        \             }\n\
        \        {-  Key prefixes cannot include any upper or lowercase combination of [aws:] or \
         [AWS:]. Values can have this prefix. If a tag value has [aws] as its prefix but the key \
         does not, Forecast considers it to be a user tag and will count against the limit of 50 \
         tags. Tags with only the key prefix of [aws] do not count against your tags per resource \
         limit. You cannot edit or delete tag keys with this prefix.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_dataset_import_job_response = {
  dataset_import_job_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset import job.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_import_job_request = {
  dataset_import_job_name : name;
      [@ocaml.doc
        "The name for the dataset import job. We recommend including the current timestamp in the \
         name, for example, [20190721DatasetImport]. This can help you avoid getting a \
         [ResourceAlreadyExistsException] exception.\n"]
  dataset_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Forecast dataset that you want to import \
         data to.\n"]
  data_source : data_source;
      [@ocaml.doc
        "The location of the training data to import and an Identity and Access Management (IAM) \
         role that Amazon Forecast can assume to access the data. The training data must be stored \
         in an Amazon S3 bucket.\n\n\
        \ If encryption is used, [DataSource] must include an Key Management Service (KMS) key and \
         the IAM role must allow Amazon Forecast permission to access the key. The KMS key and IAM \
         role must match those specified in the [EncryptionConfig] parameter of the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html}CreateDataset} \
         operation.\n\
        \ "]
  timestamp_format : timestamp_format option;
      [@ocaml.doc
        "The format of timestamps in the dataset. The format that you specify depends on the \
         [DataFrequency] specified when the dataset was created. The following formats are \
         supported\n\n\
        \ {ul\n\
        \       {-  \"yyyy-MM-dd\"\n\
        \           \n\
        \            For the following data frequencies: Y, M, W, and D\n\
        \            \n\
        \             }\n\
        \       {-  \"yyyy-MM-dd HH:mm:ss\"\n\
        \           \n\
        \            For the following data frequencies: H, 30min, 15min, and 1min; and \
         optionally, for: Y, M, W, and D\n\
        \            \n\
        \             }\n\
        \       }\n\
        \   If the format isn't specified, Amazon Forecast expects the format to be \"yyyy-MM-dd \
         HH:mm:ss\".\n\
        \   "]
  time_zone : time_zone option;
      [@ocaml.doc
        "A single time zone for every item in your dataset. This option is ideal for datasets with \
         all timestamps within a single time zone, or if all timestamps are normalized to a single \
         time zone. \n\n\
        \ Refer to the {{:http://joda-time.sourceforge.net/timezones.html}Joda-Time API} for a \
         complete list of valid time zone names.\n\
        \ "]
  use_geolocation_for_time_zone : use_geolocation_for_time_zone option;
      [@ocaml.doc
        "Automatically derive time zone information from the geolocation attribute. This option is \
         ideal for datasets that contain timestamps in multiple time zones and those timestamps \
         are expressed in local time.\n"]
  geolocation_format : geolocation_format option;
      [@ocaml.doc
        "The format of the geolocation attribute. The geolocation attribute can be formatted in \
         one of two ways:\n\n\
        \ {ul\n\
        \       {-   [LAT_LONG] - the latitude and longitude in decimal format (Example: \
         47.61_-122.33).\n\
        \           \n\
        \            }\n\
        \       {-   [CC_POSTALCODE] (US Only) - the country code (US), followed by the 5-digit \
         ZIP code (Example: US_98121).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the dataset import job to help you categorize and \
         organize them. Each tag consists of a key and an optional value, both of which you \
         define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  format : format option;
      [@ocaml.doc "The format of the imported data, CSV or PARQUET. The default value is CSV.\n"]
  import_mode : import_mode option;
      [@ocaml.doc
        "Specifies whether the dataset import job is a [FULL] or [INCREMENTAL] import. A [FULL] \
         dataset import replaces all of the existing data with the newly imported data. An \
         [INCREMENTAL] import appends the imported data to the existing data.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_group_response = {
  dataset_group_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_group_request = {
  dataset_group_name : name; [@ocaml.doc "A name for the dataset group.\n"]
  domain : domain;
      [@ocaml.doc
        "The domain associated with the dataset group. When you add a dataset to a dataset group, \
         this value and the value specified for the [Domain] parameter of the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html}CreateDataset} \
         operation must match.\n\n\
        \ The [Domain] and [DatasetType] that you choose determine the fields that must be present \
         in training data that you import to a dataset. For example, if you choose the [RETAIL] \
         domain and [TARGET_TIME_SERIES] as the [DatasetType], Amazon Forecast requires that \
         [item_id], [timestamp], and [demand] fields are present in your data. For more \
         information, see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html}Dataset \
         groups}.\n\
        \ "]
  dataset_arns : arn_list option;
      [@ocaml.doc
        "An array of Amazon Resource Names (ARNs) of the datasets that you want to include in the \
         dataset group.\n"]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the dataset group to help you categorize and \
         organize them. Each tag consists of a key and an optional value, both of which you \
         define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_dataset_response = {
  dataset_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_request = {
  dataset_name : name; [@ocaml.doc "A name for the dataset.\n"]
  domain : domain;
      [@ocaml.doc
        "The domain associated with the dataset. When you add a dataset to a dataset group, this \
         value and the value specified for the [Domain] parameter of the \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \
         operation must match.\n\n\
        \ The [Domain] and [DatasetType] that you choose determine the fields that must be present \
         in the training data that you import to the dataset. For example, if you choose the \
         [RETAIL] domain and [TARGET_TIME_SERIES] as the [DatasetType], Amazon Forecast requires \
         [item_id], [timestamp], and [demand] fields to be present in your data. For more \
         information, see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html}Importing \
         datasets}.\n\
        \ "]
  dataset_type : dataset_type;
      [@ocaml.doc "The dataset type. Valid values depend on the chosen [Domain].\n"]
  data_frequency : frequency option;
      [@ocaml.doc
        "The frequency of data collection. This parameter is required for RELATED_TIME_SERIES \
         datasets.\n\n\
        \ Valid intervals are an integer followed by Y (Year), M (Month), W (Week), D (Day), H \
         (Hour), and min (Minute). For example, \"1D\" indicates every day and \"15min\" indicates \
         every 15 minutes. You cannot specify a value that would overlap with the next larger \
         frequency. That means, for example, you cannot specify a frequency of 60 minutes, because \
         that is equivalent to 1 hour. The valid values for each frequency are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Minute - 1-59\n\
        \            \n\
        \             }\n\
        \        {-  Hour - 1-23\n\
        \            \n\
        \             }\n\
        \        {-  Day - 1-6\n\
        \            \n\
        \             }\n\
        \        {-  Week - 1-4\n\
        \            \n\
        \             }\n\
        \        {-  Month - 1-11\n\
        \            \n\
        \             }\n\
        \        {-  Year - 1\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Thus, if you want every other week forecasts, specify \"2W\". Or, if you want \
         quarterly forecasts, you specify \"3M\".\n\
        \   "]
  schema : schema;
      [@ocaml.doc
        "The schema for the dataset. The schema attributes and their order must match the fields \
         in your data. The dataset [Domain] and [DatasetType] that you choose determine the \
         minimum required fields in your training data. For information about the required fields \
         for a specific dataset domain and type, see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/howitworks-domains-ds-types.html}Dataset \
         Domains and Dataset Types}.\n"]
  encryption_config : encryption_config option;
      [@ocaml.doc
        "An Key Management Service (KMS) key and the Identity and Access Management (IAM) role \
         that Amazon Forecast can assume to access the key.\n"]
  tags : tags option;
      [@ocaml.doc
        "The optional metadata that you apply to the dataset to help you categorize and organize \
         them. Each tag consists of a key and an optional value, both of which you define.\n\n\
        \ The following basic restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Maximum number of tags per resource - 50.\n\
        \            \n\
        \             }\n\
        \        {-  For each resource, each tag key must be unique, and each tag key can have \
         only one value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length - 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length - 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  If your tagging schema is used across multiple services and resources, \
         remember that other services may have restrictions on allowed characters. Generally \
         allowed characters are: letters, numbers, and spaces representable in UTF-8, and the \
         following characters: + - = . _ : / \\@.\n\
        \            \n\
        \             }\n\
        \        {-  Tag keys and values are case sensitive.\n\
        \            \n\
        \             }\n\
        \        {-  Do not use [aws:], [AWS:], or any upper or lowercase combination of such as a \
         prefix for keys as it is reserved for Amazon Web Services use. You cannot edit or delete \
         tag keys with this prefix. Values can have this prefix. If a tag value has [aws] as its \
         prefix but the key does not, then Forecast considers it to be a user tag and will count \
         against the limit of 50 tags. Tags with only the key prefix of [aws] do not count against \
         your tags per resource limit.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_auto_predictor_response = {
  predictor_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the predictor.\n"]
}
[@@ocaml.doc ""]

type nonrec monitor_config = {
  monitor_name : name; [@ocaml.doc "The name of the monitor resource.\n"]
}
[@@ocaml.doc "The configuration details for the predictor monitor.\n"]

type nonrec create_auto_predictor_request = {
  predictor_name : name; [@ocaml.doc "A unique name for the predictor\n"]
  forecast_horizon : integer option;
      [@ocaml.doc
        "The number of time-steps that the model predicts. The forecast horizon is also called the \
         prediction length.\n\n\
        \ The maximum forecast horizon is the lesser of 500 time-steps or 1/4 of the \
         TARGET_TIME_SERIES dataset length. If you are retraining an existing AutoPredictor, then \
         the maximum forecast horizon is the lesser of 500 time-steps or 1/3 of the \
         TARGET_TIME_SERIES dataset length.\n\
        \ \n\
        \  If you are upgrading to an AutoPredictor or retraining an existing AutoPredictor, you \
         cannot update the forecast horizon parameter. You can meet this requirement by providing \
         longer time-series in the dataset.\n\
        \  "]
  forecast_types : forecast_types option;
      [@ocaml.doc
        "The forecast types used to train a predictor. You can specify up to five forecast types. \
         Forecast types can be quantiles from 0.01 to 0.99, by increments of 0.01 or higher. You \
         can also specify the mean forecast with [mean].\n"]
  forecast_dimensions : forecast_dimensions option;
      [@ocaml.doc
        "An array of dimension (field) names that specify how to group the generated forecast.\n\n\
        \ For example, if you are generating forecasts for item sales across all your stores, and \
         your dataset contains a [store_id] field, you would specify [store_id] as a dimension to \
         group sales forecasts for each store.\n\
        \ "]
  forecast_frequency : frequency option;
      [@ocaml.doc
        "The frequency of predictions in a forecast.\n\n\
        \ Valid intervals are an integer followed by Y (Year), M (Month), W (Week), D (Day), H \
         (Hour), and min (Minute). For example, \"1D\" indicates every day and \"15min\" indicates \
         every 15 minutes. You cannot specify a value that would overlap with the next larger \
         frequency. That means, for example, you cannot specify a frequency of 60 minutes, because \
         that is equivalent to 1 hour. The valid values for each frequency are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Minute - 1-59\n\
        \            \n\
        \             }\n\
        \        {-  Hour - 1-23\n\
        \            \n\
        \             }\n\
        \        {-  Day - 1-6\n\
        \            \n\
        \             }\n\
        \        {-  Week - 1-4\n\
        \            \n\
        \             }\n\
        \        {-  Month - 1-11\n\
        \            \n\
        \             }\n\
        \        {-  Year - 1\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Thus, if you want every other week forecasts, specify \"2W\". Or, if you want \
         quarterly forecasts, you specify \"3M\".\n\
        \   \n\
        \    The frequency must be greater than or equal to the TARGET_TIME_SERIES dataset \
         frequency.\n\
        \    \n\
        \     When a RELATED_TIME_SERIES dataset is provided, the frequency must be equal to the \
         RELATED_TIME_SERIES dataset frequency.\n\
        \     "]
  data_config : data_config option;
      [@ocaml.doc "The data configuration for your dataset group and any additional datasets.\n"]
  encryption_config : encryption_config option; [@ocaml.doc ""]
  reference_predictor_arn : arn option;
      [@ocaml.doc
        "The ARN of the predictor to retrain or upgrade. This parameter is only used when \
         retraining or upgrading a predictor. When creating a new predictor, do not specify a \
         value for this parameter.\n\n\
        \ When upgrading or retraining a predictor, only specify values for the \
         [ReferencePredictorArn] and [PredictorName]. The value for [PredictorName] must be a \
         unique predictor name.\n\
        \ "]
  optimization_metric : optimization_metric option;
      [@ocaml.doc "The accuracy metric used to optimize the predictor.\n"]
  explain_predictor : boolean_ option;
      [@ocaml.doc "Create an Explainability resource for the predictor.\n"]
  tags : tags option;
      [@ocaml.doc
        "Optional metadata to help you categorize and organize your predictors. Each tag consists \
         of a key and an optional value, both of which you define. Tag keys and values are case \
         sensitive.\n\n\
        \ The following restrictions apply to tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  For each resource, each tag key must be unique and each tag key must have one \
         value.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum number of tags per resource: 50.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum key length: 128 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Maximum value length: 256 Unicode characters in UTF-8.\n\
        \            \n\
        \             }\n\
        \        {-  Accepted characters: all letters and numbers, spaces representable in UTF-8, \
         and + - = . _ : / \\@. If your tagging schema is used across other services and \
         resources, the character restrictions of those services also apply. \n\
        \            \n\
        \             }\n\
        \        {-  Key prefixes cannot include any upper or lowercase combination of [aws:] or \
         [AWS:]. Values can have this prefix. If a tag value has [aws] as its prefix but the key \
         does not, Forecast considers it to be a user tag and will count against the limit of 50 \
         tags. Tags with only the key prefix of [aws] do not count against your tags per resource \
         limit. You cannot edit or delete tag keys with this prefix.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  monitor_config : monitor_config option;
      [@ocaml.doc
        "The configuration details for predictor monitoring. Provide a name for the monitor \
         resource to enable predictor monitoring.\n\n\
        \ Predictor monitoring allows you to see how your predictor's performance changes over \
         time. For more information, see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring.html}Predictor \
         Monitoring}.\n\
        \ "]
  time_alignment_boundary : time_alignment_boundary option;
      [@ocaml.doc
        "The time boundary Forecast uses to align and aggregate any data that doesn't align with \
         your forecast frequency. Provide the unit of time and the time boundary as a key value \
         pair. For more information on specifying a time boundary, see \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#specifying-time-boundary}Specifying \
         a Time Boundary}. If you don't provide a time boundary, Forecast uses a set of \
         {{:https://docs.aws.amazon.com/forecast/latest/dg/data-aggregation.html#default-time-boundaries}Default \
         Time Boundaries}.\n"]
}
[@@ocaml.doc ""]
