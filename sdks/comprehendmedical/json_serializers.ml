open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let entity_type_to_yojson (x : entity_type) =
  match x with
  | BEHAVIORAL_ENVIRONMENTAL_SOCIAL -> `String "BEHAVIORAL_ENVIRONMENTAL_SOCIAL"
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"
  | ANATOMY -> `String "ANATOMY"
  | TEST_TREATMENT_PROCEDURE -> `String "TEST_TREATMENT_PROCEDURE"
  | PROTECTED_HEALTH_INFORMATION -> `String "PROTECTED_HEALTH_INFORMATION"
  | MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"
  | MEDICATION -> `String "MEDICATION"

let entity_sub_type_to_yojson (x : entity_sub_type) =
  match x with
  | REC_DRUG_USE -> `String "REC_DRUG_USE"
  | ALCOHOL_CONSUMPTION -> `String "ALCOHOL_CONSUMPTION"
  | TOBACCO_USE -> `String "TOBACCO_USE"
  | ALLERGIES -> `String "ALLERGIES"
  | RACE_ETHNICITY -> `String "RACE_ETHNICITY"
  | GENDER -> `String "GENDER"
  | AMOUNT -> `String "AMOUNT"
  | TIME_TO_TREATMENT_NAME -> `String "TIME_TO_TREATMENT_NAME"
  | TIME_TO_PROCEDURE_NAME -> `String "TIME_TO_PROCEDURE_NAME"
  | TIME_TO_TEST_NAME -> `String "TIME_TO_TEST_NAME"
  | TIME_TO_DX_NAME -> `String "TIME_TO_DX_NAME"
  | TIME_TO_MEDICATION_NAME -> `String "TIME_TO_MEDICATION_NAME"
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"
  | QUANTITY -> `String "QUANTITY"
  | QUALITY -> `String "QUALITY"
  | DIRECTION -> `String "DIRECTION"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | PROFESSION -> `String "PROFESSION"
  | ADDRESS -> `String "ADDRESS"
  | URL -> `String "URL"
  | ID -> `String "ID"
  | IDENTIFIER -> `String "IDENTIFIER"
  | EMAIL -> `String "EMAIL"
  | PHONE_OR_FAX -> `String "PHONE_OR_FAX"
  | CONTACT_POINT -> `String "CONTACT_POINT"
  | AGE -> `String "AGE"
  | DATE -> `String "DATE"
  | TREATMENT_NAME -> `String "TREATMENT_NAME"
  | PROCEDURE_NAME -> `String "PROCEDURE_NAME"
  | TEST_UNIT -> `String "TEST_UNIT"
  | TEST_UNITS -> `String "TEST_UNITS"
  | TEST_VALUE -> `String "TEST_VALUE"
  | TEST_NAME -> `String "TEST_NAME"
  | ACUITY -> `String "ACUITY"
  | RATE -> `String "RATE"
  | STRENGTH -> `String "STRENGTH"
  | BRAND_NAME -> `String "BRAND_NAME"
  | GENERIC_NAME -> `String "GENERIC_NAME"
  | DURATION -> `String "DURATION"
  | FREQUENCY -> `String "FREQUENCY"
  | FORM -> `String "FORM"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | DOSAGE -> `String "DOSAGE"
  | DX_NAME -> `String "DX_NAME"
  | NAME -> `String "NAME"

let float__to_yojson = float_to_yojson

let relationship_type_to_yojson (x : relationship_type) =
  match x with
  | QUALITY -> `String "QUALITY"
  | USAGE -> `String "USAGE"
  | AMOUNT -> `String "AMOUNT"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | DIRECTION -> `String "DIRECTION"
  | TEST_UNIT -> `String "TEST_UNIT"
  | TEST_UNITS -> `String "TEST_UNITS"
  | TEST_VALUE -> `String "TEST_VALUE"
  | ACUITY -> `String "ACUITY"
  | RATE -> `String "RATE"
  | STRENGTH -> `String "STRENGTH"
  | DURATION -> `String "DURATION"
  | FREQUENCY -> `String "FREQUENCY"
  | FORM -> `String "FORM"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | DOSAGE -> `String "DOSAGE"
  | OVERLAP -> `String "OVERLAP"
  | NEGATIVE -> `String "NEGATIVE"
  | FOR -> `String "FOR"
  | ADMINISTERED_VIA -> `String "ADMINISTERED_VIA"
  | WITH_DOSAGE -> `String "WITH_DOSAGE"
  | EVERY -> `String "EVERY"

let integer_to_yojson = int_to_yojson

let attribute_name_to_yojson (x : attribute_name) =
  match x with
  | FUTURE -> `String "FUTURE"
  | PAST_HISTORY -> `String "PAST_HISTORY"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | NEGATION -> `String "NEGATION"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | SYMPTOM -> `String "SYMPTOM"
  | SIGN -> `String "SIGN"

let trait_to_yojson (x : trait) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson attribute_name_to_yojson x.name);
    ]

let trait_list_to_yojson tree = list_to_yojson trait_to_yojson tree

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("Traits", option_to_yojson trait_list_to_yojson x.traits);
      ("Category", option_to_yojson entity_type_to_yojson x.category);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("RelationshipType", option_to_yojson relationship_type_to_yojson x.relationship_type);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson entity_sub_type_to_yojson x.type_);
    ]

let unmapped_attribute_to_yojson (x : unmapped_attribute) =
  assoc_to_yojson
    [
      ("Attribute", option_to_yojson attribute_to_yojson x.attribute);
      ("Type", option_to_yojson entity_type_to_yojson x.type_);
    ]

let unmapped_attribute_list_to_yojson tree = list_to_yojson unmapped_attribute_to_yojson tree

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let job_id_to_yojson = string_to_yojson

let stop_snomedct_inference_job_response_to_yojson (x : stop_snomedct_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let stop_snomedct_inference_job_request_to_yojson (x : stop_snomedct_inference_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

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

let s3_bucket_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let iam_role_arn_to_yojson = string_to_yojson
let job_name_to_yojson = string_to_yojson
let client_request_token_string_to_yojson = string_to_yojson
let kms_key_to_yojson = string_to_yojson
let language_code_to_yojson (x : language_code) = match x with EN -> `String "en"

let start_snomedct_inference_job_request_to_yojson (x : start_snomedct_inference_job_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_rx_norm_inference_job_response_to_yojson (x : start_rx_norm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_rx_norm_inference_job_request_to_yojson (x : start_rx_norm_inference_job_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_phi_detection_job_response_to_yojson (x : start_phi_detection_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_phi_detection_job_request_to_yojson (x : start_phi_detection_job_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_icd10cm_inference_job_response_to_yojson (x : start_icd10cm_inference_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_icd10cm_inference_job_request_to_yojson (x : start_icd10cm_inference_job_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_entities_detection_v2_job_response_to_yojson
    (x : start_entities_detection_v2_job_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_entities_detection_v2_job_request_to_yojson (x : start_entities_detection_v2_job_request)
    =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let snomedct_trait_name_to_yojson (x : snomedct_trait_name) =
  match x with
  | FUTURE -> `String "FUTURE"
  | PAST_HISTORY -> `String "PAST_HISTORY"
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | SYMPTOM -> `String "SYMPTOM"
  | SIGN -> `String "SIGN"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | NEGATION -> `String "NEGATION"

let snomedct_trait_to_yojson (x : snomedct_trait) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson snomedct_trait_name_to_yojson x.name);
    ]

let snomedct_trait_list_to_yojson tree = list_to_yojson snomedct_trait_to_yojson tree

let snomedct_relationship_type_to_yojson (x : snomedct_relationship_type) =
  match x with
  | TEST_UNIT -> `String "TEST_UNIT"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | DIRECTION -> `String "DIRECTION"
  | TEST_UNITS -> `String "TEST_UNITS"
  | TEST_VALUE -> `String "TEST_VALUE"
  | QUALITY -> `String "QUALITY"
  | ACUITY -> `String "ACUITY"

let snomedct_entity_type_to_yojson (x : snomedct_entity_type) =
  match x with
  | TREATMENT_NAME -> `String "TREATMENT_NAME"
  | PROCEDURE_NAME -> `String "PROCEDURE_NAME"
  | TEST_NAME -> `String "TEST_NAME"
  | DX_NAME -> `String "DX_NAME"

let ontology_linking_bounded_length_string_to_yojson = string_to_yojson

let snomedct_entity_category_to_yojson (x : snomedct_entity_category) =
  match x with
  | TEST_TREATMENT_PROCEDURE -> `String "TEST_TREATMENT_PROCEDURE"
  | ANATOMY -> `String "ANATOMY"
  | MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"

let snomedct_attribute_type_to_yojson (x : snomedct_attribute_type) =
  match x with
  | TEST_UNIT -> `String "TEST_UNIT"
  | TEST_VALUE -> `String "TEST_VALUE"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | DIRECTION -> `String "DIRECTION"
  | QUALITY -> `String "QUALITY"
  | ACUITY -> `String "ACUITY"

let snomedct_concept_to_yojson (x : snomedct_concept) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let snomedct_concept_list_to_yojson tree = list_to_yojson snomedct_concept_to_yojson tree

let snomedct_attribute_to_yojson (x : snomedct_attribute) =
  assoc_to_yojson
    [
      ("SNOMEDCTConcepts", option_to_yojson snomedct_concept_list_to_yojson x.snomedct_concepts);
      ("Traits", option_to_yojson snomedct_trait_list_to_yojson x.traits);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("RelationshipType", option_to_yojson snomedct_relationship_type_to_yojson x.relationship_type);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson snomedct_attribute_type_to_yojson x.type_);
      ("Category", option_to_yojson snomedct_entity_category_to_yojson x.category);
    ]

let snomedct_attribute_list_to_yojson tree = list_to_yojson snomedct_attribute_to_yojson tree

let snomedct_entity_to_yojson (x : snomedct_entity) =
  assoc_to_yojson
    [
      ("SNOMEDCTConcepts", option_to_yojson snomedct_concept_list_to_yojson x.snomedct_concepts);
      ("Traits", option_to_yojson snomedct_trait_list_to_yojson x.traits);
      ("Attributes", option_to_yojson snomedct_attribute_list_to_yojson x.attributes);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson snomedct_entity_type_to_yojson x.type_);
      ("Category", option_to_yojson snomedct_entity_category_to_yojson x.category);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Id", option_to_yojson integer_to_yojson x.id);
    ]

let snomedct_entity_list_to_yojson tree = list_to_yojson snomedct_entity_to_yojson tree

let snomedct_details_to_yojson (x : snomedct_details) =
  assoc_to_yojson
    [
      ("VersionDate", option_to_yojson string__to_yojson x.version_date);
      ("Language", option_to_yojson string__to_yojson x.language);
      ("Edition", option_to_yojson string__to_yojson x.edition);
    ]

let rx_norm_trait_name_to_yojson (x : rx_norm_trait_name) =
  match x with PAST_HISTORY -> `String "PAST_HISTORY" | NEGATION -> `String "NEGATION"

let rx_norm_trait_to_yojson (x : rx_norm_trait) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson rx_norm_trait_name_to_yojson x.name);
    ]

let rx_norm_trait_list_to_yojson tree = list_to_yojson rx_norm_trait_to_yojson tree

let rx_norm_entity_type_to_yojson (x : rx_norm_entity_type) =
  match x with GENERIC_NAME -> `String "GENERIC_NAME" | BRAND_NAME -> `String "BRAND_NAME"

let rx_norm_entity_category_to_yojson (x : rx_norm_entity_category) =
  match x with MEDICATION -> `String "MEDICATION"

let rx_norm_attribute_type_to_yojson (x : rx_norm_attribute_type) =
  match x with
  | STRENGTH -> `String "STRENGTH"
  | ROUTE_OR_MODE -> `String "ROUTE_OR_MODE"
  | RATE -> `String "RATE"
  | FREQUENCY -> `String "FREQUENCY"
  | FORM -> `String "FORM"
  | DURATION -> `String "DURATION"
  | DOSAGE -> `String "DOSAGE"

let rx_norm_attribute_to_yojson (x : rx_norm_attribute) =
  assoc_to_yojson
    [
      ("Traits", option_to_yojson rx_norm_trait_list_to_yojson x.traits);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson rx_norm_attribute_type_to_yojson x.type_);
    ]

let rx_norm_attribute_list_to_yojson tree = list_to_yojson rx_norm_attribute_to_yojson tree

let rx_norm_concept_to_yojson (x : rx_norm_concept) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let rx_norm_concept_list_to_yojson tree = list_to_yojson rx_norm_concept_to_yojson tree

let rx_norm_entity_to_yojson (x : rx_norm_entity) =
  assoc_to_yojson
    [
      ("RxNormConcepts", option_to_yojson rx_norm_concept_list_to_yojson x.rx_norm_concepts);
      ("Traits", option_to_yojson rx_norm_trait_list_to_yojson x.traits);
      ("Attributes", option_to_yojson rx_norm_attribute_list_to_yojson x.attributes);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson rx_norm_entity_type_to_yojson x.type_);
      ("Category", option_to_yojson rx_norm_entity_category_to_yojson x.category);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Id", option_to_yojson integer_to_yojson x.id);
    ]

let rx_norm_entity_list_to_yojson tree = list_to_yojson rx_norm_entity_to_yojson tree
let model_version_to_yojson = string_to_yojson
let max_results_integer_to_yojson = int_to_yojson
let manifest_file_path_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | FAILED -> `String "FAILED"
  | PARTIAL_SUCCESS -> `String "PARTIAL_SUCCESS"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUBMITTED -> `String "SUBMITTED"

let any_length_string_to_yojson = string_to_yojson

let comprehend_medical_async_job_properties_to_yojson (x : comprehend_medical_async_job_properties)
    =
  assoc_to_yojson
    [
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("ManifestFilePath", option_to_yojson manifest_file_path_to_yojson x.manifest_file_path);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let comprehend_medical_async_job_properties_list_to_yojson tree =
  list_to_yojson comprehend_medical_async_job_properties_to_yojson tree

let list_snomedct_inference_jobs_response_to_yojson (x : list_snomedct_inference_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
    ]

let comprehend_medical_async_job_filter_to_yojson (x : comprehend_medical_async_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_snomedct_inference_jobs_request_to_yojson (x : list_snomedct_inference_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
    ]

let list_rx_norm_inference_jobs_response_to_yojson (x : list_rx_norm_inference_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
    ]

let list_rx_norm_inference_jobs_request_to_yojson (x : list_rx_norm_inference_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
    ]

let list_phi_detection_jobs_response_to_yojson (x : list_phi_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
    ]

let list_phi_detection_jobs_request_to_yojson (x : list_phi_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
    ]

let list_icd10cm_inference_jobs_response_to_yojson (x : list_icd10cm_inference_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
    ]

let list_icd10cm_inference_jobs_request_to_yojson (x : list_icd10cm_inference_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
    ]

let list_entities_detection_v2_jobs_response_to_yojson
    (x : list_entities_detection_v2_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ComprehendMedicalAsyncJobPropertiesList",
        option_to_yojson comprehend_medical_async_job_properties_list_to_yojson
          x.comprehend_medical_async_job_properties_list );
    ]

let list_entities_detection_v2_jobs_request_to_yojson (x : list_entities_detection_v2_jobs_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson comprehend_medical_async_job_filter_to_yojson x.filter);
    ]

let invalid_encoding_exception_to_yojson (x : invalid_encoding_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let characters_to_yojson (x : characters) =
  assoc_to_yojson
    [ ("OriginalTextCharacters", option_to_yojson integer_to_yojson x.original_text_characters) ]

let infer_snomedct_response_to_yojson (x : infer_snomedct_response) =
  assoc_to_yojson
    [
      ("Characters", option_to_yojson characters_to_yojson x.characters);
      ("SNOMEDCTDetails", option_to_yojson snomedct_details_to_yojson x.snomedct_details);
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("Entities", Some (snomedct_entity_list_to_yojson x.entities));
    ]

let infer_snomedct_request_to_yojson (x : infer_snomedct_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let infer_rx_norm_response_to_yojson (x : infer_rx_norm_response) =
  assoc_to_yojson
    [
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("Entities", Some (rx_norm_entity_list_to_yojson x.entities));
    ]

let infer_rx_norm_request_to_yojson (x : infer_rx_norm_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let icd10cm_entity_category_to_yojson (x : icd10cm_entity_category) =
  match x with MEDICAL_CONDITION -> `String "MEDICAL_CONDITION"

let icd10cm_entity_type_to_yojson (x : icd10cm_entity_type) =
  match x with TIME_EXPRESSION -> `String "TIME_EXPRESSION" | DX_NAME -> `String "DX_NAME"

let icd10cm_attribute_type_to_yojson (x : icd10cm_attribute_type) =
  match x with
  | TIME_EXPRESSION -> `String "TIME_EXPRESSION"
  | TIME_TO_DX_NAME -> `String "TIME_TO_DX_NAME"
  | QUANTITY -> `String "QUANTITY"
  | QUALITY -> `String "QUALITY"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | DIRECTION -> `String "DIRECTION"
  | ACUITY -> `String "ACUITY"

let icd10cm_trait_name_to_yojson (x : icd10cm_trait_name) =
  match x with
  | LOW_CONFIDENCE -> `String "LOW_CONFIDENCE"
  | HYPOTHETICAL -> `String "HYPOTHETICAL"
  | PERTAINS_TO_FAMILY -> `String "PERTAINS_TO_FAMILY"
  | SYMPTOM -> `String "SYMPTOM"
  | SIGN -> `String "SIGN"
  | DIAGNOSIS -> `String "DIAGNOSIS"
  | NEGATION -> `String "NEGATION"

let icd10cm_trait_to_yojson (x : icd10cm_trait) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson icd10cm_trait_name_to_yojson x.name);
    ]

let icd10cm_trait_list_to_yojson tree = list_to_yojson icd10cm_trait_to_yojson tree

let icd10cm_relationship_type_to_yojson (x : icd10cm_relationship_type) =
  match x with
  | QUALITY -> `String "QUALITY"
  | SYSTEM_ORGAN_SITE -> `String "SYSTEM_ORGAN_SITE"
  | OVERLAP -> `String "OVERLAP"

let icd10cm_attribute_to_yojson (x : icd10cm_attribute) =
  assoc_to_yojson
    [
      ("RelationshipType", option_to_yojson icd10cm_relationship_type_to_yojson x.relationship_type);
      ("Category", option_to_yojson icd10cm_entity_type_to_yojson x.category);
      ("Traits", option_to_yojson icd10cm_trait_list_to_yojson x.traits);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Id", option_to_yojson integer_to_yojson x.id);
      ("RelationshipScore", option_to_yojson float__to_yojson x.relationship_score);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson icd10cm_attribute_type_to_yojson x.type_);
    ]

let icd10cm_attribute_list_to_yojson tree = list_to_yojson icd10cm_attribute_to_yojson tree

let icd10cm_concept_to_yojson (x : icd10cm_concept) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Description", option_to_yojson string__to_yojson x.description);
    ]

let icd10cm_concept_list_to_yojson tree = list_to_yojson icd10cm_concept_to_yojson tree

let icd10cm_entity_to_yojson (x : icd10cm_entity) =
  assoc_to_yojson
    [
      ("ICD10CMConcepts", option_to_yojson icd10cm_concept_list_to_yojson x.icd10cm_concepts);
      ("Traits", option_to_yojson icd10cm_trait_list_to_yojson x.traits);
      ("Attributes", option_to_yojson icd10cm_attribute_list_to_yojson x.attributes);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson icd10cm_entity_type_to_yojson x.type_);
      ("Category", option_to_yojson icd10cm_entity_category_to_yojson x.category);
      ("Text", option_to_yojson ontology_linking_bounded_length_string_to_yojson x.text);
      ("Id", option_to_yojson integer_to_yojson x.id);
    ]

let icd10cm_entity_list_to_yojson tree = list_to_yojson icd10cm_entity_to_yojson tree

let infer_icd10cm_response_to_yojson (x : infer_icd10cm_response) =
  assoc_to_yojson
    [
      ("ModelVersion", option_to_yojson string__to_yojson x.model_version);
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("Entities", Some (icd10cm_entity_list_to_yojson x.entities));
    ]

let infer_icd10cm_request_to_yojson (x : infer_icd10cm_request) =
  assoc_to_yojson [ ("Text", Some (ontology_linking_bounded_length_string_to_yojson x.text)) ]

let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ("Traits", option_to_yojson trait_list_to_yojson x.traits);
      ("Type", option_to_yojson entity_sub_type_to_yojson x.type_);
      ("Category", option_to_yojson entity_type_to_yojson x.category);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Id", option_to_yojson integer_to_yojson x.id);
    ]

let entity_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let detect_phi_response_to_yojson (x : detect_phi_response) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (string__to_yojson x.model_version));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ("Entities", Some (entity_list_to_yojson x.entities));
    ]

let bounded_length_string_to_yojson = string_to_yojson

let detect_phi_request_to_yojson (x : detect_phi_request) =
  assoc_to_yojson [ ("Text", Some (bounded_length_string_to_yojson x.text)) ]

let detect_entities_v2_response_to_yojson (x : detect_entities_v2_response) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (string__to_yojson x.model_version));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ( "UnmappedAttributes",
        option_to_yojson unmapped_attribute_list_to_yojson x.unmapped_attributes );
      ("Entities", Some (entity_list_to_yojson x.entities));
    ]

let detect_entities_v2_request_to_yojson (x : detect_entities_v2_request) =
  assoc_to_yojson [ ("Text", Some (bounded_length_string_to_yojson x.text)) ]

let detect_entities_response_to_yojson (x : detect_entities_response) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (string__to_yojson x.model_version));
      ("PaginationToken", option_to_yojson string__to_yojson x.pagination_token);
      ( "UnmappedAttributes",
        option_to_yojson unmapped_attribute_list_to_yojson x.unmapped_attributes );
      ("Entities", Some (entity_list_to_yojson x.entities));
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
