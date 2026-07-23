open Types

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
