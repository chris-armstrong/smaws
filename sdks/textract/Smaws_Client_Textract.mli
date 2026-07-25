(** Textract client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_adapter :
  ?pages:adapter_pages -> adapter_id:adapter_id -> version:adapter_version -> unit -> adapter

val make_adapter_overview :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  unit ->
  adapter_overview

val make_s3_object :
  ?bucket:s3_bucket -> ?name:s3_object_name -> ?version:s3_object_version -> unit -> s3_object

val make_adapter_version_dataset_config :
  ?manifest_s3_object:s3_object -> unit -> adapter_version_dataset_config

val make_evaluation_metric :
  ?f1_score:float_ -> ?precision:float_ -> ?recall:float_ -> unit -> evaluation_metric

val make_adapter_version_evaluation_metric :
  ?baseline:evaluation_metric ->
  ?adapter_version:evaluation_metric ->
  ?feature_type:feature_type ->
  unit ->
  adapter_version_evaluation_metric

val make_adapter_version_overview :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  ?status:adapter_version_status ->
  ?status_message:adapter_version_status_message ->
  unit ->
  adapter_version_overview

val make_adapters_config : adapters:adapters -> unit -> adapters_config

val make_human_loop_activation_output :
  ?human_loop_arn:human_loop_arn ->
  ?human_loop_activation_reasons:human_loop_activation_reasons ->
  ?human_loop_activation_conditions_evaluation_results:
    synthesized_json_human_loop_activation_conditions_evaluation_results ->
  unit ->
  human_loop_activation_output

val make_query : ?alias:query_input -> ?pages:query_pages -> text:query_input -> unit -> query
val make_relationship : ?type_:relationship_type -> ?ids:id_list -> unit -> relationship
val make_point : ?x:float_ -> ?y:float_ -> unit -> point

val make_bounding_box :
  ?width:float_ -> ?height:float_ -> ?left:float_ -> ?top:float_ -> unit -> bounding_box

val make_geometry :
  ?bounding_box:bounding_box -> ?polygon:polygon -> ?rotation_angle:angle -> unit -> geometry

val make_block :
  ?block_type:block_type ->
  ?confidence:percent ->
  ?text:string_ ->
  ?text_type:text_type ->
  ?row_index:u_integer ->
  ?column_index:u_integer ->
  ?row_span:u_integer ->
  ?column_span:u_integer ->
  ?geometry:geometry ->
  ?id:non_empty_string ->
  ?relationships:relationship_list ->
  ?entity_types:entity_types ->
  ?selection_status:selection_status ->
  ?page:u_integer ->
  ?query:query ->
  unit ->
  block

val make_document_metadata : ?pages:u_integer -> unit -> document_metadata

val make_analyze_document_response :
  ?document_metadata:document_metadata ->
  ?blocks:block_list ->
  ?human_loop_activation_output:human_loop_activation_output ->
  ?analyze_document_model_version:string_ ->
  unit ->
  analyze_document_response

val make_queries_config : queries:queries -> unit -> queries_config

val make_human_loop_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> human_loop_data_attributes

val make_human_loop_config :
  ?data_attributes:human_loop_data_attributes ->
  human_loop_name:human_loop_name ->
  flow_definition_arn:flow_definition_arn ->
  unit ->
  human_loop_config

val make_document : ?bytes:image_blob -> ?s3_object:s3_object -> unit -> document

val make_analyze_document_request :
  ?human_loop_config:human_loop_config ->
  ?queries_config:queries_config ->
  ?adapters_config:adapters_config ->
  document:document ->
  feature_types:feature_types ->
  unit ->
  analyze_document_request

val make_expense_group_property :
  ?types:string_list -> ?id:string_ -> unit -> expense_group_property

val make_expense_currency : ?code:string_ -> ?confidence:percent -> unit -> expense_currency

val make_expense_detection :
  ?text:string_ -> ?geometry:geometry -> ?confidence:percent -> unit -> expense_detection

val make_expense_type : ?text:string_ -> ?confidence:percent -> unit -> expense_type

val make_expense_field :
  ?type_:expense_type ->
  ?label_detection:expense_detection ->
  ?value_detection:expense_detection ->
  ?page_number:u_integer ->
  ?currency:expense_currency ->
  ?group_properties:expense_group_property_list ->
  unit ->
  expense_field

val make_line_item_fields : ?line_item_expense_fields:expense_field_list -> unit -> line_item_fields

val make_line_item_group :
  ?line_item_group_index:u_integer -> ?line_items:line_item_list -> unit -> line_item_group

val make_expense_document :
  ?expense_index:u_integer ->
  ?summary_fields:expense_field_list ->
  ?line_item_groups:line_item_group_list ->
  ?blocks:block_list ->
  unit ->
  expense_document

val make_analyze_expense_response :
  ?document_metadata:document_metadata ->
  ?expense_documents:expense_document_list ->
  unit ->
  analyze_expense_response

val make_analyze_expense_request : document:document -> unit -> analyze_expense_request
val make_normalized_value : ?value:string_ -> ?value_type:value_type -> unit -> normalized_value

val make_analyze_id_detections :
  ?normalized_value:normalized_value ->
  ?confidence:percent ->
  text:string_ ->
  unit ->
  analyze_id_detections

val make_identity_document_field :
  ?type_:analyze_id_detections ->
  ?value_detection:analyze_id_detections ->
  unit ->
  identity_document_field

val make_identity_document :
  ?document_index:u_integer ->
  ?identity_document_fields:identity_document_field_list ->
  ?blocks:block_list ->
  unit ->
  identity_document

val make_analyze_id_response :
  ?identity_documents:identity_document_list ->
  ?document_metadata:document_metadata ->
  ?analyze_id_model_version:string_ ->
  unit ->
  analyze_id_response

val make_analyze_id_request : document_pages:document_pages -> unit -> analyze_id_request
val make_create_adapter_response : ?adapter_id:adapter_id -> unit -> create_adapter_response

val make_create_adapter_request :
  ?client_request_token:client_request_token ->
  ?description:adapter_description ->
  ?auto_update:auto_update ->
  ?tags:tag_map ->
  adapter_name:adapter_name ->
  feature_types:feature_types ->
  unit ->
  create_adapter_request

val make_create_adapter_version_response :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  unit ->
  create_adapter_version_response

val make_output_config : ?s3_prefix:s3_object_name -> s3_bucket:s3_bucket -> unit -> output_config

val make_create_adapter_version_request :
  ?client_request_token:client_request_token ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_map ->
  adapter_id:adapter_id ->
  dataset_config:adapter_version_dataset_config ->
  output_config:output_config ->
  unit ->
  create_adapter_version_request

val make_delete_adapter_response : unit -> unit
val make_delete_adapter_request : adapter_id:adapter_id -> unit -> delete_adapter_request
val make_delete_adapter_version_response : unit -> unit

val make_delete_adapter_version_request :
  adapter_id:adapter_id -> adapter_version:adapter_version -> unit -> delete_adapter_version_request

val make_detect_document_text_response :
  ?document_metadata:document_metadata ->
  ?blocks:block_list ->
  ?detect_document_text_model_version:string_ ->
  unit ->
  detect_document_text_response

val make_detect_document_text_request : document:document -> unit -> detect_document_text_request
val make_detected_signature : ?page:u_integer -> unit -> detected_signature
val make_undetected_signature : ?page:u_integer -> unit -> undetected_signature
val make_split_document : ?index:u_integer -> ?pages:page_list -> unit -> split_document

val make_document_group :
  ?type_:non_empty_string ->
  ?split_documents:split_document_list ->
  ?detected_signatures:detected_signature_list ->
  ?undetected_signatures:undetected_signature_list ->
  unit ->
  document_group

val make_document_location : ?s3_object:s3_object -> unit -> document_location

val make_signature_detection :
  ?confidence:percent -> ?geometry:geometry -> unit -> signature_detection

val make_lending_detection :
  ?text:string_ ->
  ?selection_status:selection_status ->
  ?geometry:geometry ->
  ?confidence:percent ->
  unit ->
  lending_detection

val make_lending_field :
  ?type_:string_ ->
  ?key_detection:lending_detection ->
  ?value_detections:lending_detection_list ->
  unit ->
  lending_field

val make_lending_document :
  ?lending_fields:lending_field_list ->
  ?signature_detections:signature_detection_list ->
  unit ->
  lending_document

val make_extraction :
  ?lending_document:lending_document ->
  ?expense_document:expense_document ->
  ?identity_document:identity_document ->
  unit ->
  extraction

val make_get_adapter_response :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?description:adapter_description ->
  ?feature_types:feature_types ->
  ?auto_update:auto_update ->
  ?tags:tag_map ->
  unit ->
  get_adapter_response

val make_get_adapter_request : adapter_id:adapter_id -> unit -> get_adapter_request

val make_get_adapter_version_response :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  ?status:adapter_version_status ->
  ?status_message:adapter_version_status_message ->
  ?dataset_config:adapter_version_dataset_config ->
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?evaluation_metrics:adapter_version_evaluation_metrics ->
  ?tags:tag_map ->
  unit ->
  get_adapter_version_response

val make_get_adapter_version_request :
  adapter_id:adapter_id -> adapter_version:adapter_version -> unit -> get_adapter_version_request

val make_warning : ?error_code:error_code -> ?pages:pages -> unit -> warning

val make_get_document_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?blocks:block_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_document_model_version:string_ ->
  unit ->
  get_document_analysis_response

val make_get_document_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_document_analysis_request

val make_get_document_text_detection_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?blocks:block_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?detect_document_text_model_version:string_ ->
  unit ->
  get_document_text_detection_response

val make_get_document_text_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_document_text_detection_request

val make_get_expense_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?expense_documents:expense_document_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_expense_model_version:string_ ->
  unit ->
  get_expense_analysis_response

val make_get_expense_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_expense_analysis_request

val make_prediction : ?value:non_empty_string -> ?confidence:percent -> unit -> prediction

val make_page_classification :
  page_type:prediction_list -> page_number:prediction_list -> unit -> page_classification

val make_get_lending_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?results:lending_result_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_lending_model_version:string_ ->
  unit ->
  get_lending_analysis_response

val make_get_lending_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_lending_analysis_request

val make_lending_summary :
  ?document_groups:document_group_list ->
  ?undetected_document_types:undetected_document_type_list ->
  unit ->
  lending_summary

val make_get_lending_analysis_summary_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?summary:lending_summary ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_lending_model_version:string_ ->
  unit ->
  get_lending_analysis_summary_response

val make_get_lending_analysis_summary_request :
  job_id:job_id -> unit -> get_lending_analysis_summary_request

val make_list_adapter_versions_response :
  ?adapter_versions:adapter_version_list ->
  ?next_token:pagination_token ->
  unit ->
  list_adapter_versions_response

val make_list_adapter_versions_request :
  ?adapter_id:adapter_id ->
  ?after_creation_time:date_time ->
  ?before_creation_time:date_time ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_adapter_versions_request

val make_list_adapters_response :
  ?adapters:adapter_list -> ?next_token:pagination_token -> unit -> list_adapters_response

val make_list_adapters_request :
  ?after_creation_time:date_time ->
  ?before_creation_time:date_time ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_adapters_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_notification_channel :
  sns_topic_arn:sns_topic_arn -> role_arn:role_arn -> unit -> notification_channel

val make_start_document_analysis_response :
  ?job_id:job_id -> unit -> start_document_analysis_response

val make_start_document_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  ?queries_config:queries_config ->
  ?adapters_config:adapters_config ->
  document_location:document_location ->
  feature_types:feature_types ->
  unit ->
  start_document_analysis_request

val make_start_document_text_detection_response :
  ?job_id:job_id -> unit -> start_document_text_detection_response

val make_start_document_text_detection_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_document_text_detection_request

val make_start_expense_analysis_response : ?job_id:job_id -> unit -> start_expense_analysis_response

val make_start_expense_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_expense_analysis_request

val make_start_lending_analysis_response : ?job_id:job_id -> unit -> start_lending_analysis_response

val make_start_lending_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_lending_analysis_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_map -> unit -> tag_resource_request

val make_update_adapter_response :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?description:adapter_description ->
  ?feature_types:feature_types ->
  ?auto_update:auto_update ->
  unit ->
  update_adapter_response

val make_update_adapter_request :
  ?description:adapter_description ->
  ?adapter_name:adapter_name ->
  ?auto_update:auto_update ->
  adapter_id:adapter_id ->
  unit ->
  update_adapter_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request
(** {1:operations Operations} *)

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes any tags with the specified keys from the specified resource.\n"]

module UpdateAdapter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_adapter_request ->
    ( update_adapter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_adapter_request ->
    ( update_adapter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update the configuration for an adapter. FeatureTypes configurations cannot be updated. At \
   least one new parameter must be specified as an argument.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds one or more tags to the specified resource.\n"]

module StartLendingAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_lending_analysis_request ->
    ( start_lending_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_lending_analysis_request ->
    ( start_lending_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the classification and analysis of an input document. [StartLendingAnalysis] initiates \
   the classification and analysis of a packet of lending documents. [StartLendingAnalysis] \
   operates on a document file located in an Amazon S3 bucket.\n\n\
  \  [StartLendingAnalysis] can analyze text in documents that are in one of the following \
   formats: JPEG, PNG, TIFF, PDF. Use [DocumentLocation] to specify the bucket name and the file \
   name of the document. \n\
  \ \n\
  \   [StartLendingAnalysis] returns a job identifier ([JobId]) that you use to get the results of \
   the operation. When the text analysis is finished, Amazon Textract publishes a completion \
   status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in \
   [NotificationChannel]. To get the results of the text analysis operation, first check that the \
   status value published to the Amazon SNS topic is SUCCEEDED. If the status is SUCCEEDED you can \
   call either [GetLendingAnalysis] or [GetLendingAnalysisSummary] and provide the [JobId] to \
   obtain the results of the analysis.\n\
  \  \n\
  \   If using [OutputConfig] to specify an Amazon S3 bucket, the output will be contained within \
   the specified prefix in a directory labeled with the job-id. In the directory there are 3 \
   sub-directories: \n\
  \   \n\
  \    {ul\n\
  \          {-  detailedResponse (contains the GetLendingAnalysis response)\n\
  \              \n\
  \               }\n\
  \          {-  summaryResponse (for the GetLendingAnalysisSummary response)\n\
  \              \n\
  \               }\n\
  \          {-  splitDocuments (documents split across logical boundaries)\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module StartExpenseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_expense_analysis_request ->
    ( start_expense_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_expense_analysis_request ->
    ( start_expense_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the asynchronous analysis of invoices or receipts for data like contact information, \
   items purchased, and vendor names.\n\n\
  \  [StartExpenseAnalysis] can analyze text in documents that are in JPEG, PNG, and PDF format. \
   The documents must be stored in an Amazon S3 bucket. Use the [DocumentLocation] parameter to \
   specify the name of your S3 bucket and the name of the document in that bucket. \n\
  \ \n\
  \   [StartExpenseAnalysis] returns a job identifier ([JobId]) that you will provide to \
   [GetExpenseAnalysis] to retrieve the results of the operation. When the analysis of the input \
   invoices/receipts is finished, Amazon Textract publishes a completion status to the Amazon \
   Simple Notification Service (Amazon SNS) topic that you provide to the [NotificationChannel]. \
   To obtain the results of the invoice and receipt analysis operation, ensure that the status \
   value published to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetExpenseAnalysis], and \
   pass the job identifier ([JobId]) that was returned by your call to [StartExpenseAnalysis].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/invoice-receipts.html}Analyzing Invoices and \
   Receipts}.\n\
  \   "]

module StartDocumentTextDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_document_text_detection_request ->
    ( start_document_text_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_document_text_detection_request ->
    ( start_document_text_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of \
   text and the words that make up a line of text.\n\n\
  \  [StartDocumentTextDetection] can analyze text in documents that are in JPEG, PNG, TIFF, and \
   PDF format. The documents are stored in an Amazon S3 bucket. Use [DocumentLocation] to specify \
   the bucket name and file name of the document. \n\
  \ \n\
  \   [StartDocumentTextDetection] returns a job identifier ([JobId]) that you use to get the \
   results of the operation. When text detection is finished, Amazon Textract publishes a \
   completion status to the Amazon Simple Notification Service (Amazon SNS) topic that you specify \
   in [NotificationChannel]. To get the results of the text detection operation, first check that \
   the status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetDocumentTextDetection], and pass the job identifier ([JobId]) from the initial call to \
   [StartDocumentTextDetection].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html}Document Text \
   Detection}.\n\
  \   "]

module StartDocumentAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_document_analysis_request ->
    ( start_document_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_document_analysis_request ->
    ( start_document_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the asynchronous analysis of an input document for relationships between detected items \
   such as key-value pairs, tables, and selection elements.\n\n\
  \  [StartDocumentAnalysis] can analyze text in documents that are in JPEG, PNG, TIFF, and PDF \
   format. The documents are stored in an Amazon S3 bucket. Use [DocumentLocation] to specify the \
   bucket name and file name of the document. \n\
  \ \n\
  \   [StartDocumentAnalysis] returns a job identifier ([JobId]) that you use to get the results \
   of the operation. When text analysis is finished, Amazon Textract publishes a completion status \
   to the Amazon Simple Notification Service (Amazon SNS) topic that you specify in \
   [NotificationChannel]. To get the results of the text analysis operation, first check that the \
   status value published to the Amazon SNS topic is [SUCCEEDED]. If so, call \
   [GetDocumentAnalysis], and pass the job identifier ([JobId]) from the initial call to \
   [StartDocumentAnalysis].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html}Document Text \
   Analysis}.\n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
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
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags for an Amazon Textract resource.\n"]

module ListAdapters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_adapters_request ->
    ( list_adapters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_adapters_request ->
    ( list_adapters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all adapters that match the specified filtration criteria.\n"]

module ListAdapterVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_adapter_versions_request ->
    ( list_adapter_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_adapter_versions_request ->
    ( list_adapter_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all version of an adapter that meet the specified filtration criteria.\n"]

module GetLendingAnalysisSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidJobIdException of invalid_job_id_exception
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lending_analysis_summary_request ->
    ( get_lending_analysis_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lending_analysis_summary_request ->
    ( get_lending_analysis_summary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets summarized results for the [StartLendingAnalysis] operation, which analyzes text in a \
   lending document. The returned summary consists of information about documents grouped together \
   by a common document type. Information like detected signatures, page numbers, and split \
   documents is returned with respect to the type of grouped document. \n\n\
  \ You start asynchronous text analysis by calling [StartLendingAnalysis], which returns a job \
   identifier ([JobId]). When the text analysis operation finishes, Amazon Textract publishes a \
   completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's \
   registered in the initial call to [StartLendingAnalysis]. \n\
  \ \n\
  \  To get the results of the text analysis operation, first check that the status value \
   published to the Amazon SNS topic is SUCCEEDED. If so, call [GetLendingAnalysisSummary], and \
   pass the job identifier ([JobId]) from the initial call to [StartLendingAnalysis].\n\
  \  "]

module GetLendingAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidJobIdException of invalid_job_id_exception
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lending_analysis_request ->
    ( get_lending_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lending_analysis_request ->
    ( get_lending_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the results for an Amazon Textract asynchronous operation that analyzes text in a lending \
   document. \n\n\
  \ You start asynchronous text analysis by calling [StartLendingAnalysis], which returns a job \
   identifier ([JobId]). When the text analysis operation finishes, Amazon Textract publishes a \
   completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's \
   registered in the initial call to [StartLendingAnalysis]. \n\
  \ \n\
  \  To get the results of the text analysis operation, first check that the status value \
   published to the Amazon SNS topic is SUCCEEDED. If so, call GetLendingAnalysis, and pass the \
   job identifier ([JobId]) from the initial call to [StartLendingAnalysis].\n\
  \  "]

module GetExpenseAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidJobIdException of invalid_job_id_exception
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_expense_analysis_request ->
    ( get_expense_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_expense_analysis_request ->
    ( get_expense_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the results for an Amazon Textract asynchronous operation that analyzes invoices and \
   receipts. Amazon Textract finds contact information, items purchased, and vendor name, from \
   input invoices and receipts.\n\n\
  \ You start asynchronous invoice/receipt analysis by calling [StartExpenseAnalysis], which \
   returns a job identifier ([JobId]). Upon completion of the invoice/receipt analysis, Amazon \
   Textract publishes the completion status to the Amazon Simple Notification Service (Amazon SNS) \
   topic. This topic must be registered in the initial call to [StartExpenseAnalysis]. To get the \
   results of the invoice/receipt analysis operation, first ensure that the status value published \
   to the Amazon SNS topic is [SUCCEEDED]. If so, call [GetExpenseAnalysis], and pass the job \
   identifier ([JobId]) from the initial call to [StartExpenseAnalysis].\n\
  \ \n\
  \  Use the MaxResults parameter to limit the number of blocks that are returned. If there are \
   more results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetExpenseAnalysis], and populate the [NextToken] request parameter with the \
   token value that's returned from the previous call to [GetExpenseAnalysis].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/invoices-receipts.html}Analyzing Invoices and \
   Receipts}.\n\
  \   "]

module GetDocumentTextDetection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidJobIdException of invalid_job_id_exception
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_document_text_detection_request ->
    ( get_document_text_detection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_document_text_detection_request ->
    ( get_document_text_detection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the results for an Amazon Textract asynchronous operation that detects text in a document. \
   Amazon Textract can detect lines of text and the words that make up a line of text.\n\n\
  \ You start asynchronous text detection by calling [StartDocumentTextDetection], which returns a \
   job identifier ([JobId]). When the text detection operation finishes, Amazon Textract publishes \
   a completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's \
   registered in the initial call to [StartDocumentTextDetection]. To get the results of the \
   text-detection operation, first check that the status value published to the Amazon SNS topic \
   is [SUCCEEDED]. If so, call [GetDocumentTextDetection], and pass the job identifier ([JobId]) \
   from the initial call to [StartDocumentTextDetection].\n\
  \ \n\
  \   [GetDocumentTextDetection] returns an array of [Block] objects. \n\
  \  \n\
  \   Each document page has as an associated [Block] of type PAGE. Each PAGE [Block] object is \
   the parent of LINE [Block] objects that represent the lines of detected text on a page. A LINE \
   [Block] object is a parent for each word that makes up the line. Words are represented by \
   [Block] objects of type WORD.\n\
  \   \n\
  \    Use the MaxResults parameter to limit the number of blocks that are returned. If there are \
   more results than specified in [MaxResults], the value of [NextToken] in the operation response \
   contains a pagination token for getting the next set of results. To get the next page of \
   results, call [GetDocumentTextDetection], and populate the [NextToken] request parameter with \
   the token value that's returned from the previous call to [GetDocumentTextDetection].\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html}Document Text \
   Detection}.\n\
  \     "]

module GetDocumentAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidJobIdException of invalid_job_id_exception
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_document_analysis_request ->
    ( get_document_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_document_analysis_request ->
    ( get_document_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidJobIdException of invalid_job_id_exception
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the results for an Amazon Textract asynchronous operation that analyzes text in a \
   document.\n\n\
  \ You start asynchronous text analysis by calling [StartDocumentAnalysis], which returns a job \
   identifier ([JobId]). When the text analysis operation finishes, Amazon Textract publishes a \
   completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's \
   registered in the initial call to [StartDocumentAnalysis]. To get the results of the \
   text-detection operation, first check that the status value published to the Amazon SNS topic \
   is [SUCCEEDED]. If so, call [GetDocumentAnalysis], and pass the job identifier ([JobId]) from \
   the initial call to [StartDocumentAnalysis].\n\
  \ \n\
  \   [GetDocumentAnalysis] returns an array of [Block] objects. The following types of \
   information are returned: \n\
  \  \n\
  \   {ul\n\
  \         {-  Form data (key-value pairs). The related information is returned in two [Block] \
   objects, each of type [KEY_VALUE_SET]: a KEY [Block] object and a VALUE [Block] object. For \
   example, {i Name: Ana Silva Carolina} contains a key and value. {i Name:} is the key. {i Ana \
   Silva Carolina} is the value.\n\
  \             \n\
  \              }\n\
  \         {-  Table and table cell data. A TABLE [Block] object contains information about a \
   detected table. A CELL [Block] object is returned for each cell in a table.\n\
  \             \n\
  \              }\n\
  \         {-  Lines and words of text. A LINE [Block] object contains one or more WORD [Block] \
   objects. All lines and words that are detected in the document are returned (including text \
   that doesn't have a relationship with the value of the [StartDocumentAnalysis] [FeatureTypes] \
   input parameter). \n\
  \             \n\
  \              }\n\
  \         {-  Query. A QUERY Block object contains the query text, alias and link to the \
   associated Query results block object.\n\
  \             \n\
  \              }\n\
  \         {-  Query Results. A QUERY_RESULT Block object contains the answer to the query and an \
   ID that connects it to the query asked. This Block also contains a confidence score.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    While processing a document with queries, look out for [INVALID_REQUEST_PARAMETERS] output. \
   This indicates that either the per page query limit has been exceeded or that the operation is \
   trying to query a page in the document which doesn\226\128\153t exist. \n\
  \    \n\
  \      Selection elements such as check boxes and option buttons (radio buttons) can be detected \
   in form data and in tables. A SELECTION_ELEMENT [Block] object contains information about a \
   selection element, including the selection status.\n\
  \      \n\
  \       Use the [MaxResults] parameter to limit the number of blocks that are returned. If there \
   are more results than specified in [MaxResults], the value of [NextToken] in the operation \
   response contains a pagination token for getting the next set of results. To get the next page \
   of results, call [GetDocumentAnalysis], and populate the [NextToken] request parameter with the \
   token value that's returned from the previous call to [GetDocumentAnalysis].\n\
  \       \n\
  \        For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html}Document Text \
   Analysis}.\n\
  \        "]

module GetAdapterVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_adapter_version_request ->
    ( get_adapter_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_adapter_version_request ->
    ( get_adapter_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets configuration information for the specified adapter version, including: AdapterId, \
   AdapterVersion, FeatureTypes, Status, StatusMessage, DatasetConfig, KMSKeyId, OutputConfig, \
   Tags and EvaluationMetrics.\n"]

module GetAdapter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_adapter_request ->
    ( get_adapter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_adapter_request ->
    ( get_adapter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets configuration information for an adapter specified by an AdapterId, returning information \
   on AdapterName, Description, CreationTime, AutoUpdate status, and FeatureTypes.\n"]

module DetectDocumentText : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_document_text_request ->
    ( detect_document_text_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_document_text_request ->
    ( detect_document_text_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects text in the input document. Amazon Textract can detect lines of text and the words that \
   make up a line of text. The input document must be in one of the following image formats: JPEG, \
   PNG, PDF, or TIFF. [DetectDocumentText] returns the detected text in an array of [Block] \
   objects. \n\n\
  \ Each document page has as an associated [Block] of type PAGE. Each PAGE [Block] object is the \
   parent of LINE [Block] objects that represent the lines of detected text on a page. A LINE \
   [Block] object is a parent for each word that makes up the line. Words are represented by \
   [Block] objects of type WORD.\n\
  \ \n\
  \   [DetectDocumentText] is a synchronous operation. To analyze documents asynchronously, use \
   [StartDocumentTextDetection].\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html}Document Text \
   Detection}.\n\
  \   "]

module DeleteAdapterVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_adapter_version_request ->
    ( delete_adapter_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_adapter_version_request ->
    ( delete_adapter_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Textract adapter version. Requires that you specify both an AdapterId and a \
   AdapterVersion. Deletes the adapter version specified by the AdapterId and the AdapterVersion.\n"]

module DeleteAdapter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_adapter_request ->
    ( delete_adapter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_adapter_request ->
    ( delete_adapter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Textract adapter. Takes an AdapterId and deletes the adapter specified by the \
   ID.\n"]

module CreateAdapterVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidKMSKeyException of invalid_kms_key_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_adapter_version_request ->
    ( create_adapter_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_adapter_version_request ->
    ( create_adapter_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidKMSKeyException of invalid_kms_key_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of an adapter. Operates on a provided AdapterId and a specified dataset \
   provided via the DatasetConfig argument. Requires that you specify an Amazon S3 bucket with the \
   OutputConfig argument. You can provide an optional KMSKeyId, an optional ClientRequestToken, \
   and optional tags.\n"]

module CreateAdapter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_adapter_request ->
    ( create_adapter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_adapter_request ->
    ( create_adapter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an adapter, which can be fine-tuned for enhanced performance on user provided \
   documents. Takes an AdapterName and FeatureType. Currently the only supported feature type is \
   [QUERIES]. You can also provide a Description, Tags, and a ClientRequestToken. You can choose \
   whether or not the adapter should be AutoUpdated with the AutoUpdate argument. By default, \
   AutoUpdate is set to DISABLED.\n"]

module AnalyzeID : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    analyze_id_request ->
    ( analyze_id_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    analyze_id_request ->
    ( analyze_id_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Analyzes identity documents for relevant information. This information is extracted and \
   returned as [IdentityDocumentFields], which records both the normalized field and value of the \
   extracted text. Unlike other Amazon Textract operations, [AnalyzeID] doesn't return any \
   Geometry data.\n"]

module AnalyzeExpense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    analyze_expense_request ->
    ( analyze_expense_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    analyze_expense_request ->
    ( analyze_expense_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [AnalyzeExpense] synchronously analyzes an input document for financially related \
   relationships between text.\n\n\
  \ Information is returned as [ExpenseDocuments] and seperated as follows:\n\
  \ \n\
  \  {ul\n\
  \        {-   [LineItemGroups]- A data set containing [LineItems] which store information about \
   the lines of text, such as an item purchased and its price on a receipt.\n\
  \            \n\
  \             }\n\
  \        {-   [SummaryFields]- Contains all other information a receipt, such as header \
   information or the vendors name.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module AnalyzeDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BadDocumentException of bad_document_exception
    | `DocumentTooLargeException of document_too_large_exception
    | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
    | `InternalServerError of internal_server_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidS3ObjectException of invalid_s3_object_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `UnsupportedDocumentException of unsupported_document_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    analyze_document_request ->
    ( analyze_document_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    analyze_document_request ->
    ( analyze_document_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BadDocumentException of bad_document_exception
      | `DocumentTooLargeException of document_too_large_exception
      | `HumanLoopQuotaExceededException of human_loop_quota_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidS3ObjectException of invalid_s3_object_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `UnsupportedDocumentException of unsupported_document_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Analyzes an input document for relationships between detected items. \n\n\
  \ The types of information returned are as follows: \n\
  \ \n\
  \  {ul\n\
  \        {-  Form data (key-value pairs). The related information is returned in two [Block] \
   objects, each of type [KEY_VALUE_SET]: a KEY [Block] object and a VALUE [Block] object. For \
   example, {i Name: Ana Silva Carolina} contains a key and value. {i Name:} is the key. {i Ana \
   Silva Carolina} is the value.\n\
  \            \n\
  \             }\n\
  \        {-  Table and table cell data. A TABLE [Block] object contains information about a \
   detected table. A CELL [Block] object is returned for each cell in a table.\n\
  \            \n\
  \             }\n\
  \        {-  Lines and words of text. A LINE [Block] object contains one or more WORD [Block] \
   objects. All lines and words that are detected in the document are returned (including text \
   that doesn't have a relationship with the value of [FeatureTypes]). \n\
  \            \n\
  \             }\n\
  \        {-  Signatures. A SIGNATURE [Block] object contains the location information of a \
   signature in a document. If used in conjunction with forms or tables, a signature can be given \
   a Key-Value pairing or be detected in the cell of a table.\n\
  \            \n\
  \             }\n\
  \        {-  Query. A QUERY Block object contains the query text, alias and link to the \
   associated Query results block object.\n\
  \            \n\
  \             }\n\
  \        {-  Query Result. A QUERY_RESULT Block object contains the answer to the query and an \
   ID that connects it to the query asked. This Block also contains a confidence score.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Selection elements such as check boxes and option buttons (radio buttons) can be detected in \
   form data and in tables. A SELECTION_ELEMENT [Block] object contains information about a \
   selection element, including the selection status.\n\
  \   \n\
  \    You can choose which type of analysis to perform by specifying the [FeatureTypes] list. \n\
  \    \n\
  \     The output is returned in a list of [Block] objects.\n\
  \     \n\
  \       [AnalyzeDocument] is a synchronous operation. To analyze documents asynchronously, use \
   [StartDocumentAnalysis].\n\
  \      \n\
  \       For more information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html}Document Text \
   Analysis}.\n\
  \       "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
