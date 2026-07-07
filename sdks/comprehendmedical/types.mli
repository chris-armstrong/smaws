type nonrec string_ = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The filter that you specified for the operation is invalid. Check the filter values that you \
   entered and try your request again.\n"]

type nonrec entity_type =
  | BEHAVIORAL_ENVIRONMENTAL_SOCIAL [@ocaml.doc ""]
  | TIME_EXPRESSION [@ocaml.doc ""]
  | ANATOMY [@ocaml.doc ""]
  | TEST_TREATMENT_PROCEDURE [@ocaml.doc ""]
  | PROTECTED_HEALTH_INFORMATION [@ocaml.doc ""]
  | MEDICAL_CONDITION [@ocaml.doc ""]
  | MEDICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_sub_type =
  | REC_DRUG_USE [@ocaml.doc ""]
  | ALCOHOL_CONSUMPTION [@ocaml.doc ""]
  | TOBACCO_USE [@ocaml.doc ""]
  | ALLERGIES [@ocaml.doc ""]
  | RACE_ETHNICITY [@ocaml.doc ""]
  | GENDER [@ocaml.doc ""]
  | AMOUNT [@ocaml.doc ""]
  | TIME_TO_TREATMENT_NAME [@ocaml.doc ""]
  | TIME_TO_PROCEDURE_NAME [@ocaml.doc ""]
  | TIME_TO_TEST_NAME [@ocaml.doc ""]
  | TIME_TO_DX_NAME [@ocaml.doc ""]
  | TIME_TO_MEDICATION_NAME [@ocaml.doc ""]
  | TIME_EXPRESSION [@ocaml.doc ""]
  | QUANTITY [@ocaml.doc ""]
  | QUALITY [@ocaml.doc ""]
  | DIRECTION [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | PROFESSION [@ocaml.doc ""]
  | ADDRESS [@ocaml.doc ""]
  | URL [@ocaml.doc ""]
  | ID [@ocaml.doc ""]
  | IDENTIFIER [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | PHONE_OR_FAX [@ocaml.doc ""]
  | CONTACT_POINT [@ocaml.doc ""]
  | AGE [@ocaml.doc ""]
  | DATE [@ocaml.doc ""]
  | TREATMENT_NAME [@ocaml.doc ""]
  | PROCEDURE_NAME [@ocaml.doc ""]
  | TEST_UNIT [@ocaml.doc ""]
  | TEST_UNITS [@ocaml.doc ""]
  | TEST_VALUE [@ocaml.doc ""]
  | TEST_NAME [@ocaml.doc ""]
  | ACUITY [@ocaml.doc ""]
  | RATE [@ocaml.doc ""]
  | STRENGTH [@ocaml.doc ""]
  | BRAND_NAME [@ocaml.doc ""]
  | GENERIC_NAME [@ocaml.doc ""]
  | DURATION [@ocaml.doc ""]
  | FREQUENCY [@ocaml.doc ""]
  | FORM [@ocaml.doc ""]
  | ROUTE_OR_MODE [@ocaml.doc ""]
  | DOSAGE [@ocaml.doc ""]
  | DX_NAME [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec relationship_type =
  | QUALITY [@ocaml.doc ""]
  | USAGE [@ocaml.doc ""]
  | AMOUNT [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | DIRECTION [@ocaml.doc ""]
  | TEST_UNIT [@ocaml.doc ""]
  | TEST_UNITS [@ocaml.doc ""]
  | TEST_VALUE [@ocaml.doc ""]
  | ACUITY [@ocaml.doc ""]
  | RATE [@ocaml.doc ""]
  | STRENGTH [@ocaml.doc ""]
  | DURATION [@ocaml.doc ""]
  | FREQUENCY [@ocaml.doc ""]
  | FORM [@ocaml.doc ""]
  | ROUTE_OR_MODE [@ocaml.doc ""]
  | DOSAGE [@ocaml.doc ""]
  | OVERLAP [@ocaml.doc ""]
  | NEGATIVE [@ocaml.doc ""]
  | FOR [@ocaml.doc ""]
  | ADMINISTERED_VIA [@ocaml.doc ""]
  | WITH_DOSAGE [@ocaml.doc ""]
  | EVERY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec attribute_name =
  | FUTURE [@ocaml.doc ""]
  | PAST_HISTORY [@ocaml.doc ""]
  | LOW_CONFIDENCE [@ocaml.doc ""]
  | HYPOTHETICAL [@ocaml.doc ""]
  | PERTAINS_TO_FAMILY [@ocaml.doc ""]
  | NEGATION [@ocaml.doc ""]
  | DIAGNOSIS [@ocaml.doc ""]
  | SYMPTOM [@ocaml.doc ""]
  | SIGN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec trait = {
  score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has in the accuracy of this trait.\n"]
  name : attribute_name option;
      [@ocaml.doc " Provides a name or contextual description about the trait. \n"]
}
[@@ocaml.doc " Provides contextual information about the extracted entity. \n"]

type nonrec trait_list = trait list [@@ocaml.doc ""]

type nonrec attribute = {
  traits : trait_list option; [@ocaml.doc " Contextual information for this attribute. \n"]
  category : entity_type option; [@ocaml.doc " The category of attribute. \n"]
  text : string_ option; [@ocaml.doc " The segment of input text extracted as this attribute.\n"]
  end_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the attribute ends. The \
         offset returns the UTF-8 code point in the string.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the attribute begins. \
         The offset returns the UTF-8 code point in the string. \n"]
  id : integer option;
      [@ocaml.doc
        " The numeric identifier for this attribute. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier. \n"]
  relationship_type : relationship_type option;
      [@ocaml.doc
        "The type of relationship between the entity and attribute. Type for the relationship is \
         [OVERLAP], indicating that the entity occurred at the same time as the [Date_Expression]. \n"]
  relationship_score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has that this attribute is \
         correctly related to this entity. \n"]
  score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has that the segment of text is \
         correctly recognized as an attribute. \n"]
  type_ : entity_sub_type option; [@ocaml.doc " The type of attribute. \n"]
}
[@@ocaml.doc
  " An extracted segment of the text that is an attribute of an entity, or otherwise related to an \
   entity, such as the dosage of a medication taken. It contains information about the attribute \
   such as id, begin and end offset within the input text, and the segment of the input text. \n"]

type nonrec unmapped_attribute = {
  attribute : attribute option;
      [@ocaml.doc " The specific attribute that has been extracted but not mapped to an entity. \n"]
  type_ : entity_type option;
      [@ocaml.doc
        " The type of the unmapped attribute, could be one of the following values: \
         \"MEDICATION\", \"MEDICAL_CONDITION\", \"ANATOMY\", \"TEST_AND_TREATMENT_PROCEDURE\" or \
         \"PROTECTED_HEALTH_INFORMATION\". \n"]
}
[@@ocaml.doc
  "An attribute that was extracted, but Amazon Comprehend Medical was unable to relate to an \
   entity. \n"]

type nonrec unmapped_attribute_list = unmapped_attribute list [@@ocaml.doc ""]

type nonrec too_many_requests_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " You have made too many requests within a short period of time. Wait for a short time and then \
   try your request again. Contact customer support for more information about a service limit \
   increase. \n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec text_size_limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The size of the text you submitted exceeds the size limit. Reduce the size of the text or use \
   a smaller document and then retry your request. \n"]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec stop_snomedct_inference_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        " The identifier generated for the job. To get the status of job, use this identifier with \
         the DescribeSNOMEDCTInferenceJob operation. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_snomedct_inference_job_request = {
  job_id : job_id; [@ocaml.doc " The job id of the asynchronous InferSNOMEDCT job to be stopped. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource identified by the specified Amazon Resource Name (ARN) was not found. Check the \
   ARN and try your request again.\n"]

type nonrec invalid_request_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The request that you made is invalid. Check your request to determine why it's invalid and \
   then retry the request.\n"]

type nonrec internal_server_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc " An internal server error occurred. Retry your request. \n"]

type nonrec stop_rx_norm_inference_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of job, use this identifier with \
         the [DescribeRxNormInferenceJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_rx_norm_inference_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_phi_detection_job_response = {
  job_id : job_id option; [@ocaml.doc "The identifier of the PHI detection job that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_phi_detection_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the PHI detection job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_icd10cm_inference_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of job, use this identifier with \
         the [DescribeICD10CMInferenceJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_icd10cm_inference_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_entities_detection_v2_job_response = {
  job_id : job_id option;
      [@ocaml.doc "The identifier of the medical entities detection job that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_entities_detection_v2_job_request = {
  job_id : job_id; [@ocaml.doc "The identifier of the medical entities job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec start_snomedct_inference_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        " The identifier generated for the job. To get the status of a job, use this identifier \
         with the StartSNOMEDCTInferenceJob operation. \n"]
}
[@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec input_data_config = {
  s3_key : s3_key option; [@ocaml.doc "The path to the input data files in the S3 bucket.\n"]
  s3_bucket : s3_bucket;
      [@ocaml.doc
        "The URI of the S3 bucket that contains the input data. The bucket must be in the same \
         region as the API endpoint that you are calling.\n"]
}
[@@ocaml.doc
  "The input properties for an entities detection job. This includes the name of the S3 bucket and \
   the path to the files to be analyzed. \n"]

type nonrec output_data_config = {
  s3_key : s3_key option;
      [@ocaml.doc
        "The path to the output data files in the S3 bucket. Amazon Comprehend Medical creates an \
         output directory using the job ID so that the output from one job does not overwrite the \
         output of another.\n"]
  s3_bucket : s3_bucket;
      [@ocaml.doc
        "When you use the [OutputDataConfig] object with asynchronous operations, you specify the \
         Amazon S3 location where you want to write the output data. The URI must be in the same \
         region as the API endpoint that you are calling. The location is used as the prefix for \
         the actual location of the output.\n"]
}
[@@ocaml.doc "The output properties for a detection job.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec job_name = string [@@ocaml.doc ""]

type nonrec client_request_token_string = string [@@ocaml.doc ""]

type nonrec kms_key = string [@@ocaml.doc ""]

type nonrec language_code = EN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec start_snomedct_inference_job_request = {
  language_code : language_code;
      [@ocaml.doc
        " The language of the input documents. All documents must be in the same language. \n"]
  kms_key : kms_key option;
      [@ocaml.doc
        " An AWS Key Management Service key used to encrypt your output files. If you do not \
         specify a key, the files are written in plain text. \n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        " A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend Medical generates one. \n"]
  job_name : job_name option;
      [@ocaml.doc " The user generated name the asynchronous InferSNOMEDCT job. \n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         grants Amazon Comprehend Medical read access to your input data. \n"]
  output_data_config : output_data_config; [@ocaml.doc ""]
  input_data_config : input_data_config; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_rx_norm_inference_job_response = {
  job_id : job_id option; [@ocaml.doc "The identifier of the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_rx_norm_inference_job_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. All documents must be in the same language.\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "An AWS Key Management Service key to encrypt your output files. If you do not specify a \
         key, the files are written in plain text.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend Medical generates one.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         grants Amazon Comprehend Medical read access to your input data. For more information, \
         see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med} \
         Role-Based Permissions Required for Asynchronous Operations}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_phi_detection_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the [DescribePHIDetectionJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_phi_detection_job_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. All documents must be in the same language.\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "An AWS Key Management Service key to encrypt your output files. If you do not specify a \
         key, the files are written in plain text.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend Medical generates one.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         grants Amazon Comprehend Medical read access to your input data. For more information, \
         see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med} \
         Role-Based Permissions Required for Asynchronous Operations}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_icd10cm_inference_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the [StartICD10CMInferenceJob] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_icd10cm_inference_job_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. All documents must be in the same language.\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "An AWS Key Management Service key to encrypt your output files. If you do not specify a \
         key, the files are written in plain text.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend Medical generates one.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         grants Amazon Comprehend Medical read access to your input data. For more information, \
         see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med} \
         Role-Based Permissions Required for Asynchronous Operations}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "Specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc "Specifies the format and location of the input data for the job.\n"]
}
[@@ocaml.doc ""]

type nonrec start_entities_detection_v2_job_response = {
  job_id : job_id option;
      [@ocaml.doc
        "The identifier generated for the job. To get the status of a job, use this identifier \
         with the [DescribeEntitiesDetectionV2Job] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_entities_detection_v2_job_request = {
  language_code : language_code;
      [@ocaml.doc
        "The language of the input documents. All documents must be in the same language. Amazon \
         Comprehend Medical processes files in US English (en).\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "An AWS Key Management Service key to encrypt your output files. If you do not specify a \
         key, the files are written in plain text.\n"]
  client_request_token : client_request_token_string option;
      [@ocaml.doc
        "A unique identifier for the request. If you don't set the client request token, Amazon \
         Comprehend Medical generates one for you.\n"]
  job_name : job_name option; [@ocaml.doc "The identifier of the job.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that \
         grants Amazon Comprehend Medical read access to your input data. For more information, \
         see \
         {{:https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med}Role-Based \
         Permissions Required for Asynchronous Operations}.\n"]
  output_data_config : output_data_config;
      [@ocaml.doc "The output configuration that specifies where to send the output files.\n"]
  input_data_config : input_data_config;
      [@ocaml.doc
        "The input configuration that specifies the format and location of the input data for the \
         job.\n"]
}
[@@ocaml.doc ""]

type nonrec service_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The Amazon Comprehend Medical service is temporarily unavailable. Please wait and then retry \
   your request. \n"]

type nonrec snomedct_trait_name =
  | FUTURE [@ocaml.doc ""]
  | PAST_HISTORY [@ocaml.doc ""]
  | LOW_CONFIDENCE [@ocaml.doc ""]
  | HYPOTHETICAL [@ocaml.doc ""]
  | PERTAINS_TO_FAMILY [@ocaml.doc ""]
  | SYMPTOM [@ocaml.doc ""]
  | SIGN [@ocaml.doc ""]
  | DIAGNOSIS [@ocaml.doc ""]
  | NEGATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snomedct_trait = {
  score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has in the accuracy of a detected \
         trait. \n"]
  name : snomedct_trait_name option;
      [@ocaml.doc " The name or contextual description of a detected trait. \n"]
}
[@@ocaml.doc " Contextual information for an entity. \n"]

type nonrec snomedct_trait_list = snomedct_trait list [@@ocaml.doc ""]

type nonrec snomedct_relationship_type =
  | TEST_UNIT [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | DIRECTION [@ocaml.doc ""]
  | TEST_UNITS [@ocaml.doc ""]
  | TEST_VALUE [@ocaml.doc ""]
  | QUALITY [@ocaml.doc ""]
  | ACUITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snomedct_entity_type =
  | TREATMENT_NAME [@ocaml.doc ""]
  | PROCEDURE_NAME [@ocaml.doc ""]
  | TEST_NAME [@ocaml.doc ""]
  | DX_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ontology_linking_bounded_length_string = string [@@ocaml.doc ""]

type nonrec snomedct_entity_category =
  | TEST_TREATMENT_PROCEDURE [@ocaml.doc ""]
  | ANATOMY [@ocaml.doc ""]
  | MEDICAL_CONDITION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snomedct_attribute_type =
  | TEST_UNIT [@ocaml.doc ""]
  | TEST_VALUE [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | DIRECTION [@ocaml.doc ""]
  | QUALITY [@ocaml.doc ""]
  | ACUITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snomedct_concept = {
  score : float_ option;
      [@ocaml.doc
        " The level of confidence Amazon Comprehend Medical has that the entity should be linked \
         to the identified SNOMED-CT concept. \n"]
  code : string_ option; [@ocaml.doc " The numeric ID for the SNOMED-CT concept. \n"]
  description : string_ option; [@ocaml.doc " The description of the SNOMED-CT concept. \n"]
}
[@@ocaml.doc
  " The SNOMED-CT concepts that the entity could refer to, along with a score indicating the \
   likelihood of the match. \n"]

type nonrec snomedct_concept_list = snomedct_concept list [@@ocaml.doc ""]

type nonrec snomedct_attribute = {
  snomedct_concepts : snomedct_concept_list option;
      [@ocaml.doc
        " The SNOMED-CT concepts specific to an attribute, along with a score indicating the \
         likelihood of the match. \n"]
  traits : snomedct_trait_list option;
      [@ocaml.doc
        " Contextual information for an attribute. Examples include signs, symptoms, diagnosis, \
         and negation. \n"]
  text : string_ option; [@ocaml.doc " The segment of input text extracted as this attribute. \n"]
  end_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the attribute ends. The \
         offset returns the UTF-8 code point in the string. \n"]
  begin_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the attribute begins. \
         The offset returns the UTF-8 code point in the string. \n"]
  id : integer option;
      [@ocaml.doc
        " The numeric identifier for this attribute. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier. \n"]
  relationship_type : snomedct_relationship_type option;
      [@ocaml.doc
        " The type of relationship that exists between the entity and the related attribute. \n"]
  relationship_score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has that this attribute is \
         correctly related to this entity. \n"]
  score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has that the segment of text is \
         correctly recognized as an attribute. \n"]
  type_ : snomedct_attribute_type option;
      [@ocaml.doc
        " The type of attribute. Possible types include DX_NAME, ACUITY, DIRECTION, \
         SYSTEM_ORGAN_SITE,TEST_NAME, TEST_VALUE, TEST_UNIT, PROCEDURE_NAME, and TREATMENT_NAME. \n"]
  category : snomedct_entity_category option;
      [@ocaml.doc
        " The category of the detected attribute. Possible categories include MEDICAL_CONDITION, \
         ANATOMY, and TEST_TREATMENT_PROCEDURE. \n"]
}
[@@ocaml.doc
  " The extracted attributes that relate to an entity. An extracted segment of the text that is an \
   attribute of an entity, or otherwise related to an entity, such as the dosage of a medication \
   taken. \n"]

type nonrec snomedct_attribute_list = snomedct_attribute list [@@ocaml.doc ""]

type nonrec snomedct_entity = {
  snomedct_concepts : snomedct_concept_list option;
      [@ocaml.doc
        " The SNOMED concepts that the entity could refer to, along with a score indicating the \
         likelihood of the match. \n"]
  traits : snomedct_trait_list option; [@ocaml.doc " Contextual information for the entity. \n"]
  attributes : snomedct_attribute_list option;
      [@ocaml.doc
        " An extracted segment of the text that is an attribute of an entity, or otherwise related \
         to an entity, such as the dosage of a medication taken. \n"]
  end_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the entity ends. The \
         offset returns the UTF-8 code point in the string. \n"]
  begin_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the entity begins. The \
         offset returns the UTF-8 code point in the string. \n"]
  score : float_ option;
      [@ocaml.doc
        " The level of confidence that Amazon Comprehend Medical has in the accuracy of the \
         detected entity. \n"]
  type_ : snomedct_entity_type option;
      [@ocaml.doc
        " Describes the specific type of entity with category of entities. Possible types include \
         DX_NAME, ACUITY, DIRECTION, SYSTEM_ORGAN_SITE, TEST_NAME, TEST_VALUE, TEST_UNIT, \
         PROCEDURE_NAME, or TREATMENT_NAME. \n"]
  category : snomedct_entity_category option;
      [@ocaml.doc
        " The category of the detected entity. Possible categories are MEDICAL_CONDITION, ANATOMY, \
         or TEST_TREATMENT_PROCEDURE. \n"]
  text : ontology_linking_bounded_length_string option;
      [@ocaml.doc " The segment of input text extracted as this entity. \n"]
  id : integer option;
      [@ocaml.doc
        " The numeric identifier for the entity. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier. \n"]
}
[@@ocaml.doc
  " The collection of medical entities extracted from the input text and their associated \
   information. For each entity, the response provides the entity text, the entity category, where \
   the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has \
   in the detection and analysis. Attributes and traits of the entity are also returned. \n"]

type nonrec snomedct_entity_list = snomedct_entity list [@@ocaml.doc ""]

type nonrec snomedct_details = {
  version_date : string_ option; [@ocaml.doc " The version date of the SNOMED-CT ontology used. \n"]
  language : string_ option;
      [@ocaml.doc
        " The language used in the SNOMED-CT ontology. All Amazon Comprehend Medical operations \
         are US English (en). \n"]
  edition : string_ option;
      [@ocaml.doc
        " The edition of SNOMED-CT used. The edition used for the InferSNOMEDCT editions is the US \
         edition. \n"]
}
[@@ocaml.doc
  " The information about the revision of the SNOMED-CT ontology in the response. Specifically, \
   the details include the SNOMED-CT edition, language, and version date. \n"]

type nonrec rx_norm_trait_name = PAST_HISTORY [@ocaml.doc ""] | NEGATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rx_norm_trait = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has in the accuracy of the \
         detected trait.\n"]
  name : rx_norm_trait_name option;
      [@ocaml.doc "Provides a name or contextual description about the trait.\n"]
}
[@@ocaml.doc
  "The contextual information for the entity. InferRxNorm recognizes the trait [NEGATION], which \
   is any indication that the patient is not taking a medication. \n"]

type nonrec rx_norm_trait_list = rx_norm_trait list [@@ocaml.doc ""]

type nonrec rx_norm_entity_type = GENERIC_NAME [@ocaml.doc ""] | BRAND_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rx_norm_entity_category = MEDICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rx_norm_attribute_type =
  | STRENGTH [@ocaml.doc ""]
  | ROUTE_OR_MODE [@ocaml.doc ""]
  | RATE [@ocaml.doc ""]
  | FREQUENCY [@ocaml.doc ""]
  | FORM [@ocaml.doc ""]
  | DURATION [@ocaml.doc ""]
  | DOSAGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rx_norm_attribute = {
  traits : rx_norm_trait_list option;
      [@ocaml.doc
        "Contextual information for the attribute. InferRxNorm recognizes the trait [NEGATION] for \
         attributes, i.e. that the patient is not taking a specific dose or form of a medication.\n"]
  text : string_ option;
      [@ocaml.doc "The segment of input text which corresponds to the detected attribute.\n"]
  end_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the attribute ends. The \
         offset returns the UTF-8 code point in the string.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the attribute begins. The \
         offset returns the UTF-8 code point in the string.\n"]
  id : integer option;
      [@ocaml.doc
        "The numeric identifier for this attribute. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier.\n"]
  relationship_score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the attribute is \
         accurately linked to an entity.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the segment of text is \
         correctly recognized as an attribute.\n"]
  type_ : rx_norm_attribute_type option;
      [@ocaml.doc
        "The type of attribute. The types of attributes recognized by InferRxNorm are [BRAND_NAME] \
         and [GENERIC_NAME].\n"]
}
[@@ocaml.doc
  "The extracted attributes that relate to this entity. The attributes recognized by InferRxNorm \
   are [DOSAGE], [DURATION], [FORM], [FREQUENCY], [RATE], [ROUTE_OR_MODE].\n"]

type nonrec rx_norm_attribute_list = rx_norm_attribute list [@@ocaml.doc ""]

type nonrec rx_norm_concept = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the entity is accurately \
         linked to the reported RxNorm concept.\n"]
  code : string_ option; [@ocaml.doc "RxNorm concept ID, also known as the RxCUI.\n"]
  description : string_ option; [@ocaml.doc "The description of the RxNorm concept.\n"]
}
[@@ocaml.doc
  "The RxNorm concept that the entity could refer to, along with a score indicating the likelihood \
   of the match.\n"]

type nonrec rx_norm_concept_list = rx_norm_concept list [@@ocaml.doc ""]

type nonrec rx_norm_entity = {
  rx_norm_concepts : rx_norm_concept_list option;
      [@ocaml.doc
        "The RxNorm concepts that the entity could refer to, along with a score indicating the \
         likelihood of the match.\n"]
  traits : rx_norm_trait_list option; [@ocaml.doc "Contextual information for the entity.\n"]
  attributes : rx_norm_attribute_list option;
      [@ocaml.doc
        "The extracted attributes that relate to the entity. The attributes recognized by \
         InferRxNorm are [DOSAGE], [DURATION], [FORM], [FREQUENCY], [RATE], [ROUTE_OR_MODE], and \
         [STRENGTH].\n"]
  end_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the entity ends. The \
         offset returns the UTF-8 code point in the string.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the entity begins. The \
         offset returns the UTF-8 code point in the string.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has in the accuracy of the \
         detected entity.\n"]
  type_ : rx_norm_entity_type option;
      [@ocaml.doc
        " Describes the specific type of entity. For InferRxNorm, the recognized entity type is \
         [MEDICATION].\n"]
  category : rx_norm_entity_category option;
      [@ocaml.doc
        "The category of the entity. The recognized categories are [GENERIC] or [BRAND_NAME].\n"]
  text : ontology_linking_bounded_length_string option;
      [@ocaml.doc "The segment of input text extracted from which the entity was detected.\n"]
  id : integer option;
      [@ocaml.doc
        "The numeric identifier for the entity. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier.\n"]
}
[@@ocaml.doc
  "The collection of medical entities extracted from the input text and their associated \
   information. For each entity, the response provides the entity text, the entity category, where \
   the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has \
   in the detection and analysis. Attributes and traits of the entity are also returned. \n"]

type nonrec rx_norm_entity_list = rx_norm_entity list [@@ocaml.doc ""]

type nonrec model_version = string [@@ocaml.doc ""]

type nonrec max_results_integer = int [@@ocaml.doc ""]

type nonrec manifest_file_path = string [@@ocaml.doc ""]

type nonrec job_status =
  | STOPPED [@ocaml.doc ""]
  | STOP_REQUESTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PARTIAL_SUCCESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec any_length_string = string [@@ocaml.doc ""]

type nonrec comprehend_medical_async_job_properties = {
  model_version : model_version option;
      [@ocaml.doc
        "The version of the model used to analyze the documents. The version number looks like \
         X.X.X. You can use this information to track the model used for a particular batch of \
         documents.\n"]
  kms_key : kms_key option;
      [@ocaml.doc
        "The AWS Key Management Service key, if any, used to encrypt the output files. \n"]
  manifest_file_path : manifest_file_path option;
      [@ocaml.doc "The path to the file that describes the results of a batch job.\n"]
  data_access_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that gives Amazon Comprehend Medical read access to your \
         input data.\n"]
  language_code : language_code option; [@ocaml.doc "The language code of the input documents.\n"]
  output_data_config : output_data_config option;
      [@ocaml.doc
        "The output data configuration that you supplied when you created the detection job.\n"]
  input_data_config : input_data_config option;
      [@ocaml.doc
        "The input data configuration that you supplied when you created the detection job.\n"]
  expiration_time : timestamp option;
      [@ocaml.doc
        "The date and time that job metadata is deleted from the server. Output files in your S3 \
         bucket will not be deleted. After the metadata is deleted, the job will no longer appear \
         in the results of the [ListEntitiesDetectionV2Job] or the [ListPHIDetectionJobs] \
         operation.\n"]
  end_time : timestamp option; [@ocaml.doc "The time that the detection job completed.\n"]
  submit_time : timestamp option;
      [@ocaml.doc "The time that the detection job was submitted for processing.\n"]
  message : any_length_string option; [@ocaml.doc "A description of the status of a job.\n"]
  job_status : job_status option;
      [@ocaml.doc
        "The current status of the detection job. If the status is [FAILED], the [Message] field \
         shows the reason for the failure.\n"]
  job_name : job_name option; [@ocaml.doc "The name that you assigned to the detection job.\n"]
  job_id : job_id option; [@ocaml.doc "The identifier assigned to the detection job.\n"]
}
[@@ocaml.doc "Provides information about a detection job.\n"]

type nonrec comprehend_medical_async_job_properties_list =
  comprehend_medical_async_job_properties list
[@@ocaml.doc ""]

type nonrec list_snomedct_inference_jobs_response = {
  next_token : string_ option; [@ocaml.doc " Identifies the next page of results to return. \n"]
  comprehend_medical_async_job_properties_list : comprehend_medical_async_job_properties_list option;
      [@ocaml.doc " A list containing the properties of each job that is returned. \n"]
}
[@@ocaml.doc ""]

type nonrec comprehend_medical_async_job_filter = {
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
[@@ocaml.doc "Provides information for filtering a list of detection jobs.\n"]

type nonrec list_snomedct_inference_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc " The maximum number of results to return in each page. The default is 100. \n"]
  next_token : string_ option;
      [@ocaml.doc " Identifies the next page of InferSNOMEDCT results to return. \n"]
  filter : comprehend_medical_async_job_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_rx_norm_inference_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  comprehend_medical_async_job_properties_list : comprehend_medical_async_job_properties_list option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rx_norm_inference_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "Identifies the next page of results to return.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : comprehend_medical_async_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs based on their names, status, or \
         the date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_phi_detection_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  comprehend_medical_async_job_properties_list : comprehend_medical_async_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_phi_detection_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : comprehend_medical_async_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs based on their names, status, or \
         the date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_icd10cm_inference_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  comprehend_medical_async_job_properties_list : comprehend_medical_async_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job that is returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_icd10cm_inference_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : comprehend_medical_async_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs based on their names, status, or \
         the date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_entities_detection_v2_jobs_response = {
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  comprehend_medical_async_job_properties_list : comprehend_medical_async_job_properties_list option;
      [@ocaml.doc "A list containing the properties of each job returned.\n"]
}
[@@ocaml.doc ""]

type nonrec list_entities_detection_v2_jobs_request = {
  max_results : max_results_integer option;
      [@ocaml.doc "The maximum number of results to return in each page. The default is 100.\n"]
  next_token : string_ option; [@ocaml.doc "Identifies the next page of results to return.\n"]
  filter : comprehend_medical_async_job_filter option;
      [@ocaml.doc
        "Filters the jobs that are returned. You can filter jobs based on their names, status, or \
         the date and time that they were submitted. You can only set one filter at a time.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_encoding_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  " The input text was not in valid UTF-8 character encoding. Check your text then retry your \
   request.\n"]

type nonrec characters = {
  original_text_characters : integer option;
      [@ocaml.doc
        " The number of characters present in the input text document as processed by Amazon \
         Comprehend Medical. \n"]
}
[@@ocaml.doc " The number of characters in the input text to be analyzed. \n"]

type nonrec infer_snomedct_response = {
  characters : characters option;
      [@ocaml.doc " The number of characters in the input request documentation. \n"]
  snomedct_details : snomedct_details option;
      [@ocaml.doc
        " The details of the SNOMED-CT revision, including the edition, language, and version date. \n"]
  model_version : string_ option;
      [@ocaml.doc
        " The version of the model used to analyze the documents, in the format n.n.n You can use \
         this information to track the model used for a particular batch of documents. \n"]
  pagination_token : string_ option;
      [@ocaml.doc
        " If the result of the request is truncated, the pagination token can be used to fetch the \
         next page of entities. \n"]
  entities : snomedct_entity_list;
      [@ocaml.doc
        " The collection of medical concept entities extracted from the input text and their \
         associated information. For each entity, the response provides the entity text, the \
         entity category, where the entity text begins and ends, and the level of confidence that \
         Amazon Comprehend Medical has in the detection and analysis. Attributes and traits of the \
         entity are also returned. \n"]
}
[@@ocaml.doc ""]

type nonrec infer_snomedct_request = {
  text : ontology_linking_bounded_length_string;
      [@ocaml.doc "The input text to be analyzed using InferSNOMEDCT.\n"]
}
[@@ocaml.doc ""]

type nonrec infer_rx_norm_response = {
  model_version : string_ option;
      [@ocaml.doc
        "The version of the model used to analyze the documents, in the format {i n}.{i n}.{i n} \
         You can use this information to track the model used for a particular batch of documents.\n"]
  pagination_token : string_ option;
      [@ocaml.doc
        "If the result of the previous request to [InferRxNorm] was truncated, include the \
         [PaginationToken] to fetch the next page of medication entities.\n"]
  entities : rx_norm_entity_list;
      [@ocaml.doc
        "The medication entities detected in the text linked to RxNorm concepts. If the action is \
         successful, the service sends back an HTTP 200 response, as well as the entities detected.\n"]
}
[@@ocaml.doc ""]

type nonrec infer_rx_norm_request = {
  text : ontology_linking_bounded_length_string; [@ocaml.doc "The input text used for analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec icd10cm_entity_category = MEDICAL_CONDITION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec icd10cm_entity_type = TIME_EXPRESSION [@ocaml.doc ""] | DX_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec icd10cm_attribute_type =
  | TIME_EXPRESSION [@ocaml.doc ""]
  | TIME_TO_DX_NAME [@ocaml.doc ""]
  | QUANTITY [@ocaml.doc ""]
  | QUALITY [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | DIRECTION [@ocaml.doc ""]
  | ACUITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec icd10cm_trait_name =
  | LOW_CONFIDENCE [@ocaml.doc ""]
  | HYPOTHETICAL [@ocaml.doc ""]
  | PERTAINS_TO_FAMILY [@ocaml.doc ""]
  | SYMPTOM [@ocaml.doc ""]
  | SIGN [@ocaml.doc ""]
  | DIAGNOSIS [@ocaml.doc ""]
  | NEGATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec icd10cm_trait = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the segment of text is \
         correctly recognized as a trait.\n"]
  name : icd10cm_trait_name option;
      [@ocaml.doc "Provides a name or contextual description about the trait.\n"]
}
[@@ocaml.doc
  "Contextual information for the entity. The traits recognized by InferICD10CM are [DIAGNOSIS], \
   [SIGN], [SYMPTOM], and [NEGATION].\n"]

type nonrec icd10cm_trait_list = icd10cm_trait list [@@ocaml.doc ""]

type nonrec icd10cm_relationship_type =
  | QUALITY [@ocaml.doc ""]
  | SYSTEM_ORGAN_SITE [@ocaml.doc ""]
  | OVERLAP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec icd10cm_attribute = {
  relationship_type : icd10cm_relationship_type option;
      [@ocaml.doc
        "The type of relationship between the entity and attribute. Type for the relationship can \
         be either of [OVERLAP] or [SYSTEM_ORGAN_SITE].\n"]
  category : icd10cm_entity_type option;
      [@ocaml.doc "The category of attribute. Can be either of [DX_NAME] or [TIME_EXPRESSION].\n"]
  traits : icd10cm_trait_list option;
      [@ocaml.doc
        "The contextual information for the attribute. The traits recognized by InferICD10CM are \
         [DIAGNOSIS], [SIGN], [SYMPTOM], and [NEGATION].\n"]
  text : string_ option;
      [@ocaml.doc "The segment of input text which contains the detected attribute.\n"]
  end_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the attribute ends. The \
         offset returns the UTF-8 code point in the string.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the attribute begins. The \
         offset returns the UTF-8 code point in the string.\n"]
  id : integer option;
      [@ocaml.doc
        "The numeric identifier for this attribute. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier.\n"]
  relationship_score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that this attribute is \
         correctly related to this entity.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the segment of text is \
         correctly recognized as an attribute.\n"]
  type_ : icd10cm_attribute_type option;
      [@ocaml.doc "The type of attribute. InferICD10CM detects entities of the type [DX_NAME]. \n"]
}
[@@ocaml.doc
  "The detected attributes that relate to an entity. This includes an extracted segment of the \
   text that is an attribute of an entity, or otherwise related to an entity. InferICD10CM detects \
   the following attributes: [Direction], [System, Organ or Site], and [Acuity].\n"]

type nonrec icd10cm_attribute_list = icd10cm_attribute list [@@ocaml.doc ""]

type nonrec icd10cm_concept = {
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has that the entity is accurately \
         linked to an ICD-10-CM concept.\n"]
  code : string_ option;
      [@ocaml.doc
        "The ICD-10-CM code that identifies the concept found in the knowledge base from the \
         Centers for Disease Control.\n"]
  description : string_ option;
      [@ocaml.doc "The long description of the ICD-10-CM code in the ontology.\n"]
}
[@@ocaml.doc
  " The ICD-10-CM concepts that the entity could refer to, along with a score indicating the \
   likelihood of the match.\n"]

type nonrec icd10cm_concept_list = icd10cm_concept list [@@ocaml.doc ""]

type nonrec icd10cm_entity = {
  icd10cm_concepts : icd10cm_concept_list option;
      [@ocaml.doc
        "The ICD-10-CM concepts that the entity could refer to, along with a score indicating the \
         likelihood of the match.\n"]
  traits : icd10cm_trait_list option;
      [@ocaml.doc
        "Provides Contextual information for the entity. The traits recognized by InferICD10CM are \
         [DIAGNOSIS], [SIGN], [SYMPTOM], and [NEGATION.] \n"]
  attributes : icd10cm_attribute_list option;
      [@ocaml.doc
        "The detected attributes that relate to the entity. An extracted segment of the text that \
         is an attribute of an entity, or otherwise related to an entity, such as the nature of a \
         medical condition.\n"]
  end_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the entity ends. The \
         offset returns the UTF-8 code point in the string.\n"]
  begin_offset : integer option;
      [@ocaml.doc
        "The 0-based character offset in the input text that shows where the entity begins. The \
         offset returns the UTF-8 code point in the string.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has in the accuracy of the \
         detection.\n"]
  type_ : icd10cm_entity_type option;
      [@ocaml.doc
        "Describes the specific type of entity with category of entities. InferICD10CM detects \
         entities of the type [DX_NAME] and [TIME_EXPRESSION].\n"]
  category : icd10cm_entity_category option;
      [@ocaml.doc
        " The category of the entity. InferICD10CM detects entities in the [MEDICAL_CONDITION] \
         category. \n"]
  text : ontology_linking_bounded_length_string option;
      [@ocaml.doc "The segment of input text that is matched to the detected entity.\n"]
  id : integer option;
      [@ocaml.doc
        "The numeric identifier for the entity. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier.\n"]
}
[@@ocaml.doc
  "The collection of medical entities extracted from the input text and their associated \
   information. For each entity, the response provides the entity text, the entity category, where \
   the entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has \
   in the detection and analysis. Attributes and traits of the entity are also returned. \n"]

type nonrec icd10cm_entity_list = icd10cm_entity list [@@ocaml.doc ""]

type nonrec infer_icd10cm_response = {
  model_version : string_ option;
      [@ocaml.doc
        "The version of the model used to analyze the documents, in the format {i n}.{i n}.{i n} \
         You can use this information to track the model used for a particular batch of documents.\n"]
  pagination_token : string_ option;
      [@ocaml.doc
        "If the result of the previous request to [InferICD10CM] was truncated, include the \
         [PaginationToken] to fetch the next page of medical condition entities. \n"]
  entities : icd10cm_entity_list;
      [@ocaml.doc
        "The medical conditions detected in the text linked to ICD-10-CM concepts. If the action \
         is successful, the service sends back an HTTP 200 response, as well as the entities \
         detected.\n"]
}
[@@ocaml.doc ""]

type nonrec infer_icd10cm_request = {
  text : ontology_linking_bounded_length_string; [@ocaml.doc "The input text used for analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec attribute_list = attribute list [@@ocaml.doc ""]

type nonrec entity = {
  attributes : attribute_list option;
      [@ocaml.doc " The extracted attributes that relate to this entity.\n"]
  traits : trait_list option; [@ocaml.doc "Contextual information for the entity.\n"]
  type_ : entity_sub_type option;
      [@ocaml.doc " Describes the specific type of entity with category of entities.\n"]
  category : entity_type option; [@ocaml.doc " The category of the entity.\n"]
  text : string_ option; [@ocaml.doc " The segment of input text extracted as this entity.\n"]
  score : float_ option;
      [@ocaml.doc
        "The level of confidence that Amazon Comprehend Medical has in the accuracy of the \
         detection.\n"]
  end_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the entity ends. The \
         offset returns the UTF-8 code point in the string. \n"]
  begin_offset : integer option;
      [@ocaml.doc
        " The 0-based character offset in the input text that shows where the entity begins. The \
         offset returns the UTF-8 code point in the string. \n"]
  id : integer option;
      [@ocaml.doc
        " The numeric identifier for the entity. This is a monotonically increasing id unique \
         within this response rather than a global unique identifier. \n"]
}
[@@ocaml.doc " Provides information about an extracted medical entity.\n"]

type nonrec entity_list = entity list [@@ocaml.doc ""]

type nonrec detect_phi_response = {
  model_version : string_;
      [@ocaml.doc
        "The version of the model used to analyze the documents. The version number looks like \
         X.X.X. You can use this information to track the model used for a particular batch of \
         documents.\n"]
  pagination_token : string_ option;
      [@ocaml.doc
        "If the result of the previous request to [DetectPHI] was truncated, include the \
         [PaginationToken] to fetch the next page of PHI entities. \n"]
  entities : entity_list;
      [@ocaml.doc
        "The collection of PHI entities extracted from the input text and their associated \
         information. For each entity, the response provides the entity text, the entity category, \
         where the entity text begins and ends, and the level of confidence that Amazon Comprehend \
         Medical has in its detection.\n"]
}
[@@ocaml.doc ""]

type nonrec bounded_length_string = string [@@ocaml.doc ""]

type nonrec detect_phi_request = {
  text : bounded_length_string;
      [@ocaml.doc
        "A UTF-8 text string containing the clinical content being examined for PHI entities.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_entities_v2_response = {
  model_version : string_;
      [@ocaml.doc
        "The version of the model used to analyze the documents. The version number looks like \
         X.X.X. You can use this information to track the model used for a particular batch of \
         documents.\n"]
  pagination_token : string_ option;
      [@ocaml.doc
        "If the result to the [DetectEntitiesV2] operation was truncated, include the \
         [PaginationToken] to fetch the next page of entities.\n"]
  unmapped_attributes : unmapped_attribute_list option;
      [@ocaml.doc
        "Attributes extracted from the input text that couldn't be related to an entity.\n"]
  entities : entity_list;
      [@ocaml.doc
        "The collection of medical entities extracted from the input text and their associated \
         information. For each entity, the response provides the entity text, the entity category, \
         where the entity text begins and ends, and the level of confidence in the detection and \
         analysis. Attributes and traits of the entity are also returned.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_entities_v2_request = {
  text : bounded_length_string;
      [@ocaml.doc "A UTF-8 string containing the clinical content being examined for entities.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_entities_response = {
  model_version : string_;
      [@ocaml.doc
        "The version of the model used to analyze the documents. The version number looks like \
         X.X.X. You can use this information to track the model used for a particular batch of \
         documents.\n"]
  pagination_token : string_ option;
      [@ocaml.doc
        "If the result of the previous request to [DetectEntities] was truncated, include the \
         [PaginationToken] to fetch the next page of entities.\n"]
  unmapped_attributes : unmapped_attribute_list option;
      [@ocaml.doc
        "Attributes extracted from the input text that we were unable to relate to an entity.\n"]
  entities : entity_list;
      [@ocaml.doc
        "The collection of medical entities extracted from the input text and their associated \
         information. For each entity, the response provides the entity text, the entity category, \
         where the entity text begins and ends, and the level of confidence that Amazon Comprehend \
         Medical has in the detection and analysis. Attributes and traits of the entity are also \
         returned.\n"]
}
[@@ocaml.doc ""]

type nonrec detect_entities_request = {
  text : bounded_length_string;
      [@ocaml.doc
        " A UTF-8 text string containing the clinical content being examined for entities.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snomedct_inference_job_response = {
  comprehend_medical_async_job_properties : comprehend_medical_async_job_properties option;
      [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_snomedct_inference_job_request = {
  job_id : job_id;
      [@ocaml.doc
        " The identifier that Amazon Comprehend Medical generated for the job. The \
         StartSNOMEDCTInferenceJob operation returns this identifier in its response. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_rx_norm_inference_job_response = {
  comprehend_medical_async_job_properties : comprehend_medical_async_job_properties option;
      [@ocaml.doc "An object that contains the properties associated with a detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rx_norm_inference_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend Medical generated for the job. The \
         StartRxNormInferenceJob operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_phi_detection_job_response = {
  comprehend_medical_async_job_properties : comprehend_medical_async_job_properties option;
      [@ocaml.doc "An object that contains the properties associated with a detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_phi_detection_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend Medical generated for the job. The \
         [StartPHIDetectionJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_icd10cm_inference_job_response = {
  comprehend_medical_async_job_properties : comprehend_medical_async_job_properties option;
      [@ocaml.doc "An object that contains the properties associated with a detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_icd10cm_inference_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend Medical generated for the job. [The\n\
        \        StartICD10CMInferenceJob] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entities_detection_v2_job_response = {
  comprehend_medical_async_job_properties : comprehend_medical_async_job_properties option;
      [@ocaml.doc "An object that contains the properties associated with a detection job.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entities_detection_v2_job_request = {
  job_id : job_id;
      [@ocaml.doc
        "The identifier that Amazon Comprehend Medical generated for the job. The \
         [StartEntitiesDetectionV2Job] operation returns this identifier in its response.\n"]
}
[@@ocaml.doc ""]
