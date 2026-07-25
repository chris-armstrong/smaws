open Smaws_Lib.Json.DeserializeHelpers
open Types

let any_length_string_of_yojson = string_of_yojson
let float__of_yojson = float_of_yojson

let attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIGN" -> SIGN
    | `String "SYMPTOM" -> SYMPTOM
    | `String "DIAGNOSIS" -> DIAGNOSIS
    | `String "NEGATION" -> NEGATION
    | `String "PERTAINS_TO_FAMILY" -> PERTAINS_TO_FAMILY
    | `String "HYPOTHETICAL" -> HYPOTHETICAL
    | `String "LOW_CONFIDENCE" -> LOW_CONFIDENCE
    | `String "PAST_HISTORY" -> PAST_HISTORY
    | `String "FUTURE" -> FUTURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "AttributeName")
     : attribute_name)
    : attribute_name)

let trait_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key attribute_name_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : trait)

let trait_list_of_yojson tree path = list_of_yojson trait_of_yojson tree path

let entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEDICATION" -> MEDICATION
    | `String "MEDICAL_CONDITION" -> MEDICAL_CONDITION
    | `String "PROTECTED_HEALTH_INFORMATION" -> PROTECTED_HEALTH_INFORMATION
    | `String "TEST_TREATMENT_PROCEDURE" -> TEST_TREATMENT_PROCEDURE
    | `String "ANATOMY" -> ANATOMY
    | `String "TIME_EXPRESSION" -> TIME_EXPRESSION
    | `String "BEHAVIORAL_ENVIRONMENTAL_SOCIAL" -> BEHAVIORAL_ENVIRONMENTAL_SOCIAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")
     : entity_type)
    : entity_type)

let string__of_yojson = string_of_yojson
let integer_of_yojson = int_of_yojson

let relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVERY" -> EVERY
    | `String "WITH_DOSAGE" -> WITH_DOSAGE
    | `String "ADMINISTERED_VIA" -> ADMINISTERED_VIA
    | `String "FOR" -> FOR
    | `String "NEGATIVE" -> NEGATIVE
    | `String "OVERLAP" -> OVERLAP
    | `String "DOSAGE" -> DOSAGE
    | `String "ROUTE_OR_MODE" -> ROUTE_OR_MODE
    | `String "FORM" -> FORM
    | `String "FREQUENCY" -> FREQUENCY
    | `String "DURATION" -> DURATION
    | `String "STRENGTH" -> STRENGTH
    | `String "RATE" -> RATE
    | `String "ACUITY" -> ACUITY
    | `String "TEST_VALUE" -> TEST_VALUE
    | `String "TEST_UNITS" -> TEST_UNITS
    | `String "TEST_UNIT" -> TEST_UNIT
    | `String "DIRECTION" -> DIRECTION
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "AMOUNT" -> AMOUNT
    | `String "USAGE" -> USAGE
    | `String "QUALITY" -> QUALITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationshipType")
     : relationship_type)
    : relationship_type)

let entity_sub_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "DX_NAME" -> DX_NAME
    | `String "DOSAGE" -> DOSAGE
    | `String "ROUTE_OR_MODE" -> ROUTE_OR_MODE
    | `String "FORM" -> FORM
    | `String "FREQUENCY" -> FREQUENCY
    | `String "DURATION" -> DURATION
    | `String "GENERIC_NAME" -> GENERIC_NAME
    | `String "BRAND_NAME" -> BRAND_NAME
    | `String "STRENGTH" -> STRENGTH
    | `String "RATE" -> RATE
    | `String "ACUITY" -> ACUITY
    | `String "TEST_NAME" -> TEST_NAME
    | `String "TEST_VALUE" -> TEST_VALUE
    | `String "TEST_UNITS" -> TEST_UNITS
    | `String "TEST_UNIT" -> TEST_UNIT
    | `String "PROCEDURE_NAME" -> PROCEDURE_NAME
    | `String "TREATMENT_NAME" -> TREATMENT_NAME
    | `String "DATE" -> DATE
    | `String "AGE" -> AGE
    | `String "CONTACT_POINT" -> CONTACT_POINT
    | `String "PHONE_OR_FAX" -> PHONE_OR_FAX
    | `String "EMAIL" -> EMAIL
    | `String "IDENTIFIER" -> IDENTIFIER
    | `String "ID" -> ID
    | `String "URL" -> URL
    | `String "ADDRESS" -> ADDRESS
    | `String "PROFESSION" -> PROFESSION
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "DIRECTION" -> DIRECTION
    | `String "QUALITY" -> QUALITY
    | `String "QUANTITY" -> QUANTITY
    | `String "TIME_EXPRESSION" -> TIME_EXPRESSION
    | `String "TIME_TO_MEDICATION_NAME" -> TIME_TO_MEDICATION_NAME
    | `String "TIME_TO_DX_NAME" -> TIME_TO_DX_NAME
    | `String "TIME_TO_TEST_NAME" -> TIME_TO_TEST_NAME
    | `String "TIME_TO_PROCEDURE_NAME" -> TIME_TO_PROCEDURE_NAME
    | `String "TIME_TO_TREATMENT_NAME" -> TIME_TO_TREATMENT_NAME
    | `String "AMOUNT" -> AMOUNT
    | `String "GENDER" -> GENDER
    | `String "RACE_ETHNICITY" -> RACE_ETHNICITY
    | `String "ALLERGIES" -> ALLERGIES
    | `String "TOBACCO_USE" -> TOBACCO_USE
    | `String "ALCOHOL_CONSUMPTION" -> ALCOHOL_CONSUMPTION
    | `String "REC_DRUG_USE" -> REC_DRUG_USE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntitySubType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntitySubType")
     : entity_sub_type)
    : entity_sub_type)

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key entity_sub_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     relationship_score =
       option_of_yojson (value_for_key float__of_yojson "RelationshipScore") _list path;
     relationship_type =
       option_of_yojson (value_for_key relationship_type_of_yojson "RelationshipType") _list path;
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     category = option_of_yojson (value_for_key entity_type_of_yojson "Category") _list path;
     traits = option_of_yojson (value_for_key trait_list_of_yojson "Traits") _list path;
   }
    : attribute)

let attribute_list_of_yojson tree path = list_of_yojson attribute_of_yojson tree path
let bounded_length_string_of_yojson = string_of_yojson

let characters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     original_text_characters =
       option_of_yojson (value_for_key integer_of_yojson "OriginalTextCharacters") _list path;
   }
    : characters)

let client_request_token_string_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "PARTIAL_SUCCESS" -> PARTIAL_SUCCESS
    | `String "FAILED" -> FAILED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let job_name_of_yojson = string_of_yojson

let comprehend_medical_async_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : comprehend_medical_async_job_filter)

let model_version_of_yojson = string_of_yojson
let kms_key_of_yojson = string_of_yojson
let manifest_file_path_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson

let language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en" -> EN
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")
     : language_code)
    : language_code)

let s3_key_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_key = option_of_yojson (value_for_key s3_key_of_yojson "S3Key") _list path;
   }
    : output_data_config)

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_key = option_of_yojson (value_for_key s3_key_of_yojson "S3Key") _list path;
   }
    : input_data_config)

let job_id_of_yojson = string_of_yojson

let comprehend_medical_async_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     manifest_file_path =
       option_of_yojson (value_for_key manifest_file_path_of_yojson "ManifestFilePath") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ModelVersion") _list path;
   }
    : comprehend_medical_async_job_properties)

let comprehend_medical_async_job_properties_list_of_yojson tree path =
  list_of_yojson comprehend_medical_async_job_properties_of_yojson tree path

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_requests_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_not_found_exception)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_request_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_exception)

let stop_snomedct_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : stop_snomedct_inference_job_response)

let stop_snomedct_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_snomedct_inference_job_request)

let stop_rx_norm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : stop_rx_norm_inference_job_response)

let stop_rx_norm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_rx_norm_inference_job_request)

let stop_phi_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : stop_phi_detection_job_response)

let stop_phi_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path } : stop_phi_detection_job_request)

let stop_icd10cm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : stop_icd10cm_inference_job_response)

let stop_icd10cm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_icd10cm_inference_job_request)

let stop_entities_detection_v2_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : stop_entities_detection_v2_job_response)

let stop_entities_detection_v2_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_entities_detection_v2_job_request)

let start_snomedct_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_snomedct_inference_job_response)

let start_snomedct_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : start_snomedct_inference_job_request)

let start_rx_norm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_rx_norm_inference_job_response)

let start_rx_norm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : start_rx_norm_inference_job_request)

let start_phi_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_phi_detection_job_response)

let start_phi_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : start_phi_detection_job_request)

let start_icd10cm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_icd10cm_inference_job_response)

let start_icd10cm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : start_icd10cm_inference_job_request)

let start_entities_detection_v2_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_entities_detection_v2_job_response)

let start_entities_detection_v2_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : start_entities_detection_v2_job_request)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : validation_exception)

let list_snomedct_inference_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties_list =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_list_of_yojson
            "ComprehendMedicalAsyncJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_snomedct_inference_jobs_response)

let max_results_integer_of_yojson = int_of_yojson

let list_snomedct_inference_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_snomedct_inference_jobs_request)

let list_rx_norm_inference_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties_list =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_list_of_yojson
            "ComprehendMedicalAsyncJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_rx_norm_inference_jobs_response)

let list_rx_norm_inference_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_rx_norm_inference_jobs_request)

let list_phi_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties_list =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_list_of_yojson
            "ComprehendMedicalAsyncJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_phi_detection_jobs_response)

let list_phi_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_phi_detection_jobs_request)

let list_icd10cm_inference_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties_list =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_list_of_yojson
            "ComprehendMedicalAsyncJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_icd10cm_inference_jobs_response)

let list_icd10cm_inference_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_icd10cm_inference_jobs_request)

let list_entities_detection_v2_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties_list =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_list_of_yojson
            "ComprehendMedicalAsyncJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_entities_detection_v2_jobs_response)

let list_entities_detection_v2_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_entities_detection_v2_jobs_request)

let text_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : text_size_limit_exceeded_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : service_unavailable_exception)

let invalid_encoding_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_encoding_exception)

let snomedct_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     edition = option_of_yojson (value_for_key string__of_yojson "Edition") _list path;
     language = option_of_yojson (value_for_key string__of_yojson "Language") _list path;
     version_date = option_of_yojson (value_for_key string__of_yojson "VersionDate") _list path;
   }
    : snomedct_details)

let snomedct_concept_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : snomedct_concept)

let snomedct_concept_list_of_yojson tree path = list_of_yojson snomedct_concept_of_yojson tree path

let snomedct_trait_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEGATION" -> NEGATION
    | `String "DIAGNOSIS" -> DIAGNOSIS
    | `String "SIGN" -> SIGN
    | `String "SYMPTOM" -> SYMPTOM
    | `String "PERTAINS_TO_FAMILY" -> PERTAINS_TO_FAMILY
    | `String "HYPOTHETICAL" -> HYPOTHETICAL
    | `String "LOW_CONFIDENCE" -> LOW_CONFIDENCE
    | `String "PAST_HISTORY" -> PAST_HISTORY
    | `String "FUTURE" -> FUTURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SNOMEDCTTraitName" value)
    | _ -> raise (deserialize_wrong_type_error path "SNOMEDCTTraitName")
     : snomedct_trait_name)
    : snomedct_trait_name)

let snomedct_trait_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key snomedct_trait_name_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : snomedct_trait)

let snomedct_trait_list_of_yojson tree path = list_of_yojson snomedct_trait_of_yojson tree path

let snomedct_relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACUITY" -> ACUITY
    | `String "QUALITY" -> QUALITY
    | `String "TEST_VALUE" -> TEST_VALUE
    | `String "TEST_UNITS" -> TEST_UNITS
    | `String "DIRECTION" -> DIRECTION
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "TEST_UNIT" -> TEST_UNIT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SNOMEDCTRelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "SNOMEDCTRelationshipType")
     : snomedct_relationship_type)
    : snomedct_relationship_type)

let snomedct_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACUITY" -> ACUITY
    | `String "QUALITY" -> QUALITY
    | `String "DIRECTION" -> DIRECTION
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "TEST_VALUE" -> TEST_VALUE
    | `String "TEST_UNIT" -> TEST_UNIT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SNOMEDCTAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "SNOMEDCTAttributeType")
     : snomedct_attribute_type)
    : snomedct_attribute_type)

let snomedct_entity_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEDICAL_CONDITION" -> MEDICAL_CONDITION
    | `String "ANATOMY" -> ANATOMY
    | `String "TEST_TREATMENT_PROCEDURE" -> TEST_TREATMENT_PROCEDURE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SNOMEDCTEntityCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "SNOMEDCTEntityCategory")
     : snomedct_entity_category)
    : snomedct_entity_category)

let snomedct_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category =
       option_of_yojson (value_for_key snomedct_entity_category_of_yojson "Category") _list path;
     type_ = option_of_yojson (value_for_key snomedct_attribute_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     relationship_score =
       option_of_yojson (value_for_key float__of_yojson "RelationshipScore") _list path;
     relationship_type =
       option_of_yojson
         (value_for_key snomedct_relationship_type_of_yojson "RelationshipType")
         _list path;
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     traits = option_of_yojson (value_for_key snomedct_trait_list_of_yojson "Traits") _list path;
     snomedct_concepts =
       option_of_yojson
         (value_for_key snomedct_concept_list_of_yojson "SNOMEDCTConcepts")
         _list path;
   }
    : snomedct_attribute)

let snomedct_attribute_list_of_yojson tree path =
  list_of_yojson snomedct_attribute_of_yojson tree path

let snomedct_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DX_NAME" -> DX_NAME
    | `String "TEST_NAME" -> TEST_NAME
    | `String "PROCEDURE_NAME" -> PROCEDURE_NAME
    | `String "TREATMENT_NAME" -> TREATMENT_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "SNOMEDCTEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "SNOMEDCTEntityType")
     : snomedct_entity_type)
    : snomedct_entity_type)

let ontology_linking_bounded_length_string_of_yojson = string_of_yojson

let snomedct_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     text =
       option_of_yojson
         (value_for_key ontology_linking_bounded_length_string_of_yojson "Text")
         _list path;
     category =
       option_of_yojson (value_for_key snomedct_entity_category_of_yojson "Category") _list path;
     type_ = option_of_yojson (value_for_key snomedct_entity_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     attributes =
       option_of_yojson (value_for_key snomedct_attribute_list_of_yojson "Attributes") _list path;
     traits = option_of_yojson (value_for_key snomedct_trait_list_of_yojson "Traits") _list path;
     snomedct_concepts =
       option_of_yojson
         (value_for_key snomedct_concept_list_of_yojson "SNOMEDCTConcepts")
         _list path;
   }
    : snomedct_entity)

let snomedct_entity_list_of_yojson tree path = list_of_yojson snomedct_entity_of_yojson tree path

let infer_snomedct_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key snomedct_entity_list_of_yojson "Entities" _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = option_of_yojson (value_for_key string__of_yojson "ModelVersion") _list path;
     snomedct_details =
       option_of_yojson (value_for_key snomedct_details_of_yojson "SNOMEDCTDetails") _list path;
     characters = option_of_yojson (value_for_key characters_of_yojson "Characters") _list path;
   }
    : infer_snomedct_response)

let infer_snomedct_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key ontology_linking_bounded_length_string_of_yojson "Text" _list path }
    : infer_snomedct_request)

let rx_norm_concept_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : rx_norm_concept)

let rx_norm_concept_list_of_yojson tree path = list_of_yojson rx_norm_concept_of_yojson tree path

let rx_norm_trait_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEGATION" -> NEGATION
    | `String "PAST_HISTORY" -> PAST_HISTORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RxNormTraitName" value)
    | _ -> raise (deserialize_wrong_type_error path "RxNormTraitName")
     : rx_norm_trait_name)
    : rx_norm_trait_name)

let rx_norm_trait_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key rx_norm_trait_name_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : rx_norm_trait)

let rx_norm_trait_list_of_yojson tree path = list_of_yojson rx_norm_trait_of_yojson tree path

let rx_norm_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOSAGE" -> DOSAGE
    | `String "DURATION" -> DURATION
    | `String "FORM" -> FORM
    | `String "FREQUENCY" -> FREQUENCY
    | `String "RATE" -> RATE
    | `String "ROUTE_OR_MODE" -> ROUTE_OR_MODE
    | `String "STRENGTH" -> STRENGTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "RxNormAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "RxNormAttributeType")
     : rx_norm_attribute_type)
    : rx_norm_attribute_type)

let rx_norm_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key rx_norm_attribute_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     relationship_score =
       option_of_yojson (value_for_key float__of_yojson "RelationshipScore") _list path;
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     traits = option_of_yojson (value_for_key rx_norm_trait_list_of_yojson "Traits") _list path;
   }
    : rx_norm_attribute)

let rx_norm_attribute_list_of_yojson tree path =
  list_of_yojson rx_norm_attribute_of_yojson tree path

let rx_norm_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BRAND_NAME" -> BRAND_NAME
    | `String "GENERIC_NAME" -> GENERIC_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RxNormEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "RxNormEntityType")
     : rx_norm_entity_type)
    : rx_norm_entity_type)

let rx_norm_entity_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEDICATION" -> MEDICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RxNormEntityCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "RxNormEntityCategory")
     : rx_norm_entity_category)
    : rx_norm_entity_category)

let rx_norm_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     text =
       option_of_yojson
         (value_for_key ontology_linking_bounded_length_string_of_yojson "Text")
         _list path;
     category =
       option_of_yojson (value_for_key rx_norm_entity_category_of_yojson "Category") _list path;
     type_ = option_of_yojson (value_for_key rx_norm_entity_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     attributes =
       option_of_yojson (value_for_key rx_norm_attribute_list_of_yojson "Attributes") _list path;
     traits = option_of_yojson (value_for_key rx_norm_trait_list_of_yojson "Traits") _list path;
     rx_norm_concepts =
       option_of_yojson (value_for_key rx_norm_concept_list_of_yojson "RxNormConcepts") _list path;
   }
    : rx_norm_entity)

let rx_norm_entity_list_of_yojson tree path = list_of_yojson rx_norm_entity_of_yojson tree path

let infer_rx_norm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key rx_norm_entity_list_of_yojson "Entities" _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = option_of_yojson (value_for_key string__of_yojson "ModelVersion") _list path;
   }
    : infer_rx_norm_response)

let infer_rx_norm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key ontology_linking_bounded_length_string_of_yojson "Text" _list path }
    : infer_rx_norm_request)

let icd10cm_concept_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : icd10cm_concept)

let icd10cm_concept_list_of_yojson tree path = list_of_yojson icd10cm_concept_of_yojson tree path

let icd10cm_trait_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEGATION" -> NEGATION
    | `String "DIAGNOSIS" -> DIAGNOSIS
    | `String "SIGN" -> SIGN
    | `String "SYMPTOM" -> SYMPTOM
    | `String "PERTAINS_TO_FAMILY" -> PERTAINS_TO_FAMILY
    | `String "HYPOTHETICAL" -> HYPOTHETICAL
    | `String "LOW_CONFIDENCE" -> LOW_CONFIDENCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ICD10CMTraitName" value)
    | _ -> raise (deserialize_wrong_type_error path "ICD10CMTraitName")
     : icd10cm_trait_name)
    : icd10cm_trait_name)

let icd10cm_trait_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key icd10cm_trait_name_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : icd10cm_trait)

let icd10cm_trait_list_of_yojson tree path = list_of_yojson icd10cm_trait_of_yojson tree path

let icd10cm_relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERLAP" -> OVERLAP
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "QUALITY" -> QUALITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ICD10CMRelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "ICD10CMRelationshipType")
     : icd10cm_relationship_type)
    : icd10cm_relationship_type)

let icd10cm_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DX_NAME" -> DX_NAME
    | `String "TIME_EXPRESSION" -> TIME_EXPRESSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ICD10CMEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "ICD10CMEntityType")
     : icd10cm_entity_type)
    : icd10cm_entity_type)

let icd10cm_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACUITY" -> ACUITY
    | `String "DIRECTION" -> DIRECTION
    | `String "SYSTEM_ORGAN_SITE" -> SYSTEM_ORGAN_SITE
    | `String "QUALITY" -> QUALITY
    | `String "QUANTITY" -> QUANTITY
    | `String "TIME_TO_DX_NAME" -> TIME_TO_DX_NAME
    | `String "TIME_EXPRESSION" -> TIME_EXPRESSION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ICD10CMAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ICD10CMAttributeType")
     : icd10cm_attribute_type)
    : icd10cm_attribute_type)

let icd10cm_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key icd10cm_attribute_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     relationship_score =
       option_of_yojson (value_for_key float__of_yojson "RelationshipScore") _list path;
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     traits = option_of_yojson (value_for_key icd10cm_trait_list_of_yojson "Traits") _list path;
     category = option_of_yojson (value_for_key icd10cm_entity_type_of_yojson "Category") _list path;
     relationship_type =
       option_of_yojson
         (value_for_key icd10cm_relationship_type_of_yojson "RelationshipType")
         _list path;
   }
    : icd10cm_attribute)

let icd10cm_attribute_list_of_yojson tree path =
  list_of_yojson icd10cm_attribute_of_yojson tree path

let icd10cm_entity_category_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEDICAL_CONDITION" -> MEDICAL_CONDITION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ICD10CMEntityCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "ICD10CMEntityCategory")
     : icd10cm_entity_category)
    : icd10cm_entity_category)

let icd10cm_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     text =
       option_of_yojson
         (value_for_key ontology_linking_bounded_length_string_of_yojson "Text")
         _list path;
     category =
       option_of_yojson (value_for_key icd10cm_entity_category_of_yojson "Category") _list path;
     type_ = option_of_yojson (value_for_key icd10cm_entity_type_of_yojson "Type") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     attributes =
       option_of_yojson (value_for_key icd10cm_attribute_list_of_yojson "Attributes") _list path;
     traits = option_of_yojson (value_for_key icd10cm_trait_list_of_yojson "Traits") _list path;
     icd10cm_concepts =
       option_of_yojson (value_for_key icd10cm_concept_list_of_yojson "ICD10CMConcepts") _list path;
   }
    : icd10cm_entity)

let icd10cm_entity_list_of_yojson tree path = list_of_yojson icd10cm_entity_of_yojson tree path

let infer_icd10cm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key icd10cm_entity_list_of_yojson "Entities" _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = option_of_yojson (value_for_key string__of_yojson "ModelVersion") _list path;
   }
    : infer_icd10cm_response)

let infer_icd10cm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key ontology_linking_bounded_length_string_of_yojson "Text" _list path }
    : infer_icd10cm_request)

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key integer_of_yojson "Id") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     category = option_of_yojson (value_for_key entity_type_of_yojson "Category") _list path;
     type_ = option_of_yojson (value_for_key entity_sub_type_of_yojson "Type") _list path;
     traits = option_of_yojson (value_for_key trait_list_of_yojson "Traits") _list path;
     attributes = option_of_yojson (value_for_key attribute_list_of_yojson "Attributes") _list path;
   }
    : entity)

let entity_list_of_yojson tree path = list_of_yojson entity_of_yojson tree path

let detect_phi_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key entity_list_of_yojson "Entities" _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = value_for_key string__of_yojson "ModelVersion" _list path;
   }
    : detect_phi_response)

let detect_phi_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key bounded_length_string_of_yojson "Text" _list path } : detect_phi_request)

let unmapped_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key entity_type_of_yojson "Type") _list path;
     attribute = option_of_yojson (value_for_key attribute_of_yojson "Attribute") _list path;
   }
    : unmapped_attribute)

let unmapped_attribute_list_of_yojson tree path =
  list_of_yojson unmapped_attribute_of_yojson tree path

let detect_entities_v2_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key entity_list_of_yojson "Entities" _list path;
     unmapped_attributes =
       option_of_yojson
         (value_for_key unmapped_attribute_list_of_yojson "UnmappedAttributes")
         _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = value_for_key string__of_yojson "ModelVersion" _list path;
   }
    : detect_entities_v2_response)

let detect_entities_v2_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key bounded_length_string_of_yojson "Text" _list path }
    : detect_entities_v2_request)

let detect_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key entity_list_of_yojson "Entities" _list path;
     unmapped_attributes =
       option_of_yojson
         (value_for_key unmapped_attribute_list_of_yojson "UnmappedAttributes")
         _list path;
     pagination_token =
       option_of_yojson (value_for_key string__of_yojson "PaginationToken") _list path;
     model_version = value_for_key string__of_yojson "ModelVersion" _list path;
   }
    : detect_entities_response)

let detect_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key bounded_length_string_of_yojson "Text" _list path }
    : detect_entities_request)

let describe_snomedct_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_of_yojson
            "ComprehendMedicalAsyncJobProperties")
         _list path;
   }
    : describe_snomedct_inference_job_response)

let describe_snomedct_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_snomedct_inference_job_request)

let describe_rx_norm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_of_yojson
            "ComprehendMedicalAsyncJobProperties")
         _list path;
   }
    : describe_rx_norm_inference_job_response)

let describe_rx_norm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_rx_norm_inference_job_request)

let describe_phi_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_of_yojson
            "ComprehendMedicalAsyncJobProperties")
         _list path;
   }
    : describe_phi_detection_job_response)

let describe_phi_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_phi_detection_job_request)

let describe_icd10cm_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_of_yojson
            "ComprehendMedicalAsyncJobProperties")
         _list path;
   }
    : describe_icd10cm_inference_job_response)

let describe_icd10cm_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_icd10cm_inference_job_request)

let describe_entities_detection_v2_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comprehend_medical_async_job_properties =
       option_of_yojson
         (value_for_key comprehend_medical_async_job_properties_of_yojson
            "ComprehendMedicalAsyncJobProperties")
         _list path;
   }
    : describe_entities_detection_v2_job_response)

let describe_entities_detection_v2_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_entities_detection_v2_job_request)
