open Smaws_Lib.Json.DeserializeHelpers
open Types

let field_to_match_data_of_yojson = string_of_yojson

let single_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key field_to_match_data_of_yojson "Name" _list path } : single_header)

let single_query_argument_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key field_to_match_data_of_yojson "Name" _list path } : single_query_argument)

let all_query_arguments_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let uri_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let query_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let oversize_handling_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NO_MATCH" -> NO_MATCH
    | `String "MATCH" -> MATCH
    | `String "CONTINUE" -> CONTINUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OversizeHandling" value)
    | _ -> raise (deserialize_wrong_type_error path "OversizeHandling")
     : oversize_handling)
    : oversize_handling)

let body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oversize_handling =
       option_of_yojson (value_for_key oversize_handling_of_yojson "OversizeHandling") _list path;
   }
    : body)

let method__of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let all_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let json_pointer_path_of_yojson = string_of_yojson
let json_pointer_paths_of_yojson tree path = list_of_yojson json_pointer_path_of_yojson tree path

let json_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included_paths =
       option_of_yojson (value_for_key json_pointer_paths_of_yojson "IncludedPaths") _list path;
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
   }
    : json_match_pattern)

let json_match_scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "VALUE" -> VALUE
    | `String "KEY" -> KEY
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "JsonMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "JsonMatchScope")
     : json_match_scope)
    : json_match_scope)

let body_parsing_fallback_behavior_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EVALUATE_AS_STRING" -> EVALUATE_AS_STRING
    | `String "NO_MATCH" -> NO_MATCH
    | `String "MATCH" -> MATCH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BodyParsingFallbackBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "BodyParsingFallbackBehavior")
     : body_parsing_fallback_behavior)
    : body_parsing_fallback_behavior)

let json_body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oversize_handling =
       option_of_yojson (value_for_key oversize_handling_of_yojson "OversizeHandling") _list path;
     invalid_fallback_behavior =
       option_of_yojson
         (value_for_key body_parsing_fallback_behavior_of_yojson "InvalidFallbackBehavior")
         _list path;
     match_scope = value_for_key json_match_scope_of_yojson "MatchScope" _list path;
     match_pattern = value_for_key json_match_pattern_of_yojson "MatchPattern" _list path;
   }
    : json_body)

let header_names_of_yojson tree path = list_of_yojson field_to_match_data_of_yojson tree path

let header_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     excluded_headers =
       option_of_yojson (value_for_key header_names_of_yojson "ExcludedHeaders") _list path;
     included_headers =
       option_of_yojson (value_for_key header_names_of_yojson "IncludedHeaders") _list path;
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
   }
    : header_match_pattern)

let map_match_scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "VALUE" -> VALUE
    | `String "KEY" -> KEY
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "MapMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "MapMatchScope")
     : map_match_scope)
    : map_match_scope)

let headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path;
     match_scope = value_for_key map_match_scope_of_yojson "MatchScope" _list path;
     match_pattern = value_for_key header_match_pattern_of_yojson "MatchPattern" _list path;
   }
    : headers)

let single_cookie_name_of_yojson = string_of_yojson
let cookie_names_of_yojson tree path = list_of_yojson single_cookie_name_of_yojson tree path

let cookie_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     excluded_cookies =
       option_of_yojson (value_for_key cookie_names_of_yojson "ExcludedCookies") _list path;
     included_cookies =
       option_of_yojson (value_for_key cookie_names_of_yojson "IncludedCookies") _list path;
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
   }
    : cookie_match_pattern)

let cookies_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path;
     match_scope = value_for_key map_match_scope_of_yojson "MatchScope" _list path;
     match_pattern = value_for_key cookie_match_pattern_of_yojson "MatchPattern" _list path;
   }
    : cookies)

let header_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path }
    : header_order)

let fallback_behavior_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NO_MATCH" -> NO_MATCH
    | `String "MATCH" -> MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "FallbackBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FallbackBehavior")
     : fallback_behavior)
    : fallback_behavior)

let ja3_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : ja3_fingerprint)

let ja4_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : ja4_fingerprint)

let uri_fragment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fallback_behavior =
       option_of_yojson (value_for_key fallback_behavior_of_yojson "FallbackBehavior") _list path;
   }
    : uri_fragment)

let field_to_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uri_fragment = option_of_yojson (value_for_key uri_fragment_of_yojson "UriFragment") _list path;
     ja4_fingerprint =
       option_of_yojson (value_for_key ja4_fingerprint_of_yojson "JA4Fingerprint") _list path;
     ja3_fingerprint =
       option_of_yojson (value_for_key ja3_fingerprint_of_yojson "JA3Fingerprint") _list path;
     header_order = option_of_yojson (value_for_key header_order_of_yojson "HeaderOrder") _list path;
     cookies = option_of_yojson (value_for_key cookies_of_yojson "Cookies") _list path;
     headers = option_of_yojson (value_for_key headers_of_yojson "Headers") _list path;
     json_body = option_of_yojson (value_for_key json_body_of_yojson "JsonBody") _list path;
     method_ = option_of_yojson (value_for_key method__of_yojson "Method") _list path;
     body = option_of_yojson (value_for_key body_of_yojson "Body") _list path;
     query_string = option_of_yojson (value_for_key query_string_of_yojson "QueryString") _list path;
     uri_path = option_of_yojson (value_for_key uri_path_of_yojson "UriPath") _list path;
     all_query_arguments =
       option_of_yojson (value_for_key all_query_arguments_of_yojson "AllQueryArguments") _list path;
     single_query_argument =
       option_of_yojson
         (value_for_key single_query_argument_of_yojson "SingleQueryArgument")
         _list path;
     single_header =
       option_of_yojson (value_for_key single_header_of_yojson "SingleHeader") _list path;
   }
    : field_to_match)

let text_transformation_priority_of_yojson = int_of_yojson

let text_transformation_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UTF8_TO_UNICODE" -> UTF8_TO_UNICODE
    | `String "URL_DECODE_UNI" -> URL_DECODE_UNI
    | `String "BASE64_DECODE_EXT" -> BASE64_DECODE_EXT
    | `String "REPLACE_NULLS" -> REPLACE_NULLS
    | `String "REMOVE_NULLS" -> REMOVE_NULLS
    | `String "NORMALIZE_PATH_WIN" -> NORMALIZE_PATH_WIN
    | `String "NORMALIZE_PATH" -> NORMALIZE_PATH
    | `String "JS_DECODE" -> JS_DECODE
    | `String "CSS_DECODE" -> CSS_DECODE
    | `String "SQL_HEX_DECODE" -> SQL_HEX_DECODE
    | `String "ESCAPE_SEQ_DECODE" -> ESCAPE_SEQ_DECODE
    | `String "REPLACE_COMMENTS" -> REPLACE_COMMENTS
    | `String "MD5" -> MD5
    | `String "HEX_DECODE" -> HEX_DECODE
    | `String "BASE64_DECODE" -> BASE64_DECODE
    | `String "URL_DECODE" -> URL_DECODE
    | `String "CMD_LINE" -> CMD_LINE
    | `String "LOWERCASE" -> LOWERCASE
    | `String "HTML_ENTITY_DECODE" -> HTML_ENTITY_DECODE
    | `String "COMPRESS_WHITE_SPACE" -> COMPRESS_WHITE_SPACE
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TextTransformationType" value)
    | _ -> raise (deserialize_wrong_type_error path "TextTransformationType")
     : text_transformation_type)
    : text_transformation_type)

let text_transformation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key text_transformation_type_of_yojson "Type" _list path;
     priority = value_for_key text_transformation_priority_of_yojson "Priority" _list path;
   }
    : text_transformation)

let text_transformations_of_yojson tree path =
  list_of_yojson text_transformation_of_yojson tree path

let xss_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
   }
    : xss_match_statement)

let entity_name_of_yojson = string_of_yojson
let entity_id_of_yojson = string_of_yojson
let entity_description_of_yojson = string_of_yojson
let lock_token_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let web_acl_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : web_acl_summary)

let web_acl_summaries_of_yojson tree path = list_of_yojson web_acl_summary_of_yojson tree path
let response_status_code_of_yojson = int_of_yojson
let custom_http_header_name_of_yojson = string_of_yojson
let custom_http_header_value_of_yojson = string_of_yojson

let custom_http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key custom_http_header_value_of_yojson "Value" _list path;
     name = value_for_key custom_http_header_name_of_yojson "Name" _list path;
   }
    : custom_http_header)

let custom_http_headers_of_yojson tree path = list_of_yojson custom_http_header_of_yojson tree path

let custom_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_headers =
       option_of_yojson (value_for_key custom_http_headers_of_yojson "ResponseHeaders") _list path;
     custom_response_body_key =
       option_of_yojson (value_for_key entity_name_of_yojson "CustomResponseBodyKey") _list path;
     response_code = value_for_key response_status_code_of_yojson "ResponseCode" _list path;
   }
    : custom_response)

let block_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_response =
       option_of_yojson (value_for_key custom_response_of_yojson "CustomResponse") _list path;
   }
    : block_action)

let custom_request_handling_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ insert_headers = value_for_key custom_http_headers_of_yojson "InsertHeaders" _list path }
    : custom_request_handling)

let allow_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : allow_action)

let default_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow = option_of_yojson (value_for_key allow_action_of_yojson "Allow") _list path;
     block = option_of_yojson (value_for_key block_action_of_yojson "Block") _list path;
   }
    : default_action)

let rule_priority_of_yojson = int_of_yojson
let search_string_of_yojson = blob_of_yojson

let positional_constraint_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CONTAINS_WORD" -> CONTAINS_WORD
    | `String "CONTAINS" -> CONTAINS
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "EXACTLY" -> EXACTLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PositionalConstraint" value)
    | _ -> raise (deserialize_wrong_type_error path "PositionalConstraint")
     : positional_constraint)
    : positional_constraint)

let byte_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     positional_constraint =
       value_for_key positional_constraint_of_yojson "PositionalConstraint" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     search_string = value_for_key search_string_of_yojson "SearchString" _list path;
   }
    : byte_match_statement)

let sensitivity_level_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HIGH" -> HIGH
    | `String "LOW" -> LOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "SensitivityLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "SensitivityLevel")
     : sensitivity_level)
    : sensitivity_level)

let sqli_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sensitivity_level =
       option_of_yojson (value_for_key sensitivity_level_of_yojson "SensitivityLevel") _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
   }
    : sqli_match_statement)

let comparison_operator_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "GT" -> GT
    | `String "GE" -> GE
    | `String "LT" -> LT
    | `String "LE" -> LE
    | `String "NE" -> NE
    | `String "EQ" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let size_of_yojson = long_of_yojson

let size_constraint_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     size = value_for_key size_of_yojson "Size" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
   }
    : size_constraint_statement)

let country_code_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "XK" -> XK
    | `String "ZW" -> ZW
    | `String "ZM" -> ZM
    | `String "YE" -> YE
    | `String "EH" -> EH
    | `String "WF" -> WF
    | `String "VI" -> VI
    | `String "VG" -> VG
    | `String "VN" -> VN
    | `String "VE" -> VE
    | `String "VU" -> VU
    | `String "UZ" -> UZ
    | `String "UY" -> UY
    | `String "UM" -> UM
    | `String "US" -> US
    | `String "GB" -> GB
    | `String "AE" -> AE
    | `String "UA" -> UA
    | `String "UG" -> UG
    | `String "TV" -> TV
    | `String "TC" -> TC
    | `String "TM" -> TM
    | `String "TR" -> TR
    | `String "TN" -> TN
    | `String "TT" -> TT
    | `String "TO" -> TO
    | `String "TK" -> TK
    | `String "TG" -> TG
    | `String "TL" -> TL
    | `String "TH" -> TH
    | `String "TZ" -> TZ
    | `String "TJ" -> TJ
    | `String "TW" -> TW
    | `String "SY" -> SY
    | `String "CH" -> CH
    | `String "SE" -> SE
    | `String "SZ" -> SZ
    | `String "SJ" -> SJ
    | `String "SR" -> SR
    | `String "SD" -> SD
    | `String "LK" -> LK
    | `String "ES" -> ES
    | `String "SS" -> SS
    | `String "GS" -> GS
    | `String "ZA" -> ZA
    | `String "SO" -> SO
    | `String "SB" -> SB
    | `String "SI" -> SI
    | `String "SK" -> SK
    | `String "SX" -> SX
    | `String "SG" -> SG
    | `String "SL" -> SL
    | `String "SC" -> SC
    | `String "RS" -> RS
    | `String "SN" -> SN
    | `String "SA" -> SA
    | `String "ST" -> ST
    | `String "SM" -> SM
    | `String "WS" -> WS
    | `String "VC" -> VC
    | `String "PM" -> PM
    | `String "MF" -> MF
    | `String "LC" -> LC
    | `String "KN" -> KN
    | `String "SH" -> SH
    | `String "BL" -> BL
    | `String "RW" -> RW
    | `String "RU" -> RU
    | `String "RO" -> RO
    | `String "RE" -> RE
    | `String "QA" -> QA
    | `String "PR" -> PR
    | `String "PT" -> PT
    | `String "PL" -> PL
    | `String "PN" -> PN
    | `String "PH" -> PH
    | `String "PE" -> PE
    | `String "PY" -> PY
    | `String "PG" -> PG
    | `String "PA" -> PA
    | `String "PS" -> PS
    | `String "PW" -> PW
    | `String "PK" -> PK
    | `String "OM" -> OM
    | `String "NO" -> NO
    | `String "MP" -> MP
    | `String "NF" -> NF
    | `String "NU" -> NU
    | `String "NG" -> NG
    | `String "NE" -> NE
    | `String "NI" -> NI
    | `String "NZ" -> NZ
    | `String "NC" -> NC
    | `String "NL" -> NL
    | `String "NP" -> NP
    | `String "NR" -> NR
    | `String "NA" -> NA
    | `String "MM" -> MM
    | `String "MZ" -> MZ
    | `String "MA" -> MA
    | `String "MS" -> MS
    | `String "ME" -> ME
    | `String "MN" -> MN
    | `String "MC" -> MC
    | `String "MD" -> MD
    | `String "FM" -> FM
    | `String "MX" -> MX
    | `String "YT" -> YT
    | `String "MU" -> MU
    | `String "MR" -> MR
    | `String "MQ" -> MQ
    | `String "MH" -> MH
    | `String "MT" -> MT
    | `String "ML" -> ML
    | `String "MV" -> MV
    | `String "MY" -> MY
    | `String "MW" -> MW
    | `String "MG" -> MG
    | `String "MK" -> MK
    | `String "MO" -> MO
    | `String "LU" -> LU
    | `String "LT" -> LT
    | `String "LI" -> LI
    | `String "LY" -> LY
    | `String "LR" -> LR
    | `String "LS" -> LS
    | `String "LB" -> LB
    | `String "LV" -> LV
    | `String "LA" -> LA
    | `String "KG" -> KG
    | `String "KW" -> KW
    | `String "KR" -> KR
    | `String "KP" -> KP
    | `String "KI" -> KI
    | `String "KE" -> KE
    | `String "KZ" -> KZ
    | `String "JO" -> JO
    | `String "JE" -> JE
    | `String "JP" -> JP
    | `String "JM" -> JM
    | `String "IT" -> IT
    | `String "IL" -> IL
    | `String "IM" -> IM
    | `String "IE" -> IE
    | `String "IQ" -> IQ
    | `String "IR" -> IR
    | `String "ID" -> ID
    | `String "IN" -> IN
    | `String "IS" -> IS
    | `String "HU" -> HU
    | `String "HK" -> HK
    | `String "HN" -> HN
    | `String "VA" -> VA
    | `String "HM" -> HM
    | `String "HT" -> HT
    | `String "GY" -> GY
    | `String "GW" -> GW
    | `String "GN" -> GN
    | `String "GG" -> GG
    | `String "GT" -> GT
    | `String "GU" -> GU
    | `String "GP" -> GP
    | `String "GD" -> GD
    | `String "GL" -> GL
    | `String "GR" -> GR
    | `String "GI" -> GI
    | `String "GH" -> GH
    | `String "DE" -> DE
    | `String "GE" -> GE
    | `String "GM" -> GM
    | `String "GA" -> GA
    | `String "TF" -> TF
    | `String "PF" -> PF
    | `String "GF" -> GF
    | `String "FR" -> FR
    | `String "FI" -> FI
    | `String "FJ" -> FJ
    | `String "FO" -> FO
    | `String "FK" -> FK
    | `String "ET" -> ET
    | `String "EE" -> EE
    | `String "ER" -> ER
    | `String "GQ" -> GQ
    | `String "SV" -> SV
    | `String "EG" -> EG
    | `String "EC" -> EC
    | `String "DO" -> DO
    | `String "DM" -> DM
    | `String "DJ" -> DJ
    | `String "DK" -> DK
    | `String "CZ" -> CZ
    | `String "CY" -> CY
    | `String "CW" -> CW
    | `String "CU" -> CU
    | `String "HR" -> HR
    | `String "CI" -> CI
    | `String "CR" -> CR
    | `String "CK" -> CK
    | `String "CD" -> CD
    | `String "CG" -> CG
    | `String "KM" -> KM
    | `String "CO" -> CO
    | `String "CC" -> CC
    | `String "CX" -> CX
    | `String "CN" -> CN
    | `String "CL" -> CL
    | `String "TD" -> TD
    | `String "CF" -> CF
    | `String "KY" -> KY
    | `String "CV" -> CV
    | `String "CA" -> CA
    | `String "CM" -> CM
    | `String "KH" -> KH
    | `String "BI" -> BI
    | `String "BF" -> BF
    | `String "BG" -> BG
    | `String "BN" -> BN
    | `String "IO" -> IO
    | `String "BR" -> BR
    | `String "BV" -> BV
    | `String "BW" -> BW
    | `String "BA" -> BA
    | `String "BQ" -> BQ
    | `String "BO" -> BO
    | `String "BT" -> BT
    | `String "BM" -> BM
    | `String "BJ" -> BJ
    | `String "BZ" -> BZ
    | `String "BE" -> BE
    | `String "BY" -> BY
    | `String "BB" -> BB
    | `String "BD" -> BD
    | `String "BH" -> BH
    | `String "BS" -> BS
    | `String "AZ" -> AZ
    | `String "AT" -> AT
    | `String "AU" -> AU
    | `String "AW" -> AW
    | `String "AM" -> AM
    | `String "AR" -> AR
    | `String "AG" -> AG
    | `String "AQ" -> AQ
    | `String "AI" -> AI
    | `String "AO" -> AO
    | `String "AD" -> AD
    | `String "AS" -> AS
    | `String "DZ" -> DZ
    | `String "AL" -> AL
    | `String "AX" -> AX
    | `String "AF" -> AF
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let country_codes_of_yojson tree path = list_of_yojson country_code_of_yojson tree path
let forwarded_ip_header_name_of_yojson = string_of_yojson

let forwarded_ip_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path;
     header_name = value_for_key forwarded_ip_header_name_of_yojson "HeaderName" _list path;
   }
    : forwarded_ip_config)

let geo_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
     country_codes =
       option_of_yojson (value_for_key country_codes_of_yojson "CountryCodes") _list path;
   }
    : geo_match_statement)

let excluded_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key entity_name_of_yojson "Name" _list path } : excluded_rule)

let excluded_rules_of_yojson tree path = list_of_yojson excluded_rule_of_yojson tree path

let count_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : count_action)

let captcha_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : captcha_action)

let challenge_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : challenge_action)

let rule_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     challenge = option_of_yojson (value_for_key challenge_action_of_yojson "Challenge") _list path;
     captcha = option_of_yojson (value_for_key captcha_action_of_yojson "Captcha") _list path;
     count = option_of_yojson (value_for_key count_action_of_yojson "Count") _list path;
     allow = option_of_yojson (value_for_key allow_action_of_yojson "Allow") _list path;
     block = option_of_yojson (value_for_key block_action_of_yojson "Block") _list path;
   }
    : rule_action)

let rule_action_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_to_use = value_for_key rule_action_of_yojson "ActionToUse" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : rule_action_override)

let rule_action_overrides_of_yojson tree path =
  list_of_yojson rule_action_override_of_yojson tree path

let rule_group_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_action_overrides =
       option_of_yojson
         (value_for_key rule_action_overrides_of_yojson "RuleActionOverrides")
         _list path;
     excluded_rules =
       option_of_yojson (value_for_key excluded_rules_of_yojson "ExcludedRules") _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
   }
    : rule_group_reference_statement)

let forwarded_ip_position_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ANY" -> ANY
    | `String "LAST" -> LAST
    | `String "FIRST" -> FIRST
    | `String value -> raise (deserialize_unknown_enum_value_error path "ForwardedIPPosition" value)
    | _ -> raise (deserialize_wrong_type_error path "ForwardedIPPosition")
     : forwarded_ip_position)
    : forwarded_ip_position)

let ip_set_forwarded_ip_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     position = value_for_key forwarded_ip_position_of_yojson "Position" _list path;
     fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path;
     header_name = value_for_key forwarded_ip_header_name_of_yojson "HeaderName" _list path;
   }
    : ip_set_forwarded_ip_config)

let ip_set_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_forwarded_ip_config =
       option_of_yojson
         (value_for_key ip_set_forwarded_ip_config_of_yojson "IPSetForwardedIPConfig")
         _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
   }
    : ip_set_reference_statement)

let regex_pattern_set_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
   }
    : regex_pattern_set_reference_statement)

let rate_limit_of_yojson = long_of_yojson
let evaluation_window_sec_of_yojson = long_of_yojson

let rate_based_statement_aggregate_key_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CONSTANT" -> CONSTANT
    | `String "CUSTOM_KEYS" -> CUSTOM_KEYS
    | `String "FORWARDED_IP" -> FORWARDED_IP
    | `String "IP" -> IP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RateBasedStatementAggregateKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RateBasedStatementAggregateKeyType")
     : rate_based_statement_aggregate_key_type)
    : rate_based_statement_aggregate_key_type)

let rate_limit_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
   }
    : rate_limit_header)

let rate_limit_cookie_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
   }
    : rate_limit_cookie)

let rate_limit_query_argument_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
   }
    : rate_limit_query_argument)

let rate_limit_query_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_query_string)

let rate_limit_http_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_forwarded_i_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_i_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let label_namespace_of_yojson = string_of_yojson

let rate_limit_label_namespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key label_namespace_of_yojson "Namespace" _list path }
    : rate_limit_label_namespace)

let rate_limit_uri_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_uri_path)

let rate_limit_ja3_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : rate_limit_ja3_fingerprint)

let rate_limit_ja4_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : rate_limit_ja4_fingerprint)

let rate_limit_asn_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_based_statement_custom_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     as_n = option_of_yojson (value_for_key rate_limit_asn_of_yojson "ASN") _list path;
     ja4_fingerprint =
       option_of_yojson
         (value_for_key rate_limit_ja4_fingerprint_of_yojson "JA4Fingerprint")
         _list path;
     ja3_fingerprint =
       option_of_yojson
         (value_for_key rate_limit_ja3_fingerprint_of_yojson "JA3Fingerprint")
         _list path;
     uri_path = option_of_yojson (value_for_key rate_limit_uri_path_of_yojson "UriPath") _list path;
     label_namespace =
       option_of_yojson
         (value_for_key rate_limit_label_namespace_of_yojson "LabelNamespace")
         _list path;
     i_p = option_of_yojson (value_for_key rate_limit_i_p_of_yojson "IP") _list path;
     forwarded_i_p =
       option_of_yojson (value_for_key rate_limit_forwarded_i_p_of_yojson "ForwardedIP") _list path;
     http_method =
       option_of_yojson (value_for_key rate_limit_http_method_of_yojson "HTTPMethod") _list path;
     query_string =
       option_of_yojson (value_for_key rate_limit_query_string_of_yojson "QueryString") _list path;
     query_argument =
       option_of_yojson
         (value_for_key rate_limit_query_argument_of_yojson "QueryArgument")
         _list path;
     cookie = option_of_yojson (value_for_key rate_limit_cookie_of_yojson "Cookie") _list path;
     header = option_of_yojson (value_for_key rate_limit_header_of_yojson "Header") _list path;
   }
    : rate_based_statement_custom_key)

let rate_based_statement_custom_keys_of_yojson tree path =
  list_of_yojson rate_based_statement_custom_key_of_yojson tree path

let vendor_name_of_yojson = string_of_yojson
let version_key_string_of_yojson = string_of_yojson
let login_path_string_of_yojson = string_of_yojson

let payload_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FORM_ENCODED" -> FORM_ENCODED
    | `String "JSON" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "PayloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "PayloadType")
     : payload_type)
    : payload_type)

let field_identifier_of_yojson = string_of_yojson

let username_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : username_field)

let password_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : password_field)

let inspection_level_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TARGETED" -> TARGETED
    | `String "COMMON" -> COMMON
    | `String value -> raise (deserialize_unknown_enum_value_error path "InspectionLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "InspectionLevel")
     : inspection_level)
    : inspection_level)

let enable_machine_learning_of_yojson = bool_of_yojson

let aws_managed_rules_bot_control_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_machine_learning =
       option_of_yojson
         (value_for_key enable_machine_learning_of_yojson "EnableMachineLearning")
         _list path;
     inspection_level = value_for_key inspection_level_of_yojson "InspectionLevel" _list path;
   }
    : aws_managed_rules_bot_control_rule_set)

let string__of_yojson = string_of_yojson

let request_inspection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password_field = value_for_key password_field_of_yojson "PasswordField" _list path;
     username_field = value_for_key username_field_of_yojson "UsernameField" _list path;
     payload_type = value_for_key payload_type_of_yojson "PayloadType" _list path;
   }
    : request_inspection)

let success_code_of_yojson = int_of_yojson

let response_inspection_status_code_success_codes_of_yojson tree path =
  list_of_yojson success_code_of_yojson tree path

let failure_code_of_yojson = int_of_yojson

let response_inspection_status_code_failure_codes_of_yojson tree path =
  list_of_yojson failure_code_of_yojson tree path

let response_inspection_status_code_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_codes =
       value_for_key response_inspection_status_code_failure_codes_of_yojson "FailureCodes" _list
         path;
     success_codes =
       value_for_key response_inspection_status_code_success_codes_of_yojson "SuccessCodes" _list
         path;
   }
    : response_inspection_status_code)

let response_inspection_header_name_of_yojson = string_of_yojson
let success_value_of_yojson = string_of_yojson

let response_inspection_header_success_values_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let failure_value_of_yojson = string_of_yojson

let response_inspection_header_failure_values_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let response_inspection_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_values =
       value_for_key response_inspection_header_failure_values_of_yojson "FailureValues" _list path;
     success_values =
       value_for_key response_inspection_header_success_values_of_yojson "SuccessValues" _list path;
     name = value_for_key response_inspection_header_name_of_yojson "Name" _list path;
   }
    : response_inspection_header)

let response_inspection_body_contains_success_strings_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let response_inspection_body_contains_failure_strings_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let response_inspection_body_contains_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_strings =
       value_for_key response_inspection_body_contains_failure_strings_of_yojson "FailureStrings"
         _list path;
     success_strings =
       value_for_key response_inspection_body_contains_success_strings_of_yojson "SuccessStrings"
         _list path;
   }
    : response_inspection_body_contains)

let response_inspection_json_success_values_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let response_inspection_json_failure_values_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let response_inspection_json_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_values =
       value_for_key response_inspection_json_failure_values_of_yojson "FailureValues" _list path;
     success_values =
       value_for_key response_inspection_json_success_values_of_yojson "SuccessValues" _list path;
     identifier = value_for_key field_identifier_of_yojson "Identifier" _list path;
   }
    : response_inspection_json)

let response_inspection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json = option_of_yojson (value_for_key response_inspection_json_of_yojson "Json") _list path;
     body_contains =
       option_of_yojson
         (value_for_key response_inspection_body_contains_of_yojson "BodyContains")
         _list path;
     header =
       option_of_yojson (value_for_key response_inspection_header_of_yojson "Header") _list path;
     status_code =
       option_of_yojson
         (value_for_key response_inspection_status_code_of_yojson "StatusCode")
         _list path;
   }
    : response_inspection)

let boolean__of_yojson = bool_of_yojson

let aws_managed_rules_atp_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_regex_in_path =
       option_of_yojson (value_for_key boolean__of_yojson "EnableRegexInPath") _list path;
     response_inspection =
       option_of_yojson
         (value_for_key response_inspection_of_yojson "ResponseInspection")
         _list path;
     request_inspection =
       option_of_yojson (value_for_key request_inspection_of_yojson "RequestInspection") _list path;
     login_path = value_for_key string__of_yojson "LoginPath" _list path;
   }
    : aws_managed_rules_atp_rule_set)

let creation_path_string_of_yojson = string_of_yojson
let registration_page_path_string_of_yojson = string_of_yojson

let email_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path } : email_field)

let phone_number_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : phone_number_field)

let phone_number_fields_of_yojson tree path = list_of_yojson phone_number_field_of_yojson tree path

let address_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : address_field)

let address_fields_of_yojson tree path = list_of_yojson address_field_of_yojson tree path

let request_inspection_acf_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_fields =
       option_of_yojson (value_for_key address_fields_of_yojson "AddressFields") _list path;
     phone_number_fields =
       option_of_yojson (value_for_key phone_number_fields_of_yojson "PhoneNumberFields") _list path;
     email_field = option_of_yojson (value_for_key email_field_of_yojson "EmailField") _list path;
     password_field =
       option_of_yojson (value_for_key password_field_of_yojson "PasswordField") _list path;
     username_field =
       option_of_yojson (value_for_key username_field_of_yojson "UsernameField") _list path;
     payload_type = value_for_key payload_type_of_yojson "PayloadType" _list path;
   }
    : request_inspection_acf_p)

let aws_managed_rules_acfp_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_regex_in_path =
       option_of_yojson (value_for_key boolean__of_yojson "EnableRegexInPath") _list path;
     response_inspection =
       option_of_yojson
         (value_for_key response_inspection_of_yojson "ResponseInspection")
         _list path;
     request_inspection =
       value_for_key request_inspection_acf_p_of_yojson "RequestInspection" _list path;
     registration_page_path =
       value_for_key registration_page_path_string_of_yojson "RegistrationPagePath" _list path;
     creation_path = value_for_key creation_path_string_of_yojson "CreationPath" _list path;
   }
    : aws_managed_rules_acfp_rule_set)

let usage_of_action_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UsageOfAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageOfAction")
     : usage_of_action)
    : usage_of_action)

let sensitivity_to_act_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HIGH" -> HIGH
    | `String "MEDIUM" -> MEDIUM
    | `String "LOW" -> LOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "SensitivityToAct" value)
    | _ -> raise (deserialize_wrong_type_error path "SensitivityToAct")
     : sensitivity_to_act)
    : sensitivity_to_act)

let regex_pattern_string_of_yojson = string_of_yojson

let regex_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_string =
       option_of_yojson (value_for_key regex_pattern_string_of_yojson "RegexString") _list path;
   }
    : regex)

let regular_expression_list_of_yojson tree path = list_of_yojson regex_of_yojson tree path

let client_side_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exempt_uri_regular_expressions =
       option_of_yojson
         (value_for_key regular_expression_list_of_yojson "ExemptUriRegularExpressions")
         _list path;
     sensitivity =
       option_of_yojson (value_for_key sensitivity_to_act_of_yojson "Sensitivity") _list path;
     usage_of_action = value_for_key usage_of_action_of_yojson "UsageOfAction" _list path;
   }
    : client_side_action)

let client_side_action_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ challenge = value_for_key client_side_action_of_yojson "Challenge" _list path }
    : client_side_action_config)

let aws_managed_rules_anti_d_do_s_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sensitivity_to_block =
       option_of_yojson (value_for_key sensitivity_to_act_of_yojson "SensitivityToBlock") _list path;
     client_side_action_config =
       value_for_key client_side_action_config_of_yojson "ClientSideActionConfig" _list path;
   }
    : aws_managed_rules_anti_d_do_s_rule_set)

let managed_rule_group_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_managed_rules_anti_d_do_s_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_anti_d_do_s_rule_set_of_yojson
            "AWSManagedRulesAntiDDoSRuleSet")
         _list path;
     aws_managed_rules_acfp_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_acfp_rule_set_of_yojson "AWSManagedRulesACFPRuleSet")
         _list path;
     aws_managed_rules_atp_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_atp_rule_set_of_yojson "AWSManagedRulesATPRuleSet")
         _list path;
     aws_managed_rules_bot_control_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_bot_control_rule_set_of_yojson
            "AWSManagedRulesBotControlRuleSet")
         _list path;
     password_field =
       option_of_yojson (value_for_key password_field_of_yojson "PasswordField") _list path;
     username_field =
       option_of_yojson (value_for_key username_field_of_yojson "UsernameField") _list path;
     payload_type = option_of_yojson (value_for_key payload_type_of_yojson "PayloadType") _list path;
     login_path =
       option_of_yojson (value_for_key login_path_string_of_yojson "LoginPath") _list path;
   }
    : managed_rule_group_config)

let managed_rule_group_configs_of_yojson tree path =
  list_of_yojson managed_rule_group_config_of_yojson tree path

let label_match_scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NAMESPACE" -> NAMESPACE
    | `String "LABEL" -> LABEL
    | `String value -> raise (deserialize_unknown_enum_value_error path "LabelMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelMatchScope")
     : label_match_scope)
    : label_match_scope)

let label_match_key_of_yojson = string_of_yojson

let label_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key label_match_key_of_yojson "Key" _list path;
     scope = value_for_key label_match_scope_of_yojson "Scope" _list path;
   }
    : label_match_statement)

let regex_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     regex_string = value_for_key regex_pattern_string_of_yojson "RegexString" _list path;
   }
    : regex_match_statement)

let as_n_of_yojson = long_of_yojson
let asn_list_of_yojson tree path = list_of_yojson as_n_of_yojson tree path

let asn_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
     asn_list = value_for_key asn_list_of_yojson "AsnList" _list path;
   }
    : asn_match_statement)

let rec and_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statements = value_for_key statements_of_yojson "Statements" _list path } : and_statement)

and managed_rule_group_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_action_overrides =
       option_of_yojson
         (value_for_key rule_action_overrides_of_yojson "RuleActionOverrides")
         _list path;
     managed_rule_group_configs =
       option_of_yojson
         (value_for_key managed_rule_group_configs_of_yojson "ManagedRuleGroupConfigs")
         _list path;
     scope_down_statement =
       option_of_yojson (value_for_key statement_of_yojson "ScopeDownStatement") _list path;
     excluded_rules =
       option_of_yojson (value_for_key excluded_rules_of_yojson "ExcludedRules") _list path;
     version = option_of_yojson (value_for_key version_key_string_of_yojson "Version") _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
   }
    : managed_rule_group_statement)

and not_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statement = value_for_key statement_of_yojson "Statement" _list path } : not_statement)

and or_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statements = value_for_key statements_of_yojson "Statements" _list path } : or_statement)

and rate_based_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_keys =
       option_of_yojson
         (value_for_key rate_based_statement_custom_keys_of_yojson "CustomKeys")
         _list path;
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
     scope_down_statement =
       option_of_yojson (value_for_key statement_of_yojson "ScopeDownStatement") _list path;
     aggregate_key_type =
       value_for_key rate_based_statement_aggregate_key_type_of_yojson "AggregateKeyType" _list path;
     evaluation_window_sec =
       option_of_yojson
         (value_for_key evaluation_window_sec_of_yojson "EvaluationWindowSec")
         _list path;
     limit = value_for_key rate_limit_of_yojson "Limit" _list path;
   }
    : rate_based_statement)

and statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asn_match_statement =
       option_of_yojson (value_for_key asn_match_statement_of_yojson "AsnMatchStatement") _list path;
     regex_match_statement =
       option_of_yojson
         (value_for_key regex_match_statement_of_yojson "RegexMatchStatement")
         _list path;
     label_match_statement =
       option_of_yojson
         (value_for_key label_match_statement_of_yojson "LabelMatchStatement")
         _list path;
     managed_rule_group_statement =
       option_of_yojson
         (value_for_key managed_rule_group_statement_of_yojson "ManagedRuleGroupStatement")
         _list path;
     not_statement =
       option_of_yojson (value_for_key not_statement_of_yojson "NotStatement") _list path;
     or_statement = option_of_yojson (value_for_key or_statement_of_yojson "OrStatement") _list path;
     and_statement =
       option_of_yojson (value_for_key and_statement_of_yojson "AndStatement") _list path;
     rate_based_statement =
       option_of_yojson
         (value_for_key rate_based_statement_of_yojson "RateBasedStatement")
         _list path;
     regex_pattern_set_reference_statement =
       option_of_yojson
         (value_for_key regex_pattern_set_reference_statement_of_yojson
            "RegexPatternSetReferenceStatement")
         _list path;
     ip_set_reference_statement =
       option_of_yojson
         (value_for_key ip_set_reference_statement_of_yojson "IPSetReferenceStatement")
         _list path;
     rule_group_reference_statement =
       option_of_yojson
         (value_for_key rule_group_reference_statement_of_yojson "RuleGroupReferenceStatement")
         _list path;
     geo_match_statement =
       option_of_yojson (value_for_key geo_match_statement_of_yojson "GeoMatchStatement") _list path;
     size_constraint_statement =
       option_of_yojson
         (value_for_key size_constraint_statement_of_yojson "SizeConstraintStatement")
         _list path;
     xss_match_statement =
       option_of_yojson (value_for_key xss_match_statement_of_yojson "XssMatchStatement") _list path;
     sqli_match_statement =
       option_of_yojson
         (value_for_key sqli_match_statement_of_yojson "SqliMatchStatement")
         _list path;
     byte_match_statement =
       option_of_yojson
         (value_for_key byte_match_statement_of_yojson "ByteMatchStatement")
         _list path;
   }
    : statement)

and statements_of_yojson tree path = list_of_yojson statement_of_yojson tree path

let none_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let override_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     none = option_of_yojson (value_for_key none_action_of_yojson "None") _list path;
     count = option_of_yojson (value_for_key count_action_of_yojson "Count") _list path;
   }
    : override_action)

let label_name_of_yojson = string_of_yojson

let label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key label_name_of_yojson "Name" _list path } : label)

let labels_of_yojson tree path = list_of_yojson label_of_yojson tree path
let metric_name_of_yojson = string_of_yojson

let visibility_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     cloud_watch_metrics_enabled =
       value_for_key boolean__of_yojson "CloudWatchMetricsEnabled" _list path;
     sampled_requests_enabled = value_for_key boolean__of_yojson "SampledRequestsEnabled" _list path;
   }
    : visibility_config)

let time_window_second_of_yojson = long_of_yojson

let immunity_time_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ immunity_time = value_for_key time_window_second_of_yojson "ImmunityTime" _list path }
    : immunity_time_property)

let captcha_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     immunity_time_property =
       option_of_yojson
         (value_for_key immunity_time_property_of_yojson "ImmunityTimeProperty")
         _list path;
   }
    : captcha_config)

let challenge_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     immunity_time_property =
       option_of_yojson
         (value_for_key immunity_time_property_of_yojson "ImmunityTimeProperty")
         _list path;
   }
    : challenge_config)

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rule_labels = option_of_yojson (value_for_key labels_of_yojson "RuleLabels") _list path;
     override_action =
       option_of_yojson (value_for_key override_action_of_yojson "OverrideAction") _list path;
     action = option_of_yojson (value_for_key rule_action_of_yojson "Action") _list path;
     statement = value_for_key statement_of_yojson "Statement" _list path;
     priority = value_for_key rule_priority_of_yojson "Priority" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : rule)

let rules_of_yojson tree path = list_of_yojson rule_of_yojson tree path

let field_to_protect_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "BODY" -> BODY
    | `String "QUERY_STRING" -> QUERY_STRING
    | `String "SINGLE_QUERY_ARGUMENT" -> SINGLE_QUERY_ARGUMENT
    | `String "SINGLE_COOKIE" -> SINGLE_COOKIE
    | `String "SINGLE_HEADER" -> SINGLE_HEADER
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldToProtectType" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldToProtectType")
     : field_to_protect_type)
    : field_to_protect_type)

let field_to_protect_key_name_of_yojson = string_of_yojson

let field_to_protect_keys_of_yojson tree path =
  list_of_yojson field_to_protect_key_name_of_yojson tree path

let field_to_protect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_keys =
       option_of_yojson (value_for_key field_to_protect_keys_of_yojson "FieldKeys") _list path;
     field_type = value_for_key field_to_protect_type_of_yojson "FieldType" _list path;
   }
    : field_to_protect)

let data_protection_action_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HASH" -> HASH
    | `String "SUBSTITUTION" -> SUBSTITUTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataProtectionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DataProtectionAction")
     : data_protection_action)
    : data_protection_action)

let data_protection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclude_rate_based_details =
       option_of_yojson (value_for_key boolean__of_yojson "ExcludeRateBasedDetails") _list path;
     exclude_rule_match_details =
       option_of_yojson (value_for_key boolean__of_yojson "ExcludeRuleMatchDetails") _list path;
     action = value_for_key data_protection_action_of_yojson "Action" _list path;
     field = value_for_key field_to_protect_of_yojson "Field" _list path;
   }
    : data_protection)

let data_protections_of_yojson tree path = list_of_yojson data_protection_of_yojson tree path

let data_protection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data_protections = value_for_key data_protections_of_yojson "DataProtections" _list path }
    : data_protection_config)

let consumed_capacity_of_yojson = long_of_yojson

let firewall_manager_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_reference_statement =
       option_of_yojson
         (value_for_key rule_group_reference_statement_of_yojson "RuleGroupReferenceStatement")
         _list path;
     managed_rule_group_statement =
       option_of_yojson
         (value_for_key managed_rule_group_statement_of_yojson "ManagedRuleGroupStatement")
         _list path;
   }
    : firewall_manager_statement)

let firewall_manager_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     override_action = value_for_key override_action_of_yojson "OverrideAction" _list path;
     firewall_manager_statement =
       value_for_key firewall_manager_statement_of_yojson "FirewallManagerStatement" _list path;
     priority = value_for_key rule_priority_of_yojson "Priority" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : firewall_manager_rule_group)

let firewall_manager_rule_groups_of_yojson tree path =
  list_of_yojson firewall_manager_rule_group_of_yojson tree path

let response_content_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "APPLICATION_JSON" -> APPLICATION_JSON
    | `String "TEXT_HTML" -> TEXT_HTML
    | `String "TEXT_PLAIN" -> TEXT_PLAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResponseContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResponseContentType")
     : response_content_type)
    : response_content_type)

let response_content_of_yojson = string_of_yojson

let custom_response_body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key response_content_of_yojson "Content" _list path;
     content_type = value_for_key response_content_type_of_yojson "ContentType" _list path;
   }
    : custom_response_body)

let custom_response_bodies_of_yojson tree path =
  map_of_yojson entity_name_of_yojson custom_response_body_of_yojson tree path

let token_domain_of_yojson = string_of_yojson
let token_domains_of_yojson tree path = list_of_yojson token_domain_of_yojson tree path

let size_inspection_limit_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "KB_64" -> KB_64
    | `String "KB_48" -> KB_48
    | `String "KB_32" -> KB_32
    | `String "KB_16" -> KB_16
    | `String value -> raise (deserialize_unknown_enum_value_error path "SizeInspectionLimit" value)
    | _ -> raise (deserialize_wrong_type_error path "SizeInspectionLimit")
     : size_inspection_limit)
    : size_inspection_limit)

let request_body_associated_resource_type_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_size_inspection_limit =
       value_for_key size_inspection_limit_of_yojson "DefaultSizeInspectionLimit" _list path;
   }
    : request_body_associated_resource_type_config)

let associated_resource_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "VERIFIED_ACCESS_INSTANCE" -> VERIFIED_ACCESS_INSTANCE
    | `String "APP_RUNNER_SERVICE" -> APP_RUNNER_SERVICE
    | `String "COGNITO_USER_POOL" -> COGNITO_USER_POOL
    | `String "API_GATEWAY" -> API_GATEWAY
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AssociatedResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociatedResourceType")
     : associated_resource_type)
    : associated_resource_type)

let request_body_of_yojson tree path =
  map_of_yojson associated_resource_type_of_yojson
    request_body_associated_resource_type_config_of_yojson tree path

let association_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_body = option_of_yojson (value_for_key request_body_of_yojson "RequestBody") _list path;
   }
    : association_config)

let low_reputation_mode_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ALWAYS_ON" -> ALWAYS_ON
    | `String "ACTIVE_UNDER_DDOS" -> ACTIVE_UNDER_DDOS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LowReputationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "LowReputationMode")
     : low_reputation_mode)
    : low_reputation_mode)

let on_source_d_do_s_protection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alb_low_reputation_mode =
       value_for_key low_reputation_mode_of_yojson "ALBLowReputationMode" _list path;
   }
    : on_source_d_do_s_protection_config)

let attribute_name_of_yojson = string_of_yojson
let attribute_value_of_yojson = string_of_yojson
let attribute_values_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

let application_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key attribute_values_of_yojson "Values") _list path;
     name = option_of_yojson (value_for_key attribute_name_of_yojson "Name") _list path;
   }
    : application_attribute)

let application_attributes_of_yojson tree path =
  list_of_yojson application_attribute_of_yojson tree path

let application_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       option_of_yojson (value_for_key application_attributes_of_yojson "Attributes") _list path;
   }
    : application_config)

let web_ac_l_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_config =
       option_of_yojson (value_for_key application_config_of_yojson "ApplicationConfig") _list path;
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     retrofitted_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "RetrofittedByFirewallManager") _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     managed_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "ManagedByFirewallManager") _list path;
     post_process_firewall_manager_rule_groups =
       option_of_yojson
         (value_for_key firewall_manager_rule_groups_of_yojson
            "PostProcessFirewallManagerRuleGroups")
         _list path;
     pre_process_firewall_manager_rule_groups =
       option_of_yojson
         (value_for_key firewall_manager_rule_groups_of_yojson "PreProcessFirewallManagerRuleGroups")
         _list path;
     capacity = option_of_yojson (value_for_key consumed_capacity_of_yojson "Capacity") _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : web_ac_l)

let error_message_of_yojson = string_of_yojson

let waf_unsupported_aggregate_key_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_unsupported_aggregate_key_type_exception)

let waf_unavailable_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_unavailable_entity_exception)

let waf_tag_operation_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_tag_operation_internal_error_exception)

let waf_tag_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_tag_operation_exception)

let waf_subscription_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_subscription_not_found_exception)

let waf_service_linked_role_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_service_linked_role_error_exception)

let waf_optimistic_lock_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_optimistic_lock_exception)

let waf_nonexistent_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_nonexistent_item_exception)

let waf_log_destination_permission_issue_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_log_destination_permission_issue_exception)

let source_type_of_yojson = string_of_yojson

let waf_limits_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : waf_limits_exceeded_exception)

let waf_invalid_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_invalid_resource_exception)

let waf_invalid_permission_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_invalid_permission_policy_exception)

let parameter_exception_field_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "LOW_REPUTATION_MODE" -> LOW_REPUTATION_MODE
    | `String "DATA_PROTECTION_CONFIG" -> DATA_PROTECTION_CONFIG
    | `String "ACP_RULE_SET_RESPONSE_INSPECTION" -> ACP_RULE_SET_RESPONSE_INSPECTION
    | `String "CUSTOM_KEYS" -> CUSTOM_KEYS
    | `String "SCOPE_DOWN" -> SCOPE_DOWN
    | `String "ASSOCIATED_RESOURCE_TYPE" -> ASSOCIATED_RESOURCE_TYPE
    | `String "ATP_RULE_SET_RESPONSE_INSPECTION" -> ATP_RULE_SET_RESPONSE_INSPECTION
    | `String "TOKEN_DOMAIN" -> TOKEN_DOMAIN
    | `String "CHALLENGE_CONFIG" -> CHALLENGE_CONFIG
    | `String "OVERSIZE_HANDLING" -> OVERSIZE_HANDLING
    | `String "MAP_MATCH_SCOPE" -> MAP_MATCH_SCOPE
    | `String "COOKIE_MATCH_PATTERN" -> COOKIE_MATCH_PATTERN
    | `String "HEADER_MATCH_PATTERN" -> HEADER_MATCH_PATTERN
    | `String "PAYLOAD_TYPE" -> PAYLOAD_TYPE
    | `String "MANAGED_RULE_GROUP_CONFIG" -> MANAGED_RULE_GROUP_CONFIG
    | `String "LOG_DESTINATION" -> LOG_DESTINATION
    | `String "ASSOCIABLE_RESOURCE" -> ASSOCIABLE_RESOURCE
    | `String "CHANGE_PROPAGATION_STATUS" -> CHANGE_PROPAGATION_STATUS
    | `String "EXPIRE_TIMESTAMP" -> EXPIRE_TIMESTAMP
    | `String "FILTER_CONDITION" -> FILTER_CONDITION
    | `String "LOGGING_FILTER" -> LOGGING_FILTER
    | `String "BODY_PARSING_FALLBACK_BEHAVIOR" -> BODY_PARSING_FALLBACK_BEHAVIOR
    | `String "JSON_MATCH_SCOPE" -> JSON_MATCH_SCOPE
    | `String "JSON_MATCH_PATTERN" -> JSON_MATCH_PATTERN
    | `String "CUSTOM_RESPONSE_BODY" -> CUSTOM_RESPONSE_BODY
    | `String "CUSTOM_RESPONSE" -> CUSTOM_RESPONSE
    | `String "RESPONSE_CONTENT_TYPE" -> RESPONSE_CONTENT_TYPE
    | `String "CUSTOM_REQUEST_HANDLING" -> CUSTOM_REQUEST_HANDLING
    | `String "HEADER_NAME" -> HEADER_NAME
    | `String "IP_SET_FORWARDED_IP_CONFIG" -> IP_SET_FORWARDED_IP_CONFIG
    | `String "FORWARDED_IP_CONFIG" -> FORWARDED_IP_CONFIG
    | `String "POSITION" -> POSITION
    | `String "FALLBACK_BEHAVIOR" -> FALLBACK_BEHAVIOR
    | `String "FIREWALL_MANAGER_STATEMENT" -> FIREWALL_MANAGER_STATEMENT
    | `String "METRIC_NAME" -> METRIC_NAME
    | `String "TAG_KEYS" -> TAG_KEYS
    | `String "TAGS" -> TAGS
    | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
    | `String "RESOURCE_ARN" -> RESOURCE_ARN
    | `String "SCOPE_VALUE" -> SCOPE_VALUE
    | `String "OVERRIDE_ACTION" -> OVERRIDE_ACTION
    | `String "ENTITY_LIMIT" -> ENTITY_LIMIT
    | `String "RULE_ACTION" -> RULE_ACTION
    | `String "DEFAULT_ACTION" -> DEFAULT_ACTION
    | `String "SINGLE_HEADER" -> SINGLE_HEADER
    | `String "SINGLE_QUERY_ARGUMENT" -> SINGLE_QUERY_ARGUMENT
    | `String "TEXT_TRANSFORMATION" -> TEXT_TRANSFORMATION
    | `String "FIELD_TO_MATCH" -> FIELD_TO_MATCH
    | `String "IP_ADDRESS_VERSION" -> IP_ADDRESS_VERSION
    | `String "IP_ADDRESS" -> IP_ADDRESS
    | `String "NOT_STATEMENT" -> NOT_STATEMENT
    | `String "OR_STATEMENT" -> OR_STATEMENT
    | `String "AND_STATEMENT" -> AND_STATEMENT
    | `String "LABEL_MATCH_STATEMENT" -> LABEL_MATCH_STATEMENT
    | `String "MANAGED_RULE_SET_STATEMENT" -> MANAGED_RULE_SET_STATEMENT
    | `String "IP_SET_REFERENCE_STATEMENT" -> IP_SET_REFERENCE_STATEMENT
    | `String "REGEX_PATTERN_REFERENCE_STATEMENT" -> REGEX_PATTERN_REFERENCE_STATEMENT
    | `String "RULE_GROUP_REFERENCE_STATEMENT" -> RULE_GROUP_REFERENCE_STATEMENT
    | `String "RATE_BASED_STATEMENT" -> RATE_BASED_STATEMENT
    | `String "GEO_MATCH_STATEMENT" -> GEO_MATCH_STATEMENT
    | `String "SIZE_CONSTRAINT_STATEMENT" -> SIZE_CONSTRAINT_STATEMENT
    | `String "XSS_MATCH_STATEMENT" -> XSS_MATCH_STATEMENT
    | `String "SQLI_MATCH_STATEMENT" -> SQLI_MATCH_STATEMENT
    | `String "BYTE_MATCH_STATEMENT" -> BYTE_MATCH_STATEMENT
    | `String "STATEMENT" -> STATEMENT
    | `String "EXCLUDED_RULE" -> EXCLUDED_RULE
    | `String "RULE" -> RULE
    | `String "MANAGED_RULE_SET" -> MANAGED_RULE_SET
    | `String "IP_SET" -> IP_SET
    | `String "REGEX_PATTERN_SET" -> REGEX_PATTERN_SET
    | `String "RULE_GROUP" -> RULE_GROUP
    | `String "WEB_ACL" -> WEB_ACL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParameterExceptionField" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionField")
     : parameter_exception_field)
    : parameter_exception_field)

let parameter_exception_parameter_of_yojson = string_of_yojson
let error_reason_of_yojson = string_of_yojson

let waf_invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key error_reason_of_yojson "Reason") _list path;
     parameter =
       option_of_yojson
         (value_for_key parameter_exception_parameter_of_yojson "Parameter")
         _list path;
     field = option_of_yojson (value_for_key parameter_exception_field_of_yojson "Field") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : waf_invalid_parameter_exception)

let waf_invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_invalid_operation_exception)

let waf_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_internal_error_exception)

let waf_expired_managed_rule_group_version_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_expired_managed_rule_group_version_exception)

let waf_duplicate_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_duplicate_item_exception)

let waf_configuration_warning_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_configuration_warning_exception)

let waf_associated_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_associated_item_exception)

let time_window_day_of_yojson = int_of_yojson

let version_to_publish_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecasted_lifetime =
       option_of_yojson (value_for_key time_window_day_of_yojson "ForecastedLifetime") _list path;
     associated_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AssociatedRuleGroupArn") _list path;
   }
    : version_to_publish)

let versions_to_publish_of_yojson tree path =
  map_of_yojson version_key_string_of_yojson version_to_publish_of_yojson tree path

let update_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_web_acl_response)

let scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REGIONAL" -> REGIONAL
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Scope" value)
    | _ -> raise (deserialize_wrong_type_error path "Scope")
     : scope)
    : scope)

let update_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : update_web_acl_request)

let update_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_rule_group_response)

let update_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : update_rule_group_request)

let update_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_regex_pattern_set_response)

let update_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     regular_expression_list =
       value_for_key regular_expression_list_of_yojson "RegularExpressionList" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : update_regex_pattern_set_request)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let update_managed_rule_set_version_expiry_date_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
     expiry_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpiryTimestamp") _list path;
     expiring_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ExpiringVersion") _list path;
   }
    : update_managed_rule_set_version_expiry_date_response)

let update_managed_rule_set_version_expiry_date_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry_timestamp = value_for_key timestamp_of_yojson "ExpiryTimestamp" _list path;
     version_to_expire = value_for_key version_key_string_of_yojson "VersionToExpire" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : update_managed_rule_set_version_expiry_date_request)

let update_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_ip_set_response)

let ip_address_of_yojson = string_of_yojson
let ip_addresses_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path

let update_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : update_ip_set_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let uri_string_of_yojson = string_of_yojson

let time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = value_for_key timestamp_of_yojson "EndTime" _list path;
     start_time = value_for_key timestamp_of_yojson "StartTime" _list path;
   }
    : time_window)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let tag_info_for_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_arn_of_yojson "ResourceARN") _list path;
   }
    : tag_info_for_resource)

let solve_timestamp_of_yojson = long_of_yojson
let ip_string_of_yojson = string_of_yojson
let country_of_yojson = string_of_yojson
let http_method_of_yojson = string_of_yojson
let http_version_of_yojson = string_of_yojson
let header_name_of_yojson = string_of_yojson
let header_value_of_yojson = string_of_yojson

let http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key header_value_of_yojson "Value") _list path;
     name = option_of_yojson (value_for_key header_name_of_yojson "Name") _list path;
   }
    : http_header)

let http_headers_of_yojson tree path = list_of_yojson http_header_of_yojson tree path

let http_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     headers = option_of_yojson (value_for_key http_headers_of_yojson "Headers") _list path;
     http_version = option_of_yojson (value_for_key http_version_of_yojson "HTTPVersion") _list path;
     method_ = option_of_yojson (value_for_key http_method_of_yojson "Method") _list path;
     ur_i = option_of_yojson (value_for_key uri_string_of_yojson "URI") _list path;
     country = option_of_yojson (value_for_key country_of_yojson "Country") _list path;
     client_i_p = option_of_yojson (value_for_key ip_string_of_yojson "ClientIP") _list path;
   }
    : http_request)

let sample_weight_of_yojson = long_of_yojson
let action_of_yojson = string_of_yojson
let response_code_of_yojson = int_of_yojson

let failure_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TOKEN_DOMAIN_MISMATCH" -> TOKEN_DOMAIN_MISMATCH
    | `String "TOKEN_INVALID" -> TOKEN_INVALID
    | `String "TOKEN_EXPIRED" -> TOKEN_EXPIRED
    | `String "TOKEN_MISSING" -> TOKEN_MISSING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")
     : failure_reason)
    : failure_reason)

let captcha_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     solve_timestamp =
       option_of_yojson (value_for_key solve_timestamp_of_yojson "SolveTimestamp") _list path;
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
   }
    : captcha_response)

let challenge_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
     solve_timestamp =
       option_of_yojson (value_for_key solve_timestamp_of_yojson "SolveTimestamp") _list path;
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
   }
    : challenge_response)

let sampled_http_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overridden_action =
       option_of_yojson (value_for_key action_of_yojson "OverriddenAction") _list path;
     challenge_response =
       option_of_yojson (value_for_key challenge_response_of_yojson "ChallengeResponse") _list path;
     captcha_response =
       option_of_yojson (value_for_key captcha_response_of_yojson "CaptchaResponse") _list path;
     labels = option_of_yojson (value_for_key labels_of_yojson "Labels") _list path;
     response_code_sent =
       option_of_yojson (value_for_key response_status_code_of_yojson "ResponseCodeSent") _list path;
     request_headers_inserted =
       option_of_yojson (value_for_key http_headers_of_yojson "RequestHeadersInserted") _list path;
     rule_name_within_rule_group =
       option_of_yojson (value_for_key entity_name_of_yojson "RuleNameWithinRuleGroup") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     weight = value_for_key sample_weight_of_yojson "Weight" _list path;
     request = value_for_key http_request_of_yojson "Request" _list path;
   }
    : sampled_http_request)

let sampled_http_requests_of_yojson tree path =
  list_of_yojson sampled_http_request_of_yojson tree path

let rule_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key rule_action_of_yojson "Action") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : rule_summary)

let rule_summaries_of_yojson tree path = list_of_yojson rule_summary_of_yojson tree path

let rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : rule_group_summary)

let rule_group_summaries_of_yojson tree path = list_of_yojson rule_group_summary_of_yojson tree path
let capacity_unit_of_yojson = long_of_yojson

let label_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key label_name_of_yojson "Name") _list path }
    : label_summary)

let label_summaries_of_yojson tree path = list_of_yojson label_summary_of_yojson tree path

let rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "ConsumedLabels") _list path;
     available_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "AvailableLabels") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     capacity = value_for_key capacity_unit_of_yojson "Capacity" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : rule_group)

let resource_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "AMPLIFY" -> AMPLIFY
    | `String "VERIFIED_ACCESS_INSTANCE" -> VERIFIED_ACCESS_INSTANCE
    | `String "APP_RUNNER_SERVICE" -> APP_RUNNER_SERVICE
    | `String "COGNITO_USER_POOL" -> COGNITIO_USER_POOL
    | `String "APPSYNC" -> APPSYNC
    | `String "API_GATEWAY" -> API_GATEWAY
    | `String "APPLICATION_LOAD_BALANCER" -> APPLICATION_LOAD_BALANCER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_arns_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let release_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     release_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ReleaseVersion") _list path;
   }
    : release_summary)

let release_summaries_of_yojson tree path = list_of_yojson release_summary_of_yojson tree path
let release_notes_of_yojson = string_of_yojson

let regex_pattern_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : regex_pattern_set_summary)

let regex_pattern_set_summaries_of_yojson tree path =
  list_of_yojson regex_pattern_set_summary_of_yojson tree path

let regex_pattern_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regular_expression_list =
       option_of_yojson
         (value_for_key regular_expression_list_of_yojson "RegularExpressionList")
         _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : regex_pattern_set)

let redacted_fields_of_yojson tree path = list_of_yojson field_to_match_of_yojson tree path

let ip_address_version_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "IPV6" -> IPV6
    | `String "IPV4" -> IPV4
    | `String value -> raise (deserialize_unknown_enum_value_error path "IPAddressVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "IPAddressVersion")
     : ip_address_version)
    : ip_address_version)

let rate_based_statement_managed_keys_ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "Addresses") _list path;
     ip_address_version =
       option_of_yojson (value_for_key ip_address_version_of_yojson "IPAddressVersion") _list path;
   }
    : rate_based_statement_managed_keys_ip_set)

let put_permission_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let policy_string_of_yojson = string_of_yojson

let put_permission_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key policy_string_of_yojson "Policy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_permission_policy_request)

let put_managed_rule_set_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : put_managed_rule_set_versions_response)

let put_managed_rule_set_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     versions_to_publish =
       option_of_yojson (value_for_key versions_to_publish_of_yojson "VersionsToPublish") _list path;
     recommended_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "RecommendedVersion") _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : put_managed_rule_set_versions_request)

let log_destination_configs_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let filter_behavior_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DROP" -> DROP
    | `String "KEEP" -> KEEP
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterBehavior")
     : filter_behavior)
    : filter_behavior)

let filter_requirement_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "MEETS_ANY" -> MEETS_ANY
    | `String "MEETS_ALL" -> MEETS_ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterRequirement" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterRequirement")
     : filter_requirement)
    : filter_requirement)

let action_value_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EXCLUDED_AS_COUNT" -> EXCLUDED_AS_COUNT
    | `String "CHALLENGE" -> CHALLENGE
    | `String "CAPTCHA" -> CAPTCHA
    | `String "COUNT" -> COUNT
    | `String "BLOCK" -> BLOCK
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionValue")
     : action_value)
    : action_value)

let action_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action = value_for_key action_value_of_yojson "Action" _list path } : action_condition)

let label_name_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label_name = value_for_key label_name_of_yojson "LabelName" _list path }
    : label_name_condition)

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_name_condition =
       option_of_yojson
         (value_for_key label_name_condition_of_yojson "LabelNameCondition")
         _list path;
     action_condition =
       option_of_yojson (value_for_key action_condition_of_yojson "ActionCondition") _list path;
   }
    : condition)

let conditions_of_yojson tree path = list_of_yojson condition_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditions = value_for_key conditions_of_yojson "Conditions" _list path;
     requirement = value_for_key filter_requirement_of_yojson "Requirement" _list path;
     behavior = value_for_key filter_behavior_of_yojson "Behavior" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let logging_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_behavior = value_for_key filter_behavior_of_yojson "DefaultBehavior" _list path;
     filters = value_for_key filters_of_yojson "Filters" _list path;
   }
    : logging_filter)

let log_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "WAF_LOGS" -> WAF_LOGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let log_scope_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SECURITY_LAKE" -> SECURITY_LAKE
    | `String "CUSTOMER" -> CUSTOMER
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogScope" value)
    | _ -> raise (deserialize_wrong_type_error path "LogScope")
     : log_scope)
    : log_scope)

let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     logging_filter =
       option_of_yojson (value_for_key logging_filter_of_yojson "LoggingFilter") _list path;
     managed_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "ManagedByFirewallManager") _list path;
     redacted_fields =
       option_of_yojson (value_for_key redacted_fields_of_yojson "RedactedFields") _list path;
     log_destination_configs =
       value_for_key log_destination_configs_of_yojson "LogDestinationConfigs" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : logging_configuration)

let put_logging_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
   }
    : put_logging_configuration_response)

let put_logging_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logging_configuration =
       value_for_key logging_configuration_of_yojson "LoggingConfiguration" _list path;
   }
    : put_logging_configuration_request)

let managed_rule_set_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpiryTimestamp") _list path;
     last_update_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdateTimestamp") _list path;
     publish_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "PublishTimestamp") _list path;
     forecasted_lifetime =
       option_of_yojson (value_for_key time_window_day_of_yojson "ForecastedLifetime") _list path;
     capacity = option_of_yojson (value_for_key capacity_unit_of_yojson "Capacity") _list path;
     associated_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AssociatedRuleGroupArn") _list path;
   }
    : managed_rule_set_version)

let published_versions_of_yojson tree path =
  map_of_yojson version_key_string_of_yojson managed_rule_set_version_of_yojson tree path

let product_title_of_yojson = string_of_yojson
let product_link_of_yojson = string_of_yojson
let product_id_of_yojson = string_of_yojson
let product_description_of_yojson = string_of_yojson
let population_size_of_yojson = long_of_yojson

let platform_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ANDROID" -> ANDROID
    | `String "IOS" -> IOS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Platform" value)
    | _ -> raise (deserialize_wrong_type_error path "Platform")
     : platform)
    : platform)

let pagination_limit_of_yojson = int_of_yojson
let output_url_of_yojson = string_of_yojson
let next_marker_of_yojson = string_of_yojson

let mobile_sdk_release_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     release_notes =
       option_of_yojson (value_for_key release_notes_of_yojson "ReleaseNotes") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     release_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ReleaseVersion") _list path;
   }
    : mobile_sdk_release)

let managed_rule_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : managed_rule_set_summary)

let managed_rule_set_summaries_of_yojson tree path =
  list_of_yojson managed_rule_set_summary_of_yojson tree path

let managed_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     recommended_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "RecommendedVersion") _list path;
     published_versions =
       option_of_yojson (value_for_key published_versions_of_yojson "PublishedVersions") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : managed_rule_set)

let managed_rule_group_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_update_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdateTimestamp") _list path;
     name = option_of_yojson (value_for_key version_key_string_of_yojson "Name") _list path;
   }
    : managed_rule_group_version)

let managed_rule_group_versions_of_yojson tree path =
  list_of_yojson managed_rule_group_version_of_yojson tree path

let managed_rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     versioning_supported =
       option_of_yojson (value_for_key boolean__of_yojson "VersioningSupported") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
   }
    : managed_rule_group_summary)

let managed_rule_group_summaries_of_yojson tree path =
  list_of_yojson managed_rule_group_summary_of_yojson tree path

let managed_product_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_advanced_managed_rule_set =
       option_of_yojson (value_for_key boolean__of_yojson "IsAdvancedManagedRuleSet") _list path;
     is_versioning_supported =
       option_of_yojson (value_for_key boolean__of_yojson "IsVersioningSupported") _list path;
     sns_topic_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopicArn") _list path;
     product_description =
       option_of_yojson
         (value_for_key product_description_of_yojson "ProductDescription")
         _list path;
     product_title =
       option_of_yojson (value_for_key product_title_of_yojson "ProductTitle") _list path;
     product_link = option_of_yojson (value_for_key product_link_of_yojson "ProductLink") _list path;
     product_id = option_of_yojson (value_for_key product_id_of_yojson "ProductId") _list path;
     managed_rule_set_name =
       option_of_yojson (value_for_key entity_name_of_yojson "ManagedRuleSetName") _list path;
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
   }
    : managed_product_descriptor)

let managed_product_descriptors_of_yojson tree path =
  list_of_yojson managed_product_descriptor_of_yojson tree path

let logging_configurations_of_yojson tree path =
  list_of_yojson logging_configuration_of_yojson tree path

let list_web_ac_ls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_ac_ls = option_of_yojson (value_for_key web_acl_summaries_of_yojson "WebACLs") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_web_ac_ls_response)

let list_web_ac_ls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_web_ac_ls_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_info_for_resource =
       option_of_yojson
         (value_for_key tag_info_for_resource_of_yojson "TagInfoForResource")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_tags_for_resource_request)

let list_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_groups =
       option_of_yojson (value_for_key rule_group_summaries_of_yojson "RuleGroups") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_rule_groups_response)

let list_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_rule_groups_request)

let list_resources_for_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "ResourceArns") _list path;
   }
    : list_resources_for_web_acl_response)

let list_resources_for_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
   }
    : list_resources_for_web_acl_request)

let list_regex_pattern_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_sets =
       option_of_yojson
         (value_for_key regex_pattern_set_summaries_of_yojson "RegexPatternSets")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_regex_pattern_sets_response)

let list_regex_pattern_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_regex_pattern_sets_request)

let list_mobile_sdk_releases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     release_summaries =
       option_of_yojson (value_for_key release_summaries_of_yojson "ReleaseSummaries") _list path;
   }
    : list_mobile_sdk_releases_response)

let list_mobile_sdk_releases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     platform = value_for_key platform_of_yojson "Platform" _list path;
   }
    : list_mobile_sdk_releases_request)

let list_max_items_of_yojson = long_of_yojson

let list_managed_rule_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_rule_sets =
       option_of_yojson
         (value_for_key managed_rule_set_summaries_of_yojson "ManagedRuleSets")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_managed_rule_sets_response)

let list_managed_rule_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_managed_rule_sets_request)

let list_logging_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     logging_configurations =
       option_of_yojson
         (value_for_key logging_configurations_of_yojson "LoggingConfigurations")
         _list path;
   }
    : list_logging_configurations_response)

let list_logging_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_logging_configurations_request)

let ip_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : ip_set_summary)

let ip_set_summaries_of_yojson tree path = list_of_yojson ip_set_summary_of_yojson tree path

let list_ip_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_sets = option_of_yojson (value_for_key ip_set_summaries_of_yojson "IPSets") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_ip_sets_response)

let list_ip_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_ip_sets_request)

let list_available_managed_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_rule_groups =
       option_of_yojson
         (value_for_key managed_rule_group_summaries_of_yojson "ManagedRuleGroups")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_available_managed_rule_groups_response)

let list_available_managed_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_available_managed_rule_groups_request)

let list_available_managed_rule_group_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     current_default_version =
       option_of_yojson
         (value_for_key version_key_string_of_yojson "CurrentDefaultVersion")
         _list path;
     versions =
       option_of_yojson (value_for_key managed_rule_group_versions_of_yojson "Versions") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_available_managed_rule_group_versions_response)

let list_available_managed_rule_group_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
   }
    : list_available_managed_rule_group_versions_request)

let api_key_of_yojson = string_of_yojson
let api_key_version_of_yojson = int_of_yojson

let api_key_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key api_key_version_of_yojson "Version") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimestamp") _list path;
     api_key = option_of_yojson (value_for_key api_key_of_yojson "APIKey") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
   }
    : api_key_summary)

let api_key_summaries_of_yojson tree path = list_of_yojson api_key_summary_of_yojson tree path

let list_api_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_integration_ur_l =
       option_of_yojson (value_for_key output_url_of_yojson "ApplicationIntegrationURL") _list path;
     api_key_summaries =
       option_of_yojson (value_for_key api_key_summaries_of_yojson "APIKeySummaries") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_api_keys_response)

let list_api_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : list_api_keys_request)

let ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
     ip_address_version = value_for_key ip_address_version_of_yojson "IPAddressVersion" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : ip_set)

let get_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_integration_ur_l =
       option_of_yojson (value_for_key output_url_of_yojson "ApplicationIntegrationURL") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path;
   }
    : get_web_acl_response)

let get_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : get_web_acl_request)

let get_web_acl_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path }
    : get_web_acl_for_resource_response)

let get_web_acl_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_web_acl_for_resource_request)

let get_sampled_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_window = option_of_yojson (value_for_key time_window_of_yojson "TimeWindow") _list path;
     population_size =
       option_of_yojson (value_for_key population_size_of_yojson "PopulationSize") _list path;
     sampled_requests =
       option_of_yojson (value_for_key sampled_http_requests_of_yojson "SampledRequests") _list path;
   }
    : get_sampled_requests_response)

let get_sampled_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_items = value_for_key list_max_items_of_yojson "MaxItems" _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     rule_metric_name = value_for_key metric_name_of_yojson "RuleMetricName" _list path;
     web_acl_arn = value_for_key resource_arn_of_yojson "WebAclArn" _list path;
   }
    : get_sampled_requests_request)

let get_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
   }
    : get_rule_group_response)

let get_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
   }
    : get_rule_group_request)

let get_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     regex_pattern_set =
       option_of_yojson (value_for_key regex_pattern_set_of_yojson "RegexPatternSet") _list path;
   }
    : get_regex_pattern_set_response)

let get_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : get_regex_pattern_set_request)

let get_rate_based_statement_managed_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_keys_ip_v6 =
       option_of_yojson
         (value_for_key rate_based_statement_managed_keys_ip_set_of_yojson "ManagedKeysIPV6")
         _list path;
     managed_keys_ip_v4 =
       option_of_yojson
         (value_for_key rate_based_statement_managed_keys_ip_set_of_yojson "ManagedKeysIPV4")
         _list path;
   }
    : get_rate_based_statement_managed_keys_response)

let get_rate_based_statement_managed_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_name = value_for_key entity_name_of_yojson "RuleName" _list path;
     rule_group_rule_name =
       option_of_yojson (value_for_key entity_name_of_yojson "RuleGroupRuleName") _list path;
     web_acl_id = value_for_key entity_id_of_yojson "WebACLId" _list path;
     web_acl_name = value_for_key entity_name_of_yojson "WebACLName" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : get_rate_based_statement_managed_keys_request)

let get_permission_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_string_of_yojson "Policy") _list path }
    : get_permission_policy_response)

let get_permission_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_permission_policy_request)

let get_mobile_sdk_release_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mobile_sdk_release =
       option_of_yojson (value_for_key mobile_sdk_release_of_yojson "MobileSdkRelease") _list path;
   }
    : get_mobile_sdk_release_response)

let get_mobile_sdk_release_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     release_version = value_for_key version_key_string_of_yojson "ReleaseVersion" _list path;
     platform = value_for_key platform_of_yojson "Platform" _list path;
   }
    : get_mobile_sdk_release_request)

let get_managed_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     managed_rule_set =
       option_of_yojson (value_for_key managed_rule_set_of_yojson "ManagedRuleSet") _list path;
   }
    : get_managed_rule_set_response)

let get_managed_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : get_managed_rule_set_request)

let get_logging_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logging_configuration =
       option_of_yojson
         (value_for_key logging_configuration_of_yojson "LoggingConfiguration")
         _list path;
   }
    : get_logging_configuration_response)

let get_logging_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : get_logging_configuration_request)

let get_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ip_set = option_of_yojson (value_for_key ip_set_of_yojson "IPSet") _list path;
   }
    : get_ip_set_response)

let get_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : get_ip_set_request)

let get_decrypted_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimestamp") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
   }
    : get_decrypted_api_key_response)

let get_decrypted_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_key = value_for_key api_key_of_yojson "APIKey" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : get_decrypted_api_key_request)

let download_url_of_yojson = string_of_yojson

let generate_mobile_sdk_release_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ url = option_of_yojson (value_for_key download_url_of_yojson "Url") _list path }
    : generate_mobile_sdk_release_url_response)

let generate_mobile_sdk_release_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     release_version = value_for_key version_key_string_of_yojson "ReleaseVersion" _list path;
     platform = value_for_key platform_of_yojson "Platform" _list path;
   }
    : generate_mobile_sdk_release_url_request)

let disassociate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : disassociate_web_acl_request)

let describe_managed_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     consumed_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "ConsumedLabels") _list path;
     available_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "AvailableLabels") _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     rules = option_of_yojson (value_for_key rule_summaries_of_yojson "Rules") _list path;
     capacity = option_of_yojson (value_for_key capacity_unit_of_yojson "Capacity") _list path;
     sns_topic_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopicArn") _list path;
     version_name =
       option_of_yojson (value_for_key version_key_string_of_yojson "VersionName") _list path;
   }
    : describe_managed_rule_group_response)

let describe_managed_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_name =
       option_of_yojson (value_for_key version_key_string_of_yojson "VersionName") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
   }
    : describe_managed_rule_group_request)

let describe_managed_products_by_vendor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_products =
       option_of_yojson
         (value_for_key managed_product_descriptors_of_yojson "ManagedProducts")
         _list path;
   }
    : describe_managed_products_by_vendor_response)

let describe_managed_products_by_vendor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
   }
    : describe_managed_products_by_vendor_request)

let describe_all_managed_products_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_products =
       option_of_yojson
         (value_for_key managed_product_descriptors_of_yojson "ManagedProducts")
         _list path;
   }
    : describe_all_managed_products_response)

let describe_all_managed_products_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ scope = value_for_key scope_of_yojson "Scope" _list path }
    : describe_all_managed_products_request)

let delete_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : delete_web_acl_request)

let delete_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : delete_rule_group_request)

let delete_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : delete_regex_pattern_set_request)

let delete_permission_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_permission_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_permission_policy_request)

let delete_logging_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_logging_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : delete_logging_configuration_request)

let delete_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : delete_ip_set_request)

let delete_firewall_manager_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_web_acl_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextWebACLLockToken") _list path;
   }
    : delete_firewall_manager_rule_groups_response)

let delete_firewall_manager_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_lock_token = value_for_key lock_token_of_yojson "WebACLLockToken" _list path;
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
   }
    : delete_firewall_manager_rule_groups_request)

let delete_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_key = value_for_key api_key_of_yojson "APIKey" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : delete_api_key_request)

let create_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key web_acl_summary_of_yojson "Summary") _list path }
    : create_web_acl_response)

let create_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_config =
       option_of_yojson (value_for_key application_config_of_yojson "ApplicationConfig") _list path;
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : create_web_acl_request)

let create_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key rule_group_summary_of_yojson "Summary") _list path }
    : create_rule_group_response)

let create_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     capacity = value_for_key capacity_unit_of_yojson "Capacity" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : create_rule_group_request)

let create_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary =
       option_of_yojson (value_for_key regex_pattern_set_summary_of_yojson "Summary") _list path;
   }
    : create_regex_pattern_set_response)

let create_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     regular_expression_list =
       value_for_key regular_expression_list_of_yojson "RegularExpressionList" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : create_regex_pattern_set_request)

let create_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key ip_set_summary_of_yojson "Summary") _list path }
    : create_ip_set_response)

let create_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
     ip_address_version = value_for_key ip_address_version_of_yojson "IPAddressVersion" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
   }
    : create_ip_set_request)

let create_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ api_key = option_of_yojson (value_for_key api_key_of_yojson "APIKey") _list path }
    : create_api_key_response)

let api_key_token_domains_of_yojson tree path = list_of_yojson token_domain_of_yojson tree path

let create_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_domains = value_for_key api_key_token_domains_of_yojson "TokenDomains" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : create_api_key_request)

let check_capacity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capacity = option_of_yojson (value_for_key consumed_capacity_of_yojson "Capacity") _list path }
    : check_capacity_response)

let check_capacity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules = value_for_key rules_of_yojson "Rules" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : check_capacity_request)

let associate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
   }
    : associate_web_acl_request)
