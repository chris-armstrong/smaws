open Smaws_Lib.Json.DeserializeHelpers
open Types

let api_key_of_yojson = string_of_yojson
let api_key_version_of_yojson = int_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let token_domain_of_yojson = string_of_yojson
let token_domains_of_yojson tree path = list_of_yojson token_domain_of_yojson tree path

let api_key_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     api_key = option_of_yojson (value_for_key api_key_of_yojson "APIKey") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimestamp") _list path;
     version = option_of_yojson (value_for_key api_key_version_of_yojson "Version") _list path;
   }
    : api_key_summary)

let api_key_summaries_of_yojson tree path = list_of_yojson api_key_summary_of_yojson tree path
let api_key_token_domains_of_yojson tree path = list_of_yojson token_domain_of_yojson tree path
let as_n_of_yojson = long_of_yojson
let boolean__of_yojson = bool_of_yojson
let failure_value_of_yojson = string_of_yojson

let response_inspection_json_failure_values_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let success_value_of_yojson = string_of_yojson

let response_inspection_json_success_values_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let field_identifier_of_yojson = string_of_yojson

let response_inspection_json_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key field_identifier_of_yojson "Identifier" _list path;
     success_values =
       value_for_key response_inspection_json_success_values_of_yojson "SuccessValues" _list path;
     failure_values =
       value_for_key response_inspection_json_failure_values_of_yojson "FailureValues" _list path;
   }
    : response_inspection_json)

let response_inspection_body_contains_failure_strings_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let response_inspection_body_contains_success_strings_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let response_inspection_body_contains_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     success_strings =
       value_for_key response_inspection_body_contains_success_strings_of_yojson "SuccessStrings"
         _list path;
     failure_strings =
       value_for_key response_inspection_body_contains_failure_strings_of_yojson "FailureStrings"
         _list path;
   }
    : response_inspection_body_contains)

let response_inspection_header_failure_values_of_yojson tree path =
  list_of_yojson failure_value_of_yojson tree path

let response_inspection_header_success_values_of_yojson tree path =
  list_of_yojson success_value_of_yojson tree path

let response_inspection_header_name_of_yojson = string_of_yojson

let response_inspection_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key response_inspection_header_name_of_yojson "Name" _list path;
     success_values =
       value_for_key response_inspection_header_success_values_of_yojson "SuccessValues" _list path;
     failure_values =
       value_for_key response_inspection_header_failure_values_of_yojson "FailureValues" _list path;
   }
    : response_inspection_header)

let failure_code_of_yojson = int_of_yojson

let response_inspection_status_code_failure_codes_of_yojson tree path =
  list_of_yojson failure_code_of_yojson tree path

let success_code_of_yojson = int_of_yojson

let response_inspection_status_code_success_codes_of_yojson tree path =
  list_of_yojson success_code_of_yojson tree path

let response_inspection_status_code_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     success_codes =
       value_for_key response_inspection_status_code_success_codes_of_yojson "SuccessCodes" _list
         path;
     failure_codes =
       value_for_key response_inspection_status_code_failure_codes_of_yojson "FailureCodes" _list
         path;
   }
    : response_inspection_status_code)

let response_inspection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson
         (value_for_key response_inspection_status_code_of_yojson "StatusCode")
         _list path;
     header =
       option_of_yojson (value_for_key response_inspection_header_of_yojson "Header") _list path;
     body_contains =
       option_of_yojson
         (value_for_key response_inspection_body_contains_of_yojson "BodyContains")
         _list path;
     json = option_of_yojson (value_for_key response_inspection_json_of_yojson "Json") _list path;
   }
    : response_inspection)

let address_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : address_field)

let address_fields_of_yojson tree path = list_of_yojson address_field_of_yojson tree path

let phone_number_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : phone_number_field)

let phone_number_fields_of_yojson tree path = list_of_yojson phone_number_field_of_yojson tree path

let email_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path } : email_field)

let password_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : password_field)

let username_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key field_identifier_of_yojson "Identifier" _list path }
    : username_field)

let payload_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "JSON" -> JSON
    | `String "FORM_ENCODED" -> FORM_ENCODED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PayloadType" value)
    | _ -> raise (deserialize_wrong_type_error path "PayloadType")
     : payload_type)
    : payload_type)

let request_inspection_acf_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload_type = value_for_key payload_type_of_yojson "PayloadType" _list path;
     username_field =
       option_of_yojson (value_for_key username_field_of_yojson "UsernameField") _list path;
     password_field =
       option_of_yojson (value_for_key password_field_of_yojson "PasswordField") _list path;
     email_field = option_of_yojson (value_for_key email_field_of_yojson "EmailField") _list path;
     phone_number_fields =
       option_of_yojson (value_for_key phone_number_fields_of_yojson "PhoneNumberFields") _list path;
     address_fields =
       option_of_yojson (value_for_key address_fields_of_yojson "AddressFields") _list path;
   }
    : request_inspection_acf_p)

let registration_page_path_string_of_yojson = string_of_yojson
let creation_path_string_of_yojson = string_of_yojson

let aws_managed_rules_acfp_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_path = value_for_key creation_path_string_of_yojson "CreationPath" _list path;
     registration_page_path =
       value_for_key registration_page_path_string_of_yojson "RegistrationPagePath" _list path;
     request_inspection =
       value_for_key request_inspection_acf_p_of_yojson "RequestInspection" _list path;
     response_inspection =
       option_of_yojson
         (value_for_key response_inspection_of_yojson "ResponseInspection")
         _list path;
     enable_regex_in_path =
       option_of_yojson (value_for_key boolean__of_yojson "EnableRegexInPath") _list path;
   }
    : aws_managed_rules_acfp_rule_set)

let request_inspection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload_type = value_for_key payload_type_of_yojson "PayloadType" _list path;
     username_field = value_for_key username_field_of_yojson "UsernameField" _list path;
     password_field = value_for_key password_field_of_yojson "PasswordField" _list path;
   }
    : request_inspection)

let string__of_yojson = string_of_yojson

let aws_managed_rules_atp_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_path = value_for_key string__of_yojson "LoginPath" _list path;
     request_inspection =
       option_of_yojson (value_for_key request_inspection_of_yojson "RequestInspection") _list path;
     response_inspection =
       option_of_yojson
         (value_for_key response_inspection_of_yojson "ResponseInspection")
         _list path;
     enable_regex_in_path =
       option_of_yojson (value_for_key boolean__of_yojson "EnableRegexInPath") _list path;
   }
    : aws_managed_rules_atp_rule_set)

let sensitivity_to_act_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
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

let usage_of_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UsageOfAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageOfAction")
     : usage_of_action)
    : usage_of_action)

let client_side_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_of_action = value_for_key usage_of_action_of_yojson "UsageOfAction" _list path;
     sensitivity =
       option_of_yojson (value_for_key sensitivity_to_act_of_yojson "Sensitivity") _list path;
     exempt_uri_regular_expressions =
       option_of_yojson
         (value_for_key regular_expression_list_of_yojson "ExemptUriRegularExpressions")
         _list path;
   }
    : client_side_action)

let client_side_action_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ challenge = value_for_key client_side_action_of_yojson "Challenge" _list path }
    : client_side_action_config)

let aws_managed_rules_anti_d_do_s_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_side_action_config =
       value_for_key client_side_action_config_of_yojson "ClientSideActionConfig" _list path;
     sensitivity_to_block =
       option_of_yojson (value_for_key sensitivity_to_act_of_yojson "SensitivityToBlock") _list path;
   }
    : aws_managed_rules_anti_d_do_s_rule_set)

let enable_machine_learning_of_yojson = bool_of_yojson

let inspection_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMMON" -> COMMON
    | `String "TARGETED" -> TARGETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InspectionLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "InspectionLevel")
     : inspection_level)
    : inspection_level)

let aws_managed_rules_bot_control_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inspection_level = value_for_key inspection_level_of_yojson "InspectionLevel" _list path;
     enable_machine_learning =
       option_of_yojson
         (value_for_key enable_machine_learning_of_yojson "EnableMachineLearning")
         _list path;
   }
    : aws_managed_rules_bot_control_rule_set)

let error_message_of_yojson = string_of_yojson

let waf_unavailable_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_unavailable_entity_exception)

let waf_subscription_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_subscription_not_found_exception)

let waf_optimistic_lock_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_optimistic_lock_exception)

let waf_nonexistent_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_nonexistent_item_exception)

let source_type_of_yojson = string_of_yojson

let waf_limits_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     source_type = option_of_yojson (value_for_key source_type_of_yojson "SourceType") _list path;
   }
    : waf_limits_exceeded_exception)

let waf_invalid_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_invalid_resource_exception)

let error_reason_of_yojson = string_of_yojson
let parameter_exception_parameter_of_yojson = string_of_yojson

let parameter_exception_field_of_yojson (tree : t) path =
  ((match tree with
    | `String "WEB_ACL" -> WEB_ACL
    | `String "RULE_GROUP" -> RULE_GROUP
    | `String "REGEX_PATTERN_SET" -> REGEX_PATTERN_SET
    | `String "IP_SET" -> IP_SET
    | `String "MANAGED_RULE_SET" -> MANAGED_RULE_SET
    | `String "RULE" -> RULE
    | `String "EXCLUDED_RULE" -> EXCLUDED_RULE
    | `String "STATEMENT" -> STATEMENT
    | `String "BYTE_MATCH_STATEMENT" -> BYTE_MATCH_STATEMENT
    | `String "SQLI_MATCH_STATEMENT" -> SQLI_MATCH_STATEMENT
    | `String "XSS_MATCH_STATEMENT" -> XSS_MATCH_STATEMENT
    | `String "SIZE_CONSTRAINT_STATEMENT" -> SIZE_CONSTRAINT_STATEMENT
    | `String "GEO_MATCH_STATEMENT" -> GEO_MATCH_STATEMENT
    | `String "RATE_BASED_STATEMENT" -> RATE_BASED_STATEMENT
    | `String "RULE_GROUP_REFERENCE_STATEMENT" -> RULE_GROUP_REFERENCE_STATEMENT
    | `String "REGEX_PATTERN_REFERENCE_STATEMENT" -> REGEX_PATTERN_REFERENCE_STATEMENT
    | `String "IP_SET_REFERENCE_STATEMENT" -> IP_SET_REFERENCE_STATEMENT
    | `String "MANAGED_RULE_SET_STATEMENT" -> MANAGED_RULE_SET_STATEMENT
    | `String "LABEL_MATCH_STATEMENT" -> LABEL_MATCH_STATEMENT
    | `String "AND_STATEMENT" -> AND_STATEMENT
    | `String "OR_STATEMENT" -> OR_STATEMENT
    | `String "NOT_STATEMENT" -> NOT_STATEMENT
    | `String "IP_ADDRESS" -> IP_ADDRESS
    | `String "IP_ADDRESS_VERSION" -> IP_ADDRESS_VERSION
    | `String "FIELD_TO_MATCH" -> FIELD_TO_MATCH
    | `String "TEXT_TRANSFORMATION" -> TEXT_TRANSFORMATION
    | `String "SINGLE_QUERY_ARGUMENT" -> SINGLE_QUERY_ARGUMENT
    | `String "SINGLE_HEADER" -> SINGLE_HEADER
    | `String "DEFAULT_ACTION" -> DEFAULT_ACTION
    | `String "RULE_ACTION" -> RULE_ACTION
    | `String "ENTITY_LIMIT" -> ENTITY_LIMIT
    | `String "OVERRIDE_ACTION" -> OVERRIDE_ACTION
    | `String "SCOPE_VALUE" -> SCOPE_VALUE
    | `String "RESOURCE_ARN" -> RESOURCE_ARN
    | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
    | `String "TAGS" -> TAGS
    | `String "TAG_KEYS" -> TAG_KEYS
    | `String "METRIC_NAME" -> METRIC_NAME
    | `String "FIREWALL_MANAGER_STATEMENT" -> FIREWALL_MANAGER_STATEMENT
    | `String "FALLBACK_BEHAVIOR" -> FALLBACK_BEHAVIOR
    | `String "POSITION" -> POSITION
    | `String "FORWARDED_IP_CONFIG" -> FORWARDED_IP_CONFIG
    | `String "IP_SET_FORWARDED_IP_CONFIG" -> IP_SET_FORWARDED_IP_CONFIG
    | `String "HEADER_NAME" -> HEADER_NAME
    | `String "CUSTOM_REQUEST_HANDLING" -> CUSTOM_REQUEST_HANDLING
    | `String "RESPONSE_CONTENT_TYPE" -> RESPONSE_CONTENT_TYPE
    | `String "CUSTOM_RESPONSE" -> CUSTOM_RESPONSE
    | `String "CUSTOM_RESPONSE_BODY" -> CUSTOM_RESPONSE_BODY
    | `String "JSON_MATCH_PATTERN" -> JSON_MATCH_PATTERN
    | `String "JSON_MATCH_SCOPE" -> JSON_MATCH_SCOPE
    | `String "BODY_PARSING_FALLBACK_BEHAVIOR" -> BODY_PARSING_FALLBACK_BEHAVIOR
    | `String "LOGGING_FILTER" -> LOGGING_FILTER
    | `String "FILTER_CONDITION" -> FILTER_CONDITION
    | `String "EXPIRE_TIMESTAMP" -> EXPIRE_TIMESTAMP
    | `String "CHANGE_PROPAGATION_STATUS" -> CHANGE_PROPAGATION_STATUS
    | `String "ASSOCIABLE_RESOURCE" -> ASSOCIABLE_RESOURCE
    | `String "LOG_DESTINATION" -> LOG_DESTINATION
    | `String "MANAGED_RULE_GROUP_CONFIG" -> MANAGED_RULE_GROUP_CONFIG
    | `String "PAYLOAD_TYPE" -> PAYLOAD_TYPE
    | `String "HEADER_MATCH_PATTERN" -> HEADER_MATCH_PATTERN
    | `String "COOKIE_MATCH_PATTERN" -> COOKIE_MATCH_PATTERN
    | `String "MAP_MATCH_SCOPE" -> MAP_MATCH_SCOPE
    | `String "OVERSIZE_HANDLING" -> OVERSIZE_HANDLING
    | `String "CHALLENGE_CONFIG" -> CHALLENGE_CONFIG
    | `String "TOKEN_DOMAIN" -> TOKEN_DOMAIN
    | `String "ATP_RULE_SET_RESPONSE_INSPECTION" -> ATP_RULE_SET_RESPONSE_INSPECTION
    | `String "ASSOCIATED_RESOURCE_TYPE" -> ASSOCIATED_RESOURCE_TYPE
    | `String "SCOPE_DOWN" -> SCOPE_DOWN
    | `String "CUSTOM_KEYS" -> CUSTOM_KEYS
    | `String "ACP_RULE_SET_RESPONSE_INSPECTION" -> ACP_RULE_SET_RESPONSE_INSPECTION
    | `String "DATA_PROTECTION_CONFIG" -> DATA_PROTECTION_CONFIG
    | `String "LOW_REPUTATION_MODE" -> LOW_REPUTATION_MODE
    | `String "MONETIZATION_CONFIG" -> MONETIZATION_CONFIG
    | `String "WALLET_ADDRESS" -> WALLET_ADDRESS
    | `String "PRICE_AMOUNT" -> PRICE_AMOUNT
    | `String "PAYMENT_NETWORK" -> PAYMENT_NETWORK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ParameterExceptionField" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterExceptionField")
     : parameter_exception_field)
    : parameter_exception_field)

let waf_invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     field = option_of_yojson (value_for_key parameter_exception_field_of_yojson "Field") _list path;
     parameter =
       option_of_yojson
         (value_for_key parameter_exception_parameter_of_yojson "Parameter")
         _list path;
     reason = option_of_yojson (value_for_key error_reason_of_yojson "Reason") _list path;
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

let required_pricing_plan_name_of_yojson = string_of_yojson
let pricing_plan_feature_name_of_yojson = string_of_yojson

let disallowed_feature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feature =
       option_of_yojson (value_for_key pricing_plan_feature_name_of_yojson "Feature") _list path;
     required_pricing_plan =
       option_of_yojson
         (value_for_key required_pricing_plan_name_of_yojson "RequiredPricingPlan")
         _list path;
   }
    : disallowed_feature)

let disallowed_features_of_yojson tree path = list_of_yojson disallowed_feature_of_yojson tree path

let waf_feature_not_included_in_pricing_plan_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     disallowed_features =
       option_of_yojson
         (value_for_key disallowed_features_of_yojson "DisallowedFeatures")
         _list path;
   }
    : waf_feature_not_included_in_pricing_plan_exception)

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

let lock_token_of_yojson = string_of_yojson

let update_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_web_acl_response)

let currency_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "REAL" -> REAL
    | `String "TEST" -> TEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyMode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyMode")
     : currency_mode)
    : currency_mode)

let crypto_currency_of_yojson (tree : t) path =
  ((match tree with
    | `String "USDC" -> USDC
    | `String value -> raise (deserialize_unknown_enum_value_error path "CryptoCurrency" value)
    | _ -> raise (deserialize_wrong_type_error path "CryptoCurrency")
     : crypto_currency)
    : crypto_currency)

let price_amount_of_yojson = string_of_yojson

let price_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = value_for_key price_amount_of_yojson "Amount" _list path;
     currency = value_for_key crypto_currency_of_yojson "Currency" _list path;
   }
    : price)

let prices_of_yojson tree path = list_of_yojson price_of_yojson tree path
let wallet_address_of_yojson = string_of_yojson

let blockchain_chain_of_yojson (tree : t) path =
  ((match tree with
    | `String "BASE" -> BASE
    | `String "SOLANA" -> SOLANA
    | `String "BASE_SEPOLIA" -> BASE_SEPOLIA
    | `String "SOLANA_DEVNET" -> SOLANA_DEVNET
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockchainChain" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockchainChain")
     : blockchain_chain)
    : blockchain_chain)

let payment_network_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     chain = value_for_key blockchain_chain_of_yojson "Chain" _list path;
     wallet_address = value_for_key wallet_address_of_yojson "WalletAddress" _list path;
     prices = value_for_key prices_of_yojson "Prices" _list path;
   }
    : payment_network)

let payment_networks_of_yojson tree path = list_of_yojson payment_network_of_yojson tree path

let crypto_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ payment_networks = value_for_key payment_networks_of_yojson "PaymentNetworks" _list path }
    : crypto_config)

let monetization_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     crypto_config =
       option_of_yojson (value_for_key crypto_config_of_yojson "CryptoConfig") _list path;
     currency_mode =
       option_of_yojson (value_for_key currency_mode_of_yojson "CurrencyMode") _list path;
   }
    : monetization_config)

let attribute_value_of_yojson = string_of_yojson
let attribute_values_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path
let attribute_name_of_yojson = string_of_yojson

let application_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key attribute_name_of_yojson "Name") _list path;
     values = option_of_yojson (value_for_key attribute_values_of_yojson "Values") _list path;
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

let low_reputation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE_UNDER_DDOS" -> ACTIVE_UNDER_DDOS
    | `String "ALWAYS_ON" -> ALWAYS_ON
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

let size_inspection_limit_of_yojson (tree : t) path =
  ((match tree with
    | `String "KB_16" -> KB_16
    | `String "KB_32" -> KB_32
    | `String "KB_48" -> KB_48
    | `String "KB_64" -> KB_64
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
  ((match tree with
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String "API_GATEWAY" -> API_GATEWAY
    | `String "COGNITO_USER_POOL" -> COGNITO_USER_POOL
    | `String "APP_RUNNER_SERVICE" -> APP_RUNNER_SERVICE
    | `String "VERIFIED_ACCESS_INSTANCE" -> VERIFIED_ACCESS_INSTANCE
    | `String "AGENTCORE_GATEWAY" -> AGENTCORE_GATEWAY
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

let time_window_second_of_yojson = long_of_yojson

let immunity_time_property_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ immunity_time = value_for_key time_window_second_of_yojson "ImmunityTime" _list path }
    : immunity_time_property)

let challenge_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     immunity_time_property =
       option_of_yojson
         (value_for_key immunity_time_property_of_yojson "ImmunityTimeProperty")
         _list path;
   }
    : challenge_config)

let captcha_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     immunity_time_property =
       option_of_yojson
         (value_for_key immunity_time_property_of_yojson "ImmunityTimeProperty")
         _list path;
   }
    : captcha_config)

let response_content_of_yojson = string_of_yojson

let response_content_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT_PLAIN" -> TEXT_PLAIN
    | `String "TEXT_HTML" -> TEXT_HTML
    | `String "APPLICATION_JSON" -> APPLICATION_JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResponseContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResponseContentType")
     : response_content_type)
    : response_content_type)

let custom_response_body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_type = value_for_key response_content_type_of_yojson "ContentType" _list path;
     content = value_for_key response_content_of_yojson "Content" _list path;
   }
    : custom_response_body)

let entity_name_of_yojson = string_of_yojson

let custom_response_bodies_of_yojson tree path =
  map_of_yojson entity_name_of_yojson custom_response_body_of_yojson tree path

let data_protection_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBSTITUTION" -> SUBSTITUTION
    | `String "HASH" -> HASH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataProtectionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DataProtectionAction")
     : data_protection_action)
    : data_protection_action)

let field_to_protect_key_name_of_yojson = string_of_yojson

let field_to_protect_keys_of_yojson tree path =
  list_of_yojson field_to_protect_key_name_of_yojson tree path

let field_to_protect_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SINGLE_HEADER" -> SINGLE_HEADER
    | `String "SINGLE_COOKIE" -> SINGLE_COOKIE
    | `String "SINGLE_QUERY_ARGUMENT" -> SINGLE_QUERY_ARGUMENT
    | `String "QUERY_STRING" -> QUERY_STRING
    | `String "BODY" -> BODY
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldToProtectType" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldToProtectType")
     : field_to_protect_type)
    : field_to_protect_type)

let field_to_protect_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_type = value_for_key field_to_protect_type_of_yojson "FieldType" _list path;
     field_keys =
       option_of_yojson (value_for_key field_to_protect_keys_of_yojson "FieldKeys") _list path;
   }
    : field_to_protect)

let data_protection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field = value_for_key field_to_protect_of_yojson "Field" _list path;
     action = value_for_key data_protection_action_of_yojson "Action" _list path;
     exclude_rule_match_details =
       option_of_yojson (value_for_key boolean__of_yojson "ExcludeRuleMatchDetails") _list path;
     exclude_rate_based_details =
       option_of_yojson (value_for_key boolean__of_yojson "ExcludeRateBasedDetails") _list path;
   }
    : data_protection)

let data_protections_of_yojson tree path = list_of_yojson data_protection_of_yojson tree path

let data_protection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data_protections = value_for_key data_protections_of_yojson "DataProtections" _list path }
    : data_protection_config)

let metric_name_of_yojson = string_of_yojson

let visibility_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sampled_requests_enabled = value_for_key boolean__of_yojson "SampledRequestsEnabled" _list path;
     cloud_watch_metrics_enabled =
       value_for_key boolean__of_yojson "CloudWatchMetricsEnabled" _list path;
     metric_name = value_for_key metric_name_of_yojson "MetricName" _list path;
   }
    : visibility_config)

let label_name_of_yojson = string_of_yojson

let label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key label_name_of_yojson "Name" _list path } : label)

let labels_of_yojson tree path = list_of_yojson label_of_yojson tree path

let none_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let custom_http_header_value_of_yojson = string_of_yojson
let custom_http_header_name_of_yojson = string_of_yojson

let custom_http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key custom_http_header_name_of_yojson "Name" _list path;
     value = value_for_key custom_http_header_value_of_yojson "Value" _list path;
   }
    : custom_http_header)

let custom_http_headers_of_yojson tree path = list_of_yojson custom_http_header_of_yojson tree path

let custom_request_handling_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ insert_headers = value_for_key custom_http_headers_of_yojson "InsertHeaders" _list path }
    : custom_request_handling)

let count_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : count_action)

let override_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count = option_of_yojson (value_for_key count_action_of_yojson "Count") _list path;
     none = option_of_yojson (value_for_key none_action_of_yojson "None") _list path;
   }
    : override_action)

let price_multiplier_of_yojson = string_of_yojson

let monetize_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price_multiplier =
       option_of_yojson (value_for_key price_multiplier_of_yojson "PriceMultiplier") _list path;
   }
    : monetize_action)

let challenge_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : challenge_action)

let captcha_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : captcha_action)

let allow_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_request_handling =
       option_of_yojson
         (value_for_key custom_request_handling_of_yojson "CustomRequestHandling")
         _list path;
   }
    : allow_action)

let response_status_code_of_yojson = int_of_yojson

let custom_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_code = value_for_key response_status_code_of_yojson "ResponseCode" _list path;
     custom_response_body_key =
       option_of_yojson (value_for_key entity_name_of_yojson "CustomResponseBodyKey") _list path;
     response_headers =
       option_of_yojson (value_for_key custom_http_headers_of_yojson "ResponseHeaders") _list path;
   }
    : custom_response)

let block_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_response =
       option_of_yojson (value_for_key custom_response_of_yojson "CustomResponse") _list path;
   }
    : block_action)

let rule_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block = option_of_yojson (value_for_key block_action_of_yojson "Block") _list path;
     allow = option_of_yojson (value_for_key allow_action_of_yojson "Allow") _list path;
     count = option_of_yojson (value_for_key count_action_of_yojson "Count") _list path;
     captcha = option_of_yojson (value_for_key captcha_action_of_yojson "Captcha") _list path;
     challenge = option_of_yojson (value_for_key challenge_action_of_yojson "Challenge") _list path;
     monetize = option_of_yojson (value_for_key monetize_action_of_yojson "Monetize") _list path;
   }
    : rule_action)

let fallback_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "MATCH" -> MATCH
    | `String "NO_MATCH" -> NO_MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "FallbackBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FallbackBehavior")
     : fallback_behavior)
    : fallback_behavior)

let forwarded_ip_header_name_of_yojson = string_of_yojson

let forwarded_ip_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_name = value_for_key forwarded_ip_header_name_of_yojson "HeaderName" _list path;
     fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path;
   }
    : forwarded_ip_config)

let asn_list_of_yojson tree path = list_of_yojson as_n_of_yojson tree path

let asn_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     asn_list = value_for_key asn_list_of_yojson "AsnList" _list path;
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
   }
    : asn_match_statement)

let text_transformation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "COMPRESS_WHITE_SPACE" -> COMPRESS_WHITE_SPACE
    | `String "HTML_ENTITY_DECODE" -> HTML_ENTITY_DECODE
    | `String "LOWERCASE" -> LOWERCASE
    | `String "CMD_LINE" -> CMD_LINE
    | `String "URL_DECODE" -> URL_DECODE
    | `String "BASE64_DECODE" -> BASE64_DECODE
    | `String "HEX_DECODE" -> HEX_DECODE
    | `String "MD5" -> MD5
    | `String "REPLACE_COMMENTS" -> REPLACE_COMMENTS
    | `String "ESCAPE_SEQ_DECODE" -> ESCAPE_SEQ_DECODE
    | `String "SQL_HEX_DECODE" -> SQL_HEX_DECODE
    | `String "CSS_DECODE" -> CSS_DECODE
    | `String "JS_DECODE" -> JS_DECODE
    | `String "NORMALIZE_PATH" -> NORMALIZE_PATH
    | `String "NORMALIZE_PATH_WIN" -> NORMALIZE_PATH_WIN
    | `String "REMOVE_NULLS" -> REMOVE_NULLS
    | `String "REPLACE_NULLS" -> REPLACE_NULLS
    | `String "BASE64_DECODE_EXT" -> BASE64_DECODE_EXT
    | `String "URL_DECODE_UNI" -> URL_DECODE_UNI
    | `String "UTF8_TO_UNICODE" -> UTF8_TO_UNICODE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TextTransformationType" value)
    | _ -> raise (deserialize_wrong_type_error path "TextTransformationType")
     : text_transformation_type)
    : text_transformation_type)

let text_transformation_priority_of_yojson = int_of_yojson

let text_transformation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     priority = value_for_key text_transformation_priority_of_yojson "Priority" _list path;
     type_ = value_for_key text_transformation_type_of_yojson "Type" _list path;
   }
    : text_transformation)

let text_transformations_of_yojson tree path =
  list_of_yojson text_transformation_of_yojson tree path

let uri_fragment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fallback_behavior =
       option_of_yojson (value_for_key fallback_behavior_of_yojson "FallbackBehavior") _list path;
   }
    : uri_fragment)

let ja4_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : ja4_fingerprint)

let ja3_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : ja3_fingerprint)

let oversize_handling_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUE" -> CONTINUE
    | `String "MATCH" -> MATCH
    | `String "NO_MATCH" -> NO_MATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "OversizeHandling" value)
    | _ -> raise (deserialize_wrong_type_error path "OversizeHandling")
     : oversize_handling)
    : oversize_handling)

let header_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path }
    : header_order)

let map_match_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "KEY" -> KEY
    | `String "VALUE" -> VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MapMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "MapMatchScope")
     : map_match_scope)
    : map_match_scope)

let single_cookie_name_of_yojson = string_of_yojson
let cookie_names_of_yojson tree path = list_of_yojson single_cookie_name_of_yojson tree path

let all_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cookie_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
     included_cookies =
       option_of_yojson (value_for_key cookie_names_of_yojson "IncludedCookies") _list path;
     excluded_cookies =
       option_of_yojson (value_for_key cookie_names_of_yojson "ExcludedCookies") _list path;
   }
    : cookie_match_pattern)

let cookies_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_pattern = value_for_key cookie_match_pattern_of_yojson "MatchPattern" _list path;
     match_scope = value_for_key map_match_scope_of_yojson "MatchScope" _list path;
     oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path;
   }
    : cookies)

let field_to_match_data_of_yojson = string_of_yojson
let header_names_of_yojson tree path = list_of_yojson field_to_match_data_of_yojson tree path

let header_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
     included_headers =
       option_of_yojson (value_for_key header_names_of_yojson "IncludedHeaders") _list path;
     excluded_headers =
       option_of_yojson (value_for_key header_names_of_yojson "ExcludedHeaders") _list path;
   }
    : header_match_pattern)

let headers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_pattern = value_for_key header_match_pattern_of_yojson "MatchPattern" _list path;
     match_scope = value_for_key map_match_scope_of_yojson "MatchScope" _list path;
     oversize_handling = value_for_key oversize_handling_of_yojson "OversizeHandling" _list path;
   }
    : headers)

let body_parsing_fallback_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "MATCH" -> MATCH
    | `String "NO_MATCH" -> NO_MATCH
    | `String "EVALUATE_AS_STRING" -> EVALUATE_AS_STRING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BodyParsingFallbackBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "BodyParsingFallbackBehavior")
     : body_parsing_fallback_behavior)
    : body_parsing_fallback_behavior)

let json_match_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "KEY" -> KEY
    | `String "VALUE" -> VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "JsonMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "JsonMatchScope")
     : json_match_scope)
    : json_match_scope)

let json_pointer_path_of_yojson = string_of_yojson
let json_pointer_paths_of_yojson tree path = list_of_yojson json_pointer_path_of_yojson tree path

let json_match_pattern_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     all = option_of_yojson (value_for_key all_of_yojson "All") _list path;
     included_paths =
       option_of_yojson (value_for_key json_pointer_paths_of_yojson "IncludedPaths") _list path;
   }
    : json_match_pattern)

let json_body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_pattern = value_for_key json_match_pattern_of_yojson "MatchPattern" _list path;
     match_scope = value_for_key json_match_scope_of_yojson "MatchScope" _list path;
     invalid_fallback_behavior =
       option_of_yojson
         (value_for_key body_parsing_fallback_behavior_of_yojson "InvalidFallbackBehavior")
         _list path;
     oversize_handling =
       option_of_yojson (value_for_key oversize_handling_of_yojson "OversizeHandling") _list path;
   }
    : json_body)

let method__of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let body_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oversize_handling =
       option_of_yojson (value_for_key oversize_handling_of_yojson "OversizeHandling") _list path;
   }
    : body)

let query_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let uri_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let all_query_arguments_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let single_query_argument_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key field_to_match_data_of_yojson "Name" _list path } : single_query_argument)

let single_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key field_to_match_data_of_yojson "Name" _list path } : single_header)

let field_to_match_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     single_header =
       option_of_yojson (value_for_key single_header_of_yojson "SingleHeader") _list path;
     single_query_argument =
       option_of_yojson
         (value_for_key single_query_argument_of_yojson "SingleQueryArgument")
         _list path;
     all_query_arguments =
       option_of_yojson (value_for_key all_query_arguments_of_yojson "AllQueryArguments") _list path;
     uri_path = option_of_yojson (value_for_key uri_path_of_yojson "UriPath") _list path;
     query_string = option_of_yojson (value_for_key query_string_of_yojson "QueryString") _list path;
     body = option_of_yojson (value_for_key body_of_yojson "Body") _list path;
     method_ = option_of_yojson (value_for_key method__of_yojson "Method") _list path;
     json_body = option_of_yojson (value_for_key json_body_of_yojson "JsonBody") _list path;
     headers = option_of_yojson (value_for_key headers_of_yojson "Headers") _list path;
     cookies = option_of_yojson (value_for_key cookies_of_yojson "Cookies") _list path;
     header_order = option_of_yojson (value_for_key header_order_of_yojson "HeaderOrder") _list path;
     ja3_fingerprint =
       option_of_yojson (value_for_key ja3_fingerprint_of_yojson "JA3Fingerprint") _list path;
     ja4_fingerprint =
       option_of_yojson (value_for_key ja4_fingerprint_of_yojson "JA4Fingerprint") _list path;
     uri_fragment = option_of_yojson (value_for_key uri_fragment_of_yojson "UriFragment") _list path;
   }
    : field_to_match)

let regex_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_string = value_for_key regex_pattern_string_of_yojson "RegexString" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : regex_match_statement)

let label_match_key_of_yojson = string_of_yojson

let label_match_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "LABEL" -> LABEL
    | `String "NAMESPACE" -> NAMESPACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LabelMatchScope" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelMatchScope")
     : label_match_scope)
    : label_match_scope)

let label_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key label_match_scope_of_yojson "Scope" _list path;
     key = value_for_key label_match_key_of_yojson "Key" _list path;
   }
    : label_match_statement)

let rule_action_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     action_to_use = value_for_key rule_action_of_yojson "ActionToUse" _list path;
   }
    : rule_action_override)

let rule_action_overrides_of_yojson tree path =
  list_of_yojson rule_action_override_of_yojson tree path

let login_path_string_of_yojson = string_of_yojson

let managed_rule_group_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     login_path =
       option_of_yojson (value_for_key login_path_string_of_yojson "LoginPath") _list path;
     payload_type = option_of_yojson (value_for_key payload_type_of_yojson "PayloadType") _list path;
     username_field =
       option_of_yojson (value_for_key username_field_of_yojson "UsernameField") _list path;
     password_field =
       option_of_yojson (value_for_key password_field_of_yojson "PasswordField") _list path;
     aws_managed_rules_bot_control_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_bot_control_rule_set_of_yojson
            "AWSManagedRulesBotControlRuleSet")
         _list path;
     aws_managed_rules_atp_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_atp_rule_set_of_yojson "AWSManagedRulesATPRuleSet")
         _list path;
     aws_managed_rules_acfp_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_acfp_rule_set_of_yojson "AWSManagedRulesACFPRuleSet")
         _list path;
     aws_managed_rules_anti_d_do_s_rule_set =
       option_of_yojson
         (value_for_key aws_managed_rules_anti_d_do_s_rule_set_of_yojson
            "AWSManagedRulesAntiDDoSRuleSet")
         _list path;
   }
    : managed_rule_group_config)

let managed_rule_group_configs_of_yojson tree path =
  list_of_yojson managed_rule_group_config_of_yojson tree path

let excluded_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key entity_name_of_yojson "Name" _list path } : excluded_rule)

let excluded_rules_of_yojson tree path = list_of_yojson excluded_rule_of_yojson tree path
let version_key_string_of_yojson = string_of_yojson
let vendor_name_of_yojson = string_of_yojson

let rate_limit_asn_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_ja4_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : rate_limit_ja4_fingerprint)

let rate_limit_ja3_fingerprint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path }
    : rate_limit_ja3_fingerprint)

let rate_limit_uri_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_uri_path)

let label_namespace_of_yojson = string_of_yojson

let rate_limit_label_namespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ namespace = value_for_key label_namespace_of_yojson "Namespace" _list path }
    : rate_limit_label_namespace)

let rate_limit_i_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_forwarded_i_p_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_http_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rate_limit_query_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_query_string)

let rate_limit_query_argument_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_query_argument)

let rate_limit_cookie_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_cookie)

let rate_limit_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key field_to_match_data_of_yojson "Name" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : rate_limit_header)

let rate_based_statement_custom_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header = option_of_yojson (value_for_key rate_limit_header_of_yojson "Header") _list path;
     cookie = option_of_yojson (value_for_key rate_limit_cookie_of_yojson "Cookie") _list path;
     query_argument =
       option_of_yojson
         (value_for_key rate_limit_query_argument_of_yojson "QueryArgument")
         _list path;
     query_string =
       option_of_yojson (value_for_key rate_limit_query_string_of_yojson "QueryString") _list path;
     http_method =
       option_of_yojson (value_for_key rate_limit_http_method_of_yojson "HTTPMethod") _list path;
     forwarded_i_p =
       option_of_yojson (value_for_key rate_limit_forwarded_i_p_of_yojson "ForwardedIP") _list path;
     i_p = option_of_yojson (value_for_key rate_limit_i_p_of_yojson "IP") _list path;
     label_namespace =
       option_of_yojson
         (value_for_key rate_limit_label_namespace_of_yojson "LabelNamespace")
         _list path;
     uri_path = option_of_yojson (value_for_key rate_limit_uri_path_of_yojson "UriPath") _list path;
     ja3_fingerprint =
       option_of_yojson
         (value_for_key rate_limit_ja3_fingerprint_of_yojson "JA3Fingerprint")
         _list path;
     ja4_fingerprint =
       option_of_yojson
         (value_for_key rate_limit_ja4_fingerprint_of_yojson "JA4Fingerprint")
         _list path;
     as_n = option_of_yojson (value_for_key rate_limit_asn_of_yojson "ASN") _list path;
   }
    : rate_based_statement_custom_key)

let rate_based_statement_custom_keys_of_yojson tree path =
  list_of_yojson rate_based_statement_custom_key_of_yojson tree path

let rate_based_statement_aggregate_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IP" -> IP
    | `String "FORWARDED_IP" -> FORWARDED_IP
    | `String "CUSTOM_KEYS" -> CUSTOM_KEYS
    | `String "CONSTANT" -> CONSTANT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RateBasedStatementAggregateKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RateBasedStatementAggregateKeyType")
     : rate_based_statement_aggregate_key_type)
    : rate_based_statement_aggregate_key_type)

let evaluation_window_sec_of_yojson = long_of_yojson
let rate_limit_of_yojson = long_of_yojson
let resource_arn_of_yojson = string_of_yojson

let regex_pattern_set_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : regex_pattern_set_reference_statement)

let forwarded_ip_position_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIRST" -> FIRST
    | `String "LAST" -> LAST
    | `String "ANY" -> ANY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ForwardedIPPosition" value)
    | _ -> raise (deserialize_wrong_type_error path "ForwardedIPPosition")
     : forwarded_ip_position)
    : forwarded_ip_position)

let ip_set_forwarded_ip_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_name = value_for_key forwarded_ip_header_name_of_yojson "HeaderName" _list path;
     fallback_behavior = value_for_key fallback_behavior_of_yojson "FallbackBehavior" _list path;
     position = value_for_key forwarded_ip_position_of_yojson "Position" _list path;
   }
    : ip_set_forwarded_ip_config)

let ip_set_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     ip_set_forwarded_ip_config =
       option_of_yojson
         (value_for_key ip_set_forwarded_ip_config_of_yojson "IPSetForwardedIPConfig")
         _list path;
   }
    : ip_set_reference_statement)

let rule_group_reference_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     excluded_rules =
       option_of_yojson (value_for_key excluded_rules_of_yojson "ExcludedRules") _list path;
     rule_action_overrides =
       option_of_yojson
         (value_for_key rule_action_overrides_of_yojson "RuleActionOverrides")
         _list path;
   }
    : rule_group_reference_statement)

let country_code_of_yojson (tree : t) path =
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
    | `String "XK" -> XK
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryCode")
     : country_code)
    : country_code)

let country_codes_of_yojson tree path = list_of_yojson country_code_of_yojson tree path

let geo_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     country_codes =
       option_of_yojson (value_for_key country_codes_of_yojson "CountryCodes") _list path;
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
   }
    : geo_match_statement)

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

let size_constraint_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     comparison_operator =
       value_for_key comparison_operator_of_yojson "ComparisonOperator" _list path;
     size = value_for_key size_of_yojson "Size" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : size_constraint_statement)

let xss_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
   }
    : xss_match_statement)

let sensitivity_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW" -> LOW
    | `String "HIGH" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "SensitivityLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "SensitivityLevel")
     : sensitivity_level)
    : sensitivity_level)

let sqli_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     sensitivity_level =
       option_of_yojson (value_for_key sensitivity_level_of_yojson "SensitivityLevel") _list path;
   }
    : sqli_match_statement)

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

let search_string_of_yojson = blob_of_yojson

let byte_match_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_string = value_for_key search_string_of_yojson "SearchString" _list path;
     field_to_match = value_for_key field_to_match_of_yojson "FieldToMatch" _list path;
     text_transformations =
       value_for_key text_transformations_of_yojson "TextTransformations" _list path;
     positional_constraint =
       value_for_key positional_constraint_of_yojson "PositionalConstraint" _list path;
   }
    : byte_match_statement)

let rec statements_of_yojson tree path = list_of_yojson statement_of_yojson tree path

and statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_match_statement =
       option_of_yojson
         (value_for_key byte_match_statement_of_yojson "ByteMatchStatement")
         _list path;
     sqli_match_statement =
       option_of_yojson
         (value_for_key sqli_match_statement_of_yojson "SqliMatchStatement")
         _list path;
     xss_match_statement =
       option_of_yojson (value_for_key xss_match_statement_of_yojson "XssMatchStatement") _list path;
     size_constraint_statement =
       option_of_yojson
         (value_for_key size_constraint_statement_of_yojson "SizeConstraintStatement")
         _list path;
     geo_match_statement =
       option_of_yojson (value_for_key geo_match_statement_of_yojson "GeoMatchStatement") _list path;
     rule_group_reference_statement =
       option_of_yojson
         (value_for_key rule_group_reference_statement_of_yojson "RuleGroupReferenceStatement")
         _list path;
     ip_set_reference_statement =
       option_of_yojson
         (value_for_key ip_set_reference_statement_of_yojson "IPSetReferenceStatement")
         _list path;
     regex_pattern_set_reference_statement =
       option_of_yojson
         (value_for_key regex_pattern_set_reference_statement_of_yojson
            "RegexPatternSetReferenceStatement")
         _list path;
     rate_based_statement =
       option_of_yojson
         (value_for_key rate_based_statement_of_yojson "RateBasedStatement")
         _list path;
     and_statement =
       option_of_yojson (value_for_key and_statement_of_yojson "AndStatement") _list path;
     or_statement = option_of_yojson (value_for_key or_statement_of_yojson "OrStatement") _list path;
     not_statement =
       option_of_yojson (value_for_key not_statement_of_yojson "NotStatement") _list path;
     managed_rule_group_statement =
       option_of_yojson
         (value_for_key managed_rule_group_statement_of_yojson "ManagedRuleGroupStatement")
         _list path;
     label_match_statement =
       option_of_yojson
         (value_for_key label_match_statement_of_yojson "LabelMatchStatement")
         _list path;
     regex_match_statement =
       option_of_yojson
         (value_for_key regex_match_statement_of_yojson "RegexMatchStatement")
         _list path;
     asn_match_statement =
       option_of_yojson (value_for_key asn_match_statement_of_yojson "AsnMatchStatement") _list path;
   }
    : statement)

and rate_based_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = value_for_key rate_limit_of_yojson "Limit" _list path;
     evaluation_window_sec =
       option_of_yojson
         (value_for_key evaluation_window_sec_of_yojson "EvaluationWindowSec")
         _list path;
     aggregate_key_type =
       value_for_key rate_based_statement_aggregate_key_type_of_yojson "AggregateKeyType" _list path;
     scope_down_statement =
       option_of_yojson (value_for_key statement_of_yojson "ScopeDownStatement") _list path;
     forwarded_ip_config =
       option_of_yojson (value_for_key forwarded_ip_config_of_yojson "ForwardedIPConfig") _list path;
     custom_keys =
       option_of_yojson
         (value_for_key rate_based_statement_custom_keys_of_yojson "CustomKeys")
         _list path;
   }
    : rate_based_statement)

and or_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statements = value_for_key statements_of_yojson "Statements" _list path } : or_statement)

and not_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statement = value_for_key statement_of_yojson "Statement" _list path } : not_statement)

and managed_rule_group_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     version = option_of_yojson (value_for_key version_key_string_of_yojson "Version") _list path;
     excluded_rules =
       option_of_yojson (value_for_key excluded_rules_of_yojson "ExcludedRules") _list path;
     scope_down_statement =
       option_of_yojson (value_for_key statement_of_yojson "ScopeDownStatement") _list path;
     managed_rule_group_configs =
       option_of_yojson
         (value_for_key managed_rule_group_configs_of_yojson "ManagedRuleGroupConfigs")
         _list path;
     rule_action_overrides =
       option_of_yojson
         (value_for_key rule_action_overrides_of_yojson "RuleActionOverrides")
         _list path;
   }
    : managed_rule_group_statement)

and and_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ statements = value_for_key statements_of_yojson "Statements" _list path } : and_statement)

let rule_priority_of_yojson = int_of_yojson

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     priority = value_for_key rule_priority_of_yojson "Priority" _list path;
     statement = value_for_key statement_of_yojson "Statement" _list path;
     action = option_of_yojson (value_for_key rule_action_of_yojson "Action") _list path;
     override_action =
       option_of_yojson (value_for_key override_action_of_yojson "OverrideAction") _list path;
     rule_labels = option_of_yojson (value_for_key labels_of_yojson "RuleLabels") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
   }
    : rule)

let rules_of_yojson tree path = list_of_yojson rule_of_yojson tree path
let entity_description_of_yojson = string_of_yojson

let default_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     block = option_of_yojson (value_for_key block_action_of_yojson "Block") _list path;
     allow = option_of_yojson (value_for_key allow_action_of_yojson "Allow") _list path;
   }
    : default_action)

let entity_id_of_yojson = string_of_yojson

let scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLOUDFRONT" -> CLOUDFRONT
    | `String "REGIONAL" -> REGIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Scope" value)
    | _ -> raise (deserialize_wrong_type_error path "Scope")
     : scope)
    : scope)

let update_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     application_config =
       option_of_yojson (value_for_key application_config_of_yojson "ApplicationConfig") _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
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
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
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
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     regular_expression_list =
       value_for_key regular_expression_list_of_yojson "RegularExpressionList" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
   }
    : update_regex_pattern_set_request)

let update_managed_rule_set_version_expiry_date_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiring_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ExpiringVersion") _list path;
     expiry_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpiryTimestamp") _list path;
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : update_managed_rule_set_version_expiry_date_response)

let update_managed_rule_set_version_expiry_date_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     version_to_expire = value_for_key version_key_string_of_yojson "VersionToExpire" _list path;
     expiry_timestamp = value_for_key timestamp_of_yojson "ExpiryTimestamp" _list path;
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
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
   }
    : update_ip_set_request)

let waf_tag_operation_internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_tag_operation_internal_error_exception)

let waf_tag_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_tag_operation_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

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
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
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

let put_managed_rule_set_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_lock_token =
       option_of_yojson (value_for_key lock_token_of_yojson "NextLockToken") _list path;
   }
    : put_managed_rule_set_versions_response)

let time_window_day_of_yojson = int_of_yojson

let version_to_publish_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AssociatedRuleGroupArn") _list path;
     forecasted_lifetime =
       option_of_yojson (value_for_key time_window_day_of_yojson "ForecastedLifetime") _list path;
   }
    : version_to_publish)

let versions_to_publish_of_yojson tree path =
  map_of_yojson version_key_string_of_yojson version_to_publish_of_yojson tree path

let put_managed_rule_set_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
     recommended_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "RecommendedVersion") _list path;
     versions_to_publish =
       option_of_yojson (value_for_key versions_to_publish_of_yojson "VersionsToPublish") _list path;
   }
    : put_managed_rule_set_versions_request)

let waf_service_linked_role_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : waf_service_linked_role_error_exception)

let waf_log_destination_permission_issue_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_log_destination_permission_issue_exception)

let log_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER" -> CUSTOMER
    | `String "SECURITY_LAKE" -> SECURITY_LAKE
    | `String "CLOUDWATCH_TELEMETRY_RULE_MANAGED" -> CLOUDWATCH_TELEMETRY_RULE_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogScope" value)
    | _ -> raise (deserialize_wrong_type_error path "LogScope")
     : log_scope)
    : log_scope)

let log_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WAF_LOGS" -> WAF_LOGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogType" value)
    | _ -> raise (deserialize_wrong_type_error path "LogType")
     : log_type)
    : log_type)

let filter_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEEP" -> KEEP
    | `String "DROP" -> DROP
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterBehavior")
     : filter_behavior)
    : filter_behavior)

let label_name_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label_name = value_for_key label_name_of_yojson "LabelName" _list path }
    : label_name_condition)

let action_value_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "BLOCK" -> BLOCK
    | `String "COUNT" -> COUNT
    | `String "CAPTCHA" -> CAPTCHA
    | `String "CHALLENGE" -> CHALLENGE
    | `String "MONETIZE" -> MONETIZE
    | `String "EXCLUDED_AS_COUNT" -> EXCLUDED_AS_COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionValue" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionValue")
     : action_value)
    : action_value)

let action_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action = value_for_key action_value_of_yojson "Action" _list path } : action_condition)

let condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_condition =
       option_of_yojson (value_for_key action_condition_of_yojson "ActionCondition") _list path;
     label_name_condition =
       option_of_yojson
         (value_for_key label_name_condition_of_yojson "LabelNameCondition")
         _list path;
   }
    : condition)

let conditions_of_yojson tree path = list_of_yojson condition_of_yojson tree path

let filter_requirement_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEETS_ALL" -> MEETS_ALL
    | `String "MEETS_ANY" -> MEETS_ANY
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterRequirement" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterRequirement")
     : filter_requirement)
    : filter_requirement)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     behavior = value_for_key filter_behavior_of_yojson "Behavior" _list path;
     requirement = value_for_key filter_requirement_of_yojson "Requirement" _list path;
     conditions = value_for_key conditions_of_yojson "Conditions" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let logging_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = value_for_key filters_of_yojson "Filters" _list path;
     default_behavior = value_for_key filter_behavior_of_yojson "DefaultBehavior" _list path;
   }
    : logging_filter)

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
     managed_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "ManagedByFirewallManager") _list path;
     logging_filter =
       option_of_yojson (value_for_key logging_filter_of_yojson "LoggingFilter") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
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

let web_acl_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
   }
    : web_acl_summary)

let web_acl_summaries_of_yojson tree path = list_of_yojson web_acl_summary_of_yojson tree path
let next_marker_of_yojson = string_of_yojson

let list_web_ac_ls_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     web_ac_ls = option_of_yojson (value_for_key web_acl_summaries_of_yojson "WebACLs") _list path;
   }
    : list_web_ac_ls_response)

let pagination_limit_of_yojson = int_of_yojson

let list_web_ac_ls_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
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

let filter_string_of_yojson = string_of_yojson
let verified_status_of_yojson = bool_of_yojson
let settlement_filter_string_of_yojson = string_of_yojson
let settlement_id_string_of_yojson = string_of_yojson

let currency_of_yojson (tree : t) path =
  ((match tree with
    | `String "USDC" -> USDC
    | `String value -> raise (deserialize_unknown_enum_value_error path "Currency" value)
    | _ -> raise (deserialize_wrong_type_error path "Currency")
     : currency)
    : currency)

let monetization_amount_value_of_yojson = string_of_yojson

let settlement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SETTLED" -> SETTLED
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "SERVICE_ERROR" -> SERVICE_ERROR
    | `String "SKIPPED_ORIGIN_ERROR" -> SKIPPED_ORIGIN_ERROR
    | `String "DUPLICATE" -> DUPLICATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SettlementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SettlementStatus")
     : settlement_status)
    : settlement_status)

let settlement_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = value_for_key timestamp_of_yojson "Timestamp" _list path;
     payer_address =
       option_of_yojson (value_for_key settlement_filter_string_of_yojson "PayerAddress") _list path;
     wallet_address =
       option_of_yojson
         (value_for_key settlement_filter_string_of_yojson "WalletAddress")
         _list path;
     status = value_for_key settlement_status_of_yojson "Status" _list path;
     amount = value_for_key monetization_amount_value_of_yojson "Amount" _list path;
     currency = option_of_yojson (value_for_key currency_of_yojson "Currency") _list path;
     network =
       option_of_yojson (value_for_key settlement_filter_string_of_yojson "Network") _list path;
     transaction_id =
       option_of_yojson (value_for_key settlement_id_string_of_yojson "TransactionId") _list path;
     request_id =
       option_of_yojson (value_for_key settlement_filter_string_of_yojson "RequestId") _list path;
     source_name = option_of_yojson (value_for_key filter_string_of_yojson "SourceName") _list path;
     organization =
       option_of_yojson (value_for_key filter_string_of_yojson "Organization") _list path;
     source_category =
       option_of_yojson (value_for_key filter_string_of_yojson "SourceCategory") _list path;
     intent = option_of_yojson (value_for_key filter_string_of_yojson "Intent") _list path;
     verified = option_of_yojson (value_for_key verified_status_of_yojson "Verified") _list path;
     content_path =
       option_of_yojson (value_for_key filter_string_of_yojson "ContentPath") _list path;
     web_acl_arn = option_of_yojson (value_for_key resource_arn_of_yojson "WebAclArn") _list path;
     request_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "RequestTimestamp") _list path;
   }
    : settlement_record)

let settlement_record_list_of_yojson tree path =
  list_of_yojson settlement_record_of_yojson tree path

let list_settlement_records_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settlements =
       option_of_yojson (value_for_key settlement_record_list_of_yojson "Settlements") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_settlement_records_response)

let settlement_record_limit_of_yojson = int_of_yojson

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASC" -> ASC
    | `String "DESC" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let settlement_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "AMOUNT" -> AMOUNT
    | `String "NAME" -> NAME
    | `String "STATUS" -> STATUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SettlementSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SettlementSortBy")
     : settlement_sort_by)
    : settlement_sort_by)

let monetization_filter_value_of_yojson = string_of_yojson

let monetization_filter_value_list_of_yojson tree path =
  list_of_yojson monetization_filter_value_of_yojson tree path

let monetization_filter_name_of_yojson = string_of_yojson

let monetization_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key monetization_filter_name_of_yojson "Name" _list path;
     values = value_for_key monetization_filter_value_list_of_yojson "Values" _list path;
   }
    : monetization_filter)

let monetization_filter_list_of_yojson tree path =
  list_of_yojson monetization_filter_of_yojson tree path

let time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = value_for_key timestamp_of_yojson "StartTime" _list path;
     end_time = value_for_key timestamp_of_yojson "EndTime" _list path;
   }
    : time_window)

let list_settlement_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
     filters =
       option_of_yojson (value_for_key monetization_filter_list_of_yojson "Filters") _list path;
     sort_by = option_of_yojson (value_for_key settlement_sort_by_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     limit = option_of_yojson (value_for_key settlement_record_limit_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_settlement_records_request)

let rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
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
     scope = value_for_key scope_of_yojson "Scope" _list path;
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
    | `String "APPSYNC" -> APPSYNC
    | `String "COGNITO_USER_POOL" -> COGNITIO_USER_POOL
    | `String "APP_RUNNER_SERVICE" -> APP_RUNNER_SERVICE
    | `String "VERIFIED_ACCESS_INSTANCE" -> VERIFIED_ACCESS_INSTANCE
    | `String "AMPLIFY" -> AMPLIFY
    | `String "AGENTCORE_GATEWAY" -> AGENTCORE_GATEWAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let list_resources_for_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : list_resources_for_web_acl_request)

let regex_pattern_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
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
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_regex_pattern_sets_request)

let release_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     release_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ReleaseVersion") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
   }
    : release_summary)

let release_summaries_of_yojson tree path = list_of_yojson release_summary_of_yojson tree path

let list_mobile_sdk_releases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     release_summaries =
       option_of_yojson (value_for_key release_summaries_of_yojson "ReleaseSummaries") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : list_mobile_sdk_releases_response)

let platform_of_yojson (tree : t) path =
  ((match tree with
    | `String "IOS" -> IOS
    | `String "ANDROID" -> ANDROID
    | `String value -> raise (deserialize_unknown_enum_value_error path "Platform" value)
    | _ -> raise (deserialize_wrong_type_error path "Platform")
     : platform)
    : platform)

let list_mobile_sdk_releases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platform = value_for_key platform_of_yojson "Platform" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_mobile_sdk_releases_request)

let managed_rule_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
   }
    : managed_rule_set_summary)

let managed_rule_set_summaries_of_yojson tree path =
  list_of_yojson managed_rule_set_summary_of_yojson tree path

let list_managed_rule_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     managed_rule_sets =
       option_of_yojson
         (value_for_key managed_rule_set_summaries_of_yojson "ManagedRuleSets")
         _list path;
   }
    : list_managed_rule_sets_response)

let list_managed_rule_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_managed_rule_sets_request)

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
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
   }
    : list_logging_configurations_request)

let ip_set_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
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
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_ip_sets_request)

let managed_rule_group_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key version_key_string_of_yojson "Name") _list path;
     last_update_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdateTimestamp") _list path;
   }
    : managed_rule_group_version)

let managed_rule_group_versions_of_yojson tree path =
  list_of_yojson managed_rule_group_version_of_yojson tree path

let list_available_managed_rule_group_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     versions =
       option_of_yojson (value_for_key managed_rule_group_versions_of_yojson "Versions") _list path;
     current_default_version =
       option_of_yojson
         (value_for_key version_key_string_of_yojson "CurrentDefaultVersion")
         _list path;
   }
    : list_available_managed_rule_group_versions_response)

let list_available_managed_rule_group_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_available_managed_rule_group_versions_request)

let managed_rule_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     versioning_supported =
       option_of_yojson (value_for_key boolean__of_yojson "VersioningSupported") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
   }
    : managed_rule_group_summary)

let managed_rule_group_summaries_of_yojson tree path =
  list_of_yojson managed_rule_group_summary_of_yojson tree path

let list_available_managed_rule_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     managed_rule_groups =
       option_of_yojson
         (value_for_key managed_rule_group_summaries_of_yojson "ManagedRuleGroups")
         _list path;
   }
    : list_available_managed_rule_groups_response)

let list_available_managed_rule_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_available_managed_rule_groups_request)

let output_url_of_yojson = string_of_yojson

let list_api_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     api_key_summaries =
       option_of_yojson (value_for_key api_key_summaries_of_yojson "APIKeySummaries") _list path;
     application_integration_ur_l =
       option_of_yojson (value_for_key output_url_of_yojson "ApplicationIntegrationURL") _list path;
   }
    : list_api_keys_response)

let list_api_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key pagination_limit_of_yojson "Limit") _list path;
   }
    : list_api_keys_request)

let firewall_manager_statement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_rule_group_statement =
       option_of_yojson
         (value_for_key managed_rule_group_statement_of_yojson "ManagedRuleGroupStatement")
         _list path;
     rule_group_reference_statement =
       option_of_yojson
         (value_for_key rule_group_reference_statement_of_yojson "RuleGroupReferenceStatement")
         _list path;
   }
    : firewall_manager_statement)

let firewall_manager_rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     priority = value_for_key rule_priority_of_yojson "Priority" _list path;
     firewall_manager_statement =
       value_for_key firewall_manager_statement_of_yojson "FirewallManagerStatement" _list path;
     override_action = value_for_key override_action_of_yojson "OverrideAction" _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
   }
    : firewall_manager_rule_group)

let firewall_manager_rule_groups_of_yojson tree path =
  list_of_yojson firewall_manager_rule_group_of_yojson tree path

let consumed_capacity_of_yojson = long_of_yojson

let web_ac_l_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     capacity = option_of_yojson (value_for_key consumed_capacity_of_yojson "Capacity") _list path;
     pre_process_firewall_manager_rule_groups =
       option_of_yojson
         (value_for_key firewall_manager_rule_groups_of_yojson "PreProcessFirewallManagerRuleGroups")
         _list path;
     post_process_firewall_manager_rule_groups =
       option_of_yojson
         (value_for_key firewall_manager_rule_groups_of_yojson
            "PostProcessFirewallManagerRuleGroups")
         _list path;
     managed_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "ManagedByFirewallManager") _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     retrofitted_by_firewall_manager =
       option_of_yojson (value_for_key boolean__of_yojson "RetrofittedByFirewallManager") _list path;
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     application_config =
       option_of_yojson (value_for_key application_config_of_yojson "ApplicationConfig") _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
   }
    : web_ac_l)

let get_web_acl_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path }
    : get_web_acl_for_resource_response)

let get_web_acl_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : get_web_acl_for_resource_request)

let get_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_ac_l = option_of_yojson (value_for_key web_ac_l_of_yojson "WebACL") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
     application_integration_ur_l =
       option_of_yojson (value_for_key output_url_of_yojson "ApplicationIntegrationURL") _list path;
   }
    : get_web_acl_response)

let get_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
   }
    : get_web_acl_request)

let percentage_value_of_yojson = double_of_yojson
let request_count_of_yojson = long_of_yojson

let bot_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bot_name = value_for_key filter_string_of_yojson "BotName" _list path;
     request_count = value_for_key request_count_of_yojson "RequestCount" _list path;
     percentage = value_for_key percentage_value_of_yojson "Percentage" _list path;
   }
    : bot_statistics)

let bot_statistics_list_of_yojson tree path = list_of_yojson bot_statistics_of_yojson tree path
let path_string_of_yojson = string_of_yojson

let filter_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bot_category =
       option_of_yojson (value_for_key filter_string_of_yojson "BotCategory") _list path;
     bot_organization =
       option_of_yojson (value_for_key filter_string_of_yojson "BotOrganization") _list path;
     bot_name = option_of_yojson (value_for_key filter_string_of_yojson "BotName") _list path;
   }
    : filter_source)

let path_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key filter_source_of_yojson "Source") _list path;
     path = value_for_key path_string_of_yojson "Path" _list path;
     request_count = value_for_key request_count_of_yojson "RequestCount" _list path;
     percentage = value_for_key percentage_value_of_yojson "Percentage" _list path;
     top_bots = option_of_yojson (value_for_key bot_statistics_list_of_yojson "TopBots") _list path;
   }
    : path_statistics)

let path_statistics_list_of_yojson tree path = list_of_yojson path_statistics_of_yojson tree path

let get_top_path_statistics_by_traffic_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path_statistics = value_for_key path_statistics_list_of_yojson "PathStatistics" _list path;
     total_request_count = value_for_key request_count_of_yojson "TotalRequestCount" _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     top_categories =
       option_of_yojson (value_for_key path_statistics_list_of_yojson "TopCategories") _list path;
   }
    : get_top_path_statistics_by_traffic_response)

let number_of_top_traffic_bots_per_path_of_yojson = int_of_yojson
let path_statistics_limit_of_yojson = int_of_yojson
let uri_path_prefix_string_of_yojson = string_of_yojson

let get_top_path_statistics_by_traffic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_arn = value_for_key resource_arn_of_yojson "WebAclArn" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     uri_path_prefix =
       option_of_yojson (value_for_key uri_path_prefix_string_of_yojson "UriPathPrefix") _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     bot_category =
       option_of_yojson (value_for_key filter_string_of_yojson "BotCategory") _list path;
     bot_organization =
       option_of_yojson (value_for_key filter_string_of_yojson "BotOrganization") _list path;
     bot_name = option_of_yojson (value_for_key filter_string_of_yojson "BotName") _list path;
     limit = value_for_key path_statistics_limit_of_yojson "Limit" _list path;
     number_of_top_traffic_bots_per_path =
       value_for_key number_of_top_traffic_bots_per_path_of_yojson "NumberOfTopTrafficBotsPerPath"
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_top_path_statistics_by_traffic_request)

let population_size_of_yojson = long_of_yojson
let action_of_yojson = string_of_yojson

let failure_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "TOKEN_MISSING" -> TOKEN_MISSING
    | `String "TOKEN_EXPIRED" -> TOKEN_EXPIRED
    | `String "TOKEN_INVALID" -> TOKEN_INVALID
    | `String "TOKEN_DOMAIN_MISMATCH" -> TOKEN_DOMAIN_MISMATCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")
     : failure_reason)
    : failure_reason)

let solve_timestamp_of_yojson = long_of_yojson
let response_code_of_yojson = int_of_yojson

let challenge_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
     solve_timestamp =
       option_of_yojson (value_for_key solve_timestamp_of_yojson "SolveTimestamp") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : challenge_response)

let captcha_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_code =
       option_of_yojson (value_for_key response_code_of_yojson "ResponseCode") _list path;
     solve_timestamp =
       option_of_yojson (value_for_key solve_timestamp_of_yojson "SolveTimestamp") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "FailureReason") _list path;
   }
    : captcha_response)

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
let sample_weight_of_yojson = long_of_yojson
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
     rule_name_within_rule_group =
       option_of_yojson (value_for_key entity_name_of_yojson "RuleNameWithinRuleGroup") _list path;
     request_headers_inserted =
       option_of_yojson (value_for_key http_headers_of_yojson "RequestHeadersInserted") _list path;
     response_code_sent =
       option_of_yojson (value_for_key response_status_code_of_yojson "ResponseCodeSent") _list path;
     labels = option_of_yojson (value_for_key labels_of_yojson "Labels") _list path;
     captcha_response =
       option_of_yojson (value_for_key captcha_response_of_yojson "CaptchaResponse") _list path;
     challenge_response =
       option_of_yojson (value_for_key challenge_response_of_yojson "ChallengeResponse") _list path;
     overridden_action =
       option_of_yojson (value_for_key action_of_yojson "OverriddenAction") _list path;
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

let list_max_items_of_yojson = long_of_yojson

let get_sampled_requests_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_arn = value_for_key resource_arn_of_yojson "WebAclArn" _list path;
     rule_metric_name = value_for_key metric_name_of_yojson "RuleMetricName" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     max_items = value_for_key list_max_items_of_yojson "MaxItems" _list path;
   }
    : get_sampled_requests_request)

let label_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key label_name_of_yojson "Name") _list path }
    : label_summary)

let label_summaries_of_yojson tree path = list_of_yojson label_summary_of_yojson tree path
let capacity_unit_of_yojson = long_of_yojson

let rule_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     capacity = value_for_key capacity_unit_of_yojson "Capacity" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     available_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "AvailableLabels") _list path;
     consumed_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "ConsumedLabels") _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
   }
    : rule_group)

let get_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_group = option_of_yojson (value_for_key rule_group_of_yojson "RuleGroup") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
   }
    : get_rule_group_response)

let get_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "Scope") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
   }
    : get_rule_group_request)

let data_point_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date = option_of_yojson (value_for_key timestamp_of_yojson "Date") _list path;
     monetize_served_count =
       option_of_yojson (value_for_key request_count_of_yojson "MonetizeServedCount") _list path;
     settled_count =
       option_of_yojson (value_for_key request_count_of_yojson "SettledCount") _list path;
     total_amount =
       option_of_yojson (value_for_key monetization_amount_value_of_yojson "TotalAmount") _list path;
     category = option_of_yojson (value_for_key filter_string_of_yojson "Category") _list path;
     intent = option_of_yojson (value_for_key filter_string_of_yojson "Intent") _list path;
     group_by_value =
       option_of_yojson (value_for_key filter_string_of_yojson "GroupByValue") _list path;
   }
    : data_point_entry)

let data_points_list_of_yojson tree path = list_of_yojson data_point_entry_of_yojson tree path

let get_revenue_statistics_time_series_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_points =
       option_of_yojson (value_for_key data_points_list_of_yojson "DataPoints") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_revenue_statistics_time_series_response)

let max_data_points_of_yojson = int_of_yojson

let group_by_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "CATEGORY" -> CATEGORY
    | `String "INTENT" -> INTENT
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "WEBACL" -> WEBACL
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupByType" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupByType")
     : group_by_type)
    : group_by_type)

let interval_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MINUTELY" -> MINUTELY
    | `String "FIVE_MINUTELY" -> FIVE_MINUTELY
    | `String "HOURLY" -> HOURLY
    | `String "DAILY" -> DAILY
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntervalType" value)
    | _ -> raise (deserialize_wrong_type_error path "IntervalType")
     : interval_type)
    : interval_type)

let time_series_statistic_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATE_HISTOGRAM" -> DATE_HISTOGRAM
    | `String "PAYMENT_TRAFFIC" -> PAYMENT_TRAFFIC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TimeSeriesStatisticType" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeSeriesStatisticType")
     : time_series_statistic_type)
    : time_series_statistic_type)

let get_revenue_statistics_time_series_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statistic_type = value_for_key time_series_statistic_type_of_yojson "StatisticType" _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     interval = value_for_key interval_type_of_yojson "Interval" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
     group_by = option_of_yojson (value_for_key group_by_type_of_yojson "GroupBy") _list path;
     filters =
       option_of_yojson (value_for_key monetization_filter_list_of_yojson "Filters") _list path;
     limit = option_of_yojson (value_for_key max_data_points_of_yojson "Limit") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_revenue_statistics_time_series_request)

let revenue_breakdown_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_amount =
       option_of_yojson (value_for_key monetization_amount_value_of_yojson "TotalAmount") _list path;
     verified_amount =
       option_of_yojson
         (value_for_key monetization_amount_value_of_yojson "VerifiedAmount")
         _list path;
     unverified_amount =
       option_of_yojson
         (value_for_key monetization_amount_value_of_yojson "UnverifiedAmount")
         _list path;
     currency = option_of_yojson (value_for_key currency_of_yojson "Currency") _list path;
     total_settled =
       option_of_yojson (value_for_key request_count_of_yojson "TotalSettled") _list path;
     total_monetize_served =
       option_of_yojson (value_for_key request_count_of_yojson "TotalMonetizeServed") _list path;
   }
    : revenue_breakdown)

let get_revenue_statistics_summary_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revenue_breakdown =
       option_of_yojson (value_for_key revenue_breakdown_of_yojson "RevenueBreakdown") _list path;
   }
    : get_revenue_statistics_summary_response)

let get_revenue_statistics_summary_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
     filters =
       option_of_yojson (value_for_key monetization_filter_list_of_yojson "Filters") _list path;
   }
    : get_revenue_statistics_summary_request)

let revenue_path_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = value_for_key path_string_of_yojson "Path" _list path;
     percentage = value_for_key percentage_value_of_yojson "Percentage" _list path;
     amount = value_for_key monetization_amount_value_of_yojson "Amount" _list path;
     request_count = value_for_key request_count_of_yojson "RequestCount" _list path;
   }
    : revenue_path_statistics)

let revenue_path_statistics_list_of_yojson tree path =
  list_of_yojson revenue_path_statistics_of_yojson tree path

let source_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_name = value_for_key filter_string_of_yojson "SourceName" _list path;
     percentage = value_for_key percentage_value_of_yojson "Percentage" _list path;
     amount = value_for_key monetization_amount_value_of_yojson "Amount" _list path;
     request_count = value_for_key request_count_of_yojson "RequestCount" _list path;
     source_category =
       option_of_yojson (value_for_key filter_string_of_yojson "SourceCategory") _list path;
     intent = option_of_yojson (value_for_key filter_string_of_yojson "Intent") _list path;
     organization =
       option_of_yojson (value_for_key filter_string_of_yojson "Organization") _list path;
     verified = option_of_yojson (value_for_key verified_status_of_yojson "Verified") _list path;
     group_by_value =
       option_of_yojson (value_for_key filter_string_of_yojson "GroupByValue") _list path;
   }
    : source_statistics)

let source_statistics_list_of_yojson tree path =
  list_of_yojson source_statistics_of_yojson tree path

let get_revenue_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_statistics =
       option_of_yojson
         (value_for_key source_statistics_list_of_yojson "SourceStatistics")
         _list path;
     revenue_path_statistics =
       option_of_yojson
         (value_for_key revenue_path_statistics_list_of_yojson "RevenuePathStatistics")
         _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
   }
    : get_revenue_statistics_response)

let ranking_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "REVENUE" -> REVENUE
    | `String "PERCENTAGE" -> PERCENTAGE
    | `String "NAME" -> NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RankingSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "RankingSortBy")
     : ranking_sort_by)
    : ranking_sort_by)

let ranking_statistic_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TOP_SOURCES_BY_REVENUE" -> TOP_SOURCES_BY_REVENUE
    | `String "TOP_PATHS_BY_REVENUE" -> TOP_PATHS_BY_REVENUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RankingStatisticType" value)
    | _ -> raise (deserialize_wrong_type_error path "RankingStatisticType")
     : ranking_statistic_type)
    : ranking_statistic_type)

let get_revenue_statistics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statistic_type = value_for_key ranking_statistic_type_of_yojson "StatisticType" _list path;
     time_window = value_for_key time_window_of_yojson "TimeWindow" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     currency = value_for_key currency_of_yojson "Currency" _list path;
     group_by = option_of_yojson (value_for_key group_by_type_of_yojson "GroupBy") _list path;
     filters =
       option_of_yojson (value_for_key monetization_filter_list_of_yojson "Filters") _list path;
     next_marker = option_of_yojson (value_for_key next_marker_of_yojson "NextMarker") _list path;
     limit = option_of_yojson (value_for_key path_statistics_limit_of_yojson "Limit") _list path;
     sort_by = option_of_yojson (value_for_key ranking_sort_by_of_yojson "SortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : get_revenue_statistics_request)

let regex_pattern_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key entity_id_of_yojson "Id") _list path;
     ar_n = option_of_yojson (value_for_key resource_arn_of_yojson "ARN") _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     regular_expression_list =
       option_of_yojson
         (value_for_key regular_expression_list_of_yojson "RegularExpressionList")
         _list path;
   }
    : regex_pattern_set)

let get_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regex_pattern_set =
       option_of_yojson (value_for_key regex_pattern_set_of_yojson "RegexPatternSet") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
   }
    : get_regex_pattern_set_response)

let get_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
   }
    : get_regex_pattern_set_request)

let waf_unsupported_aggregate_key_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_unsupported_aggregate_key_type_exception)

let ip_address_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "IPV6" -> IPV6
    | `String value -> raise (deserialize_unknown_enum_value_error path "IPAddressVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "IPAddressVersion")
     : ip_address_version)
    : ip_address_version)

let rate_based_statement_managed_keys_ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address_version =
       option_of_yojson (value_for_key ip_address_version_of_yojson "IPAddressVersion") _list path;
     addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "Addresses") _list path;
   }
    : rate_based_statement_managed_keys_ip_set)

let get_rate_based_statement_managed_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_keys_ip_v4 =
       option_of_yojson
         (value_for_key rate_based_statement_managed_keys_ip_set_of_yojson "ManagedKeysIPV4")
         _list path;
     managed_keys_ip_v6 =
       option_of_yojson
         (value_for_key rate_based_statement_managed_keys_ip_set_of_yojson "ManagedKeysIPV6")
         _list path;
   }
    : get_rate_based_statement_managed_keys_response)

let get_rate_based_statement_managed_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     web_acl_name = value_for_key entity_name_of_yojson "WebACLName" _list path;
     web_acl_id = value_for_key entity_id_of_yojson "WebACLId" _list path;
     rule_group_rule_name =
       option_of_yojson (value_for_key entity_name_of_yojson "RuleGroupRuleName") _list path;
     rule_name = value_for_key entity_name_of_yojson "RuleName" _list path;
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

let release_notes_of_yojson = string_of_yojson

let mobile_sdk_release_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     release_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "ReleaseVersion") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
     release_notes =
       option_of_yojson (value_for_key release_notes_of_yojson "ReleaseNotes") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : mobile_sdk_release)

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
     platform = value_for_key platform_of_yojson "Platform" _list path;
     release_version = value_for_key version_key_string_of_yojson "ReleaseVersion" _list path;
   }
    : get_mobile_sdk_release_request)

let managed_rule_set_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_rule_group_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "AssociatedRuleGroupArn") _list path;
     capacity = option_of_yojson (value_for_key capacity_unit_of_yojson "Capacity") _list path;
     forecasted_lifetime =
       option_of_yojson (value_for_key time_window_day_of_yojson "ForecastedLifetime") _list path;
     publish_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "PublishTimestamp") _list path;
     last_update_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdateTimestamp") _list path;
     expiry_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpiryTimestamp") _list path;
   }
    : managed_rule_set_version)

let published_versions_of_yojson tree path =
  map_of_yojson version_key_string_of_yojson managed_rule_set_version_of_yojson tree path

let managed_rule_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     published_versions =
       option_of_yojson (value_for_key published_versions_of_yojson "PublishedVersions") _list path;
     recommended_version =
       option_of_yojson (value_for_key version_key_string_of_yojson "RecommendedVersion") _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
   }
    : managed_rule_set)

let get_managed_rule_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_rule_set =
       option_of_yojson (value_for_key managed_rule_set_of_yojson "ManagedRuleSet") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
   }
    : get_managed_rule_set_response)

let get_managed_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
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
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
   }
    : get_logging_configuration_request)

let ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     ar_n = value_for_key resource_arn_of_yojson "ARN" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ip_address_version = value_for_key ip_address_version_of_yojson "IPAddressVersion" _list path;
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
   }
    : ip_set)

let get_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_set = option_of_yojson (value_for_key ip_set_of_yojson "IPSet") _list path;
     lock_token = option_of_yojson (value_for_key lock_token_of_yojson "LockToken") _list path;
   }
    : get_ip_set_response)

let get_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
   }
    : get_ip_set_request)

let get_decrypted_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     creation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "CreationTimestamp") _list path;
   }
    : get_decrypted_api_key_response)

let get_decrypted_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     api_key = value_for_key api_key_of_yojson "APIKey" _list path;
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
     platform = value_for_key platform_of_yojson "Platform" _list path;
     release_version = value_for_key version_key_string_of_yojson "ReleaseVersion" _list path;
   }
    : generate_mobile_sdk_release_url_request)

let disassociate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : disassociate_web_acl_request)

let rule_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     action = option_of_yojson (value_for_key rule_action_of_yojson "Action") _list path;
   }
    : rule_summary)

let rule_summaries_of_yojson tree path = list_of_yojson rule_summary_of_yojson tree path

let describe_managed_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_name =
       option_of_yojson (value_for_key version_key_string_of_yojson "VersionName") _list path;
     sns_topic_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopicArn") _list path;
     capacity = option_of_yojson (value_for_key capacity_unit_of_yojson "Capacity") _list path;
     rules = option_of_yojson (value_for_key rule_summaries_of_yojson "Rules") _list path;
     label_namespace =
       option_of_yojson (value_for_key label_name_of_yojson "LabelNamespace") _list path;
     available_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "AvailableLabels") _list path;
     consumed_labels =
       option_of_yojson (value_for_key label_summaries_of_yojson "ConsumedLabels") _list path;
   }
    : describe_managed_rule_group_response)

let describe_managed_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     version_name =
       option_of_yojson (value_for_key version_key_string_of_yojson "VersionName") _list path;
   }
    : describe_managed_rule_group_request)

let product_description_of_yojson = string_of_yojson
let product_title_of_yojson = string_of_yojson
let product_link_of_yojson = string_of_yojson
let product_id_of_yojson = string_of_yojson

let managed_product_descriptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vendor_name = option_of_yojson (value_for_key vendor_name_of_yojson "VendorName") _list path;
     managed_rule_set_name =
       option_of_yojson (value_for_key entity_name_of_yojson "ManagedRuleSetName") _list path;
     product_id = option_of_yojson (value_for_key product_id_of_yojson "ProductId") _list path;
     product_link = option_of_yojson (value_for_key product_link_of_yojson "ProductLink") _list path;
     product_title =
       option_of_yojson (value_for_key product_title_of_yojson "ProductTitle") _list path;
     product_description =
       option_of_yojson
         (value_for_key product_description_of_yojson "ProductDescription")
         _list path;
     sns_topic_arn =
       option_of_yojson (value_for_key resource_arn_of_yojson "SnsTopicArn") _list path;
     is_versioning_supported =
       option_of_yojson (value_for_key boolean__of_yojson "IsVersioningSupported") _list path;
     is_advanced_managed_rule_set =
       option_of_yojson (value_for_key boolean__of_yojson "IsAdvancedManagedRuleSet") _list path;
   }
    : managed_product_descriptor)

let managed_product_descriptors_of_yojson tree path =
  list_of_yojson managed_product_descriptor_of_yojson tree path

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
     vendor_name = value_for_key vendor_name_of_yojson "VendorName" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
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

let waf_associated_item_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : waf_associated_item_exception)

let delete_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
   }
    : delete_web_acl_request)

let delete_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
   }
    : delete_rule_group_request)

let delete_regex_pattern_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_regex_pattern_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
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
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "LogType") _list path;
     log_scope = option_of_yojson (value_for_key log_scope_of_yojson "LogScope") _list path;
   }
    : delete_logging_configuration_request)

let delete_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     id = value_for_key entity_id_of_yojson "Id" _list path;
     lock_token = value_for_key lock_token_of_yojson "LockToken" _list path;
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
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
     web_acl_lock_token = value_for_key lock_token_of_yojson "WebACLLockToken" _list path;
   }
    : delete_firewall_manager_rule_groups_request)

let delete_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     api_key = value_for_key api_key_of_yojson "APIKey" _list path;
   }
    : delete_api_key_request)

let create_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key web_acl_summary_of_yojson "Summary") _list path }
    : create_web_acl_response)

let create_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     default_action = value_for_key default_action_of_yojson "DefaultAction" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     data_protection_config =
       option_of_yojson
         (value_for_key data_protection_config_of_yojson "DataProtectionConfig")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     captcha_config =
       option_of_yojson (value_for_key captcha_config_of_yojson "CaptchaConfig") _list path;
     challenge_config =
       option_of_yojson (value_for_key challenge_config_of_yojson "ChallengeConfig") _list path;
     token_domains =
       option_of_yojson (value_for_key token_domains_of_yojson "TokenDomains") _list path;
     association_config =
       option_of_yojson (value_for_key association_config_of_yojson "AssociationConfig") _list path;
     on_source_d_do_s_protection_config =
       option_of_yojson
         (value_for_key on_source_d_do_s_protection_config_of_yojson "OnSourceDDoSProtectionConfig")
         _list path;
     application_config =
       option_of_yojson (value_for_key application_config_of_yojson "ApplicationConfig") _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
   }
    : create_web_acl_request)

let create_rule_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key rule_group_summary_of_yojson "Summary") _list path }
    : create_rule_group_response)

let create_rule_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     capacity = value_for_key capacity_unit_of_yojson "Capacity" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     rules = option_of_yojson (value_for_key rules_of_yojson "Rules") _list path;
     visibility_config = value_for_key visibility_config_of_yojson "VisibilityConfig" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     custom_response_bodies =
       option_of_yojson
         (value_for_key custom_response_bodies_of_yojson "CustomResponseBodies")
         _list path;
     monetization_config =
       option_of_yojson
         (value_for_key monetization_config_of_yojson "MonetizationConfig")
         _list path;
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
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     regular_expression_list =
       value_for_key regular_expression_list_of_yojson "RegularExpressionList" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_regex_pattern_set_request)

let create_ip_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summary = option_of_yojson (value_for_key ip_set_summary_of_yojson "Summary") _list path }
    : create_ip_set_response)

let create_ip_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key entity_name_of_yojson "Name" _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
     description =
       option_of_yojson (value_for_key entity_description_of_yojson "Description") _list path;
     ip_address_version = value_for_key ip_address_version_of_yojson "IPAddressVersion" _list path;
     addresses = value_for_key ip_addresses_of_yojson "Addresses" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_ip_set_request)

let create_api_key_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ api_key = option_of_yojson (value_for_key api_key_of_yojson "APIKey") _list path }
    : create_api_key_response)

let create_api_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     token_domains = value_for_key api_key_token_domains_of_yojson "TokenDomains" _list path;
   }
    : create_api_key_request)

let check_capacity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ capacity = option_of_yojson (value_for_key consumed_capacity_of_yojson "Capacity") _list path }
    : check_capacity_response)

let check_capacity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     rules = value_for_key rules_of_yojson "Rules" _list path;
   }
    : check_capacity_request)

let associate_web_acl_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_web_acl_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_acl_arn = value_for_key resource_arn_of_yojson "WebACLArn" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : associate_web_acl_request)
