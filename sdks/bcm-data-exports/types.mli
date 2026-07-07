type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : generic_string;
      [@ocaml.doc "A message with the reason for the validation exception error.\n"]
  name : generic_string; [@ocaml.doc "The field name where the invalid entry was detected.\n"]
}
[@@ocaml.doc
  "The input failed to meet the constraints specified by the Amazon Web Services service in a \
   specified field.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  fields : validation_exception_field_list option;
      [@ocaml.doc "The list of fields that are invalid.\n"]
  reason : validation_exception_reason option;
      [@ocaml.doc "The reason for the validation exception.\n"]
  message : generic_string; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec update_export_response = {
  export_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec export_name = string [@@ocaml.doc ""]

type nonrec query_statement = string [@@ocaml.doc ""]

type nonrec table_property_generic_string = string [@@ocaml.doc ""]

type nonrec table_property = string [@@ocaml.doc ""]

type nonrec table_properties = (table_property * table_property_generic_string) list
[@@ocaml.doc ""]

type nonrec table_name = string [@@ocaml.doc ""]

type nonrec table_configurations = (table_name * table_properties) list [@@ocaml.doc ""]

type nonrec data_query = {
  table_configurations : table_configurations option; [@ocaml.doc "The table configuration.\n"]
  query_statement : query_statement; [@ocaml.doc "The query statement.\n"]
}
[@@ocaml.doc "The SQL query of column selections and row filters from the data table you want.\n"]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec s3_output_type =
  | REDSHIFT [@ocaml.doc ""]
  | ATHENA [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec format_option = PARQUET [@ocaml.doc ""] | TEXT_OR_CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec compression_option = PARQUET [@ocaml.doc ""] | GZIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec overwrite_option =
  | OVERWRITE_REPORT [@ocaml.doc ""]
  | CREATE_NEW_REPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_output_configurations = {
  overwrite : overwrite_option;
      [@ocaml.doc
        "The rule to follow when generating a version of the data export file. You have the choice \
         to overwrite the previous version or to be delivered in addition to the previous \
         versions. Overwriting exports can save on Amazon S3 storage costs. Creating new export \
         versions allows you to track the changes in cost and usage data over time.\n"]
  compression : compression_option; [@ocaml.doc "The compression type for the data export.\n"]
  format : format_option; [@ocaml.doc "The file format for the data export.\n"]
  output_type : s3_output_type; [@ocaml.doc "The output type for the data export.\n"]
}
[@@ocaml.doc "The compression type, file format, and overwrite preference for the data export.\n"]

type nonrec s3_destination = {
  s3_output_configurations : s3_output_configurations;
      [@ocaml.doc "The output configuration for the data export.\n"]
  s3_region : generic_string; [@ocaml.doc "The S3 bucket Region.\n"]
  s3_prefix : generic_string;
      [@ocaml.doc "The S3 path prefix you want prepended to the name of your data export.\n"]
  s3_bucket_owner : account_id option;
      [@ocaml.doc
        "The AWS Account ID that owns the S3 bucket used as the destination for the data export.\n"]
  s3_bucket : generic_string;
      [@ocaml.doc
        "The name of the Amazon S3 bucket used as the destination of a data export file.\n"]
}
[@@ocaml.doc
  "Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys \
   of a data exports file.\n"]

type nonrec destination_configurations = {
  s3_destination : s3_destination;
      [@ocaml.doc "An object that describes the destination of the data exports file.\n"]
}
[@@ocaml.doc "The destinations used for data exports.\n"]

type nonrec frequency_option = SYNCHRONOUS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec refresh_cadence = {
  frequency : frequency_option;
      [@ocaml.doc
        "The frequency that data exports are updated. The export refreshes each time the source \
         data updates, up to three times daily.\n"]
}
[@@ocaml.doc "The cadence for Amazon Web Services to update the data export in your S3 bucket.\n"]

type nonrec export_ = {
  refresh_cadence : refresh_cadence;
      [@ocaml.doc "The cadence for Amazon Web Services to update the export in your S3 bucket.\n"]
  destination_configurations : destination_configurations;
      [@ocaml.doc "The destination configuration for this specific data export.\n"]
  data_query : data_query; [@ocaml.doc "The data query for this specific data export.\n"]
  description : generic_string option;
      [@ocaml.doc "The description for this specific data export.\n"]
  name : export_name; [@ocaml.doc "The name of this specific data export.\n"]
  export_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc "The details that are available for an export.\n"]

type nonrec update_export_request = {
  export_ : export_; [@ocaml.doc "The name and query details for the export.\n"]
  export_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  service_code : generic_string option;
      [@ocaml.doc
        "The service code that exceeded the throttling limit. It will always be \
         \226\128\156AWSBillingAndCostManagementDataExports\226\128\157.\n"]
  quota_code : generic_string option;
      [@ocaml.doc "The quota code that exceeded the throttling limit.\n"]
  message : generic_string; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = {
  resource_type : generic_string; [@ocaml.doc "The type of the resource that was not found.\n"]
  resource_id : generic_string; [@ocaml.doc "The identifier of the resource that was not found.\n"]
  message : generic_string; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified Amazon Resource Name (ARN) in the request doesn't exist.\n"]

type nonrec internal_server_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc
  "An error on the server occurred during the processing of your request. Try again later.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : resource_tag_key_list;
      [@ocaml.doc "The tag keys that are associated with the resource ARN.\n"]
  resource_arn : arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec access_denied_exception = { message : generic_string [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient access to perform this action.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  value : resource_tag_value; [@ocaml.doc "The value that's associated with the tag.\n"]
  key : resource_tag_key; [@ocaml.doc "The key that's associated with the tag.\n"]
}
[@@ocaml.doc "The tag structure that contains a tag key and value.\n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_tags : resource_tag_list;
      [@ocaml.doc
        "The tags to associate with the resource. Each tag consists of a key and a value, and each \
         key must be unique for the resource.\n"]
  resource_arn : arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec generic_string_list = generic_string list [@@ocaml.doc ""]

type nonrec table_property_description = {
  description : generic_string option; [@ocaml.doc "The description for the table.\n"]
  default_value : generic_string option; [@ocaml.doc "The default value for the table.\n"]
  valid_values : generic_string_list option; [@ocaml.doc "The valid values for the table.\n"]
  name : generic_string option; [@ocaml.doc "The name of the table.\n"]
}
[@@ocaml.doc "The properties for the data export table.\n"]

type nonrec table_property_description_list = table_property_description list [@@ocaml.doc ""]

type nonrec table = {
  table_properties : table_property_description_list option;
      [@ocaml.doc "The properties for the table.\n"]
  description : generic_string option; [@ocaml.doc "The description for the table.\n"]
  table_name : table_name option; [@ocaml.doc "The name of the table.\n"]
}
[@@ocaml.doc "The details for the data export table.\n"]

type nonrec table_list = table list [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  service_code : generic_string;
      [@ocaml.doc
        "The service code that exceeded quota. It will always be \
         \226\128\156AWSBillingAndCostManagementDataExports\226\128\157.\n"]
  quota_code : generic_string; [@ocaml.doc "The quota code that was exceeded.\n"]
  resource_type : generic_string option;
      [@ocaml.doc "The type of the resource that exceeded quota.\n"]
  resource_id : generic_string option;
      [@ocaml.doc "The identifier of the resource that exceeded quota.\n"]
  message : generic_string; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You've reached the limit on the number of resources you can create, or exceeded the size of an \
   individual resource.\n"]

type nonrec next_page_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified export. Each tag consists of a \
         key and a value, and each key must be unique for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of objects that are returned for the request.\n"]
  resource_arn : arn; [@ocaml.doc "The unique identifier for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tables_response = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  tables : table_list option; [@ocaml.doc "The list of tables.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tables_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of objects that are returned for the request.\n"]
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec export_status_code = UNHEALTHY [@ocaml.doc ""] | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_status_reason =
  | INTERNAL_FAILURE [@ocaml.doc ""]
  | BILL_OWNER_CHANGED [@ocaml.doc ""]
  | INSUFFICIENT_PERMISSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec export_status = {
  last_refreshed_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the export was last generated.\n"]
  last_updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the export was updated.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp of when the export was created.\n"]
  status_reason : execution_status_reason option;
      [@ocaml.doc "The description for the status code.\n"]
  status_code : export_status_code option; [@ocaml.doc "The status code for the request.\n"]
}
[@@ocaml.doc "The status of the data export.\n"]

type nonrec export_reference = {
  export_status : export_status; [@ocaml.doc "The status of this specific data export.\n"]
  export_name : export_name; [@ocaml.doc "The name of this specific data export.\n"]
  export_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc "The reference details for a given export.\n"]

type nonrec export_reference_list = export_reference list [@@ocaml.doc ""]

type nonrec list_exports_response = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  exports : export_reference_list option;
      [@ocaml.doc "The details of the exports, including name and export status.\n"]
}
[@@ocaml.doc ""]

type nonrec list_exports_request = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of objects that are returned for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec execution_status_code =
  | DELIVERY_FAILURE [@ocaml.doc ""]
  | DELIVERY_SUCCESS [@ocaml.doc ""]
  | DELIVERY_IN_PROCESS [@ocaml.doc ""]
  | QUERY_FAILURE [@ocaml.doc ""]
  | QUERY_IN_PROCESS [@ocaml.doc ""]
  | QUERY_QUEUED [@ocaml.doc ""]
  | INITIATION_IN_PROCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_status = {
  last_updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the execution was last updated.\n"]
  completed_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the execution was completed.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the execution was created.\n"]
  status_reason : execution_status_reason option; [@ocaml.doc "The reason for the failed status.\n"]
  status_code : execution_status_code option;
      [@ocaml.doc "The code for the status of the execution.\n"]
}
[@@ocaml.doc "The status of the execution.\n"]

type nonrec execution_reference = {
  execution_status : execution_status; [@ocaml.doc "The status of this specific execution.\n"]
  execution_id : generic_string; [@ocaml.doc "The ID for this specific execution.\n"]
}
[@@ocaml.doc "The reference for the data export update.\n"]

type nonrec execution_reference_list = execution_reference list [@@ocaml.doc ""]

type nonrec list_executions_response = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  executions : execution_reference_list option; [@ocaml.doc "The list of executions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_executions_request = {
  next_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of objects that are returned for the request.\n"]
  export_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec column = {
  description : generic_string option; [@ocaml.doc "The description for a column.\n"]
  type_ : generic_string option; [@ocaml.doc "The kind of data a column stores.\n"]
  name : generic_string option; [@ocaml.doc "The column name.\n"]
}
[@@ocaml.doc
  "Includes basic information for a data column such as its description, name, and type.\n"]

type nonrec column_list = column list [@@ocaml.doc ""]

type nonrec get_table_response = {
  schema : column_list option; [@ocaml.doc "The schema of the table.\n"]
  table_properties : table_properties option;
      [@ocaml.doc
        "TableProperties are additional configurations you can provide to change the data and \
         schema of a table. Each table can have different TableProperties. Tables are not required \
         to have any TableProperties. Each table property has a default value that it assumes if \
         not specified.\n"]
  description : generic_string option; [@ocaml.doc "The table description.\n"]
  table_name : table_name option; [@ocaml.doc "The name of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_table_request = {
  table_properties : table_properties option;
      [@ocaml.doc
        "TableProperties are additional configurations you can provide to change the data and \
         schema of a table. Each table can have different TableProperties. Tables are not required \
         to have any TableProperties. Each table property has a default value that it assumes if \
         not specified.\n"]
  table_name : table_name; [@ocaml.doc "The name of the table.\n"]
}
[@@ocaml.doc ""]

type nonrec get_export_response = {
  export_status : export_status option; [@ocaml.doc "The status of this specific export.\n"]
  export_ : export_ option; [@ocaml.doc "The data for this specific export.\n"]
}
[@@ocaml.doc ""]

type nonrec get_export_request = {
  export_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec get_execution_response = {
  execution_status : execution_status option;
      [@ocaml.doc "The status of this specific execution.\n"]
  export_ : export_ option;
      [@ocaml.doc
        "The export data for this specific execution. This export data is a snapshot from when the \
         execution was generated. The data could be different from the current export data if the \
         export was updated since the execution was generated.\n"]
  execution_id : generic_string option; [@ocaml.doc "The ID for this specific execution.\n"]
}
[@@ocaml.doc ""]

type nonrec get_execution_request = {
  execution_id : generic_string; [@ocaml.doc "The ID for this specific execution.\n"]
  export_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Export object that generated this specific execution.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_export_response = {
  export_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_export_request = {
  export_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec data_export = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec create_export_response = {
  export_arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for this export.\n"]
}
[@@ocaml.doc ""]

type nonrec create_export_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified export. Each tag consists of a \
         key and a value, and each key must be unique for the resource.\n"]
  export_ : export_;
      [@ocaml.doc
        "The details of the export, including data query, name, description, and destination \
         configuration.\n"]
}
[@@ocaml.doc ""]
