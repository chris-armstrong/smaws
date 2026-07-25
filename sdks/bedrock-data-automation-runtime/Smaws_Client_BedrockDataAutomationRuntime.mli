(** Bedrock Data Automation Runtime client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:taggable_resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:taggable_resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:taggable_resource_arn -> unit -> list_tags_for_resource_request

val make_output_segment :
  ?custom_output_status:custom_output_status ->
  ?custom_output:Smaws_Lib.Smithy_api.Types.string_ ->
  ?standard_output:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  output_segment

val make_output_configuration : s3_uri:s3_uri -> unit -> output_configuration

val make_invoke_data_automation_response :
  ?output_configuration:output_configuration ->
  ?output_segments:output_segment_list ->
  semantic_modality:semantic_modality ->
  unit ->
  invoke_data_automation_response

val make_encryption_configuration :
  ?kms_encryption_context:encryption_context_map ->
  kms_key_id:kms_key_id ->
  unit ->
  encryption_configuration

val make_blueprint :
  ?version:blueprint_version ->
  ?stage:blueprint_stage ->
  blueprint_arn:blueprint_arn ->
  unit ->
  blueprint

val make_data_automation_configuration :
  ?stage:data_automation_stage ->
  data_automation_project_arn:data_automation_arn ->
  unit ->
  data_automation_configuration

val make_sync_input_configuration :
  ?bytes:Smaws_Lib.Smithy_api.Types.blob -> ?s3_uri:s3_uri -> unit -> sync_input_configuration

val make_invoke_data_automation_request :
  ?data_automation_configuration:data_automation_configuration ->
  ?blueprints:blueprint_list ->
  ?encryption_configuration:encryption_configuration ->
  ?output_configuration:output_configuration ->
  input_configuration:sync_input_configuration ->
  data_automation_profile_arn:data_automation_profile_arn ->
  unit ->
  invoke_data_automation_request

val make_timestamp_segment :
  start_time_millis:Smaws_Lib.Smithy_api.Types.long ->
  end_time_millis:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  timestamp_segment

val make_video_asset_processing_configuration :
  ?segment_configuration:video_segment_configuration -> unit -> video_asset_processing_configuration

val make_asset_processing_configuration :
  ?video:video_asset_processing_configuration -> unit -> asset_processing_configuration

val make_event_bridge_configuration :
  event_bridge_enabled:Smaws_Lib.Smithy_api.Types.boolean_ -> unit -> event_bridge_configuration

val make_get_data_automation_status_response :
  ?status:automation_job_status ->
  ?error_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?output_configuration:output_configuration ->
  ?job_submission_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?job_completion_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?job_duration_in_seconds:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  get_data_automation_status_response

val make_get_data_automation_status_request :
  invocation_arn:invocation_arn -> unit -> get_data_automation_status_request

val make_input_configuration :
  ?asset_processing_configuration:asset_processing_configuration ->
  s3_uri:s3_uri ->
  unit ->
  input_configuration

val make_invoke_data_automation_async_response :
  invocation_arn:invocation_arn -> unit -> invoke_data_automation_async_response

val make_notification_configuration :
  event_bridge_configuration:event_bridge_configuration -> unit -> notification_configuration

val make_invoke_data_automation_async_request :
  ?client_token:idempotency_token ->
  ?data_automation_configuration:data_automation_configuration ->
  ?encryption_configuration:encryption_configuration ->
  ?notification_configuration:notification_configuration ->
  ?blueprints:blueprint_list ->
  ?tags:tag_list ->
  input_configuration:input_configuration ->
  output_configuration:output_configuration ->
  data_automation_profile_arn:data_automation_profile_arn ->
  unit ->
  invoke_data_automation_async_request
(** {1:operations Operations} *)

module InvokeDataAutomationAsync : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    invoke_data_automation_async_request ->
    ( invoke_data_automation_async_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    invoke_data_automation_async_request ->
    ( invoke_data_automation_async_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Async API: Invoke data automation."]

module GetDataAutomationStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_automation_status_request ->
    ( get_data_automation_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_automation_status_request ->
    ( get_data_automation_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "API used to get data automation status."]

module InvokeDataAutomation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    invoke_data_automation_request ->
    ( invoke_data_automation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    invoke_data_automation_request ->
    ( invoke_data_automation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sync API: Invoke data automation."]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List tags for an Amazon Bedrock Data Automation resource"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Tag an Amazon Bedrock Data Automation resource"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Untag an Amazon Bedrock Data Automation resource"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
