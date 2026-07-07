type nonrec validation_exception_reason =
  | BUSINESS_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_error_code =
  | ACTION_NOT_PERMITTED [@ocaml.doc ""]
  | VALUE_OUT_OF_RANGE [@ocaml.doc ""]
  | DUPLICATE_KEY_VALUE [@ocaml.doc ""]
  | INVALID_RESOURCE_STATE [@ocaml.doc ""]
  | TOO_MANY_VALUES [@ocaml.doc ""]
  | NOT_ENOUGH_VALUES [@ocaml.doc ""]
  | INVALID_VALUE [@ocaml.doc ""]
  | INVALID_STRING_FORMAT [@ocaml.doc ""]
  | INVALID_ENUM_VALUE [@ocaml.doc ""]
  | REQUIRED_FIELD_MISSING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  code : validation_exception_error_code option;
      [@ocaml.doc "An error code explaining why the field validation failed.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A detailed message explaining why the field validation failed.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field that failed validation.\n"]
}
[@@ocaml.doc "Represents a field-specific validation error with detailed information.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc "A list of fields that failed validation.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason for the validation failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the validation error.\n"]
}
[@@ocaml.doc
  "Thrown when the request contains invalid parameters or fails input validation requirements.\n"]

type nonrec benefit_application_id = string [@@ocaml.doc ""]

type nonrec update_benefit_application_output = {
  revision : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The new revision number of the benefit application after the update.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated benefit application.\n"]
  id : benefit_application_id option;
      [@ocaml.doc "The unique identifier of the updated benefit application.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_name = string [@@ocaml.doc ""]

type nonrec benefit_application_name = string [@@ocaml.doc ""]

type nonrec benefit_application_description = string [@@ocaml.doc ""]

type nonrec benefit_application_identifier = string [@@ocaml.doc ""]

type nonrec contact_email = string [@@ocaml.doc ""]

type nonrec contact_first_name = string [@@ocaml.doc ""]

type nonrec contact_last_name = string [@@ocaml.doc ""]

type nonrec contact_phone = string [@@ocaml.doc ""]

type nonrec contact = {
  phone : contact_phone option; [@ocaml.doc "The phone number of the contact person.\n"]
  business_title : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The business title or role of the contact person within the organization.\n"]
  last_name : contact_last_name option; [@ocaml.doc "The last name of the contact person.\n"]
  first_name : contact_first_name option; [@ocaml.doc "The first name of the contact person.\n"]
  email : contact_email option; [@ocaml.doc "The email address of the contact person.\n"]
}
[@@ocaml.doc "Represents contact information for a partner representative.\n"]

type nonrec contacts = contact list [@@ocaml.doc ""]

type nonrec file_ur_i = string [@@ocaml.doc ""]

type nonrec file_input = {
  business_use_case : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The business purpose or use case that this file supports in the benefit application.\n"]
  file_ur_i : file_ur_i;
      [@ocaml.doc "The URI or location where the file should be stored or has been uploaded.\n"]
}
[@@ocaml.doc "Represents input information for uploading a file to a benefit application.\n"]

type nonrec file_input_details = file_input list [@@ocaml.doc ""]

type nonrec update_benefit_application_input = {
  file_details : file_input_details option;
      [@ocaml.doc "Updated supporting documents and files attached to the benefit application.\n"]
  partner_contacts : contacts option;
      [@ocaml.doc
        "Updated contact information for partner representatives responsible for this benefit \
         application.\n"]
  benefit_application_details : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc
        "Updated detailed information and requirements specific to the benefit being requested.\n"]
  revision : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The current revision number of the benefit application to ensure optimistic concurrency \
         control.\n"]
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to update.\n"]
  description : benefit_application_description option;
      [@ocaml.doc "The updated detailed description of the benefit application.\n"]
  name : benefit_application_name option;
      [@ocaml.doc "The updated human-readable name for the benefit application.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A unique, case-sensitive identifier to ensure idempotent processing of the update request.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the throttling error.\n"]
}
[@@ocaml.doc
  "Thrown when the request rate exceeds the allowed limits and the request is being throttled.\n"]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the resource not found error.\n"]
}
[@@ocaml.doc "Thrown when the requested resource cannot be found or does not exist.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the internal server error.\n"]
}
[@@ocaml.doc
  "Thrown when an unexpected error occurs on the server side during request processing.\n"]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "A message describing the conflict.\n"]
}
[@@ocaml.doc
  "Thrown when the request conflicts with the current state of the resource, such as attempting to \
   modify a resource that has been changed by another process.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the access denial.\n"]
}
[@@ocaml.doc
  "Thrown when the caller does not have sufficient permissions to perform the requested operation.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "A list of tag keys to remove from the resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The code identifying the specific quota that would be exceeded.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of the resource that would exceed the quota.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that would exceed the quota.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message describing the service quota exceeded error.\n"]
}
[@@ocaml.doc "Thrown when the request would exceed the service quotas or limits for the account.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The tag value, which provides additional information or context for the tag key.\n"]
  key : tag_key; [@ocaml.doc "The tag key, which acts as a category or label for the tag.\n"]
}
[@@ocaml.doc "Represents a key-value pair used for categorizing and organizing AWS resources.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags; [@ocaml.doc "A list of key-value pairs to add as tags to the resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to add tags to.\n"]
}
[@@ocaml.doc ""]

type nonrec submit_benefit_application_output = unit [@@ocaml.doc ""]

type nonrec submit_benefit_application_input = {
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to submit.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_application_status =
  | CANCELED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | ACTION_REQUIRED [@ocaml.doc ""]
  | IN_REVIEW [@ocaml.doc ""]
  | PENDING_SUBMISSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec statuses = benefit_application_status list [@@ocaml.doc ""]

type nonrec status_reason_code = string [@@ocaml.doc ""]

type nonrec status_reason_codes = status_reason_code list [@@ocaml.doc ""]

type nonrec benefit_application_stage = string [@@ocaml.doc ""]

type nonrec stages = benefit_application_stage list [@@ocaml.doc ""]

type nonrec resource_type = BENEFIT_ALLOCATION [@ocaml.doc ""] | OPPORTUNITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recall_benefit_application_output = unit [@@ocaml.doc ""]

type nonrec recall_benefit_application_input = {
  reason : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A descriptive reason explaining why the benefit application is being recalled.\n"]
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to recall.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A unique, case-sensitive identifier to ensure idempotent processing of the recall request.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec program = string [@@ocaml.doc ""]

type nonrec programs = program list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option;
      [@ocaml.doc "A list of key-value pairs representing the tags associated with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec fulfillment_type =
  | ACCESS [@ocaml.doc ""]
  | CASH [@ocaml.doc ""]
  | CREDITS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fulfillment_types = fulfillment_type list [@@ocaml.doc ""]

type nonrec benefit_status = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec benefit_summary = {
  status : benefit_status option; [@ocaml.doc "The current status of the benefit.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "The available fulfillment types for this benefit.\n"]
  programs : programs option;
      [@ocaml.doc "The AWS partner programs that this benefit is associated with.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A brief description of the benefit and its purpose.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The human-readable name of the benefit.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit belongs to.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the benefit.\n"]
}
[@@ocaml.doc "A summary view of a benefit containing key information for list operations.\n"]

type nonrec benefit_summaries = benefit_summary list [@@ocaml.doc ""]

type nonrec list_benefits_output = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results, if more results are available.\n"]
  benefit_summaries : benefit_summaries option;
      [@ocaml.doc "A list of benefit summaries matching the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_statuses = benefit_status list [@@ocaml.doc ""]

type nonrec list_benefits_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results from a previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of benefits to return in a single response.\n"]
  status : benefit_statuses option; [@ocaml.doc "Filter benefits by their current status.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "Filter benefits by specific fulfillment types.\n"]
  programs : programs option; [@ocaml.doc "Filter benefits by specific AWS partner programs.\n"]
  catalog : catalog_name; [@ocaml.doc "The catalog identifier to filter benefits by catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_id = string [@@ocaml.doc ""]

type nonrec attributes =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec arns = arn list [@@ocaml.doc ""]

type nonrec benefit_application_summary = {
  associated_resources : arns option;
      [@ocaml.doc "AWS resources that are associated with this benefit application.\n"]
  benefit_application_details : attributes option;
      [@ocaml.doc "Additional attributes and metadata associated with the benefit application.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit application was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit application was created.\n"]
  stage : benefit_application_stage option;
      [@ocaml.doc "The current stage in the benefit application processing workflow..\n"]
  status : benefit_application_status option;
      [@ocaml.doc "The current processing status of the benefit application.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "The fulfillment types requested for this benefit application.\n"]
  programs : programs option;
      [@ocaml.doc "The AWS partner programs associated with this benefit application.\n"]
  benefit_id : benefit_id option;
      [@ocaml.doc "The identifier of the benefit being requested in this application.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit application.\n"]
  id : benefit_application_id option;
      [@ocaml.doc "The unique identifier of the benefit application.\n"]
  name : benefit_application_name option;
      [@ocaml.doc "The human-readable name of the benefit application.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit application belongs to.\n"]
}
[@@ocaml.doc
  "A summary view of a benefit application containing key information for list operations.\n"]

type nonrec benefit_application_summaries = benefit_application_summary list [@@ocaml.doc ""]

type nonrec list_benefit_applications_output = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results, if more results are available.\n"]
  benefit_application_summaries : benefit_application_summaries option;
      [@ocaml.doc "A list of benefit application summaries matching the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_identifiers = benefit_id list [@@ocaml.doc ""]

type nonrec associated_resource = {
  resource_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies the AWS resource.\n"]
  resource_identifier : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the AWS resource within its service.\n"]
  resource_type : resource_type option;
      [@ocaml.doc "The type of AWS resource (e.g., EC2 instance, S3 bucket, Lambda function).\n"]
}
[@@ocaml.doc
  "Represents an AWS resource that is associated with a benefit application for tracking and \
   management.\n"]

type nonrec associated_resources = associated_resource list [@@ocaml.doc ""]

type nonrec list_benefit_applications_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results from a previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of benefit applications to return in a single response.\n"]
  associated_resource_arns : arns option;
      [@ocaml.doc "Filter benefit applications by specific AWS resource ARNs.\n"]
  associated_resources : associated_resources option;
      [@ocaml.doc "Filter benefit applications by associated AWS resources.\n"]
  stages : stages option;
      [@ocaml.doc "Filter benefit applications by their current processing stage.\n"]
  status : statuses option;
      [@ocaml.doc "Filter benefit applications by their current processing status.\n"]
  benefit_identifiers : benefit_identifiers option;
      [@ocaml.doc "Filter benefit applications by specific benefit identifiers.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "Filter benefit applications by specific fulfillment types.\n"]
  programs : programs option;
      [@ocaml.doc "Filter benefit applications by specific AWS partner programs.\n"]
  catalog : catalog_name;
      [@ocaml.doc "The catalog identifier to filter benefit applications by catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_allocation_id = string [@@ocaml.doc ""]

type nonrec benefit_allocation_status =
  | FULFILLED [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec benefit_allocation_name = string [@@ocaml.doc ""]

type nonrec benefit_ids = benefit_id list [@@ocaml.doc ""]

type nonrec benefit_allocation_summary = {
  applicable_benefit_ids : benefit_ids option;
      [@ocaml.doc "The identifiers of the benefits applicable for this allocation.\n"]
  expires_at : timestamp option; [@ocaml.doc "The timestamp when the benefit allocation expires.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit allocation was created.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "The fulfillment types used for this benefit allocation.\n"]
  benefit_application_id : benefit_application_id option;
      [@ocaml.doc "The identifier of the benefit application that resulted in this allocation.\n"]
  benefit_id : benefit_id option;
      [@ocaml.doc "The identifier of the benefit that this allocation is based on.\n"]
  name : benefit_allocation_name option;
      [@ocaml.doc "The human-readable name of the benefit allocation.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information explaining the current status of the benefit allocation.\n"]
  status : benefit_allocation_status option;
      [@ocaml.doc "The current status of the benefit allocation.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit allocation.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit allocation belongs to.\n"]
  id : benefit_allocation_id option;
      [@ocaml.doc "The unique identifier of the benefit allocation.\n"]
}
[@@ocaml.doc
  "A summary view of a benefit allocation containing key information for list operations.\n"]

type nonrec benefit_allocation_summaries = benefit_allocation_summary list [@@ocaml.doc ""]

type nonrec list_benefit_allocations_output = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results, if more results are available.\n"]
  benefit_allocation_summaries : benefit_allocation_summaries option;
      [@ocaml.doc "A list of benefit allocation summaries matching the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_application_identifier_list = benefit_application_identifier list
[@@ocaml.doc ""]

type nonrec benefit_allocation_status_list = benefit_allocation_status list [@@ocaml.doc ""]

type nonrec list_benefit_allocations_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A pagination token to retrieve the next set of results from a previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of benefit allocations to return in a single response.\n"]
  status : benefit_allocation_status_list option;
      [@ocaml.doc "Filter benefit allocations by their current status.\n"]
  benefit_application_identifiers : benefit_application_identifier_list option;
      [@ocaml.doc "Filter benefit allocations by specific benefit application identifiers.\n"]
  benefit_identifiers : benefit_identifiers option;
      [@ocaml.doc "Filter benefit allocations by specific benefit identifiers.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "Filter benefit allocations by specific fulfillment types.\n"]
  catalog : catalog_name;
      [@ocaml.doc "The catalog identifier to filter benefit allocations by catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec file_type =
  | CSV [@ocaml.doc ""]
  | SVG [@ocaml.doc ""]
  | JPG [@ocaml.doc ""]
  | PNG [@ocaml.doc ""]
  | PDF [@ocaml.doc ""]
  | PPTX [@ocaml.doc ""]
  | XLSX [@ocaml.doc ""]
  | DOCX [@ocaml.doc ""]
  | DOC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec file_detail = {
  created_at : timestamp option; [@ocaml.doc "The timestamp when the file was uploaded.\n"]
  created_by : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the user who uploaded the file.\n"]
  file_type : file_type option;
      [@ocaml.doc "The type or category of the file (e.g., document, image, spreadsheet).\n"]
  file_status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for that particulat file status.\n"]
  file_status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The current processing status of the file (e.g., uploaded, processing, approved, rejected).\n"]
  file_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The original name of the uploaded file.\n"]
  business_use_case : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The business purpose or use case that this file supports in the benefit application.\n"]
  file_ur_i : file_ur_i; [@ocaml.doc "The URI or location where the file is stored.\n"]
}
[@@ocaml.doc "Represents detailed information about a file attached to a benefit application.\n"]

type nonrec file_details = file_detail list [@@ocaml.doc ""]

type nonrec get_benefit_application_output = {
  file_details : file_details option;
      [@ocaml.doc "Supporting documents and files attached to the benefit application.\n"]
  partner_contacts : contacts option;
      [@ocaml.doc
        "Contact information for partner representatives responsible for this benefit application.\n"]
  associated_resources : arns option;
      [@ocaml.doc "AWS resources that are associated with this benefit application.\n"]
  revision : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The current revision number of the benefit application.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit application was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit application was created.\n"]
  status_reason_codes : status_reason_codes option;
      [@ocaml.doc
        "The list of standardized codes representing the reason for the current status.\n"]
  status_reason_code : status_reason_code option;
      [@ocaml.doc "A standardized code representing the reason for the current status.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information explaining the current status of the benefit application.\n"]
  stage : benefit_application_stage option;
      [@ocaml.doc "The current stage in the benefit application processing workflow.\n"]
  status : benefit_application_status option;
      [@ocaml.doc "The current processing status of the benefit application.\n"]
  programs : programs option;
      [@ocaml.doc "The AWS partner programs associated with this benefit application.\n"]
  benefit_application_details : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc
        "Detailed information and requirements specific to the benefit being requested.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc "The fulfillment types requested for this benefit application.\n"]
  description : benefit_application_description option;
      [@ocaml.doc "A detailed description of the benefit application.\n"]
  name : benefit_application_name option;
      [@ocaml.doc "The human-readable name of the benefit application.\n"]
  benefit_id : benefit_id option;
      [@ocaml.doc "The identifier of the benefit being requested in this application.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit application belongs to.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit application.\n"]
  id : benefit_application_id option;
      [@ocaml.doc "The unique identifier of the benefit application.\n"]
}
[@@ocaml.doc ""]

type nonrec get_benefit_application_input = {
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to retrieve.\n"]
  catalog : catalog_name;
      [@ocaml.doc "The catalog identifier that specifies which benefit catalog to query.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_allocation_arn = string [@@ocaml.doc ""]

type nonrec currency_code =
  | ZAR [@ocaml.doc ""]
  | XPF [@ocaml.doc ""]
  | XOF [@ocaml.doc ""]
  | XCD [@ocaml.doc ""]
  | XAF [@ocaml.doc ""]
  | VND [@ocaml.doc ""]
  | UZS [@ocaml.doc ""]
  | UYU [@ocaml.doc ""]
  | USD [@ocaml.doc ""]
  | UAH [@ocaml.doc ""]
  | TZS [@ocaml.doc ""]
  | TWD [@ocaml.doc ""]
  | TTD [@ocaml.doc ""]
  | TRY [@ocaml.doc ""]
  | TND [@ocaml.doc ""]
  | THB [@ocaml.doc ""]
  | SKK [@ocaml.doc ""]
  | SIT [@ocaml.doc ""]
  | SGD [@ocaml.doc ""]
  | SEK [@ocaml.doc ""]
  | SAR [@ocaml.doc ""]
  | RUB [@ocaml.doc ""]
  | RON [@ocaml.doc ""]
  | QAR [@ocaml.doc ""]
  | PYG [@ocaml.doc ""]
  | PLN [@ocaml.doc ""]
  | PKR [@ocaml.doc ""]
  | PHP [@ocaml.doc ""]
  | PEN [@ocaml.doc ""]
  | PAB [@ocaml.doc ""]
  | NZD [@ocaml.doc ""]
  | NOK [@ocaml.doc ""]
  | NIO [@ocaml.doc ""]
  | NGN [@ocaml.doc ""]
  | NAD [@ocaml.doc ""]
  | MYR [@ocaml.doc ""]
  | MXN [@ocaml.doc ""]
  | MVR [@ocaml.doc ""]
  | MUR [@ocaml.doc ""]
  | MOP [@ocaml.doc ""]
  | MNT [@ocaml.doc ""]
  | MAD [@ocaml.doc ""]
  | LVL [@ocaml.doc ""]
  | LTL [@ocaml.doc ""]
  | LKR [@ocaml.doc ""]
  | LBP [@ocaml.doc ""]
  | KZT [@ocaml.doc ""]
  | KYD [@ocaml.doc ""]
  | KRW [@ocaml.doc ""]
  | KHR [@ocaml.doc ""]
  | KES [@ocaml.doc ""]
  | JPY [@ocaml.doc ""]
  | JMD [@ocaml.doc ""]
  | ISK [@ocaml.doc ""]
  | INR [@ocaml.doc ""]
  | ILS [@ocaml.doc ""]
  | IDR [@ocaml.doc ""]
  | HUF [@ocaml.doc ""]
  | HTG [@ocaml.doc ""]
  | HRK [@ocaml.doc ""]
  | HNL [@ocaml.doc ""]
  | HKD [@ocaml.doc ""]
  | GYD [@ocaml.doc ""]
  | GTQ [@ocaml.doc ""]
  | GHS [@ocaml.doc ""]
  | GEL [@ocaml.doc ""]
  | GBP [@ocaml.doc ""]
  | EUR [@ocaml.doc ""]
  | EGP [@ocaml.doc ""]
  | EEK [@ocaml.doc ""]
  | DOP [@ocaml.doc ""]
  | DKK [@ocaml.doc ""]
  | CZK [@ocaml.doc ""]
  | CRC [@ocaml.doc ""]
  | COP [@ocaml.doc ""]
  | CNY [@ocaml.doc ""]
  | CLP [@ocaml.doc ""]
  | CHF [@ocaml.doc ""]
  | CAD [@ocaml.doc ""]
  | BZD [@ocaml.doc ""]
  | BYR [@ocaml.doc ""]
  | BSD [@ocaml.doc ""]
  | BRL [@ocaml.doc ""]
  | BOB [@ocaml.doc ""]
  | BND [@ocaml.doc ""]
  | BMD [@ocaml.doc ""]
  | BGN [@ocaml.doc ""]
  | BDT [@ocaml.doc ""]
  | BBD [@ocaml.doc ""]
  | AZN [@ocaml.doc ""]
  | AWG [@ocaml.doc ""]
  | AUD [@ocaml.doc ""]
  | ARS [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | AED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec monetary_value = {
  currency_code : currency_code;
      [@ocaml.doc "The ISO 4217 currency code (e.g., USD, EUR) for the monetary amount.\n"]
  amount : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The numeric amount of the monetary value.\n"]
}
[@@ocaml.doc "Represents a monetary amount with its associated currency.\n"]

type nonrec issuance_detail = {
  issued_at : timestamp option;
      [@ocaml.doc "The timestamp when this specific issuance was processed.\n"]
  issuance_amount : monetary_value option;
      [@ocaml.doc "The monetary amount or value that was issued in this specific issuance.\n"]
  issuance_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier for this specific issuance.\n"]
}
[@@ocaml.doc "Represents detailed information about a specific issuance of benefit value.\n"]

type nonrec disbursement_details = {
  issuance_details : issuance_detail option;
      [@ocaml.doc "Detailed information about how the disbursement was issued and processed.\n"]
  disbursed_amount : monetary_value option;
      [@ocaml.doc "The total amount that has been disbursed for this benefit allocation.\n"]
}
[@@ocaml.doc
  "Contains information about disbursement-based benefit fulfillment, such as direct payments or \
   reimbursements.\n"]

type nonrec consumable_details = {
  issuance_details : issuance_detail option;
      [@ocaml.doc
        "Detailed information about how the consumable benefit was issued and distributed.\n"]
  utilized_amount : monetary_value option;
      [@ocaml.doc "The amount of the consumable benefit that has already been used.\n"]
  remaining_amount : monetary_value option;
      [@ocaml.doc
        "The remaining amount of the consumable benefit that is still available for use.\n"]
  allocated_amount : monetary_value option;
      [@ocaml.doc "The total amount of the consumable benefit that has been allocated.\n"]
}
[@@ocaml.doc
  "Contains information about consumable benefit fulfillment, such as usage quotas or service \
   limits.\n"]

type nonrec credit_code = {
  expires_at : timestamp;
      [@ocaml.doc "The timestamp when the credit code expires and can no longer be redeemed.\n"]
  issued_at : timestamp; [@ocaml.doc "The timestamp when the credit code was issued.\n"]
  status : benefit_allocation_status;
      [@ocaml.doc "The current status of the credit code (e.g., active, redeemed, expired).\n"]
  aws_credit_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The actual credit code string that can be redeemed in the AWS billing console.\n"]
  value : monetary_value; [@ocaml.doc "The monetary value of the credit code.\n"]
  aws_account_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The AWS account ID that the credit code is associated with or can be applied to.\n"]
}
[@@ocaml.doc
  "Represents an AWS credit code that can be applied to an AWS account for billing purposes.\n"]

type nonrec credit_codes = credit_code list [@@ocaml.doc ""]

type nonrec credit_details = {
  codes : credit_codes;
      [@ocaml.doc "A list of credit codes that have been generated for this benefit allocation.\n"]
  issued_amount : monetary_value;
      [@ocaml.doc
        "The amount of credits that have actually been issued and are available for use.\n"]
  allocated_amount : monetary_value;
      [@ocaml.doc "The total amount of credits that have been allocated for this benefit.\n"]
}
[@@ocaml.doc
  "Contains information about credit-based benefit fulfillment, including AWS promotional credits.\n"]

type nonrec access_details = {
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A description of the access privileges or permissions granted by this benefit.\n"]
}
[@@ocaml.doc
  "Contains information about access-based benefit fulfillment, such as service permissions or \
   feature access.\n"]

type nonrec fulfillment_details =
  | AccessDetails of access_details
      [@ocaml.doc
        "Details about access-based fulfillment, if applicable to this benefit allocation.\n"]
  | CreditDetails of credit_details
      [@ocaml.doc
        "Details about credit-based fulfillment, if applicable to this benefit allocation.\n"]
  | ConsumableDetails of consumable_details
      [@ocaml.doc
        "Details about consumable-based fulfillment, if applicable to this benefit allocation.\n"]
  | DisbursementDetails of disbursement_details
      [@ocaml.doc
        "Details about disbursement-based fulfillment, if applicable to this benefit allocation.\n"]
[@@ocaml.doc
  "Contains comprehensive information about how a benefit allocation is fulfilled across different \
   fulfillment types.\n"]

type nonrec get_benefit_allocation_output = {
  expires_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit allocation expires and is no longer usable.\n"]
  starts_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit allocation becomes active and usable.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit allocation was last updated.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The timestamp when the benefit allocation was created.\n"]
  fulfillment_detail : fulfillment_details option;
      [@ocaml.doc "Detailed information about how the benefit allocation is fulfilled.\n"]
  applicable_benefit_ids : benefit_identifiers option;
      [@ocaml.doc "A list of benefit identifiers that this allocation can be applied to.\n"]
  fulfillment_type : fulfillment_type option;
      [@ocaml.doc "The fulfillment type used for this benefit allocation.\n"]
  benefit_id : benefit_id option;
      [@ocaml.doc "The identifier of the benefit that this allocation is based on.\n"]
  benefit_application_id : benefit_application_id option;
      [@ocaml.doc "The identifier of the benefit application that resulted in this allocation.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information explaining the current status of the benefit allocation.\n"]
  status : benefit_allocation_status option;
      [@ocaml.doc
        "The current status of the benefit allocation (e.g., active, expired, consumed).\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A detailed description of the benefit allocation.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The human-readable name of the benefit allocation.\n"]
  arn : benefit_allocation_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit allocation.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit allocation belongs to.\n"]
  id : benefit_allocation_id option;
      [@ocaml.doc "The unique identifier of the benefit allocation.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_allocation_identifier = string [@@ocaml.doc ""]

type nonrec get_benefit_allocation_input = {
  identifier : benefit_allocation_identifier;
      [@ocaml.doc "The unique identifier of the benefit allocation to retrieve.\n"]
  catalog : catalog_name;
      [@ocaml.doc "The catalog identifier that specifies which benefit catalog to query.\n"]
}
[@@ocaml.doc ""]

type nonrec get_benefit_output = {
  status : benefit_status option;
      [@ocaml.doc "The current status of the benefit (e.g., active, inactive, deprecated).\n"]
  benefit_request_schema : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc
        "The schema definition that describes the required fields for requesting this benefit.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc
        "The available fulfillment types for this benefit (e.g., credits, access, disbursement).\n"]
  programs : programs option;
      [@ocaml.doc "The AWS partner programs that this benefit is associated with.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A detailed description of the benefit and its purpose.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The human-readable name of the benefit.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the benefit.\n"]
  catalog : catalog_name option;
      [@ocaml.doc "The catalog identifier that the benefit belongs to.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the benefit.\n"]
}
[@@ocaml.doc ""]

type nonrec get_benefit_input = {
  identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the benefit to retrieve.\n"]
  catalog : catalog_name;
      [@ocaml.doc "The catalog identifier that specifies which benefit catalog to query.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_benefit_application_resource_output = {
  revision : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The updated revision number of the benefit application after the resource disassociation.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the benefit application after the resource \
         disassociation.\n"]
  id : benefit_application_id option;
      [@ocaml.doc
        "The unique identifier of the benefit application after the resource disassociation.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_benefit_application_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS resource to disassociate from the benefit \
         application.\n"]
  benefit_application_identifier : benefit_application_identifier;
      [@ocaml.doc
        "The unique identifier of the benefit application to disassociate the resource from.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec create_benefit_application_output = {
  revision : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The initial revision number of the newly created benefit application.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created benefit application.\n"]
  id : benefit_application_id option;
      [@ocaml.doc "The unique identifier assigned to the newly created benefit application.\n"]
}
[@@ocaml.doc ""]

type nonrec create_benefit_application_input = {
  file_details : file_input_details option;
      [@ocaml.doc "Supporting documents and files attached to the benefit application.\n"]
  partner_contacts : contacts option;
      [@ocaml.doc
        "Contact information for partner representatives responsible for this benefit application.\n"]
  associated_resources : arns option;
      [@ocaml.doc "AWS resources that are associated with this benefit application.\n"]
  tags : tags option;
      [@ocaml.doc "Key-value pairs to categorize and organize the benefit application.\n"]
  benefit_application_details : Smaws_Lib.Smithy_api.Types.document option;
      [@ocaml.doc
        "Detailed information and requirements specific to the benefit being requested.\n"]
  fulfillment_types : fulfillment_types option;
      [@ocaml.doc
        "The types of fulfillment requested for this benefit application (e.g., credits, access, \
         disbursement).\n"]
  benefit_identifier : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the benefit being requested in this application.\n"]
  description : benefit_application_description option;
      [@ocaml.doc "A detailed description of the benefit application and its intended use.\n"]
  name : benefit_application_name option;
      [@ocaml.doc "A human-readable name for the benefit application.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A unique, case-sensitive identifier to ensure idempotent processing of the creation \
         request.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog to create the application in.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_benefit_application_output = unit [@@ocaml.doc ""]

type nonrec cancel_benefit_application_input = {
  reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A descriptive reason explaining why the benefit application is being cancelled.\n"]
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to cancel.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A unique, case-sensitive identifier to ensure idempotent processing of the cancellation \
         request.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_benefit_application_resource_output = {
  revision : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The updated revision number of the benefit application after the resource association.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the benefit application after the resource association.\n"]
  id : benefit_application_id option;
      [@ocaml.doc
        "The unique identifier of the benefit application after the resource association.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_benefit_application_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS resource to associate with the benefit \
         application.\n"]
  benefit_application_identifier : benefit_application_identifier;
      [@ocaml.doc
        "The unique identifier of the benefit application to associate the resource with.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec amend_benefit_application_output = unit [@@ocaml.doc ""]

type nonrec amendment = {
  new_value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The new value to set for the specified field in the benefit application.\n"]
  field_path : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The JSON path or field identifier specifying which field in the benefit application to \
         modify.\n"]
}
[@@ocaml.doc "Represents a specific change to be made to a benefit application field.\n"]

type nonrec amendment_list = amendment list [@@ocaml.doc ""]

type nonrec amend_benefit_application_input = {
  amendments : amendment_list;
      [@ocaml.doc "A list of specific field amendments to apply to the benefit application.\n"]
  amendment_reason : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A descriptive reason explaining why the benefit application is being amended.\n"]
  identifier : benefit_application_identifier;
      [@ocaml.doc "The unique identifier of the benefit application to be amended.\n"]
  revision : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The current revision number of the benefit application to ensure optimistic concurrency \
         control.\n"]
  client_token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A unique, case-sensitive identifier to ensure idempotent processing of the amendment \
         request.\n"]
  catalog : catalog_name;
      [@ocaml.doc
        "The catalog identifier that specifies which benefit catalog the application belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec benefit_application = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec benefit_allocation = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec benefit = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
