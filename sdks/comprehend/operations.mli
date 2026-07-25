open Types

module ContainsPiiEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    contains_pii_entities_request ->
    ( contains_pii_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    contains_pii_entities_request ->
    ( contains_pii_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Analyzes input text for the presence of personally identifiable information (PII) and returns \
   the labels of identified PII entity types such as name, address, bank account number, or phone \
   number.\n"]

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a dataset to upload training or test data for a model associated with a flywheel. For \
   more information about datasets, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel overview} in \
   the {i Amazon Comprehend Developer Guide}.\n"]

module CreateDocumentClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_document_classifier_request ->
    ( create_document_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_document_classifier_request ->
    ( create_document_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new document classifier that you can use to categorize documents. To create a \
   classifier, you provide a set of training documents that are labeled with the categories that \
   you want to use. For more information, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/training-classifier-model.html}Training \
   classifier models} in the Comprehend Developer Guide. \n"]

module CreateEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_request ->
    ( create_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_request ->
    ( create_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a model-specific endpoint for synchronous inference for a previously trained custom \
   model For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

module CreateEntityRecognizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_entity_recognizer_request ->
    ( create_entity_recognizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_entity_recognizer_request ->
    ( create_entity_recognizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an entity recognizer using submitted files. After your [CreateEntityRecognizer] request \
   is submitted, you can check job status using the [DescribeEntityRecognizer] API. \n"]

module CreateFlywheel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_flywheel_request ->
    ( create_flywheel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_flywheel_request ->
    ( create_flywheel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A flywheel is an Amazon Web Services resource that orchestrates the ongoing training of a model \
   for custom classification or custom entity recognition. You can create a flywheel to start with \
   an existing trained model, or Comprehend can create and train a new model.\n\n\
  \ When you create the flywheel, Comprehend creates a data lake in your account. The data lake \
   holds the training data and test data for all versions of the model.\n\
  \ \n\
  \  To use a flywheel with an existing trained model, you specify the active model version. \
   Comprehend copies the model's training data and test data into the flywheel's data lake.\n\
  \  \n\
  \   To use the flywheel with a new model, you need to provide a dataset for training data (and \
   optional test data) when you create the flywheel.\n\
  \   \n\
  \    For more information about flywheels, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel overview} in \
   the {i Amazon Comprehend Developer Guide}.\n\
  \    "]

module DeleteDocumentClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_document_classifier_request ->
    ( delete_document_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_document_classifier_request ->
    ( delete_document_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously created document classifier\n\n\
  \ Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If \
   an active inference job is using the model, a [ResourceInUseException] will be returned.\n\
  \ \n\
  \  This is an asynchronous action that puts the classifier into a DELETING state, and it is then \
   removed by a background job. Once removed, the classifier disappears from your account and is \
   no longer available for use. \n\
  \  "]

module DeleteEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_request ->
    ( delete_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_request ->
    ( delete_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be \
   deleted in order for the model to be deleted. For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

module DeleteEntityRecognizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_entity_recognizer_request ->
    ( delete_entity_recognizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_entity_recognizer_request ->
    ( delete_entity_recognizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an entity recognizer.\n\n\
  \ Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If \
   an active inference job is using the model, a [ResourceInUseException] will be returned.\n\
  \ \n\
  \  This is an asynchronous action that puts the recognizer into a DELETING state, and it is then \
   removed by a background job. Once removed, the recognizer disappears from your account and is \
   no longer available for use. \n\
  \  "]

module DeleteFlywheel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_flywheel_request ->
    ( delete_flywheel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_flywheel_request ->
    ( delete_flywheel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a flywheel. When you delete the flywheel, Amazon Comprehend does not delete the data \
   lake or the model associated with the flywheel.\n\n\
  \ For more information about flywheels, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel overview} in \
   the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a resource-based policy that is attached to a custom model.\n"]

module DescribeDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the dataset that you specify. For more information about datasets, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel \
   overview} in the {i Amazon Comprehend Developer Guide}.\n"]

module DescribeDocumentClassificationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_document_classification_job_request ->
    ( describe_document_classification_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_document_classification_job_request ->
    ( describe_document_classification_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a document classification job. Use this operation to get \
   the status of a classification job.\n"]

module DescribeDocumentClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_document_classifier_request ->
    ( describe_document_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_document_classifier_request ->
    ( describe_document_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the properties associated with a document classifier.\n"]

module DescribeDominantLanguageDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dominant_language_detection_job_request ->
    ( describe_dominant_language_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dominant_language_detection_job_request ->
    ( describe_dominant_language_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a dominant language detection job. Use this operation to \
   get the status of a detection job.\n"]

module DescribeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_request ->
    ( describe_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoint_request ->
    ( describe_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a specific endpoint. Use this operation to get the status \
   of an endpoint. For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

module DescribeEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entities_detection_job_request ->
    ( describe_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entities_detection_job_request ->
    ( describe_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with an entities detection job. Use this operation to get the \
   status of a detection job.\n"]

module DescribeEntityRecognizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_recognizer_request ->
    ( describe_entity_recognizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_recognizer_request ->
    ( describe_entity_recognizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about an entity recognizer including status, S3 buckets containing training \
   data, recognizer metadata, metrics, and so on.\n"]

module DescribeEventsDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_detection_job_request ->
    ( describe_events_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_detection_job_request ->
    ( describe_events_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the status and details of an events detection job.\n"]

module DescribeFlywheel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_flywheel_request ->
    ( describe_flywheel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_flywheel_request ->
    ( describe_flywheel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides configuration information about the flywheel. For more information about flywheels, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel \
   overview} in the {i Amazon Comprehend Developer Guide}.\n"]

module DescribeFlywheelIteration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_flywheel_iteration_request ->
    ( describe_flywheel_iteration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_flywheel_iteration_request ->
    ( describe_flywheel_iteration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the configuration properties of a flywheel iteration. For more information about \
   flywheels, see {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} \
   Flywheel overview} in the {i Amazon Comprehend Developer Guide}.\n"]

module DescribeKeyPhrasesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_key_phrases_detection_job_request ->
    ( describe_key_phrases_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_key_phrases_detection_job_request ->
    ( describe_key_phrases_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a key phrases detection job. Use this operation to get the \
   status of a detection job.\n"]

module DescribePiiEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_pii_entities_detection_job_request ->
    ( describe_pii_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_pii_entities_detection_job_request ->
    ( describe_pii_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a PII entities detection job. For example, you can use this \
   operation to get the job status.\n"]

module DescribeResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_policy_request ->
    ( describe_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the details of a resource-based policy that is attached to a custom model, including the \
   JSON body of the policy.\n"]

module DescribeSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_sentiment_detection_job_request ->
    ( describe_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_sentiment_detection_job_request ->
    ( describe_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a sentiment detection job. Use this operation to get the \
   status of a detection job.\n"]

module DescribeTargetedSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_targeted_sentiment_detection_job_request ->
    ( describe_targeted_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_targeted_sentiment_detection_job_request ->
    ( describe_targeted_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a targeted sentiment detection job. Use this operation to \
   get the status of the job.\n"]

module DescribeTopicsDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_topics_detection_job_request ->
    ( describe_topics_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_topics_detection_job_request ->
    ( describe_topics_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with a topic detection job. Use this operation to get the status \
   of a detection job.\n"]

module DetectDominantLanguage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_dominant_language_request ->
    ( detect_dominant_language_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_dominant_language_request ->
    ( detect_dominant_language_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Determines the dominant language of the input text. For a list of languages that Amazon \
   Comprehend can detect, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html}Amazon Comprehend \
   Supported Languages}. \n"]

module DetectEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_request ->
    ( detect_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_entities_request ->
    ( detect_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects named entities in input text when you use the pre-trained model. Detects custom \
   entities if you have a custom entity recognition model. \n\n\
  \  When detecting named entities using the pre-trained model, use plain text as the input. For \
   more information about named entities, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html}Entities} in the \
   Comprehend Developer Guide.\n\
  \ \n\
  \  When you use a custom entity recognition model, you can input plain text or you can upload a \
   single-page input document (text, PDF, Word, or image). \n\
  \  \n\
  \   If the system detects errors while processing a page in the input document, the API response \
   includes an entry in [Errors] for each error. \n\
  \   \n\
  \    If the system detects a document-level error in your input document, the API returns an \
   [InvalidRequestException] error response. For details about this exception, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html} Errors in \
   semi-structured documents} in the Comprehend Developer Guide. \n\
  \    "]

module DetectKeyPhrases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_key_phrases_request ->
    ( detect_key_phrases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_key_phrases_request ->
    ( detect_key_phrases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Detects the key noun phrases found in the text. \n"]

module DetectPiiEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_pii_entities_request ->
    ( detect_pii_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_pii_entities_request ->
    ( detect_pii_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the input text for entities that contain personally identifiable information (PII) and \
   returns information about them.\n"]

module DetectSentiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_sentiment_request ->
    ( detect_sentiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_sentiment_request ->
    ( detect_sentiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects text and returns an inference of the prevailing sentiment ([POSITIVE], [NEUTRAL], \
   [MIXED], or [NEGATIVE]). \n"]

module DetectSyntax : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_syntax_request ->
    ( detect_syntax_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_syntax_request ->
    ( detect_syntax_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects text for syntax and the part of speech of words in the document. For more information, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html}Syntax} in the \
   Comprehend Developer Guide. \n"]

module DetectTargetedSentiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_targeted_sentiment_request ->
    ( detect_targeted_sentiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_targeted_sentiment_request ->
    ( detect_targeted_sentiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the input text and returns a sentiment analysis for each entity identified in the \
   text.\n\n\
  \ For more information about targeted sentiment, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html}Targeted \
   sentiment} in the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

module DetectToxicContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_toxic_content_request ->
    ( detect_toxic_content_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_toxic_content_request ->
    ( detect_toxic_content_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Performs toxicity analysis on the list of text strings that you provide as input. The API \
   response contains a results list that matches the size of the input list. For more information \
   about toxicity detection, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html}Toxicity detection} \
   in the {i Amazon Comprehend Developer Guide}. \n"]

module ImportModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_model_request ->
    ( import_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_model_request ->
    ( import_model_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom model that replicates a source custom model that you import. The source \
   model can be in your Amazon Web Services account or another one.\n\n\
  \ If the source model is in another Amazon Web Services account, then it must have a \
   resource-based policy that authorizes you to import it.\n\
  \ \n\
  \  The source model must be in the same Amazon Web Services Region that you're using when you \
   import. You can't import a model that's in a different Region.\n\
  \  "]

module ListDatasets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the datasets that you have configured in this Region. For more information about datasets, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel \
   overview} in the {i Amazon Comprehend Developer Guide}.\n"]

module ListDocumentClassificationJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_document_classification_jobs_request ->
    ( list_document_classification_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_document_classification_jobs_request ->
    ( list_document_classification_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the documentation classification jobs that you have submitted.\n"]

module ListDocumentClassifiers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_document_classifiers_request ->
    ( list_document_classifiers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_document_classifiers_request ->
    ( list_document_classifiers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the document classifiers that you have created.\n"]

module ListDocumentClassifierSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_document_classifier_summaries_request ->
    ( list_document_classifier_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_document_classifier_summaries_request ->
    ( list_document_classifier_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of summaries of the document classifiers that you have created\n"]

module ListDominantLanguageDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dominant_language_detection_jobs_request ->
    ( list_dominant_language_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dominant_language_detection_jobs_request ->
    ( list_dominant_language_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the dominant language detection jobs that you have submitted.\n"]

module ListEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_request ->
    ( list_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoints_request ->
    ( list_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of all existing endpoints that you've created. For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

module ListEntitiesDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entities_detection_jobs_request ->
    ( list_entities_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entities_detection_jobs_request ->
    ( list_entities_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the entity detection jobs that you have submitted.\n"]

module ListEntityRecognizers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entity_recognizers_request ->
    ( list_entity_recognizers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entity_recognizers_request ->
    ( list_entity_recognizers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the properties of all entity recognizers that you created, including recognizers \
   currently in training. Allows you to filter the list of recognizers based on criteria such as \
   status and submission time. This call returns up to 500 entity recognizers in the list, with a \
   default number of 100 recognizers in the list.\n\n\
  \ The results of this list are not in any particular order. Please get the list and sort locally \
   if needed.\n\
  \ "]

module ListEntityRecognizerSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entity_recognizer_summaries_request ->
    ( list_entity_recognizer_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entity_recognizer_summaries_request ->
    ( list_entity_recognizer_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of summaries for the entity recognizers that you have created.\n"]

module ListEventsDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_events_detection_jobs_request ->
    ( list_events_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_events_detection_jobs_request ->
    ( list_events_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the events detection jobs that you have submitted.\n"]

module ListFlywheelIterationHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flywheel_iteration_history_request ->
    ( list_flywheel_iteration_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flywheel_iteration_history_request ->
    ( list_flywheel_iteration_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Information about the history of a flywheel iteration. For more information about flywheels, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel \
   overview} in the {i Amazon Comprehend Developer Guide}.\n"]

module ListFlywheels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_flywheels_request ->
    ( list_flywheels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_flywheels_request ->
    ( list_flywheels_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the flywheels that you have created.\n"]

module ListKeyPhrasesDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_key_phrases_detection_jobs_request ->
    ( list_key_phrases_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_key_phrases_detection_jobs_request ->
    ( list_key_phrases_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get a list of key phrase detection jobs that you have submitted.\n"]

module ListPiiEntitiesDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pii_entities_detection_jobs_request ->
    ( list_pii_entities_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pii_entities_detection_jobs_request ->
    ( list_pii_entities_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the PII entity detection jobs that you have submitted.\n"]

module ListSentimentDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sentiment_detection_jobs_request ->
    ( list_sentiment_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sentiment_detection_jobs_request ->
    ( list_sentiment_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of sentiment detection jobs that you have submitted.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags associated with a given Amazon Comprehend resource. \n"]

module ListTargetedSentimentDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_targeted_sentiment_detection_jobs_request ->
    ( list_targeted_sentiment_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_targeted_sentiment_detection_jobs_request ->
    ( list_targeted_sentiment_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of targeted sentiment detection jobs that you have submitted.\n"]

module ListTopicsDetectionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_topics_detection_jobs_request ->
    ( list_topics_detection_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_topics_detection_jobs_request ->
    ( list_topics_detection_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the topic detection jobs that you have submitted.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a resource-based policy to a custom model. You can use this policy to authorize an \
   entity in another Amazon Web Services account to import the custom model, which replicates it \
   in Amazon Comprehend in their account.\n"]

module StartDocumentClassificationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_document_classification_job_request ->
    ( start_document_classification_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_document_classification_job_request ->
    ( start_document_classification_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous document classification job using a custom classification model. Use the \
   [DescribeDocumentClassificationJob] operation to track the progress of the job.\n"]

module StartDominantLanguageDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_dominant_language_detection_job_request ->
    ( start_dominant_language_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_dominant_language_detection_job_request ->
    ( start_dominant_language_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous dominant language detection job for a collection of documents. Use the \
   operation to track the status of a job.\n"]

module StartEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_entities_detection_job_request ->
    ( start_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_entities_detection_job_request ->
    ( start_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous entity detection job for a collection of documents. Use the operation to \
   track the status of a job.\n\n\
  \ This API can be used for either standard entity detection or custom entity recognition. In \
   order to be used for custom entity recognition, the optional [EntityRecognizerArn] must be used \
   in order to provide access to the recognizer being used to detect the custom entity.\n\
  \ "]

module StartEventsDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_events_detection_job_request ->
    ( start_events_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_events_detection_job_request ->
    ( start_events_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts an asynchronous event detection job for a collection of documents.\n"]

module StartFlywheelIteration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_flywheel_iteration_request ->
    ( start_flywheel_iteration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_flywheel_iteration_request ->
    ( start_flywheel_iteration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Start the flywheel iteration.This operation uses any new datasets to train a new model version. \
   For more information about flywheels, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/flywheels-about.html} Flywheel overview} in \
   the {i Amazon Comprehend Developer Guide}.\n"]

module StartKeyPhrasesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_key_phrases_detection_job_request ->
    ( start_key_phrases_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_key_phrases_detection_job_request ->
    ( start_key_phrases_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous key phrase detection job for a collection of documents. Use the \
   operation to track the status of a job.\n"]

module StartPiiEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_pii_entities_detection_job_request ->
    ( start_pii_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_pii_entities_detection_job_request ->
    ( start_pii_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts an asynchronous PII entity detection job for a collection of documents.\n"]

module StartSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_sentiment_detection_job_request ->
    ( start_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_sentiment_detection_job_request ->
    ( start_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous sentiment detection job for a collection of documents. Use the operation \
   to track the status of a job.\n"]

module StartTargetedSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_targeted_sentiment_detection_job_request ->
    ( start_targeted_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_targeted_sentiment_detection_job_request ->
    ( start_targeted_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous targeted sentiment detection job for a collection of documents. Use the \
   [DescribeTargetedSentimentDetectionJob] operation to track the status of a job.\n"]

module StartTopicsDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_topics_detection_job_request ->
    ( start_topics_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_topics_detection_job_request ->
    ( start_topics_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous topic detection job. Use the [DescribeTopicDetectionJob] operation to \
   track the status of a job.\n"]

module StopDominantLanguageDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_dominant_language_detection_job_request ->
    ( stop_dominant_language_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_dominant_language_detection_job_request ->
    ( stop_dominant_language_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a dominant language detection job in progress.\n\n\
  \ If the job state is [IN_PROGRESS] the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state; otherwise the job is stopped and put into the [STOPPED] state.\n\
  \ \n\
  \  If the job is in the [COMPLETED] or [FAILED] state when you call the \
   [StopDominantLanguageDetectionJob] operation, the operation returns a 400 Internal Request \
   Exception. \n\
  \  \n\
  \   When a job is stopped, any documents already processed are written to the output location.\n\
  \   "]

module StopEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_entities_detection_job_request ->
    ( stop_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_entities_detection_job_request ->
    ( stop_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an entities detection job in progress.\n\n\
  \ If the job state is [IN_PROGRESS] the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state; otherwise the job is stopped and put into the [STOPPED] state.\n\
  \ \n\
  \  If the job is in the [COMPLETED] or [FAILED] state when you call the \
   [StopDominantLanguageDetectionJob] operation, the operation returns a 400 Internal Request \
   Exception. \n\
  \  \n\
  \   When a job is stopped, any documents already processed are written to the output location.\n\
  \   "]

module StopEventsDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_events_detection_job_request ->
    ( stop_events_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_events_detection_job_request ->
    ( stop_events_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops an events detection job in progress.\n"]

module StopKeyPhrasesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_key_phrases_detection_job_request ->
    ( stop_key_phrases_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_key_phrases_detection_job_request ->
    ( stop_key_phrases_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a key phrases detection job in progress.\n\n\
  \ If the job state is [IN_PROGRESS] the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state; otherwise the job is stopped and put into the [STOPPED] state.\n\
  \ \n\
  \  If the job is in the [COMPLETED] or [FAILED] state when you call the \
   [StopDominantLanguageDetectionJob] operation, the operation returns a 400 Internal Request \
   Exception. \n\
  \  \n\
  \   When a job is stopped, any documents already processed are written to the output location.\n\
  \   "]

module StopPiiEntitiesDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_pii_entities_detection_job_request ->
    ( stop_pii_entities_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_pii_entities_detection_job_request ->
    ( stop_pii_entities_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a PII entities detection job in progress.\n"]

module StopSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_sentiment_detection_job_request ->
    ( stop_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_sentiment_detection_job_request ->
    ( stop_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a sentiment detection job in progress.\n\n\
  \ If the job state is [IN_PROGRESS], the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state; otherwise the job is be stopped and put into the [STOPPED] state.\n\
  \ \n\
  \  If the job is in the [COMPLETED] or [FAILED] state when you call the \
   [StopDominantLanguageDetectionJob] operation, the operation returns a 400 Internal Request \
   Exception. \n\
  \  \n\
  \   When a job is stopped, any documents already processed are written to the output location.\n\
  \   "]

module StopTargetedSentimentDetectionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `JobNotFoundException of job_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_targeted_sentiment_detection_job_request ->
    ( stop_targeted_sentiment_detection_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_targeted_sentiment_detection_job_request ->
    ( stop_targeted_sentiment_detection_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `JobNotFoundException of job_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a targeted sentiment detection job in progress.\n\n\
  \ If the job state is [IN_PROGRESS], the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state; otherwise the job is be stopped and put into the [STOPPED] state.\n\
  \ \n\
  \  If the job is in the [COMPLETED] or [FAILED] state when you call the \
   [StopDominantLanguageDetectionJob] operation, the operation returns a 400 Internal Request \
   Exception. \n\
  \  \n\
  \   When a job is stopped, any documents already processed are written to the output location.\n\
  \   "]

module StopTrainingDocumentClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_training_document_classifier_request ->
    ( stop_training_document_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_training_document_classifier_request ->
    ( stop_training_document_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a document classifier training job while in progress.\n\n\
  \ If the training job state is [TRAINING], the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the training job completes before it can be stopped, it is put into \
   the [TRAINED]; otherwise the training job is stopped and put into the [STOPPED] state and the \
   service sends back an HTTP 200 response with an empty HTTP body. \n\
  \ "]

module StopTrainingEntityRecognizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_training_entity_recognizer_request ->
    ( stop_training_entity_recognizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_training_entity_recognizer_request ->
    ( stop_training_entity_recognizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an entity recognizer training job while in progress.\n\n\
  \ If the training job state is [TRAINING], the job is marked for termination and put into the \
   [STOP_REQUESTED] state. If the training job completes before it can be stopped, it is put into \
   the [TRAINED]; otherwise the training job is stopped and putted into the [STOPPED] state and \
   the service sends back an HTTP 200 response with an empty HTTP body.\n\
  \ "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that \
   adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" \
   as the key might be added to a resource to indicate its use by the sales department. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagKeysException of too_many_tag_keys_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a specific tag associated with an Amazon Comprehend resource. \n"]

module UpdateEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_request ->
    ( update_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_request ->
    ( update_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates information about the specified endpoint. For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

module UpdateFlywheel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `KmsKeyValidationException of kms_key_validation_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_flywheel_request ->
    ( update_flywheel_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_flywheel_request ->
    ( update_flywheel_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `KmsKeyValidationException of kms_key_validation_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the configuration information for an existing flywheel.\n"]

module ClassifyDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    classify_document_request ->
    ( classify_document_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    classify_document_request ->
    ( classify_document_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a classification request to analyze a single document in real-time. [ClassifyDocument] \
   supports the following model types:\n\n\
  \ {ul\n\
  \       {-  Custom classifier - a custom model that you have created and trained. For input, you \
   can provide plain text, a single-page document (PDF, Word, or image), or Amazon Textract API \
   output. For more information, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-document-classification.html}Custom \
   classification} in the {i Amazon Comprehend Developer Guide}.\n\
  \           \n\
  \            }\n\
  \       {-  Prompt safety classifier - Amazon Comprehend provides a pre-trained model for \
   classifying input prompts for generative AI applications. For input, you provide English plain \
   text input. For prompt safety classification, the response includes only the [Classes] field. \
   For more information about prompt safety classifiers, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/trust-safety.html#prompt-classification}Prompt \
   safety classification} in the {i Amazon Comprehend Developer Guide}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   If the system detects errors while processing a page in the input document, the API response \
   includes an [Errors] field that describes the errors.\n\
  \   \n\
  \    If the system detects a document-level error in your input document, the API returns an \
   [InvalidRequestException] error response. For details about this exception, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html} Errors in \
   semi-structured documents} in the Comprehend Developer Guide. \n\
  \    "]

module BatchDetectTargetedSentiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_targeted_sentiment_request ->
    ( batch_detect_targeted_sentiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_targeted_sentiment_request ->
    ( batch_detect_targeted_sentiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects a batch of documents and returns a sentiment analysis for each entity identified in \
   the documents.\n\n\
  \ For more information about targeted sentiment, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html}Targeted \
   sentiment} in the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

module BatchDetectSyntax : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_syntax_request ->
    ( batch_detect_syntax_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_syntax_request ->
    ( batch_detect_syntax_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the text of a batch of documents for the syntax and part of speech of the words in the \
   document and returns information about them. For more information, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html}Syntax} in the Comprehend \
   Developer Guide. \n"]

module BatchDetectSentiment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_sentiment_request ->
    ( batch_detect_sentiment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_sentiment_request ->
    ( batch_detect_sentiment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects a batch of documents and returns an inference of the prevailing sentiment, [POSITIVE], \
   [NEUTRAL], [MIXED], or [NEGATIVE], in each one.\n"]

module BatchDetectKeyPhrases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_key_phrases_request ->
    ( batch_detect_key_phrases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_key_phrases_request ->
    ( batch_detect_key_phrases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Detects the key noun phrases found in a batch of documents.\n"]

module BatchDetectEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `UnsupportedLanguageException of unsupported_language_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_entities_request ->
    ( batch_detect_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_entities_request ->
    ( batch_detect_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `UnsupportedLanguageException of unsupported_language_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Inspects the text of a batch of documents for named entities and returns information about \
   them. For more information about named entities, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html}Entities} in the \
   Comprehend Developer Guide. \n"]

module BatchDetectDominantLanguage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_dominant_language_request ->
    ( batch_detect_dominant_language_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_detect_dominant_language_request ->
    ( batch_detect_dominant_language_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchSizeLimitExceededException of batch_size_limit_exceeded_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Determines the dominant language of the input text for a batch of documents. For a list of \
   languages that Amazon Comprehend can detect, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html}Amazon Comprehend \
   Supported Languages}. \n"]
