open Smaws_Lib.Json.SerializeHelpers
open Types

let api_key_to_yojson = string_to_yojson
let api_key_version_to_yojson = int_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let token_domain_to_yojson = string_to_yojson
let token_domains_to_yojson tree = list_to_yojson token_domain_to_yojson tree

let api_key_summary_to_yojson (x : api_key_summary) =
  assoc_to_yojson
    [
      ("TokenDomains", option_to_yojson token_domains_to_yojson x.token_domains);
      ("APIKey", option_to_yojson api_key_to_yojson x.api_key);
      ("CreationTimestamp", option_to_yojson timestamp_to_yojson x.creation_timestamp);
      ("Version", option_to_yojson api_key_version_to_yojson x.version);
    ]

let api_key_summaries_to_yojson tree = list_to_yojson api_key_summary_to_yojson tree
let api_key_token_domains_to_yojson tree = list_to_yojson token_domain_to_yojson tree
let as_n_to_yojson = long_to_yojson
let boolean__to_yojson = bool_to_yojson
let failure_value_to_yojson = string_to_yojson

let response_inspection_json_failure_values_to_yojson tree =
  list_to_yojson failure_value_to_yojson tree

let success_value_to_yojson = string_to_yojson

let response_inspection_json_success_values_to_yojson tree =
  list_to_yojson success_value_to_yojson tree

let field_identifier_to_yojson = string_to_yojson

let response_inspection_json_to_yojson (x : response_inspection_json) =
  assoc_to_yojson
    [
      ("Identifier", Some (field_identifier_to_yojson x.identifier));
      ("SuccessValues", Some (response_inspection_json_success_values_to_yojson x.success_values));
      ("FailureValues", Some (response_inspection_json_failure_values_to_yojson x.failure_values));
    ]

let response_inspection_body_contains_failure_strings_to_yojson tree =
  list_to_yojson failure_value_to_yojson tree

let response_inspection_body_contains_success_strings_to_yojson tree =
  list_to_yojson success_value_to_yojson tree

let response_inspection_body_contains_to_yojson (x : response_inspection_body_contains) =
  assoc_to_yojson
    [
      ( "SuccessStrings",
        Some (response_inspection_body_contains_success_strings_to_yojson x.success_strings) );
      ( "FailureStrings",
        Some (response_inspection_body_contains_failure_strings_to_yojson x.failure_strings) );
    ]

let response_inspection_header_failure_values_to_yojson tree =
  list_to_yojson failure_value_to_yojson tree

let response_inspection_header_success_values_to_yojson tree =
  list_to_yojson success_value_to_yojson tree

let response_inspection_header_name_to_yojson = string_to_yojson

let response_inspection_header_to_yojson (x : response_inspection_header) =
  assoc_to_yojson
    [
      ("Name", Some (response_inspection_header_name_to_yojson x.name));
      ("SuccessValues", Some (response_inspection_header_success_values_to_yojson x.success_values));
      ("FailureValues", Some (response_inspection_header_failure_values_to_yojson x.failure_values));
    ]

let failure_code_to_yojson = int_to_yojson

let response_inspection_status_code_failure_codes_to_yojson tree =
  list_to_yojson failure_code_to_yojson tree

let success_code_to_yojson = int_to_yojson

let response_inspection_status_code_success_codes_to_yojson tree =
  list_to_yojson success_code_to_yojson tree

let response_inspection_status_code_to_yojson (x : response_inspection_status_code) =
  assoc_to_yojson
    [
      ( "SuccessCodes",
        Some (response_inspection_status_code_success_codes_to_yojson x.success_codes) );
      ( "FailureCodes",
        Some (response_inspection_status_code_failure_codes_to_yojson x.failure_codes) );
    ]

let response_inspection_to_yojson (x : response_inspection) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson response_inspection_status_code_to_yojson x.status_code);
      ("Header", option_to_yojson response_inspection_header_to_yojson x.header);
      ("BodyContains", option_to_yojson response_inspection_body_contains_to_yojson x.body_contains);
      ("Json", option_to_yojson response_inspection_json_to_yojson x.json);
    ]

let address_field_to_yojson (x : address_field) =
  assoc_to_yojson [ ("Identifier", Some (field_identifier_to_yojson x.identifier)) ]

let address_fields_to_yojson tree = list_to_yojson address_field_to_yojson tree

let phone_number_field_to_yojson (x : phone_number_field) =
  assoc_to_yojson [ ("Identifier", Some (field_identifier_to_yojson x.identifier)) ]

let phone_number_fields_to_yojson tree = list_to_yojson phone_number_field_to_yojson tree

let email_field_to_yojson (x : email_field) =
  assoc_to_yojson [ ("Identifier", Some (field_identifier_to_yojson x.identifier)) ]

let password_field_to_yojson (x : password_field) =
  assoc_to_yojson [ ("Identifier", Some (field_identifier_to_yojson x.identifier)) ]

let username_field_to_yojson (x : username_field) =
  assoc_to_yojson [ ("Identifier", Some (field_identifier_to_yojson x.identifier)) ]

let payload_type_to_yojson (x : payload_type) =
  match x with JSON -> `String "JSON" | FORM_ENCODED -> `String "FORM_ENCODED"

let request_inspection_acf_p_to_yojson (x : request_inspection_acf_p) =
  assoc_to_yojson
    [
      ("PayloadType", Some (payload_type_to_yojson x.payload_type));
      ("UsernameField", option_to_yojson username_field_to_yojson x.username_field);
      ("PasswordField", option_to_yojson password_field_to_yojson x.password_field);
      ("EmailField", option_to_yojson email_field_to_yojson x.email_field);
      ("PhoneNumberFields", option_to_yojson phone_number_fields_to_yojson x.phone_number_fields);
      ("AddressFields", option_to_yojson address_fields_to_yojson x.address_fields);
    ]

let registration_page_path_string_to_yojson = string_to_yojson
let creation_path_string_to_yojson = string_to_yojson

let aws_managed_rules_acfp_rule_set_to_yojson (x : aws_managed_rules_acfp_rule_set) =
  assoc_to_yojson
    [
      ("CreationPath", Some (creation_path_string_to_yojson x.creation_path));
      ( "RegistrationPagePath",
        Some (registration_page_path_string_to_yojson x.registration_page_path) );
      ("RequestInspection", Some (request_inspection_acf_p_to_yojson x.request_inspection));
      ("ResponseInspection", option_to_yojson response_inspection_to_yojson x.response_inspection);
      ("EnableRegexInPath", option_to_yojson boolean__to_yojson x.enable_regex_in_path);
    ]

let request_inspection_to_yojson (x : request_inspection) =
  assoc_to_yojson
    [
      ("PayloadType", Some (payload_type_to_yojson x.payload_type));
      ("UsernameField", Some (username_field_to_yojson x.username_field));
      ("PasswordField", Some (password_field_to_yojson x.password_field));
    ]

let string__to_yojson = string_to_yojson

let aws_managed_rules_atp_rule_set_to_yojson (x : aws_managed_rules_atp_rule_set) =
  assoc_to_yojson
    [
      ("LoginPath", Some (string__to_yojson x.login_path));
      ("RequestInspection", option_to_yojson request_inspection_to_yojson x.request_inspection);
      ("ResponseInspection", option_to_yojson response_inspection_to_yojson x.response_inspection);
      ("EnableRegexInPath", option_to_yojson boolean__to_yojson x.enable_regex_in_path);
    ]

let sensitivity_to_act_to_yojson (x : sensitivity_to_act) =
  match x with LOW -> `String "LOW" | MEDIUM -> `String "MEDIUM" | HIGH -> `String "HIGH"

let regex_pattern_string_to_yojson = string_to_yojson

let regex_to_yojson (x : regex) =
  assoc_to_yojson
    [ ("RegexString", option_to_yojson regex_pattern_string_to_yojson x.regex_string) ]

let regular_expression_list_to_yojson tree = list_to_yojson regex_to_yojson tree

let usage_of_action_to_yojson (x : usage_of_action) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let client_side_action_to_yojson (x : client_side_action) =
  assoc_to_yojson
    [
      ("UsageOfAction", Some (usage_of_action_to_yojson x.usage_of_action));
      ("Sensitivity", option_to_yojson sensitivity_to_act_to_yojson x.sensitivity);
      ( "ExemptUriRegularExpressions",
        option_to_yojson regular_expression_list_to_yojson x.exempt_uri_regular_expressions );
    ]

let client_side_action_config_to_yojson (x : client_side_action_config) =
  assoc_to_yojson [ ("Challenge", Some (client_side_action_to_yojson x.challenge)) ]

let aws_managed_rules_anti_d_do_s_rule_set_to_yojson (x : aws_managed_rules_anti_d_do_s_rule_set) =
  assoc_to_yojson
    [
      ( "ClientSideActionConfig",
        Some (client_side_action_config_to_yojson x.client_side_action_config) );
      ("SensitivityToBlock", option_to_yojson sensitivity_to_act_to_yojson x.sensitivity_to_block);
    ]

let enable_machine_learning_to_yojson = bool_to_yojson

let inspection_level_to_yojson (x : inspection_level) =
  match x with COMMON -> `String "COMMON" | TARGETED -> `String "TARGETED"

let aws_managed_rules_bot_control_rule_set_to_yojson (x : aws_managed_rules_bot_control_rule_set) =
  assoc_to_yojson
    [
      ("InspectionLevel", Some (inspection_level_to_yojson x.inspection_level));
      ( "EnableMachineLearning",
        option_to_yojson enable_machine_learning_to_yojson x.enable_machine_learning );
    ]

let error_message_to_yojson = string_to_yojson

let waf_unavailable_entity_exception_to_yojson (x : waf_unavailable_entity_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_subscription_not_found_exception_to_yojson (x : waf_subscription_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_optimistic_lock_exception_to_yojson (x : waf_optimistic_lock_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_nonexistent_item_exception_to_yojson (x : waf_nonexistent_item_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let source_type_to_yojson = string_to_yojson

let waf_limits_exceeded_exception_to_yojson (x : waf_limits_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
    ]

let waf_invalid_resource_exception_to_yojson (x : waf_invalid_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let error_reason_to_yojson = string_to_yojson
let parameter_exception_parameter_to_yojson = string_to_yojson

let parameter_exception_field_to_yojson (x : parameter_exception_field) =
  match x with
  | WEB_ACL -> `String "WEB_ACL"
  | RULE_GROUP -> `String "RULE_GROUP"
  | REGEX_PATTERN_SET -> `String "REGEX_PATTERN_SET"
  | IP_SET -> `String "IP_SET"
  | MANAGED_RULE_SET -> `String "MANAGED_RULE_SET"
  | RULE -> `String "RULE"
  | EXCLUDED_RULE -> `String "EXCLUDED_RULE"
  | STATEMENT -> `String "STATEMENT"
  | BYTE_MATCH_STATEMENT -> `String "BYTE_MATCH_STATEMENT"
  | SQLI_MATCH_STATEMENT -> `String "SQLI_MATCH_STATEMENT"
  | XSS_MATCH_STATEMENT -> `String "XSS_MATCH_STATEMENT"
  | SIZE_CONSTRAINT_STATEMENT -> `String "SIZE_CONSTRAINT_STATEMENT"
  | GEO_MATCH_STATEMENT -> `String "GEO_MATCH_STATEMENT"
  | RATE_BASED_STATEMENT -> `String "RATE_BASED_STATEMENT"
  | RULE_GROUP_REFERENCE_STATEMENT -> `String "RULE_GROUP_REFERENCE_STATEMENT"
  | REGEX_PATTERN_REFERENCE_STATEMENT -> `String "REGEX_PATTERN_REFERENCE_STATEMENT"
  | IP_SET_REFERENCE_STATEMENT -> `String "IP_SET_REFERENCE_STATEMENT"
  | MANAGED_RULE_SET_STATEMENT -> `String "MANAGED_RULE_SET_STATEMENT"
  | LABEL_MATCH_STATEMENT -> `String "LABEL_MATCH_STATEMENT"
  | AND_STATEMENT -> `String "AND_STATEMENT"
  | OR_STATEMENT -> `String "OR_STATEMENT"
  | NOT_STATEMENT -> `String "NOT_STATEMENT"
  | IP_ADDRESS -> `String "IP_ADDRESS"
  | IP_ADDRESS_VERSION -> `String "IP_ADDRESS_VERSION"
  | FIELD_TO_MATCH -> `String "FIELD_TO_MATCH"
  | TEXT_TRANSFORMATION -> `String "TEXT_TRANSFORMATION"
  | SINGLE_QUERY_ARGUMENT -> `String "SINGLE_QUERY_ARGUMENT"
  | SINGLE_HEADER -> `String "SINGLE_HEADER"
  | DEFAULT_ACTION -> `String "DEFAULT_ACTION"
  | RULE_ACTION -> `String "RULE_ACTION"
  | ENTITY_LIMIT -> `String "ENTITY_LIMIT"
  | OVERRIDE_ACTION -> `String "OVERRIDE_ACTION"
  | SCOPE_VALUE -> `String "SCOPE_VALUE"
  | RESOURCE_ARN -> `String "RESOURCE_ARN"
  | RESOURCE_TYPE -> `String "RESOURCE_TYPE"
  | TAGS -> `String "TAGS"
  | TAG_KEYS -> `String "TAG_KEYS"
  | METRIC_NAME -> `String "METRIC_NAME"
  | FIREWALL_MANAGER_STATEMENT -> `String "FIREWALL_MANAGER_STATEMENT"
  | FALLBACK_BEHAVIOR -> `String "FALLBACK_BEHAVIOR"
  | POSITION -> `String "POSITION"
  | FORWARDED_IP_CONFIG -> `String "FORWARDED_IP_CONFIG"
  | IP_SET_FORWARDED_IP_CONFIG -> `String "IP_SET_FORWARDED_IP_CONFIG"
  | HEADER_NAME -> `String "HEADER_NAME"
  | CUSTOM_REQUEST_HANDLING -> `String "CUSTOM_REQUEST_HANDLING"
  | RESPONSE_CONTENT_TYPE -> `String "RESPONSE_CONTENT_TYPE"
  | CUSTOM_RESPONSE -> `String "CUSTOM_RESPONSE"
  | CUSTOM_RESPONSE_BODY -> `String "CUSTOM_RESPONSE_BODY"
  | JSON_MATCH_PATTERN -> `String "JSON_MATCH_PATTERN"
  | JSON_MATCH_SCOPE -> `String "JSON_MATCH_SCOPE"
  | BODY_PARSING_FALLBACK_BEHAVIOR -> `String "BODY_PARSING_FALLBACK_BEHAVIOR"
  | LOGGING_FILTER -> `String "LOGGING_FILTER"
  | FILTER_CONDITION -> `String "FILTER_CONDITION"
  | EXPIRE_TIMESTAMP -> `String "EXPIRE_TIMESTAMP"
  | CHANGE_PROPAGATION_STATUS -> `String "CHANGE_PROPAGATION_STATUS"
  | ASSOCIABLE_RESOURCE -> `String "ASSOCIABLE_RESOURCE"
  | LOG_DESTINATION -> `String "LOG_DESTINATION"
  | MANAGED_RULE_GROUP_CONFIG -> `String "MANAGED_RULE_GROUP_CONFIG"
  | PAYLOAD_TYPE -> `String "PAYLOAD_TYPE"
  | HEADER_MATCH_PATTERN -> `String "HEADER_MATCH_PATTERN"
  | COOKIE_MATCH_PATTERN -> `String "COOKIE_MATCH_PATTERN"
  | MAP_MATCH_SCOPE -> `String "MAP_MATCH_SCOPE"
  | OVERSIZE_HANDLING -> `String "OVERSIZE_HANDLING"
  | CHALLENGE_CONFIG -> `String "CHALLENGE_CONFIG"
  | TOKEN_DOMAIN -> `String "TOKEN_DOMAIN"
  | ATP_RULE_SET_RESPONSE_INSPECTION -> `String "ATP_RULE_SET_RESPONSE_INSPECTION"
  | ASSOCIATED_RESOURCE_TYPE -> `String "ASSOCIATED_RESOURCE_TYPE"
  | SCOPE_DOWN -> `String "SCOPE_DOWN"
  | CUSTOM_KEYS -> `String "CUSTOM_KEYS"
  | ACP_RULE_SET_RESPONSE_INSPECTION -> `String "ACP_RULE_SET_RESPONSE_INSPECTION"
  | DATA_PROTECTION_CONFIG -> `String "DATA_PROTECTION_CONFIG"
  | LOW_REPUTATION_MODE -> `String "LOW_REPUTATION_MODE"
  | MONETIZATION_CONFIG -> `String "MONETIZATION_CONFIG"
  | WALLET_ADDRESS -> `String "WALLET_ADDRESS"
  | PRICE_AMOUNT -> `String "PRICE_AMOUNT"
  | PAYMENT_NETWORK -> `String "PAYMENT_NETWORK"

let waf_invalid_parameter_exception_to_yojson (x : waf_invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("Field", option_to_yojson parameter_exception_field_to_yojson x.field);
      ("Parameter", option_to_yojson parameter_exception_parameter_to_yojson x.parameter);
      ("Reason", option_to_yojson error_reason_to_yojson x.reason);
    ]

let waf_invalid_operation_exception_to_yojson (x : waf_invalid_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_internal_error_exception_to_yojson (x : waf_internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let required_pricing_plan_name_to_yojson = string_to_yojson
let pricing_plan_feature_name_to_yojson = string_to_yojson

let disallowed_feature_to_yojson (x : disallowed_feature) =
  assoc_to_yojson
    [
      ("Feature", option_to_yojson pricing_plan_feature_name_to_yojson x.feature);
      ( "RequiredPricingPlan",
        option_to_yojson required_pricing_plan_name_to_yojson x.required_pricing_plan );
    ]

let disallowed_features_to_yojson tree = list_to_yojson disallowed_feature_to_yojson tree

let waf_feature_not_included_in_pricing_plan_exception_to_yojson
    (x : waf_feature_not_included_in_pricing_plan_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("DisallowedFeatures", option_to_yojson disallowed_features_to_yojson x.disallowed_features);
    ]

let waf_expired_managed_rule_group_version_exception_to_yojson
    (x : waf_expired_managed_rule_group_version_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_duplicate_item_exception_to_yojson (x : waf_duplicate_item_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_configuration_warning_exception_to_yojson (x : waf_configuration_warning_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let lock_token_to_yojson = string_to_yojson

let update_web_acl_response_to_yojson (x : update_web_acl_response) =
  assoc_to_yojson [ ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token) ]

let currency_mode_to_yojson (x : currency_mode) =
  match x with REAL -> `String "REAL" | TEST -> `String "TEST"

let crypto_currency_to_yojson (x : crypto_currency) = match x with USDC -> `String "USDC"
let price_amount_to_yojson = string_to_yojson

let price_to_yojson (x : price) =
  assoc_to_yojson
    [
      ("Amount", Some (price_amount_to_yojson x.amount));
      ("Currency", Some (crypto_currency_to_yojson x.currency));
    ]

let prices_to_yojson tree = list_to_yojson price_to_yojson tree
let wallet_address_to_yojson = string_to_yojson

let blockchain_chain_to_yojson (x : blockchain_chain) =
  match x with
  | BASE -> `String "BASE"
  | SOLANA -> `String "SOLANA"
  | BASE_SEPOLIA -> `String "BASE_SEPOLIA"
  | SOLANA_DEVNET -> `String "SOLANA_DEVNET"

let payment_network_to_yojson (x : payment_network) =
  assoc_to_yojson
    [
      ("Chain", Some (blockchain_chain_to_yojson x.chain));
      ("WalletAddress", Some (wallet_address_to_yojson x.wallet_address));
      ("Prices", Some (prices_to_yojson x.prices));
    ]

let payment_networks_to_yojson tree = list_to_yojson payment_network_to_yojson tree

let crypto_config_to_yojson (x : crypto_config) =
  assoc_to_yojson [ ("PaymentNetworks", Some (payment_networks_to_yojson x.payment_networks)) ]

let monetization_config_to_yojson (x : monetization_config) =
  assoc_to_yojson
    [
      ("CryptoConfig", option_to_yojson crypto_config_to_yojson x.crypto_config);
      ("CurrencyMode", option_to_yojson currency_mode_to_yojson x.currency_mode);
    ]

let attribute_value_to_yojson = string_to_yojson
let attribute_values_to_yojson tree = list_to_yojson attribute_value_to_yojson tree
let attribute_name_to_yojson = string_to_yojson

let application_attribute_to_yojson (x : application_attribute) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson attribute_name_to_yojson x.name);
      ("Values", option_to_yojson attribute_values_to_yojson x.values);
    ]

let application_attributes_to_yojson tree = list_to_yojson application_attribute_to_yojson tree

let application_config_to_yojson (x : application_config) =
  assoc_to_yojson [ ("Attributes", option_to_yojson application_attributes_to_yojson x.attributes) ]

let low_reputation_mode_to_yojson (x : low_reputation_mode) =
  match x with ACTIVE_UNDER_DDOS -> `String "ACTIVE_UNDER_DDOS" | ALWAYS_ON -> `String "ALWAYS_ON"

let on_source_d_do_s_protection_config_to_yojson (x : on_source_d_do_s_protection_config) =
  assoc_to_yojson
    [ ("ALBLowReputationMode", Some (low_reputation_mode_to_yojson x.alb_low_reputation_mode)) ]

let size_inspection_limit_to_yojson (x : size_inspection_limit) =
  match x with
  | KB_16 -> `String "KB_16"
  | KB_32 -> `String "KB_32"
  | KB_48 -> `String "KB_48"
  | KB_64 -> `String "KB_64"

let request_body_associated_resource_type_config_to_yojson
    (x : request_body_associated_resource_type_config) =
  assoc_to_yojson
    [
      ( "DefaultSizeInspectionLimit",
        Some (size_inspection_limit_to_yojson x.default_size_inspection_limit) );
    ]

let associated_resource_type_to_yojson (x : associated_resource_type) =
  match x with
  | CLOUDFRONT -> `String "CLOUDFRONT"
  | API_GATEWAY -> `String "API_GATEWAY"
  | COGNITO_USER_POOL -> `String "COGNITO_USER_POOL"
  | APP_RUNNER_SERVICE -> `String "APP_RUNNER_SERVICE"
  | VERIFIED_ACCESS_INSTANCE -> `String "VERIFIED_ACCESS_INSTANCE"
  | AGENTCORE_GATEWAY -> `String "AGENTCORE_GATEWAY"

let request_body_to_yojson tree =
  map_to_yojson associated_resource_type_to_yojson
    request_body_associated_resource_type_config_to_yojson tree

let association_config_to_yojson (x : association_config) =
  assoc_to_yojson [ ("RequestBody", option_to_yojson request_body_to_yojson x.request_body) ]

let time_window_second_to_yojson = long_to_yojson

let immunity_time_property_to_yojson (x : immunity_time_property) =
  assoc_to_yojson [ ("ImmunityTime", Some (time_window_second_to_yojson x.immunity_time)) ]

let challenge_config_to_yojson (x : challenge_config) =
  assoc_to_yojson
    [
      ( "ImmunityTimeProperty",
        option_to_yojson immunity_time_property_to_yojson x.immunity_time_property );
    ]

let captcha_config_to_yojson (x : captcha_config) =
  assoc_to_yojson
    [
      ( "ImmunityTimeProperty",
        option_to_yojson immunity_time_property_to_yojson x.immunity_time_property );
    ]

let response_content_to_yojson = string_to_yojson

let response_content_type_to_yojson (x : response_content_type) =
  match x with
  | TEXT_PLAIN -> `String "TEXT_PLAIN"
  | TEXT_HTML -> `String "TEXT_HTML"
  | APPLICATION_JSON -> `String "APPLICATION_JSON"

let custom_response_body_to_yojson (x : custom_response_body) =
  assoc_to_yojson
    [
      ("ContentType", Some (response_content_type_to_yojson x.content_type));
      ("Content", Some (response_content_to_yojson x.content));
    ]

let entity_name_to_yojson = string_to_yojson

let custom_response_bodies_to_yojson tree =
  map_to_yojson entity_name_to_yojson custom_response_body_to_yojson tree

let data_protection_action_to_yojson (x : data_protection_action) =
  match x with SUBSTITUTION -> `String "SUBSTITUTION" | HASH -> `String "HASH"

let field_to_protect_key_name_to_yojson = string_to_yojson
let field_to_protect_keys_to_yojson tree = list_to_yojson field_to_protect_key_name_to_yojson tree

let field_to_protect_type_to_yojson (x : field_to_protect_type) =
  match x with
  | SINGLE_HEADER -> `String "SINGLE_HEADER"
  | SINGLE_COOKIE -> `String "SINGLE_COOKIE"
  | SINGLE_QUERY_ARGUMENT -> `String "SINGLE_QUERY_ARGUMENT"
  | QUERY_STRING -> `String "QUERY_STRING"
  | BODY -> `String "BODY"

let field_to_protect_to_yojson (x : field_to_protect) =
  assoc_to_yojson
    [
      ("FieldType", Some (field_to_protect_type_to_yojson x.field_type));
      ("FieldKeys", option_to_yojson field_to_protect_keys_to_yojson x.field_keys);
    ]

let data_protection_to_yojson (x : data_protection) =
  assoc_to_yojson
    [
      ("Field", Some (field_to_protect_to_yojson x.field));
      ("Action", Some (data_protection_action_to_yojson x.action));
      ("ExcludeRuleMatchDetails", option_to_yojson boolean__to_yojson x.exclude_rule_match_details);
      ("ExcludeRateBasedDetails", option_to_yojson boolean__to_yojson x.exclude_rate_based_details);
    ]

let data_protections_to_yojson tree = list_to_yojson data_protection_to_yojson tree

let data_protection_config_to_yojson (x : data_protection_config) =
  assoc_to_yojson [ ("DataProtections", Some (data_protections_to_yojson x.data_protections)) ]

let metric_name_to_yojson = string_to_yojson

let visibility_config_to_yojson (x : visibility_config) =
  assoc_to_yojson
    [
      ("SampledRequestsEnabled", Some (boolean__to_yojson x.sampled_requests_enabled));
      ("CloudWatchMetricsEnabled", Some (boolean__to_yojson x.cloud_watch_metrics_enabled));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
    ]

let label_name_to_yojson = string_to_yojson
let label_to_yojson (x : label) = assoc_to_yojson [ ("Name", Some (label_name_to_yojson x.name)) ]
let labels_to_yojson tree = list_to_yojson label_to_yojson tree
let none_action_to_yojson = unit_to_yojson
let custom_http_header_value_to_yojson = string_to_yojson
let custom_http_header_name_to_yojson = string_to_yojson

let custom_http_header_to_yojson (x : custom_http_header) =
  assoc_to_yojson
    [
      ("Name", Some (custom_http_header_name_to_yojson x.name));
      ("Value", Some (custom_http_header_value_to_yojson x.value));
    ]

let custom_http_headers_to_yojson tree = list_to_yojson custom_http_header_to_yojson tree

let custom_request_handling_to_yojson (x : custom_request_handling) =
  assoc_to_yojson [ ("InsertHeaders", Some (custom_http_headers_to_yojson x.insert_headers)) ]

let count_action_to_yojson (x : count_action) =
  assoc_to_yojson
    [
      ( "CustomRequestHandling",
        option_to_yojson custom_request_handling_to_yojson x.custom_request_handling );
    ]

let override_action_to_yojson (x : override_action) =
  assoc_to_yojson
    [
      ("Count", option_to_yojson count_action_to_yojson x.count);
      ("None", option_to_yojson none_action_to_yojson x.none);
    ]

let price_multiplier_to_yojson = string_to_yojson

let monetize_action_to_yojson (x : monetize_action) =
  assoc_to_yojson
    [ ("PriceMultiplier", option_to_yojson price_multiplier_to_yojson x.price_multiplier) ]

let challenge_action_to_yojson (x : challenge_action) =
  assoc_to_yojson
    [
      ( "CustomRequestHandling",
        option_to_yojson custom_request_handling_to_yojson x.custom_request_handling );
    ]

let captcha_action_to_yojson (x : captcha_action) =
  assoc_to_yojson
    [
      ( "CustomRequestHandling",
        option_to_yojson custom_request_handling_to_yojson x.custom_request_handling );
    ]

let allow_action_to_yojson (x : allow_action) =
  assoc_to_yojson
    [
      ( "CustomRequestHandling",
        option_to_yojson custom_request_handling_to_yojson x.custom_request_handling );
    ]

let response_status_code_to_yojson = int_to_yojson

let custom_response_to_yojson (x : custom_response) =
  assoc_to_yojson
    [
      ("ResponseCode", Some (response_status_code_to_yojson x.response_code));
      ("CustomResponseBodyKey", option_to_yojson entity_name_to_yojson x.custom_response_body_key);
      ("ResponseHeaders", option_to_yojson custom_http_headers_to_yojson x.response_headers);
    ]

let block_action_to_yojson (x : block_action) =
  assoc_to_yojson
    [ ("CustomResponse", option_to_yojson custom_response_to_yojson x.custom_response) ]

let rule_action_to_yojson (x : rule_action) =
  assoc_to_yojson
    [
      ("Block", option_to_yojson block_action_to_yojson x.block);
      ("Allow", option_to_yojson allow_action_to_yojson x.allow);
      ("Count", option_to_yojson count_action_to_yojson x.count);
      ("Captcha", option_to_yojson captcha_action_to_yojson x.captcha);
      ("Challenge", option_to_yojson challenge_action_to_yojson x.challenge);
      ("Monetize", option_to_yojson monetize_action_to_yojson x.monetize);
    ]

let fallback_behavior_to_yojson (x : fallback_behavior) =
  match x with MATCH -> `String "MATCH" | NO_MATCH -> `String "NO_MATCH"

let forwarded_ip_header_name_to_yojson = string_to_yojson

let forwarded_ip_config_to_yojson (x : forwarded_ip_config) =
  assoc_to_yojson
    [
      ("HeaderName", Some (forwarded_ip_header_name_to_yojson x.header_name));
      ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior));
    ]

let asn_list_to_yojson tree = list_to_yojson as_n_to_yojson tree

let asn_match_statement_to_yojson (x : asn_match_statement) =
  assoc_to_yojson
    [
      ("AsnList", Some (asn_list_to_yojson x.asn_list));
      ("ForwardedIPConfig", option_to_yojson forwarded_ip_config_to_yojson x.forwarded_ip_config);
    ]

let text_transformation_type_to_yojson (x : text_transformation_type) =
  match x with
  | NONE -> `String "NONE"
  | COMPRESS_WHITE_SPACE -> `String "COMPRESS_WHITE_SPACE"
  | HTML_ENTITY_DECODE -> `String "HTML_ENTITY_DECODE"
  | LOWERCASE -> `String "LOWERCASE"
  | CMD_LINE -> `String "CMD_LINE"
  | URL_DECODE -> `String "URL_DECODE"
  | BASE64_DECODE -> `String "BASE64_DECODE"
  | HEX_DECODE -> `String "HEX_DECODE"
  | MD5 -> `String "MD5"
  | REPLACE_COMMENTS -> `String "REPLACE_COMMENTS"
  | ESCAPE_SEQ_DECODE -> `String "ESCAPE_SEQ_DECODE"
  | SQL_HEX_DECODE -> `String "SQL_HEX_DECODE"
  | CSS_DECODE -> `String "CSS_DECODE"
  | JS_DECODE -> `String "JS_DECODE"
  | NORMALIZE_PATH -> `String "NORMALIZE_PATH"
  | NORMALIZE_PATH_WIN -> `String "NORMALIZE_PATH_WIN"
  | REMOVE_NULLS -> `String "REMOVE_NULLS"
  | REPLACE_NULLS -> `String "REPLACE_NULLS"
  | BASE64_DECODE_EXT -> `String "BASE64_DECODE_EXT"
  | URL_DECODE_UNI -> `String "URL_DECODE_UNI"
  | UTF8_TO_UNICODE -> `String "UTF8_TO_UNICODE"

let text_transformation_priority_to_yojson = int_to_yojson

let text_transformation_to_yojson (x : text_transformation) =
  assoc_to_yojson
    [
      ("Priority", Some (text_transformation_priority_to_yojson x.priority));
      ("Type", Some (text_transformation_type_to_yojson x.type_));
    ]

let text_transformations_to_yojson tree = list_to_yojson text_transformation_to_yojson tree

let uri_fragment_to_yojson (x : uri_fragment) =
  assoc_to_yojson
    [ ("FallbackBehavior", option_to_yojson fallback_behavior_to_yojson x.fallback_behavior) ]

let ja4_fingerprint_to_yojson (x : ja4_fingerprint) =
  assoc_to_yojson [ ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior)) ]

let ja3_fingerprint_to_yojson (x : ja3_fingerprint) =
  assoc_to_yojson [ ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior)) ]

let oversize_handling_to_yojson (x : oversize_handling) =
  match x with
  | CONTINUE -> `String "CONTINUE"
  | MATCH -> `String "MATCH"
  | NO_MATCH -> `String "NO_MATCH"

let header_order_to_yojson (x : header_order) =
  assoc_to_yojson [ ("OversizeHandling", Some (oversize_handling_to_yojson x.oversize_handling)) ]

let map_match_scope_to_yojson (x : map_match_scope) =
  match x with ALL -> `String "ALL" | KEY -> `String "KEY" | VALUE -> `String "VALUE"

let single_cookie_name_to_yojson = string_to_yojson
let cookie_names_to_yojson tree = list_to_yojson single_cookie_name_to_yojson tree
let all_to_yojson = unit_to_yojson

let cookie_match_pattern_to_yojson (x : cookie_match_pattern) =
  assoc_to_yojson
    [
      ("All", option_to_yojson all_to_yojson x.all);
      ("IncludedCookies", option_to_yojson cookie_names_to_yojson x.included_cookies);
      ("ExcludedCookies", option_to_yojson cookie_names_to_yojson x.excluded_cookies);
    ]

let cookies_to_yojson (x : cookies) =
  assoc_to_yojson
    [
      ("MatchPattern", Some (cookie_match_pattern_to_yojson x.match_pattern));
      ("MatchScope", Some (map_match_scope_to_yojson x.match_scope));
      ("OversizeHandling", Some (oversize_handling_to_yojson x.oversize_handling));
    ]

let field_to_match_data_to_yojson = string_to_yojson
let header_names_to_yojson tree = list_to_yojson field_to_match_data_to_yojson tree

let header_match_pattern_to_yojson (x : header_match_pattern) =
  assoc_to_yojson
    [
      ("All", option_to_yojson all_to_yojson x.all);
      ("IncludedHeaders", option_to_yojson header_names_to_yojson x.included_headers);
      ("ExcludedHeaders", option_to_yojson header_names_to_yojson x.excluded_headers);
    ]

let headers_to_yojson (x : headers) =
  assoc_to_yojson
    [
      ("MatchPattern", Some (header_match_pattern_to_yojson x.match_pattern));
      ("MatchScope", Some (map_match_scope_to_yojson x.match_scope));
      ("OversizeHandling", Some (oversize_handling_to_yojson x.oversize_handling));
    ]

let body_parsing_fallback_behavior_to_yojson (x : body_parsing_fallback_behavior) =
  match x with
  | MATCH -> `String "MATCH"
  | NO_MATCH -> `String "NO_MATCH"
  | EVALUATE_AS_STRING -> `String "EVALUATE_AS_STRING"

let json_match_scope_to_yojson (x : json_match_scope) =
  match x with ALL -> `String "ALL" | KEY -> `String "KEY" | VALUE -> `String "VALUE"

let json_pointer_path_to_yojson = string_to_yojson
let json_pointer_paths_to_yojson tree = list_to_yojson json_pointer_path_to_yojson tree

let json_match_pattern_to_yojson (x : json_match_pattern) =
  assoc_to_yojson
    [
      ("All", option_to_yojson all_to_yojson x.all);
      ("IncludedPaths", option_to_yojson json_pointer_paths_to_yojson x.included_paths);
    ]

let json_body_to_yojson (x : json_body) =
  assoc_to_yojson
    [
      ("MatchPattern", Some (json_match_pattern_to_yojson x.match_pattern));
      ("MatchScope", Some (json_match_scope_to_yojson x.match_scope));
      ( "InvalidFallbackBehavior",
        option_to_yojson body_parsing_fallback_behavior_to_yojson x.invalid_fallback_behavior );
      ("OversizeHandling", option_to_yojson oversize_handling_to_yojson x.oversize_handling);
    ]

let method__to_yojson = unit_to_yojson

let body_to_yojson (x : body) =
  assoc_to_yojson
    [ ("OversizeHandling", option_to_yojson oversize_handling_to_yojson x.oversize_handling) ]

let query_string_to_yojson = unit_to_yojson
let uri_path_to_yojson = unit_to_yojson
let all_query_arguments_to_yojson = unit_to_yojson

let single_query_argument_to_yojson (x : single_query_argument) =
  assoc_to_yojson [ ("Name", Some (field_to_match_data_to_yojson x.name)) ]

let single_header_to_yojson (x : single_header) =
  assoc_to_yojson [ ("Name", Some (field_to_match_data_to_yojson x.name)) ]

let field_to_match_to_yojson (x : field_to_match) =
  assoc_to_yojson
    [
      ("SingleHeader", option_to_yojson single_header_to_yojson x.single_header);
      ( "SingleQueryArgument",
        option_to_yojson single_query_argument_to_yojson x.single_query_argument );
      ("AllQueryArguments", option_to_yojson all_query_arguments_to_yojson x.all_query_arguments);
      ("UriPath", option_to_yojson uri_path_to_yojson x.uri_path);
      ("QueryString", option_to_yojson query_string_to_yojson x.query_string);
      ("Body", option_to_yojson body_to_yojson x.body);
      ("Method", option_to_yojson method__to_yojson x.method_);
      ("JsonBody", option_to_yojson json_body_to_yojson x.json_body);
      ("Headers", option_to_yojson headers_to_yojson x.headers);
      ("Cookies", option_to_yojson cookies_to_yojson x.cookies);
      ("HeaderOrder", option_to_yojson header_order_to_yojson x.header_order);
      ("JA3Fingerprint", option_to_yojson ja3_fingerprint_to_yojson x.ja3_fingerprint);
      ("JA4Fingerprint", option_to_yojson ja4_fingerprint_to_yojson x.ja4_fingerprint);
      ("UriFragment", option_to_yojson uri_fragment_to_yojson x.uri_fragment);
    ]

let regex_match_statement_to_yojson (x : regex_match_statement) =
  assoc_to_yojson
    [
      ("RegexString", Some (regex_pattern_string_to_yojson x.regex_string));
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let label_match_key_to_yojson = string_to_yojson

let label_match_scope_to_yojson (x : label_match_scope) =
  match x with LABEL -> `String "LABEL" | NAMESPACE -> `String "NAMESPACE"

let label_match_statement_to_yojson (x : label_match_statement) =
  assoc_to_yojson
    [
      ("Scope", Some (label_match_scope_to_yojson x.scope));
      ("Key", Some (label_match_key_to_yojson x.key));
    ]

let rule_action_override_to_yojson (x : rule_action_override) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("ActionToUse", Some (rule_action_to_yojson x.action_to_use));
    ]

let rule_action_overrides_to_yojson tree = list_to_yojson rule_action_override_to_yojson tree
let login_path_string_to_yojson = string_to_yojson

let managed_rule_group_config_to_yojson (x : managed_rule_group_config) =
  assoc_to_yojson
    [
      ("LoginPath", option_to_yojson login_path_string_to_yojson x.login_path);
      ("PayloadType", option_to_yojson payload_type_to_yojson x.payload_type);
      ("UsernameField", option_to_yojson username_field_to_yojson x.username_field);
      ("PasswordField", option_to_yojson password_field_to_yojson x.password_field);
      ( "AWSManagedRulesBotControlRuleSet",
        option_to_yojson aws_managed_rules_bot_control_rule_set_to_yojson
          x.aws_managed_rules_bot_control_rule_set );
      ( "AWSManagedRulesATPRuleSet",
        option_to_yojson aws_managed_rules_atp_rule_set_to_yojson x.aws_managed_rules_atp_rule_set
      );
      ( "AWSManagedRulesACFPRuleSet",
        option_to_yojson aws_managed_rules_acfp_rule_set_to_yojson x.aws_managed_rules_acfp_rule_set
      );
      ( "AWSManagedRulesAntiDDoSRuleSet",
        option_to_yojson aws_managed_rules_anti_d_do_s_rule_set_to_yojson
          x.aws_managed_rules_anti_d_do_s_rule_set );
    ]

let managed_rule_group_configs_to_yojson tree =
  list_to_yojson managed_rule_group_config_to_yojson tree

let excluded_rule_to_yojson (x : excluded_rule) =
  assoc_to_yojson [ ("Name", Some (entity_name_to_yojson x.name)) ]

let excluded_rules_to_yojson tree = list_to_yojson excluded_rule_to_yojson tree
let version_key_string_to_yojson = string_to_yojson
let vendor_name_to_yojson = string_to_yojson
let rate_limit_asn_to_yojson = unit_to_yojson

let rate_limit_ja4_fingerprint_to_yojson (x : rate_limit_ja4_fingerprint) =
  assoc_to_yojson [ ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior)) ]

let rate_limit_ja3_fingerprint_to_yojson (x : rate_limit_ja3_fingerprint) =
  assoc_to_yojson [ ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior)) ]

let rate_limit_uri_path_to_yojson (x : rate_limit_uri_path) =
  assoc_to_yojson
    [ ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations)) ]

let label_namespace_to_yojson = string_to_yojson

let rate_limit_label_namespace_to_yojson (x : rate_limit_label_namespace) =
  assoc_to_yojson [ ("Namespace", Some (label_namespace_to_yojson x.namespace)) ]

let rate_limit_i_p_to_yojson = unit_to_yojson
let rate_limit_forwarded_i_p_to_yojson = unit_to_yojson
let rate_limit_http_method_to_yojson = unit_to_yojson

let rate_limit_query_string_to_yojson (x : rate_limit_query_string) =
  assoc_to_yojson
    [ ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations)) ]

let rate_limit_query_argument_to_yojson (x : rate_limit_query_argument) =
  assoc_to_yojson
    [
      ("Name", Some (field_to_match_data_to_yojson x.name));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let rate_limit_cookie_to_yojson (x : rate_limit_cookie) =
  assoc_to_yojson
    [
      ("Name", Some (field_to_match_data_to_yojson x.name));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let rate_limit_header_to_yojson (x : rate_limit_header) =
  assoc_to_yojson
    [
      ("Name", Some (field_to_match_data_to_yojson x.name));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let rate_based_statement_custom_key_to_yojson (x : rate_based_statement_custom_key) =
  assoc_to_yojson
    [
      ("Header", option_to_yojson rate_limit_header_to_yojson x.header);
      ("Cookie", option_to_yojson rate_limit_cookie_to_yojson x.cookie);
      ("QueryArgument", option_to_yojson rate_limit_query_argument_to_yojson x.query_argument);
      ("QueryString", option_to_yojson rate_limit_query_string_to_yojson x.query_string);
      ("HTTPMethod", option_to_yojson rate_limit_http_method_to_yojson x.http_method);
      ("ForwardedIP", option_to_yojson rate_limit_forwarded_i_p_to_yojson x.forwarded_i_p);
      ("IP", option_to_yojson rate_limit_i_p_to_yojson x.i_p);
      ("LabelNamespace", option_to_yojson rate_limit_label_namespace_to_yojson x.label_namespace);
      ("UriPath", option_to_yojson rate_limit_uri_path_to_yojson x.uri_path);
      ("JA3Fingerprint", option_to_yojson rate_limit_ja3_fingerprint_to_yojson x.ja3_fingerprint);
      ("JA4Fingerprint", option_to_yojson rate_limit_ja4_fingerprint_to_yojson x.ja4_fingerprint);
      ("ASN", option_to_yojson rate_limit_asn_to_yojson x.as_n);
    ]

let rate_based_statement_custom_keys_to_yojson tree =
  list_to_yojson rate_based_statement_custom_key_to_yojson tree

let rate_based_statement_aggregate_key_type_to_yojson (x : rate_based_statement_aggregate_key_type)
    =
  match x with
  | IP -> `String "IP"
  | FORWARDED_IP -> `String "FORWARDED_IP"
  | CUSTOM_KEYS -> `String "CUSTOM_KEYS"
  | CONSTANT -> `String "CONSTANT"

let evaluation_window_sec_to_yojson = long_to_yojson
let rate_limit_to_yojson = long_to_yojson
let resource_arn_to_yojson = string_to_yojson

let regex_pattern_set_reference_statement_to_yojson (x : regex_pattern_set_reference_statement) =
  assoc_to_yojson
    [
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let forwarded_ip_position_to_yojson (x : forwarded_ip_position) =
  match x with FIRST -> `String "FIRST" | LAST -> `String "LAST" | ANY -> `String "ANY"

let ip_set_forwarded_ip_config_to_yojson (x : ip_set_forwarded_ip_config) =
  assoc_to_yojson
    [
      ("HeaderName", Some (forwarded_ip_header_name_to_yojson x.header_name));
      ("FallbackBehavior", Some (fallback_behavior_to_yojson x.fallback_behavior));
      ("Position", Some (forwarded_ip_position_to_yojson x.position));
    ]

let ip_set_reference_statement_to_yojson (x : ip_set_reference_statement) =
  assoc_to_yojson
    [
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ( "IPSetForwardedIPConfig",
        option_to_yojson ip_set_forwarded_ip_config_to_yojson x.ip_set_forwarded_ip_config );
    ]

let rule_group_reference_statement_to_yojson (x : rule_group_reference_statement) =
  assoc_to_yojson
    [
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("ExcludedRules", option_to_yojson excluded_rules_to_yojson x.excluded_rules);
      ( "RuleActionOverrides",
        option_to_yojson rule_action_overrides_to_yojson x.rule_action_overrides );
    ]

let country_code_to_yojson (x : country_code) =
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
  | XK -> `String "XK"

let country_codes_to_yojson tree = list_to_yojson country_code_to_yojson tree

let geo_match_statement_to_yojson (x : geo_match_statement) =
  assoc_to_yojson
    [
      ("CountryCodes", option_to_yojson country_codes_to_yojson x.country_codes);
      ("ForwardedIPConfig", option_to_yojson forwarded_ip_config_to_yojson x.forwarded_ip_config);
    ]

let size_to_yojson = long_to_yojson

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | EQ -> `String "EQ"
  | NE -> `String "NE"
  | LE -> `String "LE"
  | LT -> `String "LT"
  | GE -> `String "GE"
  | GT -> `String "GT"

let size_constraint_statement_to_yojson (x : size_constraint_statement) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("ComparisonOperator", Some (comparison_operator_to_yojson x.comparison_operator));
      ("Size", Some (size_to_yojson x.size));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let xss_match_statement_to_yojson (x : xss_match_statement) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
    ]

let sensitivity_level_to_yojson (x : sensitivity_level) =
  match x with LOW -> `String "LOW" | HIGH -> `String "HIGH"

let sqli_match_statement_to_yojson (x : sqli_match_statement) =
  assoc_to_yojson
    [
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
      ("SensitivityLevel", option_to_yojson sensitivity_level_to_yojson x.sensitivity_level);
    ]

let positional_constraint_to_yojson (x : positional_constraint) =
  match x with
  | EXACTLY -> `String "EXACTLY"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"
  | CONTAINS_WORD -> `String "CONTAINS_WORD"

let search_string_to_yojson = blob_to_yojson

let byte_match_statement_to_yojson (x : byte_match_statement) =
  assoc_to_yojson
    [
      ("SearchString", Some (search_string_to_yojson x.search_string));
      ("FieldToMatch", Some (field_to_match_to_yojson x.field_to_match));
      ("TextTransformations", Some (text_transformations_to_yojson x.text_transformations));
      ("PositionalConstraint", Some (positional_constraint_to_yojson x.positional_constraint));
    ]

let rec statements_to_yojson tree = list_to_yojson statement_to_yojson tree

and statement_to_yojson (x : statement) =
  assoc_to_yojson
    [
      ("ByteMatchStatement", option_to_yojson byte_match_statement_to_yojson x.byte_match_statement);
      ("SqliMatchStatement", option_to_yojson sqli_match_statement_to_yojson x.sqli_match_statement);
      ("XssMatchStatement", option_to_yojson xss_match_statement_to_yojson x.xss_match_statement);
      ( "SizeConstraintStatement",
        option_to_yojson size_constraint_statement_to_yojson x.size_constraint_statement );
      ("GeoMatchStatement", option_to_yojson geo_match_statement_to_yojson x.geo_match_statement);
      ( "RuleGroupReferenceStatement",
        option_to_yojson rule_group_reference_statement_to_yojson x.rule_group_reference_statement
      );
      ( "IPSetReferenceStatement",
        option_to_yojson ip_set_reference_statement_to_yojson x.ip_set_reference_statement );
      ( "RegexPatternSetReferenceStatement",
        option_to_yojson regex_pattern_set_reference_statement_to_yojson
          x.regex_pattern_set_reference_statement );
      ("RateBasedStatement", option_to_yojson rate_based_statement_to_yojson x.rate_based_statement);
      ("AndStatement", option_to_yojson and_statement_to_yojson x.and_statement);
      ("OrStatement", option_to_yojson or_statement_to_yojson x.or_statement);
      ("NotStatement", option_to_yojson not_statement_to_yojson x.not_statement);
      ( "ManagedRuleGroupStatement",
        option_to_yojson managed_rule_group_statement_to_yojson x.managed_rule_group_statement );
      ( "LabelMatchStatement",
        option_to_yojson label_match_statement_to_yojson x.label_match_statement );
      ( "RegexMatchStatement",
        option_to_yojson regex_match_statement_to_yojson x.regex_match_statement );
      ("AsnMatchStatement", option_to_yojson asn_match_statement_to_yojson x.asn_match_statement);
    ]

and rate_based_statement_to_yojson (x : rate_based_statement) =
  assoc_to_yojson
    [
      ("Limit", Some (rate_limit_to_yojson x.limit));
      ( "EvaluationWindowSec",
        option_to_yojson evaluation_window_sec_to_yojson x.evaluation_window_sec );
      ( "AggregateKeyType",
        Some (rate_based_statement_aggregate_key_type_to_yojson x.aggregate_key_type) );
      ("ScopeDownStatement", option_to_yojson statement_to_yojson x.scope_down_statement);
      ("ForwardedIPConfig", option_to_yojson forwarded_ip_config_to_yojson x.forwarded_ip_config);
      ("CustomKeys", option_to_yojson rate_based_statement_custom_keys_to_yojson x.custom_keys);
    ]

and or_statement_to_yojson (x : or_statement) =
  assoc_to_yojson [ ("Statements", Some (statements_to_yojson x.statements)) ]

and not_statement_to_yojson (x : not_statement) =
  assoc_to_yojson [ ("Statement", Some (statement_to_yojson x.statement)) ]

and managed_rule_group_statement_to_yojson (x : managed_rule_group_statement) =
  assoc_to_yojson
    [
      ("VendorName", Some (vendor_name_to_yojson x.vendor_name));
      ("Name", Some (entity_name_to_yojson x.name));
      ("Version", option_to_yojson version_key_string_to_yojson x.version);
      ("ExcludedRules", option_to_yojson excluded_rules_to_yojson x.excluded_rules);
      ("ScopeDownStatement", option_to_yojson statement_to_yojson x.scope_down_statement);
      ( "ManagedRuleGroupConfigs",
        option_to_yojson managed_rule_group_configs_to_yojson x.managed_rule_group_configs );
      ( "RuleActionOverrides",
        option_to_yojson rule_action_overrides_to_yojson x.rule_action_overrides );
    ]

and and_statement_to_yojson (x : and_statement) =
  assoc_to_yojson [ ("Statements", Some (statements_to_yojson x.statements)) ]

let rule_priority_to_yojson = int_to_yojson

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Priority", Some (rule_priority_to_yojson x.priority));
      ("Statement", Some (statement_to_yojson x.statement));
      ("Action", option_to_yojson rule_action_to_yojson x.action);
      ("OverrideAction", option_to_yojson override_action_to_yojson x.override_action);
      ("RuleLabels", option_to_yojson labels_to_yojson x.rule_labels);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ("CaptchaConfig", option_to_yojson captcha_config_to_yojson x.captcha_config);
      ("ChallengeConfig", option_to_yojson challenge_config_to_yojson x.challenge_config);
    ]

let rules_to_yojson tree = list_to_yojson rule_to_yojson tree
let entity_description_to_yojson = string_to_yojson

let default_action_to_yojson (x : default_action) =
  assoc_to_yojson
    [
      ("Block", option_to_yojson block_action_to_yojson x.block);
      ("Allow", option_to_yojson allow_action_to_yojson x.allow);
    ]

let entity_id_to_yojson = string_to_yojson

let scope_to_yojson (x : scope) =
  match x with CLOUDFRONT -> `String "CLOUDFRONT" | REGIONAL -> `String "REGIONAL"

let update_web_acl_request_to_yojson (x : update_web_acl_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("DefaultAction", Some (default_action_to_yojson x.default_action));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ( "DataProtectionConfig",
        option_to_yojson data_protection_config_to_yojson x.data_protection_config );
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("CaptchaConfig", option_to_yojson captcha_config_to_yojson x.captcha_config);
      ("ChallengeConfig", option_to_yojson challenge_config_to_yojson x.challenge_config);
      ("TokenDomains", option_to_yojson token_domains_to_yojson x.token_domains);
      ("AssociationConfig", option_to_yojson association_config_to_yojson x.association_config);
      ( "OnSourceDDoSProtectionConfig",
        option_to_yojson on_source_d_do_s_protection_config_to_yojson
          x.on_source_d_do_s_protection_config );
      ("ApplicationConfig", option_to_yojson application_config_to_yojson x.application_config);
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let update_rule_group_response_to_yojson (x : update_rule_group_response) =
  assoc_to_yojson [ ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token) ]

let update_rule_group_request_to_yojson (x : update_rule_group_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let update_regex_pattern_set_response_to_yojson (x : update_regex_pattern_set_response) =
  assoc_to_yojson [ ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token) ]

let update_regex_pattern_set_request_to_yojson (x : update_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("RegularExpressionList", Some (regular_expression_list_to_yojson x.regular_expression_list));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let update_managed_rule_set_version_expiry_date_response_to_yojson
    (x : update_managed_rule_set_version_expiry_date_response) =
  assoc_to_yojson
    [
      ("ExpiringVersion", option_to_yojson version_key_string_to_yojson x.expiring_version);
      ("ExpiryTimestamp", option_to_yojson timestamp_to_yojson x.expiry_timestamp);
      ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token);
    ]

let update_managed_rule_set_version_expiry_date_request_to_yojson
    (x : update_managed_rule_set_version_expiry_date_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
      ("VersionToExpire", Some (version_key_string_to_yojson x.version_to_expire));
      ("ExpiryTimestamp", Some (timestamp_to_yojson x.expiry_timestamp));
    ]

let update_ip_set_response_to_yojson (x : update_ip_set_response) =
  assoc_to_yojson [ ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token) ]

let ip_address_to_yojson = string_to_yojson
let ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let update_ip_set_request_to_yojson (x : update_ip_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Addresses", Some (ip_addresses_to_yojson x.addresses));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let waf_tag_operation_internal_error_exception_to_yojson
    (x : waf_tag_operation_internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let waf_tag_operation_exception_to_yojson (x : waf_tag_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

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
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_permission_policy_response_to_yojson = unit_to_yojson
let policy_string_to_yojson = string_to_yojson

let put_permission_policy_request_to_yojson (x : put_permission_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("Policy", Some (policy_string_to_yojson x.policy));
    ]

let put_managed_rule_set_versions_response_to_yojson (x : put_managed_rule_set_versions_response) =
  assoc_to_yojson [ ("NextLockToken", option_to_yojson lock_token_to_yojson x.next_lock_token) ]

let time_window_day_to_yojson = int_to_yojson

let version_to_publish_to_yojson (x : version_to_publish) =
  assoc_to_yojson
    [
      ("AssociatedRuleGroupArn", option_to_yojson resource_arn_to_yojson x.associated_rule_group_arn);
      ("ForecastedLifetime", option_to_yojson time_window_day_to_yojson x.forecasted_lifetime);
    ]

let versions_to_publish_to_yojson tree =
  map_to_yojson version_key_string_to_yojson version_to_publish_to_yojson tree

let put_managed_rule_set_versions_request_to_yojson (x : put_managed_rule_set_versions_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
      ("RecommendedVersion", option_to_yojson version_key_string_to_yojson x.recommended_version);
      ("VersionsToPublish", option_to_yojson versions_to_publish_to_yojson x.versions_to_publish);
    ]

let waf_service_linked_role_error_exception_to_yojson (x : waf_service_linked_role_error_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let waf_log_destination_permission_issue_exception_to_yojson
    (x : waf_log_destination_permission_issue_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let log_scope_to_yojson (x : log_scope) =
  match x with
  | CUSTOMER -> `String "CUSTOMER"
  | SECURITY_LAKE -> `String "SECURITY_LAKE"
  | CLOUDWATCH_TELEMETRY_RULE_MANAGED -> `String "CLOUDWATCH_TELEMETRY_RULE_MANAGED"

let log_type_to_yojson (x : log_type) = match x with WAF_LOGS -> `String "WAF_LOGS"

let filter_behavior_to_yojson (x : filter_behavior) =
  match x with KEEP -> `String "KEEP" | DROP -> `String "DROP"

let label_name_condition_to_yojson (x : label_name_condition) =
  assoc_to_yojson [ ("LabelName", Some (label_name_to_yojson x.label_name)) ]

let action_value_to_yojson (x : action_value) =
  match x with
  | ALLOW -> `String "ALLOW"
  | BLOCK -> `String "BLOCK"
  | COUNT -> `String "COUNT"
  | CAPTCHA -> `String "CAPTCHA"
  | CHALLENGE -> `String "CHALLENGE"
  | MONETIZE -> `String "MONETIZE"
  | EXCLUDED_AS_COUNT -> `String "EXCLUDED_AS_COUNT"

let action_condition_to_yojson (x : action_condition) =
  assoc_to_yojson [ ("Action", Some (action_value_to_yojson x.action)) ]

let condition_to_yojson (x : condition) =
  assoc_to_yojson
    [
      ("ActionCondition", option_to_yojson action_condition_to_yojson x.action_condition);
      ("LabelNameCondition", option_to_yojson label_name_condition_to_yojson x.label_name_condition);
    ]

let conditions_to_yojson tree = list_to_yojson condition_to_yojson tree

let filter_requirement_to_yojson (x : filter_requirement) =
  match x with MEETS_ALL -> `String "MEETS_ALL" | MEETS_ANY -> `String "MEETS_ANY"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Behavior", Some (filter_behavior_to_yojson x.behavior));
      ("Requirement", Some (filter_requirement_to_yojson x.requirement));
      ("Conditions", Some (conditions_to_yojson x.conditions));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let logging_filter_to_yojson (x : logging_filter) =
  assoc_to_yojson
    [
      ("Filters", Some (filters_to_yojson x.filters));
      ("DefaultBehavior", Some (filter_behavior_to_yojson x.default_behavior));
    ]

let redacted_fields_to_yojson tree = list_to_yojson field_to_match_to_yojson tree
let log_destination_configs_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("LogDestinationConfigs", Some (log_destination_configs_to_yojson x.log_destination_configs));
      ("RedactedFields", option_to_yojson redacted_fields_to_yojson x.redacted_fields);
      ("ManagedByFirewallManager", option_to_yojson boolean__to_yojson x.managed_by_firewall_manager);
      ("LoggingFilter", option_to_yojson logging_filter_to_yojson x.logging_filter);
      ("LogType", option_to_yojson log_type_to_yojson x.log_type);
      ("LogScope", option_to_yojson log_scope_to_yojson x.log_scope);
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

let web_acl_summary_to_yojson (x : web_acl_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
    ]

let web_acl_summaries_to_yojson tree = list_to_yojson web_acl_summary_to_yojson tree
let next_marker_to_yojson = string_to_yojson

let list_web_ac_ls_response_to_yojson (x : list_web_ac_ls_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("WebACLs", option_to_yojson web_acl_summaries_to_yojson x.web_ac_ls);
    ]

let pagination_limit_to_yojson = int_to_yojson

let list_web_ac_ls_request_to_yojson (x : list_web_ac_ls_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
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

let filter_string_to_yojson = string_to_yojson
let verified_status_to_yojson = bool_to_yojson
let settlement_filter_string_to_yojson = string_to_yojson
let settlement_id_string_to_yojson = string_to_yojson
let currency_to_yojson (x : currency) = match x with USDC -> `String "USDC"
let monetization_amount_value_to_yojson = string_to_yojson

let settlement_status_to_yojson (x : settlement_status) =
  match x with
  | SETTLED -> `String "SETTLED"
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | SERVICE_ERROR -> `String "SERVICE_ERROR"
  | SKIPPED_ORIGIN_ERROR -> `String "SKIPPED_ORIGIN_ERROR"
  | DUPLICATE -> `String "DUPLICATE"

let settlement_record_to_yojson (x : settlement_record) =
  assoc_to_yojson
    [
      ("Timestamp", Some (timestamp_to_yojson x.timestamp));
      ("PayerAddress", option_to_yojson settlement_filter_string_to_yojson x.payer_address);
      ("WalletAddress", option_to_yojson settlement_filter_string_to_yojson x.wallet_address);
      ("Status", Some (settlement_status_to_yojson x.status));
      ("Amount", Some (monetization_amount_value_to_yojson x.amount));
      ("Currency", option_to_yojson currency_to_yojson x.currency);
      ("Network", option_to_yojson settlement_filter_string_to_yojson x.network);
      ("TransactionId", option_to_yojson settlement_id_string_to_yojson x.transaction_id);
      ("RequestId", option_to_yojson settlement_filter_string_to_yojson x.request_id);
      ("SourceName", option_to_yojson filter_string_to_yojson x.source_name);
      ("Organization", option_to_yojson filter_string_to_yojson x.organization);
      ("SourceCategory", option_to_yojson filter_string_to_yojson x.source_category);
      ("Intent", option_to_yojson filter_string_to_yojson x.intent);
      ("Verified", option_to_yojson verified_status_to_yojson x.verified);
      ("ContentPath", option_to_yojson filter_string_to_yojson x.content_path);
      ("WebAclArn", option_to_yojson resource_arn_to_yojson x.web_acl_arn);
      ("RequestTimestamp", option_to_yojson timestamp_to_yojson x.request_timestamp);
    ]

let settlement_record_list_to_yojson tree = list_to_yojson settlement_record_to_yojson tree

let list_settlement_records_response_to_yojson (x : list_settlement_records_response) =
  assoc_to_yojson
    [
      ("Settlements", option_to_yojson settlement_record_list_to_yojson x.settlements);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let settlement_record_limit_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASC -> `String "ASC" | DESC -> `String "DESC"

let settlement_sort_by_to_yojson (x : settlement_sort_by) =
  match x with
  | TIMESTAMP -> `String "TIMESTAMP"
  | AMOUNT -> `String "AMOUNT"
  | NAME -> `String "NAME"
  | STATUS -> `String "STATUS"

let monetization_filter_value_to_yojson = string_to_yojson

let monetization_filter_value_list_to_yojson tree =
  list_to_yojson monetization_filter_value_to_yojson tree

let monetization_filter_name_to_yojson = string_to_yojson

let monetization_filter_to_yojson (x : monetization_filter) =
  assoc_to_yojson
    [
      ("Name", Some (monetization_filter_name_to_yojson x.name));
      ("Values", Some (monetization_filter_value_list_to_yojson x.values));
    ]

let monetization_filter_list_to_yojson tree = list_to_yojson monetization_filter_to_yojson tree

let time_window_to_yojson (x : time_window) =
  assoc_to_yojson
    [
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", Some (timestamp_to_yojson x.end_time));
    ]

let list_settlement_records_request_to_yojson (x : list_settlement_records_request) =
  assoc_to_yojson
    [
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Currency", Some (currency_to_yojson x.currency));
      ("Filters", option_to_yojson monetization_filter_list_to_yojson x.filters);
      ("SortBy", option_to_yojson settlement_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Limit", option_to_yojson settlement_record_limit_to_yojson x.limit);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let rule_group_summary_to_yojson (x : rule_group_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
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
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let resource_arns_to_yojson tree = list_to_yojson resource_arn_to_yojson tree

let list_resources_for_web_acl_response_to_yojson (x : list_resources_for_web_acl_response) =
  assoc_to_yojson [ ("ResourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | APPLICATION_LOAD_BALANCER -> `String "APPLICATION_LOAD_BALANCER"
  | API_GATEWAY -> `String "API_GATEWAY"
  | APPSYNC -> `String "APPSYNC"
  | COGNITIO_USER_POOL -> `String "COGNITO_USER_POOL"
  | APP_RUNNER_SERVICE -> `String "APP_RUNNER_SERVICE"
  | VERIFIED_ACCESS_INSTANCE -> `String "VERIFIED_ACCESS_INSTANCE"
  | AMPLIFY -> `String "AMPLIFY"
  | AGENTCORE_GATEWAY -> `String "AGENTCORE_GATEWAY"

let list_resources_for_web_acl_request_to_yojson (x : list_resources_for_web_acl_request) =
  assoc_to_yojson
    [
      ("WebACLArn", Some (resource_arn_to_yojson x.web_acl_arn));
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let regex_pattern_set_summary_to_yojson (x : regex_pattern_set_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
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
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let release_summary_to_yojson (x : release_summary) =
  assoc_to_yojson
    [
      ("ReleaseVersion", option_to_yojson version_key_string_to_yojson x.release_version);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let release_summaries_to_yojson tree = list_to_yojson release_summary_to_yojson tree

let list_mobile_sdk_releases_response_to_yojson (x : list_mobile_sdk_releases_response) =
  assoc_to_yojson
    [
      ("ReleaseSummaries", option_to_yojson release_summaries_to_yojson x.release_summaries);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let platform_to_yojson (x : platform) =
  match x with IOS -> `String "IOS" | ANDROID -> `String "ANDROID"

let list_mobile_sdk_releases_request_to_yojson (x : list_mobile_sdk_releases_request) =
  assoc_to_yojson
    [
      ("Platform", Some (platform_to_yojson x.platform));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let managed_rule_set_summary_to_yojson (x : managed_rule_set_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
      ("LabelNamespace", option_to_yojson label_name_to_yojson x.label_namespace);
    ]

let managed_rule_set_summaries_to_yojson tree =
  list_to_yojson managed_rule_set_summary_to_yojson tree

let list_managed_rule_sets_response_to_yojson (x : list_managed_rule_sets_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("ManagedRuleSets", option_to_yojson managed_rule_set_summaries_to_yojson x.managed_rule_sets);
    ]

let list_managed_rule_sets_request_to_yojson (x : list_managed_rule_sets_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
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
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
      ("LogScope", option_to_yojson log_scope_to_yojson x.log_scope);
    ]

let ip_set_summary_to_yojson (x : ip_set_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
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
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let managed_rule_group_version_to_yojson (x : managed_rule_group_version) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson version_key_string_to_yojson x.name);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
    ]

let managed_rule_group_versions_to_yojson tree =
  list_to_yojson managed_rule_group_version_to_yojson tree

let list_available_managed_rule_group_versions_response_to_yojson
    (x : list_available_managed_rule_group_versions_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Versions", option_to_yojson managed_rule_group_versions_to_yojson x.versions);
      ( "CurrentDefaultVersion",
        option_to_yojson version_key_string_to_yojson x.current_default_version );
    ]

let list_available_managed_rule_group_versions_request_to_yojson
    (x : list_available_managed_rule_group_versions_request) =
  assoc_to_yojson
    [
      ("VendorName", Some (vendor_name_to_yojson x.vendor_name));
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let managed_rule_group_summary_to_yojson (x : managed_rule_group_summary) =
  assoc_to_yojson
    [
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("VersioningSupported", option_to_yojson boolean__to_yojson x.versioning_supported);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
    ]

let managed_rule_group_summaries_to_yojson tree =
  list_to_yojson managed_rule_group_summary_to_yojson tree

let list_available_managed_rule_groups_response_to_yojson
    (x : list_available_managed_rule_groups_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ( "ManagedRuleGroups",
        option_to_yojson managed_rule_group_summaries_to_yojson x.managed_rule_groups );
    ]

let list_available_managed_rule_groups_request_to_yojson
    (x : list_available_managed_rule_groups_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let output_url_to_yojson = string_to_yojson

let list_api_keys_response_to_yojson (x : list_api_keys_response) =
  assoc_to_yojson
    [
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("APIKeySummaries", option_to_yojson api_key_summaries_to_yojson x.api_key_summaries);
      ( "ApplicationIntegrationURL",
        option_to_yojson output_url_to_yojson x.application_integration_ur_l );
    ]

let list_api_keys_request_to_yojson (x : list_api_keys_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson pagination_limit_to_yojson x.limit);
    ]

let firewall_manager_statement_to_yojson (x : firewall_manager_statement) =
  assoc_to_yojson
    [
      ( "ManagedRuleGroupStatement",
        option_to_yojson managed_rule_group_statement_to_yojson x.managed_rule_group_statement );
      ( "RuleGroupReferenceStatement",
        option_to_yojson rule_group_reference_statement_to_yojson x.rule_group_reference_statement
      );
    ]

let firewall_manager_rule_group_to_yojson (x : firewall_manager_rule_group) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Priority", Some (rule_priority_to_yojson x.priority));
      ( "FirewallManagerStatement",
        Some (firewall_manager_statement_to_yojson x.firewall_manager_statement) );
      ("OverrideAction", Some (override_action_to_yojson x.override_action));
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
    ]

let firewall_manager_rule_groups_to_yojson tree =
  list_to_yojson firewall_manager_rule_group_to_yojson tree

let consumed_capacity_to_yojson = long_to_yojson

let web_ac_l_to_yojson (x : web_ac_l) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Id", Some (entity_id_to_yojson x.id));
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("DefaultAction", Some (default_action_to_yojson x.default_action));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ( "DataProtectionConfig",
        option_to_yojson data_protection_config_to_yojson x.data_protection_config );
      ("Capacity", option_to_yojson consumed_capacity_to_yojson x.capacity);
      ( "PreProcessFirewallManagerRuleGroups",
        option_to_yojson firewall_manager_rule_groups_to_yojson
          x.pre_process_firewall_manager_rule_groups );
      ( "PostProcessFirewallManagerRuleGroups",
        option_to_yojson firewall_manager_rule_groups_to_yojson
          x.post_process_firewall_manager_rule_groups );
      ("ManagedByFirewallManager", option_to_yojson boolean__to_yojson x.managed_by_firewall_manager);
      ("LabelNamespace", option_to_yojson label_name_to_yojson x.label_namespace);
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("CaptchaConfig", option_to_yojson captcha_config_to_yojson x.captcha_config);
      ("ChallengeConfig", option_to_yojson challenge_config_to_yojson x.challenge_config);
      ("TokenDomains", option_to_yojson token_domains_to_yojson x.token_domains);
      ("AssociationConfig", option_to_yojson association_config_to_yojson x.association_config);
      ( "RetrofittedByFirewallManager",
        option_to_yojson boolean__to_yojson x.retrofitted_by_firewall_manager );
      ( "OnSourceDDoSProtectionConfig",
        option_to_yojson on_source_d_do_s_protection_config_to_yojson
          x.on_source_d_do_s_protection_config );
      ("ApplicationConfig", option_to_yojson application_config_to_yojson x.application_config);
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let get_web_acl_for_resource_response_to_yojson (x : get_web_acl_for_resource_response) =
  assoc_to_yojson [ ("WebACL", option_to_yojson web_ac_l_to_yojson x.web_ac_l) ]

let get_web_acl_for_resource_request_to_yojson (x : get_web_acl_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let get_web_acl_response_to_yojson (x : get_web_acl_response) =
  assoc_to_yojson
    [
      ("WebACL", option_to_yojson web_ac_l_to_yojson x.web_ac_l);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
      ( "ApplicationIntegrationURL",
        option_to_yojson output_url_to_yojson x.application_integration_ur_l );
    ]

let get_web_acl_request_to_yojson (x : get_web_acl_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
    ]

let percentage_value_to_yojson = double_to_yojson
let request_count_to_yojson = long_to_yojson

let bot_statistics_to_yojson (x : bot_statistics) =
  assoc_to_yojson
    [
      ("BotName", Some (filter_string_to_yojson x.bot_name));
      ("RequestCount", Some (request_count_to_yojson x.request_count));
      ("Percentage", Some (percentage_value_to_yojson x.percentage));
    ]

let bot_statistics_list_to_yojson tree = list_to_yojson bot_statistics_to_yojson tree
let path_string_to_yojson = string_to_yojson

let filter_source_to_yojson (x : filter_source) =
  assoc_to_yojson
    [
      ("BotCategory", option_to_yojson filter_string_to_yojson x.bot_category);
      ("BotOrganization", option_to_yojson filter_string_to_yojson x.bot_organization);
      ("BotName", option_to_yojson filter_string_to_yojson x.bot_name);
    ]

let path_statistics_to_yojson (x : path_statistics) =
  assoc_to_yojson
    [
      ("Source", option_to_yojson filter_source_to_yojson x.source);
      ("Path", Some (path_string_to_yojson x.path));
      ("RequestCount", Some (request_count_to_yojson x.request_count));
      ("Percentage", Some (percentage_value_to_yojson x.percentage));
      ("TopBots", option_to_yojson bot_statistics_list_to_yojson x.top_bots);
    ]

let path_statistics_list_to_yojson tree = list_to_yojson path_statistics_to_yojson tree

let get_top_path_statistics_by_traffic_response_to_yojson
    (x : get_top_path_statistics_by_traffic_response) =
  assoc_to_yojson
    [
      ("PathStatistics", Some (path_statistics_list_to_yojson x.path_statistics));
      ("TotalRequestCount", Some (request_count_to_yojson x.total_request_count));
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("TopCategories", option_to_yojson path_statistics_list_to_yojson x.top_categories);
    ]

let number_of_top_traffic_bots_per_path_to_yojson = int_to_yojson
let path_statistics_limit_to_yojson = int_to_yojson
let uri_path_prefix_string_to_yojson = string_to_yojson

let get_top_path_statistics_by_traffic_request_to_yojson
    (x : get_top_path_statistics_by_traffic_request) =
  assoc_to_yojson
    [
      ("WebAclArn", Some (resource_arn_to_yojson x.web_acl_arn));
      ("Scope", Some (scope_to_yojson x.scope));
      ("UriPathPrefix", option_to_yojson uri_path_prefix_string_to_yojson x.uri_path_prefix);
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("BotCategory", option_to_yojson filter_string_to_yojson x.bot_category);
      ("BotOrganization", option_to_yojson filter_string_to_yojson x.bot_organization);
      ("BotName", option_to_yojson filter_string_to_yojson x.bot_name);
      ("Limit", Some (path_statistics_limit_to_yojson x.limit));
      ( "NumberOfTopTrafficBotsPerPath",
        Some (number_of_top_traffic_bots_per_path_to_yojson x.number_of_top_traffic_bots_per_path)
      );
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let population_size_to_yojson = long_to_yojson
let action_to_yojson = string_to_yojson

let failure_reason_to_yojson (x : failure_reason) =
  match x with
  | TOKEN_MISSING -> `String "TOKEN_MISSING"
  | TOKEN_EXPIRED -> `String "TOKEN_EXPIRED"
  | TOKEN_INVALID -> `String "TOKEN_INVALID"
  | TOKEN_DOMAIN_MISMATCH -> `String "TOKEN_DOMAIN_MISMATCH"

let solve_timestamp_to_yojson = long_to_yojson
let response_code_to_yojson = int_to_yojson

let challenge_response_to_yojson (x : challenge_response) =
  assoc_to_yojson
    [
      ("ResponseCode", option_to_yojson response_code_to_yojson x.response_code);
      ("SolveTimestamp", option_to_yojson solve_timestamp_to_yojson x.solve_timestamp);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let captcha_response_to_yojson (x : captcha_response) =
  assoc_to_yojson
    [
      ("ResponseCode", option_to_yojson response_code_to_yojson x.response_code);
      ("SolveTimestamp", option_to_yojson solve_timestamp_to_yojson x.solve_timestamp);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let header_value_to_yojson = string_to_yojson
let header_name_to_yojson = string_to_yojson

let http_header_to_yojson (x : http_header) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson header_name_to_yojson x.name);
      ("Value", option_to_yojson header_value_to_yojson x.value);
    ]

let http_headers_to_yojson tree = list_to_yojson http_header_to_yojson tree
let sample_weight_to_yojson = long_to_yojson
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
      ( "RuleNameWithinRuleGroup",
        option_to_yojson entity_name_to_yojson x.rule_name_within_rule_group );
      ("RequestHeadersInserted", option_to_yojson http_headers_to_yojson x.request_headers_inserted);
      ("ResponseCodeSent", option_to_yojson response_status_code_to_yojson x.response_code_sent);
      ("Labels", option_to_yojson labels_to_yojson x.labels);
      ("CaptchaResponse", option_to_yojson captcha_response_to_yojson x.captcha_response);
      ("ChallengeResponse", option_to_yojson challenge_response_to_yojson x.challenge_response);
      ("OverriddenAction", option_to_yojson action_to_yojson x.overridden_action);
    ]

let sampled_http_requests_to_yojson tree = list_to_yojson sampled_http_request_to_yojson tree

let get_sampled_requests_response_to_yojson (x : get_sampled_requests_response) =
  assoc_to_yojson
    [
      ("SampledRequests", option_to_yojson sampled_http_requests_to_yojson x.sampled_requests);
      ("PopulationSize", option_to_yojson population_size_to_yojson x.population_size);
      ("TimeWindow", option_to_yojson time_window_to_yojson x.time_window);
    ]

let list_max_items_to_yojson = long_to_yojson

let get_sampled_requests_request_to_yojson (x : get_sampled_requests_request) =
  assoc_to_yojson
    [
      ("WebAclArn", Some (resource_arn_to_yojson x.web_acl_arn));
      ("RuleMetricName", Some (metric_name_to_yojson x.rule_metric_name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("MaxItems", Some (list_max_items_to_yojson x.max_items));
    ]

let label_summary_to_yojson (x : label_summary) =
  assoc_to_yojson [ ("Name", option_to_yojson label_name_to_yojson x.name) ]

let label_summaries_to_yojson tree = list_to_yojson label_summary_to_yojson tree
let capacity_unit_to_yojson = long_to_yojson

let rule_group_to_yojson (x : rule_group) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Id", Some (entity_id_to_yojson x.id));
      ("Capacity", Some (capacity_unit_to_yojson x.capacity));
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ("LabelNamespace", option_to_yojson label_name_to_yojson x.label_namespace);
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("AvailableLabels", option_to_yojson label_summaries_to_yojson x.available_labels);
      ("ConsumedLabels", option_to_yojson label_summaries_to_yojson x.consumed_labels);
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let get_rule_group_response_to_yojson (x : get_rule_group_response) =
  assoc_to_yojson
    [
      ("RuleGroup", option_to_yojson rule_group_to_yojson x.rule_group);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
    ]

let get_rule_group_request_to_yojson (x : get_rule_group_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
    ]

let data_point_entry_to_yojson (x : data_point_entry) =
  assoc_to_yojson
    [
      ("Date", option_to_yojson timestamp_to_yojson x.date);
      ("MonetizeServedCount", option_to_yojson request_count_to_yojson x.monetize_served_count);
      ("SettledCount", option_to_yojson request_count_to_yojson x.settled_count);
      ("TotalAmount", option_to_yojson monetization_amount_value_to_yojson x.total_amount);
      ("Category", option_to_yojson filter_string_to_yojson x.category);
      ("Intent", option_to_yojson filter_string_to_yojson x.intent);
      ("GroupByValue", option_to_yojson filter_string_to_yojson x.group_by_value);
    ]

let data_points_list_to_yojson tree = list_to_yojson data_point_entry_to_yojson tree

let get_revenue_statistics_time_series_response_to_yojson
    (x : get_revenue_statistics_time_series_response) =
  assoc_to_yojson
    [
      ("DataPoints", option_to_yojson data_points_list_to_yojson x.data_points);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let max_data_points_to_yojson = int_to_yojson

let group_by_type_to_yojson (x : group_by_type) =
  match x with
  | NAME -> `String "NAME"
  | CATEGORY -> `String "CATEGORY"
  | INTENT -> `String "INTENT"
  | ORGANIZATION -> `String "ORGANIZATION"
  | WEBACL -> `String "WEBACL"

let interval_type_to_yojson (x : interval_type) =
  match x with
  | MINUTELY -> `String "MINUTELY"
  | FIVE_MINUTELY -> `String "FIVE_MINUTELY"
  | HOURLY -> `String "HOURLY"
  | DAILY -> `String "DAILY"

let time_series_statistic_type_to_yojson (x : time_series_statistic_type) =
  match x with
  | DATE_HISTOGRAM -> `String "DATE_HISTOGRAM"
  | PAYMENT_TRAFFIC -> `String "PAYMENT_TRAFFIC"

let get_revenue_statistics_time_series_request_to_yojson
    (x : get_revenue_statistics_time_series_request) =
  assoc_to_yojson
    [
      ("StatisticType", Some (time_series_statistic_type_to_yojson x.statistic_type));
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Interval", Some (interval_type_to_yojson x.interval));
      ("Currency", Some (currency_to_yojson x.currency));
      ("GroupBy", option_to_yojson group_by_type_to_yojson x.group_by);
      ("Filters", option_to_yojson monetization_filter_list_to_yojson x.filters);
      ("Limit", option_to_yojson max_data_points_to_yojson x.limit);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let revenue_breakdown_to_yojson (x : revenue_breakdown) =
  assoc_to_yojson
    [
      ("TotalAmount", option_to_yojson monetization_amount_value_to_yojson x.total_amount);
      ("VerifiedAmount", option_to_yojson monetization_amount_value_to_yojson x.verified_amount);
      ("UnverifiedAmount", option_to_yojson monetization_amount_value_to_yojson x.unverified_amount);
      ("Currency", option_to_yojson currency_to_yojson x.currency);
      ("TotalSettled", option_to_yojson request_count_to_yojson x.total_settled);
      ("TotalMonetizeServed", option_to_yojson request_count_to_yojson x.total_monetize_served);
    ]

let get_revenue_statistics_summary_response_to_yojson (x : get_revenue_statistics_summary_response)
    =
  assoc_to_yojson
    [ ("RevenueBreakdown", option_to_yojson revenue_breakdown_to_yojson x.revenue_breakdown) ]

let get_revenue_statistics_summary_request_to_yojson (x : get_revenue_statistics_summary_request) =
  assoc_to_yojson
    [
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Currency", Some (currency_to_yojson x.currency));
      ("Filters", option_to_yojson monetization_filter_list_to_yojson x.filters);
    ]

let revenue_path_statistics_to_yojson (x : revenue_path_statistics) =
  assoc_to_yojson
    [
      ("Path", Some (path_string_to_yojson x.path));
      ("Percentage", Some (percentage_value_to_yojson x.percentage));
      ("Amount", Some (monetization_amount_value_to_yojson x.amount));
      ("RequestCount", Some (request_count_to_yojson x.request_count));
    ]

let revenue_path_statistics_list_to_yojson tree =
  list_to_yojson revenue_path_statistics_to_yojson tree

let source_statistics_to_yojson (x : source_statistics) =
  assoc_to_yojson
    [
      ("SourceName", Some (filter_string_to_yojson x.source_name));
      ("Percentage", Some (percentage_value_to_yojson x.percentage));
      ("Amount", Some (monetization_amount_value_to_yojson x.amount));
      ("RequestCount", Some (request_count_to_yojson x.request_count));
      ("SourceCategory", option_to_yojson filter_string_to_yojson x.source_category);
      ("Intent", option_to_yojson filter_string_to_yojson x.intent);
      ("Organization", option_to_yojson filter_string_to_yojson x.organization);
      ("Verified", option_to_yojson verified_status_to_yojson x.verified);
      ("GroupByValue", option_to_yojson filter_string_to_yojson x.group_by_value);
    ]

let source_statistics_list_to_yojson tree = list_to_yojson source_statistics_to_yojson tree

let get_revenue_statistics_response_to_yojson (x : get_revenue_statistics_response) =
  assoc_to_yojson
    [
      ("SourceStatistics", option_to_yojson source_statistics_list_to_yojson x.source_statistics);
      ( "RevenuePathStatistics",
        option_to_yojson revenue_path_statistics_list_to_yojson x.revenue_path_statistics );
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
    ]

let ranking_sort_by_to_yojson (x : ranking_sort_by) =
  match x with
  | REVENUE -> `String "REVENUE"
  | PERCENTAGE -> `String "PERCENTAGE"
  | NAME -> `String "NAME"

let ranking_statistic_type_to_yojson (x : ranking_statistic_type) =
  match x with
  | TOP_SOURCES_BY_REVENUE -> `String "TOP_SOURCES_BY_REVENUE"
  | TOP_PATHS_BY_REVENUE -> `String "TOP_PATHS_BY_REVENUE"

let get_revenue_statistics_request_to_yojson (x : get_revenue_statistics_request) =
  assoc_to_yojson
    [
      ("StatisticType", Some (ranking_statistic_type_to_yojson x.statistic_type));
      ("TimeWindow", Some (time_window_to_yojson x.time_window));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Currency", Some (currency_to_yojson x.currency));
      ("GroupBy", option_to_yojson group_by_type_to_yojson x.group_by);
      ("Filters", option_to_yojson monetization_filter_list_to_yojson x.filters);
      ("NextMarker", option_to_yojson next_marker_to_yojson x.next_marker);
      ("Limit", option_to_yojson path_statistics_limit_to_yojson x.limit);
      ("SortBy", option_to_yojson ranking_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let regex_pattern_set_to_yojson (x : regex_pattern_set) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Id", option_to_yojson entity_id_to_yojson x.id);
      ("ARN", option_to_yojson resource_arn_to_yojson x.ar_n);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ( "RegularExpressionList",
        option_to_yojson regular_expression_list_to_yojson x.regular_expression_list );
    ]

let get_regex_pattern_set_response_to_yojson (x : get_regex_pattern_set_response) =
  assoc_to_yojson
    [
      ("RegexPatternSet", option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
    ]

let get_regex_pattern_set_request_to_yojson (x : get_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
    ]

let waf_unsupported_aggregate_key_type_exception_to_yojson
    (x : waf_unsupported_aggregate_key_type_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let ip_address_version_to_yojson (x : ip_address_version) =
  match x with IPV4 -> `String "IPV4" | IPV6 -> `String "IPV6"

let rate_based_statement_managed_keys_ip_set_to_yojson
    (x : rate_based_statement_managed_keys_ip_set) =
  assoc_to_yojson
    [
      ("IPAddressVersion", option_to_yojson ip_address_version_to_yojson x.ip_address_version);
      ("Addresses", option_to_yojson ip_addresses_to_yojson x.addresses);
    ]

let get_rate_based_statement_managed_keys_response_to_yojson
    (x : get_rate_based_statement_managed_keys_response) =
  assoc_to_yojson
    [
      ( "ManagedKeysIPV4",
        option_to_yojson rate_based_statement_managed_keys_ip_set_to_yojson x.managed_keys_ip_v4 );
      ( "ManagedKeysIPV6",
        option_to_yojson rate_based_statement_managed_keys_ip_set_to_yojson x.managed_keys_ip_v6 );
    ]

let get_rate_based_statement_managed_keys_request_to_yojson
    (x : get_rate_based_statement_managed_keys_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("WebACLName", Some (entity_name_to_yojson x.web_acl_name));
      ("WebACLId", Some (entity_id_to_yojson x.web_acl_id));
      ("RuleGroupRuleName", option_to_yojson entity_name_to_yojson x.rule_group_rule_name);
      ("RuleName", Some (entity_name_to_yojson x.rule_name));
    ]

let get_permission_policy_response_to_yojson (x : get_permission_policy_response) =
  assoc_to_yojson [ ("Policy", option_to_yojson policy_string_to_yojson x.policy) ]

let get_permission_policy_request_to_yojson (x : get_permission_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let release_notes_to_yojson = string_to_yojson

let mobile_sdk_release_to_yojson (x : mobile_sdk_release) =
  assoc_to_yojson
    [
      ("ReleaseVersion", option_to_yojson version_key_string_to_yojson x.release_version);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_mobile_sdk_release_response_to_yojson (x : get_mobile_sdk_release_response) =
  assoc_to_yojson
    [ ("MobileSdkRelease", option_to_yojson mobile_sdk_release_to_yojson x.mobile_sdk_release) ]

let get_mobile_sdk_release_request_to_yojson (x : get_mobile_sdk_release_request) =
  assoc_to_yojson
    [
      ("Platform", Some (platform_to_yojson x.platform));
      ("ReleaseVersion", Some (version_key_string_to_yojson x.release_version));
    ]

let managed_rule_set_version_to_yojson (x : managed_rule_set_version) =
  assoc_to_yojson
    [
      ("AssociatedRuleGroupArn", option_to_yojson resource_arn_to_yojson x.associated_rule_group_arn);
      ("Capacity", option_to_yojson capacity_unit_to_yojson x.capacity);
      ("ForecastedLifetime", option_to_yojson time_window_day_to_yojson x.forecasted_lifetime);
      ("PublishTimestamp", option_to_yojson timestamp_to_yojson x.publish_timestamp);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
      ("ExpiryTimestamp", option_to_yojson timestamp_to_yojson x.expiry_timestamp);
    ]

let published_versions_to_yojson tree =
  map_to_yojson version_key_string_to_yojson managed_rule_set_version_to_yojson tree

let managed_rule_set_to_yojson (x : managed_rule_set) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Id", Some (entity_id_to_yojson x.id));
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("PublishedVersions", option_to_yojson published_versions_to_yojson x.published_versions);
      ("RecommendedVersion", option_to_yojson version_key_string_to_yojson x.recommended_version);
      ("LabelNamespace", option_to_yojson label_name_to_yojson x.label_namespace);
    ]

let get_managed_rule_set_response_to_yojson (x : get_managed_rule_set_response) =
  assoc_to_yojson
    [
      ("ManagedRuleSet", option_to_yojson managed_rule_set_to_yojson x.managed_rule_set);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
    ]

let get_managed_rule_set_request_to_yojson (x : get_managed_rule_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
    ]

let get_logging_configuration_response_to_yojson (x : get_logging_configuration_response) =
  assoc_to_yojson
    [
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
    ]

let get_logging_configuration_request_to_yojson (x : get_logging_configuration_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("LogType", option_to_yojson log_type_to_yojson x.log_type);
      ("LogScope", option_to_yojson log_scope_to_yojson x.log_scope);
    ]

let ip_set_to_yojson (x : ip_set) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Id", Some (entity_id_to_yojson x.id));
      ("ARN", Some (resource_arn_to_yojson x.ar_n));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("IPAddressVersion", Some (ip_address_version_to_yojson x.ip_address_version));
      ("Addresses", Some (ip_addresses_to_yojson x.addresses));
    ]

let get_ip_set_response_to_yojson (x : get_ip_set_response) =
  assoc_to_yojson
    [
      ("IPSet", option_to_yojson ip_set_to_yojson x.ip_set);
      ("LockToken", option_to_yojson lock_token_to_yojson x.lock_token);
    ]

let get_ip_set_request_to_yojson (x : get_ip_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
    ]

let get_decrypted_api_key_response_to_yojson (x : get_decrypted_api_key_response) =
  assoc_to_yojson
    [
      ("TokenDomains", option_to_yojson token_domains_to_yojson x.token_domains);
      ("CreationTimestamp", option_to_yojson timestamp_to_yojson x.creation_timestamp);
    ]

let get_decrypted_api_key_request_to_yojson (x : get_decrypted_api_key_request) =
  assoc_to_yojson
    [ ("Scope", Some (scope_to_yojson x.scope)); ("APIKey", Some (api_key_to_yojson x.api_key)) ]

let download_url_to_yojson = string_to_yojson

let generate_mobile_sdk_release_url_response_to_yojson
    (x : generate_mobile_sdk_release_url_response) =
  assoc_to_yojson [ ("Url", option_to_yojson download_url_to_yojson x.url) ]

let generate_mobile_sdk_release_url_request_to_yojson (x : generate_mobile_sdk_release_url_request)
    =
  assoc_to_yojson
    [
      ("Platform", Some (platform_to_yojson x.platform));
      ("ReleaseVersion", Some (version_key_string_to_yojson x.release_version));
    ]

let disassociate_web_acl_response_to_yojson = unit_to_yojson

let disassociate_web_acl_request_to_yojson (x : disassociate_web_acl_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let rule_summary_to_yojson (x : rule_summary) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Action", option_to_yojson rule_action_to_yojson x.action);
    ]

let rule_summaries_to_yojson tree = list_to_yojson rule_summary_to_yojson tree

let describe_managed_rule_group_response_to_yojson (x : describe_managed_rule_group_response) =
  assoc_to_yojson
    [
      ("VersionName", option_to_yojson version_key_string_to_yojson x.version_name);
      ("SnsTopicArn", option_to_yojson resource_arn_to_yojson x.sns_topic_arn);
      ("Capacity", option_to_yojson capacity_unit_to_yojson x.capacity);
      ("Rules", option_to_yojson rule_summaries_to_yojson x.rules);
      ("LabelNamespace", option_to_yojson label_name_to_yojson x.label_namespace);
      ("AvailableLabels", option_to_yojson label_summaries_to_yojson x.available_labels);
      ("ConsumedLabels", option_to_yojson label_summaries_to_yojson x.consumed_labels);
    ]

let describe_managed_rule_group_request_to_yojson (x : describe_managed_rule_group_request) =
  assoc_to_yojson
    [
      ("VendorName", Some (vendor_name_to_yojson x.vendor_name));
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("VersionName", option_to_yojson version_key_string_to_yojson x.version_name);
    ]

let product_description_to_yojson = string_to_yojson
let product_title_to_yojson = string_to_yojson
let product_link_to_yojson = string_to_yojson
let product_id_to_yojson = string_to_yojson

let managed_product_descriptor_to_yojson (x : managed_product_descriptor) =
  assoc_to_yojson
    [
      ("VendorName", option_to_yojson vendor_name_to_yojson x.vendor_name);
      ("ManagedRuleSetName", option_to_yojson entity_name_to_yojson x.managed_rule_set_name);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("ProductLink", option_to_yojson product_link_to_yojson x.product_link);
      ("ProductTitle", option_to_yojson product_title_to_yojson x.product_title);
      ("ProductDescription", option_to_yojson product_description_to_yojson x.product_description);
      ("SnsTopicArn", option_to_yojson resource_arn_to_yojson x.sns_topic_arn);
      ("IsVersioningSupported", option_to_yojson boolean__to_yojson x.is_versioning_supported);
      ( "IsAdvancedManagedRuleSet",
        option_to_yojson boolean__to_yojson x.is_advanced_managed_rule_set );
    ]

let managed_product_descriptors_to_yojson tree =
  list_to_yojson managed_product_descriptor_to_yojson tree

let describe_managed_products_by_vendor_response_to_yojson
    (x : describe_managed_products_by_vendor_response) =
  assoc_to_yojson
    [
      ("ManagedProducts", option_to_yojson managed_product_descriptors_to_yojson x.managed_products);
    ]

let describe_managed_products_by_vendor_request_to_yojson
    (x : describe_managed_products_by_vendor_request) =
  assoc_to_yojson
    [
      ("VendorName", Some (vendor_name_to_yojson x.vendor_name));
      ("Scope", Some (scope_to_yojson x.scope));
    ]

let describe_all_managed_products_response_to_yojson (x : describe_all_managed_products_response) =
  assoc_to_yojson
    [
      ("ManagedProducts", option_to_yojson managed_product_descriptors_to_yojson x.managed_products);
    ]

let describe_all_managed_products_request_to_yojson (x : describe_all_managed_products_request) =
  assoc_to_yojson [ ("Scope", Some (scope_to_yojson x.scope)) ]

let waf_associated_item_exception_to_yojson (x : waf_associated_item_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_web_acl_response_to_yojson = unit_to_yojson

let delete_web_acl_request_to_yojson (x : delete_web_acl_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let delete_rule_group_response_to_yojson = unit_to_yojson

let delete_rule_group_request_to_yojson (x : delete_rule_group_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let delete_regex_pattern_set_response_to_yojson = unit_to_yojson

let delete_regex_pattern_set_request_to_yojson (x : delete_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let delete_permission_policy_response_to_yojson = unit_to_yojson

let delete_permission_policy_request_to_yojson (x : delete_permission_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_logging_configuration_response_to_yojson = unit_to_yojson

let delete_logging_configuration_request_to_yojson (x : delete_logging_configuration_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("LogType", option_to_yojson log_type_to_yojson x.log_type);
      ("LogScope", option_to_yojson log_scope_to_yojson x.log_scope);
    ]

let delete_ip_set_response_to_yojson = unit_to_yojson

let delete_ip_set_request_to_yojson (x : delete_ip_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Id", Some (entity_id_to_yojson x.id));
      ("LockToken", Some (lock_token_to_yojson x.lock_token));
    ]

let delete_firewall_manager_rule_groups_response_to_yojson
    (x : delete_firewall_manager_rule_groups_response) =
  assoc_to_yojson
    [ ("NextWebACLLockToken", option_to_yojson lock_token_to_yojson x.next_web_acl_lock_token) ]

let delete_firewall_manager_rule_groups_request_to_yojson
    (x : delete_firewall_manager_rule_groups_request) =
  assoc_to_yojson
    [
      ("WebACLArn", Some (resource_arn_to_yojson x.web_acl_arn));
      ("WebACLLockToken", Some (lock_token_to_yojson x.web_acl_lock_token));
    ]

let delete_api_key_response_to_yojson = unit_to_yojson

let delete_api_key_request_to_yojson (x : delete_api_key_request) =
  assoc_to_yojson
    [ ("Scope", Some (scope_to_yojson x.scope)); ("APIKey", Some (api_key_to_yojson x.api_key)) ]

let create_web_acl_response_to_yojson (x : create_web_acl_response) =
  assoc_to_yojson [ ("Summary", option_to_yojson web_acl_summary_to_yojson x.summary) ]

let create_web_acl_request_to_yojson (x : create_web_acl_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("DefaultAction", Some (default_action_to_yojson x.default_action));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ( "DataProtectionConfig",
        option_to_yojson data_protection_config_to_yojson x.data_protection_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("CaptchaConfig", option_to_yojson captcha_config_to_yojson x.captcha_config);
      ("ChallengeConfig", option_to_yojson challenge_config_to_yojson x.challenge_config);
      ("TokenDomains", option_to_yojson token_domains_to_yojson x.token_domains);
      ("AssociationConfig", option_to_yojson association_config_to_yojson x.association_config);
      ( "OnSourceDDoSProtectionConfig",
        option_to_yojson on_source_d_do_s_protection_config_to_yojson
          x.on_source_d_do_s_protection_config );
      ("ApplicationConfig", option_to_yojson application_config_to_yojson x.application_config);
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let create_rule_group_response_to_yojson (x : create_rule_group_response) =
  assoc_to_yojson [ ("Summary", option_to_yojson rule_group_summary_to_yojson x.summary) ]

let create_rule_group_request_to_yojson (x : create_rule_group_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Capacity", Some (capacity_unit_to_yojson x.capacity));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Rules", option_to_yojson rules_to_yojson x.rules);
      ("VisibilityConfig", Some (visibility_config_to_yojson x.visibility_config));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CustomResponseBodies",
        option_to_yojson custom_response_bodies_to_yojson x.custom_response_bodies );
      ("MonetizationConfig", option_to_yojson monetization_config_to_yojson x.monetization_config);
    ]

let create_regex_pattern_set_response_to_yojson (x : create_regex_pattern_set_response) =
  assoc_to_yojson [ ("Summary", option_to_yojson regex_pattern_set_summary_to_yojson x.summary) ]

let create_regex_pattern_set_request_to_yojson (x : create_regex_pattern_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("RegularExpressionList", Some (regular_expression_list_to_yojson x.regular_expression_list));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ip_set_response_to_yojson (x : create_ip_set_response) =
  assoc_to_yojson [ ("Summary", option_to_yojson ip_set_summary_to_yojson x.summary) ]

let create_ip_set_request_to_yojson (x : create_ip_set_request) =
  assoc_to_yojson
    [
      ("Name", Some (entity_name_to_yojson x.name));
      ("Scope", Some (scope_to_yojson x.scope));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("IPAddressVersion", Some (ip_address_version_to_yojson x.ip_address_version));
      ("Addresses", Some (ip_addresses_to_yojson x.addresses));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_api_key_response_to_yojson (x : create_api_key_response) =
  assoc_to_yojson [ ("APIKey", option_to_yojson api_key_to_yojson x.api_key) ]

let create_api_key_request_to_yojson (x : create_api_key_request) =
  assoc_to_yojson
    [
      ("Scope", Some (scope_to_yojson x.scope));
      ("TokenDomains", Some (api_key_token_domains_to_yojson x.token_domains));
    ]

let check_capacity_response_to_yojson (x : check_capacity_response) =
  assoc_to_yojson [ ("Capacity", option_to_yojson consumed_capacity_to_yojson x.capacity) ]

let check_capacity_request_to_yojson (x : check_capacity_request) =
  assoc_to_yojson
    [ ("Scope", Some (scope_to_yojson x.scope)); ("Rules", Some (rules_to_yojson x.rules)) ]

let associate_web_acl_response_to_yojson = unit_to_yojson

let associate_web_acl_request_to_yojson (x : associate_web_acl_request) =
  assoc_to_yojson
    [
      ("WebACLArn", Some (resource_arn_to_yojson x.web_acl_arn));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]
