open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : access_denied_exception)

let adapter_version_of_yojson = string_of_yojson
let adapter_page_of_yojson = string_of_yojson
let adapter_pages_of_yojson tree path = list_of_yojson adapter_page_of_yojson tree path
let adapter_id_of_yojson = string_of_yojson

let adapter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path;
     pages = option_of_yojson (value_for_key adapter_pages_of_yojson "Pages") _list path;
     version = value_for_key adapter_version_of_yojson "Version" _list path;
   }
    : adapter)

let adapter_description_of_yojson = string_of_yojson

let feature_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TABLES" -> TABLES
    | `String "FORMS" -> FORMS
    | `String "QUERIES" -> QUERIES
    | `String "SIGNATURES" -> SIGNATURES
    | `String "LAYOUT" -> LAYOUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeatureType" value)
    | _ -> raise (deserialize_wrong_type_error path "FeatureType")
     : feature_type)
    : feature_type)

let feature_types_of_yojson tree path = list_of_yojson feature_type_of_yojson tree path
let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let adapter_name_of_yojson = string_of_yojson

let adapter_overview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_name = option_of_yojson (value_for_key adapter_name_of_yojson "AdapterName") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     feature_types =
       option_of_yojson (value_for_key feature_types_of_yojson "FeatureTypes") _list path;
   }
    : adapter_overview)

let adapter_list_of_yojson tree path = list_of_yojson adapter_overview_of_yojson tree path
let s3_object_version_of_yojson = string_of_yojson
let s3_object_name_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "Bucket") _list path;
     name = option_of_yojson (value_for_key s3_object_name_of_yojson "Name") _list path;
     version = option_of_yojson (value_for_key s3_object_version_of_yojson "Version") _list path;
   }
    : s3_object)

let adapter_version_dataset_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     manifest_s3_object =
       option_of_yojson (value_for_key s3_object_of_yojson "ManifestS3Object") _list path;
   }
    : adapter_version_dataset_config)

let float__of_yojson = float_of_yojson

let evaluation_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     f1_score = option_of_yojson (value_for_key float__of_yojson "F1Score") _list path;
     precision = option_of_yojson (value_for_key float__of_yojson "Precision") _list path;
     recall = option_of_yojson (value_for_key float__of_yojson "Recall") _list path;
   }
    : evaluation_metric)

let adapter_version_evaluation_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline = option_of_yojson (value_for_key evaluation_metric_of_yojson "Baseline") _list path;
     adapter_version =
       option_of_yojson (value_for_key evaluation_metric_of_yojson "AdapterVersion") _list path;
     feature_type = option_of_yojson (value_for_key feature_type_of_yojson "FeatureType") _list path;
   }
    : adapter_version_evaluation_metric)

let adapter_version_evaluation_metrics_of_yojson tree path =
  list_of_yojson adapter_version_evaluation_metric_of_yojson tree path

let adapter_version_status_message_of_yojson = string_of_yojson

let adapter_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "AT_RISK" -> AT_RISK
    | `String "DEPRECATED" -> DEPRECATED
    | `String "CREATION_ERROR" -> CREATION_ERROR
    | `String "CREATION_IN_PROGRESS" -> CREATION_IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AdapterVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AdapterVersionStatus")
     : adapter_version_status)
    : adapter_version_status)

let adapter_version_overview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_version =
       option_of_yojson (value_for_key adapter_version_of_yojson "AdapterVersion") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     feature_types =
       option_of_yojson (value_for_key feature_types_of_yojson "FeatureTypes") _list path;
     status = option_of_yojson (value_for_key adapter_version_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson
         (value_for_key adapter_version_status_message_of_yojson "StatusMessage")
         _list path;
   }
    : adapter_version_overview)

let adapter_version_list_of_yojson tree path =
  list_of_yojson adapter_version_overview_of_yojson tree path

let adapters_of_yojson tree path = list_of_yojson adapter_of_yojson tree path

let adapters_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ adapters = value_for_key adapters_of_yojson "Adapters" _list path } : adapters_config)

let amazon_resource_name_of_yojson = string_of_yojson

let unsupported_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : unsupported_document_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : throttling_exception)

let provisioned_throughput_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : provisioned_throughput_exceeded_exception)

let invalid_s3_object_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : invalid_s3_object_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : invalid_parameter_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : internal_server_error)

let human_loop_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "QuotaCode") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "ServiceCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : human_loop_quota_exceeded_exception)

let document_too_large_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : document_too_large_exception)

let bad_document_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : bad_document_exception)

let synthesized_json_human_loop_activation_conditions_evaluation_results_of_yojson =
  string_of_yojson

let human_loop_activation_reason_of_yojson = string_of_yojson

let human_loop_activation_reasons_of_yojson tree path =
  list_of_yojson human_loop_activation_reason_of_yojson tree path

let human_loop_arn_of_yojson = string_of_yojson

let human_loop_activation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     human_loop_arn =
       option_of_yojson (value_for_key human_loop_arn_of_yojson "HumanLoopArn") _list path;
     human_loop_activation_reasons =
       option_of_yojson
         (value_for_key human_loop_activation_reasons_of_yojson "HumanLoopActivationReasons")
         _list path;
     human_loop_activation_conditions_evaluation_results =
       option_of_yojson
         (value_for_key
            synthesized_json_human_loop_activation_conditions_evaluation_results_of_yojson
            "HumanLoopActivationConditionsEvaluationResults")
         _list path;
   }
    : human_loop_activation_output)

let query_page_of_yojson = string_of_yojson
let query_pages_of_yojson tree path = list_of_yojson query_page_of_yojson tree path
let query_input_of_yojson = string_of_yojson

let query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key query_input_of_yojson "Text" _list path;
     alias = option_of_yojson (value_for_key query_input_of_yojson "Alias") _list path;
     pages = option_of_yojson (value_for_key query_pages_of_yojson "Pages") _list path;
   }
    : query)

let u_integer_of_yojson = int_of_yojson

let selection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SELECTED" -> SELECTED
    | `String "NOT_SELECTED" -> NOT_SELECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SelectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SelectionStatus")
     : selection_status)
    : selection_status)

let entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY" -> KEY
    | `String "VALUE" -> VALUE
    | `String "COLUMN_HEADER" -> COLUMN_HEADER
    | `String "TABLE_TITLE" -> TABLE_TITLE
    | `String "TABLE_FOOTER" -> TABLE_FOOTER
    | `String "TABLE_SECTION_TITLE" -> TABLE_SECTION_TITLE
    | `String "TABLE_SUMMARY" -> TABLE_SUMMARY
    | `String "STRUCTURED_TABLE" -> STRUCTURED_TABLE
    | `String "SEMI_STRUCTURED_TABLE" -> SEMI_STRUCTURED_TABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")
     : entity_type)
    : entity_type)

let entity_types_of_yojson tree path = list_of_yojson entity_type_of_yojson tree path
let non_empty_string_of_yojson = string_of_yojson
let id_list_of_yojson tree path = list_of_yojson non_empty_string_of_yojson tree path

let relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALUE" -> VALUE
    | `String "CHILD" -> CHILD
    | `String "COMPLEX_FEATURES" -> COMPLEX_FEATURES
    | `String "MERGED_CELL" -> MERGED_CELL
    | `String "TITLE" -> TITLE
    | `String "ANSWER" -> ANSWER
    | `String "TABLE" -> TABLE
    | `String "TABLE_TITLE" -> TABLE_TITLE
    | `String "TABLE_FOOTER" -> TABLE_FOOTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationshipType")
     : relationship_type)
    : relationship_type)

let relationship_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key relationship_type_of_yojson "Type") _list path;
     ids = option_of_yojson (value_for_key id_list_of_yojson "Ids") _list path;
   }
    : relationship)

let relationship_list_of_yojson tree path = list_of_yojson relationship_of_yojson tree path
let angle_of_yojson = float_of_yojson

let point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     x = option_of_yojson (value_for_key float__of_yojson "X") _list path;
     y = option_of_yojson (value_for_key float__of_yojson "Y") _list path;
   }
    : point)

let polygon_of_yojson tree path = list_of_yojson point_of_yojson tree path

let bounding_box_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     width = option_of_yojson (value_for_key float__of_yojson "Width") _list path;
     height = option_of_yojson (value_for_key float__of_yojson "Height") _list path;
     left = option_of_yojson (value_for_key float__of_yojson "Left") _list path;
     top = option_of_yojson (value_for_key float__of_yojson "Top") _list path;
   }
    : bounding_box)

let geometry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     polygon = option_of_yojson (value_for_key polygon_of_yojson "Polygon") _list path;
     rotation_angle = option_of_yojson (value_for_key angle_of_yojson "RotationAngle") _list path;
   }
    : geometry)

let text_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HANDWRITING" -> HANDWRITING
    | `String "PRINTED" -> PRINTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextType" value)
    | _ -> raise (deserialize_wrong_type_error path "TextType")
     : text_type)
    : text_type)

let percent_of_yojson = float_of_yojson

let block_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY_VALUE_SET" -> KEY_VALUE_SET
    | `String "PAGE" -> PAGE
    | `String "LINE" -> LINE
    | `String "WORD" -> WORD
    | `String "TABLE" -> TABLE
    | `String "CELL" -> CELL
    | `String "SELECTION_ELEMENT" -> SELECTION_ELEMENT
    | `String "MERGED_CELL" -> MERGED_CELL
    | `String "TITLE" -> TITLE
    | `String "QUERY" -> QUERY
    | `String "QUERY_RESULT" -> QUERY_RESULT
    | `String "SIGNATURE" -> SIGNATURE
    | `String "TABLE_TITLE" -> TABLE_TITLE
    | `String "TABLE_FOOTER" -> TABLE_FOOTER
    | `String "LAYOUT_TEXT" -> LAYOUT_TEXT
    | `String "LAYOUT_TITLE" -> LAYOUT_TITLE
    | `String "LAYOUT_HEADER" -> LAYOUT_HEADER
    | `String "LAYOUT_FOOTER" -> LAYOUT_FOOTER
    | `String "LAYOUT_SECTION_HEADER" -> LAYOUT_SECTION_HEADER
    | `String "LAYOUT_PAGE_NUMBER" -> LAYOUT_PAGE_NUMBER
    | `String "LAYOUT_LIST" -> LAYOUT_LIST
    | `String "LAYOUT_FIGURE" -> LAYOUT_FIGURE
    | `String "LAYOUT_TABLE" -> LAYOUT_TABLE
    | `String "LAYOUT_KEY_VALUE" -> LAYOUT_KEY_VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockType")
     : block_type)
    : block_type)

let block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block_type = option_of_yojson (value_for_key block_type_of_yojson "BlockType") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     text_type = option_of_yojson (value_for_key text_type_of_yojson "TextType") _list path;
     row_index = option_of_yojson (value_for_key u_integer_of_yojson "RowIndex") _list path;
     column_index = option_of_yojson (value_for_key u_integer_of_yojson "ColumnIndex") _list path;
     row_span = option_of_yojson (value_for_key u_integer_of_yojson "RowSpan") _list path;
     column_span = option_of_yojson (value_for_key u_integer_of_yojson "ColumnSpan") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
     id = option_of_yojson (value_for_key non_empty_string_of_yojson "Id") _list path;
     relationships =
       option_of_yojson (value_for_key relationship_list_of_yojson "Relationships") _list path;
     entity_types = option_of_yojson (value_for_key entity_types_of_yojson "EntityTypes") _list path;
     selection_status =
       option_of_yojson (value_for_key selection_status_of_yojson "SelectionStatus") _list path;
     page = option_of_yojson (value_for_key u_integer_of_yojson "Page") _list path;
     query = option_of_yojson (value_for_key query_of_yojson "Query") _list path;
   }
    : block)

let block_list_of_yojson tree path = list_of_yojson block_of_yojson tree path

let document_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pages = option_of_yojson (value_for_key u_integer_of_yojson "Pages") _list path }
    : document_metadata)

let analyze_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
     human_loop_activation_output =
       option_of_yojson
         (value_for_key human_loop_activation_output_of_yojson "HumanLoopActivationOutput")
         _list path;
     analyze_document_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeDocumentModelVersion") _list path;
   }
    : analyze_document_response)

let queries_of_yojson tree path = list_of_yojson query_of_yojson tree path

let queries_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ queries = value_for_key queries_of_yojson "Queries" _list path } : queries_config)

let content_classifier_of_yojson (tree : t) path =
  ((match tree with
    | `String "FreeOfPersonallyIdentifiableInformation" ->
        FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION
    | `String "FreeOfAdultContent" -> FREE_OF_ADULT_CONTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContentClassifier" value)
    | _ -> raise (deserialize_wrong_type_error path "ContentClassifier")
     : content_classifier)
    : content_classifier)

let content_classifiers_of_yojson tree path = list_of_yojson content_classifier_of_yojson tree path

let human_loop_data_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_classifiers =
       option_of_yojson
         (value_for_key content_classifiers_of_yojson "ContentClassifiers")
         _list path;
   }
    : human_loop_data_attributes)

let flow_definition_arn_of_yojson = string_of_yojson
let human_loop_name_of_yojson = string_of_yojson

let human_loop_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     human_loop_name = value_for_key human_loop_name_of_yojson "HumanLoopName" _list path;
     flow_definition_arn =
       value_for_key flow_definition_arn_of_yojson "FlowDefinitionArn" _list path;
     data_attributes =
       option_of_yojson
         (value_for_key human_loop_data_attributes_of_yojson "DataAttributes")
         _list path;
   }
    : human_loop_config)

let image_blob_of_yojson = blob_of_yojson

let document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes = option_of_yojson (value_for_key image_blob_of_yojson "Bytes") _list path;
     s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path;
   }
    : document)

let analyze_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document = value_for_key document_of_yojson "Document" _list path;
     feature_types = value_for_key feature_types_of_yojson "FeatureTypes" _list path;
     human_loop_config =
       option_of_yojson (value_for_key human_loop_config_of_yojson "HumanLoopConfig") _list path;
     queries_config =
       option_of_yojson (value_for_key queries_config_of_yojson "QueriesConfig") _list path;
     adapters_config =
       option_of_yojson (value_for_key adapters_config_of_yojson "AdaptersConfig") _list path;
   }
    : analyze_document_request)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let expense_group_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     types = option_of_yojson (value_for_key string_list_of_yojson "Types") _list path;
     id = option_of_yojson (value_for_key string__of_yojson "Id") _list path;
   }
    : expense_group_property)

let expense_group_property_list_of_yojson tree path =
  list_of_yojson expense_group_property_of_yojson tree path

let expense_currency_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : expense_currency)

let expense_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : expense_detection)

let expense_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : expense_type)

let expense_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key expense_type_of_yojson "Type") _list path;
     label_detection =
       option_of_yojson (value_for_key expense_detection_of_yojson "LabelDetection") _list path;
     value_detection =
       option_of_yojson (value_for_key expense_detection_of_yojson "ValueDetection") _list path;
     page_number = option_of_yojson (value_for_key u_integer_of_yojson "PageNumber") _list path;
     currency = option_of_yojson (value_for_key expense_currency_of_yojson "Currency") _list path;
     group_properties =
       option_of_yojson
         (value_for_key expense_group_property_list_of_yojson "GroupProperties")
         _list path;
   }
    : expense_field)

let expense_field_list_of_yojson tree path = list_of_yojson expense_field_of_yojson tree path

let line_item_fields_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     line_item_expense_fields =
       option_of_yojson
         (value_for_key expense_field_list_of_yojson "LineItemExpenseFields")
         _list path;
   }
    : line_item_fields)

let line_item_list_of_yojson tree path = list_of_yojson line_item_fields_of_yojson tree path

let line_item_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     line_item_group_index =
       option_of_yojson (value_for_key u_integer_of_yojson "LineItemGroupIndex") _list path;
     line_items = option_of_yojson (value_for_key line_item_list_of_yojson "LineItems") _list path;
   }
    : line_item_group)

let line_item_group_list_of_yojson tree path = list_of_yojson line_item_group_of_yojson tree path

let expense_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expense_index = option_of_yojson (value_for_key u_integer_of_yojson "ExpenseIndex") _list path;
     summary_fields =
       option_of_yojson (value_for_key expense_field_list_of_yojson "SummaryFields") _list path;
     line_item_groups =
       option_of_yojson (value_for_key line_item_group_list_of_yojson "LineItemGroups") _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
   }
    : expense_document)

let expense_document_list_of_yojson tree path = list_of_yojson expense_document_of_yojson tree path

let analyze_expense_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     expense_documents =
       option_of_yojson
         (value_for_key expense_document_list_of_yojson "ExpenseDocuments")
         _list path;
   }
    : analyze_expense_response)

let analyze_expense_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ document = value_for_key document_of_yojson "Document" _list path } : analyze_expense_request)

let value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATE" -> DATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "ValueType")
     : value_type)
    : value_type)

let normalized_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     value_type = option_of_yojson (value_for_key value_type_of_yojson "ValueType") _list path;
   }
    : normalized_value)

let analyze_id_detections_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key string__of_yojson "Text" _list path;
     normalized_value =
       option_of_yojson (value_for_key normalized_value_of_yojson "NormalizedValue") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : analyze_id_detections)

let identity_document_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key analyze_id_detections_of_yojson "Type") _list path;
     value_detection =
       option_of_yojson (value_for_key analyze_id_detections_of_yojson "ValueDetection") _list path;
   }
    : identity_document_field)

let identity_document_field_list_of_yojson tree path =
  list_of_yojson identity_document_field_of_yojson tree path

let identity_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_index =
       option_of_yojson (value_for_key u_integer_of_yojson "DocumentIndex") _list path;
     identity_document_fields =
       option_of_yojson
         (value_for_key identity_document_field_list_of_yojson "IdentityDocumentFields")
         _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
   }
    : identity_document)

let identity_document_list_of_yojson tree path =
  list_of_yojson identity_document_of_yojson tree path

let analyze_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_documents =
       option_of_yojson
         (value_for_key identity_document_list_of_yojson "IdentityDocuments")
         _list path;
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     analyze_id_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeIDModelVersion") _list path;
   }
    : analyze_id_response)

let document_pages_of_yojson tree path = list_of_yojson document_of_yojson tree path

let analyze_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ document_pages = value_for_key document_pages_of_yojson "DocumentPages" _list path }
    : analyze_id_request)

let auto_update_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoUpdate" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoUpdate")
     : auto_update)
    : auto_update)

let client_request_token_of_yojson = string_of_yojson

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : conflict_exception)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : validation_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : service_quota_exceeded_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : limit_exceeded_exception)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : idempotent_parameter_mismatch_exception)

let create_adapter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path }
    : create_adapter_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_map_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let create_adapter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_name = value_for_key adapter_name_of_yojson "AdapterName" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     description =
       option_of_yojson (value_for_key adapter_description_of_yojson "Description") _list path;
     feature_types = value_for_key feature_types_of_yojson "FeatureTypes" _list path;
     auto_update = option_of_yojson (value_for_key auto_update_of_yojson "AutoUpdate") _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : create_adapter_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : resource_not_found_exception)

let invalid_kms_key_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : invalid_kms_key_exception)

let create_adapter_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_version =
       option_of_yojson (value_for_key adapter_version_of_yojson "AdapterVersion") _list path;
   }
    : create_adapter_version_response)

let output_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     s3_prefix = option_of_yojson (value_for_key s3_object_name_of_yojson "S3Prefix") _list path;
   }
    : output_config)

let kms_key_id_of_yojson = string_of_yojson

let create_adapter_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     dataset_config =
       value_for_key adapter_version_dataset_config_of_yojson "DatasetConfig" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
     output_config = value_for_key output_config_of_yojson "OutputConfig" _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : create_adapter_version_request)

let delete_adapter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_adapter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path }
    : delete_adapter_request)

let delete_adapter_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_adapter_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path;
     adapter_version = value_for_key adapter_version_of_yojson "AdapterVersion" _list path;
   }
    : delete_adapter_version_request)

let detect_document_text_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
     detect_document_text_model_version =
       option_of_yojson
         (value_for_key string__of_yojson "DetectDocumentTextModelVersion")
         _list path;
   }
    : detect_document_text_response)

let detect_document_text_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ document = value_for_key document_of_yojson "Document" _list path }
    : detect_document_text_request)

let detected_signature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page = option_of_yojson (value_for_key u_integer_of_yojson "Page") _list path }
    : detected_signature)

let detected_signature_list_of_yojson tree path =
  list_of_yojson detected_signature_of_yojson tree path

let undetected_signature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page = option_of_yojson (value_for_key u_integer_of_yojson "Page") _list path }
    : undetected_signature)

let undetected_signature_list_of_yojson tree path =
  list_of_yojson undetected_signature_of_yojson tree path

let page_list_of_yojson tree path = list_of_yojson u_integer_of_yojson tree path

let split_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key u_integer_of_yojson "Index") _list path;
     pages = option_of_yojson (value_for_key page_list_of_yojson "Pages") _list path;
   }
    : split_document)

let split_document_list_of_yojson tree path = list_of_yojson split_document_of_yojson tree path

let document_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key non_empty_string_of_yojson "Type") _list path;
     split_documents =
       option_of_yojson (value_for_key split_document_list_of_yojson "SplitDocuments") _list path;
     detected_signatures =
       option_of_yojson
         (value_for_key detected_signature_list_of_yojson "DetectedSignatures")
         _list path;
     undetected_signatures =
       option_of_yojson
         (value_for_key undetected_signature_list_of_yojson "UndetectedSignatures")
         _list path;
   }
    : document_group)

let document_group_list_of_yojson tree path = list_of_yojson document_group_of_yojson tree path

let document_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object = option_of_yojson (value_for_key s3_object_of_yojson "S3Object") _list path }
    : document_location)

let error_code_of_yojson = string_of_yojson

let signature_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
   }
    : signature_detection)

let signature_detection_list_of_yojson tree path =
  list_of_yojson signature_detection_of_yojson tree path

let lending_detection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     selection_status =
       option_of_yojson (value_for_key selection_status_of_yojson "SelectionStatus") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : lending_detection)

let lending_detection_list_of_yojson tree path =
  list_of_yojson lending_detection_of_yojson tree path

let lending_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
     key_detection =
       option_of_yojson (value_for_key lending_detection_of_yojson "KeyDetection") _list path;
     value_detections =
       option_of_yojson
         (value_for_key lending_detection_list_of_yojson "ValueDetections")
         _list path;
   }
    : lending_field)

let lending_field_list_of_yojson tree path = list_of_yojson lending_field_of_yojson tree path

let lending_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lending_fields =
       option_of_yojson (value_for_key lending_field_list_of_yojson "LendingFields") _list path;
     signature_detections =
       option_of_yojson
         (value_for_key signature_detection_list_of_yojson "SignatureDetections")
         _list path;
   }
    : lending_document)

let extraction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lending_document =
       option_of_yojson (value_for_key lending_document_of_yojson "LendingDocument") _list path;
     expense_document =
       option_of_yojson (value_for_key expense_document_of_yojson "ExpenseDocument") _list path;
     identity_document =
       option_of_yojson (value_for_key identity_document_of_yojson "IdentityDocument") _list path;
   }
    : extraction)

let extraction_list_of_yojson tree path = list_of_yojson extraction_of_yojson tree path

let get_adapter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_name = option_of_yojson (value_for_key adapter_name_of_yojson "AdapterName") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     description =
       option_of_yojson (value_for_key adapter_description_of_yojson "Description") _list path;
     feature_types =
       option_of_yojson (value_for_key feature_types_of_yojson "FeatureTypes") _list path;
     auto_update = option_of_yojson (value_for_key auto_update_of_yojson "AutoUpdate") _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : get_adapter_response)

let get_adapter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path } : get_adapter_request)

let get_adapter_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_version =
       option_of_yojson (value_for_key adapter_version_of_yojson "AdapterVersion") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     feature_types =
       option_of_yojson (value_for_key feature_types_of_yojson "FeatureTypes") _list path;
     status = option_of_yojson (value_for_key adapter_version_status_of_yojson "Status") _list path;
     status_message =
       option_of_yojson
         (value_for_key adapter_version_status_message_of_yojson "StatusMessage")
         _list path;
     dataset_config =
       option_of_yojson
         (value_for_key adapter_version_dataset_config_of_yojson "DatasetConfig")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     evaluation_metrics =
       option_of_yojson
         (value_for_key adapter_version_evaluation_metrics_of_yojson "EvaluationMetrics")
         _list path;
     tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path;
   }
    : get_adapter_version_response)

let get_adapter_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path;
     adapter_version = value_for_key adapter_version_of_yojson "AdapterVersion" _list path;
   }
    : get_adapter_version_request)

let invalid_job_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code = option_of_yojson (value_for_key string__of_yojson "Code") _list path;
   }
    : invalid_job_id_exception)

let status_message_of_yojson = string_of_yojson
let pages_of_yojson tree path = list_of_yojson u_integer_of_yojson tree path

let warning_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     pages = option_of_yojson (value_for_key pages_of_yojson "Pages") _list path;
   }
    : warning)

let warnings_of_yojson tree path = list_of_yojson warning_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "PARTIAL_SUCCESS" -> PARTIAL_SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let get_document_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
     warnings = option_of_yojson (value_for_key warnings_of_yojson "Warnings") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     analyze_document_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeDocumentModelVersion") _list path;
   }
    : get_document_analysis_response)

let max_results_of_yojson = int_of_yojson
let job_id_of_yojson = string_of_yojson

let get_document_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_document_analysis_request)

let get_document_text_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     blocks = option_of_yojson (value_for_key block_list_of_yojson "Blocks") _list path;
     warnings = option_of_yojson (value_for_key warnings_of_yojson "Warnings") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     detect_document_text_model_version =
       option_of_yojson
         (value_for_key string__of_yojson "DetectDocumentTextModelVersion")
         _list path;
   }
    : get_document_text_detection_response)

let get_document_text_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_document_text_detection_request)

let get_expense_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     expense_documents =
       option_of_yojson
         (value_for_key expense_document_list_of_yojson "ExpenseDocuments")
         _list path;
     warnings = option_of_yojson (value_for_key warnings_of_yojson "Warnings") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     analyze_expense_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeExpenseModelVersion") _list path;
   }
    : get_expense_analysis_response)

let get_expense_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_expense_analysis_request)

let prediction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key non_empty_string_of_yojson "Value") _list path;
     confidence = option_of_yojson (value_for_key percent_of_yojson "Confidence") _list path;
   }
    : prediction)

let prediction_list_of_yojson tree path = list_of_yojson prediction_of_yojson tree path

let page_classification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_type = value_for_key prediction_list_of_yojson "PageType" _list path;
     page_number = value_for_key prediction_list_of_yojson "PageNumber" _list path;
   }
    : page_classification)

let lending_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page = option_of_yojson (value_for_key u_integer_of_yojson "Page") _list path;
     page_classification =
       option_of_yojson
         (value_for_key page_classification_of_yojson "PageClassification")
         _list path;
     extractions =
       option_of_yojson (value_for_key extraction_list_of_yojson "Extractions") _list path;
   }
    : lending_result)

let lending_result_list_of_yojson tree path = list_of_yojson lending_result_of_yojson tree path

let get_lending_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     results = option_of_yojson (value_for_key lending_result_list_of_yojson "Results") _list path;
     warnings = option_of_yojson (value_for_key warnings_of_yojson "Warnings") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     analyze_lending_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeLendingModelVersion") _list path;
   }
    : get_lending_analysis_response)

let get_lending_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : get_lending_analysis_request)

let undetected_document_type_list_of_yojson tree path =
  list_of_yojson non_empty_string_of_yojson tree path

let lending_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_groups =
       option_of_yojson (value_for_key document_group_list_of_yojson "DocumentGroups") _list path;
     undetected_document_types =
       option_of_yojson
         (value_for_key undetected_document_type_list_of_yojson "UndetectedDocumentTypes")
         _list path;
   }
    : lending_summary)

let get_lending_analysis_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     summary = option_of_yojson (value_for_key lending_summary_of_yojson "Summary") _list path;
     warnings = option_of_yojson (value_for_key warnings_of_yojson "Warnings") _list path;
     status_message =
       option_of_yojson (value_for_key status_message_of_yojson "StatusMessage") _list path;
     analyze_lending_model_version =
       option_of_yojson (value_for_key string__of_yojson "AnalyzeLendingModelVersion") _list path;
   }
    : get_lending_analysis_summary_response)

let get_lending_analysis_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : get_lending_analysis_summary_request)

let job_tag_of_yojson = string_of_yojson

let list_adapter_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_versions =
       option_of_yojson (value_for_key adapter_version_list_of_yojson "AdapterVersions") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_adapter_versions_response)

let list_adapter_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     after_creation_time =
       option_of_yojson (value_for_key date_time_of_yojson "AfterCreationTime") _list path;
     before_creation_time =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeCreationTime") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_adapter_versions_request)

let list_adapters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapters = option_of_yojson (value_for_key adapter_list_of_yojson "Adapters") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_adapters_response)

let list_adapters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     after_creation_time =
       option_of_yojson (value_for_key date_time_of_yojson "AfterCreationTime") _list path;
     before_creation_time =
       option_of_yojson (value_for_key date_time_of_yojson "BeforeCreationTime") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_adapters_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_map_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let role_arn_of_yojson = string_of_yojson
let sns_topic_arn_of_yojson = string_of_yojson

let notification_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_topic_arn = value_for_key sns_topic_arn_of_yojson "SNSTopicArn" _list path;
     role_arn = value_for_key role_arn_of_yojson "RoleArn" _list path;
   }
    : notification_channel)

let start_document_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_document_analysis_response)

let start_document_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_location = value_for_key document_location_of_yojson "DocumentLocation" _list path;
     feature_types = value_for_key feature_types_of_yojson "FeatureTypes" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
     queries_config =
       option_of_yojson (value_for_key queries_config_of_yojson "QueriesConfig") _list path;
     adapters_config =
       option_of_yojson (value_for_key adapters_config_of_yojson "AdaptersConfig") _list path;
   }
    : start_document_analysis_request)

let start_document_text_detection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_document_text_detection_response)

let start_document_text_detection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_location = value_for_key document_location_of_yojson "DocumentLocation" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
   }
    : start_document_text_detection_request)

let start_expense_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_expense_analysis_response)

let start_expense_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_location = value_for_key document_location_of_yojson "DocumentLocation" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
   }
    : start_expense_analysis_request)

let start_lending_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path }
    : start_lending_analysis_response)

let start_lending_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_location = value_for_key document_location_of_yojson "DocumentLocation" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     job_tag = option_of_yojson (value_for_key job_tag_of_yojson "JobTag") _list path;
     notification_channel =
       option_of_yojson
         (value_for_key notification_channel_of_yojson "NotificationChannel")
         _list path;
     output_config =
       option_of_yojson (value_for_key output_config_of_yojson "OutputConfig") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KMSKeyId") _list path;
   }
    : start_lending_analysis_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_map_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let update_adapter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = option_of_yojson (value_for_key adapter_id_of_yojson "AdapterId") _list path;
     adapter_name = option_of_yojson (value_for_key adapter_name_of_yojson "AdapterName") _list path;
     creation_time = option_of_yojson (value_for_key date_time_of_yojson "CreationTime") _list path;
     description =
       option_of_yojson (value_for_key adapter_description_of_yojson "Description") _list path;
     feature_types =
       option_of_yojson (value_for_key feature_types_of_yojson "FeatureTypes") _list path;
     auto_update = option_of_yojson (value_for_key auto_update_of_yojson "AutoUpdate") _list path;
   }
    : update_adapter_response)

let update_adapter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adapter_id = value_for_key adapter_id_of_yojson "AdapterId" _list path;
     description =
       option_of_yojson (value_for_key adapter_description_of_yojson "Description") _list path;
     adapter_name = option_of_yojson (value_for_key adapter_name_of_yojson "AdapterName") _list path;
     auto_update = option_of_yojson (value_for_key auto_update_of_yojson "AutoUpdate") _list path;
   }
    : update_adapter_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)
