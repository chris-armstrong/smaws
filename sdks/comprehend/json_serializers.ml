open Smaws_Lib.Json.SerializeHelpers
open Types

let any_length_string_to_yojson = string_to_yojson
let attribute_names_list_item_to_yojson = string_to_yojson
let attribute_names_list_to_yojson tree = list_to_yojson attribute_names_list_item_to_yojson tree

let augmented_manifests_document_type_format_to_yojson
    (x : augmented_manifests_document_type_format) =
  match x with
  | PLAIN_TEXT_DOCUMENT -> `String "PLAIN_TEXT_DOCUMENT"
  | SEMI_STRUCTURED_DOCUMENT -> `String "SEMI_STRUCTURED_DOCUMENT"

let s3_uri_to_yojson = string_to_yojson
let split_to_yojson (x : split) = match x with TRAIN -> `String "TRAIN" | TEST -> `String "TEST"

let augmented_manifests_list_item_to_yojson (x : augmented_manifests_list_item) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("Split", option_to_yojson split_to_yojson x.split);
      ("AttributeNames", Some (attribute_names_list_to_yojson x.attribute_names));
      ("AnnotationDataS3Uri", option_to_yojson s3_uri_to_yojson x.annotation_data_s3_uri);
      ("SourceDocumentsS3Uri", option_to_yojson s3_uri_to_yojson x.source_documents_s3_uri);
      ( "DocumentType",
        option_to_yojson augmented_manifests_document_type_format_to_yojson x.document_type );
    ]

let string__to_yojson = string_to_yojson

let text_size_limit_exceeded_exception_to_yojson (x : text_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let invalid_request_detail_reason_to_yojson (x : invalid_request_detail_reason) =
  match x with
  | DOCUMENT_SIZE_EXCEEDED -> `String "DOCUMENT_SIZE_EXCEEDED"
  | UNSUPPORTED_DOC_TYPE -> `String "UNSUPPORTED_DOC_TYPE"
  | PAGE_LIMIT_EXCEEDED -> `String "PAGE_LIMIT_EXCEEDED"
  | TEXTRACT_ACCESS_DENIED -> `String "TEXTRACT_ACCESS_DENIED"

let invalid_request_detail_to_yojson (x : invalid_request_detail) =
  assoc_to_yojson [ ("Reason", option_to_yojson invalid_request_detail_reason_to_yojson x.reason) ]

let invalid_request_reason_to_yojson (x : invalid_request_reason) =
  match x with INVALID_DOCUMENT -> `String "INVALID_DOCUMENT"

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Reason", option_to_yojson invalid_request_reason_to_yojson x.reason);
      ("Detail", option_to_yojson invalid_request_detail_to_yojson x.detail);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let batch_size_limit_exceeded_exception_to_yojson (x : batch_size_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let integer_to_yojson = int_to_yojson

let batch_item_error_to_yojson (x : batch_item_error) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let batch_item_error_list_to_yojson tree = list_to_yojson batch_item_error_to_yojson tree
let float__to_yojson = float_to_yojson

let dominant_language_to_yojson (x : dominant_language) =
  assoc_to_yojson
    [
      ("LanguageCode", option_to_yojson string__to_yojson x.language_code);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_dominant_languages_to_yojson tree = list_to_yojson dominant_language_to_yojson tree

let batch_detect_dominant_language_item_result_to_yojson
    (x : batch_detect_dominant_language_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("Languages", option_to_yojson list_of_dominant_languages_to_yojson x.languages);
    ]

let list_of_detect_dominant_language_result_to_yojson tree =
  list_to_yojson batch_detect_dominant_language_item_result_to_yojson tree

let batch_detect_dominant_language_response_to_yojson (x : batch_detect_dominant_language_response)
    =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_dominant_language_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let customer_input_string_to_yojson = string_to_yojson
let customer_input_string_list_to_yojson tree = list_to_yojson customer_input_string_to_yojson tree

let batch_detect_dominant_language_request_to_yojson (x : batch_detect_dominant_language_request) =
  assoc_to_yojson [ ("TextList", Some (customer_input_string_list_to_yojson x.text_list)) ]

let unsupported_language_exception_to_yojson (x : unsupported_language_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let child_block_to_yojson (x : child_block) =
  assoc_to_yojson
    [
      ("ChildBlockId", option_to_yojson string__to_yojson x.child_block_id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
    ]

let list_of_child_blocks_to_yojson tree = list_to_yojson child_block_to_yojson tree

let block_reference_to_yojson (x : block_reference) =
  assoc_to_yojson
    [
      ("BlockId", option_to_yojson string__to_yojson x.block_id);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("ChildBlocks", option_to_yojson list_of_child_blocks_to_yojson x.child_blocks);
    ]

let list_of_block_references_to_yojson tree = list_to_yojson block_reference_to_yojson tree

let entity_type_to_yojson (x : entity_type) =
  match x with
  | PERSON -> `String "PERSON"
  | LOCATION -> `String "LOCATION"
  | ORGANIZATION -> `String "ORGANIZATION"
  | COMMERCIAL_ITEM -> `String "COMMERCIAL_ITEM"
  | EVENT -> `String "EVENT"
  | DATE -> `String "DATE"
  | QUANTITY -> `String "QUANTITY"
  | TITLE -> `String "TITLE"
  | OTHER -> `String "OTHER"

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson entity_type_to_yojson x.type_);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("BlockReferences", option_to_yojson list_of_block_references_to_yojson x.block_references);
    ]

let list_of_entities_to_yojson tree = list_to_yojson entity_to_yojson tree

let batch_detect_entities_item_result_to_yojson (x : batch_detect_entities_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("Entities", option_to_yojson list_of_entities_to_yojson x.entities);
    ]

let list_of_detect_entities_result_to_yojson tree =
  list_to_yojson batch_detect_entities_item_result_to_yojson tree

let batch_detect_entities_response_to_yojson (x : batch_detect_entities_response) =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_entities_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let language_code_to_yojson (x : language_code) =
  match x with
  | EN -> `String "en"
  | ES -> `String "es"
  | FR -> `String "fr"
  | DE -> `String "de"
  | IT -> `String "it"
  | PT -> `String "pt"
  | AR -> `String "ar"
  | HI -> `String "hi"
  | JA -> `String "ja"
  | KO -> `String "ko"
  | ZH -> `String "zh"
  | ZH_TW -> `String "zh-TW"

let batch_detect_entities_request_to_yojson (x : batch_detect_entities_request) =
  assoc_to_yojson
    [
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let key_phrase_to_yojson (x : key_phrase) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
    ]

let list_of_key_phrases_to_yojson tree = list_to_yojson key_phrase_to_yojson tree

let batch_detect_key_phrases_item_result_to_yojson (x : batch_detect_key_phrases_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("KeyPhrases", option_to_yojson list_of_key_phrases_to_yojson x.key_phrases);
    ]

let list_of_detect_key_phrases_result_to_yojson tree =
  list_to_yojson batch_detect_key_phrases_item_result_to_yojson tree

let batch_detect_key_phrases_response_to_yojson (x : batch_detect_key_phrases_response) =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_key_phrases_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let batch_detect_key_phrases_request_to_yojson (x : batch_detect_key_phrases_request) =
  assoc_to_yojson
    [
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let sentiment_score_to_yojson (x : sentiment_score) =
  assoc_to_yojson
    [
      ("Positive", option_to_yojson float__to_yojson x.positive);
      ("Negative", option_to_yojson float__to_yojson x.negative);
      ("Neutral", option_to_yojson float__to_yojson x.neutral);
      ("Mixed", option_to_yojson float__to_yojson x.mixed);
    ]

let sentiment_type_to_yojson (x : sentiment_type) =
  match x with
  | POSITIVE -> `String "POSITIVE"
  | NEGATIVE -> `String "NEGATIVE"
  | NEUTRAL -> `String "NEUTRAL"
  | MIXED -> `String "MIXED"

let batch_detect_sentiment_item_result_to_yojson (x : batch_detect_sentiment_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
    ]

let list_of_detect_sentiment_result_to_yojson tree =
  list_to_yojson batch_detect_sentiment_item_result_to_yojson tree

let batch_detect_sentiment_response_to_yojson (x : batch_detect_sentiment_response) =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_sentiment_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let batch_detect_sentiment_request_to_yojson (x : batch_detect_sentiment_request) =
  assoc_to_yojson
    [
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let part_of_speech_tag_type_to_yojson (x : part_of_speech_tag_type) =
  match x with
  | ADJ -> `String "ADJ"
  | ADP -> `String "ADP"
  | ADV -> `String "ADV"
  | AUX -> `String "AUX"
  | CONJ -> `String "CONJ"
  | CCONJ -> `String "CCONJ"
  | DET -> `String "DET"
  | INTJ -> `String "INTJ"
  | NOUN -> `String "NOUN"
  | NUM -> `String "NUM"
  | O -> `String "O"
  | PART -> `String "PART"
  | PRON -> `String "PRON"
  | PROPN -> `String "PROPN"
  | PUNCT -> `String "PUNCT"
  | SCONJ -> `String "SCONJ"
  | SYM -> `String "SYM"
  | VERB -> `String "VERB"

let part_of_speech_tag_to_yojson (x : part_of_speech_tag) =
  assoc_to_yojson
    [
      ("Tag", option_to_yojson part_of_speech_tag_type_to_yojson x.tag);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let syntax_token_to_yojson (x : syntax_token) =
  assoc_to_yojson
    [
      ("TokenId", option_to_yojson integer_to_yojson x.token_id);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
      ("PartOfSpeech", option_to_yojson part_of_speech_tag_to_yojson x.part_of_speech);
    ]

let list_of_syntax_tokens_to_yojson tree = list_to_yojson syntax_token_to_yojson tree

let batch_detect_syntax_item_result_to_yojson (x : batch_detect_syntax_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("SyntaxTokens", option_to_yojson list_of_syntax_tokens_to_yojson x.syntax_tokens);
    ]

let list_of_detect_syntax_result_to_yojson tree =
  list_to_yojson batch_detect_syntax_item_result_to_yojson tree

let batch_detect_syntax_response_to_yojson (x : batch_detect_syntax_response) =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_syntax_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let syntax_language_code_to_yojson (x : syntax_language_code) =
  match x with
  | EN -> `String "en"
  | ES -> `String "es"
  | FR -> `String "fr"
  | DE -> `String "de"
  | IT -> `String "it"
  | PT -> `String "pt"

let batch_detect_syntax_request_to_yojson (x : batch_detect_syntax_request) =
  assoc_to_yojson
    [
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
      ("LanguageCode", Some (syntax_language_code_to_yojson x.language_code));
    ]

let mention_sentiment_to_yojson (x : mention_sentiment) =
  assoc_to_yojson
    [
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
    ]

let targeted_sentiment_entity_type_to_yojson (x : targeted_sentiment_entity_type) =
  match x with
  | PERSON -> `String "PERSON"
  | LOCATION -> `String "LOCATION"
  | ORGANIZATION -> `String "ORGANIZATION"
  | FACILITY -> `String "FACILITY"
  | BRAND -> `String "BRAND"
  | COMMERCIAL_ITEM -> `String "COMMERCIAL_ITEM"
  | MOVIE -> `String "MOVIE"
  | MUSIC -> `String "MUSIC"
  | BOOK -> `String "BOOK"
  | SOFTWARE -> `String "SOFTWARE"
  | GAME -> `String "GAME"
  | PERSONAL_TITLE -> `String "PERSONAL_TITLE"
  | EVENT -> `String "EVENT"
  | DATE -> `String "DATE"
  | QUANTITY -> `String "QUANTITY"
  | ATTRIBUTE -> `String "ATTRIBUTE"
  | OTHER -> `String "OTHER"

let targeted_sentiment_mention_to_yojson (x : targeted_sentiment_mention) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("GroupScore", option_to_yojson float__to_yojson x.group_score);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Type", option_to_yojson targeted_sentiment_entity_type_to_yojson x.type_);
      ("MentionSentiment", option_to_yojson mention_sentiment_to_yojson x.mention_sentiment);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
    ]

let list_of_mentions_to_yojson tree = list_to_yojson targeted_sentiment_mention_to_yojson tree
let list_of_descriptive_mention_indices_to_yojson tree = list_to_yojson integer_to_yojson tree

let targeted_sentiment_entity_to_yojson (x : targeted_sentiment_entity) =
  assoc_to_yojson
    [
      ( "DescriptiveMentionIndex",
        option_to_yojson list_of_descriptive_mention_indices_to_yojson x.descriptive_mention_index
      );
      ("Mentions", option_to_yojson list_of_mentions_to_yojson x.mentions);
    ]

let list_of_targeted_sentiment_entities_to_yojson tree =
  list_to_yojson targeted_sentiment_entity_to_yojson tree

let batch_detect_targeted_sentiment_item_result_to_yojson
    (x : batch_detect_targeted_sentiment_item_result) =
  assoc_to_yojson
    [
      ("Index", option_to_yojson integer_to_yojson x.index);
      ("Entities", option_to_yojson list_of_targeted_sentiment_entities_to_yojson x.entities);
    ]

let list_of_detect_targeted_sentiment_result_to_yojson tree =
  list_to_yojson batch_detect_targeted_sentiment_item_result_to_yojson tree

let batch_detect_targeted_sentiment_response_to_yojson
    (x : batch_detect_targeted_sentiment_response) =
  assoc_to_yojson
    [
      ("ResultList", Some (list_of_detect_targeted_sentiment_result_to_yojson x.result_list));
      ("ErrorList", Some (batch_item_error_list_to_yojson x.error_list));
    ]

let batch_detect_targeted_sentiment_request_to_yojson (x : batch_detect_targeted_sentiment_request)
    =
  assoc_to_yojson
    [
      ("TextList", Some (customer_input_string_list_to_yojson x.text_list));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let relationship_type_to_yojson (x : relationship_type) = match x with CHILD -> `String "CHILD"
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let relationships_list_item_to_yojson (x : relationships_list_item) =
  assoc_to_yojson
    [
      ("Ids", option_to_yojson string_list_to_yojson x.ids);
      ("Type", option_to_yojson relationship_type_to_yojson x.type_);
    ]

let list_of_relationships_to_yojson tree = list_to_yojson relationships_list_item_to_yojson tree

let point_to_yojson (x : point) =
  assoc_to_yojson
    [ ("X", option_to_yojson float__to_yojson x.x); ("Y", option_to_yojson float__to_yojson x.y) ]

let polygon_to_yojson tree = list_to_yojson point_to_yojson tree

let bounding_box_to_yojson (x : bounding_box) =
  assoc_to_yojson
    [
      ("Height", option_to_yojson float__to_yojson x.height);
      ("Left", option_to_yojson float__to_yojson x.left);
      ("Top", option_to_yojson float__to_yojson x.top);
      ("Width", option_to_yojson float__to_yojson x.width);
    ]

let geometry_to_yojson (x : geometry) =
  assoc_to_yojson
    [
      ("BoundingBox", option_to_yojson bounding_box_to_yojson x.bounding_box);
      ("Polygon", option_to_yojson polygon_to_yojson x.polygon);
    ]

let block_type_to_yojson (x : block_type) =
  match x with LINE -> `String "LINE" | WORD -> `String "WORD"

let block_to_yojson (x : block) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson string__to_yojson x.id);
      ("BlockType", option_to_yojson block_type_to_yojson x.block_type);
      ("Text", option_to_yojson string__to_yojson x.text);
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Geometry", option_to_yojson geometry_to_yojson x.geometry);
      ("Relationships", option_to_yojson list_of_relationships_to_yojson x.relationships);
    ]

let double_to_yojson = double_to_yojson

let classifier_evaluation_metrics_to_yojson (x : classifier_evaluation_metrics) =
  assoc_to_yojson
    [
      ("Accuracy", option_to_yojson double_to_yojson x.accuracy);
      ("Precision", option_to_yojson double_to_yojson x.precision);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
      ("MicroPrecision", option_to_yojson double_to_yojson x.micro_precision);
      ("MicroRecall", option_to_yojson double_to_yojson x.micro_recall);
      ("MicroF1Score", option_to_yojson double_to_yojson x.micro_f1_score);
      ("HammingLoss", option_to_yojson double_to_yojson x.hamming_loss);
    ]

let classifier_metadata_to_yojson (x : classifier_metadata) =
  assoc_to_yojson
    [
      ("NumberOfLabels", option_to_yojson integer_to_yojson x.number_of_labels);
      ("NumberOfTrainedDocuments", option_to_yojson integer_to_yojson x.number_of_trained_documents);
      ("NumberOfTestDocuments", option_to_yojson integer_to_yojson x.number_of_test_documents);
      ( "EvaluationMetrics",
        option_to_yojson classifier_evaluation_metrics_to_yojson x.evaluation_metrics );
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let page_based_warning_code_to_yojson (x : page_based_warning_code) =
  match x with
  | INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL ->
      `String "INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL"
  | INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL ->
      `String "INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL"

let warnings_list_item_to_yojson (x : warnings_list_item) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("WarnCode", option_to_yojson page_based_warning_code_to_yojson x.warn_code);
      ("WarnMessage", option_to_yojson string__to_yojson x.warn_message);
    ]

let list_of_warnings_to_yojson tree = list_to_yojson warnings_list_item_to_yojson tree

let page_based_error_code_to_yojson (x : page_based_error_code) =
  match x with
  | TEXTRACT_BAD_PAGE -> `String "TEXTRACT_BAD_PAGE"
  | TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED"
  | PAGE_CHARACTERS_EXCEEDED -> `String "PAGE_CHARACTERS_EXCEEDED"
  | PAGE_SIZE_EXCEEDED -> `String "PAGE_SIZE_EXCEEDED"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let errors_list_item_to_yojson (x : errors_list_item) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("ErrorCode", option_to_yojson page_based_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let list_of_errors_to_yojson tree = list_to_yojson errors_list_item_to_yojson tree

let document_type_to_yojson (x : document_type) =
  match x with
  | NATIVE_PDF -> `String "NATIVE_PDF"
  | SCANNED_PDF -> `String "SCANNED_PDF"
  | MS_WORD -> `String "MS_WORD"
  | IMAGE -> `String "IMAGE"
  | PLAIN_TEXT -> `String "PLAIN_TEXT"
  | TEXTRACT_DETECT_DOCUMENT_TEXT_JSON -> `String "TEXTRACT_DETECT_DOCUMENT_TEXT_JSON"
  | TEXTRACT_ANALYZE_DOCUMENT_JSON -> `String "TEXTRACT_ANALYZE_DOCUMENT_JSON"

let document_type_list_item_to_yojson (x : document_type_list_item) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Type", option_to_yojson document_type_to_yojson x.type_);
    ]

let list_of_document_type_to_yojson tree = list_to_yojson document_type_list_item_to_yojson tree

let extracted_characters_list_item_to_yojson (x : extracted_characters_list_item) =
  assoc_to_yojson
    [
      ("Page", option_to_yojson integer_to_yojson x.page);
      ("Count", option_to_yojson integer_to_yojson x.count);
    ]

let list_of_extracted_characters_to_yojson tree =
  list_to_yojson extracted_characters_list_item_to_yojson tree

let document_metadata_to_yojson (x : document_metadata) =
  assoc_to_yojson
    [
      ("Pages", option_to_yojson integer_to_yojson x.pages);
      ( "ExtractedCharacters",
        option_to_yojson list_of_extracted_characters_to_yojson x.extracted_characters );
    ]

let document_label_to_yojson (x : document_label) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let list_of_labels_to_yojson tree = list_to_yojson document_label_to_yojson tree

let document_class_to_yojson (x : document_class) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Page", option_to_yojson integer_to_yojson x.page);
    ]

let list_of_classes_to_yojson tree = list_to_yojson document_class_to_yojson tree

let classify_document_response_to_yojson (x : classify_document_response) =
  assoc_to_yojson
    [
      ("Classes", option_to_yojson list_of_classes_to_yojson x.classes);
      ("Labels", option_to_yojson list_of_labels_to_yojson x.labels);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("DocumentType", option_to_yojson list_of_document_type_to_yojson x.document_type);
      ("Errors", option_to_yojson list_of_errors_to_yojson x.errors);
      ("Warnings", option_to_yojson list_of_warnings_to_yojson x.warnings);
    ]

let document_read_feature_types_to_yojson (x : document_read_feature_types) =
  match x with TABLES -> `String "TABLES" | FORMS -> `String "FORMS"

let list_of_document_read_feature_types_to_yojson tree =
  list_to_yojson document_read_feature_types_to_yojson tree

let document_read_mode_to_yojson (x : document_read_mode) =
  match x with
  | SERVICE_DEFAULT -> `String "SERVICE_DEFAULT"
  | FORCE_DOCUMENT_READ_ACTION -> `String "FORCE_DOCUMENT_READ_ACTION"

let document_read_action_to_yojson (x : document_read_action) =
  match x with
  | TEXTRACT_DETECT_DOCUMENT_TEXT -> `String "TEXTRACT_DETECT_DOCUMENT_TEXT"
  | TEXTRACT_ANALYZE_DOCUMENT -> `String "TEXTRACT_ANALYZE_DOCUMENT"

let document_reader_config_to_yojson (x : document_reader_config) =
  assoc_to_yojson
    [
      ("DocumentReadAction", Some (document_read_action_to_yojson x.document_read_action));
      ("DocumentReadMode", option_to_yojson document_read_mode_to_yojson x.document_read_mode);
      ( "FeatureTypes",
        option_to_yojson list_of_document_read_feature_types_to_yojson x.feature_types );
    ]

let semi_structured_document_blob_to_yojson = blob_to_yojson
let document_classifier_endpoint_arn_to_yojson = string_to_yojson

let classify_document_request_to_yojson (x : classify_document_request) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson customer_input_string_to_yojson x.text);
      ("EndpointArn", Some (document_classifier_endpoint_arn_to_yojson x.endpoint_arn));
      ("Bytes", option_to_yojson semi_structured_document_blob_to_yojson x.bytes);
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
    ]

let client_request_token_string_to_yojson = string_to_yojson
let comprehend_arn_to_yojson = string_to_yojson
let comprehend_arn_name_to_yojson = string_to_yojson
let comprehend_dataset_arn_to_yojson = string_to_yojson
let comprehend_endpoint_arn_to_yojson = string_to_yojson
let comprehend_endpoint_name_to_yojson = string_to_yojson
let comprehend_flywheel_arn_to_yojson = string_to_yojson
let comprehend_model_arn_to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let kms_key_validation_exception_to_yojson (x : kms_key_validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let flywheel_iteration_id_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let model_type_to_yojson (x : model_type) =
  match x with
  | DOCUMENT_CLASSIFIER -> `String "DOCUMENT_CLASSIFIER"
  | ENTITY_RECOGNIZER -> `String "ENTITY_RECOGNIZER"

let flywheel_status_to_yojson (x : flywheel_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let subnet_id_to_yojson = string_to_yojson
let subnets_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
      ("Subnets", Some (subnets_to_yojson x.subnets));
    ]

let kms_key_id_to_yojson = string_to_yojson

let data_security_config_to_yojson (x : data_security_config) =
  assoc_to_yojson
    [
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("DataLakeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.data_lake_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let entity_type_name_to_yojson = string_to_yojson

let entity_types_list_item_to_yojson (x : entity_types_list_item) =
  assoc_to_yojson [ ("Type", Some (entity_type_name_to_yojson x.type_)) ]

let entity_types_list_to_yojson tree = list_to_yojson entity_types_list_item_to_yojson tree

let entity_recognition_config_to_yojson (x : entity_recognition_config) =
  assoc_to_yojson [ ("EntityTypes", Some (entity_types_list_to_yojson x.entity_types)) ]

let label_list_item_to_yojson = string_to_yojson
let labels_list_to_yojson tree = list_to_yojson label_list_item_to_yojson tree

let document_classifier_mode_to_yojson (x : document_classifier_mode) =
  match x with MULTI_CLASS -> `String "MULTI_CLASS" | MULTI_LABEL -> `String "MULTI_LABEL"

let document_classification_config_to_yojson (x : document_classification_config) =
  assoc_to_yojson
    [
      ("Mode", Some (document_classifier_mode_to_yojson x.mode));
      ("Labels", option_to_yojson labels_list_to_yojson x.labels);
    ]

let task_config_to_yojson (x : task_config) =
  assoc_to_yojson
    [
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "DocumentClassificationConfig",
        option_to_yojson document_classification_config_to_yojson x.document_classification_config
      );
      ( "EntityRecognitionConfig",
        option_to_yojson entity_recognition_config_to_yojson x.entity_recognition_config );
    ]

let iam_role_arn_to_yojson = string_to_yojson

let flywheel_properties_to_yojson (x : flywheel_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("TaskConfig", option_to_yojson task_config_to_yojson x.task_config);
      ("DataLakeS3Uri", option_to_yojson s3_uri_to_yojson x.data_lake_s3_uri);
      ("DataSecurityConfig", option_to_yojson data_security_config_to_yojson x.data_security_config);
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "LatestFlywheelIteration",
        option_to_yojson flywheel_iteration_id_to_yojson x.latest_flywheel_iteration );
    ]

let update_flywheel_response_to_yojson (x : update_flywheel_response) =
  assoc_to_yojson
    [ ("FlywheelProperties", option_to_yojson flywheel_properties_to_yojson x.flywheel_properties) ]

let update_data_security_config_to_yojson (x : update_data_security_config) =
  assoc_to_yojson
    [
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let update_flywheel_request_to_yojson (x : update_flywheel_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ( "DataSecurityConfig",
        option_to_yojson update_data_security_config_to_yojson x.data_security_config );
    ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_endpoint_response_to_yojson (x : update_endpoint_response) =
  assoc_to_yojson
    [ ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn) ]

let inference_units_integer_to_yojson = int_to_yojson

let update_endpoint_request_to_yojson (x : update_endpoint_request) =
  assoc_to_yojson
    [
      ("EndpointArn", Some (comprehend_endpoint_arn_to_yojson x.endpoint_arn));
      ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn);
      ( "DesiredInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.desired_inference_units );
      ( "DesiredDataAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.desired_data_access_role_arn );
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let too_many_tag_keys_exception_to_yojson (x : too_many_tag_keys_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

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

let job_not_found_exception_to_yojson (x : job_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let job_status_to_yojson (x : job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"

let job_id_to_yojson = string_to_yojson

let stop_targeted_sentiment_detection_job_response_to_yojson
    (x : stop_targeted_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_targeted_sentiment_detection_job_request_to_yojson
    (x : stop_targeted_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_sentiment_detection_job_response_to_yojson (x : stop_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_sentiment_detection_job_request_to_yojson (x : stop_sentiment_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_pii_entities_detection_job_response_to_yojson
    (x : stop_pii_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_pii_entities_detection_job_request_to_yojson (x : stop_pii_entities_detection_job_request)
    =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_key_phrases_detection_job_response_to_yojson (x : stop_key_phrases_detection_job_response)
    =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_key_phrases_detection_job_request_to_yojson (x : stop_key_phrases_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_events_detection_job_response_to_yojson (x : stop_events_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_events_detection_job_request_to_yojson (x : stop_events_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_entities_detection_job_response_to_yojson (x : stop_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_entities_detection_job_request_to_yojson (x : stop_entities_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let stop_dominant_language_detection_job_response_to_yojson
    (x : stop_dominant_language_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let stop_dominant_language_detection_job_request_to_yojson
    (x : stop_dominant_language_detection_job_request) =
  assoc_to_yojson [ ("JobId", Some (job_id_to_yojson x.job_id)) ]

let start_topics_detection_job_response_to_yojson (x : start_topics_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let number_of_topics_integer_to_yojson = int_to_yojson
let job_name_to_yojson = string_to_yojson

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let input_format_to_yojson (x : input_format) =
  match x with
  | ONE_DOC_PER_FILE -> `String "ONE_DOC_PER_FILE"
  | ONE_DOC_PER_LINE -> `String "ONE_DOC_PER_LINE"

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
    ]

let start_topics_detection_job_request_to_yojson (x : start_topics_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("NumberOfTopics", option_to_yojson number_of_topics_integer_to_yojson x.number_of_topics);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_targeted_sentiment_detection_job_response_to_yojson
    (x : start_targeted_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let start_targeted_sentiment_detection_job_request_to_yojson
    (x : start_targeted_sentiment_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_sentiment_detection_job_response_to_yojson (x : start_sentiment_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let start_sentiment_detection_job_request_to_yojson (x : start_sentiment_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_pii_entities_detection_job_response_to_yojson
    (x : start_pii_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let mask_character_to_yojson = string_to_yojson

let pii_entities_detection_mask_mode_to_yojson (x : pii_entities_detection_mask_mode) =
  match x with
  | MASK -> `String "MASK"
  | REPLACE_WITH_PII_ENTITY_TYPE -> `String "REPLACE_WITH_PII_ENTITY_TYPE"

let pii_entity_type_to_yojson (x : pii_entity_type) =
  match x with
  | BANK_ACCOUNT_NUMBER -> `String "BANK_ACCOUNT_NUMBER"
  | BANK_ROUTING -> `String "BANK_ROUTING"
  | CREDIT_DEBIT_NUMBER -> `String "CREDIT_DEBIT_NUMBER"
  | CREDIT_DEBIT_CVV -> `String "CREDIT_DEBIT_CVV"
  | CREDIT_DEBIT_EXPIRY -> `String "CREDIT_DEBIT_EXPIRY"
  | PIN -> `String "PIN"
  | EMAIL -> `String "EMAIL"
  | ADDRESS -> `String "ADDRESS"
  | NAME -> `String "NAME"
  | PHONE -> `String "PHONE"
  | SSN -> `String "SSN"
  | DATE_TIME -> `String "DATE_TIME"
  | PASSPORT_NUMBER -> `String "PASSPORT_NUMBER"
  | DRIVER_ID -> `String "DRIVER_ID"
  | URL -> `String "URL"
  | AGE -> `String "AGE"
  | USERNAME -> `String "USERNAME"
  | PASSWORD -> `String "PASSWORD"
  | AWS_ACCESS_KEY -> `String "AWS_ACCESS_KEY"
  | AWS_SECRET_KEY -> `String "AWS_SECRET_KEY"
  | IP_ADDRESS -> `String "IP_ADDRESS"
  | MAC_ADDRESS -> `String "MAC_ADDRESS"
  | ALL -> `String "ALL"
  | LICENSE_PLATE -> `String "LICENSE_PLATE"
  | VEHICLE_IDENTIFICATION_NUMBER -> `String "VEHICLE_IDENTIFICATION_NUMBER"
  | UK_NATIONAL_INSURANCE_NUMBER -> `String "UK_NATIONAL_INSURANCE_NUMBER"
  | CA_SOCIAL_INSURANCE_NUMBER -> `String "CA_SOCIAL_INSURANCE_NUMBER"
  | US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER -> `String "US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER"
  | UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER -> `String "UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER"
  | IN_PERMANENT_ACCOUNT_NUMBER -> `String "IN_PERMANENT_ACCOUNT_NUMBER"
  | IN_NREGA -> `String "IN_NREGA"
  | INTERNATIONAL_BANK_ACCOUNT_NUMBER -> `String "INTERNATIONAL_BANK_ACCOUNT_NUMBER"
  | SWIFT_CODE -> `String "SWIFT_CODE"
  | UK_NATIONAL_HEALTH_SERVICE_NUMBER -> `String "UK_NATIONAL_HEALTH_SERVICE_NUMBER"
  | CA_HEALTH_NUMBER -> `String "CA_HEALTH_NUMBER"
  | IN_AADHAAR -> `String "IN_AADHAAR"
  | IN_VOTER_NUMBER -> `String "IN_VOTER_NUMBER"

let list_of_pii_entity_types_to_yojson tree = list_to_yojson pii_entity_type_to_yojson tree

let redaction_config_to_yojson (x : redaction_config) =
  assoc_to_yojson
    [
      ("PiiEntityTypes", option_to_yojson list_of_pii_entity_types_to_yojson x.pii_entity_types);
      ("MaskMode", option_to_yojson pii_entities_detection_mask_mode_to_yojson x.mask_mode);
      ("MaskCharacter", option_to_yojson mask_character_to_yojson x.mask_character);
    ]

let pii_entities_detection_mode_to_yojson (x : pii_entities_detection_mode) =
  match x with ONLY_REDACTION -> `String "ONLY_REDACTION" | ONLY_OFFSETS -> `String "ONLY_OFFSETS"

let start_pii_entities_detection_job_request_to_yojson
    (x : start_pii_entities_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("Mode", Some (pii_entities_detection_mode_to_yojson x.mode));
      ("RedactionConfig", option_to_yojson redaction_config_to_yojson x.redaction_config);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_key_phrases_detection_job_response_to_yojson
    (x : start_key_phrases_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let start_key_phrases_detection_job_request_to_yojson (x : start_key_phrases_detection_job_request)
    =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_flywheel_iteration_response_to_yojson (x : start_flywheel_iteration_response) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ( "FlywheelIterationId",
        option_to_yojson flywheel_iteration_id_to_yojson x.flywheel_iteration_id );
    ]

let start_flywheel_iteration_request_to_yojson (x : start_flywheel_iteration_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
      ( "ClientRequestToken",
        option_to_yojson client_request_token_string_to_yojson x.client_request_token );
    ]

let start_events_detection_job_response_to_yojson (x : start_events_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let event_type_string_to_yojson = string_to_yojson
let target_event_types_to_yojson tree = list_to_yojson event_type_string_to_yojson tree

let start_events_detection_job_request_to_yojson (x : start_events_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("TargetEventTypes", Some (target_event_types_to_yojson x.target_event_types));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_entities_detection_job_response_to_yojson (x : start_entities_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
    ]

let start_entities_detection_job_request_to_yojson (x : start_entities_detection_job_request) =
  assoc_to_yojson
    [
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let start_dominant_language_detection_job_response_to_yojson
    (x : start_dominant_language_detection_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
    ]

let start_dominant_language_detection_job_request_to_yojson
    (x : start_dominant_language_detection_job_request) =
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
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let start_document_classification_job_response_to_yojson
    (x : start_document_classification_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
    ]

let start_document_classification_job_request_to_yojson
    (x : start_document_classification_job_request) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let policy_revision_id_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [ ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id) ]

let policy_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (comprehend_model_arn_to_yojson x.resource_arn));
      ("ResourcePolicy", Some (policy_to_yojson x.resource_policy));
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
    ]

let invalid_filter_exception_to_yojson (x : invalid_filter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let topics_detection_job_properties_to_yojson (x : topics_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("NumberOfTopics", option_to_yojson integer_to_yojson x.number_of_topics);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let topics_detection_job_properties_list_to_yojson tree =
  list_to_yojson topics_detection_job_properties_to_yojson tree

let list_topics_detection_jobs_response_to_yojson (x : list_topics_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "TopicsDetectionJobPropertiesList",
        option_to_yojson topics_detection_job_properties_list_to_yojson
          x.topics_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_results_integer_to_yojson = int_to_yojson

let topics_detection_job_filter_to_yojson (x : topics_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_topics_detection_jobs_request_to_yojson (x : list_topics_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson topics_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let targeted_sentiment_detection_job_properties_to_yojson
    (x : targeted_sentiment_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let targeted_sentiment_detection_job_properties_list_to_yojson tree =
  list_to_yojson targeted_sentiment_detection_job_properties_to_yojson tree

let list_targeted_sentiment_detection_jobs_response_to_yojson
    (x : list_targeted_sentiment_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "TargetedSentimentDetectionJobPropertiesList",
        option_to_yojson targeted_sentiment_detection_job_properties_list_to_yojson
          x.targeted_sentiment_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let targeted_sentiment_detection_job_filter_to_yojson (x : targeted_sentiment_detection_job_filter)
    =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_targeted_sentiment_detection_jobs_request_to_yojson
    (x : list_targeted_sentiment_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson targeted_sentiment_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson comprehend_arn_to_yojson x.resource_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (comprehend_arn_to_yojson x.resource_arn)) ]

let sentiment_detection_job_properties_to_yojson (x : sentiment_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let sentiment_detection_job_properties_list_to_yojson tree =
  list_to_yojson sentiment_detection_job_properties_to_yojson tree

let list_sentiment_detection_jobs_response_to_yojson (x : list_sentiment_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "SentimentDetectionJobPropertiesList",
        option_to_yojson sentiment_detection_job_properties_list_to_yojson
          x.sentiment_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let sentiment_detection_job_filter_to_yojson (x : sentiment_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_sentiment_detection_jobs_request_to_yojson (x : list_sentiment_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson sentiment_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let pii_output_data_config_to_yojson (x : pii_output_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let pii_entities_detection_job_properties_to_yojson (x : pii_entities_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson pii_output_data_config_to_yojson x.output_data_config);
      ("RedactionConfig", option_to_yojson redaction_config_to_yojson x.redaction_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Mode", option_to_yojson pii_entities_detection_mode_to_yojson x.mode);
    ]

let pii_entities_detection_job_properties_list_to_yojson tree =
  list_to_yojson pii_entities_detection_job_properties_to_yojson tree

let list_pii_entities_detection_jobs_response_to_yojson
    (x : list_pii_entities_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "PiiEntitiesDetectionJobPropertiesList",
        option_to_yojson pii_entities_detection_job_properties_list_to_yojson
          x.pii_entities_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let pii_entities_detection_job_filter_to_yojson (x : pii_entities_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_pii_entities_detection_jobs_request_to_yojson
    (x : list_pii_entities_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson pii_entities_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let key_phrases_detection_job_properties_to_yojson (x : key_phrases_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let key_phrases_detection_job_properties_list_to_yojson tree =
  list_to_yojson key_phrases_detection_job_properties_to_yojson tree

let list_key_phrases_detection_jobs_response_to_yojson
    (x : list_key_phrases_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "KeyPhrasesDetectionJobPropertiesList",
        option_to_yojson key_phrases_detection_job_properties_list_to_yojson
          x.key_phrases_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let key_phrases_detection_job_filter_to_yojson (x : key_phrases_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_key_phrases_detection_jobs_request_to_yojson (x : list_key_phrases_detection_jobs_request)
    =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson key_phrases_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let flywheel_summary_to_yojson (x : flywheel_summary) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("DataLakeS3Uri", option_to_yojson s3_uri_to_yojson x.data_lake_s3_uri);
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "LatestFlywheelIteration",
        option_to_yojson flywheel_iteration_id_to_yojson x.latest_flywheel_iteration );
    ]

let flywheel_summary_list_to_yojson tree = list_to_yojson flywheel_summary_to_yojson tree

let list_flywheels_response_to_yojson (x : list_flywheels_response) =
  assoc_to_yojson
    [
      ( "FlywheelSummaryList",
        option_to_yojson flywheel_summary_list_to_yojson x.flywheel_summary_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let flywheel_filter_to_yojson (x : flywheel_filter) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson flywheel_status_to_yojson x.status);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
    ]

let list_flywheels_request_to_yojson (x : list_flywheels_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson flywheel_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let flywheel_model_evaluation_metrics_to_yojson (x : flywheel_model_evaluation_metrics) =
  assoc_to_yojson
    [
      ("AverageF1Score", option_to_yojson double_to_yojson x.average_f1_score);
      ("AveragePrecision", option_to_yojson double_to_yojson x.average_precision);
      ("AverageRecall", option_to_yojson double_to_yojson x.average_recall);
      ("AverageAccuracy", option_to_yojson double_to_yojson x.average_accuracy);
    ]

let flywheel_iteration_status_to_yojson (x : flywheel_iteration_status) =
  match x with
  | TRAINING -> `String "TRAINING"
  | EVALUATING -> `String "EVALUATING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"

let flywheel_iteration_properties_to_yojson (x : flywheel_iteration_properties) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ( "FlywheelIterationId",
        option_to_yojson flywheel_iteration_id_to_yojson x.flywheel_iteration_id );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Status", option_to_yojson flywheel_iteration_status_to_yojson x.status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("EvaluatedModelArn", option_to_yojson comprehend_model_arn_to_yojson x.evaluated_model_arn);
      ( "EvaluatedModelMetrics",
        option_to_yojson flywheel_model_evaluation_metrics_to_yojson x.evaluated_model_metrics );
      ("TrainedModelArn", option_to_yojson comprehend_model_arn_to_yojson x.trained_model_arn);
      ( "TrainedModelMetrics",
        option_to_yojson flywheel_model_evaluation_metrics_to_yojson x.trained_model_metrics );
      ( "EvaluationManifestS3Prefix",
        option_to_yojson s3_uri_to_yojson x.evaluation_manifest_s3_prefix );
    ]

let flywheel_iteration_properties_list_to_yojson tree =
  list_to_yojson flywheel_iteration_properties_to_yojson tree

let list_flywheel_iteration_history_response_to_yojson
    (x : list_flywheel_iteration_history_response) =
  assoc_to_yojson
    [
      ( "FlywheelIterationPropertiesList",
        option_to_yojson flywheel_iteration_properties_list_to_yojson
          x.flywheel_iteration_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let flywheel_iteration_filter_to_yojson (x : flywheel_iteration_filter) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
    ]

let list_flywheel_iteration_history_request_to_yojson (x : list_flywheel_iteration_history_request)
    =
  assoc_to_yojson
    [
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
      ("Filter", option_to_yojson flywheel_iteration_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let events_detection_job_properties_to_yojson (x : events_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("TargetEventTypes", option_to_yojson target_event_types_to_yojson x.target_event_types);
    ]

let events_detection_job_properties_list_to_yojson tree =
  list_to_yojson events_detection_job_properties_to_yojson tree

let list_events_detection_jobs_response_to_yojson (x : list_events_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "EventsDetectionJobPropertiesList",
        option_to_yojson events_detection_job_properties_list_to_yojson
          x.events_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let events_detection_job_filter_to_yojson (x : events_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_events_detection_jobs_request_to_yojson (x : list_events_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson events_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let model_status_to_yojson (x : model_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | TRAINING -> `String "TRAINING"
  | DELETING -> `String "DELETING"
  | STOP_REQUESTED -> `String "STOP_REQUESTED"
  | STOPPED -> `String "STOPPED"
  | IN_ERROR -> `String "IN_ERROR"
  | TRAINED -> `String "TRAINED"
  | TRAINED_WITH_WARNING -> `String "TRAINED_WITH_WARNING"

let version_name_to_yojson = string_to_yojson

let entity_recognizer_summary_to_yojson (x : entity_recognizer_summary) =
  assoc_to_yojson
    [
      ("RecognizerName", option_to_yojson comprehend_arn_name_to_yojson x.recognizer_name);
      ("NumberOfVersions", option_to_yojson integer_to_yojson x.number_of_versions);
      ("LatestVersionCreatedAt", option_to_yojson timestamp_to_yojson x.latest_version_created_at);
      ("LatestVersionName", option_to_yojson version_name_to_yojson x.latest_version_name);
      ("LatestVersionStatus", option_to_yojson model_status_to_yojson x.latest_version_status);
    ]

let entity_recognizer_summaries_list_to_yojson tree =
  list_to_yojson entity_recognizer_summary_to_yojson tree

let list_entity_recognizer_summaries_response_to_yojson
    (x : list_entity_recognizer_summaries_response) =
  assoc_to_yojson
    [
      ( "EntityRecognizerSummariesList",
        option_to_yojson entity_recognizer_summaries_list_to_yojson
          x.entity_recognizer_summaries_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_entity_recognizer_summaries_request_to_yojson
    (x : list_entity_recognizer_summaries_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let entity_recognizer_output_data_config_to_yojson (x : entity_recognizer_output_data_config) =
  assoc_to_yojson
    [ ("FlywheelStatsS3Prefix", option_to_yojson s3_uri_to_yojson x.flywheel_stats_s3_prefix) ]

let entity_types_evaluation_metrics_to_yojson (x : entity_types_evaluation_metrics) =
  assoc_to_yojson
    [
      ("Precision", option_to_yojson double_to_yojson x.precision);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
    ]

let entity_recognizer_metadata_entity_types_list_item_to_yojson
    (x : entity_recognizer_metadata_entity_types_list_item) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson any_length_string_to_yojson x.type_);
      ( "EvaluationMetrics",
        option_to_yojson entity_types_evaluation_metrics_to_yojson x.evaluation_metrics );
      ("NumberOfTrainMentions", option_to_yojson integer_to_yojson x.number_of_train_mentions);
    ]

let entity_recognizer_metadata_entity_types_list_to_yojson tree =
  list_to_yojson entity_recognizer_metadata_entity_types_list_item_to_yojson tree

let entity_recognizer_evaluation_metrics_to_yojson (x : entity_recognizer_evaluation_metrics) =
  assoc_to_yojson
    [
      ("Precision", option_to_yojson double_to_yojson x.precision);
      ("Recall", option_to_yojson double_to_yojson x.recall);
      ("F1Score", option_to_yojson double_to_yojson x.f1_score);
    ]

let entity_recognizer_metadata_to_yojson (x : entity_recognizer_metadata) =
  assoc_to_yojson
    [
      ("NumberOfTrainedDocuments", option_to_yojson integer_to_yojson x.number_of_trained_documents);
      ("NumberOfTestDocuments", option_to_yojson integer_to_yojson x.number_of_test_documents);
      ( "EvaluationMetrics",
        option_to_yojson entity_recognizer_evaluation_metrics_to_yojson x.evaluation_metrics );
      ( "EntityTypes",
        option_to_yojson entity_recognizer_metadata_entity_types_list_to_yojson x.entity_types );
    ]

let entity_recognizer_augmented_manifests_list_to_yojson tree =
  list_to_yojson augmented_manifests_list_item_to_yojson tree

let entity_recognizer_entity_list_to_yojson (x : entity_recognizer_entity_list) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let entity_recognizer_annotations_to_yojson (x : entity_recognizer_annotations) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
    ]

let entity_recognizer_documents_to_yojson (x : entity_recognizer_documents) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
    ]

let entity_recognizer_data_format_to_yojson (x : entity_recognizer_data_format) =
  match x with
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"

let entity_recognizer_input_data_config_to_yojson (x : entity_recognizer_input_data_config) =
  assoc_to_yojson
    [
      ("DataFormat", option_to_yojson entity_recognizer_data_format_to_yojson x.data_format);
      ("EntityTypes", Some (entity_types_list_to_yojson x.entity_types));
      ("Documents", option_to_yojson entity_recognizer_documents_to_yojson x.documents);
      ("Annotations", option_to_yojson entity_recognizer_annotations_to_yojson x.annotations);
      ("EntityList", option_to_yojson entity_recognizer_entity_list_to_yojson x.entity_list);
      ( "AugmentedManifests",
        option_to_yojson entity_recognizer_augmented_manifests_list_to_yojson x.augmented_manifests
      );
    ]

let entity_recognizer_properties_to_yojson (x : entity_recognizer_properties) =
  assoc_to_yojson
    [
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ( "InputDataConfig",
        option_to_yojson entity_recognizer_input_data_config_to_yojson x.input_data_config );
      ( "RecognizerMetadata",
        option_to_yojson entity_recognizer_metadata_to_yojson x.recognizer_metadata );
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("SourceModelArn", option_to_yojson entity_recognizer_arn_to_yojson x.source_model_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ( "OutputDataConfig",
        option_to_yojson entity_recognizer_output_data_config_to_yojson x.output_data_config );
    ]

let entity_recognizer_properties_list_to_yojson tree =
  list_to_yojson entity_recognizer_properties_to_yojson tree

let list_entity_recognizers_response_to_yojson (x : list_entity_recognizers_response) =
  assoc_to_yojson
    [
      ( "EntityRecognizerPropertiesList",
        option_to_yojson entity_recognizer_properties_list_to_yojson
          x.entity_recognizer_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let entity_recognizer_filter_to_yojson (x : entity_recognizer_filter) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("RecognizerName", option_to_yojson comprehend_arn_name_to_yojson x.recognizer_name);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_entity_recognizers_request_to_yojson (x : list_entity_recognizers_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson entity_recognizer_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let entities_detection_job_properties_to_yojson (x : entities_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ( "EntityRecognizerArn",
        option_to_yojson entity_recognizer_arn_to_yojson x.entity_recognizer_arn );
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let entities_detection_job_properties_list_to_yojson tree =
  list_to_yojson entities_detection_job_properties_to_yojson tree

let list_entities_detection_jobs_response_to_yojson (x : list_entities_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "EntitiesDetectionJobPropertiesList",
        option_to_yojson entities_detection_job_properties_list_to_yojson
          x.entities_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let entities_detection_job_filter_to_yojson (x : entities_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_entities_detection_jobs_request_to_yojson (x : list_entities_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson entities_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let endpoint_status_to_yojson (x : endpoint_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | IN_SERVICE -> `String "IN_SERVICE"
  | UPDATING -> `String "UPDATING"

let endpoint_properties_to_yojson (x : endpoint_properties) =
  assoc_to_yojson
    [
      ("EndpointArn", option_to_yojson comprehend_endpoint_arn_to_yojson x.endpoint_arn);
      ("Status", option_to_yojson endpoint_status_to_yojson x.status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("DesiredModelArn", option_to_yojson comprehend_model_arn_to_yojson x.desired_model_arn);
      ( "DesiredInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.desired_inference_units );
      ( "CurrentInferenceUnits",
        option_to_yojson inference_units_integer_to_yojson x.current_inference_units );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ( "DesiredDataAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.desired_data_access_role_arn );
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let endpoint_properties_list_to_yojson tree = list_to_yojson endpoint_properties_to_yojson tree

let list_endpoints_response_to_yojson (x : list_endpoints_response) =
  assoc_to_yojson
    [
      ( "EndpointPropertiesList",
        option_to_yojson endpoint_properties_list_to_yojson x.endpoint_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let endpoint_filter_to_yojson (x : endpoint_filter) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson endpoint_status_to_yojson x.status);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let list_endpoints_request_to_yojson (x : list_endpoints_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson endpoint_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let dominant_language_detection_job_properties_to_yojson
    (x : dominant_language_detection_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
    ]

let dominant_language_detection_job_properties_list_to_yojson tree =
  list_to_yojson dominant_language_detection_job_properties_to_yojson tree

let list_dominant_language_detection_jobs_response_to_yojson
    (x : list_dominant_language_detection_jobs_response) =
  assoc_to_yojson
    [
      ( "DominantLanguageDetectionJobPropertiesList",
        option_to_yojson dominant_language_detection_job_properties_list_to_yojson
          x.dominant_language_detection_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let dominant_language_detection_job_filter_to_yojson (x : dominant_language_detection_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_dominant_language_detection_jobs_request_to_yojson
    (x : list_dominant_language_detection_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson dominant_language_detection_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let document_classifier_summary_to_yojson (x : document_classifier_summary) =
  assoc_to_yojson
    [
      ( "DocumentClassifierName",
        option_to_yojson comprehend_arn_name_to_yojson x.document_classifier_name );
      ("NumberOfVersions", option_to_yojson integer_to_yojson x.number_of_versions);
      ("LatestVersionCreatedAt", option_to_yojson timestamp_to_yojson x.latest_version_created_at);
      ("LatestVersionName", option_to_yojson version_name_to_yojson x.latest_version_name);
      ("LatestVersionStatus", option_to_yojson model_status_to_yojson x.latest_version_status);
    ]

let document_classifier_summaries_list_to_yojson tree =
  list_to_yojson document_classifier_summary_to_yojson tree

let list_document_classifier_summaries_response_to_yojson
    (x : list_document_classifier_summaries_response) =
  assoc_to_yojson
    [
      ( "DocumentClassifierSummariesList",
        option_to_yojson document_classifier_summaries_list_to_yojson
          x.document_classifier_summaries_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_document_classifier_summaries_request_to_yojson
    (x : list_document_classifier_summaries_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let document_classifier_output_data_config_to_yojson (x : document_classifier_output_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("FlywheelStatsS3Prefix", option_to_yojson s3_uri_to_yojson x.flywheel_stats_s3_prefix);
    ]

let document_classifier_documents_to_yojson (x : document_classifier_documents) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
    ]

let document_classifier_document_type_format_to_yojson
    (x : document_classifier_document_type_format) =
  match x with
  | PLAIN_TEXT_DOCUMENT -> `String "PLAIN_TEXT_DOCUMENT"
  | SEMI_STRUCTURED_DOCUMENT -> `String "SEMI_STRUCTURED_DOCUMENT"

let document_classifier_augmented_manifests_list_to_yojson tree =
  list_to_yojson augmented_manifests_list_item_to_yojson tree

let label_delimiter_to_yojson = string_to_yojson

let document_classifier_data_format_to_yojson (x : document_classifier_data_format) =
  match x with
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"

let document_classifier_input_data_config_to_yojson (x : document_classifier_input_data_config) =
  assoc_to_yojson
    [
      ("DataFormat", option_to_yojson document_classifier_data_format_to_yojson x.data_format);
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
      ("TestS3Uri", option_to_yojson s3_uri_to_yojson x.test_s3_uri);
      ("LabelDelimiter", option_to_yojson label_delimiter_to_yojson x.label_delimiter);
      ( "AugmentedManifests",
        option_to_yojson document_classifier_augmented_manifests_list_to_yojson
          x.augmented_manifests );
      ( "DocumentType",
        option_to_yojson document_classifier_document_type_format_to_yojson x.document_type );
      ("Documents", option_to_yojson document_classifier_documents_to_yojson x.documents);
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
    ]

let document_classifier_properties_to_yojson (x : document_classifier_properties) =
  assoc_to_yojson
    [
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ( "InputDataConfig",
        option_to_yojson document_classifier_input_data_config_to_yojson x.input_data_config );
      ( "OutputDataConfig",
        option_to_yojson document_classifier_output_data_config_to_yojson x.output_data_config );
      ("ClassifierMetadata", option_to_yojson classifier_metadata_to_yojson x.classifier_metadata);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Mode", option_to_yojson document_classifier_mode_to_yojson x.mode);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("SourceModelArn", option_to_yojson document_classifier_arn_to_yojson x.source_model_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let document_classifier_properties_list_to_yojson tree =
  list_to_yojson document_classifier_properties_to_yojson tree

let list_document_classifiers_response_to_yojson (x : list_document_classifiers_response) =
  assoc_to_yojson
    [
      ( "DocumentClassifierPropertiesList",
        option_to_yojson document_classifier_properties_list_to_yojson
          x.document_classifier_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let document_classifier_filter_to_yojson (x : document_classifier_filter) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ( "DocumentClassifierName",
        option_to_yojson comprehend_arn_name_to_yojson x.document_classifier_name );
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_document_classifiers_request_to_yojson (x : list_document_classifiers_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson document_classifier_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let document_classification_job_properties_to_yojson (x : document_classification_job_properties) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobArn", option_to_yojson comprehend_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("SubmitTime", option_to_yojson timestamp_to_yojson x.submit_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ( "DocumentClassifierArn",
        option_to_yojson document_classifier_arn_to_yojson x.document_classifier_arn );
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
    ]

let document_classification_job_properties_list_to_yojson tree =
  list_to_yojson document_classification_job_properties_to_yojson tree

let list_document_classification_jobs_response_to_yojson
    (x : list_document_classification_jobs_response) =
  assoc_to_yojson
    [
      ( "DocumentClassificationJobPropertiesList",
        option_to_yojson document_classification_job_properties_list_to_yojson
          x.document_classification_job_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let document_classification_job_filter_to_yojson (x : document_classification_job_filter) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("SubmitTimeBefore", option_to_yojson timestamp_to_yojson x.submit_time_before);
      ("SubmitTimeAfter", option_to_yojson timestamp_to_yojson x.submit_time_after);
    ]

let list_document_classification_jobs_request_to_yojson
    (x : list_document_classification_jobs_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson document_classification_job_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let number_of_documents_to_yojson = long_to_yojson

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | CREATING -> `String "CREATING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let description_to_yojson = string_to_yojson

let dataset_type_to_yojson (x : dataset_type) =
  match x with TRAIN -> `String "TRAIN" | TEST -> `String "TEST"

let dataset_properties_to_yojson (x : dataset_properties) =
  assoc_to_yojson
    [
      ("DatasetArn", option_to_yojson comprehend_dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson comprehend_arn_name_to_yojson x.dataset_name);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("DatasetS3Uri", option_to_yojson s3_uri_to_yojson x.dataset_s3_uri);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("Message", option_to_yojson any_length_string_to_yojson x.message);
      ("NumberOfDocuments", option_to_yojson number_of_documents_to_yojson x.number_of_documents);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
    ]

let dataset_properties_list_to_yojson tree = list_to_yojson dataset_properties_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ( "DatasetPropertiesList",
        option_to_yojson dataset_properties_list_to_yojson x.dataset_properties_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let dataset_filter_to_yojson (x : dataset_filter) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("Filter", option_to_yojson dataset_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
    ]

let import_model_response_to_yojson (x : import_model_response) =
  assoc_to_yojson [ ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn) ]

let import_model_request_to_yojson (x : import_model_request) =
  assoc_to_yojson
    [
      ("SourceModelArn", Some (comprehend_model_arn_to_yojson x.source_model_arn));
      ("ModelName", option_to_yojson comprehend_arn_name_to_yojson x.model_name);
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let toxic_content_type_to_yojson (x : toxic_content_type) =
  match x with
  | GRAPHIC -> `String "GRAPHIC"
  | HARASSMENT_OR_ABUSE -> `String "HARASSMENT_OR_ABUSE"
  | HATE_SPEECH -> `String "HATE_SPEECH"
  | INSULT -> `String "INSULT"
  | PROFANITY -> `String "PROFANITY"
  | SEXUAL -> `String "SEXUAL"
  | VIOLENCE_OR_THREAT -> `String "VIOLENCE_OR_THREAT"

let toxic_content_to_yojson (x : toxic_content) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson toxic_content_type_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_toxic_content_to_yojson tree = list_to_yojson toxic_content_to_yojson tree

let toxic_labels_to_yojson (x : toxic_labels) =
  assoc_to_yojson
    [
      ("Labels", option_to_yojson list_of_toxic_content_to_yojson x.labels);
      ("Toxicity", option_to_yojson float__to_yojson x.toxicity);
    ]

let list_of_toxic_labels_to_yojson tree = list_to_yojson toxic_labels_to_yojson tree

let detect_toxic_content_response_to_yojson (x : detect_toxic_content_response) =
  assoc_to_yojson [ ("ResultList", option_to_yojson list_of_toxic_labels_to_yojson x.result_list) ]

let text_segment_to_yojson (x : text_segment) =
  assoc_to_yojson [ ("Text", Some (customer_input_string_to_yojson x.text)) ]

let list_of_text_segments_to_yojson tree = list_to_yojson text_segment_to_yojson tree

let detect_toxic_content_request_to_yojson (x : detect_toxic_content_request) =
  assoc_to_yojson
    [
      ("TextSegments", Some (list_of_text_segments_to_yojson x.text_segments));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let detect_targeted_sentiment_response_to_yojson (x : detect_targeted_sentiment_response) =
  assoc_to_yojson
    [ ("Entities", option_to_yojson list_of_targeted_sentiment_entities_to_yojson x.entities) ]

let detect_targeted_sentiment_request_to_yojson (x : detect_targeted_sentiment_request) =
  assoc_to_yojson
    [
      ("Text", Some (customer_input_string_to_yojson x.text));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let detect_syntax_response_to_yojson (x : detect_syntax_response) =
  assoc_to_yojson
    [ ("SyntaxTokens", option_to_yojson list_of_syntax_tokens_to_yojson x.syntax_tokens) ]

let detect_syntax_request_to_yojson (x : detect_syntax_request) =
  assoc_to_yojson
    [
      ("Text", Some (customer_input_string_to_yojson x.text));
      ("LanguageCode", Some (syntax_language_code_to_yojson x.language_code));
    ]

let detect_sentiment_response_to_yojson (x : detect_sentiment_response) =
  assoc_to_yojson
    [
      ("Sentiment", option_to_yojson sentiment_type_to_yojson x.sentiment);
      ("SentimentScore", option_to_yojson sentiment_score_to_yojson x.sentiment_score);
    ]

let detect_sentiment_request_to_yojson (x : detect_sentiment_request) =
  assoc_to_yojson
    [
      ("Text", Some (customer_input_string_to_yojson x.text));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let pii_entity_to_yojson (x : pii_entity) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("Type", option_to_yojson pii_entity_type_to_yojson x.type_);
      ("BeginOffset", option_to_yojson integer_to_yojson x.begin_offset);
      ("EndOffset", option_to_yojson integer_to_yojson x.end_offset);
    ]

let list_of_pii_entities_to_yojson tree = list_to_yojson pii_entity_to_yojson tree

let detect_pii_entities_response_to_yojson (x : detect_pii_entities_response) =
  assoc_to_yojson [ ("Entities", option_to_yojson list_of_pii_entities_to_yojson x.entities) ]

let detect_pii_entities_request_to_yojson (x : detect_pii_entities_request) =
  assoc_to_yojson
    [
      ("Text", Some (string__to_yojson x.text));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let detect_key_phrases_response_to_yojson (x : detect_key_phrases_response) =
  assoc_to_yojson [ ("KeyPhrases", option_to_yojson list_of_key_phrases_to_yojson x.key_phrases) ]

let detect_key_phrases_request_to_yojson (x : detect_key_phrases_request) =
  assoc_to_yojson
    [
      ("Text", Some (customer_input_string_to_yojson x.text));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]

let list_of_blocks_to_yojson tree = list_to_yojson block_to_yojson tree

let detect_entities_response_to_yojson (x : detect_entities_response) =
  assoc_to_yojson
    [
      ("Entities", option_to_yojson list_of_entities_to_yojson x.entities);
      ("DocumentMetadata", option_to_yojson document_metadata_to_yojson x.document_metadata);
      ("DocumentType", option_to_yojson list_of_document_type_to_yojson x.document_type);
      ("Blocks", option_to_yojson list_of_blocks_to_yojson x.blocks);
      ("Errors", option_to_yojson list_of_errors_to_yojson x.errors);
    ]

let entity_recognizer_endpoint_arn_to_yojson = string_to_yojson

let detect_entities_request_to_yojson (x : detect_entities_request) =
  assoc_to_yojson
    [
      ("Text", option_to_yojson customer_input_string_to_yojson x.text);
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("EndpointArn", option_to_yojson entity_recognizer_endpoint_arn_to_yojson x.endpoint_arn);
      ("Bytes", option_to_yojson semi_structured_document_blob_to_yojson x.bytes);
      ( "DocumentReaderConfig",
        option_to_yojson document_reader_config_to_yojson x.document_reader_config );
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
      ("ResourcePolicy", option_to_yojson policy_to_yojson x.resource_policy);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
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

let describe_flywheel_iteration_response_to_yojson (x : describe_flywheel_iteration_response) =
  assoc_to_yojson
    [
      ( "FlywheelIterationProperties",
        option_to_yojson flywheel_iteration_properties_to_yojson x.flywheel_iteration_properties );
    ]

let describe_flywheel_iteration_request_to_yojson (x : describe_flywheel_iteration_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
      ("FlywheelIterationId", Some (flywheel_iteration_id_to_yojson x.flywheel_iteration_id));
    ]

let describe_flywheel_response_to_yojson (x : describe_flywheel_response) =
  assoc_to_yojson
    [ ("FlywheelProperties", option_to_yojson flywheel_properties_to_yojson x.flywheel_properties) ]

let describe_flywheel_request_to_yojson (x : describe_flywheel_request) =
  assoc_to_yojson [ ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn)) ]

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
      ("ResourceArn", Some (comprehend_model_arn_to_yojson x.resource_arn));
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
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

let create_flywheel_response_to_yojson (x : create_flywheel_response) =
  assoc_to_yojson
    [
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
    ]

let flywheel_s3_uri_to_yojson = string_to_yojson

let create_flywheel_request_to_yojson (x : create_flywheel_request) =
  assoc_to_yojson
    [
      ("FlywheelName", Some (comprehend_arn_name_to_yojson x.flywheel_name));
      ("ActiveModelArn", option_to_yojson comprehend_model_arn_to_yojson x.active_model_arn);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("TaskConfig", option_to_yojson task_config_to_yojson x.task_config);
      ("ModelType", option_to_yojson model_type_to_yojson x.model_type);
      ("DataLakeS3Uri", Some (flywheel_s3_uri_to_yojson x.data_lake_s3_uri));
      ("DataSecurityConfig", option_to_yojson data_security_config_to_yojson x.data_security_config);
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
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
      ("RecognizerName", Some (comprehend_arn_name_to_yojson x.recognizer_name));
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("InputDataConfig", Some (entity_recognizer_input_data_config_to_yojson x.input_data_config));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("ModelPolicy", option_to_yojson policy_to_yojson x.model_policy);
    ]

let create_endpoint_response_to_yojson (x : create_endpoint_response) =
  assoc_to_yojson
    [
      ("EndpointArn", option_to_yojson comprehend_endpoint_arn_to_yojson x.endpoint_arn);
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
    ]

let create_endpoint_request_to_yojson (x : create_endpoint_request) =
  assoc_to_yojson
    [
      ("EndpointName", Some (comprehend_endpoint_name_to_yojson x.endpoint_name));
      ("ModelArn", option_to_yojson comprehend_model_arn_to_yojson x.model_arn);
      ("DesiredInferenceUnits", Some (inference_units_integer_to_yojson x.desired_inference_units));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("FlywheelArn", option_to_yojson comprehend_flywheel_arn_to_yojson x.flywheel_arn);
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
      ("DocumentClassifierName", Some (comprehend_arn_name_to_yojson x.document_classifier_name));
      ("VersionName", option_to_yojson version_name_to_yojson x.version_name);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("InputDataConfig", Some (document_classifier_input_data_config_to_yojson x.input_data_config));
      ( "OutputDataConfig",
        option_to_yojson document_classifier_output_data_config_to_yojson x.output_data_config );
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Mode", option_to_yojson document_classifier_mode_to_yojson x.mode);
      ("ModelKmsKeyId", option_to_yojson kms_key_id_to_yojson x.model_kms_key_id);
      ("ModelPolicy", option_to_yojson policy_to_yojson x.model_policy);
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson
    [ ("DatasetArn", option_to_yojson comprehend_dataset_arn_to_yojson x.dataset_arn) ]

let dataset_entity_recognizer_entity_list_to_yojson (x : dataset_entity_recognizer_entity_list) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let dataset_entity_recognizer_documents_to_yojson (x : dataset_entity_recognizer_documents) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("InputFormat", option_to_yojson input_format_to_yojson x.input_format);
    ]

let dataset_entity_recognizer_annotations_to_yojson (x : dataset_entity_recognizer_annotations) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let dataset_entity_recognizer_input_data_config_to_yojson
    (x : dataset_entity_recognizer_input_data_config) =
  assoc_to_yojson
    [
      ("Annotations", option_to_yojson dataset_entity_recognizer_annotations_to_yojson x.annotations);
      ("Documents", Some (dataset_entity_recognizer_documents_to_yojson x.documents));
      ("EntityList", option_to_yojson dataset_entity_recognizer_entity_list_to_yojson x.entity_list);
    ]

let dataset_document_classifier_input_data_config_to_yojson
    (x : dataset_document_classifier_input_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("LabelDelimiter", option_to_yojson label_delimiter_to_yojson x.label_delimiter);
    ]

let dataset_data_format_to_yojson (x : dataset_data_format) =
  match x with
  | COMPREHEND_CSV -> `String "COMPREHEND_CSV"
  | AUGMENTED_MANIFEST -> `String "AUGMENTED_MANIFEST"

let dataset_augmented_manifests_list_item_to_yojson (x : dataset_augmented_manifests_list_item) =
  assoc_to_yojson
    [
      ("AttributeNames", Some (attribute_names_list_to_yojson x.attribute_names));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("AnnotationDataS3Uri", option_to_yojson s3_uri_to_yojson x.annotation_data_s3_uri);
      ("SourceDocumentsS3Uri", option_to_yojson s3_uri_to_yojson x.source_documents_s3_uri);
      ( "DocumentType",
        option_to_yojson augmented_manifests_document_type_format_to_yojson x.document_type );
    ]

let dataset_augmented_manifests_list_to_yojson tree =
  list_to_yojson dataset_augmented_manifests_list_item_to_yojson tree

let dataset_input_data_config_to_yojson (x : dataset_input_data_config) =
  assoc_to_yojson
    [
      ( "AugmentedManifests",
        option_to_yojson dataset_augmented_manifests_list_to_yojson x.augmented_manifests );
      ("DataFormat", option_to_yojson dataset_data_format_to_yojson x.data_format);
      ( "DocumentClassifierInputDataConfig",
        option_to_yojson dataset_document_classifier_input_data_config_to_yojson
          x.document_classifier_input_data_config );
      ( "EntityRecognizerInputDataConfig",
        option_to_yojson dataset_entity_recognizer_input_data_config_to_yojson
          x.entity_recognizer_input_data_config );
    ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("FlywheelArn", Some (comprehend_flywheel_arn_to_yojson x.flywheel_arn));
      ("DatasetName", Some (comprehend_arn_name_to_yojson x.dataset_name));
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("InputDataConfig", Some (dataset_input_data_config_to_yojson x.input_data_config));
      ( "ClientRequestToken",
        Some
          (client_request_token_string_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let entity_label_to_yojson (x : entity_label) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson pii_entity_type_to_yojson x.name);
      ("Score", option_to_yojson float__to_yojson x.score);
    ]

let list_of_entity_labels_to_yojson tree = list_to_yojson entity_label_to_yojson tree

let contains_pii_entities_response_to_yojson (x : contains_pii_entities_response) =
  assoc_to_yojson [ ("Labels", option_to_yojson list_of_entity_labels_to_yojson x.labels) ]

let contains_pii_entities_request_to_yojson (x : contains_pii_entities_request) =
  assoc_to_yojson
    [
      ("Text", Some (string__to_yojson x.text));
      ("LanguageCode", Some (language_code_to_yojson x.language_code));
    ]
