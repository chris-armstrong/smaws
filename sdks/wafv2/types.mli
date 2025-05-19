open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec single_header = {
  name: string }[@@ocaml.doc
                  "Inspect one of the headers in the web request, identified by name, for example, [User-Agent] or [Referer]. The name isn't case sensitive.\n\n You can filter and inspect all headers with the [FieldToMatch] setting [Headers].\n \n  This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n  \n   Example JSON: [\"SingleHeader\": { \"Name\": \"haystack\" }] \n   "]
type nonrec single_query_argument = {
  name: string }[@@ocaml.doc
                  "Inspect one query argument in the web request, identified by name, for example {i UserName} or {i SalesRegion}. The name isn't case sensitive. \n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Example JSON: [\"SingleQueryArgument\": { \"Name\": \"myArgument\" }] \n  "]
type nonrec all_query_arguments = unit
type nonrec uri_path = unit
type nonrec query_string = unit
type nonrec oversize_handling =
  | NO_MATCH 
  | MATCH 
  | CONTINUE [@@ocaml.doc ""]
type nonrec body = {
  oversize_handling: oversize_handling option }[@@ocaml.doc
                                                 "Inspect the body of the web request. The body immediately follows the request headers.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n "]
type nonrec method_ = unit
type nonrec all = unit
type nonrec json_match_pattern =
  {
  included_paths: string list option ;
  all: all option }[@@ocaml.doc
                     "The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against the rule inspection criteria. This is used with the [FieldToMatch] option [JsonBody]. \n"]
type nonrec json_match_scope =
  | VALUE 
  | KEY 
  | ALL [@@ocaml.doc ""]
type nonrec body_parsing_fallback_behavior =
  | EVALUATE_AS_STRING 
  | NO_MATCH 
  | MATCH [@@ocaml.doc ""]
type nonrec json_body =
  {
  oversize_handling: oversize_handling option ;
  invalid_fallback_behavior: body_parsing_fallback_behavior option ;
  match_scope: json_match_scope ;
  match_pattern: json_match_pattern }[@@ocaml.doc
                                       "Inspect the body of the web request as JSON. The body immediately follows the request headers. \n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Use the specifications in this object to indicate which parts of the JSON body to inspect using the rule's inspection criteria. WAF inspects only the parts of the JSON that result from the matches that you indicate. \n  \n   Example JSON: [\"JsonBody\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"ALL\"\n            }] \n   "]
type nonrec header_match_pattern =
  {
  excluded_headers: string list option ;
  included_headers: string list option ;
  all: all option }[@@ocaml.doc
                     "The filter to use to identify the subset of headers to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedHeaders], or [ExcludedHeaders].\n \n  Example JSON: [\"MatchPattern\": { \"ExcludedHeaders\": \\[ \"KeyToExclude1\", \"KeyToExclude2\" \\] }] \n  "]
type nonrec map_match_scope =
  | VALUE 
  | KEY 
  | ALL [@@ocaml.doc ""]
type nonrec headers =
  {
  oversize_handling: oversize_handling ;
  match_scope: map_match_scope ;
  match_pattern: header_match_pattern }[@@ocaml.doc
                                         "Inspect all headers in the web request. You can specify the parts of the headers to inspect and you can narrow the set of headers to inspect by including or excluding specific keys.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  If you want to inspect just the value of a single header, use the [SingleHeader] [FieldToMatch] setting instead.\n  \n   Example JSON: [\"Headers\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"KEY\",\n            \"OversizeHandling\": \"MATCH\" }] \n   "]
type nonrec cookie_match_pattern =
  {
  excluded_cookies: string list option ;
  included_cookies: string list option ;
  all: all option }[@@ocaml.doc
                     "The filter to use to identify the subset of cookies to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedCookies], or [ExcludedCookies].\n \n  Example JSON: [\"MatchPattern\": { \"IncludedCookies\": \\[ \"session-id-time\", \"session-id\" \\] }] \n  "]
type nonrec cookies =
  {
  oversize_handling: oversize_handling ;
  match_scope: map_match_scope ;
  match_pattern: cookie_match_pattern }[@@ocaml.doc
                                         "Inspect the cookies in the web request. You can specify the parts of the cookies to inspect and you can narrow the set of cookies to inspect by including or excluding specific keys.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Example JSON: [\"Cookies\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"KEY\",\n            \"OversizeHandling\": \"MATCH\" }] \n  "]
type nonrec header_order = {
  oversize_handling: oversize_handling }[@@ocaml.doc
                                          "Inspect a string containing the list of the request's header names, ordered as they appear in the web request that WAF receives for inspection. WAF generates the string and then uses that as the field to match component in its inspection. WAF separates the header names in the string using colons and no added spaces, for example [host:user-agent:accept:authorization:referer].\n"]
type nonrec fallback_behavior =
  | NO_MATCH 
  | MATCH [@@ocaml.doc ""]
type nonrec ja3_fingerprint = {
  fallback_behavior: fallback_behavior }[@@ocaml.doc
                                          "Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.\n\n  You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n  \n    You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n    \n     Provide the JA3 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.\n     "]
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
  single_header: single_header option }[@@ocaml.doc
                                         "Specifies a web request component to be used in a rule match statement or in a logging configuration. \n\n {ul\n       {-  In a rule statement, this is the part of the web request that you want WAF to inspect. Include the single [FieldToMatch] type that you want to inspect, with additional specifications as needed, according to the type. You specify a single request component in [FieldToMatch] for each rule statement that requires it. To inspect more than one component of the web request, create a separate rule statement for each component.\n           \n            Example JSON for a [QueryString] field to match: \n            \n              [ \"FieldToMatch\": { \"QueryString\": {} }] \n             \n              Example JSON for a [Method] field to match specification:\n              \n                [ \"FieldToMatch\": { \"Method\": { \"Name\": \"DELETE\" } }] \n               \n                }\n       {-  In a logging configuration, this is used in the [RedactedFields] property to specify a field to redact from the logging records. For this use case, note the following: \n           \n            {ul\n                  {-  Even though all [FieldToMatch] settings are available, the only valid settings for field redaction are [UriPath], [QueryString], [SingleHeader], and [Method].\n                      \n                       }\n                  {-  In this documentation, the descriptions of the individual fields talk about specifying the web request component to inspect, but for field redaction, you are specifying the component type to redact from the logs. \n                      \n                       }\n                  {-  If you have request sampling enabled, the redacted fields configuration for logging has no impact on sampling. The only way to exclude fields from request sampling is by disabling sampling in the web ACL visibility configuration. \n                      \n                       }\n                  \n        }\n         }\n       }\n  "]
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
  | NONE [@@ocaml.doc ""]
type nonrec text_transformation =
  {
  type_: text_transformation_type ;
  priority: int }[@@ocaml.doc
                   "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. \n"]
type nonrec xss_match_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    "A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into other legitimate web browsers. \n"]
type nonrec web_acl_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "High-level information about a [WebACL], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [WebACL], and the ARN, that you provide to operations like [AssociateWebACL].\n"]
type nonrec custom_http_header = {
  value: string ;
  name: string }[@@ocaml.doc
                  "A custom header for custom request and response handling. This is used in [CustomResponse] and [CustomRequestHandling].\n"]
type nonrec custom_response =
  {
  response_headers: custom_http_header list option ;
  custom_response_body_key: string option ;
  response_code: int }[@@ocaml.doc
                        "A custom response to send to the client. You can define a custom response for rule actions and default web ACL actions that are set to [BlockAction]. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]
type nonrec block_action = {
  custom_response: custom_response option }[@@ocaml.doc
                                             "Specifies that WAF should block the request and optionally defines additional custom handling for the response to the web request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec custom_request_handling =
  {
  insert_headers: custom_http_header list }[@@ocaml.doc
                                             "Custom request handling behavior that inserts custom headers into a web request. You can add custom request handling for WAF to use when the rule action doesn't block the request. For example, [CaptchaAction] for requests with valid t okens, and [AllowAction]. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]
type nonrec allow_action =
  {
  custom_request_handling: custom_request_handling option }[@@ocaml.doc
                                                             "Specifies that WAF should allow the request and optionally defines additional custom handling for the request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec default_action =
  {
  allow: allow_action option ;
  block: block_action option }[@@ocaml.doc
                                "In a [WebACL], this is the action that you want WAF to perform when a web request doesn't match any of the rules in the [WebACL]. The default action must be a terminating action.\n"]
type nonrec positional_constraint =
  | CONTAINS_WORD 
  | CONTAINS 
  | ENDS_WITH 
  | STARTS_WITH 
  | EXACTLY [@@ocaml.doc ""]
type nonrec byte_match_statement =
  {
  positional_constraint: positional_constraint ;
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  search_string: bytes }[@@ocaml.doc
                          "A rule statement that defines a string match search for WAF to apply to web requests. The byte match statement provides the bytes to search for, the location in requests that you want WAF to search, and other settings. The bytes to search for are typically a string that corresponds with ASCII characters. In the WAF console and the developer guide, this is called a string match statement.\n"]
type nonrec sensitivity_level =
  | HIGH 
  | LOW [@@ocaml.doc ""]
type nonrec sqli_match_statement =
  {
  sensitivity_level: sensitivity_level option ;
  text_transformations: text_transformation list ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    "A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web requests to do things like modify your database or extract data from it. \n"]
type nonrec comparison_operator =
  | GT 
  | GE 
  | LT 
  | LE 
  | NE 
  | EQ [@@ocaml.doc ""]
type nonrec size_constraint_statement =
  {
  text_transformations: text_transformation list ;
  size: int ;
  comparison_operator: comparison_operator ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    "A rule statement that compares a number of bytes against the size of a request component, using a comparison operator, such as greater than (>) or less than (<). For example, you can use a size constraint statement to look for query strings that are longer than 100 bytes. \n\n If you configure WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit for the web ACL and protected resource type. If you know that the request body for your web requests should never exceed the inspection limit, you can use a size constraint statement to block requests that have a larger request body size. For more information about the inspection limits, see [Body] and [JsonBody] settings for the [FieldToMatch] data type. \n \n  If you choose URI for the value of Part of the request to filter on, the slash (/) in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.\n  "]
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
  | AF [@@ocaml.doc ""]
type nonrec forwarded_ip_config =
  {
  fallback_behavior: fallback_behavior ;
  header_name: string }[@@ocaml.doc
                         "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    This configuration is used for [GeoMatchStatement] and [RateBasedStatement]. For [IPSetReferenceStatement], use [IPSetForwardedIPConfig] instead. \n    \n     WAF only evaluates the first IP address found in the specified HTTP header. \n     "]
type nonrec geo_match_statement =
  {
  forwarded_ip_config: forwarded_ip_config option ;
  country_codes: country_code list option }[@@ocaml.doc
                                             "A rule statement that labels web requests by country and region and that matches against web requests based on country code. A geo match rule labels every request that it inspects regardless of whether it finds a match.\n\n {ul\n       {-  To manage requests only by country, you can use this statement by itself and specify the countries that you want to match against in the [CountryCodes] array. \n           \n            }\n       {-  Otherwise, configure your geo match rule with Count action so that it only labels requests. Then, add one or more label match rules to run after the geo match rule and configure them to match against the geographic labels and handle the requests as needed. \n           \n            }\n       }\n   WAF labels requests using the alpha-2 country and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF determines the codes using either the IP address in the web request origin or, if you specify it, the address in the geo match [ForwardedIPConfig]. \n   \n    If you use the web request origin, the label formats are \n    {[\n    awswaf:clientip:geo:region:-\n    ]}\n     and \n    {[\n    awswaf:clientip:geo:country:\n    ]}\n    .\n    \n     If you use a forwarded IP address, the label formats are \n     {[\n     awswaf:forwardedip:geo:region:-\n     ]}\n      and \n     {[\n     awswaf:forwardedip:geo:country:\n     ]}\n     .\n     \n      For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html}Geographic match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}. \n      "]
type nonrec excluded_rule = {
  name: string }[@@ocaml.doc
                  "Specifies a single rule in a rule group whose action you want to override to [Count]. \n\n  Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].\n  \n   "]
type nonrec count_action =
  {
  custom_request_handling: custom_request_handling option }[@@ocaml.doc
                                                             "Specifies that WAF should count the request. Optionally defines additional custom handling for the request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec captcha_action =
  {
  custom_request_handling: custom_request_handling option }[@@ocaml.doc
                                                             "Specifies that WAF should run a [CAPTCHA] check against the request: \n\n {ul\n       {-  If the request includes a valid, unexpired [CAPTCHA] token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction]. \n           \n            }\n       {-  If the request doesn't include a valid, unexpired token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.\n           \n            WAF generates a response that it sends back to the client, which includes the following: \n            \n             {ul\n                   {-  The header [x-amzn-waf-action] with a value of [captcha]. \n                       \n                        }\n                   {-  The HTTP status code [405 Method Not Allowed]. \n                       \n                        }\n                   {-  If the request contains an [Accept] header with a value of [text/html], the response includes a [CAPTCHA] JavaScript page interstitial. \n                       \n                        }\n                   \n        }\n         }\n       }\n   You can configure the expiration time in the [CaptchaConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting. \n   \n    This action option is available for rules. It isn't available for web ACL default actions. \n    "]
type nonrec challenge_action =
  {
  custom_request_handling: custom_request_handling option }[@@ocaml.doc
                                                             "Specifies that WAF should run a [Challenge] check against the request to verify that the request is coming from a legitimate client session: \n\n {ul\n       {-  If the request includes a valid, unexpired challenge token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction]. \n           \n            }\n       {-  If the request doesn't include a valid, unexpired challenge token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.\n           \n            WAF then generates a challenge response that it sends back to the client, which includes the following: \n            \n             {ul\n                   {-  The header [x-amzn-waf-action] with a value of [challenge]. \n                       \n                        }\n                   {-  The HTTP status code [202 Request Accepted]. \n                       \n                        }\n                   {-  If the request contains an [Accept] header with a value of [text/html], the response includes a JavaScript page interstitial with a challenge script. \n                       \n                        }\n                   \n        }\n         Challenges run silent browser interrogations in the background, and don't generally affect the end user experience. \n         \n          A challenge enforces token acquisition using an interstitial JavaScript challenge that inspects the client session for legitimate behavior. The challenge blocks bots or at least increases the cost of operating sophisticated bots. \n          \n           After the client session successfully responds to the challenge, it receives a new token from WAF, which the challenge script uses to resubmit the original request. \n           \n            }\n       }\n   You can configure the expiration time in the [ChallengeConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting. \n   \n    This action option is available for rules. It isn't available for web ACL default actions. \n    "]
type nonrec rule_action =
  {
  challenge: challenge_action option ;
  captcha: captcha_action option ;
  count: count_action option ;
  allow: allow_action option ;
  block: block_action option }[@@ocaml.doc
                                "The action that WAF should take on a web request when it matches a rule's statement. Settings at the web ACL level can override the rule action setting. \n"]
type nonrec rule_action_override =
  {
  action_to_use: rule_action ;
  name: string }[@@ocaml.doc
                  "Action setting to use in the place of a rule action that is configured inside the rule group. You specify one override for each rule whose action you want to change. \n\n You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.\n "]
type nonrec rule_group_reference_statement =
  {
  rule_action_overrides: rule_action_override list option ;
  excluded_rules: excluded_rule list option ;
  ar_n: string }[@@ocaml.doc
                  "A rule statement used to run the rules that are defined in a [RuleGroup]. To use this, create a rule group with your rules, then provide the ARN of the rule group in this statement.\n\n You cannot nest a [RuleGroupReferenceStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a rule group reference statement inside another rule group. You can only reference a rule group as a top-level statement within a rule that you define in a web ACL.\n "]
type nonrec forwarded_ip_position =
  | ANY 
  | LAST 
  | FIRST [@@ocaml.doc ""]
type nonrec ip_set_forwarded_ip_config =
  {
  position: forwarded_ip_position ;
  fallback_behavior: fallback_behavior ;
  header_name: string }[@@ocaml.doc
                         "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    This configuration is used only for [IPSetReferenceStatement]. For [GeoMatchStatement] and [RateBasedStatement], use [ForwardedIPConfig] instead. \n    "]
type nonrec ip_set_reference_statement =
  {
  ip_set_forwarded_ip_config: ip_set_forwarded_ip_config option ;
  ar_n: string }[@@ocaml.doc
                  "A rule statement used to detect web requests coming from particular IP addresses or address ranges. To use this, create an [IPSet] that specifies the addresses you want to detect, then use the ARN of that set in this statement. To create an IP set, see [CreateIPSet].\n\n Each IP set rule statement references an IP set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "]
type nonrec regex_pattern_set_reference_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  ar_n: string }[@@ocaml.doc
                  "A rule statement used to search web request components for matches with regular expressions. To use this, create a [RegexPatternSet] that specifies the expressions that you want to detect, then use the ARN of that set in this statement. A web request matches the pattern set rule statement if the request component matches any of the patterns in the set. To create a regex pattern set, see [CreateRegexPatternSet].\n\n Each regex pattern set rule statement references a regex pattern set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "]
type nonrec rate_based_statement_aggregate_key_type =
  | CONSTANT 
  | CUSTOM_KEYS 
  | FORWARDED_IP 
  | IP [@@ocaml.doc ""]
type nonrec rate_limit_header =
  {
  text_transformations: text_transformation list ;
  name: string }[@@ocaml.doc
                  "Specifies a header as an aggregate key for a rate-based rule. Each distinct value in the header contributes to the aggregation instance. If you use a single header as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_cookie =
  {
  text_transformations: text_transformation list ;
  name: string }[@@ocaml.doc
                  "Specifies a cookie as an aggregate key for a rate-based rule. Each distinct value in the cookie contributes to the aggregation instance. If you use a single cookie as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_query_argument =
  {
  text_transformations: text_transformation list ;
  name: string }[@@ocaml.doc
                  "Specifies a query argument in the request as an aggregate key for a rate-based rule. Each distinct value for the named query argument contributes to the aggregation instance. If you use a single query argument as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_query_string =
  {
  text_transformations: text_transformation list }[@@ocaml.doc
                                                    "Specifies the request's query string as an aggregate key for a rate-based rule. Each distinct string contributes to the aggregation instance. If you use just the query string as your custom key, then each string fully defines an aggregation instance. \n"]
type nonrec rate_limit_http_method = unit
type nonrec rate_limit_forwarded_i_p = unit
type nonrec rate_limit_i_p = unit
type nonrec rate_limit_label_namespace = {
  namespace: string }[@@ocaml.doc
                       "Specifies a label namespace to use as an aggregate key for a rate-based rule. Each distinct fully qualified label name that has the specified label namespace contributes to the aggregation instance. If you use just one label namespace as your custom key, then each label name fully defines an aggregation instance. \n\n This uses only labels that have been added to the request by rules that are evaluated before this rate-based rule in the web ACL. \n \n  For information about label namespaces and names, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html}Label syntax and naming requirements} in the {i WAF Developer Guide}.\n  "]
type nonrec rate_limit_uri_path =
  {
  text_transformations: text_transformation list }[@@ocaml.doc
                                                    "Specifies the request's URI path as an aggregate key for a rate-based rule. Each distinct URI path contributes to the aggregation instance. If you use just the URI path as your custom key, then each URI path fully defines an aggregation instance. \n"]
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
  header: rate_limit_header option }[@@ocaml.doc
                                      "Specifies a single custom aggregate key for a rate-base rule. \n\n  Web requests that are missing any of the components specified in the aggregation keys are omitted from the rate-based rule evaluation and handling. \n  \n   "]
type nonrec payload_type =
  | FORM_ENCODED 
  | JSON [@@ocaml.doc ""]
type nonrec username_field = {
  identifier: string }[@@ocaml.doc
                        "The name of the field in the request payload that contains your customer's username. \n\n This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types. \n "]
type nonrec password_field = {
  identifier: string }[@@ocaml.doc
                        "The name of the field in the request payload that contains your customer's password. \n\n This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types. \n "]
type nonrec inspection_level =
  | TARGETED 
  | COMMON [@@ocaml.doc ""]
type nonrec aws_managed_rules_bot_control_rule_set =
  {
  enable_machine_learning: bool option ;
  inspection_level: inspection_level }[@@ocaml.doc
                                        "Details for your use of the Bot Control managed rule group, [AWSManagedRulesBotControlRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n"]
type nonrec request_inspection =
  {
  password_field: password_field ;
  username_field: username_field ;
  payload_type: payload_type }[@@ocaml.doc
                                "The criteria for inspecting login requests, used by the ATP rule group to validate credentials usage. \n\n This is part of the [AWSManagedRulesATPRuleSet] configuration in [ManagedRuleGroupConfig].\n \n  In these settings, you specify how your application accepts login attempts by providing the request payload type and the names of the fields within the request body where the username and password are provided. \n  "]
type nonrec response_inspection_status_code =
  {
  failure_codes: int list ;
  success_codes: int list }[@@ocaml.doc
                             "Configures inspection of the response status code. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_header =
  {
  failure_values: string list ;
  success_values: string list ;
  name: string }[@@ocaml.doc
                  "Configures inspection of the response header. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_body_contains =
  {
  failure_strings: string list ;
  success_strings: string list }[@@ocaml.doc
                                  "Configures inspection of the response body. WAF can inspect the first 65,536 bytes (64 KB) of the response body. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_json =
  {
  failure_values: string list ;
  success_values: string list ;
  identifier: string }[@@ocaml.doc
                        "Configures inspection of the response JSON. WAF can inspect the first 65,536 bytes (64 KB) of the response JSON. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection =
  {
  json: response_inspection_json option ;
  body_contains: response_inspection_body_contains option ;
  header: response_inspection_header option ;
  status_code: response_inspection_status_code option }[@@ocaml.doc
                                                         "The criteria for inspecting responses to login requests and account creation requests, used by the ATP and ACFP rule groups to track login and account creation success and failure rates. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n    The rule groups evaluates the responses that your protected resources send back to client login and account creation attempts, keeping count of successful and failed attempts from each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses with too much suspicious activity in a short amount of time. \n    \n     This is part of the [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet] configurations in [ManagedRuleGroupConfig].\n     \n      Enable response inspection by configuring exactly one component of the response to inspect, for example, [Header] or [StatusCode]. You can't configure more than one component for inspection. If you don't configure any of the response inspection options, response inspection is disabled. \n      "]
type nonrec aws_managed_rules_atp_rule_set =
  {
  enable_regex_in_path: bool option ;
  response_inspection: response_inspection option ;
  request_inspection: request_inspection option ;
  login_path: string }[@@ocaml.doc
                        "Details for your use of the account takeover prevention managed rule group, [AWSManagedRulesATPRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n"]
type nonrec email_field = {
  identifier: string }[@@ocaml.doc
                        "The name of the field in the request payload that contains your customer's email. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec phone_number_field = {
  identifier: string }[@@ocaml.doc
                        "The name of a field in the request payload that contains part or all of your customer's primary phone number. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec address_field = {
  identifier: string }[@@ocaml.doc
                        "The name of a field in the request payload that contains part or all of your customer's primary physical address. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec request_inspection_acf_p =
  {
  address_fields: address_field list option ;
  phone_number_fields: phone_number_field list option ;
  email_field: email_field option ;
  password_field: password_field option ;
  username_field: username_field option ;
  payload_type: payload_type }[@@ocaml.doc
                                "The criteria for inspecting account creation requests, used by the ACFP rule group to validate and track account creation attempts. \n\n This is part of the [AWSManagedRulesACFPRuleSet] configuration in [ManagedRuleGroupConfig].\n \n  In these settings, you specify how your application accepts account creation attempts by providing the request payload type and the names of the fields within the request body where the username, password, email, and primary address and phone number fields are provided. \n  "]
type nonrec aws_managed_rules_acfp_rule_set =
  {
  enable_regex_in_path: bool option ;
  response_inspection: response_inspection option ;
  request_inspection: request_inspection_acf_p ;
  registration_page_path: string ;
  creation_path: string }[@@ocaml.doc
                           "Details for your use of the account creation fraud prevention managed rule group, [AWSManagedRulesACFPRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n"]
type nonrec managed_rule_group_config =
  {
  aws_managed_rules_acfp_rule_set: aws_managed_rules_acfp_rule_set option ;
  aws_managed_rules_atp_rule_set: aws_managed_rules_atp_rule_set option ;
  aws_managed_rules_bot_control_rule_set:
    aws_managed_rules_bot_control_rule_set option ;
  password_field: password_field option ;
  username_field: username_field option ;
  payload_type: payload_type option ;
  login_path: string option }[@@ocaml.doc
                               "Additional information that's used by a managed rule group. Many managed rule groups don't require this.\n\n The rule groups used for intelligent threat mitigation require additional configuration: \n \n  {ul\n        {-  Use the [AWSManagedRulesACFPRuleSet] configuration object to configure the account creation fraud prevention managed rule group. The configuration includes the registration and sign-up pages of your application and the locations in the account creation request payload of data, such as the user email and phone number fields. \n            \n             }\n        {-  Use the [AWSManagedRulesATPRuleSet] configuration object to configure the account takeover prevention managed rule group. The configuration includes the sign-in page of your application and the locations in the login request payload of data such as the username and password. \n            \n             }\n        {-  Use the [AWSManagedRulesBotControlRuleSet] configuration object to configure the protection level that you want the Bot Control rule group to use. \n            \n             }\n        }\n   For example specifications, see the examples section of [CreateWebACL].\n   "]
type nonrec label_match_scope =
  | NAMESPACE 
  | LABEL [@@ocaml.doc ""]
type nonrec label_match_statement = {
  key: string ;
  scope: label_match_scope }[@@ocaml.doc
                              "A rule statement to match against labels that have been added to the web request by rules that have already run in the web ACL. \n\n The label match statement provides the label or namespace string to search for. The label string can represent a part or all of the fully qualified label name that had been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. If you do not provide the fully qualified name in your label match string, WAF performs the search for labels that were added in the same context as the label match statement. \n "]
type nonrec regex_match_statement =
  {
  text_transformations: text_transformation list ;
  field_to_match: field_to_match ;
  regex_string: string }[@@ocaml.doc
                          "A rule statement used to search web request components for a match against a single regular expression. \n"]
type and_statement = {
  statements: statement list }[@@ocaml.doc
                                "A logical rule statement used to combine other rule statements with AND logic. You provide more than one [Statement] within the [AndStatement]. \n"]
and managed_rule_group_statement =
  {
  rule_action_overrides: rule_action_override list option ;
  managed_rule_group_configs: managed_rule_group_config list option ;
  scope_down_statement: statement option ;
  excluded_rules: excluded_rule list option ;
  version: string option ;
  name: string ;
  vendor_name: string }[@@ocaml.doc
                         "A rule statement used to run the rules that are defined in a managed rule group. To use this, provide the vendor name and the name of the rule group in this statement. You can retrieve the required names by calling [ListAvailableManagedRuleGroups].\n\n You cannot nest a [ManagedRuleGroupStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a managed rule group inside another rule group. You can only reference a managed rule group as a top-level statement within a rule that you define in a web ACL.\n \n   You are charged additional fees when you use the WAF Bot Control managed rule group [AWSManagedRulesBotControlRuleSet], the WAF Fraud Control account takeover prevention (ATP) managed rule group [AWSManagedRulesATPRuleSet], or the WAF Fraud Control account creation fraud prevention (ACFP) managed rule group [AWSManagedRulesACFPRuleSet]. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n    "]
and not_statement = {
  statement: statement }[@@ocaml.doc
                          "A logical rule statement used to negate the results of another rule statement. You provide one [Statement] within the [NotStatement].\n"]
and or_statement = {
  statements: statement list }[@@ocaml.doc
                                "A logical rule statement used to combine other rule statements with OR logic. You provide more than one [Statement] within the [OrStatement]. \n"]
and rate_based_statement =
  {
  custom_keys: rate_based_statement_custom_key list option ;
  forwarded_ip_config: forwarded_ip_config option ;
  scope_down_statement: statement option ;
  aggregate_key_type: rate_based_statement_aggregate_key_type ;
  evaluation_window_sec: int option ;
  limit: int }[@@ocaml.doc
                "A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast a rate. The rule categorizes requests according to your aggregation criteria, collects them into aggregation instances, and counts and rate limits the requests for each instance. \n\n  If you change any of these settings in a rule that's currently in use, the change resets the rule's rate limiting counts. This can pause the rule's rate limiting activities for up to a minute. \n  \n    You can specify individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie. \n    \n     Each unique set of values for the aggregation keys that you specify is a separate aggregation instance, with the value from each key contributing to the aggregation instance definition. \n     \n      For example, assume the rule evaluates web requests with the following IP address and HTTP method values: \n      \n       {ul\n             {-  IP address 10.1.1.1, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             {-  IP address 127.0.0.0, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             }\n   The rule would create different aggregation instances according to your aggregation criteria, for example: \n   \n    {ul\n          {-  If the aggregation criteria is just the IP address, then each individual address is an aggregation instance, and WAF counts requests separately for each. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1: count 3\n                         \n                          }\n                     {-  IP address 127.0.0.0: count 1\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  HTTP method POST: count 2\n                         \n                          }\n                     {-  HTTP method GET: count 2\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is IP address and HTTP method, then each IP address and each HTTP method would contribute to the combined aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1, HTTP method POST: count 1\n                         \n                          }\n                     {-  IP address 10.1.1.1, HTTP method GET: count 2\n                         \n                          }\n                     {-  IP address 127.0.0.0, HTTP method POST: count 1\n                         \n                          }\n                     \n           }\n            }\n          }\n   For any n-tuple of aggregation keys, each unique combination of values for the keys defines a separate aggregation instance, which WAF counts and rate-limits individually. \n   \n    You can optionally nest another statement inside the rate-based statement, to narrow the scope of the rule so that it only counts and rate limits requests that match the nested statement. You can use this nested scope-down statement in conjunction with your aggregation key specifications or you can just count and rate limit all requests that match the scope-down statement, without additional aggregation. When you choose to just manage all requests that match a scope-down statement, the aggregation instance is singular for the rule. \n    \n     You cannot nest a [RateBasedStatement] inside another statement, for example inside a [NotStatement] or [OrStatement]. You can define a [RateBasedStatement] inside a web ACL and inside a rule group. \n     \n      For additional information about the options, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html}Rate limiting web requests using rate-based rules} in the {i WAF Developer Guide}. \n      \n       If you only aggregate on the individual IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently rate limiting for a rule through the API call [GetRateBasedStatementManagedKeys]. This option is not available for other aggregation configurations.\n       \n        WAF tracks and manages web requests separately for each instance of a rate-based rule that you use. For example, if you provide the same rate-based rule settings in two web ACLs, each of the two rule statements represents a separate instance of the rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule inside a rule group, and then use that rule group in multiple places, each use creates a separate instance of the rate-based rule that gets its own tracking and management by WAF. \n        "]
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
  byte_match_statement: byte_match_statement option }[@@ocaml.doc
                                                       "The processing guidance for a [Rule], used by WAF to determine whether a web request matches the rule. \n\n For example specifications, see the examples section of [CreateWebACL].\n "]
type nonrec none_action = unit
type nonrec override_action =
  {
  none: none_action option ;
  count: count_action option }[@@ocaml.doc
                                "The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only. \n\n You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement]. \n \n   This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings. \n   \n    "]
type nonrec label = {
  name: string }[@@ocaml.doc
                  "A single label container. This is used as an element of a label array in multiple contexts, for example, in [RuleLabels] inside a [Rule] and in [Labels] inside a [SampledHTTPRequest]. \n"]
type nonrec visibility_config =
  {
  metric_name: string ;
  cloud_watch_metrics_enabled: bool ;
  sampled_requests_enabled: bool }[@@ocaml.doc
                                    "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"]
type nonrec immunity_time_property = {
  immunity_time: int }[@@ocaml.doc
                        "Used for CAPTCHA and challenge token settings. Determines how long a [CAPTCHA] or challenge timestamp remains valid after WAF updates it for a successful [CAPTCHA] or challenge response. \n"]
type nonrec captcha_config =
  {
  immunity_time_property: immunity_time_property option }[@@ocaml.doc
                                                           "Specifies how WAF should handle [CAPTCHA] evaluations. This is available at the web ACL level and in each rule. \n"]
type nonrec challenge_config =
  {
  immunity_time_property: immunity_time_property option }[@@ocaml.doc
                                                           "Specifies how WAF should handle [Challenge] evaluations. This is available at the web ACL level and in each rule. \n"]
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
  name: string }[@@ocaml.doc
                  "A single rule, which you can use in a [WebACL] or [RuleGroup] to identify web requests that you want to manage in some way. Each rule includes one top-level [Statement] that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"]
type nonrec firewall_manager_statement =
  {
  rule_group_reference_statement: rule_group_reference_statement option ;
  managed_rule_group_statement: managed_rule_group_statement option }
[@@ocaml.doc
  "The processing guidance for an Firewall Manager rule. This is like a regular rule [Statement], but it can only contain a single rule group reference.\n"]
type nonrec firewall_manager_rule_group =
  {
  visibility_config: visibility_config ;
  override_action: override_action ;
  firewall_manager_statement: firewall_manager_statement ;
  priority: int ;
  name: string }[@@ocaml.doc
                  "A rule group that's defined for an Firewall Manager WAF policy.\n"]
type nonrec response_content_type =
  | APPLICATION_JSON 
  | TEXT_HTML 
  | TEXT_PLAIN [@@ocaml.doc ""]
type nonrec custom_response_body =
  {
  content: string ;
  content_type: response_content_type }[@@ocaml.doc
                                         "The response body to use in a custom response to a web request. This is referenced by key from [CustomResponse] [CustomResponseBodyKey].\n"]
type nonrec custom_response_bodies = (string * custom_response_body) list
[@@ocaml.doc ""]
type nonrec size_inspection_limit =
  | KB_64 
  | KB_48 
  | KB_32 
  | KB_16 [@@ocaml.doc ""]
type nonrec request_body_associated_resource_type_config =
  {
  default_size_inspection_limit: size_inspection_limit }[@@ocaml.doc
                                                          "Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size is 16 KB (16,384 bytes). You can change the setting for any of the available resource types. \n\n  You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n  \n    Example JSON: [ {\n    \"API_GATEWAY\": \"KB_48\",\n    \"APP_RUNNER_SERVICE\": \"KB_32\"\n    }] \n    \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     \n      This is used in the [AssociationConfig] of the web ACL. \n      "]
type nonrec associated_resource_type =
  | VERIFIED_ACCESS_INSTANCE 
  | APP_RUNNER_SERVICE 
  | COGNITO_USER_POOL 
  | API_GATEWAY 
  | CLOUDFRONT [@@ocaml.doc ""]
type nonrec request_body =
  (associated_resource_type * request_body_associated_resource_type_config)
    list[@@ocaml.doc ""]
type nonrec association_config = {
  request_body: request_body option }[@@ocaml.doc
                                       "Specifies custom configurations for the associations between the web ACL and protected resources. \n\n Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). \n \n   You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "]
type nonrec web_ac_l =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: custom_response_bodies option ;
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
  name: string }[@@ocaml.doc
                  " A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resources can be an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, an AppSync GraphQL API, an Amazon Cognito user pool, an App Runner service, or an Amazon Web Services Verified Access instance. \n"]
type nonrec waf_unsupported_aggregate_key_type_exception =
  {
  message: string option }[@@ocaml.doc
                            "The rule that you've named doesn't aggregate solely on the IP address or solely on the forwarded IP address. This call is only available for rate-based rules with an [AggregateKeyType] setting of [IP] or [FORWARDED_IP].\n"]
type nonrec waf_unavailable_entity_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t retrieve a resource that you specified for this operation. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate. Verify the resources that you are specifying in your request parameters and then retry the operation.\n"]
type nonrec waf_tag_operation_internal_error_exception =
  {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform your tagging operation because of an internal error. Retry your request.\n"]
type nonrec waf_tag_operation_exception = {
  message: string option }[@@ocaml.doc
                            "An error occurred during the tagging operation. Retry your request.\n"]
type nonrec waf_subscription_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "You tried to use a managed rule group that's available by subscription, but you aren't subscribed to it yet. \n"]
type nonrec waf_service_linked_role_error_exception =
  {
  message: string option }[@@ocaml.doc
                            "WAF is not able to access the service linked role. This can be caused by a previous [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. Please try your request again. The service linked role can also be locked by a previous [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you recently made a call to [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. If you receive this same exception again, you will have to wait additional time until the role is unlocked.\n"]
type nonrec waf_optimistic_lock_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t save your changes because you tried to update or delete a resource that has changed since you last retrieved it. Get the resource again, make any changes you need to make to the new copy, and retry your operation. \n"]
type nonrec waf_nonexistent_item_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform the operation because your resource doesn't exist. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate. \n"]
type nonrec waf_log_destination_permission_issue_exception =
  {
  message: string option }[@@ocaml.doc
                            "The operation failed because you don't have the permissions that your logging configuration requires. For information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n"]
type nonrec waf_limits_exceeded_exception =
  {
  source_type: string option ;
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform the operation because you exceeded your resource limit. For example, the maximum number of [WebACL] objects that you can create for an Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.\n"]
type nonrec waf_invalid_resource_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform the operation because the resource that you requested isn\226\128\153t valid. Check the resource, and try again.\n"]
type nonrec waf_invalid_permission_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "The operation failed because the specified policy isn't in the proper format. \n\n The policy specifications must conform to the following:\n \n  {ul\n        {-  The policy must be composed using IAM Policy version 2012-10-17.\n            \n             }\n        {-  The policy must include specifications for [Effect], [Action], and [Principal].\n            \n             }\n        {-   [Effect] must specify [Allow].\n            \n             }\n        {-   [Action] must specify [wafv2:CreateWebACL], [wafv2:UpdateWebACL], and [wafv2:PutFirewallManagerRuleGroups] and may optionally specify [wafv2:GetRuleGroup]. WAF rejects any extra actions or wildcard actions in the policy.\n            \n             }\n        {-  The policy must not include a [Resource] parameter.\n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}. \n   "]
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
  | WEB_ACL [@@ocaml.doc ""]
type nonrec waf_invalid_parameter_exception =
  {
  reason: string option ;
  parameter: string option ;
  field: parameter_exception_field option ;
  message: string option }[@@ocaml.doc
                            "The operation failed because WAF didn't recognize a parameter in the request. For example: \n\n {ul\n       {-  You specified a parameter name or value that isn't valid.\n           \n            }\n       {-  Your nested statement isn't valid. You might have tried to nest a statement that can\226\128\153t be nested. \n           \n            }\n       {-  You tried to update a [WebACL] with a [DefaultAction] that isn't among the types available at [DefaultAction].\n           \n            }\n       {-  Your request references an ARN that is malformed, or corresponds to a resource with which a web ACL can't be associated.\n           \n            }\n       }\n  "]
type nonrec waf_invalid_operation_exception = {
  message: string option }[@@ocaml.doc "The operation isn't valid. \n"]
type nonrec waf_internal_error_exception = {
  message: string option }[@@ocaml.doc
                            "Your request is valid, but WAF couldn\226\128\153t perform the operation because of a system problem. Retry your request. \n"]
type nonrec waf_expired_managed_rule_group_version_exception =
  {
  message: string option }[@@ocaml.doc
                            "The operation failed because the specified version for the managed rule group has expired. You can retrieve the available versions for the managed rule group by calling [ListAvailableManagedRuleGroupVersions].\n"]
type nonrec waf_duplicate_item_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform the operation because the resource that you tried to save is a duplicate of an existing one.\n"]
type nonrec waf_configuration_warning_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because you are inspecting the web request body, headers, or cookies without specifying how to handle oversize components. Rules that inspect the body must either provide an [OversizeHandling] configuration or they must be preceded by a [SizeConstraintStatement] that blocks the body content from being too large. Rules that inspect the headers or cookies must provide an [OversizeHandling] configuration. \n\n Provide the handling configuration and retry your operation.\n \n  Alternately, you can suppress this warning by adding the following tag to the resource that you provide to this operation: [Tag] (key:[WAF:OversizeFieldsHandlingConstraintOptOut], value:[true]).\n  "]
type nonrec waf_associated_item_exception = {
  message: string option }[@@ocaml.doc
                            "WAF couldn\226\128\153t perform the operation because your resource is being used by another resource or it\226\128\153s associated with another resource. \n"]
type nonrec version_to_publish =
  {
  forecasted_lifetime: int option ;
  associated_rule_group_arn: string option }[@@ocaml.doc
                                              "A version of the named managed rule group, that the rule group's vendor publishes for use by customers. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec versions_to_publish = (string * version_to_publish) list[@@ocaml.doc
                                                                    ""]
type nonrec update_web_acl_response = {
  next_lock_token: string option }[@@ocaml.doc ""]
type nonrec scope =
  | REGIONAL 
  | CLOUDFRONT [@@ocaml.doc ""]
type nonrec update_web_acl_request =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: custom_response_bodies option ;
  lock_token: string ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  default_action: default_action ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec update_rule_group_response = {
  next_lock_token: string option }[@@ocaml.doc ""]
type nonrec update_rule_group_request =
  {
  custom_response_bodies: custom_response_bodies option ;
  lock_token: string ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec update_regex_pattern_set_response =
  {
  next_lock_token: string option }[@@ocaml.doc ""]
type nonrec regex = {
  regex_string: string option }[@@ocaml.doc
                                 "A single regular expression. This is used in a [RegexPatternSet].\n"]
type nonrec update_regex_pattern_set_request =
  {
  lock_token: string ;
  regular_expression_list: regex list ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec update_managed_rule_set_version_expiry_date_response =
  {
  next_lock_token: string option ;
  expiry_timestamp: CoreTypes.Timestamp.t option ;
  expiring_version: string option }[@@ocaml.doc ""]
type nonrec update_managed_rule_set_version_expiry_date_request =
  {
  expiry_timestamp: CoreTypes.Timestamp.t ;
  version_to_expire: string ;
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec update_ip_set_response = {
  next_lock_token: string option }[@@ocaml.doc ""]
type nonrec update_ip_set_request =
  {
  lock_token: string ;
  addresses: string list ;
  description: string option ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec time_window =
  {
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       "In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time range for which you want WAF to return a sample of web requests.\n\n You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous three hours.\n \n  In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the time range for which WAF actually returned a sample of web requests. WAF gets the specified number of requests from among the first 5,000 requests that your Amazon Web Services resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, WAF stops sampling after the 5,000th request. In that case, [EndTime] is the time that WAF received the 5,000th request.\n  "]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec tag_info_for_resource =
  {
  tag_list: tag list option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  "The collection of tagging definitions for an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
type nonrec http_header = {
  value: string option ;
  name: string option }[@@ocaml.doc
                         "Part of the response from [GetSampledRequests]. This is a complex type that appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all of the headers that appear in one of the web requests. \n"]
type nonrec http_request =
  {
  headers: http_header list option ;
  http_version: string option ;
  method_: string option ;
  ur_i: string option ;
  country: string option ;
  client_i_p: string option }[@@ocaml.doc
                               "Part of the response from [GetSampledRequests]. This is a complex type that appears as [Request] in the response syntax. [HTTPRequest] contains information about one of the web requests. \n"]
type nonrec failure_reason =
  | TOKEN_DOMAIN_MISMATCH 
  | TOKEN_INVALID 
  | TOKEN_EXPIRED 
  | TOKEN_MISSING [@@ocaml.doc ""]
type nonrec captcha_response =
  {
  failure_reason: failure_reason option ;
  solve_timestamp: int option ;
  response_code: int option }[@@ocaml.doc
                               "The result from the inspection of the web request for a valid [CAPTCHA] token. \n"]
type nonrec challenge_response =
  {
  failure_reason: failure_reason option ;
  solve_timestamp: int option ;
  response_code: int option }[@@ocaml.doc
                               "The result from the inspection of the web request for a valid challenge token. \n"]
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
  timestamp_: CoreTypes.Timestamp.t option ;
  weight: int ;
  request: http_request }[@@ocaml.doc
                           "Represents a single sampled web request. The response from [GetSampledRequests] includes a [SampledHTTPRequests] complex type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains an array of [SampledHTTPRequest] objects.\n"]
type nonrec rule_summary = {
  action: rule_action option ;
  name: string option }[@@ocaml.doc
                         "High-level information about a [Rule], returned by operations like [DescribeManagedRuleGroup]. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].\n"]
type nonrec rule_group_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "High-level information about a [RuleGroup], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].\n"]
type nonrec label_summary = {
  name: string option }[@@ocaml.doc
                         "List of labels used by one or more of the rules of a [RuleGroup]. This summary object is used for the following rule group lists: \n\n {ul\n       {-   [AvailableLabels] - Labels that rules add to matching requests. These labels are defined in the [RuleLabels] for a [Rule]. \n           \n            }\n       {-   [ConsumedLabels] - Labels that rules match against. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule. \n           \n            }\n       }\n  "]
type nonrec rule_group =
  {
  consumed_labels: label_summary list option ;
  available_labels: label_summary list option ;
  custom_response_bodies: custom_response_bodies option ;
  label_namespace: string option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  ar_n: string ;
  capacity: int ;
  id: string ;
  name: string }[@@ocaml.doc
                  " A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n"]
type nonrec resource_type =
  | VERIFIED_ACCESS_INSTANCE 
  | APP_RUNNER_SERVICE 
  | COGNITIO_USER_POOL 
  | APPSYNC 
  | API_GATEWAY 
  | APPLICATION_LOAD_BALANCER [@@ocaml.doc ""]
type nonrec release_summary =
  {
  timestamp_: CoreTypes.Timestamp.t option ;
  release_version: string option }[@@ocaml.doc
                                    "High level information for an SDK release. \n"]
type nonrec regex_pattern_set_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "High-level information about a [RegexPatternSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RegexPatternSet], and the ARN, that you provide to the [RegexPatternSetReferenceStatement] to use the pattern set in a [Rule].\n"]
type nonrec regex_pattern_set =
  {
  regular_expression_list: regex list option ;
  description: string option ;
  ar_n: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "Contains one or more regular expressions. \n\n WAF assigns an ARN to each [RegexPatternSet] that you create. To use a set in a rule, you provide the ARN to the [Rule] statement [RegexPatternSetReferenceStatement]. \n "]
type nonrec ip_address_version =
  | IPV6 
  | IPV4 [@@ocaml.doc ""]
type nonrec rate_based_statement_managed_keys_ip_set =
  {
  addresses: string list option ;
  ip_address_version: ip_address_version option }[@@ocaml.doc
                                                   "The set of IP addresses that are currently blocked for a [RateBasedStatement]. This is only available for rate-based rules that aggregate on just the IP address, with the [AggregateKeyType] set to [IP] or [FORWARDED_IP].\n\n A rate-based rule applies its rule action to requests from IP addresses that are in the rule's managed keys list and that match the rule's scope-down statement. When a rule has no scope-down statement, it applies the action to all requests from the IP addresses that are in the list. The rule applies its rule action to rate limit the matching requests. The action is usually Block but it can be any valid rule action except for Allow. \n \n  The maximum number of IP addresses that can be rate limited by a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, WAF limits those with the highest rates. \n  "]
type nonrec put_permission_policy_response = unit
type nonrec put_permission_policy_request =
  {
  policy: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec put_managed_rule_set_versions_response =
  {
  next_lock_token: string option }[@@ocaml.doc ""]
type nonrec put_managed_rule_set_versions_request =
  {
  versions_to_publish: versions_to_publish option ;
  recommended_version: string option ;
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec filter_behavior =
  | DROP 
  | KEEP [@@ocaml.doc ""]
type nonrec filter_requirement =
  | MEETS_ANY 
  | MEETS_ALL [@@ocaml.doc ""]
type nonrec action_value =
  | EXCLUDED_AS_COUNT 
  | CHALLENGE 
  | CAPTCHA 
  | COUNT 
  | BLOCK 
  | ALLOW [@@ocaml.doc ""]
type nonrec action_condition = {
  action: action_value }[@@ocaml.doc
                          "A single action condition for a [Condition] in a logging filter.\n"]
type nonrec label_name_condition = {
  label_name: string }[@@ocaml.doc
                        "A single label name condition for a [Condition] in a logging filter.\n"]
type nonrec condition =
  {
  label_name_condition: label_name_condition option ;
  action_condition: action_condition option }[@@ocaml.doc
                                               "A single match condition for a [Filter].\n"]
type nonrec filter =
  {
  conditions: condition list ;
  requirement: filter_requirement ;
  behavior: filter_behavior }[@@ocaml.doc
                               "A single logging filter, used in [LoggingFilter]. \n"]
type nonrec logging_filter =
  {
  default_behavior: filter_behavior ;
  filters: filter list }[@@ocaml.doc
                          "Filtering that specifies which web requests are kept in the logs and which are dropped, defined for a web ACL's [LoggingConfiguration]. \n\n You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation. \n "]
type nonrec log_type =
  | WAF_LOGS [@@ocaml.doc ""]
type nonrec log_scope =
  | SECURITY_LAKE 
  | CUSTOMER [@@ocaml.doc ""]
type nonrec logging_configuration =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  logging_filter: logging_filter option ;
  managed_by_firewall_manager: bool option ;
  redacted_fields: field_to_match list option ;
  log_destination_configs: string list ;
  resource_arn: string }[@@ocaml.doc
                          "Defines an association between logging destinations and a web ACL resource, for logging from WAF. As part of the association, you can specify parts of the standard logging fields to keep out of the logs and you can specify filters so that you log only a subset of the logging records. \n\n  You can define one logging destination per web ACL.\n  \n    You can access information about the traffic that WAF inspects using the following steps:\n    \n     {ol\n           {-  Create your logging destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. \n               \n                The name that you give the destination must start with [aws-waf-logs-]. Depending on the type of destination, you might need to configure additional settings or permissions. \n                \n                 For configuration requirements and pricing information for each destination type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic} in the {i WAF Developer Guide}.\n                 \n                  }\n           {-  Associate your logging destination to your web ACL using a [PutLoggingConfiguration] request.\n               \n                }\n           }\n   When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates an additional role or policy that is required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a service-linked role.\n   \n    For additional information about web ACL logging, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n    "]
type nonrec put_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }[@@ocaml.doc ""]
type nonrec put_logging_configuration_request =
  {
  logging_configuration: logging_configuration }[@@ocaml.doc ""]
type nonrec managed_rule_set_version =
  {
  expiry_timestamp: CoreTypes.Timestamp.t option ;
  last_update_timestamp: CoreTypes.Timestamp.t option ;
  publish_timestamp: CoreTypes.Timestamp.t option ;
  forecasted_lifetime: int option ;
  capacity: int option ;
  associated_rule_group_arn: string option }[@@ocaml.doc
                                              "Information for a single version of a managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec published_versions = (string * managed_rule_set_version) list
[@@ocaml.doc ""]
type nonrec platform =
  | ANDROID 
  | IOS [@@ocaml.doc ""]
type nonrec mobile_sdk_release =
  {
  tags: tag list option ;
  release_notes: string option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  release_version: string option }[@@ocaml.doc
                                    "Information for a release of the mobile SDK, including release notes and tags.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
type nonrec managed_rule_set_summary =
  {
  label_namespace: string option ;
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "High-level information for a managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec managed_rule_set =
  {
  label_namespace: string option ;
  recommended_version: string option ;
  published_versions: published_versions option ;
  description: string option ;
  ar_n: string ;
  id: string ;
  name: string }[@@ocaml.doc
                  "A set of rules that is managed by Amazon Web Services and Amazon Web Services Marketplace sellers to provide versioned managed rule groups for customers of WAF.\n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec managed_rule_group_version =
  {
  last_update_timestamp: CoreTypes.Timestamp.t option ;
  name: string option }[@@ocaml.doc
                         "Describes a single version of a managed rule group. \n"]
type nonrec managed_rule_group_summary =
  {
  description: string option ;
  versioning_supported: bool option ;
  name: string option ;
  vendor_name: string option }[@@ocaml.doc
                                "High-level information about a managed rule group, returned by [ListAvailableManagedRuleGroups]. This provides information like the name and vendor name, that you provide when you add a [ManagedRuleGroupStatement] to a web ACL. Managed rule groups include Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. To use any Amazon Web Services Marketplace managed rule group, first subscribe to the rule group through Amazon Web Services Marketplace. \n"]
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
  vendor_name: string option }[@@ocaml.doc
                                "The properties of a managed product, such as an Amazon Web Services Managed Rules rule group or an Amazon Web Services Marketplace managed rule group. \n"]
type nonrec list_web_ac_ls_response =
  {
  web_ac_ls: web_acl_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_web_ac_ls_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tag_info_for_resource: tag_info_for_resource option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string ;
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rule_groups_response =
  {
  rule_groups: rule_group_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_resources_for_web_acl_response =
  {
  resource_arns: string list option }[@@ocaml.doc ""]
type nonrec list_resources_for_web_acl_request =
  {
  resource_type: resource_type option ;
  web_acl_arn: string }[@@ocaml.doc ""]
type nonrec list_regex_pattern_sets_response =
  {
  regex_pattern_sets: regex_pattern_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_regex_pattern_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_mobile_sdk_releases_response =
  {
  next_marker: string option ;
  release_summaries: release_summary list option }[@@ocaml.doc ""]
type nonrec list_mobile_sdk_releases_request =
  {
  limit: int option ;
  next_marker: string option ;
  platform: platform }[@@ocaml.doc ""]
type nonrec list_managed_rule_sets_response =
  {
  managed_rule_sets: managed_rule_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_managed_rule_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_logging_configurations_response =
  {
  next_marker: string option ;
  logging_configurations: logging_configuration list option }[@@ocaml.doc ""]
type nonrec list_logging_configurations_request =
  {
  log_scope: log_scope option ;
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec ip_set_summary =
  {
  ar_n: string option ;
  lock_token: string option ;
  description: string option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "High-level information about an [IPSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage an [IPSet], and the ARN, that you provide to the [IPSetReferenceStatement] to use the address set in a [Rule].\n"]
type nonrec list_ip_sets_response =
  {
  ip_sets: ip_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_ip_sets_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_available_managed_rule_groups_response =
  {
  managed_rule_groups: managed_rule_group_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_available_managed_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec list_available_managed_rule_group_versions_response =
  {
  current_default_version: string option ;
  versions: managed_rule_group_version list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_available_managed_rule_group_versions_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope ;
  name: string ;
  vendor_name: string }[@@ocaml.doc ""]
type nonrec api_key_summary =
  {
  version: int option ;
  creation_timestamp: CoreTypes.Timestamp.t option ;
  api_key: string option ;
  token_domains: string list option }[@@ocaml.doc
                                       "Information for a single API key. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
type nonrec list_api_keys_response =
  {
  application_integration_ur_l: string option ;
  api_key_summaries: api_key_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_api_keys_request =
  {
  limit: int option ;
  next_marker: string option ;
  scope: scope }[@@ocaml.doc ""]
type nonrec ip_set =
  {
  addresses: string list ;
  ip_address_version: ip_address_version ;
  description: string option ;
  ar_n: string ;
  id: string ;
  name: string }[@@ocaml.doc
                  "Contains zero or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0. For information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}. \n\n WAF assigns an ARN to each [IPSet] that you create. To use an IP set in a rule, you provide the ARN to the [Rule] statement [IPSetReferenceStatement]. \n "]
type nonrec get_web_acl_response =
  {
  application_integration_ur_l: string option ;
  lock_token: string option ;
  web_ac_l: web_ac_l option }[@@ocaml.doc ""]
type nonrec get_web_acl_request = {
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec get_web_acl_for_resource_response = {
  web_ac_l: web_ac_l option }[@@ocaml.doc ""]
type nonrec get_web_acl_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_sampled_requests_response =
  {
  time_window: time_window option ;
  population_size: int option ;
  sampled_requests: sampled_http_request list option }[@@ocaml.doc ""]
type nonrec get_sampled_requests_request =
  {
  max_items: int ;
  time_window: time_window ;
  scope: scope ;
  rule_metric_name: string ;
  web_acl_arn: string }[@@ocaml.doc ""]
type nonrec get_rule_group_response =
  {
  lock_token: string option ;
  rule_group: rule_group option }[@@ocaml.doc ""]
type nonrec get_rule_group_request =
  {
  ar_n: string option ;
  id: string option ;
  scope: scope option ;
  name: string option }[@@ocaml.doc ""]
type nonrec get_regex_pattern_set_response =
  {
  lock_token: string option ;
  regex_pattern_set: regex_pattern_set option }[@@ocaml.doc ""]
type nonrec get_regex_pattern_set_request =
  {
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec get_rate_based_statement_managed_keys_response =
  {
  managed_keys_ip_v6: rate_based_statement_managed_keys_ip_set option ;
  managed_keys_ip_v4: rate_based_statement_managed_keys_ip_set option }
[@@ocaml.doc ""]
type nonrec get_rate_based_statement_managed_keys_request =
  {
  rule_name: string ;
  rule_group_rule_name: string option ;
  web_acl_id: string ;
  web_acl_name: string ;
  scope: scope }[@@ocaml.doc ""]
type nonrec get_permission_policy_response = {
  policy: string option }[@@ocaml.doc ""]
type nonrec get_permission_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_mobile_sdk_release_response =
  {
  mobile_sdk_release: mobile_sdk_release option }[@@ocaml.doc ""]
type nonrec get_mobile_sdk_release_request =
  {
  release_version: string ;
  platform: platform }[@@ocaml.doc ""]
type nonrec get_managed_rule_set_response =
  {
  lock_token: string option ;
  managed_rule_set: managed_rule_set option }[@@ocaml.doc ""]
type nonrec get_managed_rule_set_request =
  {
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec get_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }[@@ocaml.doc ""]
type nonrec get_logging_configuration_request =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_ip_set_response =
  {
  lock_token: string option ;
  ip_set: ip_set option }[@@ocaml.doc ""]
type nonrec get_ip_set_request = {
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec get_decrypted_api_key_response =
  {
  creation_timestamp: CoreTypes.Timestamp.t option ;
  token_domains: string list option }[@@ocaml.doc ""]
type nonrec get_decrypted_api_key_request = {
  api_key: string ;
  scope: scope }[@@ocaml.doc ""]
type nonrec generate_mobile_sdk_release_url_response = {
  url: string option }[@@ocaml.doc ""]
type nonrec generate_mobile_sdk_release_url_request =
  {
  release_version: string ;
  platform: platform }[@@ocaml.doc ""]
type nonrec disassociate_web_acl_response = unit
type nonrec disassociate_web_acl_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec describe_managed_rule_group_response =
  {
  consumed_labels: label_summary list option ;
  available_labels: label_summary list option ;
  label_namespace: string option ;
  rules: rule_summary list option ;
  capacity: int option ;
  sns_topic_arn: string option ;
  version_name: string option }[@@ocaml.doc ""]
type nonrec describe_managed_rule_group_request =
  {
  version_name: string option ;
  scope: scope ;
  name: string ;
  vendor_name: string }[@@ocaml.doc ""]
type nonrec describe_managed_products_by_vendor_response =
  {
  managed_products: managed_product_descriptor list option }[@@ocaml.doc ""]
type nonrec describe_managed_products_by_vendor_request =
  {
  scope: scope ;
  vendor_name: string }[@@ocaml.doc ""]
type nonrec describe_all_managed_products_response =
  {
  managed_products: managed_product_descriptor list option }[@@ocaml.doc ""]
type nonrec describe_all_managed_products_request = {
  scope: scope }[@@ocaml.doc ""]
type nonrec delete_web_acl_response = unit
type nonrec delete_web_acl_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec delete_rule_group_response = unit
type nonrec delete_rule_group_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec delete_regex_pattern_set_response = unit
type nonrec delete_regex_pattern_set_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec delete_permission_policy_response = unit
type nonrec delete_permission_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_logging_configuration_response = unit
type nonrec delete_logging_configuration_request =
  {
  log_scope: log_scope option ;
  log_type: log_type option ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_ip_set_response = unit
type nonrec delete_ip_set_request =
  {
  lock_token: string ;
  id: string ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec delete_firewall_manager_rule_groups_response =
  {
  next_web_acl_lock_token: string option }[@@ocaml.doc ""]
type nonrec delete_firewall_manager_rule_groups_request =
  {
  web_acl_lock_token: string ;
  web_acl_arn: string }[@@ocaml.doc ""]
type nonrec delete_api_key_response = unit
type nonrec delete_api_key_request = {
  api_key: string ;
  scope: scope }[@@ocaml.doc ""]
type nonrec create_web_acl_response = {
  summary: web_acl_summary option }[@@ocaml.doc ""]
type nonrec create_web_acl_request =
  {
  association_config: association_config option ;
  token_domains: string list option ;
  challenge_config: challenge_config option ;
  captcha_config: captcha_config option ;
  custom_response_bodies: custom_response_bodies option ;
  tags: tag list option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  default_action: default_action ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec create_rule_group_response =
  {
  summary: rule_group_summary option }[@@ocaml.doc ""]
type nonrec create_rule_group_request =
  {
  custom_response_bodies: custom_response_bodies option ;
  tags: tag list option ;
  visibility_config: visibility_config ;
  rules: rule list option ;
  description: string option ;
  capacity: int ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_response =
  {
  summary: regex_pattern_set_summary option }[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_request =
  {
  tags: tag list option ;
  regular_expression_list: regex list ;
  description: string option ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec create_ip_set_response = {
  summary: ip_set_summary option }[@@ocaml.doc ""]
type nonrec create_ip_set_request =
  {
  tags: tag list option ;
  addresses: string list ;
  ip_address_version: ip_address_version ;
  description: string option ;
  scope: scope ;
  name: string }[@@ocaml.doc ""]
type nonrec create_api_key_response = {
  api_key: string option }[@@ocaml.doc ""]
type nonrec create_api_key_request =
  {
  token_domains: string list ;
  scope: scope }[@@ocaml.doc ""]
type nonrec check_capacity_response = {
  capacity: int option }[@@ocaml.doc ""]
type nonrec check_capacity_request = {
  rules: rule list ;
  scope: scope }[@@ocaml.doc ""]
type nonrec associate_web_acl_response = unit
type nonrec associate_web_acl_request =
  {
  resource_arn: string ;
  web_acl_arn: string }[@@ocaml.doc ""]