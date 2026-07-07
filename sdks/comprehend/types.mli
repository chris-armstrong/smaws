type nonrec integer = int [@@ocaml.doc ""]

type nonrec page_based_warning_code =
  | INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL [@ocaml.doc ""]
  | INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec warnings_list_item = {
  warn_message : string_ option; [@ocaml.doc "Text message associated with the warning.\n"]
  warn_code : page_based_warning_code option; [@ocaml.doc "The type of warning.\n"]
  page : integer option; [@ocaml.doc "Page number in the input document.\n"]
}
[@@ocaml.doc
  "The system identified one of the following warnings while processing the input document:\n\n\
  \ {ul\n\
  \       {-  The document to classify is plain text, but the classifier is a native document model.\n\
  \           \n\
  \            }\n\
  \       {-  The document to classify is semi-structured, but the classifier is a plain-text model.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnets = subnet_id list [@@ocaml.doc ""]

type nonrec vpc_config = {
  subnets : subnets;
      [@ocaml.doc
        "The ID for each subnet being used in your private VPC. This subnet is a subset of the a \
         range of IPv4 addresses used by the VPC and is specific to a given availability zone in \
         the VPC\226\128\153s Region. This ID number is preceded by \"subnet-\", for instance: \
         \"subnet-04ccf456919e69055\". For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html}VPCs and Subnets}. \n"]
  security_group_ids : security_group_ids;
      [@ocaml.doc
        "The ID number for a security group on an instance of your private VPC. Security groups on \
         your VPC function serve as a virtual firewall to control inbound and outbound traffic and \
         provides security for the resources that you\226\128\153ll be accessing on the VPC. This \
         ID number is preceded by \"sg-\", for instance: \"sg-03b388029b0a285ea\". For more \
         information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html}Security \
         Groups for your VPC}. \n"]
}
[@@ocaml.doc
  " Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the \
   resources you are using for the job. For more information, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]

type nonrec version_name = string [@@ocaml.doc ""]

type nonrec comprehend_flywheel_arn = string [@@ocaml.doc ""]

type nonrec comprehend_model_arn = string [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec language_code =
  | ZH_TW [@ocaml.doc ""]
  | ZH [@ocaml.doc ""]
  | KO [@ocaml.doc ""]
  | JA [@ocaml.doc ""]
  | HI [@ocaml.doc ""]
  | AR [@ocaml.doc ""]
  | PT [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | DE [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | EN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_classifier_mode = MULTI_LABEL [@ocaml.doc ""] | MULTI_CLASS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec label_list_item = string [@@ocaml.doc ""]

type nonrec labels_list = label_list_item list [@@ocaml.doc ""]

type nonrec document_classification_config = {
  labels : labels_list option;
      [@ocaml.doc "One or more labels to associate with the custom classifier.\n"]
  mode : document_classifier_mode;
      [@ocaml.doc
        "Classification mode indicates whether the documents are [MULTI_CLASS] or [MULTI_LABEL].\n"]
}
[@@ocaml.doc "Configuration required for a document classification model.\n"]

type nonrec entity_type_name = string [@@ocaml.doc ""]

type nonrec entity_types_list_item = {
  type_ : entity_type_name;
      [@ocaml.doc
        "An entity type within a labeled training dataset that Amazon Comprehend uses to train a \
         custom entity recognizer.\n\n\
        \ Entity types must not contain the following invalid characters: \\n (line break), \\\\n \
         (escaped line break, \\r (carriage return), \\\\r (escaped carriage return), \\t (tab), \
         \\\\t (escaped tab), and , (comma).\n\
        \ "]
}
[@@ocaml.doc
  "An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom \
   entity recognizer.\n"]

type nonrec entity_types_list = entity_types_list_item list [@@ocaml.doc ""]

type nonrec entity_recognition_config = {
  entity_types : entity_types_list;
      [@ocaml.doc "Up to 25 entity types that the model is trained to recognize.\n"]
}
[@@ocaml.doc "Configuration required for an entity recognition model.\n"]

type nonrec task_config = {
  entity_recognition_config : entity_recognition_config option;
      [@ocaml.doc "Configuration required for an entity recognition model.\n"]
  document_classification_config : document_classification_config option;
      [@ocaml.doc "Configuration required for a document classification model.\n"]
  language_code : language_code;
      [@ocaml.doc "Language code for the language that the model supports.\n"]
}
[@@ocaml.doc "Configuration about the model associated with a flywheel.\n"]

type nonrec s3_uri = string [@@ocaml.doc ""]

type nonrec kms_key_id = string [@@ocaml.doc ""]

type nonrec data_security_config = {
  vpc_config : vpc_config option; [@ocaml.doc ""]
  data_lake_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt the data in the data lake.\n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc "ID for the KMS key that Amazon Comprehend uses to encrypt the volume.\n"]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Data security configuration.\n"]

type nonrec flywheel_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_type = ENTITY_RECOGNIZER [@ocaml.doc ""] | DOCUMENT_CLASSIFIER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec any_length_string = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec flywheel_iteration_id = string [@@ocaml.doc ""]

type nonrec flywheel_properties = {
  latest_flywheel_iteration : flywheel_iteration_id option;
      [@ocaml.doc "The most recent flywheel iteration.\n"]
  last_modified_time : timestamp option; [@ocaml.doc "Last modified time for the flywheel.\n"]
  creation_time : timestamp option; [@ocaml.doc "Creation time of the flywheel.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of the flywheel.\n"]
  model_type : model_type option; [@ocaml.doc "Model type of the flywheel's model.\n"]
  status : flywheel_status option; [@ocaml.doc "The status of the flywheel.\n"]
  data_security_config : data_security_config option; [@ocaml.doc "Data security configuration.\n"]
  data_lake_s3_uri : s3_uri option; [@ocaml.doc "Amazon S3 URI of the data lake location. \n"]
  task_config : task_config option;
      [@ocaml.doc "Configuration about the model associated with a flywheel.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission \
         to access the flywheel data.\n"]
  active_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the active model version.\n"]
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel.\n"]
}
[@@ocaml.doc "The flywheel properties.\n"]

type nonrec update_flywheel_response = {
  flywheel_properties : flywheel_properties option; [@ocaml.doc "The flywheel properties.\n"]
}
[@@ocaml.doc ""]

type nonrec update_data_security_config = {
  vpc_config : vpc_config option; [@ocaml.doc ""]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc "ID for the KMS key that Amazon Comprehend uses to encrypt the volume.\n"]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Data security configuration.\n"]

type nonrec update_flywheel_request = {
  data_security_config : update_data_security_config option;
      [@ocaml.doc "Flywheel data security configuration.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission \
         to access the flywheel data.\n"]
  active_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the active model version.\n"]
  flywheel_arn : comprehend_flywheel_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel to update.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_requests_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The number of requests exceeds the limit. Resubmit your request later.\n"]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified resource ARN was not found. Check the ARN and try your request again.\n"]

type nonrec kms_key_validation_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The KMS customer managed key (CMK) entered cannot be validated. Verify the key and re-enter it.\n"]

type nonrec invalid_request_reason = INVALID_DOCUMENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec invalid_request_detail_reason =
  | TEXTRACT_ACCESS_DENIED [@ocaml.doc ""]
  | PAGE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | UNSUPPORTED_DOC_TYPE [@ocaml.doc ""]
  | DOCUMENT_SIZE_EXCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_request_detail = {
  reason : invalid_request_detail_reason option;
      [@ocaml.doc
        "Reason codes include the following values:\n\n\
        \ {ul\n\
        \       {-  DOCUMENT_SIZE_EXCEEDED - Document size is too large. Check the size of your \
         file and resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  UNSUPPORTED_DOC_TYPE - Document type is not supported. Check the file type and \
         resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  PAGE_LIMIT_EXCEEDED - Too many pages in the document. Check the number of \
         pages in your file and resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  TEXTRACT_ACCESS_DENIED - Access denied to Amazon Textract. Verify that your \
         account has permission to use Amazon Textract API operations and resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  NOT_TEXTRACT_JSON - Document is not Amazon Textract JSON format. Verify the \
         format and resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  MISMATCHED_TOTAL_PAGE_COUNT - Check the number of pages in your file and \
         resubmit the request.\n\
        \           \n\
        \            }\n\
        \       {-  INVALID_DOCUMENT - Invalid document. Check the file and resubmit the request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Provides additional detail about why the request failed.\n"]

type nonrec invalid_request_exception = {
  detail : invalid_request_detail option; [@ocaml.doc ""]
  reason : invalid_request_reason option; [@ocaml.doc ""]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request is invalid.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "An internal server error occurred. Retry your request.\n"]

type nonrec update_endpoint_response = {
  desired_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the new model.\n"]
}
[@@ocaml.doc ""]

type nonrec comprehend_endpoint_arn = string [@@ocaml.doc ""]

type nonrec inference_units_integer = int [@@ocaml.doc ""]

type nonrec update_endpoint_request = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
  desired_data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "Data access role ARN to use in case the new model is encrypted with a customer CMK.\n"]
  desired_inference_units : inference_units_integer option;
      [@ocaml.doc
        " The desired number of inference units to be used by the model using this endpoint. Each \
         inference unit represents of a throughput of 100 characters per second.\n"]
  desired_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The ARN of the new model to use when updating an existing endpoint.\n"]
  endpoint_arn : comprehend_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the endpoint being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified resource is not available. Check the resource and try your request again.\n"]

type nonrec resource_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The maximum number of resources per account has been exceeded. Review the resources, and then \
   try your request again.\n"]

type nonrec resource_in_use_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified resource name is already in use. Use a different name and try your request again.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec comprehend_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The initial part of a key-value pair that forms a tag being removed from a given \
         resource. For example, a tag with \"Sales\" as the key might be added to a resource to \
         indicate its use by the sales department. Keys must be unique and cannot be duplicated \
         for a particular resource. \n"]
  resource_arn : comprehend_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you \
         want to remove the tags. \n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tag_keys_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request contains more tag keys than can be associated with a resource (50 tag keys per \
   resource).\n"]

type nonrec concurrent_modification_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Concurrent modification of the tags associated with an Amazon Comprehend resource is not \
   supported. \n"]

type nonrec unsupported_language_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "Amazon Comprehend can't process the language of the input text. For a list of supported \
   languages, \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/supported-languages.html}Supported \
   languages} in the Comprehend Developer Guide. \n"]

type nonrec toxic_content_type =
  | VIOLENCE_OR_THREAT [@ocaml.doc ""]
  | SEXUAL [@ocaml.doc ""]
  | PROFANITY [@ocaml.doc ""]
  | INSULT [@ocaml.doc ""]
  | HATE_SPEECH [@ocaml.doc ""]
  | HARASSMENT_OR_ABUSE [@ocaml.doc ""]
  | GRAPHIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec toxic_content = {
  score : float_ option;
      [@ocaml.doc
        " Model confidence in the detected content type. Value range is zero to one, where one is \
         highest confidence.\n"]
  name : toxic_content_type option; [@ocaml.doc "The name of the toxic content type.\n"]
}
[@@ocaml.doc
  "Toxic content analysis result for one string. For more information about toxicity detection, \
   see {{:https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html}Toxicity \
   detection} in the {i Amazon Comprehend Developer Guide} \n"]

type nonrec list_of_toxic_content = toxic_content list [@@ocaml.doc ""]

type nonrec toxic_labels = {
  toxicity : float_ option;
      [@ocaml.doc
        "Overall toxicity score for the string. Value range is zero to one, where one is the \
         highest confidence.\n"]
  labels : list_of_toxic_content option;
      [@ocaml.doc "Array of toxic content types identified in the string.\n"]
}
[@@ocaml.doc
  "Toxicity analysis result for one string. For more information about toxicity detection, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/toxicity-detection.html}Toxicity detection} \
   in the {i Amazon Comprehend Developer Guide}.\n"]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec job_status =
  | STOPPED [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec input_format = ONE_DOC_PER_LINE [@ocaml.doc ""] | ONE_DOC_PER_FILE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_read_action =
  | TEXTRACT_ANALYZE_DOCUMENT [@ocaml.doc ""]
  | TEXTRACT_DETECT_DOCUMENT_TEXT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_read_mode =
  | FORCE_DOCUMENT_READ_ACTION [@ocaml.doc ""]
  | SERVICE_DEFAULT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_read_feature_types = FORMS [@ocaml.doc ""] | TABLES [@ocaml.doc ""]
[@@ocaml.doc "TABLES or FORMS\n"]

type nonrec list_of_document_read_feature_types = document_read_feature_types list [@@ocaml.doc ""]

type nonrec document_reader_config = {
  feature_types : list_of_document_read_feature_types option;
      [@ocaml.doc
        "Specifies the type of Amazon Textract features to apply. If you chose \
         [TEXTRACT_ANALYZE_DOCUMENT] as the read action, you must specify one or both of the \
         following values:\n\n\
        \ {ul\n\
        \       {-   [TABLES] - Returns additional information about any tables that are detected \
         in the input document. \n\
        \           \n\
        \            }\n\
        \       {-   [FORMS] - Returns additional information about any forms that are detected in \
         the input document. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  document_read_mode : document_read_mode option;
      [@ocaml.doc
        "Determines the text extraction actions for PDF files. Enter one of the following values:\n\n\
        \ {ul\n\
        \       {-   [SERVICE_DEFAULT] - use the Amazon Comprehend service defaults for PDF files.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_DOCUMENT_READ_ACTION] - Amazon Comprehend uses the Textract API \
         specified by DocumentReadAction for all PDF files, including digital PDF files. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  document_read_action : document_read_action;
      [@ocaml.doc
        "This field defines the Amazon Textract API operation that Amazon Comprehend uses to \
         extract text from PDF files and image files. Enter one of the following values:\n\n\
        \ {ul\n\
        \       {-   [TEXTRACT_DETECT_DOCUMENT_TEXT] - The Amazon Comprehend service uses the \
         [DetectDocumentText] API operation. \n\
        \           \n\
        \            }\n\
        \       {-   [TEXTRACT_ANALYZE_DOCUMENT] - The Amazon Comprehend service uses the \
         [AnalyzeDocument] API operation. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Provides configuration parameters to override the default actions for extracting text from PDF \
   documents and image files. \n\n\
  \  By default, Amazon Comprehend performs the following actions to extract text from files, \
   based on the input file type: \n\
  \ \n\
  \  {ul\n\
  \        {-   {b Word files} - Amazon Comprehend parser extracts the text. \n\
  \            \n\
  \             }\n\
  \        {-   {b Digital PDF files} - Amazon Comprehend parser extracts the text. \n\
  \            \n\
  \             }\n\
  \        {-   {b Image files and scanned PDF files} - Amazon Comprehend uses the Amazon Textract \
   [DetectDocumentText] API to extract the text. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \    [DocumentReaderConfig] does not apply to plain text files or Word files.\n\
  \   \n\
  \     For image files and PDF documents, you can override these default actions using the fields \
   listed below. For more information, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/idp-set-textract-options.html} Setting text \
   extraction options} in the Comprehend Developer Guide. \n\
  \    "]

type nonrec input_data_config = {
  document_reader_config : document_reader_config option;
      [@ocaml.doc
        "Provides configuration parameters to override the default actions for extracting text \
         from PDF documents and image files.\n"]
  input_format : input_format option;
      [@ocaml.doc
        "Specifies how the text in an input file should be processed:\n\n\
        \ {ul\n\
        \       {-   [ONE_DOC_PER_FILE] - Each file is considered a separate document. Use this \
         option when you are processing large documents, such as newspaper articles or scientific \
         papers.\n\
        \           \n\
        \            }\n\
        \       {-   [ONE_DOC_PER_LINE] - Each line in a file is considered a separate document. \
         Use this option when you are processing many short documents, such as text messages.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  s3_uri : s3_uri;
      [@ocaml.doc
        "The Amazon S3 URI for the input data. The URI must be in same Region as the API endpoint \
         that you are calling. The URI can point to a single input file or it can provide the \
         prefix for a collection of data files. \n\n\
        \ For example, if you use the URI [S3://bucketName/prefix], if the prefix is a single \
         file, Amazon Comprehend uses that file as input. If more than one file begins with the \
         prefix, Amazon Comprehend uses all of them as input.\n\
        \ "]
}
[@@ocaml.doc
  "The input properties for an inference job. The document reader config field applies only to \
   non-text inputs for custom analysis.\n"]

type nonrec output_data_config = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt the output results from an analysis job. Specify the Key Id of a \
         symmetric key, because you cannot use an asymmetric key for uploading data to S3.\n\n\
        \ The KmsKeyId can be one of the following formats:\n\
        \ \n\
        \  {ul\n\
        \        {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \            \n\
        \             }\n\
        \        {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \            \n\
        \             }\n\
        \        {-  KMS Key Alias: [\"alias/ExampleAlias\"] \n\
        \            \n\
        \             }\n\
        \        {-  ARN of a KMS Key Alias: \
         [\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\"] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  s3_uri : s3_uri;
      [@ocaml.doc
        "When you use the [OutputDataConfig] object with asynchronous operations, you specify the \
         Amazon S3 location where you want to write the output data. The URI must be in the same \
         Region as the API endpoint that you are calling. The location is used as the prefix for \
         the actual location of the output file.\n\n\
        \ When the topic detection job is finished, the service creates an output file in a \
         directory specific to the job. The [S3Uri] field contains the location of the output \
         file, called [output.tar.gz]. It is a compressed archive that contains the ouput of the \
         operation.\n\
        \ \n\
        \   For a PII entity detection job, the output file is plain text, not a compressed \
         archive. The output file name is the same as the input file, with [.out] appended at the \
         end. \n\
        \  "]
}
[@@ocaml.doc "Provides configuration parameters for the output of inference jobs.\n\n \n "]

type nonrec topics_detection_job_properties = {
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your topic detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your job data. \n"]
  number_of_topics : integer option;
      [@ocaml.doc
        "The number of topics to detect supplied when you created the topic detection job. The \
         default is 10. \n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration supplied when you created the topic detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration supplied when you created the topic detection job.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the topic detection job was completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the topic detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description for the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the topic detection job. If the status is [Failed], the reason for \
         the failure is shown in the [Message] field.\n"]
  job_name : job_name option; [@ocaml.doc "The name of the topic detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::topics-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:topics-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the topic detection job.\n"]
}
[@@ocaml.doc "Provides information about a topic detection job.\n"]

type nonrec topics_detection_job_properties_list = topics_detection_job_properties list
[@@ocaml.doc ""]

type nonrec topics_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Only returns jobs submitted after the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Only returns jobs submitted before the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of topic detection jobs based on job status. Returns only jobs with the \
         specified status.\n"]
  job_name : job_name option; [@ocaml.doc "\n"]
}
[@@ocaml.doc
  "Provides information for filtering topic detection jobs. For more information, see .\n"]

type nonrec too_many_tags_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request contains more tags than can be associated with a resource (50 tags per resource). \
   The maximum number of tags includes both existing tags and those included in your current \
   request. \n"]

type nonrec text_size_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The size of the input text exceeds the limit. Use a smaller document.\n"]

type nonrec customer_input_string = string [@@ocaml.doc ""]

type nonrec text_segment = { text : customer_input_string [@ocaml.doc "The text content.\n"] }
[@@ocaml.doc "One of the of text strings. Each string has a size limit of 1KB.\n"]

type nonrec targeted_sentiment_entity_type =
  | OTHER [@ocaml.doc ""]
  | ATTRIBUTE [@ocaml.doc ""]
  | QUANTITY [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | EVENT [@ocaml.doc ""]
  | PERSONAL_TITLE [@ocaml.doc ""]
  | GAME [@ocaml.doc ""]
  | SOFTWARE [@ocaml.doc ""]
  | BOOK [@ocaml.doc ""]
  | MUSIC [@ocaml.doc ""]
  | MOVIE [@ocaml.doc ""]
  | COMMERCIAL_ITEM [@ocaml.doc ""]
  | BRAND [@ocaml.doc ""]
  | FACILITY [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
  | LOCATION [@ocaml.doc ""]
  | PERSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sentiment_type =
  | MIXED [@ocaml.doc ""]
  | NEUTRAL [@ocaml.doc ""]
  | NEGATIVE [@ocaml.doc ""]
  | POSITIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sentiment_score = {
  mixed : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of its detection of \
         the [MIXED] sentiment.\n"]
  neutral : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of its detection of \
         the [NEUTRAL] sentiment.\n"]
  negative : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of its detection of \
         the [NEGATIVE] sentiment.\n"]
  positive : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of its detection of \
         the [POSITIVE] sentiment.\n"]
}
[@@ocaml.doc
  "Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection \
   of sentiments.\n"]

type nonrec mention_sentiment = {
  sentiment_score : sentiment_score option; [@ocaml.doc ""]
  sentiment : sentiment_type option; [@ocaml.doc "The sentiment of the mention. \n"]
}
[@@ocaml.doc
  "Contains the sentiment and sentiment score for one mention of an entity.\n\n\
  \ For more information about targeted sentiment, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html}Targeted \
   sentiment} in the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

type nonrec targeted_sentiment_mention = {
  end_offset : integer option;
      [@ocaml.doc "The offset into the document text where the mention ends.\n"]
  begin_offset : integer option;
      [@ocaml.doc "The offset into the document text where the mention begins.\n"]
  mention_sentiment : mention_sentiment option;
      [@ocaml.doc "Contains the sentiment and sentiment score for the mention.\n"]
  type_ : targeted_sentiment_entity_type option;
      [@ocaml.doc
        "The type of the entity. Amazon Comprehend supports a variety of \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-entities}entity \
         types}.\n"]
  text : string_ option; [@ocaml.doc "The text in the document that identifies the entity.\n"]
  group_score : float_ option;
      [@ocaml.doc
        "The confidence that all the entities mentioned in the group relate to the same entity.\n"]
  score : float_ option;
      [@ocaml.doc
        "Model confidence that the entity is relevant. Value range is zero to one, where one is \
         highest confidence.\n"]
}
[@@ocaml.doc
  "Information about one mention of an entity. The mention information includes the location of \
   the mention in the text and the sentiment of the mention.\n\n\
  \ For more information about targeted sentiment, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html}Targeted \
   sentiment} in the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

type nonrec list_of_descriptive_mention_indices = integer list [@@ocaml.doc ""]

type nonrec list_of_mentions = targeted_sentiment_mention list [@@ocaml.doc ""]

type nonrec targeted_sentiment_entity = {
  mentions : list_of_mentions option;
      [@ocaml.doc
        "An array of mentions of the entity in the document. The array represents a co-reference \
         group. See \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-values} \
         Co-reference group} for an example. \n"]
  descriptive_mention_index : list_of_descriptive_mention_indices option;
      [@ocaml.doc
        "One or more index into the Mentions array that provides the best name for the entity group.\n"]
}
[@@ocaml.doc
  "Information about one of the entities found by targeted sentiment analysis.\n\n\
  \ For more information about targeted sentiment, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html}Targeted \
   sentiment} in the {i Amazon Comprehend Developer Guide}.\n\
  \ "]

type nonrec targeted_sentiment_detection_job_properties = {
  vpc_config : vpc_config option; [@ocaml.doc ""]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt the data on the storage volume \
         attached to the ML compute instance(s) that process the targeted sentiment detection job. \
         The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option; [@ocaml.doc ""]
  input_data_config : input_data_config option; [@ocaml.doc ""]
  end_time : timestamp option;
      [@ocaml.doc "The time that the targeted sentiment detection job ended.\n"]
  submit_time : timestamp option;
      [@ocaml.doc
        "The time that the targeted sentiment detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the targeted sentiment detection job. If the status is [FAILED], \
         the [Messages] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned to the targeted sentiment detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, \
         fully qualified identifier for the job. It includes the Amazon Web Services account, \
         Amazon Web Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::targeted-sentiment-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc "The identifier assigned to the targeted sentiment detection job.\n"]
}
[@@ocaml.doc "Provides information about a targeted sentiment detection job.\n"]

type nonrec targeted_sentiment_detection_job_properties_list =
  targeted_sentiment_detection_job_properties list
[@@ocaml.doc ""]

type nonrec targeted_sentiment_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of dominant language detection jobs. For more \
   information, see the [ListTargetedSentimentDetectionJobs] operation.\n"]

type nonrec event_type_string = string [@@ocaml.doc ""]

type nonrec target_event_types = event_type_string list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        " The second part of a key-value pair that forms a tag associated with a given resource. \
         For instance, if you want to show which resources are used by which departments, you \
         might use \226\128\156Department\226\128\157 as the initial (key) portion of the pair, \
         with a value of \226\128\156sales\226\128\157 to indicate the sales department. \n"]
  key : tag_key;
      [@ocaml.doc
        "The initial part of a key-value pair that forms a tag associated with a given resource. \
         For instance, if you want to show which resources are used by which departments, you \
         might use \226\128\156Department\226\128\157 as the key portion of the pair, with \
         multiple possible values such as \226\128\156sales,\226\128\157 \
         \226\128\156legal,\226\128\157 and \226\128\156administration.\226\128\157 \n"]
}
[@@ocaml.doc
  "A key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, \
   a tag with the key-value pair \226\128\152Department\226\128\153:\226\128\153Sales\226\128\153 \
   might be added to a resource to indicate its use by a particular department. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "Tags being associated with a specific Amazon Comprehend resource. There can be a maximum \
         of 50 tags (both existing and pending) associated with a specific resource. \n"]
  resource_arn : comprehend_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want \
         to associate the tags. \n"]
}
[@@ocaml.doc ""]

type nonrec part_of_speech_tag_type =
  | VERB [@ocaml.doc ""]
  | SYM [@ocaml.doc ""]
  | SCONJ [@ocaml.doc ""]
  | PUNCT [@ocaml.doc ""]
  | PROPN [@ocaml.doc ""]
  | PRON [@ocaml.doc ""]
  | PART [@ocaml.doc ""]
  | O [@ocaml.doc ""]
  | NUM [@ocaml.doc ""]
  | NOUN [@ocaml.doc ""]
  | INTJ [@ocaml.doc ""]
  | DET [@ocaml.doc ""]
  | CCONJ [@ocaml.doc ""]
  | CONJ [@ocaml.doc ""]
  | AUX [@ocaml.doc ""]
  | ADV [@ocaml.doc ""]
  | ADP [@ocaml.doc ""]
  | ADJ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec part_of_speech_tag = {
  score : float_ option;
      [@ocaml.doc
        "The confidence that Amazon Comprehend has that the part of speech was correctly identified.\n"]
  tag : part_of_speech_tag_type option;
      [@ocaml.doc "Identifies the part of speech that the token represents.\n"]
}
[@@ocaml.doc
  "Identifies the part of speech represented by the token and gives the confidence that Amazon \
   Comprehend has that the part of speech was correctly identified. For more information about the \
   parts of speech that Amazon Comprehend can identify, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html}Syntax} in the Comprehend \
   Developer Guide. \n"]

type nonrec syntax_token = {
  part_of_speech : part_of_speech_tag option;
      [@ocaml.doc
        "Provides the part of speech label and the confidence level that Amazon Comprehend has \
         that the part of speech was correctly identified. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html}Syntax} in the \
         Comprehend Developer Guide. \n"]
  end_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the last character in the \
         word.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the first character in the \
         word.\n"]
  text : string_ option; [@ocaml.doc "The word that was recognized in the source text.\n"]
  token_id : integer option; [@ocaml.doc "A unique identifier for a token.\n"]
}
[@@ocaml.doc
  "Represents a work in the input text that was recognized and assigned a part of speech. There is \
   one syntax token record for each word in the source text.\n"]

type nonrec syntax_language_code =
  | PT [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | DE [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | EN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec stop_training_entity_recognizer_response = unit [@@ocaml.doc ""]

type nonrec entity_recognizer_arn = string [@@ocaml.doc ""]

type nonrec stop_training_entity_recognizer_request = {
  entity_recognizer_arn : entity_recognizer_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the entity recognizer currently being \
         trained.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_training_document_classifier_response = unit [@@ocaml.doc ""]

type nonrec document_classifier_arn = string [@@ocaml.doc ""]

type nonrec stop_training_document_classifier_request = {
  document_classifier_arn : document_classifier_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the document classifier currently being \
         trained.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_targeted_sentiment_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "Either [STOP_REQUESTED] if the job is currently running, or [STOPPED] if the job was \
         previously stopped with the [StopSentimentDetectionJob] operation.\n"]
  job_id : job_id option;
      [@ocaml.doc "The identifier of the targeted sentiment detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_targeted_sentiment_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the targeted sentiment detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec job_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The specified job was not found. Check the job ID and try again.\n"]

type nonrec stop_sentiment_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "Either [STOP_REQUESTED] if the job is currently running, or [STOPPED] if the job was \
         previously stopped with the [StopSentimentDetectionJob] operation.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier of the sentiment detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_sentiment_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the sentiment detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_pii_entities_detection_job_response = {
  job_status : job_status option; [@ocaml.doc "The status of the PII entities detection job.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier of the PII entities detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_pii_entities_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the PII entities detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_key_phrases_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "Either [STOP_REQUESTED] if the job is currently running, or [STOPPED] if the job was \
         previously stopped with the [StopKeyPhrasesDetectionJob] operation.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier of the key phrases detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_key_phrases_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the key phrases detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_events_detection_job_response = {
  job_status : job_status option; [@ocaml.doc "The status of the events detection job.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier of the events detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_events_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the events detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_entities_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "Either [STOP_REQUESTED] if the job is currently running, or [STOPPED] if the job was \
         previously stopped with the [StopEntitiesDetectionJob] operation.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier of the entities detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_entities_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the entities detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_dominant_language_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "Either [STOP_REQUESTED] if the job is currently running, or [STOPPED] if the job was \
         previously stopped with the [StopDominantLanguageDetectionJob] operation.\n"]
  job_id : job_id option;
      [@ocaml.doc "The identifier of the dominant language detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_dominant_language_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the dominant language detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec start_topics_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job: \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the \
         [DescribeTopicDetectionJob] operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::topics-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of the job, use this identifier \
         with the [DescribeTopicDetectionJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec number_of_topics_integer = int [@@ocaml.doc ""]

type nonrec client_request_token_string = string [@@ocaml.doc ""]

type nonrec start_topics_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the topics detection job. A tag is a key-value pair that adds \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your topic detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Comprehend generates one.\n"]
  number_of_topics : number_of_topics_integer option;
      [@ocaml.doc "The number of topics to detect.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc
        "Specifies where to send the output files. The output is a compressed archive with two \
         files, [topic-terms.csv] that lists the terms associated with each topic, and \
         [doc-topics.csv] that lists the documents associated with each topic\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_targeted_sentiment_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the \
         [DescribeTargetedSentimentDetectionJob] operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, \
         fully qualified identifier for the job. It includes the Amazon Web Services account, \
         Amazon Web Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::targeted-sentiment-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the [DescribeTargetedSentimentDetectionJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_targeted_sentiment_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the targeted sentiment detection job. A tag is a key-value pair \
         that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \
         \"Sales\" as the key might be added to a resource to indicate its use by the sales \
         department.\n"]
  vpc_config : vpc_config option; [@ocaml.doc ""]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume \
         attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId \
         can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. Currently, English is the only supported language.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files. \n"]
  input_data_config : input_data_config; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_sentiment_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::sentiment-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_sentiment_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the sentiment detection job. A tag is a key-value pair that adds \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your sentiment detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files. \n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_pii_entities_detection_job_response = {
  job_status : job_status option; [@ocaml.doc "The status of the job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the PII entity detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::pii-entities-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier generated for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec pii_entities_detection_mode =
  | ONLY_OFFSETS [@ocaml.doc ""]
  | ONLY_REDACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pii_entity_type =
  | IN_VOTER_NUMBER [@ocaml.doc ""]
  | IN_AADHAAR [@ocaml.doc ""]
  | CA_HEALTH_NUMBER [@ocaml.doc ""]
  | UK_NATIONAL_HEALTH_SERVICE_NUMBER [@ocaml.doc ""]
  | SWIFT_CODE [@ocaml.doc ""]
  | INTERNATIONAL_BANK_ACCOUNT_NUMBER [@ocaml.doc ""]
  | IN_NREGA [@ocaml.doc ""]
  | IN_PERMANENT_ACCOUNT_NUMBER [@ocaml.doc ""]
  | UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER [@ocaml.doc ""]
  | US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER [@ocaml.doc ""]
  | CA_SOCIAL_INSURANCE_NUMBER [@ocaml.doc ""]
  | UK_NATIONAL_INSURANCE_NUMBER [@ocaml.doc ""]
  | VEHICLE_IDENTIFICATION_NUMBER [@ocaml.doc ""]
  | LICENSE_PLATE [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | MAC_ADDRESS [@ocaml.doc ""]
  | IP_ADDRESS [@ocaml.doc ""]
  | AWS_SECRET_KEY [@ocaml.doc ""]
  | AWS_ACCESS_KEY [@ocaml.doc ""]
  | PASSWORD [@ocaml.doc ""]
  | USERNAME [@ocaml.doc ""]
  | AGE [@ocaml.doc ""]
  | URL [@ocaml.doc ""]
  | DRIVER_ID [@ocaml.doc ""]
  | PASSPORT_NUMBER [@ocaml.doc ""]
  | DATE_TIME [@ocaml.doc ""]
  | SSN [@ocaml.doc ""]
  | PHONE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | ADDRESS [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | PIN [@ocaml.doc ""]
  | CREDIT_DEBIT_EXPIRY [@ocaml.doc ""]
  | CREDIT_DEBIT_CVV [@ocaml.doc ""]
  | CREDIT_DEBIT_NUMBER [@ocaml.doc ""]
  | BANK_ROUTING [@ocaml.doc ""]
  | BANK_ACCOUNT_NUMBER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_of_pii_entity_types = pii_entity_type list [@@ocaml.doc ""]

type nonrec pii_entities_detection_mask_mode =
  | REPLACE_WITH_PII_ENTITY_TYPE [@ocaml.doc ""]
  | MASK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mask_character = string [@@ocaml.doc ""]

type nonrec redaction_config = {
  mask_character : mask_character option;
      [@ocaml.doc "A character that replaces each character in the redacted PII entity.\n"]
  mask_mode : pii_entities_detection_mask_mode option;
      [@ocaml.doc
        "Specifies whether the PII entity is redacted with the mask character or the entity type.\n"]
  pii_entity_types : list_of_pii_entity_types option;
      [@ocaml.doc
        "An array of the types of PII entities that Amazon Comprehend detects in the input text \
         for your request.\n"]
}
[@@ocaml.doc "Provides configuration parameters for PII entity redaction.\n"]

type nonrec start_pii_entities_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the PII entities detection job. A tag is a key-value pair that \
         adds metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" \
         as the key might be added to a resource to indicate its use by the sales department.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. Enter the language code for English (en) or Spanish \
         (es).\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  redaction_config : redaction_config option;
      [@ocaml.doc
        "Provides configuration parameters for PII entity redaction.\n\n\
        \ This parameter is required if you set the [Mode] parameter to [ONLY_REDACTION]. In that \
         case, you must provide a [RedactionConfig] definition that includes the [PiiEntityTypes] \
         parameter.\n\
        \ "]
  mode : pii_entities_detection_mode;
      [@ocaml.doc
        "Specifies whether the output provides the locations (offsets) of PII entities or a file \
         in which PII entities are redacted.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc
        "Provides con\239\172\129guration parameters for the output of PII entity detection jobs.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "The input properties for a PII entities detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_key_phrases_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the key phrase detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::key-phrases-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_key_phrases_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the key phrases detection job. A tag is a key-value pair that adds \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your key phrases detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_flywheel_iteration_response = {
  flywheel_iteration_id : flywheel_iteration_id option; [@ocaml.doc "\n"]
  flywheel_arn : comprehend_flywheel_arn option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec start_flywheel_iteration_request = {
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  flywheel_arn : comprehend_flywheel_arn; [@ocaml.doc "The ARN of the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec start_events_detection_job_response = {
  job_status : job_status option; [@ocaml.doc "The status of the events detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::events-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "An unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
}
[@@ocaml.doc ""]

type nonrec start_events_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the events detection job. A tag is a key-value pair that adds \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department.\n"]
  target_event_types : target_event_types;
      [@ocaml.doc "The types of events to detect in the input documents.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "An unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code; [@ocaml.doc "The language code of the input documents.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the events detection job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_entities_detection_job_response = {
  entity_recognizer_arn : entity_recognizer_arn option;
      [@ocaml.doc "The ARN of the custom entity recognition model.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the operation.\n\
        \           \n\
        \            }\n\
        \       {-  STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and \
         is processing the request.\n\
        \           \n\
        \            }\n\
        \       {-  STOPPED - The job was successfully stopped without completing.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::entities-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of job, use this identifier with \
         the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_entities_detection_job_request = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the flywheel associated with the model to use.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the entities detection job. A tag is a key-value pair that adds \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your entity detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. All documents must be in the same language. You can \
         specify any of the languages supported by Amazon Comprehend. If custom entities \
         recognition is used, this parameter is ignored and the language used for training the \
         model is used instead.\n"]
  entity_recognizer_arn : entity_recognizer_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used \
         by the [StartEntitiesDetectionJob]. This ARN is optional and is only used for a custom \
         entity recognition job.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_dominant_language_detection_job_response = {
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job. \n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and is queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. To get details, use the operation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, \
         fully qualified identifier for the job. It includes the Amazon Web Services account, \
         Amazon Web Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::dominant-language-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_dominant_language_detection_job_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the dominant language detection job. A tag is a key-value pair \
         that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \
         \"Sales\" as the key might be added to a resource to indicate its use by the sales \
         department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your dominant language detection job. For more \
         information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Comprehend generates one.\n"]
  job_name : job_name option; [@ocaml.doc "An identifier for the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data. For more information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/security_iam_id-based-policy-examples.html#auth-role-permissions}Role-based \
         permissions}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_document_classification_job_response = {
  document_classifier_arn : document_classifier_arn option;
      [@ocaml.doc "The ARN of the custom classification model.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The status of the job:\n\n\
        \ {ul\n\
        \       {-  SUBMITTED - The job has been received and queued for processing.\n\
        \           \n\
        \            }\n\
        \       {-  IN_PROGRESS - Amazon Comprehend is processing the job.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The job was successfully completed and the output is available.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The job did not complete. For details, use the \
         [DescribeDocumentClassificationJob] operation.\n\
        \           \n\
        \            }\n\
        \       {-  STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and \
         is processing the request.\n\
        \           \n\
        \            }\n\
        \       {-  STOPPED - The job was successfully stopped without completing.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::document-classification-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of the job, use this identifier \
         with the [DescribeDocumentClassificationJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_document_classification_job_request = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the flywheel associated with the model to use.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the document classification job. A tag is a key-value pair that \
         adds metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" \
         as the key might be added to a resource to indicate its use by the sales department.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your document classification job. For more information, \
         see {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon \
         VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Comprehend generates one.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
  document_classifier_arn : document_classifier_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the document classifier to use to process the job.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec split = TEST [@ocaml.doc ""] | TRAIN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sentiment_detection_job_properties = {
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your sentiment detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the sentiment detection \
         job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the sentiment detection \
         job.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the sentiment detection job ended.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the sentiment detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the sentiment detection job. If the status is [FAILED], the \
         [Messages] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned to the sentiment detection job\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::sentiment-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the sentiment detection job.\n"]
}
[@@ocaml.doc "Provides information about a sentiment detection job.\n"]

type nonrec sentiment_detection_job_properties_list = sentiment_detection_job_properties list
[@@ocaml.doc ""]

type nonrec sentiment_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of dominant language detection jobs. For more \
   information, see the operation.\n"]

type nonrec semi_structured_document_blob = bytes [@@ocaml.doc ""]

type nonrec relationship_type = CHILD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec relationships_list_item = {
  type_ : relationship_type option;
      [@ocaml.doc "Only supported relationship is a child relationship.\n"]
  ids : string_list option; [@ocaml.doc "Identifers of the child blocks.\n"]
}
[@@ocaml.doc "List of child blocks for the current block.\n"]

type nonrec policy_revision_id = string [@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc
        "The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a \
         new revision ID, and it deletes the prior version of the policy.\n"]
}
[@@ocaml.doc ""]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc
        "The revision ID that Amazon Comprehend assigned to the policy that you are updating. If \
         you are creating a new policy that has no prior version, don't use this parameter. Amazon \
         Comprehend creates the revision ID for you.\n"]
  resource_policy : policy;
      [@ocaml.doc
        "The JSON resource-based policy to attach to your custom model. Provide your JSON as a \
         UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose \
         the attribute names and values in double quotes. If the JSON body is also enclosed in \
         double quotes, then you must escape the double quotes that are inside the policy:\n\n\
        \  [\"{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": \\[\\\"value\\\"\\]}\"] \n\
        \ \n\
        \  To avoid escaping quotes, you can use single quotes to enclose the policy and double \
         quotes to enclose the JSON names and values:\n\
        \  \n\
        \    ['{\"attribute\": \"value\", \"attribute\": \\[\"value\"\\]}'] \n\
        \   "]
  resource_arn : comprehend_model_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom model to attach the policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec point = {
  y : float_ option; [@ocaml.doc "The value of the Y coordinate for a point on a polygon\n"]
  x : float_ option; [@ocaml.doc "The value of the X coordinate for a point on a polygon\n"]
}
[@@ocaml.doc
  "The X and Y coordinates of a point on a document page.\n\n\
  \ For additional information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/API_Point.html}Point} in the Amazon Textract \
   API reference.\n\
  \ "]

type nonrec polygon = point list [@@ocaml.doc ""]

type nonrec pii_output_data_config = {
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt the output results from an analysis job.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        "When you use the [PiiOutputDataConfig] object with asynchronous operations, you specify \
         the Amazon S3 location where you want to write the output data. \n\n\
        \  For a PII entity detection job, the output file is plain text, not a compressed \
         archive. The output file name is the same as the input file, with [.out] appended at the \
         end. \n\
        \ "]
}
[@@ocaml.doc "Provides configuration parameters for the output of PII entity detection jobs.\n"]

type nonrec pii_entity = {
  end_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the last character in the \
         entity.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the first character in the \
         entity.\n"]
  type_ : pii_entity_type option; [@ocaml.doc "The entity's type.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of the detection.\n"]
}
[@@ocaml.doc "Provides information about a PII entity.\n"]

type nonrec pii_entities_detection_job_properties = {
  mode : pii_entities_detection_mode option;
      [@ocaml.doc
        "Specifies whether the output provides the locations (offsets) of PII entities or a file \
         in which PII entities are redacted.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  redaction_config : redaction_config option;
      [@ocaml.doc
        "Provides configuration parameters for PII entity redaction.\n\n\
        \ This parameter is required if you set the [Mode] parameter to [ONLY_REDACTION]. In that \
         case, you must provide a [RedactionConfig] definition that includes the [PiiEntityTypes] \
         parameter.\n\
        \ "]
  output_data_config : pii_output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the PII entities \
         detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc "The input properties for a PII entities detection job.\n"]
  end_time : timestamp option;
      [@ocaml.doc "The time that the PII entities detection job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the PII entities detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the PII entities detection job. If the status is [FAILED], the \
         [Message] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned the PII entities detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the PII entities detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::pii-entities-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the PII entities detection job.\n"]
}
[@@ocaml.doc "Provides information about a PII entities detection job.\n"]

type nonrec pii_entities_detection_job_properties_list = pii_entities_detection_job_properties list
[@@ocaml.doc ""]

type nonrec pii_entities_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc "Provides information for filtering a list of PII entity detection jobs.\n"]

type nonrec page_based_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | PAGE_SIZE_EXCEEDED [@ocaml.doc ""]
  | PAGE_CHARACTERS_EXCEEDED [@ocaml.doc ""]
  | TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED [@ocaml.doc ""]
  | TEXTRACT_BAD_PAGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec number_of_documents = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec model_status =
  | TRAINED_WITH_WARNING [@ocaml.doc ""]
  | TRAINED [@ocaml.doc ""]
  | IN_ERROR [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | TRAINING [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_results_integer = int [@@ocaml.doc ""]

type nonrec list_topics_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  topics_detection_job_properties_list : topics_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_topics_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : topics_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. Jobs can be filtered on their name, status, or the \
         date and time that they were submitted. You can set only one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_filter_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The filter specified for the operation is invalid. Specify a different filter.\n"]

type nonrec list_targeted_sentiment_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  targeted_sentiment_detection_job_properties_list :
    targeted_sentiment_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_targeted_sentiment_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : targeted_sentiment_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags associated with the Amazon Comprehend resource being queried. A tag is a key-value \
         pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag \
         with \"Sales\" as the key might be added to a resource to indicate its use by the sales \
         department. \n"]
  resource_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : comprehend_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying. \n"]
}
[@@ocaml.doc ""]

type nonrec list_sentiment_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  sentiment_detection_job_properties_list : sentiment_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_sentiment_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : sentiment_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pii_entities_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  pii_entities_detection_job_properties_list : pii_entities_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pii_entities_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : pii_entities_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_of_warnings = warnings_list_item list [@@ocaml.doc ""]

type nonrec list_of_toxic_labels = toxic_labels list [@@ocaml.doc ""]

type nonrec list_of_text_segments = text_segment list [@@ocaml.doc ""]

type nonrec list_of_targeted_sentiment_entities = targeted_sentiment_entity list [@@ocaml.doc ""]

type nonrec list_of_syntax_tokens = syntax_token list [@@ocaml.doc ""]

type nonrec list_of_relationships = relationships_list_item list [@@ocaml.doc ""]

type nonrec list_of_pii_entities = pii_entity list [@@ocaml.doc ""]

type nonrec document_label = {
  page : integer option;
      [@ocaml.doc
        "Page number where the label occurs. This field is present in the response only if your \
         request includes the [Byte] parameter. \n"]
  score : float_ option;
      [@ocaml.doc
        "The confidence score that Amazon Comprehend has this label correctly attributed.\n"]
  name : string_ option; [@ocaml.doc "The name of the label.\n"]
}
[@@ocaml.doc "Specifies one of the label or labels that categorize the document being analyzed.\n"]

type nonrec list_of_labels = document_label list [@@ocaml.doc ""]

type nonrec key_phrase = {
  end_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the last character in the \
         key phrase.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the first character in the \
         key phrase.\n"]
  text : string_ option; [@ocaml.doc "The text of a key noun phrase.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of the detection.\n"]
}
[@@ocaml.doc "Describes a key noun phrase.\n"]

type nonrec list_of_key_phrases = key_phrase list [@@ocaml.doc ""]

type nonrec extracted_characters_list_item = {
  count : integer option; [@ocaml.doc "Number of characters extracted from each page.\n"]
  page : integer option; [@ocaml.doc "Page number.\n"]
}
[@@ocaml.doc "Array of the number of characters extracted from each page.\n"]

type nonrec list_of_extracted_characters = extracted_characters_list_item list [@@ocaml.doc ""]

type nonrec errors_list_item = {
  error_message : string_ option; [@ocaml.doc "Text message explaining the reason for the error.\n"]
  error_code : page_based_error_code option; [@ocaml.doc "Error code for the cause of the error.\n"]
  page : integer option; [@ocaml.doc "Page number where the error occurred.\n"]
}
[@@ocaml.doc
  "Text extraction encountered one or more page-level errors in the input document.\n\n\
  \ The [ErrorCode] contains one of the following values:\n\
  \ \n\
  \  {ul\n\
  \        {-  TEXTRACT_BAD_PAGE - Amazon Textract cannot read the page. For more information \
   about page limits in Amazon Textract, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/limits-document.html} Page Quotas in Amazon \
   Textract}.\n\
  \            \n\
  \             }\n\
  \        {-  TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED - The number of requests exceeded your \
   throughput limit. For more information about throughput quotas in Amazon Textract, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/limits-quotas-explained.html} Default quotas \
   in Amazon Textract}.\n\
  \            \n\
  \             }\n\
  \        {-  PAGE_CHARACTERS_EXCEEDED - Too many text characters on the page (10,000 characters \
   maximum).\n\
  \            \n\
  \             }\n\
  \        {-  PAGE_SIZE_EXCEEDED - The maximum page size is 10 MB.\n\
  \            \n\
  \             }\n\
  \        {-  INTERNAL_SERVER_ERROR - The request encountered a service issue. Try the API \
   request again.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec list_of_errors = errors_list_item list [@@ocaml.doc ""]

type nonrec entity_label = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of the detection.\n"]
  name : pii_entity_type option; [@ocaml.doc "The name of the label.\n"]
}
[@@ocaml.doc
  "Specifies one of the label or labels that categorize the personally identifiable information \
   (PII) entity being analyzed.\n"]

type nonrec list_of_entity_labels = entity_label list [@@ocaml.doc ""]

type nonrec entity_type =
  | OTHER [@ocaml.doc ""]
  | TITLE [@ocaml.doc ""]
  | QUANTITY [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | EVENT [@ocaml.doc ""]
  | COMMERCIAL_ITEM [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
  | LOCATION [@ocaml.doc ""]
  | PERSON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec child_block = {
  end_offset : integer option;
      [@ocaml.doc "Offset of the end of the child block within its parent block.\n"]
  begin_offset : integer option;
      [@ocaml.doc "Offset of the start of the child block within its parent block.\n"]
  child_block_id : string_ option; [@ocaml.doc "Unique identifier for the child block.\n"]
}
[@@ocaml.doc "Nested block contained within a block.\n"]

type nonrec list_of_child_blocks = child_block list [@@ocaml.doc ""]

type nonrec block_reference = {
  child_blocks : list_of_child_blocks option;
      [@ocaml.doc "List of child blocks within this block.\n"]
  end_offset : integer option;
      [@ocaml.doc "Offset of the end of the block within its parent block.\n"]
  begin_offset : integer option;
      [@ocaml.doc "Offset of the start of the block within its parent block.\n"]
  block_id : string_ option; [@ocaml.doc "Unique identifier for the block.\n"]
}
[@@ocaml.doc "A reference to a block. \n"]

type nonrec list_of_block_references = block_reference list [@@ocaml.doc ""]

type nonrec entity = {
  block_references : list_of_block_references option;
      [@ocaml.doc
        "A reference to each block for this entity. This field is empty for plain-text input.\n"]
  end_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the last character in the \
         entity.\n\n\
        \ This field is empty for non-text input.\n\
        \ "]
  begin_offset : integer option;
      [@ocaml.doc
        "The zero-based offset from the beginning of the source text to the first character in the \
         entity.\n\n\
        \ This field is empty for non-text input.\n\
        \ "]
  text : string_ option; [@ocaml.doc "The text of the entity.\n"]
  type_ : entity_type option;
      [@ocaml.doc
        "The entity type. For entity detection using the built-in model, this field contains one \
         of the standard entity types listed below.\n\n\
        \ For custom entity detection, this field contains one of the entity types that you \
         specified when you trained your custom model.\n\
        \ "]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of the detection.\n"]
}
[@@ocaml.doc "Provides information about an entity. \n\n  \n "]

type nonrec list_of_entities = entity list [@@ocaml.doc ""]

type nonrec dominant_language = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of the detection.\n"]
  language_code : string_ option;
      [@ocaml.doc
        "The RFC 5646 language code for the dominant language. For more information about RFC \
         5646, see {{:https://tools.ietf.org/html/rfc5646}Tags for Identifying Languages} on the \
         {i IETF Tools} web site.\n"]
}
[@@ocaml.doc
  "Returns the code for the dominant language in the input text and the level of confidence that \
   Amazon Comprehend has in the accuracy of the detection.\n"]

type nonrec list_of_dominant_languages = dominant_language list [@@ocaml.doc ""]

type nonrec document_type =
  | TEXTRACT_ANALYZE_DOCUMENT_JSON [@ocaml.doc ""]
  | TEXTRACT_DETECT_DOCUMENT_TEXT_JSON [@ocaml.doc ""]
  | PLAIN_TEXT [@ocaml.doc ""]
  | IMAGE [@ocaml.doc ""]
  | MS_WORD [@ocaml.doc ""]
  | SCANNED_PDF [@ocaml.doc ""]
  | NATIVE_PDF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_type_list_item = {
  type_ : document_type option; [@ocaml.doc "Document type.\n"]
  page : integer option; [@ocaml.doc "Page number.\n"]
}
[@@ocaml.doc "Document type for each page in the document.\n"]

type nonrec list_of_document_type = document_type_list_item list [@@ocaml.doc ""]

type nonrec batch_detect_targeted_sentiment_item_result = {
  entities : list_of_targeted_sentiment_entities option;
      [@ocaml.doc "An array of targeted sentiment entities.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of this result in the input list.\n"]
}
[@@ocaml.doc "Analysis results for one of the documents in the batch.\n"]

type nonrec list_of_detect_targeted_sentiment_result =
  batch_detect_targeted_sentiment_item_result list
[@@ocaml.doc ""]

type nonrec batch_detect_syntax_item_result = {
  syntax_tokens : list_of_syntax_tokens option;
      [@ocaml.doc "The syntax tokens for the words in the document, one token for each word.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "The result of calling the operation. The operation returns one object that is successfully \
   processed by the operation.\n"]

type nonrec list_of_detect_syntax_result = batch_detect_syntax_item_result list [@@ocaml.doc ""]

type nonrec batch_detect_sentiment_item_result = {
  sentiment_score : sentiment_score option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend has in the accuracy of its sentiment \
         detection.\n"]
  sentiment : sentiment_type option; [@ocaml.doc "The sentiment detected in the document.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "The result of calling the operation. The operation returns one object for each document that is \
   successfully processed by the operation.\n"]

type nonrec list_of_detect_sentiment_result = batch_detect_sentiment_item_result list
[@@ocaml.doc ""]

type nonrec batch_detect_key_phrases_item_result = {
  key_phrases : list_of_key_phrases option;
      [@ocaml.doc
        "One or more [KeyPhrase] objects, one for each key phrase detected in the document.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "The result of calling the operation. The operation returns one object for each document that is \
   successfully processed by the operation.\n"]

type nonrec list_of_detect_key_phrases_result = batch_detect_key_phrases_item_result list
[@@ocaml.doc ""]

type nonrec batch_detect_entities_item_result = {
  entities : list_of_entities option;
      [@ocaml.doc "One or more [Entity] objects, one for each entity detected in the document.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "The result of calling the operation. The operation returns one object for each document that is \
   successfully processed by the operation.\n"]

type nonrec list_of_detect_entities_result = batch_detect_entities_item_result list [@@ocaml.doc ""]

type nonrec batch_detect_dominant_language_item_result = {
  languages : list_of_dominant_languages option;
      [@ocaml.doc
        "One or more [DominantLanguage] objects describing the dominant languages in the document.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "The result of calling the operation. The operation returns one object for each document that is \
   successfully processed by the operation.\n"]

type nonrec list_of_detect_dominant_language_result =
  batch_detect_dominant_language_item_result list
[@@ocaml.doc ""]

type nonrec document_class = {
  page : integer option;
      [@ocaml.doc
        "Page number in the input document. This field is present in the response only if your \
         request includes the [Byte] parameter. \n"]
  score : float_ option;
      [@ocaml.doc
        "The confidence score that Amazon Comprehend has this class correctly attributed.\n"]
  name : string_ option; [@ocaml.doc "The name of the class.\n"]
}
[@@ocaml.doc "Specifies the class that categorizes the document being analyzed\n"]

type nonrec list_of_classes = document_class list [@@ocaml.doc ""]

type nonrec block_type = WORD [@ocaml.doc ""] | LINE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec bounding_box = {
  width : float_ option;
      [@ocaml.doc "The width of the bounding box as a ratio of the overall document page width.\n"]
  top : float_ option;
      [@ocaml.doc
        "The top coordinate of the bounding box as a ratio of overall document page height.\n"]
  left : float_ option;
      [@ocaml.doc
        "The left coordinate of the bounding box as a ratio of overall document page width.\n"]
  height : float_ option;
      [@ocaml.doc
        "The height of the bounding box as a ratio of the overall document page height.\n"]
}
[@@ocaml.doc
  "The bounding box around the detected page or around an element on a document page. The left \
   (x-coordinate) and top (y-coordinate) are coordinates that represent the top and left sides of \
   the bounding box. Note that the upper-left corner of the image is the origin (0,0). \n\n\
  \ For additional information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/API_BoundingBox.html}BoundingBox} in the \
   Amazon Textract API reference.\n\
  \ "]

type nonrec geometry = {
  polygon : polygon option;
      [@ocaml.doc "Within the bounding box, a fine-grained polygon around the recognized item.\n"]
  bounding_box : bounding_box option;
      [@ocaml.doc
        "An axis-aligned coarse representation of the location of the recognized item on the \
         document page.\n"]
}
[@@ocaml.doc
  "Information about the location of items on a document page.\n\n\
  \ For additional information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/API_Geometry.html}Geometry} in the Amazon \
   Textract API reference.\n\
  \ "]

type nonrec block = {
  relationships : list_of_relationships option;
      [@ocaml.doc
        "A list of child blocks of the current block. For example, a LINE object has child blocks \
         for each WORD block that's part of the line of text. \n"]
  geometry : geometry option;
      [@ocaml.doc "Co-ordinates of the rectangle or polygon that contains the text.\n"]
  page : integer option; [@ocaml.doc "Page number where the block appears.\n"]
  text : string_ option; [@ocaml.doc "The word or line of text extracted from the block.\n"]
  block_type : block_type option;
      [@ocaml.doc
        "The block represents a line of text or one word of text.\n\n\
        \ {ul\n\
        \       {-  WORD - A word that's detected on a document page. A word is one or more ISO \
         basic Latin script characters that aren't separated by spaces.\n\
        \           \n\
        \            }\n\
        \       {-  LINE - A string of tab-delimited, contiguous words that are detected on a \
         document page\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : string_ option; [@ocaml.doc "Unique identifier for the block.\n"]
}
[@@ocaml.doc
  "Information about each word or line of text in the input document.\n\n\
  \ For additional information, see \
   {{:https://docs.aws.amazon.com/textract/latest/dg/API_Block.html}Block} in the Amazon Textract \
   API reference.\n\
  \ "]

type nonrec list_of_blocks = block list [@@ocaml.doc ""]

type nonrec key_phrases_detection_job_properties = {
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your key phrases detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume \
         attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId \
         can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the key phrases \
         detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the key phrases detection \
         job.\n"]
  end_time : timestamp option;
      [@ocaml.doc "The time that the key phrases detection job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the key phrases detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the key phrases detection job. If the status is [FAILED], the \
         [Message] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned the key phrases detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the key phrases detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::key-phrases-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the key phrases detection job.\n"]
}
[@@ocaml.doc "Provides information about a key phrases detection job.\n"]

type nonrec key_phrases_detection_job_properties_list = key_phrases_detection_job_properties list
[@@ocaml.doc ""]

type nonrec list_key_phrases_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  key_phrases_detection_job_properties_list : key_phrases_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec key_phrases_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of dominant language detection jobs. For more \
   information, see the operation.\n"]

type nonrec list_key_phrases_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : key_phrases_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec flywheel_summary = {
  latest_flywheel_iteration : flywheel_iteration_id option;
      [@ocaml.doc "The most recent flywheel iteration.\n"]
  last_modified_time : timestamp option; [@ocaml.doc "Last modified time for the flywheel.\n"]
  creation_time : timestamp option; [@ocaml.doc "Creation time of the flywheel.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of the flywheel.\n"]
  model_type : model_type option; [@ocaml.doc "Model type of the flywheel's model.\n"]
  status : flywheel_status option; [@ocaml.doc "The status of the flywheel.\n"]
  data_lake_s3_uri : s3_uri option; [@ocaml.doc "Amazon S3 URI of the data lake location. \n"]
  active_model_arn : comprehend_model_arn option;
      [@ocaml.doc "ARN of the active model version for the flywheel.\n"]
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
}
[@@ocaml.doc "Flywheel summary information.\n"]

type nonrec flywheel_summary_list = flywheel_summary list [@@ocaml.doc ""]

type nonrec list_flywheels_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  flywheel_summary_list : flywheel_summary_list option;
      [@ocaml.doc
        "A list of flywheel properties retrieved by the service in response to the request. \n"]
}
[@@ocaml.doc ""]

type nonrec flywheel_filter = {
  creation_time_before : timestamp option;
      [@ocaml.doc "Filter the flywheels to include flywheels created before the specified time.\n"]
  creation_time_after : timestamp option;
      [@ocaml.doc "Filter the flywheels to include flywheels created after the specified time.\n"]
  status : flywheel_status option;
      [@ocaml.doc "Filter the flywheels based on the flywheel status.\n"]
}
[@@ocaml.doc "Filter the flywheels based on creation time or flywheel status.\n"]

type nonrec list_flywheels_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "Maximum number of results to return in a response. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : flywheel_filter option;
      [@ocaml.doc
        "Filters the flywheels that are returned. You can filter flywheels on their status, or the \
         date and time that they were submitted. You can only set one filter at a time. \n"]
}
[@@ocaml.doc ""]

type nonrec flywheel_iteration_status =
  | STOPPED [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | EVALUATING [@ocaml.doc ""]
  | TRAINING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec flywheel_model_evaluation_metrics = {
  average_accuracy : double option; [@ocaml.doc "Average accuracy metric for the model.\n"]
  average_recall : double option; [@ocaml.doc "Average recall metric for the model.\n"]
  average_precision : double option; [@ocaml.doc "Average precision metric for the model.\n"]
  average_f1_score : double option;
      [@ocaml.doc "The average F1 score from the evaluation metrics.\n"]
}
[@@ocaml.doc "The evaluation metrics associated with the evaluated model.\n"]

type nonrec flywheel_iteration_properties = {
  evaluation_manifest_s3_prefix : s3_uri option; [@ocaml.doc "\n"]
  trained_model_metrics : flywheel_model_evaluation_metrics option;
      [@ocaml.doc "The metrics associated with the trained model.\n"]
  trained_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The ARN of the trained model associated with this flywheel iteration.\n"]
  evaluated_model_metrics : flywheel_model_evaluation_metrics option; [@ocaml.doc ""]
  evaluated_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The ARN of the evaluated model associated with this flywheel iteration.\n"]
  message : any_length_string option;
      [@ocaml.doc "A description of the status of the flywheel iteration.\n"]
  status : flywheel_iteration_status option; [@ocaml.doc "The status of the flywheel iteration.\n"]
  end_time : timestamp option; [@ocaml.doc "The completion time of this flywheel iteration.\n"]
  creation_time : timestamp option;
      [@ocaml.doc "The creation start time of the flywheel iteration.\n"]
  flywheel_iteration_id : flywheel_iteration_id option; [@ocaml.doc "\n"]
  flywheel_arn : comprehend_flywheel_arn option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "The configuration properties of a flywheel iteration.\n"]

type nonrec flywheel_iteration_properties_list = flywheel_iteration_properties list [@@ocaml.doc ""]

type nonrec list_flywheel_iteration_history_response = {
  next_token : string_ option; [@ocaml.doc "Next token\n"]
  flywheel_iteration_properties_list : flywheel_iteration_properties_list option;
      [@ocaml.doc "List of flywheel iteration properties\n"]
}
[@@ocaml.doc ""]

type nonrec flywheel_iteration_filter = {
  creation_time_before : timestamp option;
      [@ocaml.doc
        "Filter the flywheel iterations to include iterations created before the specified time.\n"]
  creation_time_after : timestamp option;
      [@ocaml.doc
        "Filter the flywheel iterations to include iterations created after the specified time.\n"]
}
[@@ocaml.doc "Filter the flywheel iterations based on creation time.\n"]

type nonrec list_flywheel_iteration_history_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "Maximum number of iteration history results to return\n"]
  next_token : string_ option; [@ocaml.doc "Next token\n"]
  filter : flywheel_iteration_filter option;
      [@ocaml.doc "Filter the flywheel iteration history based on creation time.\n"]
  flywheel_arn : comprehend_flywheel_arn; [@ocaml.doc "The ARN of the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec events_detection_job_properties = {
  target_event_types : target_event_types option;
      [@ocaml.doc "The types of events that are detected by the job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the events detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the events detection job.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the events detection job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the events detection job was submitted for processing.\n"]
  message : any_length_string option;
      [@ocaml.doc "A description of the status of the events detection job.\n"]
  job_status : job_status option; [@ocaml.doc "The current status of the events detection job.\n"]
  job_name : job_name option; [@ocaml.doc "The name you assigned the events detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::events-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the events detection job.\n"]
}
[@@ocaml.doc "Provides information about an events detection job.\n"]

type nonrec events_detection_job_properties_list = events_detection_job_properties list
[@@ocaml.doc ""]

type nonrec list_events_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  events_detection_job_properties_list : events_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec events_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the events detection job.\n"]
}
[@@ocaml.doc "Provides information for filtering a list of event detection jobs.\n"]

type nonrec list_events_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : events_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_recognizer_data_format =
  | AUGMENTED_MANIFEST [@ocaml.doc ""]
  | COMPREHEND_CSV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_recognizer_documents = {
  input_format : input_format option;
      [@ocaml.doc
        " Specifies how the text in an input file should be processed. This is optional, and the \
         default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate \
         document. Use this option when you are processing large documents, such as newspaper \
         articles or scientific papers. ONE_DOC_PER_LINE - Each line in a file is considered a \
         separate document. Use this option when you are processing many short documents, such as \
         text messages.\n"]
  test_s3_uri : s3_uri option;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the test documents for an entity recognizer are \
         located. The URI must be in the same Amazon Web Services Region as the API endpoint that \
         you are calling.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the training documents for an entity recognizer \
         are located. The URI must be in the same Region as the API endpoint that you are calling.\n"]
}
[@@ocaml.doc "Describes the training documents submitted with an entity recognizer.\n"]

type nonrec entity_recognizer_annotations = {
  test_s3_uri : s3_uri option;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the test annotations for an entity recognizer are \
         located. The URI must be in the same Region as the API endpoint that you are calling.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the annotations for an entity recognizer are \
         located. The URI must be in the same Region as the API endpoint that you are calling.\n"]
}
[@@ocaml.doc "Describes the annotations associated with a entity recognizer.\n"]

type nonrec entity_recognizer_entity_list = {
  s3_uri : s3_uri;
      [@ocaml.doc
        "Specifies the Amazon S3 location where the entity list is located. The URI must be in the \
         same Region as the API endpoint that you are calling.\n"]
}
[@@ocaml.doc "Describes the entity list submitted with an entity recognizer.\n"]

type nonrec attribute_names_list_item = string [@@ocaml.doc ""]

type nonrec attribute_names_list = attribute_names_list_item list [@@ocaml.doc ""]

type nonrec augmented_manifests_document_type_format =
  | SEMI_STRUCTURED_DOCUMENT [@ocaml.doc ""]
  | PLAIN_TEXT_DOCUMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec augmented_manifests_list_item = {
  document_type : augmented_manifests_document_type_format option;
      [@ocaml.doc
        "The type of augmented manifest. PlainTextDocument or SemiStructuredDocument. If you don't \
         specify, the default is PlainTextDocument. \n\n\
        \ {ul\n\
        \       {-   [PLAIN_TEXT_DOCUMENT] A document type that represents any unicode text that \
         is encoded in UTF-8.\n\
        \           \n\
        \            }\n\
        \       {-   [SEMI_STRUCTURED_DOCUMENT] A document type with positional and structural \
         context, like a PDF. For training with Amazon Comprehend, only PDFs are supported. For \
         inference, Amazon Comprehend support PDFs, DOCX and TXT.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  source_documents_s3_uri : s3_uri option;
      [@ocaml.doc
        "The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest \
         file.\n"]
  annotation_data_s3_uri : s3_uri option;
      [@ocaml.doc
        "The S3 prefix to the annotation files that are referred in the augmented manifest file.\n"]
  attribute_names : attribute_names_list;
      [@ocaml.doc
        "The JSON attribute that contains the annotations for your training documents. The number \
         of attribute names that you specify depends on whether your augmented manifest file is \
         the output of a single labeling job or a chained labeling job.\n\n\
        \ If your file is the output of a single labeling job, specify the LabelAttributeName key \
         that was used when the job was created in Ground Truth.\n\
        \ \n\
        \  If your file is the output of a chained labeling job, specify the LabelAttributeName \
         key for one or more jobs in the chain. Each LabelAttributeName key provides the \
         annotations from an individual job.\n\
        \  "]
  split : split option;
      [@ocaml.doc
        "The purpose of the data you've provided in the augmented manifest. You can either train \
         or test this data. If you don't specify, the default is train.\n\n\
        \ TRAIN - all of the documents in the manifest will be used for training. If no test \
         documents are provided, Amazon Comprehend will automatically reserve a portion of the \
         training documents for testing.\n\
        \ \n\
        \   TEST - all of the documents in the manifest will be used for testing.\n\
        \  "]
  s3_uri : s3_uri; [@ocaml.doc "The Amazon S3 location of the augmented manifest file.\n"]
}
[@@ocaml.doc
  "An augmented manifest file that provides training data for your custom model. An augmented \
   manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.\n"]

type nonrec entity_recognizer_augmented_manifests_list = augmented_manifests_list_item list
[@@ocaml.doc ""]

type nonrec entity_recognizer_input_data_config = {
  augmented_manifests : entity_recognizer_augmented_manifests_list option;
      [@ocaml.doc
        "A list of augmented manifest files that provide training data for your custom model. An \
         augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground \
         Truth.\n\n\
        \ This parameter is required if you set [DataFormat] to [AUGMENTED_MANIFEST].\n\
        \ "]
  entity_list : entity_recognizer_entity_list option;
      [@ocaml.doc
        "The S3 location of the CSV file that has the entity list for your custom entity recognizer.\n"]
  annotations : entity_recognizer_annotations option;
      [@ocaml.doc "The S3 location of the CSV file that annotates your training documents.\n"]
  documents : entity_recognizer_documents option;
      [@ocaml.doc
        "The S3 location of the folder that contains the training documents for your custom entity \
         recognizer.\n\n\
        \ This parameter is required if you set [DataFormat] to [COMPREHEND_CSV].\n\
        \ "]
  entity_types : entity_types_list;
      [@ocaml.doc
        "The entity types in the labeled training data that Amazon Comprehend uses to train the \
         custom entity recognizer. Any entity types that you don't specify are ignored.\n\n\
        \ A maximum of 25 entity types can be used at one time to train an entity recognizer. \
         Entity types must not contain the following invalid characters: \\n (line break), \\\\n \
         (escaped line break), \\r (carriage return), \\\\r (escaped carriage return), \\t (tab), \
         \\\\t (escaped tab), space, and , (comma). \n\
        \ "]
  data_format : entity_recognizer_data_format option;
      [@ocaml.doc
        "The format of your training data:\n\n\
        \ {ul\n\
        \       {-   [COMPREHEND_CSV]: A CSV file that supplements your training documents. The \
         CSV file contains information about the custom entities that your trained model will \
         detect. The required format of the file depends on whether you are providing annotations \
         or an entity list.\n\
        \           \n\
        \            If you use this value, you must provide your CSV file by using either the \
         [Annotations] or [EntityList] parameters. You must provide your training documents by \
         using the [Documents] parameter.\n\
        \            \n\
        \             }\n\
        \       {-   [AUGMENTED_MANIFEST]: A labeled dataset that is produced by Amazon SageMaker \
         Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that \
         contains a training document and its labels. Each label annotates a named entity in the \
         training document. \n\
        \           \n\
        \            If you use this value, you must provide the [AugmentedManifests] parameter in \
         your request.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \   If you don't specify a value, Amazon Comprehend uses [COMPREHEND_CSV] as the default.\n\
        \   "]
}
[@@ocaml.doc "Specifies the format and location of the input data.\n"]

type nonrec entity_recognizer_evaluation_metrics = {
  f1_score : double option;
      [@ocaml.doc
        "A measure of how accurate the recognizer results are for the test data. It is derived \
         from the [Precision] and [Recall] values. The [F1Score] is the harmonic average of the \
         two scores. For plain text entity recognizer models, the range is 0 to 100, where 100 is \
         the best score. For PDF/Word entity recognizer models, the range is 0 to 1, where 1 is \
         the best score. \n"]
  recall : double option;
      [@ocaml.doc
        "A measure of how complete the recognizer results are for the test data. High recall means \
         that the recognizer returned most of the relevant results.\n"]
  precision : double option;
      [@ocaml.doc
        "A measure of the usefulness of the recognizer results in the test data. High precision \
         means that the recognizer returned substantially more relevant results than irrelevant \
         ones. \n"]
}
[@@ocaml.doc "Detailed information about the accuracy of an entity recognizer. \n"]

type nonrec entity_types_evaluation_metrics = {
  f1_score : double option;
      [@ocaml.doc
        "A measure of how accurate the recognizer results are for a specific entity type in the \
         test data. It is derived from the [Precision] and [Recall] values. The [F1Score] is the \
         harmonic average of the two scores. The highest score is 1, and the worst score is 0. \n"]
  recall : double option;
      [@ocaml.doc
        "A measure of how complete the recognizer results are for a specific entity type in the \
         test data. High recall means that the recognizer returned most of the relevant results.\n"]
  precision : double option;
      [@ocaml.doc
        "A measure of the usefulness of the recognizer results for a specific entity type in the \
         test data. High precision means that the recognizer returned substantially more relevant \
         results than irrelevant ones. \n"]
}
[@@ocaml.doc
  "Detailed information about the accuracy of an entity recognizer for a specific entity type. \n"]

type nonrec entity_recognizer_metadata_entity_types_list_item = {
  number_of_train_mentions : integer option;
      [@ocaml.doc
        "Indicates the number of times the given entity type was seen in the training data. \n"]
  evaluation_metrics : entity_types_evaluation_metrics option;
      [@ocaml.doc
        "Detailed information about the accuracy of the entity recognizer for a specific item on \
         the list of entity types. \n"]
  type_ : any_length_string option;
      [@ocaml.doc
        "Type of entity from the list of entity types in the metadata of an entity recognizer. \n"]
}
[@@ocaml.doc
  "Individual item from the list of entity types in the metadata of an entity recognizer.\n"]

type nonrec entity_recognizer_metadata_entity_types_list =
  entity_recognizer_metadata_entity_types_list_item list
[@@ocaml.doc ""]

type nonrec entity_recognizer_metadata = {
  entity_types : entity_recognizer_metadata_entity_types_list option;
      [@ocaml.doc "Entity types from the metadata of an entity recognizer.\n"]
  evaluation_metrics : entity_recognizer_evaluation_metrics option;
      [@ocaml.doc "Detailed information about the accuracy of an entity recognizer.\n"]
  number_of_test_documents : integer option;
      [@ocaml.doc
        " The number of documents in the input data that were used to test the entity recognizer. \
         Typically this is 10 to 20 percent of the input documents.\n"]
  number_of_trained_documents : integer option;
      [@ocaml.doc
        " The number of documents in the input data that were used to train the entity recognizer. \
         Typically this is 80 to 90 percent of the input documents.\n"]
}
[@@ocaml.doc "Detailed information about an entity recognizer.\n"]

type nonrec entity_recognizer_output_data_config = {
  flywheel_stats_s3_prefix : s3_uri option;
      [@ocaml.doc "The Amazon S3 prefix for the data lake location of the flywheel statistics.\n"]
}
[@@ocaml.doc "Output data configuration.\n"]

type nonrec entity_recognizer_properties = {
  output_data_config : entity_recognizer_output_data_config option;
      [@ocaml.doc "Output data configuration.\n"]
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
  source_model_arn : entity_recognizer_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source model. This model was imported from a \
         different Amazon Web Services account to create the entity recognizer model in your \
         Amazon Web Services account.\n"]
  version_name : version_name option;
      [@ocaml.doc "The version name you assigned to the entity recognizer.\n"]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your custom entity recognizer. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  recognizer_metadata : entity_recognizer_metadata option;
      [@ocaml.doc " Provides information about an entity recognizer.\n"]
  input_data_config : entity_recognizer_input_data_config option;
      [@ocaml.doc "The input data properties of an entity recognizer.\n"]
  training_end_time : timestamp option;
      [@ocaml.doc "The time that training of the entity recognizer was completed.\n"]
  training_start_time : timestamp option;
      [@ocaml.doc "The time that training of the entity recognizer started.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the recognizer creation completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the recognizer was submitted for processing.\n"]
  message : any_length_string option;
      [@ocaml.doc " A description of the status of the recognizer.\n"]
  status : model_status option; [@ocaml.doc "Provides the status of the entity recognizer.\n"]
  language_code : language_code option;
      [@ocaml.doc
        " The language of the input documents. All documents must be in the same language. Only \
         English (\"en\") is currently supported.\n"]
  entity_recognizer_arn : entity_recognizer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the entity recognizer.\n"]
}
[@@ocaml.doc "Describes information about an entity recognizer.\n"]

type nonrec entity_recognizer_properties_list = entity_recognizer_properties list [@@ocaml.doc ""]

type nonrec list_entity_recognizers_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  entity_recognizer_properties_list : entity_recognizer_properties_list option;
      [@ocaml.doc "The list of properties of an entity recognizer.\n"]
}
[@@ocaml.doc ""]

type nonrec comprehend_arn_name = string [@@ocaml.doc ""]

type nonrec entity_recognizer_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of entities based on the time that the list was submitted for \
         processing. Returns only jobs submitted after the specified time. Jobs are returned in \
         ascending order, oldest to newest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of entities based on the time that the list was submitted for \
         processing. Returns only jobs submitted before the specified time. Jobs are returned in \
         descending order, newest to oldest.\n"]
  recognizer_name : comprehend_arn_name option;
      [@ocaml.doc "The name that you assigned the entity recognizer.\n"]
  status : model_status option; [@ocaml.doc "The status of an entity recognizer.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of entity recognizers. You can only specify one \
   filtering parameter in a request. For more information, see the [ListEntityRecognizers] \
   operation./>\n"]

type nonrec list_entity_recognizers_request = {
  max_results : max_results_integer option;
      [@ocaml.doc " The maximum number of results to return on each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : entity_recognizer_filter option;
      [@ocaml.doc
        "Filters the list of entities returned. You can filter on [Status], [SubmitTimeBefore], or \
         [SubmitTimeAfter]. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_recognizer_summary = {
  latest_version_status : model_status option;
      [@ocaml.doc " Provides the status of the latest entity recognizer version.\n"]
  latest_version_name : version_name option;
      [@ocaml.doc " The version name you assigned to the latest entity recognizer version.\n"]
  latest_version_created_at : timestamp option;
      [@ocaml.doc
        " The time that the latest entity recognizer version was submitted for processing.\n"]
  number_of_versions : integer option; [@ocaml.doc " The number of versions you created.\n"]
  recognizer_name : comprehend_arn_name option;
      [@ocaml.doc " The name that you assigned the entity recognizer.\n"]
}
[@@ocaml.doc " Describes the information about an entity recognizer and its versions.\n"]

type nonrec entity_recognizer_summaries_list = entity_recognizer_summary list [@@ocaml.doc ""]

type nonrec list_entity_recognizer_summaries_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  entity_recognizer_summaries_list : entity_recognizer_summaries_list option;
      [@ocaml.doc "The list entity recognizer summaries.\n"]
}
[@@ocaml.doc ""]

type nonrec list_entity_recognizer_summaries_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return on each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec entities_detection_job_properties = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the flywheel associated with this job.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your entity detection job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the entities detection \
         job. \n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the entities detection job.\n"]
  entity_recognizer_arn : entity_recognizer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the entity recognizer.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the entities detection job completed\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the entities detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the entities detection job. If the status is [FAILED], the \
         [Message] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned the entities detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::entities-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the entities detection job.\n"]
}
[@@ocaml.doc "Provides information about an entities detection job.\n"]

type nonrec entities_detection_job_properties_list = entities_detection_job_properties list
[@@ocaml.doc ""]

type nonrec list_entities_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  entities_detection_job_properties_list : entities_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec entities_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of dominant language detection jobs. For more \
   information, see the operation.\n"]

type nonrec list_entities_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : entities_detection_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_status =
  | UPDATING [@ocaml.doc ""]
  | IN_SERVICE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec endpoint_properties = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
  desired_data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "Data access role ARN to use in case the new model is encrypted with a customer KMS key.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to trained custom models encrypted with a customer managed key (ModelKmsKeyId).\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "The date and time that the endpoint was last modified.\n"]
  creation_time : timestamp option; [@ocaml.doc "The creation date and time of the endpoint.\n"]
  current_inference_units : inference_units_integer option;
      [@ocaml.doc
        "The number of inference units currently used by the model using this endpoint.\n"]
  desired_inference_units : inference_units_integer option;
      [@ocaml.doc
        "The desired number of inference units to be used by the model using this endpoint. Each \
         inference unit represents of a throughput of 100 characters per second.\n"]
  desired_model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "ARN of the new model to use for updating an existing endpoint. This ARN is going to be \
         different from the model ARN when the update is in progress\n"]
  model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the model to which the endpoint is attached.\n"]
  message : any_length_string option;
      [@ocaml.doc "Specifies a reason for failure in cases of [Failed] status.\n"]
  status : endpoint_status option;
      [@ocaml.doc
        "Specifies the status of the endpoint. Because the endpoint updates and creation are \
         asynchronous, so customers will need to wait for the endpoint to be [Ready] status before \
         making inference requests.\n"]
  endpoint_arn : comprehend_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the endpoint.\n"]
}
[@@ocaml.doc
  "Specifies information about the specified endpoint. For information about endpoints, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing endpoints}.\n"]

type nonrec endpoint_properties_list = endpoint_properties list [@@ocaml.doc ""]

type nonrec list_endpoints_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  endpoint_properties_list : endpoint_properties_list option;
      [@ocaml.doc
        "Displays a list of endpoint properties being retrieved by the service in response to the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_filter = {
  creation_time_after : timestamp option;
      [@ocaml.doc "Specifies a date after which the returned endpoint or endpoints were created.\n"]
  creation_time_before : timestamp option;
      [@ocaml.doc
        "Specifies a date before which the returned endpoint or endpoints were created.\n"]
  status : endpoint_status option;
      [@ocaml.doc
        "Specifies the status of the endpoint being returned. Possible values are: Creating, \
         Ready, Updating, Deleting, Failed.\n"]
  model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the model to which the endpoint is attached.\n"]
}
[@@ocaml.doc
  "The filter used to determine which endpoints are returned. You can filter jobs on their name, \
   model, status, or the date and time that they were created. You can only set one filter at a \
   time. \n"]

type nonrec list_endpoints_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : endpoint_filter option;
      [@ocaml.doc
        "Filters the endpoints that are returned. You can filter endpoints on their name, model, \
         status, or the date and time that they were created. You can only set one filter at a \
         time. \n"]
}
[@@ocaml.doc ""]

type nonrec dominant_language_detection_job_properties = {
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your dominant language detection job. For more information, \
         see {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon \
         VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the dominant language \
         detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the dominant language \
         detection job.\n"]
  end_time : timestamp option;
      [@ocaml.doc "The time that the dominant language detection job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc
        "The time that the dominant language detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description for the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the dominant language detection job. If the status is [FAILED], the \
         [Message] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned to the dominant language detection job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, \
         fully qualified identifier for the job. It includes the Amazon Web Services account, \
         Amazon Web Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::dominant-language-detection-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc "The identifier assigned to the dominant language detection job.\n"]
}
[@@ocaml.doc "Provides information about a dominant language detection job.\n"]

type nonrec dominant_language_detection_job_properties_list =
  dominant_language_detection_job_properties list
[@@ocaml.doc ""]

type nonrec list_dominant_language_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  dominant_language_detection_job_properties_list :
    dominant_language_detection_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec dominant_language_detection_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list of jobs based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of dominant language detection jobs. For more \
   information, see the operation.\n"]

type nonrec list_dominant_language_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : dominant_language_detection_job_filter option;
      [@ocaml.doc
        "Filters that jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec document_classifier_data_format =
  | AUGMENTED_MANIFEST [@ocaml.doc ""]
  | COMPREHEND_CSV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec label_delimiter = string [@@ocaml.doc ""]

type nonrec document_classifier_augmented_manifests_list = augmented_manifests_list_item list
[@@ocaml.doc ""]

type nonrec document_classifier_document_type_format =
  | SEMI_STRUCTURED_DOCUMENT [@ocaml.doc ""]
  | PLAIN_TEXT_DOCUMENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_classifier_documents = {
  test_s3_uri : s3_uri option;
      [@ocaml.doc
        "The S3 URI location of the test documents included in the TestS3Uri CSV file. This field \
         is not required if you do not specify a test CSV file.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        "The S3 URI location of the training documents specified in the S3Uri CSV file.\n"]
}
[@@ocaml.doc
  "The location of the training documents. This parameter is required in a request to create a \
   semi-structured document classification model.\n"]

type nonrec document_classifier_input_data_config = {
  document_reader_config : document_reader_config option; [@ocaml.doc ""]
  documents : document_classifier_documents option;
      [@ocaml.doc
        "The S3 location of the training documents. This parameter is required in a request to \
         create a native document model.\n"]
  document_type : document_classifier_document_type_format option;
      [@ocaml.doc
        "The type of input documents for training the model. Provide plain-text documents to \
         create a plain-text model, and provide semi-structured documents to create a native \
         document model.\n"]
  augmented_manifests : document_classifier_augmented_manifests_list option;
      [@ocaml.doc
        "A list of augmented manifest files that provide training data for your custom model. An \
         augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground \
         Truth.\n\n\
        \ This parameter is required if you set [DataFormat] to [AUGMENTED_MANIFEST].\n\
        \ "]
  label_delimiter : label_delimiter option;
      [@ocaml.doc
        "Indicates the delimiter used to separate each label for training a multi-label \
         classifier. The default delimiter between labels is a pipe (|). You can use a different \
         character as a delimiter (if it's an allowed character) by specifying it under Delimiter \
         for labels. If the training documents use a delimiter other than the default or the \
         delimiter you specify, the labels on that line will be combined to make a single unique \
         label, such as LABELLABELLABEL.\n"]
  test_s3_uri : s3_uri option;
      [@ocaml.doc
        "This specifies the Amazon S3 location that contains the test annotations for the document \
         classifier. The URI must be in the same Amazon Web Services Region as the API endpoint \
         that you are calling. \n"]
  s3_uri : s3_uri option;
      [@ocaml.doc
        "The Amazon S3 URI for the input data. The S3 bucket must be in the same Region as the API \
         endpoint that you are calling. The URI can point to a single input file or it can provide \
         the prefix for a collection of input files.\n\n\
        \ For example, if you use the URI [S3://bucketName/prefix], if the prefix is a single \
         file, Amazon Comprehend uses that file as input. If more than one file begins with the \
         prefix, Amazon Comprehend uses all of them as input.\n\
        \ \n\
        \  This parameter is required if you set [DataFormat] to [COMPREHEND_CSV].\n\
        \  "]
  data_format : document_classifier_data_format option;
      [@ocaml.doc
        "The format of your training data:\n\n\
        \ {ul\n\
        \       {-   [COMPREHEND_CSV]: A two-column CSV file, where labels are provided in the \
         first column, and documents are provided in the second. If you use this value, you must \
         provide the [S3Uri] parameter in your request.\n\
        \           \n\
        \            }\n\
        \       {-   [AUGMENTED_MANIFEST]: A labeled dataset that is produced by Amazon SageMaker \
         Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that \
         contains a training document and its associated labels. \n\
        \           \n\
        \            If you use this value, you must provide the [AugmentedManifests] parameter in \
         your request.\n\
        \            \n\
        \             }\n\
        \       }\n\
        \   If you don't specify a value, Amazon Comprehend uses [COMPREHEND_CSV] as the default.\n\
        \   "]
}
[@@ocaml.doc
  "The input properties for training a document classifier. \n\n\
  \ For more information on how the input file is formatted, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html}Preparing \
   training data} in the Comprehend Developer Guide. \n\
  \ "]

type nonrec document_classifier_output_data_config = {
  flywheel_stats_s3_prefix : s3_uri option;
      [@ocaml.doc "The Amazon S3 prefix for the data lake location of the flywheel statistics.\n"]
  kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the \
         following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  KMS Key Alias: [\"alias/ExampleAlias\"] \n\
        \           \n\
        \            }\n\
        \       {-  ARN of a KMS Key Alias: \
         [\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  s3_uri : s3_uri option;
      [@ocaml.doc
        "When you use the [OutputDataConfig] object while creating a custom classifier, you \
         specify the Amazon S3 location where you want to write the confusion matrix and other \
         output files. The URI must be in the same Region as the API endpoint that you are \
         calling. The location is used as the prefix for the actual location of this output file.\n\n\
        \ When the custom classifier job is finished, the service creates the output file in a \
         directory specific to the job. The [S3Uri] field contains the location of the output \
         file, called [output.tar.gz]. It is a compressed archive that contains the confusion \
         matrix.\n\
        \ "]
}
[@@ocaml.doc
  "Provide the location for output data from a custom classifier job. This field is mandatory if \
   you are training a native document model.\n"]

type nonrec classifier_evaluation_metrics = {
  hamming_loss : double option;
      [@ocaml.doc
        "Indicates the fraction of labels that are incorrectly predicted. Also seen as the \
         fraction of wrong labels compared to the total number of labels. Scores closer to zero \
         are better.\n"]
  micro_f1_score : double option;
      [@ocaml.doc
        "A measure of how accurate the classifier results are for the test data. It is a \
         combination of the [Micro Precision] and [Micro Recall] values. The [Micro F1Score] is \
         the harmonic mean of the two scores. The highest score is 1, and the worst score is 0.\n"]
  micro_recall : double option;
      [@ocaml.doc
        "A measure of how complete the classifier results are for the test data. High recall means \
         that the classifier returned most of the relevant results. Specifically, this indicates \
         how many of the correct categories in the text that the model can predict. It is a \
         percentage of correct categories in the text that can found. Instead of averaging the \
         recall scores of all labels (as with Recall), micro Recall is based on the overall score \
         of all recall scores added together.\n"]
  micro_precision : double option;
      [@ocaml.doc
        "A measure of the usefulness of the recognizer results in the test data. High precision \
         means that the recognizer returned substantially more relevant results than irrelevant \
         ones. Unlike the Precision metric which comes from averaging the precision of all \
         available labels, this is based on the overall score of all precision scores added \
         together.\n"]
  f1_score : double option;
      [@ocaml.doc
        "A measure of how accurate the classifier results are for the test data. It is derived \
         from the [Precision] and [Recall] values. The [F1Score] is the harmonic average of the \
         two scores. The highest score is 1, and the worst score is 0. \n"]
  recall : double option;
      [@ocaml.doc
        "A measure of how complete the classifier results are for the test data. High recall means \
         that the classifier returned most of the relevant results. \n"]
  precision : double option;
      [@ocaml.doc
        "A measure of the usefulness of the classifier results in the test data. High precision \
         means that the classifier returned substantially more relevant results than irrelevant \
         ones.\n"]
  accuracy : double option;
      [@ocaml.doc
        "The fraction of the labels that were correct recognized. It is computed by dividing the \
         number of labels in the test documents that were correctly recognized by the total number \
         of labels in the test documents.\n"]
}
[@@ocaml.doc
  "Describes the result metrics for the test data associated with an documentation classifier.\n"]

type nonrec classifier_metadata = {
  evaluation_metrics : classifier_evaluation_metrics option;
      [@ocaml.doc
        " Describes the result metrics for the test data associated with an documentation \
         classifier.\n"]
  number_of_test_documents : integer option;
      [@ocaml.doc
        "The number of documents in the input data that were used to test the classifier. \
         Typically this is 10 to 20 percent of the input documents, up to 10,000 documents.\n"]
  number_of_trained_documents : integer option;
      [@ocaml.doc
        "The number of documents in the input data that were used to train the classifier. \
         Typically this is 80 to 90 percent of the input documents.\n"]
  number_of_labels : integer option; [@ocaml.doc "The number of labels in the input data. \n"]
}
[@@ocaml.doc "Provides information about a document classifier.\n"]

type nonrec document_classifier_properties = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
  source_model_arn : document_classifier_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source model. This model was imported from a \
         different Amazon Web Services account to create the document classifier model in your \
         Amazon Web Services account.\n"]
  version_name : version_name option;
      [@ocaml.doc "The version name that you assigned to the document classifier.\n"]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  mode : document_classifier_mode option;
      [@ocaml.doc
        "Indicates the mode in which the specific classifier was trained. This also indicates the \
         format of input documents and the format of the confusion matrix. Each classifier can \
         only be trained in one mode and this cannot be changed once the classifier is trained.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your custom classifier. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  classifier_metadata : classifier_metadata option;
      [@ocaml.doc
        "Information about the document classifier, including the number of documents used for \
         training the classifier, the number of documents used for test the classifier, and an \
         accuracy rating.\n"]
  output_data_config : document_classifier_output_data_config option;
      [@ocaml.doc " Provides output results configuration parameters for custom classifier jobs.\n"]
  input_data_config : document_classifier_input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the document classifier \
         for training.\n"]
  training_end_time : timestamp option;
      [@ocaml.doc
        "The time that training of the document classifier was completed. Indicates the time when \
         the training completes on documentation classifiers. You are billed for the time interval \
         between this time and the value of TrainingStartTime.\n"]
  training_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the time when the training starts on documentation classifiers. You are billed \
         for the time interval between this time and the value of TrainingEndTime. \n"]
  end_time : timestamp option;
      [@ocaml.doc "The time that training the document classifier completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the document classifier was submitted for training.\n"]
  message : any_length_string option;
      [@ocaml.doc "Additional information about the status of the classifier.\n"]
  status : model_status option;
      [@ocaml.doc
        "The status of the document classifier. If the status is [TRAINED] the classifier is ready \
         to use. If the status is [TRAINED_WITH_WARNINGS] the classifier training succeeded, but \
         you should review the warnings returned in the [CreateDocumentClassifier] response.\n\n\
        \  If the status is [FAILED] you can see additional information about why the classifier \
         wasn't trained in the [Message] field.\n\
        \ "]
  language_code : language_code option;
      [@ocaml.doc
        "The language code for the language of the documents that the classifier was trained on.\n"]
  document_classifier_arn : document_classifier_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the document classifier.\n"]
}
[@@ocaml.doc "Provides information about a document classifier.\n"]

type nonrec document_classifier_properties_list = document_classifier_properties list
[@@ocaml.doc ""]

type nonrec list_document_classifiers_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  document_classifier_properties_list : document_classifier_properties_list option;
      [@ocaml.doc "A list containing the properties of each job returned.\n"]
}
[@@ocaml.doc ""]

type nonrec document_classifier_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of classifiers based on the time that the classifier was submitted for \
         processing. Returns only classifiers submitted after the specified time. Classifiers are \
         returned in descending order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of classifiers based on the time that the classifier was submitted for \
         processing. Returns only classifiers submitted before the specified time. Classifiers are \
         returned in ascending order, oldest to newest.\n"]
  document_classifier_name : comprehend_arn_name option;
      [@ocaml.doc "The name that you assigned to the document classifier\n"]
  status : model_status option; [@ocaml.doc "Filters the list of classifiers based on status.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of document classifiers. You can only specify one \
   filtering parameter in a request. For more information, see the [ListDocumentClassifiers] \
   operation.\n"]

type nonrec list_document_classifiers_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : document_classifier_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their name, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec document_classifier_summary = {
  latest_version_status : model_status option;
      [@ocaml.doc "Provides the status of the latest document classifier version.\n"]
  latest_version_name : version_name option;
      [@ocaml.doc "The version name you assigned to the latest document classifier version.\n"]
  latest_version_created_at : timestamp option;
      [@ocaml.doc
        "The time that the latest document classifier version was submitted for processing.\n"]
  number_of_versions : integer option; [@ocaml.doc "The number of versions you created.\n"]
  document_classifier_name : comprehend_arn_name option;
      [@ocaml.doc "The name that you assigned the document classifier.\n"]
}
[@@ocaml.doc "Describes information about a document classifier and its versions.\n"]

type nonrec document_classifier_summaries_list = document_classifier_summary list [@@ocaml.doc ""]

type nonrec list_document_classifier_summaries_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  document_classifier_summaries_list : document_classifier_summaries_list option;
      [@ocaml.doc "The list of summaries of document classifiers.\n"]
}
[@@ocaml.doc ""]

type nonrec list_document_classifier_summaries_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return on each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec document_classification_job_properties = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        " Configuration parameters for a private Virtual Private Cloud (VPC) containing the \
         resources you are using for your document classification job. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the document \
         classification job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the document \
         classification job.\n"]
  document_classifier_arn : document_classifier_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the document classifier. \n"]
  end_time : timestamp option;
      [@ocaml.doc "The time that the document classification job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the document classification job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of the job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the document classification job. If the status is [FAILED], the \
         [Message] field shows the reason for the failure.\n"]
  job_name : job_name option;
      [@ocaml.doc "The name that you assigned to the document classification job.\n"]
  job_arn : comprehend_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully \
         qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web \
         Services Region, and the job ID. The format of the ARN is as follows:\n\n\
        \  \n\
        \ {[\n\
        \ arn::comprehend:::document-classification-job/\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  The following is an example job ARN:\n\
        \  \n\
        \    \
         [arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab] \n\
        \   "]
  job_id : job_id option;
      [@ocaml.doc "The identifier assigned to the document classification job.\n"]
}
[@@ocaml.doc "Provides information about a document classification job.\n"]

type nonrec document_classification_job_properties_list =
  document_classification_job_properties list
[@@ocaml.doc ""]

type nonrec list_document_classification_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  document_classification_job_properties_list : document_classification_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job returned.\n"]
}
[@@ocaml.doc ""]

type nonrec document_classification_job_filter = {
  submit_time_after : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted after the specified time. Jobs are returned in descending \
         order, newest to oldest.\n"]
  submit_time_before : timestamp option;
      [@ocaml.doc
        "Filters the list of jobs based on the time that the job was submitted for processing. \
         Returns only jobs submitted before the specified time. Jobs are returned in ascending \
         order, oldest to newest.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "Filters the list based on job status. Returns only jobs with the specified status.\n"]
  job_name : job_name option; [@ocaml.doc "Filters on the name of the job.\n"]
}
[@@ocaml.doc
  "Provides information for filtering a list of document classification jobs. For more \
   information, see the operation. You can provide only one filter parameter in each request.\n"]

type nonrec list_document_classification_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : document_classification_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs on their names, status, or the \
         date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec comprehend_dataset_arn = string [@@ocaml.doc ""]

type nonrec dataset_type = TEST [@ocaml.doc ""] | TRAIN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec dataset_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_properties = {
  end_time : timestamp option;
      [@ocaml.doc "Time when the data from the dataset becomes available in the data lake.\n"]
  creation_time : timestamp option; [@ocaml.doc "Creation time of the dataset.\n"]
  number_of_documents : number_of_documents option;
      [@ocaml.doc "The number of documents in the dataset.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of the dataset.\n"]
  status : dataset_status option;
      [@ocaml.doc
        "The dataset status. While the system creates the dataset, the status is [CREATING]. When \
         the dataset is ready to use, the status changes to [COMPLETED]. \n"]
  description : description option; [@ocaml.doc "Description of the dataset.\n"]
  dataset_s3_uri : s3_uri option; [@ocaml.doc "The S3 URI where the dataset is stored.\n"]
  dataset_type : dataset_type option;
      [@ocaml.doc "The dataset type (training data or test data).\n"]
  dataset_name : comprehend_arn_name option; [@ocaml.doc "The name of the dataset.\n"]
  dataset_arn : comprehend_dataset_arn option; [@ocaml.doc "The ARN of the dataset.\n"]
}
[@@ocaml.doc "Properties associated with the dataset.\n"]

type nonrec dataset_properties_list = dataset_properties list [@@ocaml.doc ""]

type nonrec list_datasets_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  dataset_properties_list : dataset_properties_list option;
      [@ocaml.doc "The dataset properties list.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_filter = {
  creation_time_before : timestamp option;
      [@ocaml.doc "Filter the datasets to include datasets created before the specified time.\n"]
  creation_time_after : timestamp option;
      [@ocaml.doc "Filter the datasets to include datasets created after the specified time.\n"]
  dataset_type : dataset_type option;
      [@ocaml.doc "Filter the datasets based on the dataset type.\n"]
  status : dataset_status option; [@ocaml.doc "Filter the datasets based on the dataset status.\n"]
}
[@@ocaml.doc "Filter the datasets based on creation time or dataset status.\n"]

type nonrec list_datasets_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "Maximum number of results to return in a response. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : dataset_filter option;
      [@ocaml.doc "Filters the datasets to be returned in the response.\n"]
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec import_model_response = {
  model_arn : comprehend_model_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom model being imported.\n"]
}
[@@ocaml.doc ""]

type nonrec import_model_request = {
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the custom model that is created by this import. A tag is a \
         key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For \
         example, a tag with \"Sales\" as the key might be added to a resource to indicate its use \
         by the sales department.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission \
         to use Amazon Key Management Service (KMS) to encrypt or decrypt the custom model.\n"]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  version_name : version_name option;
      [@ocaml.doc
        "The version name given to the custom model that is created by this import. Version names \
         can have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and \
         underscores (_) are allowed. The version name must be unique among all models with the \
         same classifier name in the account/Region.\n"]
  model_name : comprehend_arn_name option;
      [@ocaml.doc
        "The name to assign to the custom model that is created in Amazon Comprehend by this import.\n"]
  source_model_arn : comprehend_model_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom model to import.\n"]
}
[@@ocaml.doc ""]

type nonrec flywheel_s3_uri = string [@@ocaml.doc ""]

type nonrec entity_recognizer_endpoint_arn = string [@@ocaml.doc ""]

type nonrec document_metadata = {
  extracted_characters : list_of_extracted_characters option;
      [@ocaml.doc
        "List of pages in the document, with the number of characters extracted from each page.\n"]
  pages : integer option; [@ocaml.doc "Number of pages in the document.\n"]
}
[@@ocaml.doc "Information about the document, discovered during text extraction.\n"]

type nonrec document_classifier_endpoint_arn = string [@@ocaml.doc ""]

type nonrec detect_toxic_content_response = {
  result_list : list_of_toxic_labels option;
      [@ocaml.doc
        "Results of the content moderation analysis. Each entry in the results list contains a \
         list of toxic content types identified in the text, along with a confidence score for \
         each content type. The results list also includes a toxicity score for each entry in the \
         results list. \n"]
}
[@@ocaml.doc ""]

type nonrec detect_toxic_content_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input text. Currently, English is the only supported language.\n"]
  text_segments : list_of_text_segments;
      [@ocaml.doc
        "A list of up to 10 text strings. Each string has a maximum size of 1 KB, and the maximum \
         size of the list is 10 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_targeted_sentiment_response = {
  entities : list_of_targeted_sentiment_entities option;
      [@ocaml.doc
        "Targeted sentiment analysis for each of the entities identified in the input text.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_targeted_sentiment_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. Currently, English is the only supported language.\n"]
  text : customer_input_string;
      [@ocaml.doc "A UTF-8 text string. The maximum string length is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_syntax_response = {
  syntax_tokens : list_of_syntax_tokens option;
      [@ocaml.doc
        "A collection of syntax tokens describing the text. For each token, the response provides \
         the text, the token type, where the text begins and ends, and the level of confidence \
         that Amazon Comprehend has that the token is correct. For a list of token types, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html}Syntax} in the \
         Comprehend Developer Guide. \n"]
}
[@@ocaml.doc ""]

type nonrec detect_syntax_request = {
  language_code : syntax_language_code;
      [@ocaml.doc
        "The language code of the input documents. You can specify any of the following languages \
         supported by Amazon Comprehend: German (\"de\"), English (\"en\"), Spanish (\"es\"), \
         French (\"fr\"), Italian (\"it\"), or Portuguese (\"pt\").\n"]
  text : customer_input_string; [@ocaml.doc "A UTF-8 string. The maximum string size is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_sentiment_response = {
  sentiment_score : sentiment_score option;
      [@ocaml.doc
        "An object that lists the sentiments, and their corresponding confidence levels.\n"]
  sentiment : sentiment_type option;
      [@ocaml.doc
        "The inferred sentiment that Amazon Comprehend has the highest level of confidence in.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_sentiment_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  text : customer_input_string;
      [@ocaml.doc "A UTF-8 text string. The maximum string size is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_pii_entities_response = {
  entities : list_of_pii_entities option;
      [@ocaml.doc
        "A collection of PII entities identified in the input text. For each entity, the response \
         provides the entity type, where the entity text begins and ends, and the level of \
         confidence that Amazon Comprehend has in the detection.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_pii_entities_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input text. Enter the language code for English (en) or Spanish (es).\n"]
  text : string_; [@ocaml.doc "A UTF-8 text string. The maximum string size is 100 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_key_phrases_response = {
  key_phrases : list_of_key_phrases option;
      [@ocaml.doc
        "A collection of key phrases that Amazon Comprehend identified in the input text. For each \
         key phrase, the response provides the text of the key phrase, where the key phrase begins \
         and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the \
         detection. \n"]
}
[@@ocaml.doc ""]

type nonrec detect_key_phrases_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  text : customer_input_string;
      [@ocaml.doc
        "A UTF-8 text string. The string must contain less than 100 KB of UTF-8 encoded characters.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_entities_response = {
  errors : list_of_errors option;
      [@ocaml.doc
        "Page-level errors that the system detected while processing the input document. The field \
         is empty if the system encountered no errors.\n"]
  blocks : list_of_blocks option;
      [@ocaml.doc
        "Information about each block of text in the input document. Blocks are nested. A page \
         block contains a block for each line of text, which contains a block for each word. \n\n\
        \ The [Block] content for a Word input document does not include a [Geometry] field.\n\
        \ \n\
        \  The [Block] field is not present in the response for plain-text inputs.\n\
        \  "]
  document_type : list_of_document_type option;
      [@ocaml.doc
        "The document type for each page in the input document. This field is present in the \
         response only if your request used the [Byte] parameter. \n"]
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Information about the document, discovered during text extraction. This field is present \
         in the response only if your request used the [Byte] parameter. \n"]
  entities : list_of_entities option;
      [@ocaml.doc
        "A collection of entities identified in the input text. For each entity, the response \
         provides the entity text, entity type, where the entity text begins and ends, and the \
         level of confidence that Amazon Comprehend has in the detection. \n\n\
        \ If your request uses a custom entity recognition model, Amazon Comprehend detects the \
         entities that the model is trained to recognize. Otherwise, it detects the default entity \
         types. For a list of default entity types, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html}Entities} in the \
         Comprehend Developer Guide. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detect_entities_request = {
  document_reader_config : document_reader_config option;
      [@ocaml.doc
        "Provides configuration parameters to override the default actions for extracting text \
         from PDF documents and image files.\n"]
  bytes : semi_structured_document_blob option;
      [@ocaml.doc
        "This field applies only when you use a custom entity recognition model that was trained \
         with PDF annotations. For other cases, enter your text input in the [Text] field.\n\n\
        \  Use the [Bytes] parameter to input a text, PDF, Word or image file. Using a plain-text \
         file in the [Bytes] parameter is equivelent to using the [Text] parameter (the [Entities] \
         field in the response is identical).\n\
        \ \n\
        \  You can also use the [Bytes] parameter to input an Amazon Textract [DetectDocumentText] \
         or [AnalyzeDocument] output file.\n\
        \  \n\
        \   Provide the input document as a sequence of base64-encoded bytes. If your code uses an \
         Amazon Web Services SDK to detect entities, the SDK may encode the document file bytes \
         for you. \n\
        \   \n\
        \    The maximum length of this field depends on the input document type. For details, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html} Inputs for \
         real-time custom analysis} in the Comprehend Developer Guide. \n\
        \    \n\
        \     If you use the [Bytes] parameter, do not use the [Text] parameter.\n\
        \     "]
  endpoint_arn : entity_recognizer_endpoint_arn option;
      [@ocaml.doc
        "The Amazon Resource Name of an endpoint that is associated with a custom entity \
         recognition model. Provide an endpoint if you want to detect entities by using your own \
         custom model instead of the default model that is used by Amazon Comprehend.\n\n\
        \ If you specify an endpoint, Amazon Comprehend uses the language of your custom model, \
         and it ignores any language code that you provide in your request.\n\
        \ \n\
        \  For information about endpoints, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html}Managing \
         endpoints}.\n\
        \  "]
  language_code : language_code option;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. If your request includes the endpoint for a custom entity \
         recognition model, Amazon Comprehend uses the language of your custom model, and it \
         ignores any language code that you specify here.\n\n\
        \ All input documents must be in the same language.\n\
        \ "]
  text : customer_input_string option;
      [@ocaml.doc
        "A UTF-8 text string. The maximum string size is 100 KB. If you enter text using this \
         parameter, do not use the [Bytes] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_dominant_language_response = {
  languages : list_of_dominant_languages option;
      [@ocaml.doc
        "Array of languages that Amazon Comprehend detected in the input text. The array is sorted \
         in descending order of the score (the dominant language is always the first element in \
         the array).\n\n\
        \ For each language, the response returns the RFC 5646 language code and the level of \
         confidence that Amazon Comprehend has in the accuracy of its inference. For more \
         information about RFC 5646, see {{:https://tools.ietf.org/html/rfc5646}Tags for \
         Identifying Languages} on the {i IETF Tools} web site.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detect_dominant_language_request = {
  text : customer_input_string;
      [@ocaml.doc
        "A UTF-8 text string. The string must contain at least 20 characters. The maximum string \
         size is 100 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_topics_detection_job_response = {
  topics_detection_job_properties : topics_detection_job_properties option;
      [@ocaml.doc "The list of properties for the requested job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_topics_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier assigned by the user to the detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_targeted_sentiment_detection_job_response = {
  targeted_sentiment_detection_job_properties : targeted_sentiment_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with a targeted sentiment detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_targeted_sentiment_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The \
         [StartTargetedSentimentDetectionJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_sentiment_detection_job_response = {
  sentiment_detection_job_properties : sentiment_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with a sentiment detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_sentiment_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The operation returns this \
         identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policy_response = {
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc
        "The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a \
         new revision ID, and it deletes the prior version of the policy.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "The time at which the policy was last modified.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time at which the policy was created.\n"]
  resource_policy : policy option; [@ocaml.doc "The JSON body of the resource-based policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policy_request = {
  resource_arn : comprehend_model_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom model version that has the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_pii_entities_detection_job_response = {
  pii_entities_detection_job_properties : pii_entities_detection_job_properties option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_pii_entities_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The operation returns this \
         identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_key_phrases_detection_job_response = {
  key_phrases_detection_job_properties : key_phrases_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with a key phrases detection job. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_key_phrases_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The \
         [StartKeyPhrasesDetectionJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_flywheel_response = {
  flywheel_properties : flywheel_properties option; [@ocaml.doc "The flywheel properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_flywheel_request = {
  flywheel_arn : comprehend_flywheel_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_flywheel_iteration_response = {
  flywheel_iteration_properties : flywheel_iteration_properties option;
      [@ocaml.doc "The configuration properties of a flywheel iteration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_flywheel_iteration_request = {
  flywheel_iteration_id : flywheel_iteration_id; [@ocaml.doc "\n"]
  flywheel_arn : comprehend_flywheel_arn; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_detection_job_response = {
  events_detection_job_properties : events_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with an event detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_events_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the events detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entity_recognizer_response = {
  entity_recognizer_properties : entity_recognizer_properties option;
      [@ocaml.doc "Describes information associated with an entity recognizer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entity_recognizer_request = {
  entity_recognizer_arn : entity_recognizer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the entity recognizer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entities_detection_job_response = {
  entities_detection_job_properties : entities_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with an entities detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entities_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The \
         [StartEntitiesDetectionJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_response = {
  endpoint_properties : endpoint_properties option;
      [@ocaml.doc "Describes information associated with the specific endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_request = {
  endpoint_arn : comprehend_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the endpoint being described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dominant_language_detection_job_response = {
  dominant_language_detection_job_properties : dominant_language_detection_job_properties option;
      [@ocaml.doc
        "An object that contains the properties associated with a dominant language detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dominant_language_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The \
         [StartDominantLanguageDetectionJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_document_classifier_response = {
  document_classifier_properties : document_classifier_properties option;
      [@ocaml.doc "An object that contains the properties associated with a document classifier.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_document_classifier_request = {
  document_classifier_arn : document_classifier_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the document classifier. The \
         [CreateDocumentClassifier] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_document_classification_job_response = {
  document_classification_job_properties : document_classification_job_properties option;
      [@ocaml.doc
        "An object that describes the properties associated with the document classification job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_document_classification_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend generated for the job. The \
         [StartDocumentClassificationJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_response = {
  dataset_properties : dataset_properties option; [@ocaml.doc "The dataset properties.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_request = {
  dataset_arn : comprehend_dataset_arn; [@ocaml.doc "The ARN of the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc "The revision ID of the policy to delete.\n"]
  resource_arn : comprehend_model_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom model version that has the policy to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_flywheel_response = unit [@@ocaml.doc ""]

type nonrec delete_flywheel_request = {
  flywheel_arn : comprehend_flywheel_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_entity_recognizer_response = unit [@@ocaml.doc ""]

type nonrec delete_entity_recognizer_request = {
  entity_recognizer_arn : entity_recognizer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the entity recognizer.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_endpoint_response = unit [@@ocaml.doc ""]

type nonrec delete_endpoint_request = {
  endpoint_arn : comprehend_endpoint_arn;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the endpoint being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_document_classifier_response = unit [@@ocaml.doc ""]

type nonrec delete_document_classifier_request = {
  document_classifier_arn : document_classifier_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the document classifier. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_augmented_manifests_list_item = {
  document_type : augmented_manifests_document_type_format option;
      [@ocaml.doc
        "The type of augmented manifest. If you don't specify, the default is PlainTextDocument. \n\n\
        \  [PLAIN_TEXT_DOCUMENT] A document type that represents any unicode text that is encoded \
         in UTF-8.\n\
        \ "]
  source_documents_s3_uri : s3_uri option;
      [@ocaml.doc
        "The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest \
         file.\n"]
  annotation_data_s3_uri : s3_uri option;
      [@ocaml.doc
        "The S3 prefix to the annotation files that are referred in the augmented manifest file.\n"]
  s3_uri : s3_uri; [@ocaml.doc "The Amazon S3 location of the augmented manifest file.\n"]
  attribute_names : attribute_names_list;
      [@ocaml.doc
        "The JSON attribute that contains the annotations for your training documents. The number \
         of attribute names that you specify depends on whether your augmented manifest file is \
         the output of a single labeling job or a chained labeling job.\n\n\
        \ If your file is the output of a single labeling job, specify the LabelAttributeName key \
         that was used when the job was created in Ground Truth.\n\
        \ \n\
        \  If your file is the output of a chained labeling job, specify the LabelAttributeName \
         key for one or more jobs in the chain. Each LabelAttributeName key provides the \
         annotations from an individual job.\n\
        \  "]
}
[@@ocaml.doc
  "An augmented manifest file that provides training data for your custom model. An augmented \
   manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.\n"]

type nonrec dataset_augmented_manifests_list = dataset_augmented_manifests_list_item list
[@@ocaml.doc ""]

type nonrec dataset_data_format =
  | AUGMENTED_MANIFEST [@ocaml.doc ""]
  | COMPREHEND_CSV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_document_classifier_input_data_config = {
  label_delimiter : label_delimiter option;
      [@ocaml.doc
        "Indicates the delimiter used to separate each label for training a multi-label \
         classifier. The default delimiter between labels is a pipe (|). You can use a different \
         character as a delimiter (if it's an allowed character) by specifying it under Delimiter \
         for labels. If the training documents use a delimiter other than the default or the \
         delimiter you specify, the labels on that line will be combined to make a single unique \
         label, such as LABELLABELLABEL.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        "The Amazon S3 URI for the input data. The S3 bucket must be in the same Region as the API \
         endpoint that you are calling. The URI can point to a single input file or it can provide \
         the prefix for a collection of input files.\n\n\
        \ For example, if you use the URI [S3://bucketName/prefix], if the prefix is a single \
         file, Amazon Comprehend uses that file as input. If more than one file begins with the \
         prefix, Amazon Comprehend uses all of them as input.\n\
        \ \n\
        \  This parameter is required if you set [DataFormat] to [COMPREHEND_CSV].\n\
        \  "]
}
[@@ocaml.doc
  "Describes the dataset input data configuration for a document classifier model.\n\n\
  \ For more information on how the input file is formatted, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html}Preparing \
   training data} in the Comprehend Developer Guide. \n\
  \ "]

type nonrec dataset_entity_recognizer_annotations = {
  s3_uri : s3_uri;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the training documents for an entity recognizer \
         are located. The URI must be in the same Region as the API endpoint that you are calling.\n"]
}
[@@ocaml.doc "Describes the annotations associated with a entity recognizer.\n"]

type nonrec dataset_entity_recognizer_documents = {
  input_format : input_format option;
      [@ocaml.doc
        " Specifies how the text in an input file should be processed. This is optional, and the \
         default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate \
         document. Use this option when you are processing large documents, such as newspaper \
         articles or scientific papers. ONE_DOC_PER_LINE - Each line in a file is considered a \
         separate document. Use this option when you are processing many short documents, such as \
         text messages.\n"]
  s3_uri : s3_uri;
      [@ocaml.doc
        " Specifies the Amazon S3 location where the documents for the dataset are located. \n"]
}
[@@ocaml.doc "Describes the documents submitted with a dataset for an entity recognizer model.\n"]

type nonrec dataset_entity_recognizer_entity_list = {
  s3_uri : s3_uri;
      [@ocaml.doc "Specifies the Amazon S3 location where the entity list is located.\n"]
}
[@@ocaml.doc
  "Describes the dataset entity list for an entity recognizer model.\n\n\
  \ For more information on how the input file is formatted, see \
   {{:https://docs.aws.amazon.com/comprehend/latest/dg/prep-training-data-cer.html}Preparing \
   training data} in the Comprehend Developer Guide. \n\
  \ "]

type nonrec dataset_entity_recognizer_input_data_config = {
  entity_list : dataset_entity_recognizer_entity_list option;
      [@ocaml.doc "The S3 location of the entity list for your custom entity recognizer.\n"]
  documents : dataset_entity_recognizer_documents;
      [@ocaml.doc
        "The format and location of the training documents for your custom entity recognizer.\n"]
  annotations : dataset_entity_recognizer_annotations option;
      [@ocaml.doc
        "The S3 location of the annotation documents for your custom entity recognizer.\n"]
}
[@@ocaml.doc
  "Specifies the format and location of the input data. You must provide either the [Annotations] \
   parameter or the [EntityList] parameter.\n"]

type nonrec dataset_input_data_config = {
  entity_recognizer_input_data_config : dataset_entity_recognizer_input_data_config option;
      [@ocaml.doc "The input properties for training an entity recognizer model.\n"]
  document_classifier_input_data_config : dataset_document_classifier_input_data_config option;
      [@ocaml.doc
        "The input properties for training a document classifier model. \n\n\
        \ For more information on how the input file is formatted, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html}Preparing \
         training data} in the Comprehend Developer Guide. \n\
        \ "]
  data_format : dataset_data_format option;
      [@ocaml.doc
        " [COMPREHEND_CSV]: The data format is a two-column CSV file, where the first column \
         contains labels and the second column contains documents.\n\n\
        \  [AUGMENTED_MANIFEST]: The data format \n\
        \ "]
  augmented_manifests : dataset_augmented_manifests_list option;
      [@ocaml.doc
        "A list of augmented manifest files that provide training data for your custom model. An \
         augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground \
         Truth. \n"]
}
[@@ocaml.doc "Specifies the format and location of the input data for the dataset.\n"]

type nonrec customer_input_string_list = customer_input_string list [@@ocaml.doc ""]

type nonrec create_flywheel_response = {
  active_model_arn : comprehend_model_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the active model version.\n"]
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec create_flywheel_request = {
  tags : tag_list option; [@ocaml.doc "The tags to associate with this flywheel.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  data_security_config : data_security_config option; [@ocaml.doc "Data security configurations.\n"]
  data_lake_s3_uri : flywheel_s3_uri;
      [@ocaml.doc
        "Enter the S3 location for the data lake. You can specify a new S3 bucket or a new folder \
         of an existing S3 bucket. The flywheel creates the data lake at this location.\n"]
  model_type : model_type option;
      [@ocaml.doc
        "The model type. You need to set [ModelType] if you are creating a flywheel for a new model.\n"]
  task_config : task_config option;
      [@ocaml.doc
        "Configuration about the model associated with the flywheel. You need to set [TaskConfig] \
         if you are creating a flywheel for a new model.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend the \
         permissions required to access the flywheel data in the data lake.\n"]
  active_model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "To associate an existing model with the flywheel, specify the Amazon Resource Number \
         (ARN) of the model version. Do not set [TaskConfig] or [ModelType] if you specify an \
         [ActiveModelArn].\n"]
  flywheel_name : comprehend_arn_name; [@ocaml.doc "Name for the flywheel.\n"]
}
[@@ocaml.doc ""]

type nonrec create_entity_recognizer_response = {
  entity_recognizer_arn : entity_recognizer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the entity recognizer.\n"]
}
[@@ocaml.doc ""]

type nonrec create_entity_recognizer_request = {
  model_policy : policy option;
      [@ocaml.doc
        "The JSON resource-based policy to attach to your custom entity recognizer model. You can \
         use this policy to allow another Amazon Web Services account to import your custom \
         model.\n\n\
        \ Provide your JSON as a UTF-8 encoded string without line breaks. To provide valid JSON \
         for your policy, enclose the attribute names and values in double quotes. If the JSON \
         body is also enclosed in double quotes, then you must escape the double quotes that are \
         inside the policy:\n\
        \ \n\
        \   [\"{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": \\[\\\"value\\\"\\]}\"] \n\
        \  \n\
        \   To avoid escaping quotes, you can use single quotes to enclose the policy and double \
         quotes to enclose the JSON names and values:\n\
        \   \n\
        \     ['{\"attribute\": \"value\", \"attribute\": \\[\"value\"\\]}'] \n\
        \    "]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your custom entity recognizer. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  language_code : language_code;
      [@ocaml.doc
        " You can specify any of the following languages: English (\"en\"), Spanish (\"es\"), \
         French (\"fr\"), Italian (\"it\"), German (\"de\"), or Portuguese (\"pt\"). If you plan \
         to use this entity recognizer with PDF, Word, or image input files, you must specify \
         English as the language. All training documents must be in the same language.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        " A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  input_data_config : entity_recognizer_input_data_config;
      [@ocaml.doc
        "Specifies the format and location of the input data. The S3 bucket containing the input \
         data must be located in the same Region as the entity recognizer being created. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the entity recognizer. A tag is a key-value pair that adds as a \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department. \n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  version_name : version_name option;
      [@ocaml.doc
        "The version name given to the newly created recognizer. Version names can be a maximum of \
         256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The \
         version name must be unique among all models with the same recognizer name in the \
         account/Region.\n"]
  recognizer_name : comprehend_arn_name;
      [@ocaml.doc
        "The name given to the newly created recognizer. Recognizer names can be a maximum of 256 \
         characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The \
         name must be unique in the account/Region.\n"]
}
[@@ocaml.doc ""]

type nonrec create_endpoint_response = {
  model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the model to which the endpoint is attached.\n"]
  endpoint_arn : comprehend_endpoint_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the endpoint being created.\n"]
}
[@@ocaml.doc ""]

type nonrec comprehend_endpoint_name = string [@@ocaml.doc ""]

type nonrec create_endpoint_request = {
  flywheel_arn : comprehend_flywheel_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the flywheel to which the endpoint will be attached.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to trained custom models encrypted with a customer managed key (ModelKmsKeyId).\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the endpoint. A tag is a key-value pair that adds metadata to the \
         endpoint. For example, a tag with \"Sales\" as the key might be added to an endpoint to \
         indicate its use by the sales department. \n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "An idempotency token provided by the customer. If this token matches a previous endpoint \
         creation request, Amazon Comprehend will not return a [ResourceInUseException]. \n"]
  desired_inference_units : inference_units_integer;
      [@ocaml.doc
        " The desired number of inference units to be used by the model using this endpoint. Each \
         inference unit represents of a throughput of 100 characters per second.\n"]
  model_arn : comprehend_model_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the model to which the endpoint will be attached.\n"]
  endpoint_name : comprehend_endpoint_name;
      [@ocaml.doc
        "This is the descriptive suffix that becomes part of the [EndpointArn] used for all \
         subsequent requests to this resource. \n"]
}
[@@ocaml.doc ""]

type nonrec create_document_classifier_response = {
  document_classifier_arn : document_classifier_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the document classifier.\n"]
}
[@@ocaml.doc ""]

type nonrec create_document_classifier_request = {
  model_policy : policy option;
      [@ocaml.doc
        "The resource-based policy to attach to your custom document classifier model. You can use \
         this policy to allow another Amazon Web Services account to import your custom model.\n\n\
        \ Provide your policy as a JSON body that you enter as a UTF-8 encoded string without line \
         breaks. To provide valid JSON, enclose the attribute names and values in double quotes. \
         If the JSON body is also enclosed in double quotes, then you must escape the double \
         quotes that are inside the policy:\n\
        \ \n\
        \   [\"{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": \\[\\\"value\\\"\\]}\"] \n\
        \  \n\
        \   To avoid escaping quotes, you can use single quotes to enclose the policy and double \
         quotes to enclose the JSON names and values:\n\
        \   \n\
        \     ['{\"attribute\": \"value\", \"attribute\": \\[\"value\"\\]}'] \n\
        \    "]
  model_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The \
         ModelKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  mode : document_classifier_mode option;
      [@ocaml.doc
        "Indicates the mode in which the classifier will be trained. The classifier can be trained \
         in multi-class (single-label) mode or multi-label mode. Multi-class mode identifies a \
         single class label for each document and multi-label mode identifies one or more class \
         labels for each document. Multiple labels for an individual document are separated by a \
         delimiter. The default delimiter between labels is a pipe (|).\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing \
         the resources you are using for your custom classifier. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html}Amazon VPC}. \n"]
  volume_kms_key_id : kms_key_id option;
      [@ocaml.doc
        "ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend \
         uses to encrypt data on the storage volume attached to the ML compute instance(s) that \
         process the analysis job. The VolumeKmsKeyId can be either of the following formats:\n\n\
        \ {ul\n\
        \       {-  KMS Key ID: [\"1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       {-  Amazon Resource Name (ARN) of a KMS Key: \
         [\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the languages supported by \
         Amazon Comprehend. All documents must be in the same language.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  output_data_config : document_classifier_output_data_config option;
      [@ocaml.doc
        "Specifies the location for the output files from a custom classifier job. This parameter \
         is required for a request that creates a native document model.\n"]
  input_data_config : document_classifier_input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to associate with the document classifier. A tag is a key-value pair that adds as a \
         metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as \
         the key might be added to a resource to indicate its use by the sales department. \n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access \
         to your input data.\n"]
  version_name : version_name option;
      [@ocaml.doc
        "The version name given to the newly created classifier. Version names can have a maximum \
         of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. \
         The version name must be unique among all models with the same classifier name in the \
         Amazon Web Services account/Amazon Web Services Region.\n"]
  document_classifier_name : comprehend_arn_name;
      [@ocaml.doc "The name of the document classifier.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_response = {
  dataset_arn : comprehend_dataset_arn option; [@ocaml.doc "The ARN of the dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_request = {
  tags : tag_list option; [@ocaml.doc "Tags for the dataset.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend generates one.\n"]
  input_data_config : dataset_input_data_config;
      [@ocaml.doc
        "Information about the input data configuration. The type of input data varies based on \
         the format of the input and whether the data is for a classifier model or an entity \
         recognition model.\n"]
  description : description option; [@ocaml.doc "Description of the dataset.\n"]
  dataset_type : dataset_type option;
      [@ocaml.doc
        "The dataset type. You can specify that the data in a dataset is for training the model or \
         for testing the model.\n"]
  dataset_name : comprehend_arn_name; [@ocaml.doc "Name of the dataset.\n"]
  flywheel_arn : comprehend_flywheel_arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the flywheel of the flywheel to receive the data.\n"]
}
[@@ocaml.doc ""]

type nonrec contains_pii_entities_response = {
  labels : list_of_entity_labels option;
      [@ocaml.doc
        "The labels used in the document being analyzed. Individual labels represent personally \
         identifiable information (PII) entity types.\n"]
}
[@@ocaml.doc ""]

type nonrec contains_pii_entities_request = {
  language_code : language_code; [@ocaml.doc "The language of the input documents.\n"]
  text : string_; [@ocaml.doc "A UTF-8 text string. The maximum string size is 100 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec classify_document_response = {
  warnings : list_of_warnings option;
      [@ocaml.doc
        "Warnings detected while processing the input document. The response includes a warning if \
         there is a mismatch between the input document type and the model type associated with \
         the endpoint that you specified. The response can also include warnings for individual \
         pages that have a mismatch. \n\n\
        \ The field is empty if the system generated no warnings.\n\
        \ "]
  errors : list_of_errors option;
      [@ocaml.doc
        "Page-level errors that the system detected while processing the input document. The field \
         is empty if the system encountered no errors.\n"]
  document_type : list_of_document_type option;
      [@ocaml.doc
        "The document type for each page in the input document. This field is present in the \
         response only if your request includes the [Byte] parameter. \n"]
  document_metadata : document_metadata option;
      [@ocaml.doc
        "Extraction information about the document. This field is present in the response only if \
         your request includes the [Byte] parameter. \n"]
  labels : list_of_labels option;
      [@ocaml.doc
        "The labels used in the document being analyzed. These are used for multi-label trained \
         models. Individual labels represent different categories that are related in some manner \
         and are not mutually exclusive. For example, a movie can be just an action movie, or it \
         can be an action movie, a science fiction movie, and a comedy, all at the same time. \n"]
  classes : list_of_classes option;
      [@ocaml.doc
        "The classes used by the document being analyzed. These are used for models trained in \
         multi-class mode. Individual classes are mutually exclusive and each document is expected \
         to have only a single class assigned to it. For example, an animal can be a dog or a cat, \
         but not both at the same time. \n\n\
        \ For prompt safety classification, the response includes only two classes (SAFE_PROMPT \
         and UNSAFE_PROMPT), along with a confidence score for each class. The value range of the \
         score is zero to one, where one is the highest confidence.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec classify_document_request = {
  document_reader_config : document_reader_config option;
      [@ocaml.doc
        "Provides configuration parameters to override the default actions for extracting text \
         from PDF documents and image files.\n"]
  bytes : semi_structured_document_blob option;
      [@ocaml.doc
        "Use the [Bytes] parameter to input a text, PDF, Word or image file.\n\n\
        \ When you classify a document using a custom model, you can also use the [Bytes] \
         parameter to input an Amazon Textract [DetectDocumentText] or [AnalyzeDocument] output \
         file.\n\
        \ \n\
        \  To classify a document using the prompt safety classifier, use the [Text] parameter for \
         input.\n\
        \  \n\
        \   Provide the input document as a sequence of base64-encoded bytes. If your code uses an \
         Amazon Web Services SDK to classify documents, the SDK may encode the document file bytes \
         for you. \n\
        \   \n\
        \    The maximum length of this field depends on the input document type. For details, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html} Inputs for \
         real-time custom analysis} in the Comprehend Developer Guide. \n\
        \    \n\
        \     If you use the [Bytes] parameter, do not use the [Text] parameter.\n\
        \     "]
  endpoint_arn : document_classifier_endpoint_arn;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the endpoint. \n\n\
        \ For prompt safety classification, Amazon Comprehend provides the endpoint ARN. For more \
         information about prompt safety classifiers, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/trust-safety.html#prompt-classification}Prompt \
         safety classification} in the {i Amazon Comprehend Developer Guide} \n\
        \ \n\
        \  For custom classification, you create an endpoint for your custom model. For more \
         information, see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/using-endpoints.html}Using Amazon \
         Comprehend endpoints}.\n\
        \  "]
  text : customer_input_string option;
      [@ocaml.doc
        "The document text to be analyzed. If you enter text using this parameter, do not use the \
         [Bytes] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_size_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The number of documents in the request exceeds the limit of 25. Try your request again with \
   fewer documents.\n"]

type nonrec batch_item_error = {
  error_message : string_ option; [@ocaml.doc "A text description of the error.\n"]
  error_code : string_ option; [@ocaml.doc "The numeric error code of the error.\n"]
  index : integer option; [@ocaml.doc "The zero-based index of the document in the input list.\n"]
}
[@@ocaml.doc
  "Describes an error that occurred while processing a document in a batch. The operation returns \
   on [BatchItemError] object for each document that contained an error.\n"]

type nonrec batch_item_error_list = batch_item_error list [@@ocaml.doc ""]

type nonrec batch_detect_targeted_sentiment_response = {
  error_list : batch_item_error_list; [@ocaml.doc "List of errors that the operation can return.\n"]
  result_list : list_of_detect_targeted_sentiment_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_targeted_sentiment_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. Currently, English is the only supported language.\n"]
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. The maximum size of each document is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_syntax_response = {
  error_list : batch_item_error_list;
      [@ocaml.doc
        "A list containing one object for each document that contained an error. The results are \
         sorted in ascending order by the [Index] field and match the order of the documents in \
         the input list. If there are no errors in the batch, the [ErrorList] is empty.\n"]
  result_list : list_of_detect_syntax_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_syntax_request = {
  language_code : syntax_language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the following languages \
         supported by Amazon Comprehend: German (\"de\"), English (\"en\"), Spanish (\"es\"), \
         French (\"fr\"), Italian (\"it\"), or Portuguese (\"pt\"). All documents must be in the \
         same language.\n"]
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. The maximum size for each document is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_sentiment_response = {
  error_list : batch_item_error_list;
      [@ocaml.doc
        "A list containing one object for each document that contained an error. The results are \
         sorted in ascending order by the [Index] field and match the order of the documents in \
         the input list. If there are no errors in the batch, the [ErrorList] is empty.\n"]
  result_list : list_of_detect_sentiment_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_sentiment_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. The maximum size of each document is 5 KB. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_key_phrases_response = {
  error_list : batch_item_error_list;
      [@ocaml.doc
        "A list containing one object for each document that contained an error. The results are \
         sorted in ascending order by the [Index] field and match the order of the documents in \
         the input list. If there are no errors in the batch, the [ErrorList] is empty.\n"]
  result_list : list_of_detect_key_phrases_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_key_phrases_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. The maximum size of each document is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_entities_response = {
  error_list : batch_item_error_list;
      [@ocaml.doc
        "A list containing one object for each document that contained an error. The results are \
         sorted in ascending order by the [Index] field and match the order of the documents in \
         the input list. If there are no errors in the batch, the [ErrorList] is empty.\n"]
  result_list : list_of_detect_entities_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_entities_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. You can specify any of the primary languages \
         supported by Amazon Comprehend. All documents must be in the same language.\n"]
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. The maximum size of each document is 5 KB.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_dominant_language_response = {
  error_list : batch_item_error_list;
      [@ocaml.doc
        "A list containing one object for each document that contained an error. The results are \
         sorted in ascending order by the [Index] field and match the order of the documents in \
         the input list. If there are no errors in the batch, the [ErrorList] is empty.\n"]
  result_list : list_of_detect_dominant_language_result;
      [@ocaml.doc
        "A list of objects containing the results of the operation. The results are sorted in \
         ascending order by the [Index] field and match the order of the documents in the input \
         list. If all of the documents contain an error, the [ResultList] is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_detect_dominant_language_request = {
  text_list : customer_input_string_list;
      [@ocaml.doc
        "A list containing the UTF-8 encoded text of the input documents. The list can contain a \
         maximum of 25 documents. Each document should contain at least 20 characters. The maximum \
         size of each document is 5 KB.\n"]
}
[@@ocaml.doc ""]
