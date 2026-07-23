open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let adapter_version_to_yojson = string_to_yojson
let adapter_page_to_yojson = string_to_yojson
let adapter_pages_to_yojson tree = list_to_yojson adapter_page_to_yojson tree
let adapter_id_to_yojson = string_to_yojson

let adapter_to_yojson (x : adapter) =
  assoc_to_yojson
    [
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
      ("Pages", option_to_yojson adapter_pages_to_yojson x.pages);
      ("Version", Some (adapter_version_to_yojson x.version));
    ]

let adapter_description_to_yojson = string_to_yojson

let feature_type_to_yojson (x : feature_type) =
  match x with
  | TABLES -> `String "TABLES"
  | FORMS -> `String "FORMS"
  | QUERIES -> `String "QUERIES"
  | SIGNATURES -> `String "SIGNATURES"
  | LAYOUT -> `String "LAYOUT"

let feature_types_to_yojson tree = list_to_yojson feature_type_to_yojson tree
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let adapter_name_to_yojson = string_to_yojson

let adapter_overview_to_yojson (x : adapter_overview) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
    ]

let adapter_list_to_yojson tree = list_to_yojson adapter_overview_to_yojson tree
let s3_object_version_to_yojson = string_to_yojson
let s3_object_name_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("Name", option_to_yojson s3_object_name_to_yojson x.name);
      ("Version", option_to_yojson s3_object_version_to_yojson x.version);
    ]

let adapter_version_dataset_config_to_yojson (x : adapter_version_dataset_config) =
  assoc_to_yojson
    [ ("ManifestS3Object", option_to_yojson s3_object_to_yojson x.manifest_s3_object) ]

let float__to_yojson = float_to_yojson

let evaluation_metric_to_yojson (x : evaluation_metric) =
  assoc_to_yojson
    [
      ("F1Score", option_to_yojson float__to_yojson x.f1_score);
      ("Precision", option_to_yojson float__to_yojson x.precision);
      ("Recall", option_to_yojson float__to_yojson x.recall);
    ]

let adapter_version_evaluation_metric_to_yojson (x : adapter_version_evaluation_metric) =
  assoc_to_yojson
    [
      ("Baseline", option_to_yojson evaluation_metric_to_yojson x.baseline);
      ("AdapterVersion", option_to_yojson evaluation_metric_to_yojson x.adapter_version);
      ("FeatureType", option_to_yojson feature_type_to_yojson x.feature_type);
    ]

let adapter_version_evaluation_metrics_to_yojson tree =
  list_to_yojson adapter_version_evaluation_metric_to_yojson tree

let adapter_version_status_message_to_yojson = string_to_yojson

let adapter_version_status_to_yojson (x : adapter_version_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | AT_RISK -> `String "AT_RISK"
  | DEPRECATED -> `String "DEPRECATED"
  | CREATION_ERROR -> `String "CREATION_ERROR"
  | CREATION_IN_PROGRESS -> `String "CREATION_IN_PROGRESS"

let adapter_version_overview_to_yojson (x : adapter_version_overview) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("Status", option_to_yojson adapter_version_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson adapter_version_status_message_to_yojson x.status_message);
    ]

let adapter_version_list_to_yojson tree = list_to_yojson adapter_version_overview_to_yojson tree
let adapters_to_yojson tree = list_to_yojson adapter_to_yojson tree

let adapters_config_to_yojson (x : adapters_config) =
  assoc_to_yojson [ ("Adapters", Some (adapters_to_yojson x.adapters)) ]

let amazon_resource_name_to_yojson = string_to_yojson

let unsupported_document_exception_to_yojson (x : unsupported_document_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let invalid_s3_object_exception_to_yojson (x : invalid_s3_object_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let human_loop_quota_exceeded_exception_to_yojson (x : human_loop_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let document_too_large_exception_to_yojson (x : document_too_large_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let bad_document_exception_to_yojson (x : bad_document_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson =
  string_to_yojson

let human_loop_activation_reason_to_yojson = string_to_yojson

let human_loop_activation_reasons_to_yojson tree =
  list_to_yojson human_loop_activation_reason_to_yojson tree

let human_loop_arn_to_yojson = string_to_yojson

let human_loop_activation_output_to_yojson (x : human_loop_activation_output) =
  assoc_to_yojson
    [
      ("HumanLoopArn", option_to_yojson human_loop_arn_to_yojson x.human_loop_arn);
      ( "HumanLoopActivationReasons",
        option_to_yojson human_loop_activation_reasons_to_yojson x.human_loop_activation_reasons );
      ( "HumanLoopActivationConditionsEvaluationResults",
        option_to_yojson
          synthesized_json_human_loop_activation_conditions_evaluation_results_to_yojson
          x.human_loop_activation_conditions_evaluation_results );
    ]

let query_page_to_yojson = string_to_yojson
let query_pages_to_yojson tree = list_to_yojson query_page_to_yojson tree
let query_input_to_yojson = string_to_yojson

let query_to_yojson (x : query) =
  assoc_to_yojson
    [
      ("Text", Some (query_input_to_yojson x.text));
      ("Alias", option_to_yojson query_input_to_yojson x.alias);
      ("Pages", option_to_yojson query_pages_to_yojson x.pages);
    ]

let u_integer_to_yojson = int_to_yojson

let selection_status_to_yojson (x : selection_status) =
  match x with SELECTED -> `String "SELECTED" | NOT_SELECTED -> `String "NOT_SELECTED"

let entity_type_to_yojson (x : entity_type) =
  match x with
  | KEY -> `String "KEY"
  | VALUE -> `String "VALUE"
  | COLUMN_HEADER -> `String "COLUMN_HEADER"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | TABLE_FOOTER -> `String "TABLE_FOOTER"
  | TABLE_SECTION_TITLE -> `String "TABLE_SECTION_TITLE"
  | TABLE_SUMMARY -> `String "TABLE_SUMMARY"
  | STRUCTURED_TABLE -> `String "STRUCTURED_TABLE"
  | SEMI_STRUCTURED_TABLE -> `String "SEMI_STRUCTURED_TABLE"

let entity_types_to_yojson tree = list_to_yojson entity_type_to_yojson tree
let non_empty_string_to_yojson = string_to_yojson
let id_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let relationship_type_to_yojson (x : relationship_type) =
  match x with
  | VALUE -> `String "VALUE"
  | CHILD -> `String "CHILD"
  | COMPLEX_FEATURES -> `String "COMPLEX_FEATURES"
  | MERGED_CELL -> `String "MERGED_CELL"
  | TITLE -> `String "TITLE"
  | ANSWER -> `String "ANSWER"
  | TABLE -> `String "TABLE"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | TABLE_FOOTER -> `String "TABLE_FOOTER"

let relationship_to_yojson (x : relationship) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson relationship_type_to_yojson x.type_);
      ("Ids", option_to_yojson id_list_to_yojson x.ids);
    ]

let relationship_list_to_yojson tree = list_to_yojson relationship_to_yojson tree
let angle_to_yojson = float_to_yojson

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("X", option_to_yojson float__to_yojson x.x); ("Y", option_to_yojson float__to_yojson x.y) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Width", option_to_yojson float__to_yojson x.width);
      ("Height", option_to_yojson float__to_yojson x.height);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Top", option_to_yojson float__to_yojson x.top);
    ]

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
      ("RotationAngle", option_to_yojson angle_to_yojson x.rotation_angle);
    ]

let text_type_to_yojson (x : text_type) =
  match x with HANDWRITING -> `String "HANDWRITING" | PRINTED -> `String "PRINTED"

let percent_to_yojson = float_to_yojson

let block_type_to_yojson (x : block_type) =
  match x with
  | KEY_VALUE_SET -> `String "KEY_VALUE_SET"
  | PAGE -> `String "PAGE"
  | LINE -> `String "LINE"
  | WORD -> `String "WORD"
  | TABLE -> `String "TABLE"
  | CELL -> `String "CELL"
  | SELECTION_ELEMENT -> `String "SELECTION_ELEMENT"
  | MERGED_CELL -> `String "MERGED_CELL"
  | TITLE -> `String "TITLE"
  | QUERY -> `String "QUERY"
  | QUERY_RESULT -> `String "QUERY_RESULT"
  | SIGNATURE -> `String "SIGNATURE"
  | TABLE_TITLE -> `String "TABLE_TITLE"
  | TABLE_FOOTER -> `String "TABLE_FOOTER"
  | LAYOUT_TEXT -> `String "LAYOUT_TEXT"
  | LAYOUT_TITLE -> `String "LAYOUT_TITLE"
  | LAYOUT_HEADER -> `String "LAYOUT_HEADER"
  | LAYOUT_FOOTER -> `String "LAYOUT_FOOTER"
  | LAYOUT_SECTION_HEADER -> `String "LAYOUT_SECTION_HEADER"
  | LAYOUT_PAGE_NUMBER -> `String "LAYOUT_PAGE_NUMBER"
  | LAYOUT_LIST -> `String "LAYOUT_LIST"
  | LAYOUT_FIGURE -> `String "LAYOUT_FIGURE"
  | LAYOUT_TABLE -> `String "LAYOUT_TABLE"
  | LAYOUT_KEY_VALUE -> `String "LAYOUT_KEY_VALUE"

let block_to_yojson (x : block) =
  assoc_to_yojson
    [
      ("BlockType", option_to_yojson block_type_to_yojson x.block_type);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("TextType", option_to_yojson text_type_to_yojson x.text_type);
      ("RowIndex", option_to_yojson u_integer_to_yojson x.row_index);
      ("ColumnIndex", option_to_yojson u_integer_to_yojson x.column_index);
      ("RowSpan", option_to_yojson u_integer_to_yojson x.row_span);
      ("ColumnSpan", option_to_yojson u_integer_to_yojson x.column_span);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Id", option_to_yojson non_empty_string_to_yojson x.id);
      ("Relationships", option_to_yojson relationship_list_to_yojson x.relationships);
      ("EntityTypes", option_to_yojson entity_types_to_yojson x.entity_types);
      ("SelectionStatus", option_to_yojson selection_status_to_yojson x.selection_status);
      ("Page", option_to_yojson u_integer_to_yojson x.page);
      ("Query", option_to_yojson query_to_yojson x.query);
    ]

let block_list_to_yojson tree = list_to_yojson block_to_yojson tree

let document_metadata_to_yojson (x : document_metadata) =
  assoc_to_yojson [ ("Pages", option_to_yojson u_integer_to_yojson x.pages) ]

let analyze_document_response_to_yojson (x : analyze_document_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ( "HumanLoopActivationOutput",
        option_to_yojson human_loop_activation_output_to_yojson x.human_loop_activation_output );
      ( "AnalyzeDocumentModelVersion",
        option_to_yojson string__to_yojson x.analyze_document_model_version );
    ]

let queries_to_yojson tree = list_to_yojson query_to_yojson tree

let queries_config_to_yojson (x : queries_config) =
  assoc_to_yojson [ ("Queries", Some (queries_to_yojson x.queries)) ]

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree

let human_loop_data_attributes_to_yojson (x : human_loop_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let flow_definition_arn_to_yojson = string_to_yojson
let human_loop_name_to_yojson = string_to_yojson

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ("HumanLoopName", Some (human_loop_name_to_yojson x.human_loop_name));
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("DataAttributes", option_to_yojson human_loop_data_attributes_to_yojson x.data_attributes);
    ]

let image_blob_to_yojson = blob_to_yojson

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("Bytes", option_to_yojson image_blob_to_yojson x.bytes);
      ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object);
    ]

let analyze_document_request_to_yojson (x : analyze_document_request) =
  assoc_to_yojson
    [
      ("Document", Some (document_to_yojson x.document));
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ("QueriesConfig", option_to_yojson queries_config_to_yojson x.queries_config);
      ("AdaptersConfig", option_to_yojson adapters_config_to_yojson x.adapters_config);
    ]

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let expense_group_property_to_yojson (x : expense_group_property) =
  assoc_to_yojson
    [
      ("Types", option_to_yojson string_list_to_yojson x.types);
      ("Id", option_to_yojson string__to_yojson x.id);
    ]

let expense_group_property_list_to_yojson tree =
  list_to_yojson expense_group_property_to_yojson tree

let expense_currency_to_yojson (x : expense_currency) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson string__to_yojson x.code);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let expense_detection_to_yojson (x : expense_detection) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let expense_type_to_yojson (x : expense_type) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let expense_field_to_yojson (x : expense_field) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson expense_type_to_yojson x.type_);
      ("LabelDetection", option_to_yojson expense_detection_to_yojson x.label_detection);
      ("ValueDetection", option_to_yojson expense_detection_to_yojson x.value_detection);
      ("PageNumber", option_to_yojson u_integer_to_yojson x.page_number);
      ("Currency", option_to_yojson expense_currency_to_yojson x.currency);
      ("GroupProperties", option_to_yojson expense_group_property_list_to_yojson x.group_properties);
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
      ("LineItemGroupIndex", option_to_yojson u_integer_to_yojson x.line_item_group_index);
      ("LineItems", option_to_yojson line_item_list_to_yojson x.line_items);
    ]

let line_item_group_list_to_yojson tree = list_to_yojson line_item_group_to_yojson tree

let expense_document_to_yojson (x : expense_document) =
  assoc_to_yojson
    [
      ("ExpenseIndex", option_to_yojson u_integer_to_yojson x.expense_index);
      ("SummaryFields", option_to_yojson expense_field_list_to_yojson x.summary_fields);
      ("LineItemGroups", option_to_yojson line_item_group_list_to_yojson x.line_item_groups);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
    ]

let expense_document_list_to_yojson tree = list_to_yojson expense_document_to_yojson tree

let analyze_expense_response_to_yojson (x : analyze_expense_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("ExpenseDocuments", option_to_yojson expense_document_list_to_yojson x.expense_documents);
    ]

let analyze_expense_request_to_yojson (x : analyze_expense_request) =
  assoc_to_yojson [ ("Document", Some (document_to_yojson x.document)) ]

let value_type_to_yojson (x : value_type) = match x with DATE -> `String "DATE"

let normalized_value_to_yojson (x : normalized_value) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("ValueType", option_to_yojson value_type_to_yojson x.value_type);
    ]

let analyze_id_detections_to_yojson (x : analyze_id_detections) =
  assoc_to_yojson
    [
      ("Text", Some (string__to_yojson x.text));
      ("NormalizedValue", option_to_yojson normalized_value_to_yojson x.normalized_value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let identity_document_field_to_yojson (x : identity_document_field) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson analyze_id_detections_to_yojson x.type_);
      ("ValueDetection", option_to_yojson analyze_id_detections_to_yojson x.value_detection);
    ]

let identity_document_field_list_to_yojson tree =
  list_to_yojson identity_document_field_to_yojson tree

let identity_document_to_yojson (x : identity_document) =
  assoc_to_yojson
    [
      ("DocumentIndex", option_to_yojson u_integer_to_yojson x.document_index);
      ( "IdentityDocumentFields",
        option_to_yojson identity_document_field_list_to_yojson x.identity_document_fields );
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
    ]

let identity_document_list_to_yojson tree = list_to_yojson identity_document_to_yojson tree

let analyze_id_response_to_yojson (x : analyze_id_response) =
  assoc_to_yojson
    [
      ("IdentityDocuments", option_to_yojson identity_document_list_to_yojson x.identity_documents);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("AnalyzeIDModelVersion", option_to_yojson string__to_yojson x.analyze_id_model_version);
    ]

let document_pages_to_yojson tree = list_to_yojson document_to_yojson tree

let analyze_id_request_to_yojson (x : analyze_id_request) =
  assoc_to_yojson [ ("DocumentPages", Some (document_pages_to_yojson x.document_pages)) ]

let auto_update_to_yojson (x : auto_update) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let client_request_token_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let create_adapter_response_to_yojson (x : create_adapter_response) =
  assoc_to_yojson [ ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let create_adapter_request_to_yojson (x : create_adapter_request) =
  assoc_to_yojson
    [
      ("AdapterName", Some (adapter_name_to_yojson x.adapter_name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let invalid_kms_key_exception_to_yojson (x : invalid_kms_key_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let create_adapter_version_response_to_yojson (x : create_adapter_version_response) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
    ]

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Prefix", option_to_yojson s3_object_name_to_yojson x.s3_prefix);
    ]

let kms_key_id_to_yojson = string_to_yojson

let create_adapter_version_request_to_yojson (x : create_adapter_version_request) =
  assoc_to_yojson
    [
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DatasetConfig", Some (adapter_version_dataset_config_to_yojson x.dataset_config));
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let delete_adapter_response_to_yojson = unit_to_yojson

let delete_adapter_request_to_yojson (x : delete_adapter_request) =
  assoc_to_yojson [ ("AdapterId", Some (adapter_id_to_yojson x.adapter_id)) ]

let delete_adapter_version_response_to_yojson = unit_to_yojson

let delete_adapter_version_request_to_yojson (x : delete_adapter_version_request) =
  assoc_to_yojson
    [
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
      ("AdapterVersion", Some (adapter_version_to_yojson x.adapter_version));
    ]

let detect_document_text_response_to_yojson (x : detect_document_text_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ( "DetectDocumentTextModelVersion",
        option_to_yojson string__to_yojson x.detect_document_text_model_version );
    ]

let detect_document_text_request_to_yojson (x : detect_document_text_request) =
  assoc_to_yojson [ ("Document", Some (document_to_yojson x.document)) ]

let detected_signature_to_yojson (x : detected_signature) =
  assoc_to_yojson [ ("Page", option_to_yojson u_integer_to_yojson x.page) ]

let detected_signature_list_to_yojson tree = list_to_yojson detected_signature_to_yojson tree

let undetected_signature_to_yojson (x : undetected_signature) =
  assoc_to_yojson [ ("Page", option_to_yojson u_integer_to_yojson x.page) ]

let undetected_signature_list_to_yojson tree = list_to_yojson undetected_signature_to_yojson tree
let page_list_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let split_document_to_yojson (x : split_document) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson u_integer_to_yojson x.index);
      ("Pages", option_to_yojson page_list_to_yojson x.pages);
    ]

let split_document_list_to_yojson tree = list_to_yojson split_document_to_yojson tree

let document_group_to_yojson (x : document_group) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson non_empty_string_to_yojson x.type_);
      ("SplitDocuments", option_to_yojson split_document_list_to_yojson x.split_documents);
      ( "DetectedSignatures",
        option_to_yojson detected_signature_list_to_yojson x.detected_signatures );
      ( "UndetectedSignatures",
        option_to_yojson undetected_signature_list_to_yojson x.undetected_signatures );
    ]

let document_group_list_to_yojson tree = list_to_yojson document_group_to_yojson tree

let document_location_to_yojson (x : document_location) =
  assoc_to_yojson [ ("S3Object", option_to_yojson s3_object_to_yojson x.s3_object) ]

let error_code_to_yojson = string_to_yojson

let signature_detection_to_yojson (x : signature_detection) =
  assoc_to_yojson
    [
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
    ]

let signature_detection_list_to_yojson tree = list_to_yojson signature_detection_to_yojson tree

let lending_detection_to_yojson (x : lending_detection) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson string__to_yojson x.text);
      ("SelectionStatus", option_to_yojson selection_status_to_yojson x.selection_status);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let lending_detection_list_to_yojson tree = list_to_yojson lending_detection_to_yojson tree

let lending_field_to_yojson (x : lending_field) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson string__to_yojson x.type_);
      ("KeyDetection", option_to_yojson lending_detection_to_yojson x.key_detection);
      ("ValueDetections", option_to_yojson lending_detection_list_to_yojson x.value_detections);
    ]

let lending_field_list_to_yojson tree = list_to_yojson lending_field_to_yojson tree

let lending_document_to_yojson (x : lending_document) =
  assoc_to_yojson
    [
      ("LendingFields", option_to_yojson lending_field_list_to_yojson x.lending_fields);
      ( "SignatureDetections",
        option_to_yojson signature_detection_list_to_yojson x.signature_detections );
    ]

let extraction_to_yojson (x : extraction) =
  assoc_to_yojson
    [
      ("LendingDocument", option_to_yojson lending_document_to_yojson x.lending_document);
      ("ExpenseDocument", option_to_yojson expense_document_to_yojson x.expense_document);
      ("IdentityDocument", option_to_yojson identity_document_to_yojson x.identity_document);
    ]

let extraction_list_to_yojson tree = list_to_yojson extraction_to_yojson tree

let get_adapter_response_to_yojson (x : get_adapter_response) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let get_adapter_request_to_yojson (x : get_adapter_request) =
  assoc_to_yojson [ ("AdapterId", Some (adapter_id_to_yojson x.adapter_id)) ]

let get_adapter_version_response_to_yojson (x : get_adapter_version_response) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterVersion", option_to_yojson adapter_version_to_yojson x.adapter_version);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("Status", option_to_yojson adapter_version_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson adapter_version_status_message_to_yojson x.status_message);
      ("DatasetConfig", option_to_yojson adapter_version_dataset_config_to_yojson x.dataset_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ( "EvaluationMetrics",
        option_to_yojson adapter_version_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let get_adapter_version_request_to_yojson (x : get_adapter_version_request) =
  assoc_to_yojson
    [
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
      ("AdapterVersion", Some (adapter_version_to_yojson x.adapter_version));
    ]

let invalid_job_id_exception_to_yojson (x : invalid_job_id_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson string__to_yojson x.code);
    ]

let status_message_to_yojson = string_to_yojson
let pages_to_yojson tree = list_to_yojson u_integer_to_yojson tree

let warning_to_yojson (x : warning) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("Pages", option_to_yojson pages_to_yojson x.pages);
    ]

let warnings_to_yojson tree = list_to_yojson warning_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | PARTIAL_SUCCESS -> `String "PARTIAL_SUCCESS"

let get_document_analysis_response_to_yojson (x : get_document_analysis_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "AnalyzeDocumentModelVersion",
        option_to_yojson string__to_yojson x.analyze_document_model_version );
    ]

let max_results_to_yojson = int_to_yojson
let job_id_to_yojson = string_to_yojson

let get_document_analysis_request_to_yojson (x : get_document_analysis_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_document_text_detection_response_to_yojson (x : get_document_text_detection_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Blocks", option_to_yojson block_list_to_yojson x.blocks);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "DetectDocumentTextModelVersion",
        option_to_yojson string__to_yojson x.detect_document_text_model_version );
    ]

let get_document_text_detection_request_to_yojson (x : get_document_text_detection_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let get_expense_analysis_response_to_yojson (x : get_expense_analysis_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ExpenseDocuments", option_to_yojson expense_document_list_to_yojson x.expense_documents);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "AnalyzeExpenseModelVersion",
        option_to_yojson string__to_yojson x.analyze_expense_model_version );
    ]

let get_expense_analysis_request_to_yojson (x : get_expense_analysis_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let prediction_to_yojson (x : prediction) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson non_empty_string_to_yojson x.value);
      ("Confidence", option_to_yojson percent_to_yojson x.confidence);
    ]

let prediction_list_to_yojson tree = list_to_yojson prediction_to_yojson tree

let page_classification_to_yojson (x : page_classification) =
  assoc_to_yojson
    [
      ("PageType", Some (prediction_list_to_yojson x.page_type));
      ("PageNumber", Some (prediction_list_to_yojson x.page_number));
    ]

let lending_result_to_yojson (x : lending_result) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson u_integer_to_yojson x.page);
      ("PageClassification", option_to_yojson page_classification_to_yojson x.page_classification);
      ("Extractions", option_to_yojson extraction_list_to_yojson x.extractions);
    ]

let lending_result_list_to_yojson tree = list_to_yojson lending_result_to_yojson tree

let get_lending_analysis_response_to_yojson (x : get_lending_analysis_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Results", option_to_yojson lending_result_list_to_yojson x.results);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "AnalyzeLendingModelVersion",
        option_to_yojson string__to_yojson x.analyze_lending_model_version );
    ]

let get_lending_analysis_request_to_yojson (x : get_lending_analysis_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let undetected_document_type_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let lending_summary_to_yojson (x : lending_summary) =
  assoc_to_yojson
    [
      ("DocumentGroups", option_to_yojson document_group_list_to_yojson x.document_groups);
      ( "UndetectedDocumentTypes",
        option_to_yojson undetected_document_type_list_to_yojson x.undetected_document_types );
    ]

let get_lending_analysis_summary_response_to_yojson (x : get_lending_analysis_summary_response) =
  assoc_to_yojson
    [
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Summary", option_to_yojson lending_summary_to_yojson x.summary);
      ("Warnings", option_to_yojson warnings_to_yojson x.warnings);
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ( "AnalyzeLendingModelVersion",
        option_to_yojson string__to_yojson x.analyze_lending_model_version );
    ]

let get_lending_analysis_summary_request_to_yojson (x : get_lending_analysis_summary_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let job_tag_to_yojson = string_to_yojson

let list_adapter_versions_response_to_yojson (x : list_adapter_versions_response) =
  assoc_to_yojson
    [
      ("AdapterVersions", option_to_yojson adapter_version_list_to_yojson x.adapter_versions);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_adapter_versions_request_to_yojson (x : list_adapter_versions_request) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AfterCreationTime", option_to_yojson date_time_to_yojson x.after_creation_time);
      ("BeforeCreationTime", option_to_yojson date_time_to_yojson x.before_creation_time);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_adapters_response_to_yojson (x : list_adapters_response) =
  assoc_to_yojson
    [
      ("Adapters", option_to_yojson adapter_list_to_yojson x.adapters);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_adapters_request_to_yojson (x : list_adapters_request) =
  assoc_to_yojson
    [
      ("AfterCreationTime", option_to_yojson date_time_to_yojson x.after_creation_time);
      ("BeforeCreationTime", option_to_yojson date_time_to_yojson x.before_creation_time);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_map_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let role_arn_to_yojson = string_to_yojson
let sns_topic_arn_to_yojson = string_to_yojson

let notification_channel_to_yojson (x : notification_channel) =
  assoc_to_yojson
    [
      ("SNSTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
    ]

let start_document_analysis_response_to_yojson (x : start_document_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_document_analysis_request_to_yojson (x : start_document_analysis_request) =
  assoc_to_yojson
    [
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
      ("FeatureTypes", Some (feature_types_to_yojson x.feature_types));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("QueriesConfig", option_to_yojson queries_config_to_yojson x.queries_config);
      ("AdaptersConfig", option_to_yojson adapters_config_to_yojson x.adapters_config);
    ]

let start_document_text_detection_response_to_yojson (x : start_document_text_detection_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_document_text_detection_request_to_yojson (x : start_document_text_detection_request) =
  assoc_to_yojson
    [
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let start_expense_analysis_response_to_yojson (x : start_expense_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_expense_analysis_request_to_yojson (x : start_expense_analysis_request) =
  assoc_to_yojson
    [
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let start_lending_analysis_response_to_yojson (x : start_lending_analysis_response) =
  assoc_to_yojson [ ("JobId", option_to_yojson job_id_to_yojson x.job_id) ]

let start_lending_analysis_request_to_yojson (x : start_lending_analysis_request) =
  assoc_to_yojson
    [
      ("DocumentLocation", Some (document_location_to_yojson x.document_location));
      ("ClientRequestToken", option_to_yojson client_request_token_to_yojson x.client_request_token);
      ("JobTag", option_to_yojson job_tag_to_yojson x.job_tag);
      ("NotificationChannel", option_to_yojson notification_channel_to_yojson x.notification_channel);
      ("OutputConfig", option_to_yojson output_config_to_yojson x.output_config);
      ("KMSKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_map_to_yojson x.tags));
    ]

let update_adapter_response_to_yojson (x : update_adapter_response) =
  assoc_to_yojson
    [
      ("AdapterId", option_to_yojson adapter_id_to_yojson x.adapter_id);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("CreationTime", option_to_yojson date_time_to_yojson x.creation_time);
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("FeatureTypes", option_to_yojson feature_types_to_yojson x.feature_types);
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
    ]

let update_adapter_request_to_yojson (x : update_adapter_request) =
  assoc_to_yojson
    [
      ("AdapterId", Some (adapter_id_to_yojson x.adapter_id));
      ("Description", option_to_yojson adapter_description_to_yojson x.description);
      ("AdapterName", option_to_yojson adapter_name_to_yojson x.adapter_name);
      ("AutoUpdate", option_to_yojson auto_update_to_yojson x.auto_update);
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]
