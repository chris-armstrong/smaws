(** 
    WAFV2 client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec single_header =
  {
  name: string [@ocaml.doc "The name of the query header to inspect.\n"]}
[@@ocaml.doc
  "Inspect one of the headers in the web request, identified by name, for example, [User-Agent] or [Referer]. The name isn't case sensitive.\n\n You can filter and inspect all headers with the [FieldToMatch] setting [Headers].\n \n  This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n  \n   Example JSON: [\"SingleHeader\": { \"Name\": \"haystack\" }] \n   "]
type nonrec single_query_argument =
  {
  name: string [@ocaml.doc "The name of the query argument to inspect.\n"]}
[@@ocaml.doc
  "Inspect one query argument in the web request, identified by name, for example {i UserName} or {i SalesRegion}. The name isn't case sensitive. \n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Example JSON: [\"SingleQueryArgument\": { \"Name\": \"myArgument\" }] \n  "]
type nonrec oversize_handling =
  | NO_MATCH [@ocaml.doc ""]
  | MATCH [@ocaml.doc ""]
  | CONTINUE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec body =
  {
  oversize_handling: oversize_handling option
    [@ocaml.doc
      "What WAF should do if the body is larger than WAF can inspect. \n\n WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection. \n \n  {ul\n        {-  For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n            \n             }\n        {-  For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees. \n            \n             }\n        {-  For Amplify, use the CloudFront limit.\n            \n             }\n        }\n   The options for oversize handling are the following:\n   \n    {ul\n          {-   [CONTINUE] - Inspect the available body contents normally, according to the rule inspection criteria. \n              \n               }\n          {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n              \n               }\n          {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n              \n               }\n          }\n   You can combine the [MATCH] or [NO_MATCH] settings for oversize handling with your rule and web ACL action settings, so that you block any request whose body is over the limit. \n   \n    Default: [CONTINUE] \n    "]}
[@@ocaml.doc
  "Inspect the body of the web request. The body immediately follows the request headers.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n "]
type nonrec json_match_pattern =
  {
  included_paths: string list option
    [@ocaml.doc
      "Match only the specified include paths. See also [MatchScope] in [JsonBody]. \n\n Provide the include paths using JSON Pointer syntax. For example, [\"IncludedPaths\":\n            \\[\"/dogs/0/name\", \"/dogs/1/name\"\\]]. For information about this syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n \n  You must specify either this setting or the [All] setting, but not both.\n  \n    Don't use this option to include all paths. Instead, use the [All] setting. \n    \n     "];
  all: unit option
    [@ocaml.doc
      "Match all of the elements. See also [MatchScope] in [JsonBody]. \n\n You must specify either this setting or the [IncludedPaths] setting, but not both.\n "]}
[@@ocaml.doc
  "The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against the rule inspection criteria. This is used with the [FieldToMatch] option [JsonBody]. \n"]
type nonrec json_match_scope =
  | VALUE [@ocaml.doc ""]
  | KEY [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec body_parsing_fallback_behavior =
  | EVALUATE_AS_STRING [@ocaml.doc ""]
  | NO_MATCH [@ocaml.doc ""]
  | MATCH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec json_body =
  {
  oversize_handling: oversize_handling option
    [@ocaml.doc
      "What WAF should do if the body is larger than WAF can inspect. \n\n WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection. \n \n  {ul\n        {-  For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n            \n             }\n        {-  For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees. \n            \n             }\n        {-  For Amplify, use the CloudFront limit.\n            \n             }\n        }\n   The options for oversize handling are the following:\n   \n    {ul\n          {-   [CONTINUE] - Inspect the available body contents normally, according to the rule inspection criteria. \n              \n               }\n          {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n              \n               }\n          {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n              \n               }\n          }\n   You can combine the [MATCH] or [NO_MATCH] settings for oversize handling with your rule and web ACL action settings, so that you block any request whose body is over the limit. \n   \n    Default: [CONTINUE] \n    "];
  invalid_fallback_behavior: body_parsing_fallback_behavior option
    [@ocaml.doc
      "What WAF should do if it fails to completely parse the JSON body. The options are the following:\n\n {ul\n       {-   [EVALUATE_AS_STRING] - Inspect the body as plain text. WAF applies the text transformations and inspection criteria that you defined for the JSON inspection to the body text string.\n           \n            }\n       {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n           \n            }\n       {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n           \n            }\n       }\n   If you don't provide this setting, WAF parses and evaluates the content only up to the first parsing failure that it encounters. \n   \n     WAF parsing doesn't fully validate the input JSON string, so parsing can succeed even for invalid JSON. When parsing succeeds, WAF doesn't apply the fallback behavior. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body}JSON body} in the {i WAF Developer Guide}.\n     \n      "];
  match_scope: json_match_scope
    [@ocaml.doc
      "The parts of the JSON to match against using the [MatchPattern]. If you specify [ALL], WAF matches against keys and values. \n\n  [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values. \n "];
  match_pattern: json_match_pattern
    [@ocaml.doc
      "The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against the rule inspection criteria. \n"]}
[@@ocaml.doc
  "Inspect the body of the web request as JSON. The body immediately follows the request headers. \n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Use the specifications in this object to indicate which parts of the JSON body to inspect using the rule's inspection criteria. WAF inspects only the parts of the JSON that result from the matches that you indicate. \n  \n   Example JSON: [\"JsonBody\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"ALL\"\n            }] \n   \n    For additional information about this request component option, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body}JSON body} in the {i WAF Developer Guide}.\n    "]
type nonrec header_match_pattern =
  {
  excluded_headers: string list option
    [@ocaml.doc
      "Inspect only the headers whose keys don't match any of the strings specified here. \n"];
  included_headers: string list option
    [@ocaml.doc
      "Inspect only the headers that have a key that matches one of the strings specified here. \n"];
  all: unit option [@ocaml.doc "Inspect all headers. \n"]}[@@ocaml.doc
                                                            "The filter to use to identify the subset of headers to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedHeaders], or [ExcludedHeaders].\n \n  Example JSON: [\"MatchPattern\": { \"ExcludedHeaders\": \\[ \"KeyToExclude1\", \"KeyToExclude2\" \\] }] \n  "]
type nonrec map_match_scope =
  | VALUE [@ocaml.doc ""]
  | KEY [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec headers =
  {
  oversize_handling: oversize_handling
    [@ocaml.doc
      "What WAF should do if the headers determined by your match scope are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200 headers and at most 8 KB of header contents to WAF. \n\n The options for oversize handling are the following:\n \n  {ul\n        {-   [CONTINUE] - Inspect the available headers normally, according to the rule inspection criteria. \n            \n             }\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "];
  match_scope: map_match_scope
    [@ocaml.doc
      "The parts of the headers to match with the rule inspection criteria. If you specify [ALL], WAF inspects both keys and values. \n\n  [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values. \n "];
  match_pattern: header_match_pattern
    [@ocaml.doc
      "The filter to use to identify the subset of headers to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedHeaders], or [ExcludedHeaders].\n \n  Example JSON: [\"MatchPattern\": { \"ExcludedHeaders\": \\[ \"KeyToExclude1\", \"KeyToExclude2\" \\] }] \n  "]}
[@@ocaml.doc
  "Inspect all headers in the web request. You can specify the parts of the headers to inspect and you can narrow the set of headers to inspect by including or excluding specific keys.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  If you want to inspect just the value of a single header, use the [SingleHeader] [FieldToMatch] setting instead.\n  \n   Example JSON: [\"Headers\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"KEY\",\n            \"OversizeHandling\": \"MATCH\" }] \n   "]
type nonrec cookie_match_pattern =
  {
  excluded_cookies: string list option
    [@ocaml.doc
      "Inspect only the cookies whose keys don't match any of the strings specified here. \n"];
  included_cookies: string list option
    [@ocaml.doc
      "Inspect only the cookies that have a key that matches one of the strings specified here. \n"];
  all: unit option [@ocaml.doc "Inspect all cookies. \n"]}[@@ocaml.doc
                                                            "The filter to use to identify the subset of cookies to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedCookies], or [ExcludedCookies].\n \n  Example JSON: [\"MatchPattern\": { \"IncludedCookies\": \\[ \"session-id-time\", \"session-id\" \\] }] \n  "]
type nonrec cookies =
  {
  oversize_handling: oversize_handling
    [@ocaml.doc
      "What WAF should do if the cookies of the request are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request cookies when they exceed 8 KB (8192 bytes) or 200 total cookies. The underlying host service forwards a maximum of 200 cookies and at most 8 KB of cookie contents to WAF. \n\n The options for oversize handling are the following:\n \n  {ul\n        {-   [CONTINUE] - Inspect the available cookies normally, according to the rule inspection criteria. \n            \n             }\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "];
  match_scope: map_match_scope
    [@ocaml.doc
      "The parts of the cookies to inspect with the rule inspection criteria. If you specify [ALL], WAF inspects both keys and values. \n\n  [All] does not require a match to be found in the keys and a match to be found in the values. It requires a match to be found in the keys or the values or both. To require a match in the keys and in the values, use a logical [AND] statement to combine two match rules, one that inspects the keys and another that inspects the values. \n "];
  match_pattern: cookie_match_pattern
    [@ocaml.doc
      "The filter to use to identify the subset of cookies to inspect in a web request. \n\n You must specify exactly one setting: either [All], [IncludedCookies], or [ExcludedCookies].\n \n  Example JSON: [\"MatchPattern\": { \"IncludedCookies\": \\[ \"session-id-time\", \"session-id\" \\] }] \n  "]}
[@@ocaml.doc
  "Inspect the cookies in the web request. You can specify the parts of the cookies to inspect and you can narrow the set of cookies to inspect by including or excluding specific keys.\n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Example JSON: [\"Cookies\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"KEY\",\n            \"OversizeHandling\": \"MATCH\" }] \n  "]
type nonrec header_order =
  {
  oversize_handling: oversize_handling
    [@ocaml.doc
      "What WAF should do if the headers determined by your match scope are more numerous or larger than WAF can inspect. WAF does not support inspecting the entire contents of request headers when they exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200 headers and at most 8 KB of header contents to WAF. \n\n The options for oversize handling are the following:\n \n  {ul\n        {-   [CONTINUE] - Inspect the available headers normally, according to the rule inspection criteria. \n            \n             }\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Inspect a string containing the list of the request's header names, ordered as they appear in the web request that WAF receives for inspection. WAF generates the string and then uses that as the field to match component in its inspection. WAF separates the header names in the string using colons and no added spaces, for example [host:user-agent:accept:authorization:referer].\n"]
type nonrec fallback_behavior =
  | NO_MATCH [@ocaml.doc ""]
  | MATCH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ja3_fingerprint =
  {
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if the request doesn't have a JA3 fingerprint. \n\n You can specify the following fallback behaviors:\n \n  {ul\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.\n\n  You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n  \n    You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n    \n     Provide the JA3 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.\n     "]
type nonrec ja4_fingerprint =
  {
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if the request doesn't have a JA4 fingerprint. \n\n You can specify the following fallback behaviors:\n \n  {ul\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA4 fingerprint. The JA4 fingerprint is a 36-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.\n\n  You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n  \n    You can obtain the JA4 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n    \n     Provide the JA4 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.\n     "]
type nonrec uri_fragment =
  {
  fallback_behavior: fallback_behavior option
    [@ocaml.doc
      "What WAF should do if it fails to completely parse the JSON body. The options are the following:\n\n {ul\n       {-   [EVALUATE_AS_STRING] - Inspect the body as plain text. WAF applies the text transformations and inspection criteria that you defined for the JSON inspection to the body text string.\n           \n            }\n       {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n           \n            }\n       {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n           \n            }\n       }\n   If you don't provide this setting, WAF parses and evaluates the content only up to the first parsing failure that it encounters. \n   \n    Example JSON: [{ \"UriFragment\": { \"FallbackBehavior\": \"MATCH\"} }] \n    \n      WAF parsing doesn't fully validate the input JSON string, so parsing can succeed even for invalid JSON. When parsing succeeds, WAF doesn't apply the fallback behavior. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-fields-list.html#waf-rule-statement-request-component-json-body}JSON body} in the {i WAF Developer Guide}.\n      \n       "]}
[@@ocaml.doc
  "Inspect fragments of the request URI. You can specify the parts of the URI fragment to inspect and you can narrow the set of URI fragments to inspect by including or excluding specific keys. \n\n This is used to indicate the web request component to inspect, in the [FieldToMatch] specification. \n \n  Example JSON: [\"UriFragment\": { \"MatchPattern\": { \"All\": {} }, \"MatchScope\": \"KEY\",\n               \"OversizeHandling\": \"MATCH\" }] \n  "]
type nonrec field_to_match =
  {
  uri_fragment: uri_fragment option
    [@ocaml.doc
      "Inspect fragments of the request URI. You must configure scope and pattern matching filters in the [UriFragment] object, to define the fragment of a URI that WAF inspects. \n\n Only the first 8 KB (8192 bytes) of a request's URI fragments and only the first 200 URI fragments are forwarded to WAF for inspection by the underlying host service. You must configure how to handle any oversize URI fragment content in the [UriFragment] object. WAF applies the pattern matching filters to the cookies that it receives from the underlying host service. \n "];
  ja4_fingerprint: ja4_fingerprint option
    [@ocaml.doc
      "Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA4 fingerprint. The JA4 fingerprint is a 36-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.\n\n  You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n  \n    You can obtain the JA4 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n    \n     Provide the JA4 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.\n     "];
  ja3_fingerprint: ja3_fingerprint option
    [@ocaml.doc
      "Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS Client Hello information for the calculation. Almost all web requests include this information.\n\n  You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n  \n    You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n    \n     Provide the JA3 fingerprint string from the logs in your string match statement specification, to match with any future requests that have the same TLS configuration.\n     "];
  header_order: header_order option
    [@ocaml.doc
      "Inspect a string containing the list of the request's header names, ordered as they appear in the web request that WAF receives for inspection. WAF generates the string and then uses that as the field to match component in its inspection. WAF separates the header names in the string using colons and no added spaces, for example [host:user-agent:accept:authorization:referer].\n"];
  cookies: cookies option
    [@ocaml.doc
      "Inspect the request cookies. You must configure scope and pattern matching filters in the [Cookies] object, to define the set of cookies and the parts of the cookies that WAF inspects. \n\n Only the first 8 KB (8192 bytes) of a request's cookies and only the first 200 cookies are forwarded to WAF for inspection by the underlying host service. You must configure how to handle any oversize cookie content in the [Cookies] object. WAF applies the pattern matching filters to the cookies that it receives from the underlying host service. \n "];
  headers: headers option
    [@ocaml.doc
      "Inspect the request headers. You must configure scope and pattern matching filters in the [Headers] object, to define the set of headers to and the parts of the headers that WAF inspects. \n\n Only the first 8 KB (8192 bytes) of a request's headers and only the first 200 headers are forwarded to WAF for inspection by the underlying host service. You must configure how to handle any oversize header content in the [Headers] object. WAF applies the pattern matching filters to the headers that it receives from the underlying host service. \n "];
  json_body: json_body option
    [@ocaml.doc
      "Inspect the request body as JSON. The request body immediately follows the request headers. This is the part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. \n\n WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection. \n \n  {ul\n        {-  For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n            \n             }\n        {-  For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees. \n            \n             }\n        {-  For Amplify, use the CloudFront limit.\n            \n             }\n        }\n   For information about how to handle oversized request bodies, see the [JsonBody] object configuration. \n   "];
  method_: unit option
    [@ocaml.doc
      "Inspect the HTTP method. The method indicates the type of operation that the request is asking the origin to perform. \n"];
  body: body option
    [@ocaml.doc
      "Inspect the request body as plain text. The request body immediately follows the request headers. This is the part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. \n\n WAF does not support inspecting the entire contents of the web request body if the body exceeds the limit for the resource type. When a web request body is larger than the limit, the underlying host service only forwards the contents that are within the limit to WAF for inspection. \n \n  {ul\n        {-  For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n            \n             }\n        {-  For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the web ACL [AssociationConfig], for additional processing fees. \n            \n             }\n        {-  For Amplify, use the CloudFront limit.\n            \n             }\n        }\n   For information about how to handle oversized request bodies, see the [Body] object configuration. \n   "];
  query_string: unit option
    [@ocaml.doc
      "Inspect the query string. This is the part of a URL that appears after a [?] character, if any.\n"];
  uri_path: unit option
    [@ocaml.doc
      "Inspect the request URI path. This is the part of the web request that identifies a resource, for example, [/images/daily-ad.jpg].\n"];
  all_query_arguments: unit option
    [@ocaml.doc "Inspect all query arguments. \n"];
  single_query_argument: single_query_argument option
    [@ocaml.doc
      "Inspect a single query argument. Provide the name of the query argument to inspect, such as {i UserName} or {i SalesRegion}. The name can be up to 30 characters long and isn't case sensitive. \n\n Example JSON: [\"SingleQueryArgument\": { \"Name\": \"myArgument\" }] \n "];
  single_header: single_header option
    [@ocaml.doc
      "Inspect a single header. Provide the name of the header to inspect, for example, [User-Agent] or [Referer]. This setting isn't case sensitive.\n\n Example JSON: [\"SingleHeader\": { \"Name\": \"haystack\" }] \n \n  Alternately, you can filter and inspect all headers with the [Headers] [FieldToMatch] setting. \n  "]}
[@@ocaml.doc
  "Specifies a web request component to be used in a rule match statement or in a logging configuration. \n\n {ul\n       {-  In a rule statement, this is the part of the web request that you want WAF to inspect. Include the single [FieldToMatch] type that you want to inspect, with additional specifications as needed, according to the type. You specify a single request component in [FieldToMatch] for each rule statement that requires it. To inspect more than one component of the web request, create a separate rule statement for each component.\n           \n            Example JSON for a [QueryString] field to match: \n            \n              [ \"FieldToMatch\": { \"QueryString\": {} }] \n             \n              Example JSON for a [Method] field to match specification:\n              \n                [ \"FieldToMatch\": { \"Method\": { \"Name\": \"DELETE\" } }] \n               \n                }\n       {-  In a logging configuration, this is used in the [RedactedFields] property to specify a field to redact from the logging records. For this use case, note the following: \n           \n            {ul\n                  {-  Even though all [FieldToMatch] settings are available, the only valid settings for field redaction are [UriPath], [QueryString], [SingleHeader], and [Method].\n                      \n                       }\n                  {-  In this documentation, the descriptions of the individual fields talk about specifying the web request component to inspect, but for field redaction, you are specifying the component type to redact from the logs. \n                      \n                       }\n                  {-  If you have request sampling enabled, the redacted fields configuration for logging has no impact on sampling. You can only exclude fields from request sampling by disabling sampling in the web ACL visibility configuration or by configuring data protection for the web ACL.\n                      \n                       }\n                  \n        }\n         }\n       }\n  "]
type nonrec text_transformation_type =
  | UTF8_TO_UNICODE [@ocaml.doc ""]
  | URL_DECODE_UNI [@ocaml.doc ""]
  | BASE64_DECODE_EXT [@ocaml.doc ""]
  | REPLACE_NULLS [@ocaml.doc ""]
  | REMOVE_NULLS [@ocaml.doc ""]
  | NORMALIZE_PATH_WIN [@ocaml.doc ""]
  | NORMALIZE_PATH [@ocaml.doc ""]
  | JS_DECODE [@ocaml.doc ""]
  | CSS_DECODE [@ocaml.doc ""]
  | SQL_HEX_DECODE [@ocaml.doc ""]
  | ESCAPE_SEQ_DECODE [@ocaml.doc ""]
  | REPLACE_COMMENTS [@ocaml.doc ""]
  | MD5 [@ocaml.doc ""]
  | HEX_DECODE [@ocaml.doc ""]
  | BASE64_DECODE [@ocaml.doc ""]
  | URL_DECODE [@ocaml.doc ""]
  | CMD_LINE [@ocaml.doc ""]
  | LOWERCASE [@ocaml.doc ""]
  | HTML_ENTITY_DECODE [@ocaml.doc ""]
  | COMPRESS_WHITE_SPACE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec text_transformation =
  {
  type_: text_transformation_type
    [@ocaml.doc
      "For detailed descriptions of each of the transformation types, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-transformation.html}Text transformations} in the {i WAF Developer Guide}.\n"];
  priority: int
    [@ocaml.doc
      "Sets the relative processing order for multiple transformations. WAF processes all transformations, from lowest priority to highest, before inspecting the transformed content. The priorities don't need to be consecutive, but they must all be different. \n"]}
[@@ocaml.doc
  "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. \n"]
type nonrec xss_match_statement =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"]}
[@@ocaml.doc
  "A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into other legitimate web browsers. \n"]
type nonrec web_acl_summary =
  {
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  description: string option
    [@ocaml.doc
      "A description of the web ACL that helps with identification. \n"];
  id: string option
    [@ocaml.doc
      "The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string option
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc
  "High-level information about a [WebACL], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [WebACL], and the ARN, that you provide to operations like [AssociateWebACL].\n"]
type nonrec custom_http_header =
  {
  value: string [@ocaml.doc "The value of the custom header.\n"];
  name: string
    [@ocaml.doc
      "The name of the custom header. \n\n For custom request header insertion, when WAF inserts the header into the request, it prefixes this name [x-amzn-waf-], to avoid confusion with the headers that are already in the request. For example, for the header name [sample], WAF inserts the header [x-amzn-waf-sample].\n "]}
[@@ocaml.doc
  "A custom header for custom request and response handling. This is used in [CustomResponse] and [CustomRequestHandling].\n"]
type nonrec custom_response =
  {
  response_headers: custom_http_header list option
    [@ocaml.doc
      "The HTTP headers to use in the response. You can specify any header name except for [content-type]. Duplicate header names are not allowed.\n\n For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n "];
  custom_response_body_key: string option
    [@ocaml.doc
      "References the response body that you want WAF to return to the web request client. You can define a custom response for a rule action or a default web ACL action that is set to block. To do this, you first define the response body key and value in the [CustomResponseBodies] setting for the [WebACL] or [RuleGroup] where you want to use it. Then, in the rule action or web ACL default action [BlockAction] setting, you reference the response body using this key. \n"];
  response_code: int
    [@ocaml.doc
      "The HTTP status code to return to the client. \n\n For a list of status codes that you can use in your custom responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/customizing-the-response-status-codes.html}Supported status codes for custom response} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "A custom response to send to the client. You can define a custom response for rule actions and default web ACL actions that are set to [BlockAction]. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]
type nonrec block_action =
  {
  custom_response: custom_response option
    [@ocaml.doc
      "Defines a custom response for the web request.\n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Specifies that WAF should block the request and optionally defines additional custom handling for the response to the web request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec custom_request_handling =
  {
  insert_headers: custom_http_header list
    [@ocaml.doc
      "The HTTP headers to insert into the request. Duplicate header names are not allowed. \n\n For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Custom request handling behavior that inserts custom headers into a web request. You can add custom request handling for WAF to use when the rule action doesn't block the request. For example, [CaptchaAction] for requests with valid t okens, and [AllowAction]. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]
type nonrec allow_action =
  {
  custom_request_handling: custom_request_handling option
    [@ocaml.doc
      "Defines custom handling for the web request.\n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Specifies that WAF should allow the request and optionally defines additional custom handling for the request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec default_action =
  {
  allow: allow_action option
    [@ocaml.doc "Specifies that WAF should allow requests by default.\n"];
  block: block_action option
    [@ocaml.doc "Specifies that WAF should block requests by default. \n"]}
[@@ocaml.doc
  "In a [WebACL], this is the action that you want WAF to perform when a web request doesn't match any of the rules in the [WebACL]. The default action must be a terminating action.\n"]
type nonrec positional_constraint =
  | CONTAINS_WORD [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | EXACTLY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec byte_match_statement =
  {
  positional_constraint: positional_constraint
    [@ocaml.doc
      "The area within the portion of the web request that you want WAF to search for [SearchString]. Valid values include the following:\n\n  {b CONTAINS} \n \n  The specified part of the web request must include the value of [SearchString], but the location doesn't matter.\n  \n    {b CONTAINS_WORD} \n   \n    The specified part of the web request must include the value of [SearchString], and [SearchString] must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition, [SearchString] must be a word, which means that both of the following are true:\n    \n     {ul\n           {-   [SearchString] is at the beginning of the specified part of the web request or is preceded by a character other than an alphanumeric character or underscore (_). Examples include the value of a header and [;BadBot].\n               \n                }\n           {-   [SearchString] is at the end of the specified part of the web request or is followed by a character other than an alphanumeric character or underscore (_), for example, [BadBot;] and [-BadBot;].\n               \n                }\n           }\n    {b EXACTLY} \n   \n    The value of the specified part of the web request must exactly match the value of [SearchString].\n    \n      {b STARTS_WITH} \n     \n      The value of [SearchString] must appear at the beginning of the specified part of the web request.\n      \n        {b ENDS_WITH} \n       \n        The value of [SearchString] must appear at the end of the specified part of the web request.\n        "];
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"];
  search_string: bytes
    [@ocaml.doc
      "A string value that you want WAF to search for. WAF searches only in the part of web requests that you designate for inspection in [FieldToMatch]. The maximum length of the value is 200 bytes.\n\n Valid values depend on the component that you specify for inspection in [FieldToMatch]:\n \n  {ul\n        {-   [Method]: The HTTP method that you want WAF to search for. This indicates the type of operation specified in the request. \n            \n             }\n        {-   [UriPath]: The value that you want WAF to search for in the URI path, for example, [/images/daily-ad.jpg]. \n            \n             }\n        {-   [JA3Fingerprint]: Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's TLS configuration. You can use this choice only with a string match [ByteMatchStatement] with the [PositionalConstraint] set to [EXACTLY]. \n            \n             You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the fingerprint, it includes it in the logs. For information about the logging fields, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields} in the {i WAF Developer Guide}. \n             \n              }\n        {-   [HeaderOrder]: The list of header names to match for. WAF creates a string that contains the ordered list of header names, from the headers in the web request, and then matches against that string. \n            \n             }\n        }\n   If [SearchString] includes alphabetic characters A-Z and a-z, note that the value is case sensitive.\n   \n     {b If you're using the WAF API} \n    \n     Specify a base64-encoded version of the value. The maximum length of the value before you base64-encode it is 200 bytes.\n     \n      For example, suppose the value of [Type] is [HEADER] and the value of [Data] is [User-Agent]. If you want to search the [User-Agent] header for the value [BadBot], you base64-encode [BadBot] using MIME base64-encoding and include the resulting value, [QmFkQm90], in the value of [SearchString].\n      \n        {b If you're using the CLI or one of the Amazon Web Services SDKs} \n       \n        The value that you want WAF to search for. The SDK automatically base64 encodes the value.\n        "]}
[@@ocaml.doc
  "A rule statement that defines a string match search for WAF to apply to web requests. The byte match statement provides the bytes to search for, the location in requests that you want WAF to search, and other settings. The bytes to search for are typically a string that corresponds with ASCII characters. In the WAF console and the developer guide, this is called a string match statement.\n"]
type nonrec sensitivity_level =
  | HIGH [@ocaml.doc ""]
  | LOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sqli_match_statement =
  {
  sensitivity_level: sensitivity_level option
    [@ocaml.doc
      "The sensitivity that you want WAF to use to inspect for SQL injection attacks. \n\n  [HIGH] detects more attacks, but might generate more false positives, especially if your web requests frequently contain unusual strings. For information about identifying and mitigating false positives, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-testing.html}Testing and tuning} in the {i WAF Developer Guide}.\n \n   [LOW] is generally a better choice for resources that already have other protections against SQL injection attacks or that have a low tolerance for false positives. \n  \n   Default: [LOW] \n   "];
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"]}
[@@ocaml.doc
  "A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web requests to do things like modify your database or extract data from it. \n"]
type nonrec comparison_operator =
  | GT [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | EQ [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec size_constraint_statement =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  size: int
    [@ocaml.doc
      "The size, in byte, to compare to the request part, after any transformations.\n"];
  comparison_operator: comparison_operator
    [@ocaml.doc
      "The operator to use to compare the request part to the size setting. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"]}
[@@ocaml.doc
  "A rule statement that compares a number of bytes against the size of a request component, using a comparison operator, such as greater than (>) or less than (<). For example, you can use a size constraint statement to look for query strings that are longer than 100 bytes. \n\n If you configure WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit for the web ACL and protected resource type. If you know that the request body for your web requests should never exceed the inspection limit, you can use a size constraint statement to block requests that have a larger request body size. For more information about the inspection limits, see [Body] and [JsonBody] settings for the [FieldToMatch] data type. \n \n  If you choose URI for the value of Part of the request to filter on, the slash (/) in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.\n  "]
type nonrec country_code =
  | XK [@ocaml.doc ""]
  | ZW [@ocaml.doc ""]
  | ZM [@ocaml.doc ""]
  | YE [@ocaml.doc ""]
  | EH [@ocaml.doc ""]
  | WF [@ocaml.doc ""]
  | VI [@ocaml.doc ""]
  | VG [@ocaml.doc ""]
  | VN [@ocaml.doc ""]
  | VE [@ocaml.doc ""]
  | VU [@ocaml.doc ""]
  | UZ [@ocaml.doc ""]
  | UY [@ocaml.doc ""]
  | UM [@ocaml.doc ""]
  | US [@ocaml.doc ""]
  | GB [@ocaml.doc ""]
  | AE [@ocaml.doc ""]
  | UA [@ocaml.doc ""]
  | UG [@ocaml.doc ""]
  | TV [@ocaml.doc ""]
  | TC [@ocaml.doc ""]
  | TM [@ocaml.doc ""]
  | TR [@ocaml.doc ""]
  | TN [@ocaml.doc ""]
  | TT [@ocaml.doc ""]
  | TO [@ocaml.doc ""]
  | TK [@ocaml.doc ""]
  | TG [@ocaml.doc ""]
  | TL [@ocaml.doc ""]
  | TH [@ocaml.doc ""]
  | TZ [@ocaml.doc ""]
  | TJ [@ocaml.doc ""]
  | TW [@ocaml.doc ""]
  | SY [@ocaml.doc ""]
  | CH [@ocaml.doc ""]
  | SE [@ocaml.doc ""]
  | SZ [@ocaml.doc ""]
  | SJ [@ocaml.doc ""]
  | SR [@ocaml.doc ""]
  | SD [@ocaml.doc ""]
  | LK [@ocaml.doc ""]
  | ES [@ocaml.doc ""]
  | SS [@ocaml.doc ""]
  | GS [@ocaml.doc ""]
  | ZA [@ocaml.doc ""]
  | SO [@ocaml.doc ""]
  | SB [@ocaml.doc ""]
  | SI [@ocaml.doc ""]
  | SK [@ocaml.doc ""]
  | SX [@ocaml.doc ""]
  | SG [@ocaml.doc ""]
  | SL [@ocaml.doc ""]
  | SC [@ocaml.doc ""]
  | RS [@ocaml.doc ""]
  | SN [@ocaml.doc ""]
  | SA [@ocaml.doc ""]
  | ST [@ocaml.doc ""]
  | SM [@ocaml.doc ""]
  | WS [@ocaml.doc ""]
  | VC [@ocaml.doc ""]
  | PM [@ocaml.doc ""]
  | MF [@ocaml.doc ""]
  | LC [@ocaml.doc ""]
  | KN [@ocaml.doc ""]
  | SH [@ocaml.doc ""]
  | BL [@ocaml.doc ""]
  | RW [@ocaml.doc ""]
  | RU [@ocaml.doc ""]
  | RO [@ocaml.doc ""]
  | RE [@ocaml.doc ""]
  | QA [@ocaml.doc ""]
  | PR [@ocaml.doc ""]
  | PT [@ocaml.doc ""]
  | PL [@ocaml.doc ""]
  | PN [@ocaml.doc ""]
  | PH [@ocaml.doc ""]
  | PE [@ocaml.doc ""]
  | PY [@ocaml.doc ""]
  | PG [@ocaml.doc ""]
  | PA [@ocaml.doc ""]
  | PS [@ocaml.doc ""]
  | PW [@ocaml.doc ""]
  | PK [@ocaml.doc ""]
  | OM [@ocaml.doc ""]
  | NO [@ocaml.doc ""]
  | MP [@ocaml.doc ""]
  | NF [@ocaml.doc ""]
  | NU [@ocaml.doc ""]
  | NG [@ocaml.doc ""]
  | NE [@ocaml.doc ""]
  | NI [@ocaml.doc ""]
  | NZ [@ocaml.doc ""]
  | NC [@ocaml.doc ""]
  | NL [@ocaml.doc ""]
  | NP [@ocaml.doc ""]
  | NR [@ocaml.doc ""]
  | NA [@ocaml.doc ""]
  | MM [@ocaml.doc ""]
  | MZ [@ocaml.doc ""]
  | MA [@ocaml.doc ""]
  | MS [@ocaml.doc ""]
  | ME [@ocaml.doc ""]
  | MN [@ocaml.doc ""]
  | MC [@ocaml.doc ""]
  | MD [@ocaml.doc ""]
  | FM [@ocaml.doc ""]
  | MX [@ocaml.doc ""]
  | YT [@ocaml.doc ""]
  | MU [@ocaml.doc ""]
  | MR [@ocaml.doc ""]
  | MQ [@ocaml.doc ""]
  | MH [@ocaml.doc ""]
  | MT [@ocaml.doc ""]
  | ML [@ocaml.doc ""]
  | MV [@ocaml.doc ""]
  | MY [@ocaml.doc ""]
  | MW [@ocaml.doc ""]
  | MG [@ocaml.doc ""]
  | MK [@ocaml.doc ""]
  | MO [@ocaml.doc ""]
  | LU [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | LI [@ocaml.doc ""]
  | LY [@ocaml.doc ""]
  | LR [@ocaml.doc ""]
  | LS [@ocaml.doc ""]
  | LB [@ocaml.doc ""]
  | LV [@ocaml.doc ""]
  | LA [@ocaml.doc ""]
  | KG [@ocaml.doc ""]
  | KW [@ocaml.doc ""]
  | KR [@ocaml.doc ""]
  | KP [@ocaml.doc ""]
  | KI [@ocaml.doc ""]
  | KE [@ocaml.doc ""]
  | KZ [@ocaml.doc ""]
  | JO [@ocaml.doc ""]
  | JE [@ocaml.doc ""]
  | JP [@ocaml.doc ""]
  | JM [@ocaml.doc ""]
  | IT [@ocaml.doc ""]
  | IL [@ocaml.doc ""]
  | IM [@ocaml.doc ""]
  | IE [@ocaml.doc ""]
  | IQ [@ocaml.doc ""]
  | IR [@ocaml.doc ""]
  | ID [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | IS [@ocaml.doc ""]
  | HU [@ocaml.doc ""]
  | HK [@ocaml.doc ""]
  | HN [@ocaml.doc ""]
  | VA [@ocaml.doc ""]
  | HM [@ocaml.doc ""]
  | HT [@ocaml.doc ""]
  | GY [@ocaml.doc ""]
  | GW [@ocaml.doc ""]
  | GN [@ocaml.doc ""]
  | GG [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | GU [@ocaml.doc ""]
  | GP [@ocaml.doc ""]
  | GD [@ocaml.doc ""]
  | GL [@ocaml.doc ""]
  | GR [@ocaml.doc ""]
  | GI [@ocaml.doc ""]
  | GH [@ocaml.doc ""]
  | DE [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | GM [@ocaml.doc ""]
  | GA [@ocaml.doc ""]
  | TF [@ocaml.doc ""]
  | PF [@ocaml.doc ""]
  | GF [@ocaml.doc ""]
  | FR [@ocaml.doc ""]
  | FI [@ocaml.doc ""]
  | FJ [@ocaml.doc ""]
  | FO [@ocaml.doc ""]
  | FK [@ocaml.doc ""]
  | ET [@ocaml.doc ""]
  | EE [@ocaml.doc ""]
  | ER [@ocaml.doc ""]
  | GQ [@ocaml.doc ""]
  | SV [@ocaml.doc ""]
  | EG [@ocaml.doc ""]
  | EC [@ocaml.doc ""]
  | DO [@ocaml.doc ""]
  | DM [@ocaml.doc ""]
  | DJ [@ocaml.doc ""]
  | DK [@ocaml.doc ""]
  | CZ [@ocaml.doc ""]
  | CY [@ocaml.doc ""]
  | CW [@ocaml.doc ""]
  | CU [@ocaml.doc ""]
  | HR [@ocaml.doc ""]
  | CI [@ocaml.doc ""]
  | CR [@ocaml.doc ""]
  | CK [@ocaml.doc ""]
  | CD [@ocaml.doc ""]
  | CG [@ocaml.doc ""]
  | KM [@ocaml.doc ""]
  | CO [@ocaml.doc ""]
  | CC [@ocaml.doc ""]
  | CX [@ocaml.doc ""]
  | CN [@ocaml.doc ""]
  | CL [@ocaml.doc ""]
  | TD [@ocaml.doc ""]
  | CF [@ocaml.doc ""]
  | KY [@ocaml.doc ""]
  | CV [@ocaml.doc ""]
  | CA [@ocaml.doc ""]
  | CM [@ocaml.doc ""]
  | KH [@ocaml.doc ""]
  | BI [@ocaml.doc ""]
  | BF [@ocaml.doc ""]
  | BG [@ocaml.doc ""]
  | BN [@ocaml.doc ""]
  | IO [@ocaml.doc ""]
  | BR [@ocaml.doc ""]
  | BV [@ocaml.doc ""]
  | BW [@ocaml.doc ""]
  | BA [@ocaml.doc ""]
  | BQ [@ocaml.doc ""]
  | BO [@ocaml.doc ""]
  | BT [@ocaml.doc ""]
  | BM [@ocaml.doc ""]
  | BJ [@ocaml.doc ""]
  | BZ [@ocaml.doc ""]
  | BE [@ocaml.doc ""]
  | BY [@ocaml.doc ""]
  | BB [@ocaml.doc ""]
  | BD [@ocaml.doc ""]
  | BH [@ocaml.doc ""]
  | BS [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
  | AT [@ocaml.doc ""]
  | AU [@ocaml.doc ""]
  | AW [@ocaml.doc ""]
  | AM [@ocaml.doc ""]
  | AR [@ocaml.doc ""]
  | AG [@ocaml.doc ""]
  | AQ [@ocaml.doc ""]
  | AI [@ocaml.doc ""]
  | AO [@ocaml.doc ""]
  | AD [@ocaml.doc ""]
  | AS [@ocaml.doc ""]
  | DZ [@ocaml.doc ""]
  | AL [@ocaml.doc ""]
  | AX [@ocaml.doc ""]
  | AF [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec forwarded_ip_config =
  {
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if the request doesn't have a valid IP address in the specified position.\n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    You can specify the following fallback behaviors:\n    \n     {ul\n           {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n               \n                }\n           {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n               \n                }\n           }\n  "];
  header_name: string
    [@ocaml.doc
      "The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF) header, set this to [X-Forwarded-For].\n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n   "]}
[@@ocaml.doc
  "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    This configuration is used for [GeoMatchStatement], [AsnMatchStatement], and [RateBasedStatement]. For [IPSetReferenceStatement], use [IPSetForwardedIPConfig] instead. \n    \n     WAF only evaluates the first IP address found in the specified HTTP header. \n     "]
type nonrec geo_match_statement =
  {
  forwarded_ip_config: forwarded_ip_config option
    [@ocaml.doc
      "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n   "];
  country_codes: country_code list option
    [@ocaml.doc
      "An array of two-character country codes that you want to match against, for example, [\\[ \"US\", \"CN\" \\]], from the alpha-2 country ISO codes of the ISO 3166 international standard. \n\n When you use a geo match statement just for the region and country labels that it adds to requests, you still have to supply a country code for the rule to evaluate. In this case, you configure the rule to only count matching requests, but it will still generate logging and count metrics for any matches. You can reduce the logging and metrics that the rule produces by specifying a country that's unlikely to be a source of traffic to your site.\n "]}
[@@ocaml.doc
  "A rule statement that labels web requests by country and region and that matches against web requests based on country code. A geo match rule labels every request that it inspects regardless of whether it finds a match.\n\n {ul\n       {-  To manage requests only by country, you can use this statement by itself and specify the countries that you want to match against in the [CountryCodes] array. \n           \n            }\n       {-  Otherwise, configure your geo match rule with Count action so that it only labels requests. Then, add one or more label match rules to run after the geo match rule and configure them to match against the geographic labels and handle the requests as needed. \n           \n            }\n       }\n   WAF labels requests using the alpha-2 country and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF determines the codes using either the IP address in the web request origin or, if you specify it, the address in the geo match [ForwardedIPConfig]. \n   \n    If you use the web request origin, the label formats are \n    {[\n    awswaf:clientip:geo:region:-\n    ]}\n     and \n    {[\n    awswaf:clientip:geo:country:\n    ]}\n    .\n    \n     If you use a forwarded IP address, the label formats are \n     {[\n     awswaf:forwardedip:geo:region:-\n     ]}\n      and \n     {[\n     awswaf:forwardedip:geo:country:\n     ]}\n     .\n     \n      For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html}Geographic match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}. \n      "]
type nonrec excluded_rule =
  {
  name: string
    [@ocaml.doc
      "The name of the rule whose action you want to override to [Count].\n"]}
[@@ocaml.doc
  "Specifies a single rule in a rule group whose action you want to override to [Count]. \n\n  Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].\n  \n   "]
type nonrec count_action =
  {
  custom_request_handling: custom_request_handling option
    [@ocaml.doc
      "Defines custom handling for the web request.\n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Specifies that WAF should count the request. Optionally defines additional custom handling for the request.\n\n This is used in the context of other settings, for example to specify values for [RuleAction] and web ACL [DefaultAction]. \n "]
type nonrec captcha_action =
  {
  custom_request_handling: custom_request_handling option
    [@ocaml.doc
      "Defines custom handling for the web request, used when the [CAPTCHA] inspection determines that the request's token is valid and unexpired.\n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Specifies that WAF should run a [CAPTCHA] check against the request: \n\n {ul\n       {-  If the request includes a valid, unexpired [CAPTCHA] token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction]. \n           \n            }\n       {-  If the request doesn't include a valid, unexpired token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.\n           \n            WAF generates a response that it sends back to the client, which includes the following: \n            \n             {ul\n                   {-  The header [x-amzn-waf-action] with a value of [captcha]. \n                       \n                        }\n                   {-  The HTTP status code [405 Method Not Allowed]. \n                       \n                        }\n                   {-  If the request contains an [Accept] header with a value of [text/html], the response includes a [CAPTCHA] JavaScript page interstitial. \n                       \n                        }\n                   \n        }\n         }\n       }\n   You can configure the expiration time in the [CaptchaConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting. \n   \n    This action option is available for rules. It isn't available for web ACL default actions. \n    "]
type nonrec challenge_action =
  {
  custom_request_handling: custom_request_handling option
    [@ocaml.doc
      "Defines custom handling for the web request, used when the challenge inspection determines that the request's token is valid and unexpired.\n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Specifies that WAF should run a [Challenge] check against the request to verify that the request is coming from a legitimate client session: \n\n {ul\n       {-  If the request includes a valid, unexpired challenge token, WAF applies any custom request handling and labels that you've configured and then allows the web request inspection to proceed to the next rule, similar to a [CountAction]. \n           \n            }\n       {-  If the request doesn't include a valid, unexpired challenge token, WAF discontinues the web ACL evaluation of the request and blocks it from going to its intended destination.\n           \n            WAF then generates a challenge response that it sends back to the client, which includes the following: \n            \n             {ul\n                   {-  The header [x-amzn-waf-action] with a value of [challenge]. \n                       \n                        }\n                   {-  The HTTP status code [202 Request Accepted]. \n                       \n                        }\n                   {-  If the request contains an [Accept] header with a value of [text/html], the response includes a JavaScript page interstitial with a challenge script. \n                       \n                        }\n                   \n        }\n         Challenges run silent browser interrogations in the background, and don't generally affect the end user experience. \n         \n          A challenge enforces token acquisition using an interstitial JavaScript challenge that inspects the client session for legitimate behavior. The challenge blocks bots or at least increases the cost of operating sophisticated bots. \n          \n           After the client session successfully responds to the challenge, it receives a new token from WAF, which the challenge script uses to resubmit the original request. \n           \n            }\n       }\n   You can configure the expiration time in the [ChallengeConfig] [ImmunityTimeProperty] setting at the rule and web ACL level. The rule setting overrides the web ACL setting. \n   \n    This action option is available for rules. It isn't available for web ACL default actions. \n    "]
type nonrec rule_action =
  {
  challenge: challenge_action option
    [@ocaml.doc
      "Instructs WAF to run a [Challenge] check against the web request.\n"];
  captcha: captcha_action option
    [@ocaml.doc
      "Instructs WAF to run a [CAPTCHA] check against the web request.\n"];
  count: count_action option
    [@ocaml.doc
      "Instructs WAF to count the web request and then continue evaluating the request using the remaining rules in the web ACL.\n"];
  allow: allow_action option
    [@ocaml.doc "Instructs WAF to allow the web request.\n"];
  block: block_action option
    [@ocaml.doc "Instructs WAF to block the web request.\n"]}[@@ocaml.doc
                                                               "The action that WAF should take on a web request when it matches a rule's statement. Settings at the web ACL level can override the rule action setting. \n"]
type nonrec rule_action_override =
  {
  action_to_use: rule_action
    [@ocaml.doc
      "The override action to use, in place of the configured action of the rule in the rule group. \n"];
  name: string
    [@ocaml.doc
      "The name of the rule to override.\n\n  Take care to verify the rule names in your overrides. If you provide a rule name that doesn't match the name of any rule in the rule group, WAF doesn't return an error and doesn't apply the override setting.\n  \n   "]}
[@@ocaml.doc
  "Action setting to use in the place of a rule action that is configured inside the rule group. You specify one override for each rule whose action you want to change. \n\n  Take care to verify the rule names in your overrides. If you provide a rule name that doesn't match the name of any rule in the rule group, WAF doesn't return an error and doesn't apply the override setting.\n  \n    You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.\n    "]
type nonrec rule_group_reference_statement =
  {
  rule_action_overrides: rule_action_override list option
    [@ocaml.doc
      "Action settings to use in the place of the rule actions that are configured inside the rule group. You specify one override for each rule whose action you want to change. \n\n  Verify the rule names in your overrides carefully. With managed rule groups, WAF silently ignores any override that uses an invalid rule name. With customer-owned rule groups, invalid rule names in your overrides will cause web ACL updates to fail. An invalid rule name is any name that doesn't exactly match the case-sensitive name of an existing rule in the rule group.\n  \n    You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.\n    "];
  excluded_rules: excluded_rule list option
    [@ocaml.doc
      "Rules in the referenced rule group whose actions are set to [Count]. \n\n  Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].\n  \n   "];
  ar_n: string [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"]}
[@@ocaml.doc
  "A rule statement used to run the rules that are defined in a [RuleGroup]. To use this, create a rule group with your rules, then provide the ARN of the rule group in this statement.\n\n You cannot nest a [RuleGroupReferenceStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a rule group reference statement inside another rule group. You can only reference a rule group as a top-level statement within a rule that you define in a web ACL.\n "]
type nonrec forwarded_ip_position =
  | ANY [@ocaml.doc ""]
  | LAST [@ocaml.doc ""]
  | FIRST [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ip_set_forwarded_ip_config =
  {
  position: forwarded_ip_position
    [@ocaml.doc
      "The position in the header to search for the IP address. The header can contain IP addresses of the original client and also of proxies. For example, the header value could be [10.1.1.1, 127.0.0.0, 10.10.10.10] where the first IP address identifies the original client and the rest identify proxies that the request went through. \n\n The options for this setting are the following: \n \n  {ul\n        {-  FIRST - Inspect the first IP address in the list of IP addresses in the header. This is usually the client's original IP.\n            \n             }\n        {-  LAST - Inspect the last IP address in the list of IP addresses in the header.\n            \n             }\n        {-  ANY - Inspect all IP addresses in the header for a match. If the header contains more than 10 IP addresses, WAF inspects the last 10.\n            \n             }\n        }\n  "];
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if the request doesn't have a valid IP address in the specified position.\n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    You can specify the following fallback behaviors:\n    \n     {ul\n           {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n               \n                }\n           {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n               \n                }\n           }\n  "];
  header_name: string
    [@ocaml.doc
      "The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF) header, set this to [X-Forwarded-For].\n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n   "]}
[@@ocaml.doc
  "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    This configuration is used only for [IPSetReferenceStatement]. For [GeoMatchStatement] and [RateBasedStatement], use [ForwardedIPConfig] instead. \n    "]
type nonrec ip_set_reference_statement =
  {
  ip_set_forwarded_ip_config: ip_set_forwarded_ip_config option
    [@ocaml.doc
      "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n   "];
  ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the [IPSet] that this statement references.\n"]}
[@@ocaml.doc
  "A rule statement used to detect web requests coming from particular IP addresses or address ranges. To use this, create an [IPSet] that specifies the addresses you want to detect, then use the ARN of that set in this statement. To create an IP set, see [CreateIPSet].\n\n Each IP set rule statement references an IP set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "]
type nonrec regex_pattern_set_reference_statement =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"];
  ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the [RegexPatternSet] that this statement references.\n"]}
[@@ocaml.doc
  "A rule statement used to search web request components for matches with regular expressions. To use this, create a [RegexPatternSet] that specifies the expressions that you want to detect, then use the ARN of that set in this statement. A web request matches the pattern set rule statement if the request component matches any of the patterns in the set. To create a regex pattern set, see [CreateRegexPatternSet].\n\n Each regex pattern set rule statement references a regex pattern set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "]
type nonrec rate_based_statement_aggregate_key_type =
  | CONSTANT [@ocaml.doc ""]
  | CUSTOM_KEYS [@ocaml.doc ""]
  | FORWARDED_IP [@ocaml.doc ""]
  | IP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rate_limit_header =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  name: string [@ocaml.doc "The name of the header to use. \n"]}[@@ocaml.doc
                                                                  "Specifies a header as an aggregate key for a rate-based rule. Each distinct value in the header contributes to the aggregation instance. If you use a single header as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_cookie =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  name: string [@ocaml.doc "The name of the cookie to use. \n"]}[@@ocaml.doc
                                                                  "Specifies a cookie as an aggregate key for a rate-based rule. Each distinct value in the cookie contributes to the aggregation instance. If you use a single cookie as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_query_argument =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  name: string [@ocaml.doc "The name of the query argument to use. \n"]}
[@@ocaml.doc
  "Specifies a query argument in the request as an aggregate key for a rate-based rule. Each distinct value for the named query argument contributes to the aggregation instance. If you use a single query argument as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_query_string =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"]}
[@@ocaml.doc
  "Specifies the request's query string as an aggregate key for a rate-based rule. Each distinct string contributes to the aggregation instance. If you use just the query string as your custom key, then each string fully defines an aggregation instance. \n"]
type nonrec rate_limit_label_namespace =
  {
  namespace: string [@ocaml.doc "The namespace to use for aggregation. \n"]}
[@@ocaml.doc
  "Specifies a label namespace to use as an aggregate key for a rate-based rule. Each distinct fully qualified label name that has the specified label namespace contributes to the aggregation instance. If you use just one label namespace as your custom key, then each label name fully defines an aggregation instance. \n\n This uses only labels that have been added to the request by rules that are evaluated before this rate-based rule in the web ACL. \n \n  For information about label namespaces and names, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html}Label syntax and naming requirements} in the {i WAF Developer Guide}.\n  "]
type nonrec rate_limit_uri_path =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"]}
[@@ocaml.doc
  "Specifies the request's URI path as an aggregate key for a rate-based rule. Each distinct URI path contributes to the aggregation instance. If you use just the URI path as your custom key, then each URI path fully defines an aggregation instance. \n"]
type nonrec rate_limit_ja3_fingerprint =
  {
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if there is insufficient TSL Client Hello information to compute the JA3 fingerprint.\n\n You can specify the following fallback behaviors:\n \n  {ul\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  " Use the request's JA3 fingerprint derived from the TLS Client Hello of an incoming request as an aggregate key. If you use a single JA3 fingerprint as your custom key, then each value fully defines an aggregation instance. \n"]
type nonrec rate_limit_ja4_fingerprint =
  {
  fallback_behavior: fallback_behavior
    [@ocaml.doc
      "The match status to assign to the web request if there is insufficient TSL Client Hello information to compute the JA4 fingerprint.\n\n You can specify the following fallback behaviors:\n \n  {ul\n        {-   [MATCH] - Treat the web request as matching the rule statement. WAF applies the rule action to the request.\n            \n             }\n        {-   [NO_MATCH] - Treat the web request as not matching the rule statement.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Use the request's JA4 fingerprint derived from the TLS Client Hello of an incoming request as an aggregate key. If you use a single JA4 fingerprint as your custom key, then each value fully defines an aggregation instance.\n"]
type nonrec rate_based_statement_custom_key =
  {
  as_n: unit option
    [@ocaml.doc
      "Use an Autonomous System Number (ASN) derived from the request's originating or forwarded IP address as an aggregate key. Each distinct ASN contributes to the aggregation instance. \n"];
  ja4_fingerprint: rate_limit_ja4_fingerprint option
    [@ocaml.doc
      "Use the request's JA4 fingerprint as an aggregate key. If you use a single JA4 fingerprint as your custom key, then each value fully defines an aggregation instance. \n"];
  ja3_fingerprint: rate_limit_ja3_fingerprint option
    [@ocaml.doc
      " Use the request's JA3 fingerprint as an aggregate key. If you use a single JA3 fingerprint as your custom key, then each value fully defines an aggregation instance. \n"];
  uri_path: rate_limit_uri_path option
    [@ocaml.doc
      "Use the request's URI path as an aggregate key. Each distinct URI path contributes to the aggregation instance. If you use just the URI path as your custom key, then each URI path fully defines an aggregation instance. \n"];
  label_namespace: rate_limit_label_namespace option
    [@ocaml.doc
      "Use the specified label namespace as an aggregate key. Each distinct fully qualified label name that has the specified label namespace contributes to the aggregation instance. If you use just one label namespace as your custom key, then each label name fully defines an aggregation instance. \n\n This uses only labels that have been added to the request by rules that are evaluated before this rate-based rule in the web ACL. \n \n  For information about label namespaces and names, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-label-requirements.html}Label syntax and naming requirements} in the {i WAF Developer Guide}.\n  "];
  i_p: unit option
    [@ocaml.doc
      "Use the request's originating IP address as an aggregate key. Each distinct IP address contributes to the aggregation instance.\n\n When you specify an IP or forwarded IP in the custom key settings, you must also specify at least one other key to use. You can aggregate on only the IP address by specifying [IP] in your rate-based statement's [AggregateKeyType]. \n "];
  forwarded_i_p: unit option
    [@ocaml.doc
      "Use the first IP address in an HTTP header as an aggregate key. Each distinct forwarded IP address contributes to the aggregation instance.\n\n When you specify an IP or forwarded IP in the custom key settings, you must also specify at least one other key to use. You can aggregate on only the forwarded IP address by specifying [FORWARDED_IP] in your rate-based statement's [AggregateKeyType]. \n \n  With this option, you must specify the header to use in the rate-based rule's [ForwardedIPConfig] property. \n  "];
  http_method: unit option
    [@ocaml.doc
      "Use the request's HTTP method as an aggregate key. Each distinct HTTP method contributes to the aggregation instance. If you use just the HTTP method as your custom key, then each method fully defines an aggregation instance. \n"];
  query_string: rate_limit_query_string option
    [@ocaml.doc
      "Use the request's query string as an aggregate key. Each distinct string contributes to the aggregation instance. If you use just the query string as your custom key, then each string fully defines an aggregation instance. \n"];
  query_argument: rate_limit_query_argument option
    [@ocaml.doc
      "Use the specified query argument as an aggregate key. Each distinct value for the named query argument contributes to the aggregation instance. If you use a single query argument as your custom key, then each value fully defines an aggregation instance. \n"];
  cookie: rate_limit_cookie option
    [@ocaml.doc
      "Use the value of a cookie in the request as an aggregate key. Each distinct value in the cookie contributes to the aggregation instance. If you use a single cookie as your custom key, then each value fully defines an aggregation instance. \n"];
  header: rate_limit_header option
    [@ocaml.doc
      "Use the value of a header in the request as an aggregate key. Each distinct value in the header contributes to the aggregation instance. If you use a single header as your custom key, then each value fully defines an aggregation instance. \n"]}
[@@ocaml.doc
  "Specifies a single custom aggregate key for a rate-base rule. \n\n  Web requests that are missing any of the components specified in the aggregation keys are omitted from the rate-based rule evaluation and handling. \n  \n   "]
type nonrec payload_type =
  | FORM_ENCODED [@ocaml.doc ""]
  | JSON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec username_field =
  {
  identifier: string
    [@ocaml.doc
      "The name of the username field. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"username\": \"THE_USERNAME\" } }], the username field specification is [/form/username]. \n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [username1], the username field specification is [username1] \n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "The name of the field in the request payload that contains your customer's username. \n\n This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types. \n "]
type nonrec password_field =
  {
  identifier: string
    [@ocaml.doc
      "The name of the password field. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"password\": \"THE_PASSWORD\" } }], the password field specification is [/form/password].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [password1], the password field specification is [password1].\n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "The name of the field in the request payload that contains your customer's password. \n\n This data type is used in the [RequestInspection] and [RequestInspectionACFP] data types. \n "]
type nonrec inspection_level =
  | TARGETED [@ocaml.doc ""]
  | COMMON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec aws_managed_rules_bot_control_rule_set =
  {
  enable_machine_learning: bool option
    [@ocaml.doc
      "Applies only to the targeted inspection level. \n\n Determines whether to use machine learning (ML) to analyze your web traffic for bot-related activity. Machine learning is required for the Bot Control rules [TGT_ML_CoordinatedActivityLow] and [TGT_ML_CoordinatedActivityMedium], which inspect for anomalous behavior that might indicate distributed, coordinated bot activity.\n \n  For more information about this choice, see the listing for these rules in the table at {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html#aws-managed-rule-groups-bot-rules}Bot Control rules listing} in the {i WAF Developer Guide}.\n  \n   Default: [TRUE] \n   "];
  inspection_level: inspection_level
    [@ocaml.doc
      "The inspection level to use for the Bot Control rule group. The common level is the least expensive. The targeted level includes all common level rules and adds rules with more advanced inspection criteria. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html}WAF Bot Control rule group} in the {i WAF Developer Guide}.\n"]}
[@@ocaml.doc
  "Details for your use of the Bot Control managed rule group, [AWSManagedRulesBotControlRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n\n For additional information about this and the other intelligent threat mitigation rule groups, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections}Intelligent threat mitigation in WAF} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list}Amazon Web Services Managed Rules rule groups list} in the {i WAF Developer Guide}. \n "]
type nonrec request_inspection =
  {
  password_field: password_field
    [@ocaml.doc
      "The name of the field in the request payload that contains your customer's password. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"password\": \"THE_PASSWORD\" } }], the password field specification is [/form/password].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [password1], the password field specification is [password1].\n             \n              }\n        }\n  "];
  username_field: username_field
    [@ocaml.doc
      "The name of the field in the request payload that contains your customer's username. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"username\": \"THE_USERNAME\" } }], the username field specification is [/form/username]. \n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [username1], the username field specification is [username1] \n             \n              }\n        }\n  "];
  payload_type: payload_type
    [@ocaml.doc
      "The payload type for your login endpoint, either JSON or form encoded.\n"]}
[@@ocaml.doc
  "The criteria for inspecting login requests, used by the ATP rule group to validate credentials usage. \n\n This is part of the [AWSManagedRulesATPRuleSet] configuration in [ManagedRuleGroupConfig].\n \n  In these settings, you specify how your application accepts login attempts by providing the request payload type and the names of the fields within the request body where the username and password are provided. \n  "]
type nonrec response_inspection_status_code =
  {
  failure_codes: int list
    [@ocaml.doc
      "Status codes in the response that indicate a failed login or account creation attempt. To be counted as a failure, the response status code must match one of these. Each code must be unique among the success and failure status codes. \n\n JSON example: [\"FailureCodes\": \\[ 400, 404 \\]] \n "];
  success_codes: int list
    [@ocaml.doc
      "Status codes in the response that indicate a successful login or account creation attempt. To be counted as a success, the response status code must match one of these. Each code must be unique among the success and failure status codes. \n\n JSON example: [\"SuccessCodes\": \\[ 200, 201 \\]] \n "]}
[@@ocaml.doc
  "Configures inspection of the response status code. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_header =
  {
  failure_values: string list
    [@ocaml.doc
      "Values in the response header with the specified name that indicate a failed login or account creation attempt. To be counted as a failure, the value must be an exact match, including case. Each value must be unique among the success and failure values. \n\n JSON examples: [\"FailureValues\": \\[ \"LoginFailed\", \"Failed login\" \\]] and [\"FailureValues\": \\[ \"AccountCreationFailed\" \\]] \n "];
  success_values: string list
    [@ocaml.doc
      "Values in the response header with the specified name that indicate a successful login or account creation attempt. To be counted as a success, the value must be an exact match, including case. Each value must be unique among the success and failure values. \n\n JSON examples: [\"SuccessValues\": \\[ \"LoginPassed\", \"Successful login\" \\]] and [\"SuccessValues\": \\[ \"AccountCreated\", \"Successful account creation\" \\]] \n "];
  name: string
    [@ocaml.doc
      "The name of the header to match against. The name must be an exact match, including case.\n\n JSON example: [\"Name\": \\[ \"RequestResult\" \\]] \n "]}
[@@ocaml.doc
  "Configures inspection of the response header. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_body_contains =
  {
  failure_strings: string list
    [@ocaml.doc
      "Strings in the body of the response that indicate a failed login or account creation attempt. To be counted as a failure, the string can be anywhere in the body and must be an exact match, including case. Each string must be unique among the success and failure strings. \n\n JSON example: [\"FailureStrings\": \\[ \"Request failed\" \\]] \n "];
  success_strings: string list
    [@ocaml.doc
      "Strings in the body of the response that indicate a successful login or account creation attempt. To be counted as a success, the string can be anywhere in the body and must be an exact match, including case. Each string must be unique among the success and failure strings. \n\n JSON examples: [\"SuccessStrings\": \\[ \"Login successful\" \\]] and [\"SuccessStrings\": \\[ \"Account creation successful\", \"Welcome to our site!\" \\]] \n "]}
[@@ocaml.doc
  "Configures inspection of the response body. WAF can inspect the first 65,536 bytes (64 KB) of the response body. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection_json =
  {
  failure_values: string list
    [@ocaml.doc
      "Values for the specified identifier in the response JSON that indicate a failed login or account creation attempt. To be counted as a failure, the value must be an exact match, including case. Each value must be unique among the success and failure values. \n\n JSON example: [\"FailureValues\": \\[ \"False\", \"Failed\" \\]] \n "];
  success_values: string list
    [@ocaml.doc
      "Values for the specified identifier in the response JSON that indicate a successful login or account creation attempt. To be counted as a success, the value must be an exact match, including case. Each value must be unique among the success and failure values. \n\n JSON example: [\"SuccessValues\": \\[ \"True\", \"Succeeded\" \\]] \n "];
  identifier: string
    [@ocaml.doc
      "The identifier for the value to match against in the JSON. The identifier must be an exact match, including case.\n\n JSON examples: [\"Identifier\": \\[ \"/login/success\" \\]] and [\"Identifier\": \\[ \"/sign-up/success\" \\]] \n "]}
[@@ocaml.doc
  "Configures inspection of the response JSON. WAF can inspect the first 65,536 bytes (64 KB) of the response JSON. This is part of the [ResponseInspection] configuration for [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet]. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n   "]
type nonrec response_inspection =
  {
  json: response_inspection_json option
    [@ocaml.doc
      "Configures inspection of the response JSON for success and failure indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response JSON. \n"];
  body_contains: response_inspection_body_contains option
    [@ocaml.doc
      "Configures inspection of the response body for success and failure indicators. WAF can inspect the first 65,536 bytes (64 KB) of the response body. \n"];
  header: response_inspection_header option
    [@ocaml.doc
      "Configures inspection of the response header for success and failure indicators. \n"];
  status_code: response_inspection_status_code option
    [@ocaml.doc
      "Configures inspection of the response status code for success and failure indicators. \n"]}
[@@ocaml.doc
  "The criteria for inspecting responses to login requests and account creation requests, used by the ATP and ACFP rule groups to track login and account creation success and failure rates. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n    The rule groups evaluates the responses that your protected resources send back to client login and account creation attempts, keeping count of successful and failed attempts from each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses with too much suspicious activity in a short amount of time. \n    \n     This is part of the [AWSManagedRulesATPRuleSet] and [AWSManagedRulesACFPRuleSet] configurations in [ManagedRuleGroupConfig].\n     \n      Enable response inspection by configuring exactly one component of the response to inspect, for example, [Header] or [StatusCode]. You can't configure more than one component for inspection. If you don't configure any of the response inspection options, response inspection is disabled. \n      "]
type nonrec aws_managed_rules_atp_rule_set =
  {
  enable_regex_in_path: bool option
    [@ocaml.doc
      "Allow the use of regular expressions in the login page path. \n"];
  response_inspection: response_inspection option
    [@ocaml.doc
      "The criteria for inspecting responses to login requests, used by the ATP rule group to track login failure rates. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n    The ATP rule group evaluates the responses that your protected resources send back to client login attempts, keeping count of successful and failed attempts for each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses that have had too many failed login attempts in a short amount of time. \n    "];
  request_inspection: request_inspection option
    [@ocaml.doc
      "The criteria for inspecting login requests, used by the ATP rule group to validate credentials usage. \n"];
  login_path: string
    [@ocaml.doc
      "The path of the login endpoint for your application. For example, for the URL [https://example.com/web/login], you would provide the path [/web/login]. Login paths that start with the path that you provide are considered a match. For example [/web/login] matches the login paths [/web/login], [/web/login/], [/web/loginPage], and [/web/login/thisPage], but doesn't match the login path [/home/web/login] or [/website/login].\n\n The rule group inspects only HTTP [POST] requests to your specified login endpoint.\n "]}
[@@ocaml.doc
  "Details for your use of the account takeover prevention managed rule group, [AWSManagedRulesATPRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n\n For additional information about this and the other intelligent threat mitigation rule groups, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections}Intelligent threat mitigation in WAF} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list}Amazon Web Services Managed Rules rule groups list} in the {i WAF Developer Guide}. \n "]
type nonrec email_field =
  {
  identifier: string
    [@ocaml.doc
      "The name of the email field. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"email\": \"THE_EMAIL\" } }], the email field specification is [/form/email].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [email1], the email field specification is [email1].\n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "The name of the field in the request payload that contains your customer's email. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec phone_number_field =
  {
  identifier: string
    [@ocaml.doc
      "The name of a single primary phone number field. \n\n How you specify the phone number fields depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"primaryphoneline1\": \"THE_PHONE1\", \"primaryphoneline2\": \"THE_PHONE2\", \"primaryphoneline3\": \"THE_PHONE3\" } }], the phone number field identifiers are [/form/primaryphoneline1], [/form/primaryphoneline2], and [/form/primaryphoneline3].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with input elements named [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3], the phone number field identifiers are [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3]. \n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "The name of a field in the request payload that contains part or all of your customer's primary phone number. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec address_field =
  {
  identifier: string
    [@ocaml.doc
      "The name of a single primary address field. \n\n How you specify the address fields depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"primaryaddressline1\": \"THE_ADDRESS1\", \"primaryaddressline2\": \"THE_ADDRESS2\", \"primaryaddressline3\": \"THE_ADDRESS3\" } }], the address field idenfiers are [/form/primaryaddressline1], [/form/primaryaddressline2], and [/form/primaryaddressline3].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with input elements named [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3], the address fields identifiers are [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3]. \n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "The name of a field in the request payload that contains part or all of your customer's primary physical address. \n\n This data type is used in the [RequestInspectionACFP] data type. \n "]
type nonrec request_inspection_acf_p =
  {
  address_fields: address_field list option
    [@ocaml.doc
      "The names of the fields in the request payload that contain your customer's primary physical address. \n\n Order the address fields in the array exactly as they are ordered in the request payload. \n \n  How you specify the address fields depends on the request inspection payload type.\n  \n   {ul\n         {-  For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n             \n              For example, for the JSON payload [{ \"form\": { \"primaryaddressline1\": \"THE_ADDRESS1\", \"primaryaddressline2\": \"THE_ADDRESS2\", \"primaryaddressline3\": \"THE_ADDRESS3\" } }], the address field idenfiers are [/form/primaryaddressline1], [/form/primaryaddressline2], and [/form/primaryaddressline3].\n              \n               }\n         {-  For form encoded payload types, use the HTML form names.\n             \n              For example, for an HTML form with input elements named [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3], the address fields identifiers are [primaryaddressline1], [primaryaddressline2], and [primaryaddressline3]. \n              \n               }\n         }\n  "];
  phone_number_fields: phone_number_field list option
    [@ocaml.doc
      "The names of the fields in the request payload that contain your customer's primary phone number. \n\n Order the phone number fields in the array exactly as they are ordered in the request payload. \n \n  How you specify the phone number fields depends on the request inspection payload type.\n  \n   {ul\n         {-  For JSON payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n             \n              For example, for the JSON payload [{ \"form\": { \"primaryphoneline1\": \"THE_PHONE1\", \"primaryphoneline2\": \"THE_PHONE2\", \"primaryphoneline3\": \"THE_PHONE3\" } }], the phone number field identifiers are [/form/primaryphoneline1], [/form/primaryphoneline2], and [/form/primaryphoneline3].\n              \n               }\n         {-  For form encoded payload types, use the HTML form names.\n             \n              For example, for an HTML form with input elements named [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3], the phone number field identifiers are [primaryphoneline1], [primaryphoneline2], and [primaryphoneline3]. \n              \n               }\n         }\n  "];
  email_field: email_field option
    [@ocaml.doc
      "The name of the field in the request payload that contains your customer's email. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"email\": \"THE_EMAIL\" } }], the email field specification is [/form/email].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [email1], the email field specification is [email1].\n             \n              }\n        }\n  "];
  password_field: password_field option
    [@ocaml.doc
      "The name of the field in the request payload that contains your customer's password. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"password\": \"THE_PASSWORD\" } }], the password field specification is [/form/password].\n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [password1], the password field specification is [password1].\n             \n              }\n        }\n  "];
  username_field: username_field option
    [@ocaml.doc
      "The name of the field in the request payload that contains your customer's username. \n\n How you specify this depends on the request inspection payload type.\n \n  {ul\n        {-  For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force (IETF) documentation {{:https://tools.ietf.org/html/rfc6901}JavaScript Object Notation (JSON) Pointer}. \n            \n             For example, for the JSON payload [{ \"form\": { \"username\": \"THE_USERNAME\" } }], the username field specification is [/form/username]. \n             \n              }\n        {-  For form encoded payload types, use the HTML form names.\n            \n             For example, for an HTML form with the input element named [username1], the username field specification is [username1] \n             \n              }\n        }\n  "];
  payload_type: payload_type
    [@ocaml.doc
      "The payload type for your account creation endpoint, either JSON or form encoded.\n"]}
[@@ocaml.doc
  "The criteria for inspecting account creation requests, used by the ACFP rule group to validate and track account creation attempts. \n\n This is part of the [AWSManagedRulesACFPRuleSet] configuration in [ManagedRuleGroupConfig].\n \n  In these settings, you specify how your application accepts account creation attempts by providing the request payload type and the names of the fields within the request body where the username, password, email, and primary address and phone number fields are provided. \n  "]
type nonrec aws_managed_rules_acfp_rule_set =
  {
  enable_regex_in_path: bool option
    [@ocaml.doc
      "Allow the use of regular expressions in the registration page path and the account creation path. \n"];
  response_inspection: response_inspection option
    [@ocaml.doc
      "The criteria for inspecting responses to account creation requests, used by the ACFP rule group to track account creation success rates. \n\n  Response inspection is available only in web ACLs that protect Amazon CloudFront distributions.\n  \n    The ACFP rule group evaluates the responses that your protected resources send back to client account creation attempts, keeping count of successful and failed attempts from each IP address and client session. Using this information, the rule group labels and mitigates requests from client sessions and IP addresses that have had too many successful account creation attempts in a short amount of time. \n    "];
  request_inspection: request_inspection_acf_p
    [@ocaml.doc
      "The criteria for inspecting account creation requests, used by the ACFP rule group to validate and track account creation attempts. \n"];
  registration_page_path: string
    [@ocaml.doc
      "The path of the account registration endpoint for your application. This is the page on your website that presents the registration form to new users. \n\n  This page must accept [GET] text/html requests.\n  \n    For example, for the URL [https://example.com/web/registration], you would provide the path [/web/registration]. Registration page paths that start with the path that you provide are considered a match. For example [/web/registration] matches the registration paths [/web/registration], [/web/registration/], [/web/registrationPage], and [/web/registration/thisPage], but doesn't match the path [/home/web/registration] or [/website/registration]. \n    "];
  creation_path: string
    [@ocaml.doc
      "The path of the account creation endpoint for your application. This is the page on your website that accepts the completed registration form for a new user. This page must accept [POST] requests.\n\n For example, for the URL [https://example.com/web/newaccount], you would provide the path [/web/newaccount]. Account creation page paths that start with the path that you provide are considered a match. For example [/web/newaccount] matches the account creation paths [/web/newaccount], [/web/newaccount/], [/web/newaccountPage], and [/web/newaccount/thisPage], but doesn't match the path [/home/web/newaccount] or [/website/newaccount]. \n "]}
[@@ocaml.doc
  "Details for your use of the account creation fraud prevention managed rule group, [AWSManagedRulesACFPRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n\n For additional information about this and the other intelligent threat mitigation rule groups, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections}Intelligent threat mitigation in WAF} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list}Amazon Web Services Managed Rules rule groups list} in the {i WAF Developer Guide}. \n "]
type nonrec usage_of_action =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sensitivity_to_act =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec regex =
  {
  regex_string: string option
    [@ocaml.doc "The string representing the regular expression.\n"]}
[@@ocaml.doc
  "A single regular expression. This is used in a [RegexPatternSet] and also in the configuration for the Amazon Web Services Managed Rules rule group [AWSManagedRulesAntiDDoSRuleSet].\n"]
type nonrec client_side_action =
  {
  exempt_uri_regular_expressions: regex list option
    [@ocaml.doc
      "The regular expression to match against the web request URI, used to identify requests that can't handle a silent browser challenge. When the [ClientSideAction] setting [UsageOfAction] is enabled, the managed rule group uses this setting to determine which requests to label with [awswaf:managed:aws:anti-ddos:challengeable-request]. If [UsageOfAction] is disabled, this setting has no effect and the managed rule group doesn't add the label to any requests.\n\n The anti-DDoS managed rule group doesn't evaluate the rules [ChallengeDDoSRequests] or [ChallengeAllDuringEvent] for web requests whose URIs match this regex. This is true regardless of whether you override the rule action for either of the rules in your web ACL configuration. \n \n  Amazon Web Services recommends using a regular expression. \n  \n   This setting is required if [UsageOfAction] is set to [ENABLED]. If required, you can provide between 1 and 5 regex objects in the array of settings. \n   \n    Amazon Web Services recommends starting with the following setting. Review and update it for your application's needs:\n    \n      [\\/api\\/|\\.(acc|avi|css|gif|jpe?g|js|mp\\[34\\]|ogg|otf|pdf|png|tiff?|ttf|webm|webp|woff2?)$] \n     "];
  sensitivity: sensitivity_to_act option
    [@ocaml.doc
      "The sensitivity that the rule group rule [ChallengeDDoSRequests] uses when matching against the DDoS suspicion labeling on a request. The managed rule group adds the labeling during DDoS events, before the [ChallengeDDoSRequests] rule runs. \n\n The higher the sensitivity, the more levels of labeling that the rule matches: \n \n  {ul\n        {-  Low sensitivity is less sensitive, causing the rule to match only on the most likely participants in an attack, which are the requests with the high suspicion label [awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request].\n            \n             }\n        {-  Medium sensitivity causes the rule to match on the medium and high suspicion labels.\n            \n             }\n        {-  High sensitivity causes the rule to match on all of the suspicion labels: low, medium, and high.\n            \n             }\n        }\n   Default: [HIGH] \n   "];
  usage_of_action: usage_of_action
    [@ocaml.doc
      "Determines whether to use the [AWSManagedRulesAntiDDoSRuleSet] rules [ChallengeAllDuringEvent] and [ChallengeDDoSRequests] in the rule group evaluation and the related label [awswaf:managed:aws:anti-ddos:challengeable-request]. \n\n {ul\n       {-  If usage is enabled: \n           \n            {ul\n                  {-  The managed rule group adds the label [awswaf:managed:aws:anti-ddos:challengeable-request] to any web request whose URL does {i NOT} match the regular expressions provided in the [ClientSideAction] setting [ExemptUriRegularExpressions]. \n                      \n                       }\n                  {-  The two rules are evaluated against web requests for protected resources that are experiencing a DDoS attack. The two rules only apply their action to matching requests that have the label [awswaf:managed:aws:anti-ddos:challengeable-request]. \n                      \n                       }\n                  \n        }\n         }\n       {-  If usage is disabled: \n           \n            {ul\n                  {-  The managed rule group doesn't add the label [awswaf:managed:aws:anti-ddos:challengeable-request] to any web requests. \n                      \n                       }\n                  {-  The two rules are not evaluated.\n                      \n                       }\n                  {-  None of the other [ClientSideAction] settings have any effect.\n                      \n                       }\n                  \n        }\n         }\n       }\n    This setting only enables or disables the use of the two anti-DDOS rules [ChallengeAllDuringEvent] and [ChallengeDDoSRequests] in the anti-DDoS managed rule group. \n    \n     This setting doesn't alter the action setting in the two rules. To override the actions used by the rules [ChallengeAllDuringEvent] and [ChallengeDDoSRequests], enable this setting, and then override the rule actions in the usual way, in your managed rule group configuration. \n     \n      "]}
[@@ocaml.doc
  "This is part of the [AWSManagedRulesAntiDDoSRuleSet] [ClientSideActionConfig] configuration in [ManagedRuleGroupConfig].\n"]
type nonrec client_side_action_config =
  {
  challenge: client_side_action
    [@ocaml.doc
      "Configuration for the use of the [AWSManagedRulesAntiDDoSRuleSet] rules [ChallengeAllDuringEvent] and [ChallengeDDoSRequests]. \n\n  This setting isn't related to the configuration of the [Challenge] action itself. It only configures the use of the two anti-DDoS rules named here. \n  \n    You can enable or disable the use of these rules, and you can configure how to use them when they are enabled. \n    "]}
[@@ocaml.doc
  "This is part of the configuration for the managed rules [AWSManagedRulesAntiDDoSRuleSet] in [ManagedRuleGroupConfig].\n"]
type nonrec aws_managed_rules_anti_d_do_s_rule_set =
  {
  sensitivity_to_block: sensitivity_to_act option
    [@ocaml.doc
      "The sensitivity that the rule group rule [DDoSRequests] uses when matching against the DDoS suspicion labeling on a request. The managed rule group adds the labeling during DDoS events, before the [DDoSRequests] rule runs. \n\n The higher the sensitivity, the more levels of labeling that the rule matches: \n \n  {ul\n        {-  Low sensitivity is less sensitive, causing the rule to match only on the most likely participants in an attack, which are the requests with the high suspicion label [awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request].\n            \n             }\n        {-  Medium sensitivity causes the rule to match on the medium and high suspicion labels.\n            \n             }\n        {-  High sensitivity causes the rule to match on all of the suspicion labels: low, medium, and high.\n            \n             }\n        }\n   Default: [LOW] \n   "];
  client_side_action_config: client_side_action_config
    [@ocaml.doc
      "Configures the request handling that's applied by the managed rule group rules [ChallengeAllDuringEvent] and [ChallengeDDoSRequests] during a distributed denial of service (DDoS) attack.\n"]}
[@@ocaml.doc
  "Configures the use of the anti-DDoS managed rule group, [AWSManagedRulesAntiDDoSRuleSet]. This configuration is used in [ManagedRuleGroupConfig]. \n\n The configuration that you provide here determines whether and how the rules in the rule group are used. \n \n  For additional information about this and the other intelligent threat mitigation rule groups, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-managed-protections}Intelligent threat mitigation in WAF} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list}Amazon Web Services Managed Rules rule groups list} in the {i WAF Developer Guide}. \n  "]
type nonrec managed_rule_group_config =
  {
  aws_managed_rules_anti_d_do_s_rule_set:
    aws_managed_rules_anti_d_do_s_rule_set option
    [@ocaml.doc
      "Additional configuration for using the anti-DDoS managed rule group, [AWSManagedRulesAntiDDoSRuleSet]. Use this to configure anti-DDoS behavior for the rule group. \n\n For information about using the anti-DDoS managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-anti-ddos.html}WAF Anti-DDoS rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-anti-ddos.html}Distributed Denial of Service (DDoS) prevention} in the {i WAF Developer Guide}.\n "];
  aws_managed_rules_acfp_rule_set: aws_managed_rules_acfp_rule_set option
    [@ocaml.doc
      "Additional configuration for using the account creation fraud prevention (ACFP) managed rule group, [AWSManagedRulesACFPRuleSet]. Use this to provide account creation request information to the rule group. For web ACLs that protect CloudFront distributions, use this to also provide the information about how your distribution responds to account creation requests. \n\n For information about using the ACFP managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-acfp.html}WAF Fraud Control account creation fraud prevention (ACFP) rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-acfp.html}WAF Fraud Control account creation fraud prevention (ACFP)} in the {i WAF Developer Guide}.\n "];
  aws_managed_rules_atp_rule_set: aws_managed_rules_atp_rule_set option
    [@ocaml.doc
      "Additional configuration for using the account takeover prevention (ATP) managed rule group, [AWSManagedRulesATPRuleSet]. Use this to provide login request information to the rule group. For web ACLs that protect CloudFront distributions, use this to also provide the information about how your distribution responds to login requests. \n\n This configuration replaces the individual configuration fields in [ManagedRuleGroupConfig] and provides additional feature configuration. \n \n  For information about using the ATP managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-atp.html}WAF Fraud Control account takeover prevention (ATP) rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-atp.html}WAF Fraud Control account takeover prevention (ATP)} in the {i WAF Developer Guide}.\n  "];
  aws_managed_rules_bot_control_rule_set:
    aws_managed_rules_bot_control_rule_set option
    [@ocaml.doc
      "Additional configuration for using the Bot Control managed rule group. Use this to specify the inspection level that you want to use. For information about using the Bot Control managed rule group, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-bot.html}WAF Bot Control rule group} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-bot-control.html}WAF Bot Control} in the {i WAF Developer Guide}.\n"];
  password_field: password_field option
    [@ocaml.doc
      " Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet]. \n \n  "];
  username_field: username_field option
    [@ocaml.doc
      " Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet]. \n \n  "];
  payload_type: payload_type option
    [@ocaml.doc
      " Instead of this setting, provide your configuration under the request inspection configuration for [AWSManagedRulesATPRuleSet] or [AWSManagedRulesACFPRuleSet]. \n \n  "];
  login_path: string option
    [@ocaml.doc
      " Instead of this setting, provide your configuration under [AWSManagedRulesATPRuleSet]. \n \n  "]}
[@@ocaml.doc
  "Additional information that's used by a managed rule group. Many managed rule groups don't require this.\n\n The rule groups used for intelligent threat mitigation require additional configuration: \n \n  {ul\n        {-  Use the [AWSManagedRulesACFPRuleSet] configuration object to configure the account creation fraud prevention managed rule group. The configuration includes the registration and sign-up pages of your application and the locations in the account creation request payload of data, such as the user email and phone number fields. \n            \n             }\n        {-  Use the [AWSManagedRulesAntiDDoSRuleSet] configuration object to configure the anti-DDoS managed rule group. The configuration includes the sensitivity levels to use in the rules that typically block and challenge requests that might be participating in DDoS attacks and the specification to use to indicate whether a request can handle a silent browser challenge. \n            \n             }\n        {-  Use the [AWSManagedRulesATPRuleSet] configuration object to configure the account takeover prevention managed rule group. The configuration includes the sign-in page of your application and the locations in the login request payload of data such as the username and password. \n            \n             }\n        {-  Use the [AWSManagedRulesBotControlRuleSet] configuration object to configure the protection level that you want the Bot Control rule group to use. \n            \n             }\n        }\n   For example specifications, see the examples section of [CreateWebACL].\n   "]
type nonrec label_match_scope =
  | NAMESPACE [@ocaml.doc ""]
  | LABEL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec label_match_statement =
  {
  key: string
    [@ocaml.doc
      "The string to match against. The setting you provide for this depends on the match statement's [Scope] setting: \n\n {ul\n       {-  If the [Scope] indicates [LABEL], then this specification must include the name and can include any number of preceding namespace specifications and prefix up to providing the fully qualified label name. \n           \n            }\n       {-  If the [Scope] indicates [NAMESPACE], then this specification can include any number of contiguous namespace strings, and can include the entire label namespace prefix from the rule group or web ACL where the label originates.\n           \n            }\n       }\n   Labels are case sensitive and components of a label must be separated by colon, for example [NS1:NS2:name].\n   "];
  scope: label_match_scope
    [@ocaml.doc
      "Specify whether you want to match using the label name or just the namespace. \n"]}
[@@ocaml.doc
  "A rule statement to match against labels that have been added to the web request by rules that have already run in the web ACL. \n\n The label match statement provides the label or namespace string to search for. The label string can represent a part or all of the fully qualified label name that had been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. If you do not provide the fully qualified name in your label match string, WAF performs the search for labels that were added in the same context as the label match statement. \n "]
type nonrec regex_match_statement =
  {
  text_transformations: text_transformation list
    [@ocaml.doc
      "Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass detection. Text transformations are used in rule match statements, to transform the [FieldToMatch] request component before inspecting it, and they're used in rate-based rule statements, to transform request components before using them as custom aggregation keys. If you specify one or more transformations to apply, WAF performs all transformations on the specified content, starting from the lowest priority setting, and then uses the transformed component contents. \n"];
  field_to_match: field_to_match
    [@ocaml.doc
      "The part of the web request that you want WAF to inspect. \n"];
  regex_string: string
    [@ocaml.doc "The string representing the regular expression.\n"]}
[@@ocaml.doc
  "A rule statement used to search web request components for a match against a single regular expression. \n"]
type nonrec asn_match_statement =
  {
  forwarded_ip_config: forwarded_ip_config option
    [@ocaml.doc
      "The configuration for inspecting IP addresses to match against an ASN in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n"];
  asn_list: int list
    [@ocaml.doc
      "Contains one or more Autonomous System Numbers (ASNs). ASNs are unique identifiers assigned to large internet networks managed by organizations such as internet service providers, enterprises, universities, or government agencies. \n"]}
[@@ocaml.doc
  "A rule statement that inspects web traffic based on the Autonomous System Number (ASN) associated with the request's IP address.\n\n For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-asn-match.html}ASN match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}. \n "]
type and_statement =
  {
  statements: statement list
    [@ocaml.doc
      "The statements to combine with AND logic. You can use any statements that can be nested. \n"]}
[@@ocaml.doc
  "A logical rule statement used to combine other rule statements with AND logic. You provide more than one [Statement] within the [AndStatement]. \n"]
and managed_rule_group_statement =
  {
  rule_action_overrides: rule_action_override list option
    [@ocaml.doc
      "Action settings to use in the place of the rule actions that are configured inside the rule group. You specify one override for each rule whose action you want to change. \n\n  Verify the rule names in your overrides carefully. With managed rule groups, WAF silently ignores any override that uses an invalid rule name. With customer-owned rule groups, invalid rule names in your overrides will cause web ACL updates to fail. An invalid rule name is any name that doesn't exactly match the case-sensitive name of an existing rule in the rule group.\n  \n    You can use overrides for testing, for example you can override all of rule actions to [Count] and then monitor the resulting count metrics to understand how the rule group would handle your web traffic. You can also permanently override some or all actions, to modify how the rule group manages your web traffic.\n    "];
  managed_rule_group_configs: managed_rule_group_config list option
    [@ocaml.doc
      "Additional information that's used by a managed rule group. Many managed rule groups don't require this.\n\n The rule groups used for intelligent threat mitigation require additional configuration: \n \n  {ul\n        {-  Use the [AWSManagedRulesACFPRuleSet] configuration object to configure the account creation fraud prevention managed rule group. The configuration includes the registration and sign-up pages of your application and the locations in the account creation request payload of data, such as the user email and phone number fields. \n            \n             }\n        {-  Use the [AWSManagedRulesAntiDDoSRuleSet] configuration object to configure the anti-DDoS managed rule group. The configuration includes the sensitivity levels to use in the rules that typically block and challenge requests that might be participating in DDoS attacks and the specification to use to indicate whether a request can handle a silent browser challenge. \n            \n             }\n        {-  Use the [AWSManagedRulesATPRuleSet] configuration object to configure the account takeover prevention managed rule group. The configuration includes the sign-in page of your application and the locations in the login request payload of data such as the username and password. \n            \n             }\n        {-  Use the [AWSManagedRulesBotControlRuleSet] configuration object to configure the protection level that you want the Bot Control rule group to use. \n            \n             }\n        }\n  "];
  scope_down_statement: statement option
    [@ocaml.doc
      "An optional nested statement that narrows the scope of the web requests that are evaluated by the managed rule group. Requests are only evaluated by the rule group if they match the scope-down statement. You can use any nestable [Statement] in the scope-down statement, and you can nest statements at any level, the same as you can for a rule statement. \n"];
  excluded_rules: excluded_rule list option
    [@ocaml.doc
      "Rules in the referenced rule group whose actions are set to [Count]. \n\n  Instead of this option, use [RuleActionOverrides]. It accepts any valid action setting, including [Count].\n  \n   "];
  version: string option
    [@ocaml.doc
      "The version of the managed rule group to use. If you specify this, the version setting is fixed until you change it. If you don't specify this, WAF uses the vendor's default version, and then keeps the version at the vendor's default when the vendor updates the managed rule group settings. \n"];
  name: string
    [@ocaml.doc
      "The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.\n"];
  vendor_name: string
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc
  "A rule statement used to run the rules that are defined in a managed rule group. To use this, provide the vendor name and the name of the rule group in this statement. You can retrieve the required names by calling [ListAvailableManagedRuleGroups].\n\n You cannot nest a [ManagedRuleGroupStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a managed rule group inside another rule group. You can only reference a managed rule group as a top-level statement within a rule that you define in a web ACL.\n \n   You are charged additional fees when you use the WAF Bot Control managed rule group [AWSManagedRulesBotControlRuleSet], the WAF Fraud Control account takeover prevention (ATP) managed rule group [AWSManagedRulesATPRuleSet], or the WAF Fraud Control account creation fraud prevention (ACFP) managed rule group [AWSManagedRulesACFPRuleSet]. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n    "]
and not_statement =
  {
  statement: statement
    [@ocaml.doc
      "The statement to negate. You can use any statement that can be nested.\n"]}
[@@ocaml.doc
  "A logical rule statement used to negate the results of another rule statement. You provide one [Statement] within the [NotStatement].\n"]
and or_statement =
  {
  statements: statement list
    [@ocaml.doc
      "The statements to combine with OR logic. You can use any statements that can be nested.\n"]}
[@@ocaml.doc
  "A logical rule statement used to combine other rule statements with OR logic. You provide more than one [Statement] within the [OrStatement]. \n"]
and rate_based_statement =
  {
  custom_keys: rate_based_statement_custom_key list option
    [@ocaml.doc
      "Specifies the aggregate keys to use in a rate-base rule. \n"];
  forwarded_ip_config: forwarded_ip_config option
    [@ocaml.doc
      "The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For (XFF) header, but you can specify any header name. \n\n  If the specified header isn't present in the request, WAF doesn't apply the rule to the web request at all.\n  \n    This is required if you specify a forwarded IP in the rule's aggregate key settings. \n    "];
  scope_down_statement: statement option
    [@ocaml.doc
      "An optional nested statement that narrows the scope of the web requests that are evaluated and managed by the rate-based statement. When you use a scope-down statement, the rate-based rule only tracks and rate limits requests that match the scope-down statement. You can use any nestable [Statement] in the scope-down statement, and you can nest statements at any level, the same as you can for a rule statement. \n"];
  aggregate_key_type: rate_based_statement_aggregate_key_type
    [@ocaml.doc
      "Setting that indicates how to aggregate the request counts. \n\n  Web requests that are missing any of the components specified in the aggregation keys are omitted from the rate-based rule evaluation and handling. \n  \n    {ul\n          {-   [CONSTANT] - Count and limit the requests that match the rate-based rule's scope-down statement. With this option, the counted requests aren't further aggregated. The scope-down statement is the only specification used. When the count of all requests that satisfy the scope-down statement goes over the limit, WAF applies the rule action to all requests that satisfy the scope-down statement. \n              \n               With this option, you must configure the [ScopeDownStatement] property. \n               \n                }\n          {-   [CUSTOM_KEYS] - Aggregate the request counts using one or more web request components as the aggregate keys.\n              \n               With this option, you must specify the aggregate keys in the [CustomKeys] property. \n               \n                To aggregate on only the IP address or only the forwarded IP address, don't use custom keys. Instead, set the aggregate key type to [IP] or [FORWARDED_IP].\n                \n                 }\n          {-   [FORWARDED_IP] - Aggregate the request counts on the first IP address in an HTTP header. \n              \n               With this option, you must specify the header to use in the [ForwardedIPConfig] property. \n               \n                To aggregate on a combination of the forwarded IP address with other aggregate keys, use [CUSTOM_KEYS]. \n                \n                 }\n          {-   [IP] - Aggregate the request counts on the IP address from the web request origin.\n              \n               To aggregate on a combination of the IP address with other aggregate keys, use [CUSTOM_KEYS]. \n               \n                }\n          }\n  "];
  evaluation_window_sec: int option
    [@ocaml.doc
      "The amount of time, in seconds, that WAF should include in its request counts, looking back from the current time. For example, for a setting of 120, when WAF checks the rate, it counts the requests for the 2 minutes immediately preceding the current time. Valid settings are 60, 120, 300, and 600. \n\n This setting doesn't determine how often WAF checks the rate, but how far back it looks each time it checks. WAF checks the rate about every 10 seconds.\n \n  Default: [300] (5 minutes)\n  "];
  limit: int
    [@ocaml.doc
      "The limit on requests during the specified evaluation window for a single aggregation instance for the rate-based rule. If the rate-based statement includes a [ScopeDownStatement], this limit is applied only to the requests that match the statement.\n\n Examples: \n \n  {ul\n        {-  If you aggregate on just the IP address, this is the limit on requests from any single IP address. \n            \n             }\n        {-  If you aggregate on the HTTP method and the query argument name \"city\", then this is the limit on requests for any single method, city pair. \n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast a rate. The rule categorizes requests according to your aggregation criteria, collects them into aggregation instances, and counts and rate limits the requests for each instance. \n\n  If you change any of these settings in a rule that's currently in use, the change resets the rule's rate limiting counts. This can pause the rule's rate limiting activities for up to a minute. \n  \n    You can specify individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie. \n    \n     Each unique set of values for the aggregation keys that you specify is a separate aggregation instance, with the value from each key contributing to the aggregation instance definition. \n     \n      For example, assume the rule evaluates web requests with the following IP address and HTTP method values: \n      \n       {ul\n             {-  IP address 10.1.1.1, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             {-  IP address 127.0.0.0, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             }\n   The rule would create different aggregation instances according to your aggregation criteria, for example: \n   \n    {ul\n          {-  If the aggregation criteria is just the IP address, then each individual address is an aggregation instance, and WAF counts requests separately for each. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1: count 3\n                         \n                          }\n                     {-  IP address 127.0.0.0: count 1\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  HTTP method POST: count 2\n                         \n                          }\n                     {-  HTTP method GET: count 2\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is IP address and HTTP method, then each IP address and each HTTP method would contribute to the combined aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1, HTTP method POST: count 1\n                         \n                          }\n                     {-  IP address 10.1.1.1, HTTP method GET: count 2\n                         \n                          }\n                     {-  IP address 127.0.0.0, HTTP method POST: count 1\n                         \n                          }\n                     \n           }\n            }\n          }\n   For any n-tuple of aggregation keys, each unique combination of values for the keys defines a separate aggregation instance, which WAF counts and rate-limits individually. \n   \n    You can optionally nest another statement inside the rate-based statement, to narrow the scope of the rule so that it only counts and rate limits requests that match the nested statement. You can use this nested scope-down statement in conjunction with your aggregation key specifications or you can just count and rate limit all requests that match the scope-down statement, without additional aggregation. When you choose to just manage all requests that match a scope-down statement, the aggregation instance is singular for the rule. \n    \n     You cannot nest a [RateBasedStatement] inside another statement, for example inside a [NotStatement] or [OrStatement]. You can define a [RateBasedStatement] inside a web ACL and inside a rule group. \n     \n      For additional information about the options, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html}Rate limiting web requests using rate-based rules} in the {i WAF Developer Guide}. \n      \n       If you only aggregate on the individual IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently rate limiting for a rule through the API call [GetRateBasedStatementManagedKeys]. This option is not available for other aggregation configurations.\n       \n        WAF tracks and manages web requests separately for each instance of a rate-based rule that you use. For example, if you provide the same rate-based rule settings in two web ACLs, each of the two rule statements represents a separate instance of the rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule inside a rule group, and then use that rule group in multiple places, each use creates a separate instance of the rate-based rule that gets its own tracking and management by WAF. \n        "]
and statement =
  {
  asn_match_statement: asn_match_statement option
    [@ocaml.doc
      "A rule statement that inspects web traffic based on the Autonomous System Number (ASN) associated with the request's IP address.\n\n For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-asn-match.html}ASN match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}. \n "];
  regex_match_statement: regex_match_statement option
    [@ocaml.doc
      "A rule statement used to search web request components for a match against a single regular expression. \n"];
  label_match_statement: label_match_statement option
    [@ocaml.doc
      "A rule statement to match against labels that have been added to the web request by rules that have already run in the web ACL. \n\n The label match statement provides the label or namespace string to search for. The label string can represent a part or all of the fully qualified label name that had been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. If you do not provide the fully qualified name in your label match string, WAF performs the search for labels that were added in the same context as the label match statement. \n "];
  managed_rule_group_statement: managed_rule_group_statement option
    [@ocaml.doc
      "A rule statement used to run the rules that are defined in a managed rule group. To use this, provide the vendor name and the name of the rule group in this statement. You can retrieve the required names by calling [ListAvailableManagedRuleGroups].\n\n You cannot nest a [ManagedRuleGroupStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a managed rule group inside another rule group. You can only reference a managed rule group as a top-level statement within a rule that you define in a web ACL.\n \n   You are charged additional fees when you use the WAF Bot Control managed rule group [AWSManagedRulesBotControlRuleSet], the WAF Fraud Control account takeover prevention (ATP) managed rule group [AWSManagedRulesATPRuleSet], or the WAF Fraud Control account creation fraud prevention (ACFP) managed rule group [AWSManagedRulesACFPRuleSet]. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n    "];
  not_statement: not_statement option
    [@ocaml.doc
      "A logical rule statement used to negate the results of another rule statement. You provide one [Statement] within the [NotStatement].\n"];
  or_statement: or_statement option
    [@ocaml.doc
      "A logical rule statement used to combine other rule statements with OR logic. You provide more than one [Statement] within the [OrStatement]. \n"];
  and_statement: and_statement option
    [@ocaml.doc
      "A logical rule statement used to combine other rule statements with AND logic. You provide more than one [Statement] within the [AndStatement]. \n"];
  rate_based_statement: rate_based_statement option
    [@ocaml.doc
      "A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast a rate. The rule categorizes requests according to your aggregation criteria, collects them into aggregation instances, and counts and rate limits the requests for each instance. \n\n  If you change any of these settings in a rule that's currently in use, the change resets the rule's rate limiting counts. This can pause the rule's rate limiting activities for up to a minute. \n  \n    You can specify individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie. \n    \n     Each unique set of values for the aggregation keys that you specify is a separate aggregation instance, with the value from each key contributing to the aggregation instance definition. \n     \n      For example, assume the rule evaluates web requests with the following IP address and HTTP method values: \n      \n       {ul\n             {-  IP address 10.1.1.1, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             {-  IP address 127.0.0.0, HTTP method POST\n                 \n                  }\n             {-  IP address 10.1.1.1, HTTP method GET\n                 \n                  }\n             }\n   The rule would create different aggregation instances according to your aggregation criteria, for example: \n   \n    {ul\n          {-  If the aggregation criteria is just the IP address, then each individual address is an aggregation instance, and WAF counts requests separately for each. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1: count 3\n                         \n                          }\n                     {-  IP address 127.0.0.0: count 1\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  HTTP method POST: count 2\n                         \n                          }\n                     {-  HTTP method GET: count 2\n                         \n                          }\n                     \n           }\n            }\n          {-  If the aggregation criteria is IP address and HTTP method, then each IP address and each HTTP method would contribute to the combined aggregation instance. The aggregation instances and request counts for our example would be the following: \n              \n               {ul\n                     {-  IP address 10.1.1.1, HTTP method POST: count 1\n                         \n                          }\n                     {-  IP address 10.1.1.1, HTTP method GET: count 2\n                         \n                          }\n                     {-  IP address 127.0.0.0, HTTP method POST: count 1\n                         \n                          }\n                     \n           }\n            }\n          }\n   For any n-tuple of aggregation keys, each unique combination of values for the keys defines a separate aggregation instance, which WAF counts and rate-limits individually. \n   \n    You can optionally nest another statement inside the rate-based statement, to narrow the scope of the rule so that it only counts and rate limits requests that match the nested statement. You can use this nested scope-down statement in conjunction with your aggregation key specifications or you can just count and rate limit all requests that match the scope-down statement, without additional aggregation. When you choose to just manage all requests that match a scope-down statement, the aggregation instance is singular for the rule. \n    \n     You cannot nest a [RateBasedStatement] inside another statement, for example inside a [NotStatement] or [OrStatement]. You can define a [RateBasedStatement] inside a web ACL and inside a rule group. \n     \n      For additional information about the options, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rate-based-rules.html}Rate limiting web requests using rate-based rules} in the {i WAF Developer Guide}. \n      \n       If you only aggregate on the individual IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently rate limiting for a rule through the API call [GetRateBasedStatementManagedKeys]. This option is not available for other aggregation configurations.\n       \n        WAF tracks and manages web requests separately for each instance of a rate-based rule that you use. For example, if you provide the same rate-based rule settings in two web ACLs, each of the two rule statements represents a separate instance of the rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule inside a rule group, and then use that rule group in multiple places, each use creates a separate instance of the rate-based rule that gets its own tracking and management by WAF. \n        "];
  regex_pattern_set_reference_statement:
    regex_pattern_set_reference_statement option
    [@ocaml.doc
      "A rule statement used to search web request components for matches with regular expressions. To use this, create a [RegexPatternSet] that specifies the expressions that you want to detect, then use the ARN of that set in this statement. A web request matches the pattern set rule statement if the request component matches any of the patterns in the set. To create a regex pattern set, see [CreateRegexPatternSet].\n\n Each regex pattern set rule statement references a regex pattern set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "];
  ip_set_reference_statement: ip_set_reference_statement option
    [@ocaml.doc
      "A rule statement used to detect web requests coming from particular IP addresses or address ranges. To use this, create an [IPSet] that specifies the addresses you want to detect, then use the ARN of that set in this statement. To create an IP set, see [CreateIPSet].\n\n Each IP set rule statement references an IP set. You create and maintain the set independent of your rules. This allows you to use the single set in multiple rules. When you update the referenced set, WAF automatically updates all rules that reference it.\n "];
  rule_group_reference_statement: rule_group_reference_statement option
    [@ocaml.doc
      "A rule statement used to run the rules that are defined in a [RuleGroup]. To use this, create a rule group with your rules, then provide the ARN of the rule group in this statement.\n\n You cannot nest a [RuleGroupReferenceStatement], for example for use inside a [NotStatement] or [OrStatement]. You cannot use a rule group reference statement inside another rule group. You can only reference a rule group as a top-level statement within a rule that you define in a web ACL.\n "];
  geo_match_statement: geo_match_statement option
    [@ocaml.doc
      "A rule statement that labels web requests by country and region and that matches against web requests based on country code. A geo match rule labels every request that it inspects regardless of whether it finds a match.\n\n {ul\n       {-  To manage requests only by country, you can use this statement by itself and specify the countries that you want to match against in the [CountryCodes] array. \n           \n            }\n       {-  Otherwise, configure your geo match rule with Count action so that it only labels requests. Then, add one or more label match rules to run after the geo match rule and configure them to match against the geographic labels and handle the requests as needed. \n           \n            }\n       }\n   WAF labels requests using the alpha-2 country and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF determines the codes using either the IP address in the web request origin or, if you specify it, the address in the geo match [ForwardedIPConfig]. \n   \n    If you use the web request origin, the label formats are \n    {[\n    awswaf:clientip:geo:region:-\n    ]}\n     and \n    {[\n    awswaf:clientip:geo:country:\n    ]}\n    .\n    \n     If you use a forwarded IP address, the label formats are \n     {[\n     awswaf:forwardedip:geo:region:-\n     ]}\n      and \n     {[\n     awswaf:forwardedip:geo:country:\n     ]}\n     .\n     \n      For additional details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-rule-statement-type-geo-match.html}Geographic match rule statement} in the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}WAF Developer Guide}. \n      "];
  size_constraint_statement: size_constraint_statement option
    [@ocaml.doc
      "A rule statement that compares a number of bytes against the size of a request component, using a comparison operator, such as greater than (>) or less than (<). For example, you can use a size constraint statement to look for query strings that are longer than 100 bytes. \n\n If you configure WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit for the web ACL and protected resource type. If you know that the request body for your web requests should never exceed the inspection limit, you can use a size constraint statement to block requests that have a larger request body size. For more information about the inspection limits, see [Body] and [JsonBody] settings for the [FieldToMatch] data type. \n \n  If you choose URI for the value of Part of the request to filter on, the slash (/) in the URI counts as one character. For example, the URI [/logo.jpg] is nine characters long.\n  "];
  xss_match_statement: xss_match_statement option
    [@ocaml.doc
      "A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into other legitimate web browsers. \n"];
  sqli_match_statement: sqli_match_statement option
    [@ocaml.doc
      "A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web requests to do things like modify your database or extract data from it. \n"];
  byte_match_statement: byte_match_statement option
    [@ocaml.doc
      "A rule statement that defines a string match search for WAF to apply to web requests. The byte match statement provides the bytes to search for, the location in requests that you want WAF to search, and other settings. The bytes to search for are typically a string that corresponds with ASCII characters. In the WAF console and the developer guide, this is called a string match statement.\n"]}
[@@ocaml.doc
  "The processing guidance for a [Rule], used by WAF to determine whether a web request matches the rule. \n\n For example specifications, see the examples section of [CreateWebACL].\n "]
type nonrec override_action =
  {
  none: unit option
    [@ocaml.doc
      "Don't override the rule group evaluation result. This is the most common setting.\n"];
  count: count_action option
    [@ocaml.doc
      "Override the rule group evaluation result to count only. \n\n  This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings. \n  \n   "]}
[@@ocaml.doc
  "The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only. \n\n You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement]. \n \n   This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings. \n   \n    "]
type nonrec label = {
  name: string [@ocaml.doc "The label string. \n"]}[@@ocaml.doc
                                                     "A single label container. This is used as an element of a label array in multiple contexts, for example, in [RuleLabels] inside a [Rule] and in [Labels] inside a [SampledHTTPRequest]. \n"]
type nonrec visibility_config =
  {
  metric_name: string
    [@ocaml.doc
      "A name of the Amazon CloudWatch metric dimension. The name can contain only the characters: A-Z, a-z, 0-9, - (hyphen), and _ (underscore). The name can be from one to 128 characters long. It can't contain whitespace or metric names that are reserved for WAF, for example [All] and [Default_Action]. \n"];
  cloud_watch_metrics_enabled: bool
    [@ocaml.doc
      "Indicates whether the associated resource sends metrics to Amazon CloudWatch. For the list of available metrics, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#waf-metrics}WAF Metrics} in the {i WAF Developer Guide}.\n\n For web ACLs, the metrics are for web requests that have the web ACL default action applied. WAF applies the default action to web requests that pass the inspection of all rules in the web ACL without being either allowed or blocked. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-default-action.html}The web ACL default action} in the {i WAF Developer Guide}.\n "];
  sampled_requests_enabled: bool
    [@ocaml.doc
      "Indicates whether WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the WAF console. \n\n If you configure data protection for the web ACL, the protection applies to the web ACL's sampled web request data. \n \n   Request sampling doesn't provide a field redaction option, and any field redaction that you specify in your logging configuration doesn't affect sampling. You can only exclude fields from request sampling by disabling sampling in the web ACL visibility configuration or by configuring data protection for the web ACL.\n   \n    "]}
[@@ocaml.doc
  "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"]
type nonrec immunity_time_property =
  {
  immunity_time: int
    [@ocaml.doc
      "The amount of time, in seconds, that a [CAPTCHA] or challenge timestamp is considered valid by WAF. The default setting is 300. \n\n For the Challenge action, the minimum setting is 300. \n "]}
[@@ocaml.doc
  "Used for CAPTCHA and challenge token settings. Determines how long a [CAPTCHA] or challenge timestamp remains valid after WAF updates it for a successful [CAPTCHA] or challenge response. \n"]
type nonrec captcha_config =
  {
  immunity_time_property: immunity_time_property option
    [@ocaml.doc
      "Determines how long a [CAPTCHA] timestamp in the token remains valid after the client successfully solves a [CAPTCHA] puzzle. \n"]}
[@@ocaml.doc
  "Specifies how WAF should handle [CAPTCHA] evaluations. This is available at the web ACL level and in each rule. \n"]
type nonrec challenge_config =
  {
  immunity_time_property: immunity_time_property option
    [@ocaml.doc
      "Determines how long a challenge timestamp in the token remains valid after the client successfully responds to a challenge. \n"]}
[@@ocaml.doc
  "Specifies how WAF should handle [Challenge] evaluations. This is available at the web ACL level and in each rule. \n"]
type nonrec rule =
  {
  challenge_config: challenge_config option
    [@ocaml.doc
      "Specifies how WAF should handle [Challenge] evaluations. If you don't specify this, WAF uses the challenge configuration that's defined for the web ACL. \n"];
  captcha_config: captcha_config option
    [@ocaml.doc
      "Specifies how WAF should handle [CAPTCHA] evaluations. If you don't specify this, WAF uses the [CAPTCHA] configuration that's defined for the web ACL. \n"];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n\n If you change the name of a [Rule] after you create it and you want the rule's metric name to reflect the change, update the metric name as well. WAF doesn't automatically update the metric name. \n "];
  rule_labels: label list option
    [@ocaml.doc
      "Labels to apply to web requests that match the rule match statement. WAF applies fully qualified labels to matching web requests. A fully qualified label is the concatenation of a label namespace and a rule label. The rule's rule group or web ACL defines the label namespace. \n\n  Any rule that isn't a rule group reference statement or managed rule group statement can add labels to matching web requests.\n  \n    Rules that run after this rule in the web ACL can match against these labels using a [LabelMatchStatement].\n    \n     For each label, provide a case-sensitive string containing optional namespaces and a label name, according to the following guidelines:\n     \n      {ul\n            {-  Separate each component of the label with a colon. \n                \n                 }\n            {-  Each namespace or name can have up to 128 characters.\n                \n                 }\n            {-  You can specify up to 5 namespaces in a label.\n                \n                 }\n            {-  Don't use the following reserved words in your label specification: [aws], [waf], [managed], [rulegroup], [webacl], [regexpatternset], or [ipset].\n                \n                 }\n            }\n   For example, [myLabelName] or [nameSpace1:nameSpace2:myLabelName]. \n   "];
  override_action: override_action option
    [@ocaml.doc
      "The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only. \n\n You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement]. \n \n   This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings. \n   \n    "];
  action: rule_action option
    [@ocaml.doc
      "The action that WAF should take on a web request when it matches the rule statement. Settings at the web ACL level can override the rule action setting. \n\n This is used only for rules whose statements do not reference a rule group. Rule statements that reference a rule group include [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement]. \n \n  You must specify either this [Action] setting or the rule [OverrideAction] setting, but not both:\n  \n   {ul\n         {-  If the rule statement does not reference a rule group, use this rule action setting and not the rule override action setting. \n             \n              }\n         {-  If the rule statement references a rule group, use the override action setting and not this action setting. \n             \n              }\n         }\n  "];
  statement: statement
    [@ocaml.doc
      "The WAF processing statement for the rule, for example [ByteMatchStatement] or [SizeConstraintStatement]. \n"];
  priority: int
    [@ocaml.doc
      "If you define more than one [Rule] in a [WebACL], WAF evaluates each request against the [Rules] in order based on the value of [Priority]. WAF processes rules with lower priority first. The priorities don't need to be consecutive, but they must all be different.\n"];
  name: string
    [@ocaml.doc
      "The name of the rule. \n\n If you change the name of a [Rule] after you create it and you want the rule's metric name to reflect the change, update the metric name in the rule's [VisibilityConfig] settings. WAF doesn't automatically update the metric name when you update the rule name. \n "]}
[@@ocaml.doc
  "A single rule, which you can use in a [WebACL] or [RuleGroup] to identify web requests that you want to manage in some way. Each rule includes one top-level [Statement] that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"]
type nonrec field_to_protect_type =
  | BODY [@ocaml.doc ""]
  | QUERY_STRING [@ocaml.doc ""]
  | SINGLE_QUERY_ARGUMENT [@ocaml.doc ""]
  | SINGLE_COOKIE [@ocaml.doc ""]
  | SINGLE_HEADER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec field_to_protect =
  {
  field_keys: string list option
    [@ocaml.doc
      "Specifies the keys to protect for the specified field type. If you don't specify any key, then all keys for the field type are protected. \n"];
  field_type: field_to_protect_type
    [@ocaml.doc "Specifies the web request component type to protect. \n"]}
[@@ocaml.doc
  "Specifies a field type and keys to protect in stored web request data. This is part of the data protection configuration for a web ACL. \n"]
type nonrec data_protection_action =
  | HASH [@ocaml.doc ""]
  | SUBSTITUTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec data_protection =
  {
  exclude_rate_based_details: bool option
    [@ocaml.doc
      "Specifies whether to also exclude any rate-based rule details from the data protection you have enabled for a given field. If you specify this exception, RateBasedDetails will show the value of the field. For additional information, see the log field [rateBasedRuleList] at {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields for web ACL traffic} in the {i WAF Developer Guide}.\n\n Default: [FALSE] \n "];
  exclude_rule_match_details: bool option
    [@ocaml.doc
      "Specifies whether to also exclude any rule match details from the data protection you have enabled for a given field. WAF logs these details for non-terminating matching rules and for the terminating matching rule. For additional information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging-fields.html}Log fields for web ACL traffic} in the {i WAF Developer Guide}.\n\n Default: [FALSE] \n "];
  action: data_protection_action
    [@ocaml.doc
      "Specifies how to protect the field. WAF can apply a one-way hash to the field or hard code a string substitution. \n\n {ul\n       {-  One-way hash example: [ade099751dEXAMPLEHASH2ea9f3393f80dd5d3bEXAMPLEHASH966ae0d3cd5a1e] \n           \n            }\n       {-  Substitution example: [REDACTED] \n           \n            }\n       }\n  "];
  field: field_to_protect
    [@ocaml.doc
      "Specifies the field type and optional keys to apply the protection behavior to. \n"]}
[@@ocaml.doc
  "Specifies the protection behavior for a field type. This is part of the data protection configuration for a web ACL. \n"]
type nonrec data_protection_config =
  {
  data_protections: data_protection list
    [@ocaml.doc
      "An array of data protection configurations for specific web request field types. This is defined for each web ACL. WAF applies the specified protection to all web requests that the web ACL inspects. \n"]}
[@@ocaml.doc
  "Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level data protection option. \n\n The data protection that you configure for the web ACL alters the data that's available for any other data collection activity, including your WAF logging destinations, web ACL request sampling, and Amazon Security Lake data collection and management. Your other option for data protection is in the logging configuration, which only affects logging. \n \n  This is part of the data protection configuration for a web ACL. \n  "]
type nonrec firewall_manager_statement =
  {
  rule_group_reference_statement: rule_group_reference_statement option
    [@ocaml.doc
      "A statement used by Firewall Manager to run the rules that are defined in a rule group. This is managed by Firewall Manager for an Firewall Manager WAF policy.\n"];
  managed_rule_group_statement: managed_rule_group_statement option
    [@ocaml.doc
      "A statement used by Firewall Manager to run the rules that are defined in a managed rule group. This is managed by Firewall Manager for an Firewall Manager WAF policy.\n"]}
[@@ocaml.doc
  "The processing guidance for an Firewall Manager rule. This is like a regular rule [Statement], but it can only contain a single rule group reference.\n"]
type nonrec firewall_manager_rule_group =
  {
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  override_action: override_action
    [@ocaml.doc
      "The action to use in the place of the action that results from the rule group evaluation. Set the override action to none to leave the result of the rule group alone. Set it to count to override the result to count only. \n\n You can only use this for rule statements that reference a rule group, like [RuleGroupReferenceStatement] and [ManagedRuleGroupStatement]. \n \n   This option is usually set to none. It does not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to only count matches, do not use this and instead use the rule action override option, with [Count] action, in your rule group reference statement settings. \n   \n    "];
  firewall_manager_statement: firewall_manager_statement
    [@ocaml.doc
      "The processing guidance for an Firewall Manager rule. This is like a regular rule [Statement], but it can only contain a rule group reference.\n"];
  priority: int
    [@ocaml.doc
      "If you define more than one rule group in the first or last Firewall Manager rule groups, WAF evaluates each request against the rule groups in order, starting from the lowest priority setting. The priorities don't need to be consecutive, but they must all be different.\n"];
  name: string
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc
  "A rule group that's defined for an Firewall Manager WAF policy.\n"]
type nonrec response_content_type =
  | APPLICATION_JSON [@ocaml.doc ""]
  | TEXT_HTML [@ocaml.doc ""]
  | TEXT_PLAIN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec custom_response_body =
  {
  content: string
    [@ocaml.doc
      "The payload of the custom response. \n\n You can use JSON escape strings in JSON content. To do this, you must specify JSON content in the [ContentType] setting. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  content_type: response_content_type
    [@ocaml.doc
      "The type of content in the payload that you are defining in the [Content] string.\n"]}
[@@ocaml.doc
  "The response body to use in a custom response to a web request. This is referenced by key from [CustomResponse] [CustomResponseBodyKey].\n"]
type nonrec custom_response_bodies = (string * custom_response_body) list
[@@ocaml.doc ""]
type nonrec size_inspection_limit =
  | KB_64 [@ocaml.doc ""]
  | KB_48 [@ocaml.doc ""]
  | KB_32 [@ocaml.doc ""]
  | KB_16 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec request_body_associated_resource_type_config =
  {
  default_size_inspection_limit: size_inspection_limit
    [@ocaml.doc
      "Specifies the maximum size of the web request body component that an associated CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resource should send to WAF for inspection. This applies to statements in the web ACL that inspect the body or JSON body. \n\n Default: [16 KB (16,384 bytes)] \n "]}
[@@ocaml.doc
  "Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size is 16 KB (16,384 bytes). You can change the setting for any of the available resource types. \n\n  You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n  \n    Example JSON: [ {\n    \"API_GATEWAY\": \"KB_48\",\n    \"APP_RUNNER_SERVICE\": \"KB_32\"\n    }] \n    \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     \n      This is used in the [AssociationConfig] of the web ACL. \n      "]
type nonrec associated_resource_type =
  | VERIFIED_ACCESS_INSTANCE [@ocaml.doc ""]
  | APP_RUNNER_SERVICE [@ocaml.doc ""]
  | COGNITO_USER_POOL [@ocaml.doc ""]
  | API_GATEWAY [@ocaml.doc ""]
  | CLOUDFRONT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec request_body =
  (associated_resource_type * request_body_associated_resource_type_config)
    list[@@ocaml.doc ""]
type nonrec association_config =
  {
  request_body: request_body option
    [@ocaml.doc
      "Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size is 16 KB (16,384 bytes). You can change the setting for any of the available resource types. \n\n  You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n  \n    Example JSON: [ {\n    \"API_GATEWAY\": \"KB_48\",\n    \"APP_RUNNER_SERVICE\": \"KB_32\"\n    }] \n    \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "]}
[@@ocaml.doc
  "Specifies custom configurations for the associations between the web ACL and protected resources. \n\n Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). \n \n   You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "]
type nonrec low_reputation_mode =
  | ALWAYS_ON [@ocaml.doc ""]
  | ACTIVE_UNDER_DDOS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec on_source_d_do_s_protection_config =
  {
  alb_low_reputation_mode: low_reputation_mode
    [@ocaml.doc
      "The level of DDoS protection that applies to web ACLs associated with Application Load Balancers. [ACTIVE_UNDER_DDOS] protection is enabled by default whenever a web ACL is associated with an Application Load Balancer. In the event that an Application Load Balancer experiences high-load conditions or suspected DDoS attacks, the [ACTIVE_UNDER_DDOS] protection automatically rate limits traffic from known low reputation sources without disrupting Application Load Balancer availability. [ALWAYS_ON] protection provides constant, always-on monitoring of known low reputation sources for suspected DDoS attacks. While this provides a higher level of protection, there may be potential impacts on legitimate traffic.\n"]}
[@@ocaml.doc
  "Configures the level of DDoS protection that applies to web ACLs associated with Application Load Balancers.\n"]
type nonrec application_attribute =
  {
  values: string list option [@ocaml.doc "Specifies the attribute value.\n"];
  name: string option [@ocaml.doc "Specifies the attribute name.\n"]}
[@@ocaml.doc
  "Application details defined during the web ACL creation process. Application attributes help WAF give recommendations for protection packs.\n"]
type nonrec application_config =
  {
  attributes: application_attribute list option
    [@ocaml.doc
      "Contains the attribute name and a list of values for that attribute.\n"]}
[@@ocaml.doc
  "A list of [ApplicationAttribute]s that contains information about the application.\n"]
type nonrec web_ac_l =
  {
  application_config: application_config option
    [@ocaml.doc "Returns a list of [ApplicationAttribute]s.\n"];
  on_source_d_do_s_protection_config:
    on_source_d_do_s_protection_config option
    [@ocaml.doc
      "Configures the level of DDoS protection that applies to web ACLs associated with Application Load Balancers.\n"];
  retrofitted_by_firewall_manager: bool option
    [@ocaml.doc
      "Indicates whether this web ACL was created by a customer account and then retrofitted by Firewall Manager. If true, then the web ACL is currently being managed by a Firewall Manager WAF policy, and only Firewall Manager can manage any Firewall Manager rule groups in the web ACL. See also the properties [ManagedByFirewallManager], [PreProcessFirewallManagerRuleGroups], and [PostProcessFirewallManagerRuleGroups]. \n"];
  association_config: association_config option
    [@ocaml.doc
      "Specifies custom configurations for the associations between the web ACL and protected resources. \n\n Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). \n \n   You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "];
  token_domains: string list option
    [@ocaml.doc
      "Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.\n"];
  challenge_config: challenge_config option
    [@ocaml.doc
      "Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig]. \n"];
  captcha_config: captcha_config option
    [@ocaml.doc
      "Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig]. \n"];
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  label_namespace: string option
    [@ocaml.doc
      "The label namespace prefix for this web ACL. All labels added by rules in this web ACL have this prefix. \n\n {ul\n       {-  The syntax for the label namespace prefix for a web ACL is the following: \n           \n             \n            {[\n            awswaf::webacl::\n            ]}\n             \n            \n             }\n       {-  When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon: \n           \n             \n            {[\n            :\n            ]}\n             \n            \n             }\n       }\n  "];
  managed_by_firewall_manager: bool option
    [@ocaml.doc
      "Indicates whether this web ACL was created by Firewall Manager and is being managed by Firewall Manager. If true, then only Firewall Manager can delete the web ACL or any Firewall Manager rule groups in the web ACL. See also the properties [RetrofittedByFirewallManager], [PreProcessFirewallManagerRuleGroups], and [PostProcessFirewallManagerRuleGroups]. \n"];
  post_process_firewall_manager_rule_groups:
    firewall_manager_rule_group list option
    [@ocaml.doc
      "The last set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF policy and contains only rule group references. You can't alter these. Any rules and rule groups that you define for the web ACL are prioritized before these. \n\n In the Firewall Manager WAF policy, the Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a set of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to determine their relative processing order.\n "];
  pre_process_firewall_manager_rule_groups:
    firewall_manager_rule_group list option
    [@ocaml.doc
      "The first set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF policy and contains only rule group references. You can't alter these. Any rules and rule groups that you define for the web ACL are prioritized after these. \n\n In the Firewall Manager WAF policy, the Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a set of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to determine their relative processing order.\n "];
  capacity: int option
    [@ocaml.doc
      "The web ACL capacity units (WCUs) currently being used by this web ACL. \n\n WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n "];
  data_protection_config: data_protection_config option
    [@ocaml.doc
      "Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level data protection option. \n\n The data protection that you configure for the web ACL alters the data that's available for any other data collection activity, including your WAF logging destinations, web ACL request sampling, and Amazon Security Lake data collection and management. Your other option for data protection is in the logging configuration, which only affects logging. \n "];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the web ACL that helps with identification. \n"];
  default_action: default_action
    [@ocaml.doc
      "The action to perform if none of the [Rules] contained in the [WebACL] match. \n"];
  ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.\n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the [WebACL]. This ID is returned in the responses to create and list commands. You use this ID to do things like get, update, and delete a [WebACL].\n"];
  name: string
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc
  " A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web Services Verified Access instance. \n"]
type nonrec waf_unsupported_aggregate_key_type_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The rule that you've named doesn't aggregate solely on the IP address or solely on the forwarded IP address. This call is only available for rate-based rules with an [AggregateKeyType] setting of [IP] or [FORWARDED_IP].\n"]
type nonrec waf_unavailable_entity_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t retrieve a resource that you specified for this operation. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate. Verify the resource specifications in your request parameters and then retry the operation.\n"]
type nonrec waf_tag_operation_internal_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform your tagging operation because of an internal error. Retry your request.\n"]
type nonrec waf_tag_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An error occurred during the tagging operation. Retry your request.\n"]
type nonrec waf_subscription_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You tried to use a managed rule group that's available by subscription, but you aren't subscribed to it yet. \n"]
type nonrec waf_service_linked_role_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF is not able to access the service linked role. This can be caused by a previous [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. Please try your request again. The service linked role can also be locked by a previous [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you recently made a call to [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. If you receive this same exception again, you will have to wait additional time until the role is unlocked.\n"]
type nonrec waf_optimistic_lock_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t save your changes because you tried to update or delete a resource that has changed since you last retrieved it. Get the resource again, make any changes you need to make to the new copy, and retry your operation. \n"]
type nonrec waf_nonexistent_item_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform the operation because your resource doesn't exist. If you've just created a resource that you're using in this operation, you might just need to wait a few minutes. It can take from a few seconds to a number of minutes for changes to propagate. \n"]
type nonrec waf_log_destination_permission_issue_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because you don't have the permissions that your logging configuration requires. For information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n"]
type nonrec waf_limits_exceeded_exception =
  {
  source_type: string option [@ocaml.doc "Source type for the exception. \n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform the operation because you exceeded your resource limit. For example, the maximum number of [WebACL] objects that you can create for an Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}.\n"]
type nonrec waf_invalid_resource_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform the operation because the resource that you requested isn\226\128\153t valid. Check the resource, and try again.\n"]
type nonrec waf_invalid_permission_policy_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because the specified policy isn't in the proper format. \n\n The policy specifications must conform to the following:\n \n  {ul\n        {-  The policy must be composed using IAM Policy version 2012-10-17.\n            \n             }\n        {-  The policy must include specifications for [Effect], [Action], and [Principal].\n            \n             }\n        {-   [Effect] must specify [Allow].\n            \n             }\n        {-   [Action] must specify [wafv2:CreateWebACL], [wafv2:UpdateWebACL], and [wafv2:PutFirewallManagerRuleGroups] and may optionally specify [wafv2:GetRuleGroup]. WAF rejects any extra actions or wildcard actions in the policy.\n            \n             }\n        {-  The policy must not include a [Resource] parameter.\n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}. \n   "]
type nonrec parameter_exception_field =
  | LOW_REPUTATION_MODE [@ocaml.doc ""]
  | DATA_PROTECTION_CONFIG [@ocaml.doc ""]
  | ACP_RULE_SET_RESPONSE_INSPECTION [@ocaml.doc ""]
  | CUSTOM_KEYS [@ocaml.doc ""]
  | SCOPE_DOWN [@ocaml.doc ""]
  | ASSOCIATED_RESOURCE_TYPE [@ocaml.doc ""]
  | ATP_RULE_SET_RESPONSE_INSPECTION [@ocaml.doc ""]
  | TOKEN_DOMAIN [@ocaml.doc ""]
  | CHALLENGE_CONFIG [@ocaml.doc ""]
  | OVERSIZE_HANDLING [@ocaml.doc ""]
  | MAP_MATCH_SCOPE [@ocaml.doc ""]
  | COOKIE_MATCH_PATTERN [@ocaml.doc ""]
  | HEADER_MATCH_PATTERN [@ocaml.doc ""]
  | PAYLOAD_TYPE [@ocaml.doc ""]
  | MANAGED_RULE_GROUP_CONFIG [@ocaml.doc ""]
  | LOG_DESTINATION [@ocaml.doc ""]
  | ASSOCIABLE_RESOURCE [@ocaml.doc ""]
  | CHANGE_PROPAGATION_STATUS [@ocaml.doc ""]
  | EXPIRE_TIMESTAMP [@ocaml.doc ""]
  | FILTER_CONDITION [@ocaml.doc ""]
  | LOGGING_FILTER [@ocaml.doc ""]
  | BODY_PARSING_FALLBACK_BEHAVIOR [@ocaml.doc ""]
  | JSON_MATCH_SCOPE [@ocaml.doc ""]
  | JSON_MATCH_PATTERN [@ocaml.doc ""]
  | CUSTOM_RESPONSE_BODY [@ocaml.doc ""]
  | CUSTOM_RESPONSE [@ocaml.doc ""]
  | RESPONSE_CONTENT_TYPE [@ocaml.doc ""]
  | CUSTOM_REQUEST_HANDLING [@ocaml.doc ""]
  | HEADER_NAME [@ocaml.doc ""]
  | IP_SET_FORWARDED_IP_CONFIG [@ocaml.doc ""]
  | FORWARDED_IP_CONFIG [@ocaml.doc ""]
  | POSITION [@ocaml.doc ""]
  | FALLBACK_BEHAVIOR [@ocaml.doc ""]
  | FIREWALL_MANAGER_STATEMENT [@ocaml.doc ""]
  | METRIC_NAME [@ocaml.doc ""]
  | TAG_KEYS [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | RESOURCE_ARN [@ocaml.doc ""]
  | SCOPE_VALUE [@ocaml.doc ""]
  | OVERRIDE_ACTION [@ocaml.doc ""]
  | ENTITY_LIMIT [@ocaml.doc ""]
  | RULE_ACTION [@ocaml.doc ""]
  | DEFAULT_ACTION [@ocaml.doc ""]
  | SINGLE_HEADER [@ocaml.doc ""]
  | SINGLE_QUERY_ARGUMENT [@ocaml.doc ""]
  | TEXT_TRANSFORMATION [@ocaml.doc ""]
  | FIELD_TO_MATCH [@ocaml.doc ""]
  | IP_ADDRESS_VERSION [@ocaml.doc ""]
  | IP_ADDRESS [@ocaml.doc ""]
  | NOT_STATEMENT [@ocaml.doc ""]
  | OR_STATEMENT [@ocaml.doc ""]
  | AND_STATEMENT [@ocaml.doc ""]
  | LABEL_MATCH_STATEMENT [@ocaml.doc ""]
  | MANAGED_RULE_SET_STATEMENT [@ocaml.doc ""]
  | IP_SET_REFERENCE_STATEMENT [@ocaml.doc ""]
  | REGEX_PATTERN_REFERENCE_STATEMENT [@ocaml.doc ""]
  | RULE_GROUP_REFERENCE_STATEMENT [@ocaml.doc ""]
  | RATE_BASED_STATEMENT [@ocaml.doc ""]
  | GEO_MATCH_STATEMENT [@ocaml.doc ""]
  | SIZE_CONSTRAINT_STATEMENT [@ocaml.doc ""]
  | XSS_MATCH_STATEMENT [@ocaml.doc ""]
  | SQLI_MATCH_STATEMENT [@ocaml.doc ""]
  | BYTE_MATCH_STATEMENT [@ocaml.doc ""]
  | STATEMENT [@ocaml.doc ""]
  | EXCLUDED_RULE [@ocaml.doc ""]
  | RULE [@ocaml.doc ""]
  | MANAGED_RULE_SET [@ocaml.doc ""]
  | IP_SET [@ocaml.doc ""]
  | REGEX_PATTERN_SET [@ocaml.doc ""]
  | RULE_GROUP [@ocaml.doc ""]
  | WEB_ACL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec waf_invalid_parameter_exception =
  {
  reason: string option
    [@ocaml.doc "Additional information about the exception.\n"];
  parameter: string option
    [@ocaml.doc "The invalid parameter that resulted in the exception. \n"];
  field: parameter_exception_field option
    [@ocaml.doc "The settings where the invalid parameter was found. \n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because WAF didn't recognize a parameter in the request. For example: \n\n {ul\n       {-  You specified a parameter name or value that isn't valid.\n           \n            }\n       {-  Your nested statement isn't valid. You might have tried to nest a statement that can\226\128\153t be nested. \n           \n            }\n       {-  You tried to update a [WebACL] with a [DefaultAction] that isn't among the types available at [DefaultAction].\n           \n            }\n       {-  Your request references an ARN that is malformed, or corresponds to a resource with which a web ACL can't be associated.\n           \n            }\n       }\n  "]
type nonrec waf_invalid_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation isn't valid. \n"]
type nonrec waf_internal_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Your request is valid, but WAF couldn\226\128\153t perform the operation because of a system problem. Retry your request. \n"]
type nonrec waf_expired_managed_rule_group_version_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because the specified version for the managed rule group has expired. You can retrieve the available versions for the managed rule group by calling [ListAvailableManagedRuleGroupVersions].\n"]
type nonrec waf_duplicate_item_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform the operation because the resource that you tried to save is a duplicate of an existing one.\n"]
type nonrec waf_configuration_warning_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation failed because you are inspecting the web request body, headers, or cookies without specifying how to handle oversize components. Rules that inspect the body must either provide an [OversizeHandling] configuration or they must be preceded by a [SizeConstraintStatement] that blocks the body content from being too large. Rules that inspect the headers or cookies must provide an [OversizeHandling] configuration. \n\n Provide the handling configuration and retry your operation.\n \n  Alternately, you can suppress this warning by adding the following tag to the resource that you provide to this operation: [Tag] (key:[WAF:OversizeFieldsHandlingConstraintOptOut], value:[true]).\n  "]
type nonrec waf_associated_item_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "WAF couldn\226\128\153t perform the operation because your resource is being used by another resource or it\226\128\153s associated with another resource. \n"]
type nonrec version_to_publish =
  {
  forecasted_lifetime: int option
    [@ocaml.doc
      "The amount of time the vendor expects this version of the managed rule group to last, in days. \n"];
  associated_rule_group_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the vendor's rule group that's used in the published managed rule group version. \n"]}
[@@ocaml.doc
  "A version of the named managed rule group, that the rule group's vendor publishes for use by customers. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec versions_to_publish = (string * version_to_publish) list[@@ocaml.doc
                                                                    ""]
type nonrec update_web_acl_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken]. \n"]}
[@@ocaml.doc ""]
type nonrec scope =
  | REGIONAL [@ocaml.doc ""]
  | CLOUDFRONT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_web_acl_request =
  {
  on_source_d_do_s_protection_config:
    on_source_d_do_s_protection_config option
    [@ocaml.doc
      "Specifies the type of DDoS protection to apply to web request data for a web ACL. For most scenarios, it is recommended to use the default protection level, [ACTIVE_UNDER_DDOS]. If a web ACL is associated with multiple Application Load Balancers, the changes you make to DDoS protection in that web ACL will apply to all associated Application Load Balancers.\n"];
  association_config: association_config option
    [@ocaml.doc
      "Specifies custom configurations for the associations between the web ACL and protected resources. \n\n Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). \n \n   You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "];
  token_domains: string list option
    [@ocaml.doc
      "Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.\n\n Example JSON: [\"TokenDomains\": { \"mywebsite.com\", \"myotherwebsite.com\" }] \n \n  Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.\n  "];
  challenge_config: challenge_config option
    [@ocaml.doc
      "Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig]. \n"];
  captcha_config: captcha_config option
    [@ocaml.doc
      "Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig]. \n"];
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  data_protection_config: data_protection_config option
    [@ocaml.doc
      "Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level data protection option. \n\n The data protection that you configure for the web ACL alters the data that's available for any other data collection activity, including your WAF logging destinations, web ACL request sampling, and Amazon Security Lake data collection and management. Your other option for data protection is in the logging configuration, which only affects logging. \n "];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the web ACL that helps with identification. \n"];
  default_action: default_action
    [@ocaml.doc
      "The action to perform if none of the [Rules] contained in the [WebACL] match. \n"];
  id: string
    [@ocaml.doc
      "The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec update_rule_group_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken]. \n"]}
[@@ocaml.doc ""]
type nonrec update_rule_group_request =
  {
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the rule group that helps with identification. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec update_regex_pattern_set_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken]. \n"]}
[@@ocaml.doc ""]
type nonrec update_regex_pattern_set_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  regular_expression_list: regex list [@ocaml.doc "\n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the set. You cannot change the name after you create the set.\n"]}
[@@ocaml.doc ""]
type nonrec update_managed_rule_set_version_expiry_date_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  expiry_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the version will expire. \n\n Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, \"2016-09-27T14:50Z\". \n "];
  expiring_version: string option
    [@ocaml.doc "The version that is set to expire. \n"]}[@@ocaml.doc ""]
type nonrec update_managed_rule_set_version_expiry_date_request =
  {
  expiry_timestamp: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time that you want the version to expire.\n\n Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, \"2016-09-27T14:50Z\". \n "];
  version_to_expire: string
    [@ocaml.doc
      "The version that you want to remove from your list of offerings for the named managed rule group. \n"];
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.\n\n This name is assigned to the corresponding managed rule group, which your customers can access and use. \n "]}
[@@ocaml.doc ""]
type nonrec update_ip_set_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns this token to your [update] requests. You use [NextLockToken] in the same manner as you use [LockToken]. \n"]}
[@@ocaml.doc ""]
type nonrec update_ip_set_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  addresses: string list
    [@ocaml.doc
      "Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0]. \n\n Example address strings: \n \n  {ul\n        {-  For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].\n            \n             }\n        {-  For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].\n            \n             }\n        {-  For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].\n            \n             }\n        {-  For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n            \n             }\n        }\n   For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.\n   \n    Example JSON [Addresses] specifications: \n    \n     {ul\n           {-  Empty array: [\"Addresses\": \\[\\]] \n               \n                }\n           {-  Array with one address: [\"Addresses\": \\[\"192.0.2.44/32\"\\]] \n               \n                }\n           {-  Array with three addresses: [\"Addresses\": \\[\"192.0.2.44/32\", \"192.0.2.0/24\", \"192.0.0.0/16\"\\]] \n               \n                }\n           {-  INVALID specification: [\"Addresses\": \\[\"\"\\]] INVALID \n               \n                }\n           }\n  "];
  description: string option
    [@ocaml.doc
      "A description of the IP set that helps with identification. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc
      "An array of keys identifying the tags to disassociate from the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]}
[@@ocaml.doc ""]
type nonrec time_window =
  {
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The end of the time range from which you want [GetSampledRequests] to return a sample of the requests that your Amazon Web Services resource received. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous three hours.\n"];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The beginning of the time range from which you want [GetSampledRequests] to return a sample of the requests that your Amazon Web Services resource received. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous three hours.\n"]}
[@@ocaml.doc
  "In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time range for which you want WAF to return a sample of web requests.\n\n You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous three hours.\n \n  In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the time range for which WAF actually returned a sample of web requests. WAF gets the specified number of requests from among the first 5,000 requests that your Amazon Web Services resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, WAF stops sampling after the 5,000th request. In that case, [EndTime] is the time that WAF received the 5,000th request.\n  "]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as \"companyA\" or \"companyB.\" Tag values are case-sensitive.\n"];
  key: string
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as \"customer.\" Tag keys are case-sensitive.\n"]}
[@@ocaml.doc
  "A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "An array of key:value pairs to associate with the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]}
[@@ocaml.doc ""]
type nonrec tag_info_for_resource =
  {
  tag_list: tag list option
    [@ocaml.doc "The array of [Tag] objects defined for the resource. \n"];
  resource_ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]}
[@@ocaml.doc
  "The collection of tagging definitions for an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
type nonrec http_header =
  {
  value: string option [@ocaml.doc "The value of the HTTP header.\n"];
  name: string option [@ocaml.doc "The name of the HTTP header.\n"]}[@@ocaml.doc
                                                                    "Part of the response from [GetSampledRequests]. This is a complex type that appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all of the headers that appear in one of the web requests. \n"]
type nonrec http_request =
  {
  headers: http_header list option
    [@ocaml.doc
      "A complex type that contains the name and value for each header in the sampled web request.\n"];
  http_version: string option
    [@ocaml.doc
      "The HTTP version specified in the sampled web request, for example, [HTTP/1.1].\n"];
  method_: string option
    [@ocaml.doc "The HTTP method specified in the sampled web request. \n"];
  ur_i: string option
    [@ocaml.doc
      "The URI path of the request, which identifies the resource, for example, [/images/daily-ad.jpg].\n"];
  country: string option
    [@ocaml.doc
      "The two-letter country code for the country that the request originated from. For a current list of country codes, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}ISO 3166-1 alpha-2}.\n"];
  client_i_p: string option
    [@ocaml.doc
      "The IP address that the request originated from. If the web ACL is associated with a CloudFront distribution, this is the value of one of the following fields in CloudFront access logs:\n\n {ul\n       {-   [c-ip], if the viewer did not use an HTTP proxy or a load balancer to send the request\n           \n            }\n       {-   [x-forwarded-for], if the viewer did use an HTTP proxy or a load balancer to send the request\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Part of the response from [GetSampledRequests]. This is a complex type that appears as [Request] in the response syntax. [HTTPRequest] contains information about one of the web requests. \n"]
type nonrec failure_reason =
  | TOKEN_DOMAIN_MISMATCH [@ocaml.doc ""]
  | TOKEN_INVALID [@ocaml.doc ""]
  | TOKEN_EXPIRED [@ocaml.doc ""]
  | TOKEN_MISSING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec captcha_response =
  {
  failure_reason: failure_reason option
    [@ocaml.doc
      "The reason for failure, populated when the evaluation of the token fails.\n"];
  solve_timestamp: int option
    [@ocaml.doc
      "The time that the [CAPTCHA] was last solved for the supplied token. \n"];
  response_code: int option
    [@ocaml.doc
      "The HTTP response code indicating the status of the [CAPTCHA] token in the web request. If the token is missing, invalid, or expired, this code is [405 Method\n            Not Allowed].\n"]}
[@@ocaml.doc
  "The result from the inspection of the web request for a valid [CAPTCHA] token. \n"]
type nonrec challenge_response =
  {
  failure_reason: failure_reason option
    [@ocaml.doc
      "The reason for failure, populated when the evaluation of the token fails.\n"];
  solve_timestamp: int option
    [@ocaml.doc
      "The time that the challenge was last solved for the supplied token. \n"];
  response_code: int option
    [@ocaml.doc
      "The HTTP response code indicating the status of the challenge token in the web request. If the token is missing, invalid, or expired, this code is [202 Request Accepted].\n"]}
[@@ocaml.doc
  "The result from the inspection of the web request for a valid challenge token. \n"]
type nonrec sampled_http_request =
  {
  overridden_action: string option
    [@ocaml.doc
      "Used only for rule group rules that have a rule action override in place in the web ACL. This is the action that the rule group rule is configured for, and not the action that was applied to the request. The action that WAF applied is the [Action] value. \n"];
  challenge_response: challenge_response option
    [@ocaml.doc "The [Challenge] response for the request.\n"];
  captcha_response: captcha_response option
    [@ocaml.doc "The [CAPTCHA] response for the request.\n"];
  labels: label list option
    [@ocaml.doc
      "Labels applied to the web request by matching rules. WAF applies fully qualified labels to matching web requests. A fully qualified label is the concatenation of a label namespace and a rule label. The rule's rule group or web ACL defines the label namespace. \n\n For example, [awswaf:111122223333:myRuleGroup:testRules:testNS1:testNS2:labelNameA] or [awswaf:managed:aws:managed-rule-set:header:encoding:utf8]. \n "];
  response_code_sent: int option
    [@ocaml.doc "The response code that was sent for the request.\n"];
  request_headers_inserted: http_header list option
    [@ocaml.doc
      "Custom request headers inserted by WAF into the request, according to the custom request configuration for the matching rule action.\n"];
  rule_name_within_rule_group: string option
    [@ocaml.doc
      "The name of the [Rule] that the request matched. For managed rule groups, the format for this name is \n{[\n##\n]}\n. For your own rule groups, the format for this name is \n{[\n#\n]}\n. If the rule is not in a rule group, this field is absent. \n"];
  action: string option
    [@ocaml.doc "The action that WAF applied to the request.\n"];
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time at which WAF received the request from your Amazon Web Services resource, in Unix time format (in seconds).\n"];
  weight: int
    [@ocaml.doc
      "A value that indicates how one result in the response relates proportionally to other results in the response. For example, a result that has a weight of [2] represents roughly twice as many web requests as a result that has a weight of [1].\n"];
  request: http_request
    [@ocaml.doc
      "A complex type that contains detailed information about the request.\n"]}
[@@ocaml.doc
  "Represents a single sampled web request. The response from [GetSampledRequests] includes a [SampledHTTPRequests] complex type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains an array of [SampledHTTPRequest] objects.\n"]
type nonrec rule_summary =
  {
  action: rule_action option
    [@ocaml.doc
      "The action that WAF should take on a web request when it matches a rule's statement. Settings at the web ACL level can override the rule action setting. \n"];
  name: string option [@ocaml.doc "The name of the rule. \n"]}[@@ocaml.doc
                                                                "High-level information about a [Rule], returned by operations like [DescribeManagedRuleGroup]. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].\n"]
type nonrec rule_group_summary =
  {
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  description: string option
    [@ocaml.doc
      "A description of the rule group that helps with identification. \n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string option
    [@ocaml.doc
      "The name of the data type instance. You cannot change the name after you create the instance.\n"]}
[@@ocaml.doc
  "High-level information about a [RuleGroup], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].\n"]
type nonrec label_summary =
  {
  name: string option [@ocaml.doc "An individual label specification.\n"]}
[@@ocaml.doc
  "List of labels used by one or more of the rules of a [RuleGroup]. This summary object is used for the following rule group lists: \n\n {ul\n       {-   [AvailableLabels] - Labels that rules add to matching requests. These labels are defined in the [RuleLabels] for a [Rule]. \n           \n            }\n       {-   [ConsumedLabels] - Labels that rules match against. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule. \n           \n            }\n       }\n  "]
type nonrec rule_group =
  {
  consumed_labels: label_summary list option
    [@ocaml.doc
      "The labels that one or more rules in this rule group match against in label match statements. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule. \n"];
  available_labels: label_summary list option
    [@ocaml.doc
      "The labels that one or more rules in this rule group add to matching web requests. These labels are defined in the [RuleLabels] for a [Rule].\n"];
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  label_namespace: string option
    [@ocaml.doc
      "The label namespace prefix for this rule group. All labels added by rules in this rule group have this prefix. \n\n {ul\n       {-  The syntax for the label namespace prefix for your rule groups is the following: \n           \n             \n            {[\n            awswaf::rulegroup::\n            ]}\n             \n            \n             }\n       {-  When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon: \n           \n             \n            {[\n            :\n            ]}\n             \n            \n             }\n       }\n  "];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the rule group that helps with identification. \n"];
  ar_n: string [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  capacity: int
    [@ocaml.doc
      "The web ACL capacity units (WCUs) required for this rule group.\n\n When you create your own rule group, you define this, and you cannot change it after creation. When you add or modify the rules in a rule group, WAF enforces this limit. You can check the capacity for a set of rules using [CheckCapacity].\n \n  WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n  "];
  id: string
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc
  " A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n"]
type nonrec resource_type =
  | AMPLIFY [@ocaml.doc ""]
  | VERIFIED_ACCESS_INSTANCE [@ocaml.doc ""]
  | APP_RUNNER_SERVICE [@ocaml.doc ""]
  | COGNITIO_USER_POOL [@ocaml.doc ""]
  | APPSYNC [@ocaml.doc ""]
  | API_GATEWAY [@ocaml.doc ""]
  | APPLICATION_LOAD_BALANCER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec release_summary =
  {
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the release. \n"];
  release_version: string option [@ocaml.doc "The release version. \n"]}
[@@ocaml.doc "High level information for an SDK release. \n"]
type nonrec regex_pattern_set_summary =
  {
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string option
    [@ocaml.doc
      "The name of the data type instance. You cannot change the name after you create the instance.\n"]}
[@@ocaml.doc
  "High-level information about a [RegexPatternSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RegexPatternSet], and the ARN, that you provide to the [RegexPatternSetReferenceStatement] to use the pattern set in a [Rule].\n"]
type nonrec regex_pattern_set =
  {
  regular_expression_list: regex list option
    [@ocaml.doc "The regular expression patterns in the set.\n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string option
    [@ocaml.doc
      "The name of the set. You cannot change the name after you create the set.\n"]}
[@@ocaml.doc
  "Contains one or more regular expressions. \n\n WAF assigns an ARN to each [RegexPatternSet] that you create. To use a set in a rule, you provide the ARN to the [Rule] statement [RegexPatternSetReferenceStatement]. \n "]
type nonrec ip_address_version =
  | IPV6 [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rate_based_statement_managed_keys_ip_set =
  {
  addresses: string list option
    [@ocaml.doc "The IP addresses that are currently blocked.\n"];
  ip_address_version: ip_address_version option
    [@ocaml.doc
      "The version of the IP addresses, either [IPV4] or [IPV6]. \n"]}
[@@ocaml.doc
  "The set of IP addresses that are currently blocked for a [RateBasedStatement]. This is only available for rate-based rules that aggregate on just the IP address, with the [AggregateKeyType] set to [IP] or [FORWARDED_IP].\n\n A rate-based rule applies its rule action to requests from IP addresses that are in the rule's managed keys list and that match the rule's scope-down statement. When a rule has no scope-down statement, it applies the action to all requests from the IP addresses that are in the list. The rule applies its rule action to rate limit the matching requests. The action is usually Block but it can be any valid rule action except for Allow. \n \n  The maximum number of IP addresses that can be rate limited by a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, WAF limits those with the highest rates. \n  "]
type nonrec put_permission_policy_request =
  {
  policy: string
    [@ocaml.doc
      "The policy to attach to the specified rule group. \n\n The policy specifications must conform to the following:\n \n  {ul\n        {-  The policy must be composed using IAM Policy version 2012-10-17.\n            \n             }\n        {-  The policy must include specifications for [Effect], [Action], and [Principal].\n            \n             }\n        {-   [Effect] must specify [Allow].\n            \n             }\n        {-   [Action] must specify [wafv2:CreateWebACL], [wafv2:UpdateWebACL], and [wafv2:PutFirewallManagerRuleGroups] and may optionally specify [wafv2:GetRuleGroup]. WAF rejects any extra actions or wildcard actions in the policy.\n            \n             }\n        {-  The policy must not include a [Resource] parameter.\n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html}IAM Policies}. \n   "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the [RuleGroup] to which you want to attach the policy.\n"]}
[@@ocaml.doc ""]
type nonrec put_managed_rule_set_versions_response =
  {
  next_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"]}
[@@ocaml.doc ""]
type nonrec put_managed_rule_set_versions_request =
  {
  versions_to_publish: versions_to_publish option
    [@ocaml.doc
      "The versions of the named managed rule group that you want to offer to your customers. \n"];
  recommended_version: string option
    [@ocaml.doc
      "The version of the named managed rule group that you'd like your customers to choose, from among your version offerings. \n"];
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.\n\n This name is assigned to the corresponding managed rule group, which your customers can access and use. \n "]}
[@@ocaml.doc ""]
type nonrec filter_behavior =
  | DROP [@ocaml.doc ""]
  | KEEP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec filter_requirement =
  | MEETS_ANY [@ocaml.doc ""]
  | MEETS_ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec action_value =
  | EXCLUDED_AS_COUNT [@ocaml.doc ""]
  | CHALLENGE [@ocaml.doc ""]
  | CAPTCHA [@ocaml.doc ""]
  | COUNT [@ocaml.doc ""]
  | BLOCK [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec action_condition =
  {
  action: action_value
    [@ocaml.doc
      "The action setting that a log record must contain in order to meet the condition. This is the action that WAF applied to the web request. \n\n For rule groups, this is either the configured rule action setting, or if you've applied a rule action override to the rule, it's the override action. The value [EXCLUDED_AS_COUNT] matches on excluded rules and also on rules that have a rule action override of Count. \n "]}
[@@ocaml.doc
  "A single action condition for a [Condition] in a logging filter.\n"]
type nonrec label_name_condition =
  {
  label_name: string
    [@ocaml.doc
      "The label name that a log record must contain in order to meet the condition. This must be a fully qualified label name. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. \n"]}
[@@ocaml.doc
  "A single label name condition for a [Condition] in a logging filter.\n"]
type nonrec condition =
  {
  label_name_condition: label_name_condition option
    [@ocaml.doc
      "A single label name condition. This is the fully qualified label name that a log record must contain in order to meet the condition. Fully qualified labels have a prefix, optional namespaces, and label name. The prefix identifies the rule group or web ACL context of the rule that added the label. \n"];
  action_condition: action_condition option
    [@ocaml.doc
      "A single action condition. This is the action setting that a log record must contain in order to meet the condition.\n"]}
[@@ocaml.doc "A single match condition for a [Filter].\n"]
type nonrec filter =
  {
  conditions: condition list
    [@ocaml.doc "Match conditions for the filter.\n"];
  requirement: filter_requirement
    [@ocaml.doc
      "Logic to apply to the filtering conditions. You can specify that, in order to satisfy the filter, a log must match all conditions or must match at least one condition.\n"];
  behavior: filter_behavior
    [@ocaml.doc
      "How to handle logs that satisfy the filter's conditions and requirement. \n"]}
[@@ocaml.doc "A single logging filter, used in [LoggingFilter]. \n"]
type nonrec logging_filter =
  {
  default_behavior: filter_behavior
    [@ocaml.doc
      "Default handling for logs that don't match any of the specified filtering conditions. \n"];
  filters: filter list
    [@ocaml.doc "The filters that you want to apply to the logs. \n"]}
[@@ocaml.doc
  "Filtering that specifies which web requests are kept in the logs and which are dropped, defined for a web ACL's [LoggingConfiguration]. \n\n You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation. \n "]
type nonrec log_type =
  | WAF_LOGS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec log_scope =
  | SECURITY_LAKE [@ocaml.doc ""]
  | CUSTOMER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec logging_configuration =
  {
  log_scope: log_scope option
    [@ocaml.doc
      "The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage. \n\n The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}. \n \n  Default: [CUSTOMER] \n  "];
  log_type: log_type option
    [@ocaml.doc
      "Used to distinguish between various logging options. Currently, there is one option.\n\n Default: [WAF_LOGS] \n "];
  logging_filter: logging_filter option
    [@ocaml.doc
      "Filtering that specifies which web requests are kept in the logs and which are dropped. You can filter on the rule action and on the web request labels that were applied by matching rules during web ACL evaluation. \n"];
  managed_by_firewall_manager: bool option
    [@ocaml.doc
      "Indicates whether the logging configuration was created by Firewall Manager, as part of an WAF policy configuration. If true, only Firewall Manager can modify or delete the configuration. \n\n The logging configuration can be created by Firewall Manager for use with any web ACL that Firewall Manager is using for an WAF policy. Web ACLs that Firewall Manager creates and uses have their [ManagedByFirewallManager] property set to true. Web ACLs that were created by a customer account and then retrofitted by Firewall Manager for use by a policy have their [RetrofittedByFirewallManager] property set to true. For either case, any corresponding logging configuration will indicate [ManagedByFirewallManager].\n "];
  redacted_fields: field_to_match list option
    [@ocaml.doc
      "The parts of the request that you want to keep out of the logs.\n\n For example, if you redact the [SingleHeader] field, the [HEADER] field in the logs will be [REDACTED] for all rules that use the [SingleHeader] [FieldToMatch] setting. \n \n  If you configure data protection for the web ACL, the protection applies to the data that WAF sends to the logs. \n  \n   Redaction applies only to the component that's specified in the rule's [FieldToMatch] setting, so the [SingleHeader] redaction doesn't apply to rules that use the [Headers] [FieldToMatch].\n   \n     You can specify only the following fields for redaction: [UriPath], [QueryString], [SingleHeader], and [Method].\n     \n        This setting has no impact on request sampling. You can only exclude fields from request sampling by disabling sampling in the web ACL visibility configuration or by configuring data protection for the web ACL.\n        \n         "];
  log_destination_configs: string list
    [@ocaml.doc
      "The logging destination configuration that you want to associate with the web ACL.\n\n  You can associate one logging destination to a web ACL.\n  \n   "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL that you want to associate with [LogDestinationConfigs].\n"]}
[@@ocaml.doc
  "Defines an association between logging destinations and a web ACL resource, for logging from WAF. As part of the association, you can specify parts of the standard logging fields to keep out of the logs and you can specify filters so that you log only a subset of the logging records. \n\n If you configure data protection for the web ACL, the protection applies to the data that WAF sends to the logs. \n \n   You can define one logging destination per web ACL.\n   \n     You can access information about the traffic that WAF inspects using the following steps:\n     \n      {ol\n            {-  Create your logging destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. \n                \n                 The name that you give the destination must start with [aws-waf-logs-]. Depending on the type of destination, you might need to configure additional settings or permissions. \n                 \n                  For configuration requirements and pricing information for each destination type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic} in the {i WAF Developer Guide}.\n                  \n                   }\n            {-  Associate your logging destination to your web ACL using a [PutLoggingConfiguration] request.\n                \n                 }\n            }\n   When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates an additional role or policy that is required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a service-linked role.\n   \n    For additional information about web ACL logging, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n    "]
type nonrec put_logging_configuration_response =
  {
  logging_configuration: logging_configuration option [@ocaml.doc "\n"]}
[@@ocaml.doc ""]
type nonrec put_logging_configuration_request =
  {
  logging_configuration: logging_configuration [@ocaml.doc "\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec managed_rule_set_version =
  {
  expiry_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that this version is set to expire.\n\n Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, \"2016-09-27T14:50Z\". \n "];
  last_update_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The last time that you updated this version. \n\n Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, \"2016-09-27T14:50Z\". \n "];
  publish_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that you first published this version. \n\n Times are in Coordinated Universal Time (UTC) format. UTC format includes the special designator, Z. For example, \"2016-09-27T14:50Z\". \n "];
  forecasted_lifetime: int option
    [@ocaml.doc
      "The amount of time you expect this version of your managed rule group to last, in days. \n"];
  capacity: int option
    [@ocaml.doc
      "The web ACL capacity units (WCUs) required for this rule group.\n\n WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n "];
  associated_rule_group_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the vendor rule group that's used to define the published version of your managed rule group. \n"]}
[@@ocaml.doc
  "Information for a single version of a managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec published_versions = (string * managed_rule_set_version) list
[@@ocaml.doc ""]
type nonrec platform =
  | ANDROID [@ocaml.doc ""]
  | IOS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec mobile_sdk_release =
  {
  tags: tag list option
    [@ocaml.doc "Tags that are associated with the release. \n"];
  release_notes: string option [@ocaml.doc "Notes describing the release.\n"];
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the release. \n"];
  release_version: string option [@ocaml.doc "The release version. \n"]}
[@@ocaml.doc
  "Information for a release of the mobile SDK, including release notes and tags.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
type nonrec managed_rule_set_summary =
  {
  label_namespace: string option
    [@ocaml.doc
      "The label namespace prefix for the managed rule groups that are offered to customers from this managed rule set. All labels that are added by rules in the managed rule group have this prefix. \n\n {ul\n       {-  The syntax for the label namespace prefix for a managed rule group is the following: \n           \n             \n            {[\n            awswaf:managed::\n            ]}\n            :\n            \n             }\n       {-  When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon: \n           \n             \n            {[\n            :\n            ]}\n             \n            \n             }\n       }\n  "];
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].\n"];
  name: string option
    [@ocaml.doc
      "The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.\n\n This name is assigned to the corresponding managed rule group, which your customers can access and use. \n "]}
[@@ocaml.doc
  "High-level information for a managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec managed_rule_set =
  {
  label_namespace: string option
    [@ocaml.doc
      "The label namespace prefix for the managed rule groups that are offered to customers from this managed rule set. All labels that are added by rules in the managed rule group have this prefix. \n\n {ul\n       {-  The syntax for the label namespace prefix for a managed rule group is the following: \n           \n             \n            {[\n            awswaf:managed::\n            ]}\n            :\n            \n             }\n       {-  When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon: \n           \n             \n            {[\n            :\n            ]}\n             \n            \n             }\n       }\n  "];
  recommended_version: string option
    [@ocaml.doc "The version that you would like your customers to use.\n"];
  published_versions: published_versions option
    [@ocaml.doc
      "The versions of this managed rule set that are available for use by customers. \n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  ar_n: string [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].\n"];
  name: string
    [@ocaml.doc
      "The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.\n\n This name is assigned to the corresponding managed rule group, which your customers can access and use. \n "]}
[@@ocaml.doc
  "A set of rules that is managed by Amazon Web Services and Amazon Web Services Marketplace sellers to provide versioned managed rule groups for customers of WAF.\n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
type nonrec managed_rule_group_version =
  {
  last_update_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the managed rule group owner updated the rule group version information. \n"];
  name: string option [@ocaml.doc "The version name. \n"]}[@@ocaml.doc
                                                            "Describes a single version of a managed rule group. \n"]
type nonrec managed_rule_group_summary =
  {
  description: string option
    [@ocaml.doc
      "The description of the managed rule group, provided by Amazon Web Services Managed Rules or the Amazon Web Services Marketplace seller who manages it.\n"];
  versioning_supported: bool option
    [@ocaml.doc
      "Indicates whether the managed rule group is versioned. If it is, you can retrieve the versions list by calling [ListAvailableManagedRuleGroupVersions]. \n"];
  name: string option
    [@ocaml.doc
      "The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.\n"];
  vendor_name: string option
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc
  "High-level information about a managed rule group, returned by [ListAvailableManagedRuleGroups]. This provides information like the name and vendor name, that you provide when you add a [ManagedRuleGroupStatement] to a web ACL. Managed rule groups include Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. To use any Amazon Web Services Marketplace managed rule group, first subscribe to the rule group through Amazon Web Services Marketplace. \n"]
type nonrec managed_product_descriptor =
  {
  is_advanced_managed_rule_set: bool option
    [@ocaml.doc
      "Indicates whether the rule group provides an advanced set of protections, such as the the Amazon Web Services Managed Rules rule groups that are used for WAF intelligent threat mitigation. \n"];
  is_versioning_supported: bool option
    [@ocaml.doc "Indicates whether the rule group is versioned. \n"];
  sns_topic_arn: string option
    [@ocaml.doc
      "The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to provide notification of changes to the managed rule group. You can subscribe to the SNS topic to receive notifications when the managed rule group is modified, such as for new versions and for version expiration. For more information, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon Simple Notification Service Developer Guide}.\n"];
  product_description: string option
    [@ocaml.doc "A short description of the managed rule group.\n"];
  product_title: string option
    [@ocaml.doc
      "The display name for the managed rule group. For example, [Anonymous IP list] or [Account takeover prevention].\n"];
  product_link: string option
    [@ocaml.doc
      "For Amazon Web Services Marketplace managed rule groups only, the link to the rule group product page. \n"];
  product_id: string option
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  managed_rule_set_name: string option
    [@ocaml.doc
      "The name of the managed rule group. For example, [AWSManagedRulesAnonymousIpList] or [AWSManagedRulesATPRuleSet].\n"];
  vendor_name: string option
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc
  "The properties of a managed product, such as an Amazon Web Services Managed Rules rule group or an Amazon Web Services Marketplace managed rule group. \n"]
type nonrec list_web_ac_ls_response =
  {
  web_ac_ls: web_acl_summary list option
    [@ocaml.doc
      "Array of web ACLs. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_web_ac_ls_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tag_info_for_resource: tag_info_for_resource option
    [@ocaml.doc
      "The collection of tagging definitions for the resource. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_rule_groups_response =
  {
  rule_groups: rule_group_summary list option
    [@ocaml.doc
      "Array of rule groups. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_rule_groups_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_resources_for_web_acl_response =
  {
  resource_arns: string list option
    [@ocaml.doc
      "The array of Amazon Resource Names (ARNs) of the associated resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_resources_for_web_acl_request =
  {
  resource_type: resource_type option
    [@ocaml.doc
      "Retrieves the web ACLs that are used by the specified resource type. \n\n For Amazon CloudFront, don't use this call. Instead, use the CloudFront call [ListDistributionsByWebACLId]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} in the {i Amazon CloudFront API Reference}. \n \n   If you don't provide a resource type, the call uses the resource type [APPLICATION_LOAD_BALANCER]. \n   \n     Default: [APPLICATION_LOAD_BALANCER] \n     "];
  web_acl_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the web ACL.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_regex_pattern_sets_response =
  {
  regex_pattern_sets: regex_pattern_set_summary list option
    [@ocaml.doc
      "Array of regex pattern sets. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_regex_pattern_sets_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_mobile_sdk_releases_response =
  {
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  release_summaries: release_summary list option
    [@ocaml.doc
      "The high level information for the available SDK releases. If you specified a [Limit] in your request, this might not be the full list. \n"]}
[@@ocaml.doc ""]
type nonrec list_mobile_sdk_releases_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  platform: platform
    [@ocaml.doc "The device platform to retrieve the list for.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_managed_rule_sets_response =
  {
  managed_rule_sets: managed_rule_set_summary list option
    [@ocaml.doc
      "Your managed rule sets. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_managed_rule_sets_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_logging_configurations_response =
  {
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  logging_configurations: logging_configuration list option
    [@ocaml.doc
      "Array of logging configurations. If you specified a [Limit] in your request, this might not be the full list. \n"]}
[@@ocaml.doc ""]
type nonrec list_logging_configurations_request =
  {
  log_scope: log_scope option
    [@ocaml.doc
      "The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage. \n\n The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}. \n \n  Default: [CUSTOMER] \n  "];
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec ip_set_summary =
  {
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  description: string option
    [@ocaml.doc
      "A description of the IP set that helps with identification. \n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string option
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc
  "High-level information about an [IPSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage an [IPSet], and the ARN, that you provide to the [IPSetReferenceStatement] to use the address set in a [Rule].\n"]
type nonrec list_ip_sets_response =
  {
  ip_sets: ip_set_summary list option
    [@ocaml.doc
      "Array of IPSets. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_ip_sets_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_available_managed_rule_groups_response =
  {
  managed_rule_groups: managed_rule_group_summary list option
    [@ocaml.doc
      "Array of managed rule groups that you can use. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_available_managed_rule_groups_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec list_available_managed_rule_group_versions_response =
  {
  current_default_version: string option
    [@ocaml.doc
      "The name of the version that's currently set as the default. \n"];
  versions: managed_rule_group_version list option
    [@ocaml.doc
      "The versions that are currently available for the specified managed rule group. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_available_managed_rule_group_versions_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.\n"];
  vendor_name: string
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc ""]
type nonrec api_key_summary =
  {
  version: int option
    [@ocaml.doc "Internal value used by WAF to manage the key. \n"];
  creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the key was created. \n"];
  api_key: string option
    [@ocaml.doc
      "The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration. \n"];
  token_domains: string list option
    [@ocaml.doc "The token domains that are defined in this API key. \n"]}
[@@ocaml.doc
  "Information for a single API key. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
type nonrec list_api_keys_response =
  {
  application_integration_ur_l: string option
    [@ocaml.doc
      "The CAPTCHA application integration URL, for use in your JavaScript implementation. \n"];
  api_key_summaries: api_key_summary list option
    [@ocaml.doc
      "The array of key summaries. If you specified a [Limit] in your request, this might not be the full list. \n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"]}
[@@ocaml.doc ""]
type nonrec list_api_keys_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of objects that you want WAF to return for this request. If more objects are available, in the response, WAF provides a [NextMarker] value that you can use in a subsequent call to get the next batch of objects.\n"];
  next_marker: string option
    [@ocaml.doc
      "When you request a list of objects with a [Limit] setting, if the number of objects that are still available for retrieval exceeds the limit, WAF returns a [NextMarker] value in the response. To retrieve the next batch of objects, provide the marker from the prior call in your next request.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec ip_set =
  {
  addresses: string list
    [@ocaml.doc
      "Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0]. \n\n Example address strings: \n \n  {ul\n        {-  For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].\n            \n             }\n        {-  For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].\n            \n             }\n        {-  For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].\n            \n             }\n        {-  For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n            \n             }\n        }\n   For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.\n   \n    Example JSON [Addresses] specifications: \n    \n     {ul\n           {-  Empty array: [\"Addresses\": \\[\\]] \n               \n                }\n           {-  Array with one address: [\"Addresses\": \\[\"192.0.2.44/32\"\\]] \n               \n                }\n           {-  Array with three addresses: [\"Addresses\": \\[\"192.0.2.44/32\", \"192.0.2.0/24\", \"192.0.0.0/16\"\\]] \n               \n                }\n           {-  INVALID specification: [\"Addresses\": \\[\"\"\\]] INVALID \n               \n                }\n           }\n  "];
  ip_address_version: ip_address_version
    [@ocaml.doc
      "The version of the IP addresses, either [IPV4] or [IPV6]. \n"];
  description: string option
    [@ocaml.doc
      "A description of the IP set that helps with identification. \n"];
  ar_n: string [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  name: string
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc
  "Contains zero or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0. For information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}. \n\n WAF assigns an ARN to each [IPSet] that you create. To use an IP set in a rule, you provide the ARN to the [Rule] statement [IPSetReferenceStatement]. \n "]
type nonrec get_web_acl_response =
  {
  application_integration_ur_l: string option
    [@ocaml.doc
      "The URL to use in SDK integrations with Amazon Web Services managed rule groups. For example, you can use the integration SDKs with the account takeover prevention managed rule group [AWSManagedRulesATPRuleSet] and the account creation fraud prevention managed rule group [AWSManagedRulesACFPRuleSet]. This is only populated if you are using a rule group in your web ACL that integrates with your applications in this way. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n"];
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  web_ac_l: web_ac_l option
    [@ocaml.doc
      "The web ACL specification. You can modify the settings in this web ACL and use it to update this web ACL or create a new one.\n"]}
[@@ocaml.doc ""]
type nonrec get_web_acl_request =
  {
  ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL that you want to retrieve. \n"];
  id: string option
    [@ocaml.doc
      "The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope option
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string option
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec get_web_acl_for_resource_response =
  {
  web_ac_l: web_ac_l option
    [@ocaml.doc
      "The web ACL that is associated with the resource. If there is no associated resource, WAF returns a null web ACL.\n"]}
[@@ocaml.doc ""]
type nonrec get_web_acl_for_resource_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource whose web ACL you want to retrieve. \n\n The ARN must be in one of the following formats:\n \n  {ul\n        {-  For an Application Load Balancer: \n            {[\n            arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon API Gateway REST API: \n            {[\n            arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name} \n            ]}\n             \n            \n             }\n        {-  For an AppSync GraphQL API: \n            {[\n            arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Cognito user pool: \n            {[\n            arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id} \n            ]}\n             \n            \n             }\n        {-  For an App Runner service: \n            {[\n            arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Web Services Verified Access instance: \n            {[\n            arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id} \n            ]}\n             \n            \n             }\n        {-  For an Amplify application: \n            {[\n            arn:{i partition}:amplify:{i region}:{i account-id}:apps/{i app-id} \n            ]}\n             \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec get_sampled_requests_response =
  {
  time_window: time_window option
    [@ocaml.doc
      "Usually, [TimeWindow] is the time range that you specified in the [GetSampledRequests] request. However, if your Amazon Web Services resource received more than 5,000 requests during the time range that you specified in the request, [GetSampledRequests] returns the time range for the first 5,000 requests. Times are in Coordinated Universal Time (UTC) format.\n"];
  population_size: int option
    [@ocaml.doc
      "The total number of requests from which [GetSampledRequests] got a sample of [MaxItems] requests. If [PopulationSize] is less than [MaxItems], the sample includes every request that your Amazon Web Services resource received during the specified time range.\n"];
  sampled_requests: sampled_http_request list option
    [@ocaml.doc
      "A complex type that contains detailed information about each of the requests in the sample.\n"]}
[@@ocaml.doc ""]
type nonrec get_sampled_requests_request =
  {
  max_items: int
    [@ocaml.doc
      "The number of requests that you want WAF to return from among the first 5,000 requests that your Amazon Web Services resource received during the time range. If your resource received fewer requests than the value of [MaxItems], [GetSampledRequests] returns information about all of them. \n"];
  time_window: time_window
    [@ocaml.doc
      "The start date and time and the end date and time of the range for which you want [GetSampledRequests] to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. You can specify any time range in the previous three hours. If you specify a start time that's earlier than three hours ago, WAF sets it to three hours ago.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  rule_metric_name: string
    [@ocaml.doc
      "The metric name assigned to the [Rule] or [RuleGroup] dimension for which you want a sample of requests.\n"];
  web_acl_arn: string
    [@ocaml.doc
      "The Amazon resource name (ARN) of the [WebACL] for which you want a sample of requests.\n"]}
[@@ocaml.doc ""]
type nonrec get_rule_group_response =
  {
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  rule_group: rule_group option [@ocaml.doc "\n"]}[@@ocaml.doc ""]
type nonrec get_rule_group_request =
  {
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the entity.\n"];
  id: string option
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope option
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string option
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec get_regex_pattern_set_response =
  {
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  regex_pattern_set: regex_pattern_set option [@ocaml.doc "\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_regex_pattern_set_request =
  {
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the set. You cannot change the name after you create the set.\n"]}
[@@ocaml.doc ""]
type nonrec get_rate_based_statement_managed_keys_response =
  {
  managed_keys_ip_v6: rate_based_statement_managed_keys_ip_set option
    [@ocaml.doc
      "The keys that are of Internet Protocol version 6 (IPv6). \n"];
  managed_keys_ip_v4: rate_based_statement_managed_keys_ip_set option
    [@ocaml.doc
      "The keys that are of Internet Protocol version 4 (IPv4). \n"]}
[@@ocaml.doc ""]
type nonrec get_rate_based_statement_managed_keys_request =
  {
  rule_name: string
    [@ocaml.doc
      "The name of the rate-based rule to get the keys for. If you have the rule defined inside a rule group that you're using in your web ACL, also provide the name of the rule group reference statement in the request parameter [RuleGroupRuleName].\n"];
  rule_group_rule_name: string option
    [@ocaml.doc
      "The name of the rule group reference statement in your web ACL. This is required only when you have the rate-based rule nested inside a rule group. \n"];
  web_acl_id: string
    [@ocaml.doc
      "The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  web_acl_name: string
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec get_permission_policy_response =
  {
  policy: string option
    [@ocaml.doc
      "The IAM policy that is attached to the specified rule group.\n"]}
[@@ocaml.doc ""]
type nonrec get_permission_policy_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the rule group for which you want to get the policy.\n"]}
[@@ocaml.doc ""]
type nonrec get_mobile_sdk_release_response =
  {
  mobile_sdk_release: mobile_sdk_release option
    [@ocaml.doc
      "Information for a specified SDK release, including release notes and tags.\n"]}
[@@ocaml.doc ""]
type nonrec get_mobile_sdk_release_request =
  {
  release_version: string
    [@ocaml.doc
      "The release version. For the latest available version, specify [LATEST].\n"];
  platform: platform [@ocaml.doc "The device platform.\n"]}[@@ocaml.doc ""]
type nonrec get_managed_rule_set_response =
  {
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  managed_rule_set: managed_rule_set option
    [@ocaml.doc "The managed rule set that you requested. \n"]}[@@ocaml.doc
                                                                 ""]
type nonrec get_managed_rule_set_request =
  {
  id: string
    [@ocaml.doc
      "A unique identifier for the managed rule set. The ID is returned in the responses to commands like [list]. You provide it to operations like [get] and [update].\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the managed rule set. You use this, along with the rule set ID, to identify the rule set.\n\n This name is assigned to the corresponding managed rule group, which your customers can access and use. \n "]}
[@@ocaml.doc ""]
type nonrec get_logging_configuration_response =
  {
  logging_configuration: logging_configuration option
    [@ocaml.doc "The [LoggingConfiguration] for the specified web ACL.\n"]}
[@@ocaml.doc ""]
type nonrec get_logging_configuration_request =
  {
  log_scope: log_scope option
    [@ocaml.doc
      "The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage. \n\n The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}. \n \n  Default: [CUSTOMER] \n  "];
  log_type: log_type option
    [@ocaml.doc
      "Used to distinguish between various logging options. Currently, there is one option.\n\n Default: [WAF_LOGS] \n "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL for which you want to get the [LoggingConfiguration].\n"]}
[@@ocaml.doc ""]
type nonrec get_ip_set_response =
  {
  lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  ip_set: ip_set option [@ocaml.doc "\n"]}[@@ocaml.doc ""]
type nonrec get_ip_set_request =
  {
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec get_decrypted_api_key_response =
  {
  creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the key was created. \n"];
  token_domains: string list option
    [@ocaml.doc "The token domains that are defined in this API key. \n"]}
[@@ocaml.doc ""]
type nonrec get_decrypted_api_key_request =
  {
  api_key: string [@ocaml.doc "The encrypted API key. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec generate_mobile_sdk_release_url_response =
  {
  url: string option
    [@ocaml.doc
      "The presigned download URL for the specified SDK release.\n"]}
[@@ocaml.doc ""]
type nonrec generate_mobile_sdk_release_url_request =
  {
  release_version: string
    [@ocaml.doc
      "The release version. For the latest available version, specify [LATEST].\n"];
  platform: platform [@ocaml.doc "The device platform.\n"]}[@@ocaml.doc ""]
type nonrec disassociate_web_acl_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to disassociate from the web ACL. \n\n The ARN must be in one of the following formats:\n \n  {ul\n        {-  For an Application Load Balancer: \n            {[\n            arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon API Gateway REST API: \n            {[\n            arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name} \n            ]}\n             \n            \n             }\n        {-  For an AppSync GraphQL API: \n            {[\n            arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Cognito user pool: \n            {[\n            arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id} \n            ]}\n             \n            \n             }\n        {-  For an App Runner service: \n            {[\n            arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Web Services Verified Access instance: \n            {[\n            arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id} \n            ]}\n             \n            \n             }\n        {-  For an Amplify application: \n            {[\n            arn:{i partition}:amplify:{i region}:{i account-id}:apps/{i app-id} \n            ]}\n             \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_managed_rule_group_response =
  {
  consumed_labels: label_summary list option
    [@ocaml.doc
      "The labels that one or more rules in this rule group match against in label match statements. These labels are defined in a [LabelMatchStatement] specification, in the [Statement] definition of a rule. \n"];
  available_labels: label_summary list option
    [@ocaml.doc
      "The labels that one or more rules in this rule group add to matching web requests. These labels are defined in the [RuleLabels] for a [Rule].\n"];
  label_namespace: string option
    [@ocaml.doc
      "The label namespace prefix for this rule group. All labels added by rules in this rule group have this prefix. \n\n {ul\n       {-  The syntax for the label namespace prefix for a managed rule group is the following: \n           \n             \n            {[\n            awswaf:managed::\n            ]}\n            :\n            \n             }\n       {-  When a rule with a label matches a web request, WAF adds the fully qualified label to the request. A fully qualified label is made up of the label namespace from the rule group or web ACL where the rule is defined and the label from the rule, separated by a colon: \n           \n             \n            {[\n            :\n            ]}\n             \n            \n             }\n       }\n  "];
  rules: rule_summary list option [@ocaml.doc "\n"];
  capacity: int option
    [@ocaml.doc
      "The web ACL capacity units (WCUs) required for this rule group.\n\n WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n "];
  sns_topic_arn: string option
    [@ocaml.doc
      "The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to provide notification of changes to the managed rule group. You can subscribe to the SNS topic to receive notifications when the managed rule group is modified, such as for new versions and for version expiration. For more information, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon Simple Notification Service Developer Guide}.\n"];
  version_name: string option
    [@ocaml.doc "The managed rule group's version. \n"]}[@@ocaml.doc ""]
type nonrec describe_managed_rule_group_request =
  {
  version_name: string option
    [@ocaml.doc
      "The version of the rule group. You can only use a version that is not scheduled for expiration. If you don't provide this, WAF uses the vendor's default version. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the managed rule group. You use this, along with the vendor name, to identify the rule group.\n"];
  vendor_name: string
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc ""]
type nonrec describe_managed_products_by_vendor_response =
  {
  managed_products: managed_product_descriptor list option
    [@ocaml.doc
      "High-level information for the managed rule groups owned by the specified vendor. \n"]}
[@@ocaml.doc ""]
type nonrec describe_managed_products_by_vendor_request =
  {
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  vendor_name: string
    [@ocaml.doc
      "The name of the managed rule group vendor. You use this, along with the rule group name, to identify a rule group.\n"]}
[@@ocaml.doc ""]
type nonrec describe_all_managed_products_response =
  {
  managed_products: managed_product_descriptor list option
    [@ocaml.doc
      "High-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. \n"]}
[@@ocaml.doc ""]
type nonrec describe_all_managed_products_request =
  {
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec delete_web_acl_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "The unique identifier for the web ACL. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec delete_rule_group_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the rule group. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec delete_regex_pattern_set_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the set. You cannot change the name after you create the set.\n"]}
[@@ocaml.doc ""]
type nonrec delete_permission_policy_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the rule group from which you want to delete the policy.\n\n You must be the owner of the rule group to perform this operation.\n "]}
[@@ocaml.doc ""]
type nonrec delete_logging_configuration_request =
  {
  log_scope: log_scope option
    [@ocaml.doc
      "The owner of the logging configuration, which must be set to [CUSTOMER] for the configurations that you manage. \n\n The log scope [SECURITY_LAKE] indicates a configuration that is managed through Amazon Security Lake. You can use Security Lake to collect log and event data from various sources for normalization, analysis, and management. For information, see {{:https://docs.aws.amazon.com/security-lake/latest/userguide/internal-sources.html}Collecting data from Amazon Web Services services} in the {i Amazon Security Lake user guide}. \n \n  Default: [CUSTOMER] \n  "];
  log_type: log_type option
    [@ocaml.doc
      "Used to distinguish between various logging options. Currently, there is one option.\n\n Default: [WAF_LOGS] \n "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL from which you want to delete the [LoggingConfiguration].\n"]}
[@@ocaml.doc ""]
type nonrec delete_ip_set_request =
  {
  lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  id: string
    [@ocaml.doc
      "A unique identifier for the set. This ID is returned in the responses to create and list commands. You provide it to operations like update and delete.\n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec delete_firewall_manager_rule_groups_response =
  {
  next_web_acl_lock_token: string option
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"]}
[@@ocaml.doc ""]
type nonrec delete_firewall_manager_rule_groups_request =
  {
  web_acl_lock_token: string
    [@ocaml.doc
      "A token used for optimistic locking. WAF returns a token to your [get] and [list] requests, to mark the state of the entity at the time of the request. To make changes to the entity associated with the token, you provide the token to operations like [update] and [delete]. WAF uses the token to ensure that no changes have been made to the entity since you last retrieved it. If a change has been made, the update fails with a [WAFOptimisticLockException]. If this happens, perform another [get], and use the new token returned by that operation. \n"];
  web_acl_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the web ACL.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_api_key_request =
  {
  api_key: string
    [@ocaml.doc "The encrypted API key that you want to delete. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec create_web_acl_response =
  {
  summary: web_acl_summary option
    [@ocaml.doc
      "High-level information about a [WebACL], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [WebACL], and the ARN, that you provide to operations like [AssociateWebACL].\n"]}
[@@ocaml.doc ""]
type nonrec create_web_acl_request =
  {
  application_config: application_config option
    [@ocaml.doc
      "Configures the ability for the WAF console to store and retrieve application attributes during the web ACL creation process. Application attributes help WAF give recommendations for protection packs.\n"];
  on_source_d_do_s_protection_config:
    on_source_d_do_s_protection_config option
    [@ocaml.doc
      "Specifies the type of DDoS protection to apply to web request data for a web ACL. For most scenarios, it is recommended to use the default protection level, [ACTIVE_UNDER_DDOS]. If a web ACL is associated with multiple Application Load Balancers, the changes you make to DDoS protection in that web ACL will apply to all associated Application Load Balancers.\n"];
  association_config: association_config option
    [@ocaml.doc
      "Specifies custom configurations for the associations between the web ACL and protected resources. \n\n Use this to customize the maximum size of the request body that your protected resources forward to WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). \n \n   You are charged additional fees when your protected resources forward body sizes that are larger than the default. For more information, see {{:http://aws.amazon.com/waf/pricing/}WAF Pricing}.\n   \n     For Application Load Balancer and AppSync, the limit is fixed at 8 KB (8,192 bytes).\n     "];
  token_domains: string list option
    [@ocaml.doc
      "Specifies the domains that WAF should accept in a web request token. This enables the use of tokens across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts the resource's host domain plus all domains in the token domain list, including their prefixed subdomains.\n\n Example JSON: [\"TokenDomains\": { \"mywebsite.com\", \"myotherwebsite.com\" }] \n \n  Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.\n  "];
  challenge_config: challenge_config option
    [@ocaml.doc
      "Specifies how WAF should handle challenge evaluations for rules that don't have their own [ChallengeConfig] settings. If you don't specify this, WAF uses its default settings for [ChallengeConfig]. \n"];
  captcha_config: captcha_config option
    [@ocaml.doc
      "Specifies how WAF should handle [CAPTCHA] evaluations for rules that don't have their own [CaptchaConfig] settings. If you don't specify this, WAF uses its default settings for [CaptchaConfig]. \n"];
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the web ACL, and then use them in the rules and default actions that you define in the web ACL. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  tags: tag list option
    [@ocaml.doc
      "An array of key:value pairs to associate with the resource.\n"];
  data_protection_config: data_protection_config option
    [@ocaml.doc
      "Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level data protection option. \n\n The data protection that you configure for the web ACL alters the data that's available for any other data collection activity, including your WAF logging destinations, web ACL request sampling, and Amazon Security Lake data collection and management. Your other option for data protection is in the logging configuration, which only affects logging. \n "];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the web ACL that helps with identification. \n"];
  default_action: default_action
    [@ocaml.doc
      "The action to perform if none of the [Rules] contained in the [WebACL] match. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the web ACL. You cannot change the name of a web ACL after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec create_rule_group_response =
  {
  summary: rule_group_summary option
    [@ocaml.doc
      "High-level information about a [RuleGroup], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RuleGroup], and the ARN, that you provide to the [RuleGroupReferenceStatement] to use the rule group in a [Rule].\n"]}
[@@ocaml.doc ""]
type nonrec create_rule_group_request =
  {
  custom_response_bodies: custom_response_bodies option
    [@ocaml.doc
      "A map of custom response keys and content bodies. When you create a rule with a block action, you can send a custom response to the web request. You define these for the rule group, and then use them in the rules that you define in the rule group. \n\n For information about customizing web requests and responses, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-custom-request-response.html}Customizing web requests and responses in WAF} in the {i WAF Developer Guide}. \n \n  For information about the limits on count and size for custom request and response settings, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}WAF quotas} in the {i WAF Developer Guide}. \n  "];
  tags: tag list option
    [@ocaml.doc
      "An array of key:value pairs to associate with the resource.\n"];
  visibility_config: visibility_config
    [@ocaml.doc
      "Defines and enables Amazon CloudWatch metrics and web request sample collection. \n"];
  rules: rule list option
    [@ocaml.doc
      "The [Rule] statements used to identify the web requests that you want to manage. Each rule includes one top-level statement that WAF uses to identify matching web requests, and parameters that govern how WAF handles them. \n"];
  description: string option
    [@ocaml.doc
      "A description of the rule group that helps with identification. \n"];
  capacity: int
    [@ocaml.doc
      "The web ACL capacity units (WCUs) required for this rule group.\n\n When you create your own rule group, you define this, and you cannot change it after creation. When you add or modify the rules in a rule group, WAF enforces this limit. You can check the capacity for a set of rules using [CheckCapacity].\n \n  WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n  "];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the rule group. You cannot change the name of a rule group after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_response =
  {
  summary: regex_pattern_set_summary option
    [@ocaml.doc
      "High-level information about a [RegexPatternSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage a [RegexPatternSet], and the ARN, that you provide to the [RegexPatternSetReferenceStatement] to use the pattern set in a [Rule].\n"]}
[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_request =
  {
  tags: tag list option
    [@ocaml.doc
      "An array of key:value pairs to associate with the resource.\n"];
  regular_expression_list: regex list
    [@ocaml.doc "Array of regular expression strings. \n"];
  description: string option
    [@ocaml.doc
      "A description of the set that helps with identification. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the set. You cannot change the name after you create the set.\n"]}
[@@ocaml.doc ""]
type nonrec create_ip_set_response =
  {
  summary: ip_set_summary option
    [@ocaml.doc
      "High-level information about an [IPSet], returned by operations like create and list. This provides information like the ID, that you can use to retrieve and manage an [IPSet], and the ARN, that you provide to the [IPSetReferenceStatement] to use the address set in a [Rule].\n"]}
[@@ocaml.doc ""]
type nonrec create_ip_set_request =
  {
  tags: tag list option
    [@ocaml.doc
      "An array of key:value pairs to associate with the resource.\n"];
  addresses: string list
    [@ocaml.doc
      "Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that you want WAF to inspect for in incoming requests. All addresses must be specified using Classless Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for [/0]. \n\n Example address strings: \n \n  {ul\n        {-  For requests that originated from the IP address 192.0.2.44, specify [192.0.2.44/32].\n            \n             }\n        {-  For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify [192.0.2.0/24].\n            \n             }\n        {-  For requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify [1111:0000:0000:0000:0000:0000:0000:0111/128].\n            \n             }\n        {-  For requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n            \n             }\n        }\n   For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}.\n   \n    Example JSON [Addresses] specifications: \n    \n     {ul\n           {-  Empty array: [\"Addresses\": \\[\\]] \n               \n                }\n           {-  Array with one address: [\"Addresses\": \\[\"192.0.2.44/32\"\\]] \n               \n                }\n           {-  Array with three addresses: [\"Addresses\": \\[\"192.0.2.44/32\", \"192.0.2.0/24\", \"192.0.0.0/16\"\\]] \n               \n                }\n           {-  INVALID specification: [\"Addresses\": \\[\"\"\\]] INVALID \n               \n                }\n           }\n  "];
  ip_address_version: ip_address_version
    [@ocaml.doc
      "The version of the IP addresses, either [IPV4] or [IPV6]. \n"];
  description: string option
    [@ocaml.doc
      "A description of the IP set that helps with identification. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc
      "The name of the IP set. You cannot change the name of an [IPSet] after you create it.\n"]}
[@@ocaml.doc ""]
type nonrec create_api_key_response =
  {
  api_key: string option
    [@ocaml.doc
      "The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration. \n"]}
[@@ocaml.doc ""]
type nonrec create_api_key_request =
  {
  token_domains: string list
    [@ocaml.doc
      "The client application domains that you want to use this API key for. \n\n Example JSON: [\"TokenDomains\": \\[\"abc.com\", \"store.abc.com\"\\]] \n \n  Public suffixes aren't allowed. For example, you can't use [gov.au] or [co.uk] as token domains.\n  "];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec check_capacity_response =
  {
  capacity: int option
    [@ocaml.doc "The capacity required by the rules and scope.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec check_capacity_request =
  {
  rules: rule list
    [@ocaml.doc
      "An array of [Rule] that you're configuring to use in a rule group or web ACL. \n"];
  scope: scope
    [@ocaml.doc
      "Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For an Amplify application, use [CLOUDFRONT].\n\n To work with CloudFront, you must also specify the Region US East (N. Virginia) as follows: \n \n  {ul\n        {-  CLI - Specify the Region when you use the CloudFront scope: [--scope=CLOUDFRONT --region=us-east-1]. \n            \n             }\n        {-  API and SDKs - For all calls, use the Region endpoint us-east-1. \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec associate_web_acl_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to associate with the web ACL. \n\n The ARN must be in one of the following formats:\n \n  {ul\n        {-  For an Application Load Balancer: \n            {[\n            arn:{i partition}:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon API Gateway REST API: \n            {[\n            arn:{i partition}:apigateway:{i region}::/restapis/{i api-id}/stages/{i stage-name} \n            ]}\n             \n            \n             }\n        {-  For an AppSync GraphQL API: \n            {[\n            arn:{i partition}:appsync:{i region}:{i account-id}:apis/{i GraphQLApiId} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Cognito user pool: \n            {[\n            arn:{i partition}:cognito-idp:{i region}:{i account-id}:userpool/{i user-pool-id} \n            ]}\n             \n            \n             }\n        {-  For an App Runner service: \n            {[\n            arn:{i partition}:apprunner:{i region}:{i account-id}:service/{i apprunner-service-name}/{i apprunner-service-id} \n            ]}\n             \n            \n             }\n        {-  For an Amazon Web Services Verified Access instance: \n            {[\n            arn:{i partition}:ec2:{i region}:{i account-id}:verified-access-instance/{i instance-id} \n            ]}\n             \n            \n             }\n        {-  For an Amplify application: \n            {[\n            arn:{i partition}:amplify:{i region}:{i account-id}:apps/{i app-id} \n            ]}\n             \n            \n             }\n        }\n  "];
  web_acl_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_single_header : name:string -> unit -> single_header
val make_single_query_argument : name:string -> unit -> single_query_argument
val make_all_query_arguments : unit -> unit
val make_uri_path : unit -> unit
val make_query_string : unit -> unit
val make_body : ?oversize_handling:oversize_handling -> unit -> body
val make_method_ : unit -> unit
val make_all : unit -> unit
val make_json_match_pattern :
  ?included_paths:string list -> ?all:unit -> unit -> json_match_pattern
val make_json_body :
  ?oversize_handling:oversize_handling ->
    ?invalid_fallback_behavior:body_parsing_fallback_behavior ->
      match_scope:json_match_scope ->
        match_pattern:json_match_pattern -> unit -> json_body
val make_header_match_pattern :
  ?excluded_headers:string list ->
    ?included_headers:string list ->
      ?all:unit -> unit -> header_match_pattern
val make_headers :
  oversize_handling:oversize_handling ->
    match_scope:map_match_scope ->
      match_pattern:header_match_pattern -> unit -> headers
val make_cookie_match_pattern :
  ?excluded_cookies:string list ->
    ?included_cookies:string list ->
      ?all:unit -> unit -> cookie_match_pattern
val make_cookies :
  oversize_handling:oversize_handling ->
    match_scope:map_match_scope ->
      match_pattern:cookie_match_pattern -> unit -> cookies
val make_header_order :
  oversize_handling:oversize_handling -> unit -> header_order
val make_ja3_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> ja3_fingerprint
val make_ja4_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> ja4_fingerprint
val make_uri_fragment :
  ?fallback_behavior:fallback_behavior -> unit -> uri_fragment
val make_field_to_match :
  ?uri_fragment:uri_fragment ->
    ?ja4_fingerprint:ja4_fingerprint ->
      ?ja3_fingerprint:ja3_fingerprint ->
        ?header_order:header_order ->
          ?cookies:cookies ->
            ?headers:headers ->
              ?json_body:json_body ->
                ?method_:unit ->
                  ?body:body ->
                    ?query_string:unit ->
                      ?uri_path:unit ->
                        ?all_query_arguments:unit ->
                          ?single_query_argument:single_query_argument ->
                            ?single_header:single_header ->
                              unit -> field_to_match
val make_text_transformation :
  type_:text_transformation_type ->
    priority:int -> unit -> text_transformation
val make_xss_match_statement :
  text_transformations:text_transformation list ->
    field_to_match:field_to_match -> unit -> xss_match_statement
val make_web_acl_summary :
  ?ar_n:string ->
    ?lock_token:string ->
      ?description:string ->
        ?id:string -> ?name:string -> unit -> web_acl_summary
val make_custom_http_header :
  value:string -> name:string -> unit -> custom_http_header
val make_custom_response :
  ?response_headers:custom_http_header list ->
    ?custom_response_body_key:string ->
      response_code:int -> unit -> custom_response
val make_block_action :
  ?custom_response:custom_response -> unit -> block_action
val make_custom_request_handling :
  insert_headers:custom_http_header list -> unit -> custom_request_handling
val make_allow_action :
  ?custom_request_handling:custom_request_handling -> unit -> allow_action
val make_default_action :
  ?allow:allow_action -> ?block:block_action -> unit -> default_action
val make_byte_match_statement :
  positional_constraint:positional_constraint ->
    text_transformations:text_transformation list ->
      field_to_match:field_to_match ->
        search_string:bytes -> unit -> byte_match_statement
val make_sqli_match_statement :
  ?sensitivity_level:sensitivity_level ->
    text_transformations:text_transformation list ->
      field_to_match:field_to_match -> unit -> sqli_match_statement
val make_size_constraint_statement :
  text_transformations:text_transformation list ->
    size:int ->
      comparison_operator:comparison_operator ->
        field_to_match:field_to_match -> unit -> size_constraint_statement
val make_forwarded_ip_config :
  fallback_behavior:fallback_behavior ->
    header_name:string -> unit -> forwarded_ip_config
val make_geo_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
    ?country_codes:country_code list -> unit -> geo_match_statement
val make_excluded_rule : name:string -> unit -> excluded_rule
val make_count_action :
  ?custom_request_handling:custom_request_handling -> unit -> count_action
val make_captcha_action :
  ?custom_request_handling:custom_request_handling -> unit -> captcha_action
val make_challenge_action :
  ?custom_request_handling:custom_request_handling ->
    unit -> challenge_action
val make_rule_action :
  ?challenge:challenge_action ->
    ?captcha:captcha_action ->
      ?count:count_action ->
        ?allow:allow_action -> ?block:block_action -> unit -> rule_action
val make_rule_action_override :
  action_to_use:rule_action -> name:string -> unit -> rule_action_override
val make_rule_group_reference_statement :
  ?rule_action_overrides:rule_action_override list ->
    ?excluded_rules:excluded_rule list ->
      ar_n:string -> unit -> rule_group_reference_statement
val make_ip_set_forwarded_ip_config :
  position:forwarded_ip_position ->
    fallback_behavior:fallback_behavior ->
      header_name:string -> unit -> ip_set_forwarded_ip_config
val make_ip_set_reference_statement :
  ?ip_set_forwarded_ip_config:ip_set_forwarded_ip_config ->
    ar_n:string -> unit -> ip_set_reference_statement
val make_regex_pattern_set_reference_statement :
  text_transformations:text_transformation list ->
    field_to_match:field_to_match ->
      ar_n:string -> unit -> regex_pattern_set_reference_statement
val make_rate_limit_header :
  text_transformations:text_transformation list ->
    name:string -> unit -> rate_limit_header
val make_rate_limit_cookie :
  text_transformations:text_transformation list ->
    name:string -> unit -> rate_limit_cookie
val make_rate_limit_query_argument :
  text_transformations:text_transformation list ->
    name:string -> unit -> rate_limit_query_argument
val make_rate_limit_query_string :
  text_transformations:text_transformation list ->
    unit -> rate_limit_query_string
val make_rate_limit_http_method : unit -> unit
val make_rate_limit_forwarded_i_p : unit -> unit
val make_rate_limit_i_p : unit -> unit
val make_rate_limit_label_namespace :
  namespace:string -> unit -> rate_limit_label_namespace
val make_rate_limit_uri_path :
  text_transformations:text_transformation list ->
    unit -> rate_limit_uri_path
val make_rate_limit_ja3_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja3_fingerprint
val make_rate_limit_ja4_fingerprint :
  fallback_behavior:fallback_behavior -> unit -> rate_limit_ja4_fingerprint
val make_rate_limit_asn : unit -> unit
val make_rate_based_statement_custom_key :
  ?as_n:unit ->
    ?ja4_fingerprint:rate_limit_ja4_fingerprint ->
      ?ja3_fingerprint:rate_limit_ja3_fingerprint ->
        ?uri_path:rate_limit_uri_path ->
          ?label_namespace:rate_limit_label_namespace ->
            ?i_p:unit ->
              ?forwarded_i_p:unit ->
                ?http_method:unit ->
                  ?query_string:rate_limit_query_string ->
                    ?query_argument:rate_limit_query_argument ->
                      ?cookie:rate_limit_cookie ->
                        ?header:rate_limit_header ->
                          unit -> rate_based_statement_custom_key
val make_username_field : identifier:string -> unit -> username_field
val make_password_field : identifier:string -> unit -> password_field
val make_aws_managed_rules_bot_control_rule_set :
  ?enable_machine_learning:bool ->
    inspection_level:inspection_level ->
      unit -> aws_managed_rules_bot_control_rule_set
val make_request_inspection :
  password_field:password_field ->
    username_field:username_field ->
      payload_type:payload_type -> unit -> request_inspection
val make_response_inspection_status_code :
  failure_codes:int list ->
    success_codes:int list -> unit -> response_inspection_status_code
val make_response_inspection_header :
  failure_values:string list ->
    success_values:string list ->
      name:string -> unit -> response_inspection_header
val make_response_inspection_body_contains :
  failure_strings:string list ->
    success_strings:string list -> unit -> response_inspection_body_contains
val make_response_inspection_json :
  failure_values:string list ->
    success_values:string list ->
      identifier:string -> unit -> response_inspection_json
val make_response_inspection :
  ?json:response_inspection_json ->
    ?body_contains:response_inspection_body_contains ->
      ?header:response_inspection_header ->
        ?status_code:response_inspection_status_code ->
          unit -> response_inspection
val make_aws_managed_rules_atp_rule_set :
  ?enable_regex_in_path:bool ->
    ?response_inspection:response_inspection ->
      ?request_inspection:request_inspection ->
        login_path:string -> unit -> aws_managed_rules_atp_rule_set
val make_email_field : identifier:string -> unit -> email_field
val make_phone_number_field : identifier:string -> unit -> phone_number_field
val make_address_field : identifier:string -> unit -> address_field
val make_request_inspection_acf_p :
  ?address_fields:address_field list ->
    ?phone_number_fields:phone_number_field list ->
      ?email_field:email_field ->
        ?password_field:password_field ->
          ?username_field:username_field ->
            payload_type:payload_type -> unit -> request_inspection_acf_p
val make_aws_managed_rules_acfp_rule_set :
  ?enable_regex_in_path:bool ->
    ?response_inspection:response_inspection ->
      request_inspection:request_inspection_acf_p ->
        registration_page_path:string ->
          creation_path:string -> unit -> aws_managed_rules_acfp_rule_set
val make_regex : ?regex_string:string -> unit -> regex
val make_client_side_action :
  ?exempt_uri_regular_expressions:regex list ->
    ?sensitivity:sensitivity_to_act ->
      usage_of_action:usage_of_action -> unit -> client_side_action
val make_client_side_action_config :
  challenge:client_side_action -> unit -> client_side_action_config
val make_aws_managed_rules_anti_d_do_s_rule_set :
  ?sensitivity_to_block:sensitivity_to_act ->
    client_side_action_config:client_side_action_config ->
      unit -> aws_managed_rules_anti_d_do_s_rule_set
val make_managed_rule_group_config :
  ?aws_managed_rules_anti_d_do_s_rule_set:aws_managed_rules_anti_d_do_s_rule_set
    ->
    ?aws_managed_rules_acfp_rule_set:aws_managed_rules_acfp_rule_set ->
      ?aws_managed_rules_atp_rule_set:aws_managed_rules_atp_rule_set ->
        ?aws_managed_rules_bot_control_rule_set:aws_managed_rules_bot_control_rule_set
          ->
          ?password_field:password_field ->
            ?username_field:username_field ->
              ?payload_type:payload_type ->
                ?login_path:string -> unit -> managed_rule_group_config
val make_label_match_statement :
  key:string -> scope:label_match_scope -> unit -> label_match_statement
val make_regex_match_statement :
  text_transformations:text_transformation list ->
    field_to_match:field_to_match ->
      regex_string:string -> unit -> regex_match_statement
val make_asn_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
    asn_list:int list -> unit -> asn_match_statement
val make_and_statement : statements:statement list -> unit -> and_statement
val make_managed_rule_group_statement :
  ?rule_action_overrides:rule_action_override list ->
    ?managed_rule_group_configs:managed_rule_group_config list ->
      ?scope_down_statement:statement ->
        ?excluded_rules:excluded_rule list ->
          ?version:string ->
            name:string ->
              vendor_name:string -> unit -> managed_rule_group_statement
val make_not_statement : statement:statement -> unit -> not_statement
val make_or_statement : statements:statement list -> unit -> or_statement
val make_rate_based_statement :
  ?custom_keys:rate_based_statement_custom_key list ->
    ?forwarded_ip_config:forwarded_ip_config ->
      ?scope_down_statement:statement ->
        ?evaluation_window_sec:int ->
          aggregate_key_type:rate_based_statement_aggregate_key_type ->
            limit:int -> unit -> rate_based_statement
val make_statement :
  ?asn_match_statement:asn_match_statement ->
    ?regex_match_statement:regex_match_statement ->
      ?label_match_statement:label_match_statement ->
        ?managed_rule_group_statement:managed_rule_group_statement ->
          ?not_statement:not_statement ->
            ?or_statement:or_statement ->
              ?and_statement:and_statement ->
                ?rate_based_statement:rate_based_statement ->
                  ?regex_pattern_set_reference_statement:regex_pattern_set_reference_statement
                    ->
                    ?ip_set_reference_statement:ip_set_reference_statement ->
                      ?rule_group_reference_statement:rule_group_reference_statement
                        ->
                        ?geo_match_statement:geo_match_statement ->
                          ?size_constraint_statement:size_constraint_statement
                            ->
                            ?xss_match_statement:xss_match_statement ->
                              ?sqli_match_statement:sqli_match_statement ->
                                ?byte_match_statement:byte_match_statement ->
                                  unit -> statement
val make_none_action : unit -> unit
val make_override_action :
  ?none:unit -> ?count:count_action -> unit -> override_action
val make_label : name:string -> unit -> label
val make_visibility_config :
  metric_name:string ->
    cloud_watch_metrics_enabled:bool ->
      sampled_requests_enabled:bool -> unit -> visibility_config
val make_immunity_time_property :
  immunity_time:int -> unit -> immunity_time_property
val make_captcha_config :
  ?immunity_time_property:immunity_time_property -> unit -> captcha_config
val make_challenge_config :
  ?immunity_time_property:immunity_time_property -> unit -> challenge_config
val make_rule :
  ?challenge_config:challenge_config ->
    ?captcha_config:captcha_config ->
      ?rule_labels:label list ->
        ?override_action:override_action ->
          ?action:rule_action ->
            visibility_config:visibility_config ->
              statement:statement ->
                priority:int -> name:string -> unit -> rule
val make_field_to_protect :
  ?field_keys:string list ->
    field_type:field_to_protect_type -> unit -> field_to_protect
val make_data_protection :
  ?exclude_rate_based_details:bool ->
    ?exclude_rule_match_details:bool ->
      action:data_protection_action ->
        field:field_to_protect -> unit -> data_protection
val make_data_protection_config :
  data_protections:data_protection list -> unit -> data_protection_config
val make_firewall_manager_statement :
  ?rule_group_reference_statement:rule_group_reference_statement ->
    ?managed_rule_group_statement:managed_rule_group_statement ->
      unit -> firewall_manager_statement
val make_firewall_manager_rule_group :
  visibility_config:visibility_config ->
    override_action:override_action ->
      firewall_manager_statement:firewall_manager_statement ->
        priority:int -> name:string -> unit -> firewall_manager_rule_group
val make_custom_response_body :
  content:string ->
    content_type:response_content_type -> unit -> custom_response_body
val make_request_body_associated_resource_type_config :
  default_size_inspection_limit:size_inspection_limit ->
    unit -> request_body_associated_resource_type_config
val make_association_config :
  ?request_body:request_body -> unit -> association_config
val make_on_source_d_do_s_protection_config :
  alb_low_reputation_mode:low_reputation_mode ->
    unit -> on_source_d_do_s_protection_config
val make_application_attribute :
  ?values:string list -> ?name:string -> unit -> application_attribute
val make_application_config :
  ?attributes:application_attribute list -> unit -> application_config
val make_web_ac_l :
  ?application_config:application_config ->
    ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
      ?retrofitted_by_firewall_manager:bool ->
        ?association_config:association_config ->
          ?token_domains:string list ->
            ?challenge_config:challenge_config ->
              ?captcha_config:captcha_config ->
                ?custom_response_bodies:custom_response_bodies ->
                  ?label_namespace:string ->
                    ?managed_by_firewall_manager:bool ->
                      ?post_process_firewall_manager_rule_groups:firewall_manager_rule_group
                        list ->
                        ?pre_process_firewall_manager_rule_groups:firewall_manager_rule_group
                          list ->
                          ?capacity:int ->
                            ?data_protection_config:data_protection_config ->
                              ?rules:rule list ->
                                ?description:string ->
                                  visibility_config:visibility_config ->
                                    default_action:default_action ->
                                      ar_n:string ->
                                        id:string ->
                                          name:string -> unit -> web_ac_l
val make_version_to_publish :
  ?forecasted_lifetime:int ->
    ?associated_rule_group_arn:string -> unit -> version_to_publish
val make_update_web_acl_response :
  ?next_lock_token:string -> unit -> update_web_acl_response
val make_update_web_acl_request :
  ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
    ?association_config:association_config ->
      ?token_domains:string list ->
        ?challenge_config:challenge_config ->
          ?captcha_config:captcha_config ->
            ?custom_response_bodies:custom_response_bodies ->
              ?data_protection_config:data_protection_config ->
                ?rules:rule list ->
                  ?description:string ->
                    lock_token:string ->
                      visibility_config:visibility_config ->
                        default_action:default_action ->
                          id:string ->
                            scope:scope ->
                              name:string -> unit -> update_web_acl_request
val make_update_rule_group_response :
  ?next_lock_token:string -> unit -> update_rule_group_response
val make_update_rule_group_request :
  ?custom_response_bodies:custom_response_bodies ->
    ?rules:rule list ->
      ?description:string ->
        lock_token:string ->
          visibility_config:visibility_config ->
            id:string ->
              scope:scope -> name:string -> unit -> update_rule_group_request
val make_update_regex_pattern_set_response :
  ?next_lock_token:string -> unit -> update_regex_pattern_set_response
val make_update_regex_pattern_set_request :
  ?description:string ->
    lock_token:string ->
      regular_expression_list:regex list ->
        id:string ->
          scope:scope ->
            name:string -> unit -> update_regex_pattern_set_request
val make_update_managed_rule_set_version_expiry_date_response :
  ?next_lock_token:string ->
    ?expiry_timestamp:CoreTypes.Timestamp.t ->
      ?expiring_version:string ->
        unit -> update_managed_rule_set_version_expiry_date_response
val make_update_managed_rule_set_version_expiry_date_request :
  expiry_timestamp:CoreTypes.Timestamp.t ->
    version_to_expire:string ->
      lock_token:string ->
        id:string ->
          scope:scope ->
            name:string ->
              unit -> update_managed_rule_set_version_expiry_date_request
val make_update_ip_set_response :
  ?next_lock_token:string -> unit -> update_ip_set_response
val make_update_ip_set_request :
  ?description:string ->
    lock_token:string ->
      addresses:string list ->
        id:string ->
          scope:scope -> name:string -> unit -> update_ip_set_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_time_window :
  end_time:CoreTypes.Timestamp.t ->
    start_time:CoreTypes.Timestamp.t -> unit -> time_window
val make_tag_resource_response : unit -> unit
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_tag_info_for_resource :
  ?tag_list:tag list ->
    ?resource_ar_n:string -> unit -> tag_info_for_resource
val make_http_header : ?value:string -> ?name:string -> unit -> http_header
val make_http_request :
  ?headers:http_header list ->
    ?http_version:string ->
      ?method_:string ->
        ?ur_i:string ->
          ?country:string -> ?client_i_p:string -> unit -> http_request
val make_captcha_response :
  ?failure_reason:failure_reason ->
    ?solve_timestamp:int -> ?response_code:int -> unit -> captcha_response
val make_challenge_response :
  ?failure_reason:failure_reason ->
    ?solve_timestamp:int -> ?response_code:int -> unit -> challenge_response
val make_sampled_http_request :
  ?overridden_action:string ->
    ?challenge_response:challenge_response ->
      ?captcha_response:captcha_response ->
        ?labels:label list ->
          ?response_code_sent:int ->
            ?request_headers_inserted:http_header list ->
              ?rule_name_within_rule_group:string ->
                ?action:string ->
                  ?timestamp_:CoreTypes.Timestamp.t ->
                    weight:int ->
                      request:http_request -> unit -> sampled_http_request
val make_rule_summary :
  ?action:rule_action -> ?name:string -> unit -> rule_summary
val make_rule_group_summary :
  ?ar_n:string ->
    ?lock_token:string ->
      ?description:string ->
        ?id:string -> ?name:string -> unit -> rule_group_summary
val make_label_summary : ?name:string -> unit -> label_summary
val make_rule_group :
  ?consumed_labels:label_summary list ->
    ?available_labels:label_summary list ->
      ?custom_response_bodies:custom_response_bodies ->
        ?label_namespace:string ->
          ?rules:rule list ->
            ?description:string ->
              visibility_config:visibility_config ->
                ar_n:string ->
                  capacity:int ->
                    id:string -> name:string -> unit -> rule_group
val make_release_summary :
  ?timestamp_:CoreTypes.Timestamp.t ->
    ?release_version:string -> unit -> release_summary
val make_regex_pattern_set_summary :
  ?ar_n:string ->
    ?lock_token:string ->
      ?description:string ->
        ?id:string -> ?name:string -> unit -> regex_pattern_set_summary
val make_regex_pattern_set :
  ?regular_expression_list:regex list ->
    ?description:string ->
      ?ar_n:string -> ?id:string -> ?name:string -> unit -> regex_pattern_set
val make_rate_based_statement_managed_keys_ip_set :
  ?addresses:string list ->
    ?ip_address_version:ip_address_version ->
      unit -> rate_based_statement_managed_keys_ip_set
val make_put_permission_policy_response : unit -> unit
val make_put_permission_policy_request :
  policy:string ->
    resource_arn:string -> unit -> put_permission_policy_request
val make_put_managed_rule_set_versions_response :
  ?next_lock_token:string -> unit -> put_managed_rule_set_versions_response
val make_put_managed_rule_set_versions_request :
  ?versions_to_publish:versions_to_publish ->
    ?recommended_version:string ->
      lock_token:string ->
        id:string ->
          scope:scope ->
            name:string -> unit -> put_managed_rule_set_versions_request
val make_action_condition : action:action_value -> unit -> action_condition
val make_label_name_condition :
  label_name:string -> unit -> label_name_condition
val make_condition :
  ?label_name_condition:label_name_condition ->
    ?action_condition:action_condition -> unit -> condition
val make_filter :
  conditions:condition list ->
    requirement:filter_requirement ->
      behavior:filter_behavior -> unit -> filter
val make_logging_filter :
  default_behavior:filter_behavior ->
    filters:filter list -> unit -> logging_filter
val make_logging_configuration :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      ?logging_filter:logging_filter ->
        ?managed_by_firewall_manager:bool ->
          ?redacted_fields:field_to_match list ->
            log_destination_configs:string list ->
              resource_arn:string -> unit -> logging_configuration
val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_response
val make_put_logging_configuration_request :
  logging_configuration:logging_configuration ->
    unit -> put_logging_configuration_request
val make_managed_rule_set_version :
  ?expiry_timestamp:CoreTypes.Timestamp.t ->
    ?last_update_timestamp:CoreTypes.Timestamp.t ->
      ?publish_timestamp:CoreTypes.Timestamp.t ->
        ?forecasted_lifetime:int ->
          ?capacity:int ->
            ?associated_rule_group_arn:string ->
              unit -> managed_rule_set_version
val make_mobile_sdk_release :
  ?tags:tag list ->
    ?release_notes:string ->
      ?timestamp_:CoreTypes.Timestamp.t ->
        ?release_version:string -> unit -> mobile_sdk_release
val make_managed_rule_set_summary :
  ?label_namespace:string ->
    ?ar_n:string ->
      ?lock_token:string ->
        ?description:string ->
          ?id:string -> ?name:string -> unit -> managed_rule_set_summary
val make_managed_rule_set :
  ?label_namespace:string ->
    ?recommended_version:string ->
      ?published_versions:published_versions ->
        ?description:string ->
          ar_n:string -> id:string -> name:string -> unit -> managed_rule_set
val make_managed_rule_group_version :
  ?last_update_timestamp:CoreTypes.Timestamp.t ->
    ?name:string -> unit -> managed_rule_group_version
val make_managed_rule_group_summary :
  ?description:string ->
    ?versioning_supported:bool ->
      ?name:string ->
        ?vendor_name:string -> unit -> managed_rule_group_summary
val make_managed_product_descriptor :
  ?is_advanced_managed_rule_set:bool ->
    ?is_versioning_supported:bool ->
      ?sns_topic_arn:string ->
        ?product_description:string ->
          ?product_title:string ->
            ?product_link:string ->
              ?product_id:string ->
                ?managed_rule_set_name:string ->
                  ?vendor_name:string -> unit -> managed_product_descriptor
val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list ->
    ?next_marker:string -> unit -> list_web_ac_ls_response
val make_list_web_ac_ls_request :
  ?limit:int ->
    ?next_marker:string -> scope:scope -> unit -> list_web_ac_ls_request
val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource ->
    ?next_marker:string -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?limit:int ->
    ?next_marker:string ->
      resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list ->
    ?next_marker:string -> unit -> list_rule_groups_response
val make_list_rule_groups_request :
  ?limit:int ->
    ?next_marker:string -> scope:scope -> unit -> list_rule_groups_request
val make_list_resources_for_web_acl_response :
  ?resource_arns:string list -> unit -> list_resources_for_web_acl_response
val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type ->
    web_acl_arn:string -> unit -> list_resources_for_web_acl_request
val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
    ?next_marker:string -> unit -> list_regex_pattern_sets_response
val make_list_regex_pattern_sets_request :
  ?limit:int ->
    ?next_marker:string ->
      scope:scope -> unit -> list_regex_pattern_sets_request
val make_list_mobile_sdk_releases_response :
  ?next_marker:string ->
    ?release_summaries:release_summary list ->
      unit -> list_mobile_sdk_releases_response
val make_list_mobile_sdk_releases_request :
  ?limit:int ->
    ?next_marker:string ->
      platform:platform -> unit -> list_mobile_sdk_releases_request
val make_list_managed_rule_sets_response :
  ?managed_rule_sets:managed_rule_set_summary list ->
    ?next_marker:string -> unit -> list_managed_rule_sets_response
val make_list_managed_rule_sets_request :
  ?limit:int ->
    ?next_marker:string ->
      scope:scope -> unit -> list_managed_rule_sets_request
val make_list_logging_configurations_response :
  ?next_marker:string ->
    ?logging_configurations:logging_configuration list ->
      unit -> list_logging_configurations_response
val make_list_logging_configurations_request :
  ?log_scope:log_scope ->
    ?limit:int ->
      ?next_marker:string ->
        scope:scope -> unit -> list_logging_configurations_request
val make_ip_set_summary :
  ?ar_n:string ->
    ?lock_token:string ->
      ?description:string ->
        ?id:string -> ?name:string -> unit -> ip_set_summary
val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list ->
    ?next_marker:string -> unit -> list_ip_sets_response
val make_list_ip_sets_request :
  ?limit:int ->
    ?next_marker:string -> scope:scope -> unit -> list_ip_sets_request
val make_list_available_managed_rule_groups_response :
  ?managed_rule_groups:managed_rule_group_summary list ->
    ?next_marker:string ->
      unit -> list_available_managed_rule_groups_response
val make_list_available_managed_rule_groups_request :
  ?limit:int ->
    ?next_marker:string ->
      scope:scope -> unit -> list_available_managed_rule_groups_request
val make_list_available_managed_rule_group_versions_response :
  ?current_default_version:string ->
    ?versions:managed_rule_group_version list ->
      ?next_marker:string ->
        unit -> list_available_managed_rule_group_versions_response
val make_list_available_managed_rule_group_versions_request :
  ?limit:int ->
    ?next_marker:string ->
      scope:scope ->
        name:string ->
          vendor_name:string ->
            unit -> list_available_managed_rule_group_versions_request
val make_api_key_summary :
  ?version:int ->
    ?creation_timestamp:CoreTypes.Timestamp.t ->
      ?api_key:string ->
        ?token_domains:string list -> unit -> api_key_summary
val make_list_api_keys_response :
  ?application_integration_ur_l:string ->
    ?api_key_summaries:api_key_summary list ->
      ?next_marker:string -> unit -> list_api_keys_response
val make_list_api_keys_request :
  ?limit:int ->
    ?next_marker:string -> scope:scope -> unit -> list_api_keys_request
val make_ip_set :
  ?description:string ->
    addresses:string list ->
      ip_address_version:ip_address_version ->
        ar_n:string -> id:string -> name:string -> unit -> ip_set
val make_get_web_acl_response :
  ?application_integration_ur_l:string ->
    ?lock_token:string -> ?web_ac_l:web_ac_l -> unit -> get_web_acl_response
val make_get_web_acl_request :
  ?ar_n:string ->
    ?id:string -> ?scope:scope -> ?name:string -> unit -> get_web_acl_request
val make_get_web_acl_for_resource_response :
  ?web_ac_l:web_ac_l -> unit -> get_web_acl_for_resource_response
val make_get_web_acl_for_resource_request :
  resource_arn:string -> unit -> get_web_acl_for_resource_request
val make_get_sampled_requests_response :
  ?time_window:time_window ->
    ?population_size:int ->
      ?sampled_requests:sampled_http_request list ->
        unit -> get_sampled_requests_response
val make_get_sampled_requests_request :
  max_items:int ->
    time_window:time_window ->
      scope:scope ->
        rule_metric_name:string ->
          web_acl_arn:string -> unit -> get_sampled_requests_request
val make_get_rule_group_response :
  ?lock_token:string ->
    ?rule_group:rule_group -> unit -> get_rule_group_response
val make_get_rule_group_request :
  ?ar_n:string ->
    ?id:string ->
      ?scope:scope -> ?name:string -> unit -> get_rule_group_request
val make_get_regex_pattern_set_response :
  ?lock_token:string ->
    ?regex_pattern_set:regex_pattern_set ->
      unit -> get_regex_pattern_set_response
val make_get_regex_pattern_set_request :
  id:string ->
    scope:scope -> name:string -> unit -> get_regex_pattern_set_request
val make_get_rate_based_statement_managed_keys_response :
  ?managed_keys_ip_v6:rate_based_statement_managed_keys_ip_set ->
    ?managed_keys_ip_v4:rate_based_statement_managed_keys_ip_set ->
      unit -> get_rate_based_statement_managed_keys_response
val make_get_rate_based_statement_managed_keys_request :
  ?rule_group_rule_name:string ->
    rule_name:string ->
      web_acl_id:string ->
        web_acl_name:string ->
          scope:scope ->
            unit -> get_rate_based_statement_managed_keys_request
val make_get_permission_policy_response :
  ?policy:string -> unit -> get_permission_policy_response
val make_get_permission_policy_request :
  resource_arn:string -> unit -> get_permission_policy_request
val make_get_mobile_sdk_release_response :
  ?mobile_sdk_release:mobile_sdk_release ->
    unit -> get_mobile_sdk_release_response
val make_get_mobile_sdk_release_request :
  release_version:string ->
    platform:platform -> unit -> get_mobile_sdk_release_request
val make_get_managed_rule_set_response :
  ?lock_token:string ->
    ?managed_rule_set:managed_rule_set ->
      unit -> get_managed_rule_set_response
val make_get_managed_rule_set_request :
  id:string ->
    scope:scope -> name:string -> unit -> get_managed_rule_set_request
val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration ->
    unit -> get_logging_configuration_response
val make_get_logging_configuration_request :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      resource_arn:string -> unit -> get_logging_configuration_request
val make_get_ip_set_response :
  ?lock_token:string -> ?ip_set:ip_set -> unit -> get_ip_set_response
val make_get_ip_set_request :
  id:string -> scope:scope -> name:string -> unit -> get_ip_set_request
val make_get_decrypted_api_key_response :
  ?creation_timestamp:CoreTypes.Timestamp.t ->
    ?token_domains:string list -> unit -> get_decrypted_api_key_response
val make_get_decrypted_api_key_request :
  api_key:string -> scope:scope -> unit -> get_decrypted_api_key_request
val make_generate_mobile_sdk_release_url_response :
  ?url:string -> unit -> generate_mobile_sdk_release_url_response
val make_generate_mobile_sdk_release_url_request :
  release_version:string ->
    platform:platform -> unit -> generate_mobile_sdk_release_url_request
val make_disassociate_web_acl_response : unit -> unit
val make_disassociate_web_acl_request :
  resource_arn:string -> unit -> disassociate_web_acl_request
val make_describe_managed_rule_group_response :
  ?consumed_labels:label_summary list ->
    ?available_labels:label_summary list ->
      ?label_namespace:string ->
        ?rules:rule_summary list ->
          ?capacity:int ->
            ?sns_topic_arn:string ->
              ?version_name:string ->
                unit -> describe_managed_rule_group_response
val make_describe_managed_rule_group_request :
  ?version_name:string ->
    scope:scope ->
      name:string ->
        vendor_name:string -> unit -> describe_managed_rule_group_request
val make_describe_managed_products_by_vendor_response :
  ?managed_products:managed_product_descriptor list ->
    unit -> describe_managed_products_by_vendor_response
val make_describe_managed_products_by_vendor_request :
  scope:scope ->
    vendor_name:string -> unit -> describe_managed_products_by_vendor_request
val make_describe_all_managed_products_response :
  ?managed_products:managed_product_descriptor list ->
    unit -> describe_all_managed_products_response
val make_describe_all_managed_products_request :
  scope:scope -> unit -> describe_all_managed_products_request
val make_delete_web_acl_response : unit -> unit
val make_delete_web_acl_request :
  lock_token:string ->
    id:string -> scope:scope -> name:string -> unit -> delete_web_acl_request
val make_delete_rule_group_response : unit -> unit
val make_delete_rule_group_request :
  lock_token:string ->
    id:string ->
      scope:scope -> name:string -> unit -> delete_rule_group_request
val make_delete_regex_pattern_set_response : unit -> unit
val make_delete_regex_pattern_set_request :
  lock_token:string ->
    id:string ->
      scope:scope -> name:string -> unit -> delete_regex_pattern_set_request
val make_delete_permission_policy_response : unit -> unit
val make_delete_permission_policy_request :
  resource_arn:string -> unit -> delete_permission_policy_request
val make_delete_logging_configuration_response : unit -> unit
val make_delete_logging_configuration_request :
  ?log_scope:log_scope ->
    ?log_type:log_type ->
      resource_arn:string -> unit -> delete_logging_configuration_request
val make_delete_ip_set_response : unit -> unit
val make_delete_ip_set_request :
  lock_token:string ->
    id:string -> scope:scope -> name:string -> unit -> delete_ip_set_request
val make_delete_firewall_manager_rule_groups_response :
  ?next_web_acl_lock_token:string ->
    unit -> delete_firewall_manager_rule_groups_response
val make_delete_firewall_manager_rule_groups_request :
  web_acl_lock_token:string ->
    web_acl_arn:string -> unit -> delete_firewall_manager_rule_groups_request
val make_delete_api_key_response : unit -> unit
val make_delete_api_key_request :
  api_key:string -> scope:scope -> unit -> delete_api_key_request
val make_create_web_acl_response :
  ?summary:web_acl_summary -> unit -> create_web_acl_response
val make_create_web_acl_request :
  ?application_config:application_config ->
    ?on_source_d_do_s_protection_config:on_source_d_do_s_protection_config ->
      ?association_config:association_config ->
        ?token_domains:string list ->
          ?challenge_config:challenge_config ->
            ?captcha_config:captcha_config ->
              ?custom_response_bodies:custom_response_bodies ->
                ?tags:tag list ->
                  ?data_protection_config:data_protection_config ->
                    ?rules:rule list ->
                      ?description:string ->
                        visibility_config:visibility_config ->
                          default_action:default_action ->
                            scope:scope ->
                              name:string -> unit -> create_web_acl_request
val make_create_rule_group_response :
  ?summary:rule_group_summary -> unit -> create_rule_group_response
val make_create_rule_group_request :
  ?custom_response_bodies:custom_response_bodies ->
    ?tags:tag list ->
      ?rules:rule list ->
        ?description:string ->
          visibility_config:visibility_config ->
            capacity:int ->
              scope:scope -> name:string -> unit -> create_rule_group_request
val make_create_regex_pattern_set_response :
  ?summary:regex_pattern_set_summary ->
    unit -> create_regex_pattern_set_response
val make_create_regex_pattern_set_request :
  ?tags:tag list ->
    ?description:string ->
      regular_expression_list:regex list ->
        scope:scope ->
          name:string -> unit -> create_regex_pattern_set_request
val make_create_ip_set_response :
  ?summary:ip_set_summary -> unit -> create_ip_set_response
val make_create_ip_set_request :
  ?tags:tag list ->
    ?description:string ->
      addresses:string list ->
        ip_address_version:ip_address_version ->
          scope:scope -> name:string -> unit -> create_ip_set_request
val make_create_api_key_response :
  ?api_key:string -> unit -> create_api_key_response
val make_create_api_key_request :
  token_domains:string list -> scope:scope -> unit -> create_api_key_request
val make_check_capacity_response :
  ?capacity:int -> unit -> check_capacity_response
val make_check_capacity_request :
  rules:rule list -> scope:scope -> unit -> check_capacity_request
val make_associate_web_acl_response : unit -> unit
val make_associate_web_acl_request :
  resource_arn:string ->
    web_acl_arn:string -> unit -> associate_web_acl_request(** {1:operations Operations} *)

module AssociateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_web_acl_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Associates a web ACL with a resource, to protect the resource. \n\n Use this for all resource types except for Amazon CloudFront distributions. For Amazon CloudFront, call [UpdateDistribution] for the distribution and provide the Amazon Resource Name (ARN) of the web ACL in the web ACL ID. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront Developer Guide}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-AssociateWebACL}Permissions for AssociateWebACL} in the {i WAF Developer Guide}. \n   \n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module CheckCapacity :
sig
  val request :
    Smaws_Lib.Context.t ->
      check_capacity_request ->
        (check_capacity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Returns the web ACL capacity unit (WCU) requirements for a specified scope and set of rules. You can use this to check the capacity requirements for the rules you want to use in a [RuleGroup] or [WebACL]. \n\n WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n "]
module CreateAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_key_request ->
        (create_api_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates an API key that contains a set of token domains.\n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n \n  You can use a single key for up to 5 domains. After you generate a key, you can copy it for use in your JavaScript integration. \n  "]
module CreateIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Creates an [IPSet], which you use to identify web requests that originate from specific IP addresses or ranges of IP addresses. For example, if you're receiving a lot of requests from a ranges of IP addresses, you can configure WAF to block them using an IPSet that lists those IP addresses. \n"]
module CreateRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Creates a [RegexPatternSet], which you reference in a [RegexPatternSetReferenceStatement], to have WAF inspect a web request component for the specified patterns.\n"]
module CreateRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Creates a [RuleGroup] per the specifications provided. \n\n  A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n "]
module CreateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Creates a [WebACL] per the specifications provided.\n\n  A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web Services Verified Access instance. \n "]
module DeleteAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_key_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified API key. \n\n After you delete a key, it can take up to 24 hours for WAF to disallow use of the key in all regions. \n "]
module DeleteFirewallManagerRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_firewall_manager_rule_groups_request ->
        (delete_firewall_manager_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes all rule groups that are managed by Firewall Manager from the specified [WebACL]. \n\n You can only use this if [ManagedByFirewallManager] and [RetrofittedByFirewallManager] are both false in the web ACL. \n "]
module DeleteIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [IPSet]. \n"]
module DeleteLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes the [LoggingConfiguration] from the specified web ACL.\n"]
module DeletePermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Permanently deletes an IAM policy from the specified rule group.\n\n You must be the owner of the rule group to perform this operation.\n "]
module DeleteRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [RegexPatternSet].\n"]
module DeleteRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [RuleGroup].\n"]
module DeleteWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified [WebACL]. \n\n You can only use this if [ManagedByFirewallManager] is false in the web ACL. \n \n   Before deleting any web ACL, first disassociate it from all resources.\n   \n    {ul\n          {-  To retrieve a list of the resources that are associated with a web ACL, use the following calls:\n              \n               {ul\n                     {-  For Amazon CloudFront distributions, use the CloudFront call [ListDistributionsByWebACLId]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} in the {i Amazon CloudFront API Reference}. \n                         \n                          }\n                     {-  For all other resources, call [ListResourcesForWebACL].\n                         \n                          }\n                     \n           }\n            }\n          {-  To disassociate a resource from a web ACL, use the following calls:\n              \n               {ul\n                     {-  For Amazon CloudFront distributions, provide an empty web ACL ID in the CloudFront call [UpdateDistribution]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront API Reference}. \n                         \n                          }\n                     {-  For all other resources, call [DisassociateWebACL].\n                         \n                          }\n                     \n           }\n            }\n          }\n   "]
module DescribeAllManagedProducts :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_all_managed_products_request ->
        (describe_all_managed_products_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. \n"]
module DescribeManagedProductsByVendor :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_products_by_vendor_request ->
        (describe_managed_products_by_vendor_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for the managed rule groups owned by a specific vendor. \n"]
module DescribeManagedRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_rule_group_request ->
        (describe_managed_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for a managed rule group, including descriptions of the rules. \n"]
module DisassociateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_web_acl_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Disassociates the specified resource from its web ACL association, if it has one. \n\n Use this for all resource types except for Amazon CloudFront distributions. For Amazon CloudFront, call [UpdateDistribution] for the distribution and provide an empty web ACL ID. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront API Reference}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-DisassociateWebACL}Permissions for DisassociateWebACL} in the {i WAF Developer Guide}.\n   "]
module GenerateMobileSdkReleaseUrl :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mobile_sdk_release_url_request ->
        (generate_mobile_sdk_release_url_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Generates a presigned download URL for the specified release of the mobile SDK.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetDecryptedAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_decrypted_api_key_request ->
        (get_decrypted_api_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns your API key in decrypted form. Use this to check the token domains that you have defined for the key. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [IPSet].\n"]
module GetLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns the [LoggingConfiguration] for the specified web ACL.\n"]
module GetManagedRuleSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_managed_rule_set_request ->
        (get_managed_rule_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves the specified managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module GetMobileSdkRelease :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_sdk_release_request ->
        (get_mobile_sdk_release_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves information for the specified mobile SDK release, including release notes and tags.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetPermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns the IAM policy that is attached to the specified rule group.\n\n You must be the owner of the rule group to perform this operation.\n "]
module GetRateBasedStatementManagedKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_statement_managed_keys_request ->
        (get_rate_based_statement_managed_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnsupportedAggregateKeyTypeException of
              waf_unsupported_aggregate_key_type_exception ])
          result
end[@@ocaml.doc
     "Retrieves the IP addresses that are currently blocked by a rate-based rule instance. This is only available for rate-based rules that aggregate solely on the IP address or on the forwarded IP address. \n\n The maximum number of addresses that can be blocked for a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, those with the highest rates are blocked.\n \n  For a rate-based rule that you've defined inside a rule group, provide the name of the rule group reference statement in your request, in addition to the rate-based rule name and the web ACL name. \n  \n   WAF monitors web requests and manages keys independently for each unique combination of web ACL, optional rule group, and rate-based rule. For example, if you define a rate-based rule inside a rule group, and then use the rule group in a web ACL, WAF monitors web requests and manages keys for that web ACL, rule group reference statement, and rate-based rule instance. If you use the same rule group in a second web ACL, WAF monitors web requests and manages keys for this second usage completely independent of your first. \n   "]
module GetRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [RegexPatternSet].\n"]
module GetRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [RuleGroup].\n"]
module GetSampledRequests :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Gets detailed information about a specified number of requests--a sample--that WAF randomly selects from among the first 5,000 requests that your Amazon Web Services resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.\n\n  [GetSampledRequests] returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, [GetSampledRequests] returns an updated time range. This new time range indicates the actual period during which WAF selected the requests in the sample.\n "]
module GetWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [WebACL].\n"]
module GetWebACLForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_for_resource_request ->
        (get_web_acl_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [WebACL] for the specified resource. \n\n This call uses [GetWebACL], to verify that your account has permission to access the retrieved web ACL. If you get an error that indicates that your account isn't authorized to perform [wafv2:GetWebACL] on the resource, that error won't be included in your CloudTrail event history. \n \n  For Amazon CloudFront, don't use this call. Instead, call the CloudFront action [GetDistributionConfig]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html}GetDistributionConfig} in the {i Amazon CloudFront API Reference}. \n  \n    {b Required permissions for customer-managed IAM policies} \n   \n    This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-GetWebACLForResource}Permissions for GetWebACLForResource} in the {i WAF Developer Guide}.\n    "]
module ListAPIKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_keys_request ->
        (list_api_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception ])
          result
end[@@ocaml.doc
     "Retrieves a list of the API keys that you've defined for the specified scope. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module ListAvailableManagedRuleGroupVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_group_versions_request ->
        (list_available_managed_rule_group_versions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns a list of the available versions for the specified managed rule group. \n"]
module ListAvailableManagedRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_groups_request ->
        (list_available_managed_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of managed rule groups that are available for you to use. This list includes all Amazon Web Services Managed Rules rule groups and all of the Amazon Web Services Marketplace managed rule groups that you're subscribed to.\n"]
module ListIPSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [IPSetSummary] objects for the IP sets that you manage.\n"]
module ListLoggingConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of your [LoggingConfiguration] objects.\n"]
module ListManagedRuleSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_managed_rule_sets_request ->
        (list_managed_rule_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves the managed rule sets that you own. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module ListMobileSdkReleases :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_sdk_releases_request ->
        (list_mobile_sdk_releases_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves a list of the available releases for the mobile SDK and the specified device platform. \n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module ListRegexPatternSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [RegexPatternSetSummary] objects for the regex pattern sets that you manage.\n"]
module ListResourcesForWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_for_web_acl_request ->
        (list_resources_for_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of the Amazon Resource Names (ARNs) for the resources that are associated with the specified web ACL. \n\n For Amazon CloudFront, don't use this call. Instead, use the CloudFront call [ListDistributionsByWebACLId]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} in the {i Amazon CloudFront API Reference}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-ListResourcesForWebACL}Permissions for ListResourcesForWebACL} in the {i WAF Developer Guide}.\n   "]
module ListRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [RuleGroupSummary] objects for the rule groups that you manage. \n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [TagInfoForResource] for the specified resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
module ListWebACLs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [WebACLSummary] objects for the web ACLs that you manage.\n"]
module PutLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFLogDestinationPermissionIssueException of
              waf_log_destination_permission_issue_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFServiceLinkedRoleErrorException of
              waf_service_linked_role_error_exception ])
          result
end[@@ocaml.doc
     "Enables the specified [LoggingConfiguration], to start logging from a web ACL, according to the configuration provided. \n\n If you configure data protection for the web ACL, the protection applies to the data that WAF sends to the logs. \n \n   This operation completely replaces any mutable specifications that you already have for a logging configuration with the ones that you provide to this call. \n   \n    To modify an existing logging configuration, do the following: \n    \n     {ol\n           {-  Retrieve it by calling [GetLoggingConfiguration] \n               \n                }\n           {-  Update its settings as needed\n               \n                }\n           {-  Provide the complete logging configuration specification to this call\n               \n                }\n           }\n     You can define one logging destination per web ACL.\n     \n       You can access information about the traffic that WAF inspects using the following steps:\n       \n        {ol\n              {-  Create your logging destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. \n                  \n                   The name that you give the destination must start with [aws-waf-logs-]. Depending on the type of destination, you might need to configure additional settings or permissions. \n                   \n                    For configuration requirements and pricing information for each destination type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic} in the {i WAF Developer Guide}.\n                    \n                     }\n              {-  Associate your logging destination to your web ACL using a [PutLoggingConfiguration] request.\n                  \n                   }\n              }\n   When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates an additional role or policy that is required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a service-linked role.\n   \n    For additional information about web ACL logging, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n    "]
module PutManagedRuleSetVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_managed_rule_set_versions_request ->
        (put_managed_rule_set_versions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Defines the versions of your managed rule set that you are offering to the customers. Customers see your offerings as managed rule groups with versioning.\n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n     Customers retrieve their managed rule group list by calling [ListAvailableManagedRuleGroups]. The name that you provide here for your managed rule set is the name the customer sees for the corresponding managed rule group. Customers can retrieve the available versions for a managed rule group by calling [ListAvailableManagedRuleGroupVersions]. You provide a rule group specification for each version. For each managed rule set, you must specify a version that you recommend using. \n     \n      To initiate the expiration of a managed rule group version, use [UpdateManagedRuleSetVersionExpiryDate].\n      "]
module PutPermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidPermissionPolicyException of
              waf_invalid_permission_policy_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Use this to share a rule group with other accounts.\n\n This action attaches an IAM policy to the specified resource. You must be the owner of the rule group to perform this operation.\n \n  This action is subject to the following restrictions:\n  \n   {ul\n         {-  You can attach only one policy with each [PutPermissionPolicy] request.\n             \n              }\n         {-  The ARN in the request must be a valid WAF [RuleGroup] ARN and the rule group must exist in the same Region.\n             \n              }\n         {-  The user making the request must be the owner of the rule group.\n             \n              }\n         }\n   If a rule group has been shared with your account, you can access it through the call [GetRuleGroup], and you can reference it in [CreateWebACL] and [UpdateWebACL]. Rule groups that are shared with you don't appear in your WAF console rule groups listing. \n   "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Associates tags with the specified Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Disassociates tags from an Amazon Web Services resource. Tags are key:value pairs that you can associate with Amazon Web Services resources. For example, the tag key might be \"customer\" and the tag value might be \"companyA.\" You can specify one or more tags to add to each container. You can add up to 50 tags to each Amazon Web Services resource.\n"]
module UpdateIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [IPSet]. \n\n  This operation completely replaces the mutable specifications that you already have for the IP set with the ones that you provide to this call. \n  \n   To modify an IP set, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetIPSet] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete IP set specification to this call\n              \n               }\n          }\n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module UpdateManagedRuleSetVersionExpiryDate :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_rule_set_version_expiry_date_request ->
        (update_managed_rule_set_version_expiry_date_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the expiration information for your managed rule set. Use this to initiate the expiration of a managed rule group version. After you initiate expiration for a version, WAF excludes it from the response to [ListAvailableManagedRuleGroupVersions] for the managed rule group. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module UpdateRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [RegexPatternSet].\n\n  This operation completely replaces the mutable specifications that you already have for the regex pattern set with the ones that you provide to this call. \n  \n   To modify a regex pattern set, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetRegexPatternSet] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete regex pattern set specification to this call\n              \n               }\n          }\n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module UpdateRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [RuleGroup].\n\n  This operation completely replaces the mutable specifications that you already have for the rule group with the ones that you provide to this call. \n  \n   To modify a rule group, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetRuleGroup] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete rule group specification to this call\n              \n               }\n          }\n     A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n    \n      {b Temporary inconsistencies during updates} \n     \n      When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n      \n       The following are examples of the temporary inconsistencies that you might notice during change propagation: \n       \n        {ul\n              {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                  \n                   }\n              {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                  \n                   }\n              {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                  \n                   }\n              {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                  \n                   }\n              }\n  "]
module UpdateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [WebACL]. While updating a web ACL, WAF provides continuous coverage to the resources that you have associated with the web ACL. \n\n  This operation completely replaces the mutable specifications that you already have for the web ACL with the ones that you provide to this call. \n  \n   To modify a web ACL, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetWebACL] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete web ACL specification to this call\n              \n               }\n          }\n     A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web Services Verified Access instance. \n    \n      {b Temporary inconsistencies during updates} \n     \n      When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n      \n       The following are examples of the temporary inconsistencies that you might notice during change propagation: \n       \n        {ul\n              {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                  \n                   }\n              {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                  \n                   }\n              {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                  \n                   }\n              {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                  \n                   }\n              }\n  "]