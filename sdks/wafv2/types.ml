open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "wafv2";
      endpointPrefix = "wafv2";
      version = "2019-07-29";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec field_to_match_data = string
type nonrec single_header = {
  name: string }
type nonrec single_query_argument = {
  name: string }
type nonrec all_query_arguments = unit
type nonrec uri_path = unit
type nonrec query_string = unit
type nonrec base_unit = unit
type nonrec oversize_handling =
  | NO_MATCH 
  | MATCH 
  | CONTINUE 
type nonrec body = {
  oversize_handling: oversize_handling option }
type nonrec method_ = unit
type nonrec all = unit
type nonrec json_pointer_path = string
type nonrec json_pointer_paths = string list option list
type nonrec json_match_pattern =
  {
  included_paths: string list option ;
  all: all option }
type nonrec json_match_scope =
  | VALUE 
  | KEY 
  | ALL 
type nonrec body_parsing_fallback_behavior =
  | EVALUATE_AS_STRING 
  | NO_MATCH 
  | MATCH 
type nonrec json_body =
  {
  oversize_handling: oversize_handling option ;
  invalid_fallback_behavior: body_parsing_fallback_behavior option ;
  match_scope: json_match_scope ;
  match_pattern: json_match_pattern }
type nonrec header_names = string list option list
type nonrec header_match_pattern =
  {
  excluded_headers: string list option ;
  included_headers: string list option ;
  all: all option }
type nonrec map_match_scope =
  | VALUE 
  | KEY 
  | ALL 
type nonrec headers =
  {
  oversize_handling: oversize_handling ;
  match_scope: map_match_scope ;
  match_pattern: header_match_pattern }
type nonrec single_cookie_name = string
type nonrec cookie_names = string list option list
type nonrec cookie_match_pattern =
  {
  excluded_cookies: string list option ;
  included_cookies: string list option ;
  all: all option }
type nonrec cookies =
  {
  oversize_handling: oversize_handling ;
  match_scope: map_match_scope ;
  match_pattern: cookie_match_pattern }
type nonrec header_order = {
  oversize_handling: oversize_handling }
type nonrec fallback_behavior =
  | NO_MATCH 
  | MATCH 
type nonrec ja3_fingerprint = {
  fallback_behavior: fallback_behavior }
type nonrec field_to_match =
  {
  ja3_fingerprint: ja3_fingerprint option ;
  header_order: header_order option ;
  cookies: cookies option ;
  headers: headers option ;
  json_body: json_body option ;
  method_: method_ option ;
  body: body option ;
  query_string: query_string option ;
  uri_path: uri_path option ;
  all_query_arguments: all_query_arguments option ;
  single_query_argument: single_query_argument option ;
  single_header: single_header option }
type nonrec text_transformation_priority = int
type nonrec text_transformation_type =
  | UTF8_TO_UNICODE 
  | URL_DECODE_UNI 
  | BASE64_DECODE_EXT 
  | REPLACE_NULLS 
  | REMOVE_NULLS 
  | NORMALIZE_PATH_WIN 
  | NORMALIZE_PATH 
  | JS_DECODE 
  | CSS_DECODE 
  | SQL_HEX_DECODE 
  | ESCAPE_SEQ_DECODE 
  | REPLACE_COMMENTS 
  | MD5 
  | HEX_DECODE 
  | BASE64_DECODE 
  | URL_DECODE 
  | CMD_LINE 
  | LOWERCASE 
  | HTML_ENTITY_DECODE 
  | COMPRESS_WHITE_SPACE 
  | NONE 
type nonrec text_transformation =
  {
  type_: text_transformation_type ;
  priority: int }
type nonrec text_transformations = text_transformation list option list
type nonrec xss_match_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match }
type nonrec entity_name = string
type nonrec entity_id = string
type nonrec entity_description = string
type nonrec lock_token = string
type nonrec resource_arn = string
type nonrec web_acl_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }
type nonrec web_acl_summaries = web_acl_summary list option list
type nonrec response_status_code = int
type nonrec custom_http_header_name = string
type nonrec custom_http_header_value = string
type nonrec custom_http_header = {
  value: string ;
  name: string }
type nonrec custom_http_headers = custom_http_header list option list
type nonrec custom_response =
  {
  response_headers: custom_http_header list option ;
  custom_response_body_key: string option ;
  response_code: int }
type nonrec block_action = {
  custom_response: custom_response option }
type nonrec custom_request_handling =
  {
  insert_headers: custom_http_header list }
type nonrec allow_action =
  {
  custom_request_handling: custom_request_handling option }
type nonrec default_action =
  {
  allow: allow_action option ;
  block: block_action option }
type nonrec rule_priority = int
type nonrec search_string = bytes
type nonrec positional_constraint =
  | CONTAINS_WORD 
  | CONTAINS 
  | ENDS_WITH 
  | STARTS_WITH 
  | EXACTLY 
type nonrec byte_match_statement =
  {
  positional_constraint: positional_constraint ;
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  search_string: bytes }
type nonrec sensitivity_level =
  | HIGH 
  | LOW 
type nonrec sqli_match_statement =
  {
  sensitivity_level: sensitivity_level option ;
  text_transformations: text_transformation list ;
  field_to_match: field_to_match }
type nonrec comparison_operator =
  | GT 
  | GE 
  | LT 
  | LE 
  | NE 
  | EQ 
type nonrec size = int
type nonrec size_constraint_statement =
  {
  text_transformations: text_transformation list ;
  size: int ;
  comparison_operator: comparison_operator ;
  field_to_match: field_to_match }
type nonrec country_code =
  | XK 
  | ZW 
  | ZM 
  | YE 
  | EH 
  | WF 
  | VI 
  | VG 
  | VN 
  | VE 
  | VU 
  | UZ 
  | UY 
  | UM 
  | US 
  | GB 
  | AE 
  | UA 
  | UG 
  | TV 
  | TC 
  | TM 
  | TR 
  | TN 
  | TT 
  | TO 
  | TK 
  | TG 
  | TL 
  | TH 
  | TZ 
  | TJ 
  | TW 
  | SY 
  | CH 
  | SE 
  | SZ 
  | SJ 
  | SR 
  | SD 
  | LK 
  | ES 
  | SS 
  | GS 
  | ZA 
  | SO 
  | SB 
  | SI 
  | SK 
  | SX 
  | SG 
  | SL 
  | SC 
  | RS 
  | SN 
  | SA 
  | ST 
  | SM 
  | WS 
  | VC 
  | PM 
  | MF 
  | LC 
  | KN 
  | SH 
  | BL 
  | RW 
  | RU 
  | RO 
  | RE 
  | QA 
  | PR 
  | PT 
  | PL 
  | PN 
  | PH 
  | PE 
  | PY 
  | PG 
  | PA 
  | PS 
  | PW 
  | PK 
  | OM 
  | NO 
  | MP 
  | NF 
  | NU 
  | NG 
  | NE 
  | NI 
  | NZ 
  | NC 
  | NL 
  | NP 
  | NR 
  | NA 
  | MM 
  | MZ 
  | MA 
  | MS 
  | ME 
  | MN 
  | MC 
  | MD 
  | FM 
  | MX 
  | YT 
  | MU 
  | MR 
  | MQ 
  | MH 
  | MT 
  | ML 
  | MV 
  | MY 
  | MW 
  | MG 
  | MK 
  | MO 
  | LU 
  | LT 
  | LI 
  | LY 
  | LR 
  | LS 
  | LB 
  | LV 
  | LA 
  | KG 
  | KW 
  | KR 
  | KP 
  | KI 
  | KE 
  | KZ 
  | JO 
  | JE 
  | JP 
  | JM 
  | IT 
  | IL 
  | IM 
  | IE 
  | IQ 
  | IR 
  | ID 
  | IN 
  | IS 
  | HU 
  | HK 
  | HN 
  | VA 
  | HM 
  | HT 
  | GY 
  | GW 
  | GN 
  | GG 
  | GT 
  | GU 
  | GP 
  | GD 
  | GL 
  | GR 
  | GI 
  | GH 
  | DE 
  | GE 
  | GM 
  | GA 
  | TF 
  | PF 
  | GF 
  | FR 
  | FI 
  | FJ 
  | FO 
  | FK 
  | ET 
  | EE 
  | ER 
  | GQ 
  | SV 
  | EG 
  | EC 
  | DO 
  | DM 
  | DJ 
  | DK 
  | CZ 
  | CY 
  | CW 
  | CU 
  | HR 
  | CI 
  | CR 
  | CK 
  | CD 
  | CG 
  | KM 
  | CO 
  | CC 
  | CX 
  | CN 
  | CL 
  | TD 
  | CF 
  | KY 
  | CV 
  | CA 
  | CM 
  | KH 
  | BI 
  | BF 
  | BG 
  | BN 
  | IO 
  | BR 
  | BV 
  | BW 
  | BA 
  | BQ 
  | BO 
  | BT 
  | BM 
  | BJ 
  | BZ 
  | BE 
  | BY 
  | BB 
  | BD 
  | BH 
  | BS 
  | AZ 
  | AT 
  | AU 
  | AW 
  | AM 
  | AR 
  | AG 
  | AQ 
  | AI 
  | AO 
  | AD 
  | AS 
  | DZ 
  | AL 
  | AX 
  | AF 
type nonrec country_codes = country_code list option list
type nonrec forwarded_ip_header_name = string
type nonrec forwarded_ip_config =
  {
  fallback_behavior: fallback_behavior ;
  header_name: string }
type nonrec geo_match_statement =
  {
  forwarded_ip_config: forwarded_ip_config option ;
  country_codes: country_code list option }
type nonrec excluded_rule = {
  name: string }
type nonrec excluded_rules = excluded_rule list option list
type nonrec count_action =
  {
  custom_request_handling: custom_request_handling option }
type nonrec captcha_action =
  {
  custom_request_handling: custom_request_handling option }
type nonrec challenge_action =
  {
  custom_request_handling: custom_request_handling option }
type nonrec rule_action =
  {
  challenge: challenge_action option ;
  captcha: captcha_action option ;
  count: count_action option ;
  allow: allow_action option ;
  block: block_action option }
type nonrec rule_action_override =
  {
  action_to_use: rule_action ;
  name: string }
type nonrec rule_action_overrides = rule_action_override list option list
type nonrec rule_group_reference_statement =
  {
  rule_action_overrides: rule_action_override list option ;
  excluded_rules: excluded_rule list option ;
  ar_n: string }
type nonrec forwarded_ip_position =
  | ANY 
  | LAST 
  | FIRST 
type nonrec ip_set_forwarded_ip_config =
  {
  position: forwarded_ip_position ;
  fallback_behavior: fallback_behavior ;
  header_name: string }
type nonrec ip_set_reference_statement =
  {
  ip_set_forwarded_ip_config: ip_set_forwarded_ip_config option ;
  ar_n: string }
type nonrec regex_pattern_set_reference_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  ar_n: string }
type nonrec rate_limit = int
type nonrec evaluation_window_sec = int
type nonrec rate_based_statement_aggregate_key_type =
  | CONSTANT 
  | CUSTOM_KEYS 
  | FORWARDED_IP 
  | IP 
type nonrec rate_limit_header =
  {
  text_transformations: text_transformation list ;
  name: string }
type nonrec rate_limit_cookie =
  {
  text_transformations: text_transformation list ;
  name: string }
type nonrec rate_limit_query_argument =
  {
  text_transformations: text_transformation list ;
  name: string }
type nonrec rate_limit_query_string =
  {
  text_transformations: text_transformation list }
type nonrec rate_limit_http_method = unit
type nonrec rate_limit_forwarded_i_p = unit
type nonrec rate_limit_i_p = unit
type nonrec label_namespace = string
type nonrec rate_limit_label_namespace = {
  namespace: string }
type nonrec rate_limit_uri_path =
  {
  text_transformations: text_transformation list }
type nonrec rate_based_statement_custom_key =
  {
  uri_path: rate_limit_uri_path option ;
  label_namespace: rate_limit_label_namespace option ;
  i_p: rate_limit_i_p option ;
  forwarded_i_p: rate_limit_forwarded_i_p option ;
  http_method: rate_limit_http_method option ;
  query_string: rate_limit_query_string option ;
  query_argument: rate_limit_query_argument option ;
  cookie: rate_limit_cookie option ;
  header: rate_limit_header option }
type nonrec rate_based_statement_custom_keys =
  rate_based_statement_custom_key list option list
type nonrec vendor_name = string
type nonrec version_key_string = string
type nonrec login_path_string = string
type nonrec payload_type =
  | FORM_ENCODED 
  | JSON 
type nonrec field_identifier = string
type nonrec username_field = {
  identifier: string }
type nonrec password_field = {
  identifier: string }
type nonrec inspection_level =
  | TARGETED 
  | COMMON 
type nonrec enable_machine_learning = bool
type nonrec aws_managed_rules_bot_control_rule_set =
  {
  enable_machine_learning: bool option ;
  inspection_level: inspection_level }
type nonrec string_ = string
type nonrec request_inspection =
  {
  password_field: password_field ;
  username_field: username_field ;
  payload_type: payload_type }
type nonrec success_code = int
type nonrec response_inspection_status_code_success_codes =
  int list option list
type nonrec failure_code = int
type nonrec response_inspection_status_code_failure_codes =
  int list option list
type nonrec response_inspection_status_code =
  {
  failure_codes: int list ;
  success_codes: int list }
type nonrec response_inspection_header_name = string
type nonrec success_value = string
type nonrec response_inspection_header_success_values =
  string list option list
type nonrec failure_value = string
type nonrec response_inspection_header_failure_values =
  string list option list
type nonrec response_inspection_header =
  {
  failure_values: string list ;
  success_values: string list ;
  name: string }
type nonrec response_inspection_body_contains_success_strings =
  string list option list
type nonrec response_inspection_body_contains_failure_strings =
  string list option list
type nonrec response_inspection_body_contains =
  {
  failure_strings: string list ;
  success_strings: string list }
type nonrec response_inspection_json_success_values = string list option list
type nonrec response_inspection_json_failure_values = string list option list
type nonrec response_inspection_json =
  {
  failure_values: string list ;
  success_values: string list ;
  identifier: string }
type nonrec response_inspection =
  {
  json: response_inspection_json option ;
  body_contains: response_inspection_body_contains option ;
  header: response_inspection_header option ;
  status_code: response_inspection_status_code option }
type nonrec boolean_ = bool
type nonrec aws_managed_rules_atp_rule_set =
  {
  enable_regex_in_path: bool option ;
  response_inspection: response_inspection option ;
  request_inspection: request_inspection option ;
  login_path: string }
type nonrec creation_path_string = string
type nonrec registration_page_path_string = string
type nonrec email_field = {
  identifier: string }
type nonrec phone_number_field = {
  identifier: string }
type nonrec phone_number_fields = phone_number_field list option list
type nonrec address_field = {
  identifier: string }
type nonrec address_fields = address_field list option list
type nonrec request_inspection_acf_p =
  {
  address_fields: address_field list option ;
  phone_number_fields: phone_number_field list option ;
  email_field: email_field option ;
  password_field: password_field option ;
  username_field: username_field option ;
  payload_type: payload_type }
type nonrec aws_managed_rules_acfp_rule_set =
  {
  enable_regex_in_path: bool option ;
  response_inspection: response_inspection option ;
  request_inspection: request_inspection_acf_p ;
  registration_page_path: string ;
  creation_path: string }
type nonrec managed_rule_group_config =
  {
  aws_managed_rules_acfp_rule_set: aws_managed_rules_acfp_rule_set option ;
  aws_managed_rules_atp_rule_set: aws_managed_rules_atp_rule_set option ;
  aws_managed_rules_bot_control_rule_set:
    aws_managed_rules_bot_control_rule_set option ;
  password_field: password_field option ;
  username_field: username_field option ;
  payload_type: payload_type option ;
  login_path: string option }
type nonrec managed_rule_group_configs =
  managed_rule_group_config list option list
type nonrec label_match_scope =
  | NAMESPACE 
  | LABEL 
type nonrec label_match_key = string
type nonrec label_match_statement = {
  key: string ;
  scope: label_match_scope }
type nonrec regex_pattern_string = string
type nonrec regex_match_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  regex_string: string }
type and_statement = {
  statements: statement list }
and managed_rule_group_statement =
  {
  rule_action_overrides: rule_action_override list option ;
  managed_rule_group_configs: managed_rule_group_config list option ;
  scope_down_statement: statement option ;
  excluded_rules: excluded_rule list option ;
  version: string option ;
  name: string ;
  vendor_name: string }
and not_statement = {
  statement: statement }
and or_statement = {
  statements: statement list }
and rate_based_statement =
  {
  custom_keys: rate_based_statement_custom_key list option ;
  forwarded_ip_config: forwarded_ip_config option ;
  scope_down_statement: statement option ;
  aggregate_key_type: rate_based_statement_aggregate_key_type ;
  evaluation_window_sec: int option ;
  limit: int }
and statement =
  {
  regex_match_statement: regex_match_statement option ;
  label_match_statement: label_match_statement option ;
  managed_rule_group_statement: managed_rule_group_statement option ;
  not_statement: not_statement option ;
  or_statement: or_statement option ;
  and_statement: and_statement option ;
  rate_based_statement: rate_based_statement option ;
  regex_pattern_set_reference_statement:
    regex_pattern_set_reference_statement option ;
  ip_set_reference_statement: ip_set_reference_statement option ;
  rule_group_reference_statement: rule_group_reference_statement option ;
  geo_match_statement: geo_match_statement option ;
  size_constraint_statement: size_constraint_statement option ;
  xss_match_statement: xss_match_statement option ;
  sqli_match_statement: sqli_match_statement option ;
  byte_match_statement: byte_match_statement option }
and statements = statement list option list
type nonrec none_action = unit
type nonrec override_action =
  {
  none: none_action option ;
  count: count_action option }
type nonrec label_name = string
type nonrec label = {
  name: string }
type nonrec labels = label list option list
type nonrec metric_name = string
type nonrec visibility_config =
  {
  metric_name: string ;
  cloud_watch_metrics_enabled: bool ;
  sampled_requests_enabled: bool }
type nonrec time_window_second = int
type nonrec immunity_time_property = {
  immunity_time: int }
type nonrec captcha_config =
  {
  immunity_time_property: immunity_time_property option }
type nonrec challenge_config =
  {
  immunity_time_property: immunity_time_property option }
type nonrec rule =
  {
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  visibility_config: visibility_config ;
  rule_labels: label list option ;
  override_action: override_action option ;
  action: rule_action option ;
  statement: statement ;
  priority: int ;
  name: string }
type nonrec rules = rule list option list
type nonrec consumed_capacity = int
type nonrec firewall_manager_statement =
  {
  rule_group_reference_statement: rule_group_reference_statement option ;
  managed_rule_group_statement: managed_rule_group_statement option }
type nonrec firewall_manager_rule_group =
  {
  visibility_config: visibility_config ;
  override_action: override_action ;
  firewall_manager_statement: firewall_manager_statement ;
  priority: int ;
  name: string }
type nonrec firewall_manager_rule_groups =
  firewall_manager_rule_group list option list
type nonrec response_content_type =
  | APPLICATION_JSON 
  | TEXT_HTML 
  | TEXT_PLAIN 
type nonrec response_content = string
type nonrec custom_response_body =
  {
  content: string ;
  content_type: response_content_type }
type nonrec custom_response_bodies =
  (string_ option * custom_response_body option) list
type nonrec token_domain = string
type nonrec token_domains = string list option list
type nonrec size_inspection_limit =
  | KB_64 
  | KB_48 
  | KB_32 
  | KB_16 
type nonrec request_body_associated_resource_type_config =
  {
  default_size_inspection_limit: size_inspection_limit }
type nonrec associated_resource_type =
  | VERIFIED_ACCESS_INSTANCE 
  | APP_RUNNER_SERVICE 
  | COGNITO_USER_POOL 
  | API_GATEWAY 
  | CLOUDFRONT 
type nonrec request_body =
  (string_ option * request_body_associated_resource_type_config option) list
type nonrec association_config =
  {
  request_body:
    (string * request_body_associated_resource_type_config) list option }
type nonrec web_ac_l =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: (string * custom_response_body) list option ;
  label_namespace: string option ;
  managed_by_firewall_manager: bool option ;
  post_process_firewall_manager_rule_groups:
    firewall_manager_rule_group list option ;
  pre_process_firewall_manager_rule_groups:
    firewall_manager_rule_group list option ;
  capacity: int option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  default_action: default_action ;
  ar_n: string ;
  id: string ;
  name: string }
type nonrec error_message = string
type nonrec waf_unsupported_aggregate_key_type_exception =
  {
  message: string option }
type nonrec waf_unavailable_entity_exception = {
  message: string option }
type nonrec waf_tag_operation_internal_error_exception =
  {
  message: string option }
type nonrec waf_tag_operation_exception = {
  message: string option }
type nonrec waf_subscription_not_found_exception = {
  message: string option }
type nonrec waf_service_linked_role_error_exception =
  {
  message: string option }
type nonrec waf_optimistic_lock_exception = {
  message: string option }
type nonrec waf_nonexistent_item_exception = {
  message: string option }
type nonrec waf_log_destination_permission_issue_exception =
  {
  message: string option }
type nonrec source_type = string
type nonrec waf_limits_exceeded_exception =
  {
  source_type: string option ;
  message: string option }
type nonrec waf_invalid_resource_exception = {
  message: string option }
type nonrec waf_invalid_permission_policy_exception =
  {
  message: string option }
type nonrec parameter_exception_field =
  | ACP_RULE_SET_RESPONSE_INSPECTION 
  | CUSTOM_KEYS 
  | SCOPE_DOWN 
  | ASSOCIATED_RESOURCE_TYPE 
  | ATP_RULE_SET_RESPONSE_INSPECTION 
  | TOKEN_DOMAIN 
  | CHALLENGE_CONFIG 
  | OVERSIZE_HANDLING 
  | MAP_MATCH_SCOPE 
  | COOKIE_MATCH_PATTERN 
  | HEADER_MATCH_PATTERN 
  | PAYLOAD_TYPE 
  | MANAGED_RULE_GROUP_CONFIG 
  | LOG_DESTINATION 
  | ASSOCIABLE_RESOURCE 
  | CHANGE_PROPAGATION_STATUS 
  | EXPIRE_TIMESTAMP 
  | FILTER_CONDITION 
  | LOGGING_FILTER 
  | BODY_PARSING_FALLBACK_BEHAVIOR 
  | JSON_MATCH_SCOPE 
  | JSON_MATCH_PATTERN 
  | CUSTOM_RESPONSE_BODY 
  | CUSTOM_RESPONSE 
  | RESPONSE_CONTENT_TYPE 
  | CUSTOM_REQUEST_HANDLING 
  | HEADER_NAME 
  | IP_SET_FORWARDED_IP_CONFIG 
  | FORWARDED_IP_CONFIG 
  | POSITION 
  | FALLBACK_BEHAVIOR 
  | FIREWALL_MANAGER_STATEMENT 
  | METRIC_NAME 
  | TAG_KEYS 
  | TAGS 
  | RESOURCE_TYPE 
  | RESOURCE_ARN 
  | SCOPE_VALUE 
  | OVERRIDE_ACTION 
  | ENTITY_LIMIT 
  | RULE_ACTION 
  | DEFAULT_ACTION 
  | SINGLE_HEADER 
  | SINGLE_QUERY_ARGUMENT 
  | TEXT_TRANSFORMATION 
  | FIELD_TO_MATCH 
  | IP_ADDRESS_VERSION 
  | IP_ADDRESS 
  | NOT_STATEMENT 
  | OR_STATEMENT 
  | AND_STATEMENT 
  | LABEL_MATCH_STATEMENT 
  | MANAGED_RULE_SET_STATEMENT 
  | IP_SET_REFERENCE_STATEMENT 
  | REGEX_PATTERN_REFERENCE_STATEMENT 
  | RULE_GROUP_REFERENCE_STATEMENT 
  | RATE_BASED_STATEMENT 
  | GEO_MATCH_STATEMENT 
  | SIZE_CONSTRAINT_STATEMENT 
  | XSS_MATCH_STATEMENT 
  | SQLI_MATCH_STATEMENT 
  | BYTE_MATCH_STATEMENT 
  | STATEMENT 
  | EXCLUDED_RULE 
  | RULE 
  | MANAGED_RULE_SET 
  | IP_SET 
  | REGEX_PATTERN_SET 
  | RULE_GROUP 
  | WEB_ACL 
type nonrec parameter_exception_parameter = string
type nonrec error_reason = string
type nonrec waf_invalid_parameter_exception =
  {
  reason: string option ;
  parameter: string option ;
  field: parameter_exception_field option ;
  message: string option }
type nonrec waf_invalid_operation_exception = {
  message: string option }
type nonrec waf_internal_error_exception = {
  message: string option }
type nonrec waf_expired_managed_rule_group_version_exception =
  {
  message: string option }
type nonrec waf_duplicate_item_exception = {
  message: string option }
type nonrec waf_configuration_warning_exception = {
  message: string option }
type nonrec waf_associated_item_exception = {
  message: string option }
type nonrec time_window_day = int
type nonrec version_to_publish =
  {
  forecasted_lifetime: int option ;
  associated_rule_group_arn: string option }
type nonrec versions_to_publish =
  (string_ option * version_to_publish option) list
type nonrec update_web_acl_response = {
  next_lock_token: string option }
type nonrec scope =
  | REGIONAL 
  | CLOUDFRONT 
type nonrec update_web_acl_request =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: (string * custom_response_body) list option ;
  lock_token: string ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  default_action: default_action ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec update_rule_group_response = {
  next_lock_token: string option }
type nonrec update_rule_group_request =
  {
  custom_response_bodies: (string * custom_response_body) list option ;
  lock_token: string ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec update_regex_pattern_set_response =
  {
  next_lock_token: string option }
type nonrec regex = {
  regex_string: string option }
type nonrec regular_expression_list = regex list option list
type nonrec update_regex_pattern_set_request =
  {
  lock_token: string ;
  regular_expression_list: regex list ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec timestamp_ = Timestamp.t
type nonrec update_managed_rule_set_version_expiry_date_response =
  {
  next_lock_token: string option ;
  expiry_timestamp: float option ;
  expiring_version: string option }
type nonrec update_managed_rule_set_version_expiry_date_request =
  {
  expiry_timestamp: float ;
  version_to_expire: string ;
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec update_ip_set_response = {
  next_lock_token: string option }
type nonrec ip_address = string
type nonrec ip_addresses = string list option list
type nonrec update_ip_set_request =
  {
  lock_token: string ;
  addresses: string list ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec untag_resource_response = unit
type nonrec tag_key = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec uri_string = string
type nonrec time_window = {
  end_time: float ;
  start_time: float }
type nonrec tag_value = string
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = tag list option list
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec tag_info_for_resource =
  {
  tag_list: tag list option ;
  resource_ar_n: string option }
type nonrec solve_timestamp = int
type nonrec ip_string = string
type nonrec country = string
type nonrec http_method = string
type nonrec http_version = string
type nonrec header_name = string
type nonrec header_value = string
type nonrec http_header = {
  value: string option ;
  name: string option }
type nonrec http_headers = http_header list option list
type nonrec http_request =
  {
  headers: http_header list option ;
  http_version: string option ;
  method_: string option ;
  ur_i: string option ;
  country: string option ;
  client_i_p: string option }
type nonrec sample_weight = int
type nonrec action = string
type nonrec response_code = int
type nonrec failure_reason =
  | TOKEN_DOMAIN_MISMATCH 
  | TOKEN_INVALID 
  | TOKEN_EXPIRED 
  | TOKEN_MISSING 
type nonrec captcha_response =
  {
  failure_reason: failure_reason option ;
  solve_timestamp: int option ;
  response_code: int option }
type nonrec challenge_response =
  {
  failure_reason: failure_reason option ;
  solve_timestamp: int option ;
  response_code: int option }
type nonrec sampled_http_request =
  {
  overridden_action: string option ;
  challenge_response: challenge_response option ;
  captcha_response: captcha_response option ;
  labels: label list option ;
  response_code_sent: int option ;
  request_headers_inserted: http_header list option ;
  rule_name_within_rule_group: string option ;
  action: string option ;
  timestamp_: float option ;
  weight: int ;
  request: http_request }
type nonrec sampled_http_requests = sampled_http_request list option list
type nonrec rule_summary = {
  action: rule_action option ;
  name: string option }
type nonrec rule_summaries = rule_summary list option list
type nonrec rule_group_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }
type nonrec rule_group_summaries = rule_group_summary list option list
type nonrec capacity_unit = int
type nonrec label_summary = {
  name: string option }
type nonrec label_summaries = label_summary list option list
type nonrec rule_group =
  {
  consumed_labels: label_summary list option ;
  available_labels: label_summary list option ;
  custom_response_bodies: (string * custom_response_body) list option ;
  label_namespace: string option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  ar_n: string ;
  capacity: int ;
  id: string ;
  name: string }
type nonrec resource_type =
  | VERIFIED_ACCESS_INSTANCE 
  | APP_RUNNER_SERVICE 
  | COGNITIO_USER_POOL 
  | APPSYNC 
  | API_GATEWAY 
  | APPLICATION_LOAD_BALANCER 
type nonrec resource_arns = string list option list
type nonrec release_summary =
  {
  timestamp_: float option ;
  release_version: string option }
type nonrec release_summaries = release_summary list option list
type nonrec release_notes = string
type nonrec regex_pattern_set_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }
type nonrec regex_pattern_set_summaries =
  regex_pattern_set_summary list option list
type nonrec regex_pattern_set =
  {
  regular_expression_list: regex list option ;
  description: string option ;
  ar_n: string option ;
  id: string option ;
  name: string option }
type nonrec redacted_fields = field_to_match list option list
type nonrec ip_address_version =
  | IPV6 
  | IPV4 
type nonrec rate_based_statement_managed_keys_ip_set =
  {
  addresses: string list option ;
  ip_address_version: ip_address_version option }
type nonrec put_permission_policy_response = unit
type nonrec policy_string = string
type nonrec put_permission_policy_request =
  {
  policy: string ;
  resource_arn: string }
type nonrec put_managed_rule_set_versions_response =
  {
  next_lock_token: string option }
type nonrec put_managed_rule_set_versions_request =
  {
  versions_to_publish: (string * version_to_publish) list option ;
  recommended_version: string option ;
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec log_destination_configs = string list option list
type nonrec filter_behavior =
  | DROP 
  | KEEP 
type nonrec filter_requirement =
  | MEETS_ANY 
  | MEETS_ALL 
type nonrec action_value =
  | EXCLUDED_AS_COUNT 
  | CHALLENGE 
  | CAPTCHA 
  | COUNT 
  | BLOCK 
  | ALLOW 
type nonrec action_condition = {
  action: action_value }
type nonrec label_name_condition = {
  label_name: string }
type nonrec condition =
  {
  label_name_condition: label_name_condition option ;
  action_condition: action_condition option }
type nonrec conditions = condition list option list
type nonrec filter =
  {
  conditions: condition list ;
  requirement: filter_requirement ;
  behavior: filter_behavior }
type nonrec filters = filter list option list
type nonrec logging_filter =
  {
  default_behavior: filter_behavior ;
  filters: filter list }
type nonrec log_type =
  | WAF_LOGS 
type nonrec log_scope =
  | SECURITY_LAKE 
  | CUSTOMER 
type nonrec logging_configuration =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  logging_filter: logging_filter option ;
  managed_by_firewall_manager: bool option ;
  redacted_fields: field_to_match list option ;
  log_destination_configs: string list ;
  resource_arn: string }
type nonrec put_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }
type nonrec put_logging_configuration_request =
  {
  logging_configuration: logging_configuration }
type nonrec managed_rule_set_version =
  {
  expiry_timestamp: float option ;
  last_update_timestamp: float option ;
  publish_timestamp: float option ;
  forecasted_lifetime: int option ;
  capacity: int option ;
  associated_rule_group_arn: string option }
type nonrec published_versions =
  (string_ option * managed_rule_set_version option) list
type nonrec product_title = string
type nonrec product_link = string
type nonrec product_id = string
type nonrec product_description = string
type nonrec population_size = int
type nonrec platform =
  | ANDROID 
  | IOS 
type nonrec pagination_limit = int
type nonrec output_url = string
type nonrec next_marker = string
type nonrec mobile_sdk_release =
  {
  tags: tag list option ;
  release_notes: string option ;
  timestamp_: float option ;
  release_version: string option }
type nonrec managed_rule_set_summary =
  {
  label_namespace: string option ;
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }
type nonrec managed_rule_set_summaries =
  managed_rule_set_summary list option list
type nonrec managed_rule_set =
  {
  label_namespace: string option ;
  recommended_version: string option ;
  published_versions: (string * managed_rule_set_version) list option ;
  description: string option ;
  ar_n: string ;
  id: string ;
  name: string }
type nonrec managed_rule_group_version =
  {
  last_update_timestamp: float option ;
  name: string option }
type nonrec managed_rule_group_versions =
  managed_rule_group_version list option list
type nonrec managed_rule_group_summary =
  {
  description: string option ;
  versioning_supported: bool option ;
  name: string option ;
  vendor_name: string option }
type nonrec managed_rule_group_summaries =
  managed_rule_group_summary list option list
type nonrec managed_product_descriptor =
  {
  is_advanced_managed_rule_set: bool option ;
  is_versioning_supported: bool option ;
  sns_topic_arn: string option ;
  product_description: string option ;
  product_title: string option ;
  product_link: string option ;
  product_id: string option ;
  managed_rule_set_name: string option ;
  vendor_name: string option }
type nonrec managed_product_descriptors =
  managed_product_descriptor list option list
type nonrec logging_configurations = logging_configuration list option list
type nonrec list_web_ac_ls_response =
  {
  web_ac_ls: web_acl_summary list option ;
  next_marker: string option }
type nonrec list_web_ac_ls_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_tags_for_resource_response =
  {
  tag_info_for_resource: tag_info_for_resource option ;
  next_marker: string option }
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string ;
  limit: int option ;
  next_marker: string option }
type nonrec list_rule_groups_response =
  {
  rule_groups: rule_group_summary list option ;
  next_marker: string option }
type nonrec list_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_resources_for_web_acl_response =
  {
  resource_arns: string list option }
type nonrec list_resources_for_web_acl_request =
  {
  resource_type: resource_type option ;
  web_acl_arn: string }
type nonrec list_regex_pattern_sets_response =
  {
  regex_pattern_sets: regex_pattern_set_summary list option ;
  next_marker: string option }
type nonrec list_regex_pattern_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_mobile_sdk_releases_response =
  {
  next_marker: string option ;
  release_summaries: release_summary list option }
type nonrec list_mobile_sdk_releases_request =
  {
  limit: int option ;
  next_marker: string option ;
  platform: platform }
type nonrec list_max_items = int
type nonrec list_managed_rule_sets_response =
  {
  managed_rule_sets: managed_rule_set_summary list option ;
  next_marker: string option }
type nonrec list_managed_rule_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_logging_configurations_response =
  {
  next_marker: string option ;
  logging_configurations: logging_configuration list option }
type nonrec list_logging_configurations_request =
  {
  log_scope: log_scope option ;
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec ip_set_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }
type nonrec ip_set_summaries = ip_set_summary list option list
type nonrec list_ip_sets_response =
  {
  ip_sets: ip_set_summary list option ;
  next_marker: string option }
type nonrec list_ip_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_available_managed_rule_groups_response =
  {
  managed_rule_groups: managed_rule_group_summary list option ;
  next_marker: string option }
type nonrec list_available_managed_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec list_available_managed_rule_group_versions_response =
  {
  current_default_version: string option ;
  versions: managed_rule_group_version list option ;
  next_marker: string option }
type nonrec list_available_managed_rule_group_versions_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope ;
  name: string ;
  vendor_name: string }
type nonrec api_key = string
type nonrec api_key_version = int
type nonrec api_key_summary =
  {
  version: int option ;
  creation_timestamp: float option ;
  api_key: string option ;
  token_domains: string list option }
type nonrec api_key_summaries = api_key_summary list option list
type nonrec list_api_keys_response =
  {
  application_integration_ur_l: string option ;
  api_key_summaries: api_key_summary list option ;
  next_marker: string option }
type nonrec list_api_keys_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }
type nonrec ip_set =
  {
  addresses: string list ;
  ip_address_version: ip_address_version ;
  description: string option ;
  ar_n: string ;
  id: string ;
  name: string }
type nonrec get_web_acl_response =
  {
  application_integration_ur_l: string option ;
  lock_token: string option ;
  web_ac_l: web_ac_l option }
type nonrec get_web_acl_request = {
  id: string ;
  scope: scope ;
  name: string }
type nonrec get_web_acl_for_resource_response = {
  web_ac_l: web_ac_l option }
type nonrec get_web_acl_for_resource_request = {
  resource_arn: string }
type nonrec get_sampled_requests_response =
  {
  time_window: time_window option ;
  population_size: int option ;
  sampled_requests: sampled_http_request list option }
type nonrec get_sampled_requests_request =
  {
  max_items: int ;
  time_window: time_window ;
  scope: scope ;
  rule_metric_name: string ;
  web_acl_arn: string }
type nonrec get_rule_group_response =
  {
  lock_token: string option ;
  rule_group: rule_group option }
type nonrec get_rule_group_request =
  {
  ar_n: string option ;
  id: string option ;
  scope: scope option ;
  name: string option }
type nonrec get_regex_pattern_set_response =
  {
  lock_token: string option ;
  regex_pattern_set: regex_pattern_set option }
type nonrec get_regex_pattern_set_request =
  {
  id: string ;
  scope: scope ;
  name: string }
type nonrec get_rate_based_statement_managed_keys_response =
  {
  managed_keys_ip_v6: rate_based_statement_managed_keys_ip_set option ;
  managed_keys_ip_v4: rate_based_statement_managed_keys_ip_set option }
type nonrec get_rate_based_statement_managed_keys_request =
  {
  rule_name: string ;
  rule_group_rule_name: string option ;
  web_acl_id: string ;
  web_acl_name: string ;
  scope: scope }
type nonrec get_permission_policy_response = {
  policy: string option }
type nonrec get_permission_policy_request = {
  resource_arn: string }
type nonrec get_mobile_sdk_release_response =
  {
  mobile_sdk_release: mobile_sdk_release option }
type nonrec get_mobile_sdk_release_request =
  {
  release_version: string ;
  platform: platform }
type nonrec get_managed_rule_set_response =
  {
  lock_token: string option ;
  managed_rule_set: managed_rule_set option }
type nonrec get_managed_rule_set_request =
  {
  id: string ;
  scope: scope ;
  name: string }
type nonrec get_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }
type nonrec get_logging_configuration_request =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  resource_arn: string }
type nonrec get_ip_set_response =
  {
  lock_token: string option ;
  ip_set: ip_set option }
type nonrec get_ip_set_request = {
  id: string ;
  scope: scope ;
  name: string }
type nonrec get_decrypted_api_key_response =
  {
  creation_timestamp: float option ;
  token_domains: string list option }
type nonrec get_decrypted_api_key_request = {
  api_key: string ;
  scope: scope }
type nonrec download_url = string
type nonrec generate_mobile_sdk_release_url_response = {
  url: string option }
type nonrec generate_mobile_sdk_release_url_request =
  {
  release_version: string ;
  platform: platform }
type nonrec disassociate_web_acl_response = unit
type nonrec disassociate_web_acl_request = {
  resource_arn: string }
type nonrec describe_managed_rule_group_response =
  {
  consumed_labels: label_summary list option ;
  available_labels: label_summary list option ;
  label_namespace: string option ;
  rules: rule_summary list option ;
  capacity: int option ;
  sns_topic_arn: string option ;
  version_name: string option }
type nonrec describe_managed_rule_group_request =
  {
  version_name: string option ;
  scope: scope ;
  name: string ;
  vendor_name: string }
type nonrec describe_managed_products_by_vendor_response =
  {
  managed_products: managed_product_descriptor list option }
type nonrec describe_managed_products_by_vendor_request =
  {
  scope: scope ;
  vendor_name: string }
type nonrec describe_all_managed_products_response =
  {
  managed_products: managed_product_descriptor list option }
type nonrec describe_all_managed_products_request = {
  scope: scope }
type nonrec delete_web_acl_response = unit
type nonrec delete_web_acl_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec delete_rule_group_response = unit
type nonrec delete_rule_group_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec delete_regex_pattern_set_response = unit
type nonrec delete_regex_pattern_set_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec delete_permission_policy_response = unit
type nonrec delete_permission_policy_request = {
  resource_arn: string }
type nonrec delete_logging_configuration_response = unit
type nonrec delete_logging_configuration_request =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  resource_arn: string }
type nonrec delete_ip_set_response = unit
type nonrec delete_ip_set_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }
type nonrec delete_firewall_manager_rule_groups_response =
  {
  next_web_acl_lock_token: string option }
type nonrec delete_firewall_manager_rule_groups_request =
  {
  web_acl_lock_token: string ;
  web_acl_arn: string }
type nonrec delete_api_key_response = unit
type nonrec delete_api_key_request = {
  api_key: string ;
  scope: scope }
type nonrec create_web_acl_response = {
  summary: web_acl_summary option }
type nonrec create_web_acl_request =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: (string * custom_response_body) list option ;
  tags: tag list option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  default_action: default_action ;
  scope: scope ;
  name: string }
type nonrec create_rule_group_response =
  {
  summary: rule_group_summary option }
type nonrec create_rule_group_request =
  {
  custom_response_bodies: (string * custom_response_body) list option ;
  tags: tag list option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  capacity: int ;
  scope: scope ;
  name: string }
type nonrec create_regex_pattern_set_response =
  {
  summary: regex_pattern_set_summary option }
type nonrec create_regex_pattern_set_request =
  {
  tags: tag list option ;
  regular_expression_list: regex list ;
  description: string option ;
  scope: scope ;
  name: string }
type nonrec create_ip_set_response = {
  summary: ip_set_summary option }
type nonrec create_ip_set_request =
  {
  tags: tag list option ;
  addresses: string list ;
  ip_address_version: ip_address_version ;
  description: string option ;
  scope: scope ;
  name: string }
type nonrec create_api_key_response = {
  api_key: string option }
type nonrec api_key_token_domains = string list option list
type nonrec create_api_key_request =
  {
  token_domains: string list ;
  scope: scope }
type nonrec check_capacity_response = {
  capacity: int option }
type nonrec check_capacity_request = {
  rules: rule list ;
  scope: scope }
type nonrec associate_web_acl_response = unit
type nonrec associate_web_acl_request =
  {
  resource_arn: string ;
  web_acl_arn: string }
type nonrec awswa_f_20190729 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t