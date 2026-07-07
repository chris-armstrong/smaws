open Smaws_Lib.Json.SerializeHelpers
open Types

let integer_to_yojson = int_to_yojson

let page_based_warning_code_to_yojson (x : page_based_warning_code) =
  match x with
  | INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL ->
      `String "INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL"
  | INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL ->
      `String "INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL"

let string__to_yojson = string_to_yojson

let warnings_list_item_to_yojson (x : warnings_list_item) =
  assoc_to_yojson
    [
      ("WarnMessage", option_to_yojson string__to_yojson x.warn_message);
      ("WarnCode", option_to_yojson page_based_warning_code_to_yojson x.warn_code);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnets_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("Subnets", Some (subnets_to_yojson x.subnets));
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
    ]

let version_name_to_yojson = string_to_yojson
let comprehend_flywheel_arn_to_yojson = string_to_yojson
let comprehend_model_arn_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson

let language_code_to_yojson (x : language_code) =
  match x with
  | ZH_TW -> `String "zh-TW"
  | ZH -> `String "zh"
  | KO -> `String "ko"
  | JA -> `String "ja"
  | HI -> `String "hi"
  | AR -> `String "ar"
  | PT -> `String "pt"
  | IT -> `String "it"
  | DE -> `String "de"
  | FR -> `String "fr"
  | ES -> `String "es"
  | EN -> `String "en"

let document_classifier_mode_to_yojson (x : document_classifier_mode) =
  match x with MULTI_LABEL -> `String "MULTI_LABEL" | MULTI_CLASS -> `String "MULTI_CLASS"

let label_list_item_to_yojson = string_to_yojson
let labels_list_to_yojson tree = list_to_yojson label_list_item_to_yojson tree

let document_classification_config_to_yojson (x : document_classification_config) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson labels_list_to_yojson x.labels);
      ("Mode", Some (document_classifier_mode_to_yojson x.mode));
    ]

let entity_type_name_to_yojson = string_to_yojson

let entity_types_list_item_to_yojson (x : entity_types_list_item) =
  assoc_to_yojson [ ("Type", Some (entity_type_name_to_yojson x.type_)) ]

let entity_types_list_to_yojson tree = list_to_yojson entity_types_list_item_to_yojson tree

let entity_recognition_config_to_yojson (x : entity_recognition_config) =
  assoc_to_yojson [ ("EntityTypes", Some (entity_types_list_to_yojson x.entity_types)) ]

let task_config_to_yojson (x : task_config) =
  assoc_to_yojson
    [
      ( "EntityRecognitionConfig",
        option_to_yojson entity_recognition_config_to_yojson x.entity_recognition_config );
      ( "DocumentClassificationConfig",
        option_to_yojson document_classification_config_to_yojson x.document_classification_config
      );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let s3_uri_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let data_security_config_to_yojson (x : data_security_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("DataLakeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.data_lake_kms_key_id);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
    ]

let flywheel_status_to_yojson (x : flywheel_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let model_type_to_yojson (x : model_type) =
  match x with
  | ENTITY_RECOGNIZER -> `String "ENTITY_RECOGNIZER"
  | DOCUMENT_CLASSIFIER -> `String "DOCUMENT_CLASSIFIER"

let any_length_string_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let flywheel_iteration_id_to_yojson = string_to_yojson

let flywheel_properties_to_yojson (x : flywheel_properties) =
  assoc_to_yojson
    [
      ( "LatestFlywheelIteration",
        option_to_yojson flywheel_iteration_id_to_yojson x.latest_flywheel_iteration );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
      ("DataSecurityConfig", option_to_yojson data_security_config_to_yojson x.data_security_config);
      ("DataLakeS3Uri", option_to_yojson s3_uri_to_yojson x.data_lake_s3_uri);
      ("TaskConfig", option_to_yojson task_config_to_yojson x.task_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let update_flywheel_response_to_yojson (x : update_flywheel_response) =
  assoc_to_yojson
    [ ("FlywheelProperties", option_to_yojson flywheel_properties_to_yojson x.flywheel_properties) ]

let update_data_security_config_to_yojson (x : update_data_security_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
    ]

let update_flywheel_request_to_yojson (x : update_flywheel_request) =
  assoc_to_yojson
    [
      ( "DataSecurityConfig",
        option_to_yojson update_data_security_config_to_yojson x.data_security_config );
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
    ]

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let kms_key_validation_exception_to_yojson (x : kms_key_validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_reason_to_yojson (x : invalid_request_reason) =
  match x with INVALID_DOCUMENT -> `String "INVALID_DOCUMENT"

let invalid_request_detail_reason_to_yojson (x : invalid_request_detail_reason) =
  match x with
  | TEXTRACT_ACCESS_DENIED -> `String "TEXTRACT_ACCESS_DENIED"
  | PAGE_LIMIT_EXCEEDED -> `String "PAGE_LIMIT_EXCEEDED"
  | UNSUPPORTED_DOC_TYPE -> `String "UNSUPPORTED_DOC_TYPE"
  | DOCUMENT_SIZE_EXCEEDED -> `String "DOCUMENT_SIZE_EXCEEDED"

let invalid_request_detail_to_yojson (x : invalid_request_detail) =
  assoc_to_yojson [ ("Reason", option_to_yojson invalid_request_detail_reason_to_yojson x.reason) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("Detail", option_to_yojson invalid_request_detail_to_yojson x.detail);
      ("Reason", option_to_yojson invalid_request_reason_to_yojson x.reason);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_endpoint_response_to_yojson (x : update_endpoint_response) =
  assoc_to_yojson
    [ ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn) ]

let comprehend_endpoint_arn_to_yojson = string_to_yojson
let inference_units_integer_to_yojson = int_to_yojson

let update_endpoint_request_to_yojson (x : update_endpoint_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ( "DesiredDataAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.desired_data_access_role_arn );
      ( "DesiredInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.desired_inference_units );
      ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn);
      ("EndpointArn", Some (comprehend_endpoint_arn_to_yojson x.endpoint_arn));
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let comprehend_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn));
    ]

let too_many_tag_keys_exception_to_yojson (x : too_many_tag_keys_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let unsupported_language_exception_to_yojson (x : unsupported_language_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let toxic_content_type_to_yojson (x : toxic_content_type) =
  match x with
  | VIOLENCE_OR_THREAT -> `String "VIOLENCE_OR_THREAT"
  | SEXUAL -> `String "SEXUAL"
  | PROFANITY -> `String "PROFANITY"
  | INSULT -> `String "INSULT"
  | HATE_SPEECH -> `String "HATE_SPEECH"
  | HARASSMENT_OR_ABUSE -> `String "HARASSMENT_OR_ABUSE"
  | GRAPHIC -> `String "GRAPHIC"

let float__to_yojson = float_to_yojson

let toxic_content_to_yojson (x : toxic_content) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson toxic_content_type_to_yojson x.name);
    ]

let list_of_toxic_content_to_yojson tree = list_to_yojson toxic_content_to_yojson tree

let toxic_labels_to_yojson (x : toxic_labels) =
  assoc_to_yojson
    [
      ("Toxicity", option_to_yojson float__to_yojson x.toxicity);
      ("Labels", option_to_yojson list_of_toxic_content_to_yojson x.labels);
    ]

let job_id_to_yojson = string_to_yojson
let job_name_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUBMITTED -> `String "SUBMITTED"

let input_format_to_yojson (x : input_format) =
  match x with
  | ONE_DOC_PER_LINE -> `String "ONE_DOC_PER_LINE"
  | ONE_DOC_PER_FILE -> `String "ONE_DOC_PER_FILE"

let document_read_action_to_yojson (x : document_read_action) =
  match x with
  | TEXTRACT_ANALYZE_DOCUMENT -> `String "TEXTRACT_ANALYZE_DOCUMENT"
  | TEXTRACT_DETECT_DOCUMENT_TEXT -> `String "TEXTRACT_DETECT_DOCUMENT_TEXT"

let document_read_mode_to_yojson (x : document_read_mode) =
  match x with
  | FORCE_DOCUMENT_READ_ACTION -> `String "FORCE_DOCUMENT_READ_ACTION"
  | SERVICE_DEFAULT -> `String "SERVICE_DEFAULT"

let document_read_feature_types_to_yojson (x : document_read_feature_types) =
  match x with FORMS -> `String "FORMS" | TABLES -> `String "TABLES"

let list_of_document_read_feature_types_to_yojson tree =
  list_to_yojson document_read_feature_types_to_yojson tree

let document_reader_config_to_yojson (x : document_reader_config) =
  assoc_to_yojson
    [
      ( "FeatureTypes",
        option_to_yojson list_of_document_read_feature_types_to_yojson x.feature_types );
      ("DocumentReadMode", option_to_yojson document_read_mode_to_yojson x.document_read_mode);
      ("DocumentReadAction", Some (document_read_action_to_yojson x.document_read_action));
    ]

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let topics_detection_job_properties_to_yojson (x : topics_detection_job_properties) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("NumberOfTopics", option_to_yojson integer_to_yojson x.number_of_topics);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let topics_detection_job_properties_list_to_yojson tree =
  list_to_yojson topics_detection_job_properties_to_yojson tree

let topics_detection_job_filter_to_yojson (x : topics_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let customer_input_string_to_yojson = string_to_yojson

let text_segment_to_yojson (x : text_segment) =
  assoc_to_yojson [ ("Text", Some (customer_input_string_to_yojson x.text)) ]

let targeted_sentiment_entity_type_to_yojson (x : targeted_sentiment_entity_type) =
  match x with
  | OTHER -> `String "OTHER"
  | ATTRIBUTE -> `String "ATTRIBUTE"
  | QUANTITY -> `String "QUANTITY"
  | DATE -> `String "DATE"
  | EVENT -> `String "EVENT"
  | PERSONAL_TITLE -> `String "PERSONAL_TITLE"
  | GAME -> `String "GAME"
  | SOFTWARE -> `String "SOFTWARE"
  | BOOK -> `String "BOOK"
  | MUSIC -> `String "MUSIC"
  | MOVIE -> `String "MOVIE"
  | COMMERCIAL_ITEM -> `String "COMMERCIAL_ITEM"
  | BRAND -> `String "BRAND"
  | FACILITY -> `String "FACILITY"
  | ORGANIZATION -> `String "ORGANIZATION"
  | LOCATION -> `String "LOCATION"
  | PERSON -> `String "PERSON"

let sentiment_type_to_yojson (x : sentiment_type) =
  match x with
  | MIXED -> `String "MIXED"
  | NEUTRAL -> `String "NEUTRAL"
  | NEGATIVE -> `String "NEGATIVE"
  | POSITIVE -> `String "POSITIVE"

let sentiment_score_to_yojson (x : sentiment_score) =
  assoc_to_yojson
    [
      ("Mixed", option_to_yojson float__to_yojson x.mixed);
      ("Neutral", option_to_yojson float__to_yojson x.neutral);
      ("Negative", option_to_yojson float__to_yojson x.negative);
      ("Positive", option_to_yojson float__to_yojson x.positive);
    ]

let mention_sentiment_to_yojson (x : mention_sentiment) =
  assoc_to_yojson
    [
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
    ]

let targeted_sentiment_mention_to_yojson (x : targeted_sentiment_mention) =
  assoc_to_yojson
    [
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("MentionSentiment", option_to_yojson mention_sentiment_to_yojson x.mention_sentiment);
      ("Type", option_to_yojson targeted_sentiment_entity_type_to_yojson x.type_);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("GroupScore", option_to_yojson float__to_yojson x.group_score);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_descriptive_mention_indices_to_yojson tree = list_to_yojson integer_to_yojson tree
let list_of_mentions_to_yojson tree = list_to_yojson targeted_sentiment_mention_to_yojson tree

let targeted_sentiment_entity_to_yojson (x : targeted_sentiment_entity) =
  assoc_to_yojson
    [
      ("Mentions", option_to_yojson list_of_mentions_to_yojson x.mentions);
      ( "DescriptiveMentionIndex",
        option_to_yojson list_of_descriptive_mention_indices_to_yojson x.descriptive_mention_index
      );
    ]

let targeted_sentiment_detection_job_properties_to_yojson
    (x : targeted_sentiment_detection_job_properties) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let targeted_sentiment_detection_job_properties_list_to_yojson tree =
  list_to_yojson targeted_sentiment_detection_job_properties_to_yojson tree

let targeted_sentiment_detection_job_filter_to_yojson (x : targeted_sentiment_detection_job_filter)
    =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let event_type_string_to_yojson = string_to_yojson
let target_event_types_to_yojson tree = list_to_yojson event_type_string_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn));
    ]

let part_of_speech_tag_type_to_yojson (x : part_of_speech_tag_type) =
  match x with
  | VERB -> `String "VERB"
  | SYM -> `String "SYM"
  | SCONJ -> `String "SCONJ"
  | PUNCT -> `String "PUNCT"
  | PROPN -> `String "PROPN"
  | PRON -> `String "PRON"
  | PART -> `String "PART"
  | O -> `String "O"
  | NUM -> `String "NUM"
  | NOUN -> `String "NOUN"
  | INTJ -> `String "INTJ"
  | DET -> `String "DET"
  | CCONJ -> `String "CCONJ"
  | CONJ -> `String "CONJ"
  | AUX -> `String "AUX"
  | ADV -> `String "ADV"
  | ADP -> `String "ADP"
  | ADJ -> `String "ADJ"

let part_of_speech_tag_to_yojson (x : part_of_speech_tag) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Tag", option_to_yojson part_of_speech_tag_type_to_yojson x.tag);
    ]

let syntax_token_to_yojson (x : syntax_token) =
  assoc_to_yojson
    [
      ("PartOfSpeech", option_to_yojson part_of_speech_tag_to_yojson x.part_of_speech);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("TokenId", option_to_yojson integer_to_yojson x.token_id);
    ]

let syntax_language_code_to_yojson (x : syntax_language_code) =
  match x with
  | PT -> `String "pt"
  | IT -> `String "it"
  | DE -> `String "de"
  | FR -> `String "fr"
  | ES -> `String "es"
  | EN -> `String "en"

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree
let stop_training_entity_recognizer_response_to_yojson = unit_to_yojson
let entity_recognizer_arn_to_yojson = string_to_yojson

let stop_training_entity_recognizer_request_to_yojson (x : stop_training_entity_recognizer_request)
    =
  assoc_to_yojson
    [ ("EntityRecognizerArn", Some (entity_recognizer_arn_to_yojson x.entity_recognizer_arn)) ]

let stop_training_document_classifier_response_to_yojson = unit_to_yojson
let document_classifier_arn_to_yojson = string_to_yojson

let stop_training_document_classifier_request_to_yojson
    (x : stop_training_document_classifier_request) =
  assoc_to_yojson
    [
      ("DocumentClassifierArn", Some (document_classifier_arn_to_yojson x.document_classifier_arn));
    ]

let stop_targeted_sentiment_detection_job_response_to_yojson
    (x : stop_targeted_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_targeted_sentiment_detection_job_request_to_yojson
    (x : stop_targeted_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let job_not_found_exception_to_yojson (x : job_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let stop_sentiment_detection_job_response_to_yojson (x : stop_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_sentiment_detection_job_request_to_yojson (x : stop_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_pii_entities_detection_job_response_to_yojson
    (x : stop_pii_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_pii_entities_detection_job_request_to_yojson (x : stop_pii_entities_detection_job_request)
    =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_key_phrases_detection_job_response_to_yojson (x : stop_key_phrases_detection_job_response)
    =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_key_phrases_detection_job_request_to_yojson (x : stop_key_phrases_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_events_detection_job_response_to_yojson (x : stop_events_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_events_detection_job_request_to_yojson (x : stop_events_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_entities_detection_job_response_to_yojson (x : stop_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_entities_detection_job_request_to_yojson (x : stop_entities_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_dominant_language_detection_job_response_to_yojson
    (x : stop_dominant_language_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let stop_dominant_language_detection_job_request_to_yojson
    (x : stop_dominant_language_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_topics_detection_job_response_to_yojson (x : start_topics_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let number_of_topics_integer_to_yojson = int_to_yojson
let client_request_token_string_to_yojson = string_to_yojson

let start_topics_detection_job_request_to_yojson (x : start_topics_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("NumberOfTopics", option_to_yojson number_of_topics_integer_to_yojson x.number_of_topics);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_targeted_sentiment_detection_job_response_to_yojson
    (x : start_targeted_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_targeted_sentiment_detection_job_request_to_yojson
    (x : start_targeted_sentiment_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_sentiment_detection_job_response_to_yojson (x : start_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_sentiment_detection_job_request_to_yojson (x : start_sentiment_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_pii_entities_detection_job_response_to_yojson
    (x : start_pii_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let pii_entities_detection_mode_to_yojson (x : pii_entities_detection_mode) =
  match x with ONLY_OFFSETS -> `String "ONLY_OFFSETS" | ONLY_REDACTION -> `String "ONLY_REDACTION"

let pii_entity_type_to_yojson (x : pii_entity_type) =
  match x with
  | IN_VOTER_NUMBER -> `String "IN_VOTER_NUMBER"
  | IN_AADHAAR -> `String "IN_AADHAAR"
  | CA_HEALTH_NUMBER -> `String "CA_HEALTH_NUMBER"
  | UK_NATIONAL_HEALTH_SERVICE_NUMBER -> `String "UK_NATIONAL_HEALTH_SERVICE_NUMBER"
  | SWIFT_CODE -> `String "SWIFT_CODE"
  | INTERNATIONAL_BANK_ACCOUNT_NUMBER -> `String "INTERNATIONAL_BANK_ACCOUNT_NUMBER"
  | IN_NREGA -> `String "IN_NREGA"
  | IN_PERMANENT_ACCOUNT_NUMBER -> `String "IN_PERMANENT_ACCOUNT_NUMBER"
  | UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER -> `String "UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER"
  | US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER -> `String "US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER"
  | CA_SOCIAL_INSURANCE_NUMBER -> `String "CA_SOCIAL_INSURANCE_NUMBER"
  | UK_NATIONAL_INSURANCE_NUMBER -> `String "UK_NATIONAL_INSURANCE_NUMBER"
  | VEHICLE_IDENTIFICATION_NUMBER -> `String "VEHICLE_IDENTIFICATION_NUMBER"
  | LICENSE_PLATE -> `String "LICENSE_PLATE"
  | ALL -> `String "ALL"
  | MAC_ADDRESS -> `String "MAC_ADDRESS"
  | IP_ADDRESS -> `String "IP_ADDRESS"
  | AWS_SECRET_KEY -> `String "AWS_SECRET_KEY"
  | AWS_ACCESS_KEY -> `String "AWS_ACCESS_KEY"
  | PASSWORD -> `String "PASSWORD"
  | USERNAME -> `String "USERNAME"
  | AGE -> `String "AGE"
  | URL -> `String "URL"
  | DRIVER_ID -> `String "DRIVER_ID"
  | PASSPORT_NUMBER -> `String "PASSPORT_NUMBER"
  | DATE_TIME -> `String "DATE_TIME"
  | SSN -> `String "SSN"
  | PHONE -> `String "PHONE"
  | NAME -> `String "NAME"
  | ADDRESS -> `String "ADDRESS"
  | EMAIL -> `String "EMAIL"
  | PIN -> `String "PIN"
  | CREDIT_DEBIT_EXPIRY -> `String "CREDIT_DEBIT_EXPIRY"
  | CREDIT_DEBIT_CVV -> `String "CREDIT_DEBIT_CVV"
  | CREDIT_DEBIT_NUMBER -> `String "CREDIT_DEBIT_NUMBER"
  | BANK_ROUTING -> `String "BANK_ROUTING"
  | BANK_ACCOUNT_NUMBER -> `String "BANK_ACCOUNT_NUMBER"

let list_of_pii_entity_types_to_yojson tree = list_to_yojson pii_entity_type_to_yojson tree

let pii_entities_detection_mask_mode_to_yojson (x : pii_entities_detection_mask_mode) =
  match x with
  | REPLACE_WITH_PII_ENTITY_TYPE -> `String "REPLACE_WITH_PII_ENTITY_TYPE"
  | MASK -> `String "MASK"

let mask_character_to_yojson = string_to_yojson

let redaction_config_to_yojson (x : redaction_config) =
  assoc_to_yojson
    [
      ("MaskCharacter", option_to_yojson mask_character_to_yojson x.mask_character);
      ("MaskMode", option_to_yojson pii_entities_detection_mask_mode_to_yojson x.mask_mode);
      ("PiiEntityTypes", option_to_yojson list_of_pii_entity_types_to_yojson x.pii_entity_types);
    ]

let start_pii_entities_detection_job_request_to_yojson
    (x : start_pii_entities_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("RedactionConfig", option_to_yojson redaction_config_to_yojson x.redaction_config);
      ("Mode", Some (pii_entities_detection_mode_to_yojson x.mode));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_key_phrases_detection_job_response_to_yojson
    (x : start_key_phrases_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_key_phrases_detection_job_request_to_yojson (x : start_key_phrases_detection_job_request)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_flywheel_iteration_response_to_yojson (x : start_flywheel_iteration_response) =
  assoc_to_yojson
    [
      ( "FlywheelIterationId",
        option_to_yojson flywheel_iteration_id_to_yojson x.flywheel_iteration_id );
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let start_flywheel_iteration_request_to_yojson (x : start_flywheel_iteration_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        option_to_yojson client_request_token_string_to_yojson x.client_request_token );
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
    ]

let start_events_detection_job_response_to_yojson (x : start_events_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_events_detection_job_request_to_yojson (x : start_events_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TargetEventTypes", Some (target_event_types_to_yojson x.target_event_types));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_entities_detection_job_response_to_yojson (x : start_entities_detection_job_response) =
  assoc_to_yojson
    [
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_entities_detection_job_request_to_yojson (x : start_entities_detection_job_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_dominant_language_detection_job_response_to_yojson
    (x : start_dominant_language_detection_job_response) =
  assoc_to_yojson
    [
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_dominant_language_detection_job_request_to_yojson
    (x : start_dominant_language_detection_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
    ]

let start_document_classification_job_response_to_yojson
    (x : start_document_classification_job_response) =
  assoc_to_yojson
    [
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let start_document_classification_job_request_to_yojson
    (x : start_document_classification_job_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let split_to_yojson (x : split) = match x with TEST -> `String "TEST" | TRAIN -> `String "TRAIN"

let sentiment_detection_job_properties_to_yojson (x : sentiment_detection_job_properties) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let sentiment_detection_job_properties_list_to_yojson tree =
  list_to_yojson sentiment_detection_job_properties_to_yojson tree

let sentiment_detection_job_filter_to_yojson (x : sentiment_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let semi_structured_document_blob_to_yojson = blob_to_yojson
let relationship_type_to_yojson (x : relationship_type) = match x with CHILD -> `String "CHILD"

let relationships_list_item_to_yojson (x : relationships_list_item) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson relationship_type_to_yojson x.type_);
      ("Ids", option_to_yojson string_list_to_yojson x.ids);
    ]

let policy_revision_id_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id) ]

let policy_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ResourcePolicy", Some (policy_to_yojson x.resource_policy));
      ("ResourceArn", Some (comprehend_model_arn_to_yojson x.resource_arn));
    ]

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("Y", option_to_yojson float__to_yojson x.y); ("X", option_to_yojson float__to_yojson x.x) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree

let pii_output_data_config_to_yojson (x : pii_output_data_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let pii_entity_to_yojson (x : pii_entity) =
  assoc_to_yojson
    [
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Type", option_to_yojson pii_entity_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let pii_entities_detection_job_properties_to_yojson (x : pii_entities_detection_job_properties) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson pii_entities_detection_mode_to_yojson x.mode);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("RedactionConfig", option_to_yojson redaction_config_to_yojson x.redaction_config);
      ("OutputDataConfig", option_to_yojson pii_output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let pii_entities_detection_job_properties_list_to_yojson tree =
  list_to_yojson pii_entities_detection_job_properties_to_yojson tree

let pii_entities_detection_job_filter_to_yojson (x : pii_entities_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let page_based_error_code_to_yojson (x : page_based_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | PAGE_SIZE_EXCEEDED -> `String "PAGE_SIZE_EXCEEDED"
  | PAGE_CHARACTERS_EXCEEDED -> `String "PAGE_CHARACTERS_EXCEEDED"
  | TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED"
  | TEXTRACT_BAD_PAGE -> `String "TEXTRACT_BAD_PAGE"

let number_of_documents_to_yojson = long_to_yojson

let model_status_to_yojson (x : model_status) =
  match x with
  | TRAINED_WITH_WARNING -> `String "TRAINED_WITH_WARNING"
  | TRAINED -> `String "TRAINED"
  | IN_ERROR -> `String "IN_ERROR"
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | DELETING -> `String "DELETING"
  | TRAINING -> `String "TRAINING"
  | SUBMITTED -> `String "SUBMITTED"

let max_results_integer_to_yojson = int_to_yojson

let list_topics_detection_jobs_response_to_yojson (x : list_topics_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "TopicsDetectionJobPropertiesList",
        option_to_yojson topics_detection_job_properties_list_to_yojson
          x.topics_detection_job_properties_list );
    ]

let list_topics_detection_jobs_request_to_yojson (x : list_topics_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson topics_detection_job_filter_to_yojson x.filter);
    ]

let invalid_filter_exception_to_yojson (x : invalid_filter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let list_targeted_sentiment_detection_jobs_response_to_yojson
    (x : list_targeted_sentiment_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "TargetedSentimentDetectionJobPropertiesList",
        option_to_yojson targeted_sentiment_detection_job_properties_list_to_yojson
          x.targeted_sentiment_detection_job_properties_list );
    ]

let list_targeted_sentiment_detection_jobs_request_to_yojson
    (x : list_targeted_sentiment_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson targeted_sentiment_detection_job_filter_to_yojson x.filter);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceArn", option_to_yojson comprehend_arn_to_yojson x.resource_arn);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn)) ]

let list_sentiment_detection_jobs_response_to_yojson (x : list_sentiment_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "SentimentDetectionJobPropertiesList",
        option_to_yojson sentiment_detection_job_properties_list_to_yojson
          x.sentiment_detection_job_properties_list );
    ]

let list_sentiment_detection_jobs_request_to_yojson (x : list_sentiment_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson sentiment_detection_job_filter_to_yojson x.filter);
    ]

let list_pii_entities_detection_jobs_response_to_yojson
    (x : list_pii_entities_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "PiiEntitiesDetectionJobPropertiesList",
        option_to_yojson pii_entities_detection_job_properties_list_to_yojson
          x.pii_entities_detection_job_properties_list );
    ]

let list_pii_entities_detection_jobs_request_to_yojson
    (x : list_pii_entities_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson pii_entities_detection_job_filter_to_yojson x.filter);
    ]

let list_of_warnings_to_yojson tree = list_to_yojson warnings_list_item_to_yojson tree
let list_of_toxic_labels_to_yojson tree = list_to_yojson toxic_labels_to_yojson tree
let list_of_text_segments_to_yojson tree = list_to_yojson text_segment_to_yojson tree

let list_of_targeted_sentiment_entities_to_yojson tree =
  list_to_yojson targeted_sentiment_entity_to_yojson tree

let list_of_syntax_tokens_to_yojson tree = list_to_yojson syntax_token_to_yojson tree
let list_of_relationships_to_yojson tree = list_to_yojson relationships_list_item_to_yojson tree
let list_of_pii_entities_to_yojson tree = list_to_yojson pii_entity_to_yojson tree

let document_label_to_yojson (x : document_label) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let list_of_labels_to_yojson tree = list_to_yojson document_label_to_yojson tree

let key_phrase_to_yojson (x : key_phrase) =
  assoc_to_yojson
    [
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_key_phrases_to_yojson tree = list_to_yojson key_phrase_to_yojson tree

let extracted_characters_list_item_to_yojson (x : extracted_characters_list_item) =
  assoc_to_yojson
    [
      ("Count", option_to_yojson integer_to_yojson x.count);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let list_of_extracted_characters_to_yojson tree =
  list_to_yojson extracted_characters_list_item_to_yojson tree

let errors_list_item_to_yojson (x : errors_list_item) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson page_based_error_code_to_yojson x.error_code);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let list_of_errors_to_yojson tree = list_to_yojson errors_list_item_to_yojson tree

let entity_label_to_yojson (x : entity_label) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson pii_entity_type_to_yojson x.name);
    ]

let list_of_entity_labels_to_yojson tree = list_to_yojson entity_label_to_yojson tree

let entity_type_to_yojson (x : entity_type) =
  match x with
  | OTHER -> `String "OTHER"
  | TITLE -> `String "TITLE"
  | QUANTITY -> `String "QUANTITY"
  | DATE -> `String "DATE"
  | EVENT -> `String "EVENT"
  | COMMERCIAL_ITEM -> `String "COMMERCIAL_ITEM"
  | ORGANIZATION -> `String "ORGANIZATION"
  | LOCATION -> `String "LOCATION"
  | PERSON -> `String "PERSON"

let child_block_to_yojson (x : child_block) =
  assoc_to_yojson
    [
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("ChildBlockId", option_to_yojson string__to_yojson x.child_block_id);
    ]

let list_of_child_blocks_to_yojson tree = list_to_yojson child_block_to_yojson tree

let block_reference_to_yojson (x : block_reference) =
  assoc_to_yojson
    [
      ("ChildBlocks", option_to_yojson list_of_child_blocks_to_yojson x.child_blocks);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("BlockId", option_to_yojson string__to_yojson x.block_id);
    ]

let list_of_block_references_to_yojson tree = list_to_yojson block_reference_to_yojson tree

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("BlockReferences", option_to_yojson list_of_block_references_to_yojson x.block_references);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Type", option_to_yojson entity_type_to_yojson x.type_);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_entities_to_yojson tree = list_to_yojson entity_to_yojson tree

let dominant_language_to_yojson (x : dominant_language) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("LanguageCode", option_to_yojson string__to_yojson x.language_code);
    ]

let list_of_dominant_languages_to_yojson tree = list_to_yojson dominant_language_to_yojson tree

let document_type_to_yojson (x : document_type) =
  match x with
  | TEXTRACT_ANALYZE_DOCUMENT_JSON -> `String "TEXTRACT_ANALYZE_DOCUMENT_JSON"
  | TEXTRACT_DETECT_DOCUMENT_TEXT_JSON -> `String "TEXTRACT_DETECT_DOCUMENT_TEXT_JSON"
  | PLAIN_TEXT -> `String "PLAIN_TEXT"
  | IMAGE -> `String "IMAGE"
  | MS_WORD -> `String "MS_WORD"
  | SCANNED_PDF -> `String "SCANNED_PDF"
  | NATIVE_PDF -> `String "NATIVE_PDF"

let document_type_list_item_to_yojson (x : document_type_list_item) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson document_type_to_yojson x.type_);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let list_of_document_type_to_yojson tree = list_to_yojson document_type_list_item_to_yojson tree

let batch_detect_targeted_sentiment_item_result_to_yojson
    (x : batch_detect_targeted_sentiment_item_result) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson list_of_targeted_sentiment_entities_to_yojson x.entities);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_targeted_sentiment_result_to_yojson tree =
  list_to_yojson batch_detect_targeted_sentiment_item_result_to_yojson tree

let batch_detect_syntax_item_result_to_yojson (x : batch_detect_syntax_item_result) =
  assoc_to_yojson
    [
      ("SyntaxTokens", option_to_yojson list_of_syntax_tokens_to_yojson x.syntax_tokens);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_syntax_result_to_yojson tree =
  list_to_yojson batch_detect_syntax_item_result_to_yojson tree

let batch_detect_sentiment_item_result_to_yojson (x : batch_detect_sentiment_item_result) =
  assoc_to_yojson
    [
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_sentiment_result_to_yojson tree =
  list_to_yojson batch_detect_sentiment_item_result_to_yojson tree

let batch_detect_key_phrases_item_result_to_yojson (x : batch_detect_key_phrases_item_result) =
  assoc_to_yojson
    [
      ("KeyPhrases", option_to_yojson list_of_key_phrases_to_yojson x.key_phrases);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_key_phrases_result_to_yojson tree =
  list_to_yojson batch_detect_key_phrases_item_result_to_yojson tree

let batch_detect_entities_item_result_to_yojson (x : batch_detect_entities_item_result) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson list_of_entities_to_yojson x.entities);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_entities_result_to_yojson tree =
  list_to_yojson batch_detect_entities_item_result_to_yojson tree

let batch_detect_dominant_language_item_result_to_yojson
    (x : batch_detect_dominant_language_item_result) =
  assoc_to_yojson
    [
      ("Languages", option_to_yojson list_of_dominant_languages_to_yojson x.languages);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let list_of_detect_dominant_language_result_to_yojson tree =
  list_to_yojson batch_detect_dominant_language_item_result_to_yojson tree

let document_class_to_yojson (x : document_class) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let list_of_classes_to_yojson tree = list_to_yojson document_class_to_yojson tree

let block_type_to_yojson (x : block_type) =
  match x with WORD -> `String "WORD" | LINE -> `String "LINE"

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Width", option_to_yojson float__to_yojson x.width);
      ("Top", option_to_yojson float__to_yojson x.top);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Height", option_to_yojson float__to_yojson x.height);
    ]

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let block_to_yojson (x : block) =
  assoc_to_yojson
    [
      ("Relationships", option_to_yojson list_of_relationships_to_yojson x.relationships);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("BlockType", option_to_yojson block_type_to_yojson x.block_type);
      ("Id", option_to_yojson string__to_yojson x.id);
    ]

let list_of_blocks_to_yojson tree = list_to_yojson block_to_yojson tree

let key_phrases_detection_job_properties_to_yojson (x : key_phrases_detection_job_properties) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let key_phrases_detection_job_properties_list_to_yojson tree =
  list_to_yojson key_phrases_detection_job_properties_to_yojson tree

let list_key_phrases_detection_jobs_response_to_yojson
    (x : list_key_phrases_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "KeyPhrasesDetectionJobPropertiesList",
        option_to_yojson key_phrases_detection_job_properties_list_to_yojson
          x.key_phrases_detection_job_properties_list );
    ]

let key_phrases_detection_job_filter_to_yojson (x : key_phrases_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_key_phrases_detection_jobs_request_to_yojson (x : list_key_phrases_detection_jobs_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson key_phrases_detection_job_filter_to_yojson x.filter);
    ]

let flywheel_summary_to_yojson (x : flywheel_summary) =
  assoc_to_yojson
    [
      ( "LatestFlywheelIteration",
        option_to_yojson flywheel_iteration_id_to_yojson x.latest_flywheel_iteration );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
      ("DataLakeS3Uri", option_to_yojson s3_uri_to_yojson x.data_lake_s3_uri);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let flywheel_summary_list_to_yojson tree = list_to_yojson flywheel_summary_to_yojson tree

let list_flywheels_response_to_yojson (x : list_flywheels_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "FlywheelSummaryList",
        option_to_yojson flywheel_summary_list_to_yojson x.flywheel_summary_list );
    ]

let flywheel_filter_to_yojson (x : flywheel_filter) =
  assoc_to_yojson
    [
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
    ]

let list_flywheels_request_to_yojson (x : list_flywheels_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson flywheel_filter_to_yojson x.filter);
    ]

let flywheel_iteration_status_to_yojson (x : flywheel_iteration_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | EVALUATING -> `String "EVALUATING"
  | TRAINING -> `String "TRAINING"

let double_to_yojson = double_to_yojson

let flywheel_model_evaluation_metrics_to_yojson (x : flywheel_model_evaluation_metrics) =
  assoc_to_yojson
    [
      ("AverageAccuracy", option_to_yojson double_to_yojson x.average_accuracy);
      ("AverageRecall", option_to_yojson double_to_yojson x.average_recall);
      ("AveragePrecision", option_to_yojson double_to_yojson x.average_precision);
      ("AverageF1Score", option_to_yojson double_to_yojson x.average_f1_score);
    ]

let flywheel_iteration_properties_to_yojson (x : flywheel_iteration_properties) =
  assoc_to_yojson
    [
      ( "EvaluationManifestS3Prefix",
        option_to_yojson s3_uri_to_yojson x.evaluation_manifest_s3_prefix );
      ( "TrainedModelMetrics",
        option_to_yojson flywheel_model_evaluation_metrics_to_yojson x.trained_model_metrics );
      ("TrainedModelArn", option_to_yojson comprehend_model_arn_to_yojson x.trained_model_arn);
      ( "EvaluatedModelMetrics",
        option_to_yojson flywheel_model_evaluation_metrics_to_yojson x.evaluated_model_metrics );
      ("EvaluatedModelArn", option_to_yojson comprehend_model_arn_to_yojson x.evaluated_model_arn);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("Status", option_to_yojson flywheel_iteration_status_to_yojson x.status);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "FlywheelIterationId",
        option_to_yojson flywheel_iteration_id_to_yojson x.flywheel_iteration_id );
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let flywheel_iteration_properties_list_to_yojson tree =
  list_to_yojson flywheel_iteration_properties_to_yojson tree

let list_flywheel_iteration_history_response_to_yojson
    (x : list_flywheel_iteration_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "FlywheelIterationPropertiesList",
        option_to_yojson flywheel_iteration_properties_list_to_yojson
          x.flywheel_iteration_properties_list );
    ]

let flywheel_iteration_filter_to_yojson (x : flywheel_iteration_filter) =
  assoc_to_yojson
    [
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let list_flywheel_iteration_history_request_to_yojson (x : list_flywheel_iteration_history_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson flywheel_iteration_filter_to_yojson x.filter);
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
    ]

let events_detection_job_properties_to_yojson (x : events_detection_job_properties) =
  assoc_to_yojson
    [
      ("TargetEventTypes", option_to_yojson target_event_types_to_yojson x.target_event_types);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let events_detection_job_properties_list_to_yojson tree =
  list_to_yojson events_detection_job_properties_to_yojson tree

let list_events_detection_jobs_response_to_yojson (x : list_events_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EventsDetectionJobPropertiesList",
        option_to_yojson events_detection_job_properties_list_to_yojson
          x.events_detection_job_properties_list );
    ]

let events_detection_job_filter_to_yojson (x : events_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_events_detection_jobs_request_to_yojson (x : list_events_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson events_detection_job_filter_to_yojson x.filter);
    ]

let entity_recognizer_data_format_to_yojson (x : entity_recognizer_data_format) =
  match x with
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"

let entity_recognizer_documents_to_yojson (x : entity_recognizer_documents) =
  assoc_to_yojson
    [
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let entity_recognizer_annotations_to_yojson (x : entity_recognizer_annotations) =
  assoc_to_yojson
    [
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let entity_recognizer_entity_list_to_yojson (x : entity_recognizer_entity_list) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let attribute_names_list_item_to_yojson = string_to_yojson
let attribute_names_list_to_yojson tree = list_to_yojson attribute_names_list_item_to_yojson tree

let augmented_manifests_document_type_format_to_yojson
    (x : augmented_manifests_document_type_format) =
  match x with
  | SEMI_STRUCTURED_DOCUMENT -> `String "SEMI_STRUCTURED_DOCUMENT"
  | PLAIN_TEXT_DOCUMENT -> `String "PLAIN_TEXT_DOCUMENT"

let augmented_manifests_list_item_to_yojson (x : augmented_manifests_list_item) =
  assoc_to_yojson
    [
      ( "DocumentType",
        option_to_yojson augmented_manifests_document_type_format_to_yojson x.document_type );
      ("SourceDocumentsS3Uri", option_to_yojson s3_uri_to_yojson x.source_documents_s3_uri);
      ("AnnotationDataS3Uri", option_to_yojson s3_uri_to_yojson x.annotation_data_s3_uri);
      ("AttributeNames", Some (attribute_names_list_to_yojson x.attribute_names));
      ("Split", option_to_yojson split_to_yojson x.split);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let entity_recognizer_augmented_manifests_list_to_yojson tree =
  list_to_yojson augmented_manifests_list_item_to_yojson tree

let entity_recognizer_input_data_config_to_yojson (x : entity_recognizer_input_data_config) =
  assoc_to_yojson
    [
      ( "AugmentedManifests",
        option_to_yojson entity_recognizer_augmented_manifests_list_to_yojson x.augmented_manifests
      );
      ("EntityList", option_to_yojson entity_recognizer_entity_list_to_yojson x.entity_list);
      ("Annotations", option_to_yojson entity_recognizer_annotations_to_yojson x.annotations);
      ("Documents", option_to_yojson entity_recognizer_documents_to_yojson x.documents);
      ("EntityTypes", Some (entity_types_list_to_yojson x.entity_types));
      ("DataFormat", option_to_yojson entity_recognizer_data_format_to_yojson x.data_format);
    ]

let entity_recognizer_evaluation_metrics_to_yojson (x : entity_recognizer_evaluation_metrics) =
  assoc_to_yojson
    [
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("Precision", option_to_yojson double_to_yojson x.precision);
    ]

let entity_types_evaluation_metrics_to_yojson (x : entity_types_evaluation_metrics) =
  assoc_to_yojson
    [
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("Precision", option_to_yojson double_to_yojson x.precision);
    ]

let entity_recognizer_metadata_entity_types_list_item_to_yojson
    (x : entity_recognizer_metadata_entity_types_list_item) =
  assoc_to_yojson
    [
      ("NumberOfTrainMentions", option_to_yojson integer_to_yojson x.number_of_train_mentions);
      ( "EvaluationMetrics",
        option_to_yojson entity_types_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("Type", option_to_yojson any_length_string_to_yojson x.type_);
    ]

let entity_recognizer_metadata_entity_types_list_to_yojson tree =
  list_to_yojson entity_recognizer_metadata_entity_types_list_item_to_yojson tree

let entity_recognizer_metadata_to_yojson (x : entity_recognizer_metadata) =
  assoc_to_yojson
    [
      ( "EntityTypes",
        option_to_yojson entity_recognizer_metadata_entity_types_list_to_yojson x.entity_types );
      ( "EvaluationMetrics",
        option_to_yojson entity_recognizer_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("NumberOfTestDocuments", option_to_yojson integer_to_yojson x.number_of_test_documents);
      ("NumberOfTrainedDocuments", option_to_yojson integer_to_yojson x.number_of_trained_documents);
    ]

let entity_recognizer_output_data_config_to_yojson (x : entity_recognizer_output_data_config) =
  assoc_to_yojson
    [ ("FlywheelStatsS3Prefix", option_to_yojson s3_uri_to_yojson x.flywheel_stats_s3_prefix) ]

let entity_recognizer_properties_to_yojson (x : entity_recognizer_properties) =
  assoc_to_yojson
    [
      ( "OutputDataConfig",
        option_to_yojson entity_recognizer_output_data_config_to_yojson x.output_data_config );
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("SourceModelArn", option_to_yojson entity_recognizer_arn_to_yojson x.source_model_arn);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ( "RecognizerMetadata",
        option_to_yojson entity_recognizer_metadata_to_yojson x.recognizer_metadata );
      ( "InputDataConfig",
        option_to_yojson entity_recognizer_input_data_config_to_yojson x.input_data_config );
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
    ]

let entity_recognizer_properties_list_to_yojson tree =
  list_to_yojson entity_recognizer_properties_to_yojson tree

let list_entity_recognizers_response_to_yojson (x : list_entity_recognizers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EntityRecognizerPropertiesList",
        option_to_yojson entity_recognizer_properties_list_to_yojson
          x.entity_recognizer_properties_list );
    ]

let comprehend_arn_name_to_yojson = string_to_yojson

let entity_recognizer_filter_to_yojson (x : entity_recognizer_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("RecognizerName", option_to_yojson comprehend_arn_name_to_yojson x.recognizer_name);
      ("Status", option_to_yojson model_status_to_yojson x.status);
    ]

let list_entity_recognizers_request_to_yojson (x : list_entity_recognizers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson entity_recognizer_filter_to_yojson x.filter);
    ]

let entity_recognizer_summary_to_yojson (x : entity_recognizer_summary) =
  assoc_to_yojson
    [
      ("LatestVersionStatus", option_to_yojson model_status_to_yojson x.latest_version_status);
      ("LatestVersionName", option_to_yojson version_name_to_yojson x.latest_version_name);
      ("LatestVersionCreatedAt", option_to_yojson timestamp_to_yojson x.latest_version_created_at);
      ("NumberOfVersions", option_to_yojson integer_to_yojson x.number_of_versions);
      ("RecognizerName", option_to_yojson comprehend_arn_name_to_yojson x.recognizer_name);
    ]

let entity_recognizer_summaries_list_to_yojson tree =
  list_to_yojson entity_recognizer_summary_to_yojson tree

let list_entity_recognizer_summaries_response_to_yojson
    (x : list_entity_recognizer_summaries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EntityRecognizerSummariesList",
        option_to_yojson entity_recognizer_summaries_list_to_yojson
          x.entity_recognizer_summaries_list );
    ]

let list_entity_recognizer_summaries_request_to_yojson
    (x : list_entity_recognizer_summaries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let entities_detection_job_properties_to_yojson (x : entities_detection_job_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let entities_detection_job_properties_list_to_yojson tree =
  list_to_yojson entities_detection_job_properties_to_yojson tree

let list_entities_detection_jobs_response_to_yojson (x : list_entities_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EntitiesDetectionJobPropertiesList",
        option_to_yojson entities_detection_job_properties_list_to_yojson
          x.entities_detection_job_properties_list );
    ]

let entities_detection_job_filter_to_yojson (x : entities_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_entities_detection_jobs_request_to_yojson (x : list_entities_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson entities_detection_job_filter_to_yojson x.filter);
    ]

let endpoint_status_to_yojson (x : endpoint_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | IN_SERVICE -> `String "IN_SERVICE"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let endpoint_properties_to_yojson (x : endpoint_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ( "DesiredDataAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.desired_data_access_role_arn );
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "CurrentInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.current_inference_units );
      ( "DesiredInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.desired_inference_units );
      ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn);
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("Status", option_to_yojson endpoint_status_to_yojson x.status);
      ("EndpointArn", option_to_yojson comprehend_endpoint_arn_to_yojson x.endpoint_arn);
    ]

let endpoint_properties_list_to_yojson tree = list_to_yojson endpoint_properties_to_yojson tree

let list_endpoints_response_to_yojson (x : list_endpoints_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EndpointPropertiesList",
        option_to_yojson endpoint_properties_list_to_yojson x.endpoint_properties_list );
    ]

let endpoint_filter_to_yojson (x : endpoint_filter) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("Status", option_to_yojson endpoint_status_to_yojson x.status);
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
    ]

let list_endpoints_request_to_yojson (x : list_endpoints_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson endpoint_filter_to_yojson x.filter);
    ]

let dominant_language_detection_job_properties_to_yojson
    (x : dominant_language_detection_job_properties) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let dominant_language_detection_job_properties_list_to_yojson tree =
  list_to_yojson dominant_language_detection_job_properties_to_yojson tree

let list_dominant_language_detection_jobs_response_to_yojson
    (x : list_dominant_language_detection_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "DominantLanguageDetectionJobPropertiesList",
        option_to_yojson dominant_language_detection_job_properties_list_to_yojson
          x.dominant_language_detection_job_properties_list );
    ]

let dominant_language_detection_job_filter_to_yojson (x : dominant_language_detection_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_dominant_language_detection_jobs_request_to_yojson
    (x : list_dominant_language_detection_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson dominant_language_detection_job_filter_to_yojson x.filter);
    ]

let document_classifier_data_format_to_yojson (x : document_classifier_data_format) =
  match x with
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"

let label_delimiter_to_yojson = string_to_yojson

let document_classifier_augmented_manifests_list_to_yojson tree =
  list_to_yojson augmented_manifests_list_item_to_yojson tree

let document_classifier_document_type_format_to_yojson
    (x : document_classifier_document_type_format) =
  match x with
  | SEMI_STRUCTURED_DOCUMENT -> `String "SEMI_STRUCTURED_DOCUMENT"
  | PLAIN_TEXT_DOCUMENT -> `String "PLAIN_TEXT_DOCUMENT"

let document_classifier_documents_to_yojson (x : document_classifier_documents) =
  assoc_to_yojson
    [
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let document_classifier_input_data_config_to_yojson (x : document_classifier_input_data_config) =
  assoc_to_yojson
    [
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
      ("Documents", option_to_yojson document_classifier_documents_to_yojson x.documents);
      ( "DocumentType",
        option_to_yojson document_classifier_document_type_format_to_yojson x.document_type );
      ( "AugmentedManifests",
        option_to_yojson document_classifier_augmented_manifests_list_to_yojson
          x.augmented_manifests );
      ("LabelDelimiter", option_to_yojson label_delimiter_to_yojson x.label_delimiter);
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ("DataFormat", option_to_yojson document_classifier_data_format_to_yojson x.data_format);
    ]

let document_classifier_output_data_config_to_yojson (x : document_classifier_output_data_config) =
  assoc_to_yojson
    [
      ("FlywheelStatsS3Prefix", option_to_yojson s3_uri_to_yojson x.flywheel_stats_s3_prefix);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
    ]

let classifier_evaluation_metrics_to_yojson (x : classifier_evaluation_metrics) =
  assoc_to_yojson
    [
      ("HammingLoss", option_to_yojson double_to_yojson x.hamming_loss);
      ("MicroF1Score", option_to_yojson double_to_yojson x.micro_f1_score);
      ("MicroRecall", option_to_yojson double_to_yojson x.micro_recall);
      ("MicroPrecision", option_to_yojson double_to_yojson x.micro_precision);
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("Precision", option_to_yojson double_to_yojson x.precision);
      ("Accuracy", option_to_yojson double_to_yojson x.accuracy);
    ]

let classifier_metadata_to_yojson (x : classifier_metadata) =
  assoc_to_yojson
    [
      ( "EvaluationMetrics",
        option_to_yojson classifier_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("NumberOfTestDocuments", option_to_yojson integer_to_yojson x.number_of_test_documents);
      ("NumberOfTrainedDocuments", option_to_yojson integer_to_yojson x.number_of_trained_documents);
      ("NumberOfLabels", option_to_yojson integer_to_yojson x.number_of_labels);
    ]

let document_classifier_properties_to_yojson (x : document_classifier_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("SourceModelArn", option_to_yojson document_classifier_arn_to_yojson x.source_model_arn);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("Mode", option_to_yojson document_classifier_mode_to_yojson x.mode);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("ClassifierMetadata", option_to_yojson classifier_metadata_to_yojson x.classifier_metadata);
      ( "OutputDataConfig",
        option_to_yojson document_classifier_output_data_config_to_yojson x.output_data_config );
      ( "InputDataConfig",
        option_to_yojson document_classifier_input_data_config_to_yojson x.input_data_config );
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
    ]

let document_classifier_properties_list_to_yojson tree =
  list_to_yojson document_classifier_properties_to_yojson tree

let list_document_classifiers_response_to_yojson (x : list_document_classifiers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "DocumentClassifierPropertiesList",
        option_to_yojson document_classifier_properties_list_to_yojson
          x.document_classifier_properties_list );
    ]

let document_classifier_filter_to_yojson (x : document_classifier_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ( "DocumentClassifierName",
        option_to_yojson comprehend_arn_name_to_yojson x.document_classifier_name );
      ("Status", option_to_yojson model_status_to_yojson x.status);
    ]

let list_document_classifiers_request_to_yojson (x : list_document_classifiers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson document_classifier_filter_to_yojson x.filter);
    ]

let document_classifier_summary_to_yojson (x : document_classifier_summary) =
  assoc_to_yojson
    [
      ("LatestVersionStatus", option_to_yojson model_status_to_yojson x.latest_version_status);
      ("LatestVersionName", option_to_yojson version_name_to_yojson x.latest_version_name);
      ("LatestVersionCreatedAt", option_to_yojson timestamp_to_yojson x.latest_version_created_at);
      ("NumberOfVersions", option_to_yojson integer_to_yojson x.number_of_versions);
      ( "DocumentClassifierName",
        option_to_yojson comprehend_arn_name_to_yojson x.document_classifier_name );
    ]

let document_classifier_summaries_list_to_yojson tree =
  list_to_yojson document_classifier_summary_to_yojson tree

let list_document_classifier_summaries_response_to_yojson
    (x : list_document_classifier_summaries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "DocumentClassifierSummariesList",
        option_to_yojson document_classifier_summaries_list_to_yojson
          x.document_classifier_summaries_list );
    ]

let list_document_classifier_summaries_request_to_yojson
    (x : list_document_classifier_summaries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let document_classification_job_properties_to_yojson (x : document_classification_job_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
    ]

let document_classification_job_properties_list_to_yojson tree =
  list_to_yojson document_classification_job_properties_to_yojson tree

let list_document_classification_jobs_response_to_yojson
    (x : list_document_classification_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "DocumentClassificationJobPropertiesList",
        option_to_yojson document_classification_job_properties_list_to_yojson
          x.document_classification_job_properties_list );
    ]

let document_classification_job_filter_to_yojson (x : document_classification_job_filter) =
  assoc_to_yojson
    [
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let list_document_classification_jobs_request_to_yojson
    (x : list_document_classification_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson document_classification_job_filter_to_yojson x.filter);
    ]

let comprehend_dataset_arn_to_yojson = string_to_yojson

let dataset_type_to_yojson (x : dataset_type) =
  match x with TEST -> `String "TEST" | TRAIN -> `String "TRAIN"

let description_to_yojson = string_to_yojson

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | CREATING -> `String "CREATING"

let dataset_properties_to_yojson (x : dataset_properties) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("NumberOfDocuments", option_to_yojson number_of_documents_to_yojson x.number_of_documents);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DatasetS3Uri", option_to_yojson s3_uri_to_yojson x.dataset_s3_uri);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("DatasetName", option_to_yojson comprehend_arn_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson comprehend_dataset_arn_to_yojson x.dataset_arn);
    ]

let dataset_properties_list_to_yojson tree = list_to_yojson dataset_properties_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "DatasetPropertiesList",
        option_to_yojson dataset_properties_list_to_yojson x.dataset_properties_list );
    ]

let dataset_filter_to_yojson (x : dataset_filter) =
  assoc_to_yojson
    [
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Filter", option_to_yojson dataset_filter_to_yojson x.filter);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let import_model_response_to_yojson (x : import_model_response) =
  assoc_to_yojson [ ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn) ]

let import_model_request_to_yojson (x : import_model_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("ModelName", option_to_yojson comprehend_arn_name_to_yojson x.model_name);
      ("SourceModelArn", Some (comprehend_model_arn_to_yojson x.source_model_arn));
    ]

let flywheel_s3_uri_to_yojson = string_to_yojson
let entity_recognizer_endpoint_arn_to_yojson = string_to_yojson

let document_metadata_to_yojson (x : document_metadata) =
  assoc_to_yojson
    [
      ( "ExtractedCharacters",
        option_to_yojson list_of_extracted_characters_to_yojson x.extracted_characters );
      ("Pages", option_to_yojson integer_to_yojson x.pages);
    ]

let document_classifier_endpoint_arn_to_yojson = string_to_yojson

let detect_toxic_content_response_to_yojson (x : detect_toxic_content_response) =
  assoc_to_yojson [ ("ResultList", option_to_yojson list_of_toxic_labels_to_yojson x.result_list) ]

let detect_toxic_content_request_to_yojson (x : detect_toxic_content_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("TextSegments", Some (list_of_text_segments_to_yojson x.text_segments));
    ]

let detect_targeted_sentiment_response_to_yojson (x : detect_targeted_sentiment_response) =
  assoc_to_yojson
    [ ("Entities", option_to_yojson list_of_targeted_sentiment_entities_to_yojson x.entities) ]

let detect_targeted_sentiment_request_to_yojson (x : detect_targeted_sentiment_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Text", Some (customer_input_string_to_yojson x.text));
    ]

let detect_syntax_response_to_yojson (x : detect_syntax_response) =
  assoc_to_yojson
    [ ("SyntaxTokens", option_to_yojson list_of_syntax_tokens_to_yojson x.syntax_tokens) ]

let detect_syntax_request_to_yojson (x : detect_syntax_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (syntax_language_code_to_yojson x.language_code));
      ("Text", Some (customer_input_string_to_yojson x.text));
    ]

let detect_sentiment_response_to_yojson (x : detect_sentiment_response) =
  assoc_to_yojson
    [
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
    ]

let detect_sentiment_request_to_yojson (x : detect_sentiment_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Text", Some (customer_input_string_to_yojson x.text));
    ]

let detect_pii_entities_response_to_yojson (x : detect_pii_entities_response) =
  assoc_to_yojson [ ("Entities", option_to_yojson list_of_pii_entities_to_yojson x.entities) ]

let detect_pii_entities_request_to_yojson (x : detect_pii_entities_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Text", Some (string__to_yojson x.text));
    ]

let detect_key_phrases_response_to_yojson (x : detect_key_phrases_response) =
  assoc_to_yojson [ ("KeyPhrases", option_to_yojson list_of_key_phrases_to_yojson x.key_phrases) ]

let detect_key_phrases_request_to_yojson (x : detect_key_phrases_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Text", Some (customer_input_string_to_yojson x.text));
    ]

let detect_entities_response_to_yojson (x : detect_entities_response) =
  assoc_to_yojson
    [
      ("Errors", option_to_yojson list_of_errors_to_yojson x.errors);
      ("Blocks", option_to_yojson list_of_blocks_to_yojson x.blocks);
      ("DocumentType", option_to_yojson list_of_document_type_to_yojson x.document_type);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("Entities", option_to_yojson list_of_entities_to_yojson x.entities);
    ]

let detect_entities_request_to_yojson (x : detect_entities_request) =
  assoc_to_yojson
    [
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
      ("Bytes", option_to_yojson semi_structured_document_blob_to_yojson x.bytes);
      ("EndpointArn", option_to_yojson entity_recognizer_endpoint_arn_to_yojson x.endpoint_arn);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("Text", option_to_yojson customer_input_string_to_yojson x.text);
    ]

let detect_dominant_language_response_to_yojson (x : detect_dominant_language_response) =
  assoc_to_yojson
    [ ("Languages", option_to_yojson list_of_dominant_languages_to_yojson x.languages) ]

let detect_dominant_language_request_to_yojson (x : detect_dominant_language_request) =
  assoc_to_yojson [ ("Text", Some (customer_input_string_to_yojson x.text)) ]

let describe_topics_detection_job_response_to_yojson (x : describe_topics_detection_job_response) =
  assoc_to_yojson
    [
      ( "TopicsDetectionJobProperties",
        option_to_yojson topics_detection_job_properties_to_yojson x.topics_detection_job_properties
      );
    ]

let describe_topics_detection_job_request_to_yojson (x : describe_topics_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_targeted_sentiment_detection_job_response_to_yojson
    (x : describe_targeted_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ( "TargetedSentimentDetectionJobProperties",
        option_to_yojson targeted_sentiment_detection_job_properties_to_yojson
          x.targeted_sentiment_detection_job_properties );
    ]

let describe_targeted_sentiment_detection_job_request_to_yojson
    (x : describe_targeted_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_sentiment_detection_job_response_to_yojson
    (x : describe_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ( "SentimentDetectionJobProperties",
        option_to_yojson sentiment_detection_job_properties_to_yojson
          x.sentiment_detection_job_properties );
    ]

let describe_sentiment_detection_job_request_to_yojson
    (x : describe_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ResourcePolicy", option_to_yojson policy_to_yojson x.resource_policy);
    ]

let describe_resource_policy_request_to_yojson (x : describe_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (comprehend_model_arn_to_yojson x.resource_arn)) ]

let describe_pii_entities_detection_job_response_to_yojson
    (x : describe_pii_entities_detection_job_response) =
  assoc_to_yojson
    [
      ( "PiiEntitiesDetectionJobProperties",
        option_to_yojson pii_entities_detection_job_properties_to_yojson
          x.pii_entities_detection_job_properties );
    ]

let describe_pii_entities_detection_job_request_to_yojson
    (x : describe_pii_entities_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_key_phrases_detection_job_response_to_yojson
    (x : describe_key_phrases_detection_job_response) =
  assoc_to_yojson
    [
      ( "KeyPhrasesDetectionJobProperties",
        option_to_yojson key_phrases_detection_job_properties_to_yojson
          x.key_phrases_detection_job_properties );
    ]

let describe_key_phrases_detection_job_request_to_yojson
    (x : describe_key_phrases_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_flywheel_response_to_yojson (x : describe_flywheel_response) =
  assoc_to_yojson
    [ ("FlywheelProperties", option_to_yojson flywheel_properties_to_yojson x.flywheel_properties) ]

let describe_flywheel_request_to_yojson (x : describe_flywheel_request) =
  assoc_to_yojson [ ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn)) ]

let describe_flywheel_iteration_response_to_yojson (x : describe_flywheel_iteration_response) =
  assoc_to_yojson
    [
      ( "FlywheelIterationProperties",
        option_to_yojson flywheel_iteration_properties_to_yojson x.flywheel_iteration_properties );
    ]

let describe_flywheel_iteration_request_to_yojson (x : describe_flywheel_iteration_request) =
  assoc_to_yojson
    [
      ("FlywheelIterationId", Some (flywheel_iteration_id_to_yojson x.flywheel_iteration_id));
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
    ]

let describe_events_detection_job_response_to_yojson (x : describe_events_detection_job_response) =
  assoc_to_yojson
    [
      ( "EventsDetectionJobProperties",
        option_to_yojson events_detection_job_properties_to_yojson x.events_detection_job_properties
      );
    ]

let describe_events_detection_job_request_to_yojson (x : describe_events_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_entity_recognizer_response_to_yojson (x : describe_entity_recognizer_response) =
  assoc_to_yojson
    [
      ( "EntityRecognizerProperties",
        option_to_yojson entity_recognizer_properties_to_yojson x.entity_recognizer_properties );
    ]

let describe_entity_recognizer_request_to_yojson (x : describe_entity_recognizer_request) =
  assoc_to_yojson
    [ ("EntityRecognizerArn", Some (entity_recognizer_arn_to_yojson x.entity_recognizer_arn)) ]

let describe_entities_detection_job_response_to_yojson
    (x : describe_entities_detection_job_response) =
  assoc_to_yojson
    [
      ( "EntitiesDetectionJobProperties",
        option_to_yojson entities_detection_job_properties_to_yojson
          x.entities_detection_job_properties );
    ]

let describe_entities_detection_job_request_to_yojson (x : describe_entities_detection_job_request)
    =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_endpoint_response_to_yojson (x : describe_endpoint_response) =
  assoc_to_yojson
    [ ("EndpointProperties", option_to_yojson endpoint_properties_to_yojson x.endpoint_properties) ]

let describe_endpoint_request_to_yojson (x : describe_endpoint_request) =
  assoc_to_yojson [ ("EndpointArn", Some (comprehend_endpoint_arn_to_yojson x.endpoint_arn)) ]

let describe_dominant_language_detection_job_response_to_yojson
    (x : describe_dominant_language_detection_job_response) =
  assoc_to_yojson
    [
      ( "DominantLanguageDetectionJobProperties",
        option_to_yojson dominant_language_detection_job_properties_to_yojson
          x.dominant_language_detection_job_properties );
    ]

let describe_dominant_language_detection_job_request_to_yojson
    (x : describe_dominant_language_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_document_classifier_response_to_yojson (x : describe_document_classifier_response) =
  assoc_to_yojson
    [
      ( "DocumentClassifierProperties",
        option_to_yojson document_classifier_properties_to_yojson x.document_classifier_properties
      );
    ]

let describe_document_classifier_request_to_yojson (x : describe_document_classifier_request) =
  assoc_to_yojson
    [
      ("DocumentClassifierArn", Some (document_classifier_arn_to_yojson x.document_classifier_arn));
    ]

let describe_document_classification_job_response_to_yojson
    (x : describe_document_classification_job_response) =
  assoc_to_yojson
    [
      ( "DocumentClassificationJobProperties",
        option_to_yojson document_classification_job_properties_to_yojson
          x.document_classification_job_properties );
    ]

let describe_document_classification_job_request_to_yojson
    (x : describe_document_classification_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [ ("DatasetProperties", option_to_yojson dataset_properties_to_yojson x.dataset_properties) ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (comprehend_dataset_arn_to_yojson x.dataset_arn)) ]

let delete_resource_policy_response_to_yojson = unit_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ResourceArn", Some (comprehend_model_arn_to_yojson x.resource_arn));
    ]

let delete_flywheel_response_to_yojson = unit_to_yojson

let delete_flywheel_request_to_yojson (x : delete_flywheel_request) =
  assoc_to_yojson [ ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn)) ]

let delete_entity_recognizer_response_to_yojson = unit_to_yojson

let delete_entity_recognizer_request_to_yojson (x : delete_entity_recognizer_request) =
  assoc_to_yojson
    [ ("EntityRecognizerArn", Some (entity_recognizer_arn_to_yojson x.entity_recognizer_arn)) ]

let delete_endpoint_response_to_yojson = unit_to_yojson

let delete_endpoint_request_to_yojson (x : delete_endpoint_request) =
  assoc_to_yojson [ ("EndpointArn", Some (comprehend_endpoint_arn_to_yojson x.endpoint_arn)) ]

let delete_document_classifier_response_to_yojson = unit_to_yojson

let delete_document_classifier_request_to_yojson (x : delete_document_classifier_request) =
  assoc_to_yojson
    [
      ("DocumentClassifierArn", Some (document_classifier_arn_to_yojson x.document_classifier_arn));
    ]

let dataset_augmented_manifests_list_item_to_yojson (x : dataset_augmented_manifests_list_item) =
  assoc_to_yojson
    [
      ( "DocumentType",
        option_to_yojson augmented_manifests_document_type_format_to_yojson x.document_type );
      ("SourceDocumentsS3Uri", option_to_yojson s3_uri_to_yojson x.source_documents_s3_uri);
      ("AnnotationDataS3Uri", option_to_yojson s3_uri_to_yojson x.annotation_data_s3_uri);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("AttributeNames", Some (attribute_names_list_to_yojson x.attribute_names));
    ]

let dataset_augmented_manifests_list_to_yojson tree =
  list_to_yojson dataset_augmented_manifests_list_item_to_yojson tree

let dataset_data_format_to_yojson (x : dataset_data_format) =
  match x with
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"

let dataset_document_classifier_input_data_config_to_yojson
    (x : dataset_document_classifier_input_data_config) =
  assoc_to_yojson
    [
      ("LabelDelimiter", option_to_yojson label_delimiter_to_yojson x.label_delimiter);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let dataset_entity_recognizer_annotations_to_yojson (x : dataset_entity_recognizer_annotations) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let dataset_entity_recognizer_documents_to_yojson (x : dataset_entity_recognizer_documents) =
  assoc_to_yojson
    [
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let dataset_entity_recognizer_entity_list_to_yojson (x : dataset_entity_recognizer_entity_list) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let dataset_entity_recognizer_input_data_config_to_yojson
    (x : dataset_entity_recognizer_input_data_config) =
  assoc_to_yojson
    [
      ("EntityList", option_to_yojson dataset_entity_recognizer_entity_list_to_yojson x.entity_list);
      ("Documents", Some (dataset_entity_recognizer_documents_to_yojson x.documents));
      ("Annotations", option_to_yojson dataset_entity_recognizer_annotations_to_yojson x.annotations);
    ]

let dataset_input_data_config_to_yojson (x : dataset_input_data_config) =
  assoc_to_yojson
    [
      ( "EntityRecognizerInputDataConfig",
        option_to_yojson dataset_entity_recognizer_input_data_config_to_yojson
          x.entity_recognizer_input_data_config );
      ( "DocumentClassifierInputDataConfig",
        option_to_yojson dataset_document_classifier_input_data_config_to_yojson
          x.document_classifier_input_data_config );
      ("DataFormat", option_to_yojson dataset_data_format_to_yojson x.data_format);
      ( "AugmentedManifests",
        option_to_yojson dataset_augmented_manifests_list_to_yojson x.augmented_manifests );
    ]

let customer_input_string_list_to_yojson tree = list_to_yojson customer_input_string_to_yojson tree

let create_flywheel_response_to_yojson (x : create_flywheel_response) =
  assoc_to_yojson
    [
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let create_flywheel_request_to_yojson (x : create_flywheel_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DataSecurityConfig", option_to_yojson data_security_config_to_yojson x.data_security_config);
      ("DataLakeS3Uri", Some (flywheel_s3_uri_to_yojson x.data_lake_s3_uri));
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("TaskConfig", option_to_yojson task_config_to_yojson x.task_config);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("FlywheelName", Some (comprehend_arn_name_to_yojson x.flywheel_name));
    ]

let create_entity_recognizer_response_to_yojson (x : create_entity_recognizer_response) =
  assoc_to_yojson
    [
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
    ]

let create_entity_recognizer_request_to_yojson (x : create_entity_recognizer_request) =
  assoc_to_yojson
    [
      ("ModelPolicy", option_to_yojson policy_to_yojson x.model_policy);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("InputDataConfig", Some (entity_recognizer_input_data_config_to_yojson x.input_data_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("RecognizerName", Some (comprehend_arn_name_to_yojson x.recognizer_name));
    ]

let create_endpoint_response_to_yojson (x : create_endpoint_response) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("EndpointArn", option_to_yojson comprehend_endpoint_arn_to_yojson x.endpoint_arn);
    ]

let comprehend_endpoint_name_to_yojson = string_to_yojson

let create_endpoint_request_to_yojson (x : create_endpoint_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DesiredInferenceUnits", Some (inference_units_integer_to_yojson x.desired_inference_units));
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("EndpointName", Some (comprehend_endpoint_name_to_yojson x.endpoint_name));
    ]

let create_document_classifier_response_to_yojson (x : create_document_classifier_response) =
  assoc_to_yojson
    [
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
    ]

let create_document_classifier_request_to_yojson (x : create_document_classifier_request) =
  assoc_to_yojson
    [
      ("ModelPolicy", option_to_yojson policy_to_yojson x.model_policy);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("Mode", option_to_yojson document_classifier_mode_to_yojson x.mode);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "OutputDataConfig",
        option_to_yojson document_classifier_output_data_config_to_yojson x.output_data_config );
      ("InputDataConfig", Some (document_classifier_input_data_config_to_yojson x.input_data_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("DocumentClassifierName", Some (comprehend_arn_name_to_yojson x.document_classifier_name));
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson
    [ ("DatasetArn", option_to_yojson comprehend_dataset_arn_to_yojson x.dataset_arn) ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("InputDataConfig", Some (dataset_input_data_config_to_yojson x.input_data_config));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("DatasetName", Some (comprehend_arn_name_to_yojson x.dataset_name));
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
    ]

let contains_pii_entities_response_to_yojson (x : contains_pii_entities_response) =
  assoc_to_yojson [ ("Labels", option_to_yojson list_of_entity_labels_to_yojson x.labels) ]

let contains_pii_entities_request_to_yojson (x : contains_pii_entities_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("Text", Some (string__to_yojson x.text));
    ]

let classify_document_response_to_yojson (x : classify_document_response) =
  assoc_to_yojson
    [
      ("Warnings", option_to_yojson list_of_warnings_to_yojson x.warnings);
      ("Errors", option_to_yojson list_of_errors_to_yojson x.errors);
      ("DocumentType", option_to_yojson list_of_document_type_to_yojson x.document_type);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("Labels", option_to_yojson list_of_labels_to_yojson x.labels);
      ("Classes", option_to_yojson list_of_classes_to_yojson x.classes);
    ]

let classify_document_request_to_yojson (x : classify_document_request) =
  assoc_to_yojson
    [
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
      ("Bytes", option_to_yojson semi_structured_document_blob_to_yojson x.bytes);
      ("EndpointArn", Some (document_classifier_endpoint_arn_to_yojson x.endpoint_arn));
      ("Text", option_to_yojson customer_input_string_to_yojson x.text);
    ]

let batch_size_limit_exceeded_exception_to_yojson (x : batch_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let batch_item_error_to_yojson (x : batch_item_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Index", option_to_yojson integer_to_yojson x.index);
    ]

let batch_item_error_list_to_yojson tree = list_to_yojson batch_item_error_to_yojson tree

let batch_detect_targeted_sentiment_response_to_yojson
    (x : batch_detect_targeted_sentiment_response) =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_targeted_sentiment_result_to_yojson x.result_list));
    ]

let batch_detect_targeted_sentiment_request_to_yojson (x : batch_detect_targeted_sentiment_request)
    =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
    ]

let batch_detect_syntax_response_to_yojson (x : batch_detect_syntax_response) =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_syntax_result_to_yojson x.result_list));
    ]

let batch_detect_syntax_request_to_yojson (x : batch_detect_syntax_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (syntax_language_code_to_yojson x.language_code));
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
    ]

let batch_detect_sentiment_response_to_yojson (x : batch_detect_sentiment_response) =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_sentiment_result_to_yojson x.result_list));
    ]

let batch_detect_sentiment_request_to_yojson (x : batch_detect_sentiment_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
    ]

let batch_detect_key_phrases_response_to_yojson (x : batch_detect_key_phrases_response) =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_key_phrases_result_to_yojson x.result_list));
    ]

let batch_detect_key_phrases_request_to_yojson (x : batch_detect_key_phrases_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
    ]

let batch_detect_entities_response_to_yojson (x : batch_detect_entities_response) =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_entities_result_to_yojson x.result_list));
    ]

let batch_detect_entities_request_to_yojson (x : batch_detect_entities_request) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
    ]

let batch_detect_dominant_language_response_to_yojson (x : batch_detect_dominant_language_response)
    =
  assoc_to_yojson
    [
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
      ("ResultList", Some (list_of_detect_dominant_language_result_to_yojson x.result_list));
    ]

let batch_detect_dominant_language_request_to_yojson (x : batch_detect_dominant_language_request) =
  assoc_to_yojson [ ("TextList", Some (customer_input_string_list_to_yojson x.text_list)) ]
