type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified report ([ReportName]) in the request doesn't exist.\n"]

type nonrec internal_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An error on the server occurred during the processing of your request. Try again later.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec report_name = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  report_name : report_name;
      [@ocaml.doc
        "The report name of the report definition that tags are to be disassociated from.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "The tags to be disassociated from the report definition resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "The key of the tag. Tag keys are case sensitive. Each report definition can only have up \
         to one tag with the same key. If you try to add an existing tag with the same key, the \
         existing tag value will be updated to the new value.\n"]
  value : tag_value;
      [@ocaml.doc
        "The value of the tag. Tag values are case-sensitive. This can be an empty string.\n"]
}
[@@ocaml.doc
  "Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a report definition.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  report_name : report_name;
      [@ocaml.doc "The report name of the report definition that tags are to be associated with.\n"]
  tags : tag_list; [@ocaml.doc "The tags to be assigned to the report definition resource.\n"]
}
[@@ocaml.doc ""]

type nonrec report_limit_reached_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "This account already has five reports defined. To define a new report, you must delete an \
   existing report.\n"]

type nonrec duplicate_report_name_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A report with the specified name already exists in the account. Specify a different report name.\n"]

type nonrec put_report_definition_response = unit [@@ocaml.doc ""]

type nonrec last_status =
  | SUCCESS [@ocaml.doc ""]
  | ERROR_PERMISSIONS [@ocaml.doc ""]
  | ERROR_NO_BUCKET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec last_delivery = string [@@ocaml.doc ""]

type nonrec report_status = {
  last_delivery : last_delivery option;
      [@ocaml.doc "A timestamp that gives the date of a report delivery.\n"]
  last_status : last_status option;
      [@ocaml.doc "An enum that gives the status of a report delivery.\n"]
}
[@@ocaml.doc
  "A two element dictionary with a [lastDelivery] and [lastStatus] key whose values describe the \
   date and status of the last delivered report for a particular report definition.\n"]

type nonrec billing_view_arn = string [@@ocaml.doc ""]

type nonrec report_versioning =
  | CREATE_NEW_REPORT [@ocaml.doc ""]
  | OVERWRITE_REPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec refresh_closed_reports = bool [@@ocaml.doc ""]

type nonrec additional_artifact =
  | REDSHIFT [@ocaml.doc ""]
  | QUICKSIGHT [@ocaml.doc ""]
  | ATHENA [@ocaml.doc ""]
[@@ocaml.doc "The types of manifest that you want Amazon Web Services to create for this report.\n"]

type nonrec additional_artifact_list = additional_artifact list [@@ocaml.doc ""]

type nonrec aws_region =
  | CAPE_TOWN [@ocaml.doc ""]
  | HONG_KONG [@ocaml.doc ""]
  | MUMBAI [@ocaml.doc ""]
  | HYDERABAD [@ocaml.doc ""]
  | SINGAPORE [@ocaml.doc ""]
  | SYDNEY [@ocaml.doc ""]
  | JAKARTA [@ocaml.doc ""]
  | TOKYO [@ocaml.doc ""]
  | SEOUL [@ocaml.doc ""]
  | OSAKA [@ocaml.doc ""]
  | CANADA_CENTRAL [@ocaml.doc ""]
  | FRANKFURT [@ocaml.doc ""]
  | ZURICH [@ocaml.doc ""]
  | IRELAND [@ocaml.doc ""]
  | LONDON [@ocaml.doc ""]
  | PARIS [@ocaml.doc ""]
  | STOCKHOLM [@ocaml.doc ""]
  | MILANO [@ocaml.doc ""]
  | SPAIN [@ocaml.doc ""]
  | UAE [@ocaml.doc ""]
  | BAHRAIN [@ocaml.doc ""]
  | SAO_PAULO [@ocaml.doc ""]
  | US_STANDARD [@ocaml.doc ""]
  | OHIO [@ocaml.doc ""]
  | NORTHERN_CALIFORNIA [@ocaml.doc ""]
  | OREGON [@ocaml.doc ""]
  | BEIJING [@ocaml.doc ""]
  | NINGXIA [@ocaml.doc ""]
[@@ocaml.doc "The region of the S3 bucket that Amazon Web Services delivers the report into.\n"]

type nonrec s3_prefix = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec schema_element =
  | RESOURCES [@ocaml.doc ""]
  | SPLIT_COST_ALLOCATION_DATA [@ocaml.doc ""]
  | MANUAL_DISCOUNT_COMPATIBILITY [@ocaml.doc ""]
[@@ocaml.doc "Whether or not Amazon Web Services includes resource IDs in the report. \n"]

type nonrec schema_element_list = schema_element list [@@ocaml.doc ""]

type nonrec compression_format =
  | ZIP [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
  | Parquet [@ocaml.doc ""]
[@@ocaml.doc "The compression format that Amazon Web Services uses for the report.\n"]

type nonrec report_format = CSV [@ocaml.doc ""] | Parquet [@ocaml.doc ""]
[@@ocaml.doc "The format that Amazon Web Services saves the report in.\n"]

type nonrec time_unit = HOURLY [@ocaml.doc ""] | DAILY [@ocaml.doc ""] | MONTHLY [@ocaml.doc ""]
[@@ocaml.doc "The length of time covered by the report. \n"]

type nonrec report_definition = {
  report_name : report_name; [@ocaml.doc ""]
  time_unit : time_unit; [@ocaml.doc ""]
  format : report_format; [@ocaml.doc ""]
  compression : compression_format; [@ocaml.doc ""]
  additional_schema_elements : schema_element_list;
      [@ocaml.doc
        "A list of strings that indicate additional content that Amazon Web Services includes in \
         the report, such as individual resource IDs. \n"]
  s3_bucket : s3_bucket; [@ocaml.doc ""]
  s3_prefix : s3_prefix; [@ocaml.doc ""]
  s3_region : aws_region; [@ocaml.doc ""]
  additional_artifacts : additional_artifact_list option;
      [@ocaml.doc
        "A list of manifests that you want Amazon Web Services to create for this report.\n"]
  refresh_closed_reports : refresh_closed_reports option;
      [@ocaml.doc
        "Whether you want Amazon Web Services to update your reports after they have been \
         finalized if Amazon Web Services detects charges related to previous months. These \
         charges can include refunds, credits, or support fees.\n"]
  report_versioning : report_versioning option;
      [@ocaml.doc
        "Whether you want Amazon Web Services to overwrite the previous version of each report or \
         to deliver the report in addition to the previous versions.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        " The Amazon resource name of the billing view. The [BillingViewArn] is needed to create \
         Amazon Web Services Cost and Usage Report for each billing group maintained in the Amazon \
         Web Services Billing Conductor service. The [BillingViewArn] for a billing group can be \
         constructed as: \
         [arn:aws:billing::payer-account-id:billingview/billing-group-primary-account-id] \n"]
  report_status : report_status option; [@ocaml.doc "The status of the report.\n"]
}
[@@ocaml.doc
  "The definition of Amazon Web Services Cost and Usage Report. You can specify the report name, \
   time unit, report format, compression format, S3 bucket, additional artifacts, and schema \
   elements in the definition. \n"]

type nonrec put_report_definition_request = {
  report_definition : report_definition;
      [@ocaml.doc
        "Represents the output of the PutReportDefinition operation. The content consists of the \
         detailed metadata and data file information. \n"]
  tags : tag_list option; [@ocaml.doc "The tags to be assigned to the report definition resource.\n"]
}
[@@ocaml.doc "Creates a Cost and Usage Report.\n"]

type nonrec modify_report_definition_response = unit [@@ocaml.doc ""]

type nonrec modify_report_definition_request = {
  report_name : report_name; [@ocaml.doc ""]
  report_definition : report_definition; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags assigned to the report definition resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  report_name : report_name;
      [@ocaml.doc "The report name of the report definition that tags are to be returned for.\n"]
}
[@@ocaml.doc ""]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec report_definition_list = report_definition list [@@ocaml.doc ""]

type nonrec describe_report_definitions_response = {
  report_definitions : report_definition_list option;
      [@ocaml.doc "An Amazon Web Services Cost and Usage Report list owned by the account.\n"]
  next_token : generic_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "If the action is successful, the service sends back an HTTP 200 response.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec describe_report_definitions_request = {
  max_results : max_results option; [@ocaml.doc ""]
  next_token : generic_string option; [@ocaml.doc ""]
}
[@@ocaml.doc "Requests a Amazon Web Services Cost and Usage Report list owned by the account.\n"]

type nonrec delete_response_message = string [@@ocaml.doc ""]

type nonrec delete_report_definition_response = {
  response_message : delete_response_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "If the action is successful, the service sends back an HTTP 200 response.\n"]

type nonrec delete_report_definition_request = {
  report_name : report_name;
      [@ocaml.doc
        "The name of the report that you want to delete. The name must be unique, is case \
         sensitive, and can't include spaces.\n"]
}
[@@ocaml.doc "Deletes the specified report.\n"]
