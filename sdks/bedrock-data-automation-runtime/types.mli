type nonrec non_blank_string = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when customer does not have access to API."]

type nonrec validation_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when customer provided invalid parameters."]

type nonrec throttling_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when customer reached API TPS limit."]

type nonrec resource_not_found_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when resource provided from customer not found."]

type nonrec internal_server_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is for any internal un-expected service errors."]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : taggable_resource_arn; [@ocaml.doc ""]
  tag_keys : tag_key_list; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when service quota is exceeded."]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = { key : tag_key; [@ocaml.doc ""] value : tag_value [@ocaml.doc ""] }
[@@ocaml.doc "Key value pair of a tag"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : taggable_resource_arn; [@ocaml.doc ""]
  tags : tag_list; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = { tags : tag_list option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : taggable_resource_arn; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec service_unavailable_exception = { message : non_blank_string option [@ocaml.doc ""] }
[@@ocaml.doc "This exception will be thrown when service is temporarily unavailable."]

type nonrec custom_output_status = MATCH [@ocaml.doc ""] | NO_MATCH [@ocaml.doc ""]
[@@ocaml.doc "Custom output status enum"]

type nonrec output_segment = {
  custom_output_status : custom_output_status option; [@ocaml.doc "Status of blueprint match"]
  custom_output : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "Custom output response"]
  standard_output : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Standard output response"]
}
[@@ocaml.doc "Results for an output segment"]

type nonrec output_segment_list = output_segment list [@@ocaml.doc ""]

type nonrec semantic_modality =
  | DOCUMENT [@ocaml.doc ""]
  | IMAGE [@ocaml.doc ""]
  | AUDIO [@ocaml.doc ""]
  | VIDEO [@ocaml.doc ""]
[@@ocaml.doc "Semantic modality enum"]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec output_configuration = { s3_uri : s3_uri [@ocaml.doc "S3 uri."] }
[@@ocaml.doc "Output configuration."]

type nonrec invoke_data_automation_response = {
  output_configuration : output_configuration option; [@ocaml.doc "Output configuration"]
  semantic_modality : semantic_modality; [@ocaml.doc "Detected semantic modality"]
  output_segments : output_segment_list option;
      [@ocaml.doc "List of outputs for each logical sub-doc"]
}
[@@ocaml.doc "Invoke Data Automation Response"]

type nonrec encryption_context_value = string [@@ocaml.doc ""]

type nonrec encryption_context_key = string [@@ocaml.doc ""]

type nonrec encryption_context_map = (encryption_context_key * encryption_context_value) list
[@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec encryption_configuration = {
  kms_key_id : kms_key_id; [@ocaml.doc "Customer KMS key used for encryption"]
  kms_encryption_context : encryption_context_map option; [@ocaml.doc "KMS encryption context."]
}
[@@ocaml.doc "Encryption configuration."]

type nonrec data_automation_profile_arn = string [@@ocaml.doc ""]

type nonrec blueprint_stage = DEVELOPMENT [@ocaml.doc ""] | LIVE [@ocaml.doc ""]
[@@ocaml.doc "Blueprint stage enum."]

type nonrec blueprint_version = string [@@ocaml.doc ""]

type nonrec blueprint_arn = string [@@ocaml.doc ""]

type nonrec blueprint = {
  blueprint_arn : blueprint_arn; [@ocaml.doc "Arn of blueprint."]
  version : blueprint_version option; [@ocaml.doc "Version of blueprint."]
  stage : blueprint_stage option; [@ocaml.doc "Stage of blueprint."]
}
[@@ocaml.doc "Structure for single blueprint entity."]

type nonrec blueprint_list = blueprint list [@@ocaml.doc ""]

type nonrec data_automation_stage = LIVE [@ocaml.doc ""] | DEVELOPMENT [@ocaml.doc ""]
[@@ocaml.doc "Data automation stage."]

type nonrec data_automation_arn = string [@@ocaml.doc ""]

type nonrec data_automation_configuration = {
  data_automation_project_arn : data_automation_arn; [@ocaml.doc "Data automation project arn."]
  stage : data_automation_stage option; [@ocaml.doc "Data automation stage."]
}
[@@ocaml.doc "Data automation configuration."]

type nonrec sync_input_configuration = {
  bytes : Smaws_Lib.Smithy_api.Types.blob option; [@ocaml.doc "Input data as bytes"]
  s3_uri : s3_uri option; [@ocaml.doc "S3 URI of the input data"]
}
[@@ocaml.doc "Input configuration for synchronous API"]

type nonrec invoke_data_automation_request = {
  input_configuration : sync_input_configuration; [@ocaml.doc "Input configuration."]
  data_automation_configuration : data_automation_configuration option;
      [@ocaml.doc "Data automation configuration."]
  blueprints : blueprint_list option; [@ocaml.doc "Blueprint list."]
  data_automation_profile_arn : data_automation_profile_arn;
      [@ocaml.doc "Data automation profile ARN"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc "Encryption configuration."]
  output_configuration : output_configuration option; [@ocaml.doc "Output configuration."]
}
[@@ocaml.doc "Invoke Data Automation Request"]

type nonrec timestamp_segment = {
  start_time_millis : Smaws_Lib.Smithy_api.Types.long;
      [@ocaml.doc "Start timestamp in milliseconds"]
  end_time_millis : Smaws_Lib.Smithy_api.Types.long; [@ocaml.doc "End timestamp in milliseconds"]
}
[@@ocaml.doc "Timestamp segment"]

type nonrec video_segment_configuration =
  | TimestampSegment of timestamp_segment [@ocaml.doc "Timestamp segment"]
[@@ocaml.doc "Delimits the segment of the input that will be processed"]

type nonrec video_asset_processing_configuration = {
  segment_configuration : video_segment_configuration option;
      [@ocaml.doc "Delimits the segment of the input that will be processed"]
}
[@@ocaml.doc "Video asset processing configuration"]

type nonrec asset_processing_configuration = {
  video : video_asset_processing_configuration option;
      [@ocaml.doc "Video asset processing configuration"]
}
[@@ocaml.doc "Config containing asset processing related knobs for all modalities"]

type nonrec automation_job_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec automation_job_status =
  | CREATED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | SERVICE_ERROR [@ocaml.doc ""]
  | CLIENT_ERROR [@ocaml.doc ""]
[@@ocaml.doc "List of status supported by automation jobs"]

type nonrec event_bridge_configuration = {
  event_bridge_enabled : Smaws_Lib.Smithy_api.Types.boolean_; [@ocaml.doc "Event bridge flag."]
}
[@@ocaml.doc "Event bridge configuration."]

type nonrec get_data_automation_status_response = {
  status : automation_job_status option; [@ocaml.doc "Job Status."]
  error_type : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "Error Type."]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "Error Message."]
  output_configuration : output_configuration option; [@ocaml.doc "Output configuration."]
  job_submission_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "Job Submission time."]
  job_completion_time : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "Job completion time."]
  job_duration_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Job duration in seconds."]
}
[@@ocaml.doc "Response of GetDataAutomationStatus API."]

type nonrec invocation_arn = string [@@ocaml.doc ""]

type nonrec get_data_automation_status_request = {
  invocation_arn : invocation_arn; [@ocaml.doc "Invocation arn."]
}
[@@ocaml.doc "Structure for request of GetDataAutomationStatus API."]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec input_configuration = {
  s3_uri : s3_uri; [@ocaml.doc "S3 uri."]
  asset_processing_configuration : asset_processing_configuration option;
      [@ocaml.doc "Asset processing configuration"]
}
[@@ocaml.doc "Input configuration."]

type nonrec invoke_data_automation_async_response = {
  invocation_arn : invocation_arn; [@ocaml.doc "ARN of the automation job"]
}
[@@ocaml.doc "Invoke Data Automation Async Response"]

type nonrec notification_configuration = {
  event_bridge_configuration : event_bridge_configuration; [@ocaml.doc "Event bridge configuration."]
}
[@@ocaml.doc "Notification configuration."]

type nonrec invoke_data_automation_async_request = {
  client_token : idempotency_token option; [@ocaml.doc "Idempotency token."]
  input_configuration : input_configuration; [@ocaml.doc "Input configuration."]
  output_configuration : output_configuration; [@ocaml.doc "Output configuration."]
  data_automation_configuration : data_automation_configuration option;
      [@ocaml.doc "Data automation configuration."]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc "Encryption configuration."]
  notification_configuration : notification_configuration option;
      [@ocaml.doc "Notification configuration."]
  blueprints : blueprint_list option; [@ocaml.doc "Blueprint list."]
  data_automation_profile_arn : data_automation_profile_arn;
      [@ocaml.doc "Data automation profile ARN"]
  tags : tag_list option; [@ocaml.doc "List of tags."]
}
[@@ocaml.doc "Invoke Data Automation Async Request"]
