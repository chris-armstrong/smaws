open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let waf_stale_data_exception_to_yojson (x : waf_stale_data_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_nonexistent_item_exception_to_yojson (x : waf_nonexistent_item_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_nonexistent_container_exception_to_yojson (x : waf_nonexistent_container_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_limits_exceeded_exception_to_yojson (x : waf_limits_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let parameter_exception_reason_to_yojson (x : parameter_exception_reason) =
  match x with
  | INVALID_OPTION -> `String "INVALID_OPTION"
  | ILLEGAL_COMBINATION -> `String "ILLEGAL_COMBINATION"
  | ILLEGAL_ARGUMENT -> `String "ILLEGAL_ARGUMENT"
  | INVALID_TAG_KEY -> `String "INVALID_TAG_KEY"

let parameter_exception_parameter_to_yojson = string_to_yojson

let parameter_exception_field_to_yojson (x : parameter_exception_field) =
  match x with
  | CHANGE_ACTION -> `String "CHANGE_ACTION"
  | WAF_ACTION -> `String "WAF_ACTION"
  | WAF_OVERRIDE_ACTION -> `String "WAF_OVERRIDE_ACTION"
  | PREDICATE_TYPE -> `String "PREDICATE_TYPE"
  | IPSET_TYPE -> `String "IPSET_TYPE"
  | BYTE_MATCH_FIELD_TYPE -> `String "BYTE_MATCH_FIELD_TYPE"
  | SQL_INJECTION_MATCH_FIELD_TYPE -> `String "SQL_INJECTION_MATCH_FIELD_TYPE"
  | BYTE_MATCH_TEXT_TRANSFORMATION -> `String "BYTE_MATCH_TEXT_TRANSFORMATION"
  | BYTE_MATCH_POSITIONAL_CONSTRAINT -> `String "BYTE_MATCH_POSITIONAL_CONSTRAINT"
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR -> `String "SIZE_CONSTRAINT_COMPARISON_OPERATOR"
  | GEO_MATCH_LOCATION_TYPE -> `String "GEO_MATCH_LOCATION_TYPE"
  | GEO_MATCH_LOCATION_VALUE -> `String "GEO_MATCH_LOCATION_VALUE"
  | RATE_KEY -> `String "RATE_KEY"
  | RULE_TYPE -> `String "RULE_TYPE"
  | NEXT_MARKER -> `String "NEXT_MARKER"
  | RESOURCE_ARN -> `String "RESOURCE_ARN"
  | TAGS -> `String "TAGS"
  | TAG_KEYS -> `String "TAG_KEYS"

let waf_invalid_parameter_exception_to_yojson (x : waf_invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("field", option_to_yojson parameter_exception_field_to_yojson x.field);
      ("parameter", option_to_yojson parameter_exception_parameter_to_yojson x.parameter);
      ("reason", option_to_yojson parameter_exception_reason_to_yojson x.reason);
    ]

let waf_invalid_operation_exception_to_yojson (x : waf_invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_invalid_account_exception_to_yojson = unit_to_yojson

let waf_internal_error_exception_to_yojson (x : waf_internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let change_token_to_yojson = string_to_yojson

let update_xss_match_set_response_to_yojson (x : update_xss_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let text_transformation_to_yojson (x : text_transformation) =
  match x with
  | NONE -> `String "NONE"
  | COMPRESS_WHITE_SPACE -> `String "COMPRESS_WHITE_SPACE"
  | HTML_ENTITY_DECODE -> `String "HTML_ENTITY_DECODE"
  | LOWERCASE -> `String "LOWERCASE"
  | CMD_LINE -> `String "CMD_LINE"
  | URL_DECODE -> `String "URL_DECODE"

let match_field_data_to_yojson = string_to_yojson

let match_field_type_to_yojson (x : match_field_type) =
  match x with
  | URI -> `String "URI"
  | QUERY_STRING -> `String "QUERY_STRING"
  | HEADER -> `String "HEADER"
  | METHOD -> `String "METHOD"
  | BODY -> `String "BODY"
  | SINGLE_QUERY_ARG -> `String "SINGLE_QUERY_ARG"
  | ALL_QUERY_ARGS -> `String "ALL_QUERY_ARGS"

let field_to_match_to_yojson (x : field_to_match) =
  assoc_to_yojson
    [
      ("Type", Some (match_field_type_to_yojson x.type_));
      ("Data", option_to_yojson match_field_data_to_yojson x.data);
    ]

let xss_match_tuple_to_yojson (x : xss_match_tuple) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformation", Some (text_transformation_to_yojson x.text_transformation));
    ]

let change_action_to_yojson (x : change_action) =
  match x with INSERT -> `String "INSERT" | DELETE -> `String "DELETE"

let xss_match_set_update_to_yojson (x : xss_match_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("XssMatchTuple", Some (xss_match_tuple_to_yojson x.xss_match_tuple));
    ]

let xss_match_set_updates_to_yojson tree = list_to_yojson xss_match_set_update_to_yojson tree
let resource_id_to_yojson = string_to_yojson

let update_xss_match_set_request_to_yojson (x : update_xss_match_set_request) =
  assoc_to_yojson
    [
      ("XssMatchSetId", Some (resource_id_to_yojson x.xss_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (xss_match_set_updates_to_yojson x.updates));
    ]

let waf_subscription_not_found_exception_to_yojson (x : waf_subscription_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_referenced_item_exception_to_yojson (x : waf_referenced_item_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_web_acl_response_to_yojson (x : update_web_acl_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let waf_action_type_to_yojson (x : waf_action_type) =
  match x with BLOCK -> `String "BLOCK" | ALLOW -> `String "ALLOW" | COUNT -> `String "COUNT"

let waf_action_to_yojson (x : waf_action) =
  assoc_to_yojson [ ("Type", Some (waf_action_type_to_yojson x.type_)) ]

let excluded_rule_to_yojson (x : excluded_rule) =
  assoc_to_yojson [ ("RuleId", Some (resource_id_to_yojson x.rule_id)) ]

let excluded_rules_to_yojson tree = list_to_yojson excluded_rule_to_yojson tree

let waf_rule_type_to_yojson (x : waf_rule_type) =
  match x with
  | REGULAR -> `String "REGULAR"
  | RATE_BASED -> `String "RATE_BASED"
  | GROUP -> `String "GROUP"

let waf_override_action_type_to_yojson (x : waf_override_action_type) =
  match x with NONE -> `String "NONE" | COUNT -> `String "COUNT"

let waf_override_action_to_yojson (x : waf_override_action) =
  assoc_to_yojson [ ("Type", Some (waf_override_action_type_to_yojson x.type_)) ]

let rule_priority_to_yojson = int_to_yojson

let activated_rule_to_yojson (x : activated_rule) =
  assoc_to_yojson
    [
      ("Priority", Some (rule_priority_to_yojson x.priority));
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("Action", option_to_yojson waf_action_to_yojson x.action);
      ("OverrideAction", option_to_yojson waf_override_action_to_yojson x.override_action);
      ("Type", option_to_yojson waf_rule_type_to_yojson x.type_);
      ("ExcludedRules", option_to_yojson excluded_rules_to_yojson x.excluded_rules);
    ]

let web_acl_update_to_yojson (x : web_acl_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("ActivatedRule", Some (activated_rule_to_yojson x.activated_rule));
    ]

let web_acl_updates_to_yojson tree = list_to_yojson web_acl_update_to_yojson tree

let update_web_acl_request_to_yojson (x : update_web_acl_request) =
  assoc_to_yojson
    [
      ("WebACLId", Some (resource_id_to_yojson x.web_acl_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", option_to_yojson web_acl_updates_to_yojson x.updates);
      ("DefaultAction", option_to_yojson waf_action_to_yojson x.default_action);
    ]

let update_sql_injection_match_set_response_to_yojson (x : update_sql_injection_match_set_response)
    =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let sql_injection_match_tuple_to_yojson (x : sql_injection_match_tuple) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformation", Some (text_transformation_to_yojson x.text_transformation));
    ]

let sql_injection_match_set_update_to_yojson (x : sql_injection_match_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ( "SqlInjectionMatchTuple",
        Some (sql_injection_match_tuple_to_yojson x.sql_injection_match_tuple) );
    ]

let sql_injection_match_set_updates_to_yojson tree =
  list_to_yojson sql_injection_match_set_update_to_yojson tree

let update_sql_injection_match_set_request_to_yojson (x : update_sql_injection_match_set_request) =
  assoc_to_yojson
    [
      ("SqlInjectionMatchSetId", Some (resource_id_to_yojson x.sql_injection_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (sql_injection_match_set_updates_to_yojson x.updates));
    ]

let update_size_constraint_set_response_to_yojson (x : update_size_constraint_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let size_to_yojson = long_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | EQ -> `String "EQ"
  | NE -> `String "NE"
  | LE -> `String "LE"
  | LT -> `String "LT"
  | GE -> `String "GE"
  | GT -> `String "GT"

let size_constraint_to_yojson (x : size_constraint) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformation", Some (text_transformation_to_yojson x.text_transformation));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("Size", Some (size_to_yojson x.size));
    ]

let size_constraint_set_update_to_yojson (x : size_constraint_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("SizeConstraint", Some (size_constraint_to_yojson x.size_constraint));
    ]

let size_constraint_set_updates_to_yojson tree =
  list_to_yojson size_constraint_set_update_to_yojson tree

let update_size_constraint_set_request_to_yojson (x : update_size_constraint_set_request) =
  assoc_to_yojson
    [
      ("SizeConstraintSetId", Some (resource_id_to_yojson x.size_constraint_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (size_constraint_set_updates_to_yojson x.updates));
    ]

let update_rule_group_response_to_yojson (x : update_rule_group_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let rule_group_update_to_yojson (x : rule_group_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("ActivatedRule", Some (activated_rule_to_yojson x.activated_rule));
    ]

let rule_group_updates_to_yojson tree = list_to_yojson rule_group_update_to_yojson tree

let update_rule_group_request_to_yojson (x : update_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("Updates", Some (rule_group_updates_to_yojson x.updates));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let update_rule_response_to_yojson (x : update_rule_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let predicate_type_to_yojson (x : predicate_type) =
  match x with
  | IP_MATCH -> `String "IPMatch"
  | BYTE_MATCH -> `String "ByteMatch"
  | SQL_INJECTION_MATCH -> `String "SqlInjectionMatch"
  | GEO_MATCH -> `String "GeoMatch"
  | SIZE_CONSTRAINT -> `String "SizeConstraint"
  | XSS_MATCH -> `String "XssMatch"
  | REGEX_MATCH -> `String "RegexMatch"

let negated_to_yojson = bool_to_yojson

let predicate_to_yojson (x : predicate) =
  assoc_to_yojson
    [
      ("Negated", Some (negated_to_yojson x.negated));
      ("Type", Some (predicate_type_to_yojson x.type_));
      ("DataId", Some (resource_id_to_yojson x.data_id));
    ]

let rule_update_to_yojson (x : rule_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("Predicate", Some (predicate_to_yojson x.predicate));
    ]

let rule_updates_to_yojson tree = list_to_yojson rule_update_to_yojson tree

let update_rule_request_to_yojson (x : update_rule_request) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (rule_updates_to_yojson x.updates));
    ]

let waf_invalid_regex_pattern_exception_to_yojson (x : waf_invalid_regex_pattern_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_regex_pattern_set_response_to_yojson (x : update_regex_pattern_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let regex_pattern_string_to_yojson = string_to_yojson

let regex_pattern_set_update_to_yojson (x : regex_pattern_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("RegexPatternString", Some (regex_pattern_string_to_yojson x.regex_pattern_string));
    ]

let regex_pattern_set_updates_to_yojson tree =
  list_to_yojson regex_pattern_set_update_to_yojson tree

let update_regex_pattern_set_request_to_yojson (x : update_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id));
      ("Updates", Some (regex_pattern_set_updates_to_yojson x.updates));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let waf_disallowed_name_exception_to_yojson (x : waf_disallowed_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_regex_match_set_response_to_yojson (x : update_regex_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let regex_match_tuple_to_yojson (x : regex_match_tuple) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformation", Some (text_transformation_to_yojson x.text_transformation));
      ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id));
    ]

let regex_match_set_update_to_yojson (x : regex_match_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("RegexMatchTuple", Some (regex_match_tuple_to_yojson x.regex_match_tuple));
    ]

let regex_match_set_updates_to_yojson tree = list_to_yojson regex_match_set_update_to_yojson tree

let update_regex_match_set_request_to_yojson (x : update_regex_match_set_request) =
  assoc_to_yojson
    [
      ("RegexMatchSetId", Some (resource_id_to_yojson x.regex_match_set_id));
      ("Updates", Some (regex_match_set_updates_to_yojson x.updates));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let update_rate_based_rule_response_to_yojson (x : update_rate_based_rule_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let rate_limit_to_yojson = long_to_yojson

let update_rate_based_rule_request_to_yojson (x : update_rate_based_rule_request) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (rule_updates_to_yojson x.updates));
      ("RateLimit", Some (rate_limit_to_yojson x.rate_limit));
    ]

let update_ip_set_response_to_yojson (x : update_ip_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let ip_set_descriptor_value_to_yojson = string_to_yojson

let ip_set_descriptor_type_to_yojson (x : ip_set_descriptor_type) =
  match x with IPV4 -> `String "IPV4" | IPV6 -> `String "IPV6"

let ip_set_descriptor_to_yojson (x : ip_set_descriptor) =
  assoc_to_yojson
    [
      ("Type", Some (ip_set_descriptor_type_to_yojson x.type_));
      ("Value", Some (ip_set_descriptor_value_to_yojson x.value));
    ]

let ip_set_update_to_yojson (x : ip_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("IPSetDescriptor", Some (ip_set_descriptor_to_yojson x.ip_set_descriptor));
    ]

let ip_set_updates_to_yojson tree = list_to_yojson ip_set_update_to_yojson tree

let update_ip_set_request_to_yojson (x : update_ip_set_request) =
  assoc_to_yojson
    [
      ("IPSetId", Some (resource_id_to_yojson x.ip_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (ip_set_updates_to_yojson x.updates));
    ]

let update_geo_match_set_response_to_yojson (x : update_geo_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let geo_match_constraint_value_to_yojson (x : geo_match_constraint_value) =
  match x with
  | AF -> `String "AF"
  | AX -> `String "AX"
  | AL -> `String "AL"
  | DZ -> `String "DZ"
  | AS -> `String "AS"
  | AD -> `String "AD"
  | AO -> `String "AO"
  | AI -> `String "AI"
  | AQ -> `String "AQ"
  | AG -> `String "AG"
  | AR -> `String "AR"
  | AM -> `String "AM"
  | AW -> `String "AW"
  | AU -> `String "AU"
  | AT -> `String "AT"
  | AZ -> `String "AZ"
  | BS -> `String "BS"
  | BH -> `String "BH"
  | BD -> `String "BD"
  | BB -> `String "BB"
  | BY -> `String "BY"
  | BE -> `String "BE"
  | BZ -> `String "BZ"
  | BJ -> `String "BJ"
  | BM -> `String "BM"
  | BT -> `String "BT"
  | BO -> `String "BO"
  | BQ -> `String "BQ"
  | BA -> `String "BA"
  | BW -> `String "BW"
  | BV -> `String "BV"
  | BR -> `String "BR"
  | IO -> `String "IO"
  | BN -> `String "BN"
  | BG -> `String "BG"
  | BF -> `String "BF"
  | BI -> `String "BI"
  | KH -> `String "KH"
  | CM -> `String "CM"
  | CA -> `String "CA"
  | CV -> `String "CV"
  | KY -> `String "KY"
  | CF -> `String "CF"
  | TD -> `String "TD"
  | CL -> `String "CL"
  | CN -> `String "CN"
  | CX -> `String "CX"
  | CC -> `String "CC"
  | CO -> `String "CO"
  | KM -> `String "KM"
  | CG -> `String "CG"
  | CD -> `String "CD"
  | CK -> `String "CK"
  | CR -> `String "CR"
  | CI -> `String "CI"
  | HR -> `String "HR"
  | CU -> `String "CU"
  | CW -> `String "CW"
  | CY -> `String "CY"
  | CZ -> `String "CZ"
  | DK -> `String "DK"
  | DJ -> `String "DJ"
  | DM -> `String "DM"
  | DO -> `String "DO"
  | EC -> `String "EC"
  | EG -> `String "EG"
  | SV -> `String "SV"
  | GQ -> `String "GQ"
  | ER -> `String "ER"
  | EE -> `String "EE"
  | ET -> `String "ET"
  | FK -> `String "FK"
  | FO -> `String "FO"
  | FJ -> `String "FJ"
  | FI -> `String "FI"
  | FR -> `String "FR"
  | GF -> `String "GF"
  | PF -> `String "PF"
  | TF -> `String "TF"
  | GA -> `String "GA"
  | GM -> `String "GM"
  | GE -> `String "GE"
  | DE -> `String "DE"
  | GH -> `String "GH"
  | GI -> `String "GI"
  | GR -> `String "GR"
  | GL -> `String "GL"
  | GD -> `String "GD"
  | GP -> `String "GP"
  | GU -> `String "GU"
  | GT -> `String "GT"
  | GG -> `String "GG"
  | GN -> `String "GN"
  | GW -> `String "GW"
  | GY -> `String "GY"
  | HT -> `String "HT"
  | HM -> `String "HM"
  | VA -> `String "VA"
  | HN -> `String "HN"
  | HK -> `String "HK"
  | HU -> `String "HU"
  | IS -> `String "IS"
  | IN -> `String "IN"
  | ID -> `String "ID"
  | IR -> `String "IR"
  | IQ -> `String "IQ"
  | IE -> `String "IE"
  | IM -> `String "IM"
  | IL -> `String "IL"
  | IT -> `String "IT"
  | JM -> `String "JM"
  | JP -> `String "JP"
  | JE -> `String "JE"
  | JO -> `String "JO"
  | KZ -> `String "KZ"
  | KE -> `String "KE"
  | KI -> `String "KI"
  | KP -> `String "KP"
  | KR -> `String "KR"
  | KW -> `String "KW"
  | KG -> `String "KG"
  | LA -> `String "LA"
  | LV -> `String "LV"
  | LB -> `String "LB"
  | LS -> `String "LS"
  | LR -> `String "LR"
  | LY -> `String "LY"
  | LI -> `String "LI"
  | LT -> `String "LT"
  | LU -> `String "LU"
  | MO -> `String "MO"
  | MK -> `String "MK"
  | MG -> `String "MG"
  | MW -> `String "MW"
  | MY -> `String "MY"
  | MV -> `String "MV"
  | ML -> `String "ML"
  | MT -> `String "MT"
  | MH -> `String "MH"
  | MQ -> `String "MQ"
  | MR -> `String "MR"
  | MU -> `String "MU"
  | YT -> `String "YT"
  | MX -> `String "MX"
  | FM -> `String "FM"
  | MD -> `String "MD"
  | MC -> `String "MC"
  | MN -> `String "MN"
  | ME -> `String "ME"
  | MS -> `String "MS"
  | MA -> `String "MA"
  | MZ -> `String "MZ"
  | MM -> `String "MM"
  | NA -> `String "NA"
  | NR -> `String "NR"
  | NP -> `String "NP"
  | NL -> `String "NL"
  | NC -> `String "NC"
  | NZ -> `String "NZ"
  | NI -> `String "NI"
  | NE -> `String "NE"
  | NG -> `String "NG"
  | NU -> `String "NU"
  | NF -> `String "NF"
  | MP -> `String "MP"
  | NO -> `String "NO"
  | OM -> `String "OM"
  | PK -> `String "PK"
  | PW -> `String "PW"
  | PS -> `String "PS"
  | PA -> `String "PA"
  | PG -> `String "PG"
  | PY -> `String "PY"
  | PE -> `String "PE"
  | PH -> `String "PH"
  | PN -> `String "PN"
  | PL -> `String "PL"
  | PT -> `String "PT"
  | PR -> `String "PR"
  | QA -> `String "QA"
  | RE -> `String "RE"
  | RO -> `String "RO"
  | RU -> `String "RU"
  | RW -> `String "RW"
  | BL -> `String "BL"
  | SH -> `String "SH"
  | KN -> `String "KN"
  | LC -> `String "LC"
  | MF -> `String "MF"
  | PM -> `String "PM"
  | VC -> `String "VC"
  | WS -> `String "WS"
  | SM -> `String "SM"
  | ST -> `String "ST"
  | SA -> `String "SA"
  | SN -> `String "SN"
  | RS -> `String "RS"
  | SC -> `String "SC"
  | SL -> `String "SL"
  | SG -> `String "SG"
  | SX -> `String "SX"
  | SK -> `String "SK"
  | SI -> `String "SI"
  | SB -> `String "SB"
  | SO -> `String "SO"
  | ZA -> `String "ZA"
  | GS -> `String "GS"
  | SS -> `String "SS"
  | ES -> `String "ES"
  | LK -> `String "LK"
  | SD -> `String "SD"
  | SR -> `String "SR"
  | SJ -> `String "SJ"
  | SZ -> `String "SZ"
  | SE -> `String "SE"
  | CH -> `String "CH"
  | SY -> `String "SY"
  | TW -> `String "TW"
  | TJ -> `String "TJ"
  | TZ -> `String "TZ"
  | TH -> `String "TH"
  | TL -> `String "TL"
  | TG -> `String "TG"
  | TK -> `String "TK"
  | TO -> `String "TO"
  | TT -> `String "TT"
  | TN -> `String "TN"
  | TR -> `String "TR"
  | TM -> `String "TM"
  | TC -> `String "TC"
  | TV -> `String "TV"
  | UG -> `String "UG"
  | UA -> `String "UA"
  | AE -> `String "AE"
  | GB -> `String "GB"
  | US -> `String "US"
  | UM -> `String "UM"
  | UY -> `String "UY"
  | UZ -> `String "UZ"
  | VU -> `String "VU"
  | VE -> `String "VE"
  | VN -> `String "VN"
  | VG -> `String "VG"
  | VI -> `String "VI"
  | WF -> `String "WF"
  | EH -> `String "EH"
  | YE -> `String "YE"
  | ZM -> `String "ZM"
  | ZW -> `String "ZW"

let geo_match_constraint_type_to_yojson (x : geo_match_constraint_type) =
  match x with Country -> `String "Country"

let geo_match_constraint_to_yojson (x : geo_match_constraint) =
  assoc_to_yojson
    [
      ("Type", Some (geo_match_constraint_type_to_yojson x.type_));
      ("Value", Some (geo_match_constraint_value_to_yojson x.value));
    ]

let geo_match_set_update_to_yojson (x : geo_match_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("GeoMatchConstraint", Some (geo_match_constraint_to_yojson x.geo_match_constraint));
    ]

let geo_match_set_updates_to_yojson tree = list_to_yojson geo_match_set_update_to_yojson tree

let update_geo_match_set_request_to_yojson (x : update_geo_match_set_request) =
  assoc_to_yojson
    [
      ("GeoMatchSetId", Some (resource_id_to_yojson x.geo_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (geo_match_set_updates_to_yojson x.updates));
    ]

let update_byte_match_set_response_to_yojson (x : update_byte_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let positional_constraint_to_yojson (x : positional_constraint) =
  match x with
  | EXACTLY -> `String "EXACTLY"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"
  | CONTAINS_WORD -> `String "CONTAINS_WORD"

let byte_match_target_string_to_yojson = blob_to_yojson

let byte_match_tuple_to_yojson (x : byte_match_tuple) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TargetString", Some (byte_match_target_string_to_yojson x.target_string));
      ("TextTransformation", Some (text_transformation_to_yojson x.text_transformation));
      ("PositionalConstraint", Some (positional_constraint_to_yojson x.positional_constraint));
    ]

let byte_match_set_update_to_yojson (x : byte_match_set_update) =
  assoc_to_yojson
    [
      ("Action", Some (change_action_to_yojson x.action));
      ("ByteMatchTuple", Some (byte_match_tuple_to_yojson x.byte_match_tuple));
    ]

let byte_match_set_updates_to_yojson tree = list_to_yojson byte_match_set_update_to_yojson tree

let update_byte_match_set_request_to_yojson (x : update_byte_match_set_request) =
  assoc_to_yojson
    [
      ("ByteMatchSetId", Some (resource_id_to_yojson x.byte_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Updates", Some (byte_match_set_updates_to_yojson x.updates));
    ]

let waf_tag_operation_internal_error_exception_to_yojson
    (x : waf_tag_operation_internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_tag_operation_exception_to_yojson (x : waf_tag_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_bad_request_exception_to_yojson (x : waf_bad_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let waf_invalid_permission_policy_exception_to_yojson (x : waf_invalid_permission_policy_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let put_permission_policy_response_to_yojson = unit_to_yojson
let policy_string_to_yojson = string_to_yojson

let put_permission_policy_request_to_yojson (x : put_permission_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Policy", Some (policy_string_to_yojson x.policy));
    ]

let waf_service_linked_role_error_exception_to_yojson (x : waf_service_linked_role_error_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let redacted_fields_to_yojson tree = list_to_yojson field_to_match_to_yojson tree
let log_destination_configs_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("LogDestinationConfigs", Some (log_destination_configs_to_yojson x.log_destination_configs));
      ("RedactedFields", option_to_yojson redacted_fields_to_yojson x.redacted_fields);
    ]

let put_logging_configuration_response_to_yojson (x : put_logging_configuration_response) =
  assoc_to_yojson
    [
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
    ]

let put_logging_configuration_request_to_yojson (x : put_logging_configuration_request) =
  assoc_to_yojson
    [ ("LoggingConfiguration", Some (logging_configuration_to_yojson x.logging_configuration)) ]

let resource_name_to_yojson = string_to_yojson

let xss_match_set_summary_to_yojson (x : xss_match_set_summary) =
  assoc_to_yojson
    [
      ("XssMatchSetId", Some (resource_id_to_yojson x.xss_match_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let xss_match_set_summaries_to_yojson tree = list_to_yojson xss_match_set_summary_to_yojson tree
let next_marker_to_yojson = string_to_yojson

let list_xss_match_sets_response_to_yojson (x : list_xss_match_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("XssMatchSets", option_to_yojson xss_match_set_summaries_to_yojson x.xss_match_sets);
    ]

let pagination_limit_to_yojson = int_to_yojson

let list_xss_match_sets_request_to_yojson (x : list_xss_match_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let web_acl_summary_to_yojson (x : web_acl_summary) =
  assoc_to_yojson
    [
      ("WebACLId", Some (resource_id_to_yojson x.web_acl_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let web_acl_summaries_to_yojson tree = list_to_yojson web_acl_summary_to_yojson tree

let list_web_ac_ls_response_to_yojson (x : list_web_ac_ls_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("WebACLs", option_to_yojson web_acl_summaries_to_yojson x.web_ac_ls);
    ]

let list_web_ac_ls_request_to_yojson (x : list_web_ac_ls_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let tag_info_for_resource_to_yojson (x : tag_info_for_resource) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_arn_to_yojson x.resource_ar_n);
      ("TagList", option_to_yojson tag_list_to_yojson x.tag_list);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ( "TagInfoForResource",
        option_to_yojson tag_info_for_resource_to_yojson x.tag_info_for_resource );
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
    ]

let metric_name_to_yojson = string_to_yojson

let subscribed_rule_group_summary_to_yojson (x : subscribed_rule_group_summary) =
  assoc_to_yojson
    [
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("Name", Some (resource_name_to_yojson x.name));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
    ]

let subscribed_rule_group_summaries_to_yojson tree =
  list_to_yojson subscribed_rule_group_summary_to_yojson tree

let list_subscribed_rule_groups_response_to_yojson (x : list_subscribed_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("RuleGroups", option_to_yojson subscribed_rule_group_summaries_to_yojson x.rule_groups);
    ]

let list_subscribed_rule_groups_request_to_yojson (x : list_subscribed_rule_groups_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let sql_injection_match_set_summary_to_yojson (x : sql_injection_match_set_summary) =
  assoc_to_yojson
    [
      ("SqlInjectionMatchSetId", Some (resource_id_to_yojson x.sql_injection_match_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let sql_injection_match_set_summaries_to_yojson tree =
  list_to_yojson sql_injection_match_set_summary_to_yojson tree

let list_sql_injection_match_sets_response_to_yojson (x : list_sql_injection_match_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ( "SqlInjectionMatchSets",
        option_to_yojson sql_injection_match_set_summaries_to_yojson x.sql_injection_match_sets );
    ]

let list_sql_injection_match_sets_request_to_yojson (x : list_sql_injection_match_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let size_constraint_set_summary_to_yojson (x : size_constraint_set_summary) =
  assoc_to_yojson
    [
      ("SizeConstraintSetId", Some (resource_id_to_yojson x.size_constraint_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let size_constraint_set_summaries_to_yojson tree =
  list_to_yojson size_constraint_set_summary_to_yojson tree

let list_size_constraint_sets_response_to_yojson (x : list_size_constraint_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ( "SizeConstraintSets",
        option_to_yojson size_constraint_set_summaries_to_yojson x.size_constraint_sets );
    ]

let list_size_constraint_sets_request_to_yojson (x : list_size_constraint_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let rule_summary_to_yojson (x : rule_summary) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let rule_summaries_to_yojson tree = list_to_yojson rule_summary_to_yojson tree

let list_rules_response_to_yojson (x : list_rules_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Rules", option_to_yojson rule_summaries_to_yojson x.rules);
    ]

let list_rules_request_to_yojson (x : list_rules_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let rule_group_summary_to_yojson (x : rule_group_summary) =
  assoc_to_yojson
    [
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let rule_group_summaries_to_yojson tree = list_to_yojson rule_group_summary_to_yojson tree

let list_rule_groups_response_to_yojson (x : list_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("RuleGroups", option_to_yojson rule_group_summaries_to_yojson x.rule_groups);
    ]

let list_rule_groups_request_to_yojson (x : list_rule_groups_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let regex_pattern_set_summary_to_yojson (x : regex_pattern_set_summary) =
  assoc_to_yojson
    [
      ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let regex_pattern_set_summaries_to_yojson tree =
  list_to_yojson regex_pattern_set_summary_to_yojson tree

let list_regex_pattern_sets_response_to_yojson (x : list_regex_pattern_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ( "RegexPatternSets",
        option_to_yojson regex_pattern_set_summaries_to_yojson x.regex_pattern_sets );
    ]

let list_regex_pattern_sets_request_to_yojson (x : list_regex_pattern_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let regex_match_set_summary_to_yojson (x : regex_match_set_summary) =
  assoc_to_yojson
    [
      ("RegexMatchSetId", Some (resource_id_to_yojson x.regex_match_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let regex_match_set_summaries_to_yojson tree = list_to_yojson regex_match_set_summary_to_yojson tree

let list_regex_match_sets_response_to_yojson (x : list_regex_match_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("RegexMatchSets", option_to_yojson regex_match_set_summaries_to_yojson x.regex_match_sets);
    ]

let list_regex_match_sets_request_to_yojson (x : list_regex_match_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let list_rate_based_rules_response_to_yojson (x : list_rate_based_rules_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Rules", option_to_yojson rule_summaries_to_yojson x.rules);
    ]

let list_rate_based_rules_request_to_yojson (x : list_rate_based_rules_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let logging_configurations_to_yojson tree = list_to_yojson logging_configuration_to_yojson tree

let list_logging_configurations_response_to_yojson (x : list_logging_configurations_response) =
  assoc_to_yojson
    [
      ( "LoggingConfigurations",
        option_to_yojson logging_configurations_to_yojson x.logging_configurations );
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let list_logging_configurations_request_to_yojson (x : list_logging_configurations_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let ip_set_summary_to_yojson (x : ip_set_summary) =
  assoc_to_yojson
    [
      ("IPSetId", Some (resource_id_to_yojson x.ip_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let ip_set_summaries_to_yojson tree = list_to_yojson ip_set_summary_to_yojson tree

let list_ip_sets_response_to_yojson (x : list_ip_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("IPSets", option_to_yojson ip_set_summaries_to_yojson x.ip_sets);
    ]

let list_ip_sets_request_to_yojson (x : list_ip_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let geo_match_set_summary_to_yojson (x : geo_match_set_summary) =
  assoc_to_yojson
    [
      ("GeoMatchSetId", Some (resource_id_to_yojson x.geo_match_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let geo_match_set_summaries_to_yojson tree = list_to_yojson geo_match_set_summary_to_yojson tree

let list_geo_match_sets_response_to_yojson (x : list_geo_match_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("GeoMatchSets", option_to_yojson geo_match_set_summaries_to_yojson x.geo_match_sets);
    ]

let list_geo_match_sets_request_to_yojson (x : list_geo_match_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let byte_match_set_summary_to_yojson (x : byte_match_set_summary) =
  assoc_to_yojson
    [
      ("ByteMatchSetId", Some (resource_id_to_yojson x.byte_match_set_id));
      ("Name", Some (resource_name_to_yojson x.name));
    ]

let byte_match_set_summaries_to_yojson tree = list_to_yojson byte_match_set_summary_to_yojson tree

let list_byte_match_sets_response_to_yojson (x : list_byte_match_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("ByteMatchSets", option_to_yojson byte_match_set_summaries_to_yojson x.byte_match_sets);
    ]

let list_byte_match_sets_request_to_yojson (x : list_byte_match_sets_request) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let activated_rules_to_yojson tree = list_to_yojson activated_rule_to_yojson tree

let list_activated_rules_in_rule_group_response_to_yojson
    (x : list_activated_rules_in_rule_group_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("ActivatedRules", option_to_yojson activated_rules_to_yojson x.activated_rules);
    ]

let list_activated_rules_in_rule_group_request_to_yojson
    (x : list_activated_rules_in_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupId", option_to_yojson resource_id_to_yojson x.rule_group_id);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let xss_match_tuples_to_yojson tree = list_to_yojson xss_match_tuple_to_yojson tree

let xss_match_set_to_yojson (x : xss_match_set) =
  assoc_to_yojson
    [
      ("XssMatchSetId", Some (resource_id_to_yojson x.xss_match_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("XssMatchTuples", Some (xss_match_tuples_to_yojson x.xss_match_tuples));
    ]

let get_xss_match_set_response_to_yojson (x : get_xss_match_set_response) =
  assoc_to_yojson [ ("XssMatchSet", option_to_yojson xss_match_set_to_yojson x.xss_match_set) ]

let get_xss_match_set_request_to_yojson (x : get_xss_match_set_request) =
  assoc_to_yojson [ ("XssMatchSetId", Some (resource_id_to_yojson x.xss_match_set_id)) ]

let web_ac_l_to_yojson (x : web_ac_l) =
  assoc_to_yojson
    [
      ("WebACLId", Some (resource_id_to_yojson x.web_acl_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("DefaultAction", Some (waf_action_to_yojson x.default_action));
      ("Rules", Some (activated_rules_to_yojson x.rules));
      ("WebACLArn", option_to_yojson resource_arn_to_yojson x.web_acl_arn);
    ]

let get_web_acl_response_to_yojson (x : get_web_acl_response) =
  assoc_to_yojson [ ("WebACL", option_to_yojson web_ac_l_to_yojson x.web_ac_l) ]

let get_web_acl_request_to_yojson (x : get_web_acl_request) =
  assoc_to_yojson [ ("WebACLId", Some (resource_id_to_yojson x.web_acl_id)) ]

let sql_injection_match_tuples_to_yojson tree =
  list_to_yojson sql_injection_match_tuple_to_yojson tree

let sql_injection_match_set_to_yojson (x : sql_injection_match_set) =
  assoc_to_yojson
    [
      ("SqlInjectionMatchSetId", Some (resource_id_to_yojson x.sql_injection_match_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ( "SqlInjectionMatchTuples",
        Some (sql_injection_match_tuples_to_yojson x.sql_injection_match_tuples) );
    ]

let get_sql_injection_match_set_response_to_yojson (x : get_sql_injection_match_set_response) =
  assoc_to_yojson
    [
      ( "SqlInjectionMatchSet",
        option_to_yojson sql_injection_match_set_to_yojson x.sql_injection_match_set );
    ]

let get_sql_injection_match_set_request_to_yojson (x : get_sql_injection_match_set_request) =
  assoc_to_yojson
    [ ("SqlInjectionMatchSetId", Some (resource_id_to_yojson x.sql_injection_match_set_id)) ]

let size_constraints_to_yojson tree = list_to_yojson size_constraint_to_yojson tree

let size_constraint_set_to_yojson (x : size_constraint_set) =
  assoc_to_yojson
    [
      ("SizeConstraintSetId", Some (resource_id_to_yojson x.size_constraint_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("SizeConstraints", Some (size_constraints_to_yojson x.size_constraints));
    ]

let get_size_constraint_set_response_to_yojson (x : get_size_constraint_set_response) =
  assoc_to_yojson
    [ ("SizeConstraintSet", option_to_yojson size_constraint_set_to_yojson x.size_constraint_set) ]

let get_size_constraint_set_request_to_yojson (x : get_size_constraint_set_request) =
  assoc_to_yojson [ ("SizeConstraintSetId", Some (resource_id_to_yojson x.size_constraint_set_id)) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let time_window_to_yojson (x : time_window) =
  assoc_to_yojson
    [
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", Some (timestamp_to_yojson x.end_time));
    ]

let population_size_to_yojson = long_to_yojson
let action_to_yojson = string_to_yojson
let sample_weight_to_yojson = long_to_yojson
let header_value_to_yojson = string_to_yojson
let header_name_to_yojson = string_to_yojson

let http_header_to_yojson (x : http_header) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson header_name_to_yojson x.name);
      ("Value", option_to_yojson header_value_to_yojson x.value);
    ]

let http_headers_to_yojson tree = list_to_yojson http_header_to_yojson tree
let http_version_to_yojson = string_to_yojson
let http_method_to_yojson = string_to_yojson
let uri_string_to_yojson = string_to_yojson
let country_to_yojson = string_to_yojson
let ip_string_to_yojson = string_to_yojson

let http_request_to_yojson (x : http_request) =
  assoc_to_yojson
    [
      ("ClientIP", option_to_yojson ip_string_to_yojson x.client_i_p);
      ("Country", option_to_yojson country_to_yojson x.country);
      ("URI", option_to_yojson uri_string_to_yojson x.ur_i);
      ("Method", option_to_yojson http_method_to_yojson x.method_);
      ("HTTPVersion", option_to_yojson http_version_to_yojson x.http_version);
      ("Headers", option_to_yojson http_headers_to_yojson x.headers);
    ]

let sampled_http_request_to_yojson (x : sampled_http_request) =
  assoc_to_yojson
    [
      ("Request", Some (http_request_to_yojson x.request));
      ("Weight", Some (sample_weight_to_yojson x.weight));
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Action", option_to_yojson action_to_yojson x.action);
      ("RuleWithinRuleGroup", option_to_yojson resource_id_to_yojson x.rule_within_rule_group);
    ]

let sampled_http_requests_to_yojson tree = list_to_yojson sampled_http_request_to_yojson tree

let get_sampled_requests_response_to_yojson (x : get_sampled_requests_response) =
  assoc_to_yojson
    [
      ("SampledRequests", option_to_yojson sampled_http_requests_to_yojson x.sampled_requests);
      ("PopulationSize", option_to_yojson population_size_to_yojson x.population_size);
      ("TimeWindow", option_to_yojson time_window_to_yojson x.time_window);
    ]

let get_sampled_requests_max_items_to_yojson = long_to_yojson

let get_sampled_requests_request_to_yojson (x : get_sampled_requests_request) =
  assoc_to_yojson
    [
      ("WebAclId", Some (resource_id_to_yojson x.web_acl_id));
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("MaxItems", Some (get_sampled_requests_max_items_to_yojson x.max_items));
    ]

let rule_group_to_yojson (x : rule_group) =
  assoc_to_yojson
    [
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let get_rule_group_response_to_yojson (x : get_rule_group_response) =
  assoc_to_yojson [ ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group) ]

let get_rule_group_request_to_yojson (x : get_rule_group_request) =
  assoc_to_yojson [ ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id)) ]

let predicates_to_yojson tree = list_to_yojson predicate_to_yojson tree

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("Predicates", Some (predicates_to_yojson x.predicates));
    ]

let get_rule_response_to_yojson (x : get_rule_response) =
  assoc_to_yojson [ ("Rule", option_to_yojson rule_to_yojson x.rule) ]

let get_rule_request_to_yojson (x : get_rule_request) =
  assoc_to_yojson [ ("RuleId", Some (resource_id_to_yojson x.rule_id)) ]

let regex_pattern_strings_to_yojson tree = list_to_yojson regex_pattern_string_to_yojson tree

let regex_pattern_set_to_yojson (x : regex_pattern_set) =
  assoc_to_yojson
    [
      ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("RegexPatternStrings", Some (regex_pattern_strings_to_yojson x.regex_pattern_strings));
    ]

let get_regex_pattern_set_response_to_yojson (x : get_regex_pattern_set_response) =
  assoc_to_yojson
    [ ("RegexPatternSet", option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set) ]

let get_regex_pattern_set_request_to_yojson (x : get_regex_pattern_set_request) =
  assoc_to_yojson [ ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id)) ]

let regex_match_tuples_to_yojson tree = list_to_yojson regex_match_tuple_to_yojson tree

let regex_match_set_to_yojson (x : regex_match_set) =
  assoc_to_yojson
    [
      ("RegexMatchSetId", option_to_yojson resource_id_to_yojson x.regex_match_set_id);
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("RegexMatchTuples", option_to_yojson regex_match_tuples_to_yojson x.regex_match_tuples);
    ]

let get_regex_match_set_response_to_yojson (x : get_regex_match_set_response) =
  assoc_to_yojson
    [ ("RegexMatchSet", option_to_yojson regex_match_set_to_yojson x.regex_match_set) ]

let get_regex_match_set_request_to_yojson (x : get_regex_match_set_request) =
  assoc_to_yojson [ ("RegexMatchSetId", Some (resource_id_to_yojson x.regex_match_set_id)) ]

let managed_key_to_yojson = string_to_yojson
let managed_keys_to_yojson tree = list_to_yojson managed_key_to_yojson tree

let get_rate_based_rule_managed_keys_response_to_yojson
    (x : get_rate_based_rule_managed_keys_response) =
  assoc_to_yojson
    [
      ("ManagedKeys", option_to_yojson managed_keys_to_yojson x.managed_keys);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let get_rate_based_rule_managed_keys_request_to_yojson
    (x : get_rate_based_rule_managed_keys_request) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let rate_key_to_yojson (x : rate_key) = match x with IP -> `String "IP"

let rate_based_rule_to_yojson (x : rate_based_rule) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("MatchPredicates", Some (predicates_to_yojson x.match_predicates));
      ("RateKey", Some (rate_key_to_yojson x.rate_key));
      ("RateLimit", Some (rate_limit_to_yojson x.rate_limit));
    ]

let get_rate_based_rule_response_to_yojson (x : get_rate_based_rule_response) =
  assoc_to_yojson [ ("Rule", option_to_yojson rate_based_rule_to_yojson x.rule) ]

let get_rate_based_rule_request_to_yojson (x : get_rate_based_rule_request) =
  assoc_to_yojson [ ("RuleId", Some (resource_id_to_yojson x.rule_id)) ]

let get_permission_policy_response_to_yojson (x : get_permission_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_string_to_yojson x.policy) ]

let get_permission_policy_request_to_yojson (x : get_permission_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let get_logging_configuration_response_to_yojson (x : get_logging_configuration_response) =
  assoc_to_yojson
    [
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
    ]

let get_logging_configuration_request_to_yojson (x : get_logging_configuration_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let ip_set_descriptors_to_yojson tree = list_to_yojson ip_set_descriptor_to_yojson tree

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson
    [
      ("IPSetId", Some (resource_id_to_yojson x.ip_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("IPSetDescriptors", Some (ip_set_descriptors_to_yojson x.ip_set_descriptors));
    ]

let get_ip_set_response_to_yojson (x : get_ip_set_response) =
  assoc_to_yojson [ ("IPSet", option_to_yojson ip_set_to_yojson x.ip_set) ]

let get_ip_set_request_to_yojson (x : get_ip_set_request) =
  assoc_to_yojson [ ("IPSetId", Some (resource_id_to_yojson x.ip_set_id)) ]

let geo_match_constraints_to_yojson tree = list_to_yojson geo_match_constraint_to_yojson tree

let geo_match_set_to_yojson (x : geo_match_set) =
  assoc_to_yojson
    [
      ("GeoMatchSetId", Some (resource_id_to_yojson x.geo_match_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("GeoMatchConstraints", Some (geo_match_constraints_to_yojson x.geo_match_constraints));
    ]

let get_geo_match_set_response_to_yojson (x : get_geo_match_set_response) =
  assoc_to_yojson [ ("GeoMatchSet", option_to_yojson geo_match_set_to_yojson x.geo_match_set) ]

let get_geo_match_set_request_to_yojson (x : get_geo_match_set_request) =
  assoc_to_yojson [ ("GeoMatchSetId", Some (resource_id_to_yojson x.geo_match_set_id)) ]

let change_token_status_to_yojson (x : change_token_status) =
  match x with
  | PROVISIONED -> `String "PROVISIONED"
  | PENDING -> `String "PENDING"
  | INSYNC -> `String "INSYNC"

let get_change_token_status_response_to_yojson (x : get_change_token_status_response) =
  assoc_to_yojson
    [ ("ChangeTokenStatus", option_to_yojson change_token_status_to_yojson x.change_token_status) ]

let get_change_token_status_request_to_yojson (x : get_change_token_status_request) =
  assoc_to_yojson [ ("ChangeToken", Some (change_token_to_yojson x.change_token)) ]

let get_change_token_response_to_yojson (x : get_change_token_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let get_change_token_request_to_yojson = unit_to_yojson
let byte_match_tuples_to_yojson tree = list_to_yojson byte_match_tuple_to_yojson tree

let byte_match_set_to_yojson (x : byte_match_set) =
  assoc_to_yojson
    [
      ("ByteMatchSetId", Some (resource_id_to_yojson x.byte_match_set_id));
      ("Name", option_to_yojson resource_name_to_yojson x.name);
      ("ByteMatchTuples", Some (byte_match_tuples_to_yojson x.byte_match_tuples));
    ]

let get_byte_match_set_response_to_yojson (x : get_byte_match_set_response) =
  assoc_to_yojson [ ("ByteMatchSet", option_to_yojson byte_match_set_to_yojson x.byte_match_set) ]

let get_byte_match_set_request_to_yojson (x : get_byte_match_set_request) =
  assoc_to_yojson [ ("ByteMatchSetId", Some (resource_id_to_yojson x.byte_match_set_id)) ]

let waf_non_empty_entity_exception_to_yojson (x : waf_non_empty_entity_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_xss_match_set_response_to_yojson (x : delete_xss_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_xss_match_set_request_to_yojson (x : delete_xss_match_set_request) =
  assoc_to_yojson
    [
      ("XssMatchSetId", Some (resource_id_to_yojson x.xss_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_web_acl_response_to_yojson (x : delete_web_acl_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_web_acl_request_to_yojson (x : delete_web_acl_request) =
  assoc_to_yojson
    [
      ("WebACLId", Some (resource_id_to_yojson x.web_acl_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_sql_injection_match_set_response_to_yojson (x : delete_sql_injection_match_set_response)
    =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_sql_injection_match_set_request_to_yojson (x : delete_sql_injection_match_set_request) =
  assoc_to_yojson
    [
      ("SqlInjectionMatchSetId", Some (resource_id_to_yojson x.sql_injection_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_size_constraint_set_response_to_yojson (x : delete_size_constraint_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_size_constraint_set_request_to_yojson (x : delete_size_constraint_set_request) =
  assoc_to_yojson
    [
      ("SizeConstraintSetId", Some (resource_id_to_yojson x.size_constraint_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_rule_group_response_to_yojson (x : delete_rule_group_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_rule_group_request_to_yojson (x : delete_rule_group_request) =
  assoc_to_yojson
    [
      ("RuleGroupId", Some (resource_id_to_yojson x.rule_group_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_rule_response_to_yojson (x : delete_rule_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_rule_request_to_yojson (x : delete_rule_request) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_regex_pattern_set_response_to_yojson (x : delete_regex_pattern_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_regex_pattern_set_request_to_yojson (x : delete_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("RegexPatternSetId", Some (resource_id_to_yojson x.regex_pattern_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_regex_match_set_response_to_yojson (x : delete_regex_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_regex_match_set_request_to_yojson (x : delete_regex_match_set_request) =
  assoc_to_yojson
    [
      ("RegexMatchSetId", Some (resource_id_to_yojson x.regex_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_rate_based_rule_response_to_yojson (x : delete_rate_based_rule_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_rate_based_rule_request_to_yojson (x : delete_rate_based_rule_request) =
  assoc_to_yojson
    [
      ("RuleId", Some (resource_id_to_yojson x.rule_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_permission_policy_response_to_yojson = unit_to_yojson

let delete_permission_policy_request_to_yojson (x : delete_permission_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_logging_configuration_response_to_yojson = unit_to_yojson

let delete_logging_configuration_request_to_yojson (x : delete_logging_configuration_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_ip_set_response_to_yojson (x : delete_ip_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_ip_set_request_to_yojson (x : delete_ip_set_request) =
  assoc_to_yojson
    [
      ("IPSetId", Some (resource_id_to_yojson x.ip_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_geo_match_set_response_to_yojson (x : delete_geo_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_geo_match_set_request_to_yojson (x : delete_geo_match_set_request) =
  assoc_to_yojson
    [
      ("GeoMatchSetId", Some (resource_id_to_yojson x.geo_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let delete_byte_match_set_response_to_yojson (x : delete_byte_match_set_response) =
  assoc_to_yojson [ ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token) ]

let delete_byte_match_set_request_to_yojson (x : delete_byte_match_set_request) =
  assoc_to_yojson
    [
      ("ByteMatchSetId", Some (resource_id_to_yojson x.byte_match_set_id));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_xss_match_set_response_to_yojson (x : create_xss_match_set_response) =
  assoc_to_yojson
    [
      ("XssMatchSet", option_to_yojson xss_match_set_to_yojson x.xss_match_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_xss_match_set_request_to_yojson (x : create_xss_match_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let error_reason_to_yojson = string_to_yojson

let migration_error_type_to_yojson (x : migration_error_type) =
  match x with
  | ENTITY_NOT_SUPPORTED -> `String "ENTITY_NOT_SUPPORTED"
  | ENTITY_NOT_FOUND -> `String "ENTITY_NOT_FOUND"
  | S3_BUCKET_NO_PERMISSION -> `String "S3_BUCKET_NO_PERMISSION"
  | S3_BUCKET_NOT_ACCESSIBLE -> `String "S3_BUCKET_NOT_ACCESSIBLE"
  | S3_BUCKET_NOT_FOUND -> `String "S3_BUCKET_NOT_FOUND"
  | S3_BUCKET_INVALID_REGION -> `String "S3_BUCKET_INVALID_REGION"
  | S3_INTERNAL_ERROR -> `String "S3_INTERNAL_ERROR"

let waf_entity_migration_exception_to_yojson (x : waf_entity_migration_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("MigrationErrorType", option_to_yojson migration_error_type_to_yojson x.migration_error_type);
      ("MigrationErrorReason", option_to_yojson error_reason_to_yojson x.migration_error_reason);
    ]

let s3_object_url_to_yojson = string_to_yojson

let create_web_acl_migration_stack_response_to_yojson (x : create_web_acl_migration_stack_response)
    =
  assoc_to_yojson [ ("S3ObjectUrl", Some (s3_object_url_to_yojson x.s3_object_url)) ]

let ignore_unsupported_type_to_yojson = bool_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let create_web_acl_migration_stack_request_to_yojson (x : create_web_acl_migration_stack_request) =
  assoc_to_yojson
    [
      ("WebACLId", Some (resource_id_to_yojson x.web_acl_id));
      ("S3BucketName", Some (s3_bucket_name_to_yojson x.s3_bucket_name));
      ("IgnoreUnsupportedType", Some (ignore_unsupported_type_to_yojson x.ignore_unsupported_type));
    ]

let create_web_acl_response_to_yojson (x : create_web_acl_response) =
  assoc_to_yojson
    [
      ("WebACL", option_to_yojson web_ac_l_to_yojson x.web_ac_l);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_web_acl_request_to_yojson (x : create_web_acl_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("DefaultAction", Some (waf_action_to_yojson x.default_action));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_sql_injection_match_set_response_to_yojson (x : create_sql_injection_match_set_response)
    =
  assoc_to_yojson
    [
      ( "SqlInjectionMatchSet",
        option_to_yojson sql_injection_match_set_to_yojson x.sql_injection_match_set );
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_sql_injection_match_set_request_to_yojson (x : create_sql_injection_match_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_size_constraint_set_response_to_yojson (x : create_size_constraint_set_response) =
  assoc_to_yojson
    [
      ("SizeConstraintSet", option_to_yojson size_constraint_set_to_yojson x.size_constraint_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_size_constraint_set_request_to_yojson (x : create_size_constraint_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_rule_group_response_to_yojson (x : create_rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_rule_group_request_to_yojson (x : create_rule_group_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_rule_response_to_yojson (x : create_rule_response) =
  assoc_to_yojson
    [
      ("Rule", option_to_yojson rule_to_yojson x.rule);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_rule_request_to_yojson (x : create_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_regex_pattern_set_response_to_yojson (x : create_regex_pattern_set_response) =
  assoc_to_yojson
    [
      ("RegexPatternSet", option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_regex_pattern_set_request_to_yojson (x : create_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_regex_match_set_response_to_yojson (x : create_regex_match_set_response) =
  assoc_to_yojson
    [
      ("RegexMatchSet", option_to_yojson regex_match_set_to_yojson x.regex_match_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_regex_match_set_request_to_yojson (x : create_regex_match_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_rate_based_rule_response_to_yojson (x : create_rate_based_rule_response) =
  assoc_to_yojson
    [
      ("Rule", option_to_yojson rate_based_rule_to_yojson x.rule);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_rate_based_rule_request_to_yojson (x : create_rate_based_rule_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("RateKey", Some (rate_key_to_yojson x.rate_key));
      ("RateLimit", Some (rate_limit_to_yojson x.rate_limit));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ip_set_response_to_yojson (x : create_ip_set_response) =
  assoc_to_yojson
    [
      ("IPSet", option_to_yojson ip_set_to_yojson x.ip_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_ip_set_request_to_yojson (x : create_ip_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_geo_match_set_response_to_yojson (x : create_geo_match_set_response) =
  assoc_to_yojson
    [
      ("GeoMatchSet", option_to_yojson geo_match_set_to_yojson x.geo_match_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_geo_match_set_request_to_yojson (x : create_geo_match_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]

let create_byte_match_set_response_to_yojson (x : create_byte_match_set_response) =
  assoc_to_yojson
    [
      ("ByteMatchSet", option_to_yojson byte_match_set_to_yojson x.byte_match_set);
      ("ChangeToken", option_to_yojson change_token_to_yojson x.change_token);
    ]

let create_byte_match_set_request_to_yojson (x : create_byte_match_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (resource_name_to_yojson x.name));
      ("ChangeToken", Some (change_token_to_yojson x.change_token));
    ]
