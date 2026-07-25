open Smaws_Lib.Json.DeserializeHelpers
open Types

let any_length_string_of_yojson = string_of_yojson
let attribute_names_list_item_of_yojson = string_of_yojson

let attribute_names_list_of_yojson tree path =
  list_of_yojson attribute_names_list_item_of_yojson tree path

let augmented_manifests_document_type_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAIN_TEXT_DOCUMENT" -> PLAIN_TEXT_DOCUMENT
    | `String "SEMI_STRUCTURED_DOCUMENT" -> SEMI_STRUCTURED_DOCUMENT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AugmentedManifestsDocumentTypeFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "AugmentedManifestsDocumentTypeFormat")
     : augmented_manifests_document_type_format)
    : augmented_manifests_document_type_format)

let s3_uri_of_yojson = string_of_yojson

let split_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAIN" -> TRAIN
    | `String "TEST" -> TEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "Split" value)
    | _ -> raise (deserialize_wrong_type_error path "Split")
     : split)
    : split)

let augmented_manifests_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     split = option_of_yojson (value_for_key split_of_yojson "Split") _list path;
     attribute_names = value_for_key attribute_names_list_of_yojson "AttributeNames" _list path;
     annotation_data_s3_uri =
       option_of_yojson (value_for_key s3_uri_of_yojson "AnnotationDataS3Uri") _list path;
     source_documents_s3_uri =
       option_of_yojson (value_for_key s3_uri_of_yojson "SourceDocumentsS3Uri") _list path;
     document_type =
       option_of_yojson
         (value_for_key augmented_manifests_document_type_format_of_yojson "DocumentType")
         _list path;
   }
    : augmented_manifests_list_item)

let string__of_yojson = string_of_yojson

let text_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : text_size_limit_exceeded_exception)

let invalid_request_detail_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOCUMENT_SIZE_EXCEEDED" -> DOCUMENT_SIZE_EXCEEDED
    | `String "UNSUPPORTED_DOC_TYPE" -> UNSUPPORTED_DOC_TYPE
    | `String "PAGE_LIMIT_EXCEEDED" -> PAGE_LIMIT_EXCEEDED
    | `String "TEXTRACT_ACCESS_DENIED" -> TEXTRACT_ACCESS_DENIED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvalidRequestDetailReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InvalidRequestDetailReason")
     : invalid_request_detail_reason)
    : invalid_request_detail_reason)

let invalid_request_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key invalid_request_detail_reason_of_yojson "Reason") _list path;
   }
    : invalid_request_detail)

let invalid_request_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_DOCUMENT" -> INVALID_DOCUMENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvalidRequestReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InvalidRequestReason")
     : invalid_request_reason)
    : invalid_request_reason)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     reason = option_of_yojson (value_for_key invalid_request_reason_of_yojson "Reason") _list path;
     detail = option_of_yojson (value_for_key invalid_request_detail_of_yojson "Detail") _list path;
   }
    : invalid_request_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_exception)

let batch_size_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : batch_size_limit_exceeded_exception)

let integer_of_yojson = int_of_yojson

let batch_item_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
   }
    : batch_item_error)

let batch_item_error_list_of_yojson tree path = list_of_yojson batch_item_error_of_yojson tree path
let float__of_yojson = float_of_yojson

let dominant_language_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code = option_of_yojson (value_for_key string__of_yojson "LanguageCode") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : dominant_language)

let list_of_dominant_languages_of_yojson tree path =
  list_of_yojson dominant_language_of_yojson tree path

let batch_detect_dominant_language_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     languages =
       option_of_yojson (value_for_key list_of_dominant_languages_of_yojson "Languages") _list path;
   }
    : batch_detect_dominant_language_item_result)

let list_of_detect_dominant_language_result_of_yojson tree path =
  list_of_yojson batch_detect_dominant_language_item_result_of_yojson tree path

let batch_detect_dominant_language_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list =
       value_for_key list_of_detect_dominant_language_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_dominant_language_response)

let customer_input_string_of_yojson = string_of_yojson

let customer_input_string_list_of_yojson tree path =
  list_of_yojson customer_input_string_of_yojson tree path

let batch_detect_dominant_language_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path }
    : batch_detect_dominant_language_request)

let unsupported_language_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : unsupported_language_exception)

let child_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     child_block_id = option_of_yojson (value_for_key string__of_yojson "ChildBlockId") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
   }
    : child_block)

let list_of_child_blocks_of_yojson tree path = list_of_yojson child_block_of_yojson tree path

let block_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block_id = option_of_yojson (value_for_key string__of_yojson "BlockId") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     child_blocks =
       option_of_yojson (value_for_key list_of_child_blocks_of_yojson "ChildBlocks") _list path;
   }
    : block_reference)

let list_of_block_references_of_yojson tree path =
  list_of_yojson block_reference_of_yojson tree path

let entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERSON" -> PERSON
    | `String "LOCATION" -> LOCATION
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "COMMERCIAL_ITEM" -> COMMERCIAL_ITEM
    | `String "EVENT" -> EVENT
    | `String "DATE" -> DATE
    | `String "QUANTITY" -> QUANTITY
    | `String "TITLE" -> TITLE
    | `String "OTHER" -> OTHER
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")
     : entity_type)
    : entity_type)

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     type_ = option_of_yojson (value_for_key entity_type_of_yojson "Type") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     block_references =
       option_of_yojson
         (value_for_key list_of_block_references_of_yojson "BlockReferences")
         _list path;
   }
    : entity)

let list_of_entities_of_yojson tree path = list_of_yojson entity_of_yojson tree path

let batch_detect_entities_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     entities = option_of_yojson (value_for_key list_of_entities_of_yojson "Entities") _list path;
   }
    : batch_detect_entities_item_result)

let list_of_detect_entities_result_of_yojson tree path =
  list_of_yojson batch_detect_entities_item_result_of_yojson tree path

let batch_detect_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list = value_for_key list_of_detect_entities_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_entities_response)

let language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en" -> EN
    | `String "es" -> ES
    | `String "fr" -> FR
    | `String "de" -> DE
    | `String "it" -> IT
    | `String "pt" -> PT
    | `String "ar" -> AR
    | `String "hi" -> HI
    | `String "ja" -> JA
    | `String "ko" -> KO
    | `String "zh" -> ZH
    | `String "zh-TW" -> ZH_TW
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")
     : language_code)
    : language_code)

let batch_detect_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : batch_detect_entities_request)

let key_phrase_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
   }
    : key_phrase)

let list_of_key_phrases_of_yojson tree path = list_of_yojson key_phrase_of_yojson tree path

let batch_detect_key_phrases_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     key_phrases =
       option_of_yojson (value_for_key list_of_key_phrases_of_yojson "KeyPhrases") _list path;
   }
    : batch_detect_key_phrases_item_result)

let list_of_detect_key_phrases_result_of_yojson tree path =
  list_of_yojson batch_detect_key_phrases_item_result_of_yojson tree path

let batch_detect_key_phrases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list = value_for_key list_of_detect_key_phrases_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_key_phrases_response)

let batch_detect_key_phrases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : batch_detect_key_phrases_request)

let sentiment_score_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     positive = option_of_yojson (value_for_key float__of_yojson "Positive") _list path;
     negative = option_of_yojson (value_for_key float__of_yojson "Negative") _list path;
     neutral = option_of_yojson (value_for_key float__of_yojson "Neutral") _list path;
     mixed = option_of_yojson (value_for_key float__of_yojson "Mixed") _list path;
   }
    : sentiment_score)

let sentiment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "POSITIVE" -> POSITIVE
    | `String "NEGATIVE" -> NEGATIVE
    | `String "NEUTRAL" -> NEUTRAL
    | `String "MIXED" -> MIXED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SentimentType" value)
    | _ -> raise (deserialize_wrong_type_error path "SentimentType")
     : sentiment_type)
    : sentiment_type)

let batch_detect_sentiment_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     sentiment = option_of_yojson (value_for_key sentiment_type_of_yojson "Sentiment") _list path;
     sentiment_score =
       option_of_yojson (value_for_key sentiment_score_of_yojson "SentimentScore") _list path;
   }
    : batch_detect_sentiment_item_result)

let list_of_detect_sentiment_result_of_yojson tree path =
  list_of_yojson batch_detect_sentiment_item_result_of_yojson tree path

let batch_detect_sentiment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list = value_for_key list_of_detect_sentiment_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_sentiment_response)

let batch_detect_sentiment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : batch_detect_sentiment_request)

let part_of_speech_tag_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADJ" -> ADJ
    | `String "ADP" -> ADP
    | `String "ADV" -> ADV
    | `String "AUX" -> AUX
    | `String "CONJ" -> CONJ
    | `String "CCONJ" -> CCONJ
    | `String "DET" -> DET
    | `String "INTJ" -> INTJ
    | `String "NOUN" -> NOUN
    | `String "NUM" -> NUM
    | `String "O" -> O
    | `String "PART" -> PART
    | `String "PRON" -> PRON
    | `String "PROPN" -> PROPN
    | `String "PUNCT" -> PUNCT
    | `String "SCONJ" -> SCONJ
    | `String "SYM" -> SYM
    | `String "VERB" -> VERB
    | `String value -> raise (deserialize_unknown_enum_value_error path "PartOfSpeechTagType" value)
    | _ -> raise (deserialize_wrong_type_error path "PartOfSpeechTagType")
     : part_of_speech_tag_type)
    : part_of_speech_tag_type)

let part_of_speech_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag = option_of_yojson (value_for_key part_of_speech_tag_type_of_yojson "Tag") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : part_of_speech_tag)

let syntax_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_id = option_of_yojson (value_for_key integer_of_yojson "TokenId") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
     part_of_speech =
       option_of_yojson (value_for_key part_of_speech_tag_of_yojson "PartOfSpeech") _list path;
   }
    : syntax_token)

let list_of_syntax_tokens_of_yojson tree path = list_of_yojson syntax_token_of_yojson tree path

let batch_detect_syntax_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     syntax_tokens =
       option_of_yojson (value_for_key list_of_syntax_tokens_of_yojson "SyntaxTokens") _list path;
   }
    : batch_detect_syntax_item_result)

let list_of_detect_syntax_result_of_yojson tree path =
  list_of_yojson batch_detect_syntax_item_result_of_yojson tree path

let batch_detect_syntax_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list = value_for_key list_of_detect_syntax_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_syntax_response)

let syntax_language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en" -> EN
    | `String "es" -> ES
    | `String "fr" -> FR
    | `String "de" -> DE
    | `String "it" -> IT
    | `String "pt" -> PT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyntaxLanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "SyntaxLanguageCode")
     : syntax_language_code)
    : syntax_language_code)

let batch_detect_syntax_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path;
     language_code = value_for_key syntax_language_code_of_yojson "LanguageCode" _list path;
   }
    : batch_detect_syntax_request)

let mention_sentiment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sentiment = option_of_yojson (value_for_key sentiment_type_of_yojson "Sentiment") _list path;
     sentiment_score =
       option_of_yojson (value_for_key sentiment_score_of_yojson "SentimentScore") _list path;
   }
    : mention_sentiment)

let targeted_sentiment_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PERSON" -> PERSON
    | `String "LOCATION" -> LOCATION
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "FACILITY" -> FACILITY
    | `String "BRAND" -> BRAND
    | `String "COMMERCIAL_ITEM" -> COMMERCIAL_ITEM
    | `String "MOVIE" -> MOVIE
    | `String "MUSIC" -> MUSIC
    | `String "BOOK" -> BOOK
    | `String "SOFTWARE" -> SOFTWARE
    | `String "GAME" -> GAME
    | `String "PERSONAL_TITLE" -> PERSONAL_TITLE
    | `String "EVENT" -> EVENT
    | `String "DATE" -> DATE
    | `String "QUANTITY" -> QUANTITY
    | `String "ATTRIBUTE" -> ATTRIBUTE
    | `String "OTHER" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TargetedSentimentEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetedSentimentEntityType")
     : targeted_sentiment_entity_type)
    : targeted_sentiment_entity_type)

let targeted_sentiment_mention_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     group_score = option_of_yojson (value_for_key float__of_yojson "GroupScore") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     type_ =
       option_of_yojson (value_for_key targeted_sentiment_entity_type_of_yojson "Type") _list path;
     mention_sentiment =
       option_of_yojson (value_for_key mention_sentiment_of_yojson "MentionSentiment") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
   }
    : targeted_sentiment_mention)

let list_of_mentions_of_yojson tree path =
  list_of_yojson targeted_sentiment_mention_of_yojson tree path

let list_of_descriptive_mention_indices_of_yojson tree path =
  list_of_yojson integer_of_yojson tree path

let targeted_sentiment_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     descriptive_mention_index =
       option_of_yojson
         (value_for_key list_of_descriptive_mention_indices_of_yojson "DescriptiveMentionIndex")
         _list path;
     mentions = option_of_yojson (value_for_key list_of_mentions_of_yojson "Mentions") _list path;
   }
    : targeted_sentiment_entity)

let list_of_targeted_sentiment_entities_of_yojson tree path =
  list_of_yojson targeted_sentiment_entity_of_yojson tree path

let batch_detect_targeted_sentiment_item_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index = option_of_yojson (value_for_key integer_of_yojson "Index") _list path;
     entities =
       option_of_yojson
         (value_for_key list_of_targeted_sentiment_entities_of_yojson "Entities")
         _list path;
   }
    : batch_detect_targeted_sentiment_item_result)

let list_of_detect_targeted_sentiment_result_of_yojson tree path =
  list_of_yojson batch_detect_targeted_sentiment_item_result_of_yojson tree path

let batch_detect_targeted_sentiment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list =
       value_for_key list_of_detect_targeted_sentiment_result_of_yojson "ResultList" _list path;
     error_list = value_for_key batch_item_error_list_of_yojson "ErrorList" _list path;
   }
    : batch_detect_targeted_sentiment_response)

let batch_detect_targeted_sentiment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_list = value_for_key customer_input_string_list_of_yojson "TextList" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : batch_detect_targeted_sentiment_request)

let relationship_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CHILD" -> CHILD
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationshipType" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationshipType")
     : relationship_type)
    : relationship_type)

let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let relationships_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = option_of_yojson (value_for_key string_list_of_yojson "Ids") _list path;
     type_ = option_of_yojson (value_for_key relationship_type_of_yojson "Type") _list path;
   }
    : relationships_list_item)

let list_of_relationships_of_yojson tree path =
  list_of_yojson relationships_list_item_of_yojson tree path

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
     height = option_of_yojson (value_for_key float__of_yojson "Height") _list path;
     left = option_of_yojson (value_for_key float__of_yojson "Left") _list path;
     top = option_of_yojson (value_for_key float__of_yojson "Top") _list path;
     width = option_of_yojson (value_for_key float__of_yojson "Width") _list path;
   }
    : bounding_box)

let geometry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bounding_box = option_of_yojson (value_for_key bounding_box_of_yojson "BoundingBox") _list path;
     polygon = option_of_yojson (value_for_key polygon_of_yojson "Polygon") _list path;
   }
    : geometry)

let block_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINE" -> LINE
    | `String "WORD" -> WORD
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockType")
     : block_type)
    : block_type)

let block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key string__of_yojson "Id") _list path;
     block_type = option_of_yojson (value_for_key block_type_of_yojson "BlockType") _list path;
     text = option_of_yojson (value_for_key string__of_yojson "Text") _list path;
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
     geometry = option_of_yojson (value_for_key geometry_of_yojson "Geometry") _list path;
     relationships =
       option_of_yojson (value_for_key list_of_relationships_of_yojson "Relationships") _list path;
   }
    : block)

let double_of_yojson = double_of_yojson

let classifier_evaluation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accuracy = option_of_yojson (value_for_key double_of_yojson "Accuracy") _list path;
     precision = option_of_yojson (value_for_key double_of_yojson "Precision") _list path;
     recall = option_of_yojson (value_for_key double_of_yojson "Recall") _list path;
     f1_score = option_of_yojson (value_for_key double_of_yojson "F1Score") _list path;
     micro_precision = option_of_yojson (value_for_key double_of_yojson "MicroPrecision") _list path;
     micro_recall = option_of_yojson (value_for_key double_of_yojson "MicroRecall") _list path;
     micro_f1_score = option_of_yojson (value_for_key double_of_yojson "MicroF1Score") _list path;
     hamming_loss = option_of_yojson (value_for_key double_of_yojson "HammingLoss") _list path;
   }
    : classifier_evaluation_metrics)

let classifier_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_labels =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfLabels") _list path;
     number_of_trained_documents =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTrainedDocuments") _list path;
     number_of_test_documents =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTestDocuments") _list path;
     evaluation_metrics =
       option_of_yojson
         (value_for_key classifier_evaluation_metrics_of_yojson "EvaluationMetrics")
         _list path;
   }
    : classifier_metadata)

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_unavailable_exception)

let page_based_warning_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL" ->
        INFERENCING_PLAINTEXT_WITH_NATIVE_TRAINED_MODEL
    | `String "INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL" ->
        INFERENCING_NATIVE_DOCUMENT_WITH_PLAINTEXT_TRAINED_MODEL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PageBasedWarningCode" value)
    | _ -> raise (deserialize_wrong_type_error path "PageBasedWarningCode")
     : page_based_warning_code)
    : page_based_warning_code)

let warnings_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
     warn_code =
       option_of_yojson (value_for_key page_based_warning_code_of_yojson "WarnCode") _list path;
     warn_message = option_of_yojson (value_for_key string__of_yojson "WarnMessage") _list path;
   }
    : warnings_list_item)

let list_of_warnings_of_yojson tree path = list_of_yojson warnings_list_item_of_yojson tree path

let page_based_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXTRACT_BAD_PAGE" -> TEXTRACT_BAD_PAGE
    | `String "TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED" -> TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED
    | `String "PAGE_CHARACTERS_EXCEEDED" -> PAGE_CHARACTERS_EXCEEDED
    | `String "PAGE_SIZE_EXCEEDED" -> PAGE_SIZE_EXCEEDED
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "PageBasedErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "PageBasedErrorCode")
     : page_based_error_code)
    : page_based_error_code)

let errors_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
     error_code =
       option_of_yojson (value_for_key page_based_error_code_of_yojson "ErrorCode") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
   }
    : errors_list_item)

let list_of_errors_of_yojson tree path = list_of_yojson errors_list_item_of_yojson tree path

let document_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NATIVE_PDF" -> NATIVE_PDF
    | `String "SCANNED_PDF" -> SCANNED_PDF
    | `String "MS_WORD" -> MS_WORD
    | `String "IMAGE" -> IMAGE
    | `String "PLAIN_TEXT" -> PLAIN_TEXT
    | `String "TEXTRACT_DETECT_DOCUMENT_TEXT_JSON" -> TEXTRACT_DETECT_DOCUMENT_TEXT_JSON
    | `String "TEXTRACT_ANALYZE_DOCUMENT_JSON" -> TEXTRACT_ANALYZE_DOCUMENT_JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentType")
     : document_type)
    : document_type)

let document_type_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
     type_ = option_of_yojson (value_for_key document_type_of_yojson "Type") _list path;
   }
    : document_type_list_item)

let list_of_document_type_of_yojson tree path =
  list_of_yojson document_type_list_item_of_yojson tree path

let extracted_characters_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
   }
    : extracted_characters_list_item)

let list_of_extracted_characters_of_yojson tree path =
  list_of_yojson extracted_characters_list_item_of_yojson tree path

let document_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pages = option_of_yojson (value_for_key integer_of_yojson "Pages") _list path;
     extracted_characters =
       option_of_yojson
         (value_for_key list_of_extracted_characters_of_yojson "ExtractedCharacters")
         _list path;
   }
    : document_metadata)

let document_label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
   }
    : document_label)

let list_of_labels_of_yojson tree path = list_of_yojson document_label_of_yojson tree path

let document_class_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     page = option_of_yojson (value_for_key integer_of_yojson "Page") _list path;
   }
    : document_class)

let list_of_classes_of_yojson tree path = list_of_yojson document_class_of_yojson tree path

let classify_document_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     classes = option_of_yojson (value_for_key list_of_classes_of_yojson "Classes") _list path;
     labels = option_of_yojson (value_for_key list_of_labels_of_yojson "Labels") _list path;
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     document_type =
       option_of_yojson (value_for_key list_of_document_type_of_yojson "DocumentType") _list path;
     errors = option_of_yojson (value_for_key list_of_errors_of_yojson "Errors") _list path;
     warnings = option_of_yojson (value_for_key list_of_warnings_of_yojson "Warnings") _list path;
   }
    : classify_document_response)

let document_read_feature_types_of_yojson (tree : t) path =
  ((match tree with
    | `String "TABLES" -> TABLES
    | `String "FORMS" -> FORMS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentReadFeatureTypes" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReadFeatureTypes")
     : document_read_feature_types)
    : document_read_feature_types)

let list_of_document_read_feature_types_of_yojson tree path =
  list_of_yojson document_read_feature_types_of_yojson tree path

let document_read_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE_DEFAULT" -> SERVICE_DEFAULT
    | `String "FORCE_DOCUMENT_READ_ACTION" -> FORCE_DOCUMENT_READ_ACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentReadMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReadMode")
     : document_read_mode)
    : document_read_mode)

let document_read_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXTRACT_DETECT_DOCUMENT_TEXT" -> TEXTRACT_DETECT_DOCUMENT_TEXT
    | `String "TEXTRACT_ANALYZE_DOCUMENT" -> TEXTRACT_ANALYZE_DOCUMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentReadAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReadAction")
     : document_read_action)
    : document_read_action)

let document_reader_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_read_action =
       value_for_key document_read_action_of_yojson "DocumentReadAction" _list path;
     document_read_mode =
       option_of_yojson (value_for_key document_read_mode_of_yojson "DocumentReadMode") _list path;
     feature_types =
       option_of_yojson
         (value_for_key list_of_document_read_feature_types_of_yojson "FeatureTypes")
         _list path;
   }
    : document_reader_config)

let semi_structured_document_blob_of_yojson = blob_of_yojson
let document_classifier_endpoint_arn_of_yojson = string_of_yojson

let classify_document_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = option_of_yojson (value_for_key customer_input_string_of_yojson "Text") _list path;
     endpoint_arn =
       value_for_key document_classifier_endpoint_arn_of_yojson "EndpointArn" _list path;
     bytes =
       option_of_yojson (value_for_key semi_structured_document_blob_of_yojson "Bytes") _list path;
     document_reader_config =
       option_of_yojson
         (value_for_key document_reader_config_of_yojson "DocumentReaderConfig")
         _list path;
   }
    : classify_document_request)

let client_request_token_string_of_yojson = string_of_yojson
let comprehend_arn_of_yojson = string_of_yojson
let comprehend_arn_name_of_yojson = string_of_yojson
let comprehend_dataset_arn_of_yojson = string_of_yojson
let comprehend_endpoint_arn_of_yojson = string_of_yojson
let comprehend_endpoint_name_of_yojson = string_of_yojson
let comprehend_flywheel_arn_of_yojson = string_of_yojson
let comprehend_model_arn_of_yojson = string_of_yojson

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_requests_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_not_found_exception)

let kms_key_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : kms_key_validation_exception)

let flywheel_iteration_id_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let model_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOCUMENT_CLASSIFIER" -> DOCUMENT_CLASSIFIER
    | `String "ENTITY_RECOGNIZER" -> ENTITY_RECOGNIZER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelType" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelType")
     : model_type)
    : model_type)

let flywheel_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlywheelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FlywheelStatus")
     : flywheel_status)
    : flywheel_status)

let subnet_id_of_yojson = string_of_yojson
let subnets_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids = value_for_key security_group_ids_of_yojson "SecurityGroupIds" _list path;
     subnets = value_for_key subnets_of_yojson "Subnets" _list path;
   }
    : vpc_config)

let kms_key_id_of_yojson = string_of_yojson

let data_security_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     data_lake_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "DataLakeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : data_security_config)

let entity_type_name_of_yojson = string_of_yojson

let entity_types_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = value_for_key entity_type_name_of_yojson "Type" _list path } : entity_types_list_item)

let entity_types_list_of_yojson tree path =
  list_of_yojson entity_types_list_item_of_yojson tree path

let entity_recognition_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entity_types = value_for_key entity_types_list_of_yojson "EntityTypes" _list path }
    : entity_recognition_config)

let label_list_item_of_yojson = string_of_yojson
let labels_list_of_yojson tree path = list_of_yojson label_list_item_of_yojson tree path

let document_classifier_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_CLASS" -> MULTI_CLASS
    | `String "MULTI_LABEL" -> MULTI_LABEL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentClassifierMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentClassifierMode")
     : document_classifier_mode)
    : document_classifier_mode)

let document_classification_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mode = value_for_key document_classifier_mode_of_yojson "Mode" _list path;
     labels = option_of_yojson (value_for_key labels_list_of_yojson "Labels") _list path;
   }
    : document_classification_config)

let task_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     document_classification_config =
       option_of_yojson
         (value_for_key document_classification_config_of_yojson "DocumentClassificationConfig")
         _list path;
     entity_recognition_config =
       option_of_yojson
         (value_for_key entity_recognition_config_of_yojson "EntityRecognitionConfig")
         _list path;
   }
    : task_config)

let iam_role_arn_of_yojson = string_of_yojson

let flywheel_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     active_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ActiveModelArn") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     task_config = option_of_yojson (value_for_key task_config_of_yojson "TaskConfig") _list path;
     data_lake_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "DataLakeS3Uri") _list path;
     data_security_config =
       option_of_yojson
         (value_for_key data_security_config_of_yojson "DataSecurityConfig")
         _list path;
     status = option_of_yojson (value_for_key flywheel_status_of_yojson "Status") _list path;
     model_type = option_of_yojson (value_for_key model_type_of_yojson "ModelType") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     latest_flywheel_iteration =
       option_of_yojson
         (value_for_key flywheel_iteration_id_of_yojson "LatestFlywheelIteration")
         _list path;
   }
    : flywheel_properties)

let update_flywheel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_properties =
       option_of_yojson
         (value_for_key flywheel_properties_of_yojson "FlywheelProperties")
         _list path;
   }
    : update_flywheel_response)

let update_data_security_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : update_data_security_config)

let update_flywheel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path;
     active_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ActiveModelArn") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     data_security_config =
       option_of_yojson
         (value_for_key update_data_security_config_of_yojson "DataSecurityConfig")
         _list path;
   }
    : update_flywheel_request)

let resource_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_limit_exceeded_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : resource_in_use_exception)

let update_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "DesiredModelArn") _list path;
   }
    : update_endpoint_response)

let inference_units_integer_of_yojson = int_of_yojson

let update_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn = value_for_key comprehend_endpoint_arn_of_yojson "EndpointArn" _list path;
     desired_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "DesiredModelArn") _list path;
     desired_inference_units =
       option_of_yojson
         (value_for_key inference_units_integer_of_yojson "DesiredInferenceUnits")
         _list path;
     desired_data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DesiredDataAccessRoleArn") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : update_endpoint_request)

let too_many_tag_keys_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_tag_keys_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : concurrent_modification_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key comprehend_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : too_many_tags_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key comprehend_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let stop_training_entity_recognizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let entity_recognizer_arn_of_yojson = string_of_yojson

let stop_training_entity_recognizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_arn =
       value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn" _list path;
   }
    : stop_training_entity_recognizer_request)

let stop_training_document_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let document_classifier_arn_of_yojson = string_of_yojson

let stop_training_document_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_arn =
       value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn" _list path;
   }
    : stop_training_document_classifier_request)

let job_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : job_not_found_exception)

let job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "STOPPED" -> STOPPED
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "JobStatus")
     : job_status)
    : job_status)

let job_id_of_yojson = string_of_yojson

let stop_targeted_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_targeted_sentiment_detection_job_response)

let stop_targeted_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_targeted_sentiment_detection_job_request)

let stop_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_sentiment_detection_job_response)

let stop_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_sentiment_detection_job_request)

let stop_pii_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_pii_entities_detection_job_response)

let stop_pii_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_pii_entities_detection_job_request)

let stop_key_phrases_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_key_phrases_detection_job_response)

let stop_key_phrases_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_key_phrases_detection_job_request)

let stop_events_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_events_detection_job_response)

let stop_events_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_events_detection_job_request)

let stop_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_entities_detection_job_response)

let stop_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_entities_detection_job_request)

let stop_dominant_language_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : stop_dominant_language_detection_job_response)

let stop_dominant_language_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : stop_dominant_language_detection_job_request)

let start_topics_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_topics_detection_job_response)

let number_of_topics_integer_of_yojson = int_of_yojson
let job_name_of_yojson = string_of_yojson

let output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
   }
    : output_data_config)

let input_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_DOC_PER_FILE" -> ONE_DOC_PER_FILE
    | `String "ONE_DOC_PER_LINE" -> ONE_DOC_PER_LINE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "InputFormat")
     : input_format)
    : input_format)

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
     document_reader_config =
       option_of_yojson
         (value_for_key document_reader_config_of_yojson "DocumentReaderConfig")
         _list path;
   }
    : input_data_config)

let start_topics_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     number_of_topics =
       option_of_yojson
         (value_for_key number_of_topics_integer_of_yojson "NumberOfTopics")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_topics_detection_job_request)

let start_targeted_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_targeted_sentiment_detection_job_response)

let start_targeted_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_targeted_sentiment_detection_job_request)

let start_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_sentiment_detection_job_response)

let start_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_sentiment_detection_job_request)

let start_pii_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_pii_entities_detection_job_response)

let mask_character_of_yojson = string_of_yojson

let pii_entities_detection_mask_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "MASK" -> MASK
    | `String "REPLACE_WITH_PII_ENTITY_TYPE" -> REPLACE_WITH_PII_ENTITY_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PiiEntitiesDetectionMaskMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiEntitiesDetectionMaskMode")
     : pii_entities_detection_mask_mode)
    : pii_entities_detection_mask_mode)

let pii_entity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BANK_ACCOUNT_NUMBER" -> BANK_ACCOUNT_NUMBER
    | `String "BANK_ROUTING" -> BANK_ROUTING
    | `String "CREDIT_DEBIT_NUMBER" -> CREDIT_DEBIT_NUMBER
    | `String "CREDIT_DEBIT_CVV" -> CREDIT_DEBIT_CVV
    | `String "CREDIT_DEBIT_EXPIRY" -> CREDIT_DEBIT_EXPIRY
    | `String "PIN" -> PIN
    | `String "EMAIL" -> EMAIL
    | `String "ADDRESS" -> ADDRESS
    | `String "NAME" -> NAME
    | `String "PHONE" -> PHONE
    | `String "SSN" -> SSN
    | `String "DATE_TIME" -> DATE_TIME
    | `String "PASSPORT_NUMBER" -> PASSPORT_NUMBER
    | `String "DRIVER_ID" -> DRIVER_ID
    | `String "URL" -> URL
    | `String "AGE" -> AGE
    | `String "USERNAME" -> USERNAME
    | `String "PASSWORD" -> PASSWORD
    | `String "AWS_ACCESS_KEY" -> AWS_ACCESS_KEY
    | `String "AWS_SECRET_KEY" -> AWS_SECRET_KEY
    | `String "IP_ADDRESS" -> IP_ADDRESS
    | `String "MAC_ADDRESS" -> MAC_ADDRESS
    | `String "ALL" -> ALL
    | `String "LICENSE_PLATE" -> LICENSE_PLATE
    | `String "VEHICLE_IDENTIFICATION_NUMBER" -> VEHICLE_IDENTIFICATION_NUMBER
    | `String "UK_NATIONAL_INSURANCE_NUMBER" -> UK_NATIONAL_INSURANCE_NUMBER
    | `String "CA_SOCIAL_INSURANCE_NUMBER" -> CA_SOCIAL_INSURANCE_NUMBER
    | `String "US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER" -> US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER
    | `String "UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER" -> UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER
    | `String "IN_PERMANENT_ACCOUNT_NUMBER" -> IN_PERMANENT_ACCOUNT_NUMBER
    | `String "IN_NREGA" -> IN_NREGA
    | `String "INTERNATIONAL_BANK_ACCOUNT_NUMBER" -> INTERNATIONAL_BANK_ACCOUNT_NUMBER
    | `String "SWIFT_CODE" -> SWIFT_CODE
    | `String "UK_NATIONAL_HEALTH_SERVICE_NUMBER" -> UK_NATIONAL_HEALTH_SERVICE_NUMBER
    | `String "CA_HEALTH_NUMBER" -> CA_HEALTH_NUMBER
    | `String "IN_AADHAAR" -> IN_AADHAAR
    | `String "IN_VOTER_NUMBER" -> IN_VOTER_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PiiEntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiEntityType")
     : pii_entity_type)
    : pii_entity_type)

let list_of_pii_entity_types_of_yojson tree path =
  list_of_yojson pii_entity_type_of_yojson tree path

let redaction_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pii_entity_types =
       option_of_yojson
         (value_for_key list_of_pii_entity_types_of_yojson "PiiEntityTypes")
         _list path;
     mask_mode =
       option_of_yojson
         (value_for_key pii_entities_detection_mask_mode_of_yojson "MaskMode")
         _list path;
     mask_character =
       option_of_yojson (value_for_key mask_character_of_yojson "MaskCharacter") _list path;
   }
    : redaction_config)

let pii_entities_detection_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONLY_REDACTION" -> ONLY_REDACTION
    | `String "ONLY_OFFSETS" -> ONLY_OFFSETS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PiiEntitiesDetectionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "PiiEntitiesDetectionMode")
     : pii_entities_detection_mode)
    : pii_entities_detection_mode)

let start_pii_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     mode = value_for_key pii_entities_detection_mode_of_yojson "Mode" _list path;
     redaction_config =
       option_of_yojson (value_for_key redaction_config_of_yojson "RedactionConfig") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_pii_entities_detection_job_request)

let start_key_phrases_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_key_phrases_detection_job_response)

let start_key_phrases_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_key_phrases_detection_job_request)

let start_flywheel_iteration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     flywheel_iteration_id =
       option_of_yojson
         (value_for_key flywheel_iteration_id_of_yojson "FlywheelIterationId")
         _list path;
   }
    : start_flywheel_iteration_response)

let start_flywheel_iteration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
   }
    : start_flywheel_iteration_request)

let start_events_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_events_detection_job_response)

let event_type_string_of_yojson = string_of_yojson
let target_event_types_of_yojson tree path = list_of_yojson event_type_string_of_yojson tree path

let start_events_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     target_event_types = value_for_key target_event_types_of_yojson "TargetEventTypes" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_events_detection_job_request)

let start_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     entity_recognizer_arn =
       option_of_yojson
         (value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn")
         _list path;
   }
    : start_entities_detection_job_response)

let start_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     entity_recognizer_arn =
       option_of_yojson
         (value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn")
         _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : start_entities_detection_job_request)

let start_dominant_language_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
   }
    : start_dominant_language_detection_job_response)

let start_dominant_language_detection_job_request_of_yojson tree path =
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
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : start_dominant_language_detection_job_request)

let start_document_classification_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     document_classifier_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn")
         _list path;
   }
    : start_document_classification_job_response)

let start_document_classification_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     document_classifier_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn")
         _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : start_document_classification_job_request)

let policy_revision_id_of_yojson = string_of_yojson

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
   }
    : put_resource_policy_response)

let policy_of_yojson = string_of_yojson

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key comprehend_model_arn_of_yojson "ResourceArn" _list path;
     resource_policy = value_for_key policy_of_yojson "ResourcePolicy" _list path;
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
   }
    : put_resource_policy_request)

let invalid_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : invalid_filter_exception)

let topics_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     number_of_topics =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTopics") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : topics_detection_job_properties)

let topics_detection_job_properties_list_of_yojson tree path =
  list_of_yojson topics_detection_job_properties_of_yojson tree path

let list_topics_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topics_detection_job_properties_list =
       option_of_yojson
         (value_for_key topics_detection_job_properties_list_of_yojson
            "TopicsDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_topics_detection_jobs_response)

let max_results_integer_of_yojson = int_of_yojson

let topics_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : topics_detection_job_filter)

let list_topics_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key topics_detection_job_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_topics_detection_jobs_request)

let targeted_sentiment_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : targeted_sentiment_detection_job_properties)

let targeted_sentiment_detection_job_properties_list_of_yojson tree path =
  list_of_yojson targeted_sentiment_detection_job_properties_of_yojson tree path

let list_targeted_sentiment_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targeted_sentiment_detection_job_properties_list =
       option_of_yojson
         (value_for_key targeted_sentiment_detection_job_properties_list_of_yojson
            "TargetedSentimentDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_targeted_sentiment_detection_jobs_response)

let targeted_sentiment_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : targeted_sentiment_detection_job_filter)

let list_targeted_sentiment_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key targeted_sentiment_detection_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_targeted_sentiment_detection_jobs_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key comprehend_arn_of_yojson "ResourceArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key comprehend_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let sentiment_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : sentiment_detection_job_properties)

let sentiment_detection_job_properties_list_of_yojson tree path =
  list_of_yojson sentiment_detection_job_properties_of_yojson tree path

let list_sentiment_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sentiment_detection_job_properties_list =
       option_of_yojson
         (value_for_key sentiment_detection_job_properties_list_of_yojson
            "SentimentDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_sentiment_detection_jobs_response)

let sentiment_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : sentiment_detection_job_filter)

let list_sentiment_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key sentiment_detection_job_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_sentiment_detection_jobs_request)

let pii_output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
   }
    : pii_output_data_config)

let pii_entities_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson
         (value_for_key pii_output_data_config_of_yojson "OutputDataConfig")
         _list path;
     redaction_config =
       option_of_yojson (value_for_key redaction_config_of_yojson "RedactionConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     mode = option_of_yojson (value_for_key pii_entities_detection_mode_of_yojson "Mode") _list path;
   }
    : pii_entities_detection_job_properties)

let pii_entities_detection_job_properties_list_of_yojson tree path =
  list_of_yojson pii_entities_detection_job_properties_of_yojson tree path

let list_pii_entities_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pii_entities_detection_job_properties_list =
       option_of_yojson
         (value_for_key pii_entities_detection_job_properties_list_of_yojson
            "PiiEntitiesDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_pii_entities_detection_jobs_response)

let pii_entities_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : pii_entities_detection_job_filter)

let list_pii_entities_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key pii_entities_detection_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_pii_entities_detection_jobs_request)

let key_phrases_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : key_phrases_detection_job_properties)

let key_phrases_detection_job_properties_list_of_yojson tree path =
  list_of_yojson key_phrases_detection_job_properties_of_yojson tree path

let list_key_phrases_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_phrases_detection_job_properties_list =
       option_of_yojson
         (value_for_key key_phrases_detection_job_properties_list_of_yojson
            "KeyPhrasesDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_key_phrases_detection_jobs_response)

let key_phrases_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : key_phrases_detection_job_filter)

let list_key_phrases_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key key_phrases_detection_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_key_phrases_detection_jobs_request)

let flywheel_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     active_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ActiveModelArn") _list path;
     data_lake_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "DataLakeS3Uri") _list path;
     status = option_of_yojson (value_for_key flywheel_status_of_yojson "Status") _list path;
     model_type = option_of_yojson (value_for_key model_type_of_yojson "ModelType") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     latest_flywheel_iteration =
       option_of_yojson
         (value_for_key flywheel_iteration_id_of_yojson "LatestFlywheelIteration")
         _list path;
   }
    : flywheel_summary)

let flywheel_summary_list_of_yojson tree path = list_of_yojson flywheel_summary_of_yojson tree path

let list_flywheels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_summary_list =
       option_of_yojson
         (value_for_key flywheel_summary_list_of_yojson "FlywheelSummaryList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_flywheels_response)

let flywheel_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key flywheel_status_of_yojson "Status") _list path;
     creation_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeAfter") _list path;
     creation_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeBefore") _list path;
   }
    : flywheel_filter)

let list_flywheels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key flywheel_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_flywheels_request)

let flywheel_model_evaluation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average_f1_score =
       option_of_yojson (value_for_key double_of_yojson "AverageF1Score") _list path;
     average_precision =
       option_of_yojson (value_for_key double_of_yojson "AveragePrecision") _list path;
     average_recall = option_of_yojson (value_for_key double_of_yojson "AverageRecall") _list path;
     average_accuracy =
       option_of_yojson (value_for_key double_of_yojson "AverageAccuracy") _list path;
   }
    : flywheel_model_evaluation_metrics)

let flywheel_iteration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAINING" -> TRAINING
    | `String "EVALUATING" -> EVALUATING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "STOPPED" -> STOPPED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlywheelIterationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FlywheelIterationStatus")
     : flywheel_iteration_status)
    : flywheel_iteration_status)

let flywheel_iteration_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     flywheel_iteration_id =
       option_of_yojson
         (value_for_key flywheel_iteration_id_of_yojson "FlywheelIterationId")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     status =
       option_of_yojson (value_for_key flywheel_iteration_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     evaluated_model_arn =
       option_of_yojson
         (value_for_key comprehend_model_arn_of_yojson "EvaluatedModelArn")
         _list path;
     evaluated_model_metrics =
       option_of_yojson
         (value_for_key flywheel_model_evaluation_metrics_of_yojson "EvaluatedModelMetrics")
         _list path;
     trained_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "TrainedModelArn") _list path;
     trained_model_metrics =
       option_of_yojson
         (value_for_key flywheel_model_evaluation_metrics_of_yojson "TrainedModelMetrics")
         _list path;
     evaluation_manifest_s3_prefix =
       option_of_yojson (value_for_key s3_uri_of_yojson "EvaluationManifestS3Prefix") _list path;
   }
    : flywheel_iteration_properties)

let flywheel_iteration_properties_list_of_yojson tree path =
  list_of_yojson flywheel_iteration_properties_of_yojson tree path

let list_flywheel_iteration_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_iteration_properties_list =
       option_of_yojson
         (value_for_key flywheel_iteration_properties_list_of_yojson
            "FlywheelIterationPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_flywheel_iteration_history_response)

let flywheel_iteration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeAfter") _list path;
     creation_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeBefore") _list path;
   }
    : flywheel_iteration_filter)

let list_flywheel_iteration_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path;
     filter =
       option_of_yojson (value_for_key flywheel_iteration_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_flywheel_iteration_history_request)

let events_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     target_event_types =
       option_of_yojson (value_for_key target_event_types_of_yojson "TargetEventTypes") _list path;
   }
    : events_detection_job_properties)

let events_detection_job_properties_list_of_yojson tree path =
  list_of_yojson events_detection_job_properties_of_yojson tree path

let list_events_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events_detection_job_properties_list =
       option_of_yojson
         (value_for_key events_detection_job_properties_list_of_yojson
            "EventsDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_events_detection_jobs_response)

let events_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : events_detection_job_filter)

let list_events_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key events_detection_job_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_events_detection_jobs_request)

let model_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "TRAINING" -> TRAINING
    | `String "DELETING" -> DELETING
    | `String "STOP_REQUESTED" -> STOP_REQUESTED
    | `String "STOPPED" -> STOPPED
    | `String "IN_ERROR" -> IN_ERROR
    | `String "TRAINED" -> TRAINED
    | `String "TRAINED_WITH_WARNING" -> TRAINED_WITH_WARNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelStatus")
     : model_status)
    : model_status)

let version_name_of_yojson = string_of_yojson

let entity_recognizer_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recognizer_name =
       option_of_yojson (value_for_key comprehend_arn_name_of_yojson "RecognizerName") _list path;
     number_of_versions =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfVersions") _list path;
     latest_version_created_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestVersionCreatedAt") _list path;
     latest_version_name =
       option_of_yojson (value_for_key version_name_of_yojson "LatestVersionName") _list path;
     latest_version_status =
       option_of_yojson (value_for_key model_status_of_yojson "LatestVersionStatus") _list path;
   }
    : entity_recognizer_summary)

let entity_recognizer_summaries_list_of_yojson tree path =
  list_of_yojson entity_recognizer_summary_of_yojson tree path

let list_entity_recognizer_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_summaries_list =
       option_of_yojson
         (value_for_key entity_recognizer_summaries_list_of_yojson "EntityRecognizerSummariesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_entity_recognizer_summaries_response)

let list_entity_recognizer_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_entity_recognizer_summaries_request)

let entity_recognizer_output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_stats_s3_prefix =
       option_of_yojson (value_for_key s3_uri_of_yojson "FlywheelStatsS3Prefix") _list path;
   }
    : entity_recognizer_output_data_config)

let entity_types_evaluation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     precision = option_of_yojson (value_for_key double_of_yojson "Precision") _list path;
     recall = option_of_yojson (value_for_key double_of_yojson "Recall") _list path;
     f1_score = option_of_yojson (value_for_key double_of_yojson "F1Score") _list path;
   }
    : entity_types_evaluation_metrics)

let entity_recognizer_metadata_entity_types_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key any_length_string_of_yojson "Type") _list path;
     evaluation_metrics =
       option_of_yojson
         (value_for_key entity_types_evaluation_metrics_of_yojson "EvaluationMetrics")
         _list path;
     number_of_train_mentions =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTrainMentions") _list path;
   }
    : entity_recognizer_metadata_entity_types_list_item)

let entity_recognizer_metadata_entity_types_list_of_yojson tree path =
  list_of_yojson entity_recognizer_metadata_entity_types_list_item_of_yojson tree path

let entity_recognizer_evaluation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     precision = option_of_yojson (value_for_key double_of_yojson "Precision") _list path;
     recall = option_of_yojson (value_for_key double_of_yojson "Recall") _list path;
     f1_score = option_of_yojson (value_for_key double_of_yojson "F1Score") _list path;
   }
    : entity_recognizer_evaluation_metrics)

let entity_recognizer_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_trained_documents =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTrainedDocuments") _list path;
     number_of_test_documents =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfTestDocuments") _list path;
     evaluation_metrics =
       option_of_yojson
         (value_for_key entity_recognizer_evaluation_metrics_of_yojson "EvaluationMetrics")
         _list path;
     entity_types =
       option_of_yojson
         (value_for_key entity_recognizer_metadata_entity_types_list_of_yojson "EntityTypes")
         _list path;
   }
    : entity_recognizer_metadata)

let entity_recognizer_augmented_manifests_list_of_yojson tree path =
  list_of_yojson augmented_manifests_list_item_of_yojson tree path

let entity_recognizer_entity_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path } : entity_recognizer_entity_list)

let entity_recognizer_annotations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     test_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "TestS3Uri") _list path;
   }
    : entity_recognizer_annotations)

let entity_recognizer_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     test_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "TestS3Uri") _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
   }
    : entity_recognizer_documents)

let entity_recognizer_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPREHEND_CSV" -> COMPREHEND_CSV
    | `String "AUGMENTED_MANIFEST" -> AUGMENTED_MANIFEST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EntityRecognizerDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityRecognizerDataFormat")
     : entity_recognizer_data_format)
    : entity_recognizer_data_format)

let entity_recognizer_input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_format =
       option_of_yojson
         (value_for_key entity_recognizer_data_format_of_yojson "DataFormat")
         _list path;
     entity_types = value_for_key entity_types_list_of_yojson "EntityTypes" _list path;
     documents =
       option_of_yojson (value_for_key entity_recognizer_documents_of_yojson "Documents") _list path;
     annotations =
       option_of_yojson
         (value_for_key entity_recognizer_annotations_of_yojson "Annotations")
         _list path;
     entity_list =
       option_of_yojson
         (value_for_key entity_recognizer_entity_list_of_yojson "EntityList")
         _list path;
     augmented_manifests =
       option_of_yojson
         (value_for_key entity_recognizer_augmented_manifests_list_of_yojson "AugmentedManifests")
         _list path;
   }
    : entity_recognizer_input_data_config)

let entity_recognizer_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_arn =
       option_of_yojson
         (value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     training_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingStartTime") _list path;
     training_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingEndTime") _list path;
     input_data_config =
       option_of_yojson
         (value_for_key entity_recognizer_input_data_config_of_yojson "InputDataConfig")
         _list path;
     recognizer_metadata =
       option_of_yojson
         (value_for_key entity_recognizer_metadata_of_yojson "RecognizerMetadata")
         _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     version_name = option_of_yojson (value_for_key version_name_of_yojson "VersionName") _list path;
     source_model_arn =
       option_of_yojson (value_for_key entity_recognizer_arn_of_yojson "SourceModelArn") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     output_data_config =
       option_of_yojson
         (value_for_key entity_recognizer_output_data_config_of_yojson "OutputDataConfig")
         _list path;
   }
    : entity_recognizer_properties)

let entity_recognizer_properties_list_of_yojson tree path =
  list_of_yojson entity_recognizer_properties_of_yojson tree path

let list_entity_recognizers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_properties_list =
       option_of_yojson
         (value_for_key entity_recognizer_properties_list_of_yojson "EntityRecognizerPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_entity_recognizers_response)

let entity_recognizer_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     recognizer_name =
       option_of_yojson (value_for_key comprehend_arn_name_of_yojson "RecognizerName") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : entity_recognizer_filter)

let list_entity_recognizers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key entity_recognizer_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_entity_recognizers_request)

let entities_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     entity_recognizer_arn =
       option_of_yojson
         (value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn")
         _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : entities_detection_job_properties)

let entities_detection_job_properties_list_of_yojson tree path =
  list_of_yojson entities_detection_job_properties_of_yojson tree path

let list_entities_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities_detection_job_properties_list =
       option_of_yojson
         (value_for_key entities_detection_job_properties_list_of_yojson
            "EntitiesDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_entities_detection_jobs_response)

let entities_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : entities_detection_job_filter)

let list_entities_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key entities_detection_job_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_entities_detection_jobs_request)

let endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String "IN_SERVICE" -> IN_SERVICE
    | `String "UPDATING" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "EndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointStatus")
     : endpoint_status)
    : endpoint_status)

let endpoint_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn =
       option_of_yojson (value_for_key comprehend_endpoint_arn_of_yojson "EndpointArn") _list path;
     status = option_of_yojson (value_for_key endpoint_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ModelArn") _list path;
     desired_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "DesiredModelArn") _list path;
     desired_inference_units =
       option_of_yojson
         (value_for_key inference_units_integer_of_yojson "DesiredInferenceUnits")
         _list path;
     current_inference_units =
       option_of_yojson
         (value_for_key inference_units_integer_of_yojson "CurrentInferenceUnits")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     desired_data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DesiredDataAccessRoleArn") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : endpoint_properties)

let endpoint_properties_list_of_yojson tree path =
  list_of_yojson endpoint_properties_of_yojson tree path

let list_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_properties_list =
       option_of_yojson
         (value_for_key endpoint_properties_list_of_yojson "EndpointPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_endpoints_response)

let endpoint_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ModelArn") _list path;
     status = option_of_yojson (value_for_key endpoint_status_of_yojson "Status") _list path;
     creation_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeBefore") _list path;
     creation_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeAfter") _list path;
   }
    : endpoint_filter)

let list_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key endpoint_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_endpoints_request)

let dominant_language_detection_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
   }
    : dominant_language_detection_job_properties)

let dominant_language_detection_job_properties_list_of_yojson tree path =
  list_of_yojson dominant_language_detection_job_properties_of_yojson tree path

let list_dominant_language_detection_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dominant_language_detection_job_properties_list =
       option_of_yojson
         (value_for_key dominant_language_detection_job_properties_list_of_yojson
            "DominantLanguageDetectionJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_dominant_language_detection_jobs_response)

let dominant_language_detection_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : dominant_language_detection_job_filter)

let list_dominant_language_detection_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key dominant_language_detection_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_dominant_language_detection_jobs_request)

let document_classifier_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_name =
       option_of_yojson
         (value_for_key comprehend_arn_name_of_yojson "DocumentClassifierName")
         _list path;
     number_of_versions =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfVersions") _list path;
     latest_version_created_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LatestVersionCreatedAt") _list path;
     latest_version_name =
       option_of_yojson (value_for_key version_name_of_yojson "LatestVersionName") _list path;
     latest_version_status =
       option_of_yojson (value_for_key model_status_of_yojson "LatestVersionStatus") _list path;
   }
    : document_classifier_summary)

let document_classifier_summaries_list_of_yojson tree path =
  list_of_yojson document_classifier_summary_of_yojson tree path

let list_document_classifier_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_summaries_list =
       option_of_yojson
         (value_for_key document_classifier_summaries_list_of_yojson
            "DocumentClassifierSummariesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_document_classifier_summaries_response)

let list_document_classifier_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_document_classifier_summaries_request)

let document_classifier_output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "S3Uri") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     flywheel_stats_s3_prefix =
       option_of_yojson (value_for_key s3_uri_of_yojson "FlywheelStatsS3Prefix") _list path;
   }
    : document_classifier_output_data_config)

let document_classifier_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     test_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "TestS3Uri") _list path;
   }
    : document_classifier_documents)

let document_classifier_document_type_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAIN_TEXT_DOCUMENT" -> PLAIN_TEXT_DOCUMENT
    | `String "SEMI_STRUCTURED_DOCUMENT" -> SEMI_STRUCTURED_DOCUMENT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DocumentClassifierDocumentTypeFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentClassifierDocumentTypeFormat")
     : document_classifier_document_type_format)
    : document_classifier_document_type_format)

let document_classifier_augmented_manifests_list_of_yojson tree path =
  list_of_yojson augmented_manifests_list_item_of_yojson tree path

let label_delimiter_of_yojson = string_of_yojson

let document_classifier_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPREHEND_CSV" -> COMPREHEND_CSV
    | `String "AUGMENTED_MANIFEST" -> AUGMENTED_MANIFEST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentClassifierDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentClassifierDataFormat")
     : document_classifier_data_format)
    : document_classifier_data_format)

let document_classifier_input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_format =
       option_of_yojson
         (value_for_key document_classifier_data_format_of_yojson "DataFormat")
         _list path;
     s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "S3Uri") _list path;
     test_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "TestS3Uri") _list path;
     label_delimiter =
       option_of_yojson (value_for_key label_delimiter_of_yojson "LabelDelimiter") _list path;
     augmented_manifests =
       option_of_yojson
         (value_for_key document_classifier_augmented_manifests_list_of_yojson "AugmentedManifests")
         _list path;
     document_type =
       option_of_yojson
         (value_for_key document_classifier_document_type_format_of_yojson "DocumentType")
         _list path;
     documents =
       option_of_yojson
         (value_for_key document_classifier_documents_of_yojson "Documents")
         _list path;
     document_reader_config =
       option_of_yojson
         (value_for_key document_reader_config_of_yojson "DocumentReaderConfig")
         _list path;
   }
    : document_classifier_input_data_config)

let document_classifier_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn")
         _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     training_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingStartTime") _list path;
     training_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingEndTime") _list path;
     input_data_config =
       option_of_yojson
         (value_for_key document_classifier_input_data_config_of_yojson "InputDataConfig")
         _list path;
     output_data_config =
       option_of_yojson
         (value_for_key document_classifier_output_data_config_of_yojson "OutputDataConfig")
         _list path;
     classifier_metadata =
       option_of_yojson
         (value_for_key classifier_metadata_of_yojson "ClassifierMetadata")
         _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     mode = option_of_yojson (value_for_key document_classifier_mode_of_yojson "Mode") _list path;
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     version_name = option_of_yojson (value_for_key version_name_of_yojson "VersionName") _list path;
     source_model_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "SourceModelArn")
         _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : document_classifier_properties)

let document_classifier_properties_list_of_yojson tree path =
  list_of_yojson document_classifier_properties_of_yojson tree path

let list_document_classifiers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_properties_list =
       option_of_yojson
         (value_for_key document_classifier_properties_list_of_yojson
            "DocumentClassifierPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_document_classifiers_response)

let document_classifier_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     document_classifier_name =
       option_of_yojson
         (value_for_key comprehend_arn_name_of_yojson "DocumentClassifierName")
         _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : document_classifier_filter)

let list_document_classifiers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key document_classifier_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_document_classifiers_request)

let document_classification_job_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_arn = option_of_yojson (value_for_key comprehend_arn_of_yojson "JobArn") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     submit_time = option_of_yojson (value_for_key timestamp_of_yojson "SubmitTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     document_classifier_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn")
         _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : document_classification_job_properties)

let document_classification_job_properties_list_of_yojson tree path =
  list_of_yojson document_classification_job_properties_of_yojson tree path

let list_document_classification_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classification_job_properties_list =
       option_of_yojson
         (value_for_key document_classification_job_properties_list_of_yojson
            "DocumentClassificationJobPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_document_classification_jobs_response)

let document_classification_job_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_status = option_of_yojson (value_for_key job_status_of_yojson "JobStatus") _list path;
     submit_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeBefore") _list path;
     submit_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "SubmitTimeAfter") _list path;
   }
    : document_classification_job_filter)

let list_document_classification_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson
         (value_for_key document_classification_job_filter_of_yojson "Filter")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_document_classification_jobs_request)

let number_of_documents_of_yojson = long_of_yojson

let dataset_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetStatus")
     : dataset_status)
    : dataset_status)

let description_of_yojson = string_of_yojson

let dataset_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAIN" -> TRAIN
    | `String "TEST" -> TEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetType")
     : dataset_type)
    : dataset_type)

let dataset_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn =
       option_of_yojson (value_for_key comprehend_dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name =
       option_of_yojson (value_for_key comprehend_arn_name_of_yojson "DatasetName") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     dataset_s3_uri = option_of_yojson (value_for_key s3_uri_of_yojson "DatasetS3Uri") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key any_length_string_of_yojson "Message") _list path;
     number_of_documents =
       option_of_yojson (value_for_key number_of_documents_of_yojson "NumberOfDocuments") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
   }
    : dataset_properties)

let dataset_properties_list_of_yojson tree path =
  list_of_yojson dataset_properties_of_yojson tree path

let list_datasets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_properties_list =
       option_of_yojson
         (value_for_key dataset_properties_list_of_yojson "DatasetPropertiesList")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_datasets_response)

let dataset_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     creation_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeAfter") _list path;
     creation_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimeBefore") _list path;
   }
    : dataset_filter)

let list_datasets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     filter = option_of_yojson (value_for_key dataset_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
   }
    : list_datasets_request)

let import_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ModelArn") _list path;
   }
    : import_model_response)

let import_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_model_arn = value_for_key comprehend_model_arn_of_yojson "SourceModelArn" _list path;
     model_name =
       option_of_yojson (value_for_key comprehend_arn_name_of_yojson "ModelName") _list path;
     version_name = option_of_yojson (value_for_key version_name_of_yojson "VersionName") _list path;
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : import_model_request)

let toxic_content_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GRAPHIC" -> GRAPHIC
    | `String "HARASSMENT_OR_ABUSE" -> HARASSMENT_OR_ABUSE
    | `String "HATE_SPEECH" -> HATE_SPEECH
    | `String "INSULT" -> INSULT
    | `String "PROFANITY" -> PROFANITY
    | `String "SEXUAL" -> SEXUAL
    | `String "VIOLENCE_OR_THREAT" -> VIOLENCE_OR_THREAT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ToxicContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ToxicContentType")
     : toxic_content_type)
    : toxic_content_type)

let toxic_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key toxic_content_type_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : toxic_content)

let list_of_toxic_content_of_yojson tree path = list_of_yojson toxic_content_of_yojson tree path

let toxic_labels_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     labels = option_of_yojson (value_for_key list_of_toxic_content_of_yojson "Labels") _list path;
     toxicity = option_of_yojson (value_for_key float__of_yojson "Toxicity") _list path;
   }
    : toxic_labels)

let list_of_toxic_labels_of_yojson tree path = list_of_yojson toxic_labels_of_yojson tree path

let detect_toxic_content_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_list =
       option_of_yojson (value_for_key list_of_toxic_labels_of_yojson "ResultList") _list path;
   }
    : detect_toxic_content_response)

let text_segment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key customer_input_string_of_yojson "Text" _list path } : text_segment)

let list_of_text_segments_of_yojson tree path = list_of_yojson text_segment_of_yojson tree path

let detect_toxic_content_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_segments = value_for_key list_of_text_segments_of_yojson "TextSegments" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_toxic_content_request)

let detect_targeted_sentiment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities =
       option_of_yojson
         (value_for_key list_of_targeted_sentiment_entities_of_yojson "Entities")
         _list path;
   }
    : detect_targeted_sentiment_response)

let detect_targeted_sentiment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key customer_input_string_of_yojson "Text" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_targeted_sentiment_request)

let detect_syntax_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     syntax_tokens =
       option_of_yojson (value_for_key list_of_syntax_tokens_of_yojson "SyntaxTokens") _list path;
   }
    : detect_syntax_response)

let detect_syntax_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key customer_input_string_of_yojson "Text" _list path;
     language_code = value_for_key syntax_language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_syntax_request)

let detect_sentiment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sentiment = option_of_yojson (value_for_key sentiment_type_of_yojson "Sentiment") _list path;
     sentiment_score =
       option_of_yojson (value_for_key sentiment_score_of_yojson "SentimentScore") _list path;
   }
    : detect_sentiment_response)

let detect_sentiment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key customer_input_string_of_yojson "Text" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_sentiment_request)

let pii_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
     type_ = option_of_yojson (value_for_key pii_entity_type_of_yojson "Type") _list path;
     begin_offset = option_of_yojson (value_for_key integer_of_yojson "BeginOffset") _list path;
     end_offset = option_of_yojson (value_for_key integer_of_yojson "EndOffset") _list path;
   }
    : pii_entity)

let list_of_pii_entities_of_yojson tree path = list_of_yojson pii_entity_of_yojson tree path

let detect_pii_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities =
       option_of_yojson (value_for_key list_of_pii_entities_of_yojson "Entities") _list path;
   }
    : detect_pii_entities_response)

let detect_pii_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key string__of_yojson "Text" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_pii_entities_request)

let detect_key_phrases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_phrases =
       option_of_yojson (value_for_key list_of_key_phrases_of_yojson "KeyPhrases") _list path;
   }
    : detect_key_phrases_response)

let detect_key_phrases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key customer_input_string_of_yojson "Text" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : detect_key_phrases_request)

let list_of_blocks_of_yojson tree path = list_of_yojson block_of_yojson tree path

let detect_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key list_of_entities_of_yojson "Entities") _list path;
     document_metadata =
       option_of_yojson (value_for_key document_metadata_of_yojson "DocumentMetadata") _list path;
     document_type =
       option_of_yojson (value_for_key list_of_document_type_of_yojson "DocumentType") _list path;
     blocks = option_of_yojson (value_for_key list_of_blocks_of_yojson "Blocks") _list path;
     errors = option_of_yojson (value_for_key list_of_errors_of_yojson "Errors") _list path;
   }
    : detect_entities_response)

let entity_recognizer_endpoint_arn_of_yojson = string_of_yojson

let detect_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = option_of_yojson (value_for_key customer_input_string_of_yojson "Text") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     endpoint_arn =
       option_of_yojson
         (value_for_key entity_recognizer_endpoint_arn_of_yojson "EndpointArn")
         _list path;
     bytes =
       option_of_yojson (value_for_key semi_structured_document_blob_of_yojson "Bytes") _list path;
     document_reader_config =
       option_of_yojson
         (value_for_key document_reader_config_of_yojson "DocumentReaderConfig")
         _list path;
   }
    : detect_entities_request)

let detect_dominant_language_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     languages =
       option_of_yojson (value_for_key list_of_dominant_languages_of_yojson "Languages") _list path;
   }
    : detect_dominant_language_response)

let detect_dominant_language_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ text = value_for_key customer_input_string_of_yojson "Text" _list path }
    : detect_dominant_language_request)

let describe_topics_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topics_detection_job_properties =
       option_of_yojson
         (value_for_key topics_detection_job_properties_of_yojson "TopicsDetectionJobProperties")
         _list path;
   }
    : describe_topics_detection_job_response)

let describe_topics_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_topics_detection_job_request)

let describe_targeted_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targeted_sentiment_detection_job_properties =
       option_of_yojson
         (value_for_key targeted_sentiment_detection_job_properties_of_yojson
            "TargetedSentimentDetectionJobProperties")
         _list path;
   }
    : describe_targeted_sentiment_detection_job_response)

let describe_targeted_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_targeted_sentiment_detection_job_request)

let describe_sentiment_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sentiment_detection_job_properties =
       option_of_yojson
         (value_for_key sentiment_detection_job_properties_of_yojson
            "SentimentDetectionJobProperties")
         _list path;
   }
    : describe_sentiment_detection_job_response)

let describe_sentiment_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_sentiment_detection_job_request)

let describe_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_policy = option_of_yojson (value_for_key policy_of_yojson "ResourcePolicy") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
   }
    : describe_resource_policy_response)

let describe_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key comprehend_model_arn_of_yojson "ResourceArn" _list path }
    : describe_resource_policy_request)

let describe_pii_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pii_entities_detection_job_properties =
       option_of_yojson
         (value_for_key pii_entities_detection_job_properties_of_yojson
            "PiiEntitiesDetectionJobProperties")
         _list path;
   }
    : describe_pii_entities_detection_job_response)

let describe_pii_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_pii_entities_detection_job_request)

let describe_key_phrases_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_phrases_detection_job_properties =
       option_of_yojson
         (value_for_key key_phrases_detection_job_properties_of_yojson
            "KeyPhrasesDetectionJobProperties")
         _list path;
   }
    : describe_key_phrases_detection_job_response)

let describe_key_phrases_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_key_phrases_detection_job_request)

let describe_flywheel_iteration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_iteration_properties =
       option_of_yojson
         (value_for_key flywheel_iteration_properties_of_yojson "FlywheelIterationProperties")
         _list path;
   }
    : describe_flywheel_iteration_response)

let describe_flywheel_iteration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path;
     flywheel_iteration_id =
       value_for_key flywheel_iteration_id_of_yojson "FlywheelIterationId" _list path;
   }
    : describe_flywheel_iteration_request)

let describe_flywheel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_properties =
       option_of_yojson
         (value_for_key flywheel_properties_of_yojson "FlywheelProperties")
         _list path;
   }
    : describe_flywheel_response)

let describe_flywheel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path }
    : describe_flywheel_request)

let describe_events_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events_detection_job_properties =
       option_of_yojson
         (value_for_key events_detection_job_properties_of_yojson "EventsDetectionJobProperties")
         _list path;
   }
    : describe_events_detection_job_response)

let describe_events_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_events_detection_job_request)

let describe_entity_recognizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_properties =
       option_of_yojson
         (value_for_key entity_recognizer_properties_of_yojson "EntityRecognizerProperties")
         _list path;
   }
    : describe_entity_recognizer_response)

let describe_entity_recognizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_arn =
       value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn" _list path;
   }
    : describe_entity_recognizer_request)

let describe_entities_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities_detection_job_properties =
       option_of_yojson
         (value_for_key entities_detection_job_properties_of_yojson "EntitiesDetectionJobProperties")
         _list path;
   }
    : describe_entities_detection_job_response)

let describe_entities_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_entities_detection_job_request)

let describe_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_properties =
       option_of_yojson
         (value_for_key endpoint_properties_of_yojson "EndpointProperties")
         _list path;
   }
    : describe_endpoint_response)

let describe_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_arn = value_for_key comprehend_endpoint_arn_of_yojson "EndpointArn" _list path }
    : describe_endpoint_request)

let describe_dominant_language_detection_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dominant_language_detection_job_properties =
       option_of_yojson
         (value_for_key dominant_language_detection_job_properties_of_yojson
            "DominantLanguageDetectionJobProperties")
         _list path;
   }
    : describe_dominant_language_detection_job_response)

let describe_dominant_language_detection_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_dominant_language_detection_job_request)

let describe_document_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_properties =
       option_of_yojson
         (value_for_key document_classifier_properties_of_yojson "DocumentClassifierProperties")
         _list path;
   }
    : describe_document_classifier_response)

let describe_document_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_arn =
       value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn" _list path;
   }
    : describe_document_classifier_request)

let describe_document_classification_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classification_job_properties =
       option_of_yojson
         (value_for_key document_classification_job_properties_of_yojson
            "DocumentClassificationJobProperties")
         _list path;
   }
    : describe_document_classification_job_response)

let describe_document_classification_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key job_id_of_yojson "JobId" _list path }
    : describe_document_classification_job_request)

let describe_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_properties =
       option_of_yojson (value_for_key dataset_properties_of_yojson "DatasetProperties") _list path;
   }
    : describe_dataset_response)

let describe_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key comprehend_dataset_arn_of_yojson "DatasetArn" _list path }
    : describe_dataset_request)

let delete_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key comprehend_model_arn_of_yojson "ResourceArn" _list path;
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
   }
    : delete_resource_policy_request)

let delete_flywheel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_flywheel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path }
    : delete_flywheel_request)

let delete_entity_recognizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_entity_recognizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_arn =
       value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn" _list path;
   }
    : delete_entity_recognizer_request)

let delete_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_arn = value_for_key comprehend_endpoint_arn_of_yojson "EndpointArn" _list path }
    : delete_endpoint_request)

let delete_document_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_document_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_arn =
       value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn" _list path;
   }
    : delete_document_classifier_request)

let create_flywheel_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
     active_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ActiveModelArn") _list path;
   }
    : create_flywheel_response)

let flywheel_s3_uri_of_yojson = string_of_yojson

let create_flywheel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_name = value_for_key comprehend_arn_name_of_yojson "FlywheelName" _list path;
     active_model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ActiveModelArn") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     task_config = option_of_yojson (value_for_key task_config_of_yojson "TaskConfig") _list path;
     model_type = option_of_yojson (value_for_key model_type_of_yojson "ModelType") _list path;
     data_lake_s3_uri = value_for_key flywheel_s3_uri_of_yojson "DataLakeS3Uri" _list path;
     data_security_config =
       option_of_yojson
         (value_for_key data_security_config_of_yojson "DataSecurityConfig")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_flywheel_request)

let create_entity_recognizer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_recognizer_arn =
       option_of_yojson
         (value_for_key entity_recognizer_arn_of_yojson "EntityRecognizerArn")
         _list path;
   }
    : create_entity_recognizer_response)

let create_entity_recognizer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recognizer_name = value_for_key comprehend_arn_name_of_yojson "RecognizerName" _list path;
     version_name = option_of_yojson (value_for_key version_name_of_yojson "VersionName") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     input_data_config =
       value_for_key entity_recognizer_input_data_config_of_yojson "InputDataConfig" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     model_policy = option_of_yojson (value_for_key policy_of_yojson "ModelPolicy") _list path;
   }
    : create_entity_recognizer_request)

let create_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_arn =
       option_of_yojson (value_for_key comprehend_endpoint_arn_of_yojson "EndpointArn") _list path;
     model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ModelArn") _list path;
   }
    : create_endpoint_response)

let create_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_name = value_for_key comprehend_endpoint_name_of_yojson "EndpointName" _list path;
     model_arn =
       option_of_yojson (value_for_key comprehend_model_arn_of_yojson "ModelArn") _list path;
     desired_inference_units =
       value_for_key inference_units_integer_of_yojson "DesiredInferenceUnits" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     flywheel_arn =
       option_of_yojson (value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn") _list path;
   }
    : create_endpoint_request)

let create_document_classifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_arn =
       option_of_yojson
         (value_for_key document_classifier_arn_of_yojson "DocumentClassifierArn")
         _list path;
   }
    : create_document_classifier_response)

let create_document_classifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_classifier_name =
       value_for_key comprehend_arn_name_of_yojson "DocumentClassifierName" _list path;
     version_name = option_of_yojson (value_for_key version_name_of_yojson "VersionName") _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     input_data_config =
       value_for_key document_classifier_input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config =
       option_of_yojson
         (value_for_key document_classifier_output_data_config_of_yojson "OutputDataConfig")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
     volume_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "VolumeKmsKeyId") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     mode = option_of_yojson (value_for_key document_classifier_mode_of_yojson "Mode") _list path;
     model_kms_key_id =
       option_of_yojson (value_for_key kms_key_id_of_yojson "ModelKmsKeyId") _list path;
     model_policy = option_of_yojson (value_for_key policy_of_yojson "ModelPolicy") _list path;
   }
    : create_document_classifier_request)

let create_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn =
       option_of_yojson (value_for_key comprehend_dataset_arn_of_yojson "DatasetArn") _list path;
   }
    : create_dataset_response)

let dataset_entity_recognizer_entity_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path }
    : dataset_entity_recognizer_entity_list)

let dataset_entity_recognizer_documents_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     input_format = option_of_yojson (value_for_key input_format_of_yojson "InputFormat") _list path;
   }
    : dataset_entity_recognizer_documents)

let dataset_entity_recognizer_annotations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path }
    : dataset_entity_recognizer_annotations)

let dataset_entity_recognizer_input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     annotations =
       option_of_yojson
         (value_for_key dataset_entity_recognizer_annotations_of_yojson "Annotations")
         _list path;
     documents = value_for_key dataset_entity_recognizer_documents_of_yojson "Documents" _list path;
     entity_list =
       option_of_yojson
         (value_for_key dataset_entity_recognizer_entity_list_of_yojson "EntityList")
         _list path;
   }
    : dataset_entity_recognizer_input_data_config)

let dataset_document_classifier_input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     label_delimiter =
       option_of_yojson (value_for_key label_delimiter_of_yojson "LabelDelimiter") _list path;
   }
    : dataset_document_classifier_input_data_config)

let dataset_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPREHEND_CSV" -> COMPREHEND_CSV
    | `String "AUGMENTED_MANIFEST" -> AUGMENTED_MANIFEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetDataFormat")
     : dataset_data_format)
    : dataset_data_format)

let dataset_augmented_manifests_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_names = value_for_key attribute_names_list_of_yojson "AttributeNames" _list path;
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     annotation_data_s3_uri =
       option_of_yojson (value_for_key s3_uri_of_yojson "AnnotationDataS3Uri") _list path;
     source_documents_s3_uri =
       option_of_yojson (value_for_key s3_uri_of_yojson "SourceDocumentsS3Uri") _list path;
     document_type =
       option_of_yojson
         (value_for_key augmented_manifests_document_type_format_of_yojson "DocumentType")
         _list path;
   }
    : dataset_augmented_manifests_list_item)

let dataset_augmented_manifests_list_of_yojson tree path =
  list_of_yojson dataset_augmented_manifests_list_item_of_yojson tree path

let dataset_input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     augmented_manifests =
       option_of_yojson
         (value_for_key dataset_augmented_manifests_list_of_yojson "AugmentedManifests")
         _list path;
     data_format =
       option_of_yojson (value_for_key dataset_data_format_of_yojson "DataFormat") _list path;
     document_classifier_input_data_config =
       option_of_yojson
         (value_for_key dataset_document_classifier_input_data_config_of_yojson
            "DocumentClassifierInputDataConfig")
         _list path;
     entity_recognizer_input_data_config =
       option_of_yojson
         (value_for_key dataset_entity_recognizer_input_data_config_of_yojson
            "EntityRecognizerInputDataConfig")
         _list path;
   }
    : dataset_input_data_config)

let create_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flywheel_arn = value_for_key comprehend_flywheel_arn_of_yojson "FlywheelArn" _list path;
     dataset_name = value_for_key comprehend_arn_name_of_yojson "DatasetName" _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     input_data_config =
       value_for_key dataset_input_data_config_of_yojson "InputDataConfig" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_string_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_dataset_request)

let entity_label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key pii_entity_type_of_yojson "Name") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : entity_label)

let list_of_entity_labels_of_yojson tree path = list_of_yojson entity_label_of_yojson tree path

let contains_pii_entities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ labels = option_of_yojson (value_for_key list_of_entity_labels_of_yojson "Labels") _list path }
    : contains_pii_entities_response)

let contains_pii_entities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key string__of_yojson "Text" _list path;
     language_code = value_for_key language_code_of_yojson "LanguageCode" _list path;
   }
    : contains_pii_entities_request)
