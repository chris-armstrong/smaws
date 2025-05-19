open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec match_field_type =
  | ALL_QUERY_ARGS 
  | SINGLE_QUERY_ARG 
  | BODY 
  | METHOD 
  | HEADER 
  | QUERY_STRING 
  | URI [@@ocaml.doc ""]
type nonrec field_to_match = {
  data: string option ;
  type_: match_field_type }[@@ocaml.doc
                             " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies where in a web request to look for [TargetString].\n    "]
type nonrec text_transformation =
  | URL_DECODE 
  | CMD_LINE 
  | LOWERCASE 
  | HTML_ENTITY_DECODE 
  | COMPRESS_WHITE_SPACE 
  | NONE [@@ocaml.doc ""]
type nonrec xss_match_tuple =
  {
  text_transformation: text_transformation ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.\n    "]
type nonrec change_action =
  | DELETE 
  | INSERT [@@ocaml.doc ""]
type nonrec xss_match_set_update =
  {
  xss_match_tuple: xss_match_tuple ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the part of a web request that you want to inspect for cross-site scripting attacks and indicates whether you want to add the specification to an [XssMatchSet] or delete it from an [XssMatchSet].\n    "]
type nonrec xss_match_set_summary = {
  name: string ;
  xss_match_set_id: string }[@@ocaml.doc
                              " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The [Id] and [Name] of an [XssMatchSet].\n    "]
type nonrec xss_match_set =
  {
  xss_match_tuples: xss_match_tuple list ;
  name: string option ;
  xss_match_set_id: string }[@@ocaml.doc
                              " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A complex type that contains [XssMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header. If a [XssMatchSet] contains more than one [XssMatchTuple] object, a request needs to include cross-site scripting attacks in only one of the specified parts of the request to be considered a match.\n    "]
type nonrec waf_action_type =
  | COUNT 
  | ALLOW 
  | BLOCK [@@ocaml.doc ""]
type nonrec waf_action = {
  type_: waf_action_type }[@@ocaml.doc
                            " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    For the action that is associated with a rule in a [WebACL], specifies the action that you want AWS WAF to perform when a web request matches all of the conditions in a rule. For the default action in a [WebACL], specifies the action that you want AWS WAF to take when a web request doesn't match all of the conditions in any of the rules in a [WebACL]. \n    "]
type nonrec waf_override_action_type =
  | COUNT 
  | NONE [@@ocaml.doc ""]
type nonrec waf_override_action = {
  type_: waf_override_action_type }[@@ocaml.doc
                                     " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The action to take if any rule within the [RuleGroup] matches a request. \n    "]
type nonrec waf_rule_type =
  | GROUP 
  | RATE_BASED 
  | REGULAR [@@ocaml.doc ""]
type nonrec excluded_rule = {
  rule_id: string }[@@ocaml.doc
                     " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The rule to exclude from a rule group. This is applicable only when the [ActivatedRule] refers to a [RuleGroup]. The rule must belong to the [RuleGroup] that is specified by the [ActivatedRule]. \n    "]
type nonrec activated_rule =
  {
  excluded_rules: excluded_rule list option ;
  type_: waf_rule_type option ;
  override_action: waf_override_action option ;
  action: waf_action option ;
  rule_id: string ;
  priority: int }[@@ocaml.doc
                   " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The [ActivatedRule] object in an [UpdateWebACL] request specifies a [Rule] that you want to insert or delete, the priority of the [Rule] in the [WebACL], and the action that you want AWS WAF to take when a web request matches the [Rule] ([ALLOW], [BLOCK], or [COUNT]).\n    \n     To specify whether to insert or delete a [Rule], use the [Action] parameter in the [WebACLUpdate] data type.\n     "]
type nonrec web_acl_update =
  {
  activated_rule: activated_rule ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies whether to insert a [Rule] into or delete a [Rule] from a [WebACL].\n    "]
type nonrec web_acl_summary = {
  name: string ;
  web_acl_id: string }[@@ocaml.doc
                        " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the identifier and the name or description of the [WebACL].\n    "]
type nonrec web_ac_l =
  {
  web_acl_arn: string option ;
  rules: activated_rule list ;
  default_action: waf_action ;
  metric_name: string option ;
  name: string option ;
  web_acl_id: string }[@@ocaml.doc
                        " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the [Rules] that identify the requests that you want to allow, block, or count. In a [WebACL], you also specify a default action ([ALLOW] or [BLOCK]), and the action for each [Rule] that you add to a [WebACL], for example, block requests from specified IP addresses or block requests from specified referrers. You also associate the [WebACL] with a CloudFront distribution to identify the requests that you want AWS WAF to filter. If you add more than one [Rule] to a [WebACL], a request needs to match only one of the specifications to be allowed, blocked, or counted. For more information, see [UpdateWebACL].\n    "]
type nonrec waf_tag_operation_internal_error_exception =
  {
  message: string option }[@@ocaml.doc "\n"]
type nonrec waf_tag_operation_exception = {
  message: string option }[@@ocaml.doc "\n"]
type nonrec waf_subscription_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified subscription does not exist.\n"]
type nonrec waf_stale_data_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because you tried to create, update, or delete an object by using a change token that has already been used.\n"]
type nonrec waf_service_linked_role_error_exception =
  {
  message: string option }[@@ocaml.doc
                            "AWS WAF is not able to access the service linked role. This can be caused by a previous [PutLoggingConfiguration] request, which can lock the service linked role for about 20 seconds. Please try your request again. The service linked role can also be locked by a previous [DeleteServiceLinkedRole] request, which can lock the role for 15 minutes or more. If you recently made a [DeleteServiceLinkedRole], wait at least 15 minutes and try the request again. If you receive this same exception again, you will have to wait additional time until the role is unlocked.\n"]
type nonrec waf_referenced_item_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because you tried to delete an object that is still in use. For example:\n\n {ul\n       {-  You tried to delete a [ByteMatchSet] that is still referenced by a [Rule].\n           \n            }\n       {-  You tried to delete a [Rule] that is still referenced by a [WebACL].\n           \n            }\n       }\n  "]
type nonrec waf_nonexistent_item_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because the referenced object doesn't exist.\n"]
type nonrec waf_nonexistent_container_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because you tried to add an object to or delete an object from another object that doesn't exist. For example:\n\n {ul\n       {-  You tried to add a [Rule] to or delete a [Rule] from a [WebACL] that doesn't exist.\n           \n            }\n       {-  You tried to add a [ByteMatchSet] to or delete a [ByteMatchSet] from a [Rule] that doesn't exist.\n           \n            }\n       {-  You tried to add an IP address to or delete an IP address from an [IPSet] that doesn't exist.\n           \n            }\n       {-  You tried to add a [ByteMatchTuple] to or delete a [ByteMatchTuple] from a [ByteMatchSet] that doesn't exist.\n           \n            }\n       }\n  "]
type nonrec waf_non_empty_entity_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because you tried to delete an object that isn't empty. For example:\n\n {ul\n       {-  You tried to delete a [WebACL] that still contains one or more [Rule] objects.\n           \n            }\n       {-  You tried to delete a [Rule] that still contains one or more [ByteMatchSet] objects or other predicates.\n           \n            }\n       {-  You tried to delete a [ByteMatchSet] that contains one or more [ByteMatchTuple] objects.\n           \n            }\n       {-  You tried to delete an [IPSet] that references one or more IP addresses.\n           \n            }\n       }\n  "]
type nonrec waf_limits_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The operation exceeds a resource limit, for example, the maximum number of [WebACL] objects that you can create for an AWS account. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/limits.html}Limits} in the {i AWS WAF Developer Guide}.\n"]
type nonrec waf_invalid_regex_pattern_exception = {
  message: string option }[@@ocaml.doc
                            "The regular expression (regex) you specified in [RegexPatternString] is invalid.\n"]
type nonrec waf_invalid_permission_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "The operation failed because the specified policy is not in the proper format. \n\n The policy is subject to the following restrictions:\n \n  {ul\n        {-  You can attach only one policy with each [PutPermissionPolicy] request.\n            \n             }\n        {-  The policy must include an [Effect], [Action] and [Principal]. \n            \n             }\n        {-   [Effect] must specify [Allow].\n            \n             }\n        {-  The [Action] in the policy must be [waf:UpdateWebACL], [waf-regional:UpdateWebACL], [waf:GetRuleGroup] and [waf-regional:GetRuleGroup] . Any extra or wildcard actions in the policy will be rejected.\n            \n             }\n        {-  The policy cannot include a [Resource] parameter.\n            \n             }\n        {-  The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.\n            \n             }\n        {-  The user making the request must be the owner of the RuleGroup.\n            \n             }\n        {-  Your policy must be composed using IAM Policy version 2012-10-17.\n            \n             }\n        }\n  "]
type nonrec parameter_exception_field =
  | TAG_KEYS 
  | TAGS 
  | RESOURCE_ARN 
  | NEXT_MARKER 
  | RULE_TYPE 
  | RATE_KEY 
  | GEO_MATCH_LOCATION_VALUE 
  | GEO_MATCH_LOCATION_TYPE 
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR 
  | BYTE_MATCH_POSITIONAL_CONSTRAINT 
  | BYTE_MATCH_TEXT_TRANSFORMATION 
  | SQL_INJECTION_MATCH_FIELD_TYPE 
  | BYTE_MATCH_FIELD_TYPE 
  | IPSET_TYPE 
  | PREDICATE_TYPE 
  | WAF_OVERRIDE_ACTION 
  | WAF_ACTION 
  | CHANGE_ACTION [@@ocaml.doc ""]
type nonrec parameter_exception_reason =
  | INVALID_TAG_KEY 
  | ILLEGAL_ARGUMENT 
  | ILLEGAL_COMBINATION 
  | INVALID_OPTION [@@ocaml.doc ""]
type nonrec waf_invalid_parameter_exception =
  {
  reason: parameter_exception_reason option ;
  parameter: string option ;
  field: parameter_exception_field option }[@@ocaml.doc
                                             "The operation failed because AWS WAF didn't recognize a parameter in the request. For example:\n\n {ul\n       {-  You specified an invalid parameter name.\n           \n            }\n       {-  You specified an invalid value.\n           \n            }\n       {-  You tried to update an object ([ByteMatchSet], [IPSet], [Rule], or [WebACL]) using an action other than [INSERT] or [DELETE].\n           \n            }\n       {-  You tried to create a [WebACL] with a [DefaultAction] [Type] other than [ALLOW], [BLOCK], or [COUNT].\n           \n            }\n       {-  You tried to create a [RateBasedRule] with a [RateKey] value other than [IP].\n           \n            }\n       {-  You tried to update a [WebACL] with a [WafAction] [Type] other than [ALLOW], [BLOCK], or [COUNT].\n           \n            }\n       {-  You tried to update a [ByteMatchSet] with a [FieldToMatch] [Type] other than HEADER, METHOD, QUERY_STRING, URI, or BODY.\n           \n            }\n       {-  You tried to update a [ByteMatchSet] with a [Field] of [HEADER] but no value for [Data].\n           \n            }\n       {-  Your request references an ARN that is malformed, or corresponds to a resource with which a web ACL cannot be associated.\n           \n            }\n       }\n  "]
type nonrec waf_invalid_operation_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because there was nothing to do. For example:\n\n {ul\n       {-  You tried to remove a [Rule] from a [WebACL], but the [Rule] isn't in the specified [WebACL].\n           \n            }\n       {-  You tried to remove an IP address from an [IPSet], but the IP address isn't in the specified [IPSet].\n           \n            }\n       {-  You tried to remove a [ByteMatchTuple] from a [ByteMatchSet], but the [ByteMatchTuple] isn't in the specified [WebACL].\n           \n            }\n       {-  You tried to add a [Rule] to a [WebACL], but the [Rule] already exists in the specified [WebACL].\n           \n            }\n       {-  You tried to add a [ByteMatchTuple] to a [ByteMatchSet], but the [ByteMatchTuple] already exists in the specified [WebACL].\n           \n            }\n       }\n  "]
type nonrec waf_invalid_account_exception = unit
type nonrec waf_internal_error_exception = {
  message: string option }[@@ocaml.doc
                            "The operation failed because of a system problem, even though the request was valid. Retry your request.\n"]
type nonrec migration_error_type =
  | S3_INTERNAL_ERROR 
  | S3_BUCKET_INVALID_REGION 
  | S3_BUCKET_NOT_FOUND 
  | S3_BUCKET_NOT_ACCESSIBLE 
  | S3_BUCKET_NO_PERMISSION 
  | ENTITY_NOT_FOUND 
  | ENTITY_NOT_SUPPORTED [@@ocaml.doc ""]
type nonrec waf_entity_migration_exception =
  {
  migration_error_reason: string option ;
  migration_error_type: migration_error_type option ;
  message: string option }[@@ocaml.doc
                            "The operation failed due to a problem with the migration. The failure cause is provided in the exception, in the [MigrationErrorType]: \n\n {ul\n       {-   [ENTITY_NOT_SUPPORTED] - The web ACL has an unsupported entity but the [IgnoreUnsupportedType] is not set to true.\n           \n            }\n       {-   [ENTITY_NOT_FOUND] - The web ACL doesn't exist. \n           \n            }\n       {-   [S3_BUCKET_NO_PERMISSION] - You don't have permission to perform the [PutObject] action to the specified Amazon S3 bucket.\n           \n            }\n       {-   [S3_BUCKET_NOT_ACCESSIBLE] - The bucket policy doesn't allow AWS WAF to perform the [PutObject] action in the bucket.\n           \n            }\n       {-   [S3_BUCKET_NOT_FOUND] - The S3 bucket doesn't exist. \n           \n            }\n       {-   [S3_BUCKET_INVALID_REGION] - The S3 bucket is not in the same Region as the web ACL.\n           \n            }\n       {-   [S3_INTERNAL_ERROR] - AWS WAF failed to create the template in the S3 bucket for another reason.\n           \n            }\n       }\n  "]
type nonrec waf_disallowed_name_exception = {
  message: string option }[@@ocaml.doc "The name specified is invalid.\n"]
type nonrec waf_bad_request_exception = {
  message: string option }[@@ocaml.doc "\n"]
type nonrec update_xss_match_set_response = {
  change_token: string option }[@@ocaml.doc
                                 "The response to an [UpdateXssMatchSets] request.\n"]
type nonrec update_xss_match_set_request =
  {
  updates: xss_match_set_update list ;
  change_token: string ;
  xss_match_set_id: string }[@@ocaml.doc
                              "A request to update an [XssMatchSet].\n"]
type nonrec update_web_acl_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec update_web_acl_request =
  {
  default_action: waf_action option ;
  updates: web_acl_update list option ;
  change_token: string ;
  web_acl_id: string }[@@ocaml.doc ""]
type nonrec update_sql_injection_match_set_response =
  {
  change_token: string option }[@@ocaml.doc
                                 "The response to an [UpdateSqlInjectionMatchSets] request.\n"]
type nonrec sql_injection_match_tuple =
  {
  text_transformation: text_transformation ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.\n    "]
type nonrec sql_injection_match_set_update =
  {
  sql_injection_match_tuple: sql_injection_match_tuple ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the part of a web request that you want to inspect for snippets of malicious SQL code and indicates whether you want to add the specification to a [SqlInjectionMatchSet] or delete it from a [SqlInjectionMatchSet].\n    "]
type nonrec update_sql_injection_match_set_request =
  {
  updates: sql_injection_match_set_update list ;
  change_token: string ;
  sql_injection_match_set_id: string }[@@ocaml.doc
                                        "A request to update a [SqlInjectionMatchSet].\n"]
type nonrec update_size_constraint_set_response =
  {
  change_token: string option }[@@ocaml.doc ""]
type nonrec comparison_operator =
  | GT 
  | GE 
  | LT 
  | LE 
  | NE 
  | EQ [@@ocaml.doc ""]
type nonrec size_constraint =
  {
  size: int ;
  comparison_operator: comparison_operator ;
  text_transformation: text_transformation ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies a constraint on the size of a part of the web request. AWS WAF uses the [Size], [ComparisonOperator], and [FieldToMatch] to build an expression in the form of \"[Size] [ComparisonOperator] size in bytes of [FieldToMatch]\". If that expression is true, the [SizeConstraint] is considered to match.\n    "]
type nonrec size_constraint_set_update =
  {
  size_constraint: size_constraint ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the part of a web request that you want to inspect the size of and indicates whether you want to add the specification to a [SizeConstraintSet] or delete it from a [SizeConstraintSet].\n    "]
type nonrec update_size_constraint_set_request =
  {
  updates: size_constraint_set_update list ;
  change_token: string ;
  size_constraint_set_id: string }[@@ocaml.doc ""]
type nonrec update_rule_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec predicate_type =
  | REGEX_MATCH 
  | XSS_MATCH 
  | SIZE_CONSTRAINT 
  | GEO_MATCH 
  | SQL_INJECTION_MATCH 
  | BYTE_MATCH 
  | IP_MATCH [@@ocaml.doc ""]
type nonrec predicate =
  {
  data_id: string ;
  type_: predicate_type ;
  negated: bool }[@@ocaml.doc
                   " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the [ByteMatchSet], [IPSet], [SqlInjectionMatchSet], [XssMatchSet], [RegexMatchSet], [GeoMatchSet], and [SizeConstraintSet] objects that you want to add to a [Rule] and, for each object, indicates whether you want to negate the settings, for example, requests that do NOT originate from the IP address 192.0.2.44. \n    "]
type nonrec rule_update = {
  predicate: predicate ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies a [Predicate] (such as an [IPSet]) and indicates whether you want to add it to a [Rule] or delete it from a [Rule].\n    "]
type nonrec update_rule_request =
  {
  updates: rule_update list ;
  change_token: string ;
  rule_id: string }[@@ocaml.doc ""]
type nonrec update_rule_group_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec rule_group_update =
  {
  activated_rule: activated_rule ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies an [ActivatedRule] and indicates whether you want to add it to a [RuleGroup] or delete it from a [RuleGroup].\n    "]
type nonrec update_rule_group_request =
  {
  change_token: string ;
  updates: rule_group_update list ;
  rule_group_id: string }[@@ocaml.doc ""]
type nonrec update_regex_pattern_set_response =
  {
  change_token: string option }[@@ocaml.doc ""]
type nonrec regex_pattern_set_update =
  {
  regex_pattern_string: string ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In an [UpdateRegexPatternSet] request, [RegexPatternSetUpdate] specifies whether to insert or delete a [RegexPatternString] and includes the settings for the [RegexPatternString].\n    "]
type nonrec update_regex_pattern_set_request =
  {
  change_token: string ;
  updates: regex_pattern_set_update list ;
  regex_pattern_set_id: string }[@@ocaml.doc ""]
type nonrec update_regex_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec regex_match_tuple =
  {
  regex_pattern_set_id: string ;
  text_transformation: text_transformation ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The regular expression pattern that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings. Each [RegexMatchTuple] object contains: \n    \n     {ul\n           {-  The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the [User-Agent] header. \n               \n                }\n           {-  The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see [RegexPatternSet]. \n               \n                }\n           {-  Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.\n               \n                }\n           }\n  "]
type nonrec regex_match_set_update =
  {
  regex_match_tuple: regex_match_tuple ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In an [UpdateRegexMatchSet] request, [RegexMatchSetUpdate] specifies whether to insert or delete a [RegexMatchTuple] and includes the settings for the [RegexMatchTuple].\n    "]
type nonrec update_regex_match_set_request =
  {
  change_token: string ;
  updates: regex_match_set_update list ;
  regex_match_set_id: string }[@@ocaml.doc ""]
type nonrec update_rate_based_rule_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec update_rate_based_rule_request =
  {
  rate_limit: int ;
  updates: rule_update list ;
  change_token: string ;
  rule_id: string }[@@ocaml.doc ""]
type nonrec update_ip_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec ip_set_descriptor_type =
  | IPV6 
  | IPV4 [@@ocaml.doc ""]
type nonrec ip_set_descriptor =
  {
  value: string ;
  type_: ip_set_descriptor_type }[@@ocaml.doc
                                   " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the IP address type ([IPV4] or [IPV6]) and the IP address range (in CIDR format) that web requests originate from.\n    "]
type nonrec ip_set_update =
  {
  ip_set_descriptor: ip_set_descriptor ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the type of update to perform to an [IPSet] with [UpdateIPSet].\n    "]
type nonrec update_ip_set_request =
  {
  updates: ip_set_update list ;
  change_token: string ;
  ip_set_id: string }[@@ocaml.doc ""]
type nonrec update_geo_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec geo_match_constraint_type =
  | Country [@@ocaml.doc ""]
type nonrec geo_match_constraint_value =
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
type nonrec geo_match_constraint =
  {
  value: geo_match_constraint_value ;
  type_: geo_match_constraint_type }[@@ocaml.doc
                                      " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The country from which web requests originate that you want AWS WAF to search for.\n    "]
type nonrec geo_match_set_update =
  {
  geo_match_constraint: geo_match_constraint ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Specifies the type of update to perform to an [GeoMatchSet] with [UpdateGeoMatchSet].\n    "]
type nonrec update_geo_match_set_request =
  {
  updates: geo_match_set_update list ;
  change_token: string ;
  geo_match_set_id: string }[@@ocaml.doc ""]
type nonrec update_byte_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec positional_constraint =
  | CONTAINS_WORD 
  | CONTAINS 
  | ENDS_WITH 
  | STARTS_WITH 
  | EXACTLY [@@ocaml.doc ""]
type nonrec byte_match_tuple =
  {
  positional_constraint: positional_constraint ;
  text_transformation: text_transformation ;
  target_string: bytes ;
  field_to_match: field_to_match }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings.\n    "]
type nonrec byte_match_set_update =
  {
  byte_match_tuple: byte_match_tuple ;
  action: change_action }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In an [UpdateByteMatchSet] request, [ByteMatchSetUpdate] specifies whether to insert or delete a [ByteMatchTuple] and includes the settings for the [ByteMatchTuple].\n    "]
type nonrec update_byte_match_set_request =
  {
  updates: byte_match_set_update list ;
  change_token: string ;
  byte_match_set_id: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec time_window =
  {
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In a [GetSampledRequests] request, the [StartTime] and [EndTime] objects specify the time range for which you want AWS WAF to return a sample of web requests.\n    \n     You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, [Z]. For example, [\"2016-09-27T14:50Z\"]. \n     \n      In a [GetSampledRequests] response, the [StartTime] and [EndTime] objects specify the time range for which AWS WAF actually returned a sample of web requests. AWS WAF gets the specified number of requests from among the first 5,000 requests that your AWS resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, AWS WAF stops sampling after the 5,000th request. In that case, [EndTime] is the time that AWS WAF received the 5,000th request. \n      "]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.\n    \n     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. \n     "]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec tag_info_for_resource =
  {
  tag_list: tag list option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Information for a tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.\n    \n     Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. \n     "]
type nonrec subscribed_rule_group_summary =
  {
  metric_name: string ;
  name: string ;
  rule_group_id: string }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A summary of the rule groups you are subscribed to.\n    "]
type nonrec sql_injection_match_set_summary =
  {
  name: string ;
  sql_injection_match_set_id: string }[@@ocaml.doc
                                        " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The [Id] and [Name] of a [SqlInjectionMatchSet].\n    "]
type nonrec sql_injection_match_set =
  {
  sql_injection_match_tuples: sql_injection_match_tuple list ;
  name: string option ;
  sql_injection_match_set_id: string }[@@ocaml.doc
                                        " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A complex type that contains [SqlInjectionMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header. If a [SqlInjectionMatchSet] contains more than one [SqlInjectionMatchTuple] object, a request needs to include snippets of SQL code in only one of the specified parts of the request to be considered a match.\n    "]
type nonrec size_constraint_set_summary =
  {
  name: string ;
  size_constraint_set_id: string }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The [Id] and [Name] of a [SizeConstraintSet].\n    "]
type nonrec size_constraint_set =
  {
  size_constraints: size_constraint list ;
  name: string option ;
  size_constraint_set_id: string }[@@ocaml.doc
                                    " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A complex type that contains [SizeConstraint] objects, which specify the parts of web requests that you want AWS WAF to inspect the size of. If a [SizeConstraintSet] contains more than one [SizeConstraint] object, a request only needs to match one constraint to be considered a match.\n    "]
type nonrec http_header = {
  value: string option ;
  name: string option }[@@ocaml.doc
                         " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The response from a [GetSampledRequests] request includes an [HTTPHeader] complex type that appears as [Headers] in the response syntax. [HTTPHeader] contains the names and values of all of the headers that appear in one of the web requests that were returned by [GetSampledRequests]. \n    "]
type nonrec http_request =
  {
  headers: http_header list option ;
  http_version: string option ;
  method_: string option ;
  ur_i: string option ;
  country: string option ;
  client_i_p: string option }[@@ocaml.doc
                               " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The response from a [GetSampledRequests] request includes an [HTTPRequest] complex type that appears as [Request] in the response syntax. [HTTPRequest] contains information about one of the web requests that were returned by [GetSampledRequests]. \n    "]
type nonrec sampled_http_request =
  {
  rule_within_rule_group: string option ;
  action: string option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  weight: int ;
  request: http_request }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The response from a [GetSampledRequests] request includes a [SampledHTTPRequests] complex type that appears as [SampledRequests] in the response syntax. [SampledHTTPRequests] contains one [SampledHTTPRequest] object for each web request that is returned by [GetSampledRequests].\n    "]
type nonrec rule_summary = {
  name: string ;
  rule_id: string }[@@ocaml.doc
                     " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the identifier and the friendly name or description of the [Rule].\n    "]
type nonrec rule_group_summary = {
  name: string ;
  rule_group_id: string }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the identifier and the friendly name or description of the [RuleGroup].\n    "]
type nonrec rule_group =
  {
  metric_name: string option ;
  name: string option ;
  rule_group_id: string }[@@ocaml.doc
                           " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A collection of predefined rules that you can add to a web ACL.\n    \n     Rule groups are subject to the following limits:\n     \n      {ul\n            {-  Three rule groups per account. You can request an increase to this limit by contacting customer support.\n                \n                 }\n            {-  One rule group per web ACL.\n                \n                 }\n            {-  Ten rules per rule group.\n                \n                 }\n            }\n  "]
type nonrec rule =
  {
  predicates: predicate list ;
  metric_name: string option ;
  name: string option ;
  rule_id: string }[@@ocaml.doc
                     " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A combination of [ByteMatchSet], [IPSet], and/or [SqlInjectionMatchSet] objects that identify the web requests that you want to allow, block, or count. For example, you might create a [Rule] that includes the following predicates:\n    \n     {ul\n           {-  An [IPSet] that causes AWS WAF to search for web requests that originate from the IP address [192.0.2.44] \n               \n                }\n           {-  A [ByteMatchSet] that causes AWS WAF to search for web requests for which the value of the [User-Agent] header is [BadBot].\n               \n                }\n           }\n   To match the settings in this [Rule], a request must originate from [192.0.2.44] AND include a [User-Agent] header for which the value is [BadBot].\n   "]
type nonrec regex_pattern_set_summary =
  {
  name: string ;
  regex_pattern_set_id: string }[@@ocaml.doc
                                  " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Returned by [ListRegexPatternSets]. Each [RegexPatternSetSummary] object includes the [Name] and [RegexPatternSetId] for one [RegexPatternSet].\n    "]
type nonrec regex_pattern_set =
  {
  regex_pattern_strings: string list ;
  name: string option ;
  regex_pattern_set_id: string }[@@ocaml.doc
                                  " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The [RegexPatternSet] specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as [B\\[a@\\]dB\\[o0\\]t]. You can then configure AWS WAF to reject those requests.\n    "]
type nonrec regex_match_set_summary =
  {
  name: string ;
  regex_match_set_id: string }[@@ocaml.doc
                                " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Returned by [ListRegexMatchSets]. Each [RegexMatchSetSummary] object includes the [Name] and [RegexMatchSetId] for one [RegexMatchSet].\n    "]
type nonrec regex_match_set =
  {
  regex_match_tuples: regex_match_tuple list option ;
  name: string option ;
  regex_match_set_id: string option }[@@ocaml.doc
                                       " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In a [GetRegexMatchSet] request, [RegexMatchSet] is a complex type that contains the [RegexMatchSetId] and [Name] of a [RegexMatchSet], and the values that you specified when you updated the [RegexMatchSet].\n    \n      The values are contained in a [RegexMatchTuple] object, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a [RegexMatchSet] contains more than one [RegexMatchTuple] object, a request needs to match the settings in only one [ByteMatchTuple] to be considered a match.\n     "]
type nonrec rate_key =
  | IP [@@ocaml.doc ""]
type nonrec rate_based_rule =
  {
  rate_limit: int ;
  rate_key: rate_key ;
  match_predicates: predicate list ;
  metric_name: string option ;
  name: string option ;
  rule_id: string }[@@ocaml.doc
                     " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    A [RateBasedRule] is identical to a regular [Rule], with one addition: a [RateBasedRule] counts the number of requests that arrive from a specified IP address every five minutes. For example, based on recent requests that you've seen from an attacker, you might create a [RateBasedRule] that includes the following conditions: \n    \n     {ul\n           {-  The requests come from 192.0.2.44.\n               \n                }\n           {-  They contain the value [BadBot] in the [User-Agent] header.\n               \n                }\n           }\n   In the rule, you also define the rate limit as 1,000.\n   \n    Requests that meet both of these conditions and exceed 1,000 requests every five minutes trigger the rule's action (block or count), which is defined in the web ACL.\n    "]
type nonrec put_permission_policy_response = unit
type nonrec put_permission_policy_request =
  {
  policy: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec logging_configuration =
  {
  redacted_fields: field_to_match list option ;
  log_destination_configs: string list ;
  resource_arn: string }[@@ocaml.doc
                          " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    The Amazon Kinesis Data Firehose, [RedactedFields] information, and the web ACL Amazon Resource Name (ARN).\n    "]
type nonrec put_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }[@@ocaml.doc ""]
type nonrec put_logging_configuration_request =
  {
  logging_configuration: logging_configuration }[@@ocaml.doc ""]
type nonrec list_xss_match_sets_response =
  {
  xss_match_sets: xss_match_set_summary list option ;
  next_marker: string option }[@@ocaml.doc
                                "The response to a [ListXssMatchSets] request.\n"]
type nonrec list_xss_match_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc
                                "A request to list the [XssMatchSet] objects created by the current AWS account.\n"]
type nonrec list_web_ac_ls_response =
  {
  web_ac_ls: web_acl_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_web_ac_ls_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tag_info_for_resource: tag_info_for_resource option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string ;
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_subscribed_rule_groups_response =
  {
  rule_groups: subscribed_rule_group_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_subscribed_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_sql_injection_match_sets_response =
  {
  sql_injection_match_sets: sql_injection_match_set_summary list option ;
  next_marker: string option }[@@ocaml.doc
                                "The response to a [ListSqlInjectionMatchSets] request.\n"]
type nonrec list_sql_injection_match_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc
                                "A request to list the [SqlInjectionMatchSet] objects created by the current AWS account.\n"]
type nonrec list_size_constraint_sets_response =
  {
  size_constraint_sets: size_constraint_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_size_constraint_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rules_response =
  {
  rules: rule_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rules_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rule_groups_response =
  {
  rule_groups: rule_group_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rule_groups_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_regex_pattern_sets_response =
  {
  regex_pattern_sets: regex_pattern_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_regex_pattern_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_regex_match_sets_response =
  {
  regex_match_sets: regex_match_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_regex_match_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rate_based_rules_response =
  {
  rules: rule_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_rate_based_rules_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_logging_configurations_response =
  {
  next_marker: string option ;
  logging_configurations: logging_configuration list option }[@@ocaml.doc ""]
type nonrec list_logging_configurations_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec ip_set_summary = {
  name: string ;
  ip_set_id: string }[@@ocaml.doc
                       " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the identifier and the name of the [IPSet].\n    "]
type nonrec list_ip_sets_response =
  {
  ip_sets: ip_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_ip_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec geo_match_set_summary = {
  name: string ;
  geo_match_set_id: string }[@@ocaml.doc
                              " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains the identifier and the name of the [GeoMatchSet].\n    "]
type nonrec list_geo_match_sets_response =
  {
  geo_match_sets: geo_match_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_geo_match_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec byte_match_set_summary =
  {
  name: string ;
  byte_match_set_id: string }[@@ocaml.doc
                               " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Returned by [ListByteMatchSets]. Each [ByteMatchSetSummary] object includes the [Name] and [ByteMatchSetId] for one [ByteMatchSet].\n    "]
type nonrec list_byte_match_sets_response =
  {
  byte_match_sets: byte_match_set_summary list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_byte_match_sets_request =
  {
  limit: int option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_activated_rules_in_rule_group_response =
  {
  activated_rules: activated_rule list option ;
  next_marker: string option }[@@ocaml.doc ""]
type nonrec list_activated_rules_in_rule_group_request =
  {
  limit: int option ;
  next_marker: string option ;
  rule_group_id: string option }[@@ocaml.doc ""]
type nonrec ip_set =
  {
  ip_set_descriptors: ip_set_descriptor list ;
  name: string option ;
  ip_set_id: string }[@@ocaml.doc
                       " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains one or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128.\n    \n     To specify an individual IP address, you specify the four-part IP address followed by a [/32], for example, 192.0.2.0/32. To block a range of IP addresses, you can specify /8 or any range between /16 through /32 (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more information about CIDR notation, see the Wikipedia entry {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain Routing}. \n     "]
type nonrec get_xss_match_set_response =
  {
  xss_match_set: xss_match_set option }[@@ocaml.doc
                                         "The response to a [GetXssMatchSet] request.\n"]
type nonrec get_xss_match_set_request = {
  xss_match_set_id: string }[@@ocaml.doc
                              "A request to get an [XssMatchSet].\n"]
type nonrec get_web_acl_response = {
  web_ac_l: web_ac_l option }[@@ocaml.doc ""]
type nonrec get_web_acl_request = {
  web_acl_id: string }[@@ocaml.doc ""]
type nonrec get_sql_injection_match_set_response =
  {
  sql_injection_match_set: sql_injection_match_set option }[@@ocaml.doc
                                                             "The response to a [GetSqlInjectionMatchSet] request.\n"]
type nonrec get_sql_injection_match_set_request =
  {
  sql_injection_match_set_id: string }[@@ocaml.doc
                                        "A request to get a [SqlInjectionMatchSet].\n"]
type nonrec get_size_constraint_set_response =
  {
  size_constraint_set: size_constraint_set option }[@@ocaml.doc ""]
type nonrec get_size_constraint_set_request =
  {
  size_constraint_set_id: string }[@@ocaml.doc ""]
type nonrec get_sampled_requests_response =
  {
  time_window: time_window option ;
  population_size: int option ;
  sampled_requests: sampled_http_request list option }[@@ocaml.doc ""]
type nonrec get_sampled_requests_request =
  {
  max_items: int ;
  time_window: time_window ;
  rule_id: string ;
  web_acl_id: string }[@@ocaml.doc ""]
type nonrec get_rule_response = {
  rule: rule option }[@@ocaml.doc ""]
type nonrec get_rule_request = {
  rule_id: string }[@@ocaml.doc ""]
type nonrec get_rule_group_response = {
  rule_group: rule_group option }[@@ocaml.doc ""]
type nonrec get_rule_group_request = {
  rule_group_id: string }[@@ocaml.doc ""]
type nonrec get_regex_pattern_set_response =
  {
  regex_pattern_set: regex_pattern_set option }[@@ocaml.doc ""]
type nonrec get_regex_pattern_set_request = {
  regex_pattern_set_id: string }[@@ocaml.doc ""]
type nonrec get_regex_match_set_response =
  {
  regex_match_set: regex_match_set option }[@@ocaml.doc ""]
type nonrec get_regex_match_set_request = {
  regex_match_set_id: string }[@@ocaml.doc ""]
type nonrec get_rate_based_rule_response = {
  rule: rate_based_rule option }[@@ocaml.doc ""]
type nonrec get_rate_based_rule_request = {
  rule_id: string }[@@ocaml.doc ""]
type nonrec get_rate_based_rule_managed_keys_response =
  {
  next_marker: string option ;
  managed_keys: string list option }[@@ocaml.doc ""]
type nonrec get_rate_based_rule_managed_keys_request =
  {
  next_marker: string option ;
  rule_id: string }[@@ocaml.doc ""]
type nonrec get_permission_policy_response = {
  policy: string option }[@@ocaml.doc ""]
type nonrec get_permission_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_logging_configuration_response =
  {
  logging_configuration: logging_configuration option }[@@ocaml.doc ""]
type nonrec get_logging_configuration_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_ip_set_response = {
  ip_set: ip_set option }[@@ocaml.doc ""]
type nonrec get_ip_set_request = {
  ip_set_id: string }[@@ocaml.doc ""]
type nonrec geo_match_set =
  {
  geo_match_constraints: geo_match_constraint list ;
  name: string option ;
  geo_match_set_id: string }[@@ocaml.doc
                              " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    Contains one or more countries that AWS WAF will search for.\n    "]
type nonrec get_geo_match_set_response =
  {
  geo_match_set: geo_match_set option }[@@ocaml.doc ""]
type nonrec get_geo_match_set_request = {
  geo_match_set_id: string }[@@ocaml.doc ""]
type nonrec change_token_status =
  | INSYNC 
  | PENDING 
  | PROVISIONED [@@ocaml.doc ""]
type nonrec get_change_token_status_response =
  {
  change_token_status: change_token_status option }[@@ocaml.doc ""]
type nonrec get_change_token_status_request = {
  change_token: string }[@@ocaml.doc ""]
type nonrec get_change_token_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec get_change_token_request = unit
type nonrec byte_match_set =
  {
  byte_match_tuples: byte_match_tuple list ;
  name: string option ;
  byte_match_set_id: string }[@@ocaml.doc
                               " This is {b AWS WAF Classic} documentation. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html}AWS WAF Classic} in the developer guide.\n \n   {b For the latest version of AWS WAF}, use the AWS WAFV2 API and see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html}AWS WAF Developer Guide}. With the latest version, AWS WAF has a single set of endpoints for regional and global use. \n  \n    In a [GetByteMatchSet] request, [ByteMatchSet] is a complex type that contains the [ByteMatchSetId] and [Name] of a [ByteMatchSet], and the values that you specified when you updated the [ByteMatchSet]. \n    \n     A complex type that contains [ByteMatchTuple] objects, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a [ByteMatchSet] contains more than one [ByteMatchTuple] object, a request needs to match the settings in only one [ByteMatchTuple] to be considered a match.\n     "]
type nonrec get_byte_match_set_response =
  {
  byte_match_set: byte_match_set option }[@@ocaml.doc ""]
type nonrec get_byte_match_set_request = {
  byte_match_set_id: string }[@@ocaml.doc ""]
type nonrec delete_xss_match_set_response = {
  change_token: string option }[@@ocaml.doc
                                 "The response to a request to delete an [XssMatchSet] from AWS WAF.\n"]
type nonrec delete_xss_match_set_request =
  {
  change_token: string ;
  xss_match_set_id: string }[@@ocaml.doc
                              "A request to delete an [XssMatchSet] from AWS WAF.\n"]
type nonrec delete_web_acl_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_web_acl_request =
  {
  change_token: string ;
  web_acl_id: string }[@@ocaml.doc ""]
type nonrec delete_sql_injection_match_set_response =
  {
  change_token: string option }[@@ocaml.doc
                                 "The response to a request to delete a [SqlInjectionMatchSet] from AWS WAF.\n"]
type nonrec delete_sql_injection_match_set_request =
  {
  change_token: string ;
  sql_injection_match_set_id: string }[@@ocaml.doc
                                        "A request to delete a [SqlInjectionMatchSet] from AWS WAF.\n"]
type nonrec delete_size_constraint_set_response =
  {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_size_constraint_set_request =
  {
  change_token: string ;
  size_constraint_set_id: string }[@@ocaml.doc ""]
type nonrec delete_rule_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_rule_request = {
  change_token: string ;
  rule_id: string }[@@ocaml.doc ""]
type nonrec delete_rule_group_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_rule_group_request =
  {
  change_token: string ;
  rule_group_id: string }[@@ocaml.doc ""]
type nonrec delete_regex_pattern_set_response =
  {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_regex_pattern_set_request =
  {
  change_token: string ;
  regex_pattern_set_id: string }[@@ocaml.doc ""]
type nonrec delete_regex_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_regex_match_set_request =
  {
  change_token: string ;
  regex_match_set_id: string }[@@ocaml.doc ""]
type nonrec delete_rate_based_rule_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_rate_based_rule_request =
  {
  change_token: string ;
  rule_id: string }[@@ocaml.doc ""]
type nonrec delete_permission_policy_response = unit
type nonrec delete_permission_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_logging_configuration_response = unit
type nonrec delete_logging_configuration_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_ip_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_ip_set_request =
  {
  change_token: string ;
  ip_set_id: string }[@@ocaml.doc ""]
type nonrec delete_geo_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_geo_match_set_request =
  {
  change_token: string ;
  geo_match_set_id: string }[@@ocaml.doc ""]
type nonrec delete_byte_match_set_response = {
  change_token: string option }[@@ocaml.doc ""]
type nonrec delete_byte_match_set_request =
  {
  change_token: string ;
  byte_match_set_id: string }[@@ocaml.doc ""]
type nonrec create_xss_match_set_response =
  {
  change_token: string option ;
  xss_match_set: xss_match_set option }[@@ocaml.doc
                                         "The response to a [CreateXssMatchSet] request.\n"]
type nonrec create_xss_match_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc "A request to create an [XssMatchSet].\n"]
type nonrec create_web_acl_response =
  {
  change_token: string option ;
  web_ac_l: web_ac_l option }[@@ocaml.doc ""]
type nonrec create_web_acl_request =
  {
  tags: tag list option ;
  change_token: string ;
  default_action: waf_action ;
  metric_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_web_acl_migration_stack_response =
  {
  s3_object_url: string }[@@ocaml.doc ""]
type nonrec create_web_acl_migration_stack_request =
  {
  ignore_unsupported_type: bool ;
  s3_bucket_name: string ;
  web_acl_id: string }[@@ocaml.doc ""]
type nonrec create_sql_injection_match_set_response =
  {
  change_token: string option ;
  sql_injection_match_set: sql_injection_match_set option }[@@ocaml.doc
                                                             "The response to a [CreateSqlInjectionMatchSet] request.\n"]
type nonrec create_sql_injection_match_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc
                  "A request to create a [SqlInjectionMatchSet].\n"]
type nonrec create_size_constraint_set_response =
  {
  change_token: string option ;
  size_constraint_set: size_constraint_set option }[@@ocaml.doc ""]
type nonrec create_size_constraint_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_rule_response =
  {
  change_token: string option ;
  rule: rule option }[@@ocaml.doc ""]
type nonrec create_rule_request =
  {
  tags: tag list option ;
  change_token: string ;
  metric_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_rule_group_response =
  {
  change_token: string option ;
  rule_group: rule_group option }[@@ocaml.doc ""]
type nonrec create_rule_group_request =
  {
  tags: tag list option ;
  change_token: string ;
  metric_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_response =
  {
  change_token: string option ;
  regex_pattern_set: regex_pattern_set option }[@@ocaml.doc ""]
type nonrec create_regex_pattern_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_regex_match_set_response =
  {
  change_token: string option ;
  regex_match_set: regex_match_set option }[@@ocaml.doc ""]
type nonrec create_regex_match_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_rate_based_rule_response =
  {
  change_token: string option ;
  rule: rate_based_rule option }[@@ocaml.doc ""]
type nonrec create_rate_based_rule_request =
  {
  tags: tag list option ;
  change_token: string ;
  rate_limit: int ;
  rate_key: rate_key ;
  metric_name: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_ip_set_response =
  {
  change_token: string option ;
  ip_set: ip_set option }[@@ocaml.doc ""]
type nonrec create_ip_set_request = {
  change_token: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_geo_match_set_response =
  {
  change_token: string option ;
  geo_match_set: geo_match_set option }[@@ocaml.doc ""]
type nonrec create_geo_match_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_byte_match_set_response =
  {
  change_token: string option ;
  byte_match_set: byte_match_set option }[@@ocaml.doc ""]
type nonrec create_byte_match_set_request =
  {
  change_token: string ;
  name: string }[@@ocaml.doc ""]