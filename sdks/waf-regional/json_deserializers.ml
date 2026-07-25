open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let waf_stale_data_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_stale_data_exception)

let waf_nonexistent_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_nonexistent_item_exception)

let waf_nonexistent_container_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_nonexistent_container_exception)

let waf_limits_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_limits_exceeded_exception)

let parameter_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_OPTION" -> INVALID_OPTION
    | `String "ILLEGAL_COMBINATION" -> ILLEGAL_COMBINATION
    | `String "ILLEGAL_ARGUMENT" -> ILLEGAL_ARGUMENT
    | `String "INVALID_TAG_KEY" -> INVALID_TAG_KEY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParameterExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionReason")
     : parameter_exception_reason)
    : parameter_exception_reason)

let parameter_exception_parameter_of_yojson = string_of_yojson

let parameter_exception_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "CHANGE_ACTION" -> CHANGE_ACTION
    | `String "WAF_ACTION" -> WAF_ACTION
    | `String "WAF_OVERRIDE_ACTION" -> WAF_OVERRIDE_ACTION
    | `String "PREDICATE_TYPE" -> PREDICATE_TYPE
    | `String "IPSET_TYPE" -> IPSET_TYPE
    | `String "BYTE_MATCH_FIELD_TYPE" -> BYTE_MATCH_FIELD_TYPE
    | `String "SQL_INJECTION_MATCH_FIELD_TYPE" -> SQL_INJECTION_MATCH_FIELD_TYPE
    | `String "BYTE_MATCH_TEXT_TRANSFORMATION" -> BYTE_MATCH_TEXT_TRANSFORMATION
    | `String "BYTE_MATCH_POSITIONAL_CONSTRAINT" -> BYTE_MATCH_POSITIONAL_CONSTRAINT
    | `String "SIZE_CONSTRAINT_COMPARISON_OPERATOR" -> SIZE_CONSTRAINT_COMPARISON_OPERATOR
    | `String "GEO_MATCH_LOCATION_TYPE" -> GEO_MATCH_LOCATION_TYPE
    | `String "GEO_MATCH_LOCATION_VALUE" -> GEO_MATCH_LOCATION_VALUE
    | `String "RATE_KEY" -> RATE_KEY
    | `String "RULE_TYPE" -> RULE_TYPE
    | `String "NEXT_MARKER" -> NEXT_MARKER
    | `String "RESOURCE_ARN" -> RESOURCE_ARN
    | `String "TAGS" -> TAGS
    | `String "TAG_KEYS" -> TAG_KEYS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParameterExceptionField" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionField")
     : parameter_exception_field)
    : parameter_exception_field)

let waf_invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field = option_of_yojson (value_for_key parameter_exception_field_of_yojson "field") _list path;
     parameter =
       option_of_yojson
         (value_for_key parameter_exception_parameter_of_yojson "parameter")
         _list path;
     reason =
       option_of_yojson (value_for_key parameter_exception_reason_of_yojson "reason") _list path;
   }
    : waf_invalid_parameter_exception)

let waf_invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_invalid_operation_exception)

let waf_invalid_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let waf_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_internal_error_exception)

let change_token_of_yojson = string_of_yojson

let update_xss_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_xss_match_set_response)

let text_transformation_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "COMPRESS_WHITE_SPACE" -> COMPRESS_WHITE_SPACE
    | `String "HTML_ENTITY_DECODE" -> HTML_ENTITY_DECODE
    | `String "LOWERCASE" -> LOWERCASE
    | `String "CMD_LINE" -> CMD_LINE
    | `String "URL_DECODE" -> URL_DECODE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextTransformation" value)
    | _ -> raise (deserialize_wrong_type_error path "TextTransformation")
     : text_transformation)
    : text_transformation)

let match_field_data_of_yojson = string_of_yojson

let match_field_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "URI" -> URI
    | `String "QUERY_STRING" -> QUERY_STRING
    | `String "HEADER" -> HEADER
    | `String "METHOD" -> METHOD
    | `String "BODY" -> BODY
    | `String "SINGLE_QUERY_ARG" -> SINGLE_QUERY_ARG
    | `String "ALL_QUERY_ARGS" -> ALL_QUERY_ARGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchFieldType" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchFieldType")
     : match_field_type)
    : match_field_type)

let field_to_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key match_field_type_of_yojson "Type" _list path;
     data = option_of_yojson (value_for_key match_field_data_of_yojson "Data") _list path;
   }
    : field_to_match)

let xss_match_tuple_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformation =
       value_for_key text_transformation_of_yojson "TextTransformation" _list path;
   }
    : xss_match_tuple)

let change_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSERT" -> INSERT
    | `String "DELETE" -> DELETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeAction")
     : change_action)
    : change_action)

let xss_match_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     xss_match_tuple = value_for_key xss_match_tuple_of_yojson "XssMatchTuple" _list path;
   }
    : xss_match_set_update)

let xss_match_set_updates_of_yojson tree path =
  list_of_yojson xss_match_set_update_of_yojson tree path

let resource_id_of_yojson = string_of_yojson

let update_xss_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set_id = value_for_key resource_id_of_yojson "XssMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key xss_match_set_updates_of_yojson "Updates" _list path;
   }
    : update_xss_match_set_request)

let waf_subscription_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_subscription_not_found_exception)

let waf_referenced_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_referenced_item_exception)

let update_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_web_acl_response)

let waf_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BLOCK" -> BLOCK
    | `String "ALLOW" -> ALLOW
    | `String "COUNT" -> COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "WafActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafActionType")
     : waf_action_type)
    : waf_action_type)

let waf_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = value_for_key waf_action_type_of_yojson "Type" _list path } : waf_action)

let excluded_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_id = value_for_key resource_id_of_yojson "RuleId" _list path } : excluded_rule)

let excluded_rules_of_yojson tree path = list_of_yojson excluded_rule_of_yojson tree path

let waf_rule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGULAR" -> REGULAR
    | `String "RATE_BASED" -> RATE_BASED
    | `String "GROUP" -> GROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "WafRuleType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafRuleType")
     : waf_rule_type)
    : waf_rule_type)

let waf_override_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "COUNT" -> COUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WafOverrideActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "WafOverrideActionType")
     : waf_override_action_type)
    : waf_override_action_type)

let waf_override_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = value_for_key waf_override_action_type_of_yojson "Type" _list path }
    : waf_override_action)

let rule_priority_of_yojson = int_of_yojson

let activated_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = value_for_key rule_priority_of_yojson "Priority" _list path;
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     action = option_of_yojson (value_for_key waf_action_of_yojson "Action") _list path;
     override_action =
       option_of_yojson (value_for_key waf_override_action_of_yojson "OverrideAction") _list path;
     type_ = option_of_yojson (value_for_key waf_rule_type_of_yojson "Type") _list path;
     excluded_rules =
       option_of_yojson (value_for_key excluded_rules_of_yojson "ExcludedRules") _list path;
   }
    : activated_rule)

let web_acl_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     activated_rule = value_for_key activated_rule_of_yojson "ActivatedRule" _list path;
   }
    : web_acl_update)

let web_acl_updates_of_yojson tree path = list_of_yojson web_acl_update_of_yojson tree path

let update_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = option_of_yojson (value_for_key web_acl_updates_of_yojson "Updates") _list path;
     default_action =
       option_of_yojson (value_for_key waf_action_of_yojson "DefaultAction") _list path;
   }
    : update_web_acl_request)

let update_sql_injection_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_sql_injection_match_set_response)

let sql_injection_match_tuple_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformation =
       value_for_key text_transformation_of_yojson "TextTransformation" _list path;
   }
    : sql_injection_match_tuple)

let sql_injection_match_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     sql_injection_match_tuple =
       value_for_key sql_injection_match_tuple_of_yojson "SqlInjectionMatchTuple" _list path;
   }
    : sql_injection_match_set_update)

let sql_injection_match_set_updates_of_yojson tree path =
  list_of_yojson sql_injection_match_set_update_of_yojson tree path

let update_sql_injection_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set_id =
       value_for_key resource_id_of_yojson "SqlInjectionMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key sql_injection_match_set_updates_of_yojson "Updates" _list path;
   }
    : update_sql_injection_match_set_request)

let update_size_constraint_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_size_constraint_set_response)

let size_of_yojson = long_of_yojson

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQ" -> EQ
    | `String "NE" -> NE
    | `String "LE" -> LE
    | `String "LT" -> LT
    | `String "GE" -> GE
    | `String "GT" -> GT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let size_constraint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformation =
       value_for_key text_transformation_of_yojson "TextTransformation" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     size = value_for_key size_of_yojson "Size" _list path;
   }
    : size_constraint)

let size_constraint_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     size_constraint = value_for_key size_constraint_of_yojson "SizeConstraint" _list path;
   }
    : size_constraint_set_update)

let size_constraint_set_updates_of_yojson tree path =
  list_of_yojson size_constraint_set_update_of_yojson tree path

let update_size_constraint_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set_id = value_for_key resource_id_of_yojson "SizeConstraintSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key size_constraint_set_updates_of_yojson "Updates" _list path;
   }
    : update_size_constraint_set_request)

let update_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_rule_group_response)

let rule_group_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     activated_rule = value_for_key activated_rule_of_yojson "ActivatedRule" _list path;
   }
    : rule_group_update)

let rule_group_updates_of_yojson tree path = list_of_yojson rule_group_update_of_yojson tree path

let update_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     updates = value_for_key rule_group_updates_of_yojson "Updates" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : update_rule_group_request)

let update_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_rule_response)

let predicate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPMatch" -> IP_MATCH
    | `String "ByteMatch" -> BYTE_MATCH
    | `String "SqlInjectionMatch" -> SQL_INJECTION_MATCH
    | `String "GeoMatch" -> GEO_MATCH
    | `String "SizeConstraint" -> SIZE_CONSTRAINT
    | `String "XssMatch" -> XSS_MATCH
    | `String "RegexMatch" -> REGEX_MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "PredicateType" value)
    | _ -> raise (deserialize_wrong_type_error path "PredicateType")
     : predicate_type)
    : predicate_type)

let negated_of_yojson = bool_of_yojson

let predicate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     negated = value_for_key negated_of_yojson "Negated" _list path;
     type_ = value_for_key predicate_type_of_yojson "Type" _list path;
     data_id = value_for_key resource_id_of_yojson "DataId" _list path;
   }
    : predicate)

let rule_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     predicate = value_for_key predicate_of_yojson "Predicate" _list path;
   }
    : rule_update)

let rule_updates_of_yojson tree path = list_of_yojson rule_update_of_yojson tree path

let update_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key rule_updates_of_yojson "Updates" _list path;
   }
    : update_rule_request)

let waf_invalid_regex_pattern_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_invalid_regex_pattern_exception)

let update_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_regex_pattern_set_response)

let regex_pattern_string_of_yojson = string_of_yojson

let regex_pattern_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     regex_pattern_string =
       value_for_key regex_pattern_string_of_yojson "RegexPatternString" _list path;
   }
    : regex_pattern_set_update)

let regex_pattern_set_updates_of_yojson tree path =
  list_of_yojson regex_pattern_set_update_of_yojson tree path

let update_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path;
     updates = value_for_key regex_pattern_set_updates_of_yojson "Updates" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : update_regex_pattern_set_request)

let waf_disallowed_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_disallowed_name_exception)

let update_regex_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_regex_match_set_response)

let regex_match_tuple_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformation =
       value_for_key text_transformation_of_yojson "TextTransformation" _list path;
     regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path;
   }
    : regex_match_tuple)

let regex_match_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     regex_match_tuple = value_for_key regex_match_tuple_of_yojson "RegexMatchTuple" _list path;
   }
    : regex_match_set_update)

let regex_match_set_updates_of_yojson tree path =
  list_of_yojson regex_match_set_update_of_yojson tree path

let update_regex_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set_id = value_for_key resource_id_of_yojson "RegexMatchSetId" _list path;
     updates = value_for_key regex_match_set_updates_of_yojson "Updates" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : update_regex_match_set_request)

let update_rate_based_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_rate_based_rule_response)

let rate_limit_of_yojson = long_of_yojson

let update_rate_based_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key rule_updates_of_yojson "Updates" _list path;
     rate_limit = value_for_key rate_limit_of_yojson "RateLimit" _list path;
   }
    : update_rate_based_rule_request)

let update_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_ip_set_response)

let ip_set_descriptor_value_of_yojson = string_of_yojson

let ip_set_descriptor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "IPV6" -> IPV6
    | `String value -> raise (deserialize_unknown_enum_value_error path "IPSetDescriptorType" value)
    | _ -> raise (deserialize_wrong_type_error path "IPSetDescriptorType")
     : ip_set_descriptor_type)
    : ip_set_descriptor_type)

let ip_set_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key ip_set_descriptor_type_of_yojson "Type" _list path;
     value = value_for_key ip_set_descriptor_value_of_yojson "Value" _list path;
   }
    : ip_set_descriptor)

let ip_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     ip_set_descriptor = value_for_key ip_set_descriptor_of_yojson "IPSetDescriptor" _list path;
   }
    : ip_set_update)

let ip_set_updates_of_yojson tree path = list_of_yojson ip_set_update_of_yojson tree path

let update_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_id = value_for_key resource_id_of_yojson "IPSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key ip_set_updates_of_yojson "Updates" _list path;
   }
    : update_ip_set_request)

let update_geo_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_geo_match_set_response)

let geo_match_constraint_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "AF" -> AF
    | `String "AX" -> AX
    | `String "AL" -> AL
    | `String "DZ" -> DZ
    | `String "AS" -> AS
    | `String "AD" -> AD
    | `String "AO" -> AO
    | `String "AI" -> AI
    | `String "AQ" -> AQ
    | `String "AG" -> AG
    | `String "AR" -> AR
    | `String "AM" -> AM
    | `String "AW" -> AW
    | `String "AU" -> AU
    | `String "AT" -> AT
    | `String "AZ" -> AZ
    | `String "BS" -> BS
    | `String "BH" -> BH
    | `String "BD" -> BD
    | `String "BB" -> BB
    | `String "BY" -> BY
    | `String "BE" -> BE
    | `String "BZ" -> BZ
    | `String "BJ" -> BJ
    | `String "BM" -> BM
    | `String "BT" -> BT
    | `String "BO" -> BO
    | `String "BQ" -> BQ
    | `String "BA" -> BA
    | `String "BW" -> BW
    | `String "BV" -> BV
    | `String "BR" -> BR
    | `String "IO" -> IO
    | `String "BN" -> BN
    | `String "BG" -> BG
    | `String "BF" -> BF
    | `String "BI" -> BI
    | `String "KH" -> KH
    | `String "CM" -> CM
    | `String "CA" -> CA
    | `String "CV" -> CV
    | `String "KY" -> KY
    | `String "CF" -> CF
    | `String "TD" -> TD
    | `String "CL" -> CL
    | `String "CN" -> CN
    | `String "CX" -> CX
    | `String "CC" -> CC
    | `String "CO" -> CO
    | `String "KM" -> KM
    | `String "CG" -> CG
    | `String "CD" -> CD
    | `String "CK" -> CK
    | `String "CR" -> CR
    | `String "CI" -> CI
    | `String "HR" -> HR
    | `String "CU" -> CU
    | `String "CW" -> CW
    | `String "CY" -> CY
    | `String "CZ" -> CZ
    | `String "DK" -> DK
    | `String "DJ" -> DJ
    | `String "DM" -> DM
    | `String "DO" -> DO
    | `String "EC" -> EC
    | `String "EG" -> EG
    | `String "SV" -> SV
    | `String "GQ" -> GQ
    | `String "ER" -> ER
    | `String "EE" -> EE
    | `String "ET" -> ET
    | `String "FK" -> FK
    | `String "FO" -> FO
    | `String "FJ" -> FJ
    | `String "FI" -> FI
    | `String "FR" -> FR
    | `String "GF" -> GF
    | `String "PF" -> PF
    | `String "TF" -> TF
    | `String "GA" -> GA
    | `String "GM" -> GM
    | `String "GE" -> GE
    | `String "DE" -> DE
    | `String "GH" -> GH
    | `String "GI" -> GI
    | `String "GR" -> GR
    | `String "GL" -> GL
    | `String "GD" -> GD
    | `String "GP" -> GP
    | `String "GU" -> GU
    | `String "GT" -> GT
    | `String "GG" -> GG
    | `String "GN" -> GN
    | `String "GW" -> GW
    | `String "GY" -> GY
    | `String "HT" -> HT
    | `String "HM" -> HM
    | `String "VA" -> VA
    | `String "HN" -> HN
    | `String "HK" -> HK
    | `String "HU" -> HU
    | `String "IS" -> IS
    | `String "IN" -> IN
    | `String "ID" -> ID
    | `String "IR" -> IR
    | `String "IQ" -> IQ
    | `String "IE" -> IE
    | `String "IM" -> IM
    | `String "IL" -> IL
    | `String "IT" -> IT
    | `String "JM" -> JM
    | `String "JP" -> JP
    | `String "JE" -> JE
    | `String "JO" -> JO
    | `String "KZ" -> KZ
    | `String "KE" -> KE
    | `String "KI" -> KI
    | `String "KP" -> KP
    | `String "KR" -> KR
    | `String "KW" -> KW
    | `String "KG" -> KG
    | `String "LA" -> LA
    | `String "LV" -> LV
    | `String "LB" -> LB
    | `String "LS" -> LS
    | `String "LR" -> LR
    | `String "LY" -> LY
    | `String "LI" -> LI
    | `String "LT" -> LT
    | `String "LU" -> LU
    | `String "MO" -> MO
    | `String "MK" -> MK
    | `String "MG" -> MG
    | `String "MW" -> MW
    | `String "MY" -> MY
    | `String "MV" -> MV
    | `String "ML" -> ML
    | `String "MT" -> MT
    | `String "MH" -> MH
    | `String "MQ" -> MQ
    | `String "MR" -> MR
    | `String "MU" -> MU
    | `String "YT" -> YT
    | `String "MX" -> MX
    | `String "FM" -> FM
    | `String "MD" -> MD
    | `String "MC" -> MC
    | `String "MN" -> MN
    | `String "ME" -> ME
    | `String "MS" -> MS
    | `String "MA" -> MA
    | `String "MZ" -> MZ
    | `String "MM" -> MM
    | `String "NA" -> NA
    | `String "NR" -> NR
    | `String "NP" -> NP
    | `String "NL" -> NL
    | `String "NC" -> NC
    | `String "NZ" -> NZ
    | `String "NI" -> NI
    | `String "NE" -> NE
    | `String "NG" -> NG
    | `String "NU" -> NU
    | `String "NF" -> NF
    | `String "MP" -> MP
    | `String "NO" -> NO
    | `String "OM" -> OM
    | `String "PK" -> PK
    | `String "PW" -> PW
    | `String "PS" -> PS
    | `String "PA" -> PA
    | `String "PG" -> PG
    | `String "PY" -> PY
    | `String "PE" -> PE
    | `String "PH" -> PH
    | `String "PN" -> PN
    | `String "PL" -> PL
    | `String "PT" -> PT
    | `String "PR" -> PR
    | `String "QA" -> QA
    | `String "RE" -> RE
    | `String "RO" -> RO
    | `String "RU" -> RU
    | `String "RW" -> RW
    | `String "BL" -> BL
    | `String "SH" -> SH
    | `String "KN" -> KN
    | `String "LC" -> LC
    | `String "MF" -> MF
    | `String "PM" -> PM
    | `String "VC" -> VC
    | `String "WS" -> WS
    | `String "SM" -> SM
    | `String "ST" -> ST
    | `String "SA" -> SA
    | `String "SN" -> SN
    | `String "RS" -> RS
    | `String "SC" -> SC
    | `String "SL" -> SL
    | `String "SG" -> SG
    | `String "SX" -> SX
    | `String "SK" -> SK
    | `String "SI" -> SI
    | `String "SB" -> SB
    | `String "SO" -> SO
    | `String "ZA" -> ZA
    | `String "GS" -> GS
    | `String "SS" -> SS
    | `String "ES" -> ES
    | `String "LK" -> LK
    | `String "SD" -> SD
    | `String "SR" -> SR
    | `String "SJ" -> SJ
    | `String "SZ" -> SZ
    | `String "SE" -> SE
    | `String "CH" -> CH
    | `String "SY" -> SY
    | `String "TW" -> TW
    | `String "TJ" -> TJ
    | `String "TZ" -> TZ
    | `String "TH" -> TH
    | `String "TL" -> TL
    | `String "TG" -> TG
    | `String "TK" -> TK
    | `String "TO" -> TO
    | `String "TT" -> TT
    | `String "TN" -> TN
    | `String "TR" -> TR
    | `String "TM" -> TM
    | `String "TC" -> TC
    | `String "TV" -> TV
    | `String "UG" -> UG
    | `String "UA" -> UA
    | `String "AE" -> AE
    | `String "GB" -> GB
    | `String "US" -> US
    | `String "UM" -> UM
    | `String "UY" -> UY
    | `String "UZ" -> UZ
    | `String "VU" -> VU
    | `String "VE" -> VE
    | `String "VN" -> VN
    | `String "VG" -> VG
    | `String "VI" -> VI
    | `String "WF" -> WF
    | `String "EH" -> EH
    | `String "YE" -> YE
    | `String "ZM" -> ZM
    | `String "ZW" -> ZW
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GeoMatchConstraintValue" value)
    | _ -> raise (deserialize_wrong_type_error path "GeoMatchConstraintValue")
     : geo_match_constraint_value)
    : geo_match_constraint_value)

let geo_match_constraint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Country" -> Country
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GeoMatchConstraintType" value)
    | _ -> raise (deserialize_wrong_type_error path "GeoMatchConstraintType")
     : geo_match_constraint_type)
    : geo_match_constraint_type)

let geo_match_constraint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key geo_match_constraint_type_of_yojson "Type" _list path;
     value = value_for_key geo_match_constraint_value_of_yojson "Value" _list path;
   }
    : geo_match_constraint)

let geo_match_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     geo_match_constraint =
       value_for_key geo_match_constraint_of_yojson "GeoMatchConstraint" _list path;
   }
    : geo_match_set_update)

let geo_match_set_updates_of_yojson tree path =
  list_of_yojson geo_match_set_update_of_yojson tree path

let update_geo_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set_id = value_for_key resource_id_of_yojson "GeoMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key geo_match_set_updates_of_yojson "Updates" _list path;
   }
    : update_geo_match_set_request)

let update_byte_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : update_byte_match_set_response)

let positional_constraint_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXACTLY" -> EXACTLY
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String "CONTAINS_WORD" -> CONTAINS_WORD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PositionalConstraint" value)
    | _ -> raise (deserialize_wrong_type_error path "PositionalConstraint")
     : positional_constraint)
    : positional_constraint)

let byte_match_target_string_of_yojson = blob_of_yojson

let byte_match_tuple_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     target_string = value_for_key byte_match_target_string_of_yojson "TargetString" _list path;
     text_transformation =
       value_for_key text_transformation_of_yojson "TextTransformation" _list path;
     positional_constraint =
       value_for_key positional_constraint_of_yojson "PositionalConstraint" _list path;
   }
    : byte_match_tuple)

let byte_match_set_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = value_for_key change_action_of_yojson "Action" _list path;
     byte_match_tuple = value_for_key byte_match_tuple_of_yojson "ByteMatchTuple" _list path;
   }
    : byte_match_set_update)

let byte_match_set_updates_of_yojson tree path =
  list_of_yojson byte_match_set_update_of_yojson tree path

let update_byte_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set_id = value_for_key resource_id_of_yojson "ByteMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     updates = value_for_key byte_match_set_updates_of_yojson "Updates" _list path;
   }
    : update_byte_match_set_request)

let waf_tag_operation_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_tag_operation_internal_error_exception)

let waf_tag_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_tag_operation_exception)

let waf_bad_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_bad_request_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let waf_invalid_permission_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_invalid_permission_policy_exception)

let put_permission_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let policy_string_of_yojson = string_of_yojson

let put_permission_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     policy = value_for_key policy_string_of_yojson "Policy" _list path;
   }
    : put_permission_policy_request)

let waf_service_linked_role_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_service_linked_role_error_exception)

let redacted_fields_of_yojson tree path = list_of_yojson field_to_match_of_yojson tree path
let log_destination_configs_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     log_destination_configs =
       value_for_key log_destination_configs_of_yojson "LogDestinationConfigs" _list path;
     redacted_fields =
       option_of_yojson (value_for_key redacted_fields_of_yojson "RedactedFields") _list path;
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

let resource_name_of_yojson = string_of_yojson

let xss_match_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set_id = value_for_key resource_id_of_yojson "XssMatchSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : xss_match_set_summary)

let xss_match_set_summaries_of_yojson tree path =
  list_of_yojson xss_match_set_summary_of_yojson tree path

let next_marker_of_yojson = string_of_yojson

let list_xss_match_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     xss_match_sets =
       option_of_yojson (value_for_key xss_match_set_summaries_of_yojson "XssMatchSets") _list path;
   }
    : list_xss_match_sets_response)

let pagination_limit_of_yojson = int_of_yojson

let list_xss_match_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_xss_match_sets_request)

let web_acl_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : web_acl_summary)

let web_acl_summaries_of_yojson tree path = list_of_yojson web_acl_summary_of_yojson tree path

let list_web_ac_ls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     web_ac_ls = option_of_yojson (value_for_key web_acl_summaries_of_yojson "WebACLs") _list path;
   }
    : list_web_ac_ls_response)

let list_web_ac_ls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_web_ac_ls_request)

let tag_info_for_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       option_of_yojson (value_for_key resource_arn_of_yojson "ResourceARN") _list path;
     tag_list = option_of_yojson (value_for_key tag_list_of_yojson "TagList") _list path;
   }
    : tag_info_for_resource)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     tag_info_for_resource =
       option_of_yojson
         (value_for_key tag_info_for_resource_of_yojson "TagInfoForResource")
         _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     resource_ar_n = value_for_key resource_arn_of_yojson "ResourceARN" _list path;
   }
    : list_tags_for_resource_request)

let metric_name_of_yojson = string_of_yojson

let subscribed_rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
   }
    : subscribed_rule_group_summary)

let subscribed_rule_group_summaries_of_yojson tree path =
  list_of_yojson subscribed_rule_group_summary_of_yojson tree path

let list_subscribed_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     rule_groups =
       option_of_yojson
         (value_for_key subscribed_rule_group_summaries_of_yojson "RuleGroups")
         _list path;
   }
    : list_subscribed_rule_groups_response)

let list_subscribed_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_subscribed_rule_groups_request)

let sql_injection_match_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set_id =
       value_for_key resource_id_of_yojson "SqlInjectionMatchSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : sql_injection_match_set_summary)

let sql_injection_match_set_summaries_of_yojson tree path =
  list_of_yojson sql_injection_match_set_summary_of_yojson tree path

let list_sql_injection_match_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     sql_injection_match_sets =
       option_of_yojson
         (value_for_key sql_injection_match_set_summaries_of_yojson "SqlInjectionMatchSets")
         _list path;
   }
    : list_sql_injection_match_sets_response)

let list_sql_injection_match_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_sql_injection_match_sets_request)

let size_constraint_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set_id = value_for_key resource_id_of_yojson "SizeConstraintSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : size_constraint_set_summary)

let size_constraint_set_summaries_of_yojson tree path =
  list_of_yojson size_constraint_set_summary_of_yojson tree path

let list_size_constraint_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     size_constraint_sets =
       option_of_yojson
         (value_for_key size_constraint_set_summaries_of_yojson "SizeConstraintSets")
         _list path;
   }
    : list_size_constraint_sets_response)

let list_size_constraint_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_size_constraint_sets_request)

let rule_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : rule_summary)

let rule_summaries_of_yojson tree path = list_of_yojson rule_summary_of_yojson tree path

let list_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     rules = option_of_yojson (value_for_key rule_summaries_of_yojson "Rules") _list path;
   }
    : list_rules_response)

let list_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_rules_request)

let rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : rule_group_summary)

let rule_group_summaries_of_yojson tree path = list_of_yojson rule_group_summary_of_yojson tree path

let list_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     rule_groups =
       option_of_yojson (value_for_key rule_group_summaries_of_yojson "RuleGroups") _list path;
   }
    : list_rule_groups_response)

let list_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_rule_groups_request)

let resource_arns_of_yojson tree path = list_of_yojson resource_arn_of_yojson tree path

let list_resources_for_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "ResourceArns") _list path;
   }
    : list_resources_for_web_acl_response)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION_LOAD_BALANCER" -> APPLICATION_LOAD_BALANCER
    | `String "API_GATEWAY" -> API_GATEWAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let list_resources_for_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : list_resources_for_web_acl_request)

let regex_pattern_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : regex_pattern_set_summary)

let regex_pattern_set_summaries_of_yojson tree path =
  list_of_yojson regex_pattern_set_summary_of_yojson tree path

let list_regex_pattern_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     regex_pattern_sets =
       option_of_yojson
         (value_for_key regex_pattern_set_summaries_of_yojson "RegexPatternSets")
         _list path;
   }
    : list_regex_pattern_sets_response)

let list_regex_pattern_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_regex_pattern_sets_request)

let regex_match_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set_id = value_for_key resource_id_of_yojson "RegexMatchSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : regex_match_set_summary)

let regex_match_set_summaries_of_yojson tree path =
  list_of_yojson regex_match_set_summary_of_yojson tree path

let list_regex_match_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     regex_match_sets =
       option_of_yojson
         (value_for_key regex_match_set_summaries_of_yojson "RegexMatchSets")
         _list path;
   }
    : list_regex_match_sets_response)

let list_regex_match_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_regex_match_sets_request)

let list_rate_based_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     rules = option_of_yojson (value_for_key rule_summaries_of_yojson "Rules") _list path;
   }
    : list_rate_based_rules_response)

let list_rate_based_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_rate_based_rules_request)

let logging_configurations_of_yojson tree path =
  list_of_yojson logging_configuration_of_yojson tree path

let list_logging_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     logging_configurations =
       option_of_yojson
         (value_for_key logging_configurations_of_yojson "LoggingConfigurations")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_logging_configurations_response)

let list_logging_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_logging_configurations_request)

let ip_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_id = value_for_key resource_id_of_yojson "IPSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : ip_set_summary)

let ip_set_summaries_of_yojson tree path = list_of_yojson ip_set_summary_of_yojson tree path

let list_ip_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     ip_sets = option_of_yojson (value_for_key ip_set_summaries_of_yojson "IPSets") _list path;
   }
    : list_ip_sets_response)

let list_ip_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_ip_sets_request)

let geo_match_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set_id = value_for_key resource_id_of_yojson "GeoMatchSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : geo_match_set_summary)

let geo_match_set_summaries_of_yojson tree path =
  list_of_yojson geo_match_set_summary_of_yojson tree path

let list_geo_match_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     geo_match_sets =
       option_of_yojson (value_for_key geo_match_set_summaries_of_yojson "GeoMatchSets") _list path;
   }
    : list_geo_match_sets_response)

let list_geo_match_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_geo_match_sets_request)

let byte_match_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set_id = value_for_key resource_id_of_yojson "ByteMatchSetId" _list path;
     name = value_for_key resource_name_of_yojson "Name" _list path;
   }
    : byte_match_set_summary)

let byte_match_set_summaries_of_yojson tree path =
  list_of_yojson byte_match_set_summary_of_yojson tree path

let list_byte_match_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     byte_match_sets =
       option_of_yojson
         (value_for_key byte_match_set_summaries_of_yojson "ByteMatchSets")
         _list path;
   }
    : list_byte_match_sets_response)

let list_byte_match_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_byte_match_sets_request)

let activated_rules_of_yojson tree path = list_of_yojson activated_rule_of_yojson tree path

let list_activated_rules_in_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     activated_rules =
       option_of_yojson (value_for_key activated_rules_of_yojson "ActivatedRules") _list path;
   }
    : list_activated_rules_in_rule_group_response)

let list_activated_rules_in_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = option_of_yojson (value_for_key resource_id_of_yojson "RuleGroupId") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_activated_rules_in_rule_group_request)

let xss_match_tuples_of_yojson tree path = list_of_yojson xss_match_tuple_of_yojson tree path

let xss_match_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set_id = value_for_key resource_id_of_yojson "XssMatchSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     xss_match_tuples = value_for_key xss_match_tuples_of_yojson "XssMatchTuples" _list path;
   }
    : xss_match_set)

let get_xss_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set =
       option_of_yojson (value_for_key xss_match_set_of_yojson "XssMatchSet") _list path;
   }
    : get_xss_match_set_response)

let get_xss_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ xss_match_set_id = value_for_key resource_id_of_yojson "XssMatchSetId" _list path }
    : get_xss_match_set_request)

let waf_unavailable_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_unavailable_entity_exception)

let get_web_acl_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_summary =
       option_of_yojson (value_for_key web_acl_summary_of_yojson "WebACLSummary") _list path;
   }
    : get_web_acl_for_resource_response)

let get_web_acl_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_web_acl_for_resource_request)

let web_ac_l_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     default_action = value_for_key waf_action_of_yojson "DefaultAction" _list path;
     rules = value_for_key activated_rules_of_yojson "Rules" _list path;
     web_acl_arn = option_of_yojson (value_for_key resource_arn_of_yojson "WebACLArn") _list path;
   }
    : web_ac_l)

let get_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path }
    : get_web_acl_response)

let get_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path } : get_web_acl_request)

let sql_injection_match_tuples_of_yojson tree path =
  list_of_yojson sql_injection_match_tuple_of_yojson tree path

let sql_injection_match_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set_id =
       value_for_key resource_id_of_yojson "SqlInjectionMatchSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     sql_injection_match_tuples =
       value_for_key sql_injection_match_tuples_of_yojson "SqlInjectionMatchTuples" _list path;
   }
    : sql_injection_match_set)

let get_sql_injection_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set =
       option_of_yojson
         (value_for_key sql_injection_match_set_of_yojson "SqlInjectionMatchSet")
         _list path;
   }
    : get_sql_injection_match_set_response)

let get_sql_injection_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set_id =
       value_for_key resource_id_of_yojson "SqlInjectionMatchSetId" _list path;
   }
    : get_sql_injection_match_set_request)

let size_constraints_of_yojson tree path = list_of_yojson size_constraint_of_yojson tree path

let size_constraint_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set_id = value_for_key resource_id_of_yojson "SizeConstraintSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     size_constraints = value_for_key size_constraints_of_yojson "SizeConstraints" _list path;
   }
    : size_constraint_set)

let get_size_constraint_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set =
       option_of_yojson (value_for_key size_constraint_set_of_yojson "SizeConstraintSet") _list path;
   }
    : get_size_constraint_set_response)

let get_size_constraint_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ size_constraint_set_id = value_for_key resource_id_of_yojson "SizeConstraintSetId" _list path }
    : get_size_constraint_set_request)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = value_for_key timestamp_of_yojson "StartTime" _list path;
     end_time = value_for_key timestamp_of_yojson "EndTime" _list path;
   }
    : time_window)

let population_size_of_yojson = long_of_yojson
let action_of_yojson = string_of_yojson
let sample_weight_of_yojson = long_of_yojson
let header_value_of_yojson = string_of_yojson
let header_name_of_yojson = string_of_yojson

let http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key header_name_of_yojson "Name") _list path;
     value = option_of_yojson (value_for_key header_value_of_yojson "Value") _list path;
   }
    : http_header)

let http_headers_of_yojson tree path = list_of_yojson http_header_of_yojson tree path
let http_version_of_yojson = string_of_yojson
let http_method_of_yojson = string_of_yojson
let uri_string_of_yojson = string_of_yojson
let country_of_yojson = string_of_yojson
let ip_string_of_yojson = string_of_yojson

let http_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_i_p = option_of_yojson (value_for_key ip_string_of_yojson "ClientIP") _list path;
     country = option_of_yojson (value_for_key country_of_yojson "Country") _list path;
     ur_i = option_of_yojson (value_for_key uri_string_of_yojson "URI") _list path;
     method_ = option_of_yojson (value_for_key http_method_of_yojson "Method") _list path;
     http_version = option_of_yojson (value_for_key http_version_of_yojson "HTTPVersion") _list path;
     headers = option_of_yojson (value_for_key http_headers_of_yojson "Headers") _list path;
   }
    : http_request)

let sampled_http_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request = value_for_key http_request_of_yojson "Request" _list path;
     weight = value_for_key sample_weight_of_yojson "Weight" _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     rule_within_rule_group =
       option_of_yojson (value_for_key resource_id_of_yojson "RuleWithinRuleGroup") _list path;
   }
    : sampled_http_request)

let sampled_http_requests_of_yojson tree path =
  list_of_yojson sampled_http_request_of_yojson tree path

let get_sampled_requests_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sampled_requests =
       option_of_yojson (value_for_key sampled_http_requests_of_yojson "SampledRequests") _list path;
     population_size =
       option_of_yojson (value_for_key population_size_of_yojson "PopulationSize") _list path;
     time_window = option_of_yojson (value_for_key time_window_of_yojson "TimeWindow") _list path;
   }
    : get_sampled_requests_response)

let get_sampled_requests_max_items_of_yojson = long_of_yojson

let get_sampled_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebAclId" _list path;
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     max_items = value_for_key get_sampled_requests_max_items_of_yojson "MaxItems" _list path;
   }
    : get_sampled_requests_request)

let rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
   }
    : rule_group)

let get_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path }
    : get_rule_group_response)

let get_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path }
    : get_rule_group_request)

let predicates_of_yojson tree path = list_of_yojson predicate_of_yojson tree path

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     predicates = value_for_key predicates_of_yojson "Predicates" _list path;
   }
    : rule)

let get_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule = option_of_yojson (value_for_key rule_of_yojson "Rule") _list path } : get_rule_response)

let get_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_id = value_for_key resource_id_of_yojson "RuleId" _list path } : get_rule_request)

let regex_pattern_strings_of_yojson tree path =
  list_of_yojson regex_pattern_string_of_yojson tree path

let regex_pattern_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     regex_pattern_strings =
       value_for_key regex_pattern_strings_of_yojson "RegexPatternStrings" _list path;
   }
    : regex_pattern_set)

let get_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set =
       option_of_yojson (value_for_key regex_pattern_set_of_yojson "RegexPatternSet") _list path;
   }
    : get_regex_pattern_set_response)

let get_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path }
    : get_regex_pattern_set_request)

let regex_match_tuples_of_yojson tree path = list_of_yojson regex_match_tuple_of_yojson tree path

let regex_match_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set_id =
       option_of_yojson (value_for_key resource_id_of_yojson "RegexMatchSetId") _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     regex_match_tuples =
       option_of_yojson (value_for_key regex_match_tuples_of_yojson "RegexMatchTuples") _list path;
   }
    : regex_match_set)

let get_regex_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set =
       option_of_yojson (value_for_key regex_match_set_of_yojson "RegexMatchSet") _list path;
   }
    : get_regex_match_set_response)

let get_regex_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ regex_match_set_id = value_for_key resource_id_of_yojson "RegexMatchSetId" _list path }
    : get_regex_match_set_request)

let managed_key_of_yojson = string_of_yojson
let managed_keys_of_yojson tree path = list_of_yojson managed_key_of_yojson tree path

let get_rate_based_rule_managed_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_keys = option_of_yojson (value_for_key managed_keys_of_yojson "ManagedKeys") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_rate_based_rule_managed_keys_response)

let get_rate_based_rule_managed_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_rate_based_rule_managed_keys_request)

let rate_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "IP" -> IP
    | `String value -> raise (deserialize_unknown_enum_value_error path "RateKey" value)
    | _ -> raise (deserialize_wrong_type_error path "RateKey")
     : rate_key)
    : rate_key)

let rate_based_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     match_predicates = value_for_key predicates_of_yojson "MatchPredicates" _list path;
     rate_key = value_for_key rate_key_of_yojson "RateKey" _list path;
     rate_limit = value_for_key rate_limit_of_yojson "RateLimit" _list path;
   }
    : rate_based_rule)

let get_rate_based_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule = option_of_yojson (value_for_key rate_based_rule_of_yojson "Rule") _list path }
    : get_rate_based_rule_response)

let get_rate_based_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_id = value_for_key resource_id_of_yojson "RuleId" _list path }
    : get_rate_based_rule_request)

let get_permission_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_string_of_yojson "Policy") _list path }
    : get_permission_policy_response)

let get_permission_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_permission_policy_request)

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
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_logging_configuration_request)

let ip_set_descriptors_of_yojson tree path = list_of_yojson ip_set_descriptor_of_yojson tree path

let ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_id = value_for_key resource_id_of_yojson "IPSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     ip_set_descriptors = value_for_key ip_set_descriptors_of_yojson "IPSetDescriptors" _list path;
   }
    : ip_set)

let get_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ip_set = option_of_yojson (value_for_key ip_set_of_yojson "IPSet") _list path }
    : get_ip_set_response)

let get_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ip_set_id = value_for_key resource_id_of_yojson "IPSetId" _list path } : get_ip_set_request)

let geo_match_constraints_of_yojson tree path =
  list_of_yojson geo_match_constraint_of_yojson tree path

let geo_match_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set_id = value_for_key resource_id_of_yojson "GeoMatchSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     geo_match_constraints =
       value_for_key geo_match_constraints_of_yojson "GeoMatchConstraints" _list path;
   }
    : geo_match_set)

let get_geo_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set =
       option_of_yojson (value_for_key geo_match_set_of_yojson "GeoMatchSet") _list path;
   }
    : get_geo_match_set_response)

let get_geo_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ geo_match_set_id = value_for_key resource_id_of_yojson "GeoMatchSetId" _list path }
    : get_geo_match_set_request)

let change_token_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONED" -> PROVISIONED
    | `String "PENDING" -> PENDING
    | `String "INSYNC" -> INSYNC
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeTokenStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeTokenStatus")
     : change_token_status)
    : change_token_status)

let get_change_token_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token_status =
       option_of_yojson (value_for_key change_token_status_of_yojson "ChangeTokenStatus") _list path;
   }
    : get_change_token_status_response)

let get_change_token_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ change_token = value_for_key change_token_of_yojson "ChangeToken" _list path }
    : get_change_token_status_request)

let get_change_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : get_change_token_response)

let get_change_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let byte_match_tuples_of_yojson tree path = list_of_yojson byte_match_tuple_of_yojson tree path

let byte_match_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set_id = value_for_key resource_id_of_yojson "ByteMatchSetId" _list path;
     name = option_of_yojson (value_for_key resource_name_of_yojson "Name") _list path;
     byte_match_tuples = value_for_key byte_match_tuples_of_yojson "ByteMatchTuples" _list path;
   }
    : byte_match_set)

let get_byte_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set =
       option_of_yojson (value_for_key byte_match_set_of_yojson "ByteMatchSet") _list path;
   }
    : get_byte_match_set_response)

let get_byte_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ byte_match_set_id = value_for_key resource_id_of_yojson "ByteMatchSetId" _list path }
    : get_byte_match_set_request)

let disassociate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : disassociate_web_acl_request)

let waf_non_empty_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_non_empty_entity_exception)

let delete_xss_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_xss_match_set_response)

let delete_xss_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set_id = value_for_key resource_id_of_yojson "XssMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_xss_match_set_request)

let delete_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_web_acl_response)

let delete_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_web_acl_request)

let delete_sql_injection_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_sql_injection_match_set_response)

let delete_sql_injection_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set_id =
       value_for_key resource_id_of_yojson "SqlInjectionMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_sql_injection_match_set_request)

let delete_size_constraint_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_size_constraint_set_response)

let delete_size_constraint_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set_id = value_for_key resource_id_of_yojson "SizeConstraintSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_size_constraint_set_request)

let delete_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_rule_group_response)

let delete_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group_id = value_for_key resource_id_of_yojson "RuleGroupId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_rule_group_request)

let delete_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_rule_response)

let delete_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_rule_request)

let delete_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_regex_pattern_set_response)

let delete_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set_id = value_for_key resource_id_of_yojson "RegexPatternSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_regex_pattern_set_request)

let delete_regex_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_regex_match_set_response)

let delete_regex_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set_id = value_for_key resource_id_of_yojson "RegexMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_regex_match_set_request)

let delete_rate_based_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_rate_based_rule_response)

let delete_rate_based_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_id = value_for_key resource_id_of_yojson "RuleId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_rate_based_rule_request)

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
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_logging_configuration_request)

let delete_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_ip_set_response)

let delete_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set_id = value_for_key resource_id_of_yojson "IPSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_ip_set_request)

let delete_geo_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_geo_match_set_response)

let delete_geo_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set_id = value_for_key resource_id_of_yojson "GeoMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_geo_match_set_request)

let delete_byte_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : delete_byte_match_set_response)

let delete_byte_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set_id = value_for_key resource_id_of_yojson "ByteMatchSetId" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : delete_byte_match_set_request)

let create_xss_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     xss_match_set =
       option_of_yojson (value_for_key xss_match_set_of_yojson "XssMatchSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_xss_match_set_response)

let create_xss_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_xss_match_set_request)

let error_reason_of_yojson = string_of_yojson

let migration_error_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENTITY_NOT_SUPPORTED" -> ENTITY_NOT_SUPPORTED
    | `String "ENTITY_NOT_FOUND" -> ENTITY_NOT_FOUND
    | `String "S3_BUCKET_NO_PERMISSION" -> S3_BUCKET_NO_PERMISSION
    | `String "S3_BUCKET_NOT_ACCESSIBLE" -> S3_BUCKET_NOT_ACCESSIBLE
    | `String "S3_BUCKET_NOT_FOUND" -> S3_BUCKET_NOT_FOUND
    | `String "S3_BUCKET_INVALID_REGION" -> S3_BUCKET_INVALID_REGION
    | `String "S3_INTERNAL_ERROR" -> S3_INTERNAL_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "MigrationErrorType" value)
    | _ -> raise (deserialize_wrong_type_error path "MigrationErrorType")
     : migration_error_type)
    : migration_error_type)

let waf_entity_migration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     migration_error_type =
       option_of_yojson
         (value_for_key migration_error_type_of_yojson "MigrationErrorType")
         _list path;
     migration_error_reason =
       option_of_yojson (value_for_key error_reason_of_yojson "MigrationErrorReason") _list path;
   }
    : waf_entity_migration_exception)

let s3_object_url_of_yojson = string_of_yojson

let create_web_acl_migration_stack_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_object_url = value_for_key s3_object_url_of_yojson "S3ObjectUrl" _list path }
    : create_web_acl_migration_stack_response)

let ignore_unsupported_type_of_yojson = bool_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let create_web_acl_migration_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     s3_bucket_name = value_for_key s3_bucket_name_of_yojson "S3BucketName" _list path;
     ignore_unsupported_type =
       value_for_key ignore_unsupported_type_of_yojson "IgnoreUnsupportedType" _list path;
   }
    : create_web_acl_migration_stack_request)

let create_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_web_acl_response)

let create_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     default_action = value_for_key waf_action_of_yojson "DefaultAction" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_web_acl_request)

let create_sql_injection_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_injection_match_set =
       option_of_yojson
         (value_for_key sql_injection_match_set_of_yojson "SqlInjectionMatchSet")
         _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_sql_injection_match_set_response)

let create_sql_injection_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_sql_injection_match_set_request)

let create_size_constraint_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     size_constraint_set =
       option_of_yojson (value_for_key size_constraint_set_of_yojson "SizeConstraintSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_size_constraint_set_response)

let create_size_constraint_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_size_constraint_set_request)

let create_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_rule_group_response)

let create_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_rule_group_request)

let create_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule = option_of_yojson (value_for_key rule_of_yojson "Rule") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_rule_response)

let create_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_rule_request)

let create_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set =
       option_of_yojson (value_for_key regex_pattern_set_of_yojson "RegexPatternSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_regex_pattern_set_response)

let create_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_regex_pattern_set_request)

let create_regex_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_match_set =
       option_of_yojson (value_for_key regex_match_set_of_yojson "RegexMatchSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_regex_match_set_response)

let create_regex_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_regex_match_set_request)

let create_rate_based_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule = option_of_yojson (value_for_key rate_based_rule_of_yojson "Rule") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_rate_based_rule_response)

let create_rate_based_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
     rate_key = value_for_key rate_key_of_yojson "RateKey" _list path;
     rate_limit = value_for_key rate_limit_of_yojson "RateLimit" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_rate_based_rule_request)

let create_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set = option_of_yojson (value_for_key ip_set_of_yojson "IPSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_ip_set_response)

let create_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_ip_set_request)

let create_geo_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     geo_match_set =
       option_of_yojson (value_for_key geo_match_set_of_yojson "GeoMatchSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_geo_match_set_response)

let create_geo_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_geo_match_set_request)

let create_byte_match_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_set =
       option_of_yojson (value_for_key byte_match_set_of_yojson "ByteMatchSet") _list path;
     change_token = option_of_yojson (value_for_key change_token_of_yojson "ChangeToken") _list path;
   }
    : create_byte_match_set_response)

let create_byte_match_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key resource_name_of_yojson "Name" _list path;
     change_token = value_for_key change_token_of_yojson "ChangeToken" _list path;
   }
    : create_byte_match_set_request)

let associate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_id = value_for_key resource_id_of_yojson "WebACLId" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : associate_web_acl_request)
