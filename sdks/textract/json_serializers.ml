open Smaws_Lib.Json.SerializeHelpers
open Types

let error_code_to_yojson = string_to_yojson
let u_integer_to_yojson = int_to_yojson
let pages_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let warning_to_yojson (x : warning) =
  assoc_to_yojson
    [
      ("Pages", option_to_yojson pages_to_yojson x.pages);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let warnings_to_yojson tree = list_to_yojson warning_to_yojson tree
let value_type_to_yojson (x : value_type) = match x with DATE -> `String "DATE"
let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let adapter_id_to_yojson = string_to_yojson
let adapter_name_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let adapter_description_to_yojson = string_to_yojson

let feature_type_to_yojson (x : feature_type) =
  match x with
  | LAYOUT -> `String "LAYOUT"
  | SIGNATURES -> `String "SIGNATURES"
  | QUERIES -> `String "QUERIES"
  | FORMS -> `String "FORMS"
  | TABLES -> `String "TABLES"

let feature_types_to_yojson tree = list_to_yojson feature_type_to_yojson tree

let auto_update_to_yojson (x : auto_update) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let update_adapter_response_to_yojson (x : update_adapter_response) =
  assoc_to_yojson
    [
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let update_adapter_request_to_yojson (x : update_adapter_request) =
  assoc_to_yojson
    [
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let unsupported_document_exception_to_yojson (x : unsupported_document_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let undetected_signature_to_yojson (x : undetected_signature) =
  assoc_to_yojson [ ("Page", option_to_yojson u_integer_to_yojson x.page) ]

let undetected_signature_list_to_yojson tree = list_to_yojson undetected_signature_to_yojson tree
let non_empty_string_to_yojson = string_to_yojson
let undetected_document_type_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_map_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_s3_object_exception_to_yojson (x : invalid_s3_object_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let invalid_kms_key_exception_to_yojson (x : invalid_kms_key_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let document_too_large_exception_to_yojson (x : document_too_large_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let bad_document_exception_to_yojson (x : bad_document_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let job_id_to_yojson = string_to_yojson

let start_lending_analysis_response_to_yojson (x : start_lending_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let s3_bucket_to_yojson = string_to_yojson
let s3_object_name_to_yojson = string_to_yojson
let s3_object_version_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [
      ("Version", option_to_yojson s3_object_version_to_yojson x.version);
      ("Name", option_to_yojson s3_object_name_to_yojson x.name);
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let document_location_to_yojson (x : document_location) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let client_request_token_to_yojson = string_to_yojson
let job_tag_to_yojson = string_to_yojson
let sns_topic_arn_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson

let notification_channel_to_yojson (x : notification_channel) =
  assoc_to_yojson
    [
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
    ]

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("S3Prefix", option_to_yojson s3_object_name_to_yojson x.s3_prefix);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let kms_key_id_to_yojson = string_to_yojson

let start_lending_analysis_request_to_yojson (x : start_lending_analysis_request) =
  assoc_to_yojson
    [
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
    ]

let start_expense_analysis_response_to_yojson (x : start_expense_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_expense_analysis_request_to_yojson (x : start_expense_analysis_request) =
  assoc_to_yojson
    [
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
    ]

let start_document_text_detection_response_to_yojson (x : start_document_text_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_document_text_detection_request_to_yojson (x : start_document_text_detection_request) =
  assoc_to_yojson
    [
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
    ]

let start_document_analysis_response_to_yojson (x : start_document_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let query_input_to_yojson = string_to_yojson
let query_page_to_yojson = string_to_yojson
let query_pages_to_yojson tree = list_to_yojson query_page_to_yojson tree

let query_to_yojson (x : query) =
  assoc_to_yojson
    [
      ("Pages", option_to_yojson query_pages_to_yojson x.pages);
      ("Alias", option_to_yojson query_input_to_yojson x.alias);
      ("Text", Some (query_input_to_yojson x.text));
    ]

let queries_to_yojson tree = list_to_yojson query_to_yojson tree

let queries_config_to_yojson (x : queries_config) =
  assoc_to_yojson [ ("Queries", Some (queries_to_yojson x.queries)) ]

let adapter_page_to_yojson = string_to_yojson
let adapter_pages_to_yojson tree = list_to_yojson adapter_page_to_yojson tree
let adapter_version_to_yojson = string_to_yojson

let adapter_to_yojson (x : adapter) =
  assoc_to_yojson
    [
      ("Version", Some (adapter_version_to_yojson x.version));
      ("Pages", option_to_yojson adapter_pages_to_yojson x.pages);
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
    ]

let adapters_to_yojson tree = list_to_yojson adapter_to_yojson tree

let adapters_config_to_yojson (x : adapters_config) =
  assoc_to_yojson [ ("Adapters", Some (adapters_to_yojson x.adapters)) ]

let start_document_analysis_request_to_yojson (x : start_document_analysis_request) =
  assoc_to_yojson
    [
      ("AdaptersConfig", option_to_yojson adapters_config_to_yojson x.adapters_config);
      ("QueriesConfig", option_to_yojson queries_config_to_yojson x.queries_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let adapter_version_status_to_yojson (x : adapter_version_status) =
  match x with
  | CREATION_IN_PROGRESS -> `String "CREATION_IN_PROGRESS"
  | CREATION_ERROR -> `String "CREATION_ERROR"
  | DEPRECATED -> `String "DEPRECATED"
  | AT_RISK -> `String "AT_RISK"
  | ACTIVE -> `String "ACTIVE"

let adapter_version_status_message_to_yojson = string_to_yojson

let adapter_version_overview_to_yojson (x : adapter_version_overview) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson adapter_version_status_message_to_yojson x.status_message);
      ("Status", option_to_yojson adapter_version_status_to_yojson x.status);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let adapter_version_list_to_yojson tree = list_to_yojson adapter_version_overview_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_adapter_versions_response_to_yojson (x : list_adapter_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("AdapterVersions", option_to_yojson adapter_version_list_to_yojson x.adapter_versions);
    ]

let max_results_to_yojson = int_to_yojson

let list_adapter_versions_request_to_yojson (x : list_adapter_versions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BeforeCreationTime", option_to_yojson date_time_to_yojson x.before_creation_time);
      ("AfterCreationTime", option_to_yojson date_time_to_yojson x.after_creation_time);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let adapter_overview_to_yojson (x : adapter_overview) =
  assoc_to_yojson
    [
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let adapter_list_to_yojson tree = list_to_yojson adapter_overview_to_yojson tree

let list_adapters_response_to_yojson (x : list_adapters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Adapters", option_to_yojson adapter_list_to_yojson x.adapters);
    ]

let list_adapters_request_to_yojson (x : list_adapters_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BeforeCreationTime", option_to_yojson date_time_to_yojson x.before_creation_time);
      ("AfterCreationTime", option_to_yojson date_time_to_yojson x.after_creation_time);
    ]

let invalid_job_id_exception_to_yojson (x : invalid_job_id_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let document_metadata_to_yojson (x : document_metadata) =
  assoc_to_yojson [ ("Pages", option_to_yojson u_integer_to_yojson x.pages) ]

let job_status_to_yojson (x : job_status) =
  match x with
  | PARTIAL_SUCCESS -> `String "PARTIAL_SUCCESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let page_list_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let split_document_to_yojson (x : split_document) =
  assoc_to_yojson
    [
      ("Pages", option_to_yojson page_list_to_yojson x.pages);
      ("Index", option_to_yojson u_integer_to_yojson x.index);
    ]

let split_document_list_to_yojson tree = list_to_yojson split_document_to_yojson tree

let detected_signature_to_yojson (x : detected_signature) =
  assoc_to_yojson [ ("Page", option_to_yojson u_integer_to_yojson x.page) ]

let detected_signature_list_to_yojson tree = list_to_yojson detected_signature_to_yojson tree

let document_group_to_yojson (x : document_group) =
  assoc_to_yojson
    [
      ( "UndetectedSignatures",
        option_to_yojson undetected_signature_list_to_yojson x.undetected_signatures );
      ( "DetectedSignatures",
        option_to_yojson detected_signature_list_to_yojson x.detected_signatures );
      ("SplitDocuments", option_to_yojson split_document_list_to_yojson x.split_documents);
      ("Type", option_to_yojson non_empty_string_to_yojson x.type_);
    ]

let document_group_list_to_yojson tree = list_to_yojson document_group_to_yojson tree

let lending_summary_to_yojson (x : lending_summary) =
  assoc_to_yojson
    [
      ( "UndetectedDocumentTypes",
        option_to_yojson undetected_document_type_list_to_yojson x.undetected_document_types );
      ("DocumentGroups", option_to_yojson document_group_list_to_yojson x.document_groups);
    ]

let status_message_to_yojson = string_to_yojson

let get_lending_analysis_summary_response_to_yojson (x : get_lending_analysis_summary_response) =
  assoc_to_yojson
    [
      ( "AnalyzeLendingModelVersion",
        option_to_yojson string__to_yojson x.analyze_lending_model_version );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("Summary", option_to_yojson lending_summary_to_yojson x.summary);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let get_lending_analysis_summary_request_to_yojson (x : get_lending_analysis_summary_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let percent_to_yojson = float_to_yojson

let prediction_to_yojson (x : prediction) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Value", option_to_yojson non_empty_string_to_yojson x.value);
    ]

let prediction_list_to_yojson tree = list_to_yojson prediction_to_yojson tree

let page_classification_to_yojson (x : page_classification) =
  assoc_to_yojson
    [
      ("PageNumber", Some (prediction_list_to_yojson x.page_number));
      ("PageType", Some (prediction_list_to_yojson x.page_type));
    ]

let selection_status_to_yojson (x : selection_status) =
  match x with NOT_SELECTED -> `String "NOT_SELECTED" | SELECTED -> `String "SELECTED"

let float__to_yojson = float_to_yojson

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Top", option_to_yojson float__to_yojson x.top);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Height", option_to_yojson float__to_yojson x.height);
      ("Width", option_to_yojson float__to_yojson x.width);
    ]

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("Y", option_to_yojson float__to_yojson x.y); ("X", option_to_yojson float__to_yojson x.x) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree
let angle_to_yojson = float_to_yojson

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("RotationAngle", option_to_yojson angle_to_yojson x.rotation_angle);
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
    ]

let lending_detection_to_yojson (x : lending_detection) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("SelectionStatus", option_to_yojson selection_status_to_yojson x.selection_status);
      ("Text", option_to_yojson string__to_yojson x.text);
    ]

let lending_detection_list_to_yojson tree = list_to_yojson lending_detection_to_yojson tree

let lending_field_to_yojson (x : lending_field) =
  assoc_to_yojson
    [
      ("ValueDetections", option_to_yojson lending_detection_list_to_yojson x.value_detections);
      ("KeyDetection", option_to_yojson lending_detection_to_yojson x.key_detection);
      ("Type", option_to_yojson string__to_yojson x.type_);
    ]

let lending_field_list_to_yojson tree = list_to_yojson lending_field_to_yojson tree

let signature_detection_to_yojson (x : signature_detection) =
  assoc_to_yojson
    [
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let signature_detection_list_to_yojson tree = list_to_yojson signature_detection_to_yojson tree

let lending_document_to_yojson (x : lending_document) =
  assoc_to_yojson
    [
      ( "SignatureDetections",
        option_to_yojson signature_detection_list_to_yojson x.signature_detections );
      ("LendingFields", option_to_yojson lending_field_list_to_yojson x.lending_fields);
    ]

let expense_type_to_yojson (x : expense_type) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Text", option_to_yojson string__to_yojson x.text);
    ]

let expense_detection_to_yojson (x : expense_detection) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Text", option_to_yojson string__to_yojson x.text);
    ]

let expense_currency_to_yojson (x : expense_currency) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let expense_group_property_to_yojson (x : expense_group_property) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson string__to_yojson x.id);
      ("Types", option_to_yojson string_list_to_yojson x.types);
    ]

let expense_group_property_list_to_yojson tree =
  list_to_yojson expense_group_property_to_yojson tree

let expense_field_to_yojson (x : expense_field) =
  assoc_to_yojson
    [
      ("GroupProperties", option_to_yojson expense_group_property_list_to_yojson x.group_properties);
      ("Currency", option_to_yojson expense_currency_to_yojson x.currency);
      ("PageNumber", option_to_yojson u_integer_to_yojson x.page_number);
      ("ValueDetection", option_to_yojson expense_detection_to_yojson x.value_detection);
      ("LabelDetection", option_to_yojson expense_detection_to_yojson x.label_detection);
      ("Type", option_to_yojson expense_type_to_yojson x.type_);
    ]

let expense_field_list_to_yojson tree = list_to_yojson expense_field_to_yojson tree

let line_item_fields_to_yojson (x : line_item_fields) =
  assoc_to_yojson
    [
      ( "LineItemExpenseFields",
        option_to_yojson expense_field_list_to_yojson x.line_item_expense_fields );
    ]

let line_item_list_to_yojson tree = list_to_yojson line_item_fields_to_yojson tree

let line_item_group_to_yojson (x : line_item_group) =
  assoc_to_yojson
    [
      ("LineItems", option_to_yojson line_item_list_to_yojson x.line_items);
      ("LineItemGroupIndex", option_to_yojson u_integer_to_yojson x.line_item_group_index);
    ]

let line_item_group_list_to_yojson tree = list_to_yojson line_item_group_to_yojson tree

let block_type_to_yojson (x : block_type) =
  match x with
  | LAYOUT_KEY_VALUE -> `String "LAYOUT_KEY_VALUE"
  | LAYOUT_TABLE -> `String "LAYOUT_TABLE"
  | LAYOUT_FIGURE -> `String "LAYOUT_FIGURE"
  | LAYOUT_LIST -> `String "LAYOUT_LIST"
  | LAYOUT_PAGE_NUMBER -> `String "LAYOUT_PAGE_NUMBER"
  | LAYOUT_SECTION_HEADER -> `String "LAYOUT_SECTION_HEADER"
  | LAYOUT_FOOTER -> `String "LAYOUT_FOOTER"
  | LAYOUT_HEADER -> `String "LAYOUT_HEADER"
  | LAYOUT_TITLE -> `String "LAYOUT_TITLE"
  | LAYOUT_TEXT -> `String "LAYOUT_TEXT"
  | TABLE_FOOTER -> `String "TABLE_FOOTER"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | SIGNATURE -> `String "SIGNATURE"
  | QUERY_RESULT -> `String "QUERY_RESULT"
  | QUERY -> `String "QUERY"
  | TITLE -> `String "TITLE"
  | MERGED_CELL -> `String "MERGED_CELL"
  | SELECTION_ELEMENT -> `String "SELECTION_ELEMENT"
  | CELL -> `String "CELL"
  | TABLE -> `String "TABLE"
  | WORD -> `String "WORD"
  | LINE -> `String "LINE"
  | PAGE -> `String "PAGE"
  | KEY_VALUE_SET -> `String "KEY_VALUE_SET"

let text_type_to_yojson (x : text_type) =
  match x with PRINTED -> `String "PRINTED" | HANDWRITING -> `String "HANDWRITING"

let relationship_type_to_yojson (x : relationship_type) =
  match x with
  | TABLE_FOOTER -> `String "TABLE_FOOTER"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | TABLE -> `String "TABLE"
  | ANSWER -> `String "ANSWER"
  | TITLE -> `String "TITLE"
  | MERGED_CELL -> `String "MERGED_CELL"
  | COMPLEX_FEATURES -> `String "COMPLEX_FEATURES"
  | CHILD -> `String "CHILD"
  | VALUE -> `String "VALUE"

let id_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let relationship_to_yojson (x : relationship) =
  assoc_to_yojson
    [
      ("Ids", option_to_yojson id_list_to_yojson x.ids);
      ("Type", option_to_yojson relationship_type_to_yojson x.type_);
    ]

let relationship_list_to_yojson tree = list_to_yojson relationship_to_yojson tree

let entity_type_to_yojson (x : entity_type) =
  match x with
  | SEMI_STRUCTURED_TABLE -> `String "SEMI_STRUCTURED_TABLE"
  | STRUCTURED_TABLE -> `String "STRUCTURED_TABLE"
  | TABLE_SUMMARY -> `String "TABLE_SUMMARY"
  | TABLE_SECTION_TITLE -> `String "TABLE_SECTION_TITLE"
  | TABLE_FOOTER -> `String "TABLE_FOOTER"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | COLUMN_HEADER -> `String "COLUMN_HEADER"
  | VALUE -> `String "VALUE"
  | KEY -> `String "KEY"

let entity_types_to_yojson tree = list_to_yojson entity_type_to_yojson tree

let block_to_yojson (x : block) =
  assoc_to_yojson
    [
      ("Query", option_to_yojson query_to_yojson x.query);
      ("Page", option_to_yojson u_integer_to_yojson x.page);
      ("SelectionStatus", option_to_yojson selection_status_to_yojson x.selection_status);
      ("EntityTypes", option_to_yojson entity_types_to_yojson x.entity_types);
      ("Relationships", option_to_yojson relationship_list_to_yojson x.relationships);
      ("Id", option_to_yojson non_empty_string_to_yojson x.id);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("ColumnSpan", option_to_yojson u_integer_to_yojson x.column_span);
      ("RowSpan", option_to_yojson u_integer_to_yojson x.row_span);
      ("ColumnIndex", option_to_yojson u_integer_to_yojson x.column_index);
      ("RowIndex", option_to_yojson u_integer_to_yojson x.row_index);
      ("TextType", option_to_yojson text_type_to_yojson x.text_type);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("BlockType", option_to_yojson block_type_to_yojson x.block_type);
    ]

let block_list_to_yojson tree = list_to_yojson block_to_yojson tree

let expense_document_to_yojson (x : expense_document) =
  assoc_to_yojson
    [
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("LineItemGroups", option_to_yojson line_item_group_list_to_yojson x.line_item_groups);
      ("SummaryFields", option_to_yojson expense_field_list_to_yojson x.summary_fields);
      ("ExpenseIndex", option_to_yojson u_integer_to_yojson x.expense_index);
    ]

let normalized_value_to_yojson (x : normalized_value) =
  assoc_to_yojson
    [
      ("ValueType", option_to_yojson value_type_to_yojson x.value_type);
      ("Value", option_to_yojson string__to_yojson x.value);
    ]

let analyze_id_detections_to_yojson (x : analyze_id_detections) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("NormalizedValue", option_to_yojson normalized_value_to_yojson x.normalized_value);
      ("Text", Some (string__to_yojson x.text));
    ]

let identity_document_field_to_yojson (x : identity_document_field) =
  assoc_to_yojson
    [
      ("ValueDetection", option_to_yojson analyze_id_detections_to_yojson x.value_detection);
      ("Type", option_to_yojson analyze_id_detections_to_yojson x.type_);
    ]

let identity_document_field_list_to_yojson tree =
  list_to_yojson identity_document_field_to_yojson tree

let identity_document_to_yojson (x : identity_document) =
  assoc_to_yojson
    [
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ( "IdentityDocumentFields",
        option_to_yojson identity_document_field_list_to_yojson x.identity_document_fields );
      ("DocumentIndex", option_to_yojson u_integer_to_yojson x.document_index);
    ]

let extraction_to_yojson (x : extraction) =
  assoc_to_yojson
    [
      ("IdentityDocument", option_to_yojson identity_document_to_yojson x.identity_document);
      ("ExpenseDocument", option_to_yojson expense_document_to_yojson x.expense_document);
      ("LendingDocument", option_to_yojson lending_document_to_yojson x.lending_document);
    ]

let extraction_list_to_yojson tree = list_to_yojson extraction_to_yojson tree

let lending_result_to_yojson (x : lending_result) =
  assoc_to_yojson
    [
      ("Extractions", option_to_yojson extraction_list_to_yojson x.extractions);
      ("PageClassification", option_to_yojson page_classification_to_yojson x.page_classification);
      ("Page", option_to_yojson u_integer_to_yojson x.page);
    ]

let lending_result_list_to_yojson tree = list_to_yojson lending_result_to_yojson tree

let get_lending_analysis_response_to_yojson (x : get_lending_analysis_response) =
  assoc_to_yojson
    [
      ( "AnalyzeLendingModelVersion",
        option_to_yojson string__to_yojson x.analyze_lending_model_version );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("Results", option_to_yojson lending_result_list_to_yojson x.results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let get_lending_analysis_request_to_yojson (x : get_lending_analysis_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let expense_document_list_to_yojson tree = list_to_yojson expense_document_to_yojson tree

let get_expense_analysis_response_to_yojson (x : get_expense_analysis_response) =
  assoc_to_yojson
    [
      ( "AnalyzeExpenseModelVersion",
        option_to_yojson string__to_yojson x.analyze_expense_model_version );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("ExpenseDocuments", option_to_yojson expense_document_list_to_yojson x.expense_documents);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let get_expense_analysis_request_to_yojson (x : get_expense_analysis_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let get_document_text_detection_response_to_yojson (x : get_document_text_detection_response) =
  assoc_to_yojson
    [
      ( "DetectDocumentTextModelVersion",
        option_to_yojson string__to_yojson x.detect_document_text_model_version );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let get_document_text_detection_request_to_yojson (x : get_document_text_detection_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let get_document_analysis_response_to_yojson (x : get_document_analysis_response) =
  assoc_to_yojson
    [
      ( "AnalyzeDocumentModelVersion",
        option_to_yojson string__to_yojson x.analyze_document_model_version );
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let get_document_analysis_request_to_yojson (x : get_document_analysis_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let adapter_version_dataset_config_to_yojson (x : adapter_version_dataset_config) =
  assoc_to_yojson
    [ ("ManifestS3Object", option_to_yojson s3_object_to_yojson x.manifest_s3_object) ]

let evaluation_metric_to_yojson (x : evaluation_metric) =
  assoc_to_yojson
    [
      ("Recall", option_to_yojson float__to_yojson x.recall);
      ("Precision", option_to_yojson float__to_yojson x.precision);
      ("F1Score", option_to_yojson float__to_yojson x.f1_score);
    ]

let adapter_version_evaluation_metric_to_yojson (x : adapter_version_evaluation_metric) =
  assoc_to_yojson
    [
      ("FeatureType", option_to_yojson feature_type_to_yojson x.feature_type);
      ("AdapterVersion", option_to_yojson evaluation_metric_to_yojson x.adapter_version);
      ("Baseline", option_to_yojson evaluation_metric_to_yojson x.baseline);
    ]

let adapter_version_evaluation_metrics_to_yojson tree =
  list_to_yojson adapter_version_evaluation_metric_to_yojson tree

let get_adapter_version_response_to_yojson (x : get_adapter_version_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ( "EvaluationMetrics",
        option_to_yojson adapter_version_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DatasetConfig", option_to_yojson adapter_version_dataset_config_to_yojson x.dataset_config);
      ("StatusMessage", option_to_yojson adapter_version_status_message_to_yojson x.status_message);
      ("Status", option_to_yojson adapter_version_status_to_yojson x.status);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let get_adapter_version_request_to_yojson (x : get_adapter_version_request) =
  assoc_to_yojson
    [
      ("AdapterVersion", Some (adapter_version_to_yojson x.adapter_version));
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
    ]

let get_adapter_response_to_yojson (x : get_adapter_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let get_adapter_request_to_yojson (x : get_adapter_request) =
  assoc_to_yojson [ ("AdapterId", Some (adapter_id_to_yojson x.adapter_id)) ]

let detect_document_text_response_to_yojson (x : detect_document_text_response) =
  assoc_to_yojson
    [
      ( "DetectDocumentTextModelVersion",
        option_to_yojson string__to_yojson x.detect_document_text_model_version );
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let image_blob_to_yojson = blob_to_yojson

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
      ("Bytes", option_to_yojson image_blob_to_yojson x.bytes);
    ]

let detect_document_text_request_to_yojson (x : detect_document_text_request) =
  assoc_to_yojson [ ("Document", Some (document_to_yojson x.document)) ]

let delete_adapter_version_response_to_yojson = unit_to_yojson

let delete_adapter_version_request_to_yojson (x : delete_adapter_version_request) =
  assoc_to_yojson
    [
      ("AdapterVersion", Some (adapter_version_to_yojson x.adapter_version));
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
    ]

let delete_adapter_response_to_yojson = unit_to_yojson

let delete_adapter_request_to_yojson (x : delete_adapter_request) =
  assoc_to_yojson [ ("AdapterId", Some (adapter_id_to_yojson x.adapter_id)) ]

let create_adapter_version_response_to_yojson (x : create_adapter_version_response) =
  assoc_to_yojson
    [
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
    ]

let create_adapter_version_request_to_yojson (x : create_adapter_version_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DatasetConfig", Some (adapter_version_dataset_config_to_yojson x.dataset_config));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
    ]

let create_adapter_response_to_yojson (x : create_adapter_response) =
  assoc_to_yojson [ ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id) ]

let create_adapter_request_to_yojson (x : create_adapter_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AdapterName", Some (adapter_name_to_yojson x.adapter_name));
    ]

let identity_document_list_to_yojson tree = list_to_yojson identity_document_to_yojson tree

let analyze_id_response_to_yojson (x : analyze_id_response) =
  assoc_to_yojson
    [
      ("AnalyzeIDModelVersion", option_to_yojson string__to_yojson x.analyze_id_model_version);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("IdentityDocuments", option_to_yojson identity_document_list_to_yojson x.identity_documents);
    ]

let document_pages_to_yojson tree = list_to_yojson document_to_yojson tree

let analyze_id_request_to_yojson (x : analyze_id_request) =
  assoc_to_yojson [ ("DocumentPages", Some (document_pages_to_yojson x.document_pages)) ]

let analyze_expense_response_to_yojson (x : analyze_expense_response) =
  assoc_to_yojson
    [
      ("ExpenseDocuments", option_to_yojson expense_document_list_to_yojson x.expense_documents);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let analyze_expense_request_to_yojson (x : analyze_expense_request) =
  assoc_to_yojson [ ("Document", Some (document_to_yojson x.document)) ]

let human_loop_quota_exceeded_exception_to_yojson (x : human_loop_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
    ]

let human_loop_arn_to_yojson = string_to_yojson
let human_loop_activation_reason_to_yojson = string_to_yojson

let human_loop_activation_reasons_to_yojson tree =
  list_to_yojson human_loop_activation_reason_to_yojson tree

let synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson =
  string_to_yojson

let human_loop_activation_output_to_yojson (x : human_loop_activation_output) =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditionsEvaluationResults",
        option_to_yojson
          synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson
          x.human_loop_activation_conditions_evaluation_results );
      ( "HumanLoopActivationReasons",
        option_to_yojson human_loop_activation_reasons_to_yojson x.human_loop_activation_reasons );
      ("HumanLoopArn", option_to_yojson human_loop_arn_to_yojson x.human_loop_arn);
    ]

let analyze_document_response_to_yojson (x : analyze_document_response) =
  assoc_to_yojson
    [
      ( "AnalyzeDocumentModelVersion",
        option_to_yojson string__to_yojson x.analyze_document_model_version );
      ( "HumanLoopActivationOutput",
        option_to_yojson human_loop_activation_output_to_yojson x.human_loop_activation_output );
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
    ]

let human_loop_name_to_yojson = string_to_yojson
let flow_definition_arn_to_yojson = string_to_yojson

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree

let human_loop_data_attributes_to_yojson (x : human_loop_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ("DataAttributes", option_to_yojson human_loop_data_attributes_to_yojson x.data_attributes);
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("HumanLoopName", Some (human_loop_name_to_yojson x.human_loop_name));
    ]

let analyze_document_request_to_yojson (x : analyze_document_request) =
  assoc_to_yojson
    [
      ("AdaptersConfig", option_to_yojson adapters_config_to_yojson x.adapters_config);
      ("QueriesConfig", option_to_yojson queries_config_to_yojson x.queries_config);
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("Document", Some (document_to_yojson x.document));
    ]
