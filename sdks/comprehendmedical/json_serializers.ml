open Smaws_Lib.Json.SerializeHelpers
open Types

let any_length_string_to_yojson = string_to_yojson
let float__to_yojson = float_to_yojson

let attribute_name_to_yojson (x : attribute_name) =
  match x with
  | SIGN -> `String "SIGN"
  | SYMPTOM -> `String "SYMPTOM"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | NEGATION -> `String "NEGATION"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | PAST_HISTORY -> `String "PAST_HISTORY"
  | FUTURE -> `String "FUTURE"

let trait_to_yojson (x : trait) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson attribute_name_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let trait_list_to_yojson tree = list_to_yojson trait_to_yojson tree

let entity_type_to_yojson (x : entity_type) =
  match x with
  | MEDICATION -> `String "MEDICATION"
  | MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"
  | PROTECTED_HEALTH_INFORMATION -> `String "PROTECTED_HEALTH_INFORMATION"
  | TEST_TREATMENT_PROCEDURE -> `String "TEST_TREATMENT_PROCEDURE"
  | ANATOMY -> `String "ANATOMY"
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"
  | BEHAVIORAL_ENVIRONMENTAL_SOCIAL -> `String "BEHAVIORAL_ENVIRONMENTAL_SOCIAL"

let string__to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let relationship_type_to_yojson (x : relationship_type) =
  match x with
  | EVERY -> `String "EVERY"
  | WITH_DOSAGE -> `String "WITH_DOSAGE"
  | ADMINISTERED_VIA -> `String "ADMINISTERED_VIA"
  | FOR -> `String "FOR"
  | NEGATIVE -> `String "NEGATIVE"
  | OVERLAP -> `String "OVERLAP"
  | DOSAGE -> `String "DOSAGE"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | FORM -> `String "FORM"
  | FREQUENCY -> `String "FREQUENCY"
  | DURATION -> `String "DURATION"
  | STRENGTH -> `String "STRENGTH"
  | RATE -> `String "RATE"
  | ACUITY -> `String "ACUITY"
  | TEST_VALUE -> `String "TEST_VALUE"
  | TEST_UNITS -> `String "TEST_UNITS"
  | TEST_UNIT -> `String "TEST_UNIT"
  | DIRECTION -> `String "DIRECTION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | AMOUNT -> `String "AMOUNT"
  | USAGE -> `String "USAGE"
  | QUALITY -> `String "QUALITY"

let entity_sub_type_to_yojson (x : entity_sub_type) =
  match x with
  | NAME -> `String "NAME"
  | DX_NAME -> `String "DX_NAME"
  | DOSAGE -> `String "DOSAGE"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | FORM -> `String "FORM"
  | FREQUENCY -> `String "FREQUENCY"
  | DURATION -> `String "DURATION"
  | GENERIC_NAME -> `String "GENERIC_NAME"
  | BRAND_NAME -> `String "BRAND_NAME"
  | STRENGTH -> `String "STRENGTH"
  | RATE -> `String "RATE"
  | ACUITY -> `String "ACUITY"
  | TEST_NAME -> `String "TEST_NAME"
  | TEST_VALUE -> `String "TEST_VALUE"
  | TEST_UNITS -> `String "TEST_UNITS"
  | TEST_UNIT -> `String "TEST_UNIT"
  | PROCEDURE_NAME -> `String "PROCEDURE_NAME"
  | TREATMENT_NAME -> `String "TREATMENT_NAME"
  | DATE -> `String "DATE"
  | AGE -> `String "AGE"
  | CONTACT_POINT -> `String "CONTACT_POINT"
  | PHONE_OR_FAX -> `String "PHONE_OR_FAX"
  | EMAIL -> `String "EMAIL"
  | IDENTIFIER -> `String "IDENTIFIER"
  | ID -> `String "ID"
  | URL -> `String "URL"
  | ADDRESS -> `String "ADDRESS"
  | PROFESSION -> `String "PROFESSION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | DIRECTION -> `String "DIRECTION"
  | QUALITY -> `String "QUALITY"
  | QUANTITY -> `String "QUANTITY"
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"
  | TIME_TO_MEDICATION_NAME -> `String "TIME_TO_MEDICATION_NAME"
  | TIME_TO_DX_NAME -> `String "TIME_TO_DX_NAME"
  | TIME_TO_TEST_NAME -> `String "TIME_TO_TEST_NAME"
  | TIME_TO_PROCEDURE_NAME -> `String "TIME_TO_PROCEDURE_NAME"
  | TIME_TO_TREATMENT_NAME -> `String "TIME_TO_TREATMENT_NAME"
  | AMOUNT -> `String "AMOUNT"
  | GENDER -> `String "GENDER"
  | RACE_ETHNICITY -> `String "RACE_ETHNICITY"
  | ALLERGIES -> `String "ALLERGIES"
  | TOBACCO_USE -> `String "TOBACCO_USE"
  | ALCOHOL_CONSUMPTION -> `String "ALCOHOL_CONSUMPTION"
  | REC_DRUG_USE -> `String "REC_DRUG_USE"

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson entity_sub_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("RelationshipType", option_to_yojson relationship_type_to_yojson x.relationship_type);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Category", option_to_yojson entity_type_to_yojson x.category);
      ("Traits", option_to_yojson trait_list_to_yojson x.traits);
    ]

let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree
let bounded_length_string_to_yojson = string_to_yojson

let characters_to_yojson (x : characters) =
  assoc_to_yojson
    [ ("OriginalTextCharacters", option_to_yojson integer_to_yojson x.original_text_characters) ]

let client_request_token_string_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | PARTIAL_SUCCESS -> `String "PARTIAL_SUCCESS"
  | FAILED -> `String "FAILED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"

let job_name_to_yojson = string_to_yojson

let comprehend_medical_async_job_filter_to_yojson (x : comprehend_medical_async_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let model_version_to_yojson = string_to_yojson
let kms_key_to_yojson = string_to_yojson
let manifest_file_path_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let language_code_to_yojson (x : language_code) = match x with EN -> `String "en"
let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
    ]

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
    ]

let job_id_to_yojson = string_to_yojson

let comprehend_medical_async_job_properties_to_yojson (x : comprehend_medical_async_job_properties)
    =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("ManifestFilePath", option_to_yojson manifest_file_path_to_yojson x.manifest_file_path);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
    ]

let comprehend_medical_async_job_properties_list_to_yojson tree =
  list_to_yojson comprehend_medical_async_job_properties_to_yojson tree

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let stop_snomedct_inference_job_response_to_yojson (x : stop_snomedct_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_snomedct_inference_job_request_to_yojson (x : stop_snomedct_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_rx_norm_inference_job_response_to_yojson (x : stop_rx_norm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_rx_norm_inference_job_request_to_yojson (x : stop_rx_norm_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_phi_detection_job_response_to_yojson (x : stop_phi_detection_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_phi_detection_job_request_to_yojson (x : stop_phi_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_icd10cm_inference_job_response_to_yojson (x : stop_icd10cm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_icd10cm_inference_job_request_to_yojson (x : stop_icd10cm_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_entities_detection_v2_job_response_to_yojson (x : stop_entities_detection_v2_job_response)
    =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_entities_detection_v2_job_request_to_yojson (x : stop_entities_detection_v2_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_snomedct_inference_job_response_to_yojson (x : start_snomedct_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_snomedct_inference_job_request_to_yojson (x : start_snomedct_inference_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let start_rx_norm_inference_job_response_to_yojson (x : start_rx_norm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_rx_norm_inference_job_request_to_yojson (x : start_rx_norm_inference_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let start_phi_detection_job_response_to_yojson (x : start_phi_detection_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_phi_detection_job_request_to_yojson (x : start_phi_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let start_icd10cm_inference_job_response_to_yojson (x : start_icd10cm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_icd10cm_inference_job_request_to_yojson (x : start_icd10cm_inference_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let start_entities_detection_v2_job_response_to_yojson
    (x : start_entities_detection_v2_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_entities_detection_v2_job_request_to_yojson (x : start_entities_detection_v2_job_request)
    =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let list_snomedct_inference_jobs_response_to_yojson (x : list_snomedct_inference_jobs_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_results_integer_to_yojson = int_to_yojson

let list_snomedct_inference_jobs_request_to_yojson (x : list_snomedct_inference_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_rx_norm_inference_jobs_response_to_yojson (x : list_rx_norm_inference_jobs_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_rx_norm_inference_jobs_request_to_yojson (x : list_rx_norm_inference_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_phi_detection_jobs_response_to_yojson (x : list_phi_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_phi_detection_jobs_request_to_yojson (x : list_phi_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_icd10cm_inference_jobs_response_to_yojson (x : list_icd10cm_inference_jobs_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_icd10cm_inference_jobs_request_to_yojson (x : list_icd10cm_inference_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_entities_detection_v2_jobs_response_to_yojson
    (x : list_entities_detection_v2_jobs_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_entities_detection_v2_jobs_request_to_yojson (x : list_entities_detection_v2_jobs_request)
    =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_encoding_exception_to_yojson (x : invalid_encoding_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let snomedct_details_to_yojson (x : snomedct_details) =
  assoc_to_yojson
    [
      ("Edition", option_to_yojson string__to_yojson x.edition);
      ("Language", option_to_yojson string__to_yojson x.language);
      ("VersionDate", option_to_yojson string__to_yojson x.version_date);
    ]

let snomedct_concept_to_yojson (x : snomedct_concept) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let snomedct_concept_list_to_yojson tree = list_to_yojson snomedct_concept_to_yojson tree

let snomedct_trait_name_to_yojson (x : snomedct_trait_name) =
  match x with
  | NEGATION -> `String "NEGATION"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | SIGN -> `String "SIGN"
  | SYMPTOM -> `String "SYMPTOM"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | PAST_HISTORY -> `String "PAST_HISTORY"
  | FUTURE -> `String "FUTURE"

let snomedct_trait_to_yojson (x : snomedct_trait) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson snomedct_trait_name_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let snomedct_trait_list_to_yojson tree = list_to_yojson snomedct_trait_to_yojson tree

let snomedct_relationship_type_to_yojson (x : snomedct_relationship_type) =
  match x with
  | ACUITY -> `String "ACUITY"
  | QUALITY -> `String "QUALITY"
  | TEST_VALUE -> `String "TEST_VALUE"
  | TEST_UNITS -> `String "TEST_UNITS"
  | DIRECTION -> `String "DIRECTION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | TEST_UNIT -> `String "TEST_UNIT"

let snomedct_attribute_type_to_yojson (x : snomedct_attribute_type) =
  match x with
  | ACUITY -> `String "ACUITY"
  | QUALITY -> `String "QUALITY"
  | DIRECTION -> `String "DIRECTION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | TEST_VALUE -> `String "TEST_VALUE"
  | TEST_UNIT -> `String "TEST_UNIT"

let snomedct_entity_category_to_yojson (x : snomedct_entity_category) =
  match x with
  | MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"
  | ANATOMY -> `String "ANATOMY"
  | TEST_TREATMENT_PROCEDURE -> `String "TEST_TREATMENT_PROCEDURE"

let snomedct_attribute_to_yojson (x : snomedct_attribute) =
  assoc_to_yojson
    [
      ("Category", option_to_yojson snomedct_entity_category_to_yojson x.category);
      ("Type", option_to_yojson snomedct_attribute_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("RelationshipType", option_to_yojson snomedct_relationship_type_to_yojson x.relationship_type);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Traits", option_to_yojson snomedct_trait_list_to_yojson x.traits);
      ("SNOMEDCTConcepts", option_to_yojson snomedct_concept_list_to_yojson x.snomedct_concepts);
    ]

let snomedct_attribute_list_to_yojson tree = list_to_yojson snomedct_attribute_to_yojson tree

let snomedct_entity_type_to_yojson (x : snomedct_entity_type) =
  match x with
  | DX_NAME -> `String "DX_NAME"
  | TEST_NAME -> `String "TEST_NAME"
  | PROCEDURE_NAME -> `String "PROCEDURE_NAME"
  | TREATMENT_NAME -> `String "TREATMENT_NAME"

let ontology_linking_bounded_length_string_to_yojson = string_to_yojson

let snomedct_entity_to_yojson (x : snomedct_entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Category", option_to_yojson snomedct_entity_category_to_yojson x.category);
      ("Type", option_to_yojson snomedct_entity_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Attributes", option_to_yojson snomedct_attribute_list_to_yojson x.attributes);
      ("Traits", option_to_yojson snomedct_trait_list_to_yojson x.traits);
      ("SNOMEDCTConcepts", option_to_yojson snomedct_concept_list_to_yojson x.snomedct_concepts);
    ]

let snomedct_entity_list_to_yojson tree = list_to_yojson snomedct_entity_to_yojson tree

let infer_snomedct_response_to_yojson (x : infer_snomedct_response) =
  assoc_to_yojson
    [
      ("Entities", Some (snomedct_entity_list_to_yojson x.entities));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
      ("SNOMEDCTDetails", option_to_yojson snomedct_details_to_yojson x.snomedct_details);
      ("Characters", option_to_yojson characters_to_yojson x.characters);
    ]

let infer_snomedct_request_to_yojson (x : infer_snomedct_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let rx_norm_concept_to_yojson (x : rx_norm_concept) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let rx_norm_concept_list_to_yojson tree = list_to_yojson rx_norm_concept_to_yojson tree

let rx_norm_trait_name_to_yojson (x : rx_norm_trait_name) =
  match x with NEGATION -> `String "NEGATION" | PAST_HISTORY -> `String "PAST_HISTORY"

let rx_norm_trait_to_yojson (x : rx_norm_trait) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson rx_norm_trait_name_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let rx_norm_trait_list_to_yojson tree = list_to_yojson rx_norm_trait_to_yojson tree

let rx_norm_attribute_type_to_yojson (x : rx_norm_attribute_type) =
  match x with
  | DOSAGE -> `String "DOSAGE"
  | DURATION -> `String "DURATION"
  | FORM -> `String "FORM"
  | FREQUENCY -> `String "FREQUENCY"
  | RATE -> `String "RATE"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | STRENGTH -> `String "STRENGTH"

let rx_norm_attribute_to_yojson (x : rx_norm_attribute) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson rx_norm_attribute_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Traits", option_to_yojson rx_norm_trait_list_to_yojson x.traits);
    ]

let rx_norm_attribute_list_to_yojson tree = list_to_yojson rx_norm_attribute_to_yojson tree

let rx_norm_entity_type_to_yojson (x : rx_norm_entity_type) =
  match x with BRAND_NAME -> `String "BRAND_NAME" | GENERIC_NAME -> `String "GENERIC_NAME"

let rx_norm_entity_category_to_yojson (x : rx_norm_entity_category) =
  match x with MEDICATION -> `String "MEDICATION"

let rx_norm_entity_to_yojson (x : rx_norm_entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Category", option_to_yojson rx_norm_entity_category_to_yojson x.category);
      ("Type", option_to_yojson rx_norm_entity_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Attributes", option_to_yojson rx_norm_attribute_list_to_yojson x.attributes);
      ("Traits", option_to_yojson rx_norm_trait_list_to_yojson x.traits);
      ("RxNormConcepts", option_to_yojson rx_norm_concept_list_to_yojson x.rx_norm_concepts);
    ]

let rx_norm_entity_list_to_yojson tree = list_to_yojson rx_norm_entity_to_yojson tree

let infer_rx_norm_response_to_yojson (x : infer_rx_norm_response) =
  assoc_to_yojson
    [
      ("Entities", Some (rx_norm_entity_list_to_yojson x.entities));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
    ]

let infer_rx_norm_request_to_yojson (x : infer_rx_norm_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let icd10cm_concept_to_yojson (x : icd10cm_concept) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let icd10cm_concept_list_to_yojson tree = list_to_yojson icd10cm_concept_to_yojson tree

let icd10cm_trait_name_to_yojson (x : icd10cm_trait_name) =
  match x with
  | NEGATION -> `String "NEGATION"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | SIGN -> `String "SIGN"
  | SYMPTOM -> `String "SYMPTOM"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"

let icd10cm_trait_to_yojson (x : icd10cm_trait) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson icd10cm_trait_name_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let icd10cm_trait_list_to_yojson tree = list_to_yojson icd10cm_trait_to_yojson tree

let icd10cm_relationship_type_to_yojson (x : icd10cm_relationship_type) =
  match x with
  | OVERLAP -> `String "OVERLAP"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | QUALITY -> `String "QUALITY"

let icd10cm_entity_type_to_yojson (x : icd10cm_entity_type) =
  match x with DX_NAME -> `String "DX_NAME" | TIME_EXPRESSION -> `String "TIME_EXPRESSION"

let icd10cm_attribute_type_to_yojson (x : icd10cm_attribute_type) =
  match x with
  | ACUITY -> `String "ACUITY"
  | DIRECTION -> `String "DIRECTION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | QUALITY -> `String "QUALITY"
  | QUANTITY -> `String "QUANTITY"
  | TIME_TO_DX_NAME -> `String "TIME_TO_DX_NAME"
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"

let icd10cm_attribute_to_yojson (x : icd10cm_attribute) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson icd10cm_attribute_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Traits", option_to_yojson icd10cm_trait_list_to_yojson x.traits);
      ("Category", option_to_yojson icd10cm_entity_type_to_yojson x.category);
      ("RelationshipType", option_to_yojson icd10cm_relationship_type_to_yojson x.relationship_type);
    ]

let icd10cm_attribute_list_to_yojson tree = list_to_yojson icd10cm_attribute_to_yojson tree

let icd10cm_entity_category_to_yojson (x : icd10cm_entity_category) =
  match x with MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"

let icd10cm_entity_to_yojson (x : icd10cm_entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Category", option_to_yojson icd10cm_entity_category_to_yojson x.category);
      ("Type", option_to_yojson icd10cm_entity_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Attributes", option_to_yojson icd10cm_attribute_list_to_yojson x.attributes);
      ("Traits", option_to_yojson icd10cm_trait_list_to_yojson x.traits);
      ("ICD10CMConcepts", option_to_yojson icd10cm_concept_list_to_yojson x.icd10cm_concepts);
    ]

let icd10cm_entity_list_to_yojson tree = list_to_yojson icd10cm_entity_to_yojson tree

let infer_icd10cm_response_to_yojson (x : infer_icd10cm_response) =
  assoc_to_yojson
    [
      ("Entities", Some (icd10cm_entity_list_to_yojson x.entities));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
    ]

let infer_icd10cm_request_to_yojson (x : infer_icd10cm_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Category", option_to_yojson entity_type_to_yojson x.category);
      ("Type", option_to_yojson entity_sub_type_to_yojson x.type_);
      ("Traits", option_to_yojson trait_list_to_yojson x.traits);
      ("Attributes", option_to_yojson attribute_list_to_yojson x.attributes);
    ]

let entity_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let detect_phi_response_to_yojson (x : detect_phi_response) =
  assoc_to_yojson
    [
      ("Entities", Some (entity_list_to_yojson x.entities));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", Some (string__to_yojson x.model_version));
    ]

let detect_phi_request_to_yojson (x : detect_phi_request) =
  assoc_to_yojson [ ("Text", Some (bounded_length_string_to_yojson x.text)) ]

let unmapped_attribute_to_yojson (x : unmapped_attribute) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson entity_type_to_yojson x.type_);
      ("Attribute", option_to_yojson attribute_to_yojson x.attribute);
    ]

let unmapped_attribute_list_to_yojson tree = list_to_yojson unmapped_attribute_to_yojson tree

let detect_entities_v2_response_to_yojson (x : detect_entities_v2_response) =
  assoc_to_yojson
    [
      ("Entities", Some (entity_list_to_yojson x.entities));
      ( "UnmappedAttributes",
        option_to_yojson unmapped_attribute_list_to_yojson x.unmapped_attributes );
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", Some (string__to_yojson x.model_version));
    ]

let detect_entities_v2_request_to_yojson (x : detect_entities_v2_request) =
  assoc_to_yojson [ ("Text", Some (bounded_length_string_to_yojson x.text)) ]

let detect_entities_response_to_yojson (x : detect_entities_response) =
  assoc_to_yojson
    [
      ("Entities", Some (entity_list_to_yojson x.entities));
      ( "UnmappedAttributes",
        option_to_yojson unmapped_attribute_list_to_yojson x.unmapped_attributes );
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("ModelVersion", Some (string__to_yojson x.model_version));
    ]

let detect_entities_request_to_yojson (x : detect_entities_request) =
  assoc_to_yojson [ ("Text", Some (bounded_length_string_to_yojson x.text)) ]

let describe_snomedct_inference_job_response_to_yojson
    (x : describe_snomedct_inference_job_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobProperties",
        option_to_yojson comprehend_medical_async_job_properties_to_yojson
          x.comprehend_medical_async_job_properties );
    ]

let describe_snomedct_inference_job_request_to_yojson (x : describe_snomedct_inference_job_request)
    =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_rx_norm_inference_job_response_to_yojson (x : describe_rx_norm_inference_job_response)
    =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobProperties",
        option_to_yojson comprehend_medical_async_job_properties_to_yojson
          x.comprehend_medical_async_job_properties );
    ]

let describe_rx_norm_inference_job_request_to_yojson (x : describe_rx_norm_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_phi_detection_job_response_to_yojson (x : describe_phi_detection_job_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobProperties",
        option_to_yojson comprehend_medical_async_job_properties_to_yojson
          x.comprehend_medical_async_job_properties );
    ]

let describe_phi_detection_job_request_to_yojson (x : describe_phi_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_icd10cm_inference_job_response_to_yojson (x : describe_icd10cm_inference_job_response)
    =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobProperties",
        option_to_yojson comprehend_medical_async_job_properties_to_yojson
          x.comprehend_medical_async_job_properties );
    ]

let describe_icd10cm_inference_job_request_to_yojson (x : describe_icd10cm_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_entities_detection_v2_job_response_to_yojson
    (x : describe_entities_detection_v2_job_response) =
  assoc_to_yojson
    [
      ( "ComprehendMedicalAsyncJobProperties",
        option_to_yojson comprehend_medical_async_job_properties_to_yojson
          x.comprehend_medical_async_job_properties );
    ]

let describe_entities_detection_v2_job_request_to_yojson
    (x : describe_entities_detection_v2_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]
